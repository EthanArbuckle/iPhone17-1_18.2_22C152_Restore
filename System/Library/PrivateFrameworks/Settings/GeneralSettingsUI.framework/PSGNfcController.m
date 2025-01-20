@interface PSGNfcController
- (BOOL)_setNfcEnable:(BOOL)a3;
- (BOOL)restrictedFeature;
- (PSSpecifier)groupSpecifier;
- (id)nfcEnable;
- (id)specifiers;
- (unsigned)hwState;
- (void)_disableNfcRadio;
- (void)_enableNfcRadio;
- (void)_refreshFooterForSpecifier:(id)a3;
- (void)_refreshNfcRadioStateSetting;
- (void)_updateHwStateChange;
- (void)dealloc;
- (void)didChangeRadioState:(BOOL)a3;
- (void)hardwareStateDidChange;
- (void)nfcEnable;
- (void)setGroupSpecifier:(id)a3;
- (void)setHwState:(unsigned int)a3;
- (void)setNfcEnable:(id)a3 specifier:(id)a4;
- (void)setRestrictedFeature:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PSGNfcController

- (void)dealloc
{
  v3 = [MEMORY[0x263F58110] sharedHardwareManager];
  [v3 unregisterEventListener:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGNfcController;
  [(PSGNfcController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3 = [MEMORY[0x263F58110] sharedHardwareManager];
  [v3 registerEventListener:self];
  -[PSGNfcController setHwState:](self, "setHwState:", [v3 getHwSupport]);
  v4.receiver = self;
  v4.super_class = (Class)PSGNfcController;
  [(PSGNfcController *)&v4 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x263EF8340];
  v5 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/NFC_LINK"];
  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = PSG_BundleForGeneralSettingsUIFramework();
  v9 = [v8 bundleURL];
  v10 = (void *)[v6 initWithKey:@"NFC" table:@"Nfc" locale:v7 bundleURL:v9];

  v11 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v14[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [(PSGNfcController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.contactless-and-nfc" title:v10 localizedNavigationComponents:v12 deepLink:v5];

  v13.receiver = self;
  v13.super_class = (Class)PSGNfcController;
  [(PSGNfcController *)&v13 viewDidAppear:v3];
}

- (id)specifiers
{
  [(PSGNfcController *)self _updateHwStateChange];
  unsigned int v3 = [(PSGNfcController *)self hwState];
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (!v5)
  {
    BOOL v10 = v3 == 2;
    v11 = [(PSGNfcController *)self loadSpecifiersFromPlistName:@"Nfc" target:self];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v11;

    objc_super v13 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) specifierForID:@"NFC_GROUP_ID"];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v13;

    id v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) specifierForID:@"NFC"];
    v15 = [MEMORY[0x263F53C50] sharedConnection];
    -[PSGNfcController setRestrictedFeature:](self, "setRestrictedFeature:", [v15 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F539B8]]);

    v16 = objc_msgSend(NSNumber, "numberWithInt:", v10 & ~-[PSGNfcController restrictedFeature](self, "restrictedFeature"));
    [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600A8]];

    [(PSGNfcController *)self _refreshFooterForSpecifier:self->_groupSpecifier];
    goto LABEL_13;
  }
  id v6 = [v5 specifierForID:@"NFC"];
  if (v3 == 2)
  {
    if (![(PSGNfcController *)self restrictedFeature])
    {
      uint64_t v17 = *MEMORY[0x263F600A8];
      uint64_t v18 = MEMORY[0x263EFFA88];
      goto LABEL_12;
    }
    v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v8 = "NFC feature not allowed";
      v9 = (uint8_t *)&v21;
LABEL_9:
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "NFC hardware not ready";
      v9 = buf;
      goto LABEL_9;
    }
  }

  uint64_t v17 = *MEMORY[0x263F600A8];
  uint64_t v18 = MEMORY[0x263EFFA80];
LABEL_12:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v17, v21);
LABEL_13:
  id v19 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);

  return v19;
}

- (id)nfcEnable
{
  if ([(PSGNfcController *)self hwState] == 2)
  {
    v2 = [MEMORY[0x263F58110] sharedHardwareManager];
    uint64_t v9 = 0;
    unsigned int v3 = [v2 getRadioEnabledState:&v9];
    if (v3)
    {
      uint64_t v4 = _PSGLoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(PSGNfcController *)(uint64_t)v3 nfcEnable];
      }

      v5 = NSNumber;
      BOOL v6 = 0;
    }
    else
    {
      v5 = NSNumber;
      BOOL v6 = v9 == 1;
    }
    v7 = [v5 numberWithBool:v6];
  }
  else
  {
    v7 = [NSNumber numberWithBool:0];
  }
  return v7;
}

- (void)_refreshNfcRadioStateSetting
{
  id v3 = [(PSGNfcController *)self specifierForID:@"NFC"];
  [(PSGNfcController *)self reloadSpecifier:v3];
}

