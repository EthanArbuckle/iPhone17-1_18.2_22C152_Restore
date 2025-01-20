@interface ATXSleepScheduleUtilities
+ (BOOL)isTime:(double)a3 betweenStartTime:(double)a4 endTime:(double)a5;
@end

@implementation ATXSleepScheduleUtilities

+ (BOOL)isTime:(double)a3 betweenStartTime:(double)a4 endTime:(double)a5
{
  BOOL v5 = a3 >= a4;
  if (a5 > a3) {
    BOOL v5 = 1;
  }
  BOOL v6 = a4 <= a3;
  if (a3 >= a5) {
    BOOL v6 = 0;
  }
  if (a4 < a5) {
    return v6;
  }
  else {
    return v5;
  }
}

@end