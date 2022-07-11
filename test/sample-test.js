const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Membership = await ethers.getContractFactory("Membership");
    const membership = await Membership.deploy("nName", "cName", "info", 5, "url.com", "ABC");
    await membership.deployed();

    expect(await membership.owner()).to.equal(msg.sender);
    expect(await membership.maxQuantity()).to.equal(5);
    expect(await membership.alreadyMinted()).to.equal(0);
    expect(await membership.cost()).to.equal(5);



    await membership.mintNFT();
    expect(membership.alreadyMinted()).to.equal(1);

    // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
