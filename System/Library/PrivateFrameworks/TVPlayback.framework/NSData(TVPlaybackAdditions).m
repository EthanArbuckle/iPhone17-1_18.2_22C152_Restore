@interface NSData(TVPlaybackAdditions)
- (id)tvp_MD5Digest;
- (id)tvp_SHA1Digest;
- (id)tvp_SHA256Digest;
- (uint64_t)tvp_lowercaseHexString;
- (uint64_t)tvp_uppercaseHexString;
@end

@implementation NSData(TVPlaybackAdditions)

- (uint64_t)tvp_lowercaseHexString
{
  v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  uint64_t v4 = [v2 length];
  return objc_msgSend(v1, "tvp_lowercaseHexStringWithBytes:length:", v3, v4);
}

- (uint64_t)tvp_uppercaseHexString
{
  v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  uint64_t v4 = [v2 length];
  return objc_msgSend(v1, "tvp_uppercaseHexStringWithBytes:length:", v3, v4);
}

- (id)tvp_MD5Digest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    CC_MD5((const void *)[a1 bytes], v2, md);
    uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:16];
  }
  return v3;
}

- (id)tvp_SHA1Digest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    memset(v5, 0, sizeof(v5));
    CC_SHA1((const void *)objc_msgSend(a1, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0,
                      0,
                      0,
                      0),
      v2,
      (unsigned __int8 *)v5);
    uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:20];
  }
  return v3;
}

- (id)tvp_SHA256Digest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    CC_SHA256((const void *)[a1 bytes], v2, md);
    uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }
  return v3;
}

@end