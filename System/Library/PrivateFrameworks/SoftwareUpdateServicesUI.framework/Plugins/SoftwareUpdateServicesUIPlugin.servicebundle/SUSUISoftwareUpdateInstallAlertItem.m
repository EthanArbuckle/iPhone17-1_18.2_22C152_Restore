@interface SUSUISoftwareUpdateInstallAlertItem
- (BOOL)_isMDMAlert;
- (BOOL)_shouldCountdown;
- (BOOL)_shouldShowInstallLater;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowCountdown;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (SUSUISoftwareUpdateInstallAlertItem)initWithDownload:(id)a3 softwareUpdateController:(id)a4;
- (SUSUISoftwareUpdateInstallAlertItem)initWithDownload:(id)a3 style:(unint64_t)a4 softwareUpdateController:(id)a5 tryTonightInstallOperationForecast:(id)a6 installOptions:(id)a7;
- (id)_bodyTextToModelSpecificLocalizedKey:(id)a3;
- (id)_detailsButton;
- (id)_emergencyButton;
- (id)_installLaterButton;
- (id)_installLaterButtonText;
- (id)_installNowButton;
- (id)_installNowButtonText;
- (id)_notificationMessage;
- (id)_remindMeLaterButton;
- (id)_setupDefinition;
- (id)_stringFromAlertStyle:(unint64_t)a3;
- (id)allowedApps;
- (id)buttons;
- (id)contentExtensionID;
- (id)description;
- (id)extensionDictionary;
- (id)message;
- (id)title;
- (unint64_t)style;
- (void)_activateInstallLaterAlert;
- (void)_installUpdateNow;
- (void)_scheduleInstallAlertRepopOnDismissWithReason:(id)a3;
- (void)_submitUserInteractionEvent:(id)a3;
- (void)_userAskedToDeferInstall;
- (void)dismissAlert;
@end

@implementation SUSUISoftwareUpdateInstallAlertItem

- (SUSUISoftwareUpdateInstallAlertItem)initWithDownload:(id)a3 softwareUpdateController:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0;
  v10 = -[SUSUISoftwareUpdateInstallAlertItem initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:](v4, "initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:", location[0], 3, v8, 0);
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (SUSUISoftwareUpdateInstallAlertItem)initWithDownload:(id)a3 style:(unint64_t)a4 softwareUpdateController:(id)a5 tryTonightInstallOperationForecast:(id)a6 installOptions:(id)a7
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v24 = a4;
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  id v22 = 0;
  objc_storeStrong(&v22, a6);
  id v21 = 0;
  objc_storeStrong(&v21, a7);
  v13 = v26;
  id v14 = [location[0] descriptor];
  v26 = 0;
  v20.receiver = v13;
  v20.super_class = (Class)SUSUISoftwareUpdateInstallAlertItem;
  v15 = -[SUSUIBaseSoftwareUpdateAlertItem initWithDescriptor:softwareUpdateController:](&v20, "initWithDescriptor:softwareUpdateController:");
  v26 = v15;
  objc_storeStrong((id *)&v26, v15);

  if (v15)
  {
    *(SUSUISoftwareUpdateController **)((char *)&v26->super._controller + 1) = (SUSUISoftwareUpdateController *)v24;
    objc_storeStrong((id *)((char *)&v26->_alertStyle + 1), v21);
    if (!*(unint64_t *)((char *)&v26->_alertStyle + 1))
    {
      v7 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
      id v8 = *(void **)((char *)&v26->_alertStyle + 1);
      *(unint64_t *)((char *)&v26->_alertStyle + 1) = (unint64_t)v7;
    }
    objc_storeStrong((id *)((char *)&v26->_installOptions + 1), location[0]);
    BYTE1(v26->_download) = 0;
    objc_storeStrong((id *)((char *)&v26->_definition + 1), v22);
    v9 = (NSString *)[(SUSUISoftwareUpdateInstallAlertItem *)v26 _setupDefinition];
    v10 = *(NSString **)((char *)&v26->_repopReason + 1);
    *(NSString **)((char *)&v26->_repopReason + 1) = v9;
  }
  v12 = v26;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v12;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v2);
  v4 = SUSUIStringForInstallAlertInstallStyle(*(unint64_t *)((char *)&self->super._controller + 1));
  v6 = +[NSString stringWithFormat:@"<%@:%p - %@>", v5, self, v4];

  return v6;
}

