@interface FMDMockAccessory
+ (BOOL)supportsSecureCoding;
+ (id)volatileKeysToExcludeFromRegisterDigest;
- (BOOL)isEqual:(id)a3;
- (BOOL)nearby;
- (BOOL)playingSound;
- (BOOL)updateAudioAsset:(id)a3;
- (BOOL)updatePlaybackChannels:(id)a3;
- (BOOL)updateWithBeaconingIdentifier:(id)a3;
- (FMDAsset)audioAsset;
- (FMDAudioAccessoryInfo)audioAccessoryInfo;
- (FMDBluetoothManagerDevice)bluetoothManagerDevice;
- (FMDCommandContext)commandContext;
- (FMDIdentifiable)accessoryIdentifier;
- (FMDMockAccessory)init;
- (FMDMockAccessory)initWithBluetoothManagerDevice:(id)a3;
- (FMDMockAccessory)initWithCoder:(id)a3;
- (NSArray)batteryInfo;
- (NSArray)playbackChannels;
- (NSDate)lastActiveTime;
- (NSDate)lastDiscoveryDate;
- (NSDate)rssiUpdateDate;
- (NSDictionary)audioChannelInfo;
- (NSDictionary)beacons;
- (NSDictionary)deviceInfo;
- (NSDictionary)deviceInfoForHostRegister;
- (NSDictionary)lastKnownLocationDeviceInfo;
- (NSNumber)accessoryRSSI;
- (NSNumber)bluetoothColorCode;
- (NSNumber)deviceProductId;
- (NSNumber)deviceVendor;
- (NSString)address;
- (NSString)audioRoutingIdentifier;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)name;
- (NSString)scoUID;
- (NSString)serialNumber;
- (NSURL)audioURL;
- (NSUUID)baUUID;
- (NSUUID)persistedValue;
- (OS_dispatch_queue)accessoryQueue;
- (id)connectionStatusString;
- (id)otherDeviceInfo;
- (int64_t)connectionState;
- (unint64_t)audioSafetyStatus;
- (unint64_t)category;
- (unint64_t)hash;
- (unsigned)majorDeviceClass;
- (unsigned)minorDeviceClass;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryQueue:(id)a3;
- (void)setAccessoryRSSI:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAudioAccessoryInfo:(id)a3;
- (void)setAudioAsset:(id)a3;
- (void)setAudioChannelInfo:(id)a3;
- (void)setAudioRoutingIdentifier:(id)a3;
- (void)setAudioSafetyStatus:(unint64_t)a3;
- (void)setBatteryInfo:(id)a3;
- (void)setBeacons:(id)a3;
- (void)setBluetoothColorCode:(id)a3;
- (void)setBluetoothManagerDevice:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setCommandContext:(id)a3;
- (void)setCompleteDeviceInfo:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoForHostCurrentLocation:(id)a3;
- (void)setDeviceInfoForHostRegister:(id)a3;
- (void)setDeviceProductId:(id)a3;
- (void)setDeviceVendor:(id)a3;
- (void)setFirmwareRevision:(id)a3;
- (void)setHardwareRevision:(id)a3;
- (void)setLastActiveTime:(id)a3;
- (void)setLastDiscoveryDate:(id)a3;
- (void)setLastKnownLocationDeviceInfo:(id)a3;
- (void)setLocationDeviceInfo:(id)a3;
- (void)setMajorDeviceClass:(unsigned int)a3;
- (void)setMinorDeviceClass:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setNearby:(BOOL)a3;
- (void)setPersistedValue:(id)a3;
- (void)setPlaybackChannels:(id)a3;
- (void)setRssiUpdateDate:(id)a3;
- (void)setScoUID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)updateAudioChannelPlayingState:(id)a3;
- (void)updateAudioChannelsWithArray:(id)a3;
- (void)updateBeaconsWithArray:(id)a3;
- (void)updateWithAccessory:(id)a3;
@end

@implementation FMDMockAccessory

- (FMDMockAccessory)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDMockAccessory;
  v2 = [(FMDMockAccessory *)&v6 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    [(FMDMockAccessory *)v2 setPersistedValue:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.findmydeviced.mockaccessory", 0);
    [(FMDMockAccessory *)v2 setAccessoryQueue:v4];
  }
  return v2;
}

