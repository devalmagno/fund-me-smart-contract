// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        address ethUsdPriceFeed = getEthUsdPriceFeed();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }

    function getEthUsdPriceFeed() private returns (address) {
        HelperConfig helperConfig = new HelperConfig();
        return helperConfig.activeNetworkConfig();
    }
}
