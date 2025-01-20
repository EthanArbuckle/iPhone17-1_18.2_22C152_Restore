@interface TASPAdvertisement
+ (BOOL)supportsSecureCoding;
+ (id)TASPAdvertisementBatteryStateToString:(int64_t)a3;
+ (id)TASPAdvertisementDeviceTypeToString:(unint64_t)a3;
+ (id)TASPAdvertisementTypeToString:(unint64_t)a3;
- (BOOL)beepOnMoveHigh;
- (BOOL)hasHawkeyeAdvertisementPolicy;
- (BOOL)hasHawkeyeLowEnergyAdvertisementPolicy;
- (BOOL)isApple;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearOwner;
- (BOOL)isPosh;
- (NSData)address;
- (NSData)advertisementData;
- (NSData)reserved;
- (NSDate)scanDate;
- (NSNumber)protocolID;
- (NSString)description;
- (NSUUID)uuid;
- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8;
- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 detailsBitmask:(unsigned int)a9 uuid:(id)a10 protocolID:(id)a11;
- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 uuid:(id)a9;
- (TASPAdvertisement)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (id)getLatestAdvTypeToString:(id)a3;
- (int64_t)getBatteryState;
- (int64_t)rssi;
- (unint64_t)getDeviceType;
- (unint64_t)getType;
- (unint64_t)hash;
- (unsigned)detailsBitmask;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TASPAdvertisement

- (unint64_t)getDeviceType
{
  int v2 = self->_status & 0x30;
  switch(v2)
  {
    case 16:
      return 1;
    case 48:
      return 3;
    case 32:
      return 2;
  }
  if ([(TASPAdvertisement *)self isPosh] && ![(TASPAdvertisement *)self isApple]) {
    return 4;
  }
  return 0;
}

- (BOOL)isPosh
{
  return self->_detailsBitmask & 1;
}

- (id)getDate
{
  return self->_scanDate;
}

- (NSData)address
{
  return self->_address;
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 detailsBitmask:(unsigned int)a9 uuid:(id)a10 protocolID:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  v39.receiver = self;
  v39.super_class = (Class)TASPAdvertisement;
  v23 = [(TASPAdvertisement *)&v39 init];
  if (!v23)
  {
LABEL_15:
    v24 = v23;
    goto LABEL_16;
  }
  v24 = 0;
  if (v17 && v18 && v19 && v20)
  {
    uint64_t v25 = [v17 copy];
    address = v23->_address;
    v23->_address = (NSData *)v25;

    uint64_t v27 = [v18 copy];
    advertisementData = v23->_advertisementData;
    v23->_advertisementData = (NSData *)v27;

    v23->_status = a5;
    uint64_t v29 = [v19 copy];
    reserved = v23->_reserved;
    v23->_reserved = (NSData *)v29;

    v23->_rssi = a7;
    uint64_t v31 = [v20 copy];
    scanDate = v23->_scanDate;
    v23->_scanDate = (NSDate *)v31;

    if (v21)
    {
      uint64_t v33 = [v21 copy];
      uuid = v23->_uuid;
      v23->_uuid = (NSUUID *)v33;
    }
    else
    {
      uuid = v23->_uuid;
      v23->_uuid = 0;
    }

    if (v22)
    {
      uint64_t v35 = [v22 copy];
      protocolID = v23->_protocolID;
      v23->_protocolID = (NSNumber *)v35;
    }
    else
    {
      protocolID = v23->_protocolID;
      v23->_protocolID = 0;
    }

    v23->_detailsBitmask = a9;
    if ([(NSData *)v23->_reserved length] && [(TASPAdvertisement *)v23 isApple])
    {
      char v38 = 0;
      [(NSData *)v23->_reserved getBytes:&v38 length:1];
      v23->_beepOnMoveHigh = (v38 & 4) != 0;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v24;
}

- (BOOL)isApple
{
  return (LOBYTE(self->_detailsBitmask) >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  return [(TASPAdvertisement *)self initWithAddress:a3 advertisementData:a4 status:a5 reserved:a6 rssi:a7 scanDate:a8 uuid:0];
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 uuid:(id)a9
{
  uint64_t v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  if ([v19 length]) {
    int v21 = 2;
  }
  else {
    int v21 = 6;
  }
  LODWORD(v24) = v21;
  id v22 = [(TASPAdvertisement *)self initWithAddress:v20 advertisementData:v19 status:v12 reserved:v18 rssi:a7 scanDate:v17 detailsBitmask:v24 uuid:v16 protocolID:0];

  return v22;
}

- (unint64_t)getType
{
  if ([(TASPAdvertisement *)self isNearOwner]) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)TASPAdvertisementTypeToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_2646AAC50[a3];
  }
}

- (BOOL)isNearOwner
{
  return (LOBYTE(self->_detailsBitmask) >> 2) & 1;
}

+ (id)TASPAdvertisementDeviceTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Invalid";
  }
  else {
    return off_2646AAC68[a3];
  }
}

