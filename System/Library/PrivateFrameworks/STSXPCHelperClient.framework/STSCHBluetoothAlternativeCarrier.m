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
  v7.receiver = self;
  v7.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_leAddr, @"leAddr", v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_leRole, @"leRole");
}

- (STSCHBluetoothAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v5 = [(STSCHAlternativeCarrier *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"leAddr");
    leAddr = v5->_leAddr;
    v5->_leAddr = (NSData *)v8;

    v5->_leRole = objc_msgSend_decodeIntegerForKey_(v4, v10, @"leRole");
  }

  return v5;
}

- (STSCHBluetoothAlternativeCarrier)initWithAddress:(id)a3 advertiseUUID:(id)a4 role:(unint64_t)a5 powerState:(unint64_t)a6 auxiliaryRecords:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v18 = [(STSCHBluetoothAlternativeCarrier *)&v32 init];
  if (v18)
  {
    if (v13 && objc_msgSend_length(v13, v16, v17) != 7)
    {
      sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 47, v18, @"Invalid leAddr: %@", v19, v20, (uint64_t)v13);
    }
    else
    {
      if (!v14 || objc_msgSend_length(v14, v16, v17) == 16)
      {
        objc_storeStrong((id *)&v18->_leAddr, a3);
        objc_storeStrong((id *)&v18->_advertiseUUID, a4);
        v18->_leRole = a5;
        objc_msgSend_setAuxiliaryRecords_(v18, v23, (uint64_t)v15);
        objc_msgSend_setType_(v18, v24, 2);
        if (a6 >= 3) {
          objc_msgSend_setPowerState_(v18, v25, 3);
        }
        else {
          objc_msgSend_setPowerState_(v18, v25, a6);
        }
        v28 = objc_msgSend__createCarrierConfigurationRecord(v18, v26, v27);
        objc_msgSend_setCarrierRecord_(v18, v29, (uint64_t)v28);

        goto LABEL_10;
      }
      sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 52, v18, @"Invalid advertiseUUID: %@", v21, v22, (uint64_t)v14);
    }
    v30 = 0;
    goto LABEL_14;
  }
LABEL_10:
  v30 = v18;
LABEL_14:

  return v30;
}

- (STSCHBluetoothAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  objc_super v7 = [(STSCHAlternativeCarrier *)&v36 initWithNdefRecordBundle:v4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_configurationRecord(v4, v5, v6);
    objc_msgSend_payload(v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    id v14 = (unsigned __int8 *)objc_msgSend_bytes(v11, v12, v13);

    uint64_t v17 = objc_msgSend_configurationRecord(v4, v15, v16);
    uint64_t v20 = objc_msgSend_payload(v17, v18, v19);
    uint64_t v23 = objc_msgSend_length(v20, v21, v22);

    if (v23 >= 2)
    {
      while (1)
      {
        uint64_t v27 = v14 + 2;
        uint64_t v28 = v23 - 2;
        uint64_t v29 = *v14 - 1;
        BOOL v30 = __OFSUB__(v23 - 2, v29);
        uint64_t v23 = v23 - 2 - v29;
        if (v23 < 0 != v30)
        {
          sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 87, v7, @"Not enough room for TLV: %ld expected %d", v25, v26, v28);
          goto LABEL_20;
        }
        int v31 = v14[1];
        if (v31 == 7) {
          break;
        }
        if (v31 == 28)
        {
          if (*v14 == 2) {
            v7->_leRole = objc_msgSend_roleFromSpec_(v7, v24, *v27);
          }
          else {
            sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 102, v7, @"Invalid role length : %d", v25, v26, *v14 - 1);
          }
          goto LABEL_17;
        }
        if (v31 == 27)
        {
          if (*v14 != 8)
          {
            sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 95, v7, @"Invalid address length : %d", v25, v26, *v14 - 1);
            goto LABEL_17;
          }
          uint64_t v32 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v24, (uint64_t)(v14 + 2), 7);
          uint64_t v33 = 40;
LABEL_11:
          v34 = *(Class *)((char *)&v7->super.super.isa + v33);
          *(Class *)((char *)&v7->super.super.isa + v33) = (Class)v32;
        }
LABEL_17:
        id v14 = &v27[v29];
        if (v23 <= 1) {
          goto LABEL_20;
        }
      }
      if (*v14 != 17)
      {
        sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 108, v7, @"Invalid advertise UUID length: %d", v25, v26, *v14 - 1);
        goto LABEL_17;
      }
      uint64_t v32 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v24, (uint64_t)(v14 + 2), 16);
      uint64_t v33 = 48;
      goto LABEL_11;
    }
  }
