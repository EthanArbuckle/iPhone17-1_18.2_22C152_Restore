@interface SignpostSupportExactProcessNameAllowlist
- (BOOL)_wantsNotEqual;
- (BOOL)passesProcessName:(id)a3;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportExactProcessNameAllowlist

- (BOOL)_wantsNotEqual
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 2;
}

- (BOOL)passesProcessName:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(SignpostSupportExactProcessNameFilter *)self processNameSet];
  char v6 = [v5 containsObject:v4];

  return v6;
}

@end