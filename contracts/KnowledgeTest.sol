//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() external {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address _to) external {
        require(msg.sender == owner, "transferAll(): ONLY_OWNER");
        // (bool success, ) = _to.call{ value: address(this).balance }("");
        (bool success, ) = _to.call{ value: getBalance() }("");
        require(success, "TX_FAILED");
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata a, string calldata b) external pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}
