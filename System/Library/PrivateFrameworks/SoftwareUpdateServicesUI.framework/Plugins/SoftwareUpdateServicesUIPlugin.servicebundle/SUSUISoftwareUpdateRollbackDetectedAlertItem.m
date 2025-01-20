@interface SUSUISoftwareUpdateRollbackDetectedAlertItem
- (SUManagerClient)suClient;
- (SUSUISoftwareUpdateRollbackDetectedAlertItem)initWithRollback:(id)a3 options:(id)a4 controller:(id)a5 suClient:(id)a6 completion:(id)a7;
- (id)_cancelButton;
- (id)_removeButton;
- (id)_setupDefinition;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUSUISoftwareUpdateRollbackDetectedAlertItem

- (SUSUISoftwareUpdateRollbackDetectedAlertItem)initWithRollback:(id)a3 options:(id)a4 controller:(id)a5 suClient:(id)a6 completion:(id)a7
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  id v20 = 0;
  objc_storeStrong(&v20, a7);
  v7 = v25;
  v25 = 0;
  v19.receiver = v7;
  v19.super_class = (Class)SUSUISoftwareUpdateRollbackDetectedAlertItem;
  v18 = [(SUSUIBaseRollbackAlertItem *)&v19 initWithRollbackDescriptor:location[0] softwareUpdateController:v22];
  v25 = v18;
  objc_storeStrong((id *)&v25, v18);
  if (v18)
  {
    v8 = (SUSUISoftwareUpdateController *)[(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v25 _setupDefinition];
    v9 = *(SUSUISoftwareUpdateController **)((char *)&v25->super._controller + 1);
    *(SUSUISoftwareUpdateController **)((char *)&v25->super._controller + 1) = v8;

    objc_storeStrong((id *)((char *)&v25->_definition + 1), location[0]);
    objc_storeStrong((id *)((char *)&v25->_rollback + 1), v23);
    objc_storeStrong((id *)((char *)&v25->_options + 1), v22);
    objc_storeStrong((id *)((char *)&v25->_controller + 1), v21);
    v10 = (SUManagerClient *)objc_retainBlock(v20);
    v11 = *(SUManagerClient **)((char *)&v25->_suClient + 1);
    *(SUManagerClient **)((char *)&v25->_suClient + 1) = v10;
  }
  v13 = v25;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v13;
}

- (id)title
{
  id v3 = sub_4478C();
  id v4 = [v3 localizedStringForKey:@"SOFTWARE_UPDATE_ROLLBACK_DETECTED_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)message
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v9 = (id)_CFCopySupplementalVersionDictionary();
  v8[0] = v9;
  id v7 = [v8[0] objectForKeyedSubscript:_kCFSystemVersionShortVersionStringKey];
  id v5 = sub_4478C();
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_ROLLBACK_DETECTED_ALERT_BODY"];
  id v3 = objc_msgSend(v5, "localizedStringForKey:value:table:");
  v6 = +[NSString stringWithFormat:v7];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);

  return v6;
}

- (id)buttons
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[NSMutableArray array];
  id v3 = v8[0];
  id v4 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v9 _removeButton];
  objc_msgSend(v3, "addObject:");

  id v5 = v8[0];
  id v6 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v9 _cancelButton];
  objc_msgSend(v5, "addObject:");

  id v7 = [v8[0] copy];
  objc_storeStrong(v8, 0);

  return v7;
}

- (id)_removeButton
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  v14 = self;
  v2 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v2);
  id v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_4478C();
  id v7 = [v8 localizedStringForKey:@"SOFTWARE_UPDATE_ROLLBACK_DETECTED_ALERT_ACTION_REMOVE" value:&stru_62DF0 table:@"ui_alerts"];
  v10 = v13;
  v11 = v16;
  v12 = v14;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 1, 1);
  id v4 = v15[0];
  v15[0] = v3;

  id v9 = v15[0];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(v15, 0);

  return v9;
}

