@interface _UIStatusBarIndicatorTTYItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorTTYItem

- (id)indicatorEntryKey
{
  return @"ttyEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"teletype";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end