@interface NSDate(MSVAdditions)
- (BOOL)msv_isFuture;
- (BOOL)msv_isPast;
@end

@implementation NSDate(MSVAdditions)

- (BOOL)msv_isFuture
{
  [a1 timeIntervalSinceNow];
  return v1 > 0.0;
}

- (BOOL)msv_isPast
{
  [a1 timeIntervalSinceNow];
  return v1 <= 0.0;
}

@end