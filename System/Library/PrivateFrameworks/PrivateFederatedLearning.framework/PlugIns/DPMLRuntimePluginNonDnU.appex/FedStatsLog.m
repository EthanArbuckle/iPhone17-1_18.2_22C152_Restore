@interface FedStatsLog
+ (id)logger;
@end

@implementation FedStatsLog

+ (id)logger
{
  if (qword_10003DCC8 != -1) {
    dispatch_once(&qword_10003DCC8, &stru_100030638);
  }
  v2 = off_10003D9F0;
  return v2;
}

@end