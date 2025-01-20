@interface PKAccountPassActivationResultViewController
- (BOOL)_willPerformProvisioningActions;
- (BOOL)didAddToAmp;
- (BOOL)didMakeAccountPassDefault;
- (BOOL)showingLoadingIndicator;
- (PKAccountPassActivationResultViewController)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5;
- (id)_localizedStringKeyForPerformedOperationsAndMadeDefault:(BOOL)a3;
- (id)_setupLaterBodyString;
- (void)_handleNextStep;
- (void)_presentDisplayableError:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_showActivationSpinner:(BOOL)a3;
- (void)_terminateSetupFlow;
- (void)_updateForLoading;
- (void)_updateForMadeDefault;
- (void)_updateForSetupLater;
- (void)_updateUI;
- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4;
- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setDidAddToAmp:(BOOL)a3;
- (void)setDidMakeAccountPassDefault:(BOOL)a3;
- (void)setShowingLoadingIndicator:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKAccountPassActivationResultViewController

- (PKAccountPassActivationResultViewController)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPassActivationResultViewController;
  v11 = [(PKExplanationViewController *)&v16 initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_accountController, a3);
    v13 = [(PKAccountFlowController *)v12->_accountController accountCredential];
    v14 = [v13 account];
    v12->_featureIdentifier = [v14 feature];

    v12->_setupContext = a4;
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_inUseAssertion)
  {
    v5 = (void *)MEMORY[0x1E4F1E5E8];
    v6 = PKPassKitCoreBundle();
    v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"Passbook showing add card UI"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v7;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPassActivationResultViewController;
  [(PKAccountPassActivationResultViewController *)&v9 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v6 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  [(PKAccountPassActivationResultViewController *)&v7 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(CLInUseAssertion *)self->_inUseAssertion invalidate];
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator deactivate];
  v4.receiver = self;
  v4.super_class = (Class)PKAccountPassActivationResultViewController;
  [(PKAccountPassActivationResultViewController *)&v4 dealloc];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  [(PKExplanationViewController *)&v7 loadView];
  BOOL v3 = [(PKExplanationViewController *)self explanationView];
  objc_super v4 = PKProvisioningSecondaryBackgroundColor();
  [v3 setTopBackgroundColor:v4];
  v5 = [[PKApplyHeroCardView alloc] initWithFeatureIdentifier:self->_featureIdentifier];
  [v3 setTopBackgroundColor:v4];
  [(PKApplyHeroCardView *)v5 setBackgroundColor:v4];
  [v3 setHeroView:v5];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v6 = [(PKAccountPassActivationResultViewController *)self navigationItem];
  [v6 setHidesBackButton:1 animated:0];

  [(PKAccountPassActivationResultViewController *)self _updateUI];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  [(PKExplanationViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1A00]);
  objc_super v4 = [(PKAccountPassActivationResultViewController *)self view];
  v5 = (UINotificationFeedbackGenerator *)[v3 initWithView:v4];
  cardAddedFeedbackGenerator = self->_cardAddedFeedbackGenerator;
  self->_cardAddedFeedbackGenerator = v5;

  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator activateWithCompletionBlock:0];
  [(PKAccountFlowController *)self->_accountController performInitalOperations];
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  objc_storeStrong((id *)&self->_nextViewController, a4);
  self->_showingLoadingIndicator = 0;

  [(PKAccountPassActivationResultViewController *)self _updateUI];
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
}

- (void)_updateUI
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke;
  aBlock[3] = &unk_1E59D5A80;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  if (PKPaymentSetupContextIsBridge())
  {
    id v3 = objc_alloc_init(getNPKCompanionAgentConnectionClass_6());
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_2;
    v5[3] = &unk_1E59DECB0;
    id v6 = v2;
    [v3 defaultCardUniqueID:v5];
    objc_super v4 = v6;
  }
  else
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:0];
    objc_super v4 = [v3 defaultPaymentPassUniqueIdentifier];
    (*((void (**)(void *, void *))v2 + 2))(v2, v4);
  }
}

