@interface NSString(TPSCoreAdditions)
- (uint64_t)tps_compareBuildVersionWithString:()TPSCoreAdditions;
@end

@implementation NSString(TPSCoreAdditions)

- (uint64_t)tps_compareBuildVersionWithString:()TPSCoreAdditions
{
  id v4 = a3;
  uint64_t v27 = 0;
  v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(\\d+)([a-zA-Z]+)(\\d+)([a-zA-Z]*)$" options:0 error:&v27];
  v6 = objc_msgSend(v5, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v7 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  uint64_t v8 = [v6 numberOfRanges];
  uint64_t v9 = [v7 numberOfRanges];
  if (v8 == 5)
  {
    if (v9 == 5)
    {
      uint64_t v10 = 1;
      while (1)
      {
        uint64_t v11 = [v6 rangeAtIndex:v10];
        v13 = objc_msgSend(a1, "substringWithRange:", v11, v12);
        uint64_t v14 = [v7 rangeAtIndex:v10];
        v16 = objc_msgSend(v4, "substringWithRange:", v14, v15);
        uint64_t v17 = [v13 compare:v16 options:64];

        if (v17) {
          break;
        }
        if (++v10 == 4)
        {
          uint64_t v18 = [v6 rangeAtIndex:4];
          v20 = objc_msgSend(a1, "substringWithRange:", v18, v19);
          uint64_t v21 = [v7 rangeAtIndex:4];
          v23 = objc_msgSend(v4, "substringWithRange:", v21, v22);
          uint64_t v24 = [v20 length];
          uint64_t v25 = [v23 length];
          if (!v24 || v25)
          {
            if (v24 || !v25)
            {
              uint64_t v17 = 0;
              if (v24 && v25) {
                uint64_t v17 = [v20 compare:v23 options:2];
              }
            }
            else
            {
              uint64_t v17 = -1;
            }
          }
          else
          {
            uint64_t v17 = 1;
          }

          break;
        }
      }
    }
    else
    {
      uint64_t v17 = -1;
    }
  }
  else if (v9 == 5)
  {
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v17 = [a1 compare:v4 options:64];
  }

  return v17;
}

@end