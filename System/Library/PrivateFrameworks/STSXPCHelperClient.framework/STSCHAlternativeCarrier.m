@interface STSCHAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)auxiliaryRecords;
- (STSCHAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (STSNDEFRecord)carrierRecord;
- (id)_createCarrierConfigurationRecord;
- (id)createAlternativeCarrierRecord;
- (id)createNdefRecordBundle;
- (id)description;
- (unint64_t)powerState;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAuxiliaryRecords:(id)a3;
- (void)setCarrierRecord:(id)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation STSCHAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v9 = a3;
  objc_msgSend_encodeInteger_forKey_(v9, v5, type, @"type");
  objc_msgSend_encodeInteger_forKey_(v9, v6, self->_powerState, @"powerState");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_carrierRecord, @"carrierRecord");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_auxiliaryRecords, @"auxiliaryRecords");
}

- (STSCHAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)STSCHAlternativeCarrier;
  v6 = [(STSCHAlternativeCarrier *)&v21 init];
  if (v6)
  {
    v6->_unint64_t type = objc_msgSend_decodeIntegerForKey_(v4, v5, @"type");
    v6->_powerState = objc_msgSend_decodeIntegerForKey_(v4, v7, @"powerState");
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"carrierRecord");
    carrierRecord = v6->_carrierRecord;
    v6->_carrierRecord = (STSNDEFRecord *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v16 = objc_msgSend_setWithObjects_(v12, v15, v13, v14, 0);
    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, @"auxiliaryRecords");
    auxiliaryRecords = v6->_auxiliaryRecords;
    v6->_auxiliaryRecords = (NSArray *)v18;
  }
  return v6;
}

- (STSCHAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STSCHAlternativeCarrier;
  v7 = [(STSCHAlternativeCarrier *)&v35 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_configurationRecord(v4, v5, v6);
    int isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v8, v9, v10);

    if (isWiFiAwareConfigurationRecord)
    {
      uint64_t v14 = 1;
    }
    else
    {
      v15 = objc_msgSend_configurationRecord(v4, v12, v13);
      int isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v15, v16, v17);

      if (isBluetoothLEConfigurationRecord)
      {
        uint64_t v14 = 2;
      }
      else
      {
        v19 = objc_msgSend_configurationRecord(v4, v12, v13);
        int isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v19, v20, v21);

        if (!isNfcConfigurationRecord)
        {
          v7->_unint64_t type = 0;
          goto LABEL_9;
        }
        uint64_t v14 = 3;
      }
    }
    v7->_unint64_t type = v14;
LABEL_9:
    v23 = objc_msgSend_alternativeRecord(v4, v12, v13);
    v7->_powerState = objc_msgSend_getCarrierPowerStateFromAlternativeCarrierRecord(v23, v24, v25);

    uint64_t v28 = objc_msgSend_configurationRecord(v4, v26, v27);
    carrierRecord = v7->_carrierRecord;
    v7->_carrierRecord = (STSNDEFRecord *)v28;

    uint64_t v32 = objc_msgSend_auxiliaryRecords(v4, v30, v31);
    auxiliaryRecords = v7->_auxiliaryRecords;
    v7->_auxiliaryRecords = (NSArray *)v32;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSCHAlternativeCarrier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v16 = 0;
    if (objc_msgSend_isEqual_(self->_carrierRecord, v7, (uint64_t)v6->_carrierRecord))
    {
      uint64_t v10 = objc_msgSend_count(self->_auxiliaryRecords, v8, v9);
      if (v10 == objc_msgSend_count(v6->_auxiliaryRecords, v11, v12)
        && (!objc_msgSend_count(self->_auxiliaryRecords, v13, v14)
         || objc_msgSend_isEqualToArray_(self->_auxiliaryRecords, v15, (uint64_t)v6->_auxiliaryRecords)))
      {
        BOOL v16 = 1;
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"type=%lu,powerState=%lu,carrier=%@,aux=%@", self->_type, self->_powerState, self->_carrierRecord, self->_auxiliaryRecords);
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSCHAlternativeCarrier connectionHandoverAlternativeCarrierWithBundle:]", 87, @"Must override by subclass", v3, v4, v5, vars0);
  return 0;
}

- (id)createAlternativeCarrierRecord
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_identifier(self->_carrierRecord, a2, v2);
  uint64_t v9 = v4;
  if (!v4)
  {
    v11 = @"Missing carrier data reference";
    uint64_t v12 = 99;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) >= 0x100)
  {
    v11 = @"Invalid carrier reference length";
    uint64_t v12 = 102;
LABEL_5:
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHAlternativeCarrier createAlternativeCarrierRecord]", v12, self, v11, v7, v8, v46);
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  v47 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)"ac", 2);
  char v53 = self->_powerState & 3;
  v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF990], v14, (uint64_t)&v53, 1);
  char v53 = objc_msgSend_length(v9, v16, v17);
  objc_msgSend_appendBytes_length_(v15, v18, (uint64_t)&v53, 1);
  objc_msgSend_appendData_(v15, v19, (uint64_t)v9);
  char v52 = 0;
  v22 = objc_msgSend_data(MEMORY[0x263EFF990], v20, v21);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v23 = self->_auxiliaryRecords;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v48, v54, 16);
  if (v25)
  {
    uint64_t v28 = v25;
    int v29 = 0;
    uint64_t v30 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v23);
        }
        uint64_t v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v33 = objc_msgSend_identifier(v32, v26, v27);
        char v53 = objc_msgSend_length(v33, v34, v35);

        objc_msgSend_appendBytes_length_(v22, v36, (uint64_t)&v53, 1);
        v39 = objc_msgSend_identifier(v32, v37, v38);
        objc_msgSend_appendData_(v22, v40, (uint64_t)v39);

        char v52 = ++v29;
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v48, v54, 16);
    }
    while (v28);
  }

  objc_msgSend_appendBytes_length_(v15, v41, (uint64_t)&v52, 1);
  objc_msgSend_appendData_(v15, v42, (uint64_t)v22);
  v43 = [STSNDEFRecord alloc];
  uint64_t v13 = objc_msgSend_initWithFormat_type_identifier_payload_(v43, v44, 1, v47, 0, v15);

LABEL_14:

  return v13;
}

- (id)_createCarrierConfigurationRecord
{
  return self->_carrierRecord;
}

- (id)createNdefRecordBundle
{
  uint64_t v3 = [STSCHNdefRecordBundle alloc];
  uint64_t v6 = objc_msgSend_createAlternativeCarrierRecord(self, v4, v5);
  uint64_t v9 = objc_msgSend__createCarrierConfigurationRecord(self, v7, v8);
  v11 = objc_msgSend_initWithAlternativeRecord_configurationRecord_auxiliaryRecords_errorRecord_(v3, v10, (uint64_t)v6, v9, self->_auxiliaryRecords, 0);

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (STSNDEFRecord)carrierRecord
{
  return self->_carrierRecord;
}

- (void)setCarrierRecord:(id)a3
{
}

- (NSArray)auxiliaryRecords
{
  return self->_auxiliaryRecords;
}

- (void)setAuxiliaryRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);

  objc_storeStrong((id *)&self->_carrierRecord, 0);
}

@end