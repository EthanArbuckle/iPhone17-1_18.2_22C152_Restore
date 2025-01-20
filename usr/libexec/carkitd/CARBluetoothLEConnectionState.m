@interface CARBluetoothLEConnectionState
- (BOOL)discoveredPSMCharacteristic;
- (BOOL)discoveredService;
- (CARBluetoothLEChannel)serviceChannel;
- (NSNumber)PSM;
- (void)setDiscoveredPSMCharacteristic:(BOOL)a3;
- (void)setDiscoveredService:(BOOL)a3;
- (void)setPSM:(id)a3;
- (void)setServiceChannel:(id)a3;
@end

@implementation CARBluetoothLEConnectionState

- (BOOL)discoveredService
{
  return self->_discoveredService;
}

- (void)setDiscoveredService:(BOOL)a3
{
  self->_discoveredService = a3;
}

- (BOOL)discoveredPSMCharacteristic
{
  return self->_discoveredPSMCharacteristic;
}

- (void)setDiscoveredPSMCharacteristic:(BOOL)a3
{
  self->_discoveredPSMCharacteristic = a3;
}

- (NSNumber)PSM
{
  return self->_PSM;
}

- (void)setPSM:(id)a3
{
}

- (CARBluetoothLEChannel)serviceChannel
{
  return self->_serviceChannel;
}

- (void)setServiceChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceChannel, 0);

  objc_storeStrong((id *)&self->_PSM, 0);
}

@end