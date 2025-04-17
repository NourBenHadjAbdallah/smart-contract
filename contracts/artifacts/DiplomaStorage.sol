// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract DiplomaStorage {
    mapping(string => uint256) public students_indexes;
    struct Student {
        string fullName;
        string studentId;
        string birthday;
        string birthplace;
    }
        struct Diploma {
        Student student;
        string universityName;
        string directorName;
        string creationDate;
        string fieldOfDiploma;
        string diplomaHash; // Off-chain diploma hash
    }
        // Mapping to store diplomas by diploma ID
    mapping(uint256 => Diploma) public diplomas;
    uint256 public diplomaCount;
    
    // Get student details by ID
    function getStudent(string memory _studentId) public view returns (
        string memory fullName,
        string memory birthday,
        string memory birthplace
    ) {
        Diploma memory diploma = diplomas[
            students_indexes[_studentId]
        ];
        return (_studentId, diploma.student.birthday, diploma.student.birthplace);
    }
    // Get diploma details
    function getDiploma(uint256 _diplomaId) public view returns (
        string memory studentFullName,
        string memory studentId,
        string memory birthday,
        string memory birthplace,
        string memory universityName,
        string memory directorName,
        string memory creationDate,
        string memory fieldOfDiploma,
        string memory diplomaHash
    ) {
        Diploma memory diploma = diplomas[_diplomaId];
        return (
            diploma.student.fullName,
            diploma.student.studentId,
            diploma.student.birthday,
            diploma.student.birthplace,
            diploma.universityName,
            diploma.directorName,
            diploma.creationDate,
            diploma.fieldOfDiploma,
            diploma.diplomaHash
        );
    }
}