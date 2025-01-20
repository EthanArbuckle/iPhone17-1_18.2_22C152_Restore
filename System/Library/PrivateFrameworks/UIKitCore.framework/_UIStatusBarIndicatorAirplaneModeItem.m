@interface _UIStatusBarIndicatorAirplaneModeItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorAirplaneModeItem

- (id)indicatorEntryKey
{
  return @"airplaneModeEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"airplane";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end