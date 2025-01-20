@interface SCLTimeIntervalModel
+ (SCLTimeInterval)defaultTimeInterval;
- (BOOL)canAppendTimeInterval;
- (BOOL)canRemoveTimeIntervals;
- (NSArray)constraintIntervals;
- (NSArray)timeIntervals;
- (NSCalendar)calendar;
- (NSDateInterval)canonicalDateInterval;
- (SCLTimeIntervalModel)init;
- (SCLTimeIntervalModel)initWithTimeIntervals:(id)a3;
- (id)canonicalDateIntervalForTimeInterval:(id)a3;
- (id)nextProposedTimeInterval;
- (id)scheduleTimeWithDate:(id)a3;
- (void)_recalculateCanAppend;
- (void)appendTimeInterval:(id)a3;
- (void)removeTimeIntervalAtIndex:(unint64_t)a3;
- (void)replaceTimeIntervalAtIndex:(unint64_t)a3 withTimeInterval:(id)a4;
- (void)setCanAppendTimeInterval:(BOOL)a3;
- (void)setTimeIntervals:(id)a3;
@end

@implementation SCLTimeIntervalModel

+ (SCLTimeInterval)defaultTimeInterval
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:8 minute:0];
  v3 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:15 minute:0];
  v4 = (void *)[objc_alloc(MEMORY[0x263F66FA0]) initWithStartTime:v2 endTime:v3];

  return (SCLTimeInterval *)v4;
}

- (SCLTimeIntervalModel)init
{
  return [(SCLTimeIntervalModel *)self initWithTimeIntervals:MEMORY[0x263EFFA68]];
}

- (SCLTimeIntervalModel)initWithTimeIntervals:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SCLTimeIntervalModel;
  v5 = [(SCLTimeIntervalModel *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(SCLTimeIntervalModel *)v5 setTimeIntervals:v4];
    uint64_t v7 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v7;

    v9 = v6->_calendar;
    v10 = [MEMORY[0x263EFFA18] defaultTimeZone];
    [(NSCalendar *)v9 setTimeZone:v10];

    v11 = v6->_calendar;
    v12 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(NSCalendar *)v11 setLocale:v12];

    v13 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:0 minute:0];
    v14 = (void *)[objc_alloc(MEMORY[0x263F66FA0]) initWithStartTime:v13 endTime:v13];
    uint64_t v15 = [(SCLTimeIntervalModel *)v6 canonicalDateIntervalForTimeInterval:v14];
    canonicalDateInterval = v6->_canonicalDateInterval;
    v6->_canonicalDateInterval = (NSDateInterval *)v15;

    [(SCLTimeIntervalModel *)v6 _recalculateCanAppend];
  }

  return v6;
}

- (void)setTimeIntervals:(id)a3
{
  id v6 = [a3 sortedArrayUsingComparator:&__block_literal_global];
  id v4 = (NSMutableArray *)[v6 mutableCopy];
  timeIntervals = self->_timeIntervals;
  self->_timeIntervals = v4;
}

uint64_t __41__SCLTimeIntervalModel_setTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 startTime];
  id v6 = [v4 startTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)timeIntervals
{
  v2 = (void *)[(NSMutableArray *)self->_timeIntervals copy];

  return (NSArray *)v2;
}

- (NSArray)constraintIntervals
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(SCLTimeIntervalModel *)self timeIntervals];
  if ([v4 count] == 1)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:0 minute:0];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F66FA0]) initWithStartTime:v5 endTime:v5];
    [v3 addObject:v6];
  }
  else
  {
    if ((unint64_t)[v4 count] < 2) {
      goto LABEL_6;
    }
    v5 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:0 minute:0];
    uint64_t v7 = [v4 count];
    id v8 = objc_alloc(MEMORY[0x263F66FA0]);
    v9 = [v4 objectAtIndexedSubscript:1];
    v10 = [v9 startTime];
    v11 = (void *)[v8 initWithStartTime:v5 endTime:v10];
    [v3 addObject:v11];

    uint64_t v12 = [v4 count];
    v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, v12 - 2);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __43__SCLTimeIntervalModel_constraintIntervals__block_invoke;
    v24 = &unk_2649FAA40;
    id v14 = v4;
    id v25 = v14;
    id v15 = v3;
    id v26 = v15;
    [v14 enumerateObjectsAtIndexes:v13 options:0 usingBlock:&v21];

    id v16 = objc_alloc(MEMORY[0x263F66FA0]);
    v17 = objc_msgSend(v14, "objectAtIndexedSubscript:", v7 - 2, v21, v22, v23, v24);
    objc_super v18 = [v17 endTime];
    v19 = (void *)[v16 initWithStartTime:v18 endTime:v5];
    [v15 addObject:v19];
  }
LABEL_6:

  return (NSArray *)v3;
}

void __43__SCLTimeIntervalModel_constraintIntervals__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
  id v10 = [v5 endTime];

  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  uint64_t v7 = [v6 startTime];

  id v8 = *(void **)(a1 + 40);
  v9 = (void *)[objc_alloc(MEMORY[0x263F66FA0]) initWithStartTime:v10 endTime:v7];
  [v8 addObject:v9];
}

