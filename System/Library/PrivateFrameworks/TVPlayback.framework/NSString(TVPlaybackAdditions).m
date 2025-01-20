@interface NSString(TVPlaybackAdditions)
+ (id)tvp_hexStringWithBytes:()TVPlaybackAdditions length:lowercase:;
+ (uint64_t)tvp_lowercaseHexStringWithBytes:()TVPlaybackAdditions length:;
+ (uint64_t)tvp_uppercaseHexStringWithBytes:()TVPlaybackAdditions length:;
- (id)tvp_dataFromHexString;
- (id)tvp_languageCodeWithoutRegion;
@end

@implementation NSString(TVPlaybackAdditions)

- (id)tvp_languageCodeWithoutRegion
{
  id v1 = a1;
  unint64_t v2 = [v1 rangeOfString:@"_"];
  unint64_t v3 = [v1 rangeOfString:@"-"];
  if (v2 >= v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = v2;
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = v2;
  }
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = v4;
  }
  v6 = v1;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend(v1, "substringToIndex:");
  }
  return v6;
}

- (id)tvp_dataFromHexString
{
  id v1 = (const char *)[a1 cStringUsingEncoding:1];
  size_t v2 = strlen(v1);
  unint64_t v3 = 0;
  if (v2)
  {
    unint64_t v4 = v2;
    if ((v2 & 1) == 0)
    {
      unint64_t v5 = v2 >> 1;
      v6 = malloc_type_malloc(v2 >> 1, 0x5CC072C9uLL);
      v7 = v6;
      if (v4 >= 2)
      {
        if (v5 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v4 >> 1;
        }
        v9 = v1 + 1;
        v10 = v6;
        do
        {
          *(_WORD *)__str = *(_WORD *)(v9 - 1);
          char v13 = 0;
          *v10++ = strtol(__str, 0, 16);
          v9 += 2;
          --v8;
        }
        while (v8);
      }
      unint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v5];
      free(v7);
    }
  }
  return v3;
}

+ (uint64_t)tvp_lowercaseHexStringWithBytes:()TVPlaybackAdditions length:
{
  return objc_msgSend(a1, "tvp_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

+ (uint64_t)tvp_uppercaseHexStringWithBytes:()TVPlaybackAdditions length:
{
  return objc_msgSend(a1, "tvp_hexStringWithBytes:length:lowercase:", a3, a4, 0);
}

+ (id)tvp_hexStringWithBytes:()TVPlaybackAdditions length:lowercase:
{
  uint64_t v6 = a4;
  uint64_t v8 = 2 * a4;
  v9 = (char *)malloc_type_malloc((2 * a4) | 1, 0xA8F881CCuLL);
  v10 = v9;
  v11 = "0123456789ABCDEF0123456789abcdef";
  if (a5) {
    v11 = "0123456789abcdef";
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