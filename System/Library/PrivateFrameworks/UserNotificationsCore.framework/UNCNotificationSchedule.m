@interface UNCNotificationSchedule
- (BOOL)isEqual:(id)a3;
- (NSDate)previousTriggerDate;
- (UNCNotificationSchedule)initWithDictionaryRepresentation:(id)a3;
- (id)_dateFormatter;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPreviousTriggerDate:(id)a3;
@end

@implementation UNCNotificationSchedule

- (id)_dateFormatter
{
  if (_dateFormatter___once_1 != -1) {
    dispatch_once(&_dateFormatter___once_1, &__block_literal_global_20);
  }
  v2 = (void *)_dateFormatter___dateFormatter_1;

  return v2;
}

uint64_t __41__UNCNotificationSchedule__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter___dateFormatter_1;
  _dateFormatter___dateFormatter_1 = (uint64_t)v0;

  v2 = (void *)_dateFormatter___dateFormatter_1;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss'.'SSS Z"];
}

- (UNCNotificationSchedule)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNCNotificationSchedule;
  v5 = [(UNCNotificationSchedule *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"PreviousTriggerDate"];
    [(UNCNotificationSchedule *)v5 setPreviousTriggerDate:v6];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCNotificationSchedule *)self previousTriggerDate];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, @"PreviousTriggerDate");

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCNotificationSchedule *)self _dateFormatter];
  v5 = [(UNCNotificationSchedule *)self previousTriggerDate];
  v6 = [v4 stringFromDate:v5];
  id v7 = (id)[v3 appendObject:v6 withName:@"PreviousTriggerDate"];

  objc_super v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v7 = [(UNCNotificationSchedule *)self previousTriggerDate];
    objc_super v8 = [v4 previousTriggerDate];
    char v6 = UNEqualObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNCNotificationSchedule *)self previousTriggerDate];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (NSDate)previousTriggerDate
{
  return self->_previousTriggerDate;
}

- (void)setPreviousTriggerDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end