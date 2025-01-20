@interface NSNumber(ML3Comparing)
- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:;
@end

@implementation NSNumber(ML3Comparing)

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
      case 7:
      case 8:
      case 9:
        uint64_t v9 = [a1 isEqualToNumber:v7];
        break;
      case 2:
        uint64_t v9 = [a1 isEqualToNumber:v7] ^ 1;
        break;
      case 3:
        BOOL v10 = v8 == 1;
        goto LABEL_10;
      case 4:
        BOOL v11 = v8 >= 2;
        goto LABEL_14;
      case 5:
        BOOL v10 = v8 == -1;
LABEL_10:
        uint64_t v9 = v10;
        break;
      case 6:
        BOOL v11 = v8 + 1 >= 2;
LABEL_14:
        uint64_t v9 = !v11;
        break;
      case 10:
        uint64_t v12 = [a1 longLongValue];
        uint64_t v9 = ([v7 longLongValue] & v12) != 0;
        break;
      default:
        uint64_t v9 = 0;
        break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end