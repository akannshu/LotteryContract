pragma solidity ^0.5.0;


contract Lottery{
    address public manager;
    address[] public players;
 
    constructor() public{
        manager = msg.sender;
    }
    
    function enter() public payable{
        require(msg.value > .01 ether);
        
        players.push(msg.sender);
    }
    
    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty , now, players)));
    }
    
    function pickWinner() public {
        uint index = random() % players.length;
    }
}
