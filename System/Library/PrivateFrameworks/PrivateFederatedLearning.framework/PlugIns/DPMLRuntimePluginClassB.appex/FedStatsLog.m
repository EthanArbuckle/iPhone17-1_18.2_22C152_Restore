@interface FedStatsLog
+ (id)logger;
@end

@implementation FedStatsLog

+ (id)logger
{
  if (qword_10003DCC0 != -1) {
    dispatch_once(&qword_10003DCC0, &stru_100030630);
  }
  v2 = off_10003D9E8;
  return v2;
}

@end