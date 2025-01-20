@interface PKPeerPaymentAddAssociatedAccountViewController
- (BOOL)shouldPushTerms;
- (PKPeerPaymentAddAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8 setupType:(int64_t)a9;
- (id)_imageForWatchView;
- (void)_invalidateCLInUseAssertion;
- (void)_presentDisplayableError:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_terminateAddAssociatedAccountFlow;
- (void)dealloc;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentAddAssociatedAccountViewController

- (PKPeerPaymentAddAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8 setupType:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v32 = a5;
  id v18 = a6;
  id v19 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  v20 = [(PKExplanationViewController *)&v33 initWithContext:a8];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_familyMember, a3);
    objc_storeStrong((id *)&v21->_familyCollection, a4);
    objc_storeStrong((id *)&v21->_webService, a5);
    v21->_setupType = a9;
    v22 = [(PKPeerPaymentWebService *)v21->_webService peerPaymentService];
    uint64_t v23 = [v22 account];
    peerPaymentAccount = v21->_peerPaymentAccount;
    v21->_peerPaymentAccount = (PKPeerPaymentAccount *)v23;

    v25 = [[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration alloc] initWithFamilyMember:v21->_familyMember associatedAccountSetupDelegate:v19 setupType:v21->_setupType];
    configuration = v21->_configuration;
    v21->_configuration = v25;

    v27 = (void *)[objc_alloc(MEMORY[0x1E4F84D90]) initWithPeerPaymentAccount:v21->_peerPaymentAccount];
    v28 = [[PKPeerPaymentSetupFlowController alloc] initWithPeerPaymentCredential:v27 provisioningController:0 passLibraryDataProvider:v18 configuration:v21->_configuration context:a8];
    peerPaymentSetupFlowController = v21->_peerPaymentSetupFlowController;
    v21->_peerPaymentSetupFlowController = v28;

    [(PKPeerPaymentSetupFlowController *)v21->_peerPaymentSetupFlowController setParentViewController:v21];
    [(PKExplanationViewController *)v21 setShowCancelButton:PKPaymentSetupContextIsSetupAssistant() ^ 1];
    v21->_operations = 127;
    v30 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 16);
    [(PKExplanationViewController *)v21 setPrivacyLinkController:v30];
  }
  return v21;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  [(PKExplanationViewController *)&v28 viewDidLoad];
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing])
  {
    [(PKExplanationViewController *)self context];
    int IsBridge = PKPaymentSetupContextIsBridge();
    [(PKExplanationViewController *)self context];
    int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    v5 = [(PKExplanationViewController *)self explanationView];
    [v5 setDelegate:self];
    [v5 setShowPrivacyView:1];
    if ((IsBridge & 1) == 0)
    {
      v6 = PKPassKitUIBundle();
      v7 = [v6 URLForResource:@"AppleCashIcon" withExtension:@"pdf"];
      double v8 = PKUIScreenScale();
      v9 = PKUIImageFromPDF(v7, 80.0, 80.0, v8);

      [v5 setImage:v9];
      v10 = [v5 imageView];
      [v10 setClipsToBounds:1];
      [v10 _setContinuousCornerRadius:20.0];
      [v5 setTopMargin:30.0];
    }
    v11 = [v5 dockView];
    v12 = [v11 footerView];
    [v12 setManualEntryButton:0];
    v13 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_5.isa);
    [v5 setBodyButtonText:v13];

    int64_t setupType = self->_setupType;
    if (setupType == 1)
    {
      id v19 = PKLocalizedMadisonString(&cfstr_AccountUserAdd.isa);
      [v5 setTitleText:v19];

      v20 = [(PKFamilyMember *)self->_familyMember firstName];
      v21 = PKLocalizedMadisonString(&cfstr_AccountUserAdd_0.isa, &stru_1EF1B4C70.isa, v20);
      [v5 setBodyText:v21];

      if (!IsSetupAssistant)
      {
LABEL_13:
        if (IsBridge)
        {
          uint64_t v23 = objc_alloc_init(PKWatchDeviceImageOverlayView);
          watchDeviceImageView = self->_watchDeviceImageView;
          self->_watchDeviceImageView = v23;

          v25 = self->_watchDeviceImageView;
          v26 = [(PKPeerPaymentAddAssociatedAccountViewController *)self _imageForWatchView];
          [(PKWatchDeviceImageOverlayView *)v25 setOverlayImage:v26];

          [v5 setBodyView:self->_watchDeviceImageView];
        }

        goto LABEL_16;
      }
      id v17 = [v12 setupLaterButton];
      uint64_t v18 = PKLocalizedMadisonString(&cfstr_AccountUserAdd_1.isa);
    }
    else
    {
      if (setupType) {
        goto LABEL_13;
      }
      v15 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_6.isa);
      [v5 setTitleText:v15];

      id v16 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_7.isa);
      [v5 setBodyText:v16];

      if (!IsSetupAssistant) {
        goto LABEL_13;
      }
      id v17 = [v12 setupLaterButton];
      uint64_t v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_8.isa);
    }
    v22 = (void *)v18;
    [v17 setTitle:v18 forState:0];

    goto LABEL_13;
  }
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
  }
