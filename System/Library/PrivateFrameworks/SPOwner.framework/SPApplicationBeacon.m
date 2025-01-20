@interface SPApplicationBeacon
- (BOOL)canBeLeashedByHost;
- (BOOL)connected;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isZeus;
- (NSDictionary)taskInformation;
- (NSSet)safeLocations;
- (NSString)discoveryId;
- (NSString)model;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)systemVersion;
- (NSString)type;
- (NSUUID)groupIdentifier;
- (NSUUID)identifier;
- (NSUUID)productUUID;
- (SPApplicationBeacon)initWithInternalSimpleBeacon:(id)a3;
- (SPBeaconRole)role;
- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo;
- (SPHandle)owner;
- (SPLostModeInfo)lostModeInfo;
- (int64_t)batteryLevel;
- (int64_t)partIdentifier;
- (int64_t)productId;
- (int64_t)vendorId;
- (void)setAccessoryProductInfo:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setCanBeLeashedByHost:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDiscoveryId:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAppleAudioAccessory:(BOOL)a3;
- (void)setIsZeus:(BOOL)a3;
- (void)setLostModeInfo:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPartIdentifier:(int64_t)a3;
- (void)setProductId:(int64_t)a3;
- (void)setProductUUID:(id)a3;
- (void)setRole:(id)a3;
- (void)setSafeLocations:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTaskInformation:(id)a3;
- (void)setType:(id)a3;
- (void)setVendorId:(int64_t)a3;
@end

@implementation SPApplicationBeacon

- (SPApplicationBeacon)initWithInternalSimpleBeacon:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SPApplicationBeacon;
  v5 = [(SPApplicationBeacon *)&v42 init];
  if (v5)
  {
    v6 = [v4 name];
    uint64_t v7 = [v6 copy];
    v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_1F0B18CC8;
    }
    objc_storeStrong((id *)&v5->_name, v9);

    v10 = [v4 identifier];
    uint64_t v11 = [v10 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v13 = [v4 groupIdentifier];
    uint64_t v14 = [v13 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v4 type];
    type = v5->_type;
    v5->_type = (NSString *)v16;

    v5->_batteryLevel = [v4 batteryLevel];
    v18 = [v4 productUUID];
    uint64_t v19 = [v18 copy];
    productUUID = v5->_productUUID;
    v5->_productUUID = (NSUUID *)v19;

    v5->_partIdentifier = [v4 partIdentifier];
    v21 = [v4 lostModeInfo];
    uint64_t v22 = [v21 copy];
    lostModeInfo = v5->_lostModeInfo;
    v5->_lostModeInfo = (SPLostModeInfo *)v22;

    v24 = [v4 taskInformation];
    uint64_t v25 = [v24 copy];
    taskInformation = v5->_taskInformation;
    v5->_taskInformation = (NSDictionary *)v25;

    uint64_t v27 = [v4 owner];
    owner = v5->_owner;
    v5->_owner = (SPHandle *)v27;

    v29 = [v4 role];
    uint64_t v30 = [v29 copy];
    role = v5->_role;
    v5->_role = (SPBeaconRole *)v30;

    v32 = [v4 safeLocations];
    uint64_t v33 = [v32 copy];
    safeLocations = v5->_safeLocations;
    v5->_safeLocations = (NSSet *)v33;

    uint64_t v35 = [v4 accessoryProductInfo];
    accessoryProductInfo = v5->_accessoryProductInfo;
    v5->_accessoryProductInfo = (SPDiscoveredAccessoryProductInformation *)v35;

    v5->_isAppleAudioAccessory = [v4 isAppleAudioAccessory];
    v5->_isZeus = [v4 isZeus];
    v5->_canBeLeashedByHost = [v4 canBeLeashedByHost];
    v5->_connected = [v4 connected];
    uint64_t v37 = [v4 systemVersion];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v37;

    v5->_vendorId = [v4 vendorId];
    v5->_productId = [v4 productId];
    uint64_t v39 = [v4 serialNumber];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v39;

    v5->_discoveryId = (NSString *)(id)[v4 discoveryId];
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (SPBeaconRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
}

- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo
{
  return self->_accessoryProductInfo;
}

- (void)setAccessoryProductInfo:(id)a3
{
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (BOOL)canBeLeashedByHost
{
  return self->_canBeLeashedByHost;
}

- (void)setCanBeLeashedByHost:(BOOL)a3
{
  self->_canBeLeashedByHost = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)discoveryId
{
  return self->_discoveryId;
}

- (void)setDiscoveryId:(id)a3
{
  self->_discoveryId = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end