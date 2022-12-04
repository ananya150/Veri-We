//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import './Main.sol';

contract ReviewSys is Contract{

    event ReviewAdded(address indexed _user , string _review , uint256 indexed _rating);
    mapping (address => bool)  public isReviewGiven;

    mapping (address => string) public reviews;
    mapping (address => uint256) public ratings;

    constructor(IWorldID _worldId, address payable _tellorAddress) Contract(_worldId , _tellorAddress){} 

    function giveReview(string memory _review , uint256 _rating) public returns(bool){

        require(isUserVerified[msg.sender] == true , "first verify your world id with your ens");
        require(_rating <= 5);
        isReviewGiven[msg.sender] = true;

        reviews[msg.sender] = _review;
        ratings[msg.sender] = _rating;
        emit ReviewAdded(msg.sender, _review, _rating);
        return true;
    } 

}