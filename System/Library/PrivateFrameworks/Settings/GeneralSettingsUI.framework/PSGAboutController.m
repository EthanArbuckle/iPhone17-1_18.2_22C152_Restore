@interface PSGAboutController
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (PSGAboutController)init;
- (id)contextMenuConfiguration:(id)a3 handler:(id)a4;
- (id)deviceName:(id)a3;
- (id)effectiveSettingsChangedNotificationObserver;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)dealloc;
- (void)handleResourceDictionaryWhenAlreadyPresented:(id)a3;
- (void)remoteBarCodeLaunchHelper:(id)a3;
- (void)setDeviceName:(id)a3 specifier:(id)a4;
- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDeviceNameSpecifierIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
- (void)willUnlock;
@end

@implementation PSGAboutController

- (PSGAboutController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PSGAboutController;
  result = [(PSGAboutController *)&v3 init];
  if (result) {
    result->_firstViewDidAppear = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = +[PSSpecifierDataSource sharedInstance];
  v4 = [v3 systemHealthUIClient];
  [v4 setParentViewController:0];

  v5.receiver = self;
  v5.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v5 dealloc];
}

- (void)willUnlock
{
  id v2 = +[PSSpecifierDataSource sharedInstance];
  [v2 reloadDeviceName];
}

- (id)contextMenuConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = [(PSGAboutController *)self specifierAtIndex:[(PSGAboutController *)self indexForIndexPath:a3]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke;
  aBlock[3] = &unk_264E8CA40;
  id v19 = v7;
  id v8 = v7;
  v9 = _Block_copy(aBlock);
  v10 = (void *)MEMORY[0x263F82610];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke_2;
  v15[3] = &unk_264E8CA68;
  id v16 = v9;
  id v17 = v6;
  id v11 = v6;
  id v12 = v9;
  v13 = [v10 configurationWithIdentifier:0 previewProvider:0 actionProvider:v15];

  return v13;
}

void __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) propertyForKey:*MEMORY[0x263F60308]];
  v1 = [MEMORY[0x263F82A18] generalPasteboard];
  [v1 setString:v2];
}

id __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke_2(uint64_t a1)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F82940];
  objc_super v3 = (void *)MEMORY[0x263F823D0];
  v4 = PSG_LocalizedStringForGeneral(@"COPY");
  objc_super v5 = [MEMORY[0x263F827E8] systemImageNamed:@"doc.on.doc"];
  id v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:*(void *)(a1 + 32)];
  v14[0] = v6;
  v7 = (void *)MEMORY[0x263F823D0];
  id v8 = PSG_LocalizedStringForGeneral(@"BARCODE");
  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"barcode"];
  v10 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:*(void *)(a1 + 40)];
  v14[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v12 = [v2 menuWithTitle:&stru_26F0FADC0 image:0 identifier:0 options:1 children:v11];

  return v12;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  v7 = [MEMORY[0x263F82670] currentDevice];
  int v8 = objc_msgSend(v7, "sf_isiPad");

  if (!v8)
  {
    v13 = 0;
    goto LABEL_11;
  }
  v9 = [(PSGAboutController *)self specifierAtIndex:[(PSGAboutController *)self indexForIndexPath:v6]];
  v10 = [v9 identifier];
  int v11 = [v10 hasPrefix:@"EID"];

  if (v11)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    aBlock[3] = &unk_264E8CA40;
    void aBlock[4] = self;
    id v12 = _Block_copy(aBlock);
    if (!v12)
    {
LABEL_9:
      v13 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = [v9 identifier];
    int v15 = [v14 hasPrefix:@"ModemIMEI"];

    if (!v15) {
      goto LABEL_9;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v17[3] = &unk_264E8CA90;
    id v18 = v9;
    id v19 = self;
    id v12 = _Block_copy(v17);

    if (!v12) {
      goto LABEL_9;
    }
  }
  v13 = [(PSGAboutController *)self contextMenuConfiguration:v6 handler:v12];

LABEL_10:
LABEL_11:

  return v13;
}

void __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F67EF0] sharedInstance];
  objc_super v3 = [v2 subscriptionContexts];

  v4 = [MEMORY[0x263F67F48] sharedInstance];
  objc_super v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [v4 mobileEquipmentInfo:v5];

  v7 = 0;
  if ((unint64_t)[v3 count] >= 2)
  {
    int v8 = [MEMORY[0x263F67F48] sharedInstance];
    v9 = [v3 objectAtIndexedSubscript:1];
    v7 = [v8 mobileEquipmentInfo:v9];
  }
  if (v6)
  {
    v10 = [v6 CSN];
    uint64_t v11 = [v10 length];

    id v12 = v6;
    if (v11) {
      goto LABEL_7;
    }
  }
  if (v7
    && ([v7 CSN],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 length],
        v13,
        id v12 = v7,
        v14))
  {
LABEL_7:
    int v15 = [v12 CSN];
  }
  else
  {
    int v15 = &stru_26F0FADC0;
  }
  id v17 = @"EidKey";
  v18[0] = v15;
  id v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [*(id *)(a1 + 32) remoteBarCodeLaunchHelper:v16];
}

