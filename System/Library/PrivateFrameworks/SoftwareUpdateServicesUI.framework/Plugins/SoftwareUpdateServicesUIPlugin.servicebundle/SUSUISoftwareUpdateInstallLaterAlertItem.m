@interface SUSUISoftwareUpdateInstallLaterAlertItem
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)undimsScreen;
- (SUSUISoftwareUpdateInstallLaterAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 tryTonightOperationForecast:(id)a5;
- (id)_alertMessageForForecast:(id)a3;
- (id)_installTonightLabelForScheduleType:(int64_t)a3;
- (id)buttons;
- (id)message;
- (id)title;
- (void)_scheduleInstallAlertRepopOnDismissWithReason:(id)a3;
- (void)dismissAlert;
@end

@implementation SUSUISoftwareUpdateInstallLaterAlertItem

- (SUSUISoftwareUpdateInstallLaterAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 tryTonightOperationForecast:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSUISoftwareUpdateInstallLaterAlertItem;
  v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)&v11 initWithDescriptor:location[0] softwareUpdateController:v13];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    BYTE1(v15->_repopReason) = 0;
    BYTE2(v15->_repopReason) = 0;
    objc_storeStrong((id *)((char *)&v15->super._controller + 1), v12);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)title
{
  v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  unsigned __int8 v5 = [(SUDescriptor *)v4 isSplatOnly];

  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v13 = sub_19CA8();
    char v12 = 1;
    id v11 = [v13 localizedStringForKey:@"LOCKSCREEN_SPLAT_UPGRADE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v10 = 1;
    id v2 = v11;
  }
  else
  {
    id v9 = sub_19CA8();
    char v8 = 1;
    id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v6 = 1;
    id v2 = v7;
  }
  v14 = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {

  }
  return v14;
}

- (id)message
{
  return -[SUSUISoftwareUpdateInstallLaterAlertItem _alertMessageForForecast:](self, "_alertMessageForForecast:", *(SUSUISoftwareUpdateController **)((char *)&self->super._controller + 1), a2, self);
}

- (id)buttons
{
  v45 = self;
  v44[1] = (id)a2;
  id v2 = (objc_class *)objc_opt_class();
  v44[0] = NSStringFromClass(v2);
  id v43 = +[NSMutableArray array];
  objc_initWeak(&location, v45);
  id v41 = 0;
  if (*(SUSUISoftwareUpdateController **)((char *)&v45->super._controller + 1)) {
    id v15 = [*(id *)((char *)&v45->super._controller + 1) scheduleType];
  }
  else {
    id v15 = 0;
  }
  id v41 = v15;
  if (![(SUSUIBaseAlertItem *)v45 isUILocked]
    && *(SUSUISoftwareUpdateController **)((char *)&v45->super._controller + 1)
    && v41)
  {
    v14 = [SUSUIAlertButtonDefinition alloc];
    id v13 = [(SUSUISoftwareUpdateInstallLaterAlertItem *)v45 _installTonightLabelForScheduleType:v41];
    v32 = _NSConcreteStackBlock;
    int v33 = -1073741824;
    int v34 = 0;
    v35 = sub_19278;
    v36 = &unk_5EFD8;
    id v37 = v44[0];
    v38 = v45;
    objc_copyWeak(&v39, &location);
    id v40 = [(SUSUIAlertButtonDefinition *)v14 initWithLabel:v13 presentationStyle:0 isPreferredButton:1 handler:&v32];

    [v43 addObject:v40];
    objc_storeStrong(&v40, 0);
    objc_destroyWeak(&v39);
    objc_storeStrong((id *)&v38, 0);
    objc_storeStrong(&v37, 0);
  }
  id v11 = [(SUSUIBaseSoftwareUpdateAlertItem *)v45 softwareUpdateController];
  unsigned __int8 v12 = [(SUSUISoftwareUpdateController *)v11 canDeferInstallation];

  if (v12)
  {
    char v10 = [SUSUIAlertButtonDefinition alloc];
    id v9 = sub_19CA8();
    id v8 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_REMIND_ME_LATER" value:&stru_62DF0 table:@"ui_alerts"];
    v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    v27 = sub_193C4;
    v28 = &unk_5F000;
    id v29 = v44[0];
    objc_copyWeak(&v30, &location);
    id v31 = [(SUSUIAlertButtonDefinition *)v10 initWithLabel:v8 presentationStyle:2 isPreferredButton:0 handler:&v24];

    [v43 addObject:v31];
    objc_storeStrong(&v31, 0);
    objc_destroyWeak(&v30);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    id v7 = [SUSUIAlertButtonDefinition alloc];
    id v6 = sub_19CA8();
    id v5 = [v6 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_EMERGENCY" value:&stru_62DF0 table:@"ui_alerts"];
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_19530;
    v20 = &unk_5F000;
    id v21 = v44[0];
    objc_copyWeak(&v22, &location);
    id v23 = [(SUSUIAlertButtonDefinition *)v7 initWithLabel:v5 presentationStyle:0 isPreferredButton:0 handler:&v16];

    [v43 addObject:v23];
    objc_storeStrong(&v23, 0);
    objc_destroyWeak(&v22);
    objc_storeStrong(&v21, 0);
  }
  id v4 = [v43 copy];
  objc_destroyWeak(&location);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(v44, 0);

  return v4;
}

- (void)dismissAlert
{
  id v5 = self;
  SEL v4 = a2;
  if (BYTE2(self->_repopReason))
  {
    id v2 = [(SUSUIBaseSoftwareUpdateAlertItem *)v5 softwareUpdateController];
    [(SUSUISoftwareUpdateController *)v2 repopInstallAlertWithDefaultDurationFromNowForReason:*(SUAutoInstallForecast **)((char *)&v5->_forecast + 1)];
  }
  v3.receiver = v5;
  v3.super_class = (Class)SUSUISoftwareUpdateInstallLaterAlertItem;
  [(SUSUIBaseSoftwareUpdateAlertItem *)&v3 dismissAlert];
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (void)_scheduleInstallAlertRepopOnDismissWithReason:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BYTE2(v9->_repopReason) = 1;
  if (!location[0])
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    SEL v4 = NSStringFromClass(v3);
    id v5 = location[0];
    location[0] = v4;
  }
  id v6 = (SUAutoInstallForecast *)[location[0] copy];
  id v7 = *(SUAutoInstallForecast **)((char *)&v9->_forecast + 1);
  *(SUAutoInstallForecast **)((char *)&v9->_forecast + 1) = v6;

  objc_storeStrong(location, 0);
}

