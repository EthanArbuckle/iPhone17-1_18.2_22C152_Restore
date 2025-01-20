@interface PSUITouchIDPasscodeController
- (BOOL)isBiometricIdentityMatchingGovernmentIDTemplate:(id)a3;
- (BiometricKit)highlightMatcher;
- (LAContext)authContext;
- (OBPrivacyPresenter)presenter;
- (OS_dispatch_queue)highlightQueue;
- (PSUIDeviceTakeOverController)dtoController;
- (PSUITouchIDPasscodeController)init;
- (id)_fingerprintSpecifierForIdentity:(id)a3;
- (id)biometricLogo;
- (id)biometricNameDescription;
- (id)fingerprintSpecifiers;
- (id)headerForUseBiometricSection;
- (id)specifiers;
- (void)_cancelMatching;
- (void)_setupMatching;
- (void)addEnrollment:(id)a3;
- (void)addFooterToUseForGroup:(id)a3;
- (void)authContext;
- (void)backgrounded:(id)a3;
- (void)biometricBindingDeleted;
- (void)cancelModalFlow;
- (void)cancelModalFlowWithCompletion:(id)a3;
- (void)configureBiometricTemplateMatching;
- (void)dealloc;
- (void)enrollBiometric;
- (void)enrollResult:(int)a3 bkIdentity:(id)a4;
- (void)enrollmentControllerDidDismiss;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)highlightFingerprintSpecifier:(id)a3;
- (void)learnMoreTapped:(id)a3;
- (void)matchBiometricIdentitiesWithBiometricTemplates;
- (void)matchResult:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)proceedToAddEnrollment:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setDtoController:(id)a3;
- (void)setHighlightMatcher:(id)a3;
- (void)setHighlightQueue:(id)a3;
- (void)setPresenter:(id)a3;
- (void)statusMessage:(unsigned int)a3;
- (void)suspend;
- (void)unhighlightFingerprintSpecifiersAfterDelay:(double)a3;
- (void)updateAddFingerprintSpecifier;
- (void)updateWithReplacedUUIDs:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PSUITouchIDPasscodeController

- (PSUITouchIDPasscodeController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PSUITouchIDPasscodeController;
  v2 = [(PSUIBiometricController *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_reloadSpecifiers name:@"PSEnrollmentNameChanged" object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_biometricBindingDeleted name:@"PSBiometricBindingDeleted" object:0];

    uint64_t v5 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_backgrounded_ name:*MEMORY[0x263F83330] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if ([(PSUIBiometricController *)self isObservingBiometricTemplateFetchingStatus])
  {
    [(PSUITouchIDPasscodeController *)self removeObserver:self forKeyPath:@"currentBiometricTemplateFetchStatus"];
  }
  [(BiometricKit *)self->_highlightMatcher setDelegate:0];
  [(BiometricKit *)self->_highlightMatcher cancel];
  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIPasscodeLockController *)&v4 dealloc];
}

- (void)backgrounded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUITouchIDPasscodeController *)self presenter];
  v6 = [v5 splashController];

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = [(PSUITouchIDPasscodeController *)self presenter];
    v8 = [v7 splashController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__PSUITouchIDPasscodeController_backgrounded___block_invoke;
    v9[3] = &unk_264E954A8;
    objc_copyWeak(&v10, &location);
    [v8 dismissViewControllerAnimated:0 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__PSUITouchIDPasscodeController_backgrounded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresenter:0];
}

- (void)suspend
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__PSUITouchIDPasscodeController_suspend__block_invoke;
  v2[3] = &unk_264E952E0;
  v2[4] = self;
  [(PSUITouchIDPasscodeController *)self cancelModalFlowWithCompletion:v2];
}

id __40__PSUITouchIDPasscodeController_suspend__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  return objc_msgSendSuper2(&v2, sel_suspend);
}

