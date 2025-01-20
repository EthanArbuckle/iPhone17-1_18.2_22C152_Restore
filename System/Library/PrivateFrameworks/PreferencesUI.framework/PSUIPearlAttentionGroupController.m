@interface PSUIPearlAttentionGroupController
- (BKDevicePearl)pearlDevice;
- (BKUserProtectedConfiguration)updatedConfiguration;
- (BOOL)isPeriocularEnabled;
- (BOOL)useAlternateFooterTextForAttention;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSUIPearlAttentionGroupController)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)_pearlDevice;
- (id)attentionAware:(id)a3;
- (id)pearlUnlock:(id)a3;
- (id)specifiers;
- (void)_pearlDevice;
- (void)didCancelEnteringPIN;
- (void)setAttentionAware:(id)a3 specifier:(id)a4;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)setPearlDevice:(id)a3;
- (void)setPearlUnlock:(id)a3 specifier:(id)a4;
- (void)setProtectedCredentialsWithPasscode:(id)a3;
- (void)setUpdatedConfiguration:(id)a3;
@end

@implementation PSUIPearlAttentionGroupController

- (PSUIPearlAttentionGroupController)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIPearlAttentionGroupController;
  v8 = [(PSUIPearlAttentionGroupController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
  }

  return v9;
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = PSLocalizablePearlStringForKey();
  id v6 = [v4 groupSpecifierWithName:v5];

  if ([(PSUIPearlAttentionGroupController *)self useAlternateFooterTextForAttention])
  {
    PSUI_LocalizedStringForPearlPeriocular(@"PEARL_ATTENTION_FOOTER_WITH_PERIOCULAR");
  }
  else
  {
    PSLocalizablePearlStringForKey();
  id v7 = };
  uint64_t v8 = *MEMORY[0x263F600F8];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

  v27 = v6;
  [v3 addObject:v6];
  v9 = (void *)MEMORY[0x263F5FC40];
  v10 = PSLocalizablePearlStringForKey();
  objc_super v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel_setPearlUnlock_specifier_ get:sel_pearlUnlock_ detail:0 cell:6 edit:0];

  uint64_t v12 = *MEMORY[0x263F60170];
  [v11 setProperty:@"PearlUnlockAttention" forKey:*MEMORY[0x263F60170]];
  uint64_t v13 = *MEMORY[0x263F60138];
  [v11 setProperty:@"PearlUnlockAttention" forKey:*MEMORY[0x263F60138]];
  uint64_t v14 = *MEMORY[0x263F5FEF8];
  [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v3 addObject:v11];
  v15 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v16 = PSLocalizablePearlStringForKey();
  [v15 setProperty:v16 forKey:v8];

  [v3 addObject:v15];
  v17 = (void *)MEMORY[0x263F5FC40];
  v18 = PSLocalizablePearlStringForKey();
  v19 = [v17 preferenceSpecifierNamed:v18 target:self set:sel_setAttentionAware_specifier_ get:sel_attentionAware_ detail:0 cell:6 edit:0];

  [v19 setProperty:@"AttentionAware" forKey:v12];
  [v19 setProperty:@"AttentionAware" forKey:v13];
  [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v14];
  v20 = [(PSUIPearlAttentionGroupController *)self attentionAware:0];

  uint64_t v21 = *MEMORY[0x263F600A8];
  if (v20)
  {
    [v19 setProperty:MEMORY[0x263EFFA80] forKey:v21];
    v22 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23D33A000, v22, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [Disabled]", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v23 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__PSUIPearlAttentionGroupController_specifiers__block_invoke;
    block[3] = &unk_264E95380;
    objc_copyWeak(&v30, buf);
    id v29 = v19;
    dispatch_async(v23, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
  else
  {
    [v19 setProperty:MEMORY[0x263EFFA88] forKey:v21];
    v24 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23D33A000, v24, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [Enabled]", (uint8_t *)buf, 2u);
    }
  }
  [v3 addObject:v19];
  v25 = (void *)[v3 copy];

  return v25;
}

