pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./Drizzle.sol";

interface Hevm {
    function warp(uint256) external;
}

contract DrizzleTest is DSTest {

    //Mainnet
    address constant public ILK_REGISTRY = 0xbE4F921cdFEf2cF5080F9Cf00CC2c14F1F96Bd07;
    address constant public JUG = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;
    address constant public POT = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;

    Drizzle drizzle;
    Hevm hevm;
    // CHEAT_CODE = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D
    bytes20 constant CHEAT_CODE =
        bytes20(uint160(uint256(keccak256('hevm cheat code'))));

    function setUp() public {
        hevm = Hevm(address(CHEAT_CODE));
        drizzle = new Drizzle(ILK_REGISTRY, POT, JUG);
    }

    function testDrizzleDoesNotRevert() public {
        drizzle.drizzle();
        assertEq(uint(1),uint(1));
    }
}