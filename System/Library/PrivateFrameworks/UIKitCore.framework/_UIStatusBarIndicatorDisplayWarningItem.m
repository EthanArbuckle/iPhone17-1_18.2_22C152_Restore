@interface _UIStatusBarIndicatorDisplayWarningItem
- (BOOL)useMultiColorSystemImageForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorDisplayWarningItem

- (id)indicatorEntryKey
{
  return @"displayWarningEntry";
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"display.trianglebadge.exclamationmark";
}

@end