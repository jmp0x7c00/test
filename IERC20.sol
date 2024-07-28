interface IERC20{
    event Transfer(address indexed from, address indexed to, uint256  amount);
    event Approve(address indexed owner, address indexed spender, uint256 allowance);


    function totalSupply() external view returns(uint256);
    function balanceOf(address addr) external view returns(uint256) ;
    function transfer(address to, uint256 amount) external returns(bool);
    function approve(address spender, uint256 allowance) external returns(bool);
    function transferFrom(address sender, address spender, uint256 amount) external returns(bool);
    function allowance(address owner, address spender) external view returns(uint256);
}