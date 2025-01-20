@interface BTUUID
+ (id)UUID128:(const char *)a3;
+ (id)UUID128WithString:(id)a3;
+ (id)UUID16:(unsigned __int16)a3;
+ (id)UUIDWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)UUIDWithData:(id)a3;
+ (id)UUIDWithLittleEndianBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)randomUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUUID16:(unsigned __int16)a3;
- (BTUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (BTUUID)initWithCoder:(id)a3;
- (NSData)data;
- (NSData)swappedData;
- (id)UUID128;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation BTUUID

- (BTUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4 == 16 || a4 == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)BTUUID;
    v6 = [(BTUUID *)&v10 init];
    if (v6)
    {
      v7 = +[NSData dataWithBytes:a3 length:a4];
      [(BTUUID *)v6 setData:v7];
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[BTUUID allocWithZone:a3] init];
  v5 = [(BTUUID *)self data];
  [(BTUUID *)v4 setData:v5];

  return v4;
}

+ (id)UUIDWithLittleEndianBytes:(const char *)a3 length:(unint64_t)a4
{
  v7 = (char *)&v12 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, a4);
  if (a4)
  {
    v8 = v7;
    unint64_t v9 = a4;
    do
      *v8++ = a3[--v9];
    while (v9);
  }
  objc_super v10 = [a1 UUIDWithBytes:v7 length:a4];

  return v10;
}

+ (id)UUIDWithData:(id)a3
{
  id v4 = a3;
  v5 = [a1 UUIDWithBytes:[v4 bytes] length:[v4 length]];

  return v5;
}

+ (id)UUIDWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    if (a4 == 16 || a4 == 2) {
      id v5 = [objc_alloc((Class)a1) initWithBytes:a3 length:a4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)UUID16:(unsigned __int16)a3
{
  __int16 v5 = __rev16(a3);
  id v3 = [objc_alloc((Class)a1) initWithBytes:&v5 length:2];

  return v3;
}

+ (id)UUID128:(const char *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithBytes:a3 length:16];

  return v3;
}

+ (id)UUID128WithString:(id)a3
{
  memset(uu, 0, sizeof(uu));
  id v4 = a3;
  if (uuid_parse((const char *)[v4 UTF8String], uu))
  {
    __int16 v5 = 0;
  }
  else
  {
    __int16 v5 = [a1 UUID128:uu];
  }

  return v5;
}

+ (id)randomUUID
{
  memset(out, 0, sizeof(out));
  uuid_generate(out);
  id v3 = [a1 UUID128:out];

  return v3;
}

- (id)UUID128
{
  id v3 = [(BTUUID *)self data];
  id v4 = [v3 length];

  if (v4 == (id)16)
  {
    __int16 v5 = self;
  }
  else
  {
    id v6 = [(BTUUID *)self data];
    v7 = (char *)[v6 bytes];

    __int16 v9 = 0;
    char v10 = v7[1];
    char v11 = *v7;
    unint64_t v12 = 0x8000008000100000;
    int v13 = -80438433;
    __int16 v5 = +[BTUUID UUID128:&v9];
  }

  return v5;
}

- (NSData)swappedData
{
  id v3 = [(BTUUID *)self data];
  id v4 = (char *)[v3 length];

  __int16 v5 = +[NSMutableData dataWithLength:v4];
  id v6 = [(BTUUID *)self data];
  v7 = [v6 bytes];

  id v8 = v5;
  for (i = [v8 mutableBytes]; v4; --v4)
    *i++ = v4[(void)(v7 - 1)];

  return (NSData *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(BTUUID *)self data];
  [v5 encodeObject:v4 forKey:@"uuidBytes"];
}

- (BTUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTUUID;
  id v5 = [(BTUUID *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"uuidBytes"];
    [(BTUUID *)v5 setData:v6];
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(BTUUID *)self data];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(BTUUID *)self data];
    id v6 = [v5 length];
    v7 = [v4 data];
    id v8 = [v7 length];

    if (v6 == v8)
    {
      __int16 v9 = [(BTUUID *)self data];
      char v10 = [v4 data];
      unsigned __int8 v11 = [v9 isEqualToData:v10];
    }
    else
    {
      __int16 v9 = [(BTUUID *)self UUID128];
      char v10 = [v4 UUID128];
      unsigned __int8 v11 = [v9 isEqual:v10];
    }
    BOOL v12 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToUUID16:(unsigned __int16)a3
{
  int v3 = a3;
  id v5 = [(BTUUID *)self data];
  id v6 = [v5 length];

  if (v6 != (id)2) {
    return 0;
  }
  id v7 = [(BTUUID *)self data];
  unsigned int v8 = bswap32(*(unsigned __int16 *)[v7 bytes]);

  return v3 == HIWORD(v8);
}

- (id)description
{
  id v3 = [(BTUUID *)self data];
  id v4 = (const unsigned __int8 *)[v3 bytes];

  id v5 = [(BTUUID *)self data];
  id v6 = [v5 length];

  if (v6 == (id)2)
  {
    id v7 = +[NSString stringWithFormat:@"0x%04X", bswap32(*(unsigned __int16 *)v4) >> 16];
  }
  else
  {
    unsigned int v8 = [(BTUUID *)self data];
    id v9 = [v8 length];

    if (v9 == (id)16)
    {
      memset(out, 0, 37);
      uuid_unparse_upper(v4, out);
      id v7 = +[NSString stringWithUTF8String:out];
    }
    else
    {
      id v7 = @"<>";
    }
  }

  return v7;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end