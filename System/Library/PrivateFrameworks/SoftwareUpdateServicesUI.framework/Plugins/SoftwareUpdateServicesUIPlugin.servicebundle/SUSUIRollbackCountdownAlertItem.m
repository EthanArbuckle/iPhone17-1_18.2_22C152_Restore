@interface SUSUIRollbackCountdownAlertItem
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (id)_cancelButton;
- (id)_rebootNowButton;
- (id)buttons;
- (id)contentExtensionID;
- (id)extensionDictionary;
- (id)title;
- (void)cancel;
- (void)reboot;
@end

@implementation SUSUIRollbackCountdownAlertItem

- (id)contentExtensionID
{
  return @"com.apple.susuiservice.SUSUInstallAlertCFUserNotificationUIExtension";
}

- (id)extensionDictionary
{
  v14[2] = self;
  v14[1] = (id)a2;
  v15[0] = @"ExtensionAlertKeyHumanReadableUpdateName";
  id v11 = [(SUSUIBaseRollbackAlertItem *)self updateName];
  v16[0] = v11;
  v15[1] = @"ExtensionAlertKeySingularText";
  id v10 = sub_4243C();
  id v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ROLLBACK_ALERT_COUNTDOWN_ALERT_BODY_SINGULAR"];
  id v8 = objc_msgSend(v10, "localizedStringForKey:value:table:");
  v16[1] = v8;
  v15[2] = @"ExtensionAlertKeyPluralText";
  id v7 = sub_4243C();
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ROLLBACK_ALERT_COUNTDOWN_ALERT_BODY_PLURAL"];
  id v5 = objc_msgSend(v7, "localizedStringForKey:value:table:");
  v16[2] = v5;
  v15[3] = @"ExtensionAlertKeyCompletionAction";
  v16[3] = @"ExtensionAlertKeyCompletionActionReboot";
  v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v14[0] = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");

  v12 = +[SUSUIPreferences sharedInstance];
  id location = [(SUSUIPreferences *)v12 restartCountdownOverrideIntervalSeconds];

  if (location) {
    [v14[0] setSafeObject:location forKey:@"ExtensionAlertKeyCountdown"];
  }
  id v3 = v14[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);

  return v3;
}

- (id)title
{
  id v3 = sub_4243C();
  id v4 = [v3 localizedStringForKey:@"ROLLBACK_ALERT_COUNTDOWN_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)buttons
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[NSMutableArray array];
  id v3 = v8[0];
  id v4 = [(SUSUIRollbackCountdownAlertItem *)v9 _rebootNowButton];
  objc_msgSend(v3, "addObject:");

  id v5 = v8[0];
  id v6 = [(SUSUIRollbackCountdownAlertItem *)v9 _cancelButton];
  objc_msgSend(v5, "addObject:");

  id v7 = [v8[0] copy];
  objc_storeStrong(v8, 0);

  return v7;
}

- (id)_rebootNowButton
{
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  v13 = self;
  v2 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v2);
  id v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_4243C();
  id v7 = [v8 localizedStringForKey:@"ROLLBACK_ALERT_COUNTDOWN_ALERT_BUTTON_REBOOT_NOW" value:&stru_62DF0 table:@"ui_alerts"];
  id v10 = v12;
  id v11 = v13;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 1);
  id v4 = v14[0];
  v14[0] = v3;

  id v9 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

- (id)_cancelButton
{
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  v13 = self;
  v2 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v2);
  id v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_4243C();
  id v7 = [v8 localizedStringForKey:@"CANCEL" value:&stru_62DF0 table:@"ui_alerts"];
  id v10 = v12;
  id v11 = v13;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 2, 0);
  id v4 = v14[0];
  v14[0] = v3;

  id v9 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

- (void)reboot
{
  id v3 = [(SUSUIBaseRollbackAlertItem *)self softwareUpdateController];
  v2 = [(SUSUIBaseRollbackAlertItem *)self rollbackDescriptor];
  -[SUSUISoftwareUpdateController rollbackCompleted:](v3, "rollbackCompleted:");
}

- (void)cancel
{
  v2 = [(SUSUIBaseRollbackAlertItem *)self softwareUpdateController];
  [(SUSUISoftwareUpdateController *)v2 cancelRollback];
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)unlocksScreen
{
  return 1;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (BOOL)showButtonsOnLockScreen
{
  return 1;
}

@end