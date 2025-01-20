@interface NTKStopwatchComplication
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
@end

@implementation NTKStopwatchComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

@end