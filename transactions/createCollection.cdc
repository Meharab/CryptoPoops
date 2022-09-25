import CryptoPoops from "../contracts/CryptoPoops.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
transaction {
  prepare(signer: AuthAccount) {
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/Collection)
    signer.link<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic, NonFungibleToken.CollectionPublic}>(/public/Collection, target: /storage/Collection)
  }

}