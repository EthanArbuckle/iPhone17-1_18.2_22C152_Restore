@interface NSDate(BusinessHourExtras)
- (BOOL)isWholeHour;
@end

@implementation NSDate(BusinessHourExtras)

- (BOOL)isWholeHour
{
  [a1 timeIntervalSinceReferenceDate];
  return fmod(v1, 3600.0) == 0.0;
}

@end