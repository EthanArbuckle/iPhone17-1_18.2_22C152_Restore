@interface PSUIBiometricController
+ (BOOL)shouldPresentInModalSheet;
- (BOOL)currentlyEnablingTouchIDForPurchases;
- (BOOL)isBiometricEditingAllowed;
- (BOOL)isEnrollmentAvailable;
- (BOOL)isObservingBiometricTemplateFetchingStatus;
- (BOOL)isPasscodeSet;
- (BOOL)isSafariAutofillRestricted;
- (BOOL)isTouchIDForPurchasesRestricted;
- (BOOL)isTouchIDForStockholmRestricted;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager;
- (NSArray)storedBiometricTemplates;
- (PSEnrollContainerViewController)enrollContainerController;
- (PSUIBiometricController)init;
- (PSUIDeviceTakeOverController)dtoController;
- (id)_passcodeControllerForSpecifier:(id)a3;
- (id)authorizationToken;
- (id)biometricLogo;
- (id)biometricNameDescription;
- (id)biometricTableViewHeader;
- (id)headerForUseBiometricSection;
- (id)isTouchIDForPurchasesEnabled:(id)a3;
- (id)isTouchIDForStockholmEnabled:(id)a3;
- (id)isTouchIDUnlockEnabled:(id)a3;
- (id)modalFlowCancelCompletion;
- (id)modalFlowSuccessCompletion;
- (id)passcodeController;
- (id)placardSpecifier;
- (id)safariAutoFillEnabled:(id)a3;
- (id)useBiometricForSpecifiers;
- (int64_t)storeState;
- (unint64_t)currentBiometricTemplateFetchStatus;
- (void)_popEnrollmentControllerWithCompletion:(id)a3;
- (void)addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:(id)a3;
- (void)authorizationToken;
- (void)cancelModalFlowWithCompletion:(id)a3;
- (void)completeModalFlow;
- (void)deleteGlobalAuthACL;
- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4;
- (void)didCancelEnteringPIN;
- (void)didUnlock;
- (void)enrollBiometric;
- (void)enrollmentCompletedForIdentity:(id)a3;
- (void)fetchBiometricTemplateUUIDsWithCompletion:(id)a3;
- (void)hideCancelButton;
- (void)presentConfirmationAndProceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4;
- (void)presentPasscodePaneFromSpecifier:(id)a3;
- (void)presentSheetForContentViewController:(id)a3;
- (void)presentSheetForContentViewController:(id)a3 completion:(id)a4;
- (void)proceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4;
- (void)pushPasscodePane;
- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4;
- (void)setCurrentlyEnablingTouchIDForPurchases:(BOOL)a3;
- (void)setDtoController:(id)a3;
- (void)setEnrollContainerController:(id)a3;
- (void)setIsObservingBiometricTemplateFetchingStatus:(BOOL)a3;
- (void)setModalFlowCancelCompletion:(id)a3;
- (void)setModalFlowSuccessCompletion:(id)a3;
- (void)setSafariAutoFillEnabled:(id)a3 specifier:(id)a4;
- (void)setStoreState:(int64_t)a3;
- (void)setStoredBiometricTemplates:(id)a3;
- (void)setTouchIDForPurchasesEnabled:(id)a3 specifier:(id)a4;
- (void)setTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4;
- (void)set_biometricBindingFlowManager:(id)a3;
- (void)setupBiometricLogoHeader;
- (void)updateStoreBiometricsState;
- (void)updateTouchIDForPurchasesSpecifier;
- (void)updateTouchIDForStockholmSpecifier;
- (void)updateTouchIDUnlockSpecifier;
- (void)updateWithReplacedUUIDs:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSUIBiometricController

