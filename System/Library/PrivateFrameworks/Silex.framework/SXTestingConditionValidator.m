@interface SXTestingConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXTestingConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 testing];
  if (v6 == 2)
  {
    int v7 = [v5 testing] ^ 1;
  }
  else if (v6 == 1)
  {
    LOBYTE(v7) = [v5 testing];
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

@end