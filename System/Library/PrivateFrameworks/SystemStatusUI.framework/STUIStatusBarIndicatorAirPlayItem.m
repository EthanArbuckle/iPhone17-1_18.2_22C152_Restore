@interface STUIStatusBarIndicatorAirPlayItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorAirPlayItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA96F8];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"airplayvideo";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end