- (PSUIBiometricController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSUIBiometricController;
  v2 = [(PSUIPasscodeLockController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    storedBiometricTemplates = v2->_storedBiometricTemplates;
    v2->_storedBiometricTemplates = 0;

    v3->_currentBiometricTemplateFetchStatus = 0;
    [(PSUIBiometricController *)v3 fetchBiometricTemplateUUIDsWithCompletion:0];
    uint64_t v5 = objc_opt_new();
    dtoController = v3->_dtoController;
    v3->_dtoController = (PSUIDeviceTakeOverController *)v5;
  }
  return v3;
}

- (void)fetchBiometricTemplateUUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unint64_t currentBiometricTemplateFetchStatus = self->_currentBiometricTemplateFetchStatus;
  if (currentBiometricTemplateFetchStatus != 1)
  {
    if (currentBiometricTemplateFetchStatus == 4)
    {
      if (v4) {
        (*((void (**)(id))v4 + 2))(v4);
      }
    }
    else
    {
      self->_unint64_t currentBiometricTemplateFetchStatus = 1;
      objc_initWeak(&location, self);
      id v7 = objc_alloc_init(MEMORY[0x263F35CD0]);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke;
      v8[3] = &unk_264E95868;
      objc_copyWeak(&v10, &location);
      id v9 = v5;
      [v7 globalAuthACLTemplateUUIDsWithCompletion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2;
  v9[3] = &unk_264E95308;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    if (*(void *)(a1 + 32))
    {
      id v5 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1((uint64_t *)(a1 + 32), v5);
      }
    }
    [v4 setStoredBiometricTemplates:*(void *)(a1 + 40)];
    id v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Fetched biometric template UUIDs: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = 2;
    if (*(void *)(a1 + 32)) {
      uint64_t v8 = 3;
    }
    v4[189] = v8;
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager
{
  biometricBindingFlowManager = self->__biometricBindingFlowManager;
  if (!biometricBindingFlowManager)
  {
    id v4 = (CIDVUIBiometricBindingFlowManager *)objc_alloc_init(MEMORY[0x263F36640]);
    id v5 = self->__biometricBindingFlowManager;
    self->__biometricBindingFlowManager = v4;

    biometricBindingFlowManager = self->__biometricBindingFlowManager;
  }
  return biometricBindingFlowManager;
}

- (void)deleteGlobalAuthACL
{
  objc_initWeak(&location, self);
  v3 = dispatch_get_global_queue(0, 0);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke;
  uint64_t v7 = &unk_264E954A8;
  objc_copyWeak(&v8, &location);
  dispatch_async(v3, &v4);

  self->_unint64_t currentBiometricTemplateFetchStatus = 4;
  -[PSUIBiometricController setStoredBiometricTemplates:](self, "setStoredBiometricTemplates:", 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _biometricBindingFlowManager];
  [v1 deleteBoundACLWithCompletion:&__block_literal_global_1];
}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)updateWithReplacedUUIDs:(id)a3
{
  self->_unint64_t currentBiometricTemplateFetchStatus = 2;
}

- (void)didUnlock
{
  v3 = +[PSUIPasscode sharedInstance];
  int v4 = [v3 isPasscodeSet];

  if (v4)
  {
    [(PSUIBiometricController *)self popRecursivelyToRootController];
    id v5 = [(PSUIBiometricController *)self navigationController];
    [v5 setViewControllers:MEMORY[0x263EFFA68]];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSUIBiometricController;
  [(PSUIBiometricController *)&v6 viewWillAppear:a3];
  int v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6) {
    [(PSUIBiometricController *)self setupBiometricLogoHeader];
  }
}

- (BOOL)isPasscodeSet
{
  id v2 = +[PSUIPasscode sharedInstance];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:(id)a3
{
  uint64_t v9 = (void (**)(void))a3;
  -[PSUIBiometricController setModalFlowSuccessCompletion:](self, "setModalFlowSuccessCompletion:");
  int v4 = +[PSUIBiometrics identities];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_super v6 = +[PSUIPasscode sharedInstance];
    char v7 = [v6 isPasscodeSet];

    if (v7)
    {
      v9[2]();
    }
    else
    {
      id v8 = [(PSUIBiometricController *)self specifierForID:@"PASSCODE_OFF"];
      [(PSUIBiometricController *)self presentPasscodePaneFromSpecifier:v8];
    }
  }
  else
  {
    [(PSUIBiometricController *)self enrollBiometric];
  }
}

- (id)isTouchIDUnlockEnabled:(id)a3
{
  char v3 = NSNumber;
  int v4 = +[PSUIPasscodeAndBiometrics sharedInstance];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isUnlockEnabled"));

  return v5;
}

- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(PSUIBiometricController *)self presentingViewController];

  if (!v6)
  {
    char v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [v7 addObject:self];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke;
    id v13 = &unk_264E953A8;
    id v14 = v7;
    id v15 = v5;
    id v8 = v7;
    uint64_t v9 = _Block_copy(&v10);
    -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v9, v10, v11, v12, v13);
  }
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) anyObject];
  char v3 = [v2 specifier];

  if (!v3)
  {
    int v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_2();
    }
  }
  id v5 = [*(id *)(a1 + 32) anyObject];
  objc_super v6 = [v5 specifier];
  char v7 = [v6 propertyForKey:*MEMORY[0x263F60270]];

  if (!v7)
  {
    id v8 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_1();
    }
  }
  uint64_t v9 = [MEMORY[0x263F53C50] sharedConnection];
  objc_msgSend(v9, "setFingerprintUnlockAllowed:passcode:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), v7, 0);

  if ([*(id *)(a1 + 40) BOOLValue])
  {
    uint64_t v10 = [MEMORY[0x263F53C50] sharedConnection];
    [v10 setValue:&unk_26F113250 forSetting:*MEMORY[0x263F539E0]];
  }
  uint64_t v11 = [*(id *)(a1 + 32) anyObject];
  [v11 updateGracePeriodSpecifier];
}

- (void)updateTouchIDUnlockSpecifier
{
  id v6 = [(PSUIBiometricController *)self specifierForID:@"TOUCHID_UNLOCK"];
  char v3 = NSNumber;
  int v4 = +[PSUIBiometrics sharedInstance];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "isTouchIDUnlockRestricted") ^ 1);
  [v6 setProperty:v5 forKey:*MEMORY[0x263F600A8]];

  [(PSUIBiometricController *)self reloadSpecifier:v6 animated:1];
}

- (void)setStoreState:(int64_t)a3
{
  if (self->_storeState != a3)
  {
    self->_storeState = a3;
    [(PSUIBiometricController *)self reloadSpecifierID:@"TOUCHID_PURCHASES"];
  }
}

