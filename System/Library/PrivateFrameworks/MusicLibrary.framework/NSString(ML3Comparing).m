@interface NSString(ML3Comparing)
- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:;
@end

@implementation NSString(ML3Comparing)

- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    unint64_t v8 = [a1 compare:v7];
    switch(a4)
    {
      case 1:
        uint64_t v9 = [a1 isEqualToString:v7];
        goto LABEL_20;
      case 2:
        uint64_t v10 = [a1 isEqualToString:v7] ^ 1;
        break;
      case 3:
        BOOL v11 = v8 == 1;
        goto LABEL_10;
      case 4:
        BOOL v12 = v8 >= 2;
        goto LABEL_14;
      case 5:
        BOOL v11 = v8 == -1;
LABEL_10:
        uint64_t v10 = v11;
        break;
      case 6:
        BOOL v12 = v8 + 1 >= 2;
LABEL_14:
        uint64_t v10 = !v12;
        break;
      case 7:
        uint64_t v9 = [a1 containsString:v7];
        goto LABEL_20;
      case 8:
        uint64_t v9 = [a1 hasPrefix:v7];
        goto LABEL_20;
      case 9:
        uint64_t v9 = [a1 hasSuffix:v7];
LABEL_20:
        uint64_t v10 = v9;
        break;
      default:
        uint64_t v10 = 0;
        break;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end