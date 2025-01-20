@interface ICSKeychainSyncViewController
- (BOOL)_isLocalizedForWLAN;
- (ICSKeychainSyncViewController)initWithAccountManager:(id)a3;
- (id)_isKeychainSyncEnabledForSpecifier:(id)a3;
- (id)_specifierForKeychainSwitchCell;
- (id)_tobleroneKeychainSpecifiers;
- (id)specifiers;
- (void)_beginManateeUpgradeAndEnableKeychain;
- (void)_keychainSyncStatusDidChange;
- (void)_registerForKeychainSyncStatusChangeNotification;
- (void)_reloadParentSpecifier;
- (void)_sendToggleCancelled:(BOOL)a3;
- (void)_sendToggleCompleted:(BOOL)a3;
- (void)_sendToggleInitiated:(BOOL)a3;
- (void)_setKeychainSyncEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopListeningForKeychainSyncStatusChangeNotification;
- (void)_stopSpinnerInActiveSpecifier:(id)a3;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICSKeychainSyncViewController

- (ICSKeychainSyncViewController)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSKeychainSyncViewController;
  v5 = [(ICSKeychainSyncViewController *)&v12 init];
  if (v5)
  {
    v6 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    v7 = [v4 accounts];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v9 = [(ICSAnalyticsController *)v6 initWithAccount:v8];
    analyticsController = v5->_analyticsController;
    v5->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v9;
  }
  return v5;
}

