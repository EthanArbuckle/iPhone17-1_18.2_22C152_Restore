@interface STUIStatusBarIndicatorAirplaneModeItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorAirplaneModeItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9700];
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