@interface PSUIPearlPasscodeController
- (BOOL)faceIDEnrollmentCoordinatorShouldPresentInModalSheet:(id)a3;
- (BOOL)hasMatchingBiometricTemplate;
- (BOOL)hasReachedMaximumBiometricEnrollmentCount;
- (BOOL)isEnrolled;
- (BOOL)isEnrollingInPeriocular;
- (BOOL)isEnrollmentAvailable;
- (BOOL)isPeriocularEnabled;
- (BOOL)passcodeViewControllerAllowSkip:(id)a3;
- (LAContext)authContext;
- (OBPrivacyPresenter)presenter;
- (PSSpecifier)currentlyPresentingPearlEnrollSpecifier;
- (PSSpecifier)enrollFaceSpecifier;
- (PSUIDeviceTakeOverController)dtoController;
- (PSUIFaceIDEnrollmentCoordinator)faceIDEnrollmentCoordinator;
- (PSUIPearlAttentionGroupController)attentionGroupController;
- (PSUIPearlPasscodeController)init;
- (id)addGlassesSpecifier;
- (id)biometricLogo;
- (id)biometricNameDescription;
- (id)biometricTableViewHeader;
- (id)enrollPeriocularAlternateAppearanceSpecifier;
- (id)faceIDSpecifiers;
- (id)faceIDSpecifiersWithPeriocular;
- (id)headerForUseBiometricSection;
- (id)isPeriocularFaceIDMatchEnabled:(id)a3;
- (id)numberOfAppsUsingPearlDescription:(id)a3;
- (id)passcodeController;
- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3;
- (id)pearlEnrollSpecifiers;
- (id)resetFaceIDSpecifier;
- (id)setupAlternateAppearanceSpecifier;
- (id)setupFaceIDSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unlockWithFaceMaskSpecifier;
- (unint64_t)currentPeriocularEnrollmentState;
- (unint64_t)numberOfAppsUsingPearl;
- (void)backgrounded:(id)a3;
- (void)cancelModalFlow;
- (void)configurePeriocularEnabled:(BOOL)a3;
- (void)dealloc;
- (void)deleteAllIdentities;
- (void)deleteFaceIDIdentitiesCheckWithSpecifier:(id)a3;
- (void)enroll:(id)a3;
- (void)enrollBiometric;
- (void)enrollGlassesForExistingAppearance:(id)a3;
- (void)enrollPeriocularForExistingAppearance:(id)a3;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)faceIDEnrollmentCoordinator:(id)a3 finishedEnrollmentWithError:(id)a4;
- (void)faceIDEnrollmentCoordinatorDidDismiss:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
- (void)pearlLearnMoreTapped:(id)a3;
- (void)popPearlEnrollmentController;
- (void)presentAlertForAlternateAppearanceIfNecessary:(id)a3;
- (void)presentAlertForDeletingPearlIdentities;
- (void)presentSecondAlertForDeletingMatchedBiometricTemplate;
- (void)proceedToEnrollGlassesForExistingAppearance:(id)a3;
- (void)proceedToEnrollPeriocularForExistingAppearance:(id)a3;
- (void)proceedToEnrollWithSpecifier:(id)a3;
- (void)proceedWithChecksToDeleteFaceIDWithSpecifier:(id)a3;
- (void)pushPasscodePane;
- (void)refetchBiometricTemplateWithSpecifier:(id)a3 action:(id)a4;
- (void)setAttentionGroupController:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4;
- (void)setCurrentlyPresentingPearlEnrollSpecifier:(id)a3;
- (void)setDtoController:(id)a3;
- (void)setEnrollFaceSpecifier:(id)a3;
- (void)setFaceIDEnrollmentCoordinator:(id)a3;
- (void)setIsEnrollingInPeriocular:(BOOL)a3;
- (void)setPeriocularFaceIDMatchEnabled:(id)a3 specifier:(id)a4;
- (void)setPresenter:(id)a3;
- (void)specifiers;
- (void)toggleToState:(BOOL)a3 forIdentifier:(id)a4;
- (void)validateBiometricTemplateUUIDAndEnroll:(id)a3;
- (void)validateBiometricTemplateUUIDWithSpecifier:(id)a3 action:(id)a4;
@end

@implementation PSUIPearlPasscodeController

- (PSUIPearlPasscodeController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSUIPearlPasscodeController;
  v2 = [(PSUIBiometricController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_reloadSpecifiers name:@"PSUIBiometricsDidUpdate" object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_backgrounded_ name:*MEMORY[0x263F83330] object:0];

    uint64_t v5 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if ([(PSUIBiometricController *)self isObservingBiometricTemplateFetchingStatus])
  {
    [(PSUIPearlPasscodeController *)self removeObserver:self forKeyPath:@"currentBiometricTemplateFetchStatus"];
  }
  [(LAContext *)self->_authContext invalidate];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"PSUIBiometricsDidUpdate" object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83330] object:0];

  v5.receiver = self;
  v5.super_class = (Class)PSUIPearlPasscodeController;
  [(PSUIPasscodeLockController *)&v5 dealloc];
}

- (void)backgrounded:(id)a3
{
  id v4 = a3;
  [(PSUIBiometricController *)self cancelModalFlowWithCompletion:0];
  [(PSUIPearlPasscodeController *)self popPearlEnrollmentController];
  objc_super v5 = [(PSUIPearlPasscodeController *)self presenter];
  v6 = [v5 splashController];

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = [(PSUIPearlPasscodeController *)self presenter];
    objc_super v8 = [v7 splashController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__PSUIPearlPasscodeController_backgrounded___block_invoke;
    v9[3] = &unk_264E954A8;
    objc_copyWeak(&v10, &location);
    [v8 dismissViewControllerAnimated:0 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __44__PSUIPearlPasscodeController_backgrounded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresenter:0];
}

- (void)popPearlEnrollmentController
{
  v3 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
  id v4 = [v3 presentedViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(PSUIPearlPasscodeController *)self setFaceIDEnrollmentCoordinator:0];
}

- (void)enrollBiometric
{
}

- (void)validateBiometricTemplateUUIDWithSpecifier:(id)a3 action:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_super v8 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    unint64_t v13 = [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus];
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Current biometric template fetch status: %ld", (uint8_t *)&v12, 0xCu);
  }

  switch([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus])
  {
    case 0uLL:
    case 3uLL:
      v9 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "Refetching biometric templates", (uint8_t *)&v12, 2u);
      }

      [(PSUIPearlPasscodeController *)self refetchBiometricTemplateWithSpecifier:v6 action:v7];
      break;
    case 1uLL:
      v11 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "Still in process of fetching biometric templates, wait for it to finish", (uint8_t *)&v12, 2u);
      }

      [(PSListController *)self configureSpin:1 ofCellForSpecifier:v6 setEnabled:0];
      if (![(PSUIBiometricController *)self isObservingBiometricTemplateFetchingStatus])
      {
        [(PSUIPearlPasscodeController *)self addObserver:self forKeyPath:@"currentBiometricTemplateFetchStatus" options:1 context:@"BiometricTemplateFetchingState"];
        [(PSUIBiometricController *)self setIsObservingBiometricTemplateFetchingStatus:1];
      }
      break;
    case 2uLL:
    case 4uLL:
      id v10 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "Finished fetching biometric templates, check to see if need to present alert for alternate appearance", (uint8_t *)&v12, 2u);
      }

      v7[2](v7);
      break;
    default:
      break;
  }
}

