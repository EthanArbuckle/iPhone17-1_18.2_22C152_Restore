@interface SPBeaconGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isClassicConnected;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFindMyNetworkEnabled;
- (BOOL)isPairingComplete;
- (NSData)macAddress;
- (NSDictionary)beaconMap;
- (NSDictionary)taskInformation;
- (NSSet)beaconIdentifiers;
- (NSSet)multipartStatus;
- (NSString)name;
- (NSUUID)identifier;
- (SPBeaconGroup)initWithCoder:(id)a3;
- (SPLostModeInfo)lostModeInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)classification;
- (int64_t)status;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconIdentifiers:(id)a3;
- (void)setBeaconMap:(id)a3;
- (void)setClassification:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsClassicConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsFindMyNetworkEnabled:(BOOL)a3;
- (void)setIsPairingComplete:(BOOL)a3;
- (void)setLostModeInfo:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setMultipartStatus:(id)a3;
- (void)setName:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTaskInformation:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation SPBeaconGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPBeaconGroup *)a3;
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
      v6 = [(SPBeaconGroup *)self identifier];
      v7 = [(SPBeaconGroup *)v5 identifier];

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
  v2 = [(SPBeaconGroup *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setVersion:", -[SPBeaconGroup version](self, "version"));
  v5 = [(SPBeaconGroup *)self identifier];
  v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  v7 = [(SPBeaconGroup *)self name];
  char v8 = (void *)[v7 copy];
  [v4 setName:v8];

  v9 = [(SPBeaconGroup *)self beaconIdentifiers];
  v10 = (void *)[v9 copy];
  [v4 setBeaconIdentifiers:v10];

  v11 = [(SPBeaconGroup *)self macAddress];
  v12 = (void *)[v11 copy];
  [v4 setMacAddress:v12];

  objc_msgSend(v4, "setIsPairingComplete:", -[SPBeaconGroup isPairingComplete](self, "isPairingComplete"));
  objc_msgSend(v4, "setIsClassicConnected:", -[SPBeaconGroup isClassicConnected](self, "isClassicConnected"));
  objc_msgSend(v4, "setIsConnected:", -[SPBeaconGroup isConnected](self, "isConnected"));
  objc_msgSend(v4, "setIsFindMyNetworkEnabled:", -[SPBeaconGroup isFindMyNetworkEnabled](self, "isFindMyNetworkEnabled"));
  objc_msgSend(v4, "setStatus:", -[SPBeaconGroup status](self, "status"));
  objc_msgSend(v4, "setClassification:", -[SPBeaconGroup classification](self, "classification"));
  v13 = [(SPBeaconGroup *)self beaconMap];
  v14 = (void *)[v13 copy];
  [v4 setBeaconMap:v14];

  v15 = [(SPBeaconGroup *)self taskInformation];
  v16 = (void *)[v15 copy];
  [v4 setTaskInformation:v16];

  v17 = [(SPBeaconGroup *)self lostModeInfo];
  v18 = (void *)[v17 copy];
  [v4 setLostModeInfo:v18];

  v19 = [(SPBeaconGroup *)self multipartStatus];
  v20 = (void *)[v19 copy];
  [v4 setMultipartStatus:v20];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_beaconIdentifiers forKey:@"beaconIdentifiers"];
  [v5 encodeObject:self->_macAddress forKey:@"macAddress"];
  [v5 encodeBool:self->_isPairingComplete forKey:@"isPairingComplete"];
  [v5 encodeBool:self->_isClassicConnected forKey:@"isClassicConnected"];
  [v5 encodeBool:self->_isConnected forKey:@"isConnected"];
  [v5 encodeBool:self->_isFindMyNetworkEnabled forKey:@"isFindMyNetworkEnabled"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeInteger:self->_classification forKey:@"classification"];
  [v5 encodeObject:self->_beaconMap forKey:@"beaconMap"];
  [v5 encodeObject:self->_taskInformation forKey:@"taskInformation"];
  [v5 encodeObject:self->_lostModeInfo forKey:@"lostModeInfo"];
  [v5 encodeObject:self->_multipartStatus forKey:@"multipartStatus"];
}

- (SPBeaconGroup)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int64_t version = [v4 decodeIntegerForKey:@"version"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v7;

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v11 = [v9 setWithArray:v10];
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"beaconIdentifiers"];
  beaconIdentifiers = self->_beaconIdentifiers;
  self->_beaconIdentifiers = v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"macAddress"];
  macAddress = self->_macAddress;
  self->_macAddress = v14;

  self->_isPairingComplete = [v4 decodeBoolForKey:@"isPairingComplete"];
  self->_isClassicConnected = [v4 decodeBoolForKey:@"isClassicConnected"];
  self->_isConnected = [v4 decodeBoolForKey:@"isConnected"];
  self->_isFindMyNetworkEnabled = [v4 decodeBoolForKey:@"isFindMyNetworkEnabled"];
  self->_status = [v4 decodeIntegerForKey:@"status"];
  self->_classification = [v4 decodeIntegerForKey:@"classification"];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v18 = [v16 setWithArray:v17];
  v19 = [v4 decodeObjectOfClasses:v18 forKey:@"beaconMap"];
  beaconMap = self->_beaconMap;
  self->_beaconMap = v19;

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  v23 = [v21 setWithArray:v22];
  v24 = [v4 decodeObjectOfClasses:v23 forKey:@"taskInformation"];
  taskInformation = self->_taskInformation;
  self->_taskInformation = v24;

  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeInfo"];
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v26;

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v30 = [v28 setWithArray:v29];
  v31 = [v4 decodeObjectOfClasses:v30 forKey:@"multipartStatus"];

  multipartStatus = self->_multipartStatus;
  self->_multipartStatus = v31;

  return self;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPBeaconGroup *)self identifier];
  v6 = [(SPBeaconGroup *)self name];
  v7 = [v3 stringWithFormat:@"<%@: %p %@ %@>", v4, self, v5, v6];

  return v7;
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

- (NSSet)beaconIdentifiers
{
  return self->_beaconIdentifiers;
}

- (void)setBeaconIdentifiers:(id)a3
{
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (BOOL)isPairingComplete
{
  return self->_isPairingComplete;
}

- (void)setIsPairingComplete:(BOOL)a3
{
  self->_isPairingComplete = a3;
}

- (BOOL)isClassicConnected
{
  return self->_isClassicConnected;
}

- (void)setIsClassicConnected:(BOOL)a3
{
  self->_isClassicConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isFindMyNetworkEnabled
{
  return self->_isFindMyNetworkEnabled;
}

- (void)setIsFindMyNetworkEnabled:(BOOL)a3
{
  self->_isFindMyNetworkEnabled = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSDictionary)beaconMap
{
  return self->_beaconMap;
}

- (void)setBeaconMap:(id)a3
{
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
}

- (NSSet)multipartStatus
{
  return self->_multipartStatus;
}

- (void)setMultipartStatus:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multipartStatus, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_beaconMap, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_beaconIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end