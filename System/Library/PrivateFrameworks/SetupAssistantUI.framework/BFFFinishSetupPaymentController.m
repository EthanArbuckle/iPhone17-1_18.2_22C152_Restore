@interface BFFFinishSetupPaymentController
+ (BOOL)hasPrimaryiCloudAccount;
+ (id)finishSetupPaymentControllerWithHost:(id)a3;
+ (unint64_t)registrationViewControllerOutstandingRequirements;
- (BFFFinishSetupPaymentController)initWithHost:(id)a3;
- (BOOL)canCompleteExtendedInitializationQuickly;
- (BOOL)controllerNeedsToRun;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (id)completion;
- (id)prerequisiteFlowIdentifier;
- (id)viewControllerWithCompletion:(id)a3;
- (void)_completeWithResult:(unint64_t)a3 didSetUp:(BOOL)a4;
- (void)_userDidTapCancelButton:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation BFFFinishSetupPaymentController

+ (id)finishSetupPaymentControllerWithHost:(id)a3
{
  id v3 = a3;
  v4 = [[BFFFinishSetupPaymentController alloc] initWithHost:v3];

  return v4;
}

- (BFFFinishSetupPaymentController)initWithHost:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BFFFinishSetupPaymentController;
  v5 = [(BFFFinishSetupPaymentController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_host, v4);
  }

  return v6;
}

- (id)prerequisiteFlowIdentifier
{
  p_host = &self->_host;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v4 = (void *)*MEMORY[0x263F67F98];
  if ([WeakRetained didSkipFlowInFinishSetup:*MEMORY[0x263F67F98]])
  {

LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
  id v5 = objc_loadWeakRetained((id *)p_host);
  v6 = (void *)*MEMORY[0x263F67F80];
  char v7 = [v5 didSkipFlowInFinishSetup:*MEMORY[0x263F67F80]];

  if (v7) {
    goto LABEL_9;
  }
  id v8 = objc_loadWeakRetained((id *)p_host);
  char v9 = [v8 didCompleteFlowInFinishSetup:v4];

  if ((v9 & 1) != 0
    || (+[BFFFinishSetupPaymentController registrationViewControllerOutstandingRequirements] & 2) == 0|| (id v10 = v4) == 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_host);
    char v12 = [v11 didCompleteFlowInFinishSetup:v6];

    if ((v12 & 1) != 0
      || +[BFFFinishSetupPaymentController hasPrimaryiCloudAccount])
    {
      goto LABEL_9;
    }
    id v10 = v6;
  }
LABEL_10:
  return v10;
}

+ (unint64_t)registrationViewControllerOutstandingRequirements
{
  unint64_t v6 = 0;
  v2 = (void *)[objc_alloc((Class)getPKSetupAssistantContextClass()) initWithSetupAssistantAsFollowupAction:1];
  id v3 = (void *)[objc_alloc((Class)getPKPaymentSetupAssistantControllerClass()) initWithSetupAssistantContext:v2];
  [v3 isFollowupNeededReturningRequirements:&v6];
  unint64_t v4 = v6;

  return v4;
}

+ (BOOL)hasPrimaryiCloudAccount
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3 != 0;
}

- (BOOL)controllerNeedsToRun
{
  p_host = &self->_host;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if ([WeakRetained didSkipFlowInFinishSetup:*MEMORY[0x263F67F98]])
  {

LABEL_4:
    unint64_t v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup payment controller does not need to run. The user skipped a prerequisite", buf, 2u);
    }
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v4 = objc_loadWeakRetained((id *)p_host);
  int v5 = [v4 didSkipFlowInFinishSetup:*MEMORY[0x263F67F80]];

  if (v5) {
    goto LABEL_4;
  }
  unint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v9 = 0;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup payment controller needs to run", v9, 2u);
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (id)viewControllerWithCompletion:(id)a3
{
  [(BFFFinishSetupPaymentController *)self setCompletion:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancelButton_];
  int v5 = [(UIViewController *)self->_registrationViewController navigationItem];
  [v5 setLeftBarButtonItem:v4 animated:0];

  unint64_t v6 = self->_registrationViewController;
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup will preflight payment controller", buf, 2u);
  }

  unint64_t v6 = (void *)[objc_alloc((Class)getPKSetupAssistantContextClass()) initWithSetupAssistantAsFollowupAction:1];
  [v6 setDelegate:self];
  BOOL v7 = (PKPaymentSetupAssistantController *)[objc_alloc((Class)getPKPaymentSetupAssistantControllerClass()) initWithSetupAssistantContext:v6];
  paymentController = self->_paymentController;
  self->_paymentController = v7;

  char v9 = self->_paymentController;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BFFFinishSetupPaymentController_performExtendedInitializationWithCompletion___block_invoke;
  v11[3] = &unk_26454AB78;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(PKPaymentSetupAssistantController *)v9 setupAssistantViewControllerWithCompletion:v11];
}

void __79__BFFFinishSetupPaymentController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  int v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v4 != 0;
    _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup did preflight payment controller with success %d", buf, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x263F67F88];
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
    (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v4 != 0, v7);
  }
}

- (BOOL)canCompleteExtendedInitializationQuickly
{
  return 1;
}

- (void)_userDidTapCancelButton:(id)a3
{
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Buddy followup payment controller user did tap cancel", v5, 2u);
  }

  [(BFFFinishSetupPaymentController *)self _completeWithResult:2 didSetUp:0];
}

- (void)_completeWithResult:(unint64_t)a3 didSetUp:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v7 = [(BFFFinishSetupPaymentController *)self flowSkipController];
  uint64_t v8 = *MEMORY[0x263F67F88];
  [v7 didCompleteFlow:*MEMORY[0x263F67F88]];

  CFPreferencesSetValue(@"Payment2Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  char v9 = [(BFFFinishSetupPaymentController *)self paneFeatureAnalyticsManager];
  BOOL v10 = [NSNumber numberWithBool:v4];
  [v9 recordActionWithValue:v10 forFeature:15];

  completion = (void (**)(id, unint64_t, void *))self->_completion;
  if (completion)
  {
    v14[0] = v8;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    completion[2](completion, a3, v12);

    id v13 = self->_completion;
  }
  else
  {
    id v13 = 0;
  }
  self->_completion = 0;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = [(PKPaymentSetupAssistantController *)self->_paymentController isFollowupNeededReturningRequirements:0];
  int v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup payment controller did terminate flow with still needing to run: %i", (uint8_t *)v6, 8u);
  }

  [(BFFFinishSetupPaymentController *)self _completeWithResult:0 didSetUp:v4 ^ 1u];
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
  objc_storeStrong((id *)&self->_paymentController, 0);
  objc_storeStrong((id *)&self->_registrationViewController, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end