@interface SUSUISetupUpgradeAlertItem
- (BOOL)allowAutoUnlock;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)goingToSetup;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)unlocksScreen;
- (SUSUISetupUpgradeAlertItem)initWithGoingToSetup:(BOOL)a3 isLocked:(BOOL)a4 withAcknowledgementBlock:(id)a5;
- (id)buttons;
- (id)currentSystemVersion;
- (id)message;
- (id)title;
- (void)_acknowledge;
- (void)setGoingToSetup:(BOOL)a3;
@end

@implementation SUSUISetupUpgradeAlertItem

- (SUSUISetupUpgradeAlertItem)initWithGoingToSetup:(BOOL)a3 isLocked:(BOOL)a4 withAcknowledgementBlock:(id)a5
{
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  BOOL v14 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  v5 = v17;
  v17 = 0;
  v12 = [(SUSUIBaseAlertItem *)v5 init];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    *(&v17->super._isUILocked + 1) = v15;
    id v6 = objc_retainBlock(location);
    v7 = *(void **)&v17->_isLocked;
    *(void *)&v17->_isLocked = v6;

    *(&v17->super._isUILocked + 2) = v14;
    v11 = +[SUSUIPreferences sharedInstance];
    unsigned __int8 v8 = [(SUSUIPreferences *)v11 lastAppliedUpdateWasSplatOnly];
    BYTE1(v17->_acknowledgementBlock) = v8 & 1;
  }
  v10 = v17;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v10;
}

- (id)title
{
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  char v4 = 0;
  if (BYTE1(self->_acknowledgementBlock))
  {
    id v11 = sub_E138();
    char v10 = 1;
    id v9 = [v11 localizedStringForKey:@"LOCKSCREEN_SPLAT_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v8 = 1;
    id v2 = v9;
  }
  else
  {
    id v7 = sub_E138();
    char v6 = 1;
    id v5 = [v7 localizedStringForKey:@"LOCKSCREEN_SOFTWARE_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v4 = 1;
    id v2 = v5;
  }
  v12 = v2;
  if (v4) {

  }
  if (v6) {
  if (v8)
  }

  if (v10) {

  }
  return v12;
}

- (id)message
{
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = 0;
  id v21 = [(SUSUISetupUpgradeAlertItem *)self currentSystemVersion];
  if (*(&v23->super._isUILocked + 1))
  {
    v18 = +[BSPlatform sharedInstance];
    v19 = (char *)[(BSPlatform *)v18 homeButtonType];

    v20[1] = v19;
    if (v19 == (unsigned char *)&def_46F0 + 2)
    {
      id v17 = sub_E138();
      id v16 = [v17 localizedStringForKey:@"LOCKSCREEN_SOFTWARE_UPGRADE_NEED_TO_RUN_SETUP_ALERT_MESSAGE_SWIPE" value:&stru_62DF0 table:@"ui_alerts"];
      id v2 = +[NSString stringWithFormat:v21];
      id v3 = v22[0];
      v22[0] = v2;
    }
    else
    {
      id v15 = sub_E138();
      id v14 = [v15 localizedStringForKey:@"LOCKSCREEN_SOFTWARE_UPGRADE_NEED_TO_RUN_SETUP_ALERT_MESSAGE" value:&stru_62DF0 table:@"ui_alerts"];
      char v4 = +[NSString stringWithFormat:v21];
      id v5 = v22[0];
      v22[0] = v4;
    }
  }
  else
  {
    if (BYTE1(v23->_acknowledgementBlock)) {
      char v6 = @"LOCKSCREEN_SPLAT_UPGRADE_ALERT_MESSAGE";
    }
    else {
      char v6 = @"LOCKSCREEN_SOFTWARE_UPGRADE_ALERT_MESSAGE";
    }
    v20[0] = v6;
    id v13 = sub_E138();
    id v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v20[0]];
    id v11 = objc_msgSend(v13, "localizedStringForKey:value:table:");
    id v7 = +[NSString stringWithFormat:v21];
    id v8 = v22[0];
    v22[0] = v7;

    objc_storeStrong(v20, 0);
  }
  id v10 = v22[0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);

  return v10;
}

- (id)buttons
{
  v18 = self;
  v17[1] = (id)a2;
  v17[0] = 0;
  if (!*(&self->super._isUILocked + 2))
  {
    id v16 = v18;
    char v6 = [SUSUIAlertButtonDefinition alloc];
    id v8 = sub_E138();
    id v7 = [v8 localizedStringForKey:@"CLOSE" value:&stru_62DF0 table:@"ui_alerts"];
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_DD8C;
    id v13 = &unk_5CC30;
    id v14 = v16;
    id v15 = [(SUSUIAlertButtonDefinition *)v6 initWithLabel:v7 presentationStyle:2 isPreferredButton:0 handler:&v9];

    v19 = v15;
    id v2 = +[NSArray arrayWithObjects:&v19 count:1];
    id v3 = v17[0];
    v17[0] = v2;

    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong((id *)&v16, 0);
  }
  id v5 = v17[0];
  objc_storeStrong(v17, 0);

  return v5;
}

- (id)currentSystemVersion
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)_CFCopySupplementalVersionDictionary();
  char v6 = 0;
  BOOL v5 = 1;
  if (location[0])
  {
    id v7 = [location[0] objectForKeyedSubscript:_kCFSystemVersionShortVersionStringKey];
    char v6 = 1;
    BOOL v5 = v7 == 0;
  }
  if (v6) {

  }
  if (v5)
  {
    char v4 = +[UIDevice currentDevice];
    id v9 = [(UIDevice *)v4 systemVersion];
  }
  else
  {
    id v9 = (NSString *)[location[0] objectForKeyedSubscript:_kCFSystemVersionShortVersionStringKey];
  }
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)allowAutoUnlock
{
  return 0;
}

- (BOOL)unlocksScreen
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

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (void)_acknowledge
{
  if (*(void *)&self->_isLocked)
  {
    (*(void (**)(void))(*(void *)&self->_isLocked + 16))();
    id v2 = *(void **)&self->_isLocked;
    *(void *)&self->_isLocked = 0;
  }
}

- (void)setGoingToSetup:(BOOL)a3
{
  if (*(&self->super._isUILocked + 1) != a3) {
    *(&self->super._isUILocked + 1) = a3;
  }
}

- (BOOL)goingToSetup
{
  return *(&self->super._isUILocked + 1);
}

- (void).cxx_destruct
{
}

@end