void __47__PSUIPearlAttentionGroupController_specifiers__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getEREyeReliefClientClass_softClass;
  uint64_t v19 = getEREyeReliefClientClass_softClass;
  if (!getEREyeReliefClientClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getEREyeReliefClientClass_block_invoke;
    uint64_t v21 = &unk_264E95420;
    v22 = &v16;
    __getEREyeReliefClientClass_block_invoke((uint64_t)buf);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  v4 = objc_opt_new();
  id v15 = 0;
  uint64_t v5 = [v4 isDistanceSamplingEnabledWithError:&v15];
  id v6 = (__CFString *)v15;
  id v7 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithBool:v5];
    v9 = (void *)v8;
    v10 = &stru_26F10E0E8;
    if (v6) {
      v10 = v6;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Screen Distance Enablement [%@]%@", buf, 0x16u);
  }
  if ((v5 & 1) == 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__PSUIPearlAttentionGroupController_specifiers__block_invoke_35;
    v11[3] = &unk_264E95358;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v12 = *(id *)(a1 + 32);
    char v14 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v11);

    objc_destroyWeak(&v13);
  }
}

void __47__PSUIPearlAttentionGroupController_specifiers__block_invoke_35(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    v4 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
    [v3 setProperty:v4 forKey:*MEMORY[0x263F600A8]];

    uint64_t v5 = [WeakRetained listController];
    [v5 reloadSpecifier:*(void *)(a1 + 32) animated:1];

    id v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v7 = @"disabled";
      }
      else {
        id v7 = @"enabled";
      }
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [%@]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_pearlDevice
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  pearlDevice = self->_pearlDevice;
  p_pearlDevice = &self->_pearlDevice;
  id v3 = pearlDevice;
  if (pearlDevice)
  {
    uint64_t v5 = v3;
  }
  else
  {
    location = (id *)p_pearlDevice;
    [MEMORY[0x263F2AA30] availableDevices];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
          id v29 = 0;
          id v12 = [MEMORY[0x263F2AA18] deviceWithDescriptor:v11 error:&v29];
          id v13 = v29;
          if (v13)
          {
            char v14 = PSUILogForCategory(1uLL);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v35 = v13;
              _os_log_error_impl(&dword_23D33A000, v14, OS_LOG_TYPE_ERROR, "Could not get device: %@", buf, 0xCu);
            }
          }
          id v15 = [v12 descriptor];
          if ([v15 type] == 2)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              objc_storeStrong(location, v12);
              v24 = PSUILogForCategory(1uLL);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = *location;
                *(_DWORD *)buf = 138412290;
                id v35 = v26;
                _os_log_impl(&dword_23D33A000, v24, OS_LOG_TYPE_DEFAULT, "Got device: %@", buf, 0xCu);
              }

              uint64_t v5 = (BKDevicePearl *)*location;
              v17 = v6;
              goto LABEL_24;
            }
          }
          else
          {
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v17 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(PSUIPearlAttentionGroupController *)(uint64_t)v6 _pearlDevice];
    }
    uint64_t v5 = 0;
LABEL_24:
  }
  return v5;
}

- (void)setProtectedCredentialsWithPasscode:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(BKUserProtectedConfiguration *)self->_updatedConfiguration attentionDetectionEnabled];
    uint64_t v7 = (void *)v6;
    uint64_t v8 = @"Has";
    if (!v4) {
      uint64_t v8 = @"No";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Updating Require Attention Needed to %@ [%@ passcode]", buf, 0x16u);
  }
  id v9 = v4;
  if (v9)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v32 = __Block_byref_object_copy_;
    long long v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    uint64_t v30 = 0;
    int v10 = ACMContextCreate();
    if (v10)
    {
      uint64_t v11 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PSUIPearlAttentionGroupController setProtectedCredentialsWithPasscode:](v10, v11);
      }
      id v12 = 0;
    }
    else
    {
      v27[1] = (id)MEMORY[0x263EF8330];
      v27[2] = (id)3221225472;
      v27[3] = __credentialSetWithPasscodeCredential_block_invoke;
      v27[4] = &unk_264E95480;
      id v29 = buf;
      v28 = v9;
      ACMContextGetExternalForm();
      id v12 = *(id *)(*(void *)&buf[8] + 40);
      uint64_t v11 = v28;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = 0;
  }

  id v13 = [(PSUIPearlAttentionGroupController *)self _pearlDevice];
  updatedConfiguration = self->_updatedConfiguration;
  v27[0] = 0;
  [v13 setProtectedConfiguration:updatedConfiguration forUser:getuid() credentialSet:v12 error:v27];
  id v15 = v27[0];

  uint64_t v16 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_updatedConfiguration;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_23D33A000, v16, OS_LOG_TYPE_DEFAULT, "Will set config: %@", buf, 0xCu);
  }

  if (v15)
  {
    uint64_t v18 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlAttentionGroupController setProtectedCredentialsWithPasscode:]((uint64_t)v15, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  id v25 = objc_loadWeakRetained((id *)&self->_listController);
  id v26 = [v25 specifierForID:@"PearlUnlockAttention"];
  [v25 reloadSpecifier:v26];
}

