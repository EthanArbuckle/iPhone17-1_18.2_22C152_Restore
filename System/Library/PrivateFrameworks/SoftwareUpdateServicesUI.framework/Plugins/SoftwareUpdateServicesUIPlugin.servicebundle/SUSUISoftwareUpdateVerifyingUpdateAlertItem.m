@interface SUSUISoftwareUpdateVerifyingUpdateAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)behavesSuperModally;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (id)buttons;
- (id)contentExtensionID;
- (id)extensionDictionary;
- (id)message;
- (id)title;
@end

@implementation SUSUISoftwareUpdateVerifyingUpdateAlertItem

- (id)title
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)buttons
{
  return 0;
}

- (id)contentExtensionID
{
  return @"com.apple.susuiservice.SUSUIVerifyingAlertCFUserNotificationUIExtension";
}

- (id)extensionDictionary
{
  v14[2] = self;
  v14[1] = (id)a2;
  v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if ([(SUDescriptor *)v5 isSplatOnly])
  {
    id v13 = sub_1F7B0();
    char v12 = 1;
    id v11 = [v13 localizedStringForKey:@"RSR_VERIFYING_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    char v10 = 1;
    id v2 = v11;
  }
  else
  {
    id v9 = sub_1F7B0();
    char v8 = 1;
    id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_VERIFYING_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    char v6 = 1;
    id v2 = v7;
  }
  v14[0] = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {
  CFStringRef v15 = @"ExtensionAlertKeyVerifyingText";
  }
  id v16 = v14[0];
  v4 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  objc_storeStrong(v14, 0);

  return v4;
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