@interface NSString(MSVLyricsTTMLParser)
- (BOOL)msvl_isElementType:()MSVLyricsTTMLParser;
- (double)msvl_timeValue;
@end

@implementation NSString(MSVLyricsTTMLParser)

- (BOOL)msvl_isElementType:()MSVLyricsTTMLParser
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

- (double)msvl_timeValue
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [a1 componentsSeparatedByString:@":"];
  v3 = [v2 lastObject];
  [v3 doubleValue];
  double v5 = v4;

  if ((unint64_t)[v2 count] >= 2)
  {
    v6 = objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(v2, "count") - 2);
    double v5 = v5 + (double)[v6 integerValue] * 60.0;

    if ((unint64_t)[v2 count] >= 3)
    {
      v7 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = a1;
        _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, "Warning: time format should specify [minutes:]seconds only; other components are ignored: %@",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }

  return v5;
}

@end