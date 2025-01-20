@interface PKPeerPaymentPassActivationViewController
- (BOOL)_shouldShowAddDebitCardViewController;
- (BOOL)shouldPushTerms;
- (PKPeerPaymentPassActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3;
- (id)_bodyStringForState;
- (id)_titleStringForState;
- (void)_beginSetup;
- (void)_handleActivatedState;
- (void)_invalidateCLInUseAssertion;
- (void)_presentActivationFailedErrorAlert;
- (void)_presentDisplayableError:(id)a3;
- (void)_setState:(unint64_t)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_terminateSetupFlow;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentPassActivationViewController

- (PKPeerPaymentPassActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentPassActivationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6)
  {
    p_peerPaymentSetupFlowController = (id *)&v6->_peerPaymentSetupFlowController;
    objc_storeStrong((id *)&v6->_peerPaymentSetupFlowController, a3);
    [*p_peerPaymentSetupFlowController setParentViewController:v7];
    v9 = [*p_peerPaymentSetupFlowController configuration];
    uint64_t v10 = [v9 peerPaymentSetupConfigurationType];

    if (!v10)
    {
      v11 = [*p_peerPaymentSetupFlowController configuration];
      v12 = [v11 setupDelegate];
      objc_storeWeak((id *)&v7->_setupDelegate, v12);
    }
    v7->_operations = 58;
    v13 = [(PKExplanationViewController *)v7 explanationView];
    v14 = [PKPeerPaymentSetupFlowHeroView alloc];
    v15 = [v5 passSnapShot];
    v16 = [v5 peerPaymentCredential];
    uint64_t v17 = [(PKPeerPaymentSetupFlowHeroView *)v14 initWithPeerPaymentPassSnapShot:v15 peerPaymentCredential:v16];
    heroView = v7->_heroView;
    v7->_heroView = (PKPeerPaymentSetupFlowHeroView *)v17;

    [v13 setHeroView:v7->_heroView];
    v19 = [(PKPeerPaymentPassActivationViewController *)v7 navigationItem];
    [v19 setHidesBackButton:1 animated:0];

    [(PKExplanationViewController *)v7 setShowCancelButton:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentPassActivationViewController;
  [(PKExplanationViewController *)&v6 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  id v5 = [v4 footerView];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  [v3 setTopMargin:12.0];
  [v5 setManualEntryButton:0];
  [v5 setSetupLaterButton:0];
  [(PKPeerPaymentPassActivationViewController *)self _beginSetup];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPeerPaymentPassActivationViewController *)self _invalidateCLInUseAssertion];
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentPassActivationViewController;
  [(PKPeerPaymentPassActivationViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(PKPeerPaymentPassActivationViewController *)self _invalidateCLInUseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentPassActivationViewController;
  [(PKPeerPaymentPassActivationViewController *)&v3 dealloc];
}

- (void)_invalidateCLInUseAssertion
{
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (BOOL)shouldPushTerms
{
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (self->_state == 2) {
    [(PKPeerPaymentPassActivationViewController *)self _handleActivatedState];
  }
  else {
    [(PKPeerPaymentPassActivationViewController *)self _terminateSetupFlow];
  }
}

- (void)_terminateSetupFlow
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v9, 2u);
  }

  v4 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController flowItemDelegate];
  objc_super v5 = v4;
  if (v4)
  {
    [v4 peerPaymentSetupFlowControllerDidFinish:self->_peerPaymentSetupFlowController];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v7 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained viewControllerDidTerminateSetupFlow:self];
    }
    else
    {
      v8 = [(PKPeerPaymentPassActivationViewController *)self presentingViewController];
      [v8 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_beginSetup
{
  [(PKPeerPaymentPassActivationViewController *)self _setState:1];
  if (!self->_inUseAssertion)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1E5E8];
    v4 = PKPassKitCoreBundle();
    objc_super v5 = (CLInUseAssertion *)[v3 newAssertionForBundle:v4 withReason:@"Peer Payment registration"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v5;
  }
  peerPaymentSetupFlowController = self->_peerPaymentSetupFlowController;
  unint64_t operations = self->_operations;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke;
  v9[3] = &unk_1E59CC380;
  v9[4] = self;
  [(PKPeerPaymentSetupFlowController *)peerPaymentSetupFlowController nextViewControllerAfterPerfomingOperations:operations completion:v9];
}

void __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  [*(id *)(a1 + 32) _invalidateCLInUseAssertion];
  if (v8)
  {
    [*(id *)(a1 + 32) _presentDisplayableError:v8];
    [*(id *)(a1 + 32) _showSpinner:0];
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) _showSpinner:0];
    [*(id *)(a1 + 32) _terminateSetupFlow];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v10 = [v9 navigationController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke_2;
      v11[3] = &unk_1E59CB6D8;
      v11[4] = *(void *)(a1 + 32);
      objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v7, 1, v11);
    }
    else
    {
      [v9 _setState:2];
    }
  }
}

