@interface NRDaemonDevice
- (CBPeer)bluetoothPeer;
- (CBPeripheral)companionPairingPeripheral;
- (void)setBluetoothPeer:(id)a3;
- (void)setCompanionPairingPeripheral:(id)a3;
@end

@implementation NRDaemonDevice

- (CBPeripheral)companionPairingPeripheral
{
  return self->_companionPairingPeripheral;
}

- (void)setCompanionPairingPeripheral:(id)a3
{
}

- (CBPeer)bluetoothPeer
{
  return self->_bluetoothPeer;
}

- (void)setBluetoothPeer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothPeer, 0);

  objc_storeStrong((id *)&self->_companionPairingPeripheral, 0);
}

@end