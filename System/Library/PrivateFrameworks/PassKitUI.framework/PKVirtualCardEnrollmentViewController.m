@interface PKVirtualCardEnrollmentViewController
- (PKPaymentPass)paymentPass;
- (PKVirtualCardEnrollmentViewController)initWithPaymentPass:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (PKVirtualCardEnrollmentViewControllerDelegate)delegate;
- (int64_t)state;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)dealloc;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)passDidNotUpdateInTime;
- (void)passDidUpdate;
- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewControllerDidFinish:(id)a3;
- (void)receivedPassUpdatedNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setState:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waitForPassToUpdate;
@end

@implementation PKVirtualCardEnrollmentViewController

- (PKVirtualCardEnrollmentViewController)initWithPaymentPass:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(PKExplanationViewController *)self initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_paymentPass, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
    heroCardView = v12->_heroCardView;
    v12->_heroCardView = v13;

    v12->_state = 0;
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentViewController;
  [(PKVirtualCardEnrollmentViewController *)&v4 dealloc];
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)PKVirtualCardEnrollmentViewController;
  [(PKExplanationViewController *)&v10 loadView];
  [(PKExplanationViewController *)self setExplanationViewControllerDelegate:self];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  objc_super v4 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_0.isa);
  [v3 setTitleText:v4];

  v5 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_1.isa);
  [v3 setBodyText:v5];

  [v3 setForceShowSetupLaterButton:1];
  v6 = [v3 dockView];
  v7 = [v6 footerView];
  v8 = [v7 setupLaterButton];
  id v9 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_2.isa);
  [v8 setTitle:v9 forState:0];

  [v7 setManualEntryButton:0];
}

- (void)viewDidLoad
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKVirtualCardEnrollmentViewController;
  [(PKExplanationViewController *)&v23 viewDidLoad];
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_receivedPassUpdatedNotification_ name:*MEMORY[0x1E4F87570] object:0];

  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  v5 = [(PKHeroCardExplanationHeaderView *)self->_heroCardView backgroundColor];
  [v4 setTopBackgroundColor:v5];

  +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = +[PKPassSnapshotter sharedInstance];
  paymentPass = self->_paymentPass;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke;
  v21[3] = &unk_1E59CA910;
  v21[4] = self;
  id v12 = v4;
  id v22 = v12;
  objc_msgSend(v10, "snapshotWithPass:size:completion:", paymentPass, v21, v7, v9);

  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowCloseButton:1];
  id v13 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v13 configureWithTransparentBackground];
  v14 = [(PKVirtualCardEnrollmentViewController *)self navigationItem];
  [v14 setStandardAppearance:v13];
  [v14 setCompactAppearance:v13];
  [v14 setScrollEdgeAppearance:v13];
  [(PKVirtualCardEnrollmentViewController *)self _beginReportingIfNecessary];
  id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = *MEMORY[0x1E4F86730];
  v24[0] = *MEMORY[0x1E4F86308];
  v24[1] = v16;
  uint64_t v17 = *MEMORY[0x1E4F86FB8];
  v25[0] = *MEMORY[0x1E4F864A0];
  v25[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v19 = (void *)[v15 initWithDictionary:v18];

  v20 = PKDefaultPaymentNetworkNameForPaymentPass();
  if (v20) {
    [v19 setValue:v20 forKey:*MEMORY[0x1E4F86860]];
  }
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87038] sendEvent:v19];
}

void __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  objc_super v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 1040) setCardImage:a1[5]];
  v2 = (void *)a1[6];
  uint64_t v3 = *(void *)(a1[4] + 1040);

  return [v2 setHeroView:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentViewController;
  [(PKVirtualCardEnrollmentViewController *)&v4 viewWillDisappear:a3];
  [(PKVirtualCardEnrollmentViewController *)self _endReportingIfNecessary];
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87038];
  objc_super v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87038]];

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    id v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87038]];
  }
}

- (void)waitForPassToUpdate
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for pass to update with virtual card info…", v8, 2u);
  }

  [(PKVirtualCardEnrollmentViewController *)self setModalInPresentation:1];
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  id v5 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_3.isa);
  [v4 setTitleText:v5];

  double v6 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_4.isa);
  [v4 setBodyText:v6];

  [v4 setShowSpinner:1];
  id v7 = [v4 dockView];
  [v7 setHidden:1];

  [(PKVirtualCardEnrollmentViewController *)self performSelector:sel_passDidNotUpdateInTime withObject:0 afterDelay:10.0];
}

- (void)receivedPassUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_state == 1)
  {
    double v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F875C0]];
    id v8 = [(PKPaymentPass *)self->_paymentPass uniqueID];
    int v9 = [v7 isEqualToString:v8];

    objc_super v10 = PKLogFacilityTypeGetObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Got pass update notification, for pass being enrolled to virtual card", buf, 2u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PKVirtualCardEnrollmentViewController_receivedPassUpdatedNotification___block_invoke;
      block[3] = &unk_1E59CA7D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Got pass update notification, but not for the pass being enrolled", buf, 2u);
      }
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Got pass update notification, but not in the virtual card enrolling state. Ignoring.", buf, 2u);
    }
  }
}