- (void)validateBiometricTemplateUUIDAndEnroll:(id)a3
{
  id v4 = a3;
  objc_super v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Set Up an Alternate Appearance", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __70__PSUIPearlPasscodeController_validateBiometricTemplateUUIDAndEnroll___block_invoke;
  v11 = &unk_264E95380;
  objc_copyWeak(&v13, buf);
  id v6 = v4;
  id v12 = v6;
  v7 = _Block_copy(&v8);
  -[PSUIPearlPasscodeController validateBiometricTemplateUUIDWithSpecifier:action:](self, "validateBiometricTemplateUUIDWithSpecifier:action:", v6, v7, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __70__PSUIPearlPasscodeController_validateBiometricTemplateUUIDAndEnroll___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentAlertForAlternateAppearanceIfNecessary:*(void *)(a1 + 32)];
}

- (void)refetchBiometricTemplateWithSpecifier:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PSListController *)self configureSpin:1 ofCellForSpecifier:v6 setEnabled:0];
  objc_initWeak(&location, self);
  uint64_t v8 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Start refetching biometric templates", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke;
  v11[3] = &unk_264E954D0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(PSUIBiometricController *)self fetchBiometricTemplateUUIDsWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    uint64_t v5 = [v4 currentBiometricTemplateFetchStatus];
    id v6 = PSUILogForCategory(1uLL);
    id v7 = v6;
    if (v5 == 3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke_cold_1();
      }

      [v4 refetchBiometricTemplateWithSpecifier:*(void *)(a1 + 32) action:*(void *)(a1 + 40)];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Configure alert for alternate appearance", v8, 2u);
      }

      [v4 configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 32) setEnabled:1];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (BOOL)hasMatchingBiometricTemplate
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Checking biometric identify for matched biometric template", buf, 2u);
  }

  v3 = +[PSUIBiometrics sharedInstance];
  id v4 = [v3 identitiesForIdentityType:2];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    char v22 = 0;
    uint64_t v23 = *(void *)v30;
    *(void *)&long long v6 = 138412546;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = [(PSUIBiometricController *)self storedBiometricTemplates];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              v16 = [v9 uuid];
              int v17 = [v15 isEqual:v16];

              if (v17)
              {
                v18 = PSUILogForCategory(1uLL);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v20;
                  v34 = v9;
                  __int16 v35 = 2112;
                  v36 = v15;
                  _os_log_impl(&dword_23D33A000, v18, OS_LOG_TYPE_DEFAULT, "Found matching BKIdentity: %@ matches UUID:%@ in stored biometric templates", buf, 0x16u);
                }

                char v22 = 1;
                goto LABEL_20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    char v22 = 0;
  }

  return v22 & 1;
}

- (void)presentAlertForAlternateAppearanceIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUIBiometricController *)self storedBiometricTemplates];
  if (![v5 count])
  {

    goto LABEL_8;
  }
  unint64_t v6 = [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus];

  if (v6 == 4)
  {
LABEL_8:
    uint64_t v8 = PSUILogForCategory(1uLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      [(PSUIPearlPasscodeController *)self enroll:v4];
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    int v17 = "No stored biometric templates, start enrolling process";
LABEL_10:
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    goto LABEL_11;
  }
  BOOL v7 = [(PSUIPearlPasscodeController *)self hasMatchingBiometricTemplate];
  uint64_t v8 = PSUILogForCategory(1uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v9) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    int v17 = "Did not found matching biometric template for enrolled faceID, proceed to enroll alternate appearance";
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Found matching biometric template for enrolled faceID, presenting alert", buf, 2u);
  }

  id v10 = (void *)MEMORY[0x263F82418];
  uint64_t v11 = PSLocalizablePearlStringForKey();
  uint64_t v12 = PSLocalizablePearlStringForKey();
  uint64_t v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

  id v14 = (void *)MEMORY[0x263F82400];
  v15 = PSLocalizablePearlStringForKey();
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  long long v20 = __77__PSUIPearlPasscodeController_presentAlertForAlternateAppearanceIfNecessary___block_invoke;
  v21 = &unk_264E954F8;
  char v22 = self;
  id v23 = v4;
  v16 = [v14 actionWithTitle:v15 style:0 handler:&v18];
  objc_msgSend(v13, "addAction:", v16, v18, v19, v20, v21, v22);

  [(PSUIPearlPasscodeController *)self presentViewController:v13 animated:1 completion:0];
LABEL_12:
}

uint64_t __77__PSUIPearlPasscodeController_presentAlertForAlternateAppearanceIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enroll:*(void *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (a6 == @"BiometricTemplateFetchingState")
  {
    uint64_t v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus];
      _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "In KVO, current biometric template fetch status: %ld", buf, 0xCu);
    }

    if ([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] == 2)
    {
      uint64_t v12 = [(PSUIPearlPasscodeController *)self specifierForID:@"UPDATE_APPEARANCE"];
      uint64_t v13 = v12;
      id v14 = (void *)MEMORY[0x263F602B0];
      if (v12)
      {
        v15 = [v12 propertyForKey:*MEMORY[0x263F602B0]];
        if (([v15 cellEnabled] & 1) == 0)
        {
          v16 = PSUILogForCategory(1uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23D33A000, v16, OS_LOG_TYPE_DEFAULT, "In KVO, continue validating biometric template for updating appearance", buf, 2u);
          }

          [(PSListController *)self configureSpin:0 ofCellForSpecifier:v13 setEnabled:1];
          [(PSUIPearlPasscodeController *)self validateBiometricTemplateUUIDAndEnroll:v13];
        }
      }
      int v17 = [(PSUIPearlPasscodeController *)self specifierForID:@"PEARL_REMOVE_FACE"];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 propertyForKey:*v14];
        if (([v19 cellEnabled] & 1) == 0)
        {
          long long v20 = PSUILogForCategory(1uLL);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23D33A000, v20, OS_LOG_TYPE_DEFAULT, "In KVO, continue validating biometric template for resetting faceID", buf, 2u);
          }

          [(PSListController *)self configureSpin:0 ofCellForSpecifier:v18 setEnabled:1];
          [(PSUIPearlPasscodeController *)self deleteFaceIDIdentitiesCheckWithSpecifier:v18];
        }
      }
      [(PSUIPearlPasscodeController *)self removeObserver:self forKeyPath:v10];
      [(PSUIBiometricController *)self setIsObservingBiometricTemplateFetchingStatus:0];
    }
    else if ([(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] == 3)
    {
      [(PSUIBiometricController *)self fetchBiometricTemplateUUIDsWithCompletion:0];
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PSUIPearlPasscodeController;
    [(PSUIPearlPasscodeController *)&v21 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)enroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Set up Face ID/an Alternate Appearance", (uint8_t *)buf, 2u);
  }

  unint64_t v6 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];

  if (v6)
  {
    BOOL v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = [(PSUIPearlPasscodeController *)self dtoController];
    int v9 = [v8 isRatchetEnabled];

    if (v9)
    {
      objc_initWeak(buf, self);
      id v10 = [(PSUIPearlPasscodeController *)self dtoController];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__PSUIPearlPasscodeController_enroll___block_invoke;
      v11[3] = &unk_264E95520;
      objc_copyWeak(&v13, buf);
      id v12 = v4;
      [v10 gateWithRatchetForOperation:1 forPresentingVC:self completion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      [(PSUIPearlPasscodeController *)self proceedToEnrollWithSpecifier:v4];
    }
  }
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __38__PSUIPearlPasscodeController_enroll___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38__PSUIPearlPasscodeController_enroll___block_invoke_106;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_106(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment", v5, 2u);
    }

    [WeakRetained proceedToEnrollWithSpecifier:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__PSUIPearlPasscodeController_enroll___block_invoke_106_cold_1();
    }
  }
}