- (void)updateStoreBiometricsState
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B138]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke;
  v4[3] = &unk_264E958B0;
  v4[4] = self;
  [v3 getStateWithCompletionBlock:v4];
}

void __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke_2;
  v2[3] = &unk_264E956A8;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStoreState:*(void *)(a1 + 40)];
}

- (id)authorizationToken
{
  id v3 = [(PSUIBiometricController *)self specifier];

  if (!v3)
  {
    int v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometricController authorizationToken]();
    }
  }
  id v5 = [(PSUIBiometricController *)self specifier];
  id v6 = [v5 propertyForKey:*MEMORY[0x263F60270]];

  if (!v6)
  {
    char v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometricController authorizationToken]();
    }
  }
  id v8 = PSAuthorizationTokenForPasscode();

  return v8;
}

- (id)isTouchIDForPurchasesEnabled:(id)a3
{
  if ([(PSUIBiometricController *)self currentlyEnablingTouchIDForPurchases])
  {
    int v4 = (void *)MEMORY[0x263EFFA88];
  }
  else
  {
    if ([(PSUIBiometricController *)self storeState] == 1)
    {
      id v5 = +[PSUIPasscode sharedInstance];
      if ([v5 isPasscodeSet])
      {
        id v6 = +[PSUIBiometrics identities];
        BOOL v7 = [v6 count] != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    int v4 = [NSNumber numberWithBool:v7];
  }
  return v4;
}

- (void)setTouchIDForPurchasesEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PSUIBiometricController *)self setCurrentlyEnablingTouchIDForPurchases:1];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke;
  id v14 = &unk_264E95770;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = _Block_copy(&v11);
  -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_2;
  v5[3] = &unk_264E95900;
  v5[4] = WeakRetained;
  id v6 = a1[4];
  objc_copyWeak(&v8, v2);
  id v7 = a1[5];
  dispatch_async(v4, v5);

  objc_destroyWeak(&v8);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_2(id *a1)
{
  id v2 = [a1[4] authorizationToken];
  uint64_t v3 = [a1[5] BOOLValue];
  id v4 = objc_alloc_init(MEMORY[0x263F7B138]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_3;
  v5[3] = &unk_264E958D8;
  objc_copyWeak(&v7, a1 + 7);
  id v6 = a1[6];
  [v4 setEnabled:v3 withAuthToken:v2 completionBlock:v5];

  objc_destroyWeak(&v7);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_4;
  block[3] = &unk_264E95358;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Failed to set Touch ID for purchases", v6, 2u);
    }
  }
  [WeakRetained setCurrentlyEnablingTouchIDForPurchases:0];
  [WeakRetained updateStoreBiometricsState];
  [WeakRetained reloadSpecifierID:@"TOUCHID_PURCHASES" animated:1];
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "isTouchIDForPurchasesRestricted") ^ 1);
  [v4 setProperty:v5 forKey:*MEMORY[0x263F600A8]];
}

- (BOOL)isTouchIDForPurchasesRestricted
{
  uint64_t v3 = [MEMORY[0x263F53C50] sharedConnection];
  int v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53710]];

  if ([(PSUIBiometricController *)self storeState] == 4) {
    return 1;
  }
  id v6 = +[PSUIBiometrics sharedInstance];
  char v7 = [v6 shouldRestrictFeaturesRequiringEnrollment];
  if (v4 == 1) {
    BOOL v5 = v7;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)updateTouchIDForPurchasesSpecifier
{
  [(PSUIBiometricController *)self updateStoreBiometricsState];
  id v4 = [(PSUIBiometricController *)self specifierForID:@"TOUCHID_PURCHASES"];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PSUIBiometricController isTouchIDForPurchasesRestricted](self, "isTouchIDForPurchasesRestricted") ^ 1);
  [v4 setProperty:v3 forKey:*MEMORY[0x263F600A8]];

  [(PSUIBiometricController *)self reloadSpecifier:v4 animated:1];
}

- (id)isTouchIDForStockholmEnabled:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3);
  int v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F538D8]];

  BOOL v5 = NSNumber;
  if (v4 == 1)
  {
    id v6 = +[PSUIPasscode sharedInstance];
    if ([v6 isPasscodeSet])
    {
      char v7 = +[PSUIBiometrics identities];
      id v8 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v7, "count") != 0);
    }
    else
    {
      id v8 = [v5 numberWithBool:0];
    }
  }
  else
  {
    id v8 = [NSNumber numberWithBool:0];
  }
  return v8;
}

- (void)setTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Using biometric for Wallet & Apple Pay: User toggled to %@", buf, 0xCu);
  }

  if ([v6 BOOLValue])
  {
    [(PSUIBiometricController *)self proceedTouchIDForStockholmEnabled:v6 specifier:v7];
  }
  else
  {
    id v9 = [(PSUIBiometricController *)self dtoController];
    int v10 = [v9 isRatchetEnabled];

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v11 = [(PSUIBiometricController *)self dtoController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke;
      v12[3] = &unk_264E95950;
      objc_copyWeak(&v15, (id *)buf);
      id v13 = v7;
      id v14 = v6;
      [v11 gateWithRatchetForOperation:8 forPresentingVC:self completion:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(PSUIBiometricController *)self presentConfirmationAndProceedTouchIDForStockholmEnabled:v6 specifier:v7];
    }
  }
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2;
  v4[3] = &unk_264E95928;
  objc_copyWeak(v7, a1 + 6);
  v7[1] = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v4);

  objc_destroyWeak(v7);
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 56) == 2)
  {
    uint64_t v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_1();
    }

    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    int v4 = PSUILogForCategory(1uLL);
    id v5 = v4;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Using biometric for Wallet & Apple Pay: Toggling to Off ", v6, 2u);
      }

      [WeakRetained presentConfirmationAndProceedTouchIDForStockholmEnabled:*(void *)(a1 + 40) specifier:*(void *)(a1 + 32)];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_2();
      }
    }
  }
}

