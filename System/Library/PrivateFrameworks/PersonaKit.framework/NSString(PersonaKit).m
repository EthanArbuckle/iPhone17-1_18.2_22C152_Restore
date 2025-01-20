@interface NSString(PersonaKit)
+ (id)pr_hexStringWithData:()PersonaKit;
- (id)pr_SHADigest;
- (id)pr_numericValue;
@end

@implementation NSString(PersonaKit)

- (id)pr_SHADigest
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = (const char *)[a1 UTF8String];
  *(_OWORD *)md = 0u;
  long long v7 = 0u;
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  return v3;
}

- (id)pr_numericValue
{
  CC_LONG v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789"];
  v3 = [v2 invertedSet];

  v4 = [a1 componentsSeparatedByCharactersInSet:v3];
  v5 = [v4 componentsJoinedByString:&stru_26C4A32E0];
  uint64_t v6 = [v5 longLongValue];

  long long v7 = [NSNumber numberWithLongLong:v6];

  return v7;
}

+ (id)pr_hexStringWithData:()PersonaKit
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = (unsigned __int8 *)[v5 bytes];
  long long v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:2 * v4];
  if (v4 >= 1)
  {
    do
    {
      unsigned int v8 = *v6++;
      objc_msgSend(v7, "appendFormat:", @"%02X", v8);
      --v4;
    }
    while (v4);
  }
  v9 = (void *)[v7 copy];

  return v9;
}

@end