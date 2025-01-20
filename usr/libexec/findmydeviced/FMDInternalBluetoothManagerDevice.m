@interface FMDInternalBluetoothManagerDevice
+ (id)externalAccessoryForMacAddress:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryPaired;
- (FMDAccessoryStyleDescriptor)styleDescriptor;
- (FMDBluetoothFrameworkDevice)bluetoothDevice;
- (FMDIdentifiable)accessoryIdentifier;
- (FMDInternalBluetoothManagerDevice)init;
- (NSArray)audioChannelInfo;
- (NSArray)batteryInfo;
- (NSArray)beacons;
- (NSDate)rssiUpdateDate;
- (NSDictionary)accessoryInfo;
- (NSMutableDictionary)audioChannelsByName;
- (NSMutableDictionary)beaconsByIdentifier;
- (NSNumber)accessoryRSSI;
- (NSNumber)bluetoothColorCode;
- (NSNumber)bluetoothConnected;
- (NSNumber)bluetoothDeviceProductId;
- (NSNumber)bluetoothDeviceVendor;
- (NSNumber)bluetoothMajorDeviceClass;
- (NSNumber)bluetoothMinorDeviceClass;
- (NSString)address;
- (NSString)advertisementStatusKey;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)name;
- (NSString)scoUID;
- (NSString)serialNumber;
- (OS_dispatch_queue)serialQueue;
- (id)primaryBeacon;
- (unint64_t)hash;
- (void)addAudioChannelStatus:(id)a3;
- (void)addBLEBeacon:(id)a3;
- (void)setAdvertisementStatusKey:(id)a3;
- (void)setAudioChannelsByName:(id)a3;
- (void)setBeaconsByIdentifier:(id)a3;
- (void)setBluetoothDevice:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDInternalBluetoothManagerDevice

- (FMDInternalBluetoothManagerDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMDInternalBluetoothManagerDevice;
  v2 = [(FMDInternalBluetoothManagerDevice *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDInternalBluetoothManagerDevice", 0);
    [(FMDInternalBluetoothManagerDevice *)v2 setSerialQueue:v3];

    v4 = +[NSMutableDictionary dictionary];
    [(FMDInternalBluetoothManagerDevice *)v2 setBeaconsByIdentifier:v4];

    v5 = +[NSMutableDictionary dictionary];
    [(FMDInternalBluetoothManagerDevice *)v2 setAudioChannelsByName:v5];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FMDInternalBluetoothManagerDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(FMDInternalBluetoothManagerDevice *)v5 address];
      objc_super v7 = [(FMDInternalBluetoothManagerDevice *)self address];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(FMDInternalBluetoothManagerDevice *)self audioChannelInfo];
        v9 = [(FMDInternalBluetoothManagerDevice *)v5 audioChannelInfo];
        unsigned __int8 v10 = [v8 isEqualToArray:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)FMDInternalBluetoothManagerDevice;
      unsigned __int8 v10 = [(FMDInternalBluetoothManagerDevice *)&v12 isEqual:v4];
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self address];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (FMDIdentifiable)accessoryIdentifier
{
  id v3 = objc_alloc((Class)FMDAccessoryIdentifier);
  v4 = [(FMDInternalBluetoothManagerDevice *)self address];
  id v5 = [v3 initWithAddress:v4];

  return (FMDIdentifiable *)v5;
}

- (NSNumber)bluetoothMajorDeviceClass
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v2 majorClass]);

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothMinorDeviceClass
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v2 minorClass]);

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothDeviceVendor
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v2 vendorId]);

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothDeviceProductId
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v2 productId]);

  return (NSNumber *)v3;
}

- (NSString)address
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = [v2 address];

  return (NSString *)v3;
}

- (NSString)scoUID
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = [v2 scoUID];

  return (NSString *)v3;
}

- (NSNumber)bluetoothConnected
{
  id v3 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  if (v3)
  {
    v4 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 connected]);
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSString)name
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (NSDictionary)accessoryInfo
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  id v3 = [v2 accessoryInfo];

  return (NSDictionary *)v3;
}

- (BOOL)isTemporaryPaired
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self bluetoothDevice];
  unsigned __int8 v3 = [v2 isTemporaryPaired];

  return v3;
}

- (FMDBluetoothFrameworkDevice)bluetoothDevice
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_1000174EC;
  v11 = sub_1000174FC;
  id v12 = 0;
  unsigned __int8 v3 = [(FMDInternalBluetoothManagerDevice *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017504;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FMDBluetoothFrameworkDevice *)v4;
}

