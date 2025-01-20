@interface FMDExtAccessory
+ (BOOL)supportsSecureCoding;
+ (id)volatileKeysToExcludeFromRegisterDigest;
- (BOOL)accessoryInfoChanged:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)nearby;
- (BOOL)updateComponnentsAvailability:(id)a3;
- (BOOL)updatePlaybackChannels:(id)a3;
- (BOOL)updateWithBeaconingIdentifier:(id)a3;
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (FMDCommandContext)commandContext;
- (FMDExtAccessory)initWithCoder:(id)a3;
- (FMDExtAccessory)initWithExtAccessoryInfo:(id)a3;
- (NSArray)playbackChannels;
- (NSDate)lastActiveTime;
- (NSDate)lastStatusUpdateTime;
- (NSDictionary)additionalInfo;
- (NSDictionary)audioChannelInfo;
- (NSDictionary)batteryInfo;
- (NSDictionary)serialNumbers;
- (NSString)accessoryType;
- (NSString)address;
- (NSString)description;
- (NSString)extensionId;
- (NSString)firmwareVersion;
- (NSString)name;
- (NSString)style;
- (NSUUID)baUUID;
- (id)connectionStatusString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceInfo;
- (id)deviceInfoForHostRegister;
- (id)lastKnownLocationDeviceInfo;
- (id)otherDeviceInfo;
- (int64_t)connectionState;
- (unint64_t)category;
- (unint64_t)hash;
- (void)_updateAudioChannelPlayingState:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAudioChannelInfo:(id)a3;
- (void)setBaUUID:(id)a3;
- (void)setBatteryInfo:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setExtensionId:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setLastActiveTime:(id)a3;
- (void)setLastDiscoveryDate:(id)a3;
- (void)setLastStatusUpdateTime:(id)a3;
- (void)setName:(id)a3;
- (void)setPlaybackChannels:(id)a3;
- (void)setSerialNumbers:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateWithAccessory:(id)a3;
@end

@implementation FMDExtAccessory

- (FMDExtAccessory)initWithExtAccessoryInfo:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FMDExtAccessory;
  v5 = [(FMDExtAccessory *)&v28 init];
  if (v5)
  {
    v6 = sub_100059878();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDExtAccessory initWithExtAccessoryInfo %@", buf, 0xCu);
    }

    uint64_t v7 = [v4 deviceDiscoveryId];
    address = v5->_address;
    v5->_address = (NSString *)v7;

    id v9 = objc_alloc((Class)FMDAccessoryIdentifier);
    v10 = [v4 accessoryIdentifier];
    v11 = (FMDAccessoryIdentifier *)[v9 initWithString:v10];
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = v11;

    uint64_t v13 = [v4 accessoryType];
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v13;

    uint64_t v15 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    uint64_t v17 = [v4 serialNumbers];
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = (NSDictionary *)v17;

    uint64_t v19 = [v4 firmwareVersion];
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v19;

    uint64_t v21 = [v4 additionalInfo];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v21;

    v23 = [[FMDCommandContext alloc] initWithAccessory:v5];
    commandContext = v5->_commandContext;
    v5->_commandContext = v23;

    style = v5->_style;
    v5->_style = (NSString *)@"-1";

    batteryInfo = v5->_batteryInfo;
    v5->_batteryInfo = (NSDictionary *)&off_1002F3290;
  }
  return v5;
}

