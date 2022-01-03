pragma solidity ^0.8.10;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol'; 

 contract PaymentProcessor {
     address public admin; 
     IERC20 public dai;

     event PaymentDone(
         address payer,
         uint amount,
         uint paymentId,
         uint date  
     );

     constructor(address adminAddress, address daiAddress) public {
         admin = adminAddress;
         dai = IERC20(daiAddress);

     }  

     //Pay function here
     //we make it external so we can call it from outside the smart contracts.
     function pay(uint amount, uint paymentId) external {
         dai.transferFrom(msg.sender, admin, amount);  
         emit PaymentDone(msg.sender, amount, paymentId, block.timestamp);      
    
        }
    }