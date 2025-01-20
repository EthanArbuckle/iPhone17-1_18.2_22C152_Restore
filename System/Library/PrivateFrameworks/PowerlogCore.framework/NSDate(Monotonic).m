@interface NSDate(Monotonic)
+ (BOOL)dateIsMidnightLocalTime:()Monotonic;
+ (__CFString)filenameDateStringWithStartDate:()Monotonic endDate:;
+ (id)defaultDateFormatter;
+ (id)monotonicDate;
+ (id)monotonicDateWithTimeIntervalSinceNow:()Monotonic;
+ (id)nearestMidnightAfterDate:()Monotonic;
+ (id)nearestMidnightBeforeDate:()Monotonic;
- (BOOL)isInMonotonicFuture;
- (BOOL)isInMonotonicFutureWithDistance:()Monotonic;
- (BOOL)isInMonotonicPastWithDistance:()Monotonic;
- (double)timeIntervalSinceMonitonicNow;
- (id)convertFromBasebandToMonotonic;
- (id)convertFromMonotonicToBaseband;
- (id)convertFromMonotonicToSystem;
- (id)convertFromSystemToMonotonic;
@end

@implementation NSDate(Monotonic)

- (id)convertFromMonotonicToSystem
{
  v2 = +[PLTimeManager sharedInstance];
  v3 = [v2 convertTime:a1 fromTimeReference:0 toTimeReference:1];

  return v3;
}

- (id)convertFromSystemToMonotonic
{
  v2 = +[PLTimeManager sharedInstance];
  v3 = [v2 convertTime:a1 fromTimeReference:1 toTimeReference:0];

  return v3;
}

- (id)convertFromBasebandToMonotonic
{
  v2 = +[PLTimeManager sharedInstance];
  v3 = [v2 convertTime:a1 fromTimeReference:3 toTimeReference:0];

  return v3;
}

- (BOOL)isInMonotonicFutureWithDistance:()Monotonic
{
  v4 = [(id)objc_opt_class() monotonicDate];
  [a1 timeIntervalSinceDate:v4];
  BOOL v6 = v5 > fabs(a2);

  return v6;
}

- (BOOL)isInMonotonicPastWithDistance:()Monotonic
{
  v4 = [(id)objc_opt_class() monotonicDate];
  [a1 timeIntervalSinceDate:v4];
  BOOL v6 = v5 < -fabs(a2);

  return v6;
}

- (double)timeIntervalSinceMonitonicNow
{
  v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [a1 timeIntervalSinceDate:v2];
  double v4 = v3;

  return v4;
}

+ (id)monotonicDate
{
  v0 = +[PLTimeManager sharedInstance];
  v1 = [v0 currentTimeFromTimeReference:2 toTimeReference:0];

  return v1;
}

+ (id)monotonicDateWithTimeIntervalSinceNow:()Monotonic
{
  v2 = [(id)objc_opt_class() monotonicDate];
  double v3 = [v2 dateByAddingTimeInterval:a1];

  return v3;
}

- (id)convertFromMonotonicToBaseband
{
  v2 = +[PLTimeManager sharedInstance];
  double v3 = [v2 convertTime:a1 fromTimeReference:0 toTimeReference:3];

  return v3;
}

- (BOOL)isInMonotonicFuture
{
  v2 = [(id)objc_opt_class() monotonicDate];
  [a1 timeIntervalSinceDate:v2];
  BOOL v4 = v3 > 60.0;

  return v4;
}

+ (BOOL)dateIsMidnightLocalTime:()Monotonic
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [(id)objc_opt_class() nearestMidnightBeforeDate:v3];
    double v5 = [(id)objc_opt_class() nearestMidnightAfterDate:v3];
    [v4 timeIntervalSinceDate:v3];
    if (fabs(v6) >= 600.0)
    {
      [v5 timeIntervalSinceDate:v3];
      BOOL v7 = fabs(v8) < 600.0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)nearestMidnightBeforeDate:()Monotonic
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  double v6 = [v5 components:28 fromDate:v4];

  BOOL v7 = [v5 dateFromComponents:v6];

  return v7;
}

+ (id)nearestMidnightAfterDate:()Monotonic
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  double v6 = objc_opt_new();
  [v6 setHour:0];
  [v6 setMinute:0];
  [v6 setSecond:0];
  BOOL v7 = [v5 nextDateAfterDate:v4 matchingComponents:v6 options:2];

  return v7;
}

+ (__CFString)filenameDateStringWithStartDate:()Monotonic endDate:
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  double v8 = &stru_1F15208F0;
  if (v5 && v6)
  {
    v9 = [(id)objc_opt_class() nearestMidnightAfterDate:v5];
    [v9 timeIntervalSinceDate:v5];
    if (v10 < 600.0)
    {
      id v11 = v9;

      id v5 = v11;
    }
    v12 = [(id)objc_opt_class() nearestMidnightAfterDate:v7];
    [v12 timeIntervalSinceDate:v7];
    if (v13 < 600.0)
    {
      id v14 = v12;

      BOOL v7 = v14;
    }
    v15 = [(id)objc_opt_class() defaultDateFormatter];
    v16 = [v15 stringFromDate:v5];
    v17 = [v15 stringFromDate:v7];
    int v18 = [v17 isEqualToString:v16];
    if ([(id)objc_opt_class() dateIsMidnightLocalTime:v7])
    {
      [v7 timeIntervalSinceDate:v5];
      BOOL v20 = v19 <= 86400.0;
    }
    else
    {
      BOOL v20 = 0;
    }
    if ((v18 | v20) == 1) {
      [NSString stringWithFormat:@"%@", v16, v22];
    }
    else {
    double v8 = [NSString stringWithFormat:@"%@-%@", v16, v17];
    }
  }
  return v8;
}

+ (id)defaultDateFormatter
{
  if (defaultDateFormatter_onceToken != -1) {
    dispatch_once(&defaultDateFormatter_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)defaultDateFormatter_f;
  return v0;
}

@end