- (void)updateWithAccessory:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = self;
    uint64_t v7 = [(FMDExtAccessory *)v6 accessoryIdentifier];
    v8 = [v5 accessoryIdentifier];
    if ([v7 isEqual:v8])
    {
      id v9 = [(FMDExtAccessory *)v6 accessoryType];
      v10 = [v5 accessoryType];
      unsigned int v11 = [v9 isEqualToString:v10];

      if (v11)
      {
        v12 = [v5 lastActiveTime];
        [v12 timeIntervalSinceReferenceDate];
        double v14 = v13;
        uint64_t v15 = [(FMDExtAccessory *)v6 lastActiveTime];
        [v15 timeIntervalSinceReferenceDate];
        double v17 = v16;

        if (v14 > v17) {
          [(FMDExtAccessory *)v6 setLastActiveTime:v12];
        }
        v18 = [v5 lastStatusUpdateTime];
        [v18 timeIntervalSinceReferenceDate];
        double v20 = v19;
        uint64_t v21 = [(FMDExtAccessory *)v6 lastStatusUpdateTime];
        [v21 timeIntervalSinceReferenceDate];
        double v23 = v22;

        if (v20 > v23) {
          [(FMDExtAccessory *)v6 setLastStatusUpdateTime:v18];
        }
        v24 = [(FMDExtAccessory *)v6 style];

        if (!v24)
        {
          v25 = [v5 style];
          [(FMDExtAccessory *)v6 setStyle:v25];
        }
        v26 = [(FMDExtAccessory *)v6 name];

        if (!v26)
        {
          v27 = [v5 name];
          [(FMDExtAccessory *)v6 setName:v27];
        }
        objc_super v28 = [(FMDExtAccessory *)v6 firmwareVersion];

        if (!v28)
        {
          v29 = [v5 firmwareVersion];
          [(FMDExtAccessory *)v6 setFirmwareVersion:v29];
        }
        id v30 = [(FMDExtAccessory *)v6 serialNumbers];

        if (!v30)
        {
          v31 = [v5 serialNumbers];
          [(FMDExtAccessory *)v6 setSerialNumbers:v31];
        }
        v32 = [v5 baUUID];
        v33 = sub_100004238();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          [v32 UUIDString];
          v34 = v40 = v18;
          v35 = [(FMDExtAccessory *)v6 baUUID];
          v36 = [v5 name];
          v37 = [v5 address];
          *(_DWORD *)buf = 138413058;
          id v42 = v34;
          __int16 v43 = 2112;
          v44 = v35;
          __int16 v45 = 2112;
          v46 = v36;
          __int16 v47 = 2112;
          v48 = v37;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "FMDExtAccessory existing baUUID: %@, new baUUID %@ for %@, %@", buf, 0x2Au);

          v18 = v40;
        }

        v38 = [(FMDExtAccessory *)v6 baUUID];

        if (!v38) {
          [(FMDExtAccessory *)v6 setBaUUID:v32];
        }
        v39 = [v5 playbackChannels];
        [(FMDExtAccessory *)v6 updatePlaybackChannels:v39];

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
    }
    v12 = sub_100059878();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "got invalid accessory %@", buf, 0xCu);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithArray:v4];
  v6 = [(FMDExtAccessory *)self playbackChannels];
  uint64_t v7 = +[NSSet setWithArray:v6];

  unsigned __int8 v8 = [v5 isEqualToSet:v7];
  [(FMDExtAccessory *)self setPlaybackChannels:v4];
  [(FMDExtAccessory *)self _updateAudioChannelPlayingState:v4];

  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10023FB38(self, v9);
  }

  return v8 ^ 1;
}