uint64_t __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  self->_unint64_t state = a3;
  id v21 = [(PKExplanationViewController *)self explanationView];
  unint64_t state = self->_state;
  if (!state)
  {
    [(PKPeerPaymentPassActivationViewController *)self _showSpinner:0];
    [(PKPeerPaymentPassActivationViewController *)self _presentActivationFailedErrorAlert];
    goto LABEL_17;
  }
  if (state != 2)
  {
    if (state == 1)
    {
      objc_super v5 = [(PKPeerPaymentPassActivationViewController *)self _titleStringForState];
      [v21 setTitleText:v5];

      objc_super v6 = [(PKPeerPaymentPassActivationViewController *)self _bodyStringForState];
      [v21 setBodyText:v6];

      [v21 setTitleLineBreakStrategy:1];
      [(PKPeerPaymentPassActivationViewController *)self _showSpinner:1];
      id v7 = [(PKExplanationViewController *)self explanationView];
      id v8 = [v7 dockView];
      [v8 setHidden:1];

      v9 = [(PKPeerPaymentPassActivationViewController *)self navigationItem];
      [v9 setRightBarButtonItem:0];
LABEL_16:
    }
LABEL_17:
    v20 = [(PKPeerPaymentPassActivationViewController *)self view];
    PKPaymentSetupApplyContextAppearance([(PKExplanationViewController *)self context], v20);
    [v20 setNeedsLayout];

    goto LABEL_18;
  }
  [(PKExplanationViewController *)self context];
  if (!PKPaymentSetupContextIsSetupAssistant())
  {
    uint64_t v10 = [(PKPeerPaymentPassActivationViewController *)self _titleStringForState];
    [v21 setTitleText:v10];

    v11 = [(PKPeerPaymentPassActivationViewController *)self _bodyStringForState];
    [v21 setBodyText:v11];

    [v21 setTitleLineBreakStrategy:1];
    [(PKPeerPaymentPassActivationViewController *)self _showSpinner:0];
    if (self->_state == 2)
    {
      v12 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentCredential];
      uint64_t v13 = [v12 flowState];

      if (v13 == 2) {
        [(PKPeerPaymentSetupFlowHeroView *)self->_heroView startAnimation];
      }
    }
    v14 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentWebService];
    v15 = [v14 targetDevice];
    [v15 setUserHasDisabledPeerPayment:0];

    v16 = [(PKExplanationViewController *)self explanationView];
    v9 = [v16 dockView];

    [v9 setHidden:0];
    BOOL v17 = [(PKPeerPaymentPassActivationViewController *)self _shouldShowAddDebitCardViewController];
    self->_shouldShowAddDebitCardViewController = v17;
    v18 = [v9 primaryButton];
    if (v17) {
      PKLocalizedPaymentString(&cfstr_Continue.isa);
    }
    else {
    v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet.isa);
    }
    [v18 setTitle:v19 forState:0];

    goto LABEL_16;
  }
  [(PKPeerPaymentPassActivationViewController *)self _handleActivatedState];
LABEL_18:
}

