@interface NFNdefRecordInternal
+ (BOOL)parseRecordUsingScanner:(_NFDataScanner *)a3 header:(char *)a4 type:(id *)a5 identifier:(id *)a6 payload:(id *)a7;
+ (BOOL)supportsSecureCoding;
+ (id)_decodeTextRecord:(id)a3;
+ (id)_decodeTextRecordLanguage:(id)a3;
+ (id)_decodeTextRecordText:(id)a3;
+ (id)_decodeURIRecord:(id)a3;
+ (id)dataFromRecord:(id)a3;
+ (id)decodeFromRecord:(id)a3;
+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4;
+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unsigned int *)a8;
- (BOOL)_idLengthPresent;
- (BOOL)chunked;
- (BOOL)isURIRecord;
- (BOOL)messageBegin;
- (BOOL)messageEnd;
- (BOOL)shortRecord;
- (NFNdefRecordInternal)init;
- (NFNdefRecordInternal)initWithCoder:(id)a3;
- (NFNdefRecordInternal)initWithHeader:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6;
- (NFNdefRecordInternal)initWithNDEFRecord:(id)a3;
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

@implementation NFNdefRecordInternal

+ (BOOL)parseRecordUsingScanner:(_NFDataScanner *)a3 header:(char *)a4 type:(id *)a5 identifier:(id *)a6 payload:(id *)a7
{
  LOBYTE(Data) = 0;
  if (!a4) {
    return (char)Data;
  }
  if (!a5) {
    return (char)Data;
  }
  if (!a6) {
    return (char)Data;
  }
  if (!a7) {
    return (char)Data;
  }
  LOBYTE(Data) = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a4 = 0;
  unint64_t var1 = a3->var1;
  if (var1 + 1 > *((void *)a3->var0 + 1)) {
    return (char)Data;
  }
  uint64_t v13 = *(void *)a3->var0;
  a3->unint64_t var1 = var1 + 1;
  char v14 = *(unsigned char *)(v13 + var1);
  *a4 = v14;
  unint64_t v15 = a3->var1;
  unint64_t v16 = v15 + 1;
  unint64_t v17 = *((void *)a3->var0 + 1);
  if (v15 + 1 > v17) {
    goto LABEL_15;
  }
  uint64_t v18 = *(void *)a3->var0;
  a3->unint64_t var1 = v16;
  size_t v19 = *(unsigned __int8 *)(v18 + v15);
  if ((v14 & 0x10) == 0)
  {
    if (v15 + 5 <= v17)
    {
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      uint64_t v22 = v18 + v16;
      do
      {
        a3->unint64_t var1 = v15 + v20 + 2;
        unsigned int v21 = *(unsigned __int8 *)(v22 + v20++) | (v21 << 8);
      }
      while (v20 != 4);
      unint64_t v23 = v15 + 5;
      if ((v14 & 8) != 0) {
        goto LABEL_12;
      }
LABEL_18:
      unsigned int v24 = 0;
      goto LABEL_19;
    }
LABEL_15:
    LOBYTE(Data) = 0;
    return (char)Data;
  }
  unint64_t v23 = v15 + 2;
  if (v23 > v17) {
    goto LABEL_15;
  }
  a3->unint64_t var1 = v23;
  unsigned int v21 = *(unsigned __int8 *)(v18 + v16);
  if ((v14 & 8) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  if (v23 + 1 > v17) {
    goto LABEL_15;
  }
  a3->unint64_t var1 = v23 + 1;
  unsigned int v24 = *(unsigned __int8 *)(v18 + v23);
LABEL_19:
  if (v19)
  {
    Data = NFDataScannerReadData(a3, v19);
    if (!Data) {
      return (char)Data;
    }
    v25 = Data;
    *a5 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*Data length:Data[1]];
    NFDataRelease(v25);
  }
  if (v24)
  {
    Data = NFDataScannerReadData(a3, v24);
    if (!Data) {
      return (char)Data;
    }
    v26 = Data;
    *a6 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*Data length:Data[1]];
    NFDataRelease(v26);
  }
  if (v21)
  {
    Data = NFDataScannerReadData(a3, v21);
    if (!Data) {
      return (char)Data;
    }
    v27 = Data;
    *a7 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*Data length:Data[1]];
    NFDataRelease(v27);
  }
  LOBYTE(Data) = 1;
  return (char)Data;
}

