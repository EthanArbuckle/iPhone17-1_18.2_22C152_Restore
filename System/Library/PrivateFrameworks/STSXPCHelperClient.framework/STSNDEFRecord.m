@interface STSNDEFRecord
+ (BOOL)_parseNDEFData:(id)a3 outRecords:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)ndefRecordsWithData:(id)a3;
+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unint64_t *)a8;
- (BOOL)_idLengthPresent;
- (BOOL)chunked;
- (BOOL)isAlternativeCarrierRecord;
- (BOOL)isBluetoothLEConfigurationRecord;
- (BOOL)isCollisionResolutionRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandoverRequestRecord;
- (BOOL)isHandoverSelectErrorRecord;
- (BOOL)isHandoverSelectRecord;
- (BOOL)isISO18013DeviceEngagementRecord;
- (BOOL)isISO18013ReaderEngagementRecord;
- (BOOL)isNfcConfigurationRecord;
- (BOOL)isWiFiAwareConfigurationRecord;
- (BOOL)messageBegin;
- (BOOL)messageEnd;
- (BOOL)shortRecord;
- (NSData)identifier;
- (NSData)payload;
- (NSData)type;
- (STSNDEFRecord)initWithCoder:(id)a3;
- (STSNDEFRecord)initWithFormat:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6;
- (id)description;
- (id)getAuxiliaryDataReferencesFromAlternativeCarrierRecord;
- (id)getCarrierDataReferenceFromAlternativeCarrierRecord;
- (unint64_t)getCarrierPowerStateFromAlternativeCarrierRecord;
- (unsigned)header;
- (unsigned)typeNameFormat;
- (void)_setIdLengthPresent:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChunked:(BOOL)a3;
- (void)setHeader:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageBegin:(BOOL)a3;
- (void)setMessageEnd:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setShortRecord:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setTypeNameFormat:(unsigned __int8)a3;
@end

@implementation STSNDEFRecord

- (STSNDEFRecord)initWithFormat:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)STSNDEFRecord;
  v13 = [(STSNDEFRecord *)&v29 init];
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setTypeNameFormat_(v13, v14, v8);
    v18 = objc_msgSend_copy(v10, v16, v17);
    objc_msgSend_setType_(v15, v19, (uint64_t)v18);

    v22 = objc_msgSend_copy(v11, v20, v21);
    objc_msgSend_setIdentifier_(v15, v23, (uint64_t)v22);

    v26 = objc_msgSend_copy(v12, v24, v25);
    objc_msgSend_setPayload_(v15, v27, (uint64_t)v26);
  }
  return v15;
}

- (unsigned)header
{
  return self->_firstOctet;
}

- (void)setHeader:(unsigned __int8)a3
{
  self->_firstOctet = a3;
}

- (BOOL)messageBegin
{
  return self->_firstOctet >> 7;
}

- (void)setMessageBegin:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  self->_firstOctet = v3 & 0x80 | self->_firstOctet & 0x7F;
}

- (BOOL)messageEnd
{
  return (self->_firstOctet >> 6) & 1;
}

- (void)setMessageEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  self->_firstOctet = self->_firstOctet & 0xBF | v3;
}

- (BOOL)chunked
{
  return (self->_firstOctet >> 5) & 1;
}

- (void)setChunked:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  self->_firstOctet = self->_firstOctet & 0xDF | v3;
}

- (BOOL)shortRecord
{
  return (self->_firstOctet >> 4) & 1;
}

- (void)setShortRecord:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  self->_firstOctet = self->_firstOctet & 0xEF | v3;
}

- (unsigned)typeNameFormat
{
  return self->_firstOctet & 7;
}

- (void)setTypeNameFormat:(unsigned __int8)a3
{
  self->_firstOctet = self->_firstOctet & 0xF8 | a3 & 7;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)_idLengthPresent
{
  return (self->_firstOctet >> 3) & 1;
}

- (void)_setIdLengthPresent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  self->_firstOctet = self->_firstOctet & 0xF7 | v3;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  v7 = (NSData *)a3;
  if (v7)
  {
    objc_msgSend__setIdLengthPresent_(self, v4, 1);
    v5 = v7;
  }
  else
  {
    objc_msgSend__setIdLengthPresent_(self, v4, 0);
  }
  identifier = self->_identifier;
  self->_identifier = v7;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
  id v5 = a3;
  unint64_t v8 = objc_msgSend_length(self->_payload, v6, v7);

  objc_msgSend_setShortRecord_(self, v9, v8 < 0x100);
}

