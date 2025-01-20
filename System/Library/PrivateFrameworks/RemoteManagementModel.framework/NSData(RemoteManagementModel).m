@interface NSData(RemoteManagementModel)
- (id)RMModelHexString;
- (id)RMModelSHA1Hash;
- (id)RMModelSHA1HexString;
@end

@implementation NSData(RemoteManagementModel)

- (id)RMModelHexString
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v2)
  {
    v5 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      unsigned int v6 = *v3++;
      char *v5 = RMModelHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = RMModelHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  unsigned char *v4 = 0;
  v7 = objc_msgSend(NSString, "stringWithCString:encoding:");
  return v7;
}

- (id)RMModelSHA1Hash
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  id v2 = a1;
  CC_SHA1_Update(&v5, (const void *)[v2 bytes], objc_msgSend(v2, "length"));
  CC_SHA1_Final(md, &v5);
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
  return v3;
}

- (id)RMModelSHA1HexString
{
  v1 = [a1 RMModelSHA1Hash];
  id v2 = [v1 RMModelHexString];

  return v2;
}

@end