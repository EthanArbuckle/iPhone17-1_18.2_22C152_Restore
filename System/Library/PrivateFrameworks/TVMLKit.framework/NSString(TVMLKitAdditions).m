@interface NSString(TVMLKitAdditions)
+ (id)tvs_hexStringWithBytes:()TVMLKitAdditions length:lowercase:;
+ (uint64_t)tv_lowercaseHexStringWithBytes:()TVMLKitAdditions length:;
- (id)tv_MD5String;
- (id)tv_SHA256String;
- (id)tv_filenameSafeString;
@end

@implementation NSString(TVMLKitAdditions)

- (id)tv_filenameSafeString
{
  v2 = [MEMORY[0x263F089D8] stringWithString:a1];
  uint64_t v3 = [a1 length];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, v3);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 0, 0, v3);
  v4 = [NSString stringWithString:v2];

  return v4;
}

- (id)tv_MD5String
{
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", objc_msgSend(a1, "UTF8String"), v2);
    v4 = objc_msgSend(v3, "tv_MD5Digest");
    v5 = objc_msgSend(v4, "tv_lowercaseHexString");
  }
  return v5;
}

- (id)tv_SHA256String
{
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", objc_msgSend(a1, "UTF8String"), v2);
    v4 = objc_msgSend(v3, "tv_SHA256Digest");
    v5 = objc_msgSend(v4, "tv_lowercaseHexString");
  }
  return v5;
}

+ (uint64_t)tv_lowercaseHexStringWithBytes:()TVMLKitAdditions length:
{
  return objc_msgSend(a1, "tvs_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

+ (id)tvs_hexStringWithBytes:()TVMLKitAdditions length:lowercase:
{
  uint64_t v6 = a4;
  uint64_t v8 = 2 * a4;
  v9 = (char *)malloc_type_malloc((2 * a4) | 1, 0xBFFA7B9EuLL);
  v10 = v9;
  v11 = &unk_230C38390;
  if (a5) {
    v11 = &unk_230C383A0;
  }
  if (v6)
  {
    v12 = v9 + 1;
    do
    {
      *(v12 - 1) = v11[(unint64_t)*a3 >> 4];
      char v13 = *a3++;
      unsigned char *v12 = v11[v13 & 0xF];
      v12 += 2;
      --v6;
    }
    while (v6);
  }
  v9[v8] = 0;
  v14 = [NSString stringWithUTF8String:v9];
  free(v10);
  return v14;
}

@end