@interface TAAccessoryInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isCapableOfPrecisionFinding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHawkeyeAudioAccessory;
- (NSData)accessoryCapabilities;
- (NSData)accessoryCategory;
- (NSData)firmwareVersion;
- (NSData)productData;
- (NSData)serialNumber;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSUUID)identifier;
- (TAAccessoryInformation)initWithCoder:(id)a3;
- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10;
- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10 serialNumber:(id)a11 protocolImplementation:(int64_t)a12 networkID:(int64_t)a13 batteryType:(int64_t)a14 batteryLevel:(int64_t)a15;
- (id)accessoryTypeNameWithAdvTypeString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (int64_t)batteryLevel;
- (int64_t)batteryType;
- (int64_t)networkID;
- (int64_t)protocolImplementation;
- (unint64_t)deviceType;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCapabilities:(id)a3;
- (void)setAccessoryCategory:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setBatteryType:(int64_t)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setNetworkID:(int64_t)a3;
- (void)setProductData:(id)a3;
- (void)setProtocolImplementation:(int64_t)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation TAAccessoryInformation

- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10
{
  return [(TAAccessoryInformation *)self initWithDeviceUUID:a3 deviceType:a4 productData:a5 manufacturerName:a6 modelName:a7 firmwareVersion:a8 accessoryCategory:a9 accessoryCapabilities:a10 serialNumber:0 protocolImplementation:0 networkID:0 batteryType:0 batteryLevel:0];
}

- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10 serialNumber:(id)a11 protocolImplementation:(int64_t)a12 networkID:(int64_t)a13 batteryType:(int64_t)a14 batteryLevel:(int64_t)a15
{
  id v21 = a3;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  v47.receiver = self;
  v47.super_class = (Class)TAAccessoryInformation;
  v29 = [(TAAccessoryInformation *)&v47 init];
  if (v29)
  {
    uint64_t v30 = [v21 copy];
    identifier = v29->_identifier;
    v29->_identifier = (NSUUID *)v30;

    v29->_deviceType = a4;
    uint64_t v32 = [v22 copy];
    productData = v29->_productData;
    v29->_productData = (NSData *)v32;

    uint64_t v34 = [v23 copy];
    manufacturerName = v29->_manufacturerName;
    v29->_manufacturerName = (NSString *)v34;

    uint64_t v36 = [v24 copy];
    modelName = v29->_modelName;
    v29->_modelName = (NSString *)v36;

    uint64_t v38 = [v25 copy];
    firmwareVersion = v29->_firmwareVersion;
    v29->_firmwareVersion = (NSData *)v38;

    uint64_t v40 = [v26 copy];
    accessoryCategory = v29->_accessoryCategory;
    v29->_accessoryCategory = (NSData *)v40;

    uint64_t v42 = [v27 copy];
    accessoryCapabilities = v29->_accessoryCapabilities;
    v29->_accessoryCapabilities = (NSData *)v42;

    uint64_t v44 = [v28 copy];
    serialNumber = v29->_serialNumber;
    v29->_serialNumber = (NSData *)v44;

    v29->_protocolImplementation = a12;
    v29->_networkID = a13;
    v29->_batteryType = a14;
    v29->_batteryLevel = a15;
  }

  return v29;
}

