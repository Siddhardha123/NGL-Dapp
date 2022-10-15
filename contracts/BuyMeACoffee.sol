// SPDX-License-Identifier: none
pragma solidity >=0.4.16 <0.9.0;
// 0x925950E4dAbC9C2D82ce27608B0fAc7A54E9977D
contract BuyMeACoffee {
    //emit when memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // memo structure
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    // list of all memos
    Memo[] memos;

   //address of the contract 
    address payable owner;
  
  constructor(){
    owner = payable(msg.sender);
  }

  // buy a coffe contract
  function buyCoffee(string memory _name,string memory _message)public payable {
        
      require(msg.value > 0, "cant buy a coffee with 0 eth");
      memos.push(Memo(
        msg.sender,
        block.timestamp,
        _name,
        _message
      ));

    emit NewMemo(msg.sender,
        block.timestamp,
        _name,
        _message
    );


  }

  function withdrawTips() public {

       require(owner.send(address(this).balance));
  }
  function getMemos() public view returns(Memo[] memory){
       return memos;
  }


    
}