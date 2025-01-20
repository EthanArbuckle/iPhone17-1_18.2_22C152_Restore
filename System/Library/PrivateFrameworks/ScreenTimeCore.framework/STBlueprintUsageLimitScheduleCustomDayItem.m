@interface STBlueprintUsageLimitScheduleCustomDayItem
- (double)budgetLimit;
- (unint64_t)day;
- (void)setBudgetLimit:(double)a3;
- (void)setDay:(unint64_t)a3;
@end

@implementation STBlueprintUsageLimitScheduleCustomDayItem

- (double)budgetLimit
{
  return self->_budgetLimit;
}

- (void)setBudgetLimit:(double)a3
{
  self->_budgetLimit = a3;
}

- (unint64_t)day
{
  return self->_day;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

@end