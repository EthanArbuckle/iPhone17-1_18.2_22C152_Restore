@interface NSData(iCalDigest)
- (id)ical_digestWithVersionNumber:()iCalDigest;
- (uint64_t)ical_digest;
@end

@implementation NSData(iCalDigest)

- (uint64_t)ical_digest
{
  return objc_msgSend(a1, "ical_digestWithVersionNumber:", 0);
}

- (id)ical_digestWithVersionNumber:()iCalDigest
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int data = a3;
  v5 = (void *)[a1 length];
  if (v5)
  {
    memset(&v8, 0, sizeof(v8));
    CC_SHA1_Init(&v8);
    if (a3) {
      CC_SHA1_Update(&v8, &data, 4u);
    }
    id v6 = a1;
    CC_SHA1_Update(&v8, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    CC_SHA1_Final(md, &v8);
    v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  }
  return v5;
}

@end