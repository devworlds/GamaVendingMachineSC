// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IERC20 {

    //Implementado (mais ou menos)
    function totalSupply() external view returns(uint256);
    function balaceOF(address account) external view returns(uint256);
    function transfer(address recipient, uint256 amount) external returns(bool);

    //Não implementados (ainda)
    function Allowence(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns(bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);


    //Implementado
    event Transfer(address from, address to, uint256 value);

    //Não está implementado (ainda)
    event Approval(address owner, address spender, uint256);
}

contract CryptoToken {

    string public constant name = "CryptoToken";
    string public constant symbol = "CRY";
    uint public constant decimals = 3; //Default dos exemplos é sempre 18
    uint256 private totalSupply;

    mapping(address => uint256) public addressToBalance;

    //Constructor
    constructor(uint256 total) {
        totalSupply = total;
        addressToBalance[msg.sender] = totalSupply;
    }

    //Events
    event Transfer(address sender, address receiver, uint amount);

    //Public Functions
    function getTotalSupply() public view returns(uint256){
        return totalSupply;
    }


    function balanceOf(address tokenOwner) public view returns(uint256){
        return addressToBalance[tokenOwner];
    }

    function transfer(address receiver, uint256 quantity)public returns(bool){
        require(quantity <= addressToBalance[msg.sender], "insufficient Balance");
        addressToBalance[msg.sender] = addressToBalance[msg.sender] - quantity;
        addressToBalance[receiver] = addressToBalance[receiver] + quantity;

        emit Transfer(msg.sender, receiver, quantity);
        return true;
    }

}