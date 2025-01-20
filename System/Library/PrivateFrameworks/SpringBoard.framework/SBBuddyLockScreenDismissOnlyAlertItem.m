@interface SBBuddyLockScreenDismissOnlyAlertItem
- (BOOL)allowInSetup;
- (BOOL)forcesModalAlertAppearance;
@end

@implementation SBBuddyLockScreenDismissOnlyAlertItem

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

@end