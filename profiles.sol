pragma solidity ^0.4.23;

import "./Migrations.sol";

// Un contrato con perfiles que pueden ser updateados
contract EtherProfile {
    address owner;

    struct Profile {
        string name;
        string imgurl;
        string email;
        string aboutMe;
    }

    mapping(address => Profile) addressToProfile;

    constructor() public {
        owner = msg.sender;
    }

    function getProfile(address _address) public view returns(
        string,
        string,
        string,
        string
    ) {
        return (
            addressToProfile[_address].name,
            addressToProfile[_address].imgurl,
            addressToProfile[_address].email,
            addressToProfile[_address].aboutMe
        );
    }

    // Simple for now because params are not optional
    function updateProfile(
        string name,
        string imgurl,
        string email,
        string aboutMe
    ) public
    {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.name = name;
        p.imgurl = imgurl;
        p.email = email;
        p.aboutMe = aboutMe;
    }

    function updateProfileName(string name) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.name = name;
    }

    function updateProfileImgurl(string imgurl) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.imgurl = imgurl;
    }

    function updateProfileEmail(string email) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.email = email;
    }

    function updateProfileAboutMe(string aboutMe) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.aboutMe = aboutMe;
    }
}