void __56__PKAccountPassActivationResultViewController__updateUI__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1040);
  id v4 = a2;
  v5 = [v3 accountCredential];
  id v6 = [v5 paymentPass];
  id v9 = [v6 uniqueID];

  int v7 = [v4 isEqualToString:v9];
  v8 = *(unsigned char **)(a1 + 32);
  if (v8[1106])
  {
    [v8 _updateForLoading];
  }
  else if (v7)
  {
    [v8 _updateForMadeDefault];
  }
  else
  {
    [v8 _updateForSetupLater];
  }
  PKPaymentSetupApplyContextAppearance([*(id *)(a1 + 32) context], *(void **)(a1 + 32));
}

void __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_3;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_updateForLoading
{
  id v6 = [(PKExplanationViewController *)self explanationView];
  id v3 = [v6 dockView];
  id v4 = [v3 footerView];
  [v6 showCheckmark:0 animated:0];
  [(PKAccountPassActivationResultViewController *)self _showActivationSpinner:1];
  [(PKAccountPassActivationResultViewController *)self _willPerformProvisioningActions];
  id v5 = PKLocalizedFeatureString();
  [v6 setTitleText:v5];

  [v3 setPrimaryButton:0];
  [v4 setSetupLaterButton:0];
  [v4 setManualEntryButton:0];
}

- (void)_updateForMadeDefault
{
  id v16 = [(PKExplanationViewController *)self explanationView];
  id v3 = [v16 dockView];
  id v4 = [v3 footerView];
  [(PKAccountPassActivationResultViewController *)self _showActivationSpinner:0];
  [v16 setShowCheckmark:1];
  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator notificationOccurred:0];
  id v5 = [v3 primaryButton];
  id v6 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v5 setTitle:v6 forState:0];

  id v7 = [v3 primaryButton];
  [v7 addTarget:self action:sel__handleNextStep forEvents:0x2000];

  [v4 setSetupLaterButton:0];
  [v4 setManualEntryButton:0];
  if ([(PKAccountPassActivationResultViewController *)self _willPerformProvisioningActions])
  {
    id v8 = PKLocalizedFeatureString();
    [v16 setTitleText:v8];

    id v9 = [(PKAccountPassActivationResultViewController *)self _localizedStringKeyForPerformedOperationsAndMadeDefault:1];
    id v10 = PKLocalizedFeatureString();
    v11 = PKLocalizedFeatureString();
    v12 = [v10 stringByAppendingString:v11];

    [v16 setBodyText:v12];
    v13 = PKLocalizedFeatureString();
    [v3 setButtonExplanationText:v13];
  }
  else
  {
    v14 = PKLocalizedFeatureString();
    [v16 setTitleText:v14];

    v15 = PKLocalizedFeatureString();
    [v16 setBodyText:v15];

    [v3 setButtonExplanationText:0];
  }
}

- (void)_updateForSetupLater
{
  id v11 = [(PKExplanationViewController *)self explanationView];
  id v3 = [v11 dockView];
  id v4 = [v3 footerView];
  [(PKAccountPassActivationResultViewController *)self _showActivationSpinner:0];
  [v11 setShowCheckmark:1];
  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator notificationOccurred:0];
  id v5 = PKLocalizedFeatureString();
  [v11 setTitleText:v5];

  [v11 setBodyText:0];
  id v6 = [(PKAccountPassActivationResultViewController *)self _setupLaterBodyString];
  [v11 setAttributedBodyText:v6];

  [v4 setSetupLaterButton:0];
  [v4 setManualEntryButton:0];
  id v7 = [v3 primaryButton];
  id v8 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v7 setTitle:v8 forState:0];

  id v9 = [v3 primaryButton];
  [v9 addTarget:self action:sel__handleNextStep forEvents:0x2000];

  if ([(PKAccountPassActivationResultViewController *)self _willPerformProvisioningActions])
  {
    id v10 = PKLocalizedFeatureString();
    [v3 setButtonExplanationText:v10];
  }
  else
  {
    [v3 setButtonExplanationText:0];
  }
}

- (void)_showActivationSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [(PKExplanationViewController *)self explanationView];
  id v5 = [v4 dockView];
  [v4 setShowSpinner:v3];
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v6 _setIdleTimerDisabled:v3 forReason:@"Activating Account Pass"];

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"enabled";
    if (v3) {
      id v8 = @"disabled";
    }
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    v12 = @"Activating Account Pass";
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", (uint8_t *)&v9, 0x16u);
  }

  [v5 setButtonsEnabled:v3 ^ 1];
}

