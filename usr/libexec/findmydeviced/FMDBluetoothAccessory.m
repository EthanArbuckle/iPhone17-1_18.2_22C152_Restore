@interface FMDBluetoothAccessory
+ (BOOL)supportsSecureCoding;
+ (id)volatileKeysToExcludeFromRegisterDigest;
- (BOOL)nearby;
- (BOOL)playingSound;
- (BOOL)shouldStopSoundNow;
- (BOOL)updateAudioAsset:(id)a3;
- (BOOL)updatePlaybackChannels:(id)a3;
- (BOOL)updateWithBeaconingIdentifier:(id)a3;
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (FMDAccessorySerialNumbers)serialNumbers;
- (FMDAccessoryStyleDescriptor)styleDescriptor;
- (FMDAsset)audioAsset;
- (FMDAudioAccessoryInfo)audioAccessoryInfo;
- (FMDBluetoothAccessory)init;
- (FMDBluetoothAccessory)initWithBluetoothManagerDevice:(id)a3;
- (FMDBluetoothAccessory)initWithCoder:(id)a3;
- (FMDBluetoothManagerDevice)bluetoothManagerDevice;
- (FMDCommandContext)commandContext;
- (NSArray)batteryInfo;
- (NSArray)playbackChannels;
- (NSDate)lastActiveTime;
- (NSDate)rssiUpdateDate;
- (NSDictionary)audioChannelInfo;
- (NSDictionary)beacons;
- (NSNumber)accessoryRSSI;
- (NSNumber)bluetoothColorCode;
- (NSNumber)deviceProductId;
- (NSNumber)deviceVendor;
- (NSString)address;
- (NSString)audioRoutingIdentifier;
- (NSString)description;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)name;
- (NSString)scoUID;
- (NSString)serialNumber;
- (NSURL)audioURL;
- (NSUUID)baUUID;
- (id)connectionStatusString;
- (id)currentLastActiveTime;
- (id)deviceInfo;
- (id)deviceInfoForHostRegister;
- (id)dictionaryValue;
- (id)lastDiscoveryDate;
- (id)lastKnownLocationDeviceInfo;
- (id)otherDeviceInfo;
- (int64_t)connectionState;
- (unint64_t)audioSafetyStatus;
- (unint64_t)audioSafetyStatusForAirPods:(id)a3 knownStatus:(unint64_t)a4;
- (unint64_t)audioSafetyStatusForStereoPair:(id)a3;
- (unint64_t)category;
- (unint64_t)hash;
- (unsigned)majorDeviceClass;
- (unsigned)minorDeviceClass;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryRSSI:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAudioAsset:(id)a3;
- (void)setAudioChannelInfo:(id)a3;
- (void)setAudioRoutingIdentifier:(id)a3;
- (void)setBaUUID:(id)a3;
- (void)setBatteryInfo:(id)a3;
- (void)setBeacons:(id)a3;
- (void)setBluetoothColorCode:(id)a3;
- (void)setBluetoothManagerDevice:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setDeviceProductId:(id)a3;
- (void)setDeviceVendor:(id)a3;
- (void)setFirmwareRevision:(id)a3;
- (void)setHardwareRevision:(id)a3;
- (void)setLastActiveTime:(id)a3;
- (void)setMajorDeviceClass:(unsigned int)a3;
- (void)setMinorDeviceClass:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setPlaybackChannels:(id)a3;
- (void)setRssiUpdateDate:(id)a3;
- (void)setScoUID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSerialNumbers:(id)a3;
- (void)setStyleDescriptor:(id)a3;
- (void)updateAudioChannelPlayingState:(id)a3;
- (void)updateAudioChannelsWithArray:(id)a3;
- (void)updateBeaconsWithArray:(id)a3;
- (void)updateWithAccessory:(id)a3;
@end

@implementation FMDBluetoothAccessory

- (FMDBluetoothAccessory)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDBluetoothAccessory;
  v2 = [(FMDBluetoothAccessory *)&v5 init];
  if (v2)
  {
    v3 = [[FMDCommandContext alloc] initWithAccessory:v2];
    [(FMDBluetoothAccessory *)v2 setCommandContext:v3];
  }
  return v2;
}

