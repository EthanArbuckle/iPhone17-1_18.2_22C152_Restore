@interface _UIStatusBarIndicatorRotationLockItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorRotationLockItem

- (id)indicatorEntryKey
{
  return @"rotationLockEntry";
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