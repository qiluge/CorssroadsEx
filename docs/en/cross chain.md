# CrossroadsChain

English | [中文](../cn/跨链.md)

According to the plan, cross-chain asset transactions and cross-chain asset transfer are the main tasks to be done in the
later stage of CrossroadsEx. The process of asset cross-chain universality is that 100 tokens a are destroyed on chain A and
100 tokens B are issued on chain B. To achieve this process, we must have trusted middleware to ensure that it is destroyed
on A, and then issued on B. At the same time, if the issuance on B fails, the coins destroyed by A need to be recasted.
The principle of cross-chain asset trading is similar, but it is not detailed here. This paper focuses on the construction
of trusted Middleware in cross-chain process.

CrossroadsChain is a public chain that deals exclusively with token transactions. It is specially designed for cross-chain transactions.

## Transactions

There will be only one transaction type in CrossroadsChain - cross-chain asset transaction, which is a user-initiated cross-chain
asset transaction request, and only exists as a transaction prototype on CrossroadsChain. Once a transaction is confirmed on
crossroadsChain, the corresponding cross-chain asset transaction is confirmed. The user who initiated the transaction successfully
converted one of the tokens on Chain A to another on Chain B that he wanted to convert.

## Consensus Algorithm

Most of the existing consensus algorithms for public chains are competitive. All nodes compete for right to produce blocks. There are also
some non-competitive consensus algorithms such as DPOS and BFT consensus. These consensus algorithms have obvious performance advantages
over competitive algorithms, at least at this stage.

So is there a thorough consensus that allows the nodes involved in the consensus to come together? The larger the size of
the whole network and the more nodes involved, the faster the block produced speed and the higher the TPS? CrossroadsChain will explore
this aspect. If this consensus algorithm does exist, CrossroadsChain will be a pioneer in achieving it.

When CrossroadsChain fails to use collaborative consensus, a competitive consensus algorithm will be used. Such competition
should not lead to waste of energy, nor should it reduce the efficiency of the block. CrossroadsChain will use a new workload proof
mechanism: instead of using the value of difficulty as workload proof, it will use the number of transactions packaged in each block as proof.

If a node receives many blocks at the same height, only the block with the most packaged transactions will be accepted. Consensus nodes
will use energy to package transactions as much as possible. If a node wants to produce block, it must improve its transaction processing
capacity as much as possible, not its calculation power. In this design, the node has two out-of-block strategies: out-of-block as
fast as possible and packaged transactions as much as possible. Blocking as fast as possible is to make the chain longer.
Because of POW consensus, nodes will choose to work on the longest chain. This way of blocking will improve the stability of the chain
and reduce the confirmation time of transactions. Packing as many transactions as possible is a traditional block strategy, because
the number of packaged transactions will prove the workload. Both strategies aim at improving TPS. Under this workload proof mechanism,
the faster the package transaction, the more nodes will get more rewards.

## Governance Model

CrossroadsCoin will serve as the governance token on CrossroadsChain, with a maximum issuance of 12 billion and initial issuance of CRC
circulation at the time of the creation of CrossroadsChain.

1. Handling fees: Each transaction on CrossroadsChain requires a certain amount of CRC as handling fees, which are rewarded to miners,
who prefer to pack transactions with high handling fees. When the initial circulation of CRC is less than 12 billion, the remaining CRC
will be paid to the block producers as a block incentive. In this case, a fixed number of CRC incentives will be awarded for each package
transaction in the block. The extra incentives for this part of the block will expire when the CRC is released to a maximum of 12 billion yuan.

2. Pledge model: CRC will act as a pledge token for the transfer of cross-chain tokens.

3. CrossroadsEx's fee is divided into three parts: 20% for core developers, 30% for community developers and 50% for all CRC holders.