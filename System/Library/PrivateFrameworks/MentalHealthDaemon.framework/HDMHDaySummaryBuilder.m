@interface HDMHDaySummaryBuilder
- (HDMHDaySummaryBuilder)initWithDayIndex:(int64_t)a3 gregorianCalendar:(id)a4;
- (NSCalendar)gregorianCalendar;
- (id)daySummary;
- (int64_t)dayIndex;
- (void)addStateOfMind:(id)a3;
@end

@implementation HDMHDaySummaryBuilder

- (HDMHDaySummaryBuilder)initWithDayIndex:(int64_t)a3 gregorianCalendar:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMHDaySummaryBuilder;
  v8 = [(HDMHDaySummaryBuilder *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_dayIndex = a3;
    objc_storeStrong((id *)&v8->_gregorianCalendar, a4);
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    momentaryStatesOfMind = v9->_momentaryStatesOfMind;
    v9->_momentaryStatesOfMind = (NSMutableArray *)v10;

    lastDailyStateOfMind = v9->_lastDailyStateOfMind;
    v9->_lastDailyStateOfMind = 0;
  }
  return v9;
}

- (void)addStateOfMind:(id)a3
{
  id v10 = a3;
  if ([v10 reflectiveInterval] == 2)
  {
    lastDailyStateOfMind = self->_lastDailyStateOfMind;
    p_lastDailyStateOfMind = &self->_lastDailyStateOfMind;
    if (!lastDailyStateOfMind
      || ([v10 startDate],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(HKStateOfMind *)*p_lastDailyStateOfMind startDate],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = objc_msgSend(v7, "hk_isAfterOrEqualToDate:", v8),
          v8,
          v7,
          v9))
    {
      objc_storeStrong((id *)p_lastDailyStateOfMind, a3);
    }
  }
  else
  {
    [(NSMutableArray *)self->_momentaryStatesOfMind addObject:v10];
  }
}

- (id)daySummary
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F55008]) initWithDayIndex:self->_dayIndex momentaryStatesOfMind:self->_momentaryStatesOfMind dailyStateOfMind:self->_lastDailyStateOfMind];
  return v2;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_lastDailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_momentaryStatesOfMind, 0);
}

@end