- (void)updateAddFingerprintSpecifier
{
  id v4 = [(PSUITouchIDPasscodeController *)self specifierForID:@"ADD_FINGERPRINT"];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIBiometricController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  [v4 setProperty:v3 forKey:*MEMORY[0x263F600A8]];

  [(PSUITouchIDPasscodeController *)self reloadSpecifier:v4 animated:1];
}

- (void)highlightFingerprintSpecifier:(id)a3
{
  id v4 = a3;
  if ([(PSUITouchIDPasscodeController *)self containsSpecifier:v4])
  {
    uint64_t v5 = [v4 propertyForKey:*MEMORY[0x263F602B0]];
    if (v5)
    {
      v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      [v6 addObject:v5];
      v7 = [(PSUITouchIDPasscodeController *)self highlightQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke;
      block[3] = &unk_264E952E0;
      id v10 = v6;
      id v8 = v6;
      dispatch_async(v7, block);
    }
  }
}

void __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke_2;
  block[3] = &unk_264E952E0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) anyObject];
  [v1 setHighlighted:1 animated:1];
}

- (void)unhighlightFingerprintSpecifiersAfterDelay:(double)a3
{
  uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  [v5 addObject:self];
  v6 = [(PSUITouchIDPasscodeController *)self highlightQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke;
  v8[3] = &unk_264E956A8;
  double v10 = a3;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 40) > 0.0) {
    objc_msgSend(MEMORY[0x263F08B88], "sleepForTimeInterval:");
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke_2;
  block[3] = &unk_264E952E0;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v1 = objc_msgSend(*(id *)(a1 + 32), "anyObject", 0);
  id v2 = [v1 specifiers];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x263F602B0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 propertyForKey:v6];
        if ([v9 isHighlighted])
        {
          double v10 = [v8 propertyForKey:@"FingerprintIdentity"];

          if (v10) {
            [v9 setHighlighted:0 animated:1];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_setupMatching
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v3 = [v2 applicationState] == 0;

  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PSUITouchIDPasscodeController__setupMatching__block_invoke;
  block[3] = &unk_264E956D0;
  objc_copyWeak(&v6, &location);
  BOOL v7 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__PSUITouchIDPasscodeController__setupMatching__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = +[PSUIBiometrics identities];
  if ([v3 count])
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);

    if (v4)
    {
      uint64_t v5 = [WeakRetained highlightMatcher];
      [v5 setDelegate:0];

      id v6 = [MEMORY[0x263F2AA68] manager];
      [WeakRetained setHighlightMatcher:v6];

      BOOL v7 = [WeakRetained highlightMatcher];
      [v7 setDelegate:WeakRetained];

      id v8 = [WeakRetained authorizationToken];
      id v9 = [WeakRetained highlightMatcher];
      double v10 = v9;
      if (v8)
      {
        v15 = @"BKOptionMatchAuthTokenToBypassPasscodeBiolockout";
        v16[0] = v8;
        long long v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        int v12 = [v10 match:0 withOptions:v11];
      }
      else
      {
        int v12 = [v9 match:0 withOptions:0];
      }

      if (v12)
      {
        long long v13 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14[0] = 67109120;
          v14[1] = v12;
          _os_log_impl(&dword_23D33A000, v13, OS_LOG_TYPE_DEFAULT, "Failed to start matching: %i", (uint8_t *)v14, 8u);
        }
      }
    }
  }
  else
  {
  }
}

- (void)_cancelMatching
{
  BOOL v3 = [(PSUITouchIDPasscodeController *)self highlightMatcher];
  [v3 setDelegate:0];

  int v4 = [(PSUITouchIDPasscodeController *)self highlightMatcher];
  [v4 cancel];

  [(PSUITouchIDPasscodeController *)self setHighlightMatcher:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIPasscodeLockController *)&v5 viewDidAppear:a3];
  int v4 = [(PSUIBiometricController *)self enrollContainerController];

  if (!v4) {
    [(PSUITouchIDPasscodeController *)self _setupMatching];
  }
  [(PSUITouchIDPasscodeController *)self configureBiometricTemplateMatching];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUITouchIDPasscodeController *)&v4 viewDidDisappear:a3];
  [(PSUITouchIDPasscodeController *)self _cancelMatching];
}

