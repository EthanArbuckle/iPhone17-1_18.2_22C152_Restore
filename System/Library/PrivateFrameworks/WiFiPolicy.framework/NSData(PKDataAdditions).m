@interface NSData(PKDataAdditions)
- (id)SHA1Hash;
- (id)hexEncoding;
@end

@implementation NSData(PKDataAdditions)

- (id)SHA1Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:20];

  return v2;
}

- (id)hexEncoding
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v3 = [a1 length];
  uint64_t v4 = [a1 bytes];
  if (v3)
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", @"%02x", v6);
      --v3;
    }
    while (v3);
  }

  return v2;
}

@end