- (id)contentExtensionID
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  if ([(SUSUISoftwareUpdateInstallAlertItem *)self shouldShowCountdown]) {
    objc_storeStrong(location, @"com.apple.susuiservice.SUSUInstallAlertCFUserNotificationUIExtension");
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)extensionDictionary
{
  v19 = self;
  v18[1] = (id)a2;
  v18[0] = 0;
  if (*(unint64_t *)((char *)&self->_alertStyle + 1))
  {
    id v2 = [objc_alloc((Class)SUInstallOptions) initWithSUSUIInstallOptions:*(unint64_t *)((char *)&v19->_alertStyle + 1)];
    id v3 = v18[0];
    v18[0] = v2;
  }
  v20[0] = @"ExtensionAlertKeyHumanReadableUpdateName";
  id v14 = [(SUSUIBaseSoftwareUpdateAlertItem *)v19 descriptor];
  id v13 = [(SUDescriptor *)v14 humanReadableUpdateName];
  v21[0] = v13;
  v20[1] = @"ExtensionAlertKeyIsAutoInstall";
  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[*(id *)((char *)&v19->_alertStyle + 1) automaticInstallAttempt] & 1);
  v21[1] = v12;
  v20[2] = @"ExtensionAlertKeySingularText";
  id v11 = sub_137CC();
  id v10 = objc_msgSend(v11, "localizedStringForKey:value:table:", @"SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_SINGULAR");
  v21[2] = v10;
  v20[3] = @"ExtensionAlertKeyPluralText";
  id v9 = sub_137CC();
  id v8 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_PLURAL" value:&stru_62DF0 table:@"ui_alerts"];
  v21[3] = v8;
  v20[4] = @"ExtensionAlertKeyCompletionAction";
  v21[4] = @"ExtensionAlertKeyCompletionActionInstall";
  v20[5] = @"ExtensionAlertKeyIgnorableConstraints";
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)((char *)&v19->_alertStyle + 1) ignorableConstraints]);
  v21[5] = v7;
  v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");

  v15 = +[SUSUIPreferences sharedInstance];
  id location = [(SUSUIPreferences *)v15 restartCountdownOverrideIntervalSeconds];

  if (location) {
    [(NSMutableDictionary *)v17 setSafeObject:location forKey:@"ExtensionAlertKeyCountdown"];
  }
  v5 = v17;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(v18, 0);

  return v5;
}

- (id)title
{
  if ((unint64_t)&(*(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1))[-1]._followUpController
     + 4 > 2)
  {
    v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
    unsigned __int8 v5 = [(SUDescriptor *)v4 isSplatOnly];

    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    char v7 = 0;
    if (v5)
    {
      id v14 = sub_137CC();
      char v13 = 1;
      id v12 = [v14 localizedStringForKey:@"LOCKSCREEN_SPLAT_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v11 = 1;
      id v2 = v12;
    }
    else
    {
      id v10 = sub_137CC();
      char v9 = 1;
      id v8 = [v10 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v7 = 1;
      id v2 = v8;
    }
    id v15 = v2;
    if (v7) {

    }
    if (v9) {
    if (v11)
    }

    if (v13) {
  }
    }
  else
  {
    id v6 = sub_137CC();
    id v15 = [v6 localizedStringForKey:@"MANAGED_UPDATE" value:&stru_62DF0 table:@"ui_alerts"];
  }

  return v15;
}

- (id)message
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self _notificationMessage];
}

