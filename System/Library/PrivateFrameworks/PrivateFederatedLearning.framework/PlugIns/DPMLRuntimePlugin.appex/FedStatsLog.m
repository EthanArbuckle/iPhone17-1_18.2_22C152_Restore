@interface FedStatsLog
+ (id)logger;
@end

@implementation FedStatsLog

+ (id)logger
{
  if (qword_10003DCA0 != -1) {
    dispatch_once(&qword_10003DCA0, &stru_1000305B0);
  }
  v2 = off_10003DA48;
  return v2;
}

@end