- (id)canonicalDateIntervalForTimeInterval:(id)a3
{
  id v4 = a3;
  v5 = [v4 startTime];
  id v6 = [v4 endTime];
  uint64_t v7 = -[NSCalendar dateWithEra:year:month:day:hour:minute:second:nanosecond:](self->_calendar, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 2019, 1, 1, [v5 hour], objc_msgSend(v5, "minute"), 0, 0);
  if ([v5 isEqual:v6] & 1) != 0 || (objc_msgSend(v4, "crossesDayBoundary")) {
    goto LABEL_3;
  }
  v9 = [v4 endTime];
  if ([v9 hour])
  {
  }
  else
  {
    id v10 = [v4 endTime];
    uint64_t v11 = [v10 minute];

    if (!v11)
    {
LABEL_3:
      uint64_t v8 = 2;
      goto LABEL_8;
    }
  }
  uint64_t v8 = 1;
LABEL_8:
  uint64_t v12 = -[NSCalendar dateWithEra:year:month:day:hour:minute:second:nanosecond:](self->_calendar, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 2019, 1, v8, [v6 hour], objc_msgSend(v6, "minute"), 0, 0);
  v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v12];

  return v13;
}

- (id)scheduleTimeWithDate:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(NSCalendar *)self->_calendar getHour:&v7 minute:&v6 second:0 nanosecond:0 fromDate:a3];
  id v3 = objc_alloc(MEMORY[0x263F66F80]);
  id v4 = (void *)[v3 initWithHour:v7 minute:v6];

  return v4;
}

- (id)nextProposedTimeInterval
{
  v2 = [(NSMutableArray *)self->_timeIntervals lastObject];
  id v3 = v2;
  if (v2)
  {
    if ([v2 crossesDayBoundary])
    {
      id v4 = 0;
    }
    else
    {
      v5 = [v3 endTime];
      uint64_t v6 = [v5 hour];

      if ((unint64_t)(v6 + 1) > 0x17)
      {
        uint64_t v7 = [v3 endTime];
        id v8 = objc_alloc(MEMORY[0x263F66F80]);
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:v6 + 1 minute:0];
        id v8 = objc_alloc(MEMORY[0x263F66F80]);
        if ((unint64_t)(v6 + 2) >= 0x18) {
          uint64_t v9 = v6 - 22;
        }
        else {
          uint64_t v9 = v6 + 2;
        }
      }
      id v10 = (void *)[v8 initWithHour:v9 minute:0];
      id v4 = (void *)[objc_alloc(MEMORY[0x263F66FA0]) initWithStartTime:v7 endTime:v10];
    }
  }
  else
  {
    id v4 = [(id)objc_opt_class() defaultTimeInterval];
  }

  return v4;
}

- (BOOL)canRemoveTimeIntervals
{
  return (unint64_t)[(NSMutableArray *)self->_timeIntervals count] > 1;
}

- (void)removeTimeIntervalAtIndex:(unint64_t)a3
{
  if ([(SCLTimeIntervalModel *)self canRemoveTimeIntervals])
  {
    [(NSMutableArray *)self->_timeIntervals removeObjectAtIndex:a3];
    [(SCLTimeIntervalModel *)self _recalculateCanAppend];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    [v5 raise:v6 format:@"Cannot remove the last time interval from the interval mode."];
  }
}

- (void)appendTimeInterval:(id)a3
{
  id v9 = a3;
  id v4 = [(NSMutableArray *)self->_timeIntervals lastObject];
  v5 = v4;
  if (v4
    && ([v4 endTime],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v9 startTime],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v6 compare:v7],
        v7,
        v6,
        v8 == 1))
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Cannot append %@ because it starts before the end time of %@", v9, v5 format];
  }
  else
  {
    [(NSMutableArray *)self->_timeIntervals addObject:v9];
    [(SCLTimeIntervalModel *)self _recalculateCanAppend];
  }
}

- (void)replaceTimeIntervalAtIndex:(unint64_t)a3 withTimeInterval:(id)a4
{
  id v13 = a4;
  if (a3)
  {
    uint64_t v6 = [(NSMutableArray *)self->_timeIntervals objectAtIndex:a3 - 1];
    uint64_t v7 = [v6 endTime];
    uint64_t v8 = [v13 startTime];
    uint64_t v9 = [v7 compare:v8];

    if (v9 == 1)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Cannot append %@ because it starts before the end time of %@", v13, v6 format];
LABEL_8:

      goto LABEL_11;
    }
  }
  if (a3 + 2 < [(NSMutableArray *)self->_timeIntervals count])
  {
    uint64_t v6 = [(NSMutableArray *)self->_timeIntervals objectAtIndex:a3 + 1];
    id v10 = [v13 endTime];
    uint64_t v11 = [v6 startTime];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == 1)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Cannot append %@ because it ends after the start time time of %@", v13, v6 format];
      goto LABEL_8;
    }
  }
  [(NSMutableArray *)self->_timeIntervals replaceObjectAtIndex:a3 withObject:v13];
  [(SCLTimeIntervalModel *)self _recalculateCanAppend];
LABEL_11:
}

- (void)_recalculateCanAppend
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F66F80]) initWithHour:0 minute:0];
  id v3 = [(NSMutableArray *)self->_timeIntervals lastObject];
  id v4 = [v3 endTime];
  int v5 = [v4 isEqual:v6];

  [(SCLTimeIntervalModel *)self setCanAppendTimeInterval:v5 ^ 1u];
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDateInterval)canonicalDateInterval
{
  return self->_canonicalDateInterval;
}

- (BOOL)canAppendTimeInterval
{
  return self->_canAppendTimeInterval;
}

- (void)setCanAppendTimeInterval:(BOOL)a3
{
  self->_canAppendTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalDateInterval, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_timeIntervals, 0);
}

@end