- (BOOL)isCapableOfPrecisionFinding
{
  v3 = [(TAAccessoryInformation *)self accessoryCapabilities];

  if (v3
    && ([(TAAccessoryInformation *)self accessoryCapabilities],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5 == 4)
    && [(TAAccessoryInformation *)self deviceType] == 1)
  {
    id v6 = [(TAAccessoryInformation *)self accessoryCapabilities];
    unsigned int v7 = *(_DWORD *)[v6 bytes];

    return (v7 >> 7) & 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unsigned)vendorId
{
  v3 = [(TAAccessoryInformation *)self productData];
  uint64_t v4 = [v3 length];

  if (v4 != 8) {
    return 0;
  }
  uint64_t v5 = [(TAAccessoryInformation *)self productData];
  id v6 = objc_msgSend(v5, "subdataWithRange:", 0, 4);

  id v7 = v6;
  unsigned int v8 = *(_DWORD *)[v7 bytes];

  return v8;
}

- (unsigned)productId
{
  v3 = [(TAAccessoryInformation *)self productData];
  uint64_t v4 = [v3 length];

  if (v4 != 8) {
    return 0;
  }
  uint64_t v5 = [(TAAccessoryInformation *)self productData];
  id v6 = objc_msgSend(v5, "subdataWithRange:", 4, 4);

  id v7 = v6;
  unsigned int v8 = *(_DWORD *)[v7 bytes];

  return v8;
}

- (BOOL)isHawkeyeAudioAccessory
{
  if (![(TAAccessoryInformation *)self productId] || ![(TAAccessoryInformation *)self vendorId]) {
    return 0;
  }
  v3 = [MEMORY[0x263EFF9C0] setWithArray:&unk_26D684368];
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D684380];
  [v3 unionSet:v4];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TAAccessoryInformation productId](self, "productId"));
  if ([v3 containsObject:v5]) {
    BOOL v6 = [(TAAccessoryInformation *)self vendorId] == 76;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)accessoryTypeNameWithAdvTypeString:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(TAAccessoryInformation *)self deviceType] - 1;
  if (v5 > 3)
  {
    BOOL v6 = @"Unknown";
    id v7 = @"Unknown";
    unsigned int v8 = @"Unknown";
  }
  else
  {
    BOOL v6 = off_2646AAA60[v5];
    id v7 = off_2646AAA80[v5];
    unsigned int v8 = off_2646AAAA0[v5];
  }
  if (v4)
  {
    v27[0] = v8;
    v27[1] = v4;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    unsigned int v8 = [v9 componentsJoinedByString:@":"];
  }
  v10 = [(TAAccessoryInformation *)self manufacturerName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    BOOL v6 = [(TAAccessoryInformation *)self manufacturerName];
  }
  v12 = [(TAAccessoryInformation *)self modelName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v7 = [(TAAccessoryInformation *)self modelName];
  }
  v14 = [(TAAccessoryInformation *)self productData];
  uint64_t v15 = [v14 length];

  if (v15 == 8)
  {
    uint64_t v16 = [(TAAccessoryInformation *)self vendorId];
    uint64_t v17 = [(TAAccessoryInformation *)self productId];
    objc_msgSend(NSString, "stringWithFormat:", @"%X:%X", v16, v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = @"Unknown";
  }
  if ([(__CFString *)v18 isEqualToString:@"Unknown"])
  {
    v26[0] = v8;
    v26[1] = v6;
    v26[2] = v7;
    v19 = (void *)MEMORY[0x263EFF8C0];
    v20 = v26;
    uint64_t v21 = 3;
  }
  else
  {
    v25[0] = v8;
    v25[1] = v6;
    v25[2] = v7;
    v25[3] = v18;
    v19 = (void *)MEMORY[0x263EFF8C0];
    v20 = v25;
    uint64_t v21 = 4;
  }
  id v22 = [v19 arrayWithObjects:v20 count:v21];
  id v23 = [v22 componentsJoinedByString:@":"];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v6 = (TAAccessoryInformation *)a3;
  if (self == v6)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      unsigned int v8 = [(TAAccessoryInformation *)self identifier];
      v9 = [(TAAccessoryInformation *)v7 identifier];
      if (v8 != v9)
      {
        v3 = [(TAAccessoryInformation *)self identifier];
        id v4 = [(TAAccessoryInformation *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          BOOL v10 = 0;
          goto LABEL_56;
        }
      }
      unint64_t v11 = [(TAAccessoryInformation *)self deviceType];
      if (v11 != [(TAAccessoryInformation *)v7 deviceType])
      {
        BOOL v10 = 0;
        goto LABEL_55;
      }
      v12 = [(TAAccessoryInformation *)self productData];
      v68 = [(TAAccessoryInformation *)v7 productData];
      if (v12 != v68)
      {
        uint64_t v13 = [(TAAccessoryInformation *)self productData];
        v63 = [(TAAccessoryInformation *)v7 productData];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          BOOL v10 = 0;
          goto LABEL_53;
        }
        v67 = v13;
      }
      uint64_t v14 = [(TAAccessoryInformation *)self manufacturerName];
      uint64_t v65 = [(TAAccessoryInformation *)v7 manufacturerName];
      v66 = (void *)v14;
      v64 = v12;
      if (v14 != v65)
      {
        uint64_t v15 = [(TAAccessoryInformation *)self manufacturerName];
        [(TAAccessoryInformation *)v7 manufacturerName];
        v60 = v61 = v15;
        if (!objc_msgSend(v15, "isEqual:"))
        {
          BOOL v10 = 0;
          uint64_t v16 = (void *)v65;
          uint64_t v17 = v66;
LABEL_51:

LABEL_52:
          v12 = v64;
          uint64_t v13 = v67;
          if (v64 == v68)
          {
LABEL_54:

LABEL_55:
            if (v8 == v9)
            {
LABEL_57:

              goto LABEL_58;
            }
LABEL_56:

            goto LABEL_57;
          }
LABEL_53:

          goto LABEL_54;
        }
      }
      v18 = [(TAAccessoryInformation *)self modelName];
      uint64_t v62 = [(TAAccessoryInformation *)v7 modelName];
      if (v18 == (void *)v62)
      {
        v59 = v18;
      }
      else
      {
        v19 = [(TAAccessoryInformation *)self modelName];
        v55 = [(TAAccessoryInformation *)v7 modelName];
        v56 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          BOOL v10 = 0;
          id v22 = (void *)v62;
LABEL_49:

LABEL_50:
          uint64_t v16 = (void *)v65;
          uint64_t v17 = v66;
          if (v66 == (void *)v65) {
            goto LABEL_52;
          }
          goto LABEL_51;
        }
        v59 = v18;
      }
      v20 = [(TAAccessoryInformation *)self firmwareVersion];
      uint64_t v57 = [(TAAccessoryInformation *)v7 firmwareVersion];
      v58 = v20;
      if (v20 != (void *)v57)
      {
        uint64_t v21 = [(TAAccessoryInformation *)self firmwareVersion];
        v53 = [(TAAccessoryInformation *)v7 firmwareVersion];
        v54 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          BOOL v10 = 0;
          id v22 = (void *)v62;
          id v23 = (void *)v57;
LABEL_47:

LABEL_48:
          v18 = v59;
          if (v59 == v22) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
      }
      uint64_t v24 = [(TAAccessoryInformation *)self accessoryCategory];
      [(TAAccessoryInformation *)v7 accessoryCategory];
      uint64_t v52 = v51 = (void *)v24;
      if (v24 != v52)
      {
        id v25 = [(TAAccessoryInformation *)self accessoryCategory];
        v49 = [(TAAccessoryInformation *)v7 accessoryCategory];
        v50 = v25;
        if (!objc_msgSend(v25, "isEqual:"))
        {
          BOOL v10 = 0;
          id v22 = (void *)v62;
          id v26 = (void *)v24;
          id v27 = (void *)v52;
LABEL_45:

LABEL_46:
          id v23 = (void *)v57;
          v20 = v58;
          if (v58 == (void *)v57) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
      }
      id v28 = [(TAAccessoryInformation *)self accessoryCapabilities];
      uint64_t v48 = [(TAAccessoryInformation *)v7 accessoryCapabilities];
      if (v28 != (void *)v48)
      {
        v29 = [(TAAccessoryInformation *)self accessoryCapabilities];
        v43 = [(TAAccessoryInformation *)v7 accessoryCapabilities];
        uint64_t v44 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          BOOL v10 = 0;
          id v22 = (void *)v62;
          uint64_t v30 = (void *)v48;
LABEL_43:

LABEL_44:
          id v26 = v51;
          id v27 = (void *)v52;
          if (v51 == (void *)v52) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
      }
      uint64_t v31 = [(TAAccessoryInformation *)self serialNumber];
      v46 = [(TAAccessoryInformation *)v7 serialNumber];
      objc_super v47 = (void *)v31;
      v45 = v28;
      if ((void *)v31 == v46
        || ([(TAAccessoryInformation *)self serialNumber],
            uint64_t v32 = objc_claimAutoreleasedReturnValue(),
            [(TAAccessoryInformation *)v7 serialNumber],
            v41 = objc_claimAutoreleasedReturnValue(),
            uint64_t v42 = v32,
            objc_msgSend(v32, "isEqual:")))
      {
        int64_t v35 = [(TAAccessoryInformation *)self protocolImplementation];
        if (v35 == [(TAAccessoryInformation *)v7 protocolImplementation]
          && (int64_t v36 = [(TAAccessoryInformation *)self networkID],
              v36 == [(TAAccessoryInformation *)v7 networkID])
          && (int64_t v37 = [(TAAccessoryInformation *)self batteryType],
              v37 == [(TAAccessoryInformation *)v7 batteryType]))
        {
          int64_t v38 = [(TAAccessoryInformation *)self batteryLevel];
          BOOL v10 = v38 == [(TAAccessoryInformation *)v7 batteryLevel];
          BOOL v39 = v10;
        }
        else
        {
          BOOL v10 = 0;
          BOOL v39 = 0;
        }
        uint64_t v34 = v46;
        v33 = v47;
        if (v47 == v46)
        {

          BOOL v10 = v39;
LABEL_42:
          id v28 = v45;
          uint64_t v30 = (void *)v48;
          id v22 = (void *)v62;
          if (v45 == (void *)v48) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v10 = 0;
        uint64_t v34 = v46;
        v33 = v47;
      }

      goto LABEL_42;
    }
    BOOL v10 = 0;
  }
