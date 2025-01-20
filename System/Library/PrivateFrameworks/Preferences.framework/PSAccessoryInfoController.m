@interface PSAccessoryInfoController
- (CGSize)preferredContentSize;
- (PSAccessoryInfoController)init;
- (PSAccessoryInfoController)initWithDevice:(id)a3 session:(id)a4;
- (id)isAppAllowed:(id)a3;
- (id)specifiers;
- (id)specifiersForApps:(id)a3;
- (id)specifiersForHeader;
- (void)forgetDevice:(id)a3;
- (void)setAppAllowed:(id)a3 specifier:(id)a4;
@end

@implementation PSAccessoryInfoController

- (PSAccessoryInfoController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PSAccessoryInfoController;
  result = [(PSListController *)&v3 init];
  if (result) {
    result->_useAsHeader = 0;
  }
  return result;
}

- (PSAccessoryInfoController)initWithDevice:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PSAccessoryInfoController;
    v11 = [(PSListController *)&v13 init];
    objc_storeStrong((id *)&v11->_session, a4);
    objc_storeStrong((id *)&v11->_device, a3);
    v11->_useAsHeader = 1;
    self = v11;
    v10 = self;
  }

  return v10;
}

- (CGSize)preferredContentSize
{
  +[PSAccessoryInfoHeaderCell headerHeight];
  double v4 = v3 + 0.0 + 44.0 + 20.0;
  v5 = [(DADevice *)self->_device appAccessInfoMap];
  double v6 = v4 + (double)(unint64_t)(44 * [v5 count]);

  if (self->_useAsHeader) {
    double v7 = v6 + 150.0;
  }
  else {
    double v7 = v6 + 150.0 + 20.0 + 44.0;
  }
  id v8 = [(PSAccessoryInfoController *)self view];
  [v8 bounds];
  double v10 = v9;

  double v11 = v10;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)specifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  specifiers = self->super._specifiers;
  if (specifiers)
  {
    double v3 = specifiers;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    double v6 = [(PSAccessoryInfoController *)self specifiersForHeader];
    [v5 addObjectsFromArray:v6];

    double v7 = PS_LocalizedStringForAccessories(@"ACCESSORY_APP_ACCESS_HEADER");
    id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setIdentifier:@"appAccess"];
    double v9 = PS_LocalizedStringForAccessories(@"ACCESSORY_APP_ACCESS_FOOTER");
    [v8 setObject:v9 forKeyedSubscript:@"footerText"];

    [v5 addObject:v8];
    double v10 = [(DADevice *)self->_device appAccessInfoMap];
    double v11 = [(PSAccessoryInfoController *)self specifiersForApps:v10];
    [v5 addObjectsFromArray:v11];

    if (!self->_useAsHeader)
    {
      double v12 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
      [v12 setIdentifier:@"manage"];
      objc_super v13 = PS_LocalizedStringForAccessories(@"ACCESSORY_FORGET_DEVICE");
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v14 setButtonAction:sel_forgetDevice_];
      v19[0] = v12;
      v19[1] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      [v5 addObjectsFromArray:v15];
    }
    v16 = (NSArray *)[v5 copy];
    v17 = self->super._specifiers;
    self->super._specifiers = v16;

    double v3 = self->super._specifiers;
  }
  return v3;
}

- (id)specifiersForHeader
{
  v13[1] = *MEMORY[0x1E4F143B8];
  device = self->_device;
  if (!device)
  {
    double v4 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"device"];
    v5 = self->_device;
    self->_device = v4;

    double v6 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"session"];
    session = self->_session;
    self->_session = v6;

    device = self->_device;
  }
  id v8 = [(DADevice *)device discoveryConfiguration];
  double v9 = [v8 displayName];
  [(PSListController *)self setTitle:v9];

  double v10 = +[PSSpecifier preferenceSpecifierNamed:&stru_1EFB51FD0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v10 setUserInfo:self->_device];
  [v10 setObject:objc_opt_class() forKeyedSubscript:@"cellClass"];
  [v10 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"enabled"];
  v13[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (id)specifiersForApps:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v13 = v3;
  id obj = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];
        double v9 = [v8 localizedName];
        double v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:sel_setAppAllowed_specifier_ get:sel_isAppAllowed_ detail:0 cell:6 edit:0];
        double v11 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
        [v10 setProperty:v11 forKey:@"useLazyIcons"];

        [v10 setProperty:v7 forKey:@"appIDForLazyIcon"];
        [v10 setProperty:v7 forKey:@"PSAccessoryAccessApplicationKey"];
        [v17 addObject:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return v17;
}

- (void)setAppAllowed:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v10 = [a4 propertyForKey:@"PSAccessoryAccessApplicationKey"];
  uint64_t v7 = [(DADevice *)self->_device appAccessInfoMap];
  id v8 = [v7 objectForKeyedSubscript:v10];

  LODWORD(v7) = [v6 BOOLValue];
  if (v7) {
    uint64_t v9 = 25;
  }
  else {
    uint64_t v9 = 28;
  }
  [v8 setState:v9];
  [(DASession *)self->_session setDeviceAppAccessInfo:v8 device:self->_device completionHandler:&__block_literal_global_9];
}

- (id)isAppAllowed:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"PSAccessoryAccessApplicationKey"];
  uint64_t v5 = [(DADevice *)self->_device appAccessInfoMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v8 = [v6 state] == 20 || objc_msgSend(v6, "state") == 25;
  uint64_t v9 = [v7 numberWithInt:v8];

  return v9;
}

- (void)forgetDevice:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v5 = (void *)MEMORY[0x1E4F42720];
  id v6 = PS_LocalizedStringForAccessories(@"ACCESSORY_FORGET_DEVICE_CONFIRM");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__PSAccessoryInfoController_forgetDevice___block_invoke;
  v11[3] = &unk_1E5C5DAE8;
  v11[4] = self;
  uint64_t v7 = [v5 actionWithTitle:v6 style:2 handler:v11];

  BOOL v8 = (void *)MEMORY[0x1E4F42720];
  uint64_t v9 = PS_LocalizedStringForAccessories(@"ACCESSORY_FORGET_DEVICE_CANCEL");
  id v10 = [v8 actionWithTitle:v9 style:0 handler:0];

  [v4 addAction:v7];
  [v4 addAction:v10];
  [(PSAccessoryInfoController *)self presentViewController:v4 animated:1 completion:0];
}

void __42__PSAccessoryInfoController_forgetDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1392) appAccessInfoMap];
  id v3 = [v2 allValues];
  id v6 = [v3 firstObject];

  [v6 setState:0];
  [*(id *)(*(void *)(a1 + 32) + 1384) setDeviceAppAccessInfo:v6 device:*(void *)(*(void *)(a1 + 32) + 1392) completionHandler:&__block_literal_global_43];
  uint64_t v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end