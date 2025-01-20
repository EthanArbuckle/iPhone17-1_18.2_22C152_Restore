@interface SignpostSupportPIDBlocklist
- (BOOL)_wantsNotEqual;
- (BOOL)passesPIDNumber:(id)a3;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportPIDBlocklist

- (BOOL)_wantsNotEqual
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesPIDNumber:(id)a3
{
  id v4 = a3;
  v5 = [(SignpostSupportPIDFilter *)self pidSet];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

@end