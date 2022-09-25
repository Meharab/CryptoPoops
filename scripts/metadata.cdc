import CryptoPoops from "../contracts/CryptoPoops.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
pub fun main(address: Address, id: UInt64) {
  let publicCollection = getAccount(address).getCapability(/public/Collection)
              .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
              ?? panic("The address does not have a Collection.")
  
  let nftRef: &CryptoPoops.NFT = publicCollection.borrowAuthNFT(id: id)
  log(nftRef.name)
  log(nftRef.favouriteFood)
  log(nftRef.luckyNumber)
}