- (BOOL)updateComponnentsAvailability:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(FMDExtAccessory *)self audioChannelInfo];
  v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v13 = [v12 channelName];
        unsigned int v14 = [v4 containsObject:v13];

        if ([v12 availability] != (id)v14)
        {
          [v12 setAvailability:v14];
          char v9 = 1;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)_updateAudioChannelPlayingState:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDExtAccessory *)self audioChannelInfo];
  v6 = [v5 allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063E70;
  v8[3] = &unk_1002DB968;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (unint64_t)hash
{
  v2 = [(FMDExtAccessory *)self accessoryIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (int64_t)connectionState
{
  id v3 = +[FMDExtConfigurationRegistry sharedInstance];
  id v4 = [(FMDExtAccessory *)self accessoryType];
  id v5 = [v3 configForAccessoryType:v4];

  v6 = [v5 flavorForFeature:@"connection"];
  if (v6)
  {
    id v7 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"connection" flavor:v6];
    if (!v7)
    {
      int64_t v18 = 0;
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_1000643A8;
    v38 = sub_1000643B8;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    id v9 = sub_100059878();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start for connection status", buf, 2u);
    }

    uint64_t v10 = [(FMDExtAccessory *)self accessoryIdentifier];
    unsigned int v11 = [v10 stringValue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000643C0;
    v26[3] = &unk_1002DB990;
    objc_super v28 = &v34;
    v29 = &v30;
    v12 = v8;
    v27 = v12;
    [v7 connectionStatusForAccessory:v11 withCompletion:v26];

    [v5 timeoutForFeature:@"connection"];
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    intptr_t v15 = dispatch_group_wait(v12, v14);
    if (v15 || v35[5])
    {
      p_super = sub_100059878();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v24 = [(FMDExtAccessory *)self name];
        uint64_t v25 = v35[5];
        *(_DWORD *)buf = 138412802;
        v41 = v24;
        __int16 v42 = 2048;
        intptr_t v43 = v15;
        __int16 v44 = 2112;
        uint64_t v45 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%@ connection status failed timeout %ld error %@", buf, 0x20u);
      }
      int v17 = 1;
    }
    else
    {
      double v20 = sub_100059878();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(FMDExtAccessory *)self name];
        int v22 = *((unsigned __int8 *)v31 + 24);
        *(_DWORD *)buf = 138412546;
        v41 = v21;
        __int16 v42 = 1024;
        LODWORD(v43) = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ connection status success %d", buf, 0x12u);
      }
      if (!*((unsigned char *)v31 + 24))
      {
        int v17 = 0;
        int64_t v18 = 0;
LABEL_11:

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v34, 8);

        if (v17) {
          int64_t v18 = 0;
        }
        goto LABEL_16;
      }
      double v23 = +[NSDate date];
      int v17 = 0;
      p_super = &self->_lastActiveTime->super;
      self->_lastActiveTime = v23;
    }

    int64_t v18 = 1;
    goto LABEL_11;
  }
  int64_t v18 = 0;
LABEL_17:

  return v18;
}

- (BOOL)nearby
{
  id v3 = sub_100059878();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10023FBD0(v3);
  }

  return (id)[(FMDExtAccessory *)self connectionState] == (id)1;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 1;
}

- (unint64_t)category
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[FMDExtAccessory allocWithZone:a3] init];
  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  [(FMDExtAccessory *)v4 setAccessoryIdentifier:v5];

  v6 = [(FMDExtAccessory *)self accessoryType];
  [(FMDExtAccessory *)v4 setAccessoryType:v6];

  id v7 = [(FMDExtAccessory *)self name];
  [(FMDExtAccessory *)v4 setName:v7];

  id v8 = [(FMDExtAccessory *)self firmwareVersion];
  [(FMDExtAccessory *)v4 setFirmwareVersion:v8];

  id v9 = [(FMDExtAccessory *)self address];
  [(FMDExtAccessory *)v4 setAddress:v9];

  uint64_t v10 = [(FMDExtAccessory *)self extensionId];
  [(FMDExtAccessory *)v4 setExtensionId:v10];

  unsigned int v11 = [(FMDExtAccessory *)self serialNumbers];
  [(FMDExtAccessory *)v4 setSerialNumbers:v11];

  v12 = [(FMDExtAccessory *)self additionalInfo];
  [(FMDExtAccessory *)v4 setAdditionalInfo:v12];

  double v13 = [(FMDExtAccessory *)self additionalInfo];
  [(FMDExtAccessory *)v4 setBatteryInfo:v13];

  dispatch_time_t v14 = [(FMDExtAccessory *)self lastActiveTime];
  [(FMDExtAccessory *)v4 setLastActiveTime:v14];

  intptr_t v15 = [(FMDExtAccessory *)self lastStatusUpdateTime];
  [(FMDExtAccessory *)v4 setLastStatusUpdateTime:v15];

  long long v16 = [(FMDExtAccessory *)self lastDiscoveryDate];
  [(FMDExtAccessory *)v4 setLastDiscoveryDate:v16];

  int v17 = [(FMDExtAccessory *)self style];
  [(FMDExtAccessory *)v4 setStyle:v17];

  int64_t v18 = [(FMDExtAccessory *)self baUUID];
  [(FMDExtAccessory *)v4 setBaUUID:v18];

  long long v19 = [(FMDExtAccessory *)self commandContext];
  [(FMDExtAccessory *)v4 setCommandContext:v19];

  double v20 = [(FMDExtAccessory *)self playbackChannels];
  [(FMDExtAccessory *)v4 setPlaybackChannels:v20];

  uint64_t v21 = [(FMDExtAccessory *)self audioChannelInfo];
  [(FMDExtAccessory *)v4 setAudioChannelInfo:v21];

  return v4;
}

