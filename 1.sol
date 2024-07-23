contract C {
    bool private isInit=false;
 string private hello;
 
 function init(string memory _hello) external {
   hello = _hello;
   isInit = true;
 } 

}