- (BOOL)_setNfcEnable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F58110] sharedHardwareManager];
  v5 = [v4 setRadioEnabledSetting:v3];
  if (v5)
  {
    BOOL v6 = _PSGLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSGNfcController _setNfcEnable:]((uint64_t)v5, v6);
    }
  }
  return v5 == 0;
}

- (void)_enableNfcRadio
{
  [(PSGNfcController *)self _setNfcEnable:1];
  [(PSGNfcController *)self _refreshNfcRadioStateSetting];
}

- (void)_disableNfcRadio
{
  [(PSGNfcController *)self _setNfcEnable:0];
  [(PSGNfcController *)self _refreshNfcRadioStateSetting];
}

- (void)setNfcEnable:(id)a3 specifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [a3 BOOLValue];
  v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v6;
    __int16 v24 = 1024;
    int v25 = v7;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "Specifier=%{public}@, Enable=%d", buf, 0x12u);
  }

  if (v7)
  {
    [(PSGNfcController *)self _enableNfcRadio];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F82418];
    BOOL v10 = PSG_LocalizedStringForNFC(@"NFC_RADIO_DISABLE_CONFIRMATION_TITLE");
    v11 = PSG_LocalizedStringForNFC(@"NFC_RADIO_DISABLE_CONFIRMATION_DESCRIPTION");
    v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    objc_super v13 = (void *)MEMORY[0x263F82400];
    v14 = PSG_LocalizedStringForNFC(@"NFC_RADIO_DISABLE_CONFIRMATION_OK");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__PSGNfcController_setNfcEnable_specifier___block_invoke;
    v21[3] = &unk_264E8CD48;
    v21[4] = self;
    v15 = [v13 actionWithTitle:v14 style:0 handler:v21];
    [v12 addAction:v15];

    v16 = (void *)MEMORY[0x263F82400];
    uint64_t v17 = PSG_LocalizedStringForNFC(@"NFC_RADIO_DISABLE_CONFIRMATION_CANCEL");
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__PSGNfcController_setNfcEnable_specifier___block_invoke_2;
    v20[3] = &unk_264E8CD48;
    v20[4] = self;
    uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:v20];
    [v12 addAction:v18];

    id v19 = _PSGLoggingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v19, OS_LOG_TYPE_DEFAULT, "Showing confirmation for NFC radio disable.", buf, 2u);
    }

    [(PSGNfcController *)self presentViewController:v12 animated:1 completion:0];
  }
}

uint64_t __43__PSGNfcController_setNfcEnable_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableNfcRadio];
}

uint64_t __43__PSGNfcController_setNfcEnable_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshNfcRadioStateSetting];
}

- (void)_refreshFooterForSpecifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v7 = [v4 stringWithString:@"NFC_FOOTER_BASE"];
  id v6 = PSG_LocalizedStringForNFC(v7);
  [v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];

  [(PSGNfcController *)self reloadSpecifier:v5];
}

- (void)_updateHwStateChange
{
  if ([(PSGNfcController *)self hwState] != 4 && [(PSGNfcController *)self hwState] != 2)
  {
    id v3 = [MEMORY[0x263F58110] sharedHardwareManager];
    -[PSGNfcController setHwState:](self, "setHwState:", [v3 getHwSupport]);
  }
}

- (void)didChangeRadioState:(BOOL)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PSGNfcController_didChangeRadioState___block_invoke;
  block[3] = &unk_264E8CFD0;
  objc_copyWeak(&v5, &location);
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__PSGNfcController_didChangeRadioState___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [v3 specifierForID:@"NFC"];
  id v13 = [v3 indexPathForSpecifier:v4];

  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v6 = [WeakRetained table];
  id v7 = [v6 cellForRowAtIndexPath:v13];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  BOOL v10 = [v9 control];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  [v12 setOn:*(unsigned __int8 *)(a1 + 40)];
}

- (void)hardwareStateDidChange
{
  unsigned int v3 = [(PSGNfcController *)self hwState];
  [(PSGNfcController *)self _updateHwStateChange];
  if (v3 != 4 && v3 != [(PSGNfcController *)self hwState])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PSGNfcController_hardwareStateDidChange__block_invoke;
    block[3] = &unk_264E8C8A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __42__PSGNfcController_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) specifierForID:@"NFC"];
  BOOL v2 = [*(id *)(a1 + 32) hwState] == 2;
  unsigned int v3 = objc_msgSend(NSNumber, "numberWithInt:", v2 & ~objc_msgSend(*(id *)(a1 + 32), "restrictedFeature"));
  [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [*(id *)(a1 + 32) _refreshNfcRadioStateSetting];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (unsigned)hwState
{
  return self->_hwState;
}

- (void)setHwState:(unsigned int)a3
{
  self->_hwState = a3;
}

- (BOOL)restrictedFeature
{
  return self->_restrictedFeature;
}

- (void)setRestrictedFeature:(BOOL)a3
{
  self->_restrictedFeature = a3;
}

- (void).cxx_destruct
{
}

- (void)nfcEnable
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "Fetch NFC status error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_setNfcEnable:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "Setting NFC status error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end