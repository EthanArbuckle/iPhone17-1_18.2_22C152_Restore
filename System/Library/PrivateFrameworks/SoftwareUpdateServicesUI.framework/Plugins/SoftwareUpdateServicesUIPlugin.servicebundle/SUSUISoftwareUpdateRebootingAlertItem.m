@interface SUSUISoftwareUpdateRebootingAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)behavesSuperModally;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUSUISoftwareUpdateRebootingAlertItem

- (id)title
{
  id v3 = sub_1FA8C();
  id v4 = [v3 localizedStringForKey:@"SOFTWARE_UPDATE_REBOOTING_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)message
{
  id v3 = sub_1FA8C();
  id v4 = [v3 localizedStringForKey:@"SOFTWARE_UPDATE_REBOOTING_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)buttons
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)reappearsAfterLock
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

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)allowNoButton
{
  return 1;
}

@end