@interface STPasscodeGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 listController:(id)a4;
- (BOOL)isHidden;
- (PSListController)listController;
- (PSSpecifier)togglePasscodeSpecifier;
- (STPasscodeGroupSpecifierProvider)init;
- (id)_authenticationContextWithReasonKey:(id)a3 presentingViewController:(id)a4;
- (id)_removePasscodeActionWithPINOptionsTitle:(id)a3 pinOptionsHandler:(id)a4 pinValidationHandler:(id)a5;
- (void)_promptForRecoveryAppleIDWithPINController:(id)a3 passcode:(id)a4;
- (void)_removeManagedPasscode;
- (void)_setManagedPasscode;
- (void)changeOrRemovePasscode:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)reloadTogglePasscodeSpecifier;
- (void)setCoordinator:(id)a3;
- (void)setTogglePasscodeSpecifier:(id)a3;
@end

@implementation STPasscodeGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 listController:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___STPasscodeGroupSpecifierProvider;
  id v5 = a4;
  objc_msgSendSuper2(&v8, sel_providerWithCoordinator_, a3);
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v6 + 7, v5);

  return v6;
}

- (STPasscodeGroupSpecifierProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)STPasscodeGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    if (_os_feature_enabled_impl()) {
      id v5 = @"LockScreenTimeSettingsButtonName";
    }
    else {
      id v5 = @"EnableScreenTimePasscodeButtonName";
    }
    v6 = [v4 localizedStringForKey:v5 value:&stru_26D9391A8 table:0];

    v7 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v3, 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    objc_super v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v7 setObject:&unk_26D9670D8 forKeyedSubscript:*MEMORY[0x263F60320]];
    [(STPasscodeGroupSpecifierProvider *)v3 setTogglePasscodeSpecifier:v7];
    v10 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    v11 = [(STPasscodeGroupSpecifierProvider *)v3 togglePasscodeSpecifier];
    [v10 addObject:v11];

    v12 = [MEMORY[0x263F53C50] sharedConnection];
    [v12 registerObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STPasscodeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STPasscodeGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"passcodeEnabled" context:"STPasscodeGroupSpecifierProviderObservationContext"];
  if (_os_feature_enabled_impl()) {
    v6 = @"viewModel.canEditScreenTimePasscode";
  }
  else {
    v6 = @"viewModel.canStopScreenTime";
  }
  [v5 removeObserver:self forKeyPath:v6 context:"STPasscodeGroupSpecifierProviderObservationContext"];
  v8.receiver = self;
  v8.super_class = (Class)STPasscodeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v8 setCoordinator:v4];
  if (_os_feature_enabled_impl()) {
    v7 = @"viewModel.canEditScreenTimePasscode";
  }
  else {
    v7 = @"viewModel.canStopScreenTime";
  }
  [v4 addObserver:self forKeyPath:v7 options:4 context:"STPasscodeGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"passcodeEnabled" options:4 context:"STPasscodeGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 != "STPasscodeGroupSpecifierProviderObservationContext")
  {
    v18.receiver = self;
    v18.super_class = (Class)STPasscodeGroupSpecifierProvider;
    [(STPasscodeGroupSpecifierProvider *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"viewModel.canEditScreenTimePasscode"])
    {
      v11 = [MEMORY[0x263F53C50] sharedConnection];
      int v12 = [v11 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

      v13 = [(STRootGroupSpecifierProvider *)self coordinator];
      objc_super v14 = [v13 viewModel];
      unsigned int v15 = [v14 canEditScreenTimePasscode] ^ 1;
      if (v12 == 2) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v15;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:v16];

      goto LABEL_12;
    }
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"viewModel.canStopScreenTime"])
    {
      v13 = [(STRootGroupSpecifierProvider *)self coordinator];
      v17 = [v13 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v17 canStopScreenTime] ^ 1);

LABEL_12:
      goto LABEL_15;
    }
  }
  [(STRootGroupSpecifierProvider *)self coordinator];

  if ([v10 isEqualToString:@"passcodeEnabled"]) {
    [(STPasscodeGroupSpecifierProvider *)self reloadTogglePasscodeSpecifier];
  }
