@interface SPDiscoveredAccessoryProductInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)eligibleForPairing;
- (BOOL)hidden;
- (BOOL)isAirTag;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isHELEAccessory;
- (BOOL)isManagedAccessory;
- (BOOL)supportBeaconGroupInfo;
- (NSArray)layoutTemplate;
- (NSData)encryptionKeyE1;
- (NSData)encryptionKeyE2;
- (NSData)verificationKeyS2;
- (NSString)appBundleIdentifier;
- (NSString)findmyProductId;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)version;
- (NSURL)defaultHeroIcon;
- (NSURL)defaultHeroIcon2x;
- (NSURL)defaultHeroIcon3x;
- (NSURL)defaultListIcon;
- (NSURL)defaultListIcon2x;
- (NSURL)defaultListIcon3x;
- (NSURL)disableURL;
- (NSURL)lowBatteryInfoURL;
- (SPBeaconRole)defaultRole;
- (SPDiscoveredAccessoryProductInformation)initWithCoder:(id)a3;
- (SPUnknownProductMetadata)disableMetadata;
- (SPUnknownProductMetadata)learnModeMetadata;
- (double)txPower;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)beaconGroupVersion;
- (unint64_t)capabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setBeaconGroupVersion:(int64_t)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setDefaultHeroIcon2x:(id)a3;
- (void)setDefaultHeroIcon3x:(id)a3;
- (void)setDefaultHeroIcon:(id)a3;
- (void)setDefaultListIcon2x:(id)a3;
- (void)setDefaultListIcon3x:(id)a3;
- (void)setDefaultListIcon:(id)a3;
- (void)setDefaultRole:(id)a3;
- (void)setDisableMetadata:(id)a3;
- (void)setDisableURL:(id)a3;
- (void)setEligibleForPairing:(BOOL)a3;
- (void)setEncryptionKeyE1:(id)a3;
- (void)setEncryptionKeyE2:(id)a3;
- (void)setFindmyProductId:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsAirTag:(BOOL)a3;
- (void)setIsAppleAudioAccessory:(BOOL)a3;
- (void)setIsHELEAccessory:(BOOL)a3;
- (void)setIsManagedAccessory:(BOOL)a3;
- (void)setLayoutTemplate:(id)a3;
- (void)setLearnModeMetadata:(id)a3;
- (void)setLowBatteryInfoURL:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setSupportBeaconGroupInfo:(BOOL)a3;
- (void)setTxPower:(double)a3;
- (void)setVerificationKeyS2:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SPDiscoveredAccessoryProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setBeaconGroupVersion:", -[SPDiscoveredAccessoryProductInformation beaconGroupVersion](self, "beaconGroupVersion"));
  objc_msgSend(v4, "setEligibleForPairing:", -[SPDiscoveredAccessoryProductInformation eligibleForPairing](self, "eligibleForPairing"));
  objc_msgSend(v4, "setHidden:", -[SPDiscoveredAccessoryProductInformation hidden](self, "hidden"));
  objc_msgSend(v4, "setIsHELEAccessory:", -[SPDiscoveredAccessoryProductInformation isHELEAccessory](self, "isHELEAccessory"));
  objc_msgSend(v4, "setIsManagedAccessory:", -[SPDiscoveredAccessoryProductInformation isManagedAccessory](self, "isManagedAccessory"));
  objc_msgSend(v4, "setSupportBeaconGroupInfo:", -[SPDiscoveredAccessoryProductInformation supportBeaconGroupInfo](self, "supportBeaconGroupInfo"));
  v5 = [(SPDiscoveredAccessoryProductInformation *)self findmyProductId];
  v6 = (void *)[v5 copy];
  [v4 setFindmyProductId:v6];

  v7 = [(SPDiscoveredAccessoryProductInformation *)self modelName];
  v8 = (void *)[v7 copy];
  [v4 setModelName:v8];

  v9 = [(SPDiscoveredAccessoryProductInformation *)self manufacturerName];
  v10 = (void *)[v9 copy];
  [v4 setManufacturerName:v10];

  v11 = [(SPDiscoveredAccessoryProductInformation *)self defaultRole];
  v12 = (void *)[v11 copy];
  [v4 setDefaultRole:v12];

  v13 = [(SPDiscoveredAccessoryProductInformation *)self appBundleIdentifier];
  v14 = (void *)[v13 copy];
  [v4 setAppBundleIdentifier:v14];

  v15 = [(SPDiscoveredAccessoryProductInformation *)self lowBatteryInfoURL];
  v16 = (void *)[v15 copy];
  [v4 setLowBatteryInfoURL:v16];

  v17 = [(SPDiscoveredAccessoryProductInformation *)self disableURL];
  v18 = (void *)[v17 copy];
  [v4 setDisableURL:v18];

  v19 = [(SPDiscoveredAccessoryProductInformation *)self version];
  v20 = (void *)[v19 copy];
  [v4 setVersion:v20];

  v21 = [(SPDiscoveredAccessoryProductInformation *)self encryptionKeyE1];
  v22 = (void *)[v21 copy];
  [v4 setEncryptionKeyE1:v22];

  v23 = [(SPDiscoveredAccessoryProductInformation *)self encryptionKeyE2];
  v24 = (void *)[v23 copy];
  [v4 setEncryptionKeyE2:v24];

  v25 = [(SPDiscoveredAccessoryProductInformation *)self verificationKeyS2];
  v26 = (void *)[v25 copy];
  [v4 setVerificationKeyS2:v26];

  [(SPDiscoveredAccessoryProductInformation *)self txPower];
  objc_msgSend(v4, "setTxPower:");
  objc_msgSend(v4, "setIsAirTag:", -[SPDiscoveredAccessoryProductInformation isAirTag](self, "isAirTag"));
  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPDiscoveredAccessoryProductInformation isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  objc_msgSend(v4, "setCapabilities:", -[SPDiscoveredAccessoryProductInformation capabilities](self, "capabilities"));
  v27 = [(SPDiscoveredAccessoryProductInformation *)self layoutTemplate];
  v28 = (void *)[v27 copy];
  [v4 setLayoutTemplate:v28];

  v29 = [(SPDiscoveredAccessoryProductInformation *)self defaultHeroIcon];
  v30 = (void *)[v29 copy];
  [v4 setDefaultHeroIcon:v30];

  v31 = [(SPDiscoveredAccessoryProductInformation *)self defaultListIcon];
  v32 = (void *)[v31 copy];
  [v4 setDefaultListIcon:v32];

  v33 = [(SPDiscoveredAccessoryProductInformation *)self defaultHeroIcon2x];
  v34 = (void *)[v33 copy];
  [v4 setDefaultHeroIcon2x:v34];

  v35 = [(SPDiscoveredAccessoryProductInformation *)self defaultListIcon2x];
  v36 = (void *)[v35 copy];
  [v4 setDefaultListIcon2x:v36];

  v37 = [(SPDiscoveredAccessoryProductInformation *)self defaultHeroIcon3x];
  v38 = (void *)[v37 copy];
  [v4 setDefaultHeroIcon3x:v38];

  v39 = [(SPDiscoveredAccessoryProductInformation *)self defaultListIcon3x];
  v40 = (void *)[v39 copy];
  [v4 setDefaultListIcon3x:v40];

  v41 = [(SPDiscoveredAccessoryProductInformation *)self learnModeMetadata];
  v42 = (void *)[v41 copy];
  [v4 setLearnModeMetadata:v42];

  v43 = [(SPDiscoveredAccessoryProductInformation *)self disableMetadata];
  v44 = (void *)[v43 copy];
  [v4 setDisableMetadata:v44];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t beaconGroupVersion = self->_beaconGroupVersion;
  id v6 = a3;
  [v6 encodeInteger:beaconGroupVersion forKey:@"beaconGroupVersion"];
  [v6 encodeBool:self->_eligibleForPairing forKey:@"eligibleForPairing"];
  [v6 encodeBool:self->_hidden forKey:@"hidden"];
  [v6 encodeBool:self->_isHELEAccessory forKey:@"isHELEAccessory"];
  [v6 encodeBool:self->_isManagedAccessory forKey:@"isManagedAccessory"];
  [v6 encodeBool:self->_supportBeaconGroupInfo forKey:@"supportBeaconGroupInfo"];
  [v6 encodeObject:self->_findmyProductId forKey:@"findmyProductId"];
  [v6 encodeObject:self->_modelName forKey:@"modelName"];
  [v6 encodeObject:self->_manufacturerName forKey:@"manufacturerName"];
  [v6 encodeObject:self->_defaultRole forKey:@"defaultRole"];
  [v6 encodeObject:self->_appBundleIdentifier forKey:@"appBundleIdentifier"];
  [v6 encodeObject:self->_lowBatteryInfoURL forKey:@"lowBatteryInfoURL"];
  [v6 encodeObject:self->_disableURL forKey:@"disableURL"];
  [v6 encodeObject:self->_version forKey:@"version"];
  [v6 encodeObject:self->_encryptionKeyE1 forKey:@"encryptionKeyE1"];
  [v6 encodeObject:self->_encryptionKeyE2 forKey:@"encryptionKeyE2"];
  [v6 encodeObject:self->_verificationKeyS2 forKey:@"verificationKeyS2"];
  [v6 encodeDouble:@"txPower" forKey:self->_txPower];
  [v6 encodeBool:self->_isAirTag forKey:@"isAirTag"];
  [v6 encodeBool:self->_isAppleAudioAccessory forKey:@"isAppleAudioAccessory"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_capabilities];
  [v6 encodeObject:v5 forKey:@"capabilities"];

  [v6 encodeObject:self->_layoutTemplate forKey:@"layoutTemplate"];
  [v6 encodeObject:self->_defaultHeroIcon forKey:@"defaultHeroIcon"];
  [v6 encodeObject:self->_defaultListIcon forKey:@"defaultListIcon"];
  [v6 encodeObject:self->_defaultHeroIcon2x forKey:@"defaultHeroIcon2x"];
  [v6 encodeObject:self->_defaultListIcon2x forKey:@"defaultListIcon2x"];
  [v6 encodeObject:self->_defaultHeroIcon3x forKey:@"defaultHeroIcon3x"];
  [v6 encodeObject:self->_defaultListIcon3x forKey:@"defaultListIcon3x"];
  [v6 encodeObject:self->_learnModeMetadata forKey:@"learnModeMetadata"];
  [v6 encodeObject:self->_disableMetadata forKey:@"disableMetadata"];
}

