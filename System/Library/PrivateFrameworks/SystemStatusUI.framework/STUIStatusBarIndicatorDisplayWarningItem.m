@interface STUIStatusBarIndicatorDisplayWarningItem
- (BOOL)useMultiColorSystemImageForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorDisplayWarningItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9760];
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