- (FMDMockAccessory)initWithBluetoothManagerDevice:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMockAccessory *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    [(FMDMockAccessory *)v5 setBluetoothManagerDevice:v4];
    v7 = [v4 bluetoothConnected];
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      v9 = +[NSDate date];
      [(FMDMockAccessory *)v6 setLastActiveTime:v9];
    }
    v10 = [v4 name];
    [(FMDMockAccessory *)v6 setName:v10];

    v11 = [v4 bluetoothMajorDeviceClass];
    -[FMDMockAccessory setMajorDeviceClass:](v6, "setMajorDeviceClass:", [v11 unsignedIntValue]);

    v12 = [v4 bluetoothMinorDeviceClass];
    -[FMDMockAccessory setMinorDeviceClass:](v6, "setMinorDeviceClass:", [v12 unsignedIntValue]);

    v13 = [v4 scoUID];
    [(FMDMockAccessory *)v6 setScoUID:v13];

    v14 = [v4 address];
    [(FMDMockAccessory *)v6 setAddress:v14];

    v15 = [v4 serialNumber];
    [(FMDMockAccessory *)v6 setSerialNumber:v15];

    v16 = [v4 firmwareRevision];
    [(FMDMockAccessory *)v6 setFirmwareRevision:v16];

    v17 = [v4 hardwareRevision];
    [(FMDMockAccessory *)v6 setHardwareRevision:v17];

    v18 = [v4 beacons];
    [(FMDMockAccessory *)v6 updateBeaconsWithArray:v18];

    v19 = [v4 audioChannelInfo];
    [(FMDMockAccessory *)v6 updateAudioChannelsWithArray:v19];

    v20 = [v4 bluetoothColorCode];
    [(FMDMockAccessory *)v6 setBluetoothColorCode:v20];

    v21 = [v4 batteryInfo];
    [(FMDMockAccessory *)v6 setBatteryInfo:v21];

    v22 = [v4 bluetoothDeviceVendor];
    [(FMDMockAccessory *)v6 setDeviceVendor:v22];

    v23 = [v4 bluetoothDeviceProductId];
    [(FMDMockAccessory *)v6 setDeviceProductId:v23];

    v24 = [v4 accessoryRSSI];
    [(FMDMockAccessory *)v6 setAccessoryRSSI:v24];

    v25 = [v4 rssiUpdateDate];
    [(FMDMockAccessory *)v6 setRssiUpdateDate:v25];

    v26 = [(FMDMockAccessory *)v6 address];
    [(FMDMockAccessory *)v6 setAudioRoutingIdentifier:v26];

    id v27 = objc_alloc((Class)FMDAccessoryIdentifier);
    v28 = [(FMDMockAccessory *)v6 address];
    id v29 = [v27 initWithAddress:v28];
    [(FMDMockAccessory *)v6 setAccessoryIdentifier:v29];
  }
  return v6;
}

- (BOOL)updateAudioAsset:(id)a3
{
  return 0;
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(FMDMockAccessory *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BAA38;
  block[3] = &unk_1002D9508;
  id v9 = v4;
  v10 = self;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (void)updateAudioChannelPlayingState:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMockAccessory *)self audioChannelInfo];
  id v6 = [v5 allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BABDC;
  v8[3] = &unk_1002DB968;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMockAccessory *)self persistedValue];
  id v6 = [v5 UUIDString];
  id v7 = NSStringFromSelector("persistedValue");
  [v4 encodeObject:v6 forKey:v7];

  id v9 = [(FMDMockAccessory *)self accessoryIdentifier];
  unsigned int v8 = NSStringFromSelector("accessoryIdentifier");
  [v4 encodeObject:v9 forKey:v8];
}

