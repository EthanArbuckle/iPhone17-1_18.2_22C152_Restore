@interface SPBeacon
+ (BOOL)supportsSecureCoding;
+ (SPHandle)SPOwner;
- (BOOL)accepted;
- (BOOL)canBeLeashedByHost;
- (BOOL)connected;
- (BOOL)connectionAllowed;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isZeus;
- (NSDate)connectedStateExpiryDate;
- (NSDate)keyAlignmentLastIndexObservationDate;
- (NSDate)keySyncLastIndexObservationDate;
- (NSDate)pairingDate;
- (NSDictionary)taskInformation;
- (NSSet)locationProviders;
- (NSSet)safeLocations;
- (NSSet)shares;
- (NSString)correlationIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)separationState;
- (NSString)serialNumber;
- (NSString)stableIdentifier;
- (NSString)systemVersion;
- (NSString)type;
- (NSUUID)groupIdentifier;
- (NSUUID)identifier;
- (NSUUID)ownerBeaconIdentifier;
- (NSUUID)productUUID;
- (SPBeacon)initWithCoder:(id)a3;
- (SPBeaconRole)role;
- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo;
- (SPHandle)owner;
- (SPLostModeInfo)lostModeInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)batteryLevel;
- (int64_t)beaconSeparationState;
- (int64_t)connectableDeviceCount;
- (int64_t)internalShareType;
- (int64_t)partIdentifier;
- (int64_t)productId;
- (int64_t)vendorId;
- (unint64_t)hash;
- (unint64_t)keyAlignmentLastObservedIndex;
- (unint64_t)keySyncLastObservedIndex;
- (unint64_t)keySyncWildIndexFallback;
- (void)encodeWithCoder:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setAccessoryProductInfo:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setBeaconSeparationState:(int64_t)a3;
- (void)setCanBeLeashedByHost:(BOOL)a3;
- (void)setConnectableDeviceCount:(int64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectedStateExpiryDate:(id)a3;
- (void)setConnectionAllowed:(BOOL)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalShareType:(int64_t)a3;
- (void)setIsAppleAudioAccessory:(BOOL)a3;
- (void)setIsZeus:(BOOL)a3;
- (void)setKeyAlignmentLastIndexObservationDate:(id)a3;
- (void)setKeyAlignmentLastObservedIndex:(unint64_t)a3;
- (void)setKeySyncLastIndexObservationDate:(id)a3;
- (void)setKeySyncLastObservedIndex:(unint64_t)a3;
- (void)setKeySyncWildIndexFallback:(unint64_t)a3;
- (void)setLocationProviders:(id)a3;
- (void)setLostModeInfo:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setOwnerBeaconIdentifier:(id)a3;
- (void)setPairingDate:(id)a3;
- (void)setPartIdentifier:(int64_t)a3;
- (void)setProductId:(int64_t)a3;
- (void)setProductUUID:(id)a3;
- (void)setRole:(id)a3;
- (void)setSafeLocations:(id)a3;
- (void)setSeparationState:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setShares:(id)a3;
- (void)setStableIdentifier:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTaskInformation:(id)a3;
- (void)setType:(id)a3;
- (void)setVendorId:(int64_t)a3;
@end

@implementation SPBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPHandle)SPOwner
{
  return +[SPHandle handleWithEmailAddress:@"owner@localhost"];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPBeacon *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPBeacon *)self identifier];
      v7 = [(SPBeacon *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SPBeacon *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPBeacon *)self identifier];
  [v4 setIdentifier:v5];

  v6 = [(SPBeacon *)self groupIdentifier];
  [v4 setGroupIdentifier:v6];

  objc_msgSend(v4, "setPartIdentifier:", -[SPBeacon partIdentifier](self, "partIdentifier"));
  v7 = [(SPBeacon *)self stableIdentifier];
  char v8 = (void *)[v7 copy];
  [v4 setStableIdentifier:v8];

  v9 = [(SPBeacon *)self owner];
  v10 = (void *)[v9 copy];
  [v4 setOwner:v10];

  objc_msgSend(v4, "setAccepted:", -[SPBeacon accepted](self, "accepted"));
  v11 = [(SPBeacon *)self name];
  v12 = (void *)[v11 copy];
  [v4 setName:v12];

  v13 = [(SPBeacon *)self model];
  v14 = (void *)[v13 copy];
  [v4 setModel:v14];

  v15 = [(SPBeacon *)self pairingDate];
  v16 = (void *)[v15 copy];
  [v4 setPairingDate:v16];

  v17 = [(SPBeacon *)self role];
  v18 = (void *)[v17 copy];
  [v4 setRole:v18];

  v19 = [(SPBeacon *)self lostModeInfo];
  v20 = (void *)[v19 copy];
  [v4 setLostModeInfo:v20];

  v21 = [(SPBeacon *)self shares];
  v22 = (void *)[v21 copy];
  [v4 setShares:v22];

  v23 = [(SPBeacon *)self taskInformation];
  v24 = (void *)[v23 copy];
  [v4 setTaskInformation:v24];

  v25 = [(SPBeacon *)self correlationIdentifier];
  v26 = (void *)[v25 copy];
  [v4 setCorrelationIdentifier:v26];

  v27 = [(SPBeacon *)self type];
  v28 = (void *)[v27 copy];
  [v4 setType:v28];

  objc_msgSend(v4, "setIsZeus:", -[SPBeacon isZeus](self, "isZeus"));
  v29 = [(SPBeacon *)self systemVersion];
  v30 = (void *)[v29 copy];
  [v4 setSystemVersion:v30];

  v31 = [(SPBeacon *)self productUUID];
  v32 = (void *)[v31 copy];
  [v4 setProductUUID:v32];

  objc_msgSend(v4, "setVendorId:", -[SPBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPBeacon productId](self, "productId"));
  objc_msgSend(v4, "setConnected:", -[SPBeacon connected](self, "connected"));
  v33 = [(SPBeacon *)self connectedStateExpiryDate];
  v34 = (void *)[v33 copy];
  [v4 setConnectedStateExpiryDate:v34];

  objc_msgSend(v4, "setConnectionAllowed:", -[SPBeacon connectionAllowed](self, "connectionAllowed"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  v35 = [(SPBeacon *)self separationState];
  v36 = (void *)[v35 copy];
  [v4 setSeparationState:v36];

  v37 = [(SPBeacon *)self safeLocations];
  v38 = (void *)[v37 copy];
  [v4 setSafeLocations:v38];

  objc_msgSend(v4, "setCanBeLeashedByHost:", -[SPBeacon canBeLeashedByHost](self, "canBeLeashedByHost"));
  objc_msgSend(v4, "setBeaconSeparationState:", -[SPBeacon beaconSeparationState](self, "beaconSeparationState"));
  objc_msgSend(v4, "setBatteryLevel:", -[SPBeacon batteryLevel](self, "batteryLevel"));
  v39 = [(SPBeacon *)self serialNumber];
  [v4 setSerialNumber:v39];

  v40 = [(SPBeacon *)self locationProviders];
  v41 = (void *)[v40 copy];
  [v4 setLocationProviders:v41];

  objc_msgSend(v4, "setKeySyncLastObservedIndex:", -[SPBeacon keySyncLastObservedIndex](self, "keySyncLastObservedIndex"));
  v42 = [(SPBeacon *)self keySyncLastIndexObservationDate];
  v43 = (void *)[v42 copy];
  [v4 setKeySyncLastIndexObservationDate:v43];

  objc_msgSend(v4, "setKeySyncWildIndexFallback:", -[SPBeacon keySyncWildIndexFallback](self, "keySyncWildIndexFallback"));
  objc_msgSend(v4, "setKeyAlignmentLastObservedIndex:", -[SPBeacon keyAlignmentLastObservedIndex](self, "keyAlignmentLastObservedIndex"));
  v44 = [(SPBeacon *)self keyAlignmentLastIndexObservationDate];
  v45 = (void *)[v44 copy];
  [v4 setKeyAlignmentLastIndexObservationDate:v45];

  v46 = [(SPBeacon *)self accessoryProductInfo];
  v47 = (void *)[v46 copy];
  [v4 setAccessoryProductInfo:v47];

  objc_msgSend(v4, "setInternalShareType:", -[SPBeacon internalShareType](self, "internalShareType"));
  v48 = [(SPBeacon *)self ownerBeaconIdentifier];
  v49 = (void *)[v48 copy];
  [v4 setOwnerBeaconIdentifier:v49];

  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v11 = a3;
  [v11 encodeObject:identifier forKey:@"identifier"];
  [v11 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v11 encodeInteger:self->_partIdentifier forKey:@"partIdentifier"];
  [v11 encodeObject:self->_stableIdentifier forKey:@"stableIdentifier"];
  [v11 encodeObject:self->_owner forKey:@"owner"];
  [v11 encodeBool:self->_accepted forKey:@"accepted"];
  [v11 encodeObject:self->_name forKey:@"name"];
  [v11 encodeObject:self->_model forKey:@"model"];
  [v11 encodeObject:self->_pairingDate forKey:@"pairingDate"];
  [v11 encodeObject:self->_lostModeInfo forKey:@"lostModeInfo"];
  [v11 encodeObject:self->_shares forKey:@"shares"];
  v5 = [(SPBeacon *)self taskInformation];
  [v11 encodeObject:v5 forKey:@"taskInformation"];

  v6 = [(SPBeacon *)self correlationIdentifier];
  [v11 encodeObject:v6 forKey:@"correlationIdentifier"];

  v7 = [(SPBeacon *)self role];
  [v11 encodeObject:v7 forKey:@"role"];

  [v11 encodeObject:self->_type forKey:@"type"];
  [v11 encodeBool:self->_isZeus forKey:@"isZeus"];
  [v11 encodeObject:self->_systemVersion forKey:@"systemVersion"];
  [v11 encodeObject:self->_productUUID forKey:@"productUUID"];
  [v11 encodeInteger:self->_vendorId forKey:@"vendorId"];
  [v11 encodeInteger:self->_productId forKey:@"productId"];
  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon connected](self, "connected"), @"connected");
  char v8 = [(SPBeacon *)self connectedStateExpiryDate];
  [v11 encodeObject:v8 forKey:@"connectedStateExpiryDate"];

  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon connectionAllowed](self, "connectionAllowed"), @"connectionAllowed");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon connectableDeviceCount](self, "connectableDeviceCount"), @"connectableDeviceCount");
  v9 = [(SPBeacon *)self separationState];
  [v11 encodeObject:v9 forKey:@"separationState"];

  v10 = [(SPBeacon *)self safeLocations];
  [v11 encodeObject:v10 forKey:@"safeLocations"];

  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon canBeLeashedByHost](self, "canBeLeashedByHost"), @"canBeLeashedByHost");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon beaconSeparationState](self, "beaconSeparationState"), @"beaconSeparationState");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon batteryLevel](self, "batteryLevel"), @"batteryLevel");
  [v11 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v11 encodeObject:self->_locationProviders forKey:@"locationProviders"];
  [v11 encodeInt64:self->_keySyncLastObservedIndex forKey:@"keySyncLastObservedIndex"];
  [v11 encodeObject:self->_keySyncLastIndexObservationDate forKey:@"keySyncLastIndexObservationDate"];
  [v11 encodeInt64:self->_keySyncWildIndexFallback forKey:@"keySyncWildIndexFallback"];
  [v11 encodeInt64:self->_keyAlignmentLastObservedIndex forKey:@"keyAlignmentLastObservedIndex"];
  [v11 encodeObject:self->_keyAlignmentLastIndexObservationDate forKey:@"keyAlignmentLastIndexObservationDate"];
  [v11 encodeObject:self->_accessoryProductInfo forKey:@"accessoryProductInfo"];
  [v11 encodeInteger:self->_internalShareType forKey:@"internalShareType"];
  [v11 encodeObject:self->_ownerBeaconIdentifier forKey:@"ownerBeaconIdentifier"];
  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"), @"isAppleAudioAccessory");
}