- (id)buttons
{
  objc_super v20 = self;
  v19[1] = (id)a2;
  v19[0] = +[NSMutableArray array];
  id location = +[SUSUIDDMController sharedInstance];
  id v15 = [(SUSUISoftwareUpdateInstallAlertItem *)v20 _installNowButton];
  objc_msgSend(v19[0], "addObject:");

  if ([(SUSUISoftwareUpdateInstallAlertItem *)v20 _shouldShowInstallLater])
  {
    id v14 = [(SUSUISoftwareUpdateInstallAlertItem *)v20 _installLaterButton];
    objc_msgSend(v19[0], "addObject:");
  }
  else
  {
    id v12 = [(SUSUIBaseSoftwareUpdateAlertItem *)v20 softwareUpdateController];
    char v16 = 0;
    char v13 = 1;
    if (![(SUSUISoftwareUpdateController *)v12 canDeferInstallation])
    {
      v17 = +[UIDevice currentDevice];
      char v16 = 1;
      char v11 = 0;
      if ((char *)[(UIDevice *)v17 userInterfaceIdiom] == (char *)&def_46F0 + 1)
      {
        unsigned __int8 v10 = 0;
        if (location) {
          unsigned __int8 v10 = [location shouldEnforceUpdate];
        }
        char v11 = v10 ^ 1;
      }
      char v13 = v11;
    }
    if (v16) {

    }
    if (v13)
    {
      id v9 = [(SUSUISoftwareUpdateInstallAlertItem *)v20 _remindMeLaterButton];
      objc_msgSend(v19[0], "addObject:");
    }
    else
    {
      char v7 = +[UIDevice currentDevice];
      BOOL v8 = (char *)[(UIDevice *)v7 userInterfaceIdiom] == (char *)&def_46F0 + 1;

      if (!v8)
      {
        id v6 = [(SUSUISoftwareUpdateInstallAlertItem *)v20 _emergencyButton];
        objc_msgSend(v19[0], "addObject:");
      }
    }
  }
  if (*(SUSUISoftwareUpdateController **)((char *)&v20->super._controller + 1) == (SUSUISoftwareUpdateController *)((char *)&def_46F0 + 1))
  {
    id v5 = [(SUSUISoftwareUpdateInstallAlertItem *)v20 _detailsButton];
    objc_msgSend(v19[0], "addObject:");
  }
  id v4 = objc_msgSend(v19[0], "copy", v19);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v3, 0);

  return v4;
}

- (void)dismissAlert
{
  id v5 = self;
  SEL v4 = a2;
  if (BYTE1(self->_download))
  {
    id v2 = [(SUSUIBaseSoftwareUpdateAlertItem *)v5 softwareUpdateController];
    [(SUSUISoftwareUpdateController *)v2 repopInstallAlertWithDefaultDurationFromNowForReason:*(void *)(&v5->_scheduleInstallAlertRepopOnDismiss + 1)];
  }
  v3.receiver = v5;
  v3.super_class = (Class)SUSUISoftwareUpdateInstallAlertItem;
  [(SUSUIBaseSoftwareUpdateAlertItem *)&v3 dismissAlert];
}

- (BOOL)reappearsAfterUnlock
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self _isMDMAlert];
}

- (BOOL)shouldShowInLockScreen
{
  unsigned __int8 v3 = 1;
  if (![(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown]) {
    unsigned __int8 v3 = [(SUSUISoftwareUpdateInstallAlertItem *)self _isMDMAlert];
  }
  return v3 & 1;
}

- (BOOL)showButtonsOnLockScreen
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown];
}

- (BOOL)forcesModalAlertAppearance
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown];
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)shouldShowCountdown
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown];
}

- (BOOL)reappearsAfterLock
{
  return [(SUSUISoftwareUpdateInstallAlertItem *)self shouldShowInLockScreen];
}

