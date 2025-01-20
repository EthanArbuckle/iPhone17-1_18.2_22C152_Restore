@interface NSString(CRSafeSubstring)
- (__CFString)safeSubstringWithRange:()CRSafeSubstring;
@end

@implementation NSString(CRSafeSubstring)

- (__CFString)safeSubstringWithRange:()CRSafeSubstring
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a3 < [a1 length] && a3 + a4 <= objc_msgSend(a1, "length"))
    {
      objc_msgSend(a1, "substringWithRange:", a3, a4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CROSLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v10 = 134218496;
        unint64_t v11 = a3;
        __int16 v12 = 2048;
        uint64_t v13 = a4;
        __int16 v14 = 2048;
        uint64_t v15 = [a1 length];
        _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "safeSubstringWithRange: range out of bounds NSMakeRange(%lu, %lu), in string of length %lu", (uint8_t *)&v10, 0x20u);
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = &stru_1F38EED68;
  }
  return v8;
}

@end