@interface PSUIFingerprintController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldSelectResponderOnAppearance;
- (PSUIDeviceTakeOverController)dtoController;
- (id)effectiveSettingsChangedNotificationObserver;
- (id)fingerprintName;
- (id)passcodeController;
- (id)representedBiometricIdentity;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)deleteFingerprint:(id)a3;
- (void)fetchBiometricTemplateForCurrentBiometricIdentity:(id)a3;
- (void)presentAlertIfNeededBeforeDeletingFingerPrint:(id)a3;
- (void)presentAlertSheetForFingerprintBindingToGovernmentID:(id)a3;
- (void)presentPopUpAlertForFingerprintBindingToGovernmentID:(id)a3;
- (void)proceedWithDeleteFingerprintFor:(id)a3;
- (void)replaceFingerprint:(id)a3;
- (void)setDtoController:(id)a3;
- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3;
- (void)setFingerprintName:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSUIFingerprintController

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PSUIFingerprintController;
  [(PSUIFingerprintController *)&v11 viewWillAppear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F536E0];
  v6 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__PSUIFingerprintController_viewWillAppear___block_invoke;
  v10[3] = &unk_264E956F8;
  v10[4] = self;
  v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v10];
  [(PSUIFingerprintController *)self setEffectiveSettingsChangedNotificationObserver:v7];

  v8 = (PSUIDeviceTakeOverController *)objc_opt_new();
  dtoController = self->_dtoController;
  self->_dtoController = v8;
}

void __44__PSUIFingerprintController_viewWillAppear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 topViewController];
  v4 = *(void **)(a1 + 32);

  uint64_t v5 = *(void **)(a1 + 32);
  if (v3 == v4)
  {
    id v7 = [v5 navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:1];
  }
  else
  {
    [v5 reloadSpecifiers];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSUIFingerprintController;
  [(PSUIFingerprintController *)&v6 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = [(PSUIFingerprintController *)self effectiveSettingsChangedNotificationObserver];
  [v4 removeObserver:v5];

  [(PSUIFingerprintController *)self setEffectiveSettingsChangedNotificationObserver:0];
}

- (id)representedBiometricIdentity
{
  v2 = [(PSUIFingerprintController *)self specifier];
  v3 = [v2 propertyForKey:@"FingerprintIdentity"];

  return v3;
}

- (void)presentAlertIfNeededBeforeDeletingFingerPrint:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSUIFingerprintController *)self specifier];
  objc_super v6 = [v5 propertyForKey:@"BIOMETRIC_TEMPLATE_BINDING"];

  id v7 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v4 propertyForKey:@"FingerprintIdentity"];
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "GovernmentID binding status for biometric: %@ is %@", (uint8_t *)&v12, 0x16u);
  }
  if (v6)
  {
    if ([v6 BOOLValue])
    {
      [(PSUIFingerprintController *)self presentAlertSheetForFingerprintBindingToGovernmentID:v4];
    }
    else
    {
      objc_super v11 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "Biometic is not bound to government ID, delete fingerprint directly", (uint8_t *)&v12, 2u);
      }

      [(PSUIFingerprintController *)self deleteFingerprint:v4];
    }
  }
  else
  {
    v9 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 propertyForKey:@"FingerprintIdentity"];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "Have not determined biometric binding identity for biometric: %@", (uint8_t *)&v12, 0xCu);
    }
    [(PSListController *)self configureSpin:1 ofCellForSpecifier:v4 setEnabled:0];
    [(PSUIFingerprintController *)self fetchBiometricTemplateForCurrentBiometricIdentity:v4];
  }
}