- (void)dealloc
{
  [(ICSKeychainSyncViewController *)self _stopListeningForKeychainSyncStatusChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)ICSKeychainSyncViewController;
  [(ICSKeychainSyncViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ICSKeychainSyncViewController;
  [(ICSKeychainSyncViewController *)&v5 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"KEYCHAIN_NAV_BAR_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [(ICSKeychainSyncViewController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ICSKeychainSyncViewController;
  [(ICSKeychainSyncViewController *)&v12 viewDidAppear:a3];
  [(ICSKeychainSyncViewController *)self _registerForKeychainSyncStatusChangeNotification];
  objc_initWeak(&location, self);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v6 = *MEMORY[0x263F53B40];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__ICSKeychainSyncViewController_viewDidAppear___block_invoke;
  v9[3] = &unk_2655B5868;
  objc_copyWeak(&v10, &location);
  v7 = [v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v9];
  id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_id restrictionChangeNotificationObserver = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __47__ICSKeychainSyncViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self->_restrictionChangeNotificationObserver];

  id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_id restrictionChangeNotificationObserver = 0;

  v7.receiver = self;
  v7.super_class = (Class)ICSKeychainSyncViewController;
  [(ICSKeychainSyncViewController *)&v7 viewDidDisappear:v3];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [(ICSKeychainSyncViewController *)self _tobleroneKeychainSpecifiers];
    uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_tobleroneKeychainSpecifiers
{
  v27[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATACLASS_HEADER_GROUP"];
  id v4 = (void *)MEMORY[0x263F5FC40];
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  objc_super v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v7 setProperty:v9 forKey:*MEMORY[0x263F602D0]];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"KEYCHAIN_DATACLASS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v7 setProperty:v11 forKey:*MEMORY[0x263F602C8]];

  objc_super v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"ICLOUD_KEYCHAIN_KB_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v7 setObject:v13 forKeyedSubscript:@"AAUIDataclassAttributedLink"];

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v7 setObject:v15 forKeyedSubscript:@"AAUIDataclassAttributedLinkText"];

  [v7 setProperty:&unk_270E05C00 forKey:*MEMORY[0x263F5FEF0]];
  v16 = [MEMORY[0x263F827E8] imageForDataclassWithType:@"com.apple.graphic-icon.passwords"];
  [v7 setProperty:v16 forKey:*MEMORY[0x263F60140]];

  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
  v19 = [v17 localizedStringForKey:v18 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:sel__setKeychainSyncEnabled_withSpecifier_ get:sel__isKeychainSyncEnabledForSpecifier_ detail:0 cell:6 edit:0];
  switchCellSpecifier = self->_switchCellSpecifier;
  self->_switchCellSpecifier = v20;

  uint64_t v22 = *MEMORY[0x263F600A8];
  [(PSSpecifier *)self->_switchCellSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  v23 = [MEMORY[0x263F53C50] sharedConnection];
  LODWORD(v18) = [v23 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53868]];

  if (v18) {
    [(PSSpecifier *)self->_switchCellSpecifier setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v22];
  }
  [(PSSpecifier *)self->_switchCellSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  uint64_t v24 = *MEMORY[0x263EFACB0];
  [(PSSpecifier *)self->_switchCellSpecifier setObject:*MEMORY[0x263EFACB0] forKeyedSubscript:*MEMORY[0x263F60138]];
  [(PSSpecifier *)self->_switchCellSpecifier setObject:v24 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  v27[0] = v3;
  v27[1] = v7;
  v27[2] = self->_switchCellSpecifier;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];

  return v25;
}

- (id)_specifierForKeychainSwitchCell
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"ICLOUD_KEYCHAIN_LABEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel__setKeychainSyncEnabled_withSpecifier_ get:sel__isKeychainSyncEnabledForSpecifier_ detail:0 cell:6 edit:0];

  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v6;
}

- (void)_startSpinnerInSpecifier:(id)a3
{
}

- (void)_stopSpinnerInActiveSpecifier:(id)a3
{
}

- (BOOL)_isLocalizedForWLAN
{
  return MEMORY[0x270F95FB8](@"wapi", a2);
}

- (id)_isKeychainSyncEnabledForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = +[ICSKeychainSyncController isKeychainSyncEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)_setKeychainSyncEnabled:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  [(ICSKeychainSyncViewController *)self _startSpinnerInSpecifier:a4];
  -[ICSKeychainSyncViewController _sendToggleInitiated:](self, "_sendToggleInitiated:", [v6 BOOLValue]);
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode])
  {
    objc_super v7 = (void *)MEMORY[0x263F259E0];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"KEYCHAIN_NOT_AVAILABLE_IN_DEMO_MODE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"OK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    [v7 showUserNotificationWithTitle:v9 message:0 cancelButtonTitle:v11 otherButtonTitle:0 withCompletionBlock:&__block_literal_global_5];

    [(ICSKeychainSyncViewController *)self _keychainSyncStatusDidChange];
    -[ICSKeychainSyncViewController _sendToggleCompleted:](self, "_sendToggleCompleted:", [v6 BOOLValue]);
  }
  else
  {
    self->_isTogglingKeychainSync = 1;
    if ([v6 BOOLValue])
    {
      id v12 = objc_alloc(MEMORY[0x263F343F0]);
      v13 = [MEMORY[0x263F34350] contextForPrimaryAccount];
      v14 = (void *)[v12 initWithContext:v13];

      id v19 = 0;
      char v15 = [v14 isManateeAvailable:&v19];
      id v16 = v19;
      if (v15)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_2;
        v18[3] = &unk_2655B61B8;
        v18[4] = self;
        [MEMORY[0x263F343A0] setUserVisibleKeychainSyncEnabled:1 withCompletion:v18];
      }
      else
      {
        [(ICSKeychainSyncViewController *)self _beginManateeUpgradeAndEnableKeychain];
      }
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_3;
      v17[3] = &unk_2655B61B8;
      v17[4] = self;
      [MEMORY[0x263F343A0] setUserVisibleKeychainSyncEnabled:0 withCompletion:v17];
    }
  }
}

