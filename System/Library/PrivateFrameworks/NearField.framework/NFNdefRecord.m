@interface NFNdefRecord
+ (BOOL)supportsSecureCoding;
+ (id)emptyRecord;
+ (id)recordWithTelephone:(id)a3;
+ (id)recordWithText:(id)a3 lang:(id)a4;
+ (id)recordWithURI:(id)a3;
+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4;
- (BOOL)_idLengthPresent;
- (BOOL)chunked;
- (BOOL)isURIRecord;
- (BOOL)messageBegin;
- (BOOL)messageEnd;
- (BOOL)shortRecord;
- (NFNdefRecord)init;
- (NFNdefRecord)initWithBytes:(const void *)a3 length:(unsigned int)a4;
- (NFNdefRecord)initWithCoder:(id)a3;
- (NFNdefRecord)initWithNDEFRecord:(id)a3;
- (NSData)identifier;
- (NSData)payload;
- (NSData)type;
- (NSString)description;
- (id)asData;
- (id)decode;
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

@implementation NFNdefRecord

+ (id)emptyRecord
{
  v2 = objc_opt_new();
  [v2 setTypeNameFormat:0];
  [v2 setShortRecord:1];
  [v2 setIdentifier:0];
  return v2;
}

+ (id)recordWithText:(id)a3 lang:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTypeNameFormat:1];
  v8 = [@"T" dataUsingEncoding:4];
  [v7 setType:v8];

  v9 = objc_opt_new();
  char v13 = [v5 length];
  [v9 appendBytes:&v13 length:1];
  v10 = [v5 dataUsingEncoding:1];

  [v9 appendData:v10];
  v11 = [v6 dataUsingEncoding:4];

  [v9 appendData:v11];
  [v7 setPayload:v9];

  return v7;
}

+ (id)recordWithURI:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  char v11 = 0;
  if ([v3 hasPrefix:@"https://www."])
  {
    char v11 = 2;
    id v5 = @"https://www.";
  }
  else if ([v3 hasPrefix:@"http://www."])
  {
    char v11 = 1;
    id v5 = @"http://www.";
  }
  else if ([v3 hasPrefix:@"https://"])
  {
    char v11 = 4;
    id v5 = @"https://";
  }
  else if ([v3 hasPrefix:@"http://"])
  {
    char v11 = 3;
    id v5 = @"http://";
  }
  else if ([v3 hasPrefix:@"tel:"])
  {
    char v11 = 5;
    id v5 = @"tel:";
  }
  else
  {
    if (![v3 hasPrefix:@"mailto:"]) {
      goto LABEL_14;
    }
    char v11 = 6;
    id v5 = @"mailto:";
  }
  uint64_t v6 = objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v5, "length"));

  id v3 = (id)v6;
LABEL_14:
  [v4 setTypeNameFormat:1];
  v7 = [@"U" dataUsingEncoding:4];
  [v4 setType:v7];

  v8 = objc_opt_new();
  [v8 appendBytes:&v11 length:1];
  v9 = [v3 dataUsingEncoding:4];
  [v8 appendData:v9];

  [v4 setPayload:v8];
  return v4;
}

+ (id)recordWithTelephone:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setTypeNameFormat:1];
  id v5 = [@"U" dataUsingEncoding:4];
  [v4 setType:v5];

  uint64_t v6 = objc_opt_new();
  char v9 = 5;
  [v6 appendBytes:&v9 length:1];
  v7 = [v3 dataUsingEncoding:4];

  [v6 appendData:v7];
  [v4 setPayload:v6];

  return v4;
}

+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4
{
  v4 = [MEMORY[0x1E4FBA868] recordsFromBytes:a3 length:*(void *)&a4];
  id v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__NFNdefRecord_recordsFromBytes_length___block_invoke;
  v8[3] = &unk_1E595E548;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __40__NFNdefRecord_recordsFromBytes_length___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[NFNdefRecord alloc] initWithNDEFRecord:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (NFNdefRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFNdefRecord;
  result = [(NFNdefRecord *)&v3 init];
  if (result) {
    result->_firstOctet = 0;
  }
  return result;
}

- (NFNdefRecord)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  v18.receiver = self;
  v18.super_class = (Class)NFNdefRecord;
  v4 = [(NFNdefRecord *)&v18 init];
  id v5 = v4;
  if (v4)
  {
    v4->_firstOctet = 0;
    NFDataCreateWithBytesNoCopy();
    id v16 = 0;
    id v17 = 0;
    id v15 = 0;
    [MEMORY[0x1E4FBA868] parseRecordUsingScanner:NFDataScannerCreateWithData() header:&v5->_firstOctet type:&v17 identifier:&v16 payload:&v15];
    id v6 = (NSData *)v17;
    v7 = (NSData *)v16;
    v8 = (NSData *)v15;
    type = v5->_type;
    v5->_type = v6;
    v10 = v6;

    identifier = v5->_identifier;
    v5->_identifier = v7;
    v12 = v7;

    payload = v5->_payload;
    v5->_payload = v8;

    NFDataRelease();
    NFDataScannerRelease();
  }
  return v5;
}

