@interface PKPassShareRedemptionViewController
- (BOOL)analyticsEnabled;
- (NSArray)displayableSharedEntitlements;
- (NSString)continueButtonText;
- (NSString)continueLaterText;
- (NSString)referralSource;
- (PKHeroCardExplanationHeaderView)cardHeaderView;
- (PKPassShareActivationOptions)activationOptions;
- (PKPassShareRedemptionViewController)init;
- (PKShareRedemptionAnalyticsReporter)analyticsReporter;
- (int64_t)accessType;
- (void)_configureHeaderSize;
- (void)_reloadSections;
- (void)_setDisplayableSharedEntitlements:(id)a3;
- (void)_updateContinueButtonState;
- (void)activationCodeDidChange;
- (void)cancelButtonPressed;
- (void)continueButtonPressed;
- (void)continueLaterButtonPressed;
- (void)loadView;
- (void)setActivationOptions:(id)a3;
- (void)setAnalyticsEnabled:(BOOL)a3;
- (void)setContinueButtonText:(id)a3;
- (void)setContinueLaterText:(id)a3;
- (void)setDisplayableSharedEntitlements:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setReferralSource:(id)a3;
- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3;
- (void)showFailureUI;
- (void)showLoadingUI;
- (void)showStartingUI;
- (void)showSuccessUI;
- (void)updateUserInteractionEnabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareRedemptionViewController

- (PKPassShareRedemptionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassShareRedemptionViewController;
  v2 = [(PKPaymentSetupOptionsViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PKDynamicCollectionViewController *)v2 setUseItemIdentityWhenUpdating:1];
    [(PKPaymentSetupOptionsViewController *)v3 setShouldCollapseHeaderOnKeyboardShow:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassShareRedemptionViewController;
  [(PKPaymentSetupOptionsViewController *)&v3 viewDidLoad];
  [(PKPassShareRedemptionViewController *)self _reloadSections];
  [(PKPassShareRedemptionViewController *)self _updateContinueButtonState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareRedemptionViewController;
  [(PKPaymentSetupOptionsViewController *)&v9 viewWillAppear:a3];
  v4 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
  v10[0] = *MEMORY[0x1E4F86C38];
  uint64_t v5 = PKAnalyticsReportSwitchToggleResultValue();
  v6 = (void *)v5;
  v10[1] = *MEMORY[0x1E4F86C88];
  referralSource = self->_referralSource;
  if (!referralSource) {
    referralSource = (NSString *)*MEMORY[0x1E4F86C90];
  }
  v11[0] = v5;
  v11[1] = referralSource;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 sendEventForPage:0 specifics:v8];
}

- (void)_reloadSections
{
  objc_super v3 = [(PKPassShareRedemptionViewController *)self viewIfLoaded];

  if (v3)
  {
    BOOL v4 = self->_activationCodeSectionController != 0;
    [(PKPassShareSectionController *)self->_sharePreviewSectionController setUseCompactInsets:v4];
    [(PKPassShareSectionController *)self->_activationCodeSectionController setUseCompactInsets:v4];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v5 safelyAddObject:self->_activationCodeSectionController];
    [v5 safelyAddObject:self->_sharePreviewSectionController];
    [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:1];
    [(PKPassShareRedemptionViewController *)self _configureHeaderSize];
  }
}

- (int64_t)accessType
{
  return 0;
}

- (PKPassShareActivationOptions)activationOptions
{
  return [(PKPassShareRedemptionActivationCodeSectionController *)self->_activationCodeSectionController activationOptions];
}

- (void)setActivationOptions:(id)a3
{
  id v4 = a3;
  activationCodeSectionController = self->_activationCodeSectionController;
  id v9 = v4;
  if (!activationCodeSectionController)
  {
    v6 = [[PKPassShareRedemptionActivationCodeSectionController alloc] initWithMode:1 delegate:self];
    v7 = self->_activationCodeSectionController;
    self->_activationCodeSectionController = v6;

    id v4 = v9;
    activationCodeSectionController = self->_activationCodeSectionController;
  }
  [(PKPassShareRedemptionActivationCodeSectionController *)activationCodeSectionController setActivationOptions:v4];
  [(PKPassShareRedemptionViewController *)self activationCodeDidChange];
  if (![(PKPassShareRedemptionActivationCodeSectionController *)self->_activationCodeSectionController requiresActivationCode])
  {
    v8 = self->_activationCodeSectionController;
    self->_activationCodeSectionController = 0;
  }
  [(PKPassShareRedemptionViewController *)self _reloadSections];
}

- (void)setDisplayableSharedEntitlements:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F84698] localizedEntitlementsFromDisplayableEntitlements:v4 pass:0];
    [(PKPassShareRedemptionViewController *)self _setDisplayableSharedEntitlements:v5];
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E4F84698];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke;
    v7[3] = &unk_1E59CB088;
    objc_copyWeak(&v8, &location);
    [v6 localizedEntitlementsFromDisplayableEntitlements:v4 pass:0 useCachedTemplates:0 completion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKPassShareRedemptionViewController *)self _setDisplayableSharedEntitlements:0];
  }
}

