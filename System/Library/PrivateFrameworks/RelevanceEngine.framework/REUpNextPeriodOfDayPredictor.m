@interface REUpNextPeriodOfDayPredictor
- (NSDateInterval)intervalForCurrentPeriodOfDay;
- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3;
- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3;
- (unint64_t)currentPeriodOfDay;
@end

@implementation REUpNextPeriodOfDayPredictor

- (unint64_t)currentPeriodOfDay
{
  return 0;
}

- (NSDateInterval)intervalForCurrentPeriodOfDay
{
  id v2 = objc_alloc(MEMORY[0x263F08798]);
  v3 = [MEMORY[0x263EFF910] date];
  v4 = (void *)[v2 initWithStartDate:v3 duration:0.0];

  return (NSDateInterval *)v4;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3
{
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  v4 = [MEMORY[0x263EFF910] date];
  v5 = (void *)[v3 initWithStartDate:v4 duration:0.0];

  return v5;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3
{
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  v4 = [MEMORY[0x263EFF910] date];
  v5 = (void *)[v3 initWithStartDate:v4 duration:0.0];

  return v5;
}

@end