- (SPBeacon)initWithCoder:(id)a3
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v7;

  self->_partIdentifier = [v4 decodeIntegerForKey:@"partIdentifier"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stableIdentifier"];
  stableIdentifier = self->_stableIdentifier;
  self->_stableIdentifier = v9;

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owner"];
  owner = self->_owner;
  self->_owner = v11;

  self->_accepted = [v4 decodeBoolForKey:@"accepted"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  model = self->_model;
  self->_model = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  role = self->_role;
  self->_role = v17;

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  v21 = [v19 setWithArray:v20];
  v22 = [v4 decodeObjectOfClasses:v21 forKey:@"shares"];
  shares = self->_shares;
  self->_shares = v22;

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeInfo"];
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v24;

  v26 = (void *)MEMORY[0x1E4F1CAD0];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  v68[2] = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  v28 = [v26 setWithArray:v27];
  v29 = [v4 decodeObjectOfClasses:v28 forKey:@"taskInformation"];
  taskInformation = self->_taskInformation;
  self->_taskInformation = v29;

  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"correlationIdentifier"];
  correlationIdentifier = self->_correlationIdentifier;
  self->_correlationIdentifier = v31;

  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingDate"];
  pairingDate = self->_pairingDate;
  self->_pairingDate = v33;

  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  type = self->_type;
  self->_type = v35;

  self->_isZeus = [v4 decodeBoolForKey:@"isZeus"];
  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
  systemVersion = self->_systemVersion;
  self->_systemVersion = v37;

  v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productUUID"];
  productUUID = self->_productUUID;
  self->_productUUID = v39;

  self->_vendorId = [v4 decodeIntegerForKey:@"vendorId"];
  self->_productId = [v4 decodeIntegerForKey:@"productId"];
  self->_connected = [v4 decodeBoolForKey:@"connected"];
  v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedStateExpiryDate"];
  connectedStateExpiryDate = self->_connectedStateExpiryDate;
  self->_connectedStateExpiryDate = v41;

  self->_connectionAllowed = [v4 decodeBoolForKey:@"connectionAllowed"];
  self->_connectableDeviceCount = [v4 decodeIntegerForKey:@"connectableDeviceCount"];
  v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"separationState"];
  separationState = self->_separationState;
  self->_separationState = v43;

  self->_canBeLeashedByHost = [v4 decodeBoolForKey:@"canBeLeashedByHost"];
  v45 = (void *)MEMORY[0x1E4F1CAD0];
  v67[0] = objc_opt_class();
  v67[1] = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  v47 = [v45 setWithArray:v46];
  v48 = [v4 decodeObjectOfClasses:v47 forKey:@"safeLocations"];
  safeLocations = self->_safeLocations;
  self->_safeLocations = v48;

  self->_beaconSeparationState = [v4 decodeIntegerForKey:@"beaconSeparationState"];
  self->_batteryLevel = [v4 decodeIntegerForKey:@"batteryLevel"];
  v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v50;

  v52 = (void *)MEMORY[0x1E4F1CAD0];
  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v54 = objc_msgSend(v52, "setWithArray:", v53, v66[0]);
  v55 = [v4 decodeObjectOfClasses:v54 forKey:@"locationProviders"];
  locationProviders = self->_locationProviders;
  self->_locationProviders = v55;

  self->_keySyncLastObservedIndex = [v4 decodeInt64ForKey:@"keySyncLastObservedIndex"];
  v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySyncLastIndexObservationDate"];
  keySyncLastIndexObservationDate = self->_keySyncLastIndexObservationDate;
  self->_keySyncLastIndexObservationDate = v57;

  self->_keySyncWildIndexFallback = [v4 decodeInt64ForKey:@"keySyncWildIndexFallback"];
  self->_keyAlignmentLastObservedIndex = [v4 decodeInt64ForKey:@"keyAlignmentLastObservedIndex"];
  v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyAlignmentLastIndexObservationDate"];
  keyAlignmentLastIndexObservationDate = self->_keyAlignmentLastIndexObservationDate;
  self->_keyAlignmentLastIndexObservationDate = v59;

  v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryProductInfo"];
  accessoryProductInfo = self->_accessoryProductInfo;
  self->_accessoryProductInfo = v61;

  self->_internalShareType = [v4 decodeIntegerForKey:@"internalShareType"];
  v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerBeaconIdentifier"];
  ownerBeaconIdentifier = self->_ownerBeaconIdentifier;
  self->_ownerBeaconIdentifier = v63;

  LOBYTE(v54) = [v4 decodeBoolForKey:@"isAppleAudioAccessory"];
  self->_isAppleAudioAccessory = (char)v54;
  return self;
}

