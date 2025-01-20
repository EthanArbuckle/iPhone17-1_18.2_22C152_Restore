@interface NSCalendar(WorkflowKit)
- (id)wf_weekdays;
- (id)wf_weekendDays;
- (id)wf_workweekDays;
@end

@implementation NSCalendar(WorkflowKit)

- (id)wf_weekdays
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = [a1 weekdaySymbols];
  v4 = objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));

  v5 = [a1 weekdaySymbols];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 1;
    do
    {
      v8 = [NSNumber numberWithUnsignedInteger:v7];
      [v4 addObject:v8];

      ++v7;
      v9 = [a1 weekdaySymbols];
      unint64_t v10 = [v9 count];
    }
    while (v7 <= v10);
  }
  v11 = (void *)[v4 copy];

  return v11;
}

- (id)wf_workweekDays
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [a1 weekdaySymbols];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      if (([a1 isDateInWeekend:v3] & 1) == 0)
      {
        unint64_t v7 = [a1 components:512 fromDate:v3];
        uint64_t v8 = [v7 weekday];

        v9 = [NSNumber numberWithUnsignedInteger:v8];
        [v2 addObject:v9];
      }
      unint64_t v10 = [a1 dateByAddingUnit:16 value:1 toDate:v3 options:0];

      ++v6;
      v11 = [a1 weekdaySymbols];
      unint64_t v12 = [v11 count];

      v3 = v10;
    }
    while (v6 < v12);
  }
  else
  {
    unint64_t v10 = v3;
  }
  v13 = (void *)[v2 copy];

  return v13;
}

- (id)wf_weekendDays
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [a1 weekdaySymbols];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      if ([a1 isDateInWeekend:v3])
      {
        unint64_t v7 = [a1 components:512 fromDate:v3];
        uint64_t v8 = [v7 weekday];

        v9 = [NSNumber numberWithUnsignedInteger:v8];
        [v2 addObject:v9];
      }
      unint64_t v10 = [a1 dateByAddingUnit:16 value:1 toDate:v3 options:0];

      ++v6;
      v11 = [a1 weekdaySymbols];
      unint64_t v12 = [v11 count];

      v3 = v10;
    }
    while (v6 < v12);
  }
  else
  {
    unint64_t v10 = v3;
  }
  v13 = (void *)[v2 copy];

  return v13;
}

@end