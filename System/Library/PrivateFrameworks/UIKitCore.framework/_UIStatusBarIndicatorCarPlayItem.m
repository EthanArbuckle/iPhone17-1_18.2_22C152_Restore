@interface _UIStatusBarIndicatorCarPlayItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorCarPlayItem

- (id)indicatorEntryKey
{
  return @"carPlayEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"carplay";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end