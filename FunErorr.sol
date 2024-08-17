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