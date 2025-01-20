@interface PKAccountPassMakeDefaultViewContoller
- (BOOL)_willPerformProvisioningActions;
- (PKAccountPassMakeDefaultViewContoller)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5;
- (void)_presentDisplayableError:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_reportEventForPassIfNecessary:(id)a3;
- (void)_terminateSetupFlow;
- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4;
- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKAccountPassMakeDefaultViewContoller

- (PKAccountPassMakeDefaultViewContoller)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  v11 = [(PKExplanationViewController *)&v16 initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_accountController, a3);
    v13 = [v9 accountCredential];
    v14 = [v13 account];
    v12->_featureIdentifier = [v14 feature];
  }
  return v12;
}

- (void)dealloc
{
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKAccountPassMakeDefaultViewContoller *)&v5 dealloc];
}

- (void)loadView
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKExplanationViewController *)&v38 loadView];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = [(PKAccountFlowController *)self->_accountController accountCredential];
  v4 = [v3 passDetailsResponse];
  objc_super v5 = [v4 postProvisioningContent];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v10 type] == 1)
        {
          objc_storeStrong((id *)&self->_makeDefaultPostProvisioningContent, v10);
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v11 = [(PKExplanationViewController *)self explanationView];
  v12 = [v11 dockView];
  v13 = [v12 footerView];
  v14 = [(PKAccountPostProvisioningContent *)self->_makeDefaultPostProvisioningContent title];
  if (v14)
  {
    [v11 setTitleText:v14];
  }
  else
  {
    v15 = PKLocalizedFeatureString();
    [v11 setTitleText:v15];
  }
  objc_super v16 = [v12 primaryButton];
  v17 = [(PKAccountPostProvisioningContent *)self->_makeDefaultPostProvisioningContent primaryButtonTitle];
  if (v17)
  {
    [v16 setTitle:v17 forState:0];
  }
  else
  {
    v18 = PKLocalizedFeatureString();
    [v16 setTitle:v18 forState:0];
  }
  [v11 setForceShowSetupLaterButton:1];
  [v13 setManualEntryButton:0];
  if ([(PKAccountPassMakeDefaultViewContoller *)self _willPerformProvisioningActions])
  {
    v19 = PKFeatureIdentifierToString();
    int v20 = PKHasPairedWatchSupportingFeatureIdentifier();

    uint64_t v21 = [(PKAccountPostProvisioningContent *)self->_makeDefaultPostProvisioningContent body];
    v22 = (void *)v21;
    v23 = @"ACCOUNT_MAKE_DEFAULT_BODY_AND_WATCH";
    if (!v20) {
      v23 = @"ACCOUNT_MAKE_DEFAULT_BODY";
    }
    if (v21) {
      v23 = (__CFString *)v21;
    }
    v24 = v23;

    v25 = PKLocalizedFeatureString();

    [v11 setBodyText:v25];
    v26 = [v13 setupLaterButton];
    uint64_t v27 = [(PKAccountPostProvisioningContent *)self->_makeDefaultPostProvisioningContent secondaryButtonTitle];
    if (!v27) {
      goto LABEL_26;
    }
  }
  else
  {
    v28 = PKLocalizedFeatureString();
    [v11 setBodyText:v28];

    v26 = [v13 setupLaterButton];
    uint64_t v27 = [(PKAccountPostProvisioningContent *)self->_makeDefaultPostProvisioningContent secondaryButtonTitle];
    if (!v27)
    {
LABEL_26:
      v30 = PKLocalizedFeatureString();
      [v26 setTitle:v30 forState:0];

      v29 = 0;
      goto LABEL_27;
    }
  }
  v29 = (void *)v27;
  [v26 setTitle:v27 forState:0];
LABEL_27:

  v31 = PKProvisioningSecondaryBackgroundColor();
  [v11 setTopBackgroundColor:v31];
  v32 = [[PKApplyHeroCardView alloc] initWithFeatureIdentifier:self->_featureIdentifier];
  [(PKApplyHeroCardView *)v32 setBackgroundColor:v31];
  [v11 setHeroView:v32];
  [v11 setShowPrivacyView:0];
  [v11 setDelegate:self];
  [v11 showCheckmark:0 animated:0];
  [v11 setNeedsLayout];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v33 = [(PKAccountPassMakeDefaultViewContoller *)self navigationItem];
  [v33 setHidesBackButton:1 animated:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKExplanationViewController *)&v3 viewDidLoad];
  [(PKAccountFlowController *)self->_accountController performInitalOperations];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKAccountPassMakeDefaultViewContoller *)&v5 viewWillAppear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountPassMakeDefaultViewContoller *)self _reportEventForPassIfNecessary:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKAccountPassMakeDefaultViewContoller *)&v6 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    objc_super v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  [(PKAccountPassMakeDefaultViewContoller *)&v5 viewDidDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountPassMakeDefaultViewContoller *)self _reportEventForPassIfNecessary:v4];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKAccountPassMakeDefaultViewContoller *)self _willPerformProvisioningActions])
  {
    if (!self->_inUseAssertion)
    {
      objc_super v5 = (void *)MEMORY[0x1E4F1E5E8];
      uint64_t v6 = PKPassKitCoreBundle();
      uint64_t v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"Setting up account credential for provisioning"];
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v7;
    }
    id v9 = [(PKAccountFlowController *)self->_accountController provisioningController];
    id v10 = [(PKAccountFlowController *)self->_accountController accountCredential];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKAccountPassMakeDefaultViewContoller_preflightWithCompletion___block_invoke;
    v11[3] = &unk_1E59CE160;
    id v12 = v4;
    [v9 setupAccountCredentialForProvisioning:v10 completion:v11];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

