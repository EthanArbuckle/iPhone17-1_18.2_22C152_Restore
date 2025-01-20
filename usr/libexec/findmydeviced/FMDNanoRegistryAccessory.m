@interface FMDNanoRegistryAccessory
+ (BOOL)supportsSecureCoding;
+ (id)volatileKeysToExcludeFromRegisterDigest;
- (BOOL)isEqual:(id)a3;
- (BOOL)migrationPossible;
- (BOOL)nearby;
- (BOOL)paired;
- (BOOL)tinkerCapable;
- (BOOL)tinkerPaired;
- (BOOL)updateWithBeaconingIdentifier:(id)a3;
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (FMDCommandContext)commandContext;
- (FMDNanoRegistryAccessory)initWithCoder:(id)a3;
- (FMDNanoRegistryAccessory)initWithNRDevice:(id)a3;
- (NRDevice)device;
- (NSString)address;
- (NSString)buildVersion;
- (NSString)description;
- (NSString)name;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (NSString)udid;
- (NSUUID)baUUID;
- (NSUUID)pairingId;
- (id)completeDeviceInfo;
- (id)deviceInfoForHostRegister;
- (id)lastDiscoveryDate;
- (int64_t)connectionState;
- (unint64_t)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMigrationPossible:(BOOL)a3;
@end

@implementation FMDNanoRegistryAccessory

- (FMDNanoRegistryAccessory)initWithNRDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDNanoRegistryAccessory;
  v5 = [(FMDNanoRegistryAccessory *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(FMDNanoRegistryAccessory *)v5 setMigrationPossible:0];
    [(FMDNanoRegistryAccessory *)v6 setDevice:v4];
    id v7 = objc_alloc((Class)FMDAccessoryIdentifier);
    v8 = [(FMDNanoRegistryAccessory *)v6 pairingId];
    v9 = [v8 UUIDString];
    id v10 = [v7 initWithString:v9];
    [(FMDNanoRegistryAccessory *)v6 setAccessoryIdentifier:v10];
  }
  return v6;
}

- (NSString)udid
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertyUDID];

  return (NSString *)v3;
}

- (NSUUID)pairingId
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  return (NSUUID *)v3;
}

- (NSString)serialNumber
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertySerialNumber];

  return (NSString *)v3;
}

- (NSString)productType
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertyProductType];

  return (NSString *)v3;
}

- (NSString)productVersion
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertySystemVersion];

  return (NSString *)v3;
}

- (NSString)buildVersion
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertySystemBuildVersion];

  return (NSString *)v3;
}

- (BOOL)paired
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  v3 = [v2 valueForProperty:NRDevicePropertyIsPaired];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)tinkerCapable
{
  v2 = [(FMDNanoRegistryAccessory *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"7275F1C6-7EB4-4406-B552-DC910FBFD07C"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)tinkerPaired
{
  BOOL v2 = [(FMDNanoRegistryAccessory *)self tinkerCapable];
  if (v2)
  {
    id v3 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned __int8 v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
    v6 = [v5 firstObject];

    id v7 = [v6 valueForProperty:NRDevicePropertyIsAltAccount];
    LOBYTE(v4) = [v7 BOOLValue];

    LOBYTE(v2) = (_BYTE)v4;
  }
  return v2;
}

- (unint64_t)category
{
  return 2;
}

- (NSString)name
{
  BOOL v2 = [(FMDNanoRegistryAccessory *)self device];
  id v3 = [v2 valueForProperty:NRDevicePropertyName];

  return (NSString *)v3;
}

- (id)completeDeviceInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  unsigned __int8 v4 = [(FMDNanoRegistryAccessory *)self lastDiscoveryDate];
  v5 = v4;
  if (v4)
  {
    +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 fm_epoch]);
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &off_1002F1E28;
  }
  [v3 fm_safelyMapKey:@"lastActiveTime" toObject:v6];
  [v3 fm_safelyMapKey:@"deviceClass" toObject:@"Watch"];
  [v3 fm_safelyMapKey:@"platform" toObject:@"watchos"];
  id v7 = [(FMDNanoRegistryAccessory *)self pairingId];
  v8 = [v7 UUIDString];
  [v3 fm_safelyMapKey:@"pairingId" toObject:v8];

  v9 = [(FMDNanoRegistryAccessory *)self udid];
  [v3 fm_safelyMapKey:@"udid" toObject:v9];

  id v10 = [(FMDNanoRegistryAccessory *)self productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v10];

  v11 = [(FMDNanoRegistryAccessory *)self name];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v11];

  return v3;
}