void __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) identifier];
  int v3 = [v2 isEqualToString:@"ModemIMEI.2"];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  objc_super v5 = [MEMORY[0x263F67EF0] sharedInstance];
  id v6 = [v5 subscriptionContexts];

  v7 = [MEMORY[0x263F67F48] sharedInstance];
  int v8 = [v6 objectAtIndexedSubscript:0];
  v9 = [v7 mobileEquipmentInfo:v8];

  v10 = [v6 objectAtIndexedSubscript:0];
  if ([v10 slotID] != v4)
  {
    unint64_t v11 = [v6 count];

    if (v11 < 2) {
      goto LABEL_8;
    }
    v10 = [MEMORY[0x263F67F48] sharedInstance];
    id v12 = [v6 objectAtIndexedSubscript:1];
    uint64_t v13 = [v10 mobileEquipmentInfo:v12];

    v9 = (void *)v13;
  }

LABEL_8:
  uint64_t v14 = @"ImeiKey";
  if (v3) {
    uint64_t v14 = @"Imei2Key";
  }
  id v17 = v14;
  int v15 = [v9 IMEI];
  v18[0] = v15;
  id v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  [*(id *)(a1 + 40) remoteBarCodeLaunchHelper:v16];
}

- (void)remoteBarCodeLaunchHelper:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_super v5 = v4;
  if (v3)
  {
    [v4 addEntriesFromDictionary:v3];
    id v6 = [NSNumber numberWithInteger:6];
    [v5 setValue:v6 forKey:@"FlowTypeKey"];

    v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[PSGAboutController remoteBarCodeLaunchHelper:]";
      __int16 v14 = 2112;
      int v15 = v5;
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%s \nKey:%@", (uint8_t *)&v12, 0x16u);
    }
  }
  int v8 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.SIMSetupUIService" viewControllerClassName:@"TSSIMSetupSupportViewController"];
  id v9 = objc_alloc_init(MEMORY[0x263F79408]);
  [v9 setUserInfo:v5];
  v10 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v8 configurationContext:v9];
  id v11 = objc_alloc_init(MEMORY[0x263F793F8]);
  [v11 setReason:@"SIM Device Info Flow"];
  [v10 activateWithContext:v11];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PSGAboutController;
  id v6 = a4;
  [(PSGAboutController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[PSGAboutController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  int v8 = [(PSGAboutController *)self specifierAtIndex:v7];
  id v9 = [v8 identifier];
  int v10 = [v9 hasPrefix:@"CARRIER_VERSION"];

  if (v10)
  {
    id v11 = +[PSSpecifierDataSource sharedInstance];
    [v11 updateCarrierSpecifier:v8];
LABEL_5:

    goto LABEL_6;
  }
  int v12 = [v8 identifier];
  int v13 = [v12 isEqualToString:@"ProductModel"];

  if (v13)
  {
    id v11 = +[PSSpecifierDataSource sharedInstance];
    [v11 updateProductModelSpecifier:v8];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)viewWillAppear:(BOOL)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v17 viewWillAppear:a3];
  id v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/About"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v7 = PSG_BundleForGeneralSettingsUIFramework();
  int v8 = [v7 bundleURL];
  id v9 = (void *)[v5 initWithKey:@"About" table:@"General" locale:v6 bundleURL:v8];

  int v10 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v18[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [(PSGAboutController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.about-current-device" title:v9 localizedNavigationComponents:v11 deepLink:v4];

  int v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = *MEMORY[0x263F536E0];
  objc_super v14 = [MEMORY[0x263F08A48] mainQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__PSGAboutController_viewWillAppear___block_invoke;
  v16[3] = &unk_264E8C878;
  v16[4] = self;
  int v15 = [v12 addObserverForName:v13 object:0 queue:v14 usingBlock:v16];
  [(PSGAboutController *)self setEffectiveSettingsChangedNotificationObserver:v15];
}

void __37__PSGAboutController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 navigationController];
  id v4 = [v3 topViewController];

  if (v2 == v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 updateDeviceNameSpecifierIfNeeded];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v7 viewDidAppear:a3];
  if (self->_firstViewDidAppear)
  {
    uint64_t v4 = _CTServerConnectionCreate();
    if (v4)
    {
      id v5 = (const void *)v4;
      _CTServerConnectionGetUpdatedCarrierBundle();
      CFRelease(v5);
    }
    self->_firstViewDidAppear = 0;
  }
  id v6 = dispatch_get_global_queue(0, 0);
  dispatch_async(v6, &__block_literal_global_1115);

  [(PSGAboutController *)self updateDeviceNameSpecifierIfNeeded];
}

void __36__PSGAboutController_viewDidAppear___block_invoke()
{
  id v0 = +[PSSpecifierDataSource sharedInstance];
  [v0 enableMLUpdates:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v6 viewDidDisappear:a3];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v5 = [(PSGAboutController *)self effectiveSettingsChangedNotificationObserver];
  [v4 removeObserver:v5];

  [(PSGAboutController *)self setEffectiveSettingsChangedNotificationObserver:0];
}

- (void)willBecomeActive
{
  id v3 = +[PSSpecifierDataSource sharedInstance];
  [v3 enableMLUpdates:1];

  v4.receiver = self;
  v4.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v4 willBecomeActive];
}

- (void)willResignActive
{
  if (([(id)*MEMORY[0x263F83300] isSuspendedUnderLock] & 1) == 0)
  {
    id v3 = +[PSSpecifierDataSource sharedInstance];
    [v3 enableMLUpdates:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v4 willResignActive];
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [&unk_26F103D18 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(&unk_26F103D18);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 isEqualToString:v9])
        {
          int v10 = [(PSGAboutController *)self specifierForID:v9];

          if (!v10)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [&unk_26F103D18 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v13 viewDidLoad];
  id v3 = +[PSSpecifierDataSource sharedInstance];
  id v4 = [v3 sharedNDOController];
  [v4 setParentViewController:self];

  uint64_t v5 = +[PSSpecifierDataSource sharedInstance];
  uint64_t v6 = [v5 sharedNDOController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__PSGAboutController_viewDidLoad__block_invoke;
  v12[3] = &unk_264E8C8A0;
  v12[4] = self;
  [v6 updateSpecifiersWithCompletionHandler:v12];

  if (objc_opt_class())
  {
    uint64_t v7 = +[PSSpecifierDataSource sharedInstance];
    int v8 = [v7 systemHealthUIClient];
    [v8 setParentViewController:self];

    uint64_t v9 = +[PSSpecifierDataSource sharedInstance];
    int v10 = [v9 systemHealthUIClient];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __33__PSGAboutController_viewDidLoad__block_invoke_1126;
    v11[3] = &unk_264E8C8A0;
    v11[4] = self;
    [v10 updateSpecifiersWithCompletionHandler:v11];
  }
}

void __33__PSGAboutController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__PSGAboutController_viewDidLoad__block_invoke_2;
  block[3] = &unk_264E8C8A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__PSGAboutController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = [*(id *)(a1 + 32) specifierIDPendingPush];
  if ([v6 length])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v2 specifierIDPendingPush];
    id v4 = [v2 specifierForID:v3];

    if (v4)
    {
      uint64_t v5 = _PSGLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        int v8 = "-[PSGAboutController viewDidLoad]_block_invoke_2";
        _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: handling deferred url after ndo specifiers did load", buf, 0xCu);
      }

      [*(id *)(a1 + 32) handlePendingURL];
    }
  }
  else
  {
  }
}

