@interface PKSubcredentialPairingViewController
- (BOOL)suppressFieldDetect;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (PKSubcredentialPairingViewController)initWithFlowController:(id)a3 context:(id)a4;
- (id)pairingSessionWithDelegate:(id)a3;
- (unint64_t)operation;
- (void)advanceToNextState;
- (void)dealloc;
- (void)handleCancelButton;
- (void)hostApplicationDidEnterBackground;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setProvisioningContext:(id)a3;
- (void)startProvisioning;
- (void)subcredentialProvisioningController:(id)a3 didEnterState:(int64_t)a4;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4;
- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5;
- (void)updateUIForState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSubcredentialPairingViewController

- (PKSubcredentialPairingViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKSubcredentialPairingViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = [(PKSubcredentialPairingViewController *)v10 navigationItem];
    [v11 setHidesBackButton:1 animated:0];
  }
  return v10;
}

- (void)dealloc
{
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    [(PKAppletSubcredentialPairingSession *)pairingSession endSession];
  }
  [(PKSubcredentialPairingViewController *)self setIdleTimerDisabled:0];
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  [(PKSubcredentialPairingViewController *)&v4 dealloc];
}

- (unint64_t)operation
{
  return 3;
}

- (id)pairingSessionWithDelegate:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F84420] createSessionWithDelegate:a3];
  pairingSession = self->_pairingSession;
  self->_pairingSession = v4;

  v6 = self->_pairingSession;

  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialPairingViewController;
  [(PKSubcredentialPairingViewController *)&v8 viewDidLoad];
  v3 = [(PKSubcredentialPairingViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  v5 = [[PKCredentialProvisioningView alloc] initWithContext:self->_provisioningContext];
  provisioningView = self->_provisioningView;
  self->_provisioningView = v5;

  [(PKCredentialProvisioningView *)self->_provisioningView setState:5];
  id v7 = [(PKSubcredentialPairingViewController *)self view];
  [v7 addSubview:self->_provisioningView];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialPairingViewController;
  [(PKSubcredentialPairingViewController *)&v6 viewWillLayoutSubviews];
  provisioningView = self->_provisioningView;
  objc_super v4 = [(PKSubcredentialPairingViewController *)self view];
  v5 = [v4 safeAreaLayoutGuide];
  [v5 layoutFrame];
  -[PKCredentialProvisioningView setFrame:](provisioningView, "setFrame:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  [(PKSubcredentialPairingViewController *)&v4 viewDidAppear:a3];
  [(PKSubcredentialPairingViewController *)self startProvisioning];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  [(PKSubcredentialPairingViewController *)&v4 viewWillDisappear:a3];
  [(PKSubcredentialPairingViewController *)self setIdleTimerDisabled:0];
}

- (void)hostApplicationDidEnterBackground
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Host did enter background", v4, 2u);
  }

  [(PKSubcredentialPairingViewController *)self setIdleTimerDisabled:0];
}

