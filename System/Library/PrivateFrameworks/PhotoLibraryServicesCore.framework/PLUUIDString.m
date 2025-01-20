@interface PLUUIDString
+ (BOOL)parseUUIDString:(id)a3 uuidBuffer:(char *)a4;
+ (id)UUIDString;
+ (unint64_t)UUIDStringLength;
- ($DCF20CAD073027CB89FDEFA7A9A33809)UUIDBytes;
- (BOOL)isEqualToString:(id)a3;
- (PLUUIDString)init;
- (PLUUIDString)initWithCFUUID:(__CFUUID *)a3;
- (PLUUIDString)initWithCFUUIDBytes:(id)a3;
- (PLUUIDString)initWithUUID:(unsigned __int8)a3[16];
- (PLUUIDString)initWithUUIDData:(id)a3;
- (const)UTF8String;
- (id)UUIDData;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation PLUUIDString

- (const)UTF8String
{
  return self->_uuidString;
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11 = (unsigned __int8 *)a3;
  id v12 = a6;
  uint64_t v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    int v15 = uuid_compare(self->_uuid, v11 + 8);
    if (v15 < 0) {
      int64_t v14 = -1;
    }
    else {
      int64_t v14 = v15 != 0;
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLUUIDString;
    int64_t v14 = -[PLUUIDString compare:options:range:locale:](&v17, sel_compare_options_range_locale_, v11, a4, location, length, v12);
  }

  return v14;
}

- (BOOL)isEqualToString:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    unsigned __int8 v6 = uuid_compare(self->_uuid, v4 + 8) == 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLUUIDString;
    unsigned __int8 v6 = [(PLUUIDString *)&v8 isEqualToString:v4];
  }

  return v6;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    v4 = &self->_uuidString[a4.location];
    do
    {
      unsigned __int16 v5 = *v4++;
      *a3++ = v5;
      --a4.length;
    }
    while (a4.length);
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return self->_uuidString[a3];
}

- (unint64_t)length
{
  return 36;
}

- ($DCF20CAD073027CB89FDEFA7A9A33809)UUIDBytes
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uuid_copy((unsigned __int8 *)&v4, self->_uuid);
  uint64_t v2 = v4;
  uint64_t v3 = v5;
  result.var8 = v3;
  result.var9 = BYTE1(v3);
  result.var10 = BYTE2(v3);
  result.var11 = BYTE3(v3);
  result.var12 = BYTE4(v3);
  result.var13 = BYTE5(v3);
  result.var14 = BYTE6(v3);
  result.var15 = HIBYTE(v3);
  result.var0 = v2;
  result.var1 = BYTE1(v2);
  result.var2 = BYTE2(v2);
  result.var3 = BYTE3(v2);
  result.var4 = BYTE4(v2);
  result.var5 = BYTE5(v2);
  result.var6 = BYTE6(v2);
  result.var7 = HIBYTE(v2);
  return result;
}

- (id)UUIDData
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:self->_uuid length:16];
}

- (PLUUIDString)initWithUUID:(unsigned __int8)a3[16]
{
  v8.receiver = self;
  v8.super_class = (Class)PLUUIDString;
  uint64_t v4 = [(PLUUIDString *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    uuid = v4->_uuid;
    if (a3) {
      uuid_copy(uuid, a3);
    }
    else {
      MEMORY[0x19F38FE20](uuid);
    }
    uuid_unparse(v5->_uuid, v5->_uuidString);
  }
  return v5;
}

- (PLUUIDString)initWithCFUUIDBytes:(id)a3
{
  $DCF20CAD073027CB89FDEFA7A9A33809 v4 = a3;
  return [(PLUUIDString *)self initWithUUID:&v4];
}

- (PLUUIDString)initWithCFUUID:(__CFUUID *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLUUIDString;
  $DCF20CAD073027CB89FDEFA7A9A33809 v4 = [(PLUUIDString *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3)
    {
      CFUUIDBytes v7 = CFUUIDGetUUIDBytes(a3);
      uuid_copy(v5->_uuid, &v7.byte0);
    }
    else
    {
      MEMORY[0x19F38FE20](v4->_uuid);
    }
    uuid_unparse(v5->_uuid, v5->_uuidString);
  }
  return v5;
}

- (PLUUIDString)initWithUUIDData:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 16)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLUUIDString;
    uint64_t v5 = [(PLUUIDString *)&v7 init];
    if (v5)
    {
      uuid_copy(v5->_uuid, (const unsigned __int8 *)[v4 bytes]);
      uuid_unparse(v5->_uuid, v5->_uuidString);
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (PLUUIDString)init
{
  return [(PLUUIDString *)self initWithUUID:0];
}

+ (BOOL)parseUUIDString:(id)a3 uuidBuffer:(char *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (const char *)[a3 cStringUsingEncoding:4];
  if (v5)
  {
    unsigned __int8 v6 = v5;
    memset(uu, 0, 16);
    int v7 = uuid_parse(v5, uu);
    BOOL v8 = v7 == 0;
    if (v7)
    {
      v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        uint64_t v13 = v6;
        _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "uuid_parse failed for assetUUIDCharString: %s", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      *(_OWORD *)a4 = *(_OWORD *)uu;
    }
  }
  else
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uu = 0;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "assetUUIDCharString is nil", uu, 2u);
    }

    return 0;
  }
  return v8;
}

+ (unint64_t)UUIDStringLength
{
  return 36;
}

+ (id)UUIDString
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithUUID:0];
  return v2;
}

@end