LABEL_15:
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v10 = [(STRootGroupSpecifierProvider *)self coordinator];
    v7 = [v10 viewModel];
    unsigned int v8 = [v7 canEditScreenTimePasscode] ^ 1;
    if (v6 == 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v9];
  }
}

- (void)reloadTogglePasscodeSpecifier
{
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  int v4 = [v3 isPasscodeEnabled];
  objc_super v5 = [(STPasscodeGroupSpecifierProvider *)self togglePasscodeSpecifier];
  int v6 = +[STScreenTimeSettingsUIBundle bundle];
  v7 = v6;
  if (v4)
  {
    unsigned int v8 = [v6 localizedStringForKey:@"ChangeScreenTimePasscodeButtonName" value:&stru_26D9391A8 table:0];
    [v5 setName:v8];

    [v5 removePropertyForKey:*MEMORY[0x263F60228]];
    [v5 removePropertyForKey:*MEMORY[0x263F60320]];
    [v5 setEditPaneClass:0];
    [v5 setTarget:self];
    [v5 setButtonAction:sel_changeOrRemovePasscode_];
  }
  else
  {
    if (_os_feature_enabled_impl()) {
      uint64_t v9 = @"LockScreenTimeSettingsButtonName";
    }
    else {
      uint64_t v9 = @"EnableScreenTimePasscodeButtonName";
    }
    id v10 = [v7 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];
    [v5 setName:v10];

    objc_msgSend(v5, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v5 setObject:&unk_26D9670D8 forKeyedSubscript:*MEMORY[0x263F60320]];
  }
  v13 = [v3 viewModel];
  objc_super v14 = [v13 me];
  int v15 = [v14 needsRecoveryAppleID];

  if (!v15)
  {
    [v5 removePropertyForKey:0x26D940348];
    [v5 removePropertyForKey:0x26D93FEA8];
    if (!v4) {
      goto LABEL_9;
    }
LABEL_11:
    v17 = [(STGroupSpecifierProvider *)self groupSpecifier];
    [v17 removePropertyForKey:*MEMORY[0x263F600F8]];
    goto LABEL_12;
  }
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940348];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__STPasscodeGroupSpecifierProvider_reloadTogglePasscodeSpecifier__block_invoke;
  aBlock[3] = &unk_264767E90;
  aBlock[4] = self;
  uint64_t v16 = _Block_copy(aBlock);
  [v5 setObject:v16 forKeyedSubscript:0x26D93FEA8];

  if (v4) {
    goto LABEL_11;
  }
LABEL_9:
  v17 = [v7 localizedStringForKey:@"EnableScreenTimePasscodeFooterText" value:&stru_26D9391A8 table:0];
  objc_super v18 = [(STGroupSpecifierProvider *)self groupSpecifier];
  [v18 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600F8]];

LABEL_12:
  v19 = [(STGroupSpecifierProvider *)self groupSpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v19 animated:1];
}

uint64_t __65__STPasscodeGroupSpecifierProvider_reloadTogglePasscodeSpecifier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _promptForRecoveryAppleIDWithPINController:a2 passcode:a3];
}