- (FMDExtAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDExtAccessory *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("accessoryIdentifier");
    id v8 = [v4 decodeObjectOfClass:v6 forKey:v7];

    id v9 = (FMDAccessoryIdentifier *)[objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v8];
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = v9;

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector("accessoryType");
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    long long v16 = NSStringFromSelector("name");
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    name = v5->_name;
    v5->_name = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    double v20 = NSStringFromSelector("firmwareVersion");
    uint64_t v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector("address");
    uint64_t v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
    address = v5->_address;
    v5->_address = (NSString *)v25;

    uint64_t v27 = objc_opt_class();
    objc_super v28 = NSStringFromSelector("extensionId");
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    extensionId = v5->_extensionId;
    v5->_extensionId = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    char v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    uint64_t v34 = NSStringFromSelector("serialNumber");
    uint64_t v35 = [v4 decodeObjectOfClasses:v33 forKey:v34];
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = (NSDictionary *)v35;

    v37 = NSStringFromSelector("additionalInfo");
    uint64_t v38 = [v4 decodeObjectOfClasses:v33 forKey:v37];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v38;

    v40 = NSStringFromSelector("batteryInfo");
    uint64_t v41 = [v4 decodeObjectOfClasses:v33 forKey:v40];
    batteryInfo = v5->_batteryInfo;
    v5->_batteryInfo = (NSDictionary *)v41;

    uint64_t v43 = objc_opt_class();
    __int16 v44 = NSStringFromSelector("style");
    uint64_t v45 = [v4 decodeObjectOfClass:v43 forKey:v44];
    style = v5->_style;
    v5->_style = (NSString *)v45;

    uint64_t v47 = objc_opt_class();
    v48 = NSStringFromSelector("lastActiveTime");
    uint64_t v49 = [v4 decodeObjectOfClass:v47 forKey:v48];
    lastActiveTime = v5->_lastActiveTime;
    v5->_lastActiveTime = (NSDate *)v49;

    uint64_t v51 = objc_opt_class();
    v52 = NSStringFromSelector("lastStatusUpdateTime");
    uint64_t v53 = [v4 decodeObjectOfClass:v51 forKey:v52];
    lastStatusUpdateTime = v5->_lastStatusUpdateTime;
    v5->_lastStatusUpdateTime = (NSDate *)v53;

    uint64_t v55 = objc_opt_class();
    v56 = NSStringFromSelector("lastDiscoveryDate");
    uint64_t v57 = [v4 decodeObjectOfClass:v55 forKey:v56];
    lastDiscoveryDate = v5->_lastDiscoveryDate;
    v5->_lastDiscoveryDate = (NSDate *)v57;

    uint64_t v59 = objc_opt_class();
    v60 = NSStringFromSelector("baUUID");
    uint64_t v61 = [v4 decodeObjectOfClass:v59 forKey:v60];
    baUUID = v5->_baUUID;
    v5->_baUUID = (NSUUID *)v61;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  id v7 = NSStringFromSelector("accessoryIdentifier");
  [v4 encodeObject:v6 forKey:v7];

  id v8 = [(FMDExtAccessory *)self accessoryType];
  id v9 = NSStringFromSelector("accessoryType");
  [v4 encodeObject:v8 forKey:v9];

  uint64_t v10 = [(FMDExtAccessory *)self name];
  uint64_t v11 = NSStringFromSelector("name");
  [v4 encodeObject:v10 forKey:v11];

  v12 = [(FMDExtAccessory *)self firmwareVersion];
  uint64_t v13 = NSStringFromSelector("firmwareVersion");
  [v4 encodeObject:v12 forKey:v13];

  dispatch_time_t v14 = [(FMDExtAccessory *)self address];
  uint64_t v15 = NSStringFromSelector("address");
  [v4 encodeObject:v14 forKey:v15];

  long long v16 = [(FMDExtAccessory *)self extensionId];
  uint64_t v17 = NSStringFromSelector("extensionId");
  [v4 encodeObject:v16 forKey:v17];

  int64_t v18 = [(FMDExtAccessory *)self serialNumbers];
  uint64_t v19 = NSStringFromSelector("serialNumbers");
  [v4 encodeObject:v18 forKey:v19];

  double v20 = [(FMDExtAccessory *)self additionalInfo];
  uint64_t v21 = NSStringFromSelector("additionalInfo");
  [v4 encodeObject:v20 forKey:v21];

  int v22 = [(FMDExtAccessory *)self batteryInfo];
  uint64_t v23 = NSStringFromSelector("batteryInfo");
  [v4 encodeObject:v22 forKey:v23];

  v24 = [(FMDExtAccessory *)self lastActiveTime];
  uint64_t v25 = NSStringFromSelector("lastActiveTime");
  [v4 encodeObject:v24 forKey:v25];

  v26 = [(FMDExtAccessory *)self lastStatusUpdateTime];
  uint64_t v27 = NSStringFromSelector("lastStatusUpdateTime");
  [v4 encodeObject:v26 forKey:v27];

  objc_super v28 = [(FMDExtAccessory *)self lastDiscoveryDate];
  uint64_t v29 = NSStringFromSelector("lastDiscoveryDate");
  [v4 encodeObject:v28 forKey:v29];

  uint64_t v30 = [(FMDExtAccessory *)self style];
  uint64_t v31 = NSStringFromSelector("style");
  [v4 encodeObject:v30 forKey:v31];

  id v33 = [(FMDExtAccessory *)self baUUID];
  uint64_t v32 = NSStringFromSelector("baUUID");
  [v4 encodeObject:v33 forKey:v32];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v3 = [(FMDExtAccessory *)self name];
  id v4 = [(FMDExtAccessory *)self address];
  id v5 = [(FMDExtAccessory *)self accessoryType];
  uint64_t v6 = [(FMDExtAccessory *)self baUUID];
  id v7 = [v6 UUIDString];
  id v8 = +[NSString stringWithFormat:@"FMDAccessory(0x%lx) name - %@, signature - %@, accessoryType - %@, baUUID - %@", self, v3, v4, v5, v7];

  return (NSString *)v8;
}

