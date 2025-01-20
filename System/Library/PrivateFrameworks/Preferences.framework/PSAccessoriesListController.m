@interface PSAccessoriesListController
- (BOOL)shouldReloadSpecifiersOnResume;
- (id)specifierForDevice:(id)a3;
- (id)specifiers;
- (void)handleSessionEvent:(id)a3;
- (void)refreshDADevices;
- (void)viewDidLoad;
@end

@implementation PSAccessoriesListController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PSAccessoriesListController;
  [(PSListController *)&v13 viewDidLoad];
  v3 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"bundleID"];
  appBundleID = self->_appBundleID;
  self->_appBundleID = v3;

  if (!self->_appSession)
  {
    v5 = (DASession *)objc_alloc_init((Class)getDADaemonSessionClass());
    appSession = self->_appSession;
    self->_appSession = v5;

    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __42__PSAccessoriesListController_viewDidLoad__block_invoke;
    v10 = &unk_1E5C5D500;
    objc_copyWeak(&v11, &location);
    [(DASession *)self->_appSession setEventHandler:&v7];
    [(DASession *)self->_appSession activate];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__PSAccessoriesListController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleSessionEvent:v3];
}

- (id)specifierForDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Asaccessoryinf.isa) cell:2 edit:0];

  uint64_t v7 = [v4 identifier];
  [v6 setIdentifier:v7];

  uint64_t v8 = [v4 bluetoothOTAName];
  if (v8)
  {
    [v6 setObject:v8 forKeyedSubscript:@"cellSubtitleText"];
  }
  else
  {
    v9 = [v4 SSID];
    [v6 setObject:v9 forKeyedSubscript:@"cellSubtitleText"];
  }
  [v6 setObject:objc_opt_class() forKeyedSubscript:@"cellClass"];
  [v6 setProperty:v4 forKey:@"device"];
  [v6 setProperty:self->_appSession forKey:@"session"];

  return v6;
}

- (id)specifiers
{
  v14[1] = *MEMORY[0x1E4F143B8];
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    id v4 = +[PSSpecifier groupSpecifierWithID:@"ACCESSORIES_GROUP"];
    v5 = NSString;
    v6 = PS_LocalizedStringForAccessories(@"ACCESSORY_DEVICES_FOOTER");
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    int v8 = objc_msgSend(v7, "sf_isiPhone");
    v9 = @"iPad";
    if (v8) {
      v9 = @"iPhone";
    }
    v10 = objc_msgSend(v5, "stringWithFormat:", v6, v9);
    [v4 setObject:v10 forKeyedSubscript:@"footerText"];

    v14[0] = v4;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v12 = self->super._specifiers;
    self->super._specifiers = v11;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4 = [a3 eventType];
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
  {
    [(PSAccessoriesListController *)self refreshDADevices];
  }
}

- (void)refreshDADevices
{
  appSession = self->_appSession;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke;
  v3[3] = &unk_1E5C5D570;
  v3[4] = self;
  [(DASession *)appSession getDevicesWithFlags:8 completionHandler:v3];
}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1E5C5D548;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _PSLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v3;
      _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Error while trying to fetch accessories: %@", buf, 0xCu);
    }
  }
  v17 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 appAccessInfoMap];
        id v11 = [v10 allKeys];
        int v12 = [v11 containsObject:*(void *)(*(void *)(a1 + 48) + 1384)];

        if (v12)
        {
          objc_super v13 = [*(id *)(a1 + 48) specifierForDevice:v9];
          [v17 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v17 sortUsingComparator:&__block_literal_global];
  [*(id *)(a1 + 48) removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 48) + 1400)];
  uint64_t v14 = [v17 copy];
  uint64_t v15 = *(void *)(a1 + 48);
  v16 = *(void **)(v15 + 1400);
  *(void *)(v15 + 1400) = v14;

  [*(id *)(a1 + 48) insertContiguousSpecifiers:*(void *)(*(void *)(a1 + 48) + 1400) afterSpecifierID:@"ACCESSORIES_GROUP"];
}

uint64_t __47__PSAccessoriesListController_refreshDADevices__block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_appSession, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end