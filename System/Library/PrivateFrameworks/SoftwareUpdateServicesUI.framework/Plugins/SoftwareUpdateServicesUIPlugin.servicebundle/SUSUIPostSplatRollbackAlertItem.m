@interface SUSUIPostSplatRollbackAlertItem
- (BOOL)allowAutoUnlock;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUSUIPostSplatRollbackAlertItem

- (id)title
{
  id v3 = sub_A190();
  id v4 = [v3 localizedStringForKey:@"LOCKSCREEN_SOFTWARE_ROLLBACK_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)message
{
  id v7 = sub_A190();
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"LOCKSCREEN_SOFTWARE_ROLLBACK_ALERT_MESSAGE"];
  id v5 = objc_msgSend(v7, "localizedStringForKey:value:table:");
  id v4 = [(SUSUIBaseRollbackAlertItem *)self rollbackDescriptor];
  id v3 = [(SURollbackDescriptor *)v4 productVersion];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v8;
}

- (id)buttons
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)allowAutoUnlock
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)unlocksScreen
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

@end