- (void)handleCancelButton
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "User cancelled key pairing", buf, 2u);
  }

  if (self->_isCancelling)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Cancellation already in progress", buf, 2u);
    }
  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:1 page:2];
    if (self->_provisioningViewModel)
    {
      self->_isCancelling = 1;
      provisioningViewModel = self->_provisioningViewModel;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke;
      v7[3] = &unk_1E59CA7D0;
      v7[4] = self;
      [(PKSubcredentialProvisioningViewModelProtocol *)provisioningViewModel cancelProvisioningWithCompletion:v7];
    }
    else
    {
      flowController = self->_flowController;
      if (flowController)
      {
        [(PKSubcredentialPairingFlowControllerProtocol *)flowController provisioningWasCanceledWithOperation:self];
      }
      else
      {
        objc_super v6 = [(PKSubcredentialPairingViewController *)self presentingViewController];
        [v6 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

void __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) endSession];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 976);
  *(void *)(v2 + 976) = 0;

  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 1024);
  if (v4)
  {
    objc_msgSend(v4, "provisioningWasCanceledWithOperation:");
  }
  else
  {
    v5 = [*(id *)(a1 + 32) presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 0;
}

- (void)updateUIForState:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = PKStringForSubcredentialProvisioningState();
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updating UI for state %@", (uint8_t *)&v10, 0xCu);
  }
  [(PKCredentialProvisioningView *)self->_provisioningView setState:a3];
  int v7 = 0;
  if ((unint64_t)a3 > 0x10) {
    goto LABEL_11;
  }
  if (((1 << a3) & 0x164) != 0) {
    goto LABEL_9;
  }
  if (((1 << a3) & 0x10001) != 0)
  {
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_11:
    objc_super v8 = [(PKSubcredentialPairingViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:0];
    if ((v7 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  int v7 = 1;
LABEL_9:
  objc_super v8 = [(PKSubcredentialPairingViewController *)self navigationItem];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_handleCancelButton];
  [v8 setLeftBarButtonItem:v9];

  if (!v7) {
    goto LABEL_14;
  }
LABEL_12:
  if (!self->_outstandingAlert) {
    [(PKSubcredentialPairingViewController *)self setIdleTimerDisabled:0];
  }
LABEL_14:
}

- (void)startProvisioning
{
  provisioningViewModel = self->_provisioningViewModel;
  objc_super v4 = PKLogFacilityTypeGetObject();
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
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Starting provisioning", v8, 2u);
    }

    [(PKSubcredentialPairingViewController *)self setIdleTimerDisabled:1];
    objc_super v6 = [(PKSubcredentialPairingFlowControllerProtocol *)self->_flowController localDeviceProvisioningViewModelForOperation:self];
    int v7 = self->_provisioningViewModel;
    self->_provisioningViewModel = v6;

    [(PKSubcredentialProvisioningViewModelProtocol *)self->_provisioningViewModel startProvisioning];
  }
}

- (void)advanceToNextState
{
  if (self->_flowController)
  {
    if (self->_isAdvancing)
    {
      v3 = PKLogFacilityTypeGetObject();
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
      v6[2] = __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke;
      v6[3] = &unk_1E59CD960;
      objc_copyWeak(&v7, buf);
      v6[4] = self;
      [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v6];
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v5 = [(PKSubcredentialPairingViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

void __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v7 = [*(id *)(a1 + 32) navigationController];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke_2;
      v8[3] = &unk_1E59CB100;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      [WeakRetained[128] provisioningFinishedWithOperation:WeakRetained];
    }
  }
}

void __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[1001] = 0;
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  idleTimerAssertion = self->_idleTimerAssertion;
  if (a3)
  {
    if (idleTimerAssertion) {
      return;
    }
    id v5 = [[PKIdleTimerAssertion alloc] initWithReason:@"Wallet - Subcredential Pairing"];
  }
  else
  {
    [(PKIdleTimerAssertion *)idleTimerAssertion invalidate];
    id v5 = 0;
  }
  objc_super v6 = self->_idleTimerAssertion;
  self->_idleTimerAssertion = v5;
}

- (void)subcredentialProvisioningController:(id)a3 didEnterState:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__PKSubcredentialPairingViewController_subcredentialProvisioningController_didEnterState___block_invoke;
  v4[3] = &unk_1E59CB460;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __90__PKSubcredentialPairingViewController_subcredentialProvisioningController_didEnterState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUIForState:*(void *)(a1 + 40)];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) endSession];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 976);
  *(void *)(v2 + 976) = 0;

  objc_super v4 = [*(id *)(a1 + 40) provisionedPass];
  id v5 = *(void **)(*(void *)(a1 + 32) + 1016);
  if (v4)
  {
    [v5 setProvisionedPass:v4];
    [*(id *)(*(void *)(a1 + 32) + 992) setShowingCheckmark:1 animated:1];
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "advanceToNextState", v13, v14, v15, v16);
    goto LABEL_7;
  }
  [v5 setError:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 1016) shouldExitFlowOnError]) {
    goto LABEL_6;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1024);
  id v8 = *(void **)(a1 + 48);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2;
  v16 = &unk_1E59CA870;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v17 = v9;
  uint64_t v18 = v10;
  v11 = [v7 alertForOperation:v6 withError:v9 retryHandler:0 cancelationHandler:&v13];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = objc_msgSend(v11, "message", v13, v14, v15, v16);
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:v12 page:2];

  [*(id *)(a1 + 32) updateUIForState:1];
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];