- (FMDBluetoothAccessory)initWithBluetoothManagerDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FMDBluetoothAccessory *)self init];
  v6 = v5;
  if (v5)
  {
    [(FMDBluetoothAccessory *)v5 setBluetoothManagerDevice:v4];
    v7 = [v4 bluetoothConnected];
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      v9 = +[NSDate date];
      [(FMDBluetoothAccessory *)v6 setLastActiveTime:v9];
    }
    v10 = [v4 name];
    [(FMDBluetoothAccessory *)v6 setName:v10];

    v11 = [v4 bluetoothMajorDeviceClass];
    -[FMDBluetoothAccessory setMajorDeviceClass:](v6, "setMajorDeviceClass:", [v11 unsignedIntValue]);

    v12 = [v4 bluetoothMinorDeviceClass];
    -[FMDBluetoothAccessory setMinorDeviceClass:](v6, "setMinorDeviceClass:", [v12 unsignedIntValue]);

    v13 = [v4 scoUID];
    [(FMDBluetoothAccessory *)v6 setScoUID:v13];

    v14 = [v4 address];
    [(FMDBluetoothAccessory *)v6 setAddress:v14];

    v15 = [v4 serialNumber];
    [(FMDBluetoothAccessory *)v6 setSerialNumber:v15];

    v16 = [v4 firmwareRevision];
    [(FMDBluetoothAccessory *)v6 setFirmwareRevision:v16];

    v17 = [v4 hardwareRevision];
    [(FMDBluetoothAccessory *)v6 setHardwareRevision:v17];

    v18 = [v4 beacons];
    [(FMDBluetoothAccessory *)v6 updateBeaconsWithArray:v18];

    v19 = [v4 audioChannelInfo];
    [(FMDBluetoothAccessory *)v6 updateAudioChannelsWithArray:v19];

    v20 = [FMDAccessorySerialNumbers alloc];
    v21 = [v4 accessoryInfo];
    v22 = [(FMDAccessorySerialNumbers *)v20 initWithAccessoryInfo:v21];
    [(FMDBluetoothAccessory *)v6 setSerialNumbers:v22];

    v23 = [v4 bluetoothColorCode];
    [(FMDBluetoothAccessory *)v6 setBluetoothColorCode:v23];

    v24 = [v4 styleDescriptor];
    [(FMDBluetoothAccessory *)v6 setStyleDescriptor:v24];

    v25 = [v4 batteryInfo];
    [(FMDBluetoothAccessory *)v6 setBatteryInfo:v25];

    v26 = [v4 bluetoothDeviceVendor];
    [(FMDBluetoothAccessory *)v6 setDeviceVendor:v26];

    v27 = [v4 bluetoothDeviceProductId];
    [(FMDBluetoothAccessory *)v6 setDeviceProductId:v27];

    v28 = [v4 accessoryRSSI];
    [(FMDBluetoothAccessory *)v6 setAccessoryRSSI:v28];

    v29 = [v4 rssiUpdateDate];
    [(FMDBluetoothAccessory *)v6 setRssiUpdateDate:v29];

    v30 = [(FMDBluetoothAccessory *)v6 address];
    [(FMDBluetoothAccessory *)v6 setAudioRoutingIdentifier:v30];

    id v31 = objc_alloc((Class)FMDAccessoryIdentifier);
    v32 = [(FMDBluetoothAccessory *)v6 address];
    id v33 = [v31 initWithAddress:v32];
    [(FMDBluetoothAccessory *)v6 setAccessoryIdentifier:v33];
  }
  return v6;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 1;
}

- (void)updateWithAccessory:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self;
      *(_DWORD *)buf = 134218240;
      v44 = self;
      __int16 v45 = 2048;
      v46 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updateWithAccessory: FMDInternalAccessory(0x%lX)", buf, 0x16u);
    }
    id v7 = v4;
    unsigned int v8 = [v7 lastActiveTime];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;
    v11 = [(FMDBluetoothAccessory *)self lastActiveTime];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v10 > v13) {
      [(FMDBluetoothAccessory *)self setLastActiveTime:v8];
    }
    v14 = [v7 rssiUpdateDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    v17 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
    [v17 timeIntervalSinceReferenceDate];
    double v19 = v18;

    if (v16 > v19) {
      [(FMDBluetoothAccessory *)self setRssiUpdateDate:v14];
    }
    v20 = [v7 beacons];
    v21 = [v20 allValues];
    [(FMDBluetoothAccessory *)self updateBeaconsWithArray:v21];

    v22 = [v7 serialNumbers];
    v23 = [(FMDBluetoothAccessory *)self serialNumbers];

    if (!v23) {
      [(FMDBluetoothAccessory *)self setSerialNumbers:v22];
    }
    v24 = [v7 bluetoothColorCode];
    v25 = [(FMDBluetoothAccessory *)self bluetoothColorCode];

    if (!v25) {
      [(FMDBluetoothAccessory *)self setBluetoothColorCode:v24];
    }
    uint64_t v26 = [v7 styleDescriptor];
    v27 = [(FMDBluetoothAccessory *)self styleDescriptor];

    if (!v27) {
      [(FMDBluetoothAccessory *)self setStyleDescriptor:v26];
    }
    v41 = (void *)v26;
    v42 = v8;
    v28 = [v7 audioAsset];
    [(FMDBluetoothAccessory *)self setAudioAsset:v28];

    v29 = [v7 playbackChannels];
    [(FMDBluetoothAccessory *)self updatePlaybackChannels:v29];

    v30 = [v7 baUUID];
    id v31 = sub_100004238();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [v30 UUIDString];
      id v33 = [(FMDBluetoothAccessory *)self baUUID];
      [v7 name];
      v34 = v40 = v22;
      [v7 address];
      id v39 = v4;
      v35 = v24;
      v37 = v36 = v14;
      *(_DWORD *)buf = 138413058;
      v44 = v32;
      __int16 v45 = 2112;
      v46 = v33;
      __int16 v47 = 2112;
      v48 = v34;
      __int16 v49 = 2112;
      v50 = v37;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory existing baUUID: %@, new baUUID %@ for %@, %@", buf, 0x2Au);

      v14 = v36;
      v24 = v35;
      id v4 = v39;

      v22 = v40;
    }

    v38 = [(FMDBluetoothAccessory *)self baUUID];

    if (!v38) {
      [(FMDBluetoothAccessory *)self setBaUUID:v30];
    }
  }
}

