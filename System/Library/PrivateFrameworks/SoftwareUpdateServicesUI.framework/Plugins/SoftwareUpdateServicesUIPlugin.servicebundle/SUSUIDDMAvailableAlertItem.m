@interface SUSUIDDMAvailableAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (SUSUIDDMAvailableAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 alertWindow:(unint64_t)a5;
- (id)allowedApps;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUSUIDDMAvailableAlertItem

- (SUSUIDDMAvailableAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 alertWindow:(unint64_t)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  unint64_t v12 = a5;
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSUIDDMAvailableAlertItem;
  v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)&v11 initWithDescriptor:location[0] softwareUpdateController:v13];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10) {
    *(SUSUISoftwareUpdateController **)((char *)&v15->super.super._controller + 1) = (SUSUISoftwareUpdateController *)v12;
  }
  else {
    *(SUSUISoftwareUpdateController **)((char *)&v15->super.super._controller + 1) = 0;
  }
  v7 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)title
{
  id v3 = sub_F5E4();
  id v4 = [v3 localizedStringForKey:@"MANAGED_UPDATE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)message
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[SUSUIDDMController sharedInstance];
  id v3 = v7[0];
  id v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)v8 updateName];
  id v6 = objc_msgSend(v3, "alertBodyLocallizedStrWithUpdateName:");

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v5;
}

- (id)buttons
{
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = 0;
  objc_super v11 = self;
  id v5 = [SUSUIAlertButtonDefinition alloc];
  id v7 = sub_F5E4();
  id v6 = [v7 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_ACTION_DETAILS" value:&stru_62DF0 table:@"ui_alerts"];
  v9 = v11;
  v10 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v5, "initWithLabel:presentationStyle:isPreferredButton:handler:", v6, 2, 1);

  id v13 = v10;
  v2 = +[NSArray arrayWithObjects:&v13 count:1];
  id v3 = v12[0];
  v12[0] = v2;

  id v8 = v12[0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(v12, 0);

  return v8;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)showButtonsOnLockScreen
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return [(SUSUIDDMAvailableAlertItem *)self shouldShowInLockScreen];
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (id)allowedApps
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = &off_65518;
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

@end