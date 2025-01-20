@interface PKPhysicalCardManualActivationViewController
- (PKPhysicalCardManualActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7 activationCode:(id)a8;
- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3;
- (void)_presentDisplayableError:(id)a3;
- (void)_setupForCurrentState;
- (void)_showSpinner:(BOOL)a3;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPhysicalCardManualActivationViewController

- (PKPhysicalCardManualActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7 activationCode:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PKPhysicalCardManualActivationViewController;
  v20 = [(PKExplanationViewController *)&v27 initWithContext:0];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_physicalCard, a7);
    v22 = [[PKPhysicalCardActionController alloc] initWithAccountService:v14 account:v15 accountUser:v16 delegate:v21];
    actionController = v21->_actionController;
    v21->_actionController = v22;

    v21->_feature = [v15 feature];
    objc_storeStrong((id *)&v21->_paymentPass, a6);
    uint64_t v24 = [v19 copy];
    activationCode = v21->_activationCode;
    v21->_activationCode = (NSString *)v24;

    v21->_businessChatSupported = +[PKBusinessChatController deviceSupportsBusinessChat];
    [(PKExplanationViewController *)v21 setShowCancelButton:1];
    [(PKExplanationViewController *)v21 setShowDoneButton:0];
  }

  return v21;
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
  v5.super_class = (Class)PKPhysicalCardManualActivationViewController;
  [(PKPhysicalCardManualActivationViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKPhysicalCardManualActivationViewController;
  [(PKExplanationViewController *)&v9 viewDidLoad];
  v3 = [(PKPhysicalCardManualActivationViewController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  v4 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  hero = self->_hero;
  self->_hero = v4;

  v6 = [(PKOrderPhysicalCardHeroView *)self->_hero artworkView];
  v7 = [(PKPhysicalCard *)self->_physicalCard nameOnCard];
  [v6 setNameOnCard:v7];

  v8 = [(PKExplanationViewController *)self explanationView];
  [v8 setShowPrivacyView:0];
  [v8 setHeroView:self->_hero];
  [v8 setImageIgnoresTopSafeArea:1];
  [(PKPhysicalCardManualActivationViewController *)self _setupForCurrentState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPhysicalCardManualActivationViewController;
  [(PKPhysicalCardManualActivationViewController *)&v6 viewWillAppear:a3];
  if (!self->_sharingClient)
  {
    v4 = (SFClient *)objc_alloc_init(MEMORY[0x1E4F9F688]);
    sharingClient = self->_sharingClient;
    self->_sharingClient = v4;

    [(SFClient *)self->_sharingClient activateAssertionWithIdentifier:@"com.apple.sharing.PreventAppleCardActivation"];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPhysicalCardManualActivationViewController;
  [(PKPhysicalCardManualActivationViewController *)&v8 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    objc_super v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  sharingClient = self->_sharingClient;
  if (sharingClient)
  {
    [(SFClient *)sharingClient invalidate];
    v7 = self->_sharingClient;
    self->_sharingClient = 0;
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  if (PKDeviceSupportsReaderMode()) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 6;
  }
  objc_super v5 = [[PKBusinessChatPhysicalCardContext alloc] initWithPaymentPass:self->_paymentPass intent:v4];
  if (!self->_businessChatController)
  {
    objc_super v6 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v6;
  }
  [(PKPhysicalCardManualActivationViewController *)self _showSpinner:1];
  objc_super v8 = self->_businessChatController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke;
  v9[3] = &unk_1E59CD658;
  v9[4] = self;
  [(PKBusinessChatController *)v8 openBusinessChatWithContext:v5 completion:v9];
}

void __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSpinner:0];
  v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    return objc_msgSend(v2, "_presentDisplayableError:");
  }
  else
  {
    return [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  int64_t state = self->_state;
  if (state == 2)
  {
    id v12 = v4;
    [(PKPhysicalCardManualActivationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (state) {
      goto LABEL_10;
    }
    id v12 = v4;
    if (!self->_inUseAssertion)
    {
      id v6 = (void *)MEMORY[0x1E4F1E5E8];
      v7 = PKPassKitCoreBundle();
      objc_super v8 = (CLInUseAssertion *)[v6 newAssertionForBundle:v7 withReason:@"Activating physical card"];
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v8;
    }
    actionController = self->_actionController;
    physicalCard = self->_physicalCard;
    if (self->_activationCode) {
      -[PKPhysicalCardActionController activatePhysicalCard:withActivationCode:](actionController, "activatePhysicalCard:withActivationCode:", physicalCard);
    }
    else {
      [(PKPhysicalCardActionController *)actionController activatePhysicalCardWithoutActivationCode:physicalCard];
    }
  }
  id v4 = v12;
LABEL_10:
}

- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKPhysicalCardManualActivationViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E59CC648;
  id v10 = v7;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__PKPhysicalCardManualActivationViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 0:
      *(void *)(*(void *)(a1 + 32) + 1088) = 0;
      goto LABEL_6;
    case 1:
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = 1;
      goto LABEL_5;
    case 2:
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = 2;
LABEL_5:
      *(void *)(v2 + 1088) = v3;
LABEL_6:
      id v4 = *(void **)(a1 + 32);
      [v4 _setupForCurrentState];
      break;
    case 3:
      *(void *)(*(void *)(a1 + 32) + 1088) = 0;
      [*(id *)(a1 + 32) _setupForCurrentState];
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        id v6 = +[PKAccountFlowController displayableErrorForError:v5 featureIdentifier:*(void *)(*(void *)(a1 + 32) + 1064) genericErrorTitle:0 genericErrorMessage:0];
        [*(id *)(a1 + 32) _presentDisplayableError:v6];
      }
      break;
    default:
      return;
  }
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  uint64_t v3 = [(PKPhysicalCardManualActivationViewController *)self view];
  id v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)_setupForCurrentState
{
  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      PKLocalizedFeatureString();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v4 = PKLocalizedFeatureString();
      uint64_t v5 = PKLocalizedFeatureString();
      id v6 = PKLocalizedFeatureString();
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      break;
    case 1:
      PKLocalizedFeatureString();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v4 = PKLocalizedFeatureString();
      uint64_t v5 = PKLocalizedFeatureString();
      id v6 = 0;
      BOOL businessChatSupported = self->_businessChatSupported;
      uint64_t v7 = 1;
      goto LABEL_7;
    case 0:
      PKLocalizedFeatureString();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v4 = PKLocalizedFeatureString();
      uint64_t v5 = PKLocalizedFeatureString();
      id v6 = 0;
      uint64_t v7 = 0;
      BOOL businessChatSupported = self->_businessChatSupported;
LABEL_7:
      uint64_t v9 = 1;
      goto LABEL_10;
    default:
      id v4 = 0;
      id v6 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v5 = 0;
      id v17 = 0;
      break;
  }
  BOOL businessChatSupported = 0;
LABEL_10:
  [(PKPhysicalCardManualActivationViewController *)self _showSpinner:v7];
  id v10 = [(PKExplanationViewController *)self explanationView];
  [v10 setForceShowSetupLaterButton:businessChatSupported];
  [v10 setBodyText:v4];
  [v10 setTitleText:v17];
  int64_t v11 = [v10 dockView];
  id v12 = [v11 primaryButton];
  [v12 setTitle:v5 forState:0];

  [v11 setButtonExplanationText:v6];
  v13 = [v10 dockView];
  id v14 = [v13 footerView];

  [v14 setSkipCardButton:0];
  [v14 setManualEntryButton:0];
  id v15 = [v14 setupLaterButton];
  id v16 = PKLocalizedFeatureString();
  [v15 setTitle:v16 forState:0];

  [(PKExplanationViewController *)self setShowCancelButton:v9];
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKExplanationViewController *)self explanationView];
  id v6 = [v5 dockView];
  [v6 setButtonsEnabled:v3 ^ 1];

  [(PKExplanationViewController *)self showNavigationBarSpinner:v3];
}

- (void)_presentDisplayableError:(id)a3
{
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  [(PKPhysicalCardManualActivationViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_hero, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_actionController, 0);

  objc_storeStrong((id *)&self->_physicalCard, 0);
}

@end