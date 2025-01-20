@interface SSSystemVersionCondition
- (BOOL)evaluateWithContext:(id)a3;
@end

@implementation SSSystemVersionCondition

- (BOOL)evaluateWithContext:(id)a3
{
  v4 = (void *)[a3 systemVersion];
  if (!v4) {
    return 0;
  }
  id value = self->super._value;
  if (!value) {
    return 0;
  }
  unint64_t v6 = SSCompareProductVersions(v4, value);
  int64_t operator = self->super._operator;
  return ConditionResultForComparisonResult(v6, operator);
}

@end