- (void)fetchBiometricTemplateForCurrentBiometricIdentity:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x263F35CD0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke;
  v7[3] = &unk_264E95748;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v8 = v6;
  v9 = self;
  [v5 globalAuthACLTemplateUUIDsWithCompletion:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2;
  block[3] = &unk_264E95720;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = PSUILogForCategory(1uLL);
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1((uint64_t *)(a1 + 32), v7);
      }

      [v4 fetchBiometricTemplateForCurrentBiometricIdentity:*(void *)(a1 + 40)];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Fetched biometric template UUIDs: %@", buf, 0xCu);
      }

      if ([*(id *)(a1 + 48) count] && *(void *)(a1 + 48))
      {
        v9 = [*(id *)(a1 + 56) representedBiometricIdentity];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = *(id *)(a1 + 48);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              v15 = objc_msgSend(v9, "uuid", (void)v20);
              int v16 = [v14 isEqual:v15];

              if (v16)
              {
                v17 = PSUILogForCategory(1uLL);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v25 = v14;
                  __int16 v26 = 2112;
                  v27 = v9;
                  _os_log_impl(&dword_23D33A000, v17, OS_LOG_TYPE_DEFAULT, "UUID: %@ matched with biometric identity: %@", buf, 0x16u);
                }

                uint64_t v11 = 1;
                goto LABEL_23;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_23:

        v18 = [v4 specifier];
        v19 = [NSNumber numberWithBool:v11];
        [v18 setProperty:v19 forKey:@"BIOMETRIC_TEMPLATE_BINDING"];
      }
      else
      {
        v9 = [v4 specifier];
        [v9 setProperty:MEMORY[0x263EFFA80] forKey:@"BIOMETRIC_TEMPLATE_BINDING"];
      }

      [v4 configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 40) setEnabled:1];
      [v4 presentAlertIfNeededBeforeDeletingFingerPrint:*(void *)(a1 + 40)];
    }
  }
}

- (void)presentAlertSheetForFingerprintBindingToGovernmentID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Presenting first alert for government binding biometrics", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = PSLocalizableMesaStringForKey();
  id v8 = PSLocalizableMesaStringForKey();
  v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:0];

  id v10 = +[PSUIBiometrics identities];
  unint64_t v11 = [v10 count];

  if (v11 >= 2)
  {
    uint64_t v12 = (void *)MEMORY[0x263F82400];
    uint64_t v13 = PSLocalizableMesaStringForKey();
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke;
    v28[3] = &unk_264E954F8;
    v28[4] = self;
    id v29 = v4;
    id v14 = [v12 actionWithTitle:v13 style:0 handler:v28];
    [v9 addAction:v14];
  }
  v15 = (void *)MEMORY[0x263F82400];
  int v16 = PSLocalizableMesaStringForKey();
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke_273;
  v25 = &unk_264E954F8;
  __int16 v26 = self;
  id v27 = v4;
  id v17 = v4;
  v18 = [v15 actionWithTitle:v16 style:2 handler:&v22];
  objc_msgSend(v9, "addAction:", v18, v22, v23, v24, v25, v26);

  v19 = (void *)MEMORY[0x263F82400];
  long long v20 = PSLocalizableMesaStringForKey();
  long long v21 = [v19 actionWithTitle:v20 style:1 handler:0];
  [v9 addAction:v21];

  [(PSUIFingerprintController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke(uint64_t a1)
{
  v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Proceed replacing biobinding identity", v4, 2u);
  }

  return [*(id *)(a1 + 32) replaceFingerprint:*(void *)(a1 + 40)];
}

uint64_t __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke_273(uint64_t a1)
{
  v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Continue presenting second alert for deleting biometric identity", v4, 2u);
  }

  return [*(id *)(a1 + 32) presentPopUpAlertForFingerprintBindingToGovernmentID:*(void *)(a1 + 40)];
}