- (id)deviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDExtAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDExtAccessory *)self address];
  [v3 setValue:v7 forKey:@"deviceDiscoveryId"];

  id v8 = [(FMDExtAccessory *)self connectionStatusString];
  [v3 setValue:v8 forKey:@"connectionStatus"];

  uint64_t v9 = [(FMDExtAccessory *)self additionalInfo];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(FMDExtAccessory *)self additionalInfo];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [(FMDExtAccessory *)self additionalInfo];
      [v3 addEntriesFromDictionary:v13];
    }
  }
  dispatch_time_t v14 = [(FMDExtAccessory *)self lastActiveTime];
  uint64_t v15 = v14;
  if (v14)
  {
    long long v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 fm_epoch]);
    [v3 setValue:v16 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FD8 forKey:@"lastActiveTime"];
  }
  uint64_t v17 = [(FMDExtAccessory *)self lastStatusUpdateTime];
  if (v17)
  {
    int64_t v18 = [(FMDExtAccessory *)self lastStatusUpdateTime];
    uint64_t v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 fm_epoch]);
    [v3 fm_safeSetObject:v19 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F1FD8 forKey:@"accessoryRSSITimestamp"];
  }

  double v20 = [(FMDExtAccessory *)self batteryInfo];
  [v3 setValue:v20 forKey:@"batteryInfo"];

  uint64_t v21 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v22 = [(FMDExtAccessory *)self audioChannelInfo];
  uint64_t v23 = [v22 allValues];

  id v24 = [v23 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        objc_super v28 = [*(id *)(*((void *)&v48 + 1) + 8 * i) dictionaryValue];
        [v21 addObject:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v25);
  }

  [v3 setValue:v21 forKey:@"audioChannels"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  uint64_t v29 = [(FMDExtAccessory *)self firmwareVersion];
  [v3 fm_safeSetObject:v29 forKey:@"firmwareVersion"];

  uint64_t v30 = +[FMDSystemConfig sharedInstance];
  uint64_t v31 = [v30 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v31];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  uint64_t v32 = [(FMDExtAccessory *)self accessoryType];
  id v33 = +[NSString stringWithFormat:@"%@", v32];
  [v3 setObject:v33 forKeyedSubscript:@"productType"];

  uint64_t v34 = +[FMDExtConfigurationRegistry sharedInstance];
  uint64_t v35 = [(FMDExtAccessory *)self accessoryType];
  uint64_t v36 = [v34 configForAccessoryType:v35];

  v37 = [v36 version];
  [v3 setObject:v37 forKeyedSubscript:@"cachedConfigVersion"];

  uint64_t v38 = +[FMDSystemConfig sharedInstance];
  id v39 = [v38 platform];
  v40 = +[NSString stringWithFormat:@"%@_proxy", v39];

  [v3 fm_safelyMapKey:@"platform" toObject:v40];
  uint64_t v41 = [(FMDExtAccessory *)self otherDeviceInfo];
  [v3 fm_safeSetObject:v41 forKey:@"otherDevices"];

  __int16 v42 = [(FMDExtAccessory *)self serialNumbers];
  [v3 fm_safeSetObject:v42 forKey:@"serialNumbers"];

  uint64_t v43 = [(FMDExtAccessory *)self style];
  [v3 fm_safeSetObject:v43 forKey:@"deviceColor"];

  __int16 v44 = [(FMDExtAccessory *)self baUUID];
  uint64_t v45 = [v44 UUIDString];
  [v3 fm_safelyMapKey:@"baUUID" toObject:v45];

  v46 = sub_100059878();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = v3;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "device Info = %@", buf, 0xCu);
  }

  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  v4[0] = @"connectionStatus";
  v4[1] = @"lastActiveTime";
  v4[2] = @"batteryInfo";
  v4[3] = @"accessoryRSSI";
  v4[4] = @"accessoryRSSITimestamp";
  v4[5] = @"firmwareVersion";
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (id)lastKnownLocationDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDExtAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDExtAccessory *)self lastActiveTime];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 fm_epoch]);
    [v3 setValue:v9 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FD8 forKey:@"lastActiveTime"];
  }
  uint64_t v10 = [(FMDExtAccessory *)self lastStatusUpdateTime];
  if (v10)
  {
    uint64_t v11 = [(FMDExtAccessory *)self lastStatusUpdateTime];
    id v12 = [NSNumber numberWithLongLong:[v11 fm_epoch]];
    [v3 fm_safeSetObject:v12 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F1FD8 forKey:@"accessoryRSSITimestamp"];
  }

  uint64_t v13 = [(FMDExtAccessory *)self batteryInfo];
  [v3 setValue:v13 forKey:@"batteryInfo"];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  dispatch_time_t v14 = [(FMDExtAccessory *)self firmwareVersion];
  [v3 fm_safeSetObject:v14 forKey:@"firmwareVersion"];

  uint64_t v15 = +[FMDSystemConfig sharedInstance];
  long long v16 = [v15 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v16];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  uint64_t v17 = [(FMDExtAccessory *)self accessoryType];
  int64_t v18 = +[NSString stringWithFormat:@"%@", v17];
  [v3 setObject:v18 forKeyedSubscript:@"productType"];

  uint64_t v19 = +[FMDSystemConfig sharedInstance];
  double v20 = [v19 platform];
  uint64_t v21 = +[NSString stringWithFormat:@"%@_proxy", v20];

  [v3 fm_safelyMapKey:@"platform" toObject:v21];
  int v22 = [(FMDExtAccessory *)self serialNumbers];
  [v3 fm_safeSetObject:v22 forKey:@"serialNumbers"];

  uint64_t v23 = [(FMDExtAccessory *)self style];
  [v3 fm_safeSetObject:v23 forKey:@"deviceColor"];

  return v3;
}

