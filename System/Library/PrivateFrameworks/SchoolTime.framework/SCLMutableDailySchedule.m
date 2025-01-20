@interface SCLMutableDailySchedule
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeScheduleForDay:(int64_t)a3;
- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(int64_t)a5;
@end

@implementation SCLMutableDailySchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SCLDailySchedule alloc];
  return [(SCLDailySchedule *)v4 initWithSchedule:self];
}

- (void)removeScheduleForDay:(int64_t)a3
{
  id v5 = [(SCLDailySchedule *)self dayMap];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 removeObjectForKey:v4];
}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(int64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  if ((unint64_t)(a5 - 8) > 0xFFFFFFFFFFFFFFF8)
  {
    v11 = objc_alloc_init(SCLMutableSimpleSchedule);
    [(SCLMutableSimpleSchedule *)v11 setStartTime:v15];
    [(SCLMutableSimpleSchedule *)v11 setEndTime:v8];
    [(SCLMutableSimpleSchedule *)v11 setRepeatSchedule:SCLRepeatScheduleForDay(a5)];
    v12 = [(SCLDailySchedule *)self dayMap];
    v13 = (void *)[(SCLMutableSimpleSchedule *)v11 copy];
    v14 = [NSNumber numberWithInteger:a5];
    [v12 setObject:v13 forKey:v14];
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF578];
    v11 = [NSNumber numberWithInteger:a5];
    [v9 raise:v10, @"Day %@ must be between 1 and 7", v11 format];
  }
}

@end