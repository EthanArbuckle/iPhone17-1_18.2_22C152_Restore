@interface _UIStatusBarIndicatorAirPlayItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorAirPlayItem

- (id)indicatorEntryKey
{
  return @"airPlayEntry";
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