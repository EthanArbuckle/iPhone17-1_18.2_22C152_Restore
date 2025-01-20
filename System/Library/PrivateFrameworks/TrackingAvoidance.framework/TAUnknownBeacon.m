@interface TAUnknownBeacon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFindMyNetwork;
- (BOOL)isPoshAccessory;
- (NSData)address;
- (NSUUID)identifier;
- (TAAccessoryInformation)accessoryInfo;
- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6;
- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6 isPoshAccessory:(BOOL)a7 isFindMyNetwork:(BOOL)a8;
- (TAUnknownBeacon)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAUnknownBeacon

- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6
{
  return [(TAUnknownBeacon *)self initWithBeaconUUID:a3 address:a4 deviceType:a5 withAccessoryInfo:a6 isPoshAccessory:0 isFindMyNetwork:1];
}

- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6 isPoshAccessory:(BOOL)a7 isFindMyNetwork:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAUnknownBeacon;
  v17 = [(TAUnknownBeacon *)&v26 init];
  if (!v17) {
    goto LABEL_5;
  }
  v18 = 0;
  if (v14 && v15)
  {
    uint64_t v19 = [v14 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v19;

    uint64_t v21 = [v15 copy];
    address = v17->_address;
    v17->_address = (NSData *)v21;

    v17->_deviceType = a5;
    uint64_t v23 = [v16 copy];
    accessoryInfo = v17->_accessoryInfo;
    v17->_accessoryInfo = (TAAccessoryInformation *)v23;

    v17->_isPoshAccessory = a7;
    v17->_isFindMyNetwork = a8;
LABEL_5:
    v18 = v17;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (TAUnknownBeacon *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(TAUnknownBeacon *)self identifier];
      v9 = [(TAUnknownBeacon *)v7 identifier];
      if (v8 != v9)
      {
        v3 = [(TAUnknownBeacon *)self identifier];
        v4 = [(TAUnknownBeacon *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_21;
        }
      }
      v11 = [(TAUnknownBeacon *)self address];
      v12 = [(TAUnknownBeacon *)v7 address];
      if (v11 != v12)
      {
        v13 = [(TAUnknownBeacon *)self address];
        v25 = [(TAUnknownBeacon *)v7 address];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      unint64_t v14 = [(TAUnknownBeacon *)self deviceType];
      if (v14 == [(TAUnknownBeacon *)v7 deviceType])
      {
        uint64_t v23 = v4;
        id v15 = [(TAUnknownBeacon *)self accessoryInfo];
        uint64_t v16 = [(TAUnknownBeacon *)v7 accessoryInfo];
        if (v15 == (void *)v16)
        {

          char v10 = 1;
        }
        else
        {
          v17 = (void *)v16;
          uint64_t v21 = [(TAUnknownBeacon *)self accessoryInfo];
          [(TAUnknownBeacon *)v7 accessoryInfo];
          v18 = v22 = v3;
          char v10 = [v21 isEqual:v18];

          v3 = v22;
        }
        BOOL v19 = v11 == v12;
        v4 = v23;
      }
      else
      {
        char v10 = 0;
        BOOL v19 = v11 == v12;
      }
      v13 = v24;
      if (v19)
      {
LABEL_20:

        if (v8 == v9)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    char v10 = 0;
  }
LABEL_23:

  return v10;
}

- (id)descriptionDictionary
{
  v2 = self;
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"TAUnknownBeaconIdentifier";
  v3 = [(TAUnknownBeacon *)self identifier];
  v4 = [v3 description];
  v13[0] = v4;
  v12[1] = @"TAUnknownBeaconAddress";
  v5 = [v2 address];
  v6 = [v5 description];
  v13[1] = v6;
  v12[2] = @"TAUnknownBeaconType";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "deviceType"));
  v13[2] = v7;
  v12[3] = @"TAUnknownBeaconAccessoryInfo";
  v8 = [v2 accessoryInfo];
  if (v8)
  {
    v2 = [v2 accessoryInfo];
    v9 = [v2 descriptionDictionary];
  }
  else
  {
    v9 = &stru_26D677430;
  }
  v13[3] = v9;
  char v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (v8)
  {
  }
  return v10;
}

- (id)description
{
  v3 = [(TAUnknownBeacon *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = +[TAUnknownBeacon instancesRespondToSelector:NSSelectorFromString(&cfstr_Initwithbeacon.isa)];
  v6 = +[TAUnknownBeacon allocWithZone:a3];
  id v7 = [(TAUnknownBeacon *)self identifier];
  v8 = [(TAUnknownBeacon *)self address];
  unint64_t v9 = [(TAUnknownBeacon *)self deviceType];
  id v10 = [(TAUnknownBeacon *)self accessoryInfo];
  if (v5) {
    uint64_t v11 = [(TAUnknownBeacon *)v6 initWithBeaconUUID:v7 address:v8 deviceType:v9 withAccessoryInfo:v10 isPoshAccessory:[(TAUnknownBeacon *)self isPoshAccessory] isFindMyNetwork:[(TAUnknownBeacon *)self isFindMyNetwork]];
  }
  else {
    uint64_t v11 = [(TAUnknownBeacon *)v6 initWithBeaconUUID:v7 address:v8 deviceType:v9 withAccessoryInfo:v10];
  }
  v12 = (void *)v11;

  return v12;
}

- (TAUnknownBeacon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TAUnknownBeacon;
  int v5 = [(TAUnknownBeacon *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"TAUnknownBeaconIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"TAUnknownBeaconAddress"];
    address = v5->_address;
    v5->_address = (NSData *)v8;

    v5->_deviceType = [v4 decodeIntegerForKey:@"TAUnknownBeaconType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TAUnknownBeaconAccessoryInfo"];
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = (TAAccessoryInformation *)v10;

    v5->_isPoshAccessory = [v4 decodeBoolForKey:@"TAUnknownBeaconIsPosh"];
    v5->_isFindMyNetwork = [v4 decodeBoolForKey:@"TAUnknownBeaconIsFindMyNetwork"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"TAUnknownBeaconIdentifier"];
  [v5 encodeObject:self->_address forKey:@"TAUnknownBeaconAddress"];
  [v5 encodeInteger:self->_deviceType forKey:@"TAUnknownBeaconType"];
  [v5 encodeObject:self->_accessoryInfo forKey:@"TAUnknownBeaconAccessoryInfo"];
  [v5 encodeBool:self->_isPoshAccessory forKey:@"TAUnknownBeaconIsPosh"];
  [v5 encodeBool:self->_isFindMyNetwork forKey:@"TAUnknownBeaconIsFindMyNetwork"];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSData)address
{
  return self->_address;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)isPoshAccessory
{
  return self->_isPoshAccessory;
}

- (BOOL)isFindMyNetwork
{
  return self->_isFindMyNetwork;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end