- (void)proceedToEnrollWithSpecifier:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke;
  aBlock[3] = &unk_264E95548;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x263F53C50] sharedConnection];
  int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F537D8]];

  if (v7 == 2)
  {
    uint64_t v8 = (void *)MEMORY[0x263F82418];
    int v9 = PSLocalizablePearlStringForKey();
    id v10 = PSLocalizablePearlStringForKey();
    uint64_t v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    id v12 = (void *)MEMORY[0x263F82400];
    id v13 = PSLocalizablePearlStringForKey();
    id v14 = [v12 actionWithTitle:v13 style:0 handler:0];
    [v11 addAction:v14];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke_2;
    v30[3] = &unk_264E95570;
    v30[4] = self;
    id v31 = v5;
    [(PSUIPearlPasscodeController *)self presentViewController:v11 animated:1 completion:v30];
    v15 = v31;
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v16 = +[PSUIBiometrics sharedInstance];
      unsigned int v17 = [v16 isPeriocularEnrollmentSupported];

      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v19 = [[PSUIFaceIDEnrollmentCoordinator alloc] initWithPresentingViewController:self configuration:v18];
    [(PSUIPearlPasscodeController *)self setFaceIDEnrollmentCoordinator:v19];

    long long v20 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
    [v20 setDelegate:self];

    (*((void (**)(void *, void))v5 + 2))(v5, 0);
    uint64_t v11 = [(PSUIPearlPasscodeController *)self cachedCellForSpecifier:v4];
    v15 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v11 setAccessoryView:v15];
    [v11 setCellEnabled:0];
    [v11 setNeedsDisplay];
    [v15 startAnimating];
    objc_super v21 = [(PSUIPearlPasscodeController *)self specifier];

    if (!v21)
    {
      char v22 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PSUIPearlPasscodeController proceedToEnrollWithSpecifier:]();
      }
    }
    unint64_t v23 = [(PSUIPearlPasscodeController *)self specifier];
    uint64_t v24 = *MEMORY[0x263F60270];
    long long v25 = [v23 objectForKeyedSubscript:*MEMORY[0x263F60270]];

    if (!v25)
    {
      long long v26 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PSUIPearlPasscodeController proceedToEnrollWithSpecifier:]();
      }
    }
    long long v27 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
    long long v28 = [(PSUIPearlPasscodeController *)self specifier];
    long long v29 = [v28 objectForKeyedSubscript:v24];
    [v27 startWithPasscode:v29];
  }
  [(PSUIPearlPasscodeController *)self setCurrentlyPresentingPearlEnrollSpecifier:v4];
}

void __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "specifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(a1 + 32) cachedCellForSpecifier:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 setUserInteractionEnabled:a2];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 setCurrentlyPresentingPearlEnrollSpecifier:0];
}

- (BOOL)isEnrolled
{
  v2 = +[PSUIBiometrics sharedInstance];
  v3 = [v2 identitiesForIdentityType:2];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)pearlEnrollSpecifiers
{
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(PSUIPearlPasscodeController *)self isEnrolled];
  uint64_t v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x263F5FC40];
    uint64_t v7 = PSLocalizablePearlStringForKey();
    enrollFaceSpecifier = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [enrollFaceSpecifier setButtonAction:sel_deleteFaceIDIdentitiesCheckWithSpecifier_];
    uint64_t v9 = *MEMORY[0x263F60138];
    [enrollFaceSpecifier setProperty:@"PEARL_REMOVE_FACE" forKey:*MEMORY[0x263F60138]];
    long long v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"));
    uint64_t v11 = *MEMORY[0x263F600A8];
    [enrollFaceSpecifier setProperty:v10 forKey:*MEMORY[0x263F600A8]];

    if ([(PSUIPearlPasscodeController *)self hasReachedMaximumBiometricEnrollmentCount])
    {
      long long v12 = PSLocalizablePearlStringForKey();
      [v5 setProperty:v12 forKey:*MEMORY[0x263F600F8]];

      [v3 addObject:v5];
      [v3 addObject:enrollFaceSpecifier];
    }
    else
    {
      uint64_t v18 = PSLocalizablePearlStringForKey();
      [v5 setProperty:v18 forKey:*MEMORY[0x263F600F8]];

      [v3 addObject:v5];
      uint64_t v19 = (void *)MEMORY[0x263F5FC40];
      long long v20 = PSLocalizablePearlStringForKey();
      objc_super v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v21 setButtonAction:sel_validateBiometricTemplateUUIDAndEnroll_];
      [v21 setProperty:@"UPDATE_APPEARANCE" forKey:v9];
      char v22 = NSNumber;
      if ([(PSUIBiometricController *)self isBiometricEditingAllowed]) {
        uint64_t v23 = PSIsPearlInterlocked() ^ 1;
      }
      else {
        uint64_t v23 = 0;
      }
      long long v25 = [v22 numberWithInt:v23];
      [v21 setProperty:v25 forKey:v11];

      long long v26 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIPearlPasscodeController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
      [v21 setProperty:v26 forKey:v11];

      [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
      [v3 addObject:v21];
      long long v27 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v3 addObject:v27];

      [v3 addObject:enrollFaceSpecifier];
    }
  }
  else
  {
    [v3 addObject:v5];
    long long v13 = (void *)MEMORY[0x263F5FC40];
    id v14 = PSLocalizablePearlStringForKey();
    uint64_t v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v15 setButtonAction:sel_enroll_];
    [v15 setProperty:@"PEARL_ENROLL" forKey:*MEMORY[0x263F60138]];
    v16 = NSNumber;
    if ([(PSUIBiometricController *)self isBiometricEditingAllowed]) {
      uint64_t v17 = PSIsPearlInterlocked() ^ 1;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v24 = [v16 numberWithInt:v17];
    [v15 setProperty:v24 forKey:*MEMORY[0x263F600A8]];

    [v3 addObject:v15];
    enrollFaceSpecifier = self->_enrollFaceSpecifier;
    self->_enrollFaceSpecifier = (PSSpecifier *)v15;
  }

  long long v28 = (void *)[v3 copy];
  return v28;
}

- (BOOL)hasReachedMaximumBiometricEnrollmentCount
{
  v2 = +[PSUIBiometrics sharedInstance];
  uint64_t v3 = [v2 maximumIdentityCountForIdentityType:2];

  BOOL v4 = +[PSUIBiometrics sharedInstance];
  uint64_t v5 = [v4 identitiesForIdentityType:2];
  uint64_t v6 = [v5 count];

  return v6 >= v3;
}

- (void)setPeriocularFaceIDMatchEnabled:(id)a3 specifier:(id)a4
{
  id v11 = a4;
  int v6 = [a3 BOOLValue];
  uint64_t v7 = +[PSUIBiometrics sharedInstance];
  uint64_t v8 = [v7 identitiesForIdentityType:2];

  if (!v6)
  {
    uint64_t v9 = self;
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "na_any:", &__block_literal_global))
  {
    uint64_t v9 = self;
    uint64_t v10 = 1;
LABEL_5:
    [(PSUIPearlPasscodeController *)v9 configurePeriocularEnabled:v10];
    [(PSUIPearlPasscodeController *)self reloadSpecifiers];
    goto LABEL_7;
  }
  [(PSUIPearlPasscodeController *)self enrollPeriocularForExistingAppearance:v11];
LABEL_7:
}

uint64_t __73__PSUIPearlPasscodeController_setPeriocularFaceIDMatchEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment];
}

- (id)isPeriocularFaceIDMatchEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(PSUIPearlPasscodeController *)self isPeriocularEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (void)enrollGlassesForExistingAppearance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Add Glasses", (uint8_t *)buf, 2u);
  }

  int v6 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];

  if (v6)
  {
    uint64_t v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling with Add Glasses as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = [(PSUIPearlPasscodeController *)self dtoController];
    int v9 = [v8 isRatchetEnabled];

    if (v9)
    {
      objc_initWeak(buf, self);
      uint64_t v10 = [(PSUIPearlPasscodeController *)self dtoController];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke;
      v11[3] = &unk_264E95520;
      objc_copyWeak(&v13, buf);
      id v12 = v4;
      [v10 gateWithRatchetForOperation:3 forPresentingVC:self completion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      [(PSUIPearlPasscodeController *)self proceedToEnrollGlassesForExistingAppearance:v4];
    }
  }
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_144;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_144(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment with Add Glasses", v5, 2u);
    }

    [WeakRetained proceedToEnrollGlassesForExistingAppearance:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_144_cold_1();
    }
  }
}

- (void)proceedToEnrollGlassesForExistingAppearance:(id)a3
{
  id v4 = [[PSUIFaceIDEnrollmentCoordinator alloc] initWithPresentingViewController:self configuration:3];
  [(PSUIPearlPasscodeController *)self setFaceIDEnrollmentCoordinator:v4];

  id v5 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
  [v5 setDelegate:self];

  id v6 = [(PSUIPearlPasscodeController *)self specifier];

  if (!v6)
  {
    uint64_t v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController proceedToEnrollGlassesForExistingAppearance:]();
    }
  }
  uint64_t v8 = [(PSUIPearlPasscodeController *)self specifier];
  uint64_t v9 = *MEMORY[0x263F60270];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60270]];

  if (!v10)
  {
    id v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController proceedToEnrollGlassesForExistingAppearance:]();
    }
  }
  id v12 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
  id v13 = [(PSUIPearlPasscodeController *)self specifier];
  id v14 = [v13 objectForKeyedSubscript:v9];
  [v12 startWithPasscode:v14];
}

- (void)toggleToState:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 name];
    uint64_t v9 = [NSNumber numberWithBool:v4];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "%@: Auto toggling to state [%@]", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [NSNumber numberWithBool:v4];
  [v6 setProperty:v10 forKey:*MEMORY[0x263F60308]];

  id v11 = [v6 identifier];
  [(PSUIPearlPasscodeController *)self reloadSpecifierID:v11 animated:1];
}

- (void)enrollPeriocularForExistingAppearance:(id)a3
{
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User toggled to ON - Face ID with a Mask", (uint8_t *)buf, 2u);
  }

  id v6 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];

  if (v6)
  {
    uint64_t v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling periocular for existing appearance as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = [(PSUIPearlPasscodeController *)self dtoController];
    int v9 = [v8 isRatchetEnabled];

    if (v9)
    {
      objc_initWeak(buf, self);
      uint64_t v10 = [(PSUIPearlPasscodeController *)self dtoController];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke;
      v11[3] = &unk_264E95520;
      objc_copyWeak(&v13, buf);
      id v12 = v4;
      [v10 gateWithRatchetForOperation:2 forPresentingVC:self completion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      [(PSUIPearlPasscodeController *)self proceedToEnrollPeriocularForExistingAppearance:v4];
    }
  }
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2;
  block[3] = &unk_264E955B8;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v6);
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 48) == 2)
  {
    uint64_t v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_1();
    }

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
LABEL_12:
    [v5 toggleToState:0 forIdentifier:v4];
    goto LABEL_13;
  }
  id v6 = PSUILogForCategory(1uLL);
  uint64_t v7 = v6;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_2();
    }

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment of periocular for existing appearance", v8, 2u);
  }

  [WeakRetained proceedToEnrollPeriocularForExistingAppearance:*(void *)(a1 + 32)];
LABEL_13:
}

- (void)proceedToEnrollPeriocularForExistingAppearance:(id)a3
{
  uint64_t v4 = [[PSUIFaceIDEnrollmentCoordinator alloc] initWithPresentingViewController:self configuration:2];
  [(PSUIPearlPasscodeController *)self setFaceIDEnrollmentCoordinator:v4];

  id v5 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
  [v5 setDelegate:self];

  id v6 = [(PSUIPearlPasscodeController *)self specifier];

  if (!v6)
  {
    uint64_t v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController proceedToEnrollPeriocularForExistingAppearance:]();
    }
  }
  uint64_t v8 = [(PSUIPearlPasscodeController *)self specifier];
  uint64_t v9 = *MEMORY[0x263F60270];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60270]];

  if (!v10)
  {
    id v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController proceedToEnrollPeriocularForExistingAppearance:]();
    }
  }
  id v12 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
  id v13 = [(PSUIPearlPasscodeController *)self specifier];
  __int16 v14 = [v13 objectForKeyedSubscript:v9];
  [v12 startWithPasscode:v14];
}

- (unint64_t)currentPeriocularEnrollmentState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = +[PSUIBiometrics sharedInstance];
  uint64_t v3 = [v2 identitiesForIdentityType:2];

  uint64_t v4 = +[PSUIBiometrics sharedInstance];
  uint64_t v5 = [v4 maximumIdentityCountForIdentityType:2];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hasPeriocularEnrollment", (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);

    if (v9 == 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = 2 * (v9 == v5);
    }
  }
  else
  {

    unint64_t v12 = 2 * (v5 == 0);
  }

  return v12;
}

- (void)configurePeriocularEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = +[PSUIBiometrics sharedInstance];
  id v6 = [v5 deviceForType:2];

  uint64_t v7 = [(PSUIPearlPasscodeController *)self authContext];
  unint64_t v12 = &unk_26F1131C0;
  v13[0] = &unk_26F1131D8;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = (id)[v7 evaluatePolicy:1007 options:v8 error:0];

  uint64_t v10 = [(PSUIPearlPasscodeController *)self authContext];
  id v11 = [v10 externalizedContext];

  [MEMORY[0x263F2AAA0] setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:v6 credentialSet:v11 enabled:v3];
}

- (BOOL)isPeriocularEnabled
{
  v2 = +[PSUIBiometrics sharedInstance];
  BOOL v3 = [v2 deviceForType:2];

  uint64_t v10 = 0;
  uint64_t v4 = [v3 protectedConfigurationForUser:getuid() error:&v10];
  uint64_t v5 = v4;
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

- (unint64_t)numberOfAppsUsingPearl
{
  v2 = (void *)TCCAccessCopyInformation();
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)numberOfAppsUsingPearlDescription:(id)a3
{
  unint64_t v3 = [(PSUIPearlPasscodeController *)self numberOfAppsUsingPearl];
  if (v3)
  {
    unint64_t v4 = v3;
    if (v3 == 2 || v3 == 1)
    {
      PSLocalizablePearlStringForKey();
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = objc_opt_new();
      uint64_t v8 = NSString;
      id v9 = PSLocalizablePearlStringForKey();
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:v4];
      id v11 = [v7 stringFromNumber:v10];
      objc_msgSend(v8, "stringWithFormat:", v9, v11);
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController numberOfAppsUsingPearlDescription:]();
    }

    BOOL v6 = &stru_26F10E0E8;
  }
  return v6;
}

- (id)headerForUseBiometricSection
{
  return (id)PSLocalizablePearlStringForKey();
}

- (id)biometricNameDescription
{
  return (id)PSLocalizablePearlStringForKey();
}

- (void)pearlLearnMoreTapped:(id)a3
{
  unint64_t v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.faceid"];
  [(PSUIPearlPasscodeController *)self setPresenter:v4];

  uint64_t v5 = [(PSUIPearlPasscodeController *)self presenter];
  [v5 setPresentingViewController:self];

  id v6 = [(PSUIPearlPasscodeController *)self presenter];
  [v6 present];
}

- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUIPearlPasscodeController;
  [(PSUIBiometricController *)&v10 setBiometricUnlockEnabled:v6 specifier:a4];
  if (v6)
  {
    char v7 = [(PSUIPearlPasscodeController *)self authContext];
    id v11 = &unk_26F1131C0;
    v12[0] = &unk_26F1131D8;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = (id)[v7 evaluatePolicy:1007 options:v8 error:0];
  }
  -[PSUIPasscodeLockController updatePhoneAutounlockSection:](self, "updatePhoneAutounlockSection:", [v6 BOOLValue]);
}

- (LAContext)authContext
{
  authContext = self->_authContext;
  if (!authContext)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    unint64_t v4 = (void *)getLAContextClass_softClass;
    uint64_t v13 = getLAContextClass_softClass;
    if (!getLAContextClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getLAContextClass_block_invoke;
      v9[3] = &unk_264E95420;
      void v9[4] = &v10;
      __getLAContextClass_block_invoke((uint64_t)v9);
      unint64_t v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (LAContext *)objc_opt_new();
    char v7 = self->_authContext;
    self->_authContext = v6;

    [(LAContext *)self->_authContext setUiDelegate:self];
    authContext = self->_authContext;
  }
  return authContext;
}

- (id)biometricLogo
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  if (v4 >= 3.0) {
    goto LABEL_3;
  }
  id v5 = (void *)MEMORY[0x263F827E8];
  id v6 = PSPreferencesUIFrameworkBundle();
  char v7 = [v5 imageNamed:@"faceID-header@2x-n84.png" inBundle:v6];
  uint64_t v8 = [MEMORY[0x263F825C8] systemGrayColor];
  id v9 = [v7 _flatImageWithColor:v8];

  if (!v9)
  {
LABEL_3:
    uint64_t v10 = (void *)MEMORY[0x263F827E8];
    id v11 = PSPreferencesUIFrameworkBundle();
    uint64_t v12 = [v10 imageNamed:@"faceID-header" inBundle:v11];
    uint64_t v13 = [MEMORY[0x263F825C8] systemGrayColor];
    id v9 = [v12 _flatImageWithColor:v13];
  }
  return v9;
}

- (id)biometricTableViewHeader
{
  if (PSIsPearlInterlocked())
  {
    double v3 = objc_opt_new();
    double v4 = [(PSUIPearlPasscodeController *)self view];
    [v4 bounds];
    double v6 = v5;

    [v3 heightForWidth:v6];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PSUIPearlPasscodeController;
    double v3 = [(PSUIBiometricController *)&v9 biometricTableViewHeader];
  }
  return v3;
}

- (id)resetFaceIDSpecifier
{
  double v3 = (void *)MEMORY[0x263F5FC40];
  double v4 = PSLocalizablePearlStringForKey();
  double v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel_deleteFaceIDIdentitiesCheckWithSpecifier_];
  [v5 setIdentifier:@"PEARL_REMOVE_FACE"];
  double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"));
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600A8]];

  return v5;
}

- (id)setupFaceIDSpecifier
{
  double v3 = (void *)MEMORY[0x263F5FC40];
  double v4 = PSLocalizablePearlStringForKey();
  double v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel_enroll_];
  [v5 setIdentifier:@"PEARL_ENROLL"];
  double v6 = NSNumber;
  if ([(PSUIBiometricController *)self isBiometricEditingAllowed]) {
    uint64_t v7 = PSIsPearlInterlocked() ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v6 numberWithInt:v7];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600A8]];

  return v5;
}

- (id)setupAlternateAppearanceSpecifier
{
  double v3 = (void *)MEMORY[0x263F5FC40];
  double v4 = PSLocalizablePearlStringForKey();
  double v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel_validateBiometricTemplateUUIDAndEnroll_];
  [v5 setIdentifier:@"UPDATE_APPEARANCE"];
  double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIPearlPasscodeController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  return v5;
}

- (id)unlockWithFaceMaskSpecifier
{
  double v3 = +[PSUIBiometrics sharedInstance];
  double v4 = [v3 identitiesForIdentityType:2];

  double v5 = objc_msgSend(v4, "na_reduceWithInitialValue:reducer:", &unk_26F1131D8, &__block_literal_global_186);
  double v6 = (void *)MEMORY[0x263F5FC40];
  uint64_t v7 = PSUI_LocalizedStringForPearlPeriocular(@"UNLOCK_WITH_FACE_MASK");
  uint64_t v8 = [v6 preferenceSpecifierNamed:v7 target:self set:sel_setPeriocularFaceIDMatchEnabled_specifier_ get:sel_isPeriocularFaceIDMatchEnabled_ detail:0 cell:6 edit:0];

  [v8 setIdentifier:@"UNLOCK_WITH_FACE_MASK"];
  [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v8 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  if ([v5 integerValue]
    && [(PSUIPearlPasscodeController *)self isPeriocularEnabled])
  {
    objc_super v9 = NSString;
    uint64_t v10 = PSUI_LocalizedStringForPearlPeriocular(@"GLASSES_COUNT_SECONDARY_LABEL");
    id v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v5, "integerValue"));
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  else
  {
    [v8 setObject:0 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }

  return v8;
}

uint64_t __58__PSUIPearlPasscodeController_unlockWithFaceMaskSpecifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 secondaryPeriocularEnrollments];
  uint64_t v7 = [v5 integerValue];

  return [v4 numberWithInteger:v7 + v6];
}

- (id)addGlassesSpecifier
{
  double v3 = (void *)MEMORY[0x263F5FC40];
  double v4 = PSUI_LocalizedStringForPearlPeriocular(@"ADD_GLASSES");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setIdentifier:@"ADD_GLASSES"];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v5 setButtonAction:sel_enrollGlassesForExistingAppearance_];
  return v5;
}

- (id)enrollPeriocularAlternateAppearanceSpecifier
{
  double v3 = (void *)MEMORY[0x263F5FC40];
  double v4 = PSUI_LocalizedStringForPearlPeriocular(@"UNLOCK_WITH_FACE_MASK_ALTERNATE");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setIdentifier:@"UNLOCK_WITH_FACE_MASK_ALTERNATE"];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v5 setButtonAction:sel_enrollPeriocularForExistingAppearance_];
  return v5;
}

