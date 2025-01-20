@interface NSDate(RelativeDateKnowledge)
- (BOOL)ics_isTodayWithCalendar:()RelativeDateKnowledge;
@end

@implementation NSDate(RelativeDateKnowledge)

- (BOOL)ics_isTodayWithCalendar:()RelativeDateKnowledge
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [v5 components:30 fromDate:v6];

  v8 = [v5 components:30 fromDate:a1];

  uint64_t v9 = [v7 day];
  if (v9 == [v8 day]
    && (uint64_t v10 = [v7 month], v10 == objc_msgSend(v8, "month"))
    && (uint64_t v11 = [v7 year], v11 == objc_msgSend(v8, "year")))
  {
    uint64_t v12 = [v7 era];
    BOOL v13 = v12 == [v8 era];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end