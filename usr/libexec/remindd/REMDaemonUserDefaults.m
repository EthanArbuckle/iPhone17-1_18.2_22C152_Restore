@interface REMDaemonUserDefaults
- (NSDate)lastScheduledDate;
- (int64_t)schedulingState;
- (void)setDebugForceSupportBackgroundScheduling:(BOOL)a3;
- (void)setLastScheduledDate:(id)a3;
- (void)setSchedulingState:(int64_t)a3;
@end

@implementation REMDaemonUserDefaults

- (int64_t)schedulingState
{
  v2 = [(REMDaemonUserDefaults *)self cloudKitSchemaCatchUpSyncSchedulingState];
  id v3 = [v2 integerValue];

  if ((unint64_t)v3 >= 3) {
    return 3;
  }
  else {
    return (int64_t)v3;
  }
}

- (void)setSchedulingState:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(REMDaemonUserDefaults *)self setCloudKitSchemaCatchUpSyncSchedulingState:v4];
}

- (NSDate)lastScheduledDate
{
  return (NSDate *)[(REMDaemonUserDefaults *)self cloudKitSchemaCatchUpSyncLastScheduledDate];
}

- (void)setLastScheduledDate:(id)a3
{
}

- (void)setDebugForceSupportBackgroundScheduling:(BOOL)a3
{
}

@end