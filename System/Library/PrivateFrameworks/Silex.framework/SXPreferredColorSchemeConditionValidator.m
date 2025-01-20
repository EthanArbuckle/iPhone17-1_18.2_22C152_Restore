@interface SXPreferredColorSchemeConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXPreferredColorSchemeConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 preferredColorScheme] && objc_msgSend(v5, "preferredColorScheme") != 4)
  {
    uint64_t v8 = [v6 userInterfaceStyle];
    if (v8)
    {
      uint64_t v9 = 1;
      if (v8 == 2) {
        uint64_t v9 = 3;
      }
      if (v8 == 1) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v9;
      }
      BOOL v7 = [v5 preferredColorScheme] == v10;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

@end