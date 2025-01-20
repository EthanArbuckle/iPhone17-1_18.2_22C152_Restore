@interface NSString(Hash)
- (id)preinstalledAudioHashForLanguage:()Hash name:;
- (id)sha256hex;
@end

@implementation NSString(Hash)

- (id)preinstalledAudioHashForLanguage:()Hash name:
{
  v4 = [a1 stringByAppendingFormat:@" %@ %@", a3, a4];
  v5 = [v4 sha256hex];

  return v5;
}

- (id)sha256hex
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = (const char *)[a1 UTF8String];
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  return v3;
}

@end