- (BOOL)undimsScreen
{
  unsigned __int8 v3 = 1;
  if ([*(id *)((char *)&self->_alertStyle + 1) automaticInstallAttempt]) {
    unsigned __int8 v3 = [(SUSUISoftwareUpdateInstallAlertItem *)self _isMDMAlert];
  }
  return v3 & 1;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  LOBYTE(v3) = 0;
  if (![(SUSUISoftwareUpdateInstallAlertItem *)self _isMDMAlert]) {
    unsigned int v3 = ![(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown];
  }
  return v3 & 1;
}

- (BOOL)allowMenuButtonDismissal
{
  LOBYTE(v3) = 0;
  if (![(SUSUISoftwareUpdateInstallAlertItem *)self _isMDMAlert]) {
    unsigned int v3 = ![(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown];
  }
  return v3 & 1;
}

- (id)allowedApps
{
  v5[2] = self;
  v5[1] = (id)a2;
  if ([(SUSUISoftwareUpdateInstallAlertItem *)self _shouldCountdown]) {
    id v2 = 0;
  }
  else {
    id v2 = &off_65530;
  }
  v5[0] = v2;
  id v4 = v5[0];
  objc_storeStrong(v5, 0);

  return v4;
}

- (id)_notificationMessage
{
  v56 = self;
  v55[1] = (id)a2;
  v55[0] = 0;
  id v54 = +[SUSUIDDMController sharedInstance];
  unint64_t v2 = *(unint64_t *)((char *)&v56->super._controller + 1);
  BOOL v3 = v2 > 1;
  unint64_t v4 = v2 - 1;
  if (v3)
  {
    unint64_t v6 = v4;
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    switch(v6)
    {
      case 0uLL:
        id location = 0;
        v39 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 softwareUpdateController];
        unsigned __int8 v40 = [(SUSUISoftwareUpdateController *)v39 canDeferInstallation];

        if (v40)
        {
          v37 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 descriptor];
          unsigned __int8 v38 = [(SUDescriptor *)v37 isSplatOnly];

          char v51 = 0;
          char v49 = 0;
          char v47 = 0;
          char v45 = 0;
          char v43 = 0;
          char v41 = 0;
          if (v38)
          {
            id v52 = [(SUSUISoftwareUpdateInstallAlertItem *)v56 _bodyTextToModelSpecificLocalizedKey:@"RSR_INSTALL_ALERT_AUTO_DOWNLOAD_BODY"];
            char v51 = 1;
            id v50 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
            char v49 = 1;
            v48 = +[NSString stringWithValidatedFormat:v52, @"%@", 0, v50 validFormatSpecifiers error];
            char v47 = 1;
            objc_storeStrong(&location, v48);
          }
          else
          {
            id v46 = [(SUSUISoftwareUpdateInstallAlertItem *)v56 _bodyTextToModelSpecificLocalizedKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_AUTO_DOWNLOAD_BODY"];
            char v45 = 1;
            id v44 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
            char v43 = 1;
            v42 = +[NSString stringWithValidatedFormat:v46, @"%@", 0, v44 validFormatSpecifiers error];
            char v41 = 1;
            objc_storeStrong(&location, v42);
          }
          if (v41) {

          }
          if (v43) {
          if (v45)
          }

          if (v47) {
          if (v49)
          }

          if (v51) {
        }
          }
        else
        {
          id v36 = sub_137CC();
          id v35 = [v36 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_FORCED_BODY" value:&stru_62DF0 table:@"ui_alerts"];
          id v34 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
          char v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v34);
          id v8 = location;
          id location = v7;
        }
        if (_BSIsInternalInstall())
        {
          id v28 = location;
          id v33 = sub_137CC();
          id v32 = [v33 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_AUTO_DOWNLOAD_INTERNAL_LIVABILITY" value:&stru_62DF0 table:@"ui_alerts"];
          v31 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 descriptor];
          id v30 = [(SUDescriptor *)v31 productBuildVersion];
          v29 = +[NSString stringWithFormat:v32, v30, @"https://builds.swe.apple.com"];
          id v9 = +[NSString stringWithFormat:@"%@\n\n%@", v28, v29];
          id v10 = v55[0];
          v55[0] = v9;
        }
        else
        {
          objc_storeStrong(v55, location);
        }
        objc_storeStrong(&location, 0);
        goto LABEL_32;
      case 1uLL:
      case 5uLL:
        goto LABEL_32;
      case 2uLL:
        break;
      case 3uLL:
      case 4uLL:
        id v27 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
        id v11 = objc_msgSend(v54, "alertBodyLocallizedStrWithUpdateName:");
        id v12 = v55[0];
        v55[0] = v11;

        goto LABEL_32;
      default:
        JUMPOUT(0);
    }
  }
  v25 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 softwareUpdateController];
  unsigned __int8 v26 = [(SUSUISoftwareUpdateController *)v25 canDeferInstallation];

  if (v26)
  {
    id v24 = sub_137CC();
    id v23 = [v24 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_NON_COUNTDOWN_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    id v22 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
    char v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v22);
    id v14 = v55[0];
    v55[0] = v13;
  }
  else
  {
    id v21 = sub_137CC();
    id v20 = [v21 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_FORCED_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    id v19 = [(SUSUIBaseSoftwareUpdateAlertItem *)v56 updateName];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v19);
    id v16 = v55[0];
    v55[0] = v15;
  }
LABEL_32:
  id v18 = v55[0];
  objc_storeStrong(&v54, 0);
  objc_storeStrong(v55, 0);

  return v18;
}

