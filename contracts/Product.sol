//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
// import "hardhat/console.sol";

contract Product {
    uint256 productCount;
    event add (address seller_address, string product_code, string product_name, uint amount, string product_description, uint256 timestamp, string keyword);

    event getProductBySeller (address indexed seller_address, string product_code, uint amount, string product_name);

    struct productStruct {
        address seller_address;
        string product_code;
        string product_name;
        uint amount;
        string product_description;
        uint256 timestamp;
        string keyword;
    }

    productStruct[] products;

    function addToBlockchain (string memory product_code, string memory product_name, uint amount, string memory product_description, string memory keyword) public {
        productCount += 1;
        products.push(productStruct(msg.sender, product_code, product_name, amount, product_description, block.timestamp, keyword));
        emit add(msg.sender, product_code, product_name, amount, product_description, block.timestamp, keyword);
    }

    function getProducts(string memory seller_address, string memory product_code, uint amount, string memory product_name) public {
        emit getProductBySeller(msg.sender, product_code, amount, product_name);
    }

    function getAllProducts() view public returns (productStruct[] memory) {
        return products;
    }

    function getProductCount() view public returns (uint256) {
        // console.log("Product count", productCount);
        return productCount;
    }
}