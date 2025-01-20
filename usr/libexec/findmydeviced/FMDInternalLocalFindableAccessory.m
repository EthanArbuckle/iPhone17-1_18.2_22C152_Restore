@interface FMDInternalLocalFindableAccessory
+ (BOOL)supportsSecureCoding;
+ (id)volatileKeysToExcludeFromRegisterDigest;
- (BOOL)isConnected;
- (BOOL)nearby;
- (BOOL)updateWithBeaconingIdentifier:(id)a3;
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (FMDCommandContext)commandContext;
- (FMDInternalLocalFindableAccessory)initWithCoder:(id)a3;
- (FMDInternalLocalFindableAccessory)initWithLocalFindableAccessory:(id)a3;
- (FMDLocalFindableAccessory)localFindableAccessory;
- (NSData)irkData;
- (NSDate)lastActiveTime;
- (NSString)address;
- (NSString)alternateSerialNumber;
- (NSString)bluetoothColorCode;
- (NSString)btAddress;
- (NSString)firmwareVersion;
- (NSString)name;
- (NSString)productId;
- (NSString)serialNumber;
- (NSString)vendorId;
- (NSUUID)baUUID;
- (NSUUID)identifier;
- (id)_computehash:(id)a3;
- (id)_deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4;
- (id)connectionStatusString;
- (id)currentLastActiveTime;
- (id)deviceInfo;
- (id)lastDiscoveryDate;
- (id)lastKnownLocationDeviceInfo;
- (int64_t)connectionState;
- (unint64_t)category;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAlternateSerialNumber:(id)a3;
- (void)setBaUUID:(id)a3;
- (void)setBluetoothColorCode:(id)a3;
- (void)setBtAddress:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setLastActiveTime:(id)a3;
- (void)setLocalFindableAccessory:(id)a3;
- (void)setName:(id)a3;
- (void)setProductId:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setVendorId:(id)a3;
@end

@implementation FMDInternalLocalFindableAccessory