+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4
{
  v6 = objc_opt_new();
  v7 = NFDataCreateWithBytesNoCopy((uint64_t)a3, a4, 0);
  v8 = NFDataScannerCreateWithData((uint64_t)v7);
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = *v8;
    if (*v8)
    {
      do
      {
        unint64_t v11 = *(void *)(v10 + 8);
        if (!v11 || v9[1] >= v11) {
          break;
        }
        unsigned __int8 v22 = 0;
        id v20 = 0;
        id v21 = 0;
        id v19 = 0;
        BOOL v12 = +[NFNdefRecordInternal parseRecordUsingScanner:v9 header:&v22 type:&v21 identifier:&v20 payload:&v19];
        id v13 = v21;
        id v14 = v20;
        id v15 = v19;
        if (v12)
        {
          unint64_t v16 = [NFNdefRecordInternal alloc];
          unint64_t v17 = [(NFNdefRecordInternal *)v16 initWithHeader:v22 type:v13 identifier:v14 payload:v15];
          [v6 addObject:v17];
        }
        uint64_t v10 = *v9;
      }
      while (*v9);
    }
  }
  NFDataScannerRelease((uint64_t)v9);
  NFDataRelease(v7);

  return v6;
}

+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unsigned int *)a8
{
  uint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = objc_opt_new();
  if ((unint64_t)[v14 length] > 0xFF
    || (unint64_t v17 = [v13 length], v12 > 7)
    || v17 >= 0x100)
  {
    if (a8)
    {
      id v23 = 0;
      unsigned int v24 = 10;
LABEL_20:
      *a8 = v24;
      goto LABEL_37;
    }
LABEL_36:
    id v23 = 0;
    goto LABEL_37;
  }
  if ([v15 length] >= a7)
  {
    unsigned int v37 = v12;
    unint64_t v18 = [v15 length] / a7;
    if ([v15 length] % a7) {
      unint64_t v19 = v18 + 1;
    }
    else {
      unint64_t v19 = v18;
    }
    unint64_t v38 = v19;
    if (!v19) {
      goto LABEL_15;
    }
    uint64_t v12 = v37;
    if (v19 != 1)
    {
      unint64_t v25 = 0;
      uint64_t v26 = 0;
      unint64_t v36 = v19 - 1;
      unint64_t v35 = (v19 - 1) * a7;
      while (1)
      {
        v27 = objc_opt_new();
        if (!v27) {
          goto LABEL_34;
        }
        v28 = v27;
        if (!v26) {
          break;
        }
        if (v36 != v26)
        {
          [v27 setTypeNameFormat:6];
          unint64_t v30 = v25;
LABEL_31:
          unint64_t v31 = a7;
          goto LABEL_32;
        }
        [v27 setChunked:1];
        [v28 setTypeNameFormat:6];
        uint64_t v29 = [v15 length];
        unint64_t v30 = v35;
        unint64_t v31 = v29 - v35;
LABEL_32:
        v33 = [v15 subdataWithRange:v30, v31, v35];
        [v28 setPayload:v33];

        [v16 addObject:v28];
        ++v26;
        v25 += a7;
        if (v38 == v26) {
          goto LABEL_15;
        }
      }
      [v27 setChunked:1];
      [v28 setTypeNameFormat:v37];
      [v28 setType:v13];
      if ([v14 length]) {
        id v32 = v14;
      }
      else {
        id v32 = 0;
      }
      [v28 setIdentifier:v32 v35];
      unint64_t v30 = 0;
      goto LABEL_31;
    }
  }
  id v20 = objc_opt_new();
  if (!v20)
  {
LABEL_34:
    if (a8)
    {
      id v23 = 0;
      unsigned int v24 = 34;
      goto LABEL_20;
    }
    goto LABEL_36;
  }
  id v21 = v20;
  [v20 setShortRecord:((unint64_t)[v15 length]) < 0x100];
  [v21 setTypeNameFormat:v12];
  [v21 setType:v13];
  if ([v14 length]) {
    id v22 = v14;
  }
  else {
    id v22 = 0;
  }
  [v21 setIdentifier:v22];
  [v21 setPayload:v15];
  [v16 addObject:v21];

LABEL_15:
  if (a8) {
    *a8 = 0;
  }
  id v23 = v16;
LABEL_37:

  return v23;
}

