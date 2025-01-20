@interface NSDate(MOExtensions)
+ (id)dateFormatter;
+ (id)dayNameFormatterInEnglish;
+ (id)firstSaturdayBeforeReferenceDate:()MOExtensions;
+ (id)monthDayFormatter;
+ (id)relativeBundleDateFormatter;
- (BOOL)betweenDate:()MOExtensions andDate:;
- (BOOL)isAfterDate:()MOExtensions;
- (BOOL)isBeforeDate:()MOExtensions;
- (BOOL)isFollowingMonthAfterDate:()MOExtensions;
- (BOOL)isOnOrAfter:()MOExtensions;
- (BOOL)isOnOrBefore:()MOExtensions;
- (id)getBundleRelativeDate;
- (id)snapToTheDay;
- (id)startOfDay;
- (id)startOfDayWithBoundaryOfADay:()MOExtensions;
- (id)stringFromDate;
- (uint64_t)hours;
- (uint64_t)isFollowingDayAfterDate:()MOExtensions;
- (uint64_t)isFollowingWeekAfterDate:()MOExtensions;
- (uint64_t)isFollowingYearAfterDate:()MOExtensions;
- (uint64_t)isSameDayWithDate:()MOExtensions;
- (uint64_t)isSameDayWithDate:()MOExtensions timeZone:;
- (uint64_t)isSameMonthWithDate:()MOExtensions;
- (uint64_t)isSameWeekWithDate:()MOExtensions;
- (uint64_t)isSameYearWithDate:()MOExtensions;
- (uint64_t)minutes;
@end

@implementation NSDate(MOExtensions)

- (id)stringFromDate
{
  v2 = NSString;
  [a1 timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  v5 = [MEMORY[0x1E4F1C9C8] dateFormatter];
  v6 = [v5 stringFromDate:a1];
  v7 = [v2 stringWithFormat:@"%f (%@)", v4, v6];

  return v7;
}

- (BOOL)betweenDate:()MOExtensions andDate:
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    [a3 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [a1 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [v7 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v9 <= v13)
    {
      BOOL v14 = v9 <= v11;
      BOOL v15 = v11 > v13;
    }
    else
    {
      BOOL v14 = v13 <= v11;
      BOOL v15 = v11 > v9;
    }
    return !v15 && v14;
  }
  return result;
}

- (BOOL)isBeforeDate:()MOExtensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isOnOrBefore:()MOExtensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isAfterDate:()MOExtensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isOnOrAfter:()MOExtensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (id)snapToTheDay
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:60 fromDate:a1];

  if ([v3 hour] > 2)
  {
    id v6 = a1;
  }
  else
  {
    [v3 setHour:0];
    uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v5 = [v4 dateFromComponents:v3];

    id v6 = [v5 dateByAddingTimeInterval:-1.0];
  }
  return v6;
}

- (uint64_t)isSameDayWithDate:()MOExtensions timeZone:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  double v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  double v10 = v9;
  if (v7) {
    [v9 setTimeZone:v7];
  }
  uint64_t v11 = [v10 isDate:a1 inSameDayAsDate:v6];

  return v11;
}

- (uint64_t)isSameDayWithDate:()MOExtensions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 inSameDayAsDate:v5];

  return v7;
}

- (uint64_t)isFollowingDayAfterDate:()MOExtensions
{
  uint64_t v4 = [a3 dateByAddingTimeInterval:86400.0];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 isDate:a1 inSameDayAsDate:v4];

  return v6;
}

- (uint64_t)isSameWeekWithDate:()MOExtensions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 equalToDate:v5 toUnitGranularity:0x2000];

  return v7;
}

- (uint64_t)isFollowingWeekAfterDate:()MOExtensions
{
  uint64_t v4 = [a3 dateByAddingTimeInterval:604800.0];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 isDate:a1 equalToDate:v4 toUnitGranularity:0x2000];

  return v6;
}

