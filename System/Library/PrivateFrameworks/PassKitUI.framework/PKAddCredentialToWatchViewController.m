@interface PKAddCredentialToWatchViewController
- (BOOL)suppressFieldDetect;
- (PKAddCredentialToWatchViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (id)sharingSessionWithDelegate:(id)a3;
- (unint64_t)operation;
- (void)advanceToNextState;
- (void)dealloc;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)invalidateUserAuth;
- (void)loadView;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)presentPaymentSheetForSharingRequest:(id)a3;
- (void)resetState;
- (void)setProvisioningContext:(id)a3;
- (void)showActivityIndicator:(BOOL)a3;
- (void)showSuccessCheckmark:(BOOL)a3;
- (void)startProvisioning;
- (void)subcredentialProvisioningConfiguration:(id)a3 requestUserAuthWithCompletion:(id)a4;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKAddCredentialToWatchViewController

- (PKAddCredentialToWatchViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 provisionedPass];
  if (v9)
  {
    v10 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", [v8 setupContext]);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_flowController, a3);
      objc_storeStrong((id *)&v11->_provisioningContext, a4);
      v12 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
      heroCardView = v11->_heroCardView;
      v11->_heroCardView = v12;

      [(PKExplanationViewController *)v11 setExplanationViewControllerDelegate:v11];
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "No provisionined pass to share with", (uint8_t *)v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 _setIdleTimerDisabled:0 forReason:@"Subcredential Remote Device Pairing"];

  v4.receiver = self;
  v4.super_class = (Class)PKAddCredentialToWatchViewController;
  [(PKAddCredentialToWatchViewController *)&v4 dealloc];
}

- (unint64_t)operation
{
  return 5;
}

- (id)sharingSessionWithDelegate:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F84438] createSessionWithDelegate:a3];
  sharingSession = self->_sharingSession;
  self->_sharingSession = v4;

  v6 = self->_sharingSession;

  return v6;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)PKAddCredentialToWatchViewController;
  [(PKExplanationViewController *)&v24 loadView];
  [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext setupContext];
  uint64_t IsBridge = PKPaymentSetupContextIsBridge();
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:IsBridge];
  objc_super v4 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  v5 = [v4 organizationName];
  v6 = PKLocalizedCredentialString(&cfstr_CarKeyAddToApp.isa, &stru_1EF1B4C70.isa, v5);

  id v7 = [(PKExplanationViewController *)self explanationView];
  [v7 setDelegate:self];
  [v7 setShowPrivacyView:0];
  [v7 setTopMargin:0.0];
  [v7 setTitleText:v6];
  id v8 = PKLocalizedCredentialString(&cfstr_CarKeyAddToApp_0.isa);
  [v7 setBodyText:v8];

  [v7 setForceShowSetupLaterButton:IsBridge ^ 1];
  v9 = [v7 dockView];
  v10 = [v9 primaryButton];
  v11 = PKLocalizedPaymentString(&cfstr_AddNow.isa);
  [v10 setTitle:v11 forState:0];

  v12 = [v9 footerView];
  [v12 setSkipCardButton:0];
  [v12 setManualEntryButton:0];
  if ((IsBridge & 1) == 0)
  {
    v13 = [v12 setupLaterButton];
    v14 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
    [v13 setTitle:v14 forState:0];
  }
  objc_initWeak(&location, self);
  v15 = [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView cardImage];

  if (v4 && !v15)
  {
    [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView recommendedCardImageSize];
    double v17 = v16;
    double v19 = v18;
    v20 = +[PKPassSnapshotter sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__PKAddCredentialToWatchViewController_loadView__block_invoke;
    v21[3] = &unk_1E59CBB80;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v20, "snapshotWithPass:size:completion:", v4, v21, v17, v19);

    objc_destroyWeak(&v22);
  }
  [v7 setHeroView:self->_heroCardView];
  objc_destroyWeak(&location);
}

void __48__PKAddCredentialToWatchViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PKAddCredentialToWatchViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __48__PKAddCredentialToWatchViewController_loadView__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[133] setCardImage:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAddCredentialToWatchViewController;
  [(PKAddCredentialToWatchViewController *)&v7 viewDidAppear:a3];
  [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext setupContext];
  if (PKPaymentSetupContextIsBridge())
  {
    id v4 = self->_provisioningContext;
    uint64_t v5 = [(PKSubcredentialPairingFlowControllerContext *)v4 referralSource];
    id v6 = [(PKSubcredentialPairingFlowControllerContext *)v4 brandId];

    +[PKSubcredentialPairingAnalyticsReporter beginSubcredentialPairingSessionWithReferralSource:v5 brandId:v6 page:4];
  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:4];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddCredentialToWatchViewController;
  [(PKAddCredentialToWatchViewController *)&v5 viewWillDisappear:a3];
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v4 _setIdleTimerDisabled:0 forReason:@"Subcredential Remote Device Pairing"];

  [(PKAddCredentialToWatchViewController *)self invalidateUserAuth];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting add to watch completed view controller", buf, 2u);
  }

  id v6 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  if (v6)
  {
    [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView recommendedCardImageSize];
    double v8 = v7;
    double v10 = v9;
    v11 = +[PKPassSnapshotter sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke;
    v12[3] = &unk_1E59CBBA8;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    objc_msgSend(v11, "snapshotWithPass:size:completion:", v6, v12, v8, v10);

    objc_destroyWeak(&v14);
  }
  else if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed with no pass image", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }

  objc_destroyWeak(&location);
}

void __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[133] setCardImage:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed", (uint8_t *)v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidateUserAuth
{
  v2 = self->_LAContext;
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating user auth early", v4, 2u);
    }

    [(LAContext *)v2 invalidate];
  }
}

- (void)startProvisioning
{
  provisioningViewModel = self->_provisioningViewModel;
  id v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (provisioningViewModel)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring request to start provisioning while provisioning", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Starting to provision credential on watch", v9, 2u);
    }

    id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v6 _setIdleTimerDisabled:1 forReason:@"Subcredential Remote Device Pairing"];

    id v7 = [(PKSubcredentialPairingFlowControllerProtocol *)self->_flowController remoteDeviceProvisioningViewModelForOperation:self];
    id v8 = self->_provisioningViewModel;
    self->_provisioningViewModel = v7;

    [(PKSubcredentialProvisioningViewModelProtocol *)self->_provisioningViewModel startProvisioning];
  }
}

- (void)presentPaymentSheetForSharingRequest:(id)a3
{
  PKPaymentRequestFromSharingRequest();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
  LAContext = self->_LAContext;
  self->_LAContext = v4;

  id v6 = [self->_LAContext externalizedContext];
  [v9 setExternalizedContext:v6];

  id v7 = (PKPaymentAuthorizationCoordinator *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:v9];
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v7;

  [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator setDelegate:self];
  [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator _setPrivateDelegate:self];
  if (self->_authorizationCoordinator)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:5];
    [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator presentWithCompletion:0];
  }
}

- (void)resetState
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Resetting the state of the watch offer view controller", v6, 2u);
  }

  provisioningViewModel = self->_provisioningViewModel;
  self->_provisioningViewModel = 0;

  [(PKAppletSubcredentialSharingSession *)self->_sharingSession endSession];
  sharingSession = self->_sharingSession;
  self->_sharingSession = 0;
}

- (void)advanceToNextState
{
  if (self->_flowController)
  {
    if (self->_isAdvancing)
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      self->_isAdvancing = 1;
      objc_initWeak(buf, self);
      flowController = self->_flowController;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __58__PKAddCredentialToWatchViewController_advanceToNextState__block_invoke;
      v6[3] = &unk_1E59CBA68;
      objc_copyWeak(&v7, buf);
      [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v6];
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v5 = [(PKAddCredentialToWatchViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

void __58__PKAddCredentialToWatchViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v4 = [WeakRetained[137] provisionedRemotePass];

      if (v4)
      {
        [WeakRetained showActivityIndicator:0];
        [WeakRetained showSuccessCheckmark:1];
      }
      id v5 = [WeakRetained navigationController];
      objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:delay:completion:", v6, 1, 2000000000, 0);
    }
    else
    {
      [WeakRetained[138] provisioningFinishedWithOperation:WeakRetained];
    }
  }
}

- (void)showSuccessCheckmark:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowCheckmark:v3];
}