- (void)enrollmentControllerDidDismiss
{
  v3.receiver = self;
  v3.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIBiometricController *)&v3 enrollmentControllerDidDismiss];
  [(PSUITouchIDPasscodeController *)self _setupMatching];
}

- (void)biometricBindingDeleted
{
  v2.receiver = self;
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIBiometricController *)&v2 deleteGlobalAuthACL];
}

- (void)configureBiometricTemplateMatching
{
  switch([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus])
  {
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
    case 4uLL:
      [(PSUITouchIDPasscodeController *)self matchBiometricIdentitiesWithBiometricTemplates];
      break;
    case 3uLL:
      objc_initWeak(&location, self);
      uint64_t v3 = MEMORY[0x263EF8330];
      uint64_t v4 = 3221225472;
      objc_super v5 = __67__PSUITouchIDPasscodeController_configureBiometricTemplateMatching__block_invoke;
      id v6 = &unk_264E954A8;
      objc_copyWeak(&v7, &location);
      [(PSUIBiometricController *)self fetchBiometricTemplateUUIDsWithCompletion:&v3];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
LABEL_6:
      if (![(PSUIBiometricController *)self isObservingBiometricTemplateFetchingStatus])
      {
        [(PSUITouchIDPasscodeController *)self addObserver:self forKeyPath:@"currentBiometricTemplateFetchStatus" options:1 context:@"BiometricTemplateFetchingState"];
        [(PSUIBiometricController *)self setIsObservingBiometricTemplateFetchingStatus:1];
      }
      break;
    default:
      return;
  }
}

void __67__PSUITouchIDPasscodeController_configureBiometricTemplateMatching__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    if ([v3 currentBiometricTemplateFetchStatus] == 3) {
      [v3 configureBiometricTemplateMatching];
    }
    else {
      [v3 matchBiometricIdentitiesWithBiometricTemplates];
    }
  }
}

- (void)updateWithReplacedUUIDs:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIBiometricController *)&v4 updateWithReplacedUUIDs:a3];
  [(PSUITouchIDPasscodeController *)self matchBiometricIdentitiesWithBiometricTemplates];
}

- (void)matchBiometricIdentitiesWithBiometricTemplates
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v13 = [(PSUIBiometricController *)self storedBiometricTemplates];
  if ([v13 count])
  {
    id v3 = [(PSUITouchIDPasscodeController *)self specifiers];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      objc_super v5 = [(PSUITouchIDPasscodeController *)self specifiers];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            long long v11 = [v10 propertyForKey:@"FingerprintIdentity"];
            if (v11)
            {
              int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUITouchIDPasscodeController isBiometricIdentityMatchingGovernmentIDTemplate:](self, "isBiometricIdentityMatchingGovernmentIDTemplate:", v11));
              [v10 setProperty:v12 forKey:@"BIOMETRIC_TEMPLATE_BINDING"];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
  }
}

- (id)headerForUseBiometricSection
{
  return (id)PSLocalizableMesaStringForKey();
}

- (id)biometricNameDescription
{
  return (id)PSLocalizableMesaStringForKey();
}