+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unint64_t *)a8
{
  uint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v18 = objc_msgSend_array(MEMORY[0x263EFF980], v16, v17);
  if ((unint64_t)objc_msgSend_length(v14, v19, v20) > 0xFF
    || (unint64_t v23 = objc_msgSend_length(v13, v21, v22), v12 > 7)
    || v23 >= 0x100)
  {
    if (a8)
    {
      id v31 = 0;
      unint64_t v32 = 5;
LABEL_8:
      *a8 = v32;
      goto LABEL_36;
    }
LABEL_35:
    id v31 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend_length(v15, v24, v25) >= a7)
  {
    unsigned int v73 = v12;
    unint64_t v33 = objc_msgSend_length(v15, v26, v27) / a7;
    if (objc_msgSend_length(v15, v34, v35) % a7) {
      ++v33;
    }
    sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, @"ChunkSize=%lu, RecordCount=%lu", v36, v37, v38, a7);
    unint64_t v74 = v33;
    if (!v33) {
      goto LABEL_18;
    }
    uint64_t v12 = v73;
    if (v74 != 1)
    {
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      while (1)
      {
        v54 = objc_opt_new();
        if (!v54) {
          break;
        }
        v56 = v54;
        if (v53)
        {
          if (v74 - 1 == v53)
          {
            objc_msgSend_setChunked_(v54, v55, 1);
            objc_msgSend_setTypeNameFormat_(v56, v57, 6);
            uint64_t v60 = objc_msgSend_length(v15, v58, v59);
            objc_msgSend_subdataWithRange_(v15, v61, (v74 - 1) * a7, v60 - (v74 - 1) * a7);
          }
          else
          {
            objc_msgSend_setTypeNameFormat_(v54, v55, 6);
            objc_msgSend_subdataWithRange_(v15, v68, v52, a7);
          }
        }
        else
        {
          objc_msgSend_setChunked_(v54, v55, 1);
          objc_msgSend_setTypeNameFormat_(v56, v62, v73);
          objc_msgSend_setType_(v56, v63, (uint64_t)v13);
          if (objc_msgSend_length(v14, v64, v65)) {
            objc_msgSend_setIdentifier_(v56, v66, (uint64_t)v14);
          }
          else {
            objc_msgSend_setIdentifier_(v56, v66, 0);
          }
          objc_msgSend_subdataWithRange_(v15, v67, 0, a7);
        v69 = };
        objc_msgSend_setPayload_(v56, v70, (uint64_t)v69);

        objc_msgSend_addObject_(v18, v71, (uint64_t)v56);
        ++v53;
        v52 += a7;
        if (v74 == v53) {
          goto LABEL_18;
        }
      }
LABEL_33:
      if (a8)
      {
        id v31 = 0;
        unint64_t v32 = 6;
        goto LABEL_8;
      }
      goto LABEL_35;
    }
  }
  else
  {
    sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, @"ChunkSize=%lu, RecordCount=%lu", v28, v29, v30, a7);
  }
  uint64_t v39 = objc_opt_new();
  if (!v39) {
    goto LABEL_33;
  }
  v42 = (void *)v39;
  BOOL v43 = (unint64_t)objc_msgSend_length(v15, v40, v41) < 0x100;
  objc_msgSend_setShortRecord_(v42, v44, v43);
  objc_msgSend_setTypeNameFormat_(v42, v45, v12);
  objc_msgSend_setType_(v42, v46, (uint64_t)v13);
  if (objc_msgSend_length(v14, v47, v48)) {
    objc_msgSend_setIdentifier_(v42, v49, (uint64_t)v14);
  }
  else {
    objc_msgSend_setIdentifier_(v42, v49, 0);
  }
  objc_msgSend_setPayload_(v42, v50, (uint64_t)v15);
  objc_msgSend_addObject_(v18, v51, (uint64_t)v42);

LABEL_18:
  if (a8) {
    *a8 = 0;
  }
  id v31 = v18;