LABEL_16:
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  [(PKPeerPaymentAddAssociatedAccountViewController *)&v13 viewDidAppear:a3];
  if (([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing] & 1) == 0)
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v12, 2u);
    }

    v5 = (void *)MEMORY[0x1E4FB1418];
    v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea.isa);
    v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea_0.isa);
    double v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = (void *)MEMORY[0x1E4FB1410];
    v10 = PKLocalizedString(&cfstr_Ok.isa);
    v11 = [v9 actionWithTitle:v10 style:0 handler:0];

    [v8 addAction:v11];
    [(PKPeerPaymentAddAssociatedAccountViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPeerPaymentAddAssociatedAccountViewController *)self _invalidateCLInUseAssertion];
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  [(PKPeerPaymentAddAssociatedAccountViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(PKPeerPaymentAddAssociatedAccountViewController *)self _invalidateCLInUseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  [(PKPeerPaymentAddAssociatedAccountViewController *)&v3 dealloc];
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
  [(PKPeerPaymentAddAssociatedAccountViewController *)self _showSpinner:1];
  if (!self->_inUseAssertion)
  {
    v4 = (void *)MEMORY[0x1E4F1E5E8];
    objc_super v5 = PKPassKitCoreBundle();
    v6 = (CLInUseAssertion *)[v4 newAssertionForBundle:v5 withReason:@"Peer Payment Associated Account registration"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;
  }
  peerPaymentSetupFlowController = self->_peerPaymentSetupFlowController;
  unint64_t operations = self->_operations;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PKPeerPaymentAddAssociatedAccountViewController_explanationViewDidSelectContinue___block_invoke;
  v10[3] = &unk_1E59CC380;
  v10[4] = self;
  [(PKPeerPaymentSetupFlowController *)peerPaymentSetupFlowController nextViewControllerAfterPerfomingOperations:operations completion:v10];
}

void __84__PKPeerPaymentAddAssociatedAccountViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  [*(id *)(a1 + 32) _invalidateCLInUseAssertion];
  if (v8)
  {
    [*(id *)(a1 + 32) _presentDisplayableError:v8];
LABEL_6:
    [*(id *)(a1 + 32) _showSpinner:0];
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_6;
  }
  if (v7)
  {
    v9 = [*(id *)(a1 + 32) navigationController];
    [v9 pushViewController:v7 animated:1];

    goto LABEL_6;
  }
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "There was no error, cancelation, or next view controller to show for the add peer payment associated account flow. Terminating flow.", v11, 2u);
  }

  [*(id *)(a1 + 32) _terminateAddAssociatedAccountFlow];
LABEL_7:
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v4 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)self->_configuration associatedAccountSetupDelegate];
  id v5 = v4;
  if (v4) {
    [v4 addPeerPaymentAssociatedAccountDidSkipSetupForFamilyMember:self->_familyMember];
  }
  else {
    [(PKPeerPaymentAddAssociatedAccountViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/legal/privacy/en-ww/parent-disclosure/"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
  [v4 setModalPresentationStyle:2];
  [(PKPeerPaymentAddAssociatedAccountViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PKPeerPaymentAddAssociatedAccountViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    id v5 = [(PKPeerPaymentAddAssociatedAccountViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKPeerPaymentAddAssociatedAccountViewController *)self _terminateAddAssociatedAccountFlow];
  }
}

uint64_t __76__PKPeerPaymentAddAssociatedAccountViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateAddAssociatedAccountFlow];
}

- (void)_terminateAddAssociatedAccountFlow
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating peer payment add associated account", v6, 2u);
  }

  id v4 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)self->_configuration associatedAccountSetupDelegate];
  id v5 = v4;
  if (v4) {
    [v4 addPeerPaymentAssociatedAccountSetupCompletedWithSucess:0 updatedAccount:0 forFamilyMember:self->_familyMember];
  }
  else {
    [(PKPeerPaymentAddAssociatedAccountViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKExplanationViewController *)self explanationView];
  id v11 = [v5 dockView];

  v6 = [v11 primaryButton];
  [v6 setShowSpinner:v3];

  uint64_t v7 = v3 ^ 1;
  [v11 setButtonsEnabled:v7];
  id v8 = [(PKPeerPaymentAddAssociatedAccountViewController *)self navigationItem];
  v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:v7];

  v10 = [v8 rightBarButtonItem];
  [v10 setEnabled:v7];
}

- (id)_imageForWatchView
{
  unint64_t v2 = +[PKBridgeWatchAttributeController heroWatchSize];
  if (v2 <= 4)
  {
    BOOL v3 = PKUIImageNamed(off_1E59D94A0[v2]);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end