- (void)updateBeaconsWithArray:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionary];
  v6 = [(FMDBluetoothAccessory *)self beacons];
  [v5 addEntriesFromDictionary:v6];

  unsigned int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_1000714DC;
  v11 = &unk_1002DBE60;
  double v12 = self;
  id v13 = v5;
  id v7 = v5;
  [v4 enumerateObjectsUsingBlock:&v8];

  -[FMDBluetoothAccessory setBeacons:](self, "setBeacons:", v7, v8, v9, v10, v11, v12);
}

- (void)updateAudioChannelsWithArray:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionary];
  v6 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  [v5 addEntriesFromDictionary:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100071744;
  v10[3] = &unk_1002DB968;
  id v7 = v5;
  id v11 = v7;
  [v4 enumerateObjectsUsingBlock:v10];

  [(FMDBluetoothAccessory *)self setAudioChannelInfo:v7];
  unsigned int v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(FMDBluetoothAccessory *)self audioChannelInfo];
    *(_DWORD *)buf = 134218242;
    id v13 = self;
    __int16 v14 = 2112;
    double v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updateWithAccessory audio channels: %@", buf, 0x16u);
  }
}

- (unint64_t)hash
{
  v2 = [(FMDBluetoothAccessory *)self accessoryIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (int64_t)connectionState
{
  v2 = [(FMDBluetoothAccessory *)self bluetoothManagerDevice];
  id v3 = [v2 bluetoothConnected];
  int64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)currentLastActiveTime
{
  id v3 = [(FMDBluetoothAccessory *)self bluetoothManagerDevice];
  int64_t v4 = [v3 bluetoothConnected];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = +[NSDate date];
    [(FMDBluetoothAccessory *)self setLastActiveTime:v6];
    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updated lastActiveTime", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    unsigned int v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) fetching cached lastActiveTime", (uint8_t *)&v10, 0xCu);
    }

    v6 = [(FMDBluetoothAccessory *)self lastActiveTime];
  }

  return v6;
}

- (id)lastDiscoveryDate
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = sub_100071AC4;
  id v11 = sub_100071AD4;
  id v12 = 0;
  v2 = [(FMDBluetoothAccessory *)self beacons];
  id v3 = [v2 allValues];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100071ADC;
  v6[3] = &unk_1002DBE88;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)shouldStopSoundNow
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  BOOL v12 = 0;
  id v3 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  BOOL v4 = [v3 count] == (id)2;

  BOOL v12 = v4;
  unsigned int v5 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  v6 = [v5 allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100071C64;
  v8[3] = &unk_1002DBEB0;
  v8[4] = &v9;
  [v6 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

- (BOOL)playingSound
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  id v3 = [v2 allValues];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100071E5C;
  v5[3] = &unk_1002DBEB0;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)audioSafetyStatusForAirPods:(id)a3 knownStatus:(unint64_t)a4
{
  uint64_t v5 = (uint64_t)[a3 inEar];
  unint64_t v6 = 1;
  if (a4 != 2) {
    unint64_t v6 = 2;
  }
  if (v5 == 500) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a4;
  }
  if (v5 != 2) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = 3;
  if (v5 != 1) {
    unint64_t v8 = a4;
  }
  if (!v5) {
    unint64_t v8 = 0;
  }
  if (v5 <= 1) {
    return v8;
  }
  else {
    return v6;
  }
}

