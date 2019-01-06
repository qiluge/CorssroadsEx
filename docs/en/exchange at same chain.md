# CrossroadsEx at Same Chain

English | [中文](../cn/同链资产交易.md)

At the road map, asset exchange at same chain is the first step of CrossroadsEx.

## CrossroadsEx Pattern

The real decentralized exchange should allow many peer to part in, and there are not centralized operator of exchange. However,
current decentralized exchange require users to open a website and load web content provided by specific operators in order to conduct transactions.
In this case, the transaction may be monitored by centralized operator. And while operators stop providing services,
the user interface that accesses the exchanges will disappear, which is obviously contrary to the idea of decentralized exchanges.

How to overcome this problem? A very simple way is to make the exchange's interface resources into a client form, so that
users can download to the local.This client does not interact with any centralized server, but directly with the public-link
node specified by the user. In such an environment, any buying and selling action will be invoked as a smart contract and sent
directly to the chain without any monitoring. This form only needs a common link node.When the node opens its own communication port
on the chain, the user can send the transaction to the chain. This kind of node is very convenient to establish and use.
Users can run a synchronization node by themselves or use existing synchronization node services, such as Infula on ethereum.

CrossroadsEX will operate in the above form. All interface resources and script files used by users are packaged into an executable file. 
After the user downloads them to his computer and opens them to run, the transaction can be carried out directly.

## CrossroadsEX Transaction Pairs

The current de-centralized exchanges, regardless of which public chain they are based on, require manual auditing of the new
transaction pair, which is controlled by the operator. When the project side wants to increase the circulation of tokens,
this kind of audit will inevitably bring troubles to the project side. Whether the length of audit time or the amount of
money cost, it is a big trouble for a start-up project side. On the other hand, this kind of audit also violates the concept
of decentralization. A genuine de-centralized exchange should not set thresholds and steps for the transaction of any token.
The increase and decrease of transaction pairs should be entirely determined by users. That's what CrossroadsEX does.

When the project side wants to add its own token transaction pair to CrossroadsEX, it only needs to call the smart contract of
CrossroadsEX. When a transaction pair is added to CrossroadsEX, all CrossroadsEX clients can see and trade the transaction pair.
This kind of high-degree-of-freedom transaction has no threshold and restriction on adding mode. Anyone can add transaction
pairs to CrossroadsEX by paying the fee of processing smart contract calls on the chain. This degree of freedom has not been
achieved in all exchanges, whether centralized or decentralized.

However, the use of this threshold-free mode of currency will inevitably lead to a flood of inferior tokens. A user who opens
CrossroadsEX's client may see dozens of new transactions added in just a few minutes, which will have a devastating impact
on the user's experience. At this time, CrossroadsEX client introduced a shielding function: when the new transaction pair
is broadcast to its client, users can choose to shield the new transaction pair, so that the new transaction pair will not
occupy any user interface. Even when the user runs the CrossroadsEX client, he can set up to operate only on existing transaction
pairs without accepting any new transaction pairs. Users can also search for pairs of transactions they are interested in
and add them to their list of transaction pairs. In this case, if a project party adds its own token transaction pair, it is more
likely that it is not accepted by most users. Only when the project party's popularity is improved, users will search for
the transaction pair and conduct transactions.

## CrossroadsEX Operating Mechanism and Economic Governance

CrossroadsEX will consist of three (or more) smart contracts: one for global control, called CrossroadsEX Manager, for example,
the addition and deletion of transaction pairs; one for the carrier of transaction pairs, called CrossroadsEXBook, which is created
when a transaction pair is added to represent the transaction pair; and one for controlling transaction fees, called CrossroadsEXFee.

When a transaction pair is created, CrossroadsEXManger will deploy a CrossroadsEXBook contract to manage the transaction pair.
This transaction pair has CrossroadsEXBook maintenance for all purchase and sale bills: when the user registers the bill, Book records the
price and quantity of the bill. When the user eats the bill, Book contract finds the corresponding order, completes the matching,
sends the transaction tokens to both sides of the transaction, and sends the handling fee to CrossroadsFeedsEX contract.

CrossroadsEXFee contract is used to manage the fee of CrossroadsEX. Its management mode is as follows: the beneficiary and its benefit
ratio are defined in the contract, and the beneficiary whose benefit ratio is greater than 0 can transfer the share which is not more
than his own benefit ratio to other people, who can be either existing beneficiary or new beneficiary; all the beneficiaries can not be
recovered after the transfer of the benefit ratio. Beneficiaries share the fees according to the current beneficiary proportion,
so beneficiaries should withdraw their existing fee income before transferring their own beneficiary proportion.

CrossroadsEXManager controls all CrossroadsEXBook contracts and CrossroadsEXFee contracts. Manger contracts can add new trading pairs,
but cannot delete any existing trading pairs.

### [CrossroadsCoin（CRC）](https://github.com/etherCrossroads/CrossroadsCoin) of CrossroadsEX

CRC will be the governing token of CrossroadsEX. It can exchange freely with the original token of the main chain and the price
increases with the circulation, which is in good agreement with the spirit of de-centralized exchange. Its governance functions in
CrossroadsEX include:

1. Adding new trading pairs: Before anyone adds trading pairs to CrossroadsEX, at least 10,000 (as community consensus changes)
CRCs must be pledged to the CrossroadsEX Manger contract; this part of the pledged CRC will be locked in for three months to
three years, and the lock-in time will decrease with the increase of the trading volume of the transaction;

2. Processing fees for transactions: Users must pledge CRC to CrossroadsEX Manager before making transactions, and this pledge
can be retrieved at any time; User's bill of lading does not need to pay any commission fee except on the chain of smart
contract invocation, and single user pays a fixed commission fee (as the community consensus changes), part of which pays to
registered bill users, and part of which pays CrossroadsEXFee contract, the fee paid to CrossroadsEXFee contract will be shared by
the beneficiaries of the contract;

3. Community governance: Since CRC can exchange freely with native token of the main chain and anyone can participate in the exchange,
the degree of freedom of community development is extremely high; at the same time, 50% of CrossroadsExFee will be allocated according
to the proportion of CRC holdings.

At present, CRC is only issued on ethereum, but this does not mean that CrossroadsEx is only traded on ethereum. At present,
the Ethereum community is the most mature public chain in the world. It is easier to develop a decentralized exchange on Ethereum
than other public chains. So CrossroadsEx chose Ethereum as its first version. In the near future, when the public chains such as NEO,
EOS, ONT and TRON are mature, CrossroadsEx will launch a de-centralized exchange on them and issue CRC. After the improvement
of cross-chain technology and de-centralized transaction consensus algorithm, CrossroadsEx will transform cross-chain transactions,
integrate the exchanges on major public chains and become a real de-centralized exchange.