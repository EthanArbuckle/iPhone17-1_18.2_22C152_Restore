@interface RMLog
+ (id)batteryHealthLog;
@end

@implementation RMLog

+ (id)batteryHealthLog
{
  if (qword_100008668 != -1) {
    dispatch_once(&qword_100008668, &stru_100004140);
  }
  v2 = (void *)qword_100008660;

  return v2;
}

@end