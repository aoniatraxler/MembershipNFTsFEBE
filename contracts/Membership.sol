//SPDX-License-Identifier: Unlicense
pragma sol
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";//more gas efficient
import "@openzeppelin/contracts/access/Ownable.sol";

contract Membership {
    address owner;
    string nftName;
    string creatorName;
    string info;
    uint256 maxQuantity;
    string url;
    uint256 alreadyMinted;
    uint256 cost;

    //weblink thaht links to ipfs metadata
    string ipfsMetadata;


    constructor(string memory _nftName, string memory _creatorName,string memory _info,uint256 _maxQuantity, string memory _url,uint256 _cost, string memory _nftSymbol ) ERC721(_nftName, _nftSymbol){ //invoke ERC721 --> need to pass data can do tthrough variable?
        owner = msg.sender;
        nftName= _nftName;
        creatorName = _creatorName;
        info= _info;
        maxQuantity= _maxQuantity;
        url= _url;
        cost= _cost;
        //what are the pro cons of setting all info in constructor already?
        //vs have set via function
    }

   //functions
   //makeNFT function --> uploading is on front end 


   //check if still can be minted(vs sold out)
   modifier checkAvailability(){
       require(maxQuantity<= alreadyMinted +1);
   }

   //mint
   function mintNFT() public payable  checkAvailability returns(bool) {
       require(checkAvailability(), "no more available");
       require(msg.sender.balance>= cost, "not enough eth");
       alreadyMinted++;
       _safeMint(msg.sender,alreadyMinted);
       _setTokenURI(alreadyMinted, url); //url ehre is token URI
   }


   //view number alreaady mintedd
   function viewAmountMinted() public returns(uint256){
       return alreadyMinted;
   }


   //withdraw onlyOwner(){}
   function withdraw() external onlyOwner{
       (bool success, )= payable(owner).call{value: address(this).balance}("");
       require(success, "not succesfull");
   }
   
   
    //one to 



}
