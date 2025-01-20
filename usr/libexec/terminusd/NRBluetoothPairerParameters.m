@interface NRBluetoothPairerParameters
- (NSUUID)bluetoothUUID;
- (int64_t)pairingType;
- (void)setBluetoothUUID:(id)a3;
- (void)setPairingType:(int64_t)a3;
@end

@implementation NRBluetoothPairerParameters

- (void).cxx_destruct
{
}

- (void)setBluetoothUUID:(id)a3
{
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

@end