@interface SPInternalSimpleBeacon
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeLeashedByHost;
- (BOOL)connected;
- (BOOL)connectionAllowed;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isZeus;
- (NSDictionary)taskInformation;
- (NSSet)safeLocations;
- (NSString)discoveryId;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)systemVersion;
- (NSString)type;
- (NSUUID)groupIdentifier;
- (NSUUID)identifier;
- (NSUUID)ownerBeaconIdentifier;
- (NSUUID)productUUID;
- (SPBeaconRole)role;
- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo;
- (SPHandle)owner;
- (SPInternalSimpleBeacon)initWithCoder:(id)a3;
- (SPKeySyncRecord)keySyncRecord;
- (SPLostModeInfo)lostModeInfo;
- (double)txPower;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)batteryLevel;
- (int64_t)connectableDeviceCount;
- (int64_t)internalShareType;
- (int64_t)partIdentifier;
- (int64_t)productId;
- (int64_t)vendorId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryProductInfo:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setCanBeLeashedByHost:(BOOL)a3;
- (void)setConnectableDeviceCount:(int64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionAllowed:(BOOL)a3;
- (void)setDiscoveryId:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalShareType:(int64_t)a3;
- (void)setIsAppleAudioAccessory:(BOOL)a3;
- (void)setIsZeus:(BOOL)a3;
- (void)setKeySyncRecord:(id)a3;
- (void)setLostModeInfo:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setOwnerBeaconIdentifier:(id)a3;
- (void)setPartIdentifier:(int64_t)a3;
- (void)setProductId:(int64_t)a3;
- (void)setProductUUID:(id)a3;
- (void)setRole:(id)a3;
- (void)setSafeLocations:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTaskInformation:(id)a3;
- (void)setTxPower:(double)a3;
- (void)setType:(id)a3;
- (void)setVendorId:(int64_t)a3;
@end

@implementation SPInternalSimpleBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPInternalSimpleBeacon *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPInternalSimpleBeacon *)self identifier];
      v7 = [(SPInternalSimpleBeacon *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(SPInternalSimpleBeacon *)self name];
        v9 = [(SPInternalSimpleBeacon *)v5 name];
        if ([v8 isEqualToString:v9])
        {
          v10 = [(SPInternalSimpleBeacon *)self type];
          v11 = [(SPInternalSimpleBeacon *)v5 type];
          if ([v10 isEqualToString:v11]
            && (int64_t v12 = [(SPInternalSimpleBeacon *)self partIdentifier],
                v12 == [(SPInternalSimpleBeacon *)v5 partIdentifier])
            && (BOOL v13 = [(SPInternalSimpleBeacon *)self connectionAllowed],
                v13 == [(SPInternalSimpleBeacon *)v5 connectionAllowed]))
          {
            v68 = [(SPInternalSimpleBeacon *)self systemVersion];
            v84 = [(SPInternalSimpleBeacon *)v5 systemVersion];
            v85 = v68;
            if (objc_msgSend(v68, "isEqualToString:")
              && ([(SPInternalSimpleBeacon *)self txPower],
                  double v70 = v69,
                  [(SPInternalSimpleBeacon *)v5 txPower],
                  v70 == v71)
              && (int64_t v72 = [(SPInternalSimpleBeacon *)self vendorId],
                  v72 == [(SPInternalSimpleBeacon *)v5 vendorId])
              && (int64_t v73 = [(SPInternalSimpleBeacon *)self productId],
                  v73 == [(SPInternalSimpleBeacon *)v5 productId])
              && (int64_t v74 = [(SPInternalSimpleBeacon *)self batteryLevel],
                  v74 == [(SPInternalSimpleBeacon *)v5 batteryLevel])
              && (int64_t v75 = [(SPInternalSimpleBeacon *)self connectableDeviceCount],
                  v75 == [(SPInternalSimpleBeacon *)v5 connectableDeviceCount]))
            {
              v76 = [(SPInternalSimpleBeacon *)self productUUID];
              v82 = [(SPInternalSimpleBeacon *)v5 productUUID];
              v83 = v76;
              if (objc_msgSend(v76, "isEqual:")
                && (BOOL v77 = [(SPInternalSimpleBeacon *)self isAppleAudioAccessory],
                    v77 == [(SPInternalSimpleBeacon *)v5 isAppleAudioAccessory])
                && (BOOL v78 = [(SPInternalSimpleBeacon *)self isZeus],
                    v78 == [(SPInternalSimpleBeacon *)v5 isZeus])
                && (BOOL v79 = [(SPInternalSimpleBeacon *)self canBeLeashedByHost],
                    v79 == [(SPInternalSimpleBeacon *)v5 canBeLeashedByHost])
                && (BOOL v80 = [(SPInternalSimpleBeacon *)self connected],
                    v80 == [(SPInternalSimpleBeacon *)v5 connected]))
              {
                int64_t v81 = [(SPInternalSimpleBeacon *)self internalShareType];
                BOOL v14 = v81 == [(SPInternalSimpleBeacon *)v5 internalShareType];
              }
              else
              {
                BOOL v14 = 0;
              }
            }
            else
            {
              BOOL v14 = 0;
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }

      v16 = [(SPInternalSimpleBeacon *)self groupIdentifier];

      if (v16) {
        int v17 = 0;
      }
      else {
        int v17 = v14;
      }
      if (v16 && v14)
      {
        v18 = [(SPInternalSimpleBeacon *)self groupIdentifier];
        v19 = [(SPInternalSimpleBeacon *)v5 groupIdentifier];
        int v17 = [v18 isEqual:v19];
      }
      v20 = [(SPInternalSimpleBeacon *)self ownerBeaconIdentifier];

      if (v20) {
        int v21 = 0;
      }
      else {
        int v21 = v17;
      }
      if (v20 && v17)
      {
        v22 = [(SPInternalSimpleBeacon *)self ownerBeaconIdentifier];
        v23 = [(SPInternalSimpleBeacon *)v5 ownerBeaconIdentifier];
        int v21 = [v22 isEqual:v23];
      }
      v24 = [(SPInternalSimpleBeacon *)self modelName];

      if (v24) {
        int v25 = 0;
      }
      else {
        int v25 = v21;
      }
      if (v24 && v21)
      {
        v26 = [(SPInternalSimpleBeacon *)self modelName];
        v27 = [(SPInternalSimpleBeacon *)v5 modelName];
        int v25 = [v26 isEqualToString:v27];
      }
      v28 = [(SPInternalSimpleBeacon *)self manufacturerName];

      if (v28) {
        int v29 = 0;
      }
      else {
        int v29 = v25;
      }
      if (v28 && v25)
      {
        v30 = [(SPInternalSimpleBeacon *)self manufacturerName];
        v31 = [(SPInternalSimpleBeacon *)v5 manufacturerName];
        int v29 = [v30 isEqualToString:v31];
      }
      v32 = [(SPInternalSimpleBeacon *)self serialNumber];

      if (v32) {
        int v33 = 0;
      }
      else {
        int v33 = v29;
      }
      if (v32 && v29)
      {
        v34 = [(SPInternalSimpleBeacon *)self serialNumber];
        v35 = [(SPInternalSimpleBeacon *)v5 serialNumber];
        int v33 = [v34 isEqualToString:v35];
      }
      v36 = [(SPInternalSimpleBeacon *)self keySyncRecord];

      if (v36) {
        int v37 = 0;
      }
      else {
        int v37 = v33;
      }
      if (v36 && v33)
      {
        v38 = [(SPInternalSimpleBeacon *)self keySyncRecord];
        v39 = [(SPInternalSimpleBeacon *)v5 keySyncRecord];
        int v37 = [v38 isEqual:v39];
      }
      v40 = [(SPInternalSimpleBeacon *)self lostModeInfo];

      if (v40) {
        int v41 = 0;
      }
      else {
        int v41 = v37;
      }
      if (v40 && v37)
      {
        v42 = [(SPInternalSimpleBeacon *)self lostModeInfo];
        v43 = [(SPInternalSimpleBeacon *)v5 lostModeInfo];
        int v41 = [v42 isEqual:v43];
      }
      v44 = [(SPInternalSimpleBeacon *)self taskInformation];

      if (v44) {
        int v45 = 0;
      }
      else {
        int v45 = v41;
      }
      if (v44 && v41)
      {
        v46 = [(SPInternalSimpleBeacon *)self taskInformation];
        v47 = [(SPInternalSimpleBeacon *)v5 taskInformation];
        int v45 = [v46 isEqual:v47];
      }
      v48 = [(SPInternalSimpleBeacon *)self owner];

      if (v48) {
        int v49 = 0;
      }
      else {
        int v49 = v45;
      }
      if (v48 && v45)
      {
        v50 = [(SPInternalSimpleBeacon *)self owner];
        v51 = [(SPInternalSimpleBeacon *)v5 owner];
        int v49 = [v50 isEqual:v51];
      }
      v52 = [(SPInternalSimpleBeacon *)self role];

      if (v52) {
        int v53 = 0;
      }
      else {
        int v53 = v49;
      }
      if (v52 && v49)
      {
        v54 = [(SPInternalSimpleBeacon *)self role];
        v55 = [(SPInternalSimpleBeacon *)v5 role];
        int v53 = [v54 isEqual:v55];
      }
      v56 = [(SPInternalSimpleBeacon *)self safeLocations];

      if (v56) {
        int v57 = 0;
      }
      else {
        int v57 = v53;
      }
      if (v56 && v53)
      {
        v58 = [(SPInternalSimpleBeacon *)self safeLocations];
        v59 = [(SPInternalSimpleBeacon *)v5 safeLocations];
        int v57 = [v58 isEqual:v59];
      }
      v60 = [(SPInternalSimpleBeacon *)self accessoryProductInfo];

      if (v60) {
        int v61 = 0;
      }
      else {
        int v61 = v57;
      }
      if (v60 && v57)
      {
        v62 = [(SPInternalSimpleBeacon *)self accessoryProductInfo];
        v63 = [(SPInternalSimpleBeacon *)v5 accessoryProductInfo];
        int v61 = [v62 isEqual:v63];
      }
      v64 = [(SPInternalSimpleBeacon *)self discoveryId];

      if (v64) {
        char v15 = 0;
      }
      else {
        char v15 = v61;
      }
      if (v64 && v61)
      {
        v65 = [(SPInternalSimpleBeacon *)self discoveryId];
        v66 = [(SPInternalSimpleBeacon *)v5 discoveryId];
        char v15 = [v65 isEqual:v66];
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_type hash] ^ self->_partIdentifier;
  BOOL connectionAllowed = self->_connectionAllowed;
  NSUInteger v7 = [(NSString *)self->_systemVersion hash];
  unint64_t v8 = (unint64_t)(self->_txPower * 100.0);
  int64_t vendorId = self->_vendorId;
  int64_t productId = self->_productId;
  int64_t batteryLevel = self->_batteryLevel;
  int64_t connectableDeviceCount = self->_connectableDeviceCount;
  unint64_t v13 = v5 ^ connectionAllowed ^ v7 ^ vendorId ^ productId ^ batteryLevel ^ connectableDeviceCount ^ [(NSUUID *)self->_productUUID hash] ^ self->_isAppleAudioAccessory ^ self->_isZeus ^ self->_canBeLeashedByHost ^ self->_connected ^ v8 ^ self->_internalShareType;
  BOOL v14 = [(SPInternalSimpleBeacon *)self groupIdentifier];

  if (v14)
  {
    char v15 = [(SPInternalSimpleBeacon *)self groupIdentifier];
    v13 ^= [v15 hash];
  }
  v16 = [(SPInternalSimpleBeacon *)self ownerBeaconIdentifier];

  if (v16)
  {
    int v17 = [(SPInternalSimpleBeacon *)self ownerBeaconIdentifier];
    v13 ^= [v17 hash];
  }
  v18 = [(SPInternalSimpleBeacon *)self modelName];

  if (v18)
  {
    v19 = [(SPInternalSimpleBeacon *)self modelName];
    v13 ^= [v19 hash];
  }
  v20 = [(SPInternalSimpleBeacon *)self manufacturerName];

  if (v20)
  {
    int v21 = [(SPInternalSimpleBeacon *)self manufacturerName];
    v13 ^= [v21 hash];
  }
  v22 = [(SPInternalSimpleBeacon *)self serialNumber];

  if (v22)
  {
    v23 = [(SPInternalSimpleBeacon *)self serialNumber];
    v13 ^= [v23 hash];
  }
  v24 = [(SPInternalSimpleBeacon *)self keySyncRecord];

  if (v24)
  {
    int v25 = [(SPInternalSimpleBeacon *)self keySyncRecord];
    v13 ^= [v25 hash];
  }
  v26 = [(SPInternalSimpleBeacon *)self lostModeInfo];

  if (v26)
  {
    v27 = [(SPInternalSimpleBeacon *)self lostModeInfo];
    v13 ^= [v27 hash];
  }
  v28 = [(SPInternalSimpleBeacon *)self taskInformation];

  if (v28)
  {
    int v29 = [(SPInternalSimpleBeacon *)self taskInformation];
    v13 ^= [v29 hash];
  }
  v30 = [(SPInternalSimpleBeacon *)self owner];

  if (v30)
  {
    v31 = [(SPInternalSimpleBeacon *)self owner];
    v13 ^= [v31 hash];
  }
  v32 = [(SPInternalSimpleBeacon *)self role];

  if (v32)
  {
    int v33 = [(SPInternalSimpleBeacon *)self role];
    v13 ^= [v33 hash];
  }
  v34 = [(SPInternalSimpleBeacon *)self safeLocations];

  if (v34)
  {
    v35 = [(SPInternalSimpleBeacon *)self safeLocations];
    v13 ^= [v35 hash];
  }
  v36 = [(SPInternalSimpleBeacon *)self accessoryProductInfo];

  if (v36)
  {
    int v37 = [(SPInternalSimpleBeacon *)self accessoryProductInfo];
    v13 ^= [v37 hash];
  }
  v38 = [(SPInternalSimpleBeacon *)self discoveryId];

  if (v38)
  {
    v39 = [(SPInternalSimpleBeacon *)self discoveryId];
    v13 ^= [v39 hash];
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_opt_new();
  NSUInteger v5 = [(SPInternalSimpleBeacon *)self identifier];
  v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  NSUInteger v7 = [(SPInternalSimpleBeacon *)self name];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setName:v8];

  v9 = [(SPInternalSimpleBeacon *)self type];
  v10 = (void *)[v9 copy];
  [v4 setType:v10];

  objc_msgSend(v4, "setPartIdentifier:", -[SPInternalSimpleBeacon partIdentifier](self, "partIdentifier"));
  objc_msgSend(v4, "setConnectionAllowed:", -[SPInternalSimpleBeacon connectionAllowed](self, "connectionAllowed"));
  v11 = [(SPInternalSimpleBeacon *)self systemVersion];
  int64_t v12 = (void *)[v11 copy];
  [v4 setSystemVersion:v12];

  [(SPInternalSimpleBeacon *)self txPower];
  objc_msgSend(v4, "setTxPower:");
  objc_msgSend(v4, "setVendorId:", -[SPInternalSimpleBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPInternalSimpleBeacon productId](self, "productId"));
  unint64_t v13 = [(SPInternalSimpleBeacon *)self productUUID];
  [v4 setProductUUID:v13];

  objc_msgSend(v4, "setBatteryLevel:", -[SPInternalSimpleBeacon batteryLevel](self, "batteryLevel"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPInternalSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  BOOL v14 = [(SPInternalSimpleBeacon *)self groupIdentifier];
  char v15 = (void *)[v14 copy];
  [v4 setGroupIdentifier:v15];

  v16 = [(SPInternalSimpleBeacon *)self ownerBeaconIdentifier];
  int v17 = (void *)[v16 copy];
  [v4 setOwnerBeaconIdentifier:v17];

  v18 = [(SPInternalSimpleBeacon *)self modelName];
  v19 = (void *)[v18 copy];
  [v4 setModelName:v19];

  v20 = [(SPInternalSimpleBeacon *)self manufacturerName];
  int v21 = (void *)[v20 copy];
  [v4 setManufacturerName:v21];

  v22 = [(SPInternalSimpleBeacon *)self serialNumber];
  v23 = (void *)[v22 copy];
  [v4 setSerialNumber:v23];

  v24 = [(SPInternalSimpleBeacon *)self keySyncRecord];
  int v25 = (void *)[v24 copy];
  [v4 setKeySyncRecord:v25];

  v26 = [(SPInternalSimpleBeacon *)self lostModeInfo];
  v27 = (void *)[v26 copy];
  [v4 setLostModeInfo:v27];

  v28 = [(SPInternalSimpleBeacon *)self taskInformation];
  int v29 = (void *)[v28 copy];
  [v4 setTaskInformation:v29];

  v30 = [(SPInternalSimpleBeacon *)self owner];
  v31 = (void *)[v30 copy];
  [v4 setOwner:v31];

  v32 = [(SPInternalSimpleBeacon *)self role];
  int v33 = (void *)[v32 copy];
  [v4 setRole:v33];

  v34 = [(SPInternalSimpleBeacon *)self safeLocations];
  v35 = (void *)[v34 copy];
  [v4 setSafeLocations:v35];

  v36 = [(SPInternalSimpleBeacon *)self accessoryProductInfo];
  int v37 = (void *)[v36 copy];
  [v4 setAccessoryProductInfo:v37];

  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPInternalSimpleBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  objc_msgSend(v4, "setIsZeus:", -[SPInternalSimpleBeacon isZeus](self, "isZeus"));
  objc_msgSend(v4, "setCanBeLeashedByHost:", -[SPInternalSimpleBeacon canBeLeashedByHost](self, "canBeLeashedByHost"));
  objc_msgSend(v4, "setConnected:", -[SPInternalSimpleBeacon connected](self, "connected"));
  v38 = [(SPInternalSimpleBeacon *)self discoveryId];
  v39 = (void *)[v38 copy];
  [v4 setDiscoveryId:v39];

  objc_msgSend(v4, "setInternalShareType:", -[SPInternalSimpleBeacon internalShareType](self, "internalShareType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_partIdentifier forKey:@"partIdentifier"];
  [v5 encodeBool:self->_connectionAllowed forKey:@"connectionAllowed"];
  [v5 encodeObject:self->_systemVersion forKey:@"systemVersion"];
  [v5 encodeDouble:@"txPower" forKey:self->_txPower];
  [v5 encodeDouble:@"vendorId" forKey:(double)self->_vendorId];
  [v5 encodeDouble:@"productId" forKey:(double)self->_productId];
  [v5 encodeObject:self->_productUUID forKey:@"productUUID"];
  [v5 encodeDouble:@"batteryLevel" forKey:(double)self->_batteryLevel];
  [v5 encodeDouble:@"connectableDeviceCount" forKey:(double)self->_connectableDeviceCount];
  [v5 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v5 encodeObject:self->_ownerBeaconIdentifier forKey:@"ownerBeaconIdentifier"];
  [v5 encodeObject:self->_modelName forKey:@"modelName"];
  [v5 encodeObject:self->_manufacturerName forKey:@"manufacturerName"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_keySyncRecord forKey:@"keySyncRecord"];
  [v5 encodeObject:self->_lostModeInfo forKey:@"lostModeInfo"];
  [v5 encodeObject:self->_taskInformation forKey:@"taskInformation"];
  [v5 encodeObject:self->_owner forKey:@"owner"];
  [v5 encodeObject:self->_role forKey:@"role"];
  [v5 encodeObject:self->_safeLocations forKey:@"safeLocations"];
  [v5 encodeObject:self->_accessoryProductInfo forKey:@"accessoryProductInfo"];
  [v5 encodeBool:self->_isAppleAudioAccessory forKey:@"isAppleAudioAccessory"];
  [v5 encodeBool:self->_isZeus forKey:@"isZeus"];
  [v5 encodeBool:self->_canBeLeashedByHost forKey:@"canBeLeashedByHost"];
  [v5 encodeBool:self->_connected forKey:@"connected"];
  [v5 encodeObject:self->_discoveryId forKey:@"discoveryId"];
  [v5 encodeInteger:self->_internalShareType forKey:@"internalShareType"];
}

- (SPInternalSimpleBeacon)initWithCoder:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  NSUInteger v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  type = self->_type;
  self->_type = v9;

  self->_partIdentifier = (int)[v4 decodeIntForKey:@"partIdentifier"];
  self->_BOOL connectionAllowed = [v4 decodeBoolForKey:@"connectionAllowed"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
  systemVersion = self->_systemVersion;
  self->_systemVersion = v11;

  [v4 decodeDoubleForKey:@"txPower"];
  self->_txPower = v13;
  [v4 decodeDoubleForKey:@"vendorId"];
  self->_int64_t vendorId = (uint64_t)v14;
  [v4 decodeDoubleForKey:@"productId"];
  self->_int64_t productId = (uint64_t)v15;
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productUUID"];
  productUUID = self->_productUUID;
  self->_productUUID = v16;

  [v4 decodeDoubleForKey:@"batteryLevel"];
  self->_int64_t batteryLevel = (uint64_t)v18;
  [v4 decodeDoubleForKey:@"connectableDeviceCount"];
  self->_int64_t connectableDeviceCount = (uint64_t)v19;
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v20;

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerBeaconIdentifier"];
  ownerBeaconIdentifier = self->_ownerBeaconIdentifier;
  self->_ownerBeaconIdentifier = v22;

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
  modelName = self->_modelName;
  self->_modelName = v24;

  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerName"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v26;

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v28;

  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySyncRecord"];
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v30;

  v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeInfo"];
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v32;

  uint64_t v34 = objc_opt_class();
  v35 = [v4 decodeDictionaryWithKeysOfClass:v34 objectsOfClass:objc_opt_class() forKey:@"taskInformation"];
  taskInformation = self->_taskInformation;
  self->_taskInformation = v35;

  int v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owner"];
  owner = self->_owner;
  self->_owner = v37;

  v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  role = self->_role;
  self->_role = v39;

  int v41 = (void *)MEMORY[0x1E4F1CAD0];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v43 = [v41 setWithArray:v42];
  v44 = [v4 decodeObjectOfClasses:v43 forKey:@"safeLocations"];
  safeLocations = self->_safeLocations;
  self->_safeLocations = v44;

  v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryProductInfo"];
  accessoryProductInfo = self->_accessoryProductInfo;
  self->_accessoryProductInfo = v46;

  self->_isAppleAudioAccessory = [v4 decodeBoolForKey:@"isAppleAudioAccessory"];
  self->_isZeus = [v4 decodeBoolForKey:@"isZeus"];
  self->_canBeLeashedByHost = [v4 decodeBoolForKey:@"canBeLeashedByHost"];
  self->_connected = [v4 decodeBoolForKey:@"connected"];
  v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveryId"];
  discoveryId = self->_discoveryId;
  self->_discoveryId = v48;

  int64_t v50 = [v4 decodeIntegerForKey:@"internalShareType"];
  self->_internalShareType = v50;
  return self;
}

- (id)debugDescription
{
  uint64_t v3 = [(SPInternalSimpleBeacon *)self groupIdentifier];

  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    v6 = [(SPInternalSimpleBeacon *)self groupIdentifier];
    NSUInteger v7 = [(SPInternalSimpleBeacon *)self identifier];
    unint64_t v8 = [v4 stringWithFormat:@"<%@: %p (%@) %@>", v5, self, v6, v7];
  }
  else
  {
    v6 = [(SPInternalSimpleBeacon *)self identifier];
    unint64_t v8 = [v4 stringWithFormat:@"<%@: %p %@>", v5, self, v6];
  }

  return v8;
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSUUID)ownerBeaconIdentifier
{
  return self->_ownerBeaconIdentifier;
}

- (void)setOwnerBeaconIdentifier:(id)a3
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

- (BOOL)connectionAllowed
{
  return self->_connectionAllowed;
}

- (void)setConnectionAllowed:(BOOL)a3
{
  self->_BOOL connectionAllowed = a3;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (double)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(double)a3
{
  self->_txPower = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (int64_t)internalShareType
{
  return self->_internalShareType;
}

- (void)setInternalShareType:(int64_t)a3
{
  self->_internalShareType = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_int64_t connectableDeviceCount = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (SPKeySyncRecord)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_int64_t batteryLevel = a3;
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
  self->_int64_t vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_int64_t productId = a3;
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
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryId, 0);
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_ownerBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end