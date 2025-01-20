@interface STSCHNfcAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (STSCHNfcAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHNfcAlternativeCarrier)initWithMaxLcField:(int64_t)a3 maxLeField:(int64_t)a4 auxiliaryRecords:(id)a5;
- (STSCHNfcAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (id)_createCarrierConfigurationRecord;
- (id)description;
- (int64_t)maxLc;
- (int64_t)maxLe;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLc:(int64_t)a3;
- (void)setMaxLe:(int64_t)a3;
@end

@implementation STSCHNfcAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STSCHNfcAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_maxLc, @"maxLc", v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_maxLe, @"maxLe");
}

- (STSCHNfcAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSCHNfcAlternativeCarrier;
  v6 = [(STSCHAlternativeCarrier *)&v9 initWithCoder:v4];
  if (v6)
  {
    v6->_maxLc = objc_msgSend_decodeIntegerForKey_(v4, v5, @"maxLc");
    v6->_maxLe = objc_msgSend_decodeIntegerForKey_(v4, v7, @"maxLe");
  }

  return v6;
}

- (STSCHNfcAlternativeCarrier)initWithMaxLcField:(int64_t)a3 maxLeField:(int64_t)a4 auxiliaryRecords:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STSCHNfcAlternativeCarrier;
  objc_super v9 = [(STSCHNfcAlternativeCarrier *)&v21 init];
  v11 = v9;
  if (v9)
  {
    int64_t v12 = 4096;
    if (a3 >= 1) {
      int64_t v13 = a3;
    }
    else {
      int64_t v13 = 4096;
    }
    v9->_maxLc = v13;
    if (a4 >= 1) {
      int64_t v12 = a4;
    }
    v9->_maxLe = v12;
    objc_msgSend_setType_(v9, v10, 3);
    objc_msgSend_setPowerState_(v11, v14, 1);
    objc_msgSend_setAuxiliaryRecords_(v11, v15, (uint64_t)v8);
    v18 = objc_msgSend__createCarrierConfigurationRecord(v11, v16, v17);
    objc_msgSend_setCarrierRecord_(v11, v19, (uint64_t)v18);
  }
  return v11;
}

- (STSCHNfcAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)STSCHNfcAlternativeCarrier;
  objc_super v7 = [(STSCHAlternativeCarrier *)&v44 initWithNdefRecordBundle:v4];
  if (!v7) {
    goto LABEL_19;
  }
  id v8 = objc_msgSend_configurationRecord(v4, v5, v6);
  objc_msgSend_payload(v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  v14 = (unsigned char *)objc_msgSend_bytes(v11, v12, v13);

  uint64_t v17 = objc_msgSend_configurationRecord(v4, v15, v16);
  v20 = objc_msgSend_payload(v17, v18, v19);
  uint64_t v23 = objc_msgSend_length(v20, v21, v22);

  v7->_maxLc = -1;
  v7->_maxLe = -1;
  if (v23 <= 0)
  {
    v40 = @"Invalid payload length";
    uint64_t v41 = 67;
    goto LABEL_23;
  }
  if (*v14 != 1)
  {
    v40 = @"Invalid version";
    uint64_t v41 = 72;
    goto LABEL_23;
  }
  if ((unint64_t)v23 < 2)
  {
LABEL_19:
    v39 = v7;
    goto LABEL_24;
  }
  uint64_t v26 = v23 - 1;
  v27 = v14 + 1;
  v28 = v14 + 1;
  while (1)
  {
    unsigned int v30 = *v28;
    v28 += 2;
    uint64_t v29 = v30;
    uint64_t v31 = v26 - 2;
    uint64_t v32 = v26 - 2 - v30;
    if (v26 - 2 < v30) {
      break;
    }
    uint64_t v33 = v27[1];
    if (v33 == 2)
    {
      v7->_maxLe = 0;
      if (v29)
      {
        unint64_t v37 = 0;
        unsigned __int8 v35 = v29 - 1;
        do
        {
          v7->_maxLe = v37 << 8;
          unsigned __int8 v38 = *v28++;
          v7->_maxLe = v38 | (v37 << 8);
          LODWORD(v29) = v29 - 1;
          unint64_t v37 = v38 | (v37 << 8);
        }
        while ((_BYTE)v29);
        goto LABEL_16;
      }
    }
    else
    {
      if (v33 != 1)
      {
        sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", 101, v7, @"Unrecognized tag: 0x%X", v24, v25, v33);
        v28 += v29;
        uint64_t v31 = v32;
        goto LABEL_18;
      }
      v7->_maxLc = 0;
      if (v29)
      {
        unint64_t v34 = 0;
        unsigned __int8 v35 = v29 - 1;
        do
        {
          v7->_maxLc = v34 << 8;
          unsigned __int8 v36 = *v28++;
          v7->_maxLc = v36 | (v34 << 8);
          LODWORD(v29) = v29 - 1;
          unint64_t v34 = v36 | (v34 << 8);
        }
        while ((_BYTE)v29);
LABEL_16:
        uint64_t v31 = v26 - v35 - 3;
      }
    }
LABEL_18:
    uint64_t v26 = v31;
    v27 = v28;
    if (v31 <= 0) {
      goto LABEL_19;
    }
  }
  v40 = @"Invalid tag length";
  uint64_t v41 = 86;
LABEL_23:
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", v41, v7, v40, v24, v25, v43);
  v39 = 0;
LABEL_24:

  return v39;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_configurationRecord(v4, v5, v6);
  int isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v7, v8, v9);

  if (isNfcConfigurationRecord)
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

- (id)_createCarrierConfigurationRecord
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)&unk_2146D43C9, 17);
  v5 = objc_msgSend_dataUsingEncoding_(@"nfc", v4, 4);
  __int16 v20 = 769;
  char v21 = 1;
  char v22 = (unsigned __int16)objc_msgSend_maxLc(self, v6, v7) >> 8;
  char v23 = objc_msgSend_maxLc(self, v8, v9);
  __int16 v24 = 515;
  char v25 = (unsigned __int16)objc_msgSend_maxLe(self, v10, v11) >> 8;
  char v26 = objc_msgSend_maxLe(self, v12, v13);
  v14 = [STSNDEFRecord alloc];
  uint64_t v16 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v15, (uint64_t)&v20, 9);
  v18 = objc_msgSend_initWithFormat_type_identifier_payload_(v14, v17, 4, v3, v5, v16);

  return v18;
}

- (id)description
{
  id v4 = NSString;
  uint64_t v5 = objc_msgSend_powerState(self, a2, v2);
  uint64_t v8 = objc_msgSend_maxLc(self, v6, v7);
  uint64_t v11 = objc_msgSend_maxLe(self, v9, v10);
  v14 = objc_msgSend_auxiliaryRecords(self, v12, v13);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v4, v15, @"{ type=nfc,powerState=%lu,maxLc=%ld,maxLe=%ld,aux=%@ }", v5, v8, v11, v14);

  return v16;
}

- (int64_t)maxLc
{
  return self->_maxLc;
}

- (void)setMaxLc:(int64_t)a3
{
  self->_maxLc = a3;
}

- (int64_t)maxLe
{
  return self->_maxLe;
}

- (void)setMaxLe:(int64_t)a3
{
  self->_maxLe = a3;
}

@end