- (id)_stringFromAlertStyle:(unint64_t)a3
{
  if (a3 <= 1)
  {
    unint64_t v4 = a3 - 1;
    char v3 = 0;
  }
  else
  {
    unint64_t v4 = a3 - 1;
    char v3 = 1;
  }
  if (v3)
  {
    unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleNone";
  }
  else
  {
    switch(v4)
    {
      case 0uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleAutoDownload";
        break;
      case 1uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleInstallWithCountdown";
        break;
      case 2uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleInstallWithoutCountdown";
        break;
      case 3uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleEnforcedNow";
        break;
      case 4uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleEnforcedReminder";
        break;
      case 5uLL:
        unint64_t v6 = @"SUSUISoftwareUpdateInstallAlertStyleEnforcedCountdown";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v6;
}

- (BOOL)_shouldCountdown
{
  BOOL v3 = 1;
  if (*(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1) != (SUSUISoftwareUpdateController *)((char *)&def_46F0 + 2)) {
    return *(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1) == (SUSUISoftwareUpdateController *)((char *)&dword_4 + 2);
  }
  return v3;
}

- (BOOL)_isMDMAlert
{
  BOOL v3 = 1;
  if (*(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1) != (SUSUISoftwareUpdateController *)&dword_4) {
    return *(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1) == (SUSUISoftwareUpdateController *)((char *)&dword_4 + 1);
  }
  return v3;
}

- (void)_installUpdateNow
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)SUSUILog();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v14[0];
    os_log_type_t type = v13;
    unint64_t v2 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v2);
    unint64_t v6 = v10;
    id v12 = v6;
    id v9 = SUSUIStringForInstallType(0);
    id v11 = v9;
    sub_8A10((uint64_t)v16, (uint64_t)v6, (uint64_t)v11);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] %{public}@ action taken", v16, 0x16u);

    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(v14, 0);
  unsigned __int8 v5 = 0;
  if ([(SUSUIBaseAlertItem *)v15 isUILocked]) {
    unsigned __int8 v5 = [(SUSUISoftwareUpdateInstallAlertItem *)v15 shouldShowInLockScreen];
  }
  objc_msgSend(*(id *)((char *)&v15->_alertStyle + 1), "setRescheduleIfAuthFails:", v5 & 1, &selRef_isHomeScreenForeground);
  unint64_t v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)v15 softwareUpdateController];
  [(SUSUISoftwareUpdateController *)v4 installNowFromSource:0 options:*(Class *)((char *)&v15->super.super.super.isa + *(int *)(v3 + 2984))];

  if (v5) {
    [(SUSUISoftwareUpdateInstallAlertItem *)v15 dismissAlert];
  }
}

- (void)_scheduleInstallAlertRepopOnDismissWithReason:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BYTE1(v9->_download) = 1;
  if (!location[0])
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    unint64_t v4 = NSStringFromClass(v3);
    id v5 = location[0];
    location[0] = v4;
  }
  id v6 = [location[0] copy];
  char v7 = *(void **)(&v9->_scheduleInstallAlertRepopOnDismiss + 1);
  *(void *)(&v9->_scheduleInstallAlertRepopOnDismiss + 1) = v6;

  objc_storeStrong(location, 0);
}

- (void)_userAskedToDeferInstall
{
}

- (id)_bodyTextToModelSpecificLocalizedKey:(id)a3
{
  id location[2] = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  id v7 = sub_137CC();
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location[0]];
  id v8 = objc_msgSend(v7, "localizedStringForKey:value:table:");

  if (!v8)
  {
    id v5 = sub_137CC();
    id v8 = [v5 localizedStringForKey:location[0] value:&stru_62DF0 table:@"ui_alerts"];
  }
  id v4 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (void)_submitUserInteractionEvent:(id)a3
{
  id v10 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)SUAnalyticsEvent);
  id v8 = [v3 initWithEventName:kSUAnalyticsUsageEventName];
  [v8 setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:location[0]];
  id v5 = v8;
  uint64_t v4 = kSUSoftwareUpdateInstallAlertStyle;
  id v6 = SUSUIStringForInstallAlertInstallStyle(*(unint64_t *)((char *)&v10->super._controller + 1));
  objc_msgSend(v5, "setEventPayloadEntry:stringValue:", v4);

  id v7 = [(SUSUIBaseSoftwareUpdateAlertItem *)v10 softwareUpdateController];
  [(SUSUISoftwareUpdateController *)v7 submitSUAnalyticsEvent:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)_installNowButton
{
  id v14 = self;
  v13[1]  = (id)a2;
  v13[0]  = 0;
  id v12 = self;
  unint64_t v2 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v2);
  id v6 = [SUSUIAlertButtonDefinition alloc];
  id v7 = [(SUSUISoftwareUpdateInstallAlertItem *)v14 _installNowButtonText];
  id v9 = v11;
  id v10 = v12;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 1);
  id v4 = v13[0];
  v13[0]  = v3;

  id v8 = v13[0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(v13, 0);

  return v8;
}