- (SPDiscoveredAccessoryProductInformation)initWithCoder:(id)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int64_t beaconGroupVersion = [v4 decodeIntegerForKey:@"beaconGroupVersion"];
  self->_eligibleForPairing = [v4 decodeBoolForKey:@"eligibleForPairing"];
  self->_hidden = [v4 decodeBoolForKey:@"hidden"];
  self->_isHELEAccessory = [v4 decodeBoolForKey:@"isHELEAccessory"];
  self->_isManagedAccessory = [v4 decodeBoolForKey:@"isManagedAccessory"];
  self->_supportBeaconGroupInfo = [v4 decodeBoolForKey:@"supportBeaconGroupInfo"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findmyProductId"];
  findmyProductId = self->_findmyProductId;
  self->_findmyProductId = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
  modelName = self->_modelName;
  self->_modelName = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerName"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultRole"];
  defaultRole = self->_defaultRole;
  self->_defaultRole = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lowBatteryInfoURL"];
  lowBatteryInfoURL = self->_lowBatteryInfoURL;
  self->_lowBatteryInfoURL = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableURL"];
  disableURL = self->_disableURL;
  self->_disableURL = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  version = self->_version;
  self->_version = v19;

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionKeyE1"];
  encryptionKeyE1 = self->_encryptionKeyE1;
  self->_encryptionKeyE1 = v21;

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionKeyE2"];
  encryptionKeyE2 = self->_encryptionKeyE2;
  self->_encryptionKeyE2 = v23;

  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verificationKeyS2"];
  verificationKeyS2 = self->_verificationKeyS2;
  self->_verificationKeyS2 = v25;

  [v4 decodeDoubleForKey:@"txPower"];
  self->_txPower = v27;
  self->_isAirTag = [v4 decodeBoolForKey:@"isAirTag"];
  self->_isAppleAudioAccessory = [v4 decodeBoolForKey:@"isAppleAudioAccessory"];
  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];
  self->_capabilities = [v28 unsignedIntegerValue];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v31 = [v29 setWithArray:v30];
  v32 = [v4 decodeObjectOfClasses:v31 forKey:@"layoutTemplate"];
  layoutTemplate = self->_layoutTemplate;
  self->_layoutTemplate = v32;

  v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultHeroIcon"];
  defaultHeroIcon = self->_defaultHeroIcon;
  self->_defaultHeroIcon = v34;

  v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultListIcon"];
  defaultListIcon = self->_defaultListIcon;
  self->_defaultListIcon = v36;

  v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultHeroIcon2x"];
  defaultHeroIcon2x = self->_defaultHeroIcon2x;
  self->_defaultHeroIcon2x = v38;

  v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultListIcon2x"];
  defaultListIcon2x = self->_defaultListIcon2x;
  self->_defaultListIcon2x = v40;

  v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultHeroIcon3x"];
  defaultHeroIcon3x = self->_defaultHeroIcon3x;
  self->_defaultHeroIcon3x = v42;

  v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultListIcon3x"];
  defaultListIcon3x = self->_defaultListIcon3x;
  self->_defaultListIcon3x = v44;

  v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learnModeMetadata"];
  learnModeMetadata = self->_learnModeMetadata;
  self->_learnModeMetadata = v46;

  v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableMetadata"];

  disableMetadata = self->_disableMetadata;
  self->_disableMetadata = v48;

  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SPDiscoveredAccessoryProductInformation *)self manufacturerName];
  id v6 = [(SPDiscoveredAccessoryProductInformation *)self modelName];
  v7 = [(SPDiscoveredAccessoryProductInformation *)self findmyProductId];
  v8 = [v3 stringWithFormat:@"<%@: %p manufacturer: %@ model: %@ productId: %@ isAirTag: %d isAppleAudioAccessory: %d>", v4, self, v5, v6, v7, -[SPDiscoveredAccessoryProductInformation isAirTag](self, "isAirTag"), -[SPDiscoveredAccessoryProductInformation isAppleAudioAccessory](self, "isAppleAudioAccessory")];

  return v8;
}

