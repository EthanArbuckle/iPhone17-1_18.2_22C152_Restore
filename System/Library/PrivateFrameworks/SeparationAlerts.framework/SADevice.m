@interface SADevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isAirPodsCase;
- (BOOL)isAppleAudioAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReallyEqual:(id)a3;
- (BOOL)notifyEnabled;
- (NSDate)date;
- (NSString)description;
- (NSString)macAddress;
- (NSString)model;
- (NSString)name;
- (NSString)systemVersion;
- (NSUUID)groupIdentifier;
- (NSUUID)identifier;
- (SADevice)initWithCoder:(id)a3;
- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 name:(id)a6 model:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 deviceType:(unint64_t)a11 notifyEnabled:(BOOL)a12 isAppleAudioAccessory:(BOOL)a13 date:(id)a14;
- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 partIdentifier:(int64_t)a6 name:(id)a7 model:(id)a8 systemVersion:(id)a9 vendorId:(int64_t)a10 productId:(int64_t)a11 deviceType:(unint64_t)a12 notifyEnabled:(BOOL)a13 isAppleAudioAccessory:(BOOL)a14 date:(id)a15;
- (SADevice)initWithDeviceUUID:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 deviceType:(unint64_t)a9 notifyEnabled:(BOOL)a10 isAppleAudioAccessory:(BOOL)a11 date:(id)a12;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (int64_t)partIdentifier;
- (int64_t)productId;
- (int64_t)vendorId;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
- (void)setMacAddress:(id)a3;
@end