- (void)didCancelEnteringPIN
{
  id v3 = objc_loadWeakRetained((id *)&self->_listController);
  v2 = [v3 specifierForID:@"PearlUnlockAttention"];
  [v3 reloadSpecifier:v2];
}

- (void)setAttentionAware:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  MEMORY[0x270F909D8](v4);
}

- (id)attentionAware:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = _AXSAttentionAwarenessFeaturesEnabled();
  return (id)[v3 numberWithUnsignedChar:v4];
}

- (void)setPearlUnlock:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke;
  aBlock[3] = &unk_264E953A8;
  aBlock[4] = self;
  id v6 = v5;
  id v32 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if (([v6 BOOLValue] & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v8 = +[PSUIBiometrics sharedInstance];
      if ([v8 isPeriocularEnrollmentSupported])
      {
        BOOL v9 = [(PSUIPearlAttentionGroupController *)self isPeriocularEnabled];

        if (v9)
        {
          uint64_t v10 = PSUI_LocalizedStringForPasscodePeriocular(@"PEARL_PERIOCULAR_UNLOCK_ALERT_BODY");
LABEL_9:
          uint64_t v11 = (void *)v10;
          id v12 = (void *)MEMORY[0x263F82418];
          id v13 = PSLocalizablePearlStringForKey();
          char v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

          id v15 = (void *)MEMORY[0x263F82400];
          uint64_t v16 = PSLocalizablePearlStringForKey();
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_2;
          v30[3] = &unk_264E953D0;
          v30[4] = self;
          v17 = [v15 actionWithTitle:v16 style:1 handler:v30];

          [v14 addAction:v17];
          uint64_t v18 = (void *)MEMORY[0x263F82400];
          uint64_t v19 = PSLocalizablePearlStringForKey();
          uint64_t v25 = MEMORY[0x263EF8330];
          uint64_t v26 = 3221225472;
          v27 = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_3;
          v28 = &unk_264E953F8;
          id v29 = v7;
          uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:&v25];

          objc_msgSend(v14, "addAction:", v20, v25, v26, v27, v28);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
          uint64_t v22 = [WeakRetained view];
          uint64_t v23 = [v22 window];
          uint64_t v24 = [v23 rootViewController];
          [v24 presentViewController:v14 animated:1 completion:0];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v10 = PSLocalizablePearlStringForKey();
    goto LABEL_9;
  }
  v7[2](v7);
LABEL_10:
}

void __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F2AA58]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  [*(id *)(*(void *)(a1 + 32) + 32) setAttentionDetectionEnabled:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  id v8 = [v5 listController];
  id v6 = [v8 specifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F60270]];
  [v5 setProtectedCredentialsWithPasscode:v7];
}

void __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [v2 specifierForID:@"PearlUnlockAttention"];
  [WeakRetained reloadSpecifier:v3];
}

uint64_t __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)pearlUnlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUIPearlAttentionGroupController *)self _pearlDevice];
  id v17 = 0;
  uint64_t v4 = [v3 protectedConfigurationForUser:getuid() error:&v17];
  id v5 = v17;

  if (v5)
  {
    id v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlAttentionGroupController pearlUnlock:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  id v13 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [v4 attentionDetectionEnabled];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_impl(&dword_23D33A000, v13, OS_LOG_TYPE_DEFAULT, "Could attention detect: %@ %@", buf, 0x16u);
  }
  id v15 = [v4 attentionDetectionEnabled];

  return v15;
}

- (BOOL)useAlternateFooterTextForAttention
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    uint64_t v3 = +[PSUIBiometrics sharedInstance];
    char v4 = [v3 isPeriocularEnrollmentSupported];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isPeriocularEnabled
{
  int v2 = +[PSUIBiometrics sharedInstance];
  uint64_t v3 = [v2 deviceForType:2];

  uint64_t v10 = 0;
  char v4 = [v3 protectedConfigurationForUser:getuid() error:&v10];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v10 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = [v4 periocularFaceIDMatchEnabled];
    char v7 = [v8 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (void)setPearlDevice:(id)a3
{
}

- (BKUserProtectedConfiguration)updatedConfiguration
{
  return self->_updatedConfiguration;
}

- (void)setUpdatedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedConfiguration, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

- (void)_pearlDevice
{
}

- (void)setProtectedCredentialsWithPasscode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProtectedCredentialsWithPasscode:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Could not create auth context: %d", (uint8_t *)v2, 8u);
}

- (void)pearlUnlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end