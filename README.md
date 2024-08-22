# ConditionChecks Smart Contract

## Overview

The `ConditionChecks` smart contract demonstrates the use of Solidity's `require()`, `assert()`, and `revert()` statements. These statements are essential for controlling the flow of the contract, ensuring that certain conditions are met, and handling errors in a robust manner.

## Features

- **Set Value**: Users can set a value that must be greater than zero.
- **Double Value**: The value can be doubled, with an internal check to prevent overflow.
- **Reset Value**: The owner of the contract can reset the value to zero.

## Functions

### 1. `setValue(uint256 _value)`

Sets the `value` variable to the input `_value`.

- **Parameters**: 
  - `_value`: A `uint256` number that must be greater than zero.

- **Require Condition**:
  - The function uses `require()` to ensure `_value` is greater than zero.
  - If the condition is not met, the transaction is reverted with the error message "Value must be greater than zero".

### 2. `doubleValue()`

Doubles the current `value` stored in the contract.

- **Assert Condition**:
  - The function uses `assert()` to check that doubling the value does not cause an overflow.
  - If the assertion fails, the transaction is reverted.

### 3. `resetValue()`

Resets the `value` variable to zero. Only the owner of the contract can perform this action.

- **Revert Condition**:
  - The function uses `revert()` to stop the execution and revert the transaction if the caller is not the contract owner.
  - The error message returned is "Only the owner can reset the value".

## Deployment

To deploy the `ConditionChecks` contract:

1. Install a development environment like [Remix](https://remix.ethereum.org/) or use tools like Truffle or Hardhat.
2. Compile the contract with a Solidity compiler version `^0.8.0`.
3. Deploy the contract to your preferred Ethereum network.

## Usage

### Set a Value

contractInstance.setValue(10);

```js
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
