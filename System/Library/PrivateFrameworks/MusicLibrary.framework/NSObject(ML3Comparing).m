@interface NSObject(ML3Comparing)
- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:;
@end

@implementation NSObject(ML3Comparing)

- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = [a1 isEqual:v6] ^ 1;
  }
  else if (a4 == 1)
  {
    uint64_t v7 = [a1 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end