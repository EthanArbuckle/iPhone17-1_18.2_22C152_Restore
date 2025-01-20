@interface SFAnalyticsReporter
- (BOOL)saveReport:(id)a3 fileName:(id)a4;
@end

@implementation SFAnalyticsReporter

- (BOOL)saveReport:(id)a3 fileName:(id)a4
{
  id v5 = a3;
  id v10 = a4;
  v11 = v5;
  id v6 = v5;
  id v7 = v10;
  char v8 = OSAWriteLogForSubmission();

  return v8;
}

@end