- (id)deviceInfoForHostRegister
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(FMDExtAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  id v7 = [(FMDExtAccessory *)self accessoryType];
  id v8 = +[NSString stringWithFormat:@"%@", v7];
  [v3 setObject:v8 forKeyedSubscript:@"productType"];

  uint64_t v9 = [(FMDExtAccessory *)self connectionStatusString];
  [v3 setValue:v9 forKey:@"connectionStatus"];

  uint64_t v10 = [(FMDExtAccessory *)self lastActiveTime];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [NSNumber numberWithLongLong:objc_msgSend(v10, "fm_epoch")];
    [v3 setValue:v12 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FD8 forKey:@"lastActiveTime"];
  }
  uint64_t v13 = [(FMDExtAccessory *)self lastStatusUpdateTime];
  if (v13)
  {
    dispatch_time_t v14 = [(FMDExtAccessory *)self lastStatusUpdateTime];
    uint64_t v15 = [NSNumber numberWithLongLong:][v14 fm_epoch];
    [v3 fm_safeSetObject:v15 forKey:@"accessoryRSSITimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F1FD8 forKey:@"accessoryRSSITimestamp"];
  }

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  long long v16 = +[FMDSystemConfig sharedInstance];
  uint64_t v17 = [v16 platform];
  int64_t v18 = +[NSString stringWithFormat:@"%@_proxy", v17];

  [v3 fm_safelyMapKey:@"platform" toObject:v18];

  return v3;
}

