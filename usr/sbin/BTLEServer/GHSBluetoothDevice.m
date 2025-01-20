@interface GHSBluetoothDevice
+ (id)ghsDeviceWithProperties:(id)a3;
- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (CBPeripheral)peripheral;
- (GHSBluetoothDevice)init;
- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4;
- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4 healthSampleTypes:(id)a5;
- (HKDevice)hkDevice;
- (HKHealthStore)hkStore;
- (NSNumber)debugLoggingEnabled;
- (unsigned)linkIdleTimeout;
- (void)setDebugLoggingEnabled:(id)a3;
- (void)setHkDevice:(id)a3;
- (void)setHkStore:(id)a3;
- (void)setPeripheral:(id)a3;
@end

@implementation GHSBluetoothDevice

+ (id)ghsDeviceWithProperties:(id)a3
{
  id v3 = a3;
  if (qword_1000CD168 != -1) {
    dispatch_once(&qword_1000CD168, &stru_1000B25D8);
  }
  v4 = [v3 objectForKeyedSubscript:@"kBTDeviceTypeMDCDevSpecKey"];
  [v4 unsignedIntValue];

  id v5 = [objc_alloc((Class)objc_opt_class()) initWithProperties:v3 healthStore:qword_1000CD160];

  return v5;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100075E98(v9, self);
  }
  return 0;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100075F44(v9, self);
  }
  return 0;
}

- (GHSBluetoothDevice)init
{
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GHSBluetoothDevice init]");
  +[NSException raise:NSInvalidArgumentException, @"Calling %@ is not allowed", v3 format];

  return 0;
}

- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GHSBluetoothDevice;
  v7 = [(GHSBluetoothDevice *)&v22 init];
  if (v7)
  {
    id v20 = objc_alloc((Class)HKDevice);
    v19 = [v6 objectForKeyedSubscript:@"kGHSDeviceNameKey"];
    v8 = [v6 objectForKeyedSubscript:@"ManufacturerName"];
    v9 = [v6 objectForKeyedSubscript:@"ModelNumber"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"HardwareRevision"];
    v11 = [v6 objectForKeyedSubscript:@"FirmwareRevision"];
    v12 = [v6 objectForKeyedSubscript:@"SoftwareRevision"];
    v13 = [v6 objectForKeyedSubscript:@"UUID"];
    v14 = [v6 objectForKeyedSubscript:@"UDIForMedicalDevices"];
    v15 = (void *)v10;
    id v16 = [v20 initWithName:v19 manufacturer:v8 model:v9 hardwareVersion:v10 firmwareVersion:v11 softwareVersion:v12 localIdentifier:v13 UDIDeviceIdentifier:v14];
    [(GHSBluetoothDevice *)v7 setHkDevice:v16];

    [(GHSBluetoothDevice *)v7 setHkStore:v21];
    v17 = [v6 objectForKeyedSubscript:@"kGHSPDebugLoggingEnabledKey"];
    [(GHSBluetoothDevice *)v7 setDebugLoggingEnabled:v17];
  }
  return v7;
}

- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4 healthSampleTypes:(id)a5
{
  id v8 = a3;
  id v25 = a4;
  id v24 = a5;
  v28.receiver = self;
  v28.super_class = (Class)GHSBluetoothDevice;
  v9 = [(GHSBluetoothDevice *)&v28 init];
  if (v9)
  {
    id v23 = objc_alloc((Class)HKDevice);
    objc_super v22 = [v8 objectForKeyedSubscript:@"kGHSDeviceNameKey"];
    id v21 = [v8 objectForKeyedSubscript:@"ManufacturerName"];
    uint64_t v10 = [v8 objectForKeyedSubscript:@"ModelNumber"];
    v11 = [v8 objectForKeyedSubscript:@"HardwareRevision"];
    v12 = [v8 objectForKeyedSubscript:@"FirmwareRevision"];
    v13 = [v8 objectForKeyedSubscript:@"SoftwareRevision"];
    v14 = [v8 objectForKeyedSubscript:@"UUID"];
    v15 = [v8 objectForKeyedSubscript:@"UDIForMedicalDevices"];
    id v16 = [v23 initWithName:v22 manufacturer:v21 model:v10 hardwareVersion:v11 firmwareVersion:v12 softwareVersion:v13 localIdentifier:v14 UDIDeviceIdentifier:v15];
    [(GHSBluetoothDevice *)v9 setHkDevice:v16];

    [(GHSBluetoothDevice *)v9 setHkStore:v25];
    v17 = [(GHSBluetoothDevice *)v9 hkStore];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100063D24;
    v26[3] = &unk_1000B13F8;
    v18 = v9;
    v27 = v18;
    [v17 requestAuthorizationToShareTypes:v24 readTypes:v24 shouldPrompt:0 completion:v26];

    v19 = [v8 objectForKeyedSubscript:@"kGHSPDebugLoggingEnabledKey"];
    [(GHSBluetoothDevice *)v18 setDebugLoggingEnabled:v19];

    v18->_linkIdleTimeout = 30;
  }

  return v9;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)linkIdleTimeout
{
  return self->_linkIdleTimeout;
}

- (HKDevice)hkDevice
{
  return self->_hkDevice;
}

- (void)setHkDevice:(id)a3
{
}

- (HKHealthStore)hkStore
{
  return self->_hkStore;
}

- (void)setHkStore:(id)a3
{
}

- (NSNumber)debugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

- (void)setDebugLoggingEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLoggingEnabled, 0);
  objc_storeStrong((id *)&self->_hkStore, 0);
  objc_storeStrong((id *)&self->_hkDevice, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end