- (NFNdefRecordInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFNdefRecordInternal;
  result = [(NFNdefRecordInternal *)&v3 init];
  if (result) {
    result->_firstOctet = 0;
  }
  return result;
}

- (NFNdefRecordInternal)initWithNDEFRecord:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecordInternal;
  v5 = [(NFNdefRecordInternal *)&v13 init];
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

- (NFNdefRecordInternal)initWithHeader:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NFNdefRecordInternal;
  objc_super v13 = [(NFNdefRecordInternal *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    v13->_firstOctet = a3;
    [(NFNdefRecordInternal *)v13 setIdentifier:v11];
    [(NFNdefRecordInternal *)v14 setType:v10];
    [(NFNdefRecordInternal *)v14 setPayload:v12];
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
  uint64_t v6 = (NSData *)a3;
  if (v6)
  {
    [(NFNdefRecordInternal *)self _setIdLengthPresent:1];
    id v4 = v6;
  }
  else
  {
    [(NFNdefRecordInternal *)self _setIdLengthPresent:0];
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

  [(NFNdefRecordInternal *)self setShortRecord:v6 < 0x100];
}

- (NSString)description
{
  id v27 = [NSString alloc];
  v29.receiver = self;
  v29.super_class = (Class)NFNdefRecordInternal;
  char v3 = [(NFNdefRecordInternal *)&v29 description];
  BOOL v26 = [(NFNdefRecordInternal *)self messageBegin];
  BOOL v25 = [(NFNdefRecordInternal *)self messageEnd];
  BOOL v24 = [(NFNdefRecordInternal *)self chunked];
  BOOL v23 = [(NFNdefRecordInternal *)self shortRecord];
  v28 = [(NFNdefRecordInternal *)self identifier];
  uint64_t v21 = [v28 length];
  uint64_t v20 = [(NFNdefRecordInternal *)self typeNameFormat];
  id v4 = [(NFNdefRecordInternal *)self type];
  if (v4)
  {
    unint64_t v18 = [(NFNdefRecordInternal *)self type];
    uint64_t v19 = [v18 length];
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v22 = [(NFNdefRecordInternal *)self type];
  if (v22)
  {
    uint64_t v5 = [(NFNdefRecordInternal *)self type];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  NSUInteger v6 = (void *)v5;
  v7 = [(NFNdefRecordInternal *)self identifier];
  if (v7)
  {
    uint64_t v8 = [(NFNdefRecordInternal *)self identifier];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  id v10 = [(NFNdefRecordInternal *)self payload];
  if (v10)
  {
    unint64_t v17 = [(NFNdefRecordInternal *)self payload];
    uint64_t v11 = [v17 length];
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = [(NFNdefRecordInternal *)self payload];
  if (v12)
  {
    uint64_t v13 = [(NFNdefRecordInternal *)self payload];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  id v15 = (void *)[v27 initWithFormat:@"%@ { MB=%d ME=%d CF=%d SR=%d IL=%d TNF=%d Type Length=%d Type=%@ ID=%@ Payload Length=%d Payload=%@ }", v3, v26, v25, v24, v23, v21, v20, v19, v6, v9, v11, v13];

  if (v10) {
  if (v4)
  }

  return (NSString *)v15;
}

- (id)asData
{
  return +[NFNdefRecordInternal dataFromRecord:self];
}

- (id)decode
{
  return +[NFNdefRecordInternal decodeFromRecord:self];
}

- (BOOL)isURIRecord
{
  if ([(NFNdefRecordInternal *)self typeNameFormat] == 1)
  {
    id v3 = [NSString alloc];
    id v4 = [(NFNdefRecordInternal *)self type];
    uint64_t v5 = [v4 bytes];
    uint64_t v6 = [(NFNdefRecordInternal *)self type];
    v7 = [v3 initWithBytes:v5 length:[v6 length] encoding:4];

    LOBYTE(v6) = [v7 isEqualToString:@"U"];
    if (v6) {
      return 1;
    }
  }
  else if ([(NFNdefRecordInternal *)self typeNameFormat] == 3)
  {
    return 1;
  }
  return 0;
}

- (NFNdefRecordInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecordInternal;
  uint64_t v5 = [(NFNdefRecordInternal *)&v13 init];
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

+ (id)_decodeTextRecordLanguage:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned char *)[v5 bytes];
  uint64_t v7 = *v6 & 0x1F;
  if ((*v6 & 0x1F) == 0)
  {
    uint64_t v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      BOOL v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v23)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v27 = 45;
        if (isMetaClass) {
          uint64_t v27 = 43;
        }
        v23(4, "%c[%{public}s %{public}s]:%i Invalid language code length; dropping message",
          v27,
          ClassName,
          Name,
          431);
        uint64_t v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v28 = dispatch_get_specific(v21);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      unint64_t v17 = (id)_NFSharedLogClient[(void)v28];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      objc_super v29 = object_getClass(a1);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v36 = v30;
      __int16 v37 = 2082;
      unint64_t v38 = object_getClassName(a1);
      __int16 v39 = 2082;
      v40 = sel_getName(a2);
      __int16 v41 = 1024;
      int v42 = 431;
      uint64_t v20 = "%c[%{public}s %{public}s]:%i Invalid language code length; dropping message";
      goto LABEL_27;
    }
LABEL_33:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  id v8 = v6;
  if ([v5 length] < (unint64_t)(v7 + 1))
  {
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    uint64_t v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v10 < 4)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v10);
      if (v11)
      {
        id v12 = object_getClass(a1);
        BOOL v13 = class_isMetaClass(v12);
        id v14 = object_getClassName(a1);
        v33 = sel_getName(a2);
        uint64_t v15 = 45;
        if (v13) {
          uint64_t v15 = 43;
        }
        v11(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v15, v14, v33, 436);
        v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      objc_super v16 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      unint64_t v17 = (id)_NFSharedLogClient[(void)v16];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      unint64_t v18 = object_getClass(a1);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v36 = v19;
      __int16 v37 = 2082;
      unint64_t v38 = object_getClassName(a1);
      __int16 v39 = 2082;
      v40 = sel_getName(a2);
      __int16 v41 = 1024;
      int v42 = 436;
      uint64_t v20 = "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message";
LABEL_27:
      _os_log_impl(&dword_1CA51A000, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_28:

      unint64_t v31 = 0;
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  unint64_t v31 = (void *)[[NSString alloc] initWithBytes:v8 + 1 length:v7 encoding:1];
LABEL_30:

  return v31;
}

+ (id)_decodeTextRecordText:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (char *)[v5 bytes];
  char v7 = *v6;
  uint64_t v8 = (*v6 & 0x1F) + 1;
  if ((int)[v5 length] <= (int)v8)
  {
    objc_super v29 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      unint64_t v31 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v31)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v35 = 45;
        if (isMetaClass) {
          uint64_t v35 = 43;
        }
        v31(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v35, ClassName, Name, 455);
        objc_super v29 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      int v36 = dispatch_get_specific(v29);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      uint64_t v10 = (id)_NFSharedLogClient[(void)v36];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v37 = object_getClass(a1);
        if (class_isMetaClass(v37)) {
          int v38 = 43;
        }
        else {
          int v38 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v63 = v38;
        __int16 v64 = 2082;
        v65 = object_getClassName(a1);
        __int16 v66 = 2082;
        v67 = sel_getName(a2);
        __int16 v68 = 1024;
        int v69 = 455;
        _os_log_impl(&dword_1CA51A000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
          buf,
          0x22u);
      }
      goto LABEL_54;
    }
LABEL_60:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  sel = a2;
  int v9 = v7;
  uint64_t v10 = objc_opt_new();
  if ([v5 length] > v8)
  {
    for (i = (unsigned __int8 *)&v6[v8]; i < (unsigned __int8 *)&v6[[v5 length]]; ++i)
    {
      if ((v9 & 0x80000000) == 0
        && (unsigned int v12 = *i, v12 <= 0x1F)
        && ((BOOL v13 = v12 > 0xD, v14 = (1 << v12) & 0x2500, !v13) ? (v15 = v14 == 0) : (v15 = 1), v15))
      {
        objc_super v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        unint64_t v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v17 >= 4) {
          goto LABEL_60;
        }
        unint64_t v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v17);
        if (v18)
        {
          int v19 = object_getClass(a1);
          BOOL v20 = class_isMetaClass(v19);
          uint64_t v21 = object_getClassName(a1);
          v58 = sel_getName(sel);
          uint64_t v22 = 45;
          if (v20) {
            uint64_t v22 = 43;
          }
          v18(4, "%c[%{public}s %{public}s]:%i Invalid character found, skipping", v22, v21, v58, 463);
          objc_super v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        BOOL v23 = dispatch_get_specific(v16);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        BOOL v24 = (id)_NFSharedLogClient[(void)v23];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          BOOL v25 = object_getClass(a1);
          if (class_isMetaClass(v25)) {
            int v26 = 43;
          }
          else {
            int v26 = 45;
          }
          uint64_t v27 = object_getClassName(a1);
          v28 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          int v63 = v26;
          __int16 v64 = 2082;
          v65 = v27;
          __int16 v66 = 2082;
          v67 = v28;
          __int16 v68 = 1024;
          int v69 = 463;
          _os_log_impl(&dword_1CA51A000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid character found, skipping", buf, 0x22u);
        }
      }
      else
      {
        [v10 appendBytes:i length:1];
      }
    }
  }
  if ([v10 length])
  {
    id v39 = [NSString alloc];
    uint64_t v10 = v10;
    uint64_t v40 = [v10 bytes];
    uint64_t v41 = [v10 length];
    if (v9 < 0) {
      uint64_t v42 = 10;
    }
    else {
      uint64_t v42 = 4;
    }
    v56 = (void *)[v39 initWithBytes:v40 length:v41 encoding:v42];
    goto LABEL_57;
  }
  uint64_t v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v44 >= 4) {
    goto LABEL_60;
  }
  v45 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v44);
  if (v45)
  {
    v46 = object_getClass(a1);
    BOOL v47 = class_isMetaClass(v46);
    v48 = object_getClassName(a1);
    v60 = sel_getName(sel);
    uint64_t v49 = 45;
    if (v47) {
      uint64_t v49 = 43;
    }
    v45(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v49, v48, v60, 470);
    uint64_t v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v50 = dispatch_get_specific(v43);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v51 = (id)_NFSharedLogClient[(void)v50];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v52 = object_getClass(a1);
    if (class_isMetaClass(v52)) {
      int v53 = 43;
    }
    else {
      int v53 = 45;
    }
    v54 = object_getClassName(a1);
    v55 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    int v63 = v53;
    __int16 v64 = 2082;
    v65 = v54;
    __int16 v66 = 2082;
    v67 = v55;
    __int16 v68 = 1024;
    int v69 = 470;
    _os_log_impl(&dword_1CA51A000, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
      buf,
      0x22u);
  }

LABEL_54:
  v56 = 0;
LABEL_57:

  return v56;
}

+ (id)_decodeTextRecord:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = +[NFNdefRecordInternal _decodeTextRecordLanguage:v5];
    char v7 = &stru_1F24CADC0;
    if (!v6) {
      goto LABEL_35;
    }
    uint64_t v8 = +[NFNdefRecordInternal _decodeTextRecordText:v5];
    if (v8)
    {
      uint64_t v9 = [[NSString alloc] initWithFormat:@"'%@' : %@", v6, v8];
      uint64_t v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (__CFString *)v9;
      }
      else {
        uint64_t v11 = &stru_1F24CADC0;
      }
      char v7 = v11;

LABEL_34:
      goto LABEL_35;
    }
    uint64_t v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      BOOL v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v24)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v28 = 45;
        if (isMetaClass) {
          uint64_t v28 = 43;
        }
        v24(4, "%c[%{public}s %{public}s]:%i Invalid payload encoding; dropping message", v28, ClassName, Name, 496);
        uint64_t v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      objc_super v29 = dispatch_get_specific(v22);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v30 = (id)_NFSharedLogClient[(void)v29];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        unint64_t v31 = object_getClass(a1);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v37 = v32;
        __int16 v38 = 2082;
        id v39 = object_getClassName(a1);
        __int16 v40 = 2082;
        uint64_t v41 = sel_getName(a2);
        __int16 v42 = 1024;
        int v43 = 496;
        _os_log_impl(&dword_1CA51A000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload encoding; dropping message",
          buf,
          0x22u);
      }

      char v7 = &stru_1F24CADC0;
      goto LABEL_34;
    }