- (void)changeOrRemovePasscode:(id)a3
{
  int v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  objc_super v5 = [v4 viewModel];

  int v6 = [v5 isRemotelyManagedUserWithPasscode];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  unsigned int v8 = [MEMORY[0x263F82670] currentDevice];
  unsigned int v9 = objc_msgSend(v8, "sf_isiPad");

  uint64_t v54 = v9;
  if (v6)
  {
    if (v9)
    {
      id v10 = [v7 localizedStringForKey:@"ChangePasscodeAlertTitle" value:&stru_26D9391A8 table:0];
    }
    else
    {
      id v10 = 0;
    }
    int v12 = [v7 localizedStringForKey:@"ChangeScreenTimePasscodeConfirmPrompt" value:&stru_26D9391A8 table:0];
    v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v12 preferredStyle:v9];
  }
  else
  {
    v11 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:v9];
  }
  v13 = (void *)MEMORY[0x263F5FC40];
  if (_os_feature_enabled_impl()) {
    objc_super v14 = @"LockScreenTimeSettingsButtonName";
  }
  else {
    objc_super v14 = @"EnableScreenTimePasscodeButtonName";
  }
  int v15 = [v7 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
  v61 = objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));

  uint64_t v16 = [v5 me];
  if ([v16 needsRecoveryAppleID])
  {
    v17 = (objc_class *)objc_opt_class();
    objc_super v18 = NSStringFromClass(v17);
    [v61 setObject:v18 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v61 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940348];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke;
    aBlock[3] = &unk_264767E90;
    aBlock[4] = self;
    v19 = _Block_copy(aBlock);
    [v61 setObject:v19 forKeyedSubscript:0x26D93FEC8];
  }
  char v55 = v9;
  if (![v16 canRecoveryAuthenticate]) {
    goto LABEL_15;
  }
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2;
  v76[3] = &unk_264767F08;
  char v79 = v9;
  id v77 = v16;
  v78 = self;
  v20 = _Block_copy(v76);

  if (v20)
  {
    uint64_t v21 = [v7 localizedStringForKey:@"ForgotPasscodeButtonTitle" value:&stru_26D9391A8 table:0];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_91;
    v75[3] = &unk_264767F30;
    v75[4] = self;
    v56 = v5;
    v22 = v11;
    v23 = v7;
    int v24 = v6;
    v25 = _Block_copy(v75);
    [v61 setObject:v21 forKeyedSubscript:0x26D940368];
    v26 = _Block_copy(v20);
    [v61 setObject:v26 forKeyedSubscript:0x26D940388];

    v27 = _Block_copy(v25);
    [v61 setObject:v27 forKeyedSubscript:0x26D93FEE8];

    v28 = v25;
    int v6 = v24;
    v7 = v23;
    v11 = v22;
    objc_super v5 = v56;
    v29 = v20;
  }
  else
  {
LABEL_15:
    v29 = 0;
    uint64_t v21 = 0;
    v28 = 0;
  }
  v59 = v28;
  v60 = (void *)v21;
  v58 = v29;
  v30 = -[STPasscodeGroupSpecifierProvider _removePasscodeActionWithPINOptionsTitle:pinOptionsHandler:pinValidationHandler:](self, "_removePasscodeActionWithPINOptionsTitle:pinOptionsHandler:pinValidationHandler:", v21);
  v31 = (void *)MEMORY[0x263F82400];
  v32 = [v7 localizedStringForKey:@"ChangeScreenTimePasscodeButtonName" value:&stru_26D9391A8 table:0];
  if (v6)
  {
    v53 = v16;
    v57 = v5;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_94;
    v71[3] = &unk_2647672F0;
    id v33 = v7;
    id v72 = v33;
    id v73 = v61;
    v74 = self;
    v34 = [v31 actionWithTitle:v32 style:0 handler:v71];
    [v11 addAction:v34];

    v35 = [(STRootGroupSpecifierProvider *)self coordinator];
    v36 = [v35 viewModel];
    v37 = [v36 me];

    v38 = [v37 name];

    if (v38)
    {
      v39 = objc_opt_new();
      v40 = [v37 name];
      v41 = [v39 personNameComponentsFromString:v40];

      v42 = [v41 givenName];
    }
    else
    {
      v42 = 0;
    }
    unint64_t v45 = 0x263F82000uLL;
    v46 = (void *)MEMORY[0x263F82400];
    v47 = [v33 localizedStringForKey:@"TurnOffScreenTimePasscodeButtonName" value:&stru_26D9391A8 table:0];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_116;
    v64[3] = &unk_264767FA8;
    id v65 = v42;
    char v70 = v55;
    id v66 = v33;
    uint64_t v69 = v54;
    id v67 = v30;
    v68 = self;
    id v48 = v42;
    v49 = [v46 actionWithTitle:v47 style:2 handler:v64];
    [v11 addAction:v49];

    objc_super v5 = v57;
    v43 = &v72;
    uint64_t v16 = v53;
  }
  else
  {
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_130;
    v62[3] = &unk_264767368;
    v43 = (id *)v63;
    v63[0] = v61;
    v63[1] = self;
    v44 = [v31 actionWithTitle:v32 style:0 handler:v62];
    [v11 addAction:v44];

    [v11 addAction:v30];
    unint64_t v45 = 0x263F82000;
  }

  v50 = *(void **)(v45 + 1024);
  v51 = [v7 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v52 = [v50 actionWithTitle:v51 style:1 handler:0];
  [v11 addAction:v52];

  [(STGroupSpecifierProvider *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _promptForRecoveryAppleIDWithPINController:a2 passcode:a3];
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isBlocked] && !*(unsigned char *)(a1 + 48))
  {
    v7 = [MEMORY[0x263F828A0] activeKeyboard];
    [v7 setUserInteractionEnabled:1];
  }
  unsigned int v8 = [*(id *)(a1 + 32) recoveryAltDSID];
  unsigned int v9 = @"EnterRecoveryAppleIDAlertReason";
  if (!v8) {
    unsigned int v9 = @"EnterAppleIDAlertReason";
  }
  id v10 = v9;

  v11 = [*(id *)(a1 + 40) _authenticationContextWithReasonKey:v10 presentingViewController:v5];

  [v11 setAppProvidedContext:@"recovery"];
  int v12 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3;
  v15[3] = &unk_264767EE0;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v18 = v6;
  char v19 = *(unsigned char *)(a1 + 48);
  id v13 = v6;
  id v14 = v5;
  [v12 authenticateWithContext:v11 completion:v15];
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4;
  v10[3] = &unk_264767EB8;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  [v7 addOperationWithBlock:v10];
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  int v4 = [*(id *)(v2 + 8) recoveryAltDSID];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) altDSID];
  }
  v7 = v6;

  id v8 = (id *)(a1 + 48);
  id v9 = [*(id *)(a1 + 48) domain];
  if ([v9 isEqualToString:*MEMORY[0x263F28F30]]) {
    BOOL v10 = [*v8 code] == -7003;
  }
  else {
    BOOL v10 = 0;
  }

  if (*v8 || ![v3 isEqual:v7])
  {
    if (!v10)
    {
      if (*v8)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3();
        }
      }
      else if (v3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_2((uint64_t)v3, (uint64_t)v7);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_1();
      }
      [*(id *)(a1 + 56) recoveryAuthenticationFailed:*(void *)(a1 + 64)];
    }
  }
  else
  {
    [*(id *)(a1 + 56) setPasscodeOptionsTitle:0];
    [*(id *)(a1 + 56) setPasscodeOptionsHandler:0];
    id v11 = *(void **)(a1 + 56);
    id v12 = [*(id *)(a1 + 40) passcode];
    [v11 recoveryAuthenticationSucceededForPasscode:v12];
  }
  if ([*(id *)(a1 + 56) isBlocked] && !*(unsigned char *)(a1 + 72))
  {
    id v13 = [MEMORY[0x263F828A0] activeKeyboard];
    [v13 setUserInteractionEnabled:0];
  }
  id v14 = [MEMORY[0x263F82670] currentDevice];
  int v15 = objc_msgSend(v14, "sf_isiPad");

  if (v15)
  {
    char v16 = [*(id *)(a1 + 56) pane];
    [v16 deactivateKeypadView];
    [v16 activateKeypadView];
  }
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 coordinator];
  uint64_t v9 = [v8 validatePIN:v7];

  if (v9)
  {
    [v5 setPasscodeOptionsTitle:0];
    [v5 setPasscodeOptionsHandler:0];
  }

  return v9;
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_94(id *a1)
{
  uint64_t v2 = objc_opt_new();
  id v14 = 0;
  int v3 = [v2 canEvaluatePolicy:2 error:&v14];
  id v4 = v14;
  if (v3)
  {
    id v5 = [a1[4] localizedStringForKey:@"BiometricAuthenticationTitle" value:&stru_26D9391A8 table:0];
    [v2 setOptionAuthenticationTitle:v5];

    id v6 = [a1[4] localizedStringForKey:@"BiometricAuthenticationDetailText" value:&stru_26D9391A8 table:0];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3_102;
    v11[3] = &unk_264767F80;
    id v7 = a1[5];
    id v8 = a1[6];
    id v12 = v7;
    id v13 = v8;
    [v2 evaluatePolicy:1 localizedReason:v6 reply:v11];
  }
  else
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v9);
    [a1[5] setObject:v10 forKeyedSubscript:*MEMORY[0x263F60228]];

    [a1[5] setObject:&unk_26D9670F0 forKeyedSubscript:*MEMORY[0x263F60320]];
    [a1[6] showPINSheet:a1[5] completion:0];
  }
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3_102(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_103;
  v10[3] = &unk_264767F58;
  char v14 = a2;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  id v9 = v5;
  [v6 addOperationWithBlock:v10];
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_103(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    int v3 = NSStringFromClass(v2);
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*MEMORY[0x263F60228]];

    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *MEMORY[0x263F60320];
    id v6 = &unk_26D9670D8;
LABEL_3:
    [v4 setObject:v6 forKeyedSubscript:v5];
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    return [v7 showPINSheet:v8 completion:0];
  }
  else
  {
    BOOL v10 = (id *)(a1 + 48);
    id v11 = [*(id *)(a1 + 48) domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F10440]];

    if (v12)
    {
      uint64_t result = [*v10 code];
      switch(result)
      {
        case -9:
        case -4:
        case -2:
          return result;
        case -5:
          id v13 = (objc_class *)objc_opt_class();
          char v14 = NSStringFromClass(v13);
          [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:*MEMORY[0x263F60228]];

          id v4 = *(void **)(a1 + 32);
          uint64_t v5 = *MEMORY[0x263F60320];
          id v6 = &unk_26D9670F0;
          goto LABEL_3;
        default:
          [*(id *)(a1 + 32) setButtonAction:sel__setManagedPasscode];
          id v17 = NSStringFromClass(+[STDevicePINFactory devicePINControllerForPlatform]);
          [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:*MEMORY[0x263F60228]];

          id v4 = *(void **)(a1 + 32);
          uint64_t v5 = *MEMORY[0x263F60320];
          id v6 = &unk_26D967108;
          goto LABEL_3;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_103_cold_1();
      }
      int v15 = (objc_class *)objc_opt_class();
      char v16 = NSStringFromClass(v15);
      [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:*MEMORY[0x263F60228]];

      [*(id *)(a1 + 32) setObject:&unk_26D9670F0 forKeyedSubscript:*MEMORY[0x263F60320]];
      return [*(id *)(a1 + 40) showPINSheet:*(void *)(a1 + 32) completion:0];
    }
  }
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_116(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = NSString;
    int v3 = [*(id *)(a1 + 40) localizedStringForKey:@"TurnOffScreenTimePasscodeSecondConfirmPrompt" value:&stru_26D9391A8 table:0];
    objc_msgSend(v2, "localizedStringWithFormat:", v3, *(void *)(a1 + 32));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) localizedStringForKey:@"TurnOffScreenTimePasscodeGenericSecondConfirmPrompt" value:&stru_26D9391A8 table:0];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v4 = [*(id *)(a1 + 40) localizedStringForKey:@"TurnOffPasscodeAlertTitle" value:&stru_26D9391A8 table:0];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v9 preferredStyle:*(void *)(a1 + 64)];
  [v5 addAction:*(void *)(a1 + 48)];
  id v6 = (void *)MEMORY[0x263F82400];
  id v7 = [*(id *)(a1 + 40) localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  uint64_t v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v5 addAction:v8];

  [*(id *)(a1 + 56) presentViewController:v5 animated:1 completion:0];
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_130(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  int v3 = NSStringFromClass(v2);
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*MEMORY[0x263F60228]];

  [*(id *)(a1 + 32) setObject:&unk_26D9670F0 forKeyedSubscript:*MEMORY[0x263F60320]];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);

  return [v4 showPINSheet:v5 completion:0];
}

