@interface STUIStatusBarIndicatorStudentItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorStudentItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97E0];
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