- (id)getLatestAdvTypeToString:(id)a3
{
  id v4 = a3;
  if ([(TASPAdvertisement *)self isPosh] && [(TASPAdvertisement *)self isApple])
  {
    if (v4)
    {
      v5 = @":AP";
LABEL_17:
      v7 = [v4 stringByAppendingString:v5];

      goto LABEL_18;
    }
    v7 = @"AP";
  }
  else
  {
    if (![(TASPAdvertisement *)self isPosh] || [(TASPAdvertisement *)self isApple])
    {
      BOOL v6 = [(TASPAdvertisement *)self isApple];
      if (v6) {
        v7 = @"A";
      }
      else {
        v7 = @"NA";
      }
      if (v6) {
        v5 = @":A";
      }
      else {
        v5 = @":NA";
      }
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (v4)
    {
      v5 = @":P";
      goto LABEL_17;
    }
    v7 = @"P";
  }
LABEL_18:
  return v7;
}

- (int64_t)getBatteryState
{
  unsigned int status = self->_status;
  int64_t v3 = 2;
  if ((status & 0xC0) != 0x80) {
    int64_t v3 = (status & 0xC0) == 64;
  }
  if (status <= 0xBF) {
    return v3;
  }
  else {
    return 3;
  }
}

+ (id)TASPAdvertisementBatteryStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_2646AAC90[a3];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TASPAdvertisement *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(TASPAdvertisement *)self scanDate];
      v7 = [(TASPAdvertisement *)v5 scanDate];
      if ([v6 isEqualToDate:v7])
      {
        v8 = [(TASPAdvertisement *)self advertisementData];
        v9 = [(TASPAdvertisement *)v5 advertisementData];
        if ([v8 isEqualToData:v9]
          && (int v10 = [(TASPAdvertisement *)self status], v10 == [(TASPAdvertisement *)v5 status]))
        {
          v11 = [(TASPAdvertisement *)self reserved];
          uint64_t v12 = [(TASPAdvertisement *)v5 reserved];
          if ([v11 isEqualToData:v12]
            && (int64_t v13 = [(TASPAdvertisement *)self rssi], v13 == [(TASPAdvertisement *)v5 rssi]))
          {
            uint64_t v14 = [(TASPAdvertisement *)self address];
            uint64_t v15 = [(TASPAdvertisement *)v5 address];
            uint64_t v24 = (void *)v14;
            id v16 = (void *)v14;
            id v17 = (void *)v15;
            if ([v16 isEqualToData:v15]
              && (unsigned int v22 = [(TASPAdvertisement *)self detailsBitmask],
                  v22 == [(TASPAdvertisement *)v5 detailsBitmask]))
            {
              v23 = [(TASPAdvertisement *)self protocolID];
              int v18 = [v23 intValue];
              int v21 = [(TASPAdvertisement *)v5 protocolID];
              BOOL v19 = v18 == [v21 intValue];
            }
            else
            {
              BOOL v19 = 0;
            }
          }
          else
          {
            BOOL v19 = 0;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TASPAdvertisement *)self rssi];
  if (v3 >= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = -v3;
  }
  uint64_t v18 = v4;
  v5 = [(TASPAdvertisement *)self scanDate];
  uint64_t v17 = [v5 hash];
  BOOL v6 = [(TASPAdvertisement *)self advertisementData];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(TASPAdvertisement *)self status];
  v9 = [(TASPAdvertisement *)self reserved];
  uint64_t v10 = [v9 hash];
  v11 = [(TASPAdvertisement *)self address];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(TASPAdvertisement *)self detailsBitmask];
  uint64_t v14 = [(TASPAdvertisement *)self protocolID];
  unint64_t v15 = v17 ^ v7 ^ v18 ^ v8 ^ v10 ^ v12 ^ v13 ^ (int)[v14 intValue];

  return v15;
}