- (void)_handleActivatedState
{
  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsBridge() & 1) != 0
    || (-[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController"), v3 = objc_claimAutoreleasedReturnValue(), [v3 credentialProvisioningQueue], v4 = objc_claimAutoreleasedReturnValue(), uint64_t v5 = objc_msgSend(v4, "remaining"), v4, v3, v5)|| !self->_shouldShowAddDebitCardViewController)
  {
    [(PKPeerPaymentPassActivationViewController *)self _terminateSetupFlow];
  }
  else
  {
    id v7 = [[PKPaymentAddDebitCardViewController alloc] initWithPeerPaymentSetupFlowController:self->_peerPaymentSetupFlowController];
    objc_super v6 = [(PKPeerPaymentPassActivationViewController *)self navigationController];
    [v6 pushViewController:v7 animated:1];
  }
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKPeerPaymentPassActivationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    uint64_t v5 = [(PKPeerPaymentPassActivationViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKPeerPaymentPassActivationViewController *)self _terminateSetupFlow];
  }
}

uint64_t __70__PKPeerPaymentPassActivationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

- (void)_presentActivationFailedErrorAlert
{
  objc_super v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_0.isa);
  id v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_1.isa);
  PKDisplayableErrorCustom();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(PKPeerPaymentPassActivationViewController *)self _presentDisplayableError:v5];
}

- (BOOL)_shouldShowAddDebitCardViewController
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController provisioningController];
  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsBridge() & 1) != 0
    || ([v3 credentialProvisioningQueue],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 remaining],
        v4,
        v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    id v8 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController paymentWebService];
    v9 = [v8 targetDevice];

    [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController passesIncludingPeerPaymentPass:0 isCheckingTotalPassCount:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "devicePrimaryPaymentApplication", (void)v23);
          uint64_t v16 = [v15 paymentType];

          if (v16 == 1)
          {

            BOOL v6 = 0;
            goto LABEL_24;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if (PKDisableDynamicSEAllocation()
      && (uint64_t v17 = objc_msgSend(v10, "pk_countObjectsPassingTest:", &__block_literal_global_17)) != 0)
    {
      unint64_t v18 = v17;
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v19 = [v9 maximumPaymentCards];
      }
      else
      {
        v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138543362;
          v28 = v22;
          _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to max payment cards. Assuming local maximum.", buf, 0xCu);
        }
        uint64_t v19 = PKMaxPaymentCards();
      }
      BOOL v6 = v19 - 1 >= v18;
    }
    else
    {
      BOOL v6 = 1;
    }
LABEL_24:
  }
  return v6;
}

BOOL __82__PKPeerPaymentPassActivationViewController__shouldShowAddDebitCardViewController__block_invoke(uint64_t a1, void *a2)
{
  return [a2 passActivationState] != 4;
}

- (id)_titleStringForState
{
  unint64_t state = self->_state;
  if (state == 1)
  {
    objc_super v3 = @"PEER_PAYMENT_ACTIVATING";
    goto LABEL_5;
  }
  if (state == 2)
  {
    objc_super v3 = @"PEER_PAYMENT_ACTIVATED";
LABEL_5:
    id v4 = PKLocalizedPeerPaymentString(&v3->isa);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)_bodyStringForState
{
  objc_super v3 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentCredential];
  id v4 = v3;
  if (self->_state == 2)
  {
    uint64_t v5 = [v3 flowState];
    if (v5 == 2)
    {
      id v8 = [v4 pendingPaymentSenderName];
      id v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_3.isa, &stru_1EF1B4C70.isa, v8);
    }
    else
    {
      if (v5 == 1) {
        BOOL v6 = @"PEER_PAYMENT_SETUP_ACTIVATED_INCOMING_PAYMENT_MESSAGE";
      }
      else {
        BOOL v6 = @"PEER_PAYMENT_SETUP_ACTIVATED_DEFAULT_MESSAGE";
      }
      id v7 = PKLocalizedPeerPaymentString(&v6->isa);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowSpinner:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_heroView, 0);

  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end