- (void)_promptForRecoveryAppleIDWithPINController:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STPasscodeGroupSpecifierProvider *)self _authenticationContextWithReasonKey:@"RecoveryAppleIDAlertReason" presentingViewController:v6];
  [v8 setAppProvidedContext:@"setup"];
  id v9 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v10 = [v9 localizedStringForKey:@"RecoveryAppleIDAlertSkipButton" value:&stru_26D9391A8 table:0];
  [v8 setCancelButtonString:v10];

  id v11 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke;
  v15[3] = &unk_264767FF8;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v9;
  id v18 = v6;
  id v12 = v6;
  id v13 = v9;
  id v14 = v7;
  [v11 authenticateWithContext:v8 completion:v15];
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F08A48] mainQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2;
  v11[3] = &unk_264767FD0;
  uint64_t v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  [v7 addOperationWithBlock:v11];
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2(id *a1)
{
  id v2 = a1[4];
  int v3 = [a1[5] objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  id v4 = [a1[4] coordinator];
  id v6 = a1 + 6;
  id v5 = a1[6];
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (!v7)
  {
    id v11 = a1[7];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3;
    v32[3] = &unk_2647671B0;
    id v33 = v2;
    id v12 = v2;
    [v4 setPIN:v11 recoveryAltDSID:v3 completionHandler:v32];
    id v13 = v33;
    goto LABEL_22;
  }
  uint64_t v8 = [v5 domain];
  if (![v8 isEqualToString:*MEMORY[0x263F28F30]])
  {

    goto LABEL_10;
  }
  uint64_t v9 = [*v6 code];

  if (v9 != -7003)
  {
LABEL_10:
    if (*v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3();
      }
    }
    else if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_cold_1();
    }
    id v10 = @"RecoveryAppleIDUnknownError";
    goto LABEL_17;
  }
  id v10 = @"RecoveryAppleIDAlertConfirmSkipTitle";