LABEL_38:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  unsigned int v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  BOOL v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v13 >= 4) {
    goto LABEL_38;
  }
  int v14 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v13);
  if (v14)
  {
    BOOL v15 = object_getClass(a1);
    BOOL v16 = class_isMetaClass(v15);
    unint64_t v17 = object_getClassName(a1);
    v34 = sel_getName(a2);
    uint64_t v18 = 45;
    if (v16) {
      uint64_t v18 = 43;
    }
    v14(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v18, v17, v34, 485);
    unsigned int v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  int v19 = dispatch_get_specific(v12);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  uint64_t v6 = (id)_NFSharedLogClient[(void)v19];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    BOOL v20 = object_getClass(a1);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v37 = v21;
    __int16 v38 = 2082;
    id v39 = object_getClassName(a1);
    __int16 v40 = 2082;
    uint64_t v41 = sel_getName(a2);
    __int16 v42 = 1024;
    int v43 = 485;
    _os_log_impl(&dword_1CA51A000, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
      buf,
      0x22u);
  }
  char v7 = &stru_1F24CADC0;
LABEL_35:

  return v7;
}

+ (id)_decodeURIRecord:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 length] <= 1)
  {
    uint64_t v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v8)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v8(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v12, ClassName, Name, 509);
        uint64_t v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      BOOL v13 = dispatch_get_specific(v6);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v14 = (id)_NFSharedLogClient[(void)v13];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        BOOL v15 = object_getClass(a1);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v70 = v16;
        __int16 v71 = 2082;
        v72 = object_getClassName(a1);
        __int16 v73 = 2082;
        v74 = sel_getName(a2);
        __int16 v75 = 1024;
        int v76 = 509;
        unint64_t v17 = "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
