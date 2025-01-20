@interface NSDecimalNumber(PKComparison)
- (BOOL)pk_isEqualToDecimalNumber:()PKComparison;
- (BOOL)pk_isGreaterThan:()PKComparison;
- (BOOL)pk_isGreaterThanOrEqualTo:()PKComparison;
- (BOOL)pk_isLessThan:()PKComparison;
- (BOOL)pk_isLessThanOrEqualTo:()PKComparison;
@end

@implementation NSDecimalNumber(PKComparison)

- (BOOL)pk_isLessThan:()PKComparison
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)pk_isLessThanOrEqualTo:()PKComparison
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)pk_isGreaterThan:()PKComparison
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)pk_isGreaterThanOrEqualTo:()PKComparison
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)pk_isEqualToDecimalNumber:()PKComparison
{
  return objc_msgSend(a1, "compare:") == 0;
}

@end