LABEL_36:

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (STSNDEFRecord *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v26 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v8 = v5;
    BOOL v26 = 0;
    if (((v8->_firstOctet ^ self->_firstOctet) & 7) == 0)
    {
      uint64_t v9 = objc_msgSend_length(self->_identifier, v6, v7);
      if (v9 == objc_msgSend_length(v8->_identifier, v10, v11))
      {
        identifier = self->_identifier;
        if (!identifier || objc_msgSend_isEqualToData_(identifier, v12, (uint64_t)v8->_identifier))
        {
          uint64_t v15 = objc_msgSend_length(self->_type, v12, v13);
          if (v15 == objc_msgSend_length(v8->_type, v16, v17))
          {
            type = self->_type;
            if (!type || objc_msgSend_isEqualToData_(type, v18, (uint64_t)v8->_type))
            {
              uint64_t v21 = objc_msgSend_length(self->_payload, v18, v19);
              if (v21 == objc_msgSend_length(v8->_payload, v22, v23))
              {
                payload = self->_payload;
                if (!payload || objc_msgSend_isEqualToData_(payload, v24, (uint64_t)v8->_payload)) {
                  BOOL v26 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (id)description
{
  if (self->_type)
  {
    id v4 = [NSString alloc];
    v6 = objc_msgSend_initWithData_encoding_(v4, v5, (uint64_t)self->_type, 4);
    if (!v6)
    {
      v6 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@", self->_type);
    }
  }
  else
  {
    v6 = 0;
  }
  if (self->_identifier)
  {
    id v7 = [NSString alloc];
    uint64_t v9 = objc_msgSend_initWithData_encoding_(v7, v8, (uint64_t)self->_identifier, 4);
    if (!v9)
    {
      uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@", self->_identifier);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v38 = NSString;
  unsigned int v37 = objc_msgSend_messageBegin(self, a2, v2);
  unsigned int v12 = objc_msgSend_messageEnd(self, v10, v11);
  unsigned int v15 = objc_msgSend_chunked(self, v13, v14);
  unsigned int v18 = objc_msgSend_shortRecord(self, v16, v17);
  uint64_t v21 = objc_msgSend_identifier(self, v19, v20);
  uint64_t v24 = objc_msgSend_length(v21, v22, v23);
  unsigned int v27 = objc_msgSend_typeNameFormat(self, v25, v26);
  uint64_t v30 = objc_msgSend_length(self->_type, v28, v29);
  uint64_t v33 = objc_msgSend_length(self->_payload, v31, v32);
  uint64_t v35 = objc_msgSend_stringWithFormat_(v38, v34, @"{MB=%d,ME=%d,CF=%d,SR=%d,IL=%ld,TNF=%d,TypeLength=%ld,Type=%@,ID=%@,PayloadLength=%ld,Payload=%@}", v37, v12, v15, v18, v24, v27, v30, v6, v9, v33, self->_payload);

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend_encodeInteger_forKey_(v10, v4, self->_firstOctet, @"firstOctet");
  type = self->_type;
  if (type) {
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)type, @"type");
  }
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)identifier, @"identifier");
  }
  payload = self->_payload;
  uint64_t v9 = v10;
  if (payload)
  {
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)payload, @"payload");
    uint64_t v9 = v10;
  }
}

- (STSNDEFRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STSNDEFRecord;
  v6 = [(STSNDEFRecord *)&v20 init];
  if (v6)
  {
    v6->_firstOctet = objc_msgSend_decodeIntegerForKey_(v4, v5, @"firstOctet");
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"type");
    type = v6->_type;
    v6->_type = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"identifier");
    identifier = v6->_identifier;
    v6->_identifier = (NSData *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"payload");
    payload = v6->_payload;
    v6->_payload = (NSData *)v17;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ndefRecordsWithData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (objc_msgSend__parseNDEFData_outRecords_(STSNDEFRecord, v5, (uint64_t)v3, v4))
  {
    uint64_t v11 = objc_msgSend_copy(v4, v6, v7);
  }
  else
  {
    sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord ndefRecordsWithData:]", 290, @"Invalid NDEF data: %@", v8, v9, v10, (uint64_t)v3);
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)_parseNDEFData:(id)a3 outRecords:(id)a4
{
  id v5 = a4;
  uint64_t v7 = objc_msgSend_inputStreamWithData_(MEMORY[0x263EFF950], v6, (uint64_t)a3);
  objc_msgSend_open(v7, v8, v9);
  if (objc_msgSend_hasBytesAvailable(v7, v10, v11))
  {
    while (1)
    {
      __int16 v51 = 0;
      unsigned int v50 = 0;
      unsigned __int8 v49 = 0;
      if (objc_msgSend_read_maxLength_(v7, v12, (uint64_t)&v51 + 1, 1) != 1) {
        break;
      }
      char v15 = HIBYTE(v51);
      if (objc_msgSend_read_maxLength_(v7, v14, (uint64_t)&v49, 1) != 1) {
        break;
      }
      if ((v15 & 0x10) != 0)
      {
        unsigned __int8 v48 = 0;
        if (objc_msgSend_read_maxLength_(v7, v16, (uint64_t)&v48, 1) != 1) {
          goto LABEL_30;
        }
        unsigned int v18 = v48;
      }
      else
      {
        if (objc_msgSend_read_maxLength_(v7, v16, (uint64_t)&v50, 4) != 4) {
          break;
        }
        unsigned int v18 = bswap32(v50);
      }
      unsigned int v50 = v18;
      if ((v15 & 8) != 0 && objc_msgSend_read_maxLength_(v7, v17, (uint64_t)&v51, 1) != 1) {
        break;
      }
      if (v49)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v17, v49);
        id v19 = objc_claimAutoreleasedReturnValue();
        uint64_t v22 = objc_msgSend_mutableBytes(v19, v20, v21);
        uint64_t maxLength = objc_msgSend_read_maxLength_(v7, v23, v22, v49);
        if (maxLength != v49) {
          goto LABEL_27;
        }
      }
      else
      {
        id v19 = 0;
      }
      if ((_BYTE)v51)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v17, v51);
        id v25 = objc_claimAutoreleasedReturnValue();
        uint64_t v28 = objc_msgSend_mutableBytes(v25, v26, v27);
        uint64_t v30 = objc_msgSend_read_maxLength_(v7, v29, v28, v51);
        if (v30 != v51) {
          goto LABEL_28;
        }
      }
      else
      {
        id v25 = 0;
      }
      if (v50)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v17, v50);
        id v31 = objc_claimAutoreleasedReturnValue();
        uint64_t v34 = objc_msgSend_mutableBytes(v31, v32, v33);
        uint64_t v36 = objc_msgSend_read_maxLength_(v7, v35, v34, v50);
        if (v36 < 0 || v36 != v50) {
          goto LABEL_29;
        }
      }
      else
      {
        id v31 = 0;
      }
      uint64_t v37 = objc_opt_new();
      *(unsigned char *)(v37 + 8) = HIBYTE(v51);
      uint64_t v38 = *(void **)(v37 + 24);
      *(void *)(v37 + 24) = v19;
      id v39 = v19;

      v40 = *(void **)(v37 + 16);
      *(void *)(v37 + 16) = v25;
      id v41 = v25;

      v42 = *(void **)(v37 + 32);
      *(void *)(v37 + 32) = v31;

      objc_msgSend_addObject_(v5, v43, v37);
      if ((objc_msgSend_hasBytesAvailable(v7, v44, v45) & 1) == 0) {
        goto LABEL_25;
      }
    }
    id v19 = 0;