- (void)presentConfirmationAndProceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PSLocalizableStockholmStringForKey();
  id v9 = PSLocalizableStockholmStringForKey();
  int v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 6 || (PSIsPearlAvailable() & 1) != 0 || PSSupportsMesa())
  {
    uint64_t v12 = PSLocalizableStockholmStringForKey();

    uint64_t v13 = PSLocalizableStockholmStringForKey();

    id v9 = (void *)v13;
    id v8 = (void *)v12;
  }
  id v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  id v15 = (void *)MEMORY[0x263F82400];
  id v16 = PSLocalizableMesaStringForKey();
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke;
  v27[3] = &unk_264E954F8;
  v27[4] = self;
  id v17 = v7;
  id v28 = v17;
  uint64_t v18 = [v15 actionWithTitle:v16 style:1 handler:v27];
  [v14 addAction:v18];

  v19 = (void *)MEMORY[0x263F82400];
  v20 = PSLocalizableMesaStringForKey();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke_2;
  v24[3] = &unk_264E95978;
  v24[4] = self;
  id v25 = v6;
  id v26 = v17;
  id v21 = v17;
  id v22 = v6;
  v23 = [v19 actionWithTitle:v20 style:2 handler:v24];
  [v14 addAction:v23];

  [(PSUIBiometricController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

uint64_t __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) proceedTouchIDForStockholmEnabled:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48)];
}

- (void)proceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(PSUIBiometricController *)self specifier];

  if (!v6)
  {
    id v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometricController proceedTouchIDForStockholmEnabled:specifier:]();
    }
  }
  id v8 = [(PSUIBiometricController *)self specifier];
  id v9 = [v8 propertyForKey:*MEMORY[0x263F60270]];

  if (!v9)
  {
    int v10 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometricController proceedTouchIDForStockholmEnabled:specifier:]();
    }
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __71__PSUIBiometricController_proceedTouchIDForStockholmEnabled_specifier___block_invoke;
  id v17 = &unk_264E953A8;
  id v18 = v5;
  id v19 = v9;
  id v11 = v9;
  id v12 = v5;
  uint64_t v13 = _Block_copy(&v14);
  -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v13, v14, v15, v16, v17);
}

void __71__PSUIBiometricController_proceedTouchIDForStockholmEnabled_specifier___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  [v3 setBoolValue:v2 forSetting:*MEMORY[0x263F538D8] passcode:*(void *)(a1 + 40)];
}

- (BOOL)isTouchIDForStockholmRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F538D8]])
  {
    char v3 = 1;
  }
  else
  {
    int v4 = +[PSUIBiometrics sharedInstance];
    char v3 = [v4 shouldRestrictFeaturesRequiringEnrollment];
  }
  return v3;
}

- (void)updateTouchIDForStockholmSpecifier
{
  id v4 = [(PSUIBiometricController *)self specifierForID:@"TOUCHID_STOCKHOLM"];
  if (v4)
  {
    char v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PSUIBiometricController isTouchIDForStockholmRestricted](self, "isTouchIDForStockholmRestricted") ^ 1);
    [v4 setProperty:v3 forKey:*MEMORY[0x263F600A8]];

    [(PSUIBiometricController *)self reloadSpecifier:v4 animated:1];
  }
}

- (BOOL)isBiometricEditingAllowed
{
  uint64_t v2 = +[PSUIBiometrics sharedInstance];
  char v3 = [v2 isBiometricEditingAllowed];

  return v3;
}

- (BOOL)isEnrollmentAvailable
{
  if (PSIsPearlAvailable())
  {
    char v3 = +[PSUIBiometrics sharedInstance];
    id v4 = v3;
    uint64_t v5 = 2;
LABEL_5:
    unint64_t v6 = [v3 maximumIdentityCountForIdentityType:v5];

    goto LABEL_7;
  }
  if (PSSupportsMesa())
  {
    char v3 = +[PSUIBiometrics sharedInstance];
    id v4 = v3;
    uint64_t v5 = 1;
    goto LABEL_5;
  }
  unint64_t v6 = 0;
LABEL_7:
  id v7 = +[PSUIBiometrics identities];
  BOOL v8 = [v7 count] < v6
    && [(PSUIBiometricController *)self isBiometricEditingAllowed];

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(PSUIBiometricController *)self specifierAtIndex:[(PSUIBiometricController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 properties];
  unint64_t v6 = [v5 objectForKey:*MEMORY[0x263F600A8]];

  BOOL v7 = !v6 || [v6 BOOLValue];
  return v7;
}

- (id)placardSpecifier
{
  uint64_t v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F10E0E8 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v2 setObject:NSClassFromString(&cfstr_PreferencesuiP.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v2 setIdentifier:@"PRIVACY_PLACARD"];
  return v2;
}

- (id)biometricLogo
{
}

- (id)biometricTableViewHeader
{
  uint64_t v2 = [(PSUIBiometricController *)self biometricLogo];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  [v2 size];
  double v5 = v4;
  [v2 size];
  BOOL v7 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v5, v6 + 45.0);
  [v7 setImage:v2];
  [v7 setContentMode:6];

  return v7;
}

