@interface SUSUISoftwareUpdateDownloadFailedAlertItem
- (BOOL)_isSettingsLaunchable;
- (BOOL)allowInSetup;
- (NSError)error;
- (SUSUISoftwareUpdateDownloadFailedAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 fromSettings:(BOOL)a5;
- (id)_notificationMessage;
- (id)_notificationTitle;
- (id)buttons;
- (id)message;
- (id)title;
- (unint64_t)_failureTypeForErrorCode:(int64_t)a3;
- (void)setError:(id)a3;
@end

@implementation SUSUISoftwareUpdateDownloadFailedAlertItem

- (SUSUISoftwareUpdateDownloadFailedAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 fromSettings:(BOOL)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  BOOL v12 = a5;
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSUISoftwareUpdateDownloadFailedAlertItem;
  v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)&v11 initWithDescriptor:location[0] softwareUpdateController:v13];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10) {
    BYTE1(v15->_error) = v12;
  }
  v7 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)title
{
  return [(SUSUISoftwareUpdateDownloadFailedAlertItem *)self _notificationTitle];
}

- (id)message
{
  return [(SUSUISoftwareUpdateDownloadFailedAlertItem *)self _notificationMessage];
}

- (id)buttons
{
  v52 = self;
  v51[1] = (id)a2;
  v51[0] = 0;
  id v50 = 0;
  id v49 = self;
  id v48 = +[NSMutableArray array];
  if ((char *)-[SUSUISoftwareUpdateDownloadFailedAlertItem _failureTypeForErrorCode:](v52, "_failureTypeForErrorCode:", [*(id *)((char *)&v52->super._controller + 1) code]) == (char *)&def_46F0 + 1)
  {
    if ([(SUSUISoftwareUpdateDownloadFailedAlertItem *)v52 _isSettingsLaunchable])
    {
      v21 = [SUSUIAlertButtonDefinition alloc];
      id v23 = sub_B8E4();
      id v22 = [v23 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_STORAGE_ALERT_ACTION" value:&stru_62DF0 table:@"ui_alerts"];
      v42 = _NSConcreteStackBlock;
      int v43 = -1073741824;
      int v44 = 0;
      v45 = sub_AD6C;
      v46 = &unk_5CC30;
      id v47 = v49;
      v2 = [(SUSUIAlertButtonDefinition *)v21 initWithLabel:v22 presentationStyle:0 isPreferredButton:1 handler:&v42];
      id v3 = v51[0];
      v51[0] = v2;

      [v48 addObject:v51[0]];
      objc_storeStrong(&v47, 0);
    }
    v18 = [SUSUIAlertButtonDefinition alloc];
    id v20 = sub_B8E4();
    id v19 = [v20 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_STORAGE_ALERT_CANCEL" value:&stru_62DF0 table:@"ui_alerts"];
    v36 = _NSConcreteStackBlock;
    int v37 = -1073741824;
    int v38 = 0;
    v39 = sub_ADEC;
    v40 = &unk_5CC30;
    id v41 = v49;
    v4 = [(SUSUIAlertButtonDefinition *)v18 initWithLabel:v19 presentationStyle:2 isPreferredButton:0 handler:&v36];
    id v5 = v50;
    id v50 = v4;

    [v48 addObject:v50];
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v15 = [SUSUIAlertButtonDefinition alloc];
    id v17 = sub_B8E4();
    id v16 = [v17 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_ALERT_CANCEL" value:&stru_62DF0 table:@"ui_alerts"];
    v30 = _NSConcreteStackBlock;
    int v31 = -1073741824;
    int v32 = 0;
    v33 = sub_AE20;
    v34 = &unk_5CC30;
    id v35 = v49;
    v6 = [(SUSUIAlertButtonDefinition *)v15 initWithLabel:v16 presentationStyle:2 isPreferredButton:0 handler:&v30];
    id v7 = v50;
    id v50 = v6;

    [v48 addObject:v50];
    if ([(SUSUISoftwareUpdateDownloadFailedAlertItem *)v52 _isSettingsLaunchable]
      && (BYTE1(v52->_error) & 1) == 0)
    {
      BOOL v12 = [SUSUIAlertButtonDefinition alloc];
      id v14 = sub_B8E4();
      id v13 = [v14 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_ALERT_ACTION" value:&stru_62DF0 table:@"ui_alerts"];
      v24 = _NSConcreteStackBlock;
      int v25 = -1073741824;
      int v26 = 0;
      v27 = sub_AE54;
      v28 = &unk_5CC30;
      id v29 = v49;
      v8 = [(SUSUIAlertButtonDefinition *)v12 initWithLabel:v13 presentationStyle:0 isPreferredButton:1 handler:&v24];
      id v9 = v51[0];
      v51[0] = v8;

      [v48 addObject:v51[0]];
      objc_storeStrong(&v29, 0);
    }
    objc_storeStrong(&v35, 0);
  }
  id v11 = [v48 copy];
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v51, 0);

  return v11;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (id)_notificationTitle
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v4 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  unsigned __int8 v5 = [(SUDescriptor *)v4 isSplatOnly];

  if ((char *)-[SUSUISoftwareUpdateDownloadFailedAlertItem _failureTypeForErrorCode:](v23, "_failureTypeForErrorCode:", [*(id *)((char *)&v23->super._controller + 1) code]) == (char *)&def_46F0 + 1)
  {
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    char v14 = 0;
    if (v5)
    {
      id v21 = sub_B8E4();
      char v20 = 1;
      id v19 = [v21 localizedStringForKey:@"RSR_DOWNLOAD_FAILURE_STORAGE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v18 = 1;
      objc_storeStrong(location, v19);
    }
    else
    {
      id v17 = sub_B8E4();
      char v16 = 1;
      id v15 = [v17 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_STORAGE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v14 = 1;
      objc_storeStrong(location, v15);
    }
    if (v14) {

    }
    if (v16) {
    if (v18)
    }

    if (v20) {
  }
    }
  else
  {
    char v12 = 0;
    char v10 = 0;
    char v8 = 0;
    char v6 = 0;
    if (v5)
    {
      id v13 = sub_B8E4();
      char v12 = 1;
      id v11 = [v13 localizedStringForKey:@"RSR_DOWNLOAD_FAILURE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v10 = 1;
      objc_storeStrong(location, v11);
    }
    else
    {
      id v9 = sub_B8E4();
      char v8 = 1;
      id v7 = [v9 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
      char v6 = 1;
      objc_storeStrong(location, v7);
    }
    if (v6) {

    }
    if (v8) {
    if (v10)
    }

    if (v12) {
  }
    }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_notificationMessage
{
  v28 = self;
  v27[1] = (id)a2;
  v27[0] = 0;
  if ((char *)-[SUSUISoftwareUpdateDownloadFailedAlertItem _failureTypeForErrorCode:](self, "_failureTypeForErrorCode:", [*(id *)((char *)&self->super._controller + 1) code]) == (char *)&def_46F0 + 1)
  {
    if ([(SUSUISoftwareUpdateDownloadFailedAlertItem *)v28 _isSettingsLaunchable])
    {
      id v24 = sub_B8E4();
      id v23 = [v24 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_STORAGE_ALERT_BODY" value:&stru_62DF0 table:@"ui_alerts"];
      id v22 = [(SUSUIBaseSoftwareUpdateAlertItem *)v28 updateName];
      v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v22);
      id v3 = v27[0];
      v27[0] = v2;
    }
    else
    {
      id v21 = sub_B8E4();
      id v20 = [v21 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_STORAGE_ALERT_BODY_UNLAUNCHABLE" value:&stru_62DF0 table:@"ui_alerts"];
      id v19 = [(SUSUIBaseSoftwareUpdateAlertItem *)v28 updateName];
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v19);
      id v5 = v27[0];
      v27[0] = v4;
    }
  }
  else
  {
    id v18 = sub_B8E4();
    id v17 = [v18 localizedStringForKey:@"SOFTWARE_UPDATE_DOWNLOAD_FAILURE_ALERT_BODY_GENERIC" value:&stru_62DF0 table:@"ui_alerts"];
    id v16 = [(SUSUIBaseSoftwareUpdateAlertItem *)v28 updateName];
    char v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v16);
    id v7 = v27[0];
    v27[0] = v6;
  }
  char v14 = +[BSPlatform sharedInstance];
  unsigned __int8 v15 = [(BSPlatform *)v14 isInternalInstall];

  if (v15)
  {
    id v13 = [*(id *)((char *)&v28->super._controller + 1) userInfo];
    id v26 = [v13 objectForKey:NSLocalizedRecoverySuggestionErrorKey];

    if (v26) {
      id v12 = v26;
    }
    else {
      id v12 = *(SUSUISoftwareUpdateController **)((char *)&v28->super._controller + 1);
    }
    int v25 = +[NSString stringWithFormat:@"\n\n[Internal Only]\n%@", v12];
    char v8 = +[NSString stringWithFormat:@"%@%@", v27[0], v25];
    id v9 = v27[0];
    v27[0] = v8;

    objc_storeStrong((id *)&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  id v11 = v27[0];
  objc_storeStrong(v27, 0);

  return v11;
}

- (unint64_t)_failureTypeForErrorCode:(int64_t)a3
{
  if (a3 == 6) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)_isSettingsLaunchable
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init((Class)FBSSystemService);
  unsigned __int8 v3 = objc_msgSend(v4[0], "canOpenApplication:reason:", SUSUISettingsBundleIdentifier);
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (NSError)error
{
  return *(NSError **)((char *)&self->super._controller + 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end