LABEL_27:
    id v25 = 0;
LABEL_28:
    id v31 = 0;
LABEL_29:

LABEL_30:
    BOOL v46 = 0;
  }
  else
  {
LABEL_25:
    objc_msgSend_close(v7, v12, v13);
    BOOL v46 = 1;
  }

  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isWiFiAwareConfigurationRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"application/vnd.wfa.nanapplication/vnd.bluetooth.le.oob", 23);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 2)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isBluetoothLEConfigurationRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"application/vnd.bluetooth.le.oob", 32);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 2)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isNfcConfigurationRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)&unk_2146D4398, 17);
  uint64_t v5 = objc_msgSend_dataUsingEncoding_(@"nfc", v4, 4);
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    uint64_t v10 = objc_msgSend_type(self, v8, v9);
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v3))
    {
      uint64_t v14 = objc_msgSend_identifier(self, v12, v13);
      char isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v5);
    }
    else
    {
      char isEqualToData = 0;
    }
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverRequestRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"Hr", 2);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverSelectRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"Hs", 2);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isCollisionResolutionRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"cr", 2);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isAlternativeCarrierRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"ac", 2);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverSelectErrorRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"err", 3);
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    uint64_t v8 = objc_msgSend_type(self, v6, v7);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isISO18013DeviceEngagementRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"mdoc", 4);
  uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)"iso.org:18013:deviceengagement", 30);
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    uint64_t v10 = objc_msgSend_type(self, v8, v9);
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v5))
    {
      uint64_t v14 = objc_msgSend_identifier(self, v12, v13);
      char isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v3);
    }
    else
    {
      char isEqualToData = 0;
    }
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isISO18013ReaderEngagementRecord
{
  id v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"mdocreader", 10);
  uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)"iso.org:18013:readerengagement", 30);
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    uint64_t v10 = objc_msgSend_type(self, v8, v9);
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v5))
    {
      uint64_t v14 = objc_msgSend_identifier(self, v12, v13);
      char isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v3);
    }
    else
    {
      char isEqualToData = 0;
    }
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)getCarrierPowerStateFromAlternativeCarrierRecord
{
  if (!objc_msgSend_isAlternativeCarrierRecord(self, a2, v2)) {
    return 3;
  }
  v6 = objc_msgSend_payload(self, v4, v5);
  uint64_t v9 = objc_msgSend_length(v6, v7, v8);

  if (!v9) {
    return 3;
  }
  objc_msgSend_payload(self, v10, v11);
  id v12 = objc_claimAutoreleasedReturnValue();
  char v15 = (unsigned char *)objc_msgSend_bytes(v12, v13, v14);

  return *v15 & 3;
}