- (void)setupBiometricLogoHeader
{
  id v4 = [(PSUIBiometricController *)self biometricTableViewHeader];
  id v3 = [(PSUIBiometricController *)self table];
  [v3 setTableHeaderView:v4];
}

- (id)headerForUseBiometricSection
{
  return &stru_26F10E0E8;
}

- (id)biometricNameDescription
{
  return &stru_26F10E0E8;
}

- (id)useBiometricForSpecifiers
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v4 setIdentifier:@"TOUCHID_SETTINGS"];
  double v5 = [(PSUIBiometricController *)self headerForUseBiometricSection];
  [v4 setName:v5];

  [v3 addObject:v4];
  if (PSIsPearlInterlocked())
  {
    double v6 = +[PSUIBiometrics identities];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  BOOL v8 = (void *)MEMORY[0x263F5FC40];
  id v9 = PSLocalizableMesaStringForKey();
  int v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel_setBiometricUnlockEnabled_specifier_ get:sel_isTouchIDUnlockEnabled_ detail:0 cell:6 edit:0];

  uint64_t v11 = *MEMORY[0x263F60138];
  uint64_t v44 = *MEMORY[0x263F60138];
  [v10 setProperty:@"TOUCHID_UNLOCK" forKey:*MEMORY[0x263F60138]];
  id v12 = NSNumber;
  uint64_t v13 = +[PSUIBiometrics sharedInstance];
  uint64_t v14 = objc_msgSend(v12, "numberWithInt:", v7 & ~objc_msgSend(v13, "isTouchIDUnlockRestricted"));
  uint64_t v15 = *MEMORY[0x263F600A8];
  [v10 setProperty:v14 forKey:*MEMORY[0x263F600A8]];

  v43 = v10;
  id v16 = v10;
  id v17 = v3;
  [v3 addObject:v16];
  [(PSUIBiometricController *)self updateStoreBiometricsState];
  id v18 = (void *)MEMORY[0x263F5FC40];
  id v19 = PSLocalizableMesaStringForKey();
  v20 = [v18 preferenceSpecifierNamed:v19 target:self set:sel_setTouchIDForPurchasesEnabled_specifier_ get:sel_isTouchIDForPurchasesEnabled_ detail:0 cell:6 edit:0];

  [v20 setProperty:@"TOUCHID_PURCHASES" forKey:v11];
  id v21 = objc_msgSend(NSNumber, "numberWithInt:", v7 & ~-[PSUIBiometricController isTouchIDForPurchasesRestricted](self, "isTouchIDForPurchasesRestricted"));
  [v20 setProperty:v21 forKey:v15];

  [v17 addObject:v20];
  if (MGGetBoolAnswer())
  {
    id v22 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v23 = [v22 BOOLForKey:@"showPassbookRow"];

    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v24 = (void *)getPKWalletVisibilityClass_softClass;
    uint64_t v57 = getPKWalletVisibilityClass_softClass;
    if (!getPKWalletVisibilityClass_softClass)
    {
      uint64_t v49 = MEMORY[0x263EF8330];
      uint64_t v50 = 3221225472;
      v51 = __getPKWalletVisibilityClass_block_invoke;
      v52 = &unk_264E95420;
      v53 = &v54;
      __getPKWalletVisibilityClass_block_invoke((uint64_t)&v49);
      v24 = (void *)v55[3];
    }
    v42 = v4;
    id v25 = v24;
    _Block_object_dispose(&v54, 8);
    int v26 = [v25 isWalletVisible];
    v27 = (void *)MEMORY[0x263F5FC40];
    id v28 = PSLocalizableStockholmStringForKey();
    v29 = [v27 preferenceSpecifierNamed:v28 target:self set:sel_setTouchIDForStockholmEnabled_specifier_ get:sel_isTouchIDForStockholmEnabled_ detail:0 cell:6 edit:0];

    [v29 setProperty:@"TOUCHID_STOCKHOLM" forKey:v44];
    [v29 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    v30 = objc_msgSend(NSNumber, "numberWithInt:", v7 & ~-[PSUIBiometricController isTouchIDForStockholmRestricted](self, "isTouchIDForStockholmRestricted"));
    [v29 setProperty:v30 forKey:v15];

    if ((v23 & v26) == 1)
    {
      [v17 addObject:v29];
    }
    else
    {
      char v31 = PSHasStockholmPass();
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2050000000;
      v32 = (void *)getPKPaymentRegistrationUtilitiesClass_softClass;
      uint64_t v57 = getPKPaymentRegistrationUtilitiesClass_softClass;
      if (!getPKPaymentRegistrationUtilitiesClass_softClass)
      {
        uint64_t v49 = MEMORY[0x263EF8330];
        uint64_t v50 = 3221225472;
        v51 = __getPKPaymentRegistrationUtilitiesClass_block_invoke;
        v52 = &unk_264E95420;
        v53 = &v54;
        __getPKPaymentRegistrationUtilitiesClass_block_invoke((uint64_t)&v49);
        v32 = (void *)v55[3];
      }
      id v33 = v32;
      _Block_object_dispose(&v54, 8);
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2050000000;
      v34 = (void *)getPKPaymentWebServiceClass_softClass;
      uint64_t v57 = getPKPaymentWebServiceClass_softClass;
      if (!getPKPaymentWebServiceClass_softClass)
      {
        uint64_t v49 = MEMORY[0x263EF8330];
        uint64_t v50 = 3221225472;
        v51 = __getPKPaymentWebServiceClass_block_invoke;
        v52 = &unk_264E95420;
        v53 = &v54;
        __getPKPaymentWebServiceClass_block_invoke((uint64_t)&v49);
        v34 = (void *)v55[3];
      }
      id v35 = v34;
      _Block_object_dispose(&v54, 8);
      v36 = [v35 sharedService];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke;
      v45[3] = &unk_264E959C8;
      char v47 = v31;
      char v48 = v26;
      v45[4] = self;
      id v46 = v29;
      [v33 shouldShowWalletInSettingsWithApplePaySupportInformation:v36 completion:v45];
    }
    id v4 = v42;
  }
  v37 = (void *)MEMORY[0x263F5FC40];
  v38 = PSLocalizableMesaStringForKey();
  v39 = [v37 preferenceSpecifierNamed:v38 target:self set:sel_setSafariAutoFillEnabled_specifier_ get:sel_safariAutoFillEnabled_ detail:0 cell:6 edit:0];

  [v39 setProperty:@"TOUCHID_SAFARI_AUTOFILL" forKey:v44];
  v40 = objc_msgSend(NSNumber, "numberWithInt:", v7 & ~-[PSUIBiometricController isSafariAutofillRestricted](self, "isSafariAutofillRestricted"));
  [v39 setProperty:v40 forKey:v15];

  [v17 addObject:v39];
  return v17;
}

