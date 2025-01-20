@interface STBlueprintScheduleRepresentation
- (NSArray)customScheduleItems;
- (STBlueprintScheduleSimpleItem)simpleSchedule;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCustomScheduleItems:(id)a3;
- (void)setSimpleSchedule:(id)a3;
@end

@implementation STBlueprintScheduleRepresentation

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(STBlueprintScheduleSimpleItem *)self->_simpleSchedule copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_customScheduleItems copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
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