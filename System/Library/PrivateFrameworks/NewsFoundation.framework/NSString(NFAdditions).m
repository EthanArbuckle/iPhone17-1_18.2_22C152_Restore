@interface NSString(NFAdditions)
- (id)nf_sha1;
- (id)nf_stringByReversingString;
@end

@implementation NSString(NFAdditions)

- (id)nf_sha1
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263F089D8] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)nf_stringByReversingString
{
  uint64_t v2 = [a1 length];
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:v2];
  if (v2)
  {
    uint64_t v4 = v2 - 1;
    do
    {
      char v5 = [a1 characterAtIndex:v4];
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v5);
      [v3 appendString:v6];

      --v4;
    }
    while (v4 != -1);
  }
  return v3;
}

@end