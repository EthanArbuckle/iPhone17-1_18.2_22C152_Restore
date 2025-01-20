@interface SPUnknownBeacon
+ (BOOL)supportsSecureCoding;
- (BOOL)connected;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFindMyNetwork;
- (BOOL)isIgnored;
- (BOOL)isPosh;
- (NSArray)beaconLocations;
- (NSData)advertisement;
- (NSDate)ignoresUntilDate;
- (NSDate)triggerDate;
- (NSDictionary)taskInformation;
- (NSString)name;
- (NSString)type;
- (NSUUID)beaconIdentifier;
- (NSUUID)identifier;
- (SPDiscoveredAccessoryMetadata)metadata;
- (SPDiscoveredAccessoryProductInformation)productInformation;
- (SPHandle)handle;
- (SPUnknownBeacon)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)alertState;
- (int64_t)observationType;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisement:(id)a3;
- (void)setAlertState:(int64_t)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setBeaconLocations:(id)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoresUntilDate:(id)a3;
- (void)setIsAppleAudioAccessory:(BOOL)a3;
- (void)setIsFindMyNetwork:(BOOL)a3;
- (void)setIsIgnored:(BOOL)a3;
- (void)setIsPosh:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setObservationType:(int64_t)a3;
- (void)setProductInformation:(id)a3;
- (void)setTaskInformation:(id)a3;
- (void)setTriggerDate:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SPUnknownBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPUnknownBeacon *)a3;
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
      v6 = [(SPUnknownBeacon *)self identifier];
      v7 = [(SPUnknownBeacon *)v5 identifier];

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
  v2 = [(SPUnknownBeacon *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPUnknownBeacon *)self name];
  [v4 setName:v5];

  v6 = [(SPUnknownBeacon *)self identifier];
  [v4 setIdentifier:v6];

  v7 = [(SPUnknownBeacon *)self beaconIdentifier];
  [v4 setBeaconIdentifier:v7];

  char v8 = [(SPUnknownBeacon *)self beaconLocations];
  v9 = (void *)[v8 copy];
  [v4 setBeaconLocations:v9];

  v10 = [(SPUnknownBeacon *)self advertisement];
  v11 = (void *)[v10 copy];
  [v4 setAdvertisement:v11];

  v12 = [(SPUnknownBeacon *)self handle];
  v13 = (void *)[v12 copy];
  [v4 setHandle:v13];

  objc_msgSend(v4, "setIsIgnored:", -[SPUnknownBeacon isIgnored](self, "isIgnored"));
  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPUnknownBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  v14 = [(SPUnknownBeacon *)self triggerDate];
  [v4 setTriggerDate:v14];

  v15 = [(SPUnknownBeacon *)self ignoresUntilDate];
  [v4 setIgnoresUntilDate:v15];

  v16 = [(SPUnknownBeacon *)self type];
  [v4 setType:v16];

  objc_msgSend(v4, "setObservationType:", -[SPUnknownBeacon observationType](self, "observationType"));
  objc_msgSend(v4, "setAlertState:", -[SPUnknownBeacon alertState](self, "alertState"));
  objc_msgSend(v4, "setCapabilities:", -[SPUnknownBeacon capabilities](self, "capabilities"));
  objc_msgSend(v4, "setConnected:", -[SPUnknownBeacon connected](self, "connected"));
  v17 = [(SPUnknownBeacon *)self metadata];
  v18 = (void *)[v17 copy];
  [v4 setMetadata:v18];

  v19 = [(SPUnknownBeacon *)self productInformation];
  v20 = (void *)[v19 copy];
  [v4 setProductInformation:v20];

  v21 = [(SPUnknownBeacon *)self taskInformation];
  v22 = (void *)[v21 copy];
  [v4 setTaskInformation:v22];

  objc_msgSend(v4, "setIsFindMyNetwork:", -[SPUnknownBeacon isFindMyNetwork](self, "isFindMyNetwork"));
  objc_msgSend(v4, "setIsPosh:", -[SPUnknownBeacon isPosh](self, "isPosh"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v7 = a3;
  [v7 encodeObject:name forKey:@"name"];
  [v7 encodeObject:self->_identifier forKey:@"identifier"];
  [v7 encodeObject:self->_beaconIdentifier forKey:@"beaconIdentifier"];
  [v7 encodeObject:self->_beaconLocations forKey:@"beaconLocations"];
  [v7 encodeObject:self->_advertisement forKey:@"advertisement"];
  v5 = [(SPUnknownBeacon *)self handle];
  [v7 encodeObject:v5 forKey:@"handle"];

  [v7 encodeBool:self->_isIgnored forKey:@"isIgnored"];
  [v7 encodeBool:self->_isAppleAudioAccessory forKey:@"isAppleAudioAccessory"];
  [v7 encodeObject:self->_triggerDate forKey:@"triggerDate"];
  [v7 encodeObject:self->_ignoresUntilDate forKey:@"ignoresUntilDate"];
  [v7 encodeObject:self->_type forKey:@"type"];
  [v7 encodeInteger:self->_observationType forKey:@"observationType"];
  [v7 encodeInteger:self->_alertState forKey:@"alertState"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_capabilities];
  [v7 encodeObject:v6 forKey:@"capabilities"];

  [v7 encodeBool:self->_connected forKey:@"connected"];
  [v7 encodeObject:self->_metadata forKey:@"metadata"];
  [v7 encodeObject:self->_productInformation forKey:@"productInformation"];
  [v7 encodeObject:self->_taskInformation forKey:@"taskInformation"];
  [v7 encodeBool:self->_isFindMyNetwork forKey:@"isFindMyNetwork"];
  [v7 encodeBool:self->_isPosh forKey:@"isPosh"];
}

- (SPUnknownBeacon)initWithCoder:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisement"];
  advertisement = self->_advertisement;
  self->_advertisement = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v11;

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v15 = [v13 setWithArray:v14];
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"beaconLocations"];

  if (v16) {
    v17 = v16;
  }
  else {
    v17 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  beaconLocations = self->_beaconLocations;
  self->_beaconLocations = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  handle = self->_handle;
  self->_handle = v19;

  self->_isIgnored = [v4 decodeBoolForKey:@"isIgnored"];
  self->_isAppleAudioAccessory = [v4 decodeBoolForKey:@"isAppleAudioAccessory"];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerDate"];
  triggerDate = self->_triggerDate;
  self->_triggerDate = v21;

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoresUntilDate"];
  ignoresUntilDate = self->_ignoresUntilDate;
  self->_ignoresUntilDate = v23;

  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  type = self->_type;
  self->_type = v25;

  self->_observationType = [v4 decodeIntegerForKey:@"observationType"];
  self->_alertState = [v4 decodeIntegerForKey:@"alertState"];
  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];
  self->_capabilities = [v27 unsignedIntegerValue];

  self->_connected = [v4 decodeBoolForKey:@"connected"];
  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  metadata = self->_metadata;
  self->_metadata = v28;

  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productInformation"];
  productInformation = self->_productInformation;
  self->_productInformation = v30;

  v32 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:3];
  v34 = objc_msgSend(v32, "setWithArray:", v33, v38, v39);
  v35 = [v4 decodeObjectOfClasses:v34 forKey:@"taskInformation"];
  taskInformation = self->_taskInformation;
  self->_taskInformation = v35;

  self->_isFindMyNetwork = [v4 decodeBoolForKey:@"isFindMyNetwork"];
  self->_isPosh = [v4 decodeBoolForKey:@"isPosh"];

  return self;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SPUnknownBeacon *)self identifier];
  v6 = [(SPUnknownBeacon *)self advertisement];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@ %lu isFindMyNetwork: %i isPosh: %i>", v4, self, v5, objc_msgSend(v6, "hash"), -[SPUnknownBeacon isFindMyNetwork](self, "isFindMyNetwork"), -[SPUnknownBeacon isPosh](self, "isPosh")];

  return v7;
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

- (NSArray)beaconLocations
{
  return self->_beaconLocations;
}

- (void)setBeaconLocations:(id)a3
{
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)observationType
{
  return self->_observationType;
}

- (void)setObservationType:(int64_t)a3
{
  self->_observationType = a3;
}

- (int64_t)alertState
{
  return self->_alertState;
}

- (void)setAlertState:(int64_t)a3
{
  self->_alertState = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isFindMyNetwork
{
  return self->_isFindMyNetwork;
}

- (void)setIsFindMyNetwork:(BOOL)a3
{
  self->_isFindMyNetwork = a3;
}

- (BOOL)isPosh
{
  return self->_isPosh;
}

- (void)setIsPosh:(BOOL)a3
{
  self->_isPosh = a3;
}

- (SPDiscoveredAccessoryMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SPDiscoveredAccessoryProductInformation)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (SPHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
}

- (NSDate)ignoresUntilDate
{
  return self->_ignoresUntilDate;
}

- (void)setIgnoresUntilDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoresUntilDate, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_beaconLocations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end