- (FMDMockAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMDMockAccessory;
  v5 = [(FMDMockAccessory *)&v15 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSUUID);
    uint64_t v7 = objc_opt_class();
    unsigned int v8 = NSStringFromSelector("persistedValue");
    id v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    id v10 = [v6 initWithUUIDString:v9];
    [(FMDMockAccessory *)v5 setPersistedValue:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector("accessoryIdentifier");
    v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    [(FMDMockAccessory *)v5 setAccessoryIdentifier:v13];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FMDMockAccessory *)a3;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(FMDMockAccessory *)v4 persistedValue];
      id v6 = [v5 UUIDString];
      uint64_t v7 = [(FMDMockAccessory *)self persistedValue];
      unsigned int v8 = [v7 UUIDString];
      if ([v6 isEqualToString:v8])
      {
        id v9 = [(FMDMockAccessory *)self accessoryIdentifier];
        id v10 = [(FMDMockAccessory *)v4 accessoryIdentifier];
        if ([v9 isEqual:v10])
        {
          uint64_t v11 = [(FMDMockAccessory *)self name];
          uint64_t v12 = [(FMDMockAccessory *)v4 name];
          unsigned __int8 v13 = [v11 isEqualToString:v12];
        }
        else
        {
          unsigned __int8 v13 = 0;
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = [(FMDMockAccessory *)self persistedValue];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)updateAudioChannelsWithArray:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [(FMDMockAccessory *)self audioChannelInfo];
  [v5 addEntriesFromDictionary:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BB114;
  v8[3] = &unk_1002DB968;
  id v9 = v5;
  id v7 = v5;
  [v4 enumerateObjectsUsingBlock:v8];

  [(FMDMockAccessory *)self setAudioChannelInfo:v7];
}

- (void)updateBeaconsWithArray:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [(FMDMockAccessory *)self beacons];
  [v5 addEntriesFromDictionary:v6];

  unsigned int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000BB260;
  uint64_t v11 = &unk_1002DBE60;
  uint64_t v12 = self;
  id v13 = v5;
  id v7 = v5;
  [v4 enumerateObjectsUsingBlock:&v8];

  -[FMDMockAccessory setBeacons:](self, "setBeacons:", v7, v8, v9, v10, v11, v12);
}

- (BOOL)playingSound
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(FMDMockAccessory *)self audioChannelInfo];
  id v3 = [v2 allValues];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BB424;
  v5[3] = &unk_1002DBEB0;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSURL)audioURL
{
  v2 = [(FMDMockAccessory *)self audioAsset];
  id v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (void)updateWithAccessory:(id)a3
{
  id v25 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v25;
  if (isKindOfClass)
  {
    uint64_t v6 = [v25 persistedValue];
    [(FMDMockAccessory *)self setPersistedValue:v6];

    id v7 = v25;
    uint64_t v8 = [v7 lastActiveTime];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;
    uint64_t v11 = [(FMDMockAccessory *)self lastActiveTime];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v10 > v13) {
      objc_storeStrong((id *)&self->_lastActiveTime, v8);
    }
    uint64_t v14 = [v7 rssiUpdateDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    v17 = [(FMDMockAccessory *)self rssiUpdateDate];
    [v17 timeIntervalSinceReferenceDate];
    double v19 = v18;

    if (v16 > v19) {
      [(FMDMockAccessory *)self setRssiUpdateDate:v14];
    }
    v20 = [v7 beacons];
    v21 = [v20 allValues];
    [(FMDMockAccessory *)self updateBeaconsWithArray:v21];

    v22 = [v7 bluetoothColorCode];
    v23 = [(FMDMockAccessory *)self bluetoothColorCode];

    if (!v23) {
      [(FMDMockAccessory *)self setBluetoothColorCode:v22];
    }
    v24 = [v7 playbackChannels];
    [(FMDMockAccessory *)self updatePlaybackChannels:v24];

    id v5 = v25;
  }

  _objc_release_x1(isKindOfClass, v5);
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  v4[0] = @"connectionStatus";
  v4[1] = @"lastActiveTime";
  v4[2] = @"batteryInfo";
  v4[3] = @"accessoryRSSI";
  v4[4] = @"accessoryRSSITimestamp";
  v4[5] = @"beacons";
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (NSDictionary)lastKnownLocationDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDMockAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDMockAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDMockAccessory *)self lastActiveTime];
  v40 = v7;
  if (v7)
  {
    uint64_t v8 = [NSNumber numberWithLongLong:][v7 fm_epoch];
    [v3 setValue:v8 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2098 forKey:@"lastActiveTime"];
  }
  double v9 = [(FMDMockAccessory *)self accessoryRSSI];
  [v3 fm_safeSetObject:v9 forKey:@"accessoryRSSI"];

  double v10 = [(FMDMockAccessory *)self rssiUpdateDate];
  if (v10)
  {
    uint64_t v11 = [(FMDMockAccessory *)self rssiUpdateDate];
    double v12 = [NSNumber numberWithLongLong:objc_msgSend(v11, "fm_epoch")];
    [v3 fm_safeSetObject:v12 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2098 forKey:@"accessoryRSSITimestamp"];
  }

  double v13 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v14 = [(FMDMockAccessory *)self batteryInfo];
  id v15 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v46;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryValue];
        [v13 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v16);
  }

  [v3 setValue:v13 forKey:@"batteryInfo"];
  v20 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v21 = [(FMDMockAccessory *)self beacons];
  v22 = [v21 allValues];

  id v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v42;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) dictionaryValue];
        [v20 addObject:v27];
      }
      id v24 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v24);
  }

  [v3 setValue:v20 forKey:@"beacons"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  v28 = [(FMDMockAccessory *)self firmwareRevision];
  [v3 fm_safeSetObject:v28 forKey:@"firmwareVersion"];

  id v29 = +[FMDSystemConfig sharedInstance];
  v30 = [v29 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v30];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  v31 = [(FMDMockAccessory *)self deviceVendor];
  id v32 = [v31 unsignedIntValue];
  v33 = [(FMDMockAccessory *)self deviceProductId];
  v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i_%i", v32, [v33 unsignedIntValue]);
  [v3 setObject:v34 forKeyedSubscript:@"productType"];

  v35 = +[FMDSystemConfig sharedInstance];
  v36 = [v35 platform];
  v37 = +[NSString stringWithFormat:@"%@_proxy", v36];

  [v3 fm_safelyMapKey:@"platform" toObject:v37];
  v38 = [(FMDMockAccessory *)self bluetoothColorCode];
  [v3 fm_safeSetObject:v38 forKey:@"colorCode"];

  return (NSDictionary *)v3;
}