- (unint64_t)audioSafetyStatusForStereoPair:(id)a3
{
  id v3 = (char *)[a3 onHeadStatus];
  if ((unint64_t)(v3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_10026A480[(void)(v3 - 1)];
  }
}

- (unint64_t)audioSafetyStatus
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v3 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  BOOL v4 = [v3 allValues];
  id v5 = [v4 copy];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100072150;
  v10[3] = &unk_1002DBED8;
  void v10[4] = self;
  v10[5] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];
  unint64_t v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v12[3];
    *(_DWORD *)buf = 134218240;
    double v16 = self;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) audioSafetyStatus: %lu ", buf, 0x16u);
  }

  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)nearby
{
  id v3 = [(FMDBluetoothAccessory *)self bluetoothManagerDevice];
  BOOL v4 = [v3 beacons];
  if ([v4 count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = (id)[(FMDBluetoothAccessory *)self connectionState] == (id)1;
  }

  return v5;
}

- (id)dictionaryValue
{
  id v3 = +[NSMutableDictionary dictionary];
  BOOL v4 = [(FMDBluetoothAccessory *)self bluetoothColorCode];
  [v3 setValue:v4 forKey:@"colorCode"];

  BOOL v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = [(FMDBluetoothAccessory *)self batteryInfo];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryValue];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v3 setValue:v5 forKey:@"batteryInfo"];

  return v3;
}

- (NSURL)audioURL
{
  v2 = [(FMDBluetoothAccessory *)self audioAsset];
  id v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (BOOL)updateAudioAsset:(id)a3
{
  return 1;
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSSet setWithArray:v4];
  unint64_t v6 = [(FMDBluetoothAccessory *)self playbackChannels];
  id v7 = +[NSSet setWithArray:v6];

  unsigned __int8 v8 = [v5 isEqualToSet:v7];
  [(FMDBluetoothAccessory *)self setPlaybackChannels:v4];
  [(FMDBluetoothAccessory *)self updateAudioChannelPlayingState:v4];

  uint64_t v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(FMDBluetoothAccessory *)self audioChannelInfo];
    int v12 = 134218242;
    long long v13 = self;
    __int16 v14 = 2112;
    long long v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) setting channels %@", (uint8_t *)&v12, 0x16u);
  }
  return v8 ^ 1;
}