- (FMDInternalLocalFindableAccessory)initWithLocalFindableAccessory:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FMDInternalLocalFindableAccessory;
  v6 = [(FMDInternalLocalFindableAccessory *)&v33 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localFindableAccessory, a3);
    uint64_t v8 = [v5 name];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    id v10 = objc_alloc((Class)FMDAccessoryIdentifier);
    v11 = [v5 baUUID];
    v12 = [v11 UUIDString];
    v13 = (FMDAccessoryIdentifier *)[v10 initWithString:v12];
    accessoryIdentifier = v7->_accessoryIdentifier;
    v7->_accessoryIdentifier = v13;

    uint64_t v15 = [v5 baUUID];
    baUUID = v7->_baUUID;
    v7->_baUUID = (NSUUID *)v15;

    uint64_t v17 = [v5 serialNumber];
    serialNumber = v7->_serialNumber;
    v7->_serialNumber = (NSString *)v17;

    uint64_t v19 = [v5 alternateSerialNumber];
    alternateSerialNumber = v7->_alternateSerialNumber;
    v7->_alternateSerialNumber = (NSString *)v19;

    uint64_t v21 = [v5 irkData];
    irkData = v7->_irkData;
    v7->_irkData = (NSData *)v21;

    uint64_t v23 = [v5 btAddress];
    btAddress = v7->_btAddress;
    v7->_btAddress = (NSString *)v23;

    uint64_t v25 = [v5 firmwareVersion];
    firmwareVersion = v7->_firmwareVersion;
    v7->_firmwareVersion = (NSString *)v25;

    uint64_t v27 = [v5 vendorId];
    vendorId = v7->_vendorId;
    v7->_vendorId = (NSString *)v27;

    uint64_t v29 = [v5 productId];
    productId = v7->_productId;
    v7->_productId = (NSString *)v29;

    bluetoothColorCode = v7->_bluetoothColorCode;
    v7->_bluetoothColorCode = (NSString *)@"0_0";
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)category
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDInternalLocalFindableAccessory *)self name];
  v6 = NSStringFromSelector("name");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDInternalLocalFindableAccessory *)self address];
  uint64_t v8 = NSStringFromSelector("address");
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(FMDInternalLocalFindableAccessory *)self vendorId];
  id v10 = NSStringFromSelector("vendorId");
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(FMDInternalLocalFindableAccessory *)self productId];
  v12 = NSStringFromSelector("productId");
  [v4 encodeObject:v11 forKey:v12];

  id v28 = [(FMDInternalLocalFindableAccessory *)self currentLastActiveTime];
  v13 = NSStringFromSelector("lastActiveTime");
  [v4 encodeObject:v28 forKey:v13];

  v14 = [(FMDInternalLocalFindableAccessory *)self serialNumber];
  uint64_t v15 = NSStringFromSelector("serialNumber");
  [v4 encodeObject:v14 forKey:v15];

  v16 = [(FMDInternalLocalFindableAccessory *)self alternateSerialNumber];
  uint64_t v17 = NSStringFromSelector("alternateSerialNumber");
  [v4 encodeObject:v16 forKey:v17];

  v18 = [(FMDInternalLocalFindableAccessory *)self firmwareVersion];
  uint64_t v19 = NSStringFromSelector("firmwareVersion");
  [v4 encodeObject:v18 forKey:v19];

  v20 = [(FMDInternalLocalFindableAccessory *)self bluetoothColorCode];
  uint64_t v21 = NSStringFromSelector("bluetoothColorCode");
  [v4 encodeObject:v20 forKey:v21];

  v22 = [(FMDInternalLocalFindableAccessory *)self irkData];
  uint64_t v23 = NSStringFromSelector("irkData");
  [v4 encodeObject:v22 forKey:v23];

  v24 = [(FMDInternalLocalFindableAccessory *)self btAddress];
  uint64_t v25 = NSStringFromSelector("btAddress");
  [v4 encodeObject:v24 forKey:v25];

  v26 = [(FMDInternalLocalFindableAccessory *)self baUUID];
  uint64_t v27 = NSStringFromSelector("baUUID");
  [v4 encodeObject:v26 forKey:v27];
}

- (FMDInternalLocalFindableAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDInternalLocalFindableAccessory *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("name");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDInternalLocalFindableAccessory *)v5 setName:v8];

    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector("address");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDInternalLocalFindableAccessory *)v5 setAddress:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector("vendorId");
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDInternalLocalFindableAccessory *)v5 setVendorId:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("productId");
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDInternalLocalFindableAccessory *)v5 setProductId:v17];

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = NSStringFromSelector("lastActiveTime");
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(FMDInternalLocalFindableAccessory *)v5 setLastActiveTime:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("serialNumber");
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(FMDInternalLocalFindableAccessory *)v5 setSerialNumber:v23];

    uint64_t v24 = objc_opt_class();
    uint64_t v25 = NSStringFromSelector("alternateSerialNumber");
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(FMDInternalLocalFindableAccessory *)v5 setAlternateSerialNumber:v26];

    uint64_t v27 = objc_opt_class();
    id v28 = NSStringFromSelector("firmwareVersion");
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    [(FMDInternalLocalFindableAccessory *)v5 setFirmwareVersion:v29];

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector("irkData");
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    [(FMDInternalLocalFindableAccessory *)v5 setIrkData:v32];

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector("btAddress");
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    [(FMDInternalLocalFindableAccessory *)v5 setBtAddress:v35];

    uint64_t v36 = objc_opt_class();
    v37 = NSStringFromSelector("bluetoothColorCode");
    v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    [(FMDInternalLocalFindableAccessory *)v5 setBluetoothColorCode:v38];

    id v39 = objc_alloc((Class)FMDAccessoryIdentifier);
    v40 = [(FMDInternalLocalFindableAccessory *)v5 serialNumber];
    id v41 = [v39 initWithString:v40];
    [(FMDInternalLocalFindableAccessory *)v5 setAccessoryIdentifier:v41];
  }
  return v5;
}