- (id)faceIDSpecifiersWithPeriocular
{
  double v3 = [MEMORY[0x263EFF980] array];
  if ([(PSUIPearlPasscodeController *)self isEnrolled])
  {
    double v4 = +[PSUIBiometrics sharedInstance];
    id v5 = [v4 identitiesForIdentityType:2];

    int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_209);
    int v7 = objc_msgSend(v5, "na_all:", &__block_literal_global_211);
    if ([(PSUIPearlPasscodeController *)self hasReachedMaximumBiometricEnrollmentCount])
    {
      char v8 = objc_msgSend(v5, "na_all:", &__block_literal_global_213);
      objc_super v9 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      uint64_t v10 = PSUI_LocalizedStringForPearlPeriocular(@"UNLOCK_WITH_FACE_MASK_FOOTER");
      uint64_t v11 = *MEMORY[0x263F600F8];
      [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600F8]];

      [v3 addObject:v9];
      uint64_t v12 = [(PSUIPearlPasscodeController *)self unlockWithFaceMaskSpecifier];
      [v3 addObject:v12];

      if ((v7 & v6) == 1 && [(PSUIPearlPasscodeController *)self isPeriocularEnabled])
      {
        uint64_t v13 = [(PSUIPearlPasscodeController *)self addGlassesSpecifier];
        [v3 addObject:v13];
      }
      if ((v8 & 1) == 0)
      {
        long long v14 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        long long v15 = PSUI_LocalizedStringForPearlPeriocular(@"UNLOCK_WITH_FACE_MASK_ALTERNATE_FOOTER");
        [v14 setObject:v15 forKeyedSubscript:v11];

        [v3 addObject:v14];
        long long v16 = [(PSUIPearlPasscodeController *)self enrollPeriocularAlternateAppearanceSpecifier];
        [v3 addObject:v16];
      }
      long long v17 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      uint64_t v18 = PSLocalizablePearlStringForKey();
      [v17 setObject:v18 forKeyedSubscript:v11];

      [v3 addObject:v17];
    }
    else
    {
      objc_super v9 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      long long v20 = PSLocalizablePearlStringForKey();
      uint64_t v21 = *MEMORY[0x263F600F8];
      [v9 setObject:v20 forKeyedSubscript:*MEMORY[0x263F600F8]];

      [v3 addObject:v9];
      char v22 = [(PSUIPearlPasscodeController *)self setupAlternateAppearanceSpecifier];
      [v3 addObject:v22];

      long long v17 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      uint64_t v23 = PSUI_LocalizedStringForPearlPeriocular(@"UNLOCK_WITH_FACE_MASK_FOOTER");
      [v17 setObject:v23 forKeyedSubscript:v21];

      [v3 addObject:v17];
      uint64_t v24 = [(PSUIPearlPasscodeController *)self unlockWithFaceMaskSpecifier];
      [v3 addObject:v24];

      if ((v7 & v6) == 1 && [(PSUIPearlPasscodeController *)self isPeriocularEnabled])
      {
        long long v25 = [(PSUIPearlPasscodeController *)self addGlassesSpecifier];
        [v3 addObject:v25];
      }
      long long v26 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v3 addObject:v26];
    }
    long long v27 = [(PSUIPearlPasscodeController *)self resetFaceIDSpecifier];
    [v3 addObject:v27];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v3 addObject:v19];

    id v5 = [(PSUIPearlPasscodeController *)self setupFaceIDSpecifier];
    [v3 addObject:v5];
  }

  long long v28 = (void *)[v3 copy];
  return v28;
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment];
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canAddPeriocularEnrollment];
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment];
}

- (id)faceIDSpecifiers
{
  double v3 = [MEMORY[0x263EFF980] array];
  if ([(PSUIPearlPasscodeController *)self isEnrolled])
  {
    BOOL v4 = [(PSUIPearlPasscodeController *)self hasReachedMaximumBiometricEnrollmentCount];
    id v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    PSLocalizablePearlStringForKey();
    if (v4) {
      int v6 = {;
    }
      [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600F8]];

      [v3 addObject:v5];
    }
    else {
      char v8 = {;
    }
      [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600F8]];

      [v3 addObject:v5];
      objc_super v9 = [(PSUIPearlPasscodeController *)self setupAlternateAppearanceSpecifier];
      [v3 addObject:v9];

      uint64_t v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v3 addObject:v10];
    }
    uint64_t v11 = [(PSUIPearlPasscodeController *)self resetFaceIDSpecifier];
    [v3 addObject:v11];
  }
  else
  {
    int v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v3 addObject:v7];

    id v5 = [(PSUIPearlPasscodeController *)self setupFaceIDSpecifier];
    [v3 addObject:v5];
  }

  uint64_t v12 = (void *)[v3 copy];
  return v12;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    v41.receiver = self;
    v41.super_class = (Class)PSUIPearlPasscodeController;
    v40 = [(PSUIPasscodeLockController *)&v41 specifiers];
    int v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 6)
    {
      char v8 = [(PSUIBiometricController *)self placardSpecifier];
      [v5 addObject:v8];
    }
    objc_super v9 = [(PSUIBiometricController *)self useBiometricForSpecifiers];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = (void *)MEMORY[0x263F5B8E8];
    uint64_t v12 = [MEMORY[0x263F5B8B0] bundleWithIdentifier:@"com.apple.onboarding.faceid"];
    uint64_t v13 = [v11 flowWithBundle:v12];

    uint64_t v39 = v13;
    long long v14 = [v13 localizedButtonTitle];
    v38 = PSLocalizablePearlStringForKey();
    long long v15 = [NSString stringWithFormat:v14];
    long long v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600C0]];

    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];
    v43.id location = [v15 rangeOfString:v14];
    uint64_t v18 = NSStringFromRange(v43);
    [v10 setObject:v18 forKeyedSubscript:*MEMORY[0x263F600D0]];

    uint64_t v19 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600E0]];

    [v10 setObject:@"pearlLearnMoreTapped:" forKeyedSubscript:*MEMORY[0x263F600C8]];
    [v5 addObjectsFromArray:v9];
    if ([(PSUIPearlPasscodeController *)self isEnrolled]
      && [(PSUIPearlPasscodeController *)self numberOfAppsUsingPearl])
    {
      long long v20 = (void *)MEMORY[0x263F5FC40];
      uint64_t v21 = PSLocalizablePearlStringForKey();
      char v22 = [v20 preferenceSpecifierNamed:v21 target:self set:0 get:sel_numberOfAppsUsingPearlDescription_ detail:objc_opt_class() cell:2 edit:0];

      [v22 setIdentifier:*MEMORY[0x263F60340]];
      [v5 addObject:v22];
    }
    if (_os_feature_enabled_impl()
      && (+[PSUIBiometrics sharedInstance],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          int v24 = [v23 isPeriocularEnrollmentSupported],
          v23,
          v24))
    {
      uint64_t v25 = [(PSUIPearlPasscodeController *)self faceIDSpecifiersWithPeriocular];
    }
    else
    {
      uint64_t v25 = [(PSUIPearlPasscodeController *)self faceIDSpecifiers];
    }
    long long v26 = (void *)v25;
    [v5 addObjectsFromArray:v25];

    long long v27 = [(PSUIPearlPasscodeController *)self attentionGroupController];

    if (!v27)
    {
      long long v28 = [[PSUIPearlAttentionGroupController alloc] initWithListController:self groupSpecifier:0];
      [(PSUIPearlPasscodeController *)self setAttentionGroupController:v28];
    }
    long long v29 = [(PSUIPearlPasscodeController *)self specifier];

    if (!v29)
    {
      long long v30 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PSUIPearlPasscodeController specifiers]();
      }
    }
    id v31 = [(PSUIPearlPasscodeController *)self specifier];
    long long v32 = [v31 objectForKeyedSubscript:*MEMORY[0x263F60270]];

    if (!v32)
    {
      v33 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[PSUIPearlPasscodeController specifiers]();
      }
    }
    v34 = [(PSUIPearlPasscodeController *)self attentionGroupController];
    __int16 v35 = [v34 specifiers];
    [v5 addObjectsFromArray:v35];

    [v5 addObjectsFromArray:v40];
    v36 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PSUIPearlPasscodeController;
  id v6 = a4;
  uint64_t v7 = [(PSUIPasscodeLockController *)&v17 tableView:a3 cellForRowAtIndexPath:v6];
  char v8 = -[PSUIPearlPasscodeController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v17.receiver, v17.super_class);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_super v9 = [v8 identifier];
  if ([v9 isEqualToString:@"PEARL_REMOVE_FACE"])
  {
  }
  else
  {
    uint64_t v10 = [v8 identifier];
    int v11 = [v10 isEqualToString:@"REMOVE_GLASSES"];

    if (!v11) {
      goto LABEL_8;
    }
  }
  id v12 = v7;
  if ([v12 type] == 13)
  {
    uint64_t v13 = [MEMORY[0x263F825C8] redColor];
    long long v14 = [v12 textLabel];
    [v14 setTextColor:v13];

    goto LABEL_9;
  }

