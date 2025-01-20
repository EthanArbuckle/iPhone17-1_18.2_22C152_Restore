@interface STBlueprintUsageLimitScheduleRepresentation
- (NSArray)customScheduleItems;
- (STBlueprintUsageLimitScheduleSimpleItem)simpleSchedule;
- (void)setCustomScheduleItems:(id)a3;
- (void)setSimpleSchedule:(id)a3;
@end

@implementation STBlueprintUsageLimitScheduleRepresentation

- (STBlueprintUsageLimitScheduleSimpleItem)simpleSchedule
{
  return self->_simpleSchedule;
}

- (void)setSimpleSchedule:(id)a3
{
}

- (NSArray)customScheduleItems
{
  return self->_customScheduleItems;
}

- (void)setCustomScheduleItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customScheduleItems, 0);
  objc_storeStrong((id *)&self->_simpleSchedule, 0);
}

@end