void __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke_2;
    v6[3] = &unk_1E59CA870;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDisplayableSharedEntitlements:*(void *)(a1 + 40)];
}

- (void)_setDisplayableSharedEntitlements:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, a3);
  if (v15)
  {
    id v5 = objc_msgSend(v15, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_9);
    if ([v5 count])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F85018]);
      id v7 = [MEMORY[0x1E4F84D50] sharedService];
      id v8 = (PKSharePreviewOverviewSectionController *)[v6 initWithPass:0 webService:v7 paymentServiceProvider:0 queue:MEMORY[0x1E4F14428]];

      id v9 = objc_alloc(MEMORY[0x1E4F84870]);
      v10 = [(PKSharePreviewOverviewSectionController *)v8 possiblePredefinedEntitlements];
      v11 = (PKPassEntitlementsComposer *)[v9 initWithRedeemableSharedEntitlements:v15 predefinedSharedEntitlements:v10];
      entitlementComposer = self->_entitlementComposer;
      self->_entitlementComposer = v11;

      v13 = [[PKSharePreviewOverviewSectionController alloc] initWithMode:1 accessType:[(PKPassShareRedemptionViewController *)self accessType] entitlementComposer:self->_entitlementComposer delegate:self];
      sharePreviewSectionController = self->_sharePreviewSectionController;
      self->_sharePreviewSectionController = v13;

      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v8 = self->_sharePreviewSectionController;
  self->_sharePreviewSectionController = 0;
LABEL_6:

  [(PKPassShareRedemptionViewController *)self _reloadSections];
}

uint64_t __73__PKPassShareRedemptionViewController__setDisplayableSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharedEntitlement];
}

- (PKShareRedemptionAnalyticsReporter)analyticsReporter
{
  analyticsReporter = self->_analyticsReporter;
  if (!analyticsReporter)
  {
    if (self->_analyticsEnabled)
    {
      id v4 = objc_alloc_init(PKShareRedemptionAnalyticsReporter);
      id v5 = self->_analyticsReporter;
      self->_analyticsReporter = v4;

      analyticsReporter = self->_analyticsReporter;
    }
    else
    {
      analyticsReporter = 0;
    }
  }

  return analyticsReporter;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)PKPassShareRedemptionViewController;
  [(PKDynamicCollectionViewController *)&v15 loadView];
  id v3 = [(PKPassShareRedemptionViewController *)self navigationItem];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed];
  [v3 setLeftBarButtonItem:v4];

  id v5 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v5 setTitleAccessoriesEnabled:1];
  id v6 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
  [(PKHeroCardExplanationHeaderView *)v6 setPadding:1];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKHeroCardExplanationHeaderView *)v6 setBackgroundColor:v7];

  [(PKPassShareRedemptionViewController *)self _configureHeaderSize];
  [v5 setTopArtView:v6];
  id v8 = [(PKPaymentSetupOptionsViewController *)self dockView];
  id v9 = [v8 footerView];
  v10 = v9;
  if (self->_continueLaterText)
  {
    v11 = [v9 setupLaterButton];
    [v11 setTitle:self->_continueLaterText forState:0];
    [v11 addTarget:self action:sel_continueLaterButtonPressed forControlEvents:0x2000];
  }
  else
  {
    [v9 setSetupLaterButton:0];
  }
  [v10 setManualEntryButton:0];
  v12 = [v8 primaryButton];
  [v12 setEnabled:1];
  [v12 addTarget:self action:sel_continueButtonPressed forControlEvents:0x2000];
  continueButtonText = self->_continueButtonText;
  if (continueButtonText)
  {
    [v12 setTitle:continueButtonText forState:0];
  }
  else
  {
    v14 = PKLocalizedPaymentString(&cfstr_Continue.isa);
    [v12 setTitle:v14 forState:0];
  }
  [v8 setButtonsEnabled:1];
}

- (void)_configureHeaderSize
{
  id v3 = [(PKPassShareRedemptionViewController *)self viewIfLoaded];

  if (v3)
  {
    if (self->_activationCodeSectionController || self->_sharePreviewSectionController)
    {
      id v4 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
      id v6 = v4;
      uint64_t v5 = 2;
    }
    else
    {
      id v4 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
      id v6 = v4;
      uint64_t v5 = 4;
    }
    [v4 setSize:v5];
  }
}

- (void)continueButtonPressed
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPassShareRedemptionActivationCodeSectionController *)self->_activationCodeSectionController requiresActivationCode])
  {
    uint64_t v4 = *MEMORY[0x1E4F86C30];
    v5[0] = *MEMORY[0x1E4F86D10];
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    id v3 = 0;
  }
  [(PKShareRedemptionAnalyticsReporter *)self->_analyticsReporter sendEventForPage:0 button:2 specifics:v3];
}

