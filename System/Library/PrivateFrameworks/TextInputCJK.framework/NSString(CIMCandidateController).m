@interface NSString(CIMCandidateController)
- (uint64_t)chinesePinyinCompare:()CIMCandidateController;
- (uint64_t)traditionalChineseZhuyinCompare:()CIMCandidateController;
@end

@implementation NSString(CIMCandidateController)

- (uint64_t)traditionalChineseZhuyinCompare:()CIMCandidateController
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  v6 = GetCurrentLocale();
  uint64_t v7 = objc_msgSend(a1, "compare:options:range:locale:", v4, 512, 0, v5, v6);

  uint64_t v8 = [a1 length];
  if (v8)
  {
    uint64_t v9 = v8;
    if (v8 == [v4 length])
    {
      uint64_t v10 = v9 - 1;
      v11 = [a1 substringToIndex:v10];
      v12 = [v4 substringToIndex:v10];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        v14 = [a1 substringFromIndex:v10];
        v15 = [v4 substringFromIndex:v10];
        uint64_t v16 = 0;
        do
        {
          v17 = kZhuyinToneMarks[v16];
          int v18 = [(__CFString *)v17 isEqualToString:v14];
          unsigned int v19 = [(__CFString *)v17 isEqualToString:v15];
          if (v19) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = v7;
          }
          if (v18) {
            uint64_t v7 = (v18 & v19) - 1;
          }
          else {
            uint64_t v7 = v20;
          }
          if (v18) {
            break;
          }
          if (v19) {
            break;
          }
        }
        while (v16++ != 4);
      }
    }
  }

  return v7;
}

- (uint64_t)chinesePinyinCompare:()CIMCandidateController
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  v6 = GetCurrentLocale();
  uint64_t v7 = objc_msgSend(a1, "compare:options:range:locale:", v4, 512, 0, v5, v6);

  return v7;
}

@end