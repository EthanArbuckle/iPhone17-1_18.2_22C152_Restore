@interface NSString(TSUVersionComparison)
- (uint64_t)tsu_compareToVersionString:()TSUVersionComparison;
@end

@implementation NSString(TSUVersionComparison)

- (uint64_t)tsu_compareToVersionString:()TSUVersionComparison
{
  id v4 = a3;
  uint64_t v5 = TokenizeVersionString(a1);
  uint64_t v6 = TokenizeVersionString(v4);
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v5 || !v6)
    {
      if (!v5 || v6)
      {
        uint64_t v10 = 0;
        while (1)
        {
          v11 = [(id)v5 objectAtIndexedSubscript:v10];
          v12 = [v7 objectAtIndexedSubscript:v10];
          uint64_t v8 = [v11 compare:v12];

          if (v8) {
            break;
          }
          if (++v10 == 3) {
            goto LABEL_2;
          }
        }
      }
      else
      {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
LABEL_2:
    uint64_t v8 = 0;
  }

  return v8;
}

@end