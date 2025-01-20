@interface PKPaymentAddDebitCardViewController
- (BOOL)shouldPushTerms;
- (BOOL)showDebitCardHeroView;
- (NSString)bodyText;
- (NSString)titleText;
- (PKPaymentAddDebitCardViewController)initWithPeerPaymentSetupFlowController:(id)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (void)_handleProvisioningError:(id)a3;
- (void)_presentPaymentSetupController;
- (void)_terminateSetupFlow;
- (void)setBodyText:(id)a3;
- (void)setShowDebitCardHeroView:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentAddDebitCardViewController

- (PKPaymentAddDebitCardViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentAddDebitCardViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v26, sel_initWithContext_, [v5 context]);
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
    v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAdd.isa);
    [(PKPaymentAddDebitCardViewController *)v7 setTitleText:v13];

    v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAdd_0.isa);
    [(PKPaymentAddDebitCardViewController *)v7 setBodyText:v14];

    v15 = [(PKExplanationViewController *)v7 explanationView];
    [v15 setShowPrivacyView:0];
    [v15 setDelegate:v7];
    v16 = [(PKExplanationViewController *)v7 explanationView];
    v17 = [v16 dockView];

    v18 = [v17 primaryButton];
    v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAdd_1.isa);
    [v18 setTitle:v19 forState:0];

    [v15 setForceShowSetupLaterButton:1];
    v20 = [v17 footerView];
    [v20 setManualEntryButton:0];

    [(PKExplanationViewController *)v7 context];
    LODWORD(v20) = PKPaymentSetupContextIsSetupAssistant();
    v21 = [v17 footerView];
    v22 = [v21 setupLaterButton];
    PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_ADD_CARD_LATER_TITLE", (int)v20);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v24 = PKLocalizedPeerPaymentString(v23);
    [v22 setTitle:v24 forState:0];

    [(PKPaymentAddDebitCardViewController *)v7 setShowDebitCardHeroView:1];
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAddDebitCardViewController;
  [(PKExplanationViewController *)&v4 viewDidLoad];
  v3 = [(PKPaymentAddDebitCardViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];
  [v3 setRightBarButtonItem:0];
  [v3 setHidesBackButton:1 animated:0];
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  titleText = self->_titleText;
  v11 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v11)
  {

    v9 = v11;
LABEL_9:

    goto LABEL_10;
  }
  if (!v11 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v11 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    uint64_t v10 = [(PKExplanationViewController *)self explanationView];
    [v10 setTitleText:self->_titleText];

    v9 = [(PKPaymentAddDebitCardViewController *)self view];
    [v9 setNeedsLayout];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setBodyText:(id)a3
{
  id v5 = a3;
  bodyText = self->_bodyText;
  v11 = (NSString *)v5;
  v7 = bodyText;
  if (v7 == v11)
  {

    v9 = v11;
LABEL_9:

    goto LABEL_10;
  }
  if (!v11 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v11 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_bodyText, a3);
    uint64_t v10 = [(PKExplanationViewController *)self explanationView];
    [v10 setBodyText:self->_bodyText];

    v9 = [(PKPaymentAddDebitCardViewController *)self view];
    [v9 setNeedsLayout];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setShowDebitCardHeroView:(BOOL)a3
{
  if (self->_showDebitCardHeroView != a3)
  {
    self->_showDebitCardHeroView = a3;
    if (a3)
    {
      objc_super v4 = [PKAddDebitCardHeroView alloc];
      id v5 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController passSnapShot];
      v6 = [(PKAddDebitCardHeroView *)v4 initWithPassSnapShot:v5];

      v7 = [(PKExplanationViewController *)self explanationView];
      [v7 setHeroView:v6];
    }
    else
    {
      v6 = [(PKExplanationViewController *)self explanationView];
      [(PKAddDebitCardHeroView *)v6 setHeroView:0];
    }

    id v8 = [(PKPaymentAddDebitCardViewController *)self view];
    [v8 setNeedsLayout];
  }
}

- (BOOL)shouldPushTerms
{
  return 0;
}

- (void)_presentPaymentSetupController
{
  v3 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController provisioningController];
  [(PKExplanationViewController *)self context];
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84ED0]), "initWithEnvironment:provisioningController:groupsController:", -[PKExplanationViewController context](self, "context"), v3, 0);
    id v5 = objc_alloc_init(PKNavigationController);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke;
    v8[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v9, &location);
    +[PKProvisioningFlowBridge startManualEntryFlowWithNavController:v5 context:v4 completion:v8];
    [(PKPaymentAddDebitCardViewController *)self presentViewController:v5 animated:1 completion:0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKExplanationViewController *)self showNavigationBarSpinner:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_2;
    v6[3] = &unk_1E59CDC80;
    v6[4] = self;
    id v7 = v3;
    [v7 preflightWithCompletion:v6];
  }
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _terminateSetupFlow];
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_3;
  v8[3] = &unk_1E59CDC58;
  v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 32) _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 40)];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_4;
    v7[3] = &unk_1E59CAEA8;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v2;
    id v3 = v2;
    objc_msgSend(v3, "pk_paymentSetupPreflight:", v7);
  }
  else
  {
    objc_super v4 = *(void **)(a1 + 48);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v6 = v5;
    [*(id *)(a1 + 32) _handleProvisioningError:v5];
  }
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_4(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      [*(id *)(a1 + 40) setModalPresentationStyle:3];
      objc_super v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      [v4 presentViewController:v5 withTransition:1 completion:0];
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 presentViewController:v7 animated:1 completion:0];
    }
  }
  else
  {
    PKDisplayableErrorForCommonType();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _handleProvisioningError:v8];
  }
}

- (void)_handleProvisioningError:(id)a3
{
  id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:a3];
  [(PKPaymentAddDebitCardViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:[(PKExplanationViewController *)self context]];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];
  [(PKPaymentSetupNavigationController *)v5 setAllowsManualEntry:1];

  return v5;
}

- (void)_terminateSetupFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKPaymentAddDebitCardViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (BOOL)showDebitCardHeroView
{
  return self->_showDebitCardHeroView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);

  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end