- (id)_cancelButton
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  v14 = self;
  v2 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v2);
  id v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_4478C();
  id v7 = [v8 localizedStringForKey:@"CANCEL" value:&stru_62DF0 table:@"ui_alerts"];
  v10 = v13;
  v11 = v16;
  v12 = v14;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 1);
  id v4 = v15[0];
  v15[0] = v3;

  id v9 = v15[0];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(v15, 0);

  return v9;
}

- (id)_setupDefinition
{
  v40 = self;
  v39[1] = (id)a2;
  v39[0] = 0;
  if ([*(id *)((char *)&self->_rollback + 1) promptForConsent])
  {
    v15 = [SUSUIAlertItemDefinition alloc];
    id v18 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v40 title];
    id v17 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v40 message];
    id v16 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v40 buttons];
    v2 = -[SUSUIAlertItemDefinition initWithTitle:message:buttons:](v15, "initWithTitle:message:buttons:", v18, v17);
    id v3 = v39[0];
    v39[0] = v2;
  }
  else
  {
    unsigned __int8 v4 = [*(id *)((char *)&v40->_rollback + 1) promptForPasscode];
    char v37 = 0;
    unsigned __int8 v14 = 0;
    if (v4)
    {
      v38 = +[SUKeybagInterface sharedInstance];
      char v37 = 1;
      unsigned __int8 v14 = [(SUKeybagInterface *)v38 hasPasscodeSet];
    }
    if (v37) {

    }
    if (v14)
    {
      v36 = v40;
      id v5 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v5);
      id location = (id)SUSUILog();
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        sub_8120((uint64_t)v41, (uint64_t)v35);
        _os_log_impl(&def_46F0, (os_log_t)location, v33, "[%{public}@] Prompting for passcode before starting rollback.", v41, 0xCu);
      }
      objc_storeStrong(&location, 0);
      id v9 = [SUSUIFullScreenAuthenticationAlert alloc];
      uint64_t v8 = *(uint64_t *)((char *)&v40->_definition + 1);
      v11 = [(SUSUIBaseRollbackAlertItem *)v36 softwareUpdateController];
      v10 = [(SUSUISoftwareUpdateController *)v11 clientQueue];
      v25 = _NSConcreteStackBlock;
      int v26 = -1073741824;
      int v27 = 0;
      v28 = sub_44468;
      v29 = &unk_62050;
      v30 = v35;
      v31 = v40;
      v32 = [(SUSUIFullScreenAuthenticationAlert *)v9 initWithRollbackDescriptor:v8 canDeferInstallation:1 completionQueue:v10 completionBlock:&v25];

      v13 = [(SUSUIBaseRollbackAlertItem *)v36 softwareUpdateController];
      v12 = v32;
      objc_super v19 = _NSConcreteStackBlock;
      int v20 = -1073741824;
      int v21 = 0;
      id v22 = sub_44678;
      id v23 = &unk_5CC30;
      v24 = v36;
      [(SUSUISoftwareUpdateController *)v13 presentAuthenticationAlert:v12 completion:&v19];

      objc_storeStrong((id *)&v24, 0);
      objc_storeStrong((id *)&v32, 0);
      objc_storeStrong((id *)&v31, 0);
      objc_storeStrong((id *)&v30, 0);
      objc_storeStrong((id *)&v35, 0);
      objc_storeStrong((id *)&v36, 0);
    }
    else
    {
      if (*(SUManagerClient **)((char *)&v40->_suClient + 1)) {
        (*(void (***)(void))((char *)&v40->_suClient + 1))[2]();
      }
      [(SUSUIBaseRollbackAlertItem *)v40 dismissAlert];
    }
  }
  id v7 = v39[0];
  objc_storeStrong(v39, 0);

  return v7;
}

- (SUManagerClient)suClient
{
  return *(SUManagerClient **)((char *)&self->_controller + 1);
}

- (void).cxx_destruct
{
}

@end