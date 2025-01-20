@interface NSObject
+ (void)_accessibilityConvertDecimalDegreeToDMS:(double)a3 degreesPtr:(int64_t *)a4 minutesPtr:(int64_t *)a5 secondsPtr:(double *)a6;
@end

@implementation NSObject

+ (void)_accessibilityConvertDecimalDegreeToDMS:(double)a3 degreesPtr:(int64_t *)a4 minutesPtr:(int64_t *)a5 secondsPtr:(double *)a6
{
  if (a4)
  {
    int64_t v6 = (uint64_t)a3;
    if ((uint64_t)a3 < 0) {
      int64_t v6 = -v6;
    }
    *a4 = v6;
  }
  double v7 = fabs((a3 - (double)(uint64_t)a3) * 60.0);
  if (a5) {
    *a5 = (uint64_t)v7;
  }
  if (a6) {
    *a6 = (v7 - (double)(uint64_t)v7) * 60.0;
  }
}

@end