- (void)updateAudioChannelPlayingState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  unint64_t v6 = [v5 allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007266C;
  v8[3] = &unk_1002DB968;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (unint64_t)category
{
  return 1;
}

- (FMDAudioAccessoryInfo)audioAccessoryInfo
{
  id v3 = objc_alloc((Class)FMDAudioAccessoryInfo);
  id v4 = [(FMDBluetoothAccessory *)self serialNumbers];
  BOOL v5 = [v4 systemSerialNumber];
  unint64_t v6 = [(FMDBluetoothAccessory *)self serialNumbers];
  id v7 = [v6 leftBudSerialNumber];
  unsigned __int8 v8 = [(FMDBluetoothAccessory *)self serialNumbers];
  id v9 = [v8 rightBudSerialNumber];
  id v10 = [v3 initWithSystemSerialNumber:v5 leftSerialNumber:v7 rightSerialNumber:v9];

  return (FMDAudioAccessoryInfo *)v10;
}

- (FMDBluetoothAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMDBluetoothAccessory *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("name");
    unsigned __int8 v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDBluetoothAccessory *)v5 setName:v8];

    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector("address");
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDBluetoothAccessory *)v5 setAddress:v11];

    uint64_t v12 = objc_opt_class();
    long long v13 = NSStringFromSelector("scoUID");
    __int16 v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDBluetoothAccessory *)v5 setScoUID:v14];

    uint64_t v15 = objc_opt_class();
    long long v16 = NSStringFromSelector("majorDeviceClass");
    __int16 v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    -[FMDBluetoothAccessory setMajorDeviceClass:](v5, "setMajorDeviceClass:", [v17 unsignedIntValue]);

    uint64_t v18 = objc_opt_class();
    double v19 = NSStringFromSelector("minorDeviceClass");
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    -[FMDBluetoothAccessory setMinorDeviceClass:](v5, "setMinorDeviceClass:", [v20 unsignedIntValue]);

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("deviceVendor");
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(FMDBluetoothAccessory *)v5 setDeviceVendor:v23];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector("deviceProductId");
    uint64_t v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(FMDBluetoothAccessory *)v5 setDeviceProductId:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector("serialNumber");
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    [(FMDBluetoothAccessory *)v5 setSerialNumber:v29];

    uint64_t v30 = objc_opt_class();
    id v31 = NSStringFromSelector("firmwareRevision");
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    [(FMDBluetoothAccessory *)v5 setFirmwareRevision:v32];

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector("hardwareRevision");
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    [(FMDBluetoothAccessory *)v5 setHardwareRevision:v35];

    id v36 = objc_alloc((Class)FMDAccessoryIdentifier);
    v37 = [(FMDBluetoothAccessory *)v5 address];
    id v38 = [v36 initWithAddress:v37];
    [(FMDBluetoothAccessory *)v5 setAccessoryIdentifier:v38];

    id v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumbers"];
    [(FMDBluetoothAccessory *)v5 setSerialNumbers:v39];

    uint64_t v40 = objc_opt_class();
    v41 = NSStringFromSelector("bluetoothColorCode");
    v42 = [v4 decodeObjectOfClass:v40 forKey:v41];
    [(FMDBluetoothAccessory *)v5 setBluetoothColorCode:v42];

    uint64_t v43 = objc_opt_class();
    v44 = NSStringFromSelector("styleDescriptor");
    __int16 v45 = [v4 decodeObjectOfClass:v43 forKey:v44];
    [(FMDBluetoothAccessory *)v5 setStyleDescriptor:v45];

    uint64_t v46 = objc_opt_class();
    __int16 v47 = NSStringFromSelector("lastActiveTime");
    v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    [(FMDBluetoothAccessory *)v5 setLastActiveTime:v48];

    uint64_t v49 = objc_opt_class();
    v50 = NSStringFromSelector("audioRoutingIdentifier");
    v51 = [v4 decodeObjectOfClass:v49 forKey:v50];
    [(FMDBluetoothAccessory *)v5 setAudioRoutingIdentifier:v51];

    uint64_t v52 = objc_opt_class();
    v53 = NSStringFromSelector("audioAsset");
    v54 = [v4 decodeObjectOfClass:v52 forKey:v53];
    [(FMDBluetoothAccessory *)v5 setAudioAsset:v54];

    uint64_t v55 = objc_opt_class();
    v56 = NSStringFromSelector("rssiUpdateDate");
    v57 = [v4 decodeObjectOfClass:v55 forKey:v56];
    [(FMDBluetoothAccessory *)v5 setRssiUpdateDate:v57];

    uint64_t v58 = objc_opt_class();
    v59 = NSStringFromSelector("accessoryRSSI");
    v60 = [v4 decodeObjectOfClass:v58 forKey:v59];
    [(FMDBluetoothAccessory *)v5 setAccessoryRSSI:v60];

    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    v72[2] = objc_opt_class();
    v72[3] = objc_opt_class();
    v61 = +[NSArray arrayWithObjects:v72 count:4];
    v62 = +[NSSet setWithArray:v61];
    v63 = [v4 decodeObjectOfClasses:v62 forKey:@"beaconsV2"];
    [(FMDBluetoothAccessory *)v5 setBeacons:v63];

    uint64_t v64 = objc_opt_class();
    v65 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v64, objc_opt_class(), 0);
    v66 = NSStringFromSelector("batteryInfo");
    v67 = [v4 decodeObjectOfClasses:v65 forKey:v66];
    [(FMDBluetoothAccessory *)v5 setBatteryInfo:v67];

    uint64_t v68 = objc_opt_class();
    v69 = NSStringFromSelector("baUUID");
    v70 = [v4 decodeObjectOfClass:v68 forKey:v69];
    [(FMDBluetoothAccessory *)v5 setBaUUID:v70];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMDBluetoothAccessory *)self name];
  uint64_t v6 = NSStringFromSelector("name");
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(FMDBluetoothAccessory *)self address];
  unsigned __int8 v8 = NSStringFromSelector("address");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDBluetoothAccessory *)self scoUID];
  id v10 = NSStringFromSelector("scoUID");
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = +[NSNumber numberWithUnsignedInt:[(FMDBluetoothAccessory *)self majorDeviceClass]];
  uint64_t v12 = NSStringFromSelector("majorDeviceClass");
  [v4 encodeObject:v11 forKey:v12];

  long long v13 = +[NSNumber numberWithUnsignedInt:[(FMDBluetoothAccessory *)self minorDeviceClass]];
  __int16 v14 = NSStringFromSelector("minorDeviceClass");
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(FMDBluetoothAccessory *)self deviceVendor];
  long long v16 = NSStringFromSelector("deviceVendor");
  [v4 encodeObject:v15 forKey:v16];

  __int16 v17 = [(FMDBluetoothAccessory *)self deviceProductId];
  uint64_t v18 = NSStringFromSelector("deviceProductId");
  [v4 encodeObject:v17 forKey:v18];

  id v45 = [(FMDBluetoothAccessory *)self currentLastActiveTime];
  double v19 = NSStringFromSelector("lastActiveTime");
  [v4 encodeObject:v45 forKey:v19];

  v20 = [(FMDBluetoothAccessory *)self serialNumber];
  uint64_t v21 = NSStringFromSelector("serialNumber");
  [v4 encodeObject:v20 forKey:v21];

  v22 = [(FMDBluetoothAccessory *)self firmwareRevision];
  v23 = NSStringFromSelector("firmwareRevision");
  [v4 encodeObject:v22 forKey:v23];

  uint64_t v24 = [(FMDBluetoothAccessory *)self hardwareRevision];
  v25 = NSStringFromSelector("hardwareRevision");
  [v4 encodeObject:v24 forKey:v25];

  uint64_t v26 = [(FMDBluetoothAccessory *)self serialNumbers];
  uint64_t v27 = NSStringFromSelector("serialNumbers");
  [v4 encodeObject:v26 forKey:v27];

  v28 = [(FMDBluetoothAccessory *)self bluetoothColorCode];
  v29 = NSStringFromSelector("bluetoothColorCode");
  [v4 encodeObject:v28 forKey:v29];

  uint64_t v30 = [(FMDBluetoothAccessory *)self styleDescriptor];
  id v31 = NSStringFromSelector("styleDescriptor");
  [v4 encodeObject:v30 forKey:v31];

  batteryInfo = self->_batteryInfo;
  uint64_t v33 = NSStringFromSelector("batteryInfo");
  [v4 encodeObject:batteryInfo forKey:v33];

  v34 = [(FMDBluetoothAccessory *)self audioRoutingIdentifier];
  v35 = NSStringFromSelector("audioRoutingIdentifier");
  [v4 encodeObject:v34 forKey:v35];

  id v36 = [(FMDBluetoothAccessory *)self audioAsset];
  v37 = NSStringFromSelector("audioAsset");
  [v4 encodeObject:v36 forKey:v37];

  id v38 = [(FMDBluetoothAccessory *)self accessoryRSSI];
  id v39 = NSStringFromSelector("accessoryRSSI");
  [v4 encodeObject:v38 forKey:v39];

  uint64_t v40 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
  v41 = NSStringFromSelector("rssiUpdateDate");
  [v4 encodeObject:v40 forKey:v41];

  v42 = [(FMDBluetoothAccessory *)self beacons];
  [v4 encodeObject:v42 forKey:@"beaconsV2"];

  uint64_t v43 = [(FMDBluetoothAccessory *)self baUUID];
  v44 = NSStringFromSelector("baUUID");
  [v4 encodeObject:v43 forKey:v44];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v3 = [(FMDBluetoothAccessory *)self name];
  id v4 = [(FMDBluetoothAccessory *)self address];
  BOOL v5 = [(FMDBluetoothAccessory *)self deviceVendor];
  id v6 = [v5 unsignedIntValue];
  id v7 = [(FMDBluetoothAccessory *)self deviceProductId];
  id v8 = [v7 unsignedIntValue];
  uint64_t v9 = [(FMDBluetoothAccessory *)self baUUID];
  id v10 = [v9 UUIDString];
  uint64_t v11 = +[NSString stringWithFormat:@"FMDAccessory(0x%lx) name - %@, signature - %@, deviceVendor - %d, deviceProductId - %d, baUUID - %@", self, v3, v4, v6, v8, v10];

  return (NSString *)v11;
}

