@interface SBHomeScreenNagAlert
- (BOOL)dismissOnLock;
- (BOOL)shouldShowInLockScreen;
@end

@implementation SBHomeScreenNagAlert

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)dismissOnLock
{
  return 1;
}

@end