LABEL_17:
  id v12 = [a1[8] localizedStringForKey:v10 value:&stru_26D9391A8 table:0];
  id v14 = [v4 viewModel];
  id v13 = [v14 me];

  v25 = v4;
  if (([v13 isChild] & 1) != 0 || !objc_msgSend(v13, "type")) {
    id v15 = @"RecoveryAppleIDAlertConfirmSkipMessageChild";
  }
  else {
    id v15 = @"RecoveryAppleIDAlertConfirmSkipMessage";
  }
  int v24 = [a1[8] localizedStringForKey:v15 value:&stru_26D9391A8 table:0];
  id v16 = [MEMORY[0x263F82418] alertControllerWithTitle:v12 message:v24 preferredStyle:1];
  id v17 = [a1[8] localizedStringForKey:@"RecoveryAppleIDAlertSkipButton" value:&stru_26D9391A8 table:0];
  id v18 = (void *)MEMORY[0x263F82400];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_150;
  v29[3] = &unk_2647672F0;
  v29[4] = a1[4];
  id v30 = a1[7];
  id v31 = v2;
  id v19 = v2;
  v20 = [v18 actionWithTitle:v17 style:0 handler:v29];
  [v16 addAction:v20];

  uint64_t v21 = [a1[8] localizedStringForKey:@"RecoveryAppleIDAlertSetButton" value:&stru_26D9391A8 table:0];
  v22 = (void *)MEMORY[0x263F82400];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3_155;
  v26[3] = &unk_2647672F0;
  v26[4] = a1[4];
  id v27 = a1[9];
  id v28 = a1[7];
  v23 = [v22 actionWithTitle:v21 style:1 handler:v26];
  [v16 addAction:v23];

  [a1[9] presentViewController:v16 animated:1 completion:0];
  id v4 = v25;