- (id)deviceInfo
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDInternalLocalFindableAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDInternalLocalFindableAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  v7 = [(FMDInternalLocalFindableAccessory *)self address];
  [v3 setValue:v7 forKey:@"deviceDiscoveryId"];

  uint64_t v8 = [(FMDInternalLocalFindableAccessory *)self connectionStatusString];
  [v3 setValue:v8 forKey:@"connectionStatus"];

  uint64_t v9 = [(FMDInternalLocalFindableAccessory *)self currentLastActiveTime];
  id v10 = v9;
  if (v9)
  {
    v11 = [NSNumber numberWithLongLong:[v9 fm_epoch]];
    [v3 setValue:v11 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FC0 forKey:@"lastActiveTime"];
  }
  uint64_t v12 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  v13 = [v12 btAddress];
  [v3 fm_safeSetObject:v13 forKey:@"btAddress"];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  v14 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v15 = [v14 firmwareVersion];
  [v3 fm_safeSetObject:v15 forKey:@"firmwareVersion"];

  v16 = +[FMDSystemConfig sharedInstance];
  uint64_t v17 = [v16 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v17];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  unsigned int v39 = 0;
  uint64_t v18 = [(FMDInternalLocalFindableAccessory *)self vendorId];
  uint64_t v19 = +[NSScanner scannerWithString:v18];

  [v19 scanHexInt:&v39];
  unsigned int v38 = 0;
  v20 = [(FMDInternalLocalFindableAccessory *)self productId];
  uint64_t v21 = +[NSScanner scannerWithString:v20];

  [v21 scanHexInt:&v38];
  v22 = sub_100004238();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v41 = v39;
    __int16 v42 = 1024;
    unsigned int v43 = v38;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "vendorId = %u productId = %u", buf, 0xEu);
  }

  uint64_t v23 = [(FMDInternalLocalFindableAccessory *)self _deviceTypeFromVendorId:v39 productId:v38];
  uint64_t v24 = +[FMDExtConfigurationRegistry sharedInstance];
  uint64_t v25 = [v24 configForAccessoryType:v23];

  v26 = [v25 version];
  [v3 setObject:v26 forKeyedSubscript:@"cachedConfigVersion"];

  [v3 setObject:v23 forKeyedSubscript:@"productType"];
  uint64_t v27 = +[FMDSystemConfig sharedInstance];
  id v28 = [v27 platform];
  uint64_t v29 = +[NSString stringWithFormat:@"%@_proxy", v28];

  [v3 fm_safelyMapKey:@"platform" toObject:v29];
  uint64_t v30 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  v31 = [v30 serialNumber];
  [v3 fm_safeSetObject:v31 forKey:@"serialNumber"];

  v32 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v33 = [v32 alternateSerialNumber];
  [v3 fm_safeSetObject:v33 forKey:@"alternateSerialNumber"];

  [v3 fm_safeSetObject:@"0_0" forKey:@"colorCode"];
  v34 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  v35 = [v34 baUUID];
  uint64_t v36 = [v35 UUIDString];
  [v3 fm_safelyMapKey:@"baUUID" toObject:v36];

  return v3;
}

- (id)lastDiscoveryDate
{
  return +[NSDate date];
}

