// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "../src/ERC20.sol";

contract ERC20Test is Test {
    
    MyToken erc20;

    address owner = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;
    address alpha = address(0x1);
    address beta = address(0x2);

    function setUp() public {
        erc20 = new MyToken();
    }

    function testName() public {
    string memory name = erc20.name();
    assertEq(name, "LWB3_Starter");
    }

    function testDecimals() public {
    uint8 decimals = erc20.decimals();
    assertEq(decimals, 18);
    }

    function testSymbol() public {
    string memory symbol = erc20.symbol();
    assertEq(symbol, "LWB3");
    }

    function testBalance() public {
    uint256 balance = erc20.balanceOf(owner);
    address contractOwner = erc20.owner();

    console2.log(balance/(10**18));
    console2.log(contractOwner);

    }


    function testMinting1() public {
    vm.startPrank(alpha);
    vm.expectRevert("Ownable: caller is not the owner");
    erc20.mint(beta, 10*(10**18));
    vm.stopPrank();
    console2.log(erc20.balanceOf(beta));
    }

    function testMinting2() public {

    vm.startPrank(owner);
    erc20.mint(beta, 10*(10**18));
    console2.log(erc20.balanceOf(beta));
    vm.stopPrank();
    }

}