- (id)deviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDBluetoothAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  BOOL v5 = [(FMDBluetoothAccessory *)self accessoryIdentifier];
  id v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDBluetoothAccessory *)self address];
  [v3 setValue:v7 forKey:@"deviceDiscoveryId"];

  id v8 = [(FMDBluetoothAccessory *)self connectionStatusString];
  [v3 setValue:v8 forKey:@"connectionStatus"];

  uint64_t v9 = [(FMDBluetoothAccessory *)self currentLastActiveTime];
  v57 = v9;
  if (v9)
  {
    id v10 = [NSNumber numberWithLongLong:[v9 fm_epoch]];
    [v3 setValue:v10 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2020 forKey:@"lastActiveTime"];
  }
  uint64_t v11 = [(FMDBluetoothAccessory *)self accessoryRSSI];
  [v3 fm_safeSetObject:v11 forKey:@"accessoryRSSI"];

  uint64_t v12 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
  if (v12)
  {
    long long v13 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
    __int16 v14 = [NSNumber numberWithLongLong:objc_msgSend(v13, "fm_epoch")];
    [v3 fm_safeSetObject:v14 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2020 forKey:@"accessoryRSSITimestamp"];
  }

  uint64_t v15 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v16 = [(FMDBluetoothAccessory *)self batteryInfo];
  id v17 = [v16 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v66 + 1) + 8 * i) dictionaryValue];
        [v15 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v18);
  }

  [v3 setValue:v15 forKey:@"batteryInfo"];
  v22 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v23 = [(FMDBluetoothAccessory *)self audioChannelInfo];
  uint64_t v24 = [v23 allValues];

  id v25 = [v24 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v63;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v63 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v62 + 1) + 8 * (void)j) dictionaryValue];
        [v22 addObject:v29];
      }
      id v26 = [v24 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v26);
  }

  [v3 setValue:v22 forKey:@"audioChannels"];
  uint64_t v30 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v31 = [(FMDBluetoothAccessory *)self beacons];
  v32 = [v31 allValues];

  id v33 = [v32 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v59;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v59 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)k) dictionaryValue];
        [v30 addObject:v37];
      }
      id v34 = [v32 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v34);
  }

  [v3 setValue:v30 forKey:@"beacons"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  id v38 = [(FMDBluetoothAccessory *)self firmwareRevision];
  [v3 fm_safeSetObject:v38 forKey:@"firmwareVersion"];

  id v39 = +[FMDSystemConfig sharedInstance];
  uint64_t v40 = [v39 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v40];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  v41 = [(FMDBluetoothAccessory *)self deviceVendor];
  id v42 = [v41 unsignedIntValue];
  uint64_t v43 = [(FMDBluetoothAccessory *)self deviceProductId];
  v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i_%i", v42, [v43 unsignedIntValue]);
  [v3 setObject:v44 forKeyedSubscript:@"productType"];

  id v45 = +[FMDSystemConfig sharedInstance];
  uint64_t v46 = [v45 platform];
  __int16 v47 = +[NSString stringWithFormat:@"%@_proxy", v46];

  [v3 fm_safelyMapKey:@"platform" toObject:v47];
  v48 = [(FMDBluetoothAccessory *)self otherDeviceInfo];
  [v3 fm_safeSetObject:v48 forKey:@"otherDevices"];

  uint64_t v49 = [(FMDBluetoothAccessory *)self serialNumbers];
  v50 = [v49 dictionaryValue];
  [v3 fm_safeSetObject:v50 forKey:@"serialNumbers"];

  v51 = [(FMDBluetoothAccessory *)self bluetoothColorCode];
  [v3 fm_safeSetObject:v51 forKey:@"colorCode"];

  uint64_t v52 = [(FMDBluetoothAccessory *)self styleDescriptor];
  v53 = [v52 dictionaryValue];
  [v3 fm_safeSetObject:v53 forKey:@"accessoryStyle"];

  v54 = [(FMDBluetoothAccessory *)self baUUID];
  uint64_t v55 = [v54 UUIDString];
  [v3 fm_safelyMapKey:@"baUUID" toObject:v55];

  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  v4[0] = @"connectionStatus";
  v4[1] = @"lastActiveTime";
  v4[2] = @"batteryInfo";
  v4[3] = @"accessoryRSSI";
  v4[4] = @"accessoryRSSITimestamp";
  v4[5] = @"beacons";
  v4[6] = @"firmwareVersion";
  v2 = +[NSArray arrayWithObjects:v4 count:7];

  return v2;
}

