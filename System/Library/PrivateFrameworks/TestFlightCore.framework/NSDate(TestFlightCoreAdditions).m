@interface NSDate(TestFlightCoreAdditions)
- (id)tf_timeFromNow;
- (unint64_t)tf_posixTimestampInMilliseconds;
@end

@implementation NSDate(TestFlightCoreAdditions)

- (id)tf_timeFromNow
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  v4 = [v2 components:112 fromDate:v3 toDate:a1 options:0];

  return v4;
}

- (unint64_t)tf_posixTimestampInMilliseconds
{
  [a1 timeIntervalSince1970];
  return (unint64_t)(v1 * 1000.0);
}

@end