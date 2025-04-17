// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;

import "./SimpleStorage.sol";

contract storageFactory{
    SimpleStorage[] public simpleStorageArrya;
    function createSimpleStorageContract() public {
          SimpleStorage simpleStorage = new SimpleStorage();
          simpleStorageArrya.push(simpleStorage);
        }

    function sfstore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage simpleStorage = simpleStorageArrya[_simpleStorageIndex]; 
        simpleStorage.store(_simpleStorageNumber);
    }
    function sfGet(uint256 _simplesStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArrya[_simplesStorageIndex];
        return simpleStorage.retrieve();
    }
    
}