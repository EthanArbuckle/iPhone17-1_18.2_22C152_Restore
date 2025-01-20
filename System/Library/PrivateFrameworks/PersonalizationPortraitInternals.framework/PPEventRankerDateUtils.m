@interface PPEventRankerDateUtils
+ (double)secondsFromMidnight:(id)a3;
+ (id)dateTwoWeeksPriorToDate:(id)a3;
@end

@implementation PPEventRankerDateUtils

+ (id)dateTwoWeeksPriorToDate:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1CB79D060]();
  v5 = [v3 dateByAddingTimeInterval:-1209600.0];

  return v5;
}

+ (double)secondsFromMidnight:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [v5 components:224 fromDate:v4];

  uint64_t v7 = 3600 * [v6 hour];
  uint64_t v8 = v7 + 60 * [v6 minute];
  double v9 = (double)(v8 + [v6 second]);

  return v9;
}

@end