- (id)debugDescription
{
  unint64_t v3 = [(SPBeacon *)self groupIdentifier];

  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    v6 = [(SPBeacon *)self groupIdentifier];
    v7 = [(SPBeacon *)self identifier];
    char v8 = [v4 stringWithFormat:@"<%@: %p (%@) %@>", v5, self, v6, v7];
  }
  else
  {
    v6 = [(SPBeacon *)self identifier];
    char v8 = [v4 stringWithFormat:@"<%@: %p %@>", v5, self, v6];
  }

  return v8;
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

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (SPBeaconRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
}

- (NSSet)shares
{
  return self->_shares;
}

- (void)setShares:(id)a3
{
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
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

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)canBeLeashedByHost
{
  return self->_canBeLeashedByHost;
}

- (void)setCanBeLeashedByHost:(BOOL)a3
{
  self->_canBeLeashedByHost = a3;
}

- (BOOL)connectionAllowed
{
  return self->_connectionAllowed;
}

- (void)setConnectionAllowed:(BOOL)a3
{
  self->_connectionAllowed = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_connectableDeviceCount = a3;
}

- (NSString)separationState
{
  return self->_separationState;
}

- (void)setSeparationState:(id)a3
{
}

- (int64_t)beaconSeparationState
{
  return self->_beaconSeparationState;
}

