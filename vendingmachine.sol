// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract VendingMachine {

    // Properties
    address public owner;
    mapping (address => uint) public GamaToBalances;
    mapping (address => uint) private EthToBalances;
    uint256 weiEther = 1000000000000000000;
    uint256 gamaBuyValue;
    uint256 gamaSellValue;

    // Modifers
    modifier isOwner(){
        require(msg.sender == owner, "Only the onwer can make this");
        _;
    }

    constructor() payable {
        owner = msg.sender;
        GamaToBalances[address(this)] = 100;
        EthToBalances[address(this)] = 100;
        //payable(msg.sender).transfer(100);
        gamaSellValue = 1;
        gamaBuyValue = 1;
    }

    // Public Function
    function purchaseGama(uint256 amount) public payable {
        require(msg.value >= amount * 1 ether, "You must buy at least 1 ether per Gama.");
        require(GamaToBalances[address(this)] >= amount, "Not enough Gamas in stock to fulfill purchase request.");
        GamaToBalances[address(this)] -= amount;
        GamaToBalances[msg.sender] += amount;
        EthToBalances[address(this)] += amount;
    }

    function sellingGama(uint256 amount) public payable {
        //require(GamaToBalances[msg.sender] >= amount * 1 ether, "You must Sell at least 1 ether in Gama.");
        require(GamaToBalances[msg.sender] >= amount, "Not enough Gamas to trade for ether.");
        GamaToBalances[msg.sender] -= amount;
        EthToBalances[address(this)] -= amount;
        payable(msg.sender).transfer(amount*(gamaSellValue*weiEther));
    }

    function getVendingMachineBalanceGama() public view returns(uint256 GamaToken){
        return GamaToBalances[address(this)];
    }

    function getVendingMachingBalanceEth() public view returns(uint256 EthToken){
        return EthToBalances[address(this)];
    }

    function restockGama(uint256 amountGama) public isOwner{
        GamaToBalances[address(this)] += amountGama;
    }

    function restockEth(uint256 amountEth) public isOwner{
        EthToBalances[address(this)] += amountEth;
    }

    function toWithdraw(uint256 amountWithdraw) public payable isOwner{
        require(amountWithdraw <= EthToBalances[address(this)], "Not enough eth to withdraw.");
        EthToBalances[address(this)] -= amountWithdraw;
        payable(msg.sender).transfer(amountWithdraw);
    }

    // Private Functions
    

    
}