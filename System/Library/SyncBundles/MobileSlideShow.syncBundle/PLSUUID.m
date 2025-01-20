@interface PLSUUID
+ (id)generateUUIDAsString;
+ (id)photoBase64UUIDsFromUUIDs:(id)a3;
+ (id)uuid;
+ (id)uuidWithData:(id)a3;
+ (id)uuidWithString:(id)a3;
+ (int64_t)numberBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToData:(id)a3;
- (NSString)photoBase64String;
- (NSString)stringValue;
- (PLSUUID)init;
- (PLSUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (PLSUUID)initWithCoder:(id)a3;
- (PLSUUID)initWithData:(id)a3;
- (PLSUUID)initWithPhotoBase64String:(id)a3;
- (PLSUUID)initWithString:(id)a3;
- (const)bytes;
- (unint64_t)length;
- (void)_dataFromCFUUID:(__CFUUID *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLSUUID

- (void).cxx_destruct
{
}

- (void)_dataFromCFUUID:(__CFUUID *)a3
{
  CFUUIDBytes v6 = CFUUIDGetUUIDBytes(a3);
  v4 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:&v6 length:16];
  data = self->_data;
  self->_data = v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PLSUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSUUID;
  v5 = [(PLSUUID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSUUIDDataKey"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(PLSUUID *)self isEqualToData:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)photoBase64String
{
  v3 = +[PLSBase64Encoder encoderForPhotoUUID];
  id v4 = [v3 encodeData:self->_data];

  return (NSString *)v4;
}

- (NSString)stringValue
{
  *(void *)&v5.byte0 = 0;
  *(void *)&v5.byte8 = 0;
  [(NSData *)self->_data getBytes:&v5 length:16];
  CFUUIDRef v2 = CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, v5);
  v3 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v2);
  CFRelease(v2);

  return (NSString *)v3;
}

- (BOOL)isEqualToData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[PLSUUID uuidWithData:v4];
  }
  uint64_t v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)PLSUUID;
  BOOL v7 = [(PLSUUID *)&v9 isEqualToData:v5];

  return v7;
}

- (const)bytes
{
  return [(NSData *)self->_data bytes];
}

- (unint64_t)length
{
  return [(NSData *)self->_data length];
}

- (PLSUUID)initWithPhotoBase64String:(id)a3
{
  id v4 = a3;
  if ([v4 length] == (char *)&dword_14 + 2)
  {
    id v5 = +[PLSBase64Decoder decoderForPhotoUUID];
    uint64_t v6 = [v5 decodeString:v4];
    if (v6)
    {
      v13.receiver = self;
      v13.super_class = (Class)PLSUUID;
      BOOL v7 = [(PLSUUID *)&v13 init];
      if (v7)
      {
        id v8 = v6;
        uint64_t v9 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v8 bytes], objc_msgSend(v8, "length"));
        data = v7->_data;
        v7->_data = (NSData *)v9;
      }
      self = v7;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PLSUUID)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PLSUUID;
    id v5 = [(PLSUUID *)&v11 init];
    if (v5)
    {
      id v6 = v4;
      uint64_t v7 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v6 bytes], objc_msgSend(v6, "length"));
      data = v5->_data;
      v5->_data = (NSData *)v7;
    }
    self = v5;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (PLSUUID)initWithString:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PLSUUID;
    id v5 = [(PLSUUID *)&v9 init];
    if (v5)
    {
      CFUUIDRef v6 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);
      [(PLSUUID *)v5 _dataFromCFUUID:v6];
      CFRelease(v6);
    }
    self = v5;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (PLSUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)PLSUUID;
    CFUUIDRef v6 = [(PLSUUID *)&v11 init];
    if (v6)
    {
      uint64_t v7 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a3 length:a4];
      data = v6->_data;
      v6->_data = v7;
    }
    self = v6;
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (PLSUUID)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLSUUID;
  CFUUIDRef v2 = [(PLSUUID *)&v5 init];
  if (v2)
  {
    CFUUIDRef v3 = CFUUIDCreate(kCFAllocatorDefault);
    [(PLSUUID *)v2 _dataFromCFUUID:v3];
    CFRelease(v3);
  }
  return v2;
}

+ (id)generateUUIDAsString
{
  CFUUIDRef v2 = +[PLSUUID uuid];
  CFUUIDRef v3 = [v2 stringValue];

  return v3;
}

+ (id)photoBase64UUIDsFromUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[PLSUUID uuidWithString:](PLSUUID, "uuidWithString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        objc_super v11 = [v10 photoBase64String];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (int64_t)numberBytes
{
  return 16;
}

+ (id)uuidWithString:(id)a3
{
  id v3 = a3;
  id v4 = [[PLSUUID alloc] initWithString:v3];

  return v4;
}

+ (id)uuidWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[PLSUUID alloc] initWithData:v3];

  return v4;
}

+ (id)uuid
{
  CFUUIDRef v2 = objc_alloc_init(PLSUUID);

  return v2;
}

@end