LABEL_8:
  id v15 = v7;
LABEL_9:

  return v7;
}

- (id)passcodeController
{
  v2 = objc_alloc_init(PSPearlPINController);
  return v2;
}

- (void)pushPasscodePane
{
  if ([(PSUIPasscodeLockController *)self shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests])
  {
    uint64_t v3 = [(PSUIPearlPasscodeController *)self presentedViewController];
    BOOL v4 = [v3 navigationBar];
    [v4 setBarStyle:0];

    id v5 = [v3 navigationBar];
    id v6 = objc_opt_new();
    [v5 setShadowImage:v6];

    uint64_t v7 = [v3 navigationBar];
    [v7 _setHidesShadow:0];

    char v8 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D33A000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing current view to push Passcode Change flow", buf, 2u);
    }

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke;
    v18[3] = &unk_264E952E0;
    v18[4] = self;
    [v3 dismissViewControllerAnimated:1 completion:v18];
  }
  else
  {
    objc_super v9 = [MEMORY[0x263F82670] currentDevice];
    int v10 = objc_msgSend(v9, "sf_isiPad");

    if (v10)
    {
      id v16 = objc_alloc_init(MEMORY[0x263F68048]);
      [v16 setPasscodeCreationDelegate:self];
      int v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
      id v12 = [v16 view];
      [v12 setBackgroundColor:v11];

      uint64_t v13 = [(PSUIPearlPasscodeController *)self presentedViewController];
      long long v14 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelModalFlow];
      id v15 = [v16 navigationItem];
      [v15 setLeftBarButtonItem:v14 animated:0];

      [v13 pushViewController:v16 animated:1];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)PSUIPearlPasscodeController;
      [(PSUIBiometricController *)&v17 pushPasscodePane];
    }
  }
}

void __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = PSUI_LocalizedStringForPasscodeLock(@"PMSET");
  BOOL v4 = PSUI_LocalizedStringForPasscodeLock(@"ENTER_PASSCODE_PROMPT_FACE_ID");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke_2;
  v5[3] = &unk_264E95600;
  v5[4] = *(void *)(a1 + 32);
  [v2 showLocalAuthenticationPasscodeChangeFlowFromPresentingController:v2 title:v3 passcodePrompt:v4 withCompletion:v5];
}

uint64_t __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 cancelModalFlowWithCompletion:0];
  }
  else {
    return [v2 completeModalFlow];
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8 = a5;
  if (a3 == 2)
  {
    objc_super v9 = [a4 objectForKey:&unk_26F1131F0];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      int v11 = [(PSUIPearlPasscodeController *)self specifier];

      if (!v11)
      {
        id v12 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PSUIPearlPasscodeController event:params:reply:]();
        }
      }
      uint64_t v13 = [(PSUIPearlPasscodeController *)self specifier];
      uint64_t v14 = *MEMORY[0x263F60270];
      id v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F60270]];

      if (!v15)
      {
        id v16 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PSUIPearlPasscodeController event:params:reply:]();
        }
      }
      objc_super v17 = [(PSUIPearlPasscodeController *)self authContext];
      uint64_t v18 = [(PSUIPearlPasscodeController *)self specifier];
      uint64_t v19 = [v18 objectForKeyedSubscript:v14];
      long long v20 = [v19 dataUsingEncoding:4];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __50__PSUIPearlPasscodeController_event_params_reply___block_invoke;
      v21[3] = &unk_264E95628;
      id v22 = v8;
      [v17 setCredential:v20 forProcessedEvent:2 credentialType:-1 reply:v21];
    }
  }
}

uint64_t __50__PSUIPearlPasscodeController_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F53C50] sharedConnection];
  [v6 setFingerprintUnlockAllowed:1 passcode:v5 completion:0];

  uint64_t v7 = [MEMORY[0x263F53C50] sharedConnection];
  [v7 setValue:&unk_26F1131D8 forSetting:*MEMORY[0x263F539E0]];

  [(PSUIPasscodeLockController *)self updateGracePeriodSpecifier];
  id v8 = [(PSUIPearlPasscodeController *)self specifier];

  if (!v8)
  {
    objc_super v9 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController passcodeViewController:didFinishWithPasscodeCreation:]();
    }
  }
  int v10 = PSUILogForCategory(1uLL);
  int v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "passcodeViewController:didFinishWithPasscodeCreation: Saving passcode for specifier", v15, 2u);
    }

    id v12 = [(PSUIPearlPasscodeController *)self specifier];
    [v12 setProperty:v5 forKey:*MEMORY[0x263F60270]];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController passcodeViewController:didFinishWithPasscodeCreation:]();
    }

    id v12 = [(PSUIPearlPasscodeController *)self specifier];
    [v12 removePropertyForKey:*MEMORY[0x263F60270]];
  }

  uint64_t v13 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];

  if (v13)
  {
    uint64_t v14 = [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator];
    [(PSUIPearlPasscodeController *)self faceIDEnrollmentCoordinator:v14 finishedEnrollmentWithError:0];
  }
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  return (id)PSLocalizablePearlStringForKey();
}

- (void)cancelModalFlow
{
  v2.receiver = self;
  v2.super_class = (Class)PSUIPearlPasscodeController;
  [(PSUIBiometricController *)&v2 cancelModalFlowWithCompletion:0];
}

- (BOOL)isEnrollmentAvailable
{
  uint64_t v3 = +[PSUIBiometrics sharedInstance];
  unint64_t v4 = [v3 maximumIdentityCountForIdentityType:2];

  id v5 = +[PSUIBiometrics sharedInstance];
  id v6 = [v5 identitiesForIdentityType:2];
  unint64_t v7 = [v6 count];

  if (v7 >= v4) {
    return 0;
  }
  return [(PSUIBiometricController *)self isBiometricEditingAllowed];
}

- (void)deleteFaceIDIdentitiesCheckWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Reset", (uint8_t *)buf, 2u);
  }

  id v6 = [(PSUIPearlPasscodeController *)self dtoController];
  int v7 = [v6 isRatchetEnabled];

  if (v7)
  {
    objc_initWeak(buf, self);
    id v8 = [(PSUIPearlPasscodeController *)self dtoController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke;
    v9[3] = &unk_264E95520;
    objc_copyWeak(&v11, buf);
    id v10 = v4;
    [v8 gateWithRatchetForOperation:0 forPresentingVC:self completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PSUIPearlPasscodeController *)self proceedWithChecksToDeleteFaceIDWithSpecifier:v4];
  }
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    objc_super v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_267;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_267(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Resetting", v5, 2u);
    }

    [WeakRetained proceedWithChecksToDeleteFaceIDWithSpecifier:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_267_cold_1();
    }
  }
}

- (void)proceedWithChecksToDeleteFaceIDWithSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __76__PSUIPearlPasscodeController_proceedWithChecksToDeleteFaceIDWithSpecifier___block_invoke;
  objc_super v9 = &unk_264E954A8;
  objc_copyWeak(&v10, &location);
  id v5 = _Block_copy(&v6);
  -[PSUIPearlPasscodeController validateBiometricTemplateUUIDWithSpecifier:action:](self, "validateBiometricTemplateUUIDWithSpecifier:action:", v4, v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __76__PSUIPearlPasscodeController_proceedWithChecksToDeleteFaceIDWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentAlertForDeletingPearlIdentities];
}