- (id)biometricLogo
{
  objc_super v2 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:40.0];
  id v3 = [MEMORY[0x263F827E8] systemImageNamed:@"touchid" withConfiguration:v2];
  uint64_t v4 = [MEMORY[0x263F825C8] systemPinkColor];
  objc_super v5 = [v3 _flatImageWithColor:v4];
  uint64_t v6 = [v5 imageWithRenderingMode:1];

  return v6;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 6)
    {
      uint64_t v8 = [(PSUIBiometricController *)self placardSpecifier];
      [v5 addObject:v8];
    }
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Preferences.highlighting", 0);
    [(PSUITouchIDPasscodeController *)self setHighlightQueue:v9];

    double v10 = [(PSUIBiometricController *)self useBiometricForSpecifiers];
    long long v11 = [v10 firstObject];
    [(PSUITouchIDPasscodeController *)self addFooterToUseForGroup:v11];
    [v5 addObjectsFromArray:v10];
    int v12 = [(PSUITouchIDPasscodeController *)self fingerprintSpecifiers];
    [v5 addObjectsFromArray:v12];

    v16.receiver = self;
    v16.super_class = (Class)PSUITouchIDPasscodeController;
    id v13 = [(PSUIPasscodeLockController *)&v16 specifiers];
    [v5 addObjectsFromArray:v13];

    long long v14 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)addFooterToUseForGroup:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5B8E8];
  objc_super v5 = (void *)MEMORY[0x263F5B8B0];
  id v6 = a3;
  uint64_t v7 = [v5 bundleWithIdentifier:@"com.apple.onboarding.touchid"];
  id v15 = [v4 flowWithBundle:v7];

  uint64_t v8 = [v15 localizedButtonTitle];
  dispatch_queue_t v9 = PSUI_LocalizedStringForTouchID(@"USE_TOUCHID_FOR_GROUP_FOOTER_PREFIX");
  double v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
  long long v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600C0]];

  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600F8]];
  v17.id location = [v10 rangeOfString:v8];
  id v13 = NSStringFromRange(v17);
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600D0]];

  long long v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600E0]];

  [v6 setObject:@"learnMoreTapped:" forKeyedSubscript:*MEMORY[0x263F600C8]];
}

- (void)learnMoreTapped:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.touchid"];
  [(PSUITouchIDPasscodeController *)self setPresenter:v4];

  objc_super v5 = [(PSUITouchIDPasscodeController *)self presenter];
  [v5 setPresentingViewController:self];

  id v6 = [(PSUITouchIDPasscodeController *)self presenter];
  [v6 present];
}

- (id)_fingerprintSpecifierForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = (void *)v5;
  uint64_t v7 = &stru_26F10E0E8;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  dispatch_queue_t v9 = [MEMORY[0x263F53C50] sharedConnection];
  int v10 = [v9 isFingerprintModificationAllowed];

  if (v10) {
    [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  }
  else {
  long long v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  }
  [v11 setProperty:v4 forKey:@"FingerprintIdentity"];
  if ([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] == 2)
  {
    int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUITouchIDPasscodeController isBiometricIdentityMatchingGovernmentIDTemplate:](self, "isBiometricIdentityMatchingGovernmentIDTemplate:", v4));
    [v11 setProperty:v12 forKey:@"BIOMETRIC_TEMPLATE_BINDING"];
  }
  return v11;
}

