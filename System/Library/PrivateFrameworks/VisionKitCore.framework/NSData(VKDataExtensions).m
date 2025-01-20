@interface NSData(VKDataExtensions)
- (id)vk_md5;
- (id)vk_stringValue;
@end

@implementation NSData(VKDataExtensions)

- (id)vk_md5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  id v2 = a1;
  CC_MD5_Update(&c, (const void *)[v2 bytes], objc_msgSend(v2, "length"));
  CC_MD5_Final(md, &c);
  v3 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 16; ++i)
  {
    unsigned int v5 = md[i];
    LODWORD(v6) = (v5 >> 4) + 87;
    if (v5 >= 0xA0) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = (v5 >> 4) | 0x30;
    }
    unsigned int v7 = v5 & 0xF;
    LODWORD(v8) = v7 + 87;
    if (v7 >= 0xA) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = v7 | 0x30;
    }
    objc_msgSend(v3, "appendFormat:", @"%c%c", v6, v8);
  }
  return v3;
}

- (id)vk_stringValue
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  return v1;
}

@end