void __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke(uint64_t a1, char a2, char a3)
{
  BOOL v5 = (a3 & 1) != 0 || *(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49) != 0;
  double v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 setBool:v5 forKey:@"showPassbookRow"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke_2;
  block[3] = &unk_264E959A0;
  char v10 = a2;
  BOOL v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) specifierForID:@"TOUCHID_STOCKHOLM"];

    if (!v2)
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      [v3 insertSpecifier:v4 afterSpecifierID:@"TOUCHID_UNLOCK" animated:1];
    }
  }
}

+ (BOOL)shouldPresentInModalSheet
{
  uint64_t v2 = [MEMORY[0x263F82670] currentDevice];
  char v3 = objc_msgSend(v2, "sf_isiPad");

  return v3;
}

- (void)presentSheetForContentViewController:(id)a3
{
}

- (void)presentSheetForContentViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setModalPresentationStyle:2];
  [MEMORY[0x263F5B890] preferredContentSize];
  objc_msgSend(v7, "setPreferredContentSize:");
  [(PSUIBiometricController *)self presentViewController:v7 animated:1 completion:v6];
}

- (void)enrollBiometric
{
}

- (void)pushPasscodePane
{
  char v3 = [(PSUIBiometricController *)self presentedViewController];
  uint64_t v4 = [v3 navigationBar];
  [v4 setBarStyle:0];

  BOOL v5 = [v3 navigationBar];
  id v6 = objc_opt_new();
  [v5 setShadowImage:v6];

  id v7 = [v3 navigationBar];
  [v7 _setHidesShadow:0];

  BOOL v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 6)
  {
    if ([(PSUIPasscodeLockController *)self shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests])
    {
      char v10 = PSUI_LocalizedStringForPasscodeLock(@"PMSET");
      uint64_t v11 = PSUI_LocalizedStringForPasscodeLock(@"ENTER_PASSCODE_PROMPT_TOUCH_ID");
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __43__PSUIBiometricController_pushPasscodePane__block_invoke;
      v17[3] = &unk_264E95600;
      v17[4] = self;
      [(PSUIPasscodeLockController *)self showLocalAuthenticationPasscodeChangeFlowFromPresentingController:v3 title:v10 passcodePrompt:v11 withCompletion:v17];
    }
    else
    {
      uint64_t v13 = [(PSUIBiometricController *)self specifierAtIndex:0];
      uint64_t v14 = [(PSUIBiometricController *)self _passcodeControllerForSpecifier:v13];

      [v14 preferredContentSize];
      objc_msgSend(v3, "setPreferredContentSize:");
      [v3 pushViewController:v14 animated:1];
    }
  }
  else
  {
    id v12 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Dismissing current view to push Passcode Change flow", buf, 2u);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__PSUIBiometricController_pushPasscodePane__block_invoke_178;
    v15[3] = &unk_264E952E0;
    v15[4] = self;
    [v3 dismissViewControllerAnimated:1 completion:v15];
  }
}

uint64_t __43__PSUIBiometricController_pushPasscodePane__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 cancelModalFlowWithCompletion:0];
  }
  else {
    return [v2 completeModalFlow];
  }
}