- (BOOL)isBiometricIdentityMatchingGovernmentIDTemplate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSUIBiometricController *)self storedBiometricTemplates];
  if ([v5 count])
  {
    unint64_t v6 = [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus];

    if (v6 != 4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = [(PSUIBiometricController *)self storedBiometricTemplates];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v13 = [v4 uuid];
            LOBYTE(v12) = [v12 isEqual:v13];

            if (v12)
            {

              BOOL v14 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (id)fingerprintSpecifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v4 setIdentifier:@"FINGERPRINTS"];
  uint64_t v5 = PSLocalizableMesaStringForKey();
  [v4 setName:v5];

  [v3 addObject:v4];
  unint64_t v6 = +[PSUIBiometrics sharedInstance];
  uint64_t v7 = [v6 identitiesForIdentityType:1];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [(PSUITouchIDPasscodeController *)self _fingerprintSpecifierForIdentity:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v3 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  BOOL v14 = (void *)MEMORY[0x263F5FC40];
  id v15 = PSLocalizableMesaStringForKey();
  long long v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v16 setButtonAction:sel_addEnrollment_];
  [v16 setIdentifier:@"ADD_FINGERPRINT"];
  long long v17 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIBiometricController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  [v16 setProperty:v17 forKey:*MEMORY[0x263F600A8]];

  [v3 addObject:v16];
  return v3;
}

- (void)enrollBiometric
{
}

- (LAContext)authContext
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUITouchIDPasscodeController *)self specifier];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F60270]];

  authContext = self->_authContext;
  if (v4)
  {
    if (!authContext)
    {
      uint64_t v20 = 0;
      long long v21 = &v20;
      uint64_t v22 = 0x2050000000;
      unint64_t v6 = (void *)getLAContextClass_softClass_0;
      uint64_t v23 = getLAContextClass_softClass_0;
      if (!getLAContextClass_softClass_0)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v27 = __getLAContextClass_block_invoke_0;
        v28 = &unk_264E95420;
        v29 = &v20;
        __getLAContextClass_block_invoke_0((uint64_t)&buf);
        unint64_t v6 = (void *)v21[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v20, 8);
      id v8 = (LAContext *)objc_opt_new();
      uint64_t v9 = self->_authContext;
      self->_authContext = v8;

      [(LAContext *)self->_authContext setUiDelegate:self];
      uint64_t v10 = self->_authContext;
      uint64_t v24 = &unk_26F113208;
      v25 = &unk_26F113220;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v19 = 0;
      id v12 = (id)[(LAContext *)v10 evaluatePolicy:1007 options:v11 error:&v19];
      id v13 = v19;

      if (v13)
      {
        BOOL v14 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 description];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_23D33A000, v14, OS_LOG_TYPE_DEFAULT, "LAContextClass evaluatePolicy failed: %@", (uint8_t *)&buf, 0xCu);
        }
      }

      authContext = self->_authContext;
    }
    long long v16 = authContext;
  }
  else
  {
    self->_authContext = 0;

    long long v17 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PSUITouchIDPasscodeController authContext]();
    }

    long long v16 = 0;
  }
  return v16;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8 = a5;
  if (a3 == 2)
  {
    uint64_t v9 = [a4 objectForKey:&unk_26F113238];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v11 = [(PSUITouchIDPasscodeController *)self specifier];

      if (!v11)
      {
        id v12 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PSUIPearlPasscodeController event:params:reply:]();
        }
      }
      id v13 = [(PSUITouchIDPasscodeController *)self specifier];
      uint64_t v14 = *MEMORY[0x263F60270];
      id v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F60270]];

      if (!v15)
      {
        long long v16 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PSUIPearlPasscodeController event:params:reply:]();
        }
      }
      long long v17 = [(PSUITouchIDPasscodeController *)self authContext];
      long long v18 = [(PSUITouchIDPasscodeController *)self specifier];
      id v19 = [v18 objectForKeyedSubscript:v14];
      uint64_t v20 = [v19 dataUsingEncoding:4];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__PSUITouchIDPasscodeController_event_params_reply___block_invoke;
      v21[3] = &unk_264E95628;
      id v22 = v8;
      [v17 setCredential:v20 forProcessedEvent:2 credentialType:-1 reply:v21];
    }
  }
}

uint64_t __52__PSUITouchIDPasscodeController_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEnrollment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Touch ID: User pressed Add a Fingerprint", (uint8_t *)buf, 2u);
  }

  unint64_t v6 = [(PSUITouchIDPasscodeController *)self dtoController];
  int v7 = [v6 isRatchetEnabled];

  if (v7)
  {
    objc_initWeak(buf, self);
    id v8 = [(PSUITouchIDPasscodeController *)self dtoController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke;
    v9[3] = &unk_264E95520;
    objc_copyWeak(&v11, buf);
    id v10 = v4;
    [v8 gateWithRatchetForOperation:5 forPresentingVC:self completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PSUITouchIDPasscodeController *)self proceedToAddEnrollment:v4];
  }
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    objc_super v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_101;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_101(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Touch ID: Starting addition of fingerprint", v5, 2u);
    }

    [WeakRetained proceedToAddEnrollment:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_101_cold_1();
    }
  }
}

