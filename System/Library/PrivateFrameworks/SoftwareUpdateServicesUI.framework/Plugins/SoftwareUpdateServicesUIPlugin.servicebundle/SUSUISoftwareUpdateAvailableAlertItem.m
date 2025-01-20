@interface SUSUISoftwareUpdateAvailableAlertItem
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (id)buttons;
- (id)message;
- (id)title;
- (void)_activateInstallLaterAlert:(id)a3;
- (void)downloadAndInstall;
- (void)downloadAndInstallLater;
@end

@implementation SUSUISoftwareUpdateAvailableAlertItem

- (id)title
{
  v18 = self;
  location[1] = (id)a2;
  v8 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  id v7 = [(SUDescriptor *)v8 documentation];
  location[0] = [v7 notificationTitleString];

  if (location[0])
  {
    id v19 = location[0];
  }
  else
  {
    v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)v18 descriptor];
    unsigned __int8 v6 = [(SUDescriptor *)v5 isSplatOnly];

    char v15 = 0;
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    if (v6)
    {
      id v16 = sub_8E1C();
      char v15 = 1;
      id v14 = [v16 localizedStringForKey:@"LOCKSCREEN_SPLAT_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v13 = 1;
      id v2 = v14;
    }
    else
    {
      id v12 = sub_8E1C();
      char v11 = 1;
      id v10 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v9 = 1;
      id v2 = v10;
    }
    id v19 = v2;
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    if (v15) {
  }
    }
  objc_storeStrong(location, 0);
  v3 = v19;

  return v3;
}

- (id)message
{
  id v14 = self;
  v13[1] = (id)a2;
  id v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  id v9 = [(SUDescriptor *)v10 documentation];
  v13[0] = [v9 notificationBodyString];

  if (v13[0])
  {
    char v15 = (NSString *)v13[0];
    int v12 = 1;
  }
  else
  {
    id v8 = sub_8E1C();
    id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_BODY"];
    id v11 = objc_msgSend(v8, "localizedStringForKey:value:table:");

    if (!v11)
    {
      id v6 = sub_8E1C();
      id v11 = [v6 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    }
    id v4 = v11;
    id v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)v14 updateName];
    char v15 = +[NSString stringWithValidatedFormat:v4 validFormatSpecifiers:@"%@" error:v5];

    int v12 = 1;
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(v13, 0);
  id v2 = v15;

  return v2;
}

- (id)buttons
{
  v36[2] = self;
  v36[1] = (id)a2;
  v36[0] = 0;
  v35 = 0;
  v34 = 0;
  v33 = 0;
  v32 = self;
  id v11 = [SUSUIAlertButtonDefinition alloc];
  id v13 = sub_8E1C();
  id v12 = objc_msgSend(v13, "localizedStringForKey:value:table:", @"SOFTWARE_UPDATE_AVAILABLE_ALERT_ACTION_DOWNLOAD_AND_INSTALL");
  v26[1] = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  v29 = sub_7918;
  v30 = &unk_5CC30;
  v31 = v32;
  id v2 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v11, "initWithLabel:presentationStyle:isPreferredButton:handler:", v12);
  v3 = v35;
  v35 = v2;

  id v14 = [SUSUIAlertButtonDefinition alloc];
  id v16 = sub_8E1C();
  id v15 = [v16 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_ACTION_LATER" value:&stru_62DF0 table:@"ui_alerts"];
  v21[1] = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_79E0;
  v25 = &unk_5CC30;
  v26[0] = v32;
  id v4 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v14, "initWithLabel:presentationStyle:isPreferredButton:handler:", v15, 0, 0);
  id v5 = v34;
  v34 = v4;

  v17 = [SUSUIAlertButtonDefinition alloc];
  id v19 = sub_8E1C();
  id v18 = [v19 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_ACTION_DETAILS" value:&stru_62DF0 table:@"ui_alerts"];
  v21[0] = v32;
  id v6 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v17, "initWithLabel:presentationStyle:isPreferredButton:handler:", v18, 2, 0);
  id v7 = v33;
  v33 = v6;

  v37[0] = v35;
  v37[1] = v34;
  v37[2] = v33;
  id v8 = +[NSArray arrayWithObjects:v37 count:3];
  id v9 = v36[0];
  v36[0] = v8;

  id v20 = v36[0];
  objc_storeStrong(v21, 0);
  objc_storeStrong(v26, 0);
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong((id *)&v32, 0);
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong((id *)&v34, 0);
  objc_storeStrong((id *)&v35, 0);
  objc_storeStrong(v36, 0);

  return v20;
}