LABEL_20:

  return v7;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_configurationRecord(v4, v5, v6);
  int isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v7, v8, v9);

  if (isBluetoothLEConfigurationRecord)
  {
    id v11 = objc_alloc((Class)a1);
    uint64_t v13 = objc_msgSend_initWithNdefRecordBundle_(v11, v12, (uint64_t)v4);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (NSData)humanReadableLEAddress
{
  leAddr = self->_leAddr;
  if (leAddr)
  {
    leAddr = objc_msgSend_STS_reverseBytes(leAddr, a2, v2);
  }

  return (NSData *)leAddr;
}

- (NSData)humanReadableAdvertiseUUID
{
  advertiseUUID = self->_advertiseUUID;
  if (advertiseUUID)
  {
    advertiseUUID = objc_msgSend_STS_reverseBytes(advertiseUUID, a2, v2);
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
    return off_2642178E0[v2];
  }
}

- (id)_createCarrierConfigurationRecord
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"application/vnd.bluetooth.le.oob", 32);
  v5 = objc_msgSend_dataUsingEncoding_(@"0", v4, 4);
  memset(v28, 0, sizeof(v28));
  unint64_t leRole = self->_leRole;
  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v7, v8, 0, 0, 0, 0);
  int v11 = objc_msgSend_BOOLForKey_(v9, v10, @"BTOOBDataExtras");

  BOOL v15 = (leRole == 4 || leRole == 1) && v11 == 0;
  if (v15 || objc_msgSend_length(self->_leAddr, v12, v13) != 7)
  {
    unsigned int v18 = 0;
  }
  else
  {
    LOWORD(v28[0]) = 6920;
    uint64_t v16 = (_DWORD *)objc_msgSend_bytes(self->_leAddr, v12, v13, *(void *)&v28[0]);
    int v17 = *(_DWORD *)((char *)v16 + 3);
    *(_DWORD *)((char *)v28 + 2) = *v16;
    *(_DWORD *)((char *)v28 + 5) = v17;
    unsigned int v18 = 9;
  }
  if (leRole != 1 && leRole != 4)
  {
    uint64_t v27 = objc_msgSend_length(self->_advertiseUUID, v12, v13);
    if (v27 == 16)
    {
      *(_WORD *)((unint64_t)v28 | v18) = 1809;
      *(_OWORD *)((unint64_t)v28 | v18 | 2) = *(_OWORD *)objc_msgSend_bytes(self->_advertiseUUID, v12, v13);
      v18 |= 0x12u;
    }
  }
  uint64_t v20 = (char *)v28 + v18;
  *(_WORD *)uint64_t v20 = 7170;
  v20[2] = objc_msgSend_specRole(self, v12, v13);
  uint64_t v22 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, (uint64_t)v28, v18 + 3);
  uint64_t v23 = [STSNDEFRecord alloc];
  uint64_t v25 = objc_msgSend_initWithFormat_type_identifier_payload_(v23, v24, 2, v3, v5, v22);

  return v25;
}

- (id)description
{
  id v4 = NSString;
  uint64_t v5 = objc_msgSend_powerState(self, a2, v2);
  uint64_t v8 = objc_msgSend_roleString(self, v6, v7);
  leAddr = self->_leAddr;
  advertiseUUID = self->_advertiseUUID;
  uint64_t v13 = objc_msgSend_auxiliaryRecords(self, v11, v12);
  BOOL v15 = objc_msgSend_stringWithFormat_(v4, v14, @"{ type=ble,powerState=%lu,role=%@,leAddr=%@,advertiseUUID=%@,aux=%@ }", v5, v8, leAddr, advertiseUUID, v13);

  return v15;
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