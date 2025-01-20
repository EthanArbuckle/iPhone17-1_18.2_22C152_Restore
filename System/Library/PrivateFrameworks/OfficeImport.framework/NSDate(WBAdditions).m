@interface NSDate(WBAdditions)
+ (id)tc_dateWithWordDate:()WBAdditions;
- (void)tc_copyToWordDate:()WBAdditions;
@end

@implementation NSDate(WBAdditions)

+ (id)tc_dateWithWordDate:()WBAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v4 setYear:a3[10] + 1900];
  [v4 setMonth:a3[9]];
  [v4 setDay:a3[8]];
  [v4 setHour:a3[7]];
  [v4 setMinute:a3[6]];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (void)tc_copyToWordDate:()WBAdditions
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = a1;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263EFF910]);
    [a1 timeIntervalSinceReferenceDate];
    id v5 = (id)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  }
  id v9 = v5;
  v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  v8 = [v7 components:638 fromDate:v9];

  *(_WORD *)(a3 + 12) = [v8 minute];
  *(_WORD *)(a3 + 14) = [v8 hour];
  *(_DWORD *)(a3 + 8) = [v8 weekday] - 1;
  *(_WORD *)(a3 + 16) = [v8 day];
  *(_WORD *)(a3 + 18) = [v8 month];
  *(_WORD *)(a3 + 20) = [v8 year] - 1900;
}

@end