void __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  BOOL v4 = [v6 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F342B0]])
  {
    uint64_t v5 = [v6 code];

    if (v5 == -5700)
    {
      [*(id *)(a1 + 32) _beginManateeUpgradeAndEnableKeychain];
      goto LABEL_6;
    }
  }
  else
  {
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 0;
  [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
  [*(id *)(a1 + 32) _sendToggleCompleted:1];
LABEL_6:
}

uint64_t __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 0;
  [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
  v2 = *(void **)(a1 + 32);

  return [v2 _sendToggleCompleted:0];
}

- (void)_beginManateeUpgradeAndEnableKeychain
{
  self->_isTogglingKeychainSync = 1;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F25D70]) initWithNibName:0 bundle:0];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
  id v5 = objc_alloc(MEMORY[0x263F34A18]);
  id v6 = [MEMORY[0x263F34328] sharedInstance];
  objc_super v7 = [v6 primaryAccountAltDSID];
  v8 = (void *)[v5 initWithAltDSID:v7];

  [v8 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [v8 setDeviceToDeviceEncryptionUpgradeType:0];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"UPGRADE_ACCOUNT_SECURITY_FEATURE_KEYCHAIN" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v8 setFeatureName:v10];

  [v8 setPresentingViewController:self];
  v11 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke;
  v13[3] = &unk_2655B61E0;
  id v14 = v4;
  char v15 = self;
  id v12 = v4;
  [v11 performDeviceToDeviceEncryptionStateRepairWithCompletion:v13];
}

uint64_t __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 40) _stopSpinnerInActiveSpecifier:*(void *)(*(void *)(a1 + 40) + 1384)];
  if (a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke_2;
    v6[3] = &unk_2655B61B8;
    v6[4] = *(void *)(a1 + 40);
    return [MEMORY[0x263F343A0] setUserVisibleKeychainSyncEnabled:1 withCompletion:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1400) = 0;
    [*(id *)(a1 + 40) _keychainSyncStatusDidChange];
    id v5 = *(void **)(a1 + 40);
    return [v5 _sendToggleCancelled:1];
  }
}

uint64_t __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 0;
  [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
  v2 = *(void **)(a1 + 32);

  return [v2 _sendToggleCompleted:1];
}

- (void)_reloadParentSpecifier
{
  id v4 = [(ICSKeychainSyncViewController *)self parentController];
  uint64_t v3 = [(ICSKeychainSyncViewController *)self specifier];
  [v4 reloadSpecifier:v3];
}

- (void)_keychainSyncStatusDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ICSKeychainSyncViewController__keychainSyncStatusDidChange__block_invoke;
  block[3] = &unk_2655B5688;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__ICSKeychainSyncViewController__keychainSyncStatusDidChange__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1400);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Received Keychain Sync status change notification. In the middle of toggling the switch? %d", (uint8_t *)v5, 8u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 1400))
  {
    [(id)result _stopSpinnerInActiveSpecifier:*(void *)(result + 1384)];
    [*(id *)(a1 + 32) reloadSpecifiers];
    return [*(id *)(a1 + 32) _reloadParentSpecifier];
  }
  return result;
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  int v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "Registering for Keychain Sync status change notification.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = (const char *)*MEMORY[0x263F16DA0];
  id v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke;
  handler[3] = &unk_2655B5BA0;
  objc_copyWeak(&v14, buf);
  notify_register_dispatch(v4, &self->_keychainSyncNotificationToken, v5, handler);

  objc_super v7 = (const char *)*MEMORY[0x263F16E00];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_2;
  v11[3] = &unk_2655B5BA0;
  objc_copyWeak(&v12, buf);
  notify_register_dispatch(v7, &self->_keychainSyncNotificationToken, v5, v11);

  v8 = (const char *)*MEMORY[0x263F16E10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_3;
  v9[3] = &unk_2655B5BA0;
  objc_copyWeak(&v10, buf);
  notify_register_dispatch(v8, &self->_keychainViewNotificationToken, v5, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
  int v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for Keychain Sync status change notification.", v4, 2u);
  }

  notify_cancel(self->_keychainSyncNotificationToken);
}

- (void)_sendToggleInitiated:(BOOL)a3
{
}

- (void)_sendToggleCompleted:(BOOL)a3
{
}

- (void)_sendToggleCancelled:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);

  objc_storeStrong((id *)&self->_switchCellSpecifier, 0);
}

@end