@interface SignpostSupportExactProcessNameBlacklist
- (BOOL)_wantsNotEqual;
- (BOOL)passesProcessName:(id)a3;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportExactProcessNameBlacklist

- (BOOL)_wantsNotEqual
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesProcessName:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  v5 = [(SignpostSupportExactProcessNameFilter *)self processNameSet];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

@end