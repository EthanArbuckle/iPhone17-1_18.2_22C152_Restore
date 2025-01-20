@interface NSNumber(FCAdditions)
- (BOOL)fc_isGreaterThan:()FCAdditions;
- (BOOL)fc_isLessThan:()FCAdditions;
- (id)fc_largerNumber:()FCAdditions;
- (id)fc_smallerNumber:()FCAdditions;
- (uint64_t)fc_isLessThanOrEqualTo:()FCAdditions;
@end

@implementation NSNumber(FCAdditions)

- (id)fc_smallerNumber:()FCAdditions
{
  id v4 = a3;
  if ([a1 compare:v4] == 1) {
    v5 = v4;
  }
  else {
    v5 = a1;
  }
  id v6 = v5;

  return v6;
}

- (id)fc_largerNumber:()FCAdditions
{
  id v4 = a3;
  if ([a1 compare:v4] == -1) {
    v5 = v4;
  }
  else {
    v5 = a1;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)fc_isLessThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)fc_isLessThanOrEqualTo:()FCAdditions
{
  return objc_msgSend(a1, "fc_isGreaterThan:") ^ 1;
}

- (BOOL)fc_isGreaterThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end