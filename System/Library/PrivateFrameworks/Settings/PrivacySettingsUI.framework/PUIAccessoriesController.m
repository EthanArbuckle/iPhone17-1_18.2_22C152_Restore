@interface PUIAccessoriesController
- (BOOL)shouldReloadApps;
- (BOOL)shouldReloadSpecifiersOnResume;
- (DASession)session;
- (NSArray)appSpecifiers;
- (NSMutableDictionary)accessoriesManagementApprovedMap;
- (NSMutableDictionary)accessoriesManagementMap;
- (id)localizedRemainingNumberOfApprovedAccessories:(id)a3;
- (id)specifierForApp:(id)a3;
- (id)specifiers;
- (void)handleSessionEvent:(id)a3;
- (void)provideNavigationDonations;
- (void)refreshDADevices;
- (void)refreshDADevicesSynchronously;
- (void)remakeUI:(id)a3;
- (void)setAccessoriesManagementApprovedMap:(id)a3;
- (void)setAccessoriesManagementMap:(id)a3;
- (void)setAppSpecifiers:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldReloadApps:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUIAccessoriesController

- (id)specifiers
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"APP_GROUP"];
      if (MGGetBoolAnswer()) {
        v6 = @"ACCESSORY_SETUP_FOOTER_WLAN";
      }
      else {
        v6 = @"ACCESSORY_SETUP_FOOTER";
      }
      v7 = PUI_LocalizedStringForPrivacy(v6);
      [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F93170]];

      v14[0] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    id v10 = v4;
  }
  else
  {
    v11 = _PUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", v13, 2u);
    }

    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIAccessoriesController;
  [(PUIAccessoriesController *)&v4 viewWillAppear:a3];
  if (self->_shouldReloadApps)
  {
    [(PUIAccessoriesController *)self refreshDADevicesSynchronously];
    self->_shouldReloadApps = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIAccessoriesController;
  [(PUIAccessoriesController *)&v4 viewDidAppear:a3];
  [(PUIAccessoriesController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"ACCESSORY_SETUP" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ACCESSORIES"];
  [(PUIAccessoriesController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.accessories" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (void)viewDidDisappear:(BOOL)a3
{
  self->_shouldReloadApps = 1;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PUIAccessoriesController;
  [(PUIAccessoriesController *)&v10 viewDidLoad];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [(PUIAccessoriesController *)self session];

    if (!v3)
    {
      objc_super v4 = objc_opt_new();
      [(PUIAccessoriesController *)self setSession:v4];

      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v8, &location);
      id v5 = [(PUIAccessoriesController *)self session];
      [v5 setEventHandler:&v7];

      v6 = [(PUIAccessoriesController *)self session];
      [v6 activate];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __39__PUIAccessoriesController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
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

- (id)specifierForApp:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];
  v6 = [v5 localizedName];
  uint64_t v7 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
  uint64_t v8 = [v7 count];

  v9 = (void *)MEMORY[0x1E4F92E70];
  if (v8 == 1) {
    uint64_t v10 = (uint64_t)NSClassFromString(&cfstr_Asaccessoryinf.isa);
  }
  else {
    uint64_t v10 = objc_opt_class();
  }
  v11 = [v9 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:v10 cell:2 edit:0];
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [v11 setProperty:v12 forKey:*MEMORY[0x1E4F931D0]];

  [v11 setProperty:v4 forKey:*MEMORY[0x1E4F931C0]];
  [v11 setProperty:v4 forKey:@"bundleID"];
  [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  v13 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
  uint64_t v14 = [v13 count];

  v15 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
  v16 = v15;
  if (v14 == 1)
  {
    v17 = [v15 firstObject];
    v18 = [v17 name];
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v19 = [v15 count];

  v20 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
  v21 = v20;
  if (v19 == 2)
  {
    v22 = [v20 objectAtIndexedSubscript:0];
    v16 = [v22 name];

    v23 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    [v23 objectAtIndexedSubscript:1];
    uint64_t v51 = v8;
    v24 = v6;
    v26 = v25 = v5;
    v17 = [v26 name];

    v27 = NSString;
    v28 = PUI_LocalizedStringForPrivacy(@"ACCESSORY_SETUP_ENUMERATE_TWO");
    v18 = objc_msgSend(v27, "stringWithFormat:", v28, v16, v17);

    id v5 = v25;
    v6 = v24;
    uint64_t v8 = v51;
    goto LABEL_13;
  }
  v52 = v6;
  uint64_t v29 = [v20 count];

  v30 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
  v31 = v30;
  if (v29 == 3)
  {
    v32 = [v30 objectAtIndexedSubscript:0];
    v16 = [v32 name];

    v33 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    [v33 objectAtIndexedSubscript:1];
    v34 = v50 = v5;
    v17 = [v34 name];

    v35 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    v36 = [v35 objectAtIndexedSubscript:2];
    v37 = [v36 name];

    v38 = NSString;
    uint64_t v39 = PUI_LocalizedStringForPrivacy(@"ACCESSORY_SETUP_ENUMERATE_THREE");
LABEL_12:
    v45 = (void *)v39;
    v18 = objc_msgSend(v38, "stringWithFormat:", v39, v16, v17, v37);

    id v5 = v50;
    v6 = v52;
    goto LABEL_13;
  }
  unint64_t v40 = [v30 count];

  if (v40 >= 4)
  {
    v41 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    v42 = [v41 objectAtIndexedSubscript:0];
    v16 = [v42 name];

    v43 = [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    v44 = [v43 objectAtIndexedSubscript:1];
    v17 = [v44 name];

    v37 = [(PUIAccessoriesController *)self localizedRemainingNumberOfApprovedAccessories:v4];
    v38 = NSString;
    uint64_t v39 = PUI_LocalizedStringForPrivacy(@"ACCESSORY_SETUP_ENUMERATE_MORE");
    v50 = v5;
    goto LABEL_12;
  }
  v18 = 0;
  v6 = v52;
LABEL_14:
  [v11 setProperty:v18 forKey:*MEMORY[0x1E4F93230]];
  if (v8 == 1)
  {
    [(NSMutableDictionary *)self->_accessoriesManagementMap objectForKeyedSubscript:v4];
    v47 = v46 = v6;
    v48 = [v47 firstObject];
    [v11 setProperty:v48 forKey:@"device"];

    v6 = v46;
    [v11 setProperty:self->_session forKey:@"session"];
  }

  return v11;
}

- (id)localizedRemainingNumberOfApprovedAccessories:(id)a3
{
  id v3 = NSString;
  id v4 = [(NSMutableDictionary *)self->_accessoriesManagementApprovedMap objectForKeyedSubscript:a3];
  id v5 = objc_msgSend(v3, "localizedStringWithFormat:", @"%lu", objc_msgSend(v4, "count") - 2);

  return v5;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4 = [a3 eventType];
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
  {
    [(PUIAccessoriesController *)self refreshDADevices];
  }
}

- (void)remakeUI:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 count])
  {
    v6 = [(PUIAccessoriesController *)self appSpecifiers];
    [(PUIAccessoriesController *)self removeContiguousSpecifiers:v6];

    accessoriesManagementMap = self->_accessoriesManagementMap;
    self->_accessoriesManagementMap = 0;

    accessoriesManagementApprovedMap = self->_accessoriesManagementApprovedMap;
    self->_accessoriesManagementApprovedMap = 0;

    [(PUIAccessoriesController *)self setAppSpecifiers:0];
  }
  v45 = self;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  v50 = v10;
  uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v60;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v11;
        v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
        v13 = _PUILoggingFacility();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v12;
          _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "Device fetched %@", buf, 0xCu);
        }

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v14 = [v12 appAccessInfoMap];
        v15 = [v14 allKeys];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v56 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              v21 = [v9 objectForKeyedSubscript:v20];

              if (!v21)
              {
                v22 = [MEMORY[0x1E4F1CA48] array];
                [v9 setObject:v22 forKeyedSubscript:v20];
              }
              v23 = [v9 objectForKeyedSubscript:v20];
              [v23 addObject:v12];

              v24 = [v12 appAccessInfoMap];
              v25 = [v24 objectForKeyedSubscript:v20];
              uint64_t v26 = [v25 state];

              uint64_t v10 = v50;
              if (v26 == 25)
              {
                v27 = [v50 objectForKeyedSubscript:v20];

                if (!v27)
                {
                  v28 = [MEMORY[0x1E4F1CA48] array];
                  [v50 setObject:v28 forKeyedSubscript:v20];
                }
                uint64_t v29 = [v50 objectForKeyedSubscript:v20];
                [v29 addObject:v12];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v17);
        }

        uint64_t v11 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v48);
  }

  uint64_t v30 = [v9 copy];
  v31 = v45->_accessoriesManagementMap;
  v45->_accessoriesManagementMap = (NSMutableDictionary *)v30;

  uint64_t v32 = [v10 copy];
  v33 = v45->_accessoriesManagementApprovedMap;
  v45->_accessoriesManagementApprovedMap = (NSMutableDictionary *)v32;

  v34 = [v9 allKeys];
  v35 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v36 = v34;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [(PUIAccessoriesController *)v45 specifierForApp:*(void *)(*((void *)&v51 + 1) + 8 * j)];
        [v35 addObject:v41];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v38);
  }

  [v35 sortUsingComparator:&__block_literal_global_4];
  v42 = [(PUIAccessoriesController *)v45 appSpecifiers];
  [(PUIAccessoriesController *)v45 removeContiguousSpecifiers:v42];

  v43 = (void *)[v35 copy];
  [(PUIAccessoriesController *)v45 setAppSpecifiers:v43];

  v44 = [(PUIAccessoriesController *)v45 appSpecifiers];
  [(PUIAccessoriesController *)v45 insertContiguousSpecifiers:v44 afterSpecifierID:@"APP_GROUP"];
}

