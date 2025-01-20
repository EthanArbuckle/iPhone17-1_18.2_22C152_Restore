@interface SUSUISoftwareUpdateRollbackFailureAlertItem
- (SUSUISoftwareUpdateRollbackFailureAlertItem)initWithRollbackDescriptor:(id)a3 softwareUpdateController:(id)a4 error:(id)a5;
- (id)_okButton;
- (id)_setupDefinition;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUSUISoftwareUpdateRollbackFailureAlertItem

- (SUSUISoftwareUpdateRollbackFailureAlertItem)initWithRollbackDescriptor:(id)a3 softwareUpdateController:(id)a4 error:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)SUSUISoftwareUpdateRollbackFailureAlertItem;
  v12 = [(SUSUIBaseRollbackAlertItem *)&v13 initWithRollbackDescriptor:location[0] softwareUpdateController:v15];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v6 = (SUSUISoftwareUpdateController *)[(SUSUISoftwareUpdateRollbackFailureAlertItem *)v17 _setupDefinition];
    v7 = *(SUSUISoftwareUpdateController **)((char *)&v17->super._controller + 1);
    *(SUSUISoftwareUpdateController **)((char *)&v17->super._controller + 1) = v6;

    objc_storeStrong((id *)((char *)&v17->_controller + 1), v14);
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (id)title
{
  id v3 = sub_2042C();
  id v4 = [v3 localizedStringForKey:@"SOFTWARE_UPDATE_ROLLBACK_FAILURE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];

  return v4;
}

- (id)message
{
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v11 = sub_2042C();
    id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_ROLLBACK_FAILURE_ALERT_BODY"];
    id v9 = objc_msgSend(v11, "localizedStringForKey:value:table:");
    id v8 = [location objectForKeyedSubscript:_kCFSystemVersionShortVersionStringKey];
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v8);
    id v3 = v13[0];
    v13[0] = v2;
  }
  if (_BSIsInternalInstall())
  {
    id v4 = [v13[0] stringByAppendingFormat:@"\n\nInternal Only:\n%@", *(SUSUISoftwareUpdateController **)((char *)&v14->_controller + 1)];
    id v5 = v13[0];
    v13[0] = v4;
  }
  id v7 = v13[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);

  return v7;
}

- (id)buttons
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[NSMutableArray array];
  id v3 = v6[0];
  id v4 = [(SUSUISoftwareUpdateRollbackFailureAlertItem *)v7 _okButton];
  objc_msgSend(v3, "addObject:");

  id v5 = [v6[0] copy];
  objc_storeStrong(v6, 0);

  return v5;
}

- (id)_okButton
{
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  objc_super v13 = self;
  v2 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v2);
  v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_2042C();
  id v7 = [v8 localizedStringForKey:@"OK" value:&stru_62DF0 table:@"ui_alerts"];
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

- (id)_setupDefinition
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  id v5 = [SUSUIAlertItemDefinition alloc];
  id v8 = [(SUSUISoftwareUpdateRollbackFailureAlertItem *)v11 title];
  id v7 = [(SUSUISoftwareUpdateRollbackFailureAlertItem *)v11 message];
  id v6 = [(SUSUISoftwareUpdateRollbackFailureAlertItem *)v11 buttons];
  v2 = -[SUSUIAlertItemDefinition initWithTitle:message:buttons:](v5, "initWithTitle:message:buttons:", v8, v7);
  id v3 = v10[0];
  v10[0] = v2;

  id v9 = v10[0];
  objc_storeStrong(v10, 0);

  return v9;
}

- (void).cxx_destruct
{
}

@end