- (id)lastKnownLocationDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDBluetoothAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  BOOL v5 = [(FMDBluetoothAccessory *)self accessoryIdentifier];
  id v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDBluetoothAccessory *)self currentLastActiveTime];
  v44 = v7;
  if (v7)
  {
    id v8 = [NSNumber numberWithLongLong:objc_msgSend(v7, "fm_epoch")];
    [v3 setValue:v8 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2020 forKey:@"lastActiveTime"];
  }
  uint64_t v9 = [(FMDBluetoothAccessory *)self accessoryRSSI];
  [v3 fm_safeSetObject:v9 forKey:@"accessoryRSSI"];

  id v10 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
  if (v10)
  {
    uint64_t v11 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
    uint64_t v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 fm_epoch]);
    [v3 fm_safeSetObject:v12 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2020 forKey:@"accessoryRSSITimestamp"];
  }

  long long v13 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  __int16 v14 = [(FMDBluetoothAccessory *)self batteryInfo];
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryValue];
        [v13 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  [v3 setValue:v13 forKey:@"batteryInfo"];
  v20 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v21 = [(FMDBluetoothAccessory *)self beacons];
  v22 = [v21 allValues];

  id v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) dictionaryValue];
        [v20 addObject:v27];
      }
      id v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v24);
  }

  [v3 setValue:v20 forKey:@"beacons"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  v28 = [(FMDBluetoothAccessory *)self firmwareRevision];
  [v3 fm_safeSetObject:v28 forKey:@"firmwareVersion"];

  v29 = +[FMDSystemConfig sharedInstance];
  uint64_t v30 = [v29 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v30];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  id v31 = [(FMDBluetoothAccessory *)self deviceVendor];
  id v32 = [v31 unsignedIntValue];
  id v33 = [(FMDBluetoothAccessory *)self deviceProductId];
  id v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i_%i", v32, [v33 unsignedIntValue]);
  [v3 setObject:v34 forKeyedSubscript:@"productType"];

  uint64_t v35 = +[FMDSystemConfig sharedInstance];
  id v36 = [v35 platform];
  v37 = +[NSString stringWithFormat:@"%@_proxy", v36];

  [v3 fm_safelyMapKey:@"platform" toObject:v37];
  id v38 = [(FMDBluetoothAccessory *)self serialNumbers];
  id v39 = [v38 dictionaryValue];
  [v3 fm_safeSetObject:v39 forKey:@"serialNumbers"];

  uint64_t v40 = [(FMDBluetoothAccessory *)self bluetoothColorCode];
  [v3 fm_safeSetObject:v40 forKey:@"colorCode"];

  v41 = [(FMDBluetoothAccessory *)self styleDescriptor];
  id v42 = [v41 dictionaryValue];
  [v3 fm_safeSetObject:v42 forKey:@"accessoryStyle"];

  return v3;
}