LABEL_58:

  return v10;
}

- (id)descriptionDictionary
{
  v51[13] = *MEMORY[0x263EF8340];
  v50[0] = @"identifier";
  v49 = [(TAAccessoryInformation *)self identifier];
  if (v49)
  {
    v33 = [(TAAccessoryInformation *)self identifier];
    v3 = [v33 description];
  }
  else
  {
    v3 = &stru_26D677430;
  }
  uint64_t v42 = v3;
  v51[0] = v3;
  v50[1] = @"deviceType";
  uint64_t v48 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:[(TAAccessoryInformation *)self deviceType]];
  v51[1] = v48;
  v50[2] = @"productData";
  uint64_t v4 = [(TAAccessoryInformation *)self productData];
  if (v4)
  {
    uint64_t v32 = [(TAAccessoryInformation *)self productData];
    unint64_t v5 = [v32 description];
  }
  else
  {
    unint64_t v5 = &stru_26D677430;
  }
  v41 = v5;
  v51[2] = v5;
  v50[3] = @"manufacturer";
  uint64_t v6 = [(TAAccessoryInformation *)self manufacturerName];
  if (v6)
  {
    uint64_t v31 = [(TAAccessoryInformation *)self manufacturerName];
    id v7 = [v31 description];
  }
  else
  {
    id v7 = &stru_26D677430;
  }
  uint64_t v40 = v7;
  v51[3] = v7;
  v50[4] = @"model";
  uint64_t v8 = [(TAAccessoryInformation *)self modelName];
  if (v8)
  {
    uint64_t v30 = [(TAAccessoryInformation *)self modelName];
    v9 = [v30 description];
  }
  else
  {
    v9 = &stru_26D677430;
  }
  BOOL v39 = v9;
  v51[4] = v9;
  v50[5] = @"FV";
  v45 = [(TAAccessoryInformation *)self firmwareVersion];
  if (v45)
  {
    v29 = [(TAAccessoryInformation *)self firmwareVersion];
    BOOL v10 = [v29 description];
  }
  else
  {
    BOOL v10 = &stru_26D677430;
  }
  int64_t v38 = v10;
  v51[5] = v10;
  v50[6] = @"category";
  unint64_t v11 = [(TAAccessoryInformation *)self accessoryCategory];
  if (v11)
  {
    id v28 = [(TAAccessoryInformation *)self accessoryCategory];
    v12 = [v28 description];
  }
  else
  {
    v12 = &stru_26D677430;
  }
  int64_t v37 = v12;
  v51[6] = v12;
  v50[7] = @"capabilities";
  v43 = [(TAAccessoryInformation *)self accessoryCapabilities];
  if (v43)
  {
    id v27 = [(TAAccessoryInformation *)self accessoryCapabilities];
    uint64_t v13 = [v27 description];
  }
  else
  {
    uint64_t v13 = &stru_26D677430;
  }
  int64_t v36 = v13;
  v51[7] = v13;
  v50[8] = @"serialNumber";
  uint64_t v14 = [(TAAccessoryInformation *)self serialNumber];
  if (v14)
  {
    id v26 = [(TAAccessoryInformation *)self serialNumber];
    uint64_t v15 = [v26 description];
  }
  else
  {
    uint64_t v15 = &stru_26D677430;
  }
  int64_t v35 = v15;
  v51[8] = v15;
  v50[9] = @"protocolImplementation";
  int64_t v16 = [(TAAccessoryInformation *)self protocolImplementation];
  objc_super v47 = (void *)v4;
  if (v16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[TAAccessoryInformation protocolImplementation](self, "protocolImplementation"));
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = &stru_26D677430;
  }
  uint64_t v34 = v17;
  v51[9] = v17;
  v50[10] = @"networkID";
  int64_t v18 = [(TAAccessoryInformation *)self networkID];
  v46 = (void *)v6;
  if (v18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[TAAccessoryInformation networkID](self, "networkID"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_26D677430;
  }
  uint64_t v44 = (void *)v8;
  v51[10] = v19;
  v50[11] = @"batteryType";
  int64_t v20 = [(TAAccessoryInformation *)self batteryType];
  if (v20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[TAAccessoryInformation batteryType](self, "batteryType"));
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = &stru_26D677430;
  }
  v51[11] = v21;
  v50[12] = @"batteryLevel";
  int64_t v22 = [(TAAccessoryInformation *)self batteryLevel];
  if (v22)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[TAAccessoryInformation batteryLevel](self, "batteryLevel"));
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = &stru_26D677430;
  }
  v51[12] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:13];
  if (v22) {

  }
  if (v20) {
  if (v18)
  }

  if (v16) {
  if (v14)
  }
  {
  }
  if (v43)
  {
  }
  if (v11)
  {
  }
  if (v45)
  {
  }
  if (v44)
  {
  }
  if (v46)
  {
  }
  if (v47)
  {
  }
  if (v49)
  {
  }
  return v24;
}