LABEL_69:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  id v18 = v5;
  int v19 = (unsigned __int8 *)[v18 bytes];
  BOOL v20 = v19 + 1;
  uint64_t v21 = *v19;
  do
  {
    if (v20 >= &v19[[v18 length]])
    {
      id v34 = v18;
      uint64_t v35 = [v34 bytes] + 1;
      int v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v35 length:[v34 length] - 1];
      int v36 = [[NSString alloc] initWithFormat:@"%02x", v21];
      if (v36)
      {
        int v37 = [&unk_1F24D20B8 objectForKeyedSubscript:v36];
        id v38 = [NSString alloc];
        id v39 = v14;
        __int16 v40 = (__CFString *)[v38 initWithBytes:-[NSObject bytes](v39, "bytes") length:-[NSObject length](v39, "length") encoding:4];
        if ([(__CFString *)v40 length])
        {
          if (v37)
          {
            uint64_t v41 = [[NSString alloc] initWithFormat:@"%@%@", v37, v40];

            __int16 v40 = (__CFString *)v41;
          }
          __int16 v42 = &stru_1F24CADC0;
          if (v40) {
            __int16 v42 = v40;
          }
          v33 = v42;
        }
        else
        {
          int v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v54 >= 4) {
            goto LABEL_69;
          }
          v55 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v54);
          if (v55)
          {
            v56 = object_getClass(a1);
            BOOL v57 = class_isMetaClass(v56);
            v58 = object_getClassName(a1);
            __int16 v68 = sel_getName(a2);
            uint64_t v59 = 45;
            if (v57) {
              uint64_t v59 = 43;
            }
            v55(4, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message", v59, v58, v68, 577);
            int v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v60 = dispatch_get_specific(v53);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v61 = (id)_NFSharedLogClient[(void)v60];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = object_getClass(a1);
            if (class_isMetaClass(v62)) {
              int v63 = 43;
            }
            else {
              int v63 = 45;
            }
            *(_DWORD *)buf = 67109890;
            int v70 = v63;
            __int16 v71 = 2082;
            v72 = object_getClassName(a1);
            __int16 v73 = 2082;
            v74 = sel_getName(a2);
            __int16 v75 = 1024;
            int v76 = 577;
            _os_log_impl(&dword_1CA51A000, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message",
              buf,
              0x22u);
          }

          v33 = &stru_1F24CADC0;
        }
      }
      else
      {
        int v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        uint64_t v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v44 >= 4) {
          goto LABEL_69;
        }
        v45 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v44);
        if (v45)
        {
          v46 = object_getClass(a1);
          BOOL v47 = class_isMetaClass(v46);
          v48 = object_getClassName(a1);
          v67 = sel_getName(a2);
          uint64_t v49 = 45;
          if (v47) {
            uint64_t v49 = 43;
          }
          v45(4, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message", v49, v48, v67, 568);
          int v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v50 = dispatch_get_specific(v43);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        int v37 = (id)_NFSharedLogClient[(void)v50];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v51 = object_getClass(a1);
          if (class_isMetaClass(v51)) {
            int v52 = 43;
          }
          else {
            int v52 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v70 = v52;
          __int16 v71 = 2082;
          v72 = object_getClassName(a1);
          __int16 v73 = 2082;
          v74 = sel_getName(a2);
          __int16 v75 = 1024;
          int v76 = 568;
          _os_log_impl(&dword_1CA51A000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message",
            buf,
            0x22u);
        }
        v33 = &stru_1F24CADC0;
      }

      goto LABEL_66;
    }
    unsigned int v22 = *v20++;
  }
  while (v22 > 0x1F);
  BOOL v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  BOOL v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v24 >= 4) {
    goto LABEL_69;
  }
  BOOL v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v24);
  if (v25)
  {
    int v26 = object_getClass(a1);
    BOOL v27 = class_isMetaClass(v26);
    uint64_t v28 = object_getClassName(a1);
    __int16 v66 = sel_getName(a2);
    uint64_t v29 = 45;
    if (v27) {
      uint64_t v29 = 43;
    }
    v25(4, "%c[%{public}s %{public}s]:%i Invalid payload character; dropping message", v29, v28, v66, 558);
    BOOL v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  int v30 = dispatch_get_specific(v23);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  int v14 = (id)_NFSharedLogClient[(void)v30];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    unint64_t v31 = object_getClass(a1);
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v70 = v32;
    __int16 v71 = 2082;
    v72 = object_getClassName(a1);
    __int16 v73 = 2082;
    v74 = sel_getName(a2);
    __int16 v75 = 1024;
    int v76 = 558;
    unint64_t v17 = "%c[%{public}s %{public}s]:%i Invalid payload character; dropping message";
LABEL_29:
    _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
  }