void __43__PSUIBiometricController_pushPasscodePane__block_invoke_178(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = PSUI_LocalizedStringForPasscodeLock(@"PMSET");
  uint64_t v4 = PSUI_LocalizedStringForPasscodeLock(@"ENTER_PASSCODE_PROMPT_TOUCH_ID");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PSUIBiometricController_pushPasscodePane__block_invoke_2;
  v5[3] = &unk_264E95600;
  void v5[4] = *(void *)(a1 + 32);
  [v2 showLocalAuthenticationPasscodeChangeFlowFromPresentingController:v2 title:v3 passcodePrompt:v4 withCompletion:v5];
}

uint64_t __43__PSUIBiometricController_pushPasscodePane__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 cancelModalFlowWithCompletion:0];
  }
  else {
    return [v2 completeModalFlow];
  }
}

- (void)presentPasscodePaneFromSpecifier:(id)a3
{
  id v5 = [(PSUIBiometricController *)self _passcodeControllerForSpecifier:a3];
  uint64_t v4 = [[PSEnrollmentNavigationController alloc] initWithRootViewController:v5];
  [(PSEnrollmentNavigationController *)v4 setModalPresentationStyle:2];
  [(PSEnrollmentNavigationController *)v4 setModalInPresentation:1];
  [(PSUIBiometricController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_passcodeControllerForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUIBiometricController *)self passcodeController];
  [v5 setMode:0];
  [v5 setPinDelegate:self];
  [v5 setSpecifier:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = [v5 specifier];
  *(void *)&v7[*MEMORY[0x263F5FE20]] = v6;

  BOOL v8 = [v5 navigationItem];
  [v8 setHidesBackButton:1];

  return v5;
}

- (id)passcodeController
{
  uint64_t v2 = objc_alloc_init(PSBiometricPINController);
  return v2;
}

- (void)hideCancelButton
{
  int v3 = [(id)objc_opt_class() shouldPresentInModalSheet];
  id v6 = [(PSUIBiometricController *)self enrollContainerController];
  id v4 = [v6 navigationItem];
  id v5 = v4;
  if (v3) {
    [v4 setLeftBarButtonItem:0 animated:1];
  }
  else {
    [v4 setRightBarButtonItem:0 animated:1];
  }
}

- (void)enrollmentCompletedForIdentity:(id)a3
{
  id v9 = a3;
  int v3 = PSIsPearlAvailable();
  id v4 = +[PSUIBiometrics sharedInstance];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [v4 nextIdentityNameForIdentityType:v6];

  if (!v7) {
    -[PSUIBiometricController enrollmentCompletedForIdentity:]();
  }
  BOOL v8 = +[PSUIBiometrics sharedInstance];
  [v8 setName:v7 forIdentity:v9 completion:0];
}

- (void)completeModalFlow
{
  [(PSUIBiometricController *)self setCurrentlyEnablingTouchIDForPurchases:0];
  int v3 = [(PSUIBiometricController *)self modalFlowSuccessCompletion];

  if (v3)
  {
    id v4 = [(PSUIBiometricController *)self modalFlowSuccessCompletion];
    v4[2]();
  }
  [(PSUIBiometricController *)self setModalFlowSuccessCompletion:0];
  [(PSUIBiometricController *)self setModalFlowCancelCompletion:0];
  [(PSUIBiometricController *)self _popEnrollmentControllerWithCompletion:0];
}

- (void)cancelModalFlowWithCompletion:(id)a3
{
  id v6 = a3;
  [(PSUIBiometricController *)self setCurrentlyEnablingTouchIDForPurchases:0];
  id v4 = [(PSUIBiometricController *)self modalFlowCancelCompletion];

  if (v4)
  {
    id v5 = [(PSUIBiometricController *)self modalFlowCancelCompletion];
    v5[2]();
  }
  [(PSUIBiometricController *)self setModalFlowCancelCompletion:0];
  [(PSUIBiometricController *)self setModalFlowSuccessCompletion:0];
  [(PSUIBiometricController *)self _popEnrollmentControllerWithCompletion:v6];
}

- (void)_popEnrollmentControllerWithCompletion:(id)a3
{
  id v4 = a3;
  [(PSUIBiometricController *)self reloadSpecifiers];
  [(PSUIBiometricController *)self setEnrollContainerController:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__PSUIBiometricController__popEnrollmentControllerWithCompletion___block_invoke;
  v6[3] = &unk_264E959F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PSUIBiometricController *)self dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __66__PSUIBiometricController__popEnrollmentControllerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) enrollmentControllerDidDismiss];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PSUIBiometricController;
  [(PSUIPasscodeLockController *)&v5 devicePINController:a3 didAcceptSetPIN:a4];
  [(PSUIBiometricController *)self completeModalFlow];
}

- (void)didCancelEnteringPIN
{
}

- (BOOL)isSafariAutofillRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53790]])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = +[PSUIBiometrics sharedInstance];
    char v3 = [v4 shouldRestrictFeaturesRequiringEnrollment];
  }
  return v3;
}