- (void)presentAlertForDeletingPearlIdentities
{
  if ([(PSUIPearlPasscodeController *)self hasMatchingBiometricTemplate]
    && [(PSUIBiometricController *)self currentBiometricTemplateFetchStatus] != 4)
  {
    uint64_t v3 = (void *)MEMORY[0x263F82418];
    id v4 = PSLocalizablePearlStringForKey();
    id v5 = PSLocalizablePearlStringForKey();
    uint64_t v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

    uint64_t v7 = (void *)MEMORY[0x263F82400];
    id v8 = PSLocalizablePearlStringForKey();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __69__PSUIPearlPasscodeController_presentAlertForDeletingPearlIdentities__block_invoke;
    v13[3] = &unk_264E953D0;
    v13[4] = self;
    objc_super v9 = [v7 actionWithTitle:v8 style:2 handler:v13];
    [v6 addAction:v9];

    id v10 = (void *)MEMORY[0x263F82400];
    id v11 = PSLocalizablePearlStringForKey();
    id v12 = [v10 actionWithTitle:v11 style:1 handler:0];
    [v6 addAction:v12];

    [(PSUIPearlPasscodeController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(PSUIPearlPasscodeController *)self deleteAllIdentities];
  }
}

uint64_t __69__PSUIPearlPasscodeController_presentAlertForDeletingPearlIdentities__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSecondAlertForDeletingMatchedBiometricTemplate];
}

- (void)presentSecondAlertForDeletingMatchedBiometricTemplate
{
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = PSLocalizablePearlStringForKey();
  id v5 = PSLocalizablePearlStringForKey();
  uint64_t v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x263F82400];
  id v8 = PSLocalizablePearlStringForKey();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __84__PSUIPearlPasscodeController_presentSecondAlertForDeletingMatchedBiometricTemplate__block_invoke;
  v13[3] = &unk_264E953D0;
  v13[4] = self;
  objc_super v9 = [v7 actionWithTitle:v8 style:2 handler:v13];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x263F82400];
  id v11 = PSLocalizablePearlStringForKey();
  id v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v6 addAction:v12];

  [(PSUIPearlPasscodeController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __84__PSUIPearlPasscodeController_presentSecondAlertForDeletingMatchedBiometricTemplate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAllIdentities];
}

- (void)deleteAllIdentities
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)PSUIPearlPasscodeController;
  [(PSUIBiometricController *)&v16 deleteGlobalAuthACL];
  uint64_t v3 = +[PSUIBiometrics sharedInstance];
  id v4 = [v3 identitiesForIdentityType:2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = +[PSUIBiometrics sharedInstance];
        [v11 removeIdentity:v10 completion:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  if (_os_feature_enabled_impl()) {
    [(PSUIPearlPasscodeController *)self configurePeriocularEnabled:0];
  }
}

- (BOOL)faceIDEnrollmentCoordinatorShouldPresentInModalSheet:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return [v3 shouldPresentInModalSheet];
}

- (void)faceIDEnrollmentCoordinator:(id)a3 finishedEnrollmentWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator:finishedEnrollmentWithError:]((uint64_t)v7, v8);
    }

    [(PSUIBiometricController *)self cancelModalFlowWithCompletion:0];
    uint64_t v9 = [v6 presentedViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];

    [(PSUIPearlPasscodeController *)self setFaceIDEnrollmentCoordinator:0];
  }
  else if ([(PSUIPearlPasscodeController *)self isEnrolled] {
         && ![(PSUIBiometricController *)self isPasscodeSet])
  }
  {
    [(PSUIBiometricController *)self setModalFlowCancelCompletion:&__block_literal_global_289];
    [(PSUIPearlPasscodeController *)self pushPasscodePane];
  }
  else
  {
    if ([(PSUIPearlPasscodeController *)self isEnrolled]) {
      [(PSUIBiometricController *)self completeModalFlow];
    }
    else {
      [(PSUIBiometricController *)self cancelModalFlowWithCompletion:0];
    }
    [(PSUIPearlPasscodeController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v0 = +[PSUIBiometrics sharedInstance];
  v1 = [v0 identitiesForIdentityType:2];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * v5);
        id v7 = +[PSUIBiometrics sharedInstance];
        [v7 removeIdentity:v6 completion:&__block_literal_global_291];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2_cold_1(v4);
    }
  }
}

- (void)faceIDEnrollmentCoordinatorDidDismiss:(id)a3
{
}

- (PSUIFaceIDEnrollmentCoordinator)faceIDEnrollmentCoordinator
{
  return self->_faceIDEnrollmentCoordinator;
}

- (void)setFaceIDEnrollmentCoordinator:(id)a3
{
}

- (PSSpecifier)enrollFaceSpecifier
{
  return self->_enrollFaceSpecifier;
}

- (void)setEnrollFaceSpecifier:(id)a3
{
}

- (PSUIPearlAttentionGroupController)attentionGroupController
{
  return self->_attentionGroupController;
}

- (void)setAttentionGroupController:(id)a3
{
}

- (void)setAuthContext:(id)a3
{
}

- (OBPrivacyPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (PSSpecifier)currentlyPresentingPearlEnrollSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1592, 1);
}

- (void)setCurrentlyPresentingPearlEnrollSpecifier:(id)a3
{
}

- (BOOL)isEnrollingInPeriocular
{
  return self->_isEnrollingInPeriocular;
}

- (void)setIsEnrollingInPeriocular:(BOOL)a3
{
  self->_isEnrollingInPeriocular = a3;
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
  objc_storeStrong((id *)&self->_currentlyPresentingPearlEnrollSpecifier, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_attentionGroupController, 0);
  objc_storeStrong((id *)&self->_enrollFaceSpecifier, 0);
  objc_storeStrong((id *)&self->_faceIDEnrollmentCoordinator, 0);
}

void __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Failed to refetch biometric templates data", v2, v3, v4, v5, v6);
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling as we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollWithSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollWithSpecifier: No passcode", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollWithSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollWithSpecifier: No specifier", v2, v3, v4, v5, v6);
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling with Add Glasses as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_144_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling with Add Glasses as we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollGlassesForExistingAppearance:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollGlassesForExistingAppearance: No passcode", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollGlassesForExistingAppearance:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollGlassesForExistingAppearance: No specifier", v2, v3, v4, v5, v6);
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling periocular for existing appearance as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not enrolling periocular for existing appearance as we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollPeriocularForExistingAppearance:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollPeriocularForExistingAppearance: No passcode", v2, v3, v4, v5, v6);
}

- (void)proceedToEnrollPeriocularForExistingAppearance:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "proceedToEnrollPeriocularForExistingAppearance: No specifier", v2, v3, v4, v5, v6);
}

- (void)numberOfAppsUsingPearlDescription:.cold.1()
{
  v0 = [NSNumber numberWithUnsignedInteger:0];
  OUTLINED_FUNCTION_2(&dword_23D33A000, v1, v2, "invalid number of apps: %@", v3, v4, v5, v6, 2u);
}

- (void)specifiers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Pearl specifiers setup: No specifier", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "LAUIDelegate event: No passcode", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "LAUIDelegate event: No specifier", v2, v3, v4, v5, v6);
}

- (void)passcodeViewController:didFinishWithPasscodeCreation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "passcodeViewController:didFinishWithPasscodeCreation: Removing passcode for specifier", v2, v3, v4, v5, v6);
}

- (void)passcodeViewController:didFinishWithPasscodeCreation:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "passcodeViewController:didFinishWithPasscodeCreation: No specifier", v2, v3, v4, v5, v6);
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not resetting as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_267_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Face ID: Not resetting as we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)faceIDEnrollmentCoordinator:(uint64_t)a1 finishedEnrollmentWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Enroll failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2(&dword_23D33A000, v2, v3, "Unable to remove BKIdentity %@.", v4, v5, v6, v7, 2u);
}

@end