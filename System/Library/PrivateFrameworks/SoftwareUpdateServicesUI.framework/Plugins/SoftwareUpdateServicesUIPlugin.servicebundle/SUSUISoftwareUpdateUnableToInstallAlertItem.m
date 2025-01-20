@interface SUSUISoftwareUpdateUnableToInstallAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)errorIsMDMRequiresUnlock:(id)a3;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (NSError)error;
- (id)_notificationMessage;
- (id)buttons;
- (id)message;
- (id)title;
- (void)_installNowAction;
- (void)_remindMeLaterAction;
- (void)setError:(id)a3;
@end

@implementation SUSUISoftwareUpdateUnableToInstallAlertItem

- (id)title
{
  v26 = self;
  SEL v25 = a2;
  v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  unsigned __int8 v6 = [(SUDescriptor *)v5 isSplatOnly];

  char v24 = v6 & 1;
  char v21 = 0;
  char v19 = 0;
  char v17 = 0;
  char v15 = 0;
  if (v6)
  {
    id v22 = sub_D41C();
    char v21 = 1;
    id v20 = [v22 localizedStringForKey:@"RSR_INSTALL_FAILURE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v19 = 1;
    id v2 = v20;
  }
  else
  {
    id v18 = sub_D41C();
    char v17 = 1;
    id v16 = [v18 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v15 = 1;
    id v2 = v16;
  }
  id location = v2;
  if (v15) {

  }
  if (v17) {
  if (v19)
  }

  if (v21) {
  if ([(SUSUISoftwareUpdateUnableToInstallAlertItem *)v26 errorIsMDMRequiresUnlock:*(void *)(&v26->super._actionTaken + 2)])
  }
  {
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    char v7 = 0;
    if (v24)
    {
      id v14 = sub_D41C();
      char v13 = 1;
      id v12 = [v14 localizedStringForKey:@"LOCKSCREEN_SPLAT_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v11 = 1;
      objc_storeStrong(&location, v12);
    }
    else
    {
      id v10 = sub_D41C();
      char v9 = 1;
      id v8 = [v10 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v7 = 1;
      objc_storeStrong(&location, v8);
    }
    if (v7) {

    }
    if (v9) {
    if (v11)
    }

    if (v13) {
  }
    }
  id v4 = location;
  objc_storeStrong(&location, 0);

  return v4;
}

- (id)message
{
  return [(SUSUISoftwareUpdateUnableToInstallAlertItem *)self _notificationMessage];
}

- (id)buttons
{
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = 0;
  id v21 = self;
  if (![(SUSUIBaseAlertItem *)v23 isUILocked])
  {
    unsigned __int8 v6 = [SUSUIAlertButtonDefinition alloc];
    id v8 = sub_D41C();
    id v7 = objc_msgSend(v8, "localizedStringForKey:value:table:", @"SOFTWARE_UPDATE_INSTALL_FAILURE_ACTION_RETRY");
    id v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    char v17 = sub_C224;
    id v18 = &unk_5CC30;
    id v19 = v21;
    id v20 = [(SUSUIAlertButtonDefinition *)v6 initWithLabel:v7 presentationStyle:0 isPreferredButton:1 handler:&v14];

    char v9 = [SUSUIAlertButtonDefinition alloc];
    id v11 = sub_D41C();
    id v10 = [v11 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_REMIND_ME_LATER" value:&stru_62DF0 table:@"ui_alerts"];
    id v12 = v21;
    char v13 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v9, "initWithLabel:presentationStyle:isPreferredButton:handler:", v10);

    v24[0] = v20;
    v24[1] = v13;
    id v2 = +[NSArray arrayWithObjects:v24 count:2];
    id v3 = v22[0];
    v22[0] = v2;

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v19, 0);
  }
  id v5 = v22[0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);

  return v5;
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

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (void)_remindMeLaterAction
{
  id v14 = self;
  v13[1] = (id)a2;
  [(SUSUIBaseSoftwareUpdateInstallFailureAlertItem *)self setActionTaken:1];
  v13[0] = (id)SUSUILog();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v13[0];
    os_log_type_t type = v12;
    id v2 = (objc_class *)objc_opt_class();
    char v9 = NSStringFromClass(v2);
    id v11 = v9;
    sub_8120((uint64_t)v15, (uint64_t)v11);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Remind me later action taken", v15, 0xCu);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(v13, 0);
  id v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v3);

  if (BYTE2(v14->super.super._controller))
  {
    id v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)v14 softwareUpdateController];
    [(SUSUISoftwareUpdateController *)v5 repopInstallAlertWithWeekDurationFromNowForReason:v10];
  }
  else
  {
    id v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)v14 softwareUpdateController];
    [(SUSUISoftwareUpdateController *)v4 repopInstallAlertWithDefaultDurationFromNowForReason:v10];
  }
  [(SUSUIBaseSoftwareUpdateInstallFailureAlertItem *)v14 dismissAlert];
  objc_storeStrong(&v10, 0);
}

