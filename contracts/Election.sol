pragma solidity >= 0.5.0 < 0.9.0;

contract Election {
	
	// Model a Candidate
	struct Candidate {
        uint candidateId;
        string candidateName;
        uint voteCount;
    }
	
	// Store accounts that have voted
    mapping(address => bool) public voters;
	
	// Read/write Candidates
    mapping(uint => Candidate) public candidates;
	
	// Store Candidates Count
    uint public candidateCount;

    // Constructor
    constructor() public {
        addCandidate("First Candidate");
        addCandidate("Second Candidate");
    }
	
	function addCandidate (string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
	
	function vote (uint _candidateId) public {
        // check to maken sure haven't voted before
        require(!voters[msg.sender]);

        // checck for valid candidate
        require(_candidateId > 0 && _candidateId <= candidateCount);

        // record voter that voted 
        voters[msg.sender] = true;

        // keep candidate vote count up to date
        candidates[_candidateId].voteCount++;
    }
	
}