LABEL_30:
  v33 = &stru_1F24CADC0;
LABEL_66:

  return v33;
}

+ (id)decodeFromRecord:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 typeNameFormat] == 1)
  {
    uint64_t v6 = [v5 type];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      id v8 = [NSString alloc];
      id v9 = [v5 type];
      uint64_t v10 = [v9 bytes];
      uint64_t v11 = [v5 type];
      uint64_t v12 = [v8 initWithBytes:v10 length:[v11 length] encoding:4];

      if ([v12 isEqualToString:@"T"])
      {
        BOOL v13 = [v5 payload];
        uint64_t v14 = +[NFNdefRecordInternal _decodeTextRecord:v13];
LABEL_22:
        uint64_t v21 = (__CFString *)v14;

        goto LABEL_39;
      }
      if ([v12 isEqualToString:@"U"])
      {
        BOOL v13 = [v5 payload];
        uint64_t v14 = +[NFNdefRecordInternal _decodeURIRecord:v13];
        goto LABEL_22;
      }

      goto LABEL_38;
    }
    unsigned int v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      BOOL v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v24)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v28 = 45;
        if (isMetaClass) {
          uint64_t v28 = 43;
        }
        v24(3, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode", v28, ClassName, Name, 592);
        unsigned int v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      uint64_t v29 = dispatch_get_specific(v22);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v30 = (id)_NFSharedLogClient[(void)v29];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      unint64_t v31 = object_getClass(a1);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v47 = v32;
      __int16 v48 = 2082;
      uint64_t v49 = object_getClassName(a1);
      __int16 v50 = 2082;
      v51 = sel_getName(a2);
      __int16 v52 = 1024;
      int v53 = 592;
LABEL_35:
      _os_log_impl(&dword_1CA51A000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode",
        buf,
        0x22u);
LABEL_36:

      uint64_t v21 = &stru_1F24CADC0;
      goto LABEL_39;
    }
    goto LABEL_42;
  }
  if ([v5 typeNameFormat] == 3)
  {
    BOOL v15 = [v5 type];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      id v17 = [NSString alloc];
      id v18 = [v5 type];
      uint64_t v19 = [v18 bytes];
      BOOL v20 = [v5 type];
      uint64_t v21 = (__CFString *)[v17 initWithBytes:v19 length:[v20 length] encoding:4];

      goto LABEL_39;
    }
    v33 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    id v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v34 < 4)
    {
      uint64_t v35 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v34);
      if (v35)
      {
        int v36 = object_getClass(a1);
        BOOL v37 = class_isMetaClass(v36);
        id v38 = object_getClassName(a1);
        v45 = sel_getName(a2);
        uint64_t v39 = 45;
        if (v37) {
          uint64_t v39 = 43;
        }
        v35(3, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode", v39, v38, v45, 605);
        v33 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      __int16 v40 = dispatch_get_specific(v33);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v30 = (id)_NFSharedLogClient[(void)v40];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      uint64_t v41 = object_getClass(a1);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v47 = v42;
      __int16 v48 = 2082;
      uint64_t v49 = object_getClassName(a1);
      __int16 v50 = 2082;
      v51 = sel_getName(a2);
      __int16 v52 = 1024;
      int v53 = 605;
      goto LABEL_35;
    }
LABEL_42:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
LABEL_38:
  uint64_t v21 = (__CFString *)[[NSString alloc] initWithFormat:@"%@", v5];
LABEL_39:

  return v21;
}

