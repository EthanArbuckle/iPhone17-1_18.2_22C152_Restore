@interface NSDate
+ (id)dateFormatter;
+ (id)dayNameFormatterInEnglish;
+ (id)firstSaturdayBeforeReferenceDate:(id)a3;
+ (id)monthDayFormatter;
+ (id)relativeBundleDateFormatter;
- (BOOL)betweenDate:(id)a3 andDate:(id)a4;
- (BOOL)isAfterDate:(id)a3;
- (BOOL)isBeforeDate:(id)a3;
- (BOOL)isFollowingDayAfterDate:(id)a3;
- (BOOL)isFollowingMonthAfterDate:(id)a3;
- (BOOL)isFollowingWeekAfterDate:(id)a3;
- (BOOL)isFollowingYearAfterDate:(id)a3;
- (BOOL)isOnOrAfter:(id)a3;
- (BOOL)isOnOrBefore:(id)a3;
- (BOOL)isSameDayWithDate:(id)a3;
- (BOOL)isSameDayWithDate:(id)a3 timeZone:(id)a4;
- (BOOL)isSameMonthWithDate:(id)a3;
- (BOOL)isSameWeekWithDate:(id)a3;
- (BOOL)isSameYearWithDate:(id)a3;
- (id)getBundleRelativeDate;
- (id)snapToTheDay;
- (id)startOfDay;
- (id)startOfDayWithBoundaryOfADay:(double)a3;
- (id)stringFromDate;
- (unint64_t)hours;
- (unint64_t)minutes;
@end

@implementation NSDate

- (id)stringFromDate
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  v5 = +[NSDate dateFormatter];
  v6 = [v5 stringFromDate:self];
  v7 = +[NSString stringWithFormat:@"%f (%@)", v4, v6];

  return v7;
}

- (BOOL)betweenDate:(id)a3 andDate:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    [a3 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [(NSDate *)self timeIntervalSinceReferenceDate];
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

- (BOOL)isBeforeDate:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)isOnOrBefore:(id)a3
{
  return (id)[(NSDate *)self compare:a3] != (id)1;
}

- (BOOL)isAfterDate:(id)a3
{
  return (id)[(NSDate *)self compare:a3] == (id)1;
}

- (BOOL)isOnOrAfter:(id)a3
{
  return [(NSDate *)self compare:a3] != NSOrderedAscending;
}

- (id)snapToTheDay
{
  uint64_t v3 = +[NSCalendar currentCalendar];
  uint64_t v4 = [v3 components:60 fromDate:self];

  if ((uint64_t)[v4 hour] > 2)
  {
    id v7 = self;
  }
  else
  {
    [v4 setHour:0];
    v5 = +[NSCalendar currentCalendar];
    v6 = [v5 dateFromComponents:v4];

    id v7 = [v6 dateByAddingTimeInterval:-1.0];
  }

  return v7;
}

- (BOOL)isSameDayWithDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  double v9 = v8;
  if (v7) {
    [v8 setTimeZone:v7];
  }
  unsigned __int8 v10 = [v9 isDate:self inSameDayAsDate:v6];

  return v10;
}

- (BOOL)isSameDayWithDate:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self inSameDayAsDate:v4];

  return (char)self;
}

- (BOOL)isFollowingDayAfterDate:(id)a3
{
  id v4 = [a3 dateByAddingTimeInterval:86400.0];
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self inSameDayAsDate:v4];

  return (char)self;
}

- (BOOL)isSameWeekWithDate:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self equalToDate:v4 toUnitGranularity:0x2000];

  return (char)self;
}

- (BOOL)isFollowingWeekAfterDate:(id)a3
{
  id v4 = [a3 dateByAddingTimeInterval:604800.0];
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self equalToDate:v4 toUnitGranularity:0x2000];

  return (char)self;
}

- (BOOL)isSameMonthWithDate:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self equalToDate:v4 toUnitGranularity:8];

  return (char)self;
}

- (BOOL)isFollowingMonthAfterDate:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 components:12 fromDate:self];

  id v7 = +[NSCalendar currentCalendar];
  id v8 = [v7 components:12 fromDate:v4];

  id v9 = [v6 month];
  unsigned __int8 v10 = (char *)[v6 year];
  if (v9 != (id)1)
  {
    if (v10 == [v8 year])
    {
      double v11 = (char *)[v6 month] - 1;
      uint64_t v12 = (uint64_t)[v8 month];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  if (v10 - 1 != [v8 year]) {
    goto LABEL_7;
  }
  double v11 = (char *)[v8 month];
  uint64_t v12 = 1;
LABEL_6:
  BOOL v13 = v11 == (char *)v12;
LABEL_8:

  return v13;
}

- (BOOL)isSameYearWithDate:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self equalToDate:v4 toUnitGranularity:4];

  return (char)self;
}

- (BOOL)isFollowingYearAfterDate:(id)a3
{
  id v4 = [a3 dateByAddingTimeInterval:31536000.0];
  v5 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v5 isDate:self equalToDate:v4 toUnitGranularity:4];

  return (char)self;
}

