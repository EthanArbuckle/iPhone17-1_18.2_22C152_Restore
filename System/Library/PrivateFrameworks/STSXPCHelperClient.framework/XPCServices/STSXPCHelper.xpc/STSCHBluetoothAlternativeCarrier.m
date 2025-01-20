@interface STSCHBluetoothAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (NSData)advertiseUUID;
- (NSData)humanReadableAdvertiseUUID;
- (NSData)humanReadableLEAddress;
- (NSData)leAddr;
- (STSCHBluetoothAlternativeCarrier)initWithAddress:(id)a3 advertiseUUID:(id)a4 role:(unint64_t)a5 powerState:(unint64_t)a6 auxiliaryRecords:(id)a7;
- (STSCHBluetoothAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHBluetoothAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (id)_createCarrierConfigurationRecord;
- (id)description;
- (id)roleString;
- (unint64_t)leRole;
- (unint64_t)roleFromSpec:(unsigned __int8)a3;
- (unsigned)specRole;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertiseUUID:(id)a3;
- (void)setHumanReadableAdvertiseUUID:(id)a3;
- (void)setLeAddr:(id)a3;
- (void)setLeRole:(unint64_t)a3;
@end

@implementation STSCHBluetoothAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_leAddr, @"leAddr", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_leRole forKey:@"leRole"];
}

- (STSCHBluetoothAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  objc_super v5 = [(STSCHAlternativeCarrier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leAddr"];
    leAddr = v5->_leAddr;
    v5->_leAddr = (NSData *)v6;

    v5->_leRole = (unint64_t)[v4 decodeIntegerForKey:@"leRole"];
  }

  return v5;
}

- (STSCHBluetoothAlternativeCarrier)initWithAddress:(id)a3 advertiseUUID:(id)a4 role:(unint64_t)a5 powerState:(unint64_t)a6 auxiliaryRecords:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v16 = [(STSCHBluetoothAlternativeCarrier *)&v25 init];
  if (v16)
  {
    if (v13 && [v13 length] != (id)7)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 47, v16, @"Invalid leAddr: %@", v17, v18, (uint64_t)v13);
    }
    else
    {
      if (!v14 || [v14 length] == (id)16)
      {
        objc_storeStrong((id *)&v16->_leAddr, a3);
        objc_storeStrong((id *)&v16->_advertiseUUID, a4);
        v16->_leRole = a5;
        [(STSCHAlternativeCarrier *)v16 setAuxiliaryRecords:v15];
        [(STSCHAlternativeCarrier *)v16 setType:2];
        if (a6 >= 3) {
          unint64_t v21 = 3;
        }
        else {
          unint64_t v21 = a6;
        }
        [(STSCHAlternativeCarrier *)v16 setPowerState:v21];
        v22 = [(STSCHBluetoothAlternativeCarrier *)v16 _createCarrierConfigurationRecord];
        [(STSCHAlternativeCarrier *)v16 setCarrierRecord:v22];

        goto LABEL_10;
      }
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 52, v16, @"Invalid advertiseUUID: %@", v19, v20, (uint64_t)v14);
    }
    v23 = 0;
    goto LABEL_14;
  }
LABEL_10:
  v23 = v16;
LABEL_14:

  return v23;
}

- (STSCHBluetoothAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  objc_super v5 = [(STSCHAlternativeCarrier *)&v23 initWithNdefRecordBundle:v4];
  if (v5)
  {
    uint64_t v6 = [v4 configurationRecord];
    id v7 = [v6 payload];
    v8 = (unsigned __int8 *)[v7 bytes];

    objc_super v9 = [v4 configurationRecord];
    v10 = [v9 payload];
    uint64_t v11 = (uint64_t)[v10 length];

    if (v11 >= 2)
    {
      while (1)
      {
        id v14 = v8 + 2;
        uint64_t v15 = v11 - 2;
        uint64_t v16 = *v8 - 1;
        BOOL v17 = __OFSUB__(v11 - 2, v16);
        uint64_t v11 = v11 - 2 - v16;
        if (v11 < 0 != v17)
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 87, v5, @"Not enough room for TLV: %ld expected %d", v12, v13, v15);
          goto LABEL_20;
        }
        int v18 = v8[1];
        if (v18 == 7) {
          break;
        }
        if (v18 == 28)
        {
          if (*v8 == 2) {
            v5->_leRole = [(STSCHBluetoothAlternativeCarrier *)v5 roleFromSpec:*v14];
          }
          else {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 102, v5, @"Invalid role length : %d", v12, v13, *v8 - 1);
          }
          goto LABEL_17;
        }
        if (v18 == 27)
        {
          if (*v8 != 8)
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 95, v5, @"Invalid address length : %d", v12, v13, *v8 - 1);
            goto LABEL_17;
          }
          uint64_t v19 = +[NSData dataWithBytes:v8 + 2 length:7];
          uint64_t v20 = 40;
