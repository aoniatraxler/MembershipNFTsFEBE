const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Membership = await ethers.getContractFactory("Membership");
    const membership = await Membership.deploy("Hello, world!");
    await membership.deployed();

    //insert tests here
  });
});
