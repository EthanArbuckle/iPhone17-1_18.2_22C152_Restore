@interface STUIStatusBarIndicatorAlarmItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorAlarmItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9708];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"alarm.fill";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end