- (void)presentPopUpAlertForFingerprintBindingToGovernmentID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Presenting second alert for government binding biometrics", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = PSLocalizableMesaStringForKey();
  id v8 = PSLocalizableMesaStringForKey();
  v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x263F82400];
  unint64_t v11 = PSLocalizableMesaStringForKey();
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v9 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  id v14 = PSLocalizableMesaStringForKey();
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __82__PSUIFingerprintController_presentPopUpAlertForFingerprintBindingToGovernmentID___block_invoke;
  long long v20 = &unk_264E954F8;
  long long v21 = self;
  id v22 = v4;
  id v15 = v4;
  int v16 = [v13 actionWithTitle:v14 style:2 handler:&v17];
  objc_msgSend(v9, "addAction:", v16, v17, v18, v19, v20, v21);

  [(PSUIFingerprintController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __82__PSUIFingerprintController_presentPopUpAlertForFingerprintBindingToGovernmentID___block_invoke(uint64_t a1)
{
  v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Proceed to delete government binding fingerprint", v5, 2u);
  }

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"PSBiometricBindingDeleted" object:0];

  return [*(id *)(a1 + 32) deleteFingerprint:*(void *)(a1 + 40)];
}

- (void)replaceFingerprint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Showing biometric replacement UI", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = objc_alloc_init(MEMORY[0x263F36648]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke;
  v9[3] = &unk_264E95798;
  objc_copyWeak(&v10, buf);
  v9[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_290;
  v7[3] = &unk_264E957E8;
  objc_copyWeak(&v8, buf);
  void v7[4] = self;
  [v6 beginBiometricReplacementWithAuthenticationHandler:v9 andCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(buf);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2;
  block[3] = &unk_264E95770;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:WeakRetained action:sel_cancelModalFlow];
    uint64_t v4 = [a1[4] navigationItem];
    [v4 setLeftBarButtonItem:v3];

    [a1[4] setModalPresentationStyle:2];
    [MEMORY[0x263F5B890] preferredContentSize];
    objc_msgSend(a1[4], "setPreferredContentSize:");
    [a1[5] presentViewController:a1[4] animated:1 completion:&__block_literal_global_0];
  }
  else
  {
    id v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Did not show biometric replacement UI", v6, 2u);
    }
  }
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_288()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_DEFAULT, "Has shown biometric replacement UI in modal sheet", v1, 2u);
  }
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_291;
  v10[3] = &unk_264E957C0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v14);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_291(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_291_cold_1((uint64_t *)(a1 + 32), v3);
    }
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) representedBiometricIdentity];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v3 uuid];
          LOBYTE(v10) = [v11 isEqual:v10];

          v7 |= v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v6);
    }
    else
    {
      char v7 = 0;
    }

    uint64_t v12 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v13;
      __int16 v23 = 1024;
      int v24 = v7 & 1;
      _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Replaced biometric identity with new UUIDs: %@, current identity binding status: %d", buf, 0x12u);
    }

    id v14 = [WeakRetained specifier];
    id v15 = [NSNumber numberWithBool:v7 & 1];
    [v14 setProperty:v15 forKey:@"BIOMETRIC_TEMPLATE_BINDING"];

    int v16 = [*(id *)(a1 + 40) parentController];
    [v16 updateWithReplacedUUIDs:*(void *)(a1 + 48)];
  }
}

- (void)deleteFingerprint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Touch ID: User pressed Delete Fingerprint", (uint8_t *)buf, 2u);
  }

  uint64_t v6 = [(PSUIFingerprintController *)self dtoController];
  int v7 = [v6 isRatchetEnabled];

  if (v7)
  {
    objc_initWeak(buf, self);
    uint64_t v8 = [(PSUIFingerprintController *)self dtoController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__PSUIFingerprintController_deleteFingerprint___block_invoke;
    v9[3] = &unk_264E95520;
    objc_copyWeak(&v11, buf);
    id v10 = v4;
    [v8 gateWithRatchetForOperation:4 forPresentingVC:self completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PSUIFingerprintController *)self proceedWithDeleteFingerprintFor:v4];
  }
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47__PSUIFingerprintController_deleteFingerprint___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__PSUIFingerprintController_deleteFingerprint___block_invoke_292;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_292(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Touch ID: Starting deletion of fingerprint", v5, 2u);
    }

    [WeakRetained proceedWithDeleteFingerprintFor:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__PSUIFingerprintController_deleteFingerprint___block_invoke_292_cold_1();
    }
  }
}

