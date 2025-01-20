@interface FedStatsUtil
+ (id)intToBitString:(int)a3 length:(int)a4;
+ (id)sha1:(id)a3;
+ (int)bitStringToInt:(id)a3;
@end

@implementation FedStatsUtil

+ (int)bitStringToInt:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    int v7 = 0;
    char v8 = v4 - 1;
    do
    {
      v9 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      int v10 = [v9 isEqualToString:@"1"];

      int v11 = 1 << v8;
      if (!v10) {
        int v11 = 0;
      }
      v7 += v11;
      ++v6;
      --v8;
    }
    while (v5 != v6);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)intToBitString:(int)a3 length:(int)a4
{
  uint64_t v6 = [MEMORY[0x263F089D8] string];
  if (a4 >= 1)
  {
    int v7 = 0;
    do
    {
      if ((a3 >> v7)) {
        char v8 = @"1";
      }
      else {
        char v8 = @"0";
      }
      [v6 insertString:v8 atIndex:0];
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

+ (id)sha1:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)[a3 UTF8String];
  CC_LONG v5 = strlen(v4);
  CC_SHA1(v4, v5, md);
  uint64_t v6 = [MEMORY[0x263F089D8] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
  {
    char v8 = [a1 intToBitString:md[i] length:8];
    [v6 appendFormat:@"%@", v8];
  }
  return v6;
}

@end