- (id)connectionStatusString
{
  unint64_t v2 = [(FMDMockAccessory *)self connectionState];
  if (v2 > 2) {
    return 0;
  }
  else {
    return *(&off_1002DCE70 + v2);
  }
}

- (NSDictionary)deviceInfoForHostRegister
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(FMDMockAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDMockAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDMockAccessory *)self deviceVendor];
  id v8 = [v7 unsignedIntValue];
  double v9 = [(FMDMockAccessory *)self deviceProductId];
  double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i_%i", v8, [v9 unsignedIntValue]);
  [v3 setObject:v10 forKeyedSubscript:@"productType"];

  uint64_t v11 = [(FMDMockAccessory *)self connectionStatusString];
  [v3 setValue:v11 forKey:@"connectionStatus"];

  double v12 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v13 = [(FMDMockAccessory *)self beacons];
  uint64_t v14 = [v13 allValues];

  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryValue];
        [v12 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  [v3 setValue:v12 forKey:@"beacons"];
  v20 = [(FMDMockAccessory *)self lastActiveTime];
  v21 = v20;
  if (v20)
  {
    v22 = [NSNumber numberWithLongLong:objc_msgSend(v20, "fm_epoch")];
    [v3 setValue:v22 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2098 forKey:@"lastActiveTime"];
  }
  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  id v23 = +[FMDSystemConfig sharedInstance];
  id v24 = [v23 platform];
  uint64_t v25 = +[NSString stringWithFormat:@"%@_proxy", v24];

  [v3 fm_safelyMapKey:@"platform" toObject:v25];
  v26 = [(FMDMockAccessory *)self accessoryRSSI];
  [v3 fm_safeSetObject:v26 forKey:@"accessoryRSSI"];

  id v27 = [(FMDMockAccessory *)self rssiUpdateDate];
  if (v27)
  {
    v28 = [(FMDMockAccessory *)self rssiUpdateDate];
    id v29 = [NSNumber numberWithLongLong:objc_msgSend(v28, "fm_epoch")];
    [v3 fm_safeSetObject:v29 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2098 forKey:@"accessoryRSSITimestamp"];
  }

  return (NSDictionary *)v3;
}

- (id)otherDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[FMDSystemConfig sharedInstance];
  id v5 = [v4 deviceName];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v5];

  uint64_t v6 = [(FMDMockAccessory *)self lastActiveTime];
  id v7 = v6;
  if (v6)
  {
    id v8 = [NSNumber numberWithLongLong:[v6 fm_epoch]];
    [v3 setValue:v8 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2098 forKey:@"lastActiveTime"];
  }
  double v9 = +[FMDSystemConfig sharedInstance];
  double v10 = [v9 deviceClassString];
  [v3 fm_safelyMapKey:@"deviceClass" toObject:v10];

  uint64_t v11 = +[FMDSystemConfig sharedInstance];
  double v12 = [v11 platform];
  [v3 fm_safelyMapKey:@"platform" toObject:v12];

  double v13 = +[FMDSystemConfig sharedInstance];
  uint64_t v14 = [v13 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v14];

  id v15 = +[FMDSystemConfig sharedInstance];
  id v16 = [v15 productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v16];

  double v19 = v3;
  uint64_t v17 = +[NSArray arrayWithObjects:&v19 count:1];

  return v17;
}

