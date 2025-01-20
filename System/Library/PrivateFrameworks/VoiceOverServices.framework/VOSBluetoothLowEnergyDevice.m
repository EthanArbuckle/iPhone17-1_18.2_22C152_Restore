@interface VOSBluetoothLowEnergyDevice
- (BOOL)connected;
- (BOOL)connecting;
- (BOOL)isEqual:(id)a3;
- (BOOL)paired;
- (CBCentralManager)centralManager;
- (VOSBluetoothLowEnergyDevice)initWithPeripheral:(id)a3 manager:(id)a4;
- (id)address;
- (id)description;
- (id)identifier;
- (id)name;
- (id)peripheral;
- (int64_t)compare:(id)a3;
- (void)connect;
- (void)disconnect;
- (void)setPeripheral:(id)a3;
- (void)unpair;
@end

@implementation VOSBluetoothLowEnergyDevice

- (VOSBluetoothLowEnergyDevice)initWithPeripheral:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSBluetoothLowEnergyDevice;
  v9 = [(VOSBluetoothLowEnergyDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peripheral, a3);
    objc_storeStrong((id *)&v10->_centralManager, a4);
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(VOSBluetoothLowEnergyDevice *)self name];
  v6 = [v4 name];

  int64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(VOSBluetoothLowEnergyDevice *)self identifier];
    int64_t v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(VOSBluetoothLowEnergyDevice *)self name];
  int64_t v7 = [(VOSBluetoothLowEnergyDevice *)self identifier];
  char v8 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  v9 = [(VOSBluetoothLowEnergyDevice *)self centralManager];
  v10 = [v3 stringWithFormat:@"%@<%p>: name:'%@' identifier:'%@' CBPeripheral:'%@', CBCentralManager: '%@'", v5, self, v6, v7, v8, v9];

  return v10;
}

- (id)identifier
{
  v2 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)name
{
  v2 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  v3 = [v2 name];

  return v3;
}

- (BOOL)connected
{
  v2 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  char v3 = [v2 isConnectedToSystem];

  return v3;
}

- (BOOL)connecting
{
  v2 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  BOOL v3 = [v2 state] == 1;

  return v3;
}

- (BOOL)paired
{
  BOOL v3 = +[VOSBluetoothManager sharedInstance];
  LOBYTE(self) = [v3 btleDeviceIsPaired:self];

  return (char)self;
}

- (void)connect
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
    int v11 = 138412290;
    objc_super v12 = v4;
    _os_log_impl(&dword_21C3F9000, v3, OS_LOG_TYPE_DEFAULT, "Attempt connect: Current peripheral state: %@", (uint8_t *)&v11, 0xCu);
  }
  id v5 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  char v6 = [v5 isConnectedToSystem];

  if ((v6 & 1) == 0)
  {
    int64_t v7 = AXLogBrailleHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
      int v11 = 138412290;
      objc_super v12 = v8;
      _os_log_impl(&dword_21C3F9000, v7, OS_LOG_TYPE_DEFAULT, "Connecting: %@", (uint8_t *)&v11, 0xCu);
    }
    v9 = [(VOSBluetoothLowEnergyDevice *)self centralManager];
    v10 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
    [v9 connectPeripheral:v10 options:0];
  }
}

- (void)disconnect
{
  id v4 = [(VOSBluetoothLowEnergyDevice *)self centralManager];
  BOOL v3 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  [v4 cancelPeripheralConnection:v3 options:0];
}

- (void)unpair
{
  id v3 = +[VOSBluetoothManager sharedInstance];
  [v3 unpairBTLEDevice:self];
}

- (id)address
{
  v2 = [(VOSBluetoothLowEnergyDevice *)self peripheral];
  id v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end