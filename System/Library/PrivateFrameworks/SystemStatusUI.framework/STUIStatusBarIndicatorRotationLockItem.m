@interface STUIStatusBarIndicatorRotationLockItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorRotationLockItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97B8];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"lock.rotation";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end