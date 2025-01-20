@interface NSData
- (BOOL)matchesChecksum:(unsigned __int8)a3[32];
- (BOOL)matchesChecksumData:(id)a3;
- (id)checksumData;
- (void)checksum:(unsigned __int8)a3[32];
- (void)checksumDataToChecksum:(unsigned __int8)a3[32];
@end

@implementation NSData

- (id)checksumData
{
  [(NSData *)self checksum:v4];
  v2 = +[NSData dataWithBytes:v4 length:32];

  return v2;
}

- (void)checksum:(unsigned __int8)a3[32]
{
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  v4 = self;
  id v5 = [(NSData *)v4 bytes];
  CC_LONG v6 = [(NSData *)v4 length];

  CC_SHA256(v5, v6, a3);
}

- (void)checksumDataToChecksum:(unsigned __int8)a3[32]
{
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  -[NSData getBytes:length:](self, "getBytes:length:");
}

- (BOOL)matchesChecksum:(unsigned __int8)a3[32]
{
  [(NSData *)self checksum:v8];
  return *(void *)a3 == v8[0]
      && *((void *)a3 + 1) == v8[1]
      && *((void *)a3 + 2) == v8[2]
      && *((void *)a3 + 3) == v8[3];
}

- (BOOL)matchesChecksumData:(id)a3
{
  [a3 checksumDataToChecksum:v5];
  return [(NSData *)self matchesChecksum:v5];
}

@end