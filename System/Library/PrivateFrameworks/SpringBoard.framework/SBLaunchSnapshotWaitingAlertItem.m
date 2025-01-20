@interface SBLaunchSnapshotWaitingAlertItem
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)behavesSuperModally;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBLaunchSnapshotWaitingAlertItem

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)behavesSuperModally
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v4 = [(SBAlertItem *)self alertController];
  [v4 setTitle:@"Regenerating Default Launch Images..."];
  [v4 setMessage:@"Your call is important to us. Please wait on the line and a customer service representative will be with you as soon as possible."];
}

@end