- (uint64_t)isSameMonthWithDate:()MOExtensions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 equalToDate:v5 toUnitGranularity:8];

  return v7;
}

- (BOOL)isFollowingMonthAfterDate:()MOExtensions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 components:12 fromDate:a1];

  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [v8 components:12 fromDate:v5];

  uint64_t v10 = [v7 month];
  uint64_t v11 = [v7 year];
  if (v10 != 1)
  {
    if (v11 == [v9 year])
    {
      uint64_t v12 = [v7 month] - 1;
      uint64_t v13 = [v9 month];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  if (v11 - 1 != [v9 year]) {
    goto LABEL_7;
  }
  uint64_t v12 = [v9 month];
  uint64_t v13 = 1;
LABEL_6:
  BOOL v14 = v12 == v13;
LABEL_8:

  return v14;
}

- (uint64_t)isSameYearWithDate:()MOExtensions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 equalToDate:v5 toUnitGranularity:4];

  return v7;
}

- (uint64_t)isFollowingYearAfterDate:()MOExtensions
{
  uint64_t v4 = [a3 dateByAddingTimeInterval:31536000.0];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 isDate:a1 equalToDate:v4 toUnitGranularity:4];

  return v6;
}

- (id)startOfDay
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:28 fromDate:a1];

  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 dateFromComponents:v3];

  return v5;
}

- (id)startOfDayWithBoundaryOfADay:()MOExtensions
{
  uint64_t v3 = [a1 dateByAddingTimeInterval:-a2];
  uint64_t v4 = [v3 startOfDay];
  id v5 = [v4 dateByAddingTimeInterval:a2];

  return v5;
}

- (uint64_t)hours
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 component:32 fromDate:a1];

  return v3;
}

- (uint64_t)minutes
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 component:64 fromDate:a1];

  return v3;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)dateFormatter_dateFormatter;
  return v0;
}

+ (id)firstSaturdayBeforeReferenceDate:()MOExtensions
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v5 = [v3 isEqualToDate:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_7:
    uint64_t v7 = (void *)v6;
    goto LABEL_9;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v9 = [v3 isEqualToDate:v8];

  if (v9)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    goto LABEL_7;
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = [v10 components:512 fromDate:v3];
  uint64_t v12 = [v11 weekday];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v13 setDay:7 * (v12 / 7) - v12];
  BOOL v14 = [v10 dateByAddingComponents:v13 toDate:v3 options:0];
  BOOL v15 = [v10 components:28 fromDate:v14];
  [v15 setHour:0];
  [v15 setMinute:0];
  [v15 setSecond:0];
  uint64_t v7 = [v10 dateFromComponents:v15];

LABEL_9:
  return v7;
}

+ (id)dayNameFormatterInEnglish
{
  if (dayNameFormatterInEnglish_onceToken != -1) {
    dispatch_once(&dayNameFormatterInEnglish_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)dayNameFormatterInEnglish_dateFormatter;
  return v0;
}

+ (id)relativeBundleDateFormatter
{
  if (relativeBundleDateFormatter_onceToken != -1) {
    dispatch_once(&relativeBundleDateFormatter_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)relativeBundleDateFormatter_dateFormatter;
  return v0;
}

+ (id)monthDayFormatter
{
  if (monthDayFormatter_onceToken != -1) {
    dispatch_once(&monthDayFormatter_onceToken, &__block_literal_global_18_0);
  }
  v0 = (void *)monthDayFormatter_dateFormatter;
  return v0;
}

- (id)getBundleRelativeDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] dayNameFormatterInEnglish];
  id v3 = [v2 stringFromDate:a1];

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dayNameFormatterInEnglish];
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v4 stringFromDate:v5];

  uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    BOOL v14 = v3;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_INFO, "bundleDay: %@, nowDay: %@", (uint8_t *)&v13, 0x16u);
  }

  [a1 timeIntervalSinceNow];
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  if (v8 > 604800.0 || v3 == v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] monthDayFormatter];
    id v11 = [v10 stringFromDate:a1];
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

@end