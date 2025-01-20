@interface PKPeerPaymentExplanationViewController
- (BOOL)allowsManualEntry;
- (BOOL)shouldPushTerms;
- (PKPeerPaymentExplanationViewController)initWithProvisoningController:(id)a3 setupDelegate:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6 credential:(id)a7;
- (id)_bodyText;
- (id)_titleText;
- (void)_addDifferentCard;
- (void)_presentDisplayableError:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_terminateSetupFlow;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentExplanationViewController

- (PKPeerPaymentExplanationViewController)initWithProvisoningController:(id)a3 setupDelegate:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6 credential:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentExplanationViewController;
  v16 = [(PKExplanationViewController *)&v31 initWithContext:a6];
  if (v16)
  {
    v17 = [[PKPeerPaymentSetupFlowProvisionConfiguration alloc] initWithSetupDelegate:v13];
    configuration = v16->_configuration;
    v16->_configuration = v17;

    uint64_t v19 = [v15 account];
    peerPaymentAccount = v16->_peerPaymentAccount;
    v16->_peerPaymentAccount = (PKPeerPaymentAccount *)v19;

    v21 = [[PKPeerPaymentSetupFlowController alloc] initWithPeerPaymentCredential:v15 provisioningController:v12 passLibraryDataProvider:v14 configuration:v16->_configuration context:a6];
    peerPaymentSetupFlowController = v16->_peerPaymentSetupFlowController;
    v16->_peerPaymentSetupFlowController = v21;

    [(PKPeerPaymentSetupFlowController *)v16->_peerPaymentSetupFlowController setParentViewController:v16];
    v16->_operations = 31;
    v23 = [(PKExplanationViewController *)v16 explanationView];
    v24 = [PKPeerPaymentSetupFlowHeroView alloc];
    v25 = [(PKPeerPaymentSetupFlowController *)v16->_peerPaymentSetupFlowController passSnapShot];
    v26 = [(PKPeerPaymentSetupFlowHeroView *)v24 initWithPeerPaymentPassSnapShot:v25 peerPaymentCredential:v15];

    [v23 setHeroView:v26];
    int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    if (IsSetupAssistant)
    {
      v28 = [(PKPeerPaymentExplanationViewController *)v16 navigationItem];
      [v28 setHidesBackButton:0 animated:0];
    }
    [(PKExplanationViewController *)v16 setShowCancelButton:IsSetupAssistant ^ 1u];
    v29 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 2);
    [(PKExplanationViewController *)v16 setPrivacyLinkController:v29];
  }
  return v16;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentExplanationViewController;
  [(PKExplanationViewController *)&v20 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [(PKPeerPaymentExplanationViewController *)self _titleText];
  [v3 setTitleText:v4];

  v5 = [(PKPeerPaymentExplanationViewController *)self _bodyText];
  [v3 setBodyText:v5];

  if (PKPeerPaymentFDICSignageEnabled() && PKPeerPaymentAccountIsFDICInsured())
  {
    v6 = [[PKFDICSignageView alloc] initWithFeature:1 displayingBankName:0];
    [v3 setBodyViewPadding:20.0];
    [v3 setBodyView:v6];
  }
  [v3 setShowPrivacyView:1];
  [v3 setDelegate:self];
  [v3 setTopMargin:12.0];
  [v3 setBodyDataDetectorTypes:0];
  v7 = [v3 dockView];
  v8 = [v7 footerView];
  v9 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController provisioningController];
  v10 = [v9 credentialProvisioningQueue];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [v8 skipCardButton];
    [v12 addTarget:self action:sel__terminateSetupFlow forControlEvents:0x2000];
  }
  if (self->_hidesSetupLater)
  {
    [v8 setSetupLaterButton:0];
    goto LABEL_12;
  }
  id v13 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentCredential];
  if ([v13 paymentMode] == 2)
  {
    [(PKExplanationViewController *)self context];
    int IsSystemOverlay = PKPaymentSetupContextIsSystemOverlay();

    if (!IsSystemOverlay) {
      goto LABEL_12;
    }
    id v13 = [v8 secondaryActionButton];
    id v15 = PKLocalizedNearbyPeerPaymentString(&cfstr_NearbyPaymentR.isa);
    [v13 setTitle:v15 forState:0];

    v16 = [v13 titleLabel];
    v17 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [v16 setFont:v17];

    [v13 addTarget:self action:sel__terminateSetupFlow forControlEvents:0x2000];
    [(PKExplanationViewController *)self setShowCancelButton:0];
  }

LABEL_12:
  if (self->_allowsManualEntry)
  {
    v18 = [v8 manualEntryButton];
    uint64_t v19 = PKLocalizedPaymentString(&cfstr_AddADifferentC.isa);
    [v18 setTitle:v19 forState:0];

    [v18 addTarget:self action:sel__addDifferentCard forControlEvents:0x2000];
  }
  else
  {
    [v8 setManualEntryButton:0];
  }
}