@implementation SADevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADevice)initWithCoder:(id)a3
{
  id v3 = a3;
  v19 = [v3 decodeObjectForKey:@"SADeviceIdentifier"];
  v18 = [v3 decodeObjectForKey:@"SADeviceGroupIdentifier"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"SADevicePartIdentifier"];
  v16 = [v3 decodeObjectForKey:@"SADeviceName"];
  v4 = [v3 decodeObjectForKey:@"SADeviceModel"];
  v5 = [v3 decodeObjectForKey:@"SADeviceSystemVersion"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"SADeviceVendorId"];
  uint64_t v7 = [v3 decodeIntegerForKey:@"SADeviceProductId"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"SADeviceType"];
  char v9 = [v3 decodeBoolForKey:@"SADeviceNotifyEnabled"];
  char v10 = [v3 decodeBoolForKey:@"SADeviceIsAppleAudioAccessory"];
  v11 = [v3 decodeObjectForKey:@"SADeviceDate"];
  v12 = [v3 decodeObjectForKey:@"SADeviceMacAddress"];

  BYTE1(v15) = v10;
  LOBYTE(v15) = v9;
  v13 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v19, v18, v12, v17, v16, v4, v5, v6, v7, v8, v15, v11);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SADevice *)self identifier];
  [v4 encodeObject:v5 forKey:@"SADeviceIdentifier"];

  uint64_t v6 = [(SADevice *)self groupIdentifier];
  [v4 encodeObject:v6 forKey:@"SADeviceGroupIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice partIdentifier](self, "partIdentifier"), @"SADevicePartIdentifier");
  uint64_t v7 = [(SADevice *)self name];
  [v4 encodeObject:v7 forKey:@"SADeviceName"];

  uint64_t v8 = [(SADevice *)self model];
  [v4 encodeObject:v8 forKey:@"SADeviceModel"];

  char v9 = [(SADevice *)self systemVersion];
  [v4 encodeObject:v9 forKey:@"SADeviceSystemVersion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice vendorId](self, "vendorId"), @"SADeviceVendorId");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice productId](self, "productId"), @"SADeviceProductId");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice deviceType](self, "deviceType"), @"SADeviceType");
  objc_msgSend(v4, "encodeBool:forKey:", -[SADevice notifyEnabled](self, "notifyEnabled"), @"SADeviceNotifyEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[SADevice isAppleAudioAccessory](self, "isAppleAudioAccessory"), @"SADeviceIsAppleAudioAccessory");
  char v10 = [(SADevice *)self date];
  [v4 encodeObject:v10 forKey:@"SADeviceDate"];

  id v11 = [(SADevice *)self macAddress];
  [v4 encodeObject:v11 forKey:@"SADeviceMacAddress"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20 = +[SADevice allocWithZone:a3];
  v19 = [(SADevice *)self identifier];
  v18 = [(SADevice *)self groupIdentifier];
  id v4 = [(SADevice *)self macAddress];
  int64_t v17 = [(SADevice *)self partIdentifier];
  v5 = [(SADevice *)self name];
  uint64_t v6 = [(SADevice *)self model];
  id v7 = [(SADevice *)self systemVersion];
  int64_t v8 = [(SADevice *)self vendorId];
  int64_t v9 = [(SADevice *)self productId];
  unint64_t v10 = [(SADevice *)self deviceType];
  BOOL v11 = [(SADevice *)self notifyEnabled];
  BOOL v12 = [(SADevice *)self isAppleAudioAccessory];
  v13 = [(SADevice *)self date];
  BYTE1(v16) = v12;
  LOBYTE(v16) = v11;
  v14 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](v20, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v19, v18, v4, v17, v5, v6, v7, v8, v9, v10, v16, v13);

  return v14;
}

- (SADevice)initWithDeviceUUID:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 deviceType:(unint64_t)a9 notifyEnabled:(BOOL)a10 isAppleAudioAccessory:(BOOL)a11 date:(id)a12
{
  LOWORD(v13) = __PAIR16__(a11, a10);
  return -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", a3, 0, 0, a4, a5, a6, a7, a8, a9, v13, a12);
}

- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 name:(id)a6 model:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 deviceType:(unint64_t)a11 notifyEnabled:(BOOL)a12 isAppleAudioAccessory:(BOOL)a13 date:(id)a14
{
  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", a3, a4, a5, -1, a6, a7, a8, a9, a10, a11, v15, a14);
}

- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 partIdentifier:(int64_t)a6 name:(id)a7 model:(id)a8 systemVersion:(id)a9 vendorId:(int64_t)a10 productId:(int64_t)a11 deviceType:(unint64_t)a12 notifyEnabled:(BOOL)a13 isAppleAudioAccessory:(BOOL)a14 date:(id)a15
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a15;
  v45.receiver = self;
  v45.super_class = (Class)SADevice;
  v28 = [(SADevice *)&v45 init];
  if (!v28) {
    goto LABEL_7;
  }
  v29 = 0;
  if (v21 && v25 && v26 && v27)
  {
    uint64_t v30 = [v21 copy];
    identifier = v28->_identifier;
    v28->_identifier = (NSUUID *)v30;

    uint64_t v32 = [v22 copy];
    groupIdentifier = v28->_groupIdentifier;
    v28->_groupIdentifier = (NSUUID *)v32;

    uint64_t v34 = [v23 copy];
    macAddress = v28->_macAddress;
    v28->_macAddress = (NSString *)v34;

    v28->_partIdentifier = a6;
    uint64_t v36 = [v24 copy];
    name = v28->_name;
    v28->_name = (NSString *)v36;

    uint64_t v38 = [v25 copy];
    model = v28->_model;
    v28->_model = (NSString *)v38;

    uint64_t v40 = [v26 copy];
    systemVersion = v28->_systemVersion;
    v28->_systemVersion = (NSString *)v40;

    v28->_vendorId = a10;
    v28->_productId = a11;
    v28->_deviceType = a12;
    v28->_notifyEnabled = a13;
    v28->_isAppleAudioAccessory = a14;
    uint64_t v42 = [v27 copy];
    date = v28->_date;
    v28->_date = (NSDate *)v42;

LABEL_7:
    v29 = v28;
  }

  return v29;
}

- (BOOL)isReallyEqual:(id)a3
{
  uint64_t v6 = (SADevice *)a3;
  if (self == v6)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      int64_t v8 = [(SADevice *)self identifier];
      int64_t v9 = [(SADevice *)v7 identifier];
      if (v8 != v9)
      {
        id v3 = [(SADevice *)self identifier];
        id v4 = [(SADevice *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          LOBYTE(v10) = 0;
          goto LABEL_35;
        }
      }
      BOOL v11 = [(SADevice *)self groupIdentifier];
      BOOL v12 = [(SADevice *)v7 groupIdentifier];
      if (v11 != v12)
      {
        uint64_t v13 = [(SADevice *)self groupIdentifier];
        uint64_t v42 = [(SADevice *)v7 groupIdentifier];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          LOBYTE(v10) = 0;
          goto LABEL_33;
        }
        v41 = v13;
      }
      int64_t v14 = [(SADevice *)self partIdentifier];
      if (v14 == [(SADevice *)v7 partIdentifier])
      {
        uint64_t v15 = [(SADevice *)self name];
        uint64_t v16 = [(SADevice *)v7 name];
        int64_t v17 = (void *)v15;
        BOOL v18 = v15 == v16;
        uint64_t v13 = v41;
        v37 = (void *)v16;
        uint64_t v38 = v17;
        v39 = v4;
        uint64_t v40 = v3;
        if (v18)
        {
          v35 = v8;
          uint64_t v36 = v12;
        }
        else
        {
          v31 = v11;
          v19 = [(SADevice *)self name];
          v33 = [(SADevice *)v7 name];
          uint64_t v34 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            LOBYTE(v10) = 0;
            v28 = v37;
            id v27 = v38;
            BOOL v11 = v31;
            goto LABEL_32;
          }
          v35 = v8;
          uint64_t v36 = v12;
          BOOL v11 = v31;
        }
        v20 = [(SADevice *)self model];
        id v21 = [(SADevice *)v7 model];
        if ([v20 isEqualToString:v21])
        {
          uint64_t v32 = v21;
          id v22 = [(SADevice *)self systemVersion];
          uint64_t v30 = [(SADevice *)v7 systemVersion];
          if (objc_msgSend(v22, "isEqualToString:"))
          {
            int64_t v23 = [(SADevice *)self vendorId];
            if (v23 == [(SADevice *)v7 vendorId]
              && (int64_t v24 = [(SADevice *)self productId], v24 == [(SADevice *)v7 productId])
              && (unint64_t v25 = [(SADevice *)self deviceType], v25 == [(SADevice *)v7 deviceType]))
            {
              BOOL v26 = [(SADevice *)self notifyEnabled];
              BOOL v10 = v26 ^ [(SADevice *)v7 notifyEnabled] ^ 1;
            }
            else
            {
              LOBYTE(v10) = 0;
            }
            uint64_t v13 = v41;
          }
          else
          {
            LOBYTE(v10) = 0;
          }
        }
        else
        {

          LOBYTE(v10) = 0;
        }
        v28 = v37;
        id v27 = v38;
        int64_t v8 = v35;
        BOOL v12 = v36;
        if (v38 == v37)
        {

          if (v11 != v36)
          {
          }
          id v4 = v39;
          id v3 = v40;
          if (v35 == v9) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
LABEL_32:

        id v4 = v39;
        id v3 = v40;
        if (v11 == v12) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      LOBYTE(v10) = 0;
      uint64_t v13 = v41;
      if (v11 == v12)
      {
LABEL_34:

        if (v8 == v9)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_35:

        goto LABEL_36;
      }
LABEL_33:

      goto LABEL_34;
    }
    LOBYTE(v10) = 0;
  }
LABEL_37:

  return v10;
}

