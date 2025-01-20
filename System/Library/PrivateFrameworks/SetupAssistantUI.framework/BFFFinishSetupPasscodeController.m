@interface BFFFinishSetupPasscodeController
+ (id)finishSetupPasscodeController;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (id)completion;
- (id)viewControllerWithCompletion:(id)a3;
- (void)_completeWithPasscode:(id)a3 result:(unint64_t)a4;
- (void)_userDidTapCancelButton:(id)a3;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
@end

@implementation BFFFinishSetupPasscodeController

+ (id)finishSetupPasscodeController
{
  v2 = objc_alloc_init(BFFFinishSetupPasscodeController);
  return v2;
}

- (id)viewControllerWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(BFFFinishSetupPasscodeController *)self setCompletion:a3];
  v4 = objc_alloc_init(BFFPasscodeViewController);
  passcodeViewController = self->_passcodeViewController;
  self->_passcodeViewController = v4;

  v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_passcodeViewController;
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup created passcodeController %@", (uint8_t *)&v15, 0xCu);
  }

  [(BFFPasscodeViewController *)self->_passcodeViewController setPasscodeCreationDelegate:self];
  objc_storeStrong((id *)&self->_selfReference, self);
  v8 = [(BFFPasscodeViewController *)self->_passcodeViewController view];
  v9 = +[BFFStyle sharedStyle];
  v10 = [v9 backgroundColor];
  [v8 setBackgroundColor:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancelButton_];
  v12 = [(BFFPasscodeViewController *)self->_passcodeViewController navigationItem];
  [v12 setLeftBarButtonItem:v11 animated:0];

  v13 = self->_passcodeViewController;
  return v13;
}

- (void)_userDidTapCancelButton:(id)a3
{
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup passcode user did cancel", v5, 2u);
  }

  [(BFFFinishSetupPasscodeController *)self _completeWithPasscode:0 result:2];
}

- (void)_completeWithPasscode:(id)a3 result:(unint64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = [(BFFFinishSetupPasscodeController *)self flowSkipController];
  uint64_t v8 = *MEMORY[0x263F67F98];
  [v7 didCompleteFlow:*MEMORY[0x263F67F98]];

  CFPreferencesSetValue(@"Passcode4Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  v9 = [(BFFFinishSetupPasscodeController *)self paneFeatureAnalyticsManager];
  v10 = [NSNumber numberWithInt:a3 != 0];
  [v9 recordActionWithValue:v10 forFeature:11];

  completion = (void (**)(id, unint64_t, void *))self->_completion;
  if (completion)
  {
    v15[0] = v8;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    completion[2](completion, a4, v12);

    id v13 = self->_completion;
    self->_completion = 0;
  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup passcode did finish", buf, 2u);
  }

  if ([v7 length])
  {
    v9 = [v6 view];
    [v9 setUserInteractionEnabled:0];

    v10 = [v6 navigationItem];
    char v11 = [v10 hidesBackButton];

    v12 = [v6 navigationItem];
    [v12 setHidesBackButton:1];

    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v6 identifier:@"FINISH_SETUP_PASSCODE_CONTROLLER"];
    id v13 = _BYLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FF9E000, v13, OS_LOG_TYPE_DEFAULT, "Finish setup passcode will prompt for device passcode change", buf, 2u);
    }

    v14 = [MEMORY[0x263F5FBB0] sharedManager];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke;
    v15[3] = &unk_26454AD18;
    char v19 = v11;
    id v16 = v6;
    uint64_t v17 = self;
    id v18 = v7;
    [v14 promptForDevicePasscodeChangeToPasscode:v18 overController:v16 completion:v15];
  }
  else
  {
    -[BFFFinishSetupPasscodeController _completeWithPasscode:result:](self, "_completeWithPasscode:result:", v7, [v7 length] == 0);
  }
}

void __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v16 = a2;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup passcode did prompt for device passcode change with success %d error %@", buf, 0x12u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke_11;
  v10[3] = &unk_26454ACF0;
  id v7 = *(id *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke_11(uint64_t a1)
{
  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"FINISH_SETUP_PASSCODE_CONTROLLER"];
  v2 = [*(id *)(a1 + 32) navigationItem];
  [v2 setHidesBackButton:*(unsigned __int8 *)(a1 + 56)];

  v3 = [*(id *)(a1 + 32) view];
  [v3 setUserInteractionEnabled:1];

  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _completeWithPasscode:v5 result:0];
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
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end