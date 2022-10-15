const hre = require("hardhat")


async function main(){
    const BuyMeCoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
    const buyMeACoffee = await BuyMeCoffee.deploy();
    await buyMeACoffee.deployed();
    console.log("buy me a coffee contract is deployed to ", buyMeACoffee.address)
}




// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  