uint64_t __65__PKAccountPassMakeDefaultViewContoller_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)_willPerformProvisioningActions
{
  return ([(PKAccountFlowController *)self->_accountController operations] & 3) != 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKExplanationViewController *)self explanationView];
  objc_super v5 = [v4 dockView];
  [v5 setButtonsEnabled:0];

  [(PKAccountFlowController *)self->_accountController makeAccountPassDefault:1];
  uint64_t v6 = *MEMORY[0x1E4F86380];
  uint64_t v7 = *MEMORY[0x1E4F86120];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F865F0];
  v11[0] = v6;
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(PKAccountPassMakeDefaultViewContoller *)self _reportEventForPassIfNecessary:v9];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([(PKAccountPassMakeDefaultViewContoller *)self _willPerformProvisioningActions])
  {
    id v4 = [(PKExplanationViewController *)self explanationView];
    objc_super v5 = [v4 dockView];
    [v5 setButtonsEnabled:0];

    [(PKAccountFlowController *)self->_accountController makeAccountPassDefault:0];
  }
  else
  {
    [(PKAccountFlowController *)self->_accountController endProvisioningFlow];
    accountController = self->_accountController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__PKAccountPassMakeDefaultViewContoller_explanationViewDidSelectSetupLater___block_invoke;
    void v11[3] = &unk_1E59CB6B0;
    void v11[4] = self;
    [(PKAccountFlowController *)accountController nextViewControllerWithCompletion:v11];
  }
  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86120];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F865F8];
  v13[0] = v7;
  v13[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [(PKAccountPassMakeDefaultViewContoller *)self _reportEventForPassIfNecessary:v10];
}

uint64_t __76__PKAccountPassMakeDefaultViewContoller_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentViewController:a2];
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    uint64_t v6 = [(PKAccountPassMakeDefaultViewContoller *)self navigationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __64__PKAccountPassMakeDefaultViewContoller__presentViewController___block_invoke;
    v7[3] = &unk_1E59CB6D8;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);
  }
  else
  {
    [(PKExplanationViewController *)self showNavigationBarSpinner:0];
    [(PKAccountPassMakeDefaultViewContoller *)self _terminateSetupFlow];
  }
}

uint64_t __64__PKAccountPassMakeDefaultViewContoller__presentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  [(PKExplanationViewController *)self showNavigationBarSpinner:0];
  if (v4)
  {
    objc_super v5 = [(PKAccountPassMakeDefaultViewContoller *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKAccountPassMakeDefaultViewContoller *)self _terminateSetupFlow];
  }
}

uint64_t __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) showNavigationBarSpinner:1];
  [*(id *)(*(void *)(a1 + 32) + 1040) endProvisioningFlow];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 1040);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke_2;
  v5[3] = &unk_1E59CB6B0;
  v5[4] = v2;
  return [v3 nextViewControllerWithCompletion:v5];
}

uint64_t __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke_2(uint64_t a1, uint64_t a2)
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
    id v5 = [(PKAccountPassMakeDefaultViewContoller *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  if (a3)
  {
    id v8 = (id)[a3 mutableCopy];
    [v8 setObject:*MEMORY[0x1E4F865E0] forKey:*MEMORY[0x1E4F86730]];
    id v4 = (void *)MEMORY[0x1E4F843E0];
    id v5 = (void *)[v8 copy];
    uint64_t v6 = [(PKAccountFlowController *)self->_accountController accountCredential];
    uint64_t v7 = [v6 paymentPass];
    [v4 reportDashboardEventIfNecessary:v5 forPass:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_makeDefaultPostProvisioningContent, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end