- (void)proceedToAddEnrollment:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F600A8];
  id v5 = a3;
  [v5 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v4];
  [(PSUITouchIDPasscodeController *)self reloadSpecifier:v5];

  objc_initWeak(&location, self);
  id v6 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke;
  v7[3] = &unk_264E954A8;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [MEMORY[0x263F2AAA8] sharedInstance];
  uint64_t v4 = [v3 getEnrollUIViewController:1 bundleName:0];
  if (v4)
  {
    [WeakRetained _cancelMatching];
    id v5 = [MEMORY[0x263F2AA68] manager];
    [v4 setBiometricKit:v5];

    [v4 setDelegate:WeakRetained];
    id v6 = [WeakRetained authContext];
    int v7 = [v6 externalizedContext];

    if (v7) {
      [v4 setProperty:v7 forKey:@"credset"];
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke_2;
    v8[3] = &unk_264E95380;
    objc_copyWeak(&v10, v1);
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v8);

    objc_destroyWeak(&v10);
  }
}

void __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v2 = [[PSEnrollContainerViewController alloc] initWithNibName:0 bundle:0];
  [(PSEnrollContainerViewController *)v2 setEnrollController:*(void *)(a1 + 32)];
  [WeakRetained setEnrollContainerController:v2];
  uint64_t v3 = [[PSEnrollmentNavigationController alloc] initWithRootViewController:v2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:WeakRetained action:sel_cancelModalFlow];
  int v5 = [(id)objc_opt_class() shouldPresentInModalSheet];
  id v6 = [(PSEnrollContainerViewController *)v2 navigationItem];
  int v7 = v6;
  if (v5)
  {
    [v6 setLeftBarButtonItem:v4];

    [WeakRetained presentSheetForContentViewController:v3];
  }
  else
  {
    [v6 setRightBarButtonItem:v4];

    [(PSEnrollmentNavigationController *)v3 setModalPresentationStyle:0];
    [WeakRetained presentViewController:v3 animated:1 completion:0];
  }
}

- (void)cancelModalFlow
{
  v2.receiver = self;
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIBiometricController *)&v2 cancelModalFlowWithCompletion:0];
}

- (void)cancelModalFlowWithCompletion:(id)a3
{
  id v4 = a3;
  [(PSUITouchIDPasscodeController *)self updateAddFingerprintSpecifier];
  v5.receiver = self;
  v5.super_class = (Class)PSUITouchIDPasscodeController;
  [(PSUIBiometricController *)&v5 cancelModalFlowWithCompletion:v4];
}

