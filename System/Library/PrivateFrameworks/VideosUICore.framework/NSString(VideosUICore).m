@interface NSString(VideosUICore)
+ (id)tvs_hexStringWithBytes:()VideosUICore length:lowercase:;
+ (uint64_t)vui_lowercaseHexStringWithBytes:()VideosUICore length:;
- (id)vui_SHA256String;
- (id)vui_filenameSafeString;
@end

@implementation NSString(VideosUICore)

- (id)vui_SHA256String
{
  uint64_t v2 = [a1 length];
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(a1, "UTF8String"), v2);
    v4 = objc_msgSend(v3, "vui_SHA256Digest");
    v5 = objc_msgSend(v4, "vui_lowercaseHexString");
  }
  return v5;
}

+ (uint64_t)vui_lowercaseHexStringWithBytes:()VideosUICore length:
{
  return objc_msgSend(a1, "tvs_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

+ (id)tvs_hexStringWithBytes:()VideosUICore length:lowercase:
{
  uint64_t v8 = 2 * a4;
  v9 = malloc_type_malloc((2 * a4) | 1, 0x19CC244BuLL);
  v10 = v9;
  v11 = &unk_1E2A156A0;
  if (a5) {
    v11 = &unk_1E2A156B0;
  }
  if (a4)
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      *((unsigned char *)v9 + v13 - 1) = v11[(unint64_t)*(unsigned __int8 *)(a3 + v12) >> 4];
      *((unsigned char *)v9 + v13) = v11[*(unsigned char *)(a3 + v12++) & 0xF];
      v13 += 2;
    }
    while (a4 > v12);
  }
  *((unsigned char *)v9 + v8) = 0;
  v14 = [NSString stringWithUTF8String:v9];
  free(v10);
  return v14;
}

- (id)vui_filenameSafeString
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  uint64_t v3 = [a1 length];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, v3);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 0, 0, v3);
  v4 = [NSString stringWithString:v2];

  return v4;
}

@end