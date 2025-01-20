@interface VCDailyMetricSubmitter
+ (id)activityIdentifier;
- (VCDailyMetricSubmitter)initWithDatabaseProvider:(id)a3;
- (id)event;
@end

@implementation VCDailyMetricSubmitter

+ (id)activityIdentifier
{
  return @"com.apple.siriactionsd.ShortcutsDailyMetricCheckIn";
}

- (id)event
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB7288]);
  [v2 setKey:@"DailyStatus"];
  return v2;
}

- (VCDailyMetricSubmitter)initWithDatabaseProvider:(id)a3
{
  id v4 = a3;
  v5 = +[VCMetricCheckIn recentCheckInWithMode:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB7288]);
  v7 = [(VCMetricSubmitter *)self initWithCheckIn:v5 event:v6 databaseProvider:v4];

  return v7;
}

@end