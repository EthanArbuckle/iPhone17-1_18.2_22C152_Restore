@interface NSDate(TVPlaybackAdditions)
+ (BOOL)tvp_networkTimeIsApproximatelyCorrect;
+ (id)tvp_dateWithMillisecondsSince1970:()TVPlaybackAdditions;
- (BOOL)_isEqualToDateIgnoringTime:()TVPlaybackAdditions;
- (id)tvp_dateByAddingDays:()TVPlaybackAdditions;
- (id)tvp_dateCeiledToNearestMinute:()TVPlaybackAdditions;
- (id)tvp_dateFlooredToNearestMinute:()TVPlaybackAdditions;
- (uint64_t)tvp_dateBySubtractingDays:()TVPlaybackAdditions;
- (uint64_t)tvp_isToday;
- (uint64_t)tvp_isTomorrow;
- (uint64_t)tvp_isYesterday;
@end

@implementation NSDate(TVPlaybackAdditions)

+ (BOOL)tvp_networkTimeIsApproximatelyCorrect
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return v0 >= 465771728.0;
}

+ (id)tvp_dateWithMillisecondsSince1970:()TVPlaybackAdditions
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    v5 = objc_msgSend([a1 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue") / 1000.0);
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)tvp_dateFlooredToNearestMinute:()TVPlaybackAdditions
{
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 components:32960 fromDate:a1];
  uint64_t v7 = [v6 minute];
  int v8 = v7;
  uint64_t v9 = v7 / a3;
  id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v10 setMinute:(int)v9 * a3 - v8];
  objc_msgSend(v10, "setSecond:", -objc_msgSend(v6, "second"));
  objc_msgSend(v10, "setNanosecond:", -objc_msgSend(v6, "nanosecond"));
  v11 = [v5 dateByAddingComponents:v10 toDate:a1 options:0];

  return v11;
}

- (id)tvp_dateCeiledToNearestMinute:()TVPlaybackAdditions
{
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 components:32960 fromDate:a1];
  uint64_t v7 = [v6 minute];
  uint64_t v8 = [v6 second];
  uint64_t v9 = [v6 nanosecond];
  id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
  v11 = v10;
  if (v7 % a3) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v8 <= 0;
  }
  if (!v12 || !v8 && v9 >= 1) {
    [v10 setMinute:a3 + a3 * (v7 / a3) - v7];
  }
  [v11 setSecond:-v8];
  [v11 setNanosecond:-v9];
  v13 = [v5 dateByAddingComponents:v11 toDate:a1 options:0];

  return v13;
}

- (id)tvp_dateByAddingDays:()TVPlaybackAdditions
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setDay:a3];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 dateByAddingComponents:v5 toDate:a1 options:0];

  return v7;
}

- (uint64_t)tvp_dateBySubtractingDays:()TVPlaybackAdditions
{
  return objc_msgSend(a1, "tvp_dateByAddingDays:", -a3);
}

- (uint64_t)tvp_isToday
{
  v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = [a1 _isEqualToDateIgnoringTime:v2];

  return v3;
}

- (uint64_t)tvp_isTomorrow
{
  v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = objc_msgSend(v2, "tvp_dateByAddingDays:", 1);
  uint64_t v4 = [a1 _isEqualToDateIgnoringTime:v3];

  return v4;
}

- (uint64_t)tvp_isYesterday
{
  v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = objc_msgSend(v2, "tvp_dateBySubtractingDays:", 1);
  uint64_t v4 = [a1 _isEqualToDateIgnoringTime:v3];

  return v4;
}

- (BOOL)_isEqualToDateIgnoringTime:()TVPlaybackAdditions
{
  uint64_t v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 components:28 fromDate:a1];
  uint64_t v8 = [v6 components:28 fromDate:v5];

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

@end