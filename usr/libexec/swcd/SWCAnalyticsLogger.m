@interface SWCAnalyticsLogger
+ (id)sharedLogger;
- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4;
@end

@implementation SWCAnalyticsLogger

+ (id)sharedLogger
{
  if (qword_10003B268 != -1) {
    dispatch_once(&qword_10003B268, &stru_100034E08);
  }
  v2 = (void *)qword_10003B270;

  return v2;
}

- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4
{
}

@end