- (NSUUID)baUUID
{
  return 0;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (FMDIdentifiable)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
}

- (unint64_t)audioSafetyStatus
{
  return self->_audioSafetyStatus;
}

- (void)setAudioSafetyStatus:(unint64_t)a3
{
  self->_audioSafetyStatus = a3;
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->_nearby = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (NSNumber)deviceVendor
{
  return self->_deviceVendor;
}

- (void)setDeviceVendor:(id)a3
{
}

- (NSNumber)deviceProductId
{
  return self->_deviceProductId;
}

- (void)setDeviceProductId:(id)a3
{
}

- (NSDate)lastDiscoveryDate
{
  return self->_lastDiscoveryDate;
}

- (void)setLastDiscoveryDate:(id)a3
{
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)audioRoutingIdentifier
{
  return self->_audioRoutingIdentifier;
}

- (void)setAudioRoutingIdentifier:(id)a3
{
}

- (NSDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void)setCompleteDeviceInfo:(id)a3
{
}

- (void)setDeviceInfoForHostRegister:(id)a3
{
}

- (void)setDeviceInfoForHostCurrentLocation:(id)a3
{
}

- (void)setLocationDeviceInfo:(id)a3
{
}

- (void)setLastKnownLocationDeviceInfo:(id)a3
{
}

- (NSUUID)persistedValue
{
  return self->_persistedValue;
}

- (void)setPersistedValue:(id)a3
{
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
}

- (NSDate)rssiUpdateDate
{
  return self->_rssiUpdateDate;
}

- (void)setRssiUpdateDate:(id)a3
{
}

- (NSArray)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
}

- (NSNumber)bluetoothColorCode
{
  return self->_bluetoothColorCode;
}

- (void)setBluetoothColorCode:(id)a3
{
}

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
}

- (NSDictionary)beacons
{
  return self->_beacons;
}

- (void)setBeacons:(id)a3
{
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
}

- (FMDAsset)audioAsset
{
  return self->_audioAsset;
}

- (void)setAudioAsset:(id)a3
{
}

- (NSNumber)accessoryRSSI
{
  return self->_accessoryRSSI;
}

- (void)setAccessoryRSSI:(id)a3
{
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (void)setFirmwareRevision:(id)a3
{
}

- (FMDBluetoothManagerDevice)bluetoothManagerDevice
{
  return self->_bluetoothManagerDevice;
}

- (void)setBluetoothManagerDevice:(id)a3
{
}

- (NSString)scoUID
{
  return self->_scoUID;
}

- (void)setScoUID:(id)a3
{
}

- (unsigned)majorDeviceClass
{
  return self->_majorDeviceClass;
}

- (void)setMajorDeviceClass:(unsigned int)a3
{
  self->_majorDeviceClass = a3;
}

- (unsigned)minorDeviceClass
{
  return self->_minorDeviceClass;
}

- (void)setMinorDeviceClass:(unsigned int)a3
{
  self->_minorDeviceClass = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
}

- (OS_dispatch_queue)accessoryQueue
{
  return self->_accessoryQueue;
}

- (void)setAccessoryQueue:(id)a3
{
}

- (FMDAudioAccessoryInfo)audioAccessoryInfo
{
  return self->_audioAccessoryInfo;
}

- (void)setAudioAccessoryInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_accessoryQueue, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_scoUID, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);
  objc_storeStrong((id *)&self->_accessoryRSSI, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_beacons, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_rssiUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_persistedValue, 0);
  objc_storeStrong((id *)&self->_lastKnownLocationDeviceInfo, 0);
  objc_storeStrong((id *)&self->_locationDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfoForHostCurrentLocation, 0);
  objc_storeStrong((id *)&self->_deviceInfoForHostRegister, 0);
  objc_storeStrong((id *)&self->_completeDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);
  objc_storeStrong((id *)&self->_deviceVendor, 0);
  objc_storeStrong((id *)&self->_commandContext, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end