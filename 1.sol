
contract C {
    uint[] amounts;
    address payable[] addresses;

    function collect(address payable to) external payable {
        amounts.push(msg.value);
        addresses.push(to);
    }

    function pay() external {
        uint length = amounts.length;

        for (uint i = 0; i < length; i++) {
            addresses[i].transfer(amounts[i]);
        }

        delete amounts;
        delete addresses;
    }
}
