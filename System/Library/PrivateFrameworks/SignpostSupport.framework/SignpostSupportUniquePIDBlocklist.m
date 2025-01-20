@interface SignpostSupportUniquePIDBlocklist
- (BOOL)_wantsNotEqual;
- (BOOL)passesUniquePIDNumber:(id)a3;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportUniquePIDBlocklist

- (BOOL)_wantsNotEqual
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesUniquePIDNumber:(id)a3
{
  id v4 = a3;
  v5 = [(SignpostSupportUniquePIDFilter *)self uniquePidSet];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

@end