void __33__PSGAboutController_viewDidLoad__block_invoke_1126(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__PSGAboutController_viewDidLoad__block_invoke_2_1127;
  block[3] = &unk_264E8C8A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__PSGAboutController_viewDidLoad__block_invoke_2_1127(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = [*(id *)(a1 + 32) specifierIDPendingPush];
  if ([v6 length])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v2 specifierIDPendingPush];
    id v4 = [v2 specifierForID:v3];

    if (v4)
    {
      uint64_t v5 = _PSGLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        int v8 = "-[PSGAboutController viewDidLoad]_block_invoke_2";
        _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: handling deferred url after p&sh specifiers did load", buf, 0xCu);
      }

      [*(id *)(a1 + 32) handlePendingURL];
    }
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSGAboutController;
  [(PSGAboutController *)&v5 viewWillDisappear:a3];
  id v3 = +[PSSpecifierDataSource sharedInstance];
  [v3 cleanupMLReloadTimer];

  id v4 = +[PSSpecifierDataSource sharedInstance];
  [v4 enableMLUpdates:0];
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PSSpecifierDataSource sharedInstance];
  [v7 setDeviceName:v6 specifier:v5];
}

- (id)deviceName:(id)a3
{
  id v3 = a3;
  id v4 = +[PSSpecifierDataSource sharedInstance];
  id v5 = [v4 deviceName:v3];

  return v5;
}

- (void)updateDeviceNameSpecifierIfNeeded
{
  id v7 = [(PSGAboutController *)self specifierForID:@"NAME_CELL_ID"];
  BOOL v3 = [v7 detailControllerClass] == 0;
  int isDeviceNameEditable = _isDeviceNameEditable();
  if (((v3 ^ isDeviceNameEditable) & 1) == 0)
  {
    if (isDeviceNameEditable)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 4;
    }
    [v7 setDetailControllerClass:v5];
    [v7 setCellType:v6];
  }
  [(PSGAboutController *)self reloadSpecifierID:@"NAME_CELL_ID" animated:1];
}

- (void)handleResourceDictionaryWhenAlreadyPresented:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = _PSGLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PSGAboutController handleResourceDictionaryWhenAlreadyPresented:]";
    _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading the page even though we are already at the destination.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = +[PSSpecifierDataSource sharedInstance];
  [v5 reloadSpecifiers];

  [(PSGAboutController *)self reloadSpecifiers];
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end