- (void)matchResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [a3 uuid];
    if (v4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      objc_super v5 = [(PSUITouchIDPasscodeController *)self specifiers];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v11 = [v10 propertyForKey:@"FingerprintIdentity"];
            id v12 = v11;
            if (v11)
            {
              id v13 = [v11 uuid];
              if (v13 && [v4 isEqual:v13])
              {
                [(PSUITouchIDPasscodeController *)self highlightFingerprintSpecifier:v10];
                uint64_t v14 = [(PSUITouchIDPasscodeController *)self highlightMatcher];
                char v15 = [v14 inUse];

                if ((v15 & 1) == 0) {
                  [(PSUITouchIDPasscodeController *)self unhighlightFingerprintSpecifiersAfterDelay:0.5];
                }

                goto LABEL_18;
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
  }
}

- (void)statusMessage:(unsigned int)a3
{
  if (a3 == 64) {
    [(PSUITouchIDPasscodeController *)self unhighlightFingerprintSpecifiersAfterDelay:0.0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (a6 == @"BiometricTemplateFetchingState")
  {
    id v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v14 = [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus];
      _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "In KVO, current biometric template fetch status: %ld", buf, 0xCu);
    }

    if ([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] == 2)
    {
      [(PSUITouchIDPasscodeController *)self matchBiometricIdentitiesWithBiometricTemplates];
      [(PSUITouchIDPasscodeController *)self removeObserver:self forKeyPath:v10];
      [(PSUIBiometricController *)self setIsObservingBiometricTemplateFetchingStatus:0];
    }
    else if ([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] == 3)
    {
      [(PSUIBiometricController *)self fetchBiometricTemplateUUIDsWithCompletion:0];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSUITouchIDPasscodeController;
    [(PSUITouchIDPasscodeController *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Finished Mesa enroll: Result [%@]", (uint8_t *)&buf, 0xCu);
  }
  switch((int)v4)
  {
    case 1:
      if (v6)
      {
        [(PSUIBiometricController *)self enrollmentCompletedForIdentity:v6];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __57__PSUITouchIDPasscodeController_enrollResult_bkIdentity___block_invoke;
        v15[3] = &unk_264E952E0;
        id v16 = v6;
        [(PSUIBiometricController *)self setModalFlowCancelCompletion:v15];
      }
      break;
    case 3:
      [(PSUITouchIDPasscodeController *)self cancelModalFlowWithCompletion:0];
      break;
    case 4:
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x2050000000;
      id v9 = (void *)getBYFlowSkipControllerClass_softClass;
      uint64_t v20 = getBYFlowSkipControllerClass_softClass;
      if (!getBYFlowSkipControllerClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        id v22 = __getBYFlowSkipControllerClass_block_invoke;
        uint64_t v23 = &unk_264E95420;
        uint64_t v24 = &v17;
        __getBYFlowSkipControllerClass_block_invoke((uint64_t)&buf);
        id v9 = (void *)v18[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v17, 8);
      id v11 = objc_alloc_init(v10);
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x2020000000;
      objc_super v12 = (void *)getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr;
      uint64_t v20 = getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr;
      if (!getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        id v22 = __getBYFlowSkipIdentifierTouchIDSymbolLoc_block_invoke;
        uint64_t v23 = &unk_264E95420;
        uint64_t v24 = &v17;
        id v13 = (void *)SetupAssistantLibrary();
        unint64_t v14 = dlsym(v13, "BYFlowSkipIdentifierTouchID");
        *(void *)(v24[1] + 24) = v14;
        getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr = *(void *)(v24[1] + 24);
        objc_super v12 = (void *)v18[3];
      }
      _Block_object_dispose(&v17, 8);
      if (!v12)
      {
        -[PSUITouchIDPasscodeController enrollResult:bkIdentity:]();
        __break(1u);
      }
      [v11 didCompleteFlow:*v12];

      if ([(PSUIBiometricController *)self isPasscodeSet]) {
        [(PSUIBiometricController *)self completeModalFlow];
      }
      else {
        [(PSUIBiometricController *)self pushPasscodePane];
      }
      break;
    case 8:
      [(PSUIBiometricController *)self hideCancelButton];
      break;
    default:
      break;
  }
}

void __57__PSUITouchIDPasscodeController_enrollResult_bkIdentity___block_invoke(uint64_t a1)
{
  id v2 = +[PSUIBiometrics sharedInstance];
  [v2 removeIdentity:*(void *)(a1 + 32) completion:0];
}

- (BiometricKit)highlightMatcher
{
  return self->_highlightMatcher;
}

- (void)setHighlightMatcher:(id)a3
{
}

- (OS_dispatch_queue)highlightQueue
{
  return self->_highlightQueue;
}

- (void)setHighlightQueue:(id)a3
{
}

- (void)setAuthContext:(id)a3
{
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
}

- (OBPrivacyPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_highlightQueue, 0);
  objc_storeStrong((id *)&self->_highlightMatcher, 0);
}

- (void)authContext
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Touch ID: authContext = nil - No passcode", v2, v3, v4, v5, v6);
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Touch ID: Not adding a fingerprint as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Touch ID: Not adding fingerprint as we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (uint64_t)enrollResult:bkIdentity:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1(v0);
}

@end