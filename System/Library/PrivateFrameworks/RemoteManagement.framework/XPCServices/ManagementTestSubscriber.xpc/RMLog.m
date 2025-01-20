@interface RMLog
+ (id)managementTestAdapter;
+ (id)managementTestStatus;
@end

@implementation RMLog

+ (id)managementTestAdapter
{
  if (qword_10000CF20 != -1) {
    dispatch_once(&qword_10000CF20, &stru_1000082C0);
  }
  v2 = (void *)qword_10000CF18;

  return v2;
}

+ (id)managementTestStatus
{
  if (qword_10000CF30 != -1) {
    dispatch_once(&qword_10000CF30, &stru_100008330);
  }
  v2 = (void *)qword_10000CF28;

  return v2;
}

@end