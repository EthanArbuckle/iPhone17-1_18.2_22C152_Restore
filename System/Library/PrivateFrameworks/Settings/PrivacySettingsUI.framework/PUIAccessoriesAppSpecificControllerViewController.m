@interface PUIAccessoriesAppSpecificControllerViewController
- (BOOL)shouldReloadSpecifiersOnResume;
- (DASession)session;
- (NSArray)accessorySpecifiers;
- (NSString)appBundleID;
- (id)specifierForDevice:(id)a3;
- (id)specifiers;
- (void)handleSessionEvent:(id)a3;
- (void)refreshDADevices;
- (void)setAccessorySpecifiers:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setSession:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUIAccessoriesAppSpecificControllerViewController

- (id)specifiers
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"ACCESSORIES_GROUP"];
      v12[0] = v5;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    id v8 = v4;
  }
  else
  {
    v9 = _PUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", v11, 2u);
    }

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PUIAccessoriesAppSpecificControllerViewController;
  [(PUIAccessoriesAppSpecificControllerViewController *)&v12 viewDidLoad];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) propertyForKey:@"bundleID"];
    appBundleID = self->_appBundleID;
    self->_appBundleID = v3;

    v5 = [(PUIAccessoriesAppSpecificControllerViewController *)self session];

    if (!v5)
    {
      v6 = objc_opt_new();
      [(PUIAccessoriesAppSpecificControllerViewController *)self setSession:v6];

      objc_initWeak(&location, self);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v10, &location);
      v7 = [(PUIAccessoriesAppSpecificControllerViewController *)self session];
      [v7 setEventHandler:&v9];

      id v8 = [(PUIAccessoriesAppSpecificControllerViewController *)self session];
      [v8 activate];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PUIAccessoriesAppSpecificControllerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleSessionEvent:v3];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifierForDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F92E70];
  v6 = [v4 name];
  v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Asaccessoryinf.isa) cell:2 edit:0];

  id v8 = [v4 identifier];
  [v7 setIdentifier:v8];

  uint64_t v9 = [v4 bluetoothOTAName];
  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F93230]];
  }
  else
  {
    id v10 = [v4 SSID];
    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F93230]];
  }
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v7 setProperty:v4 forKey:@"device"];
  [v7 setProperty:self->_session forKey:@"session"];

  return v7;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4 = [a3 eventType];
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
  {
    [(PUIAccessoriesAppSpecificControllerViewController *)self refreshDADevices];
  }
}

- (void)refreshDADevices
{
  id v3 = [(PUIAccessoriesAppSpecificControllerViewController *)self session];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke;
  v4[3] = &unk_1E6E9D308;
  v4[4] = self;
  [v3 getDevicesWithFlags:8 completionHandler:v4];
}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _PUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2_cold_1(v2, v3);
    }
  }
  v19 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 appAccessInfoMap];
        id v11 = [v10 allKeys];
        int v12 = [v11 containsObject:*(void *)(*(void *)(a1 + 48) + 1384)];

        if (v12)
        {
          v13 = [*(id *)(a1 + 48) specifierForDevice:v9];
          [v19 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  [v19 sortUsingComparator:&__block_literal_global_3];
  v14 = *(void **)(a1 + 48);
  v15 = [v14 accessorySpecifiers];
  [v14 removeContiguousSpecifiers:v15];

  v16 = (void *)[v19 copy];
  [*(id *)(a1 + 48) setAccessorySpecifiers:v16];

  v17 = *(void **)(a1 + 48);
  v18 = [v17 accessorySpecifiers];
  [v17 insertContiguousSpecifiers:v18 afterSpecifierID:@"ACCESSORIES_GROUP"];
}

uint64_t __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSArray)accessorySpecifiers
{
  return self->_accessorySpecifiers;
}

- (void)setAccessorySpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "-[PUIAccessoriesAppSpecificControllerViewController refreshDADevices]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s: Error getting devices: %@", (uint8_t *)&v3, 0x16u);
}

@end