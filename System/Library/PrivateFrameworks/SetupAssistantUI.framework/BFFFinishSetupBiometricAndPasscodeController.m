@interface BFFFinishSetupBiometricAndPasscodeController
- (BFFFinishSetupBiometricAndPasscodeController)initWithFlowSkipIdentifier:(id)a3;
- (BOOL)passcodeViewControllerAllowSkip:(id)a3;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BYCapabilities)capabilities;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (NSString)passcode;
- (id)completion;
- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4;
- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3;
- (id)preconditionViewControllerWithCompletion:(id)a3;
- (id)viewControllerWithCompletion:(id)a3;
- (void)_userDidTapPasscodeCancelButton:(id)a3;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
- (void)setCapabilities:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscode:(id)a3;
@end

@implementation BFFFinishSetupBiometricAndPasscodeController

- (BFFFinishSetupBiometricAndPasscodeController)initWithFlowSkipIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BFFFinishSetupBiometricAndPasscodeController;
  v5 = [(BFFFinishSetupBiometricAndPasscodeController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    flowSkipIdentifier = v5->_flowSkipIdentifier;
    v5->_flowSkipIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)preconditionViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  [(BFFFinishSetupBiometricAndPasscodeController *)self setPasscode:0];
  v5 = [MEMORY[0x263F53C50] sharedConnection];
  int v6 = [v5 isPasscodeSet];

  v7 = 0;
  if (v6)
  {
    v7 = objc_alloc_init(BFFFinishSetupPINVerificationViewController);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __89__BFFFinishSetupBiometricAndPasscodeController_preconditionViewControllerWithCompletion___block_invoke;
    v13 = &unk_26454AE50;
    v14 = self;
    id v15 = v4;
    [(BFFFinishSetupPINVerificationViewController *)v7 setCompletion:&v10];
    if (BFFIsiPad())
    {
      -[BFFFinishSetupPINVerificationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7, v10, v11, v12, v13, v14);
      v8 = [(BFFFinishSetupPINVerificationViewController *)v7 popoverPresentationController];
      [v8 setDelegate:self];
      [v8 setPermittedArrowDirections:0];
      [v8 setSourceView:0];
      [v8 _setCentersPopoverIfSourceViewNotSet:1];
    }
    else
    {
      -[BFFFinishSetupPINVerificationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 17, v10, v11, v12, v13, v14);
    }
  }
  return v7;
}

void __89__BFFFinishSetupBiometricAndPasscodeController_preconditionViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setPasscode:a2];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (a2)
    {
      v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
    else
    {
      int v6 = [*(id *)(a1 + 32) flowSkipController];
      [v6 didCompleteFlow:*(void *)(*(void *)(a1 + 32) + 8)];

      uint64_t v7 = *(void *)(a1 + 40);
      v9[0] = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  uint64_t v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup biometric subclass failed to implement -createViewController.", v6, 2u);
  }

  return 0;
}

- (id)viewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  v5 = self;
  v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke;
  v14[3] = &unk_26454AE78;
  v16 = v17;
  id v6 = v4;
  id v15 = v6;
  [(BFFFinishSetupBiometricAndPasscodeController *)v5 setCompletion:v14];
  uint64_t v7 = [(BFFFinishSetupBiometricAndPasscodeController *)v5 passcode];
  uint64_t v8 = [v7 length];

  objc_super v9 = [(BFFFinishSetupBiometricAndPasscodeController *)v5 passcode];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke_2;
  v12[3] = &unk_26454AEA0;
  v12[4] = v5;
  BOOL v13 = v8 == 0;
  uint64_t v10 = [(BFFFinishSetupBiometricAndPasscodeController *)v5 createViewControllerWithPasscode:v9 completion:v12];

  _Block_object_dispose(v17, 8);
  return v10;
}

void __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) flowSkipController];
  [v6 didCompleteFlow:*(void *)(*(void *)(a1 + 32) + 8)];

  if (!a3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      v12 = objc_alloc_init(BFFPasscodeViewController);
      [(BFFPasscodeViewController *)v12 setPasscodeCreationDelegate:*(void *)(a1 + 32)];
      BOOL v13 = [(BFFPasscodeViewController *)v12 view];
      v14 = +[BFFStyle sharedStyle];
      id v15 = [v14 backgroundColor];
      [v13 setBackgroundColor:v15];

      v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__userDidTapPasscodeCancelButton_];
      v17 = [(BFFPasscodeViewController *)v12 navigationItem];
      [v17 setLeftBarButtonItem:v16 animated:0];

      v18 = [v5 parentViewController];
      [v18 showViewController:v12 sender:*(void *)(a1 + 32)];

      goto LABEL_8;
    }
    v19 = [MEMORY[0x263F53C50] sharedConnection];
    v20 = [*(id *)(a1 + 32) passcode];
    [v19 setFingerprintUnlockAllowed:1 passcode:v20 completion:0];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 48);
  if (v8)
  {
    if (a3 != 2) {
      a3 = a3 == 1;
    }
    v21[0] = *(void *)(v7 + 8);
    objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a3, v9);

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = 0;
  }
LABEL_8:
}

- (void)_userDidTapPasscodeCancelButton:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup biometric user did cancel passcode", v10, 2u);
  }

  id v5 = [(BFFFinishSetupBiometricAndPasscodeController *)self paneFeatureAnalyticsManager];
  [v5 recordActionWithValue:MEMORY[0x263EFFA80] forFeature:11];

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    uint64_t v7 = *MEMORY[0x263F67F98];
    v11[0] = self->_flowSkipIdentifier;
    v11[1] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    completion[2](completion, 2, v8);

    id v9 = self->_completion;
    self->_completion = 0;
  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  v3 = [(BFFFinishSetupBiometricAndPasscodeController *)self capabilities];
  int v4 = [v3 supportsPearl];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = @"ENTER_PASSCODE_SUBTITLE_FACEID";
  }
  else {
    uint64_t v7 = @"ENTER_PASSCODE_SUBTITLE_TOUCHID";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D1D0C18 table:@"Localizable"];

  return v8;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [NSNumber numberWithInt:v5 != 0];
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup biometric passcode did finish with passcode %@", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263F53C50] sharedConnection];
  [v8 setFingerprintUnlockAllowed:1 passcode:v5 completion:0];

  id v9 = [(BFFFinishSetupBiometricAndPasscodeController *)self flowSkipController];
  uint64_t v10 = *MEMORY[0x263F67F98];
  [v9 didCompleteFlow:*MEMORY[0x263F67F98]];

  CFPreferencesSetValue(@"Passcode4Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  uint64_t v11 = [(BFFFinishSetupBiometricAndPasscodeController *)self paneFeatureAnalyticsManager];
  v12 = [NSNumber numberWithInt:v5 != 0];
  [v11 recordActionWithValue:v12 forFeature:11];

  completion = (void (**)(id, void, void *))self->_completion;
  if (completion)
  {
    v16[0] = self->_flowSkipIdentifier;
    v16[1] = v10;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    completion[2](completion, 0, v14);

    id v15 = self->_completion;
    self->_completion = 0;
  }
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_flowSkipIdentifier, 0);
}

@end