LABEL_11:
          unint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;
        }
LABEL_17:
        v8 = &v14[v16];
        if (v11 <= 1) {
          goto LABEL_20;
        }
      }
      if (*v8 != 17)
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 108, v5, @"Invalid advertise UUID length: %d", v12, v13, *v8 - 1);
        goto LABEL_17;
      }
      uint64_t v19 = +[NSData dataWithBytes:v8 + 2 length:16];
      uint64_t v20 = 48;
      goto LABEL_11;
    }
  }
LABEL_20:

  return v5;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 configurationRecord];
  unsigned int v6 = [v5 isBluetoothLEConfigurationRecord];

  if (v6) {
    id v7 = [objc_alloc((Class)a1) initWithNdefRecordBundle:v4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (NSData)humanReadableLEAddress
{
  leAddr = self->_leAddr;
  if (leAddr)
  {
    leAddr = objc_msgSend(leAddr, "STS_reverseBytes");
  }

  return (NSData *)leAddr;
}

- (NSData)humanReadableAdvertiseUUID
{
  advertiseUUID = self->_advertiseUUID;
  if (advertiseUUID)
  {
    advertiseUUID = objc_msgSend(advertiseUUID, "STS_reverseBytes");
  }

  return (NSData *)advertiseUUID;
}

- (unsigned)specRole
{
  unint64_t leRole = self->_leRole;
  if (leRole >= 4) {
    LOBYTE(leRole) = 1;
  }
  return leRole;
}

- (unint64_t)roleFromSpec:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    return 4;
  }
  else {
    return a3;
  }
}

- (id)roleString
{
  unint64_t v2 = self->_leRole - 1;
  if (v2 > 3) {
    return @"Peripheral";
  }
  else {
    return off_100054980[v2];
  }
}

- (id)_createCarrierConfigurationRecord
{
  v3 = +[NSData dataWithBytes:"application/vnd.bluetooth.le.oob" length:32];
  id v4 = [@"0" dataUsingEncoding:4];
  memset(v18, 0, sizeof(v18));
  unint64_t leRole = self->_leRole;
  unsigned int v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"BTOOBDataExtras"];

  BOOL v9 = (leRole == 4 || leRole == 1) && v7 == 0;
  if (v9 || (id)[(NSData *)self->_leAddr length] != (id)7)
  {
    unsigned int v12 = 0;
  }
  else
  {
    LOWORD(v18[0]) = 6920;
    v10 = [(NSData *)self->_leAddr bytes];
    int v11 = *(_DWORD *)((char *)v10 + 3);
    *(_DWORD *)((char *)v18 + 2) = *v10;
    *(_DWORD *)((char *)v18 + 5) = v11;
    unsigned int v12 = 9;
  }
  BOOL v13 = leRole == 1 || leRole == 4;
  if (!v13 && (id)[(NSData *)self->_advertiseUUID length] == (id)16)
  {
    *(_WORD *)((unint64_t)v18 | v12) = 1809;
    *(_OWORD *)((unint64_t)v18 | v12 | 2) = *(_OWORD *)[(NSData *)self->_advertiseUUID bytes];
    v12 |= 0x12u;
  }
  id v14 = (char *)v18 + v12;
  *(_WORD *)id v14 = 7170;
  v14[2] = [(STSCHBluetoothAlternativeCarrier *)self specRole];
  uint64_t v15 = +[NSData dataWithBytes:v18 length:v12 + 3];
  uint64_t v16 = [[STSNDEFRecord alloc] initWithFormat:2 type:v3 identifier:v4 payload:v15];

  return v16;
}

- (id)description
{
  unint64_t v3 = [(STSCHAlternativeCarrier *)self powerState];
  id v4 = [(STSCHBluetoothAlternativeCarrier *)self roleString];
  leAddr = self->_leAddr;
  advertiseUUID = self->_advertiseUUID;
  unsigned int v7 = [(STSCHAlternativeCarrier *)self auxiliaryRecords];
  v8 = +[NSString stringWithFormat:@"{ type=ble,powerState=%lu,role=%@,leAddr=%@,advertiseUUID=%@,aux=%@ }", v3, v4, leAddr, advertiseUUID, v7];

  return v8;
}

- (NSData)leAddr
{
  return self->_leAddr;
}

- (void)setLeAddr:(id)a3
{
}

- (NSData)advertiseUUID
{
  return self->_advertiseUUID;
}

- (void)setAdvertiseUUID:(id)a3
{
}

- (void)setHumanReadableAdvertiseUUID:(id)a3
{
}

- (unint64_t)leRole
{
  return self->_leRole;
}

- (void)setLeRole:(unint64_t)a3
{
  self->_unint64_t leRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableAdvertiseUUID, 0);
  objc_storeStrong((id *)&self->_advertiseUUID, 0);

  objc_storeStrong((id *)&self->_leAddr, 0);
}

@end