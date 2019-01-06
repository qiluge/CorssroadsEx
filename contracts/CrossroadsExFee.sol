pragma solidity ^0.4.15;

contract CRC {
    uint256 public totalSupply;

    function balanceOf(address _owner) public constant returns (uint balance);

    function transfer(address _to, uint256 _value) public;

    function transferFrom(address _from, address _to, uint256 _value) public;

    function approve(address _spender, uint256 _value) public;

    function allowance(address _owner, address _spender) public constant returns (uint remaining);
}

contract CrossroadsExFee {

    uint public constant wholeShare = 1000000; // whole portion

    uint public constant coreDeveloperShare = 200000; // core and initial developer portion

    uint public constant communityShare = 300000; // community developer and encourage portion

    uint public constant crcLockShare = 500000; // CRC holders' portion

    address public crossroadsExManager;

    CRC public crc; // crc token
    mapping(address => uint) public shareTable; // share table
    uint public currentRoundIndex; // current divided rounds index
    mapping(address => uint) public accountSharedIndex; // account has already withdrawn round
    uint public constant dividendInterval = 10; // one round per one day
    uint public currentRoundStartTime;
    mapping(uint => uint) public roundShareCrcNum; // share crc num of each round
    mapping(uint => uint) public roundLockCrcNum; // locked crc num in each round
    mapping(uint => mapping(address => uint)) public accountRoundLockCrcNum; // account lock crc num each round
    mapping(address => uint) public accountUnlockRound; // account unlock at this round, should be initialized as max uint

    modifier onlyManager(){
        require(msg.sender == crossroadsExManager);
        _;
    }

    constructor(address _core, address _community, address _exManager, address _crc) public{
        require(_core != 0);
        shareTable[_core] += coreDeveloperShare;
        shareTable[_community] += communityShare;
        crossroadsExManager = _exManager;
        currentRoundStartTime = block.timestamp;

        crc = CRC(_crc);
    }

    // update current round start time, current round index and current round fee income
    function updateRound(uint crcNum) onlyManager
    public {
        uint currentTime = block.timestamp;
        if (currentTime - currentRoundStartTime >= dividendInterval) {
            currentRoundIndex++;
            currentRoundStartTime = currentTime;
        }
        roundShareCrcNum[currentRoundIndex] += crcNum;
    }

    function transferShare(address _new, uint _share) public {
        require(shareTable[msg.sender] >= _share);
        require(_share > 0);
        require(_new != 0);
        shareTable[msg.sender] -= _share;
        shareTable[_new] += _share;
    }

    function lockCrc(uint value) public {
        crc.transferFrom(msg.sender, this, value);
        accountRoundLockCrcNum[currentRoundIndex][msg.sender] += value;
        accountUnlockRound[msg.sender] = 2 ** 255 - 1;
    }

    function unLockCrc() public {
        uint lockNum = getCurrentLockCrcNum();
        crc.transfer(msg.sender, lockNum);
        accountUnlockRound[msg.sender] = currentRoundIndex;
        accountRoundLockCrcNum[currentRoundIndex][msg.sender] = 0;
    }

    function withdraw() public {
        uint allIncome = calWithdrawNum();
        require(crc.balanceOf(this) >= allIncome);
        crc.transfer(msg.sender, allIncome);
    }

    function calWithdrawNum() public constant returns (uint num){
        uint settingShare = shareTable[msg.sender];
        uint allIncome = 0;
        uint roundLockNum = 0;
        uint latestLockNum = 0;
        // one account withdraw fee income no more than 100 round
        for (uint i = accountSharedIndex[msg.sender]; i < currentRoundIndex && i < accountSharedIndex[msg.sender] + 100; i++) {
            if (accountRoundLockCrcNum[i][msg.sender] != 0) {
                latestLockNum = accountRoundLockCrcNum[i][msg.sender];
                roundLockNum = latestLockNum;
            } else if (i < accountUnlockRound[msg.sender]) {
                roundLockNum = latestLockNum;
            } else {
                roundLockNum = 0;
            }
            uint crcLockRoundShareRate = crcLockShare * roundLockNum / roundLockCrcNum[i];
            uint roundShareRate = settingShare + crcLockRoundShareRate;
            require(roundShareRate < wholeShare);
            uint roundIncome = roundShareRate * roundShareCrcNum[i] / wholeShare;
            allIncome += roundIncome;
        }
        return allIncome;
    }

    function getCurrentLockCrcNum() public constant returns (uint num){
        uint roundLockNum = 0;
        for (uint i = currentRoundIndex; i >= 0; i--) {
            if (accountRoundLockCrcNum[i][msg.sender] > 0) {
                roundLockNum = accountRoundLockCrcNum[i][msg.sender];
                break;
            } else if (i < accountUnlockRound[msg.sender]) {// round has not unlock
                continue;
            } else {// already unlock
                return 0;
            }
        }
        return roundLockNum;
    }
}