- (BOOL)shouldPushTerms
{
  return 1;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  [(PKPeerPaymentExplanationViewController *)self _showSpinner:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  v16[0] = &unk_1EF2B8AA8;
  v6 = PKLocalizedShareableCredentialString(&cfstr_LocalAuthentic.isa);
  v17[0] = v6;
  v16[1] = &unk_1EF2B8AC0;
  v7 = PKLocalizedString(&cfstr_Wallet_0.isa);
  v16[2] = &unk_1EF2B8AD8;
  v17[1] = v7;
  v17[2] = MEMORY[0x1E4F1CC38];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_84;
  v11[3] = &unk_1E59CD2A8;
  id v13 = self;
  id v14 = v4;
  id v12 = v5;
  id v9 = v4;
  id v10 = v5;
  [v10 evaluatePolicy:1025 options:v8 reply:v11];
}

uint64_t __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 1048);
  uint64_t v3 = *(void *)(v1 + 1040);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v5[3] = &unk_1E59CC380;
  v5[4] = v1;
  return [v2 nextViewControllerAfterPerfomingOperations:v3 completion:v5];
}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    [*(id *)(a1 + 32) _presentDisplayableError:v8];
LABEL_4:
    [*(id *)(a1 + 32) _showSpinner:0];
    goto LABEL_5;
  }
  if (a3) {
    goto LABEL_4;
  }
  id v9 = *(void **)(a1 + 32);
  if (v7)
  {
    id v10 = [v9 navigationController];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
    v11[3] = &unk_1E59CB6D8;
    void v11[4] = *(void *)(a1 + 32);
    objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v7, 1, v11);
  }
  else
  {
    [v9 _terminateSetupFlow];
  }
LABEL_5:
}

uint64_t __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2_85;
  block[3] = &unk_1E59CD0E0;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2_85(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 48) externalizedContext];
  }
  else
  {
    v2 = 0;
  }
  [*(id *)(a1 + 48) invalidate];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"Y";
    if (!v2) {
      v4 = @"N";
    }
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentExplanationViewController requested local auth and returning %@.", (uint8_t *)&v5, 0xCu);
  }

  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    [*(id *)(a1 + 56) _showSpinner:0];
  }
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PKPeerPaymentExplanationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    int v5 = [(PKPeerPaymentExplanationViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKPeerPaymentExplanationViewController *)self _terminateSetupFlow];
  }
}

uint64_t __67__PKPeerPaymentExplanationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

- (void)_addDifferentCard
{
  uint64_t v3 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController provisioningController];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84ED0]), "initWithEnvironment:provisioningController:groupsController:", -[PKExplanationViewController context](self, "context"), v3, 0);
  int v5 = objc_alloc_init(PKNavigationController);
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __59__PKPeerPaymentExplanationViewController__addDifferentCard__block_invoke;
  id v9 = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  +[PKProvisioningFlowBridge startManualEntryFlowWithNavController:v5 context:v4 completion:&v6];
  -[PKPeerPaymentExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__PKPeerPaymentExplanationViewController__addDifferentCard__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _terminateSetupFlow];
}

- (id)_titleText
{
  v2 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentCredential];
  if ([v2 paymentMode] == 2) {
    PKLocalizedNearbyPeerPaymentString(&cfstr_NearbyPaymentR_0.isa);
  }
  else {
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_5.isa);
  }

  return v3;
}

- (id)_bodyText
{
  id v3 = [(PKPeerPaymentSetupFlowController *)self->_peerPaymentSetupFlowController peerPaymentCredential];
  uint64_t v4 = [v3 flowState];
  switch(v4)
  {
    case 6:
      int v5 = @"PEER_PAYMENT_SETUP_DAILY_CASH_MESSAGE";
      goto LABEL_6;
    case 2:
      uint64_t v7 = [v3 pendingPaymentSenderName];
      if (v7)
      {
        if ([v3 paymentMode] == 2) {
          PKLocalizedNearbyPeerPaymentString(&cfstr_NearbyPaymentR_1.isa, &stru_1EF1B4C70.isa, v7);
        }
        else {
        uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_7.isa, &stru_1EF1B4C70.isa, v7);
        }
      }
      else
      {
        uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_6.isa);
      }
      break;
    case 1:
      int v5 = @"PEER_PAYMENT_SETUP_INCOMING_PAYMENT_MESSAGE";
LABEL_6:
      PKLocalizedPeerPaymentString(&v5->isa);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    default:
      [(PKExplanationViewController *)self context];
      int IsBridge = PKPaymentSetupContextIsBridge();
      PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_SETUP_DEFAULT_MESSAGE", IsBridge);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = PKLocalizedPeerPaymentRecurringString(v7);
      break;
  }
  id v6 = (id)v8;

LABEL_15:
  if (PKPeerPaymentFDICSignageEnabled())
  {
    if (PKPeerPaymentAccountIsFDICInsured()) {
      id v10 = @"FDIC_BANK_ATTRIBUTION_INSURED";
    }
    else {
      id v10 = @"FDIC_BANK_ATTRIBUTION_ELIGIBLE";
    }
    id v11 = PKLocalizedPeerPaymentString(&v10->isa);
    id v12 = v11;
    if (v6)
    {
      uint64_t v13 = [v6 stringByAppendingFormat:@"\n\n%@", v11];

      id v6 = (id)v13;
    }
    else
    {
      id v6 = v11;
    }
  }

  return v6;
}

- (void)_terminateSetupFlow
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating peer payment setup flow", v6, 2u);
  }

  uint64_t v4 = [(PKPeerPaymentSetupFlowProvisionConfiguration *)self->_configuration setupDelegate];
  int v5 = v4;
  if (v4) {
    [v4 viewControllerDidTerminateSetupFlow:self];
  }
  else {
    [(PKPeerPaymentExplanationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PKExplanationViewController *)self explanationView];
  id v11 = [v5 dockView];

  id v6 = [v11 primaryButton];
  [v6 setShowSpinner:v3];

  uint64_t v7 = v3 ^ 1;
  [v11 setButtonsEnabled:v7];
  uint64_t v8 = [(PKPeerPaymentExplanationViewController *)self navigationItem];
  id v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:v7];

  id v10 = [v8 rightBarButtonItem];
  [v10 setEnabled:v7];
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);

  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end