@interface SCLScheduleFormatterItem
- (NSArray)timeIntervals;
- (NSCalendar)calendar;
- (SCLScheduleFormatterItem)initWithCalendar:(id)a3 timeIntervals:(id)a4;
- (id)dayRanges;
- (int64_t)days;
- (int64_t)earliestWeekdayInCalendar;
- (void)addDay:(int64_t)a3;
@end

@implementation SCLScheduleFormatterItem

- (SCLScheduleFormatterItem)initWithCalendar:(id)a3 timeIntervals:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLScheduleFormatterItem;
  v9 = [(SCLScheduleFormatterItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_timeIntervals, a4);
    v10->_days = 0;
  }

  return v10;
}

- (void)addDay:(int64_t)a3
{
  self->_days |= SCLRepeatScheduleForDay(a3);
}

- (int64_t)days
{
  return self->_days;
}

- (int64_t)earliestWeekdayInCalendar
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  v3 = [(SCLScheduleFormatterItem *)self calendar];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SCLScheduleFormatterItem_earliestWeekdayInCalendar__block_invoke;
  v6[3] = &unk_2648AC488;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "SCL_enumerateWeekdaysUsingBlock:", v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __53__SCLScheduleFormatterItem_earliestWeekdayInCalendar__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL result = SCLRepeatScheduleContainsDay(*(void *)(*(void *)(a1 + 32) + 8), a2);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (id)dayRanges
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(SCLScheduleFormatterItem *)self calendar];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__SCLScheduleFormatterItem_dayRanges__block_invoke;
  v12[3] = &unk_2648AC438;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  id v14 = v7;
  objc_msgSend(v5, "SCL_enumerateWeekdaysUsingBlock:", v12);

  if ([v6 count])
  {
    id v8 = (void *)[v6 copy];
    [v7 addObject:v8];
  }
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __37__SCLScheduleFormatterItem_dayRanges__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = SCLRepeatScheduleContainsDay(*(void *)(*(void *)(a1 + 32) + 8), a2);
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    id v9 = [NSNumber numberWithInteger:a2];
    [v5 addObject:v9];
  }
  else if ([*(id *)(a1 + 40) count])
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = (void *)[*(id *)(a1 + 40) copy];
    [v6 addObject:v7];

    id v8 = *(void **)(a1 + 40);
    [v8 removeAllObjects];
  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeIntervals, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end