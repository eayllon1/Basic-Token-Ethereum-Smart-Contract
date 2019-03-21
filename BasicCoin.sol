pragma solidity >=0.5.0 <0.6.0;

contract CoinDemo {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint (address reciever, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e59);

        balances[reciever] += amount;
    }

    function issue (address reciever, uint amount) public {
        require(amount <= balances[msg.sender], "insufficient balance");
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
    }
}