LABEL_22:
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_150(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coordinator];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_151;
  v4[3] = &unk_2647671B0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 setPIN:v3 completionHandler:v4];
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_151(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3_155(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptForRecoveryAppleIDWithPINController:*(void *)(a1 + 40) passcode:*(void *)(a1 + 48)];
}

- (id)_authenticationContextWithReasonKey:(id)a3 presentingViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  [v7 setIsEphemeral:1];
  [v7 setAuthenticationType:2];
  [v7 setShouldPromptForPasswordOnly:1];
  [v7 _setProxiedAppName:@"ScreenTime"];
  [v7 setPresentingViewController:v5];

  uint64_t v8 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v9 = [v8 localizedStringForKey:@"RecoveryAppleIDAlertTitle" value:&stru_26D9391A8 table:0];
  [v7 setTitle:v9];

  id v10 = [v8 localizedStringForKey:v6 value:&stru_26D9391A8 table:0];

  [v7 setReason:v10];
  id v11 = [v8 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
  [v7 setDefaultButtonString:v11];

  return v7;
}

- (id)_removePasscodeActionWithPINOptionsTitle:(id)a3 pinOptionsHandler:(id)a4 pinValidationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[STScreenTimeSettingsUIBundle bundle];
  id v12 = objc_opt_new();
  id v13 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v14 = [v13 viewModel];
  if ([v14 isRemotelyManagedUserWithPasscode])
  {
    id v33 = 0;
    int v15 = [v12 canEvaluatePolicy:2 error:&v33];
    id v16 = v33;

    if (v15)
    {
      id v17 = (void *)MEMORY[0x263F82400];
      id v18 = [v11 localizedStringForKey:@"TurnOffScreenTimePasscodeButtonName" value:&stru_26D9391A8 table:0];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke;
      v29[3] = &unk_2647672F0;
      id v30 = v12;
      id v31 = v11;
      v32 = self;
      id v19 = [v17 actionWithTitle:v18 style:2 handler:v29];

      v20 = v30;
      goto LABEL_6;
    }
  }
  else
  {

    id v16 = 0;
  }
  uint64_t v21 = (void *)MEMORY[0x263F82400];
  v22 = [v11 localizedStringForKey:@"TurnOffScreenTimePasscodeButtonName" value:&stru_26D9391A8 table:0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_167;
  v24[3] = &unk_264768020;
  v24[4] = self;
  id v25 = v11;
  id v26 = v8;
  id v27 = v9;
  id v28 = v10;
  id v19 = [v21 actionWithTitle:v22 style:2 handler:v24];

  v20 = v25;
LABEL_6:

  return v19;
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) localizedStringForKey:@"BiometricAuthenticationTitle" value:&stru_26D9391A8 table:0];
  [*(id *)(a1 + 32) setOptionAuthenticationTitle:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) localizedStringForKey:@"BiometricAuthenticationDetailText" value:&stru_26D9391A8 table:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_2;
  v7[3] = &unk_264767F80;
  int8x16_t v6 = *(int8x16_t *)(a1 + 40);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v3 evaluatePolicy:1 localizedReason:v4 reply:v7];
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int8x16_t v6 = [MEMORY[0x263F08A48] mainQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_3;
  v9[3] = &unk_264767F58;
  char v12 = a2;
  BOOL v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 addOperationWithBlock:v9];
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _removeManagedPasscode];
  }
  else
  {
    uint64_t v3 = (id *)(a1 + 40);
    id v4 = [*(id *)(a1 + 40) domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F10440]];

    if (v5)
    {
      switch([*v3 code])
      {
        case -9:
        case -4:
        case -2:
          return;
        case -5:
          int8x16_t v6 = (void *)MEMORY[0x263F5FC40];
          BOOL v7 = *(void **)(a1 + 48);
          if (_os_feature_enabled_impl()) {
            id v8 = @"LockScreenTimeSettingsButtonName";
          }
          else {
            id v8 = @"EnableScreenTimePasscodeButtonName";
          }
          id v9 = [v7 localizedStringForKey:v8 value:&stru_26D9391A8 table:0];
          objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, *(void *)(a1 + 32), 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
          id v26 = (id)objc_claimAutoreleasedReturnValue();

          id v10 = (objc_class *)objc_opt_class();
          id v11 = NSStringFromClass(v10);
          [v26 setObject:v11 forKeyedSubscript:*MEMORY[0x263F60228]];

          uint64_t v12 = *MEMORY[0x263F60320];
          id v13 = &unk_26D967120;
          goto LABEL_21;
        default:
          uint64_t v21 = (void *)MEMORY[0x263F5FC40];
          v22 = *(void **)(a1 + 48);
          if (_os_feature_enabled_impl()) {
            v23 = @"LockScreenTimeSettingsButtonName";
          }
          else {
            v23 = @"EnableScreenTimePasscodeButtonName";
          }
          int v24 = [v22 localizedStringForKey:v23 value:&stru_26D9391A8 table:0];
          id v26 = [v21 preferenceSpecifierNamed:v24 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];

          [v26 setButtonAction:sel__removeManagedPasscode];
          id v25 = NSStringFromClass(+[STDevicePINFactory devicePINControllerForPlatform]);
          [v26 setObject:v25 forKeyedSubscript:*MEMORY[0x263F60228]];

          uint64_t v12 = *MEMORY[0x263F60320];
          id v13 = &unk_26D967108;
LABEL_21:
          [v26 setObject:v13 forKeyedSubscript:v12];
          [*(id *)(a1 + 32) showPINSheet:v26 completion:0];

          break;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_103_cold_1();
      }
      id v14 = (void *)MEMORY[0x263F5FC40];
      int v15 = *(void **)(a1 + 48);
      if (_os_feature_enabled_impl()) {
        id v16 = @"LockScreenTimeSettingsButtonName";
      }
      else {
        id v16 = @"EnableScreenTimePasscodeButtonName";
      }
      id v17 = [v15 localizedStringForKey:v16 value:&stru_26D9391A8 table:0];
      id v18 = [v14 preferenceSpecifierNamed:v17 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];

      id v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x263F60228]];

      [v18 setObject:&unk_26D967120 forKeyedSubscript:*MEMORY[0x263F60320]];
      [*(id *)(a1 + 32) showPINSheet:v18 completion:0];
    }
  }
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_167(uint64_t a1)
{
  if (_os_feature_enabled_impl()
    && ([*(id *)(a1 + 32) coordinator],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 viewModel],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 canStopScreenTimeWithoutPasscode],
        v3,
        v2,
        v4))
  {
    int v5 = +[STUILog persistence];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "No blueprints configured. User is allowed to disable passcode without authentication.", buf, 2u);
    }

    [*(id *)(a1 + 32) _removeManagedPasscode];
  }
  else
  {
    int8x16_t v6 = *(void **)(a1 + 40);
    if (_os_feature_enabled_impl()) {
      BOOL v7 = @"LockScreenTimeSettingsButtonName";
    }
    else {
      BOOL v7 = @"EnableScreenTimePasscodeButtonName";
    }
    id v13 = [v6 localizedStringForKey:v7 value:&stru_26D9391A8 table:0];
    id v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v8 setObject:&unk_26D967120 forKeyedSubscript:*MEMORY[0x263F60320]];
    [v8 setObject:*(void *)(a1 + 48) forKeyedSubscript:0x26D940368];
    id v11 = _Block_copy(*(const void **)(a1 + 56));
    [v8 setObject:v11 forKeyedSubscript:0x26D940388];

    uint64_t v12 = _Block_copy(*(const void **)(a1 + 64));
    [v8 setObject:v12 forKeyedSubscript:0x26D93FEE8];

    [*(id *)(a1 + 32) showPINSheet:v8 completion:0];
  }
}

