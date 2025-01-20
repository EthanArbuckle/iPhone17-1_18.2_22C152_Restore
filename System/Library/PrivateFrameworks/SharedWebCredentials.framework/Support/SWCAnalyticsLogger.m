@interface SWCAnalyticsLogger
+ (id)sharedLogger;
- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4;
@end

@implementation SWCAnalyticsLogger

+ (id)sharedLogger
{
  if (qword_1000328A8 != -1) {
    dispatch_once(&qword_1000328A8, &stru_10002CB10);
  }
  v2 = (void *)qword_1000328B0;
  return v2;
}

- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4
{
}

@end