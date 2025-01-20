@interface NSData(VideosUICore)
- (id)vui_SHA1Digest;
- (id)vui_SHA256Digest;
- (uint64_t)vui_lowercaseHexString;
@end

@implementation NSData(VideosUICore)

- (uint64_t)vui_lowercaseHexString
{
  v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  uint64_t v4 = [v2 length];
  return objc_msgSend(v1, "vui_lowercaseHexStringWithBytes:length:", v3, v4);
}

- (id)vui_SHA256Digest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    CC_SHA256((const void *)[a1 bytes], v2, md);
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  }
  return v3;
}

- (id)vui_SHA1Digest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
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
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:20];
  }
  return v3;
}

@end