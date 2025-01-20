@interface TVRCSiriRemote
- (CBCharacteristic)findMyCharacteristic;
- (CBPeripheral)peripheral;
- (void)setFindMyCharacteristic:(id)a3;
- (void)setPeripheral:(id)a3;
@end

@implementation TVRCSiriRemote

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (CBCharacteristic)findMyCharacteristic
{
  return self->_findMyCharacteristic;
}

- (void)setFindMyCharacteristic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyCharacteristic, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end