- (id)startOfDay
{
  uint64_t v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 components:28 fromDate:self];

  v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)startOfDayWithBoundaryOfADay:(double)a3
{
  id v4 = [(NSDate *)self dateByAddingTimeInterval:-a3];
  v5 = [v4 startOfDay];
  id v6 = [v5 dateByAddingTimeInterval:a3];

  return v6;
}

- (unint64_t)hours
{
  uint64_t v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 component:32 fromDate:self];

  return (unint64_t)v4;
}

- (unint64_t)minutes
{
  uint64_t v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 component:64 fromDate:self];

  return (unint64_t)v4;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)dateFormatter_dateFormatter;

  return v2;
}

void __37__NSDate_MOExtensions__dateFormatter__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = v1;

  uint64_t v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)dateFormatter_dateFormatter setLocale:v3];

  [(id)dateFormatter_dateFormatter setDateStyle:1];
  id v4 = (void *)dateFormatter_dateFormatter;

  [v4 setTimeStyle:3];
}

+ (id)firstSaturdayBeforeReferenceDate:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_9;
  }
  id v4 = +[NSDate distantPast];
  unsigned int v5 = [v3 isEqualToDate:v4];

  if (v5)
  {
    uint64_t v6 = +[NSDate distantPast];
LABEL_7:
    id v7 = (void *)v6;
    goto LABEL_9;
  }
  id v8 = +[NSDate distantFuture];
  unsigned int v9 = [v3 isEqualToDate:v8];

  if (v9)
  {
    uint64_t v6 = +[NSDate distantFuture];
    goto LABEL_7;
  }
  unsigned __int8 v10 = +[NSCalendar currentCalendar];
  double v11 = [v10 components:512 fromDate:v3];
  uint64_t v12 = (uint64_t)[v11 weekday];
  id v13 = objc_alloc_init((Class)NSDateComponents);
  [v13 setDay:7 * (v12 / 7) - v12];
  BOOL v14 = [v10 dateByAddingComponents:v13 toDate:v3 options:0];
  BOOL v15 = [v10 components:28 fromDate:v14];
  [v15 setHour:0];
  [v15 setMinute:0];
  [v15 setSecond:0];
  id v7 = [v10 dateFromComponents:v15];

LABEL_9:

  return v7;
}

+ (id)dayNameFormatterInEnglish
{
  if (dayNameFormatterInEnglish_onceToken != -1) {
    dispatch_once(&dayNameFormatterInEnglish_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)dayNameFormatterInEnglish_dateFormatter;

  return v2;
}

void __49__NSDate_MOExtensions__dayNameFormatterInEnglish__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)dayNameFormatterInEnglish_dateFormatter;
  dayNameFormatterInEnglish_dateFormatter = v1;

  [(id)dayNameFormatterInEnglish_dateFormatter setDateFormat:@"EEEE"];
  id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [(id)dayNameFormatterInEnglish_dateFormatter setLocale:v3];
}

+ (id)relativeBundleDateFormatter
{
  if (relativeBundleDateFormatter_onceToken != -1) {
    dispatch_once(&relativeBundleDateFormatter_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)relativeBundleDateFormatter_dateFormatter;

  return v2;
}

void __51__NSDate_MOExtensions__relativeBundleDateFormatter__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)relativeBundleDateFormatter_dateFormatter;
  relativeBundleDateFormatter_dateFormatter = v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)relativeBundleDateFormatter_dateFormatter setLocale:v3];

  [(id)relativeBundleDateFormatter_dateFormatter setTimeStyle:0];
  [(id)relativeBundleDateFormatter_dateFormatter setDateStyle:4];
  [(id)relativeBundleDateFormatter_dateFormatter setDoesRelativeDateFormatting:1];
  id v4 = (void *)relativeBundleDateFormatter_dateFormatter;

  [v4 setFormattingContext:5];
}

+ (id)monthDayFormatter
{
  if (monthDayFormatter_onceToken != -1) {
    dispatch_once(&monthDayFormatter_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)monthDayFormatter_dateFormatter;

  return v2;
}

void __41__NSDate_MOExtensions__monthDayFormatter__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)monthDayFormatter_dateFormatter;
  monthDayFormatter_dateFormatter = v1;

  id v3 = +[NSLocale currentLocale];
  id v4 = +[NSDateFormatter dateFormatFromTemplate:@"MM/dd" options:0 locale:v3];

  [(id)monthDayFormatter_dateFormatter setDateFormat:v4];
}

- (id)getBundleRelativeDate
{
  id v3 = +[NSDate dayNameFormatterInEnglish];
  id v4 = [v3 stringFromDate:self];

  unsigned int v5 = +[NSDate dayNameFormatterInEnglish];
  uint64_t v6 = +[NSDate now];
  id v7 = [v5 stringFromDate:v6];

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bundleDay: %@, nowDay: %@", (uint8_t *)&v14, 0x16u);
  }

  [(NSDate *)self timeIntervalSinceNow];
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 > 604800.0 || v4 == v7)
  {
    double v11 = +[NSDate monthDayFormatter];
    id v12 = [v11 stringFromDate:self];
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

@end