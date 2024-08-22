// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionChecks {
    uint256 public value;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    function doubleValue() public {
        uint256 doubledValue = value * 2;
        assert(doubledValue / 2 == value);

        value = doubledValue;
    }

    function resetValue() public {
        if (msg.sender != owner) {
            revert("Only the owner can reset the value");
        }

        value = 0;
    }
}
