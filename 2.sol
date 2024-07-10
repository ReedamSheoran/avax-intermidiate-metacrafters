// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    uint public count;
    address public owner;

    constructor() {
        owner = msg.sender;
        count = 0;
    }

    function increment() public {
        require(msg.sender == owner, "Only the owner can increment the count");
        count += 1;
    }
    
    function reset() public {
        count = 0;
    }

    function decrement() public {
        require(msg.sender == owner, "Only the owner can decrement the count");
        count -= 1;
    }

    function getCount() public view returns (uint) {
        return count;
    }
}
