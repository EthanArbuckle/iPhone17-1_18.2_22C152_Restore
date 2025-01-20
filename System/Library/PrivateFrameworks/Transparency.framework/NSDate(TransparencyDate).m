@interface NSDate(TransparencyDate)
+ (double)kt_currentTimeMs;
+ (uint64_t)kt_dateFromString:()TransparencyDate;
- (BOOL)kt_isEqualWithinOneMillisecond:()TransparencyDate;
- (id)kt_fuzzyDate;
- (id)kt_toISO_8601_UTCString;
- (uint64_t)kt_dateToString;
@end

@implementation NSDate(TransparencyDate)

+ (double)kt_currentTimeMs
{
  v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1 * 1000.0;

  return v2;
}

- (BOOL)kt_isEqualWithinOneMillisecond:()TransparencyDate
{
  id v4 = a3;
  if (a1 == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && a1 && v4)
    {
      [v4 timeIntervalSinceDate:a1];
      BOOL v5 = fabs(v6) * 1000.0 < 1.0;
    }
  }

  return v5;
}

- (uint64_t)kt_dateToString
{
  double v1 = NSString;
  [a1 timeIntervalSince1970];
  return objc_msgSend(v1, "stringWithFormat:", @"%f", v2);
}

+ (uint64_t)kt_dateFromString:()TransparencyDate
{
  v3 = (void *)MEMORY[0x263EFF910];
  [a3 doubleValue];

  return objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
}

- (id)kt_toISO_8601_UTCString
{
  id v2 = objc_alloc_init(MEMORY[0x263F088C0]);
  v3 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v3];

  id v4 = [v2 stringFromDate:a1];

  return v4;
}

- (id)kt_fuzzyDate
{
  if (kt_fuzzyDate_onceToken != -1) {
    dispatch_once(&kt_fuzzyDate_onceToken, &__block_literal_global_18);
  }
  id v2 = [(id)kt_fuzzyDate_zulu components:28 fromDate:a1];
  v3 = [(id)kt_fuzzyDate_zulu dateFromComponents:v2];

  return v3;
}

@end