- (int64_t)beaconGroupVersion
{
  return self->_beaconGroupVersion;
}

- (void)setBeaconGroupVersion:(int64_t)a3
{
  self->_int64_t beaconGroupVersion = a3;
}

- (BOOL)eligibleForPairing
{
  return self->_eligibleForPairing;
}

- (void)setEligibleForPairing:(BOOL)a3
{
  self->_eligibleForPairing = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHELEAccessory
{
  return self->_isHELEAccessory;
}

- (void)setIsHELEAccessory:(BOOL)a3
{
  self->_isHELEAccessory = a3;
}

- (BOOL)isManagedAccessory
{
  return self->_isManagedAccessory;
}

- (void)setIsManagedAccessory:(BOOL)a3
{
  self->_isManagedAccessory = a3;
}

- (BOOL)supportBeaconGroupInfo
{
  return self->_supportBeaconGroupInfo;
}

- (void)setSupportBeaconGroupInfo:(BOOL)a3
{
  self->_supportBeaconGroupInfo = a3;
}

- (NSString)findmyProductId
{
  return self->_findmyProductId;
}

- (void)setFindmyProductId:(id)a3
{
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

- (SPBeaconRole)defaultRole
{
  return self->_defaultRole;
}

- (void)setDefaultRole:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSURL)lowBatteryInfoURL
{
  return self->_lowBatteryInfoURL;
}

- (void)setLowBatteryInfoURL:(id)a3
{
}

- (NSURL)disableURL
{
  return self->_disableURL;
}

- (void)setDisableURL:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)encryptionKeyE1
{
  return self->_encryptionKeyE1;
}