uint64_t __73__PKVirtualCardEnrollmentViewController_receivedPassUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) passDidUpdate];
}

- (void)passDidNotUpdateInTime
{
  if (self->_state != 2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Successfully enrolled virtual card, but didn't receive pass update notification in time. Treating as successful", v4, 2u);
    }

    [(PKVirtualCardEnrollmentViewController *)self passDidUpdate];
  }
}

- (void)passDidUpdate
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (self->_state != 2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Updating virtual card enrollment UI to success", buf, 2u);
    }

    self->_state = 2;
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
    id v4 = [(PKExplanationViewController *)self explanationView];
    id v5 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_5.isa);
    [v4 setTitleText:v5];

    double v6 = [(PKPaymentPass *)self->_paymentPass localizedDescription];
    id v7 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_6.isa, &stru_1EF1B4C70.isa, v6);
    [v4 setBodyText:v7];

    id v8 = [(PKExplanationViewController *)self explanationView];
    [v8 setShowSpinner:0];

    int v9 = [(PKExplanationViewController *)self explanationView];
    [v9 setShowCheckmark:1];

    objc_super v10 = [v4 dockView];
    BOOL v11 = [v10 primaryButton];
    id v12 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_7.isa);
    [v11 setTitle:v12 forState:0];

    [v4 setForceShowSetupLaterButton:0];
    id v13 = [v4 dockView];
    [v13 setHidden:0];

    v14 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v15 = *MEMORY[0x1E4F87038];
    uint64_t v16 = *MEMORY[0x1E4F86730];
    v20[0] = *MEMORY[0x1E4F86308];
    v20[1] = v16;
    uint64_t v17 = *MEMORY[0x1E4F86FB0];
    v21[0] = *MEMORY[0x1E4F864A0];
    v21[1] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    [v14 subject:v15 sendEvent:v18];
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_state == 2)
  {
    id v5 = [(PKVirtualCardEnrollmentViewController *)self delegate];
    [v5 virtualCardEnrollmentViewController:self didCompleteWithSuccess:1];

    double v6 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v7 = *MEMORY[0x1E4F87038];
    uint64_t v8 = *MEMORY[0x1E4F86380];
    uint64_t v9 = *MEMORY[0x1E4F86730];
    v23[0] = *MEMORY[0x1E4F86308];
    v23[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86FB0];
    v24[0] = v8;
    v24[1] = v10;
    v23[2] = *MEMORY[0x1E4F86120];
    void v24[2] = *MEMORY[0x1E4F862D0];
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    [v6 subject:v7 sendEvent:v11];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Presenting virtual card enrollment Oslo sheet", v20, 2u);
    }

    BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F85118]) initWithPaymentPass:self->_paymentPass];
    id v13 = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:v11];
    [(PKPaymentAuthorizationViewController *)v13 setDelegate:self];
    [(PKVirtualCardEnrollmentViewController *)self presentViewController:v13 animated:1 completion:0];
    v14 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v15 = *MEMORY[0x1E4F87038];
    uint64_t v16 = *MEMORY[0x1E4F86380];
    uint64_t v17 = *MEMORY[0x1E4F86730];
    v21[0] = *MEMORY[0x1E4F86308];
    v21[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F86FB8];
    v22[0] = v16;
    v22[1] = v18;
    v21[2] = *MEMORY[0x1E4F86120];
    v22[2] = *MEMORY[0x1E4F861B8];
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    [v14 subject:v15 sendEvent:v19];
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKVirtualCardEnrollmentViewController *)self delegate];
  [v4 virtualCardEnrollmentViewController:self didCompleteWithSuccess:0];

  id v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87038];
  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86FB8];
  v12[0] = v7;
  v12[1] = v9;
  v11[2] = *MEMORY[0x1E4F86120];
  v12[2] = *MEMORY[0x1E4F86678];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 subject:v6 sendEvent:v10];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKVirtualCardEnrollmentViewController *)self delegate];
  [v4 virtualCardEnrollmentViewController:self didCompleteWithSuccess:0];

  id v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87038];
  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86FB8];
  v12[0] = v7;
  v12[1] = v9;
  v11[2] = *MEMORY[0x1E4F86120];
  v12[2] = *MEMORY[0x1E4F862C8];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 subject:v6 sendEvent:v10];
}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v6 = (void (**)(id, void *))a5;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Finished virtual card enrollment", v10, 2u);
  }

  self->_state = 1;
  [(PKExplanationViewController *)self setShowCloseButton:0];
  id v8 = objc_alloc(MEMORY[0x1E4F84A30]);
  uint64_t v9 = (void *)[v8 initWithStatus:0 errors:MEMORY[0x1E4F1CBF0]];
  v6[2](v6, v9);
}

- (void)paymentAuthorizationViewControllerDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__PKVirtualCardEnrollmentViewController_paymentAuthorizationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [(PKVirtualCardEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

void *__85__PKVirtualCardEnrollmentViewController_paymentAuthorizationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[134] == 1) {
    return (void *)[result waitForPassToUpdate];
  }
  return result;
}

- (PKVirtualCardEnrollmentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKVirtualCardEnrollmentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end