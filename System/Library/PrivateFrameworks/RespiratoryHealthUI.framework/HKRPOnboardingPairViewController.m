@interface HKRPOnboardingPairViewController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (HKRPOnboardingPairViewController)initWithSettings:(id)a3 onboardingManager:(id)a4;
- (HKRPOxygenSaturationOnboardingManager)onboardingManager;
- (HKRPOxygenSaturationSettings)settings;
- (id)_localizedStringForKey:(id)a3;
- (id)alternateButtonTitle;
- (id)captionText;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_makeHeroView;
- (void)_onboardWithCompletion:(id)a3;
- (void)_presentOnboardingError:(id)a3 completion:(id)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKRPOnboardingPairViewController

- (HKRPOnboardingPairViewController)initWithSettings:(id)a3 onboardingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRPOnboardingPairViewController;
  v9 = [(BPSWelcomeOptinViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_onboardingManager, a4);
    [(BPSWelcomeOptinViewController *)v10 setStyle:74];
  }

  return v10;
}

- (id)suggestedButtonTitle
{
  return [(HKRPOnboardingPairViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_ENABLE"];
}

- (id)alternateButtonTitle
{
  return [(HKRPOnboardingPairViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_SET_UP_LATER"];
}

- (id)titleString
{
  return [(HKRPOnboardingPairViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_TITLE"];
}

- (id)detailString
{
  v2 = [(HKRPOnboardingPairViewController *)self settings];
  v3 = [v2 recordingInactiveDescription];

  return v3;
}

- (id)captionText
{
  return [(HKRPOnboardingPairViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_BUTTON_CAPTION"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingPairViewController;
  [(BPSWelcomeOptinViewController *)&v3 viewDidLoad];
  [(HKRPOnboardingPairViewController *)self _makeHeroView];
}

- (void)_makeHeroView
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_2352DD000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] illustratedWatchView is nil", (uint8_t *)&v3, 0xCu);
}

- (id)_localizedStringForKey:(id)a3
{
  int v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke;
  v3[3] = &unk_264C4DAD8;
  v3[4] = self;
  [(HKRPOnboardingPairViewController *)self _onboardWithCompletion:v3];
}

void __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke_2;
  v2[3] = &unk_264C4DAB0;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) miniFlowDelegate];
    [v2 miniFlowStepComplete:*(void *)(a1 + 32)];
  }
}

- (void)_onboardWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKRPOnboardingPairViewController *)self onboardingManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke;
  v7[3] = &unk_264C4DB50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 onboardWithCompletion:v7];
}

void __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_2;
    block[3] = &unk_264C4DB28;
    block[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_3;
  v3[3] = &unk_264C4DB00;
  id v4 = *(id *)(a1 + 48);
  [v1 _presentOnboardingError:v2 completion:v3];
}

uint64_t __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentOnboardingError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  v10 = [v8 domain];
  uint64_t v11 = *MEMORY[0x263F09548];
  if (([v10 isEqualToString:*MEMORY[0x263F09548]] & 1) == 0)
  {

LABEL_5:
    id v17 = v8;
    v18 = [v17 domain];
    if ([v18 isEqualToString:v11])
    {
      uint64_t v19 = [v17 code];

      if (v19 == 110)
      {
        v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v15 = v20;
        v21 = @"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_UNAPPROVED_ERROR";
LABEL_10:
        v16 = [v20 localizedStringForKey:v21 value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];
        v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {
    }
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v20;
    v21 = @"RESPIRATORY_HEALTH_ONBOARDING_ALERT_COMPLETION_UNKNOWN_ERROR";
    goto LABEL_10;
  }
  uint64_t v12 = [v8 code];

  if (v12 != 109) {
    goto LABEL_5;
  }
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_TITLE" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_BODY" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];
LABEL_11:

  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"OK" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  v24 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
  v25 = (void *)MEMORY[0x263F1C3F0];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __alertControllerForOnboardingError_block_invoke;
  v28[3] = &unk_264C4DB78;
  id v29 = v9;
  id v26 = v9;
  v27 = [v25 actionWithTitle:v23 style:0 handler:v28];
  [v24 addAction:v27];

  [(HKRPOnboardingPairViewController *)self presentViewController:v24 animated:1 completion:0];
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(HKRPOnboardingPairViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);
  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (HKRPOxygenSaturationSettings)settings
{
  return self->_settings;
}

- (HKRPOxygenSaturationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_heroView, 0);
}

@end