- (void)setEncryptionKeyE1:(id)a3
{
}

- (NSData)encryptionKeyE2
{
  return self->_encryptionKeyE2;
}

- (void)setEncryptionKeyE2:(id)a3
{
}

- (NSData)verificationKeyS2
{
  return self->_verificationKeyS2;
}

- (void)setVerificationKeyS2:(id)a3
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

- (BOOL)isAirTag
{
  return self->_isAirTag;
}

- (void)setIsAirTag:(BOOL)a3
{
  self->_isAirTag = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (NSArray)layoutTemplate
{
  return self->_layoutTemplate;
}

- (void)setLayoutTemplate:(id)a3
{
}

- (NSURL)defaultHeroIcon
{
  return self->_defaultHeroIcon;
}

- (void)setDefaultHeroIcon:(id)a3
{
}

- (NSURL)defaultListIcon
{
  return self->_defaultListIcon;
}

- (void)setDefaultListIcon:(id)a3
{
}

- (NSURL)defaultHeroIcon2x
{
  return self->_defaultHeroIcon2x;
}

- (void)setDefaultHeroIcon2x:(id)a3
{
}

- (NSURL)defaultListIcon2x
{
  return self->_defaultListIcon2x;
}

- (void)setDefaultListIcon2x:(id)a3
{
}

- (NSURL)defaultHeroIcon3x
{
  return self->_defaultHeroIcon3x;
}

- (void)setDefaultHeroIcon3x:(id)a3
{
}

- (NSURL)defaultListIcon3x
{
  return self->_defaultListIcon3x;
}

- (void)setDefaultListIcon3x:(id)a3
{
}

- (SPUnknownProductMetadata)learnModeMetadata
{
  return self->_learnModeMetadata;
}

- (void)setLearnModeMetadata:(id)a3
{
}

- (SPUnknownProductMetadata)disableMetadata
{
  return self->_disableMetadata;
}

- (void)setDisableMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableMetadata, 0);
  objc_storeStrong((id *)&self->_learnModeMetadata, 0);
  objc_storeStrong((id *)&self->_defaultListIcon3x, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon3x, 0);
  objc_storeStrong((id *)&self->_defaultListIcon2x, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon2x, 0);
  objc_storeStrong((id *)&self->_defaultListIcon, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon, 0);
  objc_storeStrong((id *)&self->_layoutTemplate, 0);
  objc_storeStrong((id *)&self->_verificationKeyS2, 0);
  objc_storeStrong((id *)&self->_encryptionKeyE2, 0);
  objc_storeStrong((id *)&self->_encryptionKeyE1, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_disableURL, 0);
  objc_storeStrong((id *)&self->_lowBatteryInfoURL, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultRole, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_findmyProductId, 0);
}

@end