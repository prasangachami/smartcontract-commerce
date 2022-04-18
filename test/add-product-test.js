const { expect } = require('chai');
const { ethers } = require('hardhat');


describe('Products', function (){
    it("Return new product after save it.", async function (){
        const Product = await ethers.getContractFactory("Product");
        const product = await Product.deploy();
        await product.deployed();

        expect( await product.getProductCount());

        const addProduct = await product.addToBlockchain();
        await addProduct.wait();

        expect( await product.getProductCount());
    })
});