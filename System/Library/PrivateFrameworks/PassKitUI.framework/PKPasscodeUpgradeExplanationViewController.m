@interface PKPasscodeUpgradeExplanationViewController
- (BOOL)upgradeRequiredToAddNewPass;
- (PKPasscodeUpgradeExplanationViewController)initWithPasscodeUpgradeFlowController:(id)a3 isForWatch:(BOOL)a4;
- (id)continuationHandler;
- (id)setupLaterHandler;
- (unint64_t)paymentSetupMarker;
- (void)_showSpinner:(BOOL)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)setContinuationHandler:(id)a3;
- (void)setSetupLaterHandler:(id)a3;
- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPasscodeUpgradeExplanationViewController

- (PKPasscodeUpgradeExplanationViewController)initWithPasscodeUpgradeFlowController:(id)a3 isForWatch:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 context];
  v11.receiver = self;
  v11.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  v8 = [(PKExplanationViewController *)&v11 initWithContext:v7];
  if (v8)
  {
    v9 = [v6 setupDelegate];
    objc_storeWeak((id *)&v8->_setupDelegate, v9);

    v8->_context = v7;
    v8->_isForWatch = a4;
    objc_storeWeak((id *)&v8->_flowController, v6);
  }

  return v8;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  [(PKExplanationViewController *)&v29 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F87FD8]];
  v5 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_11.isa, &stru_1EF1B4C70.isa, v4);
  [v3 setTitleText:v5];

  uint64_t v6 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v4 numberStyle:5];
  if (self->_upgradeRequiredToAddNewPass) {
    uint64_t v7 = @"PASSCODE_UPGRADE_REQUIRED_TO_ADD_CARD_BODY";
  }
  else {
    uint64_t v7 = @"PASSCODE_UPGRADE_REQUIRED_BODY";
  }
  PKDeviceSpecificLocalizedStringKeyForKey(v7, self->_isForWatch);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  v9 = PKLocalizedPaymentString(v8, &stru_1EF1B4C70.isa, v6);
  [v3 setBodyText:v9];

  v10 = PKPassKitUIBundle();
  if (PKPaymentSetupContextIsBridge()) {
    objc_super v11 = @"PasscodeLock_Watch";
  }
  else {
    objc_super v11 = @"PasscodeLock";
  }
  v12 = [v10 URLForResource:v11 withExtension:@"pdf"];
  double v13 = PKUIScreenScale();
  v14 = PKUIImageFromPDF(v12, 80.0, 80.0, v13);
  [v3 setImage:v14];

  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 bounds];
  double v17 = v16;
  v18 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v18 statusBarFrame];
  double v20 = -(v19 - v17 * 0.09);

  [v3 setTopMargin:v20];
  v21 = [v3 dockView];
  v22 = [v21 footerView];

  if (!self->_upgradeRequiredToAddNewPass) {
    [v3 setForceShowSetupLaterButton:1];
  }
  v23 = [v22 setupLaterButton];
  v24 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
  [v23 setTitle:v24 forState:0];

  [v22 setManualEntryButton:0];
  [v3 setShowPrivacyView:0];
  v25 = [(PKPasscodeUpgradeExplanationViewController *)self view];
  [v25 setAccessibilityIdentifier:*MEMORY[0x1E4F85788]];

  int64_t context = self->_context;
  v27 = [(PKPasscodeUpgradeExplanationViewController *)self view];
  PKPaymentSetupApplyContextAppearance(context, v27);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  [(PKPasscodeUpgradeExplanationViewController *)&v5 viewWillAppear:a3];
  if (!self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained beginShowingViewController];

    self->_viewHasAppeared = 1;
    if (self->_isForWatch) {
      [(PKPasscodeUpgradeExplanationViewController *)self _showSpinner:0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  [(PKPasscodeUpgradeExplanationViewController *)&v5 viewDidAppear:a3];
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 notifyUserHasSeenComplianceMessageWithLastLockDate:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  [(PKPasscodeUpgradeExplanationViewController *)&v5 viewDidDisappear:a3];
  if (self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained endedShowingViewController];

    self->_viewHasAppeared = 0;
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  setupLaterHandler = (void (**)(void))self->_setupLaterHandler;
  if (setupLaterHandler) {
    setupLaterHandler[2]();
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v5 = a3;
  continuationHandler = (void (**)(void))self->_continuationHandler;
  if (continuationHandler)
  {
    continuationHandler[2]();
    if (self->_isForWatch) {
      [(PKPasscodeUpgradeExplanationViewController *)self _showSpinner:1];
    }
  }
}

- (unint64_t)paymentSetupMarker
{
  return 5;
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(PKExplanationViewController *)self explanationView];
  v4 = [v9 dockView];
  id v5 = [v4 primaryButton];
  [v5 setShowSpinner:v3];
  uint64_t v6 = v3 ^ 1;
  [v5 setEnabled:v6];
  uint64_t v7 = [v4 footerView];
  v8 = [v7 setupLaterButton];
  [v8 setEnabled:v6];
}

- (id)continuationHandler
{
  return self->_continuationHandler;
}

- (void)setContinuationHandler:(id)a3
{
}

- (id)setupLaterHandler
{
  return self->_setupLaterHandler;
}

- (void)setSetupLaterHandler:(id)a3
{
}

- (BOOL)upgradeRequiredToAddNewPass
{
  return self->_upgradeRequiredToAddNewPass;
}

- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3
{
  self->_upgradeRequiredToAddNewPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupLaterHandler, 0);
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_destroyWeak((id *)&self->_flowController);

  objc_destroyWeak((id *)&self->_setupDelegate);
}

@end