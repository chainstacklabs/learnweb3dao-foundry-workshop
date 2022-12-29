// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import {MyToken} from "src/ERC20.sol";
contract ERC20Deploy is Script {
    function run() public {
        vm.startBroadcast();
        MyToken token = new MyToken();
        vm.stopBroadcast();
    }
}