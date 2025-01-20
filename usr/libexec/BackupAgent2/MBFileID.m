@interface MBFileID
+ (MBFileID)fileIDWithData:(id)a3;
+ (MBFileID)fileIDWithDomain:(id)a3 relativePath:(id)a4;
+ (MBFileID)fileIDWithDomainName:(id)a3 relativePath:(id)a4;
+ (MBFileID)fileIDWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileID:(id)a3;
- (MBFileID)initWithBytes:(const void *)a3;
- (MBFileID)initWithData:(id)a3;
- (MBFileID)initWithDecoder:(id)a3;
- (MBFileID)initWithDomain:(id)a3 relativePath:(id)a4;
- (MBFileID)initWithDomainName:(id)a3 relativePath:(id)a4;
- (MBFileID)initWithString:(id)a3;
- (NSData)data;
- (NSString)filenamePrefix;
- (NSString)filenameWithPrefix;
- (NSString)string;
- (const)bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)length;
- (void)encode:(id)a3;
@end

@implementation MBFileID

+ (MBFileID)fileIDWithDomain:(id)a3 relativePath:(id)a4
{
  v4 = [[MBFileID alloc] initWithDomain:a3 relativePath:a4];

  return v4;
}

+ (MBFileID)fileIDWithDomainName:(id)a3 relativePath:(id)a4
{
  v4 = [[MBFileID alloc] initWithDomainName:a3 relativePath:a4];

  return v4;
}

+ (MBFileID)fileIDWithString:(id)a3
{
  v3 = [[MBFileID alloc] initWithString:a3];

  return v3;
}

+ (MBFileID)fileIDWithData:(id)a3
{
  v3 = [[MBFileID alloc] initWithData:a3];

  return v3;
}

- (MBFileID)initWithBytes:(const void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBFileID;
  result = [(MBFileID *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3;
    *(_DWORD *)&result->_bytes[16] = *((_DWORD *)a3 + 4);
    *(_OWORD *)result->_bytes = v5;
  }
  return result;
}

- (MBFileID)initWithDecoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBFileID;
  v4 = [(MBFileID *)&v7 init];
  long long v5 = v4;
  if (v4) {
    [a3 decodeBytes:v4->_bytes length:20];
  }
  return v5;
}

- (MBFileID)initWithDomain:(id)a3 relativePath:(id)a4
{
  id v6 = [a3 name];

  return [(MBFileID *)self initWithDomainName:v6 relativePath:a4];
}

- (MBFileID)initWithDomainName:(id)a3 relativePath:(id)a4
{
  if (!a4) {
    +[NSException raise:NSInvalidArgumentException format:@"Null relative path"];
  }
  if ([a4 isEqualToString:&stru_1000F43B0])
  {
    v9.receiver = self;
    v9.super_class = (Class)MBFileID;
    id v6 = [(MBFileID *)&v9 init];
    if (v6) {
      MBGetFileIDBytes();
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:[a4 fileSystemRepresentation]];
    v10.receiver = self;
    v10.super_class = (Class)MBFileID;
    id v6 = [(MBFileID *)&v10 init];
    if (v6) {
      MBGetFileIDBytes();
    }
  }
  return v6;
}

- (MBFileID)initWithString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MBFileID;
  v3 = [(MBFileID *)&v5 init];
  if (v3 && (MBBytesWithString() & 1) == 0)
  {

    return 0;
  }
  return v3;
}

- (MBFileID)initWithData:(id)a3
{
  if ([a3 length] == (id)20)
  {
    id v5 = [a3 bytes];
    return [(MBFileID *)self initWithBytes:v5];
  }
  else
  {

    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MBFileID allocWithZone:a3];

  return [(MBFileID *)v4 initWithBytes:self->_bytes];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(MBFileID *)self isEqualToFileID:a3];
}

- (BOOL)isEqualToFileID:(id)a3
{
  return *(void *)self->_bytes == *((void *)a3 + 1)
      && *(void *)&self->_bytes[8] == *((void *)a3 + 2)
      && *(_DWORD *)&self->_bytes[16] == (unint64_t)*((unsigned int *)a3 + 6);
}

- (unint64_t)hash
{
  unint64_t result = 0;
  for (uint64_t i = 8; i != 28; ++i)
    unint64_t result = *((unsigned __int8 *)&self->super.isa + i) - result + 32 * result;
  return result;
}

- (const)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return 20;
}

- (NSData)data
{
  return +[NSData dataWithBytes:self->_bytes length:20];
}

- (NSString)filenamePrefix
{
  v2 = [(MBFileID *)self filename];

  return [(NSString *)v2 substringToIndex:2];
}

- (NSString)filenameWithPrefix
{
  v3 = [(MBFileID *)self filenamePrefix];
  v4 = [(MBFileID *)self filename];

  return [(NSString *)v3 stringByAppendingPathComponent:v4];
}

- (NSString)string
{
  return (NSString *)_MBStringWithBytes(self->_bytes, 20);
}

- (void)encode:(id)a3
{
}

@end