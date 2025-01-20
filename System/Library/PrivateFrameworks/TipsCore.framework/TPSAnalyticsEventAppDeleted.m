@interface TPSAnalyticsEventAppDeleted
+ (BOOL)supportsSecureCoding;
+ (id)event;
- (double)timeSinceLastNotification;
- (id)appLaunches;
- (id)desiredOutcomeTotal;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (id)notificationsPosted;
- (id)tipViewTotal;
@end

@implementation TPSAnalyticsEventAppDeleted

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"app_deleted"];
}

- (id)notificationsPosted
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSNotificationCount"];
}

- (id)appLaunches
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSAppLaunchCount"];
}

- (id)tipViewTotal
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSContentViews"];
}

- (id)desiredOutcomeTotal
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSDesiredOutcomes"];
}

- (double)timeSinceLastNotification
{
  v2 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSLastNotificationTime"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v2];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [(TPSAnalyticsEventAppDeleted *)self appLaunches];
  [v3 setObject:v4 forKeyedSubscript:@"launches_count"];

  double v5 = [(TPSAnalyticsEventAppDeleted *)self tipViewTotal];
  [v3 setObject:v5 forKeyedSubscript:@"content_views"];

  v6 = [(TPSAnalyticsEventAppDeleted *)self desiredOutcomeTotal];
  [v3 setObject:v6 forKeyedSubscript:@"desired_outcome_count"];

  uint64_t v7 = [(TPSAnalyticsEventAppDeleted *)self notificationsPosted];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = &unk_1EED9AF90;
  }
  [v3 setObject:v9 forKeyedSubscript:@"notifications_count"];

  v10 = NSNumber;
  v11 = +[TPSCommonDefines sharedInstance];
  v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "daysSinceLastMajorVersionUpdate"));
  [v3 setObject:v12 forKeyedSubscript:@"time_since_os_install"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v13 forKeyedSubscript:@"u65_flag"];

  v14 = [(TPSAnalyticsEventAppDeleted *)self notificationsPosted];
  LODWORD(v11) = [v14 intValue];

  if ((int)v11 >= 1)
  {
    v15 = NSNumber;
    [(TPSAnalyticsEventAppDeleted *)self timeSinceLastNotification];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    [v3 setObject:v16 forKeyedSubscript:@"time_since_last_notification"];
  }
  return v3;
}

+ (id)event
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDate:0];
  return v2;
}

@end