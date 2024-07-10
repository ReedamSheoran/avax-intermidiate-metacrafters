// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract RequireAssertRevert {
    address private owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    function deposit(uint amount) public {
        require(msg.sender == owner, "Only the owner can deposit funds");
        require(amount > 0, "Deposit amount must be greater than 0");
        balance += amount;
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    
function transfer(address recipient, uint amount) public {
    require(recipient != address(0));
    require(msg.sender == owner, "Only the owner can transfer funds");
    require(amount <= balance, "Insufficient balance");
    
    // Use safeTransfer function from OpenZeppelin Contracts or similar library to handle this
    (bool success, ) = recipient.call{value: amount}(""); 
    require(success, 'Transfer failed.');
    balance -= amount;
}

    function emergencyWithdraw() public {
        if (msg.sender != owner) {
            revert("Only the owner can perform an emergency withdraw");
        }
        balance = 0;
    }
}
