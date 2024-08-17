# SimpleCounter Smart Contract

This project implements a basic Solidity smart contract called `SimpleCounter`. The contract manages a simple integer counter that can be incremented, decremented, and reset. The contract demonstrates the use of Solidity's error handling mechanisms, including `require()`, `assert()`, and `revert()`.

## Features

- **Increment Counter:** Increases the counter by 1.
- **Decrement Counter:** Decreases the counter by 1, but only if the counter is greater than zero.
- **Reset Counter:** Resets the counter to zero.

## Error Handling

This contract uses the following error handling mechanisms:

- **`require()`**: Used in the `decrement()` function to ensure the counter is greater than zero before decrementing. If this condition is not met, the transaction is reverted with an appropriate error message.

- **`assert()`**: Used in the `increment()` function to ensure that the counter has been incremented correctly. If the assertion fails, it indicates an internal error, and the transaction is reverted.

- **`revert()`**: Explicitly used in the `reset()` function to revert the transaction if the counter does not reset to zero for any reason.

## Usage

### Increment the Counter

```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleCounter {
    int public counter;

    function increment() public {
        counter++;
        assert(counter > 0);
    }

    function decrement() public {
        require(counter > 0, "Counter is already zero or negative");
        counter--;
    }

    function reset() public {
        counter = 0;
        if (counter != 0) {
            revert("Counter reset failed");
        }
    }
}
,,,