LABEL_7:
}

uint64_t __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 18)
  {
    uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
  objc_super v4 = *(void **)(*(void *)(a1 + 40) + 1024);

  return objc_msgSend(v4, "provisioningWasCanceledWithOperation:");
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) endSession];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 976);
  *(void *)(v2 + 976) = 0;

  [*(id *)(*(void *)(a1 + 32) + 1016) setProvisionedPass:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 992) setShowingCheckmark:1 animated:1];
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:1 errorMessage:0 page:2];
  objc_super v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke_2;
  v8[3] = &unk_1E59CA870;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume(v7);
}

uint64_t __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id v3 = *(void **)(a1 + 40);

  return [v3 advanceToNextState];
}

- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = [v9 domain];
    char v12 = PKEqualObjects();

    if (v12)
    {
      objc_initWeak(location, self);
      uint64_t v13 = [v9 code];
      self->_outstandingAlert = 0;
      if (v13 != 19)
      {
        if (v13 == 18)
        {
          v15 = (id *)&v20;
          v16 = v19;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          id v17 = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_78;
LABEL_13:
          v16[2] = v17;
          v16[3] = &unk_1E59CD988;
          v16[4] = self;
          v16[5] = v9;
          v16[6] = v10;
          objc_copyWeak(v15, location);
          dispatch_async(MEMORY[0x1E4F14428], v16);
          objc_destroyWeak(v15);

LABEL_15:
          objc_destroyWeak(location);
          goto LABEL_16;
        }
        if (v13 != 7)
        {
          (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
          goto LABEL_15;
        }
      }
      uint64_t v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Asking if registration error should cause failure.", buf, 2u);
      }

      v15 = (id *)&v22;
      v16 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      id v17 = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke;
      goto LABEL_13;
    }
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Unexpected error while checking for hard failure: %@", (uint8_t *)location, 0xCu);
    }

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
LABEL_16:
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke(id *a1)
{
  id v3 = a1[4];
  id v2 = a1[5];
  objc_super v4 = (void *)v3[128];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2;
  v15[3] = &unk_1E59CAD18;
  id v5 = v2;
  id v16 = v5;
  id v17 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_77;
  v11[3] = &unk_1E59CB038;
  objc_copyWeak(&v14, a1 + 7);
  id v12 = a1[5];
  id v13 = a1[6];
  uint64_t v6 = [v4 alertForOperation:v3 withError:v5 retryHandler:v15 cancelationHandler:v11];
  id v7 = v6;
  if (v6)
  {
    *((unsigned char *)a1[4] + 1002) = 1;
    id v8 = [v6 message];
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:v8 page:2];

    [a1[4] presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "No alert for registration error", (uint8_t *)&v10, 2u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

  objc_destroyWeak(&v14);
}

uint64_t __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try pairing again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_77(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "User choose to cancel pairing after error: %@", (uint8_t *)&v6, 0xCu);
  }

  int v5 = [WeakRetained provisioningContext];
  [v5 setShouldExitFlowOnError:1];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_78(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 1024);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2_79;
  v14[3] = &unk_1E59CAD18;
  id v5 = v2;
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_80;
  v11[3] = &unk_1E59CB128;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v12 = *(id *)(a1 + 48);
  int v6 = [v4 alertForOperation:v3 withError:v5 retryHandler:v14 cancelationHandler:v11];
  uint64_t v7 = v6;
  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1002) = 1;
    uint64_t v8 = [v6 message];
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:v8 page:2];

    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "No alert for bluetooth error", v10, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  objc_destroyWeak(&v13);
}

uint64_t __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2_79(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try pairing again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "User choose to go to settings", v7, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
  [v4 openSensitiveURL:v5 withOptions:0];

  uint64_t v6 = [WeakRetained provisioningContext];
  [v6 setShouldExitFlowOnError:1];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
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
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_provisioningView, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);

  objc_storeStrong((id *)&self->_pairingSession, 0);
}

@end