- (id)lastKnownLocationDeviceInfo
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDInternalLocalFindableAccessory *)self name];
  [v3 setValue:v4 forKey:@"deviceName"];

  id v5 = [(FMDInternalLocalFindableAccessory *)self accessoryIdentifier];
  uint64_t v6 = [v5 stringValue];
  [v3 setValue:v6 forKey:@"udid"];

  v7 = [(FMDInternalLocalFindableAccessory *)self currentLastActiveTime];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [NSNumber numberWithLongLong:][v7 fm_epoch];
    [v3 setValue:v9 forKey:@"lastActiveTime"];
  }
  else
  {
    [v3 setValue:&off_1002F1FC0 forKey:@"lastActiveTime"];
  }
  id v10 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  v11 = [v10 irkData];
  [v3 fm_safeSetObject:v11 forKey:@"irkData"];

  uint64_t v12 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  v13 = [v12 btAddress];
  [v3 fm_safeSetObject:v13 forKey:@"btAddress"];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesEnabled"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"activationLock"];
  v14 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v15 = [v14 firmwareVersion];
  [v3 fm_safeSetObject:v15 forKey:@"firmwareVersion"];

  v16 = +[FMDSystemConfig sharedInstance];
  uint64_t v17 = [v16 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v17];

  [v3 setObject:@"Accessory" forKeyedSubscript:@"deviceClass"];
  uint64_t v18 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v19 = [v18 vendorId];
  v20 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v21 = [v20 productId];
  v22 = +[NSString stringWithFormat:@"%@_%@", v19, v21];
  [v3 setObject:v22 forKeyedSubscript:@"productType"];

  uint64_t v23 = +[FMDSystemConfig sharedInstance];
  uint64_t v24 = [v23 platform];
  uint64_t v25 = +[NSString stringWithFormat:@"%@_proxy", v24];

  [v3 fm_safelyMapKey:@"platform" toObject:v25];
  v26 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v27 = [v26 serialNumber];
  [v3 fm_safeSetObject:v27 forKey:@"serialNumber"];

  id v28 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  uint64_t v29 = [v28 alternateSerialNumber];
  [v3 fm_safeSetObject:v29 forKey:@"alternateSerialNumber"];

  [v3 fm_safeSetObject:@"0_0" forKey:@"colorCode"];

  return v3;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 1;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  CFStringRef v4 = @"irkData";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (int64_t)connectionState
{
  v2 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  int64_t v3 = [v2 isConnected];

  return v3;
}

- (id)connectionStatusString
{
  unint64_t v2 = [(FMDInternalLocalFindableAccessory *)self connectionState];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1002DB6D8[v2];
  }
}

- (id)currentLastActiveTime
{
  int64_t v3 = [(FMDInternalLocalFindableAccessory *)self localFindableAccessory];
  unsigned int v4 = [v3 isConnected];

  if (v4)
  {
    id v5 = +[NSDate date];
    [(FMDInternalLocalFindableAccessory *)self setLastActiveTime:v5];
    uint64_t v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updated lastActiveTime", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) fetching cached lastActiveTime", (uint8_t *)&v9, 0xCu);
    }

    id v5 = [(FMDInternalLocalFindableAccessory *)self lastActiveTime];
  }

  return v5;
}

- (id)_deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4
{
  id v5 = +[NSString stringWithFormat:@"BT_%u_%u", *(void *)&a3, *(void *)&a4];
  uint64_t v6 = [(FMDInternalLocalFindableAccessory *)self _computehash:v5];

  return v6;
}

- (id)_computehash:(id)a3
{
  int64_t v3 = [a3 dataUsingEncoding:4];
  unsigned int v4 = [v3 fm_sha256Hash];
  id v5 = [v4 fm_hexString];
  uint64_t v6 = [v5 lowercaseString];

  return v6;
}

- (FMDCommandContext)commandContext
{
  return self->commandContext;
}

- (BOOL)nearby
{
  return self->nearby;
}

- (FMDLocalFindableAccessory)localFindableAccessory
{
  return self->_localFindableAccessory;
}

- (void)setLocalFindableAccessory:(id)a3
{
}

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastActiveTime:(id)a3
{
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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

- (NSString)alternateSerialNumber
{
  return self->_alternateSerialNumber;
}

- (void)setAlternateSerialNumber:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
}

- (NSString)bluetoothColorCode
{
  return self->_bluetoothColorCode;
}

- (void)setBluetoothColorCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_alternateSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_localFindableAccessory, 0);

  objc_storeStrong((id *)&self->commandContext, 0);
}

@end