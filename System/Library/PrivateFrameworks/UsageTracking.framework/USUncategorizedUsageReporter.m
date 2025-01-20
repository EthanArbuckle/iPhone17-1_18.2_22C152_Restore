@interface USUncategorizedUsageReporter
+ (USUncategorizedUsageReporter)sharedReporter;
+ (void)startReporting;
- (NSBackgroundActivityScheduler)backgroundActivity;
- (USUncategorizedUsageReporter)init;
- (void)_startReporting;
@end

@implementation USUncategorizedUsageReporter

+ (USUncategorizedUsageReporter)sharedReporter
{
  if (qword_1000961C8[0] != -1) {
    dispatch_once(qword_1000961C8, &stru_10008A600);
  }
  v2 = (void *)qword_1000961C0;
  return (USUncategorizedUsageReporter *)v2;
}

- (USUncategorizedUsageReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)USUncategorizedUsageReporter;
  v2 = [(USUncategorizedUsageReporter *)&v6 init];
  v3 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.activity.uncategorized-web-usage"];
  backgroundActivity = v2->_backgroundActivity;
  v2->_backgroundActivity = v3;

  return v2;
}

+ (void)startReporting
{
  id v2 = [a1 sharedReporter];
  [v2 _startReporting];
}

- (void)_startReporting
{
  id v2 = [(USUncategorizedUsageReporter *)self backgroundActivity];
  [v2 setPreregistered:1];
  [v2 scheduleWithBlock:&stru_10008A640];
}

- (NSBackgroundActivityScheduler)backgroundActivity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end