- (id)_installNowButtonText
{
  id v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  unsigned __int8 v5 = [(SUDescriptor *)v4 isSplatOnly];

  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v13 = sub_137CC();
    char v12 = 1;
    id v11 = [v13 localizedStringForKey:@"RSR_INSTALL_ALERT_ACTION_RESTART_NOW" value:&stru_62DF0 table:@"ui_alerts"];
    char v10 = 1;
    id v2 = v11;
  }
  else
  {
    id v9 = sub_137CC();
    char v8 = 1;
    id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_INSTALL_NOW" value:&stru_62DF0 table:@"ui_alerts"];
    char v6 = 1;
    id v2 = v7;
  }
  id v14 = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {

  }
  return v14;
}

- (id)_installLaterButton
{
  id v15 = self;
  v14[1]  = (id)a2;
  v14[0]  = 0;
  id v13 = self;
  id v2 = (objc_class *)objc_opt_class();
  char v12 = NSStringFromClass(v2);
  char v6 = [SUSUIAlertButtonDefinition alloc];
  id v7 = [(SUSUISoftwareUpdateInstallAlertItem *)v15 _installLaterButtonText];
  id v9 = v12;
  char v10 = v13;
  id v11 = v15;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 0);
  id v4 = v14[0];
  v14[0]  = v3;

  id v8 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v8;
}

- (id)_installLaterButtonText
{
  id v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  unsigned __int8 v5 = [(SUDescriptor *)v4 isSplatOnly];

  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v13 = sub_137CC();
    char v12 = 1;
    id v11 = [v13 localizedStringForKey:@"RSR_INSTALL_ALERT_ACTION_NOT_NOW" value:&stru_62DF0 table:@"ui_alerts"];
    char v10 = 1;
    id v2 = v11;
  }
  else
  {
    id v9 = sub_137CC();
    char v8 = 1;
    id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_LATER" value:&stru_62DF0 table:@"ui_alerts"];
    char v6 = 1;
    id v2 = v7;
  }
  id v14 = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {

  }
  return v14;
}

- (id)_remindMeLaterButton
{
  id v16 = self;
  v15[1]  = (id)a2;
  v15[0]  = 0;
  id v14 = self;
  id v2 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v2);
  char v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_137CC();
  id v7 = [v8 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_REMIND_ME_LATER" value:&stru_62DF0 table:@"ui_alerts"];
  char v10 = v13;
  id v11 = v14;
  char v12 = v16;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 2, 0);
  id v4 = v15[0];
  v15[0]  = v3;

  id v9 = v15[0];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(v15, 0);

  return v9;
}

