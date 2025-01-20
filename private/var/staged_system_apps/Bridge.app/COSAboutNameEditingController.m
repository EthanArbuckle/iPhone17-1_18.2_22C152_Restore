@interface COSAboutNameEditingController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldSelectResponderOnAppearance;
- (PSSpecifier)textSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setTextSpecifier:(id)a3;
- (void)suspend;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSAboutNameEditingController

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = +[NSMutableArray arrayWithObject:v6];

    v8 = +[COSAboutDataSource sharedInstance];
    v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:0 target:v8 set:"setDeviceName:specifier:" get:"getDeviceName:" detail:0 cell:8 edit:0];
    textSpecifier = self->_textSpecifier;
    self->_textSpecifier = v9;

    v11 = self->_textSpecifier;
    v12 = +[COSAboutDataSource sharedInstance];
    v13 = [v12 getDeviceName:0];
    [(PSSpecifier *)v11 setPlaceholder:v13];

    [(PSSpecifier *)self->_textSpecifier setProperty:&__kCFBooleanTrue forKey:PSEditableTableCellTextFieldShouldPopOnReturn];
    v14 = sub_10000DCF4();
    v15 = [v14 valueForProperty:NRDevicePropertyIsAltAccount];

    unsigned int v16 = [v15 BOOLValue];
    v17 = +[MCProfileConnection sharedConnection];
    unsigned int v18 = [v17 effectiveBoolValueForSetting:MCFeatureDeviceNameModificationAllowed];

    v19 = self->_textSpecifier;
    if (v18 == 2) {
      uint64_t v20 = v16;
    }
    else {
      uint64_t v20 = 1;
    }
    v21 = +[NSNumber numberWithInt:v20];
    [(PSSpecifier *)v19 setProperty:v21 forKey:PSEnabledKey];

    [v7 addObject:self->_textSpecifier];
    v22 = *(void **)&self->BPSListController_opaque[v2];
    *(void *)&self->BPSListController_opaque[v2] = v7;
    id v23 = v7;

    id v4 = *(id *)&self->BPSListController_opaque[v2];
  }

  return v4;
}

- (void)suspend
{
  v3 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)COSAboutNameEditingController;
  [(COSAboutNameEditingController *)&v4 suspend];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  v6 = +[COSAboutDataSource sharedInstance];
  [v6 performUpdatesAnimated:0 usingBlock:&stru_100246D10];

  v7.receiver = self;
  v7.super_class = (Class)COSAboutNameEditingController;
  [(COSAboutNameEditingController *)&v7 viewWillDisappear:v3];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)COSAboutNameEditingController;
  v5 = [(COSAboutNameEditingController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 editableTextField];
  [v6 setAutocapitalizationType:2];
  [v6 setAutocorrectionType:1];
  [v6 setAdjustsFontSizeToFitWidth:1];
  [v6 setTextAlignment:0];
  [v6 setReturnKeyType:9];
  [v6 setClearButtonMode:3];
  [v5 setControllerDelegate:self];

  return v5;
}

- (PSSpecifier)textSpecifier
{
  return self->_textSpecifier;
}

- (void)setTextSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end