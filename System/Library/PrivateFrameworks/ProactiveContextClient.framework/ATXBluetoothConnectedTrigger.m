@interface ATXBluetoothConnectedTrigger
+ (BOOL)supportsSecureCoding;
- (ATXBluetoothConnectedTrigger)initWithCoder:(id)a3;
- (ATXBluetoothConnectedTrigger)initWithDeviceIdentifier:(id)a3 deviceName:(id)a4;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXBluetoothConnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 15;
}

- (ATXBluetoothConnectedTrigger)initWithDeviceIdentifier:(id)a3 deviceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXBluetoothConnectedTrigger;
  v9 = [(ATXBluetoothConnectedTrigger *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceName, a4);
    v11 = v10;
  }

  return v10;
}

- (ATXBluetoothConnectedTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothDeviceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothDeviceName"];

  id v7 = [(ATXBluetoothConnectedTrigger *)self initWithDeviceIdentifier:v5 deviceName:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  deviceIdentifier = self->_deviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:deviceIdentifier forKey:@"bluetoothDeviceIdentifier"];
  [v5 encodeObject:self->_deviceName forKey:@"bluetoothDeviceName"];
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end