- (void)showActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowSpinner:v3];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Requested to add credential to watch", v7, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:4 page:4];
  [(PKAddCredentialToWatchViewController *)self showSuccessCheckmark:0];
  [(PKAddCredentialToWatchViewController *)self showActivityIndicator:1];
  id v5 = [(PKExplanationViewController *)self explanationView];
  id v6 = [v5 dockView];
  [v6 setButtonsEnabled:0];

  [(PKAddCredentialToWatchViewController *)self startProvisioning];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Requested to skip adding credential to watch", v5, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:5 page:4];
  [(PKAddCredentialToWatchViewController *)self advanceToNextState];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Requested to cancel adding to watch", v5, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:1 page:4];
  [(PKAddCredentialToWatchViewController *)self advanceToNextState];
}

- (void)subcredentialProvisioningConfiguration:(id)a3 requestUserAuthWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__PKAddCredentialToWatchViewController_subcredentialProvisioningConfiguration_requestUserAuthWithCompletion___block_invoke;
    block[3] = &unk_1E59CA938;
    void block[4] = self;
    id v11 = v7;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __109__PKAddCredentialToWatchViewController_subcredentialProvisioningConfiguration_requestUserAuthWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1080);
  *(void *)(v3 + 1080) = v2;

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) remoteDeviceConfiguration];
  id v6 = [v7 sharingRequest];
  [v5 presentPaymentSheetForSharingRequest:v6];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  v8[3] = &unk_1E59CA870;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 1096) setError:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "alertForOperation:withError:retryHandler:cancelationHandler:", MEMORY[0x1E4F143A8], 3221225472, __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_85, &unk_1E59CA7D0, *(void *)(a1 + 32), MEMORY[0x1E4F143A8], 3221225472, __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2, &unk_1E59CA7D0, *(void *)(a1 + 32));
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 message];
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:v4 page:4];

    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "No alert for error: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) advanceToNextState];
  }
}

uint64_t __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to try again...", v6, 2u);
  }

  [*(id *)(a1 + 32) resetState];
  [*(id *)(a1 + 32) showSuccessCheckmark:0];
  [*(id *)(a1 + 32) showActivityIndicator:1];
  uint64_t v3 = [*(id *)(a1 + 32) explanationView];
  id v4 = [v3 dockView];
  [v4 setButtonsEnabled:0];

  return [*(id *)(a1 + 32) startProvisioning];
}

uint64_t __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_85(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Canceling provisioning to watch...", v4, 2u);
  }

  return [*(id *)(a1 + 32) advanceToNextState];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __94__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:1 errorMessage:0 page:4];
  [*(id *)(*(void *)(a1 + 32) + 1096) setProvisionedRemotePass:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 advanceToNextState];
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __81__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Authorization request did finish", v5, 2u);
  }

  [*(id *)(a1 + 32) dismissWithCompletion:0];
  [*(id *)(a1 + 40) invalidateUserAuth];
  if (*(void *)(*(void *)(a1 + 40) + 1080))
  {
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:*MEMORY[0x1E4F86D78] page:6];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 1080) + 16))();
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 1080);
    *(void *)(v3 + 1080) = 0;
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  uint64_t v3 = [(PKAddCredentialToWatchViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  v7[3] = &unk_1E59CAD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1080);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Got authorization to share credential.", buf, 2u);
    }

    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:1 errorMessage:0 page:6];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 1080);
    id v7 = [*(id *)(v5 + 1088) externalizedContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_86;
    v12[3] = &unk_1E59CAA98;
    id v13 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, void, void *))(v6 + 16))(v6, v7, 0, v12);

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 1080);
    *(void *)(v8 + 1080) = 0;

    id v10 = v13;
    goto LABEL_9;
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Missing authorization request completion.", buf, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:@"Missing authorization request completion." page:6];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84A30]) initWithStatus:1 errors:0];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
LABEL_9:
  }
}

void __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_86(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F84A30]) initWithStatus:0 errors:0];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  if (a4 <= 0xB && ((1 << a4) & 0xE40) != 0) {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:1 page:5];
  }
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong(&self->_authorizationRequestCompletion, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_heroCardView, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);

  objc_storeStrong((id *)&self->_sharingSession, 0);
}

@end