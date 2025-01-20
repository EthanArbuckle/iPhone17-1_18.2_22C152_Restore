@interface _UIStatusBarIndicatorSatelliteItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorSatelliteItem

- (id)indicatorEntryKey
{
  return @"satelliteEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"satellite.fill";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end