- (void)_installNowAction
{
  id v11 = self;
  v10[1] = (id)a2;
  [(SUSUIBaseSoftwareUpdateInstallFailureAlertItem *)self setActionTaken:1];
  v10[0] = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v10[0];
    os_log_type_t type = v9;
    id v2 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v2);
    id v8 = v6;
    sub_8120((uint64_t)v12, (uint64_t)v8);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Install now action taken", v12, 0xCu);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(v10, 0);
  id v7 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
  [(SUSUISoftwareUpdateInstallOptions *)v7 setIgnorableConstraints:1024];
  id v3 = [(SUSUIBaseSoftwareUpdateAlertItem *)v11 softwareUpdateController];
  [(SUSUISoftwareUpdateController *)v3 installNowFromSource:0 options:v7];

  objc_storeStrong((id *)&v7, 0);
}

- (id)_notificationMessage
{
  v63 = self;
  v62[1] = (id)a2;
  v62[0] = 0;
  id v61 = 0;
  id v41 = [*(id *)(&self->super._actionTaken + 2) domain];
  unsigned __int8 v42 = [v41 isEqualToString:SUErrorDomain];

  if ((v42 & 1) != 0 && [*(id *)(&v63->super._actionTaken + 2) code] == &dword_14)
  {
    v60 = 0;
    id v39 = [*(id *)(&v63->super._actionTaken + 2) userInfo];
    id v38 = [v39 objectForKey:kSUInstallationConstraintsUnmetKey];
    v40 = (char *)[v38 integerValue];

    v60 = (int *)v40;
    if (v40 == (unsigned char *)&def_46F0 + 1)
    {
      SURequiredBatteryLevelForInstall();
      v35 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v59 = +[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:");

      id v37 = sub_D41C();
      id v36 = [v37 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_BATTERY_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
      id v2 = +[NSString stringWithFormat:v59];
      id v3 = v62[0];
      v62[0] = v2;

      objc_storeStrong((id *)&v59, 0);
    }
    else if (v60 == &dword_4)
    {
      BYTE2(v63->super.super._controller) = 1;
      v33 = [(SUSUIBaseSoftwareUpdateAlertItem *)v63 descriptor];
      id v34 = [(SUDescriptor *)v33 installationSize];

      v58[1] = v34;
      if (v34)
      {
        v58[0] = (id)CPFSSizeStrings();
        id v32 = sub_D41C();
        id v31 = [v32 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_STORAGE_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
        id v4 = +[NSString stringWithFormat:v58[0]];
        id v5 = v62[0];
        v62[0] = v4;

        objc_storeStrong(v58, 0);
      }
    }
    else if (v60 == (int *)((char *)&def_46F0 + 2))
    {
      id v30 = sub_D41C();
      id v6 = [v30 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_NETWORK_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
      id v7 = v62[0];
      v62[0] = v6;
    }
    else if ([(SUSUISoftwareUpdateUnableToInstallAlertItem *)v63 errorIsMDMRequiresUnlock:*(void *)(&v63->super._actionTaken + 2)])
    {
      id v29 = [(SUSUIBaseSoftwareUpdateAlertItem *)v63 updateName];

      if (v29)
      {
        id v28 = sub_D41C();
        id v27 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_MDM_REQUEST_NEEDS_UNLOCK_BODY"];
        id v26 = objc_msgSend(v28, "localizedStringForKey:value:table:");
        id v25 = [(SUSUIBaseSoftwareUpdateAlertItem *)v63 updateName];
        id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v25);
        id v9 = v62[0];
        v62[0] = v8;
      }
      else
      {
        id v24 = sub_D41C();
        id v23 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_MDM_REQUEST_NEEDS_UNLOCK_BODY_NO_UPDATE"];
        id v22 = objc_msgSend(v24, "localizedStringForKey:value:table:");
        id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:");
        id v11 = v62[0];
        v62[0] = v10;
      }
    }
  }
  id v21 = [(SUSUIBaseSoftwareUpdateAlertItem *)v63 updateName];
  char v55 = 0;
  char v53 = 0;
  char v51 = 0;
  char v49 = 0;
  char v47 = 0;
  char v45 = 0;
  if (v21)
  {
    id v56 = sub_D41C();
    char v55 = 1;
    id v54 = [v56 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_GENERIC_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    char v53 = 1;
    id v52 = [(SUSUIBaseSoftwareUpdateAlertItem *)v63 updateName];
    char v51 = 1;
    v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v52);
    char v49 = 1;
    os_log_type_t v12 = v50;
  }
  else
  {
    id v48 = sub_D41C();
    char v47 = 1;
    id v46 = [v48 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_FAILURE_GENERIC_ALERT_BODY_NO_UPDATE" value:&stru_62DF0 table:@"ui_alerts"];
    char v45 = 1;
    os_log_type_t v12 = (NSString *)v46;
  }
  id v57 = v12;
  if (v45) {

  }
  if (v47) {
  if (v49)
  }

  if (v51) {
  if (v53)
  }

  if (v55) {
  if (v62[0])
  }
    objc_storeStrong(&v61, v62[0]);
  else {
    objc_storeStrong(&v61, v57);
  }
  id v19 = +[BSPlatform sharedInstance];
  unsigned __int8 v20 = [(BSPlatform *)v19 isInternalInstall];

  if (v20)
  {
    id v18 = [*(id *)(&v63->super._actionTaken + 2) userInfo];
    id v44 = [v18 objectForKey:NSLocalizedRecoverySuggestionErrorKey];

    if (v44) {
      id v17 = v44;
    }
    else {
      id v17 = *(id *)(&v63->super._actionTaken + 2);
    }
    v43 = +[NSString stringWithFormat:@"\n\n[Internal Only]\n%@", v17];
    char v13 = +[NSString stringWithFormat:@"%@%@", v61, v43];
    id v14 = v61;
    id v61 = v13;

    objc_storeStrong((id *)&v43, 0);
    objc_storeStrong(&v44, 0);
  }
  id v16 = v61;
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(v62, 0);

  return v16;
}

- (BOOL)errorIsMDMRequiresUnlock:(id)a3
{
  int v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [location[0] domain];
  BOOL v9 = 0;
  if ([v8 isEqualToString:SUErrorDomain]) {
    BOOL v9 = [location[0] code] == &dword_14;
  }

  if (!v9) {
    goto LABEL_13;
  }
  id v5 = [*(id *)(&v15->super._actionTaken + 2) userInfo];
  id v4 = [v5 objectForKey:kSUInstallationConstraintsUnmetKey];
  unsigned __int8 v6 = [v4 integerValue];

  char v12 = 0;
  char v10 = 0;
  unsigned __int8 v7 = 0;
  if ((v6 & 0x10) != 0)
  {
    unsigned __int8 v7 = 0;
    if ((v6 & 0x20) != 0)
    {
      id v13 = [location[0] userInfo];
      char v12 = 1;
      id v11 = [v13 objectForKey:kSUMDMInstallationRequest];
      char v10 = 1;
      unsigned __int8 v7 = [v11 BOOLValue];
    }
  }
  if (v10) {

  }
  if (v12) {
  if (v7)
  }
    char v16 = 1;
  else {
LABEL_13:
  }
    char v16 = 0;
  objc_storeStrong(location, 0);
  return v16 & 1;
}

- (NSError)error
{
  return *(NSError **)(&self->super._actionTaken + 2);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end