- (id)_alertMessageForForecast:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *(_DWORD *)&v18[8] = 0;
  int v17 = [(SUSUIBaseSoftwareUpdateAlertItem *)v20 softwareUpdateController];
  *(void *)int v18 = [(SUSUISoftwareUpdateController *)v17 canDeferInstallation];

  if (v18[0])
  {
    id v13 = objc_alloc((Class)NSString);
    id v16 = sub_19CA8();
    id v15 = [v16 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_AUTO_INSTALL_BODY_FALLBACK" value:&stru_62DF0 table:@"ui_alerts"];
    id v14 = [(SUSUIBaseSoftwareUpdateAlertItem *)v20 updateName];
    id v3 = objc_msgSend(v13, "initWithFormat:", v15, v14);
    SEL v4 = *(void **)&v18[4];
    *(void *)&v18[4] = v3;
  }
  else
  {
    id v9 = objc_alloc((Class)NSString);
    id v12 = sub_19CA8();
    id v11 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_FORCED_BODY" value:&stru_62DF0 table:@"ui_alerts"];
    id v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)v20 updateName];
    id v5 = objc_msgSend(v9, "initWithFormat:", v11, v10);
    id v6 = *(void **)&v18[4];
    *(void *)&v18[4] = v5;
  }
  id v8 = *(id *)&v18[4];
  objc_storeStrong((id *)&v18[4], 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)_installTonightLabelForScheduleType:(int64_t)a3
{
  v14[3] = self;
  v14[2] = (id)a2;
  v14[1] = (id)a3;
  v14[0] = 0;
  switch(a3)
  {
    case 1:
      id v12 = sub_19CA8();
      id v5 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_INSTALL_TONIGHT" value:&stru_62DF0 table:@"ui_alerts"];
      id v6 = v14[0];
      v14[0] = v5;

      break;
    case 2:
      id v11 = sub_19CA8();
      id v7 = [v11 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_INSTALL_TOMORROW_NIGHT" value:&stru_62DF0 table:@"ui_alerts"];
      id v8 = v14[0];
      v14[0] = v7;

      break;
    case 3:
      id v13 = sub_19CA8();
      id v3 = [v13 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ACTION_INSTALL_LATER" value:&stru_62DF0 table:@"ui_alerts"];
      id v4 = v14[0];
      v14[0] = v3;

      break;
  }
  id v10 = v14[0];
  objc_storeStrong(v14, 0);

  return v10;
}

- (void).cxx_destruct
{
}

@end