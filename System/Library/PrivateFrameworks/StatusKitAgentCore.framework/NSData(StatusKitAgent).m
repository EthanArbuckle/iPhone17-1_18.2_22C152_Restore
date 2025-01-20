@interface NSData(StatusKitAgent)
- (id)ska_hexString;
- (id)ska_sha256;
@end

@implementation NSData(StatusKitAgent)

- (id)ska_hexString
{
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  for (i = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:2 * v2]; v2; --v2)
  {
    unsigned int v5 = *v3++;
    objc_msgSend(i, "appendFormat:", @"%02lx", v5);
  }
  v6 = (void *)[i copy];

  return v6;
}

- (id)ska_sha256
{
  v1 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:a1];
  uint64_t v2 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v3 = v1;
  v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];
  id v6 = v2;
  CC_SHA256(v4, v5, (unsigned __int8 *)[v6 mutableBytes]);
  v7 = (void *)[v6 copy];

  return v7;
}

@end