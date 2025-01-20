@interface FedStatsUtil
+ (id)intToBitString:(int)a3 length:(int)a4;
+ (id)sha1:(id)a3;
+ (int)bitStringToInt:(id)a3;
@end

@implementation FedStatsUtil

+ (int)bitStringToInt:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 length];
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    int v7 = 0;
    char v8 = (_BYTE)v4 - 1;
    do
    {
      v9 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      unsigned int v10 = [v9 isEqualToString:@"1"];

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
  v6 = +[NSMutableString string];
  if (a4 >= 1)
  {
    int v7 = 0;
    do
    {
      if ((a3 >> v7)) {
        CFStringRef v8 = @"1";
      }
      else {
        CFStringRef v8 = @"0";
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
  v4 = (const char *)[a3 UTF8String];
  CC_LONG v5 = strlen(v4);
  CC_SHA1(v4, v5, md);
  v6 = +[NSMutableString stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
  {
    CFStringRef v8 = [a1 intToBitString:md[i] length:8];
    [v6 appendFormat:@"%@", v8];
  }
  return v6;
}

@end