- (id)_emergencyButton
{
  id v14[2] = self;
  v14[1]  = (id)a2;
  v14[0]  = 0;
  id v13 = self;
  id v2 = (objc_class *)objc_opt_class();
  char v12 = NSStringFromClass(v2);
  char v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_137CC();
  id v7 = [v8 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_EMERGENCY" value:&stru_62DF0 table:@"ui_alerts"];
  char v10 = v12;
  id v11 = v13;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 2, 0);
  id v4 = v14[0];
  v14[0]  = v3;

  id v9 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

- (id)_detailsButton
{
  id v14[2] = self;
  v14[1]  = (id)a2;
  v14[0]  = 0;
  id v13 = self;
  id v2 = (objc_class *)objc_opt_class();
  char v12 = NSStringFromClass(v2);
  char v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_137CC();
  id v7 = [v8 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_DETAILS" value:&stru_62DF0 table:@"ui_alerts"];
  char v10 = v12;
  id v11 = v13;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 0);
  id v4 = v14[0];
  v14[0]  = v3;

  id v9 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

- (BOOL)_shouldShowInstallLater
{
  if (*(SUSUIAlertItemDefinition **)((char *)&self->_definition + 1)) {
    id v5 = [*(id *)((char *)&self->_definition + 1) scheduleType];
  }
  else {
    id v5 = 0;
  }
  id v3 = [(SUSUIBaseSoftwareUpdateAlertItem *)self softwareUpdateController];
  BOOL v4 = 0;
  if ([(SUSUISoftwareUpdateController *)v3 canDeferInstallation])
  {
    BOOL v4 = 0;
    if (![(SUSUIBaseAlertItem *)self isUILocked]) {
      BOOL v4 = v5 != 0;
    }
  }

  return v4;
}

- (void)_activateInstallLaterAlert
{
  v42  = self;
  location[1]  = (id)a2;
  location[0]  = (id)SUSUILog();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log  = location[0];
    os_log_type_t type = v40;
    id v2 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v2);
    v39  = v21;
    sub_8120((uint64_t)v43, (uint64_t)v39);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Showing install tonight alert.", v43, 0xCu);

    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(location, 0);
  id v38 = v42;
  v37  = *(id *)((char *)&v42->_installOptions + 1);
  id v36 = *(id *)((char *)&v42->_definition + 1);
  v17  = +[SUKeybagInterface sharedInstance];
  unsigned __int8 v18 = [(SUKeybagInterface *)v17 hasPasscodeSet];

  if (v18)
  {
    char v10 = [SUSUIFullScreenAuthenticationAlert alloc];
    id v14 = [v37 descriptor];
    uint64_t v8 = *(uint64_t *)((char *)&v42->_definition + 1);
    id v13 = [v38 softwareUpdateController];
    unsigned __int8 v9 = [v13 canDeferInstallation];
    id v12 = [v38 softwareUpdateController];
    id v11 = [v12 clientQueue];
    v29  = _NSConcreteStackBlock;
    int v30 = -1073741824;
    v31  = 0;
    id v32 = sub_13554;
    id v33 = &unk_5D050;
    id v34 = v38;
    id v35 = [(SUSUIFullScreenAuthenticationAlert *)v10 initWithDescriptor:v14 autoInstallForecast:v8 forInstallTonight:1 canDeferInstallation:v9 & 1 completionQueue:v11 completionBlock:&v29];

    id v16 = [v38 softwareUpdateController];
    id v15 = v35;
    id v23 = _NSConcreteStackBlock;
    int v24 = -1073741824;
    v25  = 0;
    unsigned __int8 v26 = sub_135E4;
    id v27 = &unk_5CC30;
    id v28 = v38;
    [v16 presentFullScreenAlert:v15 completion:&v23];

    objc_storeStrong(&v28, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v3 = [SUSUISoftwareUpdateInstallLaterAlertItem alloc];
    id v5 = [v38 descriptor];
    id v4 = [v38 softwareUpdateController];
    id v22 = -[SUSUISoftwareUpdateInstallLaterAlertItem initWithDescriptor:softwareUpdateController:tryTonightOperationForecast:](v3, "initWithDescriptor:softwareUpdateController:tryTonightOperationForecast:", v5);

    id v7 = [v38 softwareUpdateController];
    id v6 = [v7 alertPresentationManager];
    [v6 presentAlert:v22 animated:1];

    [v38 dismissAlert];
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
}

- (id)_setupDefinition
{
  unsigned __int8 v9 = self;
  v8[1]  = (id)a2;
  id v3 = [SUSUIAlertItemDefinition alloc];
  id v6 = [(SUSUISoftwareUpdateInstallAlertItem *)v9 title];
  id v5 = [(SUSUISoftwareUpdateInstallAlertItem *)v9 message];
  id v4 = [(SUSUISoftwareUpdateInstallAlertItem *)v9 buttons];
  v8[0]  = -[SUSUIAlertItemDefinition initWithTitle:message:buttons:](v3, "initWithTitle:message:buttons:", v6, v5);

  id v7 = v8[0];
  objc_storeStrong(v8, 0);

  return v7;
}

- (unint64_t)style
{
  return *(unint64_t *)((char *)&self->super._controller + 1);
}

- (void).cxx_destruct
{
}

@end