- (void)addBLEBeacon:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isValid];

  if (v6)
  {
    uint64_t v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2050;
      v13 = self;
      __int16 v14 = 2050;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> addBLEBeacon: <%{public}p>", (uint8_t *)&v10, 0x20u);
    }

    v8 = [(FMDInternalBluetoothManagerDevice *)self beaconsByIdentifier];
    uint64_t v9 = [v4 identifier];
    [v8 setObject:v4 forKeyedSubscript:v9];
  }
}

- (void)addAudioChannelStatus:(id)a3
{
  id v4 = a3;
  id v5 = [v4 channelName];

  if (v5)
  {
    unsigned int v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138544130;
      uint64_t v10 = objc_opt_class();
      __int16 v11 = 2050;
      __int16 v12 = self;
      __int16 v13 = 2050;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> addAudioChannelStatus: <%{public}p> %@", (uint8_t *)&v9, 0x2Au);
    }

    uint64_t v7 = [(FMDInternalBluetoothManagerDevice *)self audioChannelsByName];
    v8 = [v4 channelName];
    [v7 setObject:v4 forKeyedSubscript:v8];
  }
}

- (NSNumber)accessoryRSSI
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self primaryBeacon];
  unsigned __int8 v3 = [v2 rssi];

  return (NSNumber *)v3;
}

- (NSDate)rssiUpdateDate
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self primaryBeacon];
  unsigned __int8 v3 = [v2 updateDate];

  return (NSDate *)v3;
}

- (NSArray)audioChannelInfo
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self audioChannelsByName];
  unsigned __int8 v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSNumber)bluetoothColorCode
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self primaryBeacon];
  unsigned __int8 v3 = [v2 colorCode];

  return (NSNumber *)v3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self primaryBeacon];
  unsigned __int8 v3 = [v2 styleDescriptor];

  return (FMDAccessoryStyleDescriptor *)v3;
}

- (id)primaryBeacon
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self beacons];
  unsigned __int8 v3 = +[FMDBLEAudioAdvertisementParser primaryBeaconForBeacons:v2];

  return v3;
}

- (NSArray)beacons
{
  v2 = [(FMDInternalBluetoothManagerDevice *)self beaconsByIdentifier];
  unsigned __int8 v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSString)serialNumber
{
  unsigned __int8 v3 = objc_opt_class();
  id v4 = [(FMDInternalBluetoothManagerDevice *)self address];
  id v5 = [v3 externalAccessoryForMacAddress:v4];

  unsigned int v6 = [v5 serialNumber];

  return (NSString *)v6;
}

- (NSString)firmwareRevision
{
  unsigned __int8 v3 = objc_opt_class();
  id v4 = [(FMDInternalBluetoothManagerDevice *)self address];
  id v5 = [v3 externalAccessoryForMacAddress:v4];

  unsigned int v6 = [v5 firmwareRevision];

  return (NSString *)v6;
}

- (NSString)hardwareRevision
{
  unsigned __int8 v3 = objc_opt_class();
  id v4 = [(FMDInternalBluetoothManagerDevice *)self address];
  id v5 = [v3 externalAccessoryForMacAddress:v4];

  unsigned int v6 = [v5 hardwareRevision];

  return (NSString *)v6;
}

- (NSArray)batteryInfo
{
  return 0;
}

+ (id)externalAccessoryForMacAddress:(id)a3
{
  id v3 = a3;
  id v4 = +[EAAccessoryManager sharedAccessoryManager];
  id v5 = [v4 connectedAccessories];

  unsigned int v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10023BAAC((uint64_t)v5, v6);
  }

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000174EC;
  v17 = sub_1000174FC;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017C7C;
  v10[3] = &unk_1002D9900;
  id v7 = v3;
  id v11 = v7;
  __int16 v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (NSString)advertisementStatusKey
{
  return self->_advertisementStatusKey;
}

- (void)setAdvertisementStatusKey:(id)a3
{
}

- (NSMutableDictionary)beaconsByIdentifier
{
  return self->_beaconsByIdentifier;
}

- (void)setBeaconsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)audioChannelsByName
{
  return self->_audioChannelsByName;
}

- (void)setAudioChannelsByName:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_audioChannelsByName, 0);
  objc_storeStrong((id *)&self->_beaconsByIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisementStatusKey, 0);

  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
}

@end