- (id)description
{
  v3 = [(TAAccessoryInformation *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v15 = +[TAAccessoryInformation allocWithZone:a3];
  uint64_t v14 = [(TAAccessoryInformation *)self identifier];
  unint64_t v13 = [(TAAccessoryInformation *)self deviceType];
  v12 = [(TAAccessoryInformation *)self productData];
  uint64_t v4 = [(TAAccessoryInformation *)self manufacturerName];
  id v5 = [(TAAccessoryInformation *)self modelName];
  uint64_t v6 = [(TAAccessoryInformation *)self firmwareVersion];
  id v7 = [(TAAccessoryInformation *)self accessoryCategory];
  uint64_t v8 = [(TAAccessoryInformation *)self accessoryCapabilities];
  v9 = [(TAAccessoryInformation *)self serialNumber];
  id v10 = [(TAAccessoryInformation *)v15 initWithDeviceUUID:v14 deviceType:v13 productData:v12 manufacturerName:v4 modelName:v5 firmwareVersion:v6 accessoryCategory:v7 accessoryCapabilities:v8 serialNumber:v9 protocolImplementation:[(TAAccessoryInformation *)self protocolImplementation] networkID:[(TAAccessoryInformation *)self networkID] batteryType:[(TAAccessoryInformation *)self batteryType] batteryLevel:[(TAAccessoryInformation *)self batteryLevel]];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [v5 encodeObject:self->_productData forKey:@"productData"];
  [v5 encodeObject:self->_manufacturerName forKey:@"manufacturer"];
  [v5 encodeObject:self->_modelName forKey:@"model"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"FV"];
  [v5 encodeObject:self->_accessoryCategory forKey:@"category"];
  [v5 encodeObject:self->_accessoryCapabilities forKey:@"capabilities"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeInteger:self->_protocolImplementation forKey:@"protocolImplementation"];
  [v5 encodeInteger:self->_networkID forKey:@"networkID"];
  [v5 encodeInteger:self->_batteryType forKey:@"batteryType"];
  [v5 encodeInteger:self->_batteryLevel forKey:@"batteryLevel"];
}

- (TAAccessoryInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_deviceType = [v4 decodeIntegerForKey:@"deviceType"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productData"];
  productData = self->_productData;
  self->_productData = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturer"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  modelName = self->_modelName;
  self->_modelName = v11;

  unint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FV"];
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];
  accessoryCapabilities = self->_accessoryCapabilities;
  self->_accessoryCapabilities = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v19;

  self->_protocolImplementation = (int)[v4 decodeInt32ForKey:@"protocolImplementation"];
  self->_networkID = [v4 decodeIntegerForKey:@"networkID"];
  self->_batteryType = [v4 decodeIntegerForKey:@"batteryType"];
  int64_t v21 = [v4 decodeIntegerForKey:@"batteryLevel"];

  self->_batteryLevel = v21;
  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSData)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSData)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSData)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(id)a3
{
}

- (NSData)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (int64_t)protocolImplementation
{
  return self->_protocolImplementation;
}

- (void)setProtocolImplementation:(int64_t)a3
{
  self->_protocolImplementation = a3;
}

- (int64_t)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(int64_t)a3
{
  self->_networkID = a3;
}

- (int64_t)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(int64_t)a3
{
  self->_batteryType = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_accessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end