- (id)deviceInfoForHostRegister
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(FMDBluetoothAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  BOOL v5 = [(FMDBluetoothAccessory *)self accessoryIdentifier];
  id v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDBluetoothAccessory *)self deviceVendor];
  id v8 = [v7 unsignedIntValue];
  uint64_t v9 = [(FMDBluetoothAccessory *)self deviceProductId];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i_%i", v8, [v9 unsignedIntValue]);
  [v3 setObject:v10 forKeyedSubscript:@"productType"];

  uint64_t v11 = [(FMDBluetoothAccessory *)self connectionStatusString];
  [v3 setValue:v11 forKey:@"connectionStatus"];

  uint64_t v12 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v13 = [(FMDBluetoothAccessory *)self beacons];
  __int16 v14 = [v13 allValues];

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
        uint64_t v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryValue];
        [v12 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  [v3 setValue:v12 forKey:@"beacons"];
  v20 = [(FMDBluetoothAccessory *)self currentLastActiveTime];
  uint64_t v21 = v20;
  if (v20)
  {
    v22 = [NSNumber numberWithLongLong:objc_msgSend(v20, "fm_epoch")];
    [v3 setValue:v22 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2020 forKey:@"lastActiveTime"];
  }
  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  id v23 = +[FMDSystemConfig sharedInstance];
  id v24 = [v23 platform];
  uint64_t v25 = +[NSString stringWithFormat:@"%@_proxy", v24];

  [v3 fm_safelyMapKey:@"platform" toObject:v25];
  id v26 = [(FMDBluetoothAccessory *)self accessoryRSSI];
  [v3 fm_safeSetObject:v26 forKey:@"accessoryRSSI"];

  uint64_t v27 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
  if (v27)
  {
    v28 = [(FMDBluetoothAccessory *)self rssiUpdateDate];
    v29 = [NSNumber numberWithLongLong:[v28 fm_epoch]];
    [v3 fm_safeSetObject:v29 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2020 forKey:@"accessoryRSSITimestamp"];
  }

  return v3;
}

- (id)otherDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[FMDSystemConfig sharedInstance];
  BOOL v5 = [v4 deviceName];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v5];

  id v6 = [(FMDBluetoothAccessory *)self currentLastActiveTime];
  id v7 = v6;
  if (v6)
  {
    id v8 = [NSNumber numberWithLongLong:objc_msgSend(v6, "fm_epoch")];
    [v3 setValue:v8 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F2020 forKey:@"lastActiveTime"];
  }
  uint64_t v9 = +[FMDSystemConfig sharedInstance];
  id v10 = [v9 deviceClassString];
  [v3 fm_safelyMapKey:@"deviceClass" toObject:v10];

  uint64_t v11 = +[FMDSystemConfig sharedInstance];
  uint64_t v12 = [v11 platform];
  [v3 fm_safelyMapKey:@"platform" toObject:v12];

  long long v13 = +[FMDSystemConfig sharedInstance];
  __int16 v14 = [v13 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v14];

  id v15 = +[FMDSystemConfig sharedInstance];
  id v16 = [v15 productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v16];

  uint64_t v19 = v3;
  uint64_t v17 = +[NSArray arrayWithObjects:&v19 count:1];

  return v17;
}

- (id)connectionStatusString
{
  unint64_t v2 = [(FMDBluetoothAccessory *)self connectionState];
  if (v2 > 2) {
    return 0;
  }
  else {
    return *(&off_1002DBEF8 + v2);
  }
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
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

- (NSString)audioRoutingIdentifier
{
  return self->_audioRoutingIdentifier;
}

- (void)setAudioRoutingIdentifier:(id)a3
{
}

- (FMDAsset)audioAsset
{
  return self->_audioAsset;
}

- (void)setAudioAsset:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastActiveTime:(id)a3
{
}

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
}

- (FMDBluetoothManagerDevice)bluetoothManagerDevice
{
  return self->_bluetoothManagerDevice;
}

- (void)setBluetoothManagerDevice:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (void)setFirmwareRevision:(id)a3
{
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
}

- (NSNumber)accessoryRSSI
{
  return self->_accessoryRSSI;
}

- (void)setAccessoryRSSI:(id)a3
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

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
}

- (FMDAccessorySerialNumbers)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
}

- (NSDictionary)beacons
{
  return self->_beacons;
}

- (void)setBeacons:(id)a3
{
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandContext, 0);
  objc_storeStrong((id *)&self->_beacons, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_rssiUpdateDate, 0);
  objc_storeStrong((id *)&self->_accessoryRSSI, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_scoUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);
  objc_storeStrong((id *)&self->_deviceVendor, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end