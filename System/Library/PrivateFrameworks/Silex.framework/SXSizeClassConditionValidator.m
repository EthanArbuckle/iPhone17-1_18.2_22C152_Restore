@interface SXSizeClassConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXSizeClassConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v9 = 0;
  if (![v5 horizontalSizeClass]
    || (uint64_t v7 = [v5 horizontalSizeClass], v7 == objc_msgSend(v6, "horizontalSizeClass")))
  {
    if (![v5 verticalSizeClass]
      || (uint64_t v8 = [v5 verticalSizeClass], v8 == objc_msgSend(v6, "verticalSizeClass")))
    {
      BOOL v9 = 1;
    }
  }

  return v9;
}

@end