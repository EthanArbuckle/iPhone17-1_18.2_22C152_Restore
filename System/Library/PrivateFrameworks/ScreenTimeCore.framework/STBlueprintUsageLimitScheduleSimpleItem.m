@interface STBlueprintUsageLimitScheduleSimpleItem
- (double)budgetLimit;
- (void)setBudgetLimit:(double)a3;
@end

@implementation STBlueprintUsageLimitScheduleSimpleItem

- (double)budgetLimit
{
  return self->_budgetLimit;
}

- (void)setBudgetLimit:(double)a3
{
  self->_budgetLimit = a3;
}

@end