uint64_t __37__PUIAccessoriesController_remakeUI___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)refreshDADevicesSynchronously
{
  id v3 = [MEMORY[0x1E4F5F2C8] getDevicesWithFlags:8 session:self->_session error:0];
  [(PUIAccessoriesController *)self remakeUI:v3];
}

- (void)refreshDADevices
{
  id v3 = [(PUIAccessoriesController *)self session];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PUIAccessoriesController_refreshDADevices__block_invoke;
  v4[3] = &unk_1E6E9D308;
  v4[4] = self;
  [v3 getDevicesWithFlags:8 completionHandler:v4];
}

void __44__PUIAccessoriesController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PUIAccessoriesController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__PUIAccessoriesController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _PUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__PUIAccessoriesController_refreshDADevices__block_invoke_2_cold_1(v2, v3);
    }
  }
  return [*(id *)(a1 + 40) remakeUI:*(void *)(a1 + 48)];
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (NSMutableDictionary)accessoriesManagementMap
{
  return self->_accessoriesManagementMap;
}

- (void)setAccessoriesManagementMap:(id)a3
{
}

- (NSMutableDictionary)accessoriesManagementApprovedMap
{
  return self->_accessoriesManagementApprovedMap;
}

- (void)setAccessoriesManagementApprovedMap:(id)a3
{
}

- (BOOL)shouldReloadApps
{
  return self->_shouldReloadApps;
}

- (void)setShouldReloadApps:(BOOL)a3
{
  self->_shouldReloadApps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesManagementApprovedMap, 0);
  objc_storeStrong((id *)&self->_accessoriesManagementMap, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __44__PUIAccessoriesController_refreshDADevices__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "-[PUIAccessoriesController refreshDADevices]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s: Error getting devices: %@", (uint8_t *)&v3, 0x16u);
}

@end