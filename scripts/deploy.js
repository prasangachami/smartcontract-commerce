
const main = async () => {
    // const HelloWorld = await hre.ethers.getContractFactory("HelloWorld");
    const Product = await hre.ethers.getContractFactory("Product");
    const Transactions = await hre.ethers.getContractFactory("Transactions");

    // const helloWorld = await HelloWorld.deploy("Hello World");
    const product = await Product.deploy();
    const transactions = await Transactions.deploy();

    // await helloWorld.deployed();
    await product.deployed();
    await transactions.deployed();
}

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

runMain();