- (void)setBeaconSeparationState:(int64_t)a3
{
  self->_beaconSeparationState = a3;
}

- (NSSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
}

- (NSSet)locationProviders
{
  return self->_locationProviders;
}

- (void)setLocationProviders:(id)a3
{
}

- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo
{
  return self->_accessoryProductInfo;
}

- (void)setAccessoryProductInfo:(id)a3
{
}

- (NSString)stableIdentifier
{
  return self->_stableIdentifier;
}

- (void)setStableIdentifier:(id)a3
{
}

- (NSDate)pairingDate
{
  return self->_pairingDate;
}

- (void)setPairingDate:(id)a3
{
}

- (NSString)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (NSDate)connectedStateExpiryDate
{
  return self->_connectedStateExpiryDate;
}

- (void)setConnectedStateExpiryDate:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (unint64_t)keySyncLastObservedIndex
{
  return self->_keySyncLastObservedIndex;
}

- (void)setKeySyncLastObservedIndex:(unint64_t)a3
{
  self->_keySyncLastObservedIndex = a3;
}

- (NSDate)keySyncLastIndexObservationDate
{
  return self->_keySyncLastIndexObservationDate;
}

- (void)setKeySyncLastIndexObservationDate:(id)a3
{
}

- (unint64_t)keySyncWildIndexFallback
{
  return self->_keySyncWildIndexFallback;
}

- (void)setKeySyncWildIndexFallback:(unint64_t)a3
{
  self->_keySyncWildIndexFallback = a3;
}

- (unint64_t)keyAlignmentLastObservedIndex
{
  return self->_keyAlignmentLastObservedIndex;
}

- (void)setKeyAlignmentLastObservedIndex:(unint64_t)a3
{
  self->_keyAlignmentLastObservedIndex = a3;
}

- (NSDate)keyAlignmentLastIndexObservationDate
{
  return self->_keyAlignmentLastIndexObservationDate;
}

- (void)setKeyAlignmentLastIndexObservationDate:(id)a3
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

- (NSUUID)ownerBeaconIdentifier
{
  return self->_ownerBeaconIdentifier;
}

- (void)setOwnerBeaconIdentifier:(id)a3
{
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAlignmentLastIndexObservationDate, 0);
  objc_storeStrong((id *)&self->_keySyncLastIndexObservationDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_connectedStateExpiryDate, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingDate, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_locationProviders, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_separationState, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_shares, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end