- (id)otherDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[FMDSystemConfig sharedInstance];
  id v5 = [v4 deviceName];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v5];

  uint64_t v6 = [(FMDExtAccessory *)self lastActiveTime];
  id v7 = v6;
  if (v6)
  {
    id v8 = [NSNumber numberWithLongLong:objc_msgSend(v6, "fm_epoch")];
    [v3 setValue:v8 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FD8 forKey:@"lastActiveTime"];
  }
  uint64_t v9 = +[FMDSystemConfig sharedInstance];
  uint64_t v10 = [v9 deviceClassString];
  [v3 fm_safelyMapKey:@"deviceClass" toObject:v10];

  uint64_t v11 = +[FMDSystemConfig sharedInstance];
  id v12 = [v11 platform];
  [v3 fm_safelyMapKey:@"platform" toObject:v12];

  uint64_t v13 = +[FMDSystemConfig sharedInstance];
  dispatch_time_t v14 = [v13 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v14];

  uint64_t v15 = +[FMDSystemConfig sharedInstance];
  long long v16 = [v15 productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v16];

  uint64_t v19 = v3;
  uint64_t v17 = +[NSArray arrayWithObjects:&v19 count:1];

  return v17;
}

- (id)connectionStatusString
{
  unint64_t v2 = [(FMDExtAccessory *)self connectionState];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1002DB9B0[v2];
  }
}