- (id)safariAutoFillEnabled:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3);
  int v4 = [v3 isAuthenticationBeforeAutoFillRequired];

  objc_super v5 = NSNumber;
  if (v4)
  {
    id v6 = +[PSUIPasscode sharedInstance];
    if ([v6 isPasscodeSet])
    {
      id v7 = +[PSUIBiometrics identities];
      BOOL v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "count") != 0);
    }
    else
    {
      BOOL v8 = [v5 numberWithInt:0];
    }
  }
  else
  {
    BOOL v8 = [NSNumber numberWithInt:0];
  }
  return v8;
}

- (void)setSafariAutoFillEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Using biometric for Password AutoFill: User toggled to %@", buf, 0xCu);
  }

  if ([v6 BOOLValue])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_187;
    v12[3] = &unk_264E952E0;
    id v13 = v6;
    [(PSUIBiometricController *)self addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:v12];
  }
  else
  {
    id v9 = [(PSUIBiometricController *)self dtoController];
    int v10 = [v9 isRatchetEnabled];

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v11 = [(PSUIBiometricController *)self dtoController];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke;
      v16[3] = &unk_264E95950;
      objc_copyWeak(&v19, (id *)buf);
      id v17 = v7;
      id v18 = v6;
      [v11 gateWithRatchetForOperation:9 forPresentingVC:self completion:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_186;
      v14[3] = &unk_264E952E0;
      id v15 = v6;
      [(PSUIBiometricController *)self addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:v14];
    }
  }
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2;
  v4[3] = &unk_264E95928;
  objc_copyWeak(v7, a1 + 6);
  v7[1] = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v4);

  objc_destroyWeak(v7);
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 56) == 2)
  {
    char v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_1();
    }

    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    int v4 = PSUILogForCategory(1uLL);
    id v5 = v4;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Using biometric for Password AutoFill: Toggling to Off ", buf, 2u);
      }

      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_185;
      v6[3] = &unk_264E952E0;
      id v7 = *(id *)(a1 + 40);
      [WeakRetained addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:v6];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_2();
      }
    }
  }
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_185(uint64_t a1)
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  [v3 setBoolValue:v2 forSetting:*MEMORY[0x263F53790]];
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_186(uint64_t a1)
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  [v3 setBoolValue:v2 forSetting:*MEMORY[0x263F53790]];
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_187(uint64_t a1)
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  [v3 setBoolValue:v2 forSetting:*MEMORY[0x263F53790]];
}

- (int64_t)storeState
{
  return self->_storeState;
}

- (id)modalFlowSuccessCompletion
{
  return self->_modalFlowSuccessCompletion;
}

- (void)setModalFlowSuccessCompletion:(id)a3
{
}

- (id)modalFlowCancelCompletion
{
  return self->_modalFlowCancelCompletion;
}

- (void)setModalFlowCancelCompletion:(id)a3
{
}

- (BOOL)currentlyEnablingTouchIDForPurchases
{
  return self->_currentlyEnablingTouchIDForPurchases;
}

- (void)setCurrentlyEnablingTouchIDForPurchases:(BOOL)a3
{
  self->_currentlyEnablingTouchIDForPurchases = a3;
}

- (NSArray)storedBiometricTemplates
{
  return self->_storedBiometricTemplates;
}

- (void)setStoredBiometricTemplates:(id)a3
{
}

- (unint64_t)currentBiometricTemplateFetchStatus
{
  return self->_currentBiometricTemplateFetchStatus;
}

- (BOOL)isObservingBiometricTemplateFetchingStatus
{
  return self->_isObservingBiometricTemplateFetchingStatus;
}

- (void)setIsObservingBiometricTemplateFetchingStatus:(BOOL)a3
{
  self->_isObservingBiometricTemplateFetchingStatus = a3;
}

- (void)set_biometricBindingFlowManager:(id)a3
{
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
}

- (PSEnrollContainerViewController)enrollContainerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enrollContainerController);
  return (PSEnrollContainerViewController *)WeakRetained;
}

- (void)setEnrollContainerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrollContainerController);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, 0);
  objc_storeStrong((id *)&self->_storedBiometricTemplates, 0);
  objc_storeStrong(&self->_modalFlowCancelCompletion, 0);
  objc_storeStrong(&self->_modalFlowSuccessCompletion, 0);
}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[PSUIBiometricController deleteGlobalAuthACL]_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "%s: Encountered error '%{public}@'", (uint8_t *)&v2, 0x16u);
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "setBiometricUnlockEnabled: No passcode", v2, v3, v4, v5, v6);
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "setBiometricUnlockEnabled: No specifier", v2, v3, v4, v5, v6);
}

- (void)authorizationToken
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "authorizationToken: No specifier", v2, v3, v4, v5, v6);
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Using biometric for Wallet & Apple Pay: Not toggling to Off as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Using biometric for Wallet & Apple Pay: Not toggling to Off as we are are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)proceedTouchIDForStockholmEnabled:specifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedTouchIDForStockholmEnabled: No passcode", v2, v3, v4, v5, v6);
}

- (void)proceedTouchIDForStockholmEnabled:specifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedTouchIDForStockholmEnabled: No specifier", v2, v3, v4, v5, v6);
}

- (void)enrollmentCompletedForIdentity:.cold.1()
{
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Using biometric for Password AutoFill: Not toggling to Off as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Using biometric for Password AutoFill: Not toggling to Off as we are are missing instance (self)", v2, v3, v4, v5, v6);
}

@end