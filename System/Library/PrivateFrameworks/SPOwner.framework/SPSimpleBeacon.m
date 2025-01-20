@interface SPSimpleBeacon
- (BOOL)connectionAllowed;
- (BOOL)isEqual:(id)a3;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)systemVersion;
- (NSString)type;
- (NSUUID)groupIdentifier;
- (NSUUID)identifier;
- (NSUUID)productUUID;
- (SPKeySyncRecord)keySyncRecord;
- (SPSimpleBeacon)initWithInternalSimpleBeacon:(id)a3;
- (double)txPower;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)batteryLevel;
- (int64_t)connectableDeviceCount;
- (int64_t)partIdentifier;
- (int64_t)productId;
- (int64_t)vendorId;
- (unint64_t)hash;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setConnectableDeviceCount:(int64_t)a3;
- (void)setConnectionAllowed:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeySyncRecord:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setName:(id)a3;
- (void)setPartIdentifier:(int64_t)a3;
- (void)setProductId:(int64_t)a3;
- (void)setProductUUID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTxPower:(double)a3;
- (void)setType:(id)a3;
- (void)setVendorId:(int64_t)a3;
@end

@implementation SPSimpleBeacon

- (SPSimpleBeacon)initWithInternalSimpleBeacon:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SPSimpleBeacon;
  v5 = [(SPSimpleBeacon *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 type];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = [v4 groupIdentifier];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSUUID *)v10;

    v5->_partIdentifier = [v4 partIdentifier];
    v5->_connectionAllowed = [v4 connectionAllowed];
    [v4 txPower];
    v5->_txPower = v12;
    uint64_t v13 = [v4 productUUID];
    productUUID = v5->_productUUID;
    v5->_productUUID = (NSUUID *)v13;

    v5->_vendorId = [v4 vendorId];
    v5->_productId = [v4 productId];
    uint64_t v15 = [v4 modelName];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v15;

    uint64_t v17 = [v4 manufacturerName];
    manufacturerName = v5->_manufacturerName;
    v5->_manufacturerName = (NSString *)v17;

    uint64_t v19 = [v4 serialNumber];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v19;

    uint64_t v21 = [v4 systemVersion];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v21;

    uint64_t v23 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v23;

    v5->_batteryLevel = [v4 batteryLevel];
    v5->_connectableDeviceCount = [v4 connectableDeviceCount];
    uint64_t v25 = [v4 keySyncRecord];
    keySyncRecord = v5->_keySyncRecord;
    v5->_keySyncRecord = (SPKeySyncRecord *)v25;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SPSimpleBeacon *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SPSimpleBeacon *)self identifier];
      v7 = [(SPSimpleBeacon *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(SPSimpleBeacon *)self type];
        v9 = [(SPSimpleBeacon *)v5 type];
        if ([v8 isEqualToString:v9]
          && (int64_t v10 = [(SPSimpleBeacon *)self partIdentifier],
              v10 == [(SPSimpleBeacon *)v5 partIdentifier])
          && (BOOL v11 = [(SPSimpleBeacon *)self connectionAllowed],
              v11 == [(SPSimpleBeacon *)v5 connectionAllowed]))
        {
          v38 = [(SPSimpleBeacon *)self systemVersion];
          v39 = [(SPSimpleBeacon *)v5 systemVersion];
          if (![v38 isEqualToString:v39]) {
            goto LABEL_58;
          }
          [(SPSimpleBeacon *)self txPower];
          double v41 = v40;
          [(SPSimpleBeacon *)v5 txPower];
          if (v41 != v42) {
            goto LABEL_58;
          }
          int64_t v43 = [(SPSimpleBeacon *)self vendorId];
          if (v43 == [(SPSimpleBeacon *)v5 vendorId]
            && (int64_t v44 = [(SPSimpleBeacon *)self productId], v44 == [(SPSimpleBeacon *)v5 productId])&& (v45 = [(SPSimpleBeacon *)self batteryLevel], v45 == [(SPSimpleBeacon *)v5 batteryLevel])&& (v46 = [(SPSimpleBeacon *)self connectableDeviceCount], v46 == [(SPSimpleBeacon *)v5 connectableDeviceCount])&& (v47 = [(SPSimpleBeacon *)self partIdentifier], v47 == [(SPSimpleBeacon *)v5 partIdentifier]))
          {
            v49 = [(SPSimpleBeacon *)self productUUID];
            v48 = [(SPSimpleBeacon *)v5 productUUID];
            int v12 = [v49 isEqual:v48];
          }
          else
          {
LABEL_58:
            int v12 = 0;
          }
        }
        else
        {
          int v12 = 0;
        }
      }
      else
      {
        int v12 = 0;
      }

      v14 = [(SPSimpleBeacon *)self name];

      if (v14) {
        int v15 = 0;
      }
      else {
        int v15 = v12;
      }
      if (v14 && v12)
      {
        v16 = [(SPSimpleBeacon *)self name];
        uint64_t v17 = [(SPSimpleBeacon *)v5 name];
        int v15 = [v16 isEqual:v17];
      }
      v18 = [(SPSimpleBeacon *)self groupIdentifier];

      if (v18) {
        int v19 = 0;
      }
      else {
        int v19 = v15;
      }
      if (v18 && v15)
      {
        v20 = [(SPSimpleBeacon *)self groupIdentifier];
        uint64_t v21 = [(SPSimpleBeacon *)v5 groupIdentifier];
        int v19 = [v20 isEqual:v21];
      }
      v22 = [(SPSimpleBeacon *)self modelName];

      if (v22) {
        int v23 = 0;
      }
      else {
        int v23 = v19;
      }
      if (v22 && v19)
      {
        v24 = [(SPSimpleBeacon *)self modelName];
        uint64_t v25 = [(SPSimpleBeacon *)v5 modelName];
        int v23 = [v24 isEqualToString:v25];
      }
      v26 = [(SPSimpleBeacon *)self manufacturerName];

      if (v26) {
        int v27 = 0;
      }
      else {
        int v27 = v23;
      }
      if (v26 && v23)
      {
        objc_super v28 = [(SPSimpleBeacon *)self manufacturerName];
        v29 = [(SPSimpleBeacon *)v5 manufacturerName];
        int v27 = [v28 isEqualToString:v29];
      }
      v30 = [(SPSimpleBeacon *)self serialNumber];

      if (v30) {
        int v31 = 0;
      }
      else {
        int v31 = v27;
      }
      if (v30 && v27)
      {
        v32 = [(SPSimpleBeacon *)self serialNumber];
        v33 = [(SPSimpleBeacon *)v5 serialNumber];
        int v31 = [v32 isEqualToString:v33];
      }
      v34 = [(SPSimpleBeacon *)self keySyncRecord];

      if (v34) {
        char v13 = 0;
      }
      else {
        char v13 = v31;
      }
      if (v34 && v31)
      {
        v35 = [(SPSimpleBeacon *)self keySyncRecord];
        v36 = [(SPSimpleBeacon *)v5 keySyncRecord];
        char v13 = [v35 isEqual:v36];
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_type hash];
  BOOL connectionAllowed = self->_connectionAllowed;
  int64_t partIdentifier = self->_partIdentifier;
  NSUInteger v7 = [(NSString *)self->_systemVersion hash];
  unint64_t v8 = (unint64_t)(self->_txPower * 100.0);
  int8x16_t v26 = *(int8x16_t *)&self->_vendorId;
  int8x16_t v27 = *(int8x16_t *)&self->_batteryLevel;
  int64_t v9 = self->_partIdentifier;
  uint64_t v10 = [(NSUUID *)self->_productUUID hash];
  int8x16_t v11 = veorq_s8(v26, v27);
  unint64_t v12 = *(void *)&veor_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) ^ partIdentifier ^ v9 ^ v10 ^ v3 ^ v7 ^ v4 ^ connectionAllowed ^ v8;
  char v13 = [(SPSimpleBeacon *)self name];

  if (v13)
  {
    v14 = [(SPSimpleBeacon *)self name];
    v12 ^= [v14 hash];
  }
  int v15 = [(SPSimpleBeacon *)self groupIdentifier];

  if (v15)
  {
    v16 = [(SPSimpleBeacon *)self groupIdentifier];
    v12 ^= [v16 hash];
  }
  uint64_t v17 = [(SPSimpleBeacon *)self modelName];

  if (v17)
  {
    v18 = [(SPSimpleBeacon *)self modelName];
    v12 ^= [v18 hash];
  }
  int v19 = [(SPSimpleBeacon *)self manufacturerName];

  if (v19)
  {
    v20 = [(SPSimpleBeacon *)self manufacturerName];
    v12 ^= [v20 hash];
  }
  uint64_t v21 = [(SPSimpleBeacon *)self serialNumber];

  if (v21)
  {
    v22 = [(SPSimpleBeacon *)self serialNumber];
    v12 ^= [v22 hash];
  }
  int v23 = [(SPSimpleBeacon *)self keySyncRecord];

  if (v23)
  {
    v24 = [(SPSimpleBeacon *)self keySyncRecord];
    v12 ^= [v24 hash];
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_opt_new();
  v5 = [(SPSimpleBeacon *)self identifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  NSUInteger v7 = [(SPSimpleBeacon *)self type];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setType:v8];

  int64_t v9 = [(SPSimpleBeacon *)self groupIdentifier];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setGroupIdentifier:v10];

  objc_msgSend(v4, "setPartIdentifier:", -[SPSimpleBeacon partIdentifier](self, "partIdentifier"));
  objc_msgSend(v4, "setConnectionAllowed:", -[SPSimpleBeacon connectionAllowed](self, "connectionAllowed"));
  [(SPSimpleBeacon *)self txPower];
  objc_msgSend(v4, "setTxPower:");
  int8x16_t v11 = [(SPSimpleBeacon *)self productUUID];
  [v4 setProductUUID:v11];

  objc_msgSend(v4, "setVendorId:", -[SPSimpleBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPSimpleBeacon productId](self, "productId"));
  unint64_t v12 = [(SPSimpleBeacon *)self modelName];
  char v13 = (void *)[v12 copy];
  [v4 setModelName:v13];

  v14 = [(SPSimpleBeacon *)self manufacturerName];
  int v15 = (void *)[v14 copy];
  [v4 setManufacturerName:v15];

  v16 = [(SPSimpleBeacon *)self serialNumber];
  uint64_t v17 = (void *)[v16 copy];
  [v4 setSerialNumber:v17];

  v18 = [(SPSimpleBeacon *)self systemVersion];
  int v19 = (void *)[v18 copy];
  [v4 setSystemVersion:v19];

  v20 = [(SPSimpleBeacon *)self name];
  uint64_t v21 = (void *)[v20 copy];
  [v4 setName:v21];

  objc_msgSend(v4, "setBatteryLevel:", -[SPSimpleBeacon batteryLevel](self, "batteryLevel"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  v22 = [(SPSimpleBeacon *)self keySyncRecord];
  int v23 = (void *)[v22 copy];
  [v4 setKeySyncRecord:v23];

  return v4;
}

- (id)debugDescription
{
  uint64_t v3 = [(SPSimpleBeacon *)self groupIdentifier];

  NSUInteger v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    uint64_t v6 = [(SPSimpleBeacon *)self groupIdentifier];
    NSUInteger v7 = [(SPSimpleBeacon *)self identifier];
    unint64_t v8 = [v4 stringWithFormat:@"<%@: %p (%@) %@>", v5, self, v6, v7];
  }
  else
  {
    uint64_t v6 = [(SPSimpleBeacon *)self identifier];
    unint64_t v8 = [v4 stringWithFormat:@"<%@: %p %@>", v5, self, v6];
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

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_int64_t partIdentifier = a3;
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_connectableDeviceCount = a3;
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (SPKeySyncRecord)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end