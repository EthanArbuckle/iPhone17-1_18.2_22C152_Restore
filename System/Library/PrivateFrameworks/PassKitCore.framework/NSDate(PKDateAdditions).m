@interface NSDate(PKDateAdditions)
+ (id)dateWithDaysFromNow:()PKDateAdditions;
+ (uint64_t)dateForTomorrow;
+ (uint64_t)dateForYesterday;
+ (uint64_t)dateWithDaysBeforeNow:()PKDateAdditions;
- (BOOL)isDateAtLeastNDays:()PKDateAdditions afterDate:;
- (BOOL)isDateEqualToDateIgnoringTime:()PKDateAdditions;
- (BOOL)isDateLessThanNDays:()PKDateAdditions afterDate:;
- (id)dateWithoutTime;
- (uint64_t)isToday;
- (uint64_t)isTomorrow;
- (uint64_t)isYesterday;
- (uint64_t)numberOfMonthsFromNow;
- (uint64_t)numberOfWeeksFromNow;
- (uint64_t)numberOfYearsFromNow;
@end

@implementation NSDate(PKDateAdditions)

+ (id)dateWithDaysFromNow:()PKDateAdditions
{
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:a3];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v4 dateByAddingComponents:v5 toDate:v6 options:0];

  return v7;
}

+ (uint64_t)dateWithDaysBeforeNow:()PKDateAdditions
{
  return [MEMORY[0x1E4F1C9C8] dateWithDaysFromNow:-a3];
}

+ (uint64_t)dateForTomorrow
{
  return [MEMORY[0x1E4F1C9C8] dateWithDaysFromNow:1];
}

+ (uint64_t)dateForYesterday
{
  return [MEMORY[0x1E4F1C9C8] dateWithDaysBeforeNow:1];
}

- (BOOL)isDateEqualToDateIgnoringTime:()PKDateAdditions
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  v7 = [v6 components:9980 fromDate:a1];
  v8 = [v6 components:9980 fromDate:v5];

  uint64_t v9 = [v7 year];
  if (v9 == [v8 year] && (uint64_t v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month")))
  {
    uint64_t v11 = [v7 day];
    BOOL v12 = v11 == [v8 day];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isDateAtLeastNDays:()PKDateAdditions afterDate:
{
  if (!a4) {
    return 0;
  }
  id v5 = [a4 dateByAddingTimeInterval:(double)a3 * 86400.0];
  BOOL v6 = [v5 compare:a1] != 1;

  return v6;
}

- (BOOL)isDateLessThanNDays:()PKDateAdditions afterDate:
{
  if (!a4) {
    return 0;
  }
  id v5 = [a4 dateByAddingTimeInterval:(double)a3 * 86400.0];
  BOOL v6 = [v5 compare:a1] != -1;

  return v6;
}

- (uint64_t)isToday
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [a1 isDateEqualToDateIgnoringTime:v2];

  return v3;
}

- (uint64_t)isTomorrow
{
  v2 = [MEMORY[0x1E4F1C9C8] dateForTomorrow];
  uint64_t v3 = [a1 isDateEqualToDateIgnoringTime:v2];

  return v3;
}

- (uint64_t)isYesterday
{
  v2 = [MEMORY[0x1E4F1C9C8] dateForYesterday];
  uint64_t v3 = [a1 isDateEqualToDateIgnoringTime:v2];

  return v3;
}

- (id)dateWithoutTime
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:9756 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

- (uint64_t)numberOfWeeksFromNow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v3 dateWithoutTime];
  id v5 = [a1 dateWithoutTime];
  BOOL v6 = [v2 components:0x2000 fromDate:v4 toDate:v5 options:0];

  uint64_t v7 = [v6 weekOfYear];
  return v7;
}

- (uint64_t)numberOfMonthsFromNow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v3 dateWithoutTime];
  id v5 = [a1 dateWithoutTime];
  BOOL v6 = [v2 components:8 fromDate:v4 toDate:v5 options:0];

  uint64_t v7 = [v6 month];
  return v7;
}

- (uint64_t)numberOfYearsFromNow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v3 dateWithoutTime];
  id v5 = [a1 dateWithoutTime];
  BOOL v6 = [v2 components:4 fromDate:v4 toDate:v5 options:0];

  uint64_t v7 = [v6 year];
  return v7;
}

@end