- (void)cancelButtonPressed
{
}

- (void)continueLaterButtonPressed
{
}

- (void)setHeaderImage:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  [v5 setCardImage:v4];
}

- (void)setContinueButtonText:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_continueButtonText, a3);
  id v5 = [(PKPassShareRedemptionViewController *)self viewIfLoaded];

  if (v5)
  {
    id v6 = [(PKPaymentSetupOptionsViewController *)self dockView];
    id v7 = [v6 primaryButton];
    [v7 setTitle:v8 forState:0];
  }
}

- (void)setContinueLaterText:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_continueLaterText, a3);
  id v5 = [(PKPassShareRedemptionViewController *)self viewIfLoaded];

  if (v5)
  {
    id v6 = [(PKPaymentSetupOptionsViewController *)self dockView];
    id v7 = [v6 footerView];
    if (v11)
    {
      [v7 setForceShowSetupLaterButton:1];
      id v8 = [v7 setupLaterButton];
      [v8 setTitle:v11 forState:0];
      id v9 = [v8 allTargets];
      uint64_t v10 = [v9 count];

      if (!v10) {
        [v8 addTarget:self action:sel_continueLaterButtonPressed forControlEvents:0x2000];
      }
    }
    else
    {
      [v7 setSetupLaterButton:0];
    }
  }
}

- (PKHeroCardExplanationHeaderView)cardHeaderView
{
  v2 = [(PKPaymentSetupOptionsViewController *)self headerView];
  id v3 = [v2 topArtView];

  return (PKHeroCardExplanationHeaderView *)v3;
}

- (void)showStartingUI
{
  id v3 = [(PKPaymentSetupOptionsViewController *)self dockView];
  [v3 setHidden:0];
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
  if (self->_privacyLinkController) {
    -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:");
  }
  [(PKPassShareRedemptionViewController *)self _updateContinueButtonState];
  [(PKPassShareRedemptionViewController *)self updateUserInteractionEnabled:1];
}

- (void)showLoadingUI
{
  id v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
  [v5 setHidden:1];
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:1];
  id v3 = [(PKPaymentSetupOptionsViewController *)self privacyLink];
  privacyLinkController = self->_privacyLinkController;
  self->_privacyLinkController = v3;

  [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:0];
  [(PKPassShareRedemptionViewController *)self updateUserInteractionEnabled:0];
}

- (void)showSuccessUI
{
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
  id v3 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v3 setShowCheckmark:1];

  id v4 = [(PKPaymentSetupOptionsViewController *)self dockView];
  [v4 setHidden:1];
  [(PKPassShareRedemptionViewController *)self updateUserInteractionEnabled:1];
}

- (void)showFailureUI
{
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];

  [(PKPassShareRedemptionViewController *)self updateUserInteractionEnabled:1];
}

- (void)updateUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setUserInteractionEnabled:v3];
}

- (void)_updateContinueButtonState
{
  BOOL v3 = [(PKPassShareRedemptionViewController *)self viewIfLoaded];

  if (v3)
  {
    id v7 = [(PKPaymentSetupOptionsViewController *)self dockView];
    if ([(PKPassShareRedemptionActivationCodeSectionController *)self->_activationCodeSectionController requiresActivationCode])
    {
      id v4 = [(PKPassShareRedemptionActivationCodeSectionController *)self->_activationCodeSectionController enteredActivationCode];
      BOOL v5 = [v4 length] != 0;
    }
    else
    {
      BOOL v5 = 1;
    }
    id v6 = [v7 primaryButton];
    [v6 setEnabled:v5];
  }
}

- (void)activationCodeDidChange
{
  [(PKPassShareRedemptionViewController *)self _updateContinueButtonState];
  activationCodeSectionController = self->_activationCodeSectionController;
  if (activationCodeSectionController)
  {
    id v4 = [(PKPassShareRedemptionActivationCodeSectionController *)activationCodeSectionController enteredActivationCode];
    [(PKPassShareRedemptionViewController *)self activationCodeDidChangeToCode:v4];
  }
}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  BOOL v5 = [[PKPassShareEntitlementSelectionViewController alloc] initWithAccessType:[(PKPassShareRedemptionViewController *)self accessType] mode:1 entitlementComposer:self->_entitlementComposer];
  id v4 = [(PKPassShareRedemptionViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (BOOL)analyticsEnabled
{
  return self->_analyticsEnabled;
}

- (void)setAnalyticsEnabled:(BOOL)a3
{
  self->_analyticsEnabled = a3;
}

- (NSString)referralSource
{
  return self->_referralSource;
}

- (void)setReferralSource:(id)a3
{
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (NSString)continueButtonText
{
  return self->_continueButtonText;
}

- (NSString)continueLaterText
{
  return self->_continueLaterText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueLaterText, 0);
  objc_storeStrong((id *)&self->_continueButtonText, 0);
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_sharePreviewSectionController, 0);

  objc_storeStrong((id *)&self->_activationCodeSectionController, 0);
}

@end