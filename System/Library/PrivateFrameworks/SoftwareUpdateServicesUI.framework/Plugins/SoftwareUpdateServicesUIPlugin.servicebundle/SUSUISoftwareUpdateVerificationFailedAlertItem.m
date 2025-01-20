@interface SUSUISoftwareUpdateVerificationFailedAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (NSError)error;
- (id)buttons;
- (id)message;
- (id)title;
- (void)setError:(id)a3;
@end

@implementation SUSUISoftwareUpdateVerificationFailedAlertItem

- (id)title
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
    id v13 = sub_EE94();
    char v12 = 1;
    id v11 = [v13 localizedStringForKey:@"RSR_VERIFICATION_FAILED_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v10 = 1;
    id v2 = v11;
  }
  else
  {
    id v9 = sub_EE94();
    char v8 = 1;
    id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_VERIFICATION_FAILED_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
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
  id v4 = v14[0];
  }
  objc_storeStrong(v14, 0);

  return v4;
}

- (id)message
{
  v16 = self;
  v15[1] = (id)a2;
  id v10 = sub_EE94();
  id v9 = [v10 localizedStringForKey:@"SOFTWARE_UPDATE_VERIFICATION_FAILED_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
  id v8 = [(SUSUIBaseSoftwareUpdateAlertItem *)v16 updateName];
  v15[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v8);

  id v11 = +[BSPlatform sharedInstance];
  unsigned __int8 v12 = [(BSPlatform *)v11 isInternalInstall];

  if (v12)
  {
    id v7 = [*(id *)((char *)&v16->super.super._controller + 2) userInfo];
    id v14 = [v7 objectForKey:NSLocalizedRecoverySuggestionErrorKey];

    if (v14) {
      id v6 = v14;
    }
    else {
      id v6 = *(SUSUISoftwareUpdateController **)((char *)&v16->super.super._controller + 2);
    }
    id v13 = +[NSString stringWithFormat:@"\n\n[Internal Only]\n%@", v6];
    id v2 = +[NSString stringWithFormat:@"%@%@", v15[0], v13];
    id v3 = v15[0];
    v15[0] = v2;

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  id v5 = v15[0];
  objc_storeStrong(v15, 0);

  return v5;
}

- (id)buttons
{
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = 0;
  if (![(SUSUIBaseAlertItem *)self isUILocked])
  {
    v21 = v23;
    id v6 = [SUSUIAlertButtonDefinition alloc];
    id v8 = sub_EE94();
    id v7 = objc_msgSend(v8, "localizedStringForKey:value:table:", @"SOFTWARE_UPDATE_INSTALL_FAILURE_ACTION_RETRY");
    id v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_E9E4;
    v18 = &unk_5CC30;
    v19 = v21;
    v20 = [(SUSUIAlertButtonDefinition *)v6 initWithLabel:v7 presentationStyle:0 isPreferredButton:1 handler:&v14];

    id v9 = [SUSUIAlertButtonDefinition alloc];
    id v11 = sub_EE94();
    id v10 = [v11 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_REMIND_ME_LATER" value:&stru_62DF0 table:@"ui_alerts"];
    unsigned __int8 v12 = v21;
    id v13 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v9, "initWithLabel:presentationStyle:isPreferredButton:handler:", v10);

    v24[0] = v20;
    v24[1] = v13;
    id v2 = +[NSArray arrayWithObjects:v24 count:2];
    id v3 = v22[0];
    v22[0] = v2;

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong((id *)&v21, 0);
  }
  id v5 = v22[0];
  objc_storeStrong(v22, 0);

  return v5;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)reappearsAfterLock
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

- (NSError)error
{
  return *(NSError **)((char *)&self->super.super._controller + 2);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end