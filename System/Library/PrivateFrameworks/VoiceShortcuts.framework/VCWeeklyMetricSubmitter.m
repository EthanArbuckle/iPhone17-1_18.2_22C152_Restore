@interface VCWeeklyMetricSubmitter
+ (id)activityIdentifier;
- (VCWeeklyMetricSubmitter)initWithDatabaseProvider:(id)a3;
- (id)event;
@end

@implementation VCWeeklyMetricSubmitter

+ (id)activityIdentifier
{
  return @"com.apple.siriactionsd.ShortcutsWeeklyMetricCheckIn";
}

- (id)event
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB7288]);
  [v2 setKey:@"WeeklyStatus"];
  return v2;
}

- (VCWeeklyMetricSubmitter)initWithDatabaseProvider:(id)a3
{
  id v4 = a3;
  v5 = +[VCMetricCheckIn recentCheckInWithMode:2];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB7288]);
  v7 = [(VCMetricSubmitter *)self initWithCheckIn:v5 event:v6 databaseProvider:v4];

  return v7;
}

@end