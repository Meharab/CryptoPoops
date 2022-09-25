import CryptoPoops from "../contracts/CryptoPoops.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
transaction(recipient: Address, name: String, favouriteFood: String, luckyNumber: Int) {
  prepare(signer: AuthAccount) {
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
                    ?? panic("This signer is not the one who deployed the contract.")
    let publicsCollection = getAccount(recipient).getCapability(/public/Collection)
                                  .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
                                  ?? panic("The recipient does not have a Collection.")
    publicsCollection.deposit(token: <- minter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber))
  }

}