- (void)proceedWithDeleteFingerprintFor:(id)a3
{
  id v4 = [(PSUIFingerprintController *)self parentController];
  id v5 = +[PSUIBiometrics sharedInstance];
  id v6 = [(PSUIFingerprintController *)self representedBiometricIdentity];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__PSUIFingerprintController_proceedWithDeleteFingerprintFor___block_invoke;
  v10[3] = &unk_264E95810;
  id v11 = v4;
  id v7 = v4;
  [v5 removeIdentity:v6 completion:v10];

  uint64_t v8 = [(PSUIFingerprintController *)self navigationController];
  id v9 = (id)[v8 popViewControllerAnimated:1];
}

uint64_t __61__PSUIFingerprintController_proceedWithDeleteFingerprintFor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)fingerprintName
{
  v2 = [(PSUIFingerprintController *)self representedBiometricIdentity];
  id v3 = [v2 name];
  id v4 = v3;
  if (!v3) {
    id v3 = &stru_26F10E0E8;
  }
  id v5 = v3;

  return v5;
}

- (void)setFingerprintName:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = +[PSUIBiometrics sharedInstance];
    id v5 = [(PSUIFingerprintController *)self representedBiometricIdentity];
    [v4 setName:v6 forIdentity:v5 completion:&__block_literal_global_294];
  }
}

void __48__PSUIFingerprintController_setFingerprintName___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_296);
  }
}

void __48__PSUIFingerprintController_setFingerprintName___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PSEnrollmentNameChanged" object:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    [(PSUIFingerprintController *)self setTitle:0];
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v6];

    id v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setFingerprintName_ get:sel_fingerprintName detail:0 cell:8 edit:0];
    [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A0]];
    uint64_t v8 = [MEMORY[0x263F53C50] sharedConnection];
    char v9 = [v8 isFingerprintModificationAllowed];

    if ((v9 & 1) == 0) {
      [v7 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
    [v5 addObject:v7];
    id v10 = [MEMORY[0x263F53C50] sharedConnection];
    int v11 = [v10 isFingerprintModificationAllowed];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v5 addObject:v12];

      uint64_t v13 = (void *)MEMORY[0x263F5FC40];
      id v14 = PSLocalizableMesaStringForKey();
      id v15 = [v13 deleteButtonSpecifierWithName:v14 target:self action:sel_presentAlertIfNeededBeforeDeletingFingerPrint_];

      [v15 setIdentifier:@"DELETE_FINGERPRINT"];
      [v5 addObject:v15];
    }
    int v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
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
  v9.receiver = self;
  v9.super_class = (Class)PSUIFingerprintController;
  id v5 = [(PSUIFingerprintController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    id v6 = [v5 editableTextField];
    [v6 setAutocapitalizationType:2];
    [v6 setAutocorrectionType:1];
    [v6 setAutoresizesTextToFit:1];
    [v6 setReturnKeyType:9];
    [v6 setClearButtonMode:1];
    id v7 = [(PSUIFingerprintController *)self fingerprintName];
    [v6 setPlaceholder:v7];

    [v5 setControllerDelegate:self];
  }
  return v5;
}

- (id)passcodeController
{
  v2 = objc_alloc_init(PSTouchIDPINController);
  return v2;
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, 0);
}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Failed fetching biometric template UUIDs with error: %@", (uint8_t *)&v3, 0xCu);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_291_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Error replacing biometric identity: %@", (uint8_t *)&v3, 0xCu);
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Touch ID: Not deleting fingerprint as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_292_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Touch ID: Not deleting fingerprint as we are missing instance (self)", v2, v3, v4, v5, v6);
}

@end