- (id)deviceInfoForHostRegister
{
  if ([(FMDNanoRegistryAccessory *)self paired])
  {
    id v3 = [(FMDNanoRegistryAccessory *)self completeDeviceInfo];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  CFStringRef v4 = @"lastActiveTime";
  BOOL v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)lastDiscoveryDate
{
  BOOL v2 = [(FMDNanoRegistryAccessory *)self device];
  id v3 = [v2 valueForProperty:NRDevicePropertyLastActiveDate];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CFStringRef v4 = (FMDNanoRegistryAccessory *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(FMDNanoRegistryAccessory *)v4 hash];
      BOOL v6 = v5 == (id)[(FMDNanoRegistryAccessory *)self hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  BOOL v2 = [(FMDNanoRegistryAccessory *)self accessoryIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (FMDNanoRegistryAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDNanoRegistryAccessory;
  id v5 = [(FMDNanoRegistryAccessory *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("accessoryIdentifier");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDNanoRegistryAccessory *)v5 setAccessoryIdentifier:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(FMDNanoRegistryAccessory *)self accessoryIdentifier];
  id v5 = NSStringFromSelector("accessoryIdentifier");
  [v4 encodeObject:v6 forKey:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)connectionState
{
  return 0;
}

- (FMDCommandContext)commandContext
{
  return 0;
}

- (NSString)address
{
  return 0;
}

- (BOOL)nearby
{
  return 0;
}

- (NSUUID)baUUID
{
  return 0;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 0;
}

- (NSString)description
{
  id v3 = +[NSMutableArray array];
  id v4 = [(FMDNanoRegistryAccessory *)self pairingId];
  id v5 = +[NSString stringWithFormat:@"pairing ID: %@", v4];
  [v3 addObject:v5];

  id v6 = [(FMDNanoRegistryAccessory *)self udid];
  id v7 = +[NSString stringWithFormat:@"UDID: %@", v6];
  [v3 addObject:v7];

  v8 = [(FMDNanoRegistryAccessory *)self serialNumber];
  v9 = +[NSString stringWithFormat:@"Serial Number: %@", v8];
  [v3 addObject:v9];

  objc_super v10 = [(FMDNanoRegistryAccessory *)self productType];
  v11 = +[NSString stringWithFormat:@"Product Type: %@", v10];
  [v3 addObject:v11];

  objc_super v12 = [(FMDNanoRegistryAccessory *)self productType];
  v13 = +[NSString stringWithFormat:@"Product Type: %@", v12];
  [v3 addObject:v13];

  v14 = [(FMDNanoRegistryAccessory *)self productVersion];
  v15 = +[NSString stringWithFormat:@"Product Version: %@", v14];
  [v3 addObject:v15];

  v16 = [(FMDNanoRegistryAccessory *)self buildVersion];
  v17 = +[NSString stringWithFormat:@"Build Version: %@", v16];
  [v3 addObject:v17];

  v18 = +[NSNumber numberWithBool:[(FMDNanoRegistryAccessory *)self paired]];
  v19 = +[NSString stringWithFormat:@"Paired: %@", v18];
  [v3 addObject:v19];

  v20 = +[NSNumber numberWithBool:[(FMDNanoRegistryAccessory *)self migrationPossible]];
  v21 = +[NSString stringWithFormat:@"Migration Possible: %@", v20];
  [v3 addObject:v21];

  v22 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v22;
}

- (BOOL)migrationPossible
{
  return self->_migrationPossible;
}

- (void)setMigrationPossible:(BOOL)a3
{
  self->_migrationPossible = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end