- (void)_setManagedPasscode
{
  uint64_t v3 = +[STScreenTimeSettingsUIBundle bundle];
  if (_os_feature_enabled_impl()) {
    int v4 = @"LockScreenTimeSettingsButtonName";
  }
  else {
    int v4 = @"EnableScreenTimePasscodeButtonName";
  }
  id v8 = [v3 localizedStringForKey:v4 value:&stru_26D9391A8 table:0];

  int v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];
  int8x16_t v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v5 setObject:&unk_26D9670D8 forKeyedSubscript:*MEMORY[0x263F60320]];
  [(STGroupSpecifierProvider *)self showPINSheet:v5 completion:0];
}

- (void)_removeManagedPasscode
{
  id v2 = self;
  uint64_t v3 = [(STRootGroupSpecifierProvider *)v2 coordinator];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke;
  v5[3] = &unk_2647671B0;
  int8x16_t v6 = v2;
  int v4 = v2;
  [v3 setPIN:0 recoveryAltDSID:0 completionHandler:v5];
}

void __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) coordinator];
    [v11 setHasAlreadyEnteredPINForSession:0];
  }
}

- (BOOL)isHidden
{
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STPasscodeGroupSpecifierProvider;
  return [(STGroupSpecifierProvider *)&v4 isHidden];
}

- (PSSpecifier)togglePasscodeSpecifier
{
  return self->_togglePasscodeSpecifier;
}

- (void)setTogglePasscodeSpecifier:(id)a3
{
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  return (PSListController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_togglePasscodeSpecifier, 0);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Authenticated user without altDSID: %@", v0, 0xCu);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138478083;
  uint64_t v3 = a1;
  __int16 v4 = 2113;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "The authenticated altDSID %{private}@ does not match the recovery altDSID %{private}@", (uint8_t *)&v2, 0x16u);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, &_os_log_internal, v0, "Failed to authenticate recovery Apple ID: %{public}@", v1, v2, v3, v4, v5);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_103_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, &_os_log_internal, v0, "LAContext failed to evaluate policy with error: %{public}@", v1, v2, v3, v4, v5);
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Authenticated user without an altDSID: %@", v0, 0xCu);
}

void __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end