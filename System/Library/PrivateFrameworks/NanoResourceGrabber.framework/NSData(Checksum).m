@interface NSData(Checksum)
- (BOOL)matchesChecksum:()Checksum;
- (id)checksumData;
- (uint64_t)checksumDataToChecksum:()Checksum;
- (uint64_t)matchesChecksumData:()Checksum;
- (unsigned)checksum:()Checksum;
@end

@implementation NSData(Checksum)

- (id)checksumData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 checksum:v3];
  v1 = [MEMORY[0x263EFF8F8] dataWithBytes:v3 length:32];
  return v1;
}

- (unsigned)checksum:()Checksum
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  id v4 = a1;
  v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];
  return CC_SHA256(v5, v6, (unsigned __int8 *)a3);
}

- (uint64_t)checksumDataToChecksum:()Checksum
{
  *a3 = 0u;
  a3[1] = 0u;
  return objc_msgSend(a1, "getBytes:length:");
}

- (BOOL)matchesChecksum:()Checksum
{
  v8[4] = *MEMORY[0x263EF8340];
  [a1 checksum:v8];
  return *a3 == v8[0] && a3[1] == v8[1] && a3[2] == v8[2] && a3[3] == v8[3];
}

- (uint64_t)matchesChecksumData:()Checksum
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a3 checksumDataToChecksum:v5];
  return [a1 matchesChecksum:v5];
}

@end