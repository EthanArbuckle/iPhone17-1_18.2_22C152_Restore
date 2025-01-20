@interface W5BluetoothDeviceInternal
- (BOOL)__isAppleDevice;
- (BOOL)__isCloudPaired;
- (BOOL)__isConnected;
- (BOOL)__isLowEnergy;
- (BOOL)__isPaired;
- (id)__address;
- (id)__name;
- (id)device;
- (unint64_t)__majorClass;
- (unint64_t)__minorClass;
- (void)dealloc;
- (void)setBluetoothDevice:(id)a3;
- (void)setPeripheral:(id)a3 centralManager:(id)a4;
@end

@implementation W5BluetoothDeviceInternal

- (void)setPeripheral:(id)a3 centralManager:(id)a4
{
  self->_peripheral = (CBPeripheral *)a3;
  self->_centralManager = (CBCentralManager *)a4;
}

- (void)setBluetoothDevice:(id)a3
{
  self->_device = (BluetoothDevice *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5BluetoothDeviceInternal;
  [(W5BluetoothDeviceInternal *)&v3 dealloc];
}

- (id)device
{
  id v3 = objc_alloc_init((Class)W5BluetoothDevice);
  [v3 setName:-[W5BluetoothDeviceInternal __name](self, "__name")];
  [v3 setAddress:-[W5BluetoothDeviceInternal __address](self, "__address")];
  [v3 setIsPaired:-[W5BluetoothDeviceInternal __isPaired](self, "__isPaired")];
  [v3 setIsConnected:-[W5BluetoothDeviceInternal __isConnected](self, "__isConnected")];
  [v3 setIsCloudPaired:-[W5BluetoothDeviceInternal __isCloudPaired](self, "__isCloudPaired")];
  [v3 setMajorClass:-[W5BluetoothDeviceInternal __majorClass](self, "__majorClass")];
  [v3 setMinorClass:-[W5BluetoothDeviceInternal __minorClass](self, "__minorClass")];
  [v3 setIsLowEnergy:-[W5BluetoothDeviceInternal __isLowEnergy](self, "__isLowEnergy")];
  [v3 setIsAppleDevice:-[W5BluetoothDeviceInternal __isAppleDevice](self, "__isAppleDevice")];
  return v3;
}

- (id)__name
{
  device = self->_device;
  if (!device) {
    device = self->_peripheral;
  }
  return [device name];
}

- (id)__address
{
  device = self->_device;
  if (device)
  {
    return [(BluetoothDevice *)device address];
  }
  else
  {
    id v5 = [(CBPeripheral *)self->_peripheral identifier];
    return [v5 UUIDString];
  }
}

- (BOOL)__isPaired
{
  device = self->_device;
  if (device)
  {
    return [(BluetoothDevice *)device paired];
  }
  else
  {
    id v4 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    peripheral = self->_peripheral;
    return [v4 isPeerPaired:peripheral];
  }
}

- (BOOL)__isCloudPaired
{
  device = self->_device;
  if (device)
  {
    return [(BluetoothDevice *)device cloudPaired];
  }
  else
  {
    id v4 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    return [v4 isPeerCloudPaired:];
  }
}

- (BOOL)__isConnected
{
  device = self->_device;
  if (device) {
    return [(BluetoothDevice *)device connected];
  }
  else {
    return [(CBPeripheral *)self->_peripheral isConnectedToSystem];
  }
}

- (BOOL)__isLowEnergy
{
  device = self->_device;
  if (device) {
    LOBYTE(v4) = [(BluetoothDevice *)device type] == 48;
  }
  else {
    return self->_peripheral != 0;
  }
  return v4;
}

- (BOOL)__isAppleDevice
{
  device = self->_device;
  if (device) {
    LOBYTE(device) = [(BluetoothDevice *)device isAppleAudioDevice];
  }
  return (char)device;
}

- (unint64_t)__majorClass
{
  return [(BluetoothDevice *)self->_device majorClass];
}

- (unint64_t)__minorClass
{
  return [(BluetoothDevice *)self->_device minorClass];
}

@end