- (void)_handleNextStep
{
  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  if (self->_nextViewController)
  {
    -[PKAccountPassActivationResultViewController _presentViewController:](self, "_presentViewController:");
    nextViewController = self->_nextViewController;
    self->_nextViewController = 0;
  }
  else
  {
    accountController = self->_accountController;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__PKAccountPassActivationResultViewController__handleNextStep__block_invoke;
    v5[3] = &unk_1E59CB6B0;
    void v5[4] = self;
    [(PKAccountFlowController *)accountController nextViewControllerWithCompletion:v5];
  }
}

uint64_t __62__PKAccountPassActivationResultViewController__handleNextStep__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_presentDisplayableError:");
  }
  else {
    return [v3 _presentViewController:a2];
  }
}

- (BOOL)_willPerformProvisioningActions
{
  return ([(PKAccountFlowController *)self->_accountController operations] & 3) != 0;
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    id v6 = [(PKAccountPassActivationResultViewController *)self navigationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PKAccountPassActivationResultViewController__presentViewController___block_invoke;
    v7[3] = &unk_1E59CB6D8;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);
  }
  else
  {
    [(PKExplanationViewController *)self showNavigationBarSpinner:0];
    [(PKAccountPassActivationResultViewController *)self _terminateSetupFlow];
  }
}

uint64_t __70__PKAccountPassActivationResultViewController__presentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  void v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  [(PKExplanationViewController *)self showNavigationBarSpinner:0];
  if (v4)
  {
    id v5 = [(PKAccountPassActivationResultViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKAccountPassActivationResultViewController *)self _terminateSetupFlow];
  }
}

uint64_t __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) showNavigationBarSpinner:1];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1040);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke_2;
  v5[3] = &unk_1E59CB6B0;
  void v5[4] = v2;
  return [v3 nextViewControllerWithCompletion:v5];
}

uint64_t __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentViewController:a2];
}

- (void)_terminateSetupFlow
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v5 = [(PKAccountPassActivationResultViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_localizedStringKeyForPerformedOperationsAndMadeDefault:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (v3) {
    id v6 = @"ACCOUNT_ACTIVATED_BODY_MADE_DEFAULT_WALLET_SAFARI";
  }
  else {
    id v6 = @"ACCOUNT_ACTIVATED_BODY_NOT_MADE_DEFAULT_WALLET_SAFARI";
  }
  id v7 = (void *)[v5 initWithString:v6];
  id v8 = [(PKAccountFlowController *)self->_accountController accountProvisioningController];
  int v9 = [v8 didAddToAMP];

  if (v9) {
    [v7 appendString:@"_APPLEID"];
  }
  id v10 = PKFeatureIdentifierToString();
  int v11 = PKHasPairedWatchSupportingFeatureIdentifier();

  if (v11) {
    [v7 appendString:@"_WATCH"];
  }
  v12 = (void *)[v7 copy];

  return v12;
}

- (id)_setupLaterBodyString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4FB0700]];

  id v5 = PKLocalizedFeatureString();
  id v6 = v5;
  if (self->_featureIdentifier == 3)
  {

    id v6 = 0;
  }
  id v7 = [(PKAccountPassActivationResultViewController *)self _localizedStringKeyForPerformedOperationsAndMadeDefault:0];
  id v8 = PKLocalizedFeatureString();
  int v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 stringByAppendingString:v6];

    int v9 = (void *)v10;
  }
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v3];

  return v11;
}

- (BOOL)didAddToAmp
{
  return self->_didAddToAmp;
}

- (void)setDidAddToAmp:(BOOL)a3
{
  self->_didAddToAmp = a3;
}

- (BOOL)didMakeAccountPassDefault
{
  return self->_didMakeAccountPassDefault;
}

- (void)setDidMakeAccountPassDefault:(BOOL)a3
{
  self->_didMakeAccountPassDefault = a3;
}

- (BOOL)showingLoadingIndicator
{
  return self->_showingLoadingIndicator;
}

- (void)setShowingLoadingIndicator:(BOOL)a3
{
  self->_showingLoadingIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cardAddedFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end