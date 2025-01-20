@interface FTABSubfile
- (FTABSubfile)initWithTag:(id)a3 data:(id)a4;
- (FTABSubfile)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5;
- (NSString)dumpString;
- (NSString)tag;
- (const)dataPointer;
- (id)description;
- (id)generateHashSHA256;
- (id)generateHashSHA384;
- (id)generateHashSHA512;
- (unsigned)dataLength;
@end

@implementation FTABSubfile

- (NSString)dumpString
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [(FTABSubfile *)self tag];
  [v3 appendFormat:@"Subfile Tag: %@\n", v4];

  [v3 appendFormat:@"Length: %u\n", -[FTABSubfile dataLength](self, "dataLength")];
  v5 = FormatHex((uint64_t)[(FTABSubfile *)self dataPointer], [(FTABSubfile *)self dataLength], 1);
  [v3 appendString:v5];
  v6 = [NSString stringWithString:v3];

  return (NSString *)v6;
}

- (FTABSubfile)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FTABSubfile;
  v9 = [(FTABSubfile *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v9->_dataPointer = (const char *)a4;
    v9->_dataLength = a5;
  }

  return v9;
}

- (FTABSubfile)initWithTag:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FTABSubfile;
  id v8 = [(FTABSubfile *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v8->_dataPointer = (const char *)[(NSData *)v8->_data bytes];
    v8->_dataLength = [(NSData *)v8->_data length];
  }

  return v8;
}

- (id)generateHashSHA256
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  CC_SHA256_Update(&v5, self->_dataPointer, self->_dataLength);
  CC_SHA256_Final(md, &v5);
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];

  return v3;
}

- (id)generateHashSHA384
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA384_Init(&v5);
  CC_SHA384_Update(&v5, self->_dataPointer, self->_dataLength);
  CC_SHA384_Final(md, &v5);
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:48];

  return v3;
}

- (id)generateHashSHA512
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA512_Init(&v5);
  CC_SHA512_Update(&v5, self->_dataPointer, self->_dataLength);
  CC_SHA512_Final(md, &v5);
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:64];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Subfile: type=%@, length=%u", self->_tag, self->_dataLength];
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (const)dataPointer
{
  return self->_dataPointer;
}

- (unsigned)dataLength
{
  return self->_dataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end