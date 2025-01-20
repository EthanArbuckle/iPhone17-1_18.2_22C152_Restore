@interface NSData(SHA256)
- (id)psso_sha256Hash;
- (id)psso_sha256HashString;
@end

@implementation NSData(SHA256)

- (id)psso_sha256HashString
{
  if ([a1 length])
  {
    v2 = objc_msgSend(a1, "psso_sha256Hash");
    v3 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)psso_sha256Hash
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = (void *)[a1 length];
  if (v2)
  {
    id v3 = a1;
    CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
    v2 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }
  return v2;
}

@end