- (void)downloadAndInstall
{
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = self;
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_7E78;
  id v19 = &unk_5CFB0;
  id v20 = v23[0];
  v21 = v24;
  int v22 = objc_retainBlock(&v15);
  id v2 = [SUSUIFullScreenAuthenticationAlert alloc];
  id v5 = [v23[0] descriptor];
  id v4 = [v23[0] softwareUpdateController];
  id v3 = [v4 clientQueue];
  v8[1] = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_83D8;
  id v12 = &unk_5CFD8;
  id v13 = v22;
  id v14 = -[SUSUIFullScreenAuthenticationAlert initWithDescriptor:autoInstallForecast:forInstallTonight:canDeferInstallation:completionQueue:completionBlock:](v2, "initWithDescriptor:autoInstallForecast:forInstallTonight:canDeferInstallation:completionQueue:completionBlock:", v5);

  id v7 = [v23[0] softwareUpdateController];
  id v6 = v14;
  v8[0] = v23[0];
  objc_msgSend(v7, "presentFullScreenAlert:completion:", v6);

  objc_storeStrong(v8, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v23, 0);
}

- (void)downloadAndInstallLater
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = self;
  id v2 = objc_alloc((Class)SUDownloadOptions);
  id v3 = [(SUSUIBaseSoftwareUpdateAlertItem *)v15 descriptor];
  id v13 = objc_msgSend(v2, "initWithDescriptor:");

  [v13 setDownloadOnly:1];
  [v13 setUserUpdateTonight:1];
  id v5 = [(SUSUIBaseSoftwareUpdateAlertItem *)v15 softwareUpdateController];
  id v4 = v13;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_8610;
  int v10 = &unk_5D028;
  id v11 = v14[0];
  id v12 = v15;
  -[SUSUISoftwareUpdateController startDownloadWithOptions:withResult:](v5, "startDownloadWithOptions:withResult:", v4);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (void)_activateInstallLaterAlert:(id)a3
{
  int v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = (id)SUSUILog();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    log = v25;
    os_log_type_t type = v24;
    id v3 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v3);
    int v23 = v14;
    sub_8120((uint64_t)v28, (uint64_t)v23);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Showing install tonight alert.", v28, 0xCu);

    objc_storeStrong((id *)&v23, 0);
  }
  objc_storeStrong(&v25, 0);
  id v22 = v27;
  int v10 = +[SUKeybagInterface sharedInstance];
  unsigned __int8 v11 = [(SUKeybagInterface *)v10 hasPasscodeSet];

  if (v11)
  {
    id v9 = [v22 softwareUpdateController];
    int v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    id v19 = sub_8DC8;
    id v20 = &unk_5D050;
    id v21 = v22;
    [v9 _presentAuthenticationUIForInstallation:&v16 withInstallType:1 withInstallOperationForecast:location[0]];

    objc_storeStrong(&v21, 0);
  }
  else
  {
    id v4 = [SUSUISoftwareUpdateInstallLaterAlertItem alloc];
    id v6 = [v22 descriptor];
    id v5 = [v22 softwareUpdateController];
    id v15 = -[SUSUISoftwareUpdateInstallLaterAlertItem initWithDescriptor:softwareUpdateController:tryTonightOperationForecast:](v4, "initWithDescriptor:softwareUpdateController:tryTonightOperationForecast:", v6);

    id v8 = [v22 softwareUpdateController];
    id v7 = [v8 alertPresentationManager];
    [v7 presentAlert:v15 animated:1];

    [v22 dismissAlert];
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

@end