- (NFNdefRecord)initWithNDEFRecord:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecord;
  id v5 = [(NFNdefRecord *)&v13 init];
  if (v5)
  {
    v5->_firstOctet = [v4 header];
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    uint64_t v8 = [v4 type];
    type = v5->_type;
    v5->_type = (NSData *)v8;

    uint64_t v10 = [v4 payload];
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;
  }
  return v5;
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

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    [(NFNdefRecord *)self _setIdLengthPresent:1];
    id v4 = (NSData *)v6;
  }
  else
  {
    [(NFNdefRecord *)self _setIdLengthPresent:0];
    id v4 = 0;
  }
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_payload, a3);
  [(NFNdefRecord *)self setShortRecord:[(NSData *)self->_payload length] < 0x100];
}

- (BOOL)isURIRecord
{
  if ([(NFNdefRecord *)self typeNameFormat] == 1)
  {
    id v3 = [NSString alloc];
    id v4 = [(NFNdefRecord *)self type];
    uint64_t v5 = [v4 bytes];
    uint64_t v6 = [(NFNdefRecord *)self type];
    v7 = objc_msgSend(v3, "initWithBytes:length:encoding:", v5, objc_msgSend((id)v6, "length"), 4);

    LOBYTE(v6) = [v7 isEqualToString:@"U"];
    if (v6) {
      return 1;
    }
  }
  else if ([(NFNdefRecord *)self typeNameFormat] == 3)
  {
    return 1;
  }
  return 0;
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

- (NSString)description
{
  id v27 = [NSString alloc];
  v29.receiver = self;
  v29.super_class = (Class)NFNdefRecord;
  char v3 = [(NFNdefRecord *)&v29 description];
  BOOL v26 = [(NFNdefRecord *)self messageBegin];
  BOOL v25 = [(NFNdefRecord *)self messageEnd];
  BOOL v24 = [(NFNdefRecord *)self chunked];
  BOOL v23 = [(NFNdefRecord *)self shortRecord];
  v28 = [(NFNdefRecord *)self identifier];
  uint64_t v21 = [v28 length];
  uint64_t v20 = [(NFNdefRecord *)self typeNameFormat];
  id v4 = [(NFNdefRecord *)self type];
  if (v4)
  {
    objc_super v18 = [(NFNdefRecord *)self type];
    uint64_t v19 = [v18 length];
  }
  else
  {
    uint64_t v19 = 0;
  }
  v22 = [(NFNdefRecord *)self type];
  if (v22)
  {
    uint64_t v5 = [(NFNdefRecord *)self type];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  uint64_t v6 = (void *)v5;
  v7 = [(NFNdefRecord *)self identifier];
  if (v7)
  {
    uint64_t v8 = [(NFNdefRecord *)self identifier];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  id v9 = (void *)v8;
  uint64_t v10 = [(NFNdefRecord *)self payload];
  if (v10)
  {
    id v17 = [(NFNdefRecord *)self payload];
    uint64_t v11 = [v17 length];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [(NFNdefRecord *)self payload];
  if (v12)
  {
    uint64_t v13 = [(NFNdefRecord *)self payload];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  id v15 = (void *)[v27 initWithFormat:@"%@ { MB=%d ME=%d CF=%d SR=%d IL=%d TNF=%d Type Length=%d Type=%@ ID=%@ Payload Length=%d Payload=%@ }", v3, v26, v25, v24, v23, v21, v20, v19, v6, v9, v11, v13];

  if (v10) {
  if (v4)
  }

  return (NSString *)v15;
}

- (id)asData
{
  return (id)[MEMORY[0x1E4FBA868] dataFromRecord:self];
}

- (id)decode
{
  return (id)[MEMORY[0x1E4FBA868] decodeFromRecord:self];
}

- (NFNdefRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecord;
  uint64_t v5 = [(NFNdefRecord *)&v13 init];
  if (v5)
  {
    v5->_firstOctet = [v4 decodeInt32ForKey:@"firstOctet"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInt32:self->_firstOctet forKey:@"firstOctet"];
  type = self->_type;
  if (type) {
    [v8 encodeObject:type forKey:@"type"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v8 encodeObject:identifier forKey:@"id"];
  }
  payload = self->_payload;
  v7 = v8;
  if (payload)
  {
    [v8 encodeObject:payload forKey:@"payload"];
    v7 = v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end