- (BOOL)accessoryInfoChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDExtAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v4 accessoryIdentifier];
  if (([v5 isEqual:v6] & 1) == 0)
  {

    goto LABEL_12;
  }
  id v7 = [(FMDExtAccessory *)self accessoryType];
  id v8 = [v4 accessoryType];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (!v9)
  {
LABEL_12:
    uint64_t v19 = sub_100059878();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10023FC14(v19);
    }

    goto LABEL_18;
  }
  uint64_t v10 = [(FMDExtAccessory *)self name];
  uint64_t v11 = [v4 name];
  if (([v10 isEqualToString:v11] & 1) == 0)
  {
LABEL_17:

    goto LABEL_18;
  }
  id v12 = [(FMDExtAccessory *)self firmwareVersion];
  uint64_t v13 = [v4 firmwareVersion];
  if (![v12 isEqualToString:v13])
  {
LABEL_16:

    goto LABEL_17;
  }
  dispatch_time_t v14 = [(FMDExtAccessory *)self serialNumbers];
  uint64_t v15 = [v4 serialNumbers];
  if (![v14 isEqualToDictionary:v15])
  {

    goto LABEL_16;
  }
  long long v16 = [(FMDExtAccessory *)self address];
  uint64_t v17 = [v4 address];
  unsigned int v31 = [v16 isEqualToString:v17];

  if (!v31) {
    goto LABEL_18;
  }
  uint64_t v10 = [(FMDExtAccessory *)self baUUID];
  if (!v10)
  {
    int v18 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = [v4 baUUID];
  if (!v11)
  {
    int v18 = 0;
    goto LABEL_22;
  }
  id v12 = [(FMDExtAccessory *)self baUUID];
  uint64_t v13 = [v4 baUUID];
  if (([v12 isEqual:v13] & 1) == 0) {
    goto LABEL_16;
  }
  int v18 = 1;
LABEL_22:
  int v22 = [(FMDExtAccessory *)self baUUID];
  if (!v22)
  {
    id v25 = [v4 baUUID];
    if (v25)
    {
      BOOL v24 = 1;
      goto LABEL_31;
    }
  }
  uint64_t v23 = [v4 baUUID];
  if (v23)
  {

    BOOL v24 = 0;
    if (v22) {
      goto LABEL_25;
    }
LABEL_30:
    id v25 = 0;
LABEL_31:

    if ((v18 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  uint64_t v26 = [(FMDExtAccessory *)self baUUID];
  BOOL v24 = v26 != 0;

  if (!v22) {
    goto LABEL_30;
  }
LABEL_25:

  if (v18)
  {
LABEL_32:
  }
LABEL_33:
  if (v10) {

  }
  if (!v24)
  {
    uint64_t v27 = [(FMDExtAccessory *)self additionalInfo];
    if (v27 || ([v4 additionalInfo], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v28 = [(FMDExtAccessory *)self additionalInfo];
      uint64_t v29 = [v4 additionalInfo];
      unsigned __int8 v30 = [v28 isEqualToDictionary:v29];

      if (v27)
      {
LABEL_42:

        char v20 = v30 ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      unsigned __int8 v30 = 1;
    }

    goto LABEL_42;
  }
LABEL_18:
  char v20 = 1;
LABEL_19:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FMDExtAccessory *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v5 = v4;
  if ([(FMDExtAccessory *)self accessoryInfoChanged:v5]
    || ([(FMDExtAccessory *)self style], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_8;
  }
  id v7 = (void *)v6;
  id v8 = [(FMDExtAccessory *)self style];
  unsigned int v9 = [(FMDExtAccessory *)v5 style];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
LABEL_6:
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)extensionId
{
  return self->_extensionId;
}

- (void)setExtensionId:(id)a3
{
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
}

- (void)setLastDiscoveryDate:(id)a3
{
}

- (NSDate)lastStatusUpdateTime
{
  return self->_lastStatusUpdateTime;
}

- (void)setLastStatusUpdateTime:(id)a3
{
}

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSDictionary)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
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
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_lastStatusUpdateTime, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_extensionId, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end