- (id)getCarrierDataReferenceFromAlternativeCarrierRecord
{
  if (!objc_msgSend_isAlternativeCarrierRecord(self, a2, v2)) {
    goto LABEL_5;
  }
  v6 = objc_msgSend_payload(self, v4, v5);
  unint64_t v9 = objc_msgSend_length(v6, v7, v8);

  if (v9 < 2) {
    goto LABEL_5;
  }
  objc_msgSend_payload(self, v10, v11);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_bytes(v12, v13, v14);

  unint64_t v16 = *(char *)(v15 + 1);
  id v19 = objc_msgSend_payload(self, v17, v18);
  unint64_t v22 = objc_msgSend_length(v19, v20, v21);

  if (v22 < v16)
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getCarrierDataReferenceFromAlternativeCarrierRecord]", 92, self, @"Invalid length", v24, v25, v28);
LABEL_5:
    uint64_t v26 = 0;
    goto LABEL_6;
  }
  uint64_t v26 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v23, v15 + 2, v16);
LABEL_6:

  return v26;
}

- (id)getAuxiliaryDataReferencesFromAlternativeCarrierRecord
{
  id v4 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  if (!objc_msgSend_isAlternativeCarrierRecord(self, v5, v6))
  {
    id v27 = 0;
    goto LABEL_9;
  }
  unint64_t v9 = objc_msgSend_payload(self, v7, v8);
  uint64_t v12 = objc_msgSend_length(v9, v10, v11);

  objc_msgSend_payload(self, v13, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);

  if (v12 == 1)
  {
    uint64_t v26 = 111;
  }
  else
  {
    unsigned int v24 = *(unsigned __int8 *)(v18 + 1);
    uint64_t v23 = v18 + 1;
    uint64_t v22 = v24;
    uint64_t v25 = v24 + 1;
    if (v12 - 1 != v25)
    {
      unsigned int v29 = *(unsigned __int8 *)(v23 + v25);
      uint64_t v30 = v12 - v22 - 3;
      if (*(unsigned char *)(v23 + v25)) {
        BOOL v31 = v12 - v22 == 3;
      }
      else {
        BOOL v31 = 1;
      }
      if (!v31)
      {
        uint64_t v32 = (unsigned __int8 *)(v23 + v25 + 1);
        unsigned int v33 = 1;
        do
        {
          unsigned int v36 = *v32;
          uint64_t v34 = (uint64_t)(v32 + 1);
          uint64_t v35 = v36;
          BOOL v37 = v30 - 1 >= (unint64_t)v36;
          uint64_t v30 = v30 - 1 - v36;
          if (v37)
          {
            uint64_t v38 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v19, v34, v35);
            objc_msgSend_addObject_(v4, v39, (uint64_t)v38);
          }
          else
          {
            sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", 137, self, @"Invalid length", v20, v21, v40);
          }
          if (v33 >= v29) {
            break;
          }
          uint64_t v32 = (unsigned __int8 *)(v34 + v35);
          ++v33;
        }
        while (v30);
      }
      goto LABEL_8;
    }
    uint64_t v26 = 120;
  }
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", v26, self, @"Invalid length", v20, v21, v40);
LABEL_8:
  id v27 = v4;
LABEL_9:

  return v27;
}

@end