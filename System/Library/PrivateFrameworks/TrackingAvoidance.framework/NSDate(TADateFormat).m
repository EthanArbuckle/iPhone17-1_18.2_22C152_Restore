@interface NSDate(TADateFormat)
- (__CFString)getDateString;
- (id)getNextDateAtHour:()TADateFormat;
- (uint64_t)getMinutesSinceStartOfDay;
@end

@implementation NSDate(TADateFormat)

- (__CFString)getDateString
{
  if (a1)
  {
    if (getDateString_onceTokenForDateFormatter != -1) {
      dispatch_once(&getDateString_onceTokenForDateFormatter, &__block_literal_global_1);
    }
    id v2 = (id)gTADateFormatDateFormatter;
    objc_sync_enter(v2);
    v3 = [(id)gTADateFormatDateFormatter stringFromDate:a1];
    objc_sync_exit(v2);
  }
  else
  {
    v3 = @"-";
  }
  return v3;
}

- (id)getNextDateAtHour:()TADateFormat
{
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 nextDateAfterDate:a1 matchingHour:a3 minute:0 second:0 options:512];

  return v6;
}

- (uint64_t)getMinutesSinceStartOfDay
{
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  [a1 timeIntervalSinceDate:v3];
  uint64_t v5 = (uint64_t)v4 / 60;

  return v5;
}

@end