- (BOOL)isAirPodsCase
{
  BOOL v3 = [(SADevice *)self isAppleAudioAccessory];
  if (v3) {
    LOBYTE(v3) = [(SADevice *)self productId] == 8213 || [(SADevice *)self productId] == 8216;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SADevice *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SADevice *)self identifier];
      id v7 = [(SADevice *)v5 identifier];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        int64_t v8 = [(SADevice *)self identifier];
        int64_t v9 = [(SADevice *)v5 identifier];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)descriptionDictionary
{
  v33[13] = *MEMORY[0x1E4F143B8];
  v32[0] = @"EventType";
  BOOL v3 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v3);
  v33[0] = v31;
  v32[1] = @"SADeviceIdentifier";
  uint64_t v30 = [(SADevice *)self identifier];
  v29 = [v30 description];
  v33[1] = v29;
  v32[2] = @"SADeviceGroupIdentifier";
  uint64_t v4 = [(SADevice *)self groupIdentifier];
  if (v4)
  {
    v20 = [(SADevice *)self groupIdentifier];
    v5 = [v20 description];
  }
  else
  {
    v5 = &stru_1F27F45F0;
  }
  int64_t v23 = v5;
  v33[2] = v5;
  v32[3] = @"SADeviceMacAddress";
  id v27 = [(SADevice *)self macAddress];
  v28 = (void *)v4;
  if (v27)
  {
    uint64_t v6 = [(SADevice *)self macAddress];
  }
  else
  {
    uint64_t v6 = &stru_1F27F45F0;
  }
  id v22 = v6;
  v33[3] = v6;
  v32[4] = @"SADevicePartIdentifier";
  BOOL v26 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[SADevice partIdentifier](self, "partIdentifier"));
  v33[4] = v26;
  v32[5] = @"SADeviceName";
  id v7 = [(SADevice *)self name];
  if (v7)
  {
    v19 = [(SADevice *)self name];
    int64_t v8 = [v19 description];
  }
  else
  {
    int64_t v8 = &stru_1F27F45F0;
  }
  id v21 = v8;
  v33[5] = v8;
  v32[6] = @"SADeviceModel";
  unint64_t v25 = [(SADevice *)self model];
  int64_t v9 = [v25 description];
  v33[6] = v9;
  v32[7] = @"SADeviceSystemVersion";
  char v10 = [(SADevice *)self systemVersion];
  BOOL v11 = [v10 description];
  v33[7] = v11;
  v32[8] = @"SADeviceVendorId";
  BOOL v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[SADevice vendorId](self, "vendorId"));
  v33[8] = v12;
  v32[9] = @"SADeviceProductId";
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[SADevice productId](self, "productId"));
  v33[9] = v13;
  v32[10] = @"SADeviceType";
  int64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SADevice deviceType](self, "deviceType"));
  v33[10] = v14;
  v32[11] = @"SADeviceNotifyEnabled";
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SADevice notifyEnabled](self, "notifyEnabled"));
  v33[11] = v15;
  v32[12] = @"SADeviceDate";
  uint64_t v16 = [(SADevice *)self date];
  int64_t v17 = [v16 getDateString];
  v33[12] = v17;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:13];

  if (v7)
  {
  }
  if (v27) {

  }
  if (v28)
  {
  }
  return v24;
}

- (NSString)description
{
  BOOL v3 = [(SADevice *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      [(SAConnectionEvent *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  int64_t v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (int64_t)productId
{
  return self->_productId;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end