+ (id)dataFromRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  char v38 = 0;
  char v37 = [v3 header];
  [v4 appendBytes:&v37 length:1];
  id v5 = [v3 type];
  if (v5)
  {
  }
  else if (![v3 typeNameFormat])
  {
    char v38 = 0;
    [v4 appendBytes:&v38 length:1];
    char v38 = 0;
    [v4 appendBytes:&v38 length:1];
    goto LABEL_26;
  }
  uint64_t v6 = [v3 type];
  char v38 = [v6 length];

  [v4 appendBytes:&v38 length:1];
  if ([v3 shortRecord])
  {
    char v38 = 0;
    uint64_t v7 = [v3 payload];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [v3 payload];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        uint64_t v11 = [v3 payload];
        char v38 = [v11 length];
      }
    }
  }
  else
  {
    uint64_t v12 = [v3 payload];
    if (v12)
    {
      BOOL v13 = [v3 payload];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        BOOL v15 = [v3 payload];
        LODWORD(v12) = [v15 length];
      }
      else
      {
        LODWORD(v12) = 0;
      }
    }
    char v38 = BYTE3(v12);
    [v4 appendBytes:&v38 length:1];
    char v38 = BYTE2(v12);
    [v4 appendBytes:&v38 length:1];
    char v38 = BYTE1(v12);
    [v4 appendBytes:&v38 length:1];
    char v38 = (char)v12;
  }
  [v4 appendBytes:&v38 length:1];
  uint64_t v16 = [v3 identifier];
  if (v16)
  {
    id v17 = (void *)v16;
    id v18 = [v3 identifier];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      BOOL v20 = [v3 identifier];
      char v38 = [v20 length];

      [v4 appendBytes:&v38 length:1];
    }
  }
  uint64_t v21 = [v3 type];
  if (v21)
  {
    unsigned int v22 = (void *)v21;
    BOOL v23 = [v3 type];
    uint64_t v24 = [v23 length];

    if (v24)
    {
      BOOL v25 = [v3 type];
      [v4 appendData:v25];
    }
  }
  uint64_t v26 = [v3 identifier];
  if (v26)
  {
    BOOL v27 = (void *)v26;
    uint64_t v28 = [v3 identifier];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      int v30 = [v3 identifier];
      [v4 appendData:v30];
    }
  }
  uint64_t v31 = [v3 payload];
  if (v31)
  {
    int v32 = (void *)v31;
    v33 = [v3 payload];
    uint64_t v34 = [v33 length];

    if (v34)
    {
      uint64_t v35 = [v3 payload];
      [v4 appendData:v35];
    }
  }
LABEL_26:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end