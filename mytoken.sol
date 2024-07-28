import "./IERC20.sol";

contract MyToken is IERC20{

    address private owner;


    string public constant name = "MyToken";
    string public constant symbol = "MT";

    uint256 public constant decimals = 18; 

    uint256 public totalSupply = 1000;

    mapping(address=>uint256) balances;
    mapping (address=>mapping(address=>uint256)) allowances;

    constructor(){
        owner = msg.sender;
    }

    function balanceOf(address addr) external view returns(uint256){
        return balances[addr];
    }

    function transfer(address to, uint256 amount) external returns(bool){
        require(balances[msg.sender] >= amount, "No enough balance!");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns(bool){
        require(spender != address(0), "spender can not be 0!");
        allowances[msg.sender][spender] = amount;
        emit Approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address spender, uint256 amount) external returns(bool){
        require(from != address(0), "owner can not be 0");
        require(spender != address(0), "spender can not be 0");
        require(allowances[from][spender] >= amount, "No enough allowance!");
        require(balances[from] >= amount, "No enough balance!");
        allowances[from][spender] -= amount;
        balances[from] -= amount;
        balances[spender] += amount;
        emit Transfer(from, spender, amount);
        return true;
    }

    function allowance(address from, address spender) external view returns (uint256){
        return allowances[from][spender];
    }

    function mint(uint amount) external{
        require(msg.sender == owner, "Not owner!");
        balances[msg.sender] = amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external{
        require(msg.sender == owner, "Not owner");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}