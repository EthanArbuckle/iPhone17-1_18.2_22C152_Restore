@interface _UIStatusBarIndicatorAlarmItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorAlarmItem

- (id)indicatorEntryKey
{
  return @"alarmEntry";
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