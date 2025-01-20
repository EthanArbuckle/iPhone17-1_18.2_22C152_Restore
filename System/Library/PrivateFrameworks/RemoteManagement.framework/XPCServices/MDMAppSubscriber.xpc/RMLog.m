@interface RMLog
+ (id)mDMAppStatus;
@end

@implementation RMLog

+ (id)mDMAppStatus
{
  if (qword_1000086E0 != -1) {
    dispatch_once(&qword_1000086E0, &stru_100004180);
  }
  v2 = (void *)qword_1000086D8;

  return v2;
}

@end