- (id)descriptionDictionary
{
  v32[14] = *MEMORY[0x263EF8340];
  v31[0] = @"EventType";
  uint64_t v3 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v3);
  v32[0] = v30;
  v31[1] = @"Address";
  uint64_t v29 = [(TASPAdvertisement *)self address];
  v28 = [v29 hexString];
  v32[1] = v28;
  v31[2] = @"Data";
  uint64_t v27 = [(TASPAdvertisement *)self advertisementData];
  v26 = [v27 hexString];
  v32[2] = v26;
  v31[3] = @"Status";
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[TASPAdvertisement status](self, "status"));
  v32[3] = v25;
  v31[4] = @"Reserved";
  uint64_t v24 = [(TASPAdvertisement *)self reserved];
  v23 = [v24 hexString];
  v32[4] = v23;
  v31[5] = @"RSSI";
  unsigned int v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[TASPAdvertisement rssi](self, "rssi"));
  v32[5] = v22;
  v31[6] = @"Date";
  int v21 = [(TASPAdvertisement *)self scanDate];
  id v20 = [v21 getDateString];
  v32[6] = v20;
  v31[7] = @"Type";
  BOOL v19 = +[TASPAdvertisement TASPAdvertisementTypeToString:[(TASPAdvertisement *)self getType]];
  v32[7] = v19;
  v31[8] = @"DeviceType";
  uint64_t v18 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:[(TASPAdvertisement *)self getDeviceType]];
  v32[8] = v18;
  v31[9] = @"UUID";
  uint64_t v4 = [(TASPAdvertisement *)self uuid];
  if (v4)
  {
    uint64_t v17 = [(TASPAdvertisement *)self uuid];
    v5 = [v17 UUIDString];
  }
  else
  {
    v5 = &stru_26D677430;
  }
  v32[9] = v5;
  v31[10] = @"BatteryState";
  BOOL v6 = +[TASPAdvertisement TASPAdvertisementBatteryStateToString:[(TASPAdvertisement *)self getBatteryState]];
  v32[10] = v6;
  v31[11] = @"DetailsBitmask";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TASPAdvertisement detailsBitmask](self, "detailsBitmask"));
  v32[11] = v7;
  v31[12] = @"DetailsBitmaskString";
  uint64_t v8 = NSString;
  if ([(TASPAdvertisement *)self isPosh]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(TASPAdvertisement *)self isApple]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if ([(TASPAdvertisement *)self isNearOwner]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  uint64_t v12 = [v8 stringWithFormat:@"isPosh, %@, isApple, %@, isNearOwner, %@", v9, v10, v11];
  v32[12] = v12;
  v31[13] = @"ProtocolIDString";
  uint64_t v13 = [(TASPAdvertisement *)self protocolID];
  if (v13)
  {
    uint64_t v8 = [(TASPAdvertisement *)self protocolID];
    uint64_t v14 = [v8 stringValue];
  }
  else
  {
    uint64_t v14 = @"0";
  }
  v32[13] = v14;
  unint64_t v15 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:14];
  if (v13)
  {
  }
  if (v4)
  {
  }
  return v15;
}

- (NSString)description
{
  uint64_t v3 = [(TASPAdvertisement *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    BOOL v6 = (void *)TAStatusLog;
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

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TASPAdvertisement *)self address];
  [v4 encodeObject:v5 forKey:@"Address"];

  BOOL v6 = [(TASPAdvertisement *)self advertisementData];
  [v4 encodeObject:v6 forKey:@"Data"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[TASPAdvertisement status](self, "status"));
  [v4 encodeObject:v7 forKey:@"Status"];

  uint64_t v8 = [(TASPAdvertisement *)self reserved];
  [v4 encodeObject:v8 forKey:@"Reserved"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[TASPAdvertisement rssi](self, "rssi"), @"RSSI");
  v9 = [(TASPAdvertisement *)self scanDate];
  [v4 encodeObject:v9 forKey:@"Date"];

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TASPAdvertisement detailsBitmask](self, "detailsBitmask"));
  [v4 encodeObject:v10 forKey:@"DetailsBitmask"];

  v11 = [(TASPAdvertisement *)self uuid];
  [v4 encodeObject:v11 forKey:@"UUID"];

  id v12 = [(TASPAdvertisement *)self protocolID];
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v12, "intValue"), @"ProtocolIDString");
}

- (TASPAdvertisement)initWithCoder:(id)a3
{
  id v3 = a3;
  BOOL v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
  unsigned int v17 = [v4 unsignedCharValue];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Reserved"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"RSSI"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"DetailsBitmask"];
  int v9 = [v8 unsignedCharValue];
  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v11 = NSNumber;
  uint64_t v12 = [v3 decodeIntForKey:@"ProtocolIDString"];

  uint64_t v13 = [v11 numberWithInt:v12];
  LODWORD(v16) = v9;
  uint64_t v14 = [(TASPAdvertisement *)self initWithAddress:v19 advertisementData:v18 status:v17 reserved:v5 rssi:v6 scanDate:v7 detailsBitmask:v16 uuid:v10 protocolID:v13];

  return v14;
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TASPAdvertisement alloc];
  LODWORD(v6) = self->_detailsBitmask;
  return [(TASPAdvertisement *)v4 initWithAddress:self->_address advertisementData:self->_advertisementData status:self->_status reserved:self->_reserved rssi:self->_rssi scanDate:self->_scanDate detailsBitmask:v6 uuid:self->_uuid protocolID:self->_protocolID];
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (unsigned)detailsBitmask
{
  return self->_detailsBitmask;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)beepOnMoveHigh
{
  return self->_beepOnMoveHigh;
}

- (NSNumber)protocolID
{
  return self->_protocolID;
}

- (BOOL)hasHawkeyeAdvertisementPolicy
{
  unint64_t v3 = [(TASPAdvertisement *)self getDeviceType];
  if (v3 != 1) {
    LOBYTE(v3) = [(TASPAdvertisement *)self getDeviceType] == 2
  }
              || [(TASPAdvertisement *)self getDeviceType] == 4;
  return v3;
}

- (BOOL)hasHawkeyeLowEnergyAdvertisementPolicy
{
  return [(TASPAdvertisement *)self getDeviceType] == 3;
}

@end