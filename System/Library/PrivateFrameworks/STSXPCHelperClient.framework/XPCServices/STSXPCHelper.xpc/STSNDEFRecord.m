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
  v19.receiver = self;
  v19.super_class = (Class)STSNDEFRecord;
  v13 = [(STSNDEFRecord *)&v19 init];
  v14 = v13;
  if (v13)
  {
    [(STSNDEFRecord *)v13 setTypeNameFormat:v8];
    id v15 = [v10 copy];
    [(STSNDEFRecord *)v14 setType:v15];

    id v16 = [v11 copy];
    [(STSNDEFRecord *)v14 setIdentifier:v16];

    id v17 = [v12 copy];
    [(STSNDEFRecord *)v14 setPayload:v17];
  }
  return v14;
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
  v6 = (NSData *)a3;
  if (v6)
  {
    [(STSNDEFRecord *)self _setIdLengthPresent:1];
    v4 = v6;
  }
  else
  {
    [(STSNDEFRecord *)self _setIdLengthPresent:0];
  }
  identifier = self->_identifier;
  self->_identifier = v6;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
  id v5 = a3;
  NSUInteger v6 = [(NSData *)self->_payload length];

  [(STSNDEFRecord *)self setShortRecord:v6 < 0x100];
}

+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unint64_t *)a8
{
  uint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSMutableArray array];
  if ((unint64_t)[v14 length] > 0xFF
    || (id v17 = [v13 length], v12 > 7)
    || (unint64_t)v17 >= 0x100)
  {
    if (a8)
    {
      id v21 = 0;
      unint64_t v22 = 5;
LABEL_8:
      *a8 = v22;
      goto LABEL_37;
    }
LABEL_36:
    id v21 = 0;
    goto LABEL_37;
  }
  if ((unint64_t)[v15 length] < a7)
  {
    sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, @"ChunkSize=%lu, RecordCount=%lu", v18, v19, v20, a7);
    goto LABEL_13;
  }
  unsigned int v40 = v12;
  unint64_t v23 = (unint64_t)[v15 length] / a7;
  if ((unint64_t)[v15 length] % a7) {
    ++v23;
  }
  sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, @"ChunkSize=%lu, RecordCount=%lu", v24, v25, v26, a7);
  unint64_t v41 = v23;
  if (!v23) {
    goto LABEL_18;
  }
  uint64_t v12 = v40;
  if (v41 != 1)
  {
    unint64_t v30 = 0;
    uint64_t v31 = 0;
    while (1)
    {
      v32 = objc_opt_new();
      if (!v32) {
        goto LABEL_34;
      }
      v33 = v32;
      if (!v31) {
        break;
      }
      if (v41 - 1 != v31)
      {
        [v32 setTypeNameFormat:6];
        unint64_t v35 = v30;
LABEL_31:
        unint64_t v36 = a7;
        goto LABEL_32;
      }
      [v32 setChunked:1];
      [v33 setTypeNameFormat:6];
      id v34 = [v15 length];
      unint64_t v35 = (v41 - 1) * a7;
      unint64_t v36 = (unint64_t)v34 - v35;
LABEL_32:
      v38 = objc_msgSend(v15, "subdataWithRange:", v35, v36);
      [v33 setPayload:v38];

      [v16 addObject:v33];
      ++v31;
      v30 += a7;
      if (v41 == v31) {
        goto LABEL_18;
      }
    }
    [v32 setChunked:1];
    [v33 setTypeNameFormat:v40];
    [v33 setType:v13];
    if ([v14 length]) {
      id v37 = v14;
    }
    else {
      id v37 = 0;
    }
    [v33 setIdentifier:v37];
    unint64_t v35 = 0;
    goto LABEL_31;
  }
LABEL_13:
  v27 = objc_opt_new();
  if (!v27)
  {
LABEL_34:
    if (a8)
    {
      id v21 = 0;
      unint64_t v22 = 6;
      goto LABEL_8;
    }
    goto LABEL_36;
  }
  v28 = v27;
  objc_msgSend(v27, "setShortRecord:", (unint64_t)objc_msgSend(v15, "length") < 0x100);
  [v28 setTypeNameFormat:v12];
  [v28 setType:v13];
  if ([v14 length]) {
    id v29 = v14;
  }
  else {
    id v29 = 0;
  }
  [v28 setIdentifier:v29];
  [v28 setPayload:v15];
  [v16 addObject:v28];

LABEL_18:
  if (a8) {
    *a8 = 0;
  }
  id v21 = v16;
LABEL_37:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (STSNDEFRecord *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NSUInteger v6 = v5;
    BOOL v13 = 0;
    if (((v6->_firstOctet ^ self->_firstOctet) & 7) == 0)
    {
      id v7 = [(NSData *)self->_identifier length];
      if (v7 == (id)[(NSData *)v6->_identifier length])
      {
        identifier = self->_identifier;
        if (!identifier || [(NSData *)identifier isEqualToData:v6->_identifier])
        {
          id v9 = [(NSData *)self->_type length];
          if (v9 == (id)[(NSData *)v6->_type length])
          {
            type = self->_type;
            if (!type || [(NSData *)type isEqualToData:v6->_type])
            {
              id v11 = [(NSData *)self->_payload length];
              if (v11 == (id)[(NSData *)v6->_payload length])
              {
                payload = self->_payload;
                if (!payload || [(NSData *)payload isEqualToData:v6->_payload]) {
                  BOOL v13 = 1;
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
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  if (self->_type)
  {
    id v3 = [objc_alloc((Class)NSString) initWithData:self->_type encoding:4];
    if (!v3)
    {
      id v3 = +[NSString stringWithFormat:@"%@", self->_type];
    }
  }
  else
  {
    id v3 = 0;
  }
  if (self->_identifier)
  {
    id v4 = [objc_alloc((Class)NSString) initWithData:self->_identifier encoding:4];
    if (!v4)
    {
      id v4 = +[NSString stringWithFormat:@"%@", self->_identifier];
    }
  }
  else
  {
    id v4 = 0;
  }
  unsigned int v11 = [(STSNDEFRecord *)self messageBegin];
  unsigned int v5 = [(STSNDEFRecord *)self messageEnd];
  unsigned int v6 = [(STSNDEFRecord *)self chunked];
  unsigned int v7 = [(STSNDEFRecord *)self shortRecord];
  uint64_t v8 = [(STSNDEFRecord *)self identifier];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"{MB=%d,ME=%d,CF=%d,SR=%d,IL=%ld,TNF=%d,TypeLength=%ld,Type=%@,ID=%@,PayloadLength=%ld,Payload=%@}", v11, v5, v6, v7, [v8 length], -[STSNDEFRecord typeNameFormat](self, "typeNameFormat"), -[NSData length](self->_type, "length"), v3, v4, -[NSData length](self->_payload, "length"), self->_payload);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInteger:self->_firstOctet forKey:@"firstOctet"];
  type = self->_type;
  if (type) {
    [v8 encodeObject:type forKey:@"type"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v8 encodeObject:identifier forKey:@"identifier"];
  }
  payload = self->_payload;
  unsigned int v7 = v8;
  if (payload)
  {
    [v8 encodeObject:payload forKey:@"payload"];
    unsigned int v7 = v8;
  }
}

- (STSNDEFRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSNDEFRecord;
  unsigned int v5 = [(STSNDEFRecord *)&v13 init];
  if (v5)
  {
    v5->_firstOctet = [v4 decodeIntegerForKey:@"firstOctet"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ndefRecordsWithData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (+[STSNDEFRecord _parseNDEFData:v3 outRecords:v4])
  {
    id v8 = [v4 copy];
  }
  else
  {
    sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord ndefRecordsWithData:]", 290, @"Invalid NDEF data: %@", v5, v6, v7, (uint64_t)v3);
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)_parseNDEFData:(id)a3 outRecords:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NSInputStream inputStreamWithData:a3];
  [v6 open];
  if ([v6 hasBytesAvailable])
  {
    while (1)
    {
      __int16 v29 = 0;
      unsigned int v28 = 0;
      unsigned __int8 v27 = 0;
      if ([v6 read:(char *)&v29 + 1 maxLength:1] != (id)1) {
        break;
      }
      char v7 = HIBYTE(v29);
      if ([v6 read:&v27 maxLength:1] != (id)1) {
        break;
      }
      if ((v7 & 0x10) != 0)
      {
        unsigned __int8 v26 = 0;
        if ([v6 read:&v26 maxLength:1] != (id)1) {
          goto LABEL_30;
        }
        unsigned int v8 = v26;
      }
      else
      {
        if ([v6 read:&v28 maxLength:4] != (id)4) {
          break;
        }
        unsigned int v8 = bswap32(v28);
      }
      unsigned int v28 = v8;
      if ((v7 & 8) != 0 && [v6 read:&v29 maxLength:1] != (id)1) {
        break;
      }
      if (v27)
      {
        +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
        id v9 = objc_claimAutoreleasedReturnValue();
        id v10 = [v9 mutableBytes];
        id v11 = [v6 read:v10 maxLength:v27];
        if (v11 != (id)v27) {
          goto LABEL_27;
        }
      }
      else
      {
        id v9 = 0;
      }
      if ((_BYTE)v29)
      {
        +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
        id v12 = objc_claimAutoreleasedReturnValue();
        id v13 = [v12 mutableBytes];
        id v14 = [v6 read:v13 maxLength:v29];
        if (v14 != (id)v29) {
          goto LABEL_28;
        }
      }
      else
      {
        id v12 = 0;
      }
      if (v28)
      {
        +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
        id v15 = objc_claimAutoreleasedReturnValue();
        id v16 = [v15 mutableBytes];
        unint64_t v17 = (unint64_t)[v6 read:v16 maxLength:v28];
        if ((v17 & 0x8000000000000000) != 0 || v17 != v28) {
          goto LABEL_29;
        }
      }
      else
      {
        id v15 = 0;
      }
      uint64_t v18 = objc_opt_new();
      *(unsigned char *)(v18 + 8) = HIBYTE(v29);
      uint64_t v19 = *(void **)(v18 + 24);
      *(void *)(v18 + 24) = v9;
      id v20 = v9;

      id v21 = *(void **)(v18 + 16);
      *(void *)(v18 + 16) = v12;
      id v22 = v12;

      unint64_t v23 = *(void **)(v18 + 32);
      *(void *)(v18 + 32) = v15;

      [v5 addObject:v18];
      if (([v6 hasBytesAvailable] & 1) == 0) {
        goto LABEL_25;
      }
    }
    id v9 = 0;
LABEL_27:
    id v12 = 0;
LABEL_28:
    id v15 = 0;
LABEL_29:

LABEL_30:
    BOOL v24 = 0;
  }
  else
  {
LABEL_25:
    [v6 close];
    BOOL v24 = 1;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isWiFiAwareConfigurationRecord
{
  id v3 = +[NSData dataWithBytes:"application/vnd.wfa.nanapplication/vnd.bluetooth.le.oob" length:23];
  if ([(STSNDEFRecord *)self typeNameFormat] == 2)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isBluetoothLEConfigurationRecord
{
  id v3 = +[NSData dataWithBytes:"application/vnd.bluetooth.le.oob" length:32];
  if ([(STSNDEFRecord *)self typeNameFormat] == 2)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isNfcConfigurationRecord
{
  id v3 = +[NSData dataWithBytes:"iso.org:18013:nfc" length:17];
  id v4 = [@"nfc" dataUsingEncoding:4];
  if ([(STSNDEFRecord *)self typeNameFormat] == 4)
  {
    unsigned __int8 v5 = [(STSNDEFRecord *)self type];
    if ([v5 isEqualToData:v3])
    {
      uint64_t v6 = [(STSNDEFRecord *)self identifier];
      unsigned __int8 v7 = [v6 isEqualToData:v4];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isHandoverRequestRecord
{
  id v3 = +[NSData dataWithBytes:"Hr" length:2];
  if ([(STSNDEFRecord *)self typeNameFormat] == 1)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isHandoverSelectRecord
{
  id v3 = +[NSData dataWithBytes:"Hs" length:2];
  if ([(STSNDEFRecord *)self typeNameFormat] == 1)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isCollisionResolutionRecord
{
  id v3 = +[NSData dataWithBytes:"cr" length:2];
  if ([(STSNDEFRecord *)self typeNameFormat] == 1)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isAlternativeCarrierRecord
{
  id v3 = +[NSData dataWithBytes:"ac" length:2];
  if ([(STSNDEFRecord *)self typeNameFormat] == 1)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isHandoverSelectErrorRecord
{
  id v3 = +[NSData dataWithBytes:"err" length:3];
  if ([(STSNDEFRecord *)self typeNameFormat] == 1)
  {
    id v4 = [(STSNDEFRecord *)self type];
    unsigned __int8 v5 = [v4 isEqualToData:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isISO18013DeviceEngagementRecord
{
  id v3 = +[NSData dataWithBytes:"mdoc" length:4];
  id v4 = +[NSData dataWithBytes:"iso.org:18013:deviceengagement" length:30];
  if ([(STSNDEFRecord *)self typeNameFormat] == 4)
  {
    unsigned __int8 v5 = [(STSNDEFRecord *)self type];
    if ([v5 isEqualToData:v4])
    {
      uint64_t v6 = [(STSNDEFRecord *)self identifier];
      unsigned __int8 v7 = [v6 isEqualToData:v3];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isISO18013ReaderEngagementRecord
{
  id v3 = +[NSData dataWithBytes:"mdocreader" length:10];
  id v4 = +[NSData dataWithBytes:"iso.org:18013:readerengagement" length:30];
  if ([(STSNDEFRecord *)self typeNameFormat] == 4)
  {
    unsigned __int8 v5 = [(STSNDEFRecord *)self type];
    if ([v5 isEqualToData:v4])
    {
      uint64_t v6 = [(STSNDEFRecord *)self identifier];
      unsigned __int8 v7 = [v6 isEqualToData:v3];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)getCarrierPowerStateFromAlternativeCarrierRecord
{
  if (![(STSNDEFRecord *)self isAlternativeCarrierRecord]) {
    return 3;
  }
  id v3 = [(STSNDEFRecord *)self payload];
  id v4 = [v3 length];

  if (!v4) {
    return 3;
  }
  id v5 = [(STSNDEFRecord *)self payload];
  uint64_t v6 = [v5 bytes];

  return *v6 & 3;
}

- (id)getCarrierDataReferenceFromAlternativeCarrierRecord
{
  if (![(STSNDEFRecord *)self isAlternativeCarrierRecord]) {
    goto LABEL_5;
  }
  id v3 = [(STSNDEFRecord *)self payload];
  id v4 = [v3 length];

  if ((unint64_t)v4 < 2) {
    goto LABEL_5;
  }
  id v5 = [(STSNDEFRecord *)self payload];
  uint64_t v6 = (char *)[v5 bytes];

  unint64_t v7 = v6[1];
  unsigned int v8 = [(STSNDEFRecord *)self payload];
  id v9 = [v8 length];

  if ((unint64_t)v9 < v7)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getCarrierDataReferenceFromAlternativeCarrierRecord]", 92, self, @"Invalid length", v10, v11, v14);
LABEL_5:
    id v12 = 0;
    goto LABEL_6;
  }
  id v12 = +[NSData dataWithBytes:v6 + 2 length:v7];
LABEL_6:

  return v12;
}

- (id)getAuxiliaryDataReferencesFromAlternativeCarrierRecord
{
  id v3 = +[NSMutableArray array];
  if (![(STSNDEFRecord *)self isAlternativeCarrierRecord])
  {
    id v15 = 0;
    goto LABEL_9;
  }
  id v4 = [(STSNDEFRecord *)self payload];
  id v5 = (char *)[v4 length];

  id v6 = [(STSNDEFRecord *)self payload];
  unint64_t v7 = (unsigned __int8 *)[v6 bytes];

  if (v5 == (char *)1)
  {
    uint64_t v14 = 111;
  }
  else
  {
    unsigned int v12 = v7[1];
    uint64_t v11 = (char *)(v7 + 1);
    uint64_t v10 = v12;
    uint64_t v13 = v12 + 1;
    if (v5 - 1 != (char *)v13)
    {
      unsigned int v17 = v11[v13];
      uint64_t v18 = (uint64_t)&v5[-v10 - 3];
      if (v11[v13]) {
        BOOL v19 = &v5[-v10] == (char *)3;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        id v20 = (unsigned __int8 *)&v11[v13 + 1];
        unsigned int v21 = 1;
        do
        {
          unsigned int v24 = *v20;
          id v22 = v20 + 1;
          uint64_t v23 = v24;
          BOOL v25 = v18 - 1 >= (unint64_t)v24;
          uint64_t v18 = v18 - 1 - v24;
          if (v25)
          {
            unsigned __int8 v26 = +[NSData dataWithBytes:v22 length:v23];
            [v3 addObject:v26];
          }
          else
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", 137, self, @"Invalid length", v8, v9, v27);
          }
          if (v21 >= v17) {
            break;
          }
          id v20 = &v22[v23];
          ++v21;
        }
        while (v18);
      }
      goto LABEL_8;
    }
    uint64_t v14 = 120;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", v14, self, @"Invalid length", v8, v9, v27);
LABEL_8:
  id v15 = v3;
LABEL_9:

  return v15;
}

@end