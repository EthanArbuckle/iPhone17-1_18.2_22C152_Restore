@interface _UIStatusBarIndicatorStudentItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorStudentItem

- (id)indicatorEntryKey
{
  return @"studentEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)imageNameForUpdate:(id)a3
{
  return @"Student";
}

@end