@interface PKApplyVerificationSMSOTPViewController
- (BOOL)_shouldDisplayErrorForEntryError:(unint64_t)a3;
- (PKApplyVerificationSMSOTPViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 verificationPage:(id)a6;
- (id)analyticsPageTag;
- (unint64_t)_smsOTPViewEntryErrorFromError:(id)a3;
- (void)_cancelApplication;
- (void)_nextButtonPressed;
- (void)_requestNewCode;
- (void)_submitCode:(id)a3 skippedVerification:(BOOL)a4;
- (void)_terminateFlow;
- (void)_updateViewWithEntryError:(unint64_t)a3 source:(unint64_t)a4;
- (void)_withdrawApplication;
- (void)oneTimeCodeView:(id)a3 didEnterCode:(id)a4;
- (void)showNavigationBarSpinner:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyVerificationSMSOTPViewController

- (PKApplyVerificationSMSOTPViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 verificationPage:(id)a6
{
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  v12 = [(PKApplyExplanationViewController *)&v20 initWithController:a3 setupDelegate:a4 context:a5 applyPage:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_verificationPage, a6);
    [(PKExplanationViewController *)v13 setShowCancelButton:1];
    id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v15 = PKLocalizedPaymentString(&cfstr_Next.isa);
    uint64_t v16 = [v14 initWithTitle:v15 style:0 target:v13 action:sel__nextButtonPressed];
    nextButton = v13->_nextButton;
    v13->_nextButton = (UIBarButtonItem *)v16;

    v18 = [(PKApplyVerificationSMSOTPViewController *)v13 navigationItem];
    [v18 setRightBarButtonItem:v13->_nextButton];
  }
  return v13;
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  -[PKApplyExplanationViewController showNavigationBarSpinner:](&v5, sel_showNavigationBarSpinner_);
  self->_showingSpinner = v3;
  [(PKOneTimeCodeView *)self->_otpView setDisableEntry:v3];
}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E4F85F98];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  [(PKApplyExplanationViewController *)&v14 viewDidLoad];
  BOOL v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [[PKOneTimeCodeView alloc] initWithCodeLength:[(PKApplyVerificationPage *)self->_verificationPage verificationCodeLength] delegate:self];
  otpView = self->_otpView;
  self->_otpView = v4;

  v6 = self->_otpView;
  v7 = [(PKApplyVerificationSMSOTPViewController *)self view];
  v8 = [v7 backgroundColor];
  [(PKOneTimeCodeView *)v6 setBackgroundColor:v8];

  [v3 setBodyView:self->_otpView];
  [v3 setReverseBodyViewAndBodyButtonOrder:1];
  [(PKApplyVerificationSMSOTPViewController *)self _updateViewWithEntryError:0 source:0];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E59CCC50;
  objc_copyWeak(&v12, &location);
  [(PKApplyExplanationViewController *)self setLearnMoreAction:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke_2;
  v9[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  [(PKDynamicProvisioningPageViewController *)self setCancelButtonAction:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1209])
  {
    if (WeakRetained[1208]) {
      [WeakRetained _submitCode:0 skippedVerification:1];
    }
    else {
      [WeakRetained _requestNewCode];
    }
  }

  return 0;
}

void __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancelApplication];
    id WeakRetained = v2;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  [(PKApplyExplanationViewController *)&v4 viewDidAppear:a3];
  [(PKApplyVerificationSMSOTPViewController *)self _updateViewWithEntryError:0 source:0];
  [(PKOneTimeCodeView *)self->_otpView becomeFirstResponder];
}

- (void)oneTimeCodeView:(id)a3 didEnterCode:(id)a4
{
  if (self->_otpView == a3) {
    [(PKApplyVerificationSMSOTPViewController *)self _updateViewWithEntryError:0 source:1];
  }
}

- (void)_nextButtonPressed
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKApplyExplanationViewController *)self controller];
  objc_super v4 = [(PKApplyExplanationViewController *)self currentPage];
  objc_super v5 = [(PKApplyVerificationSMSOTPViewController *)self analyticsPageTag];
  uint64_t v8 = *MEMORY[0x1E4F86120];
  v9[0] = *MEMORY[0x1E4F86670];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 reportAnalyticsDictionaryForPage:v4 pageTag:v5 additionalValues:v6];

  v7 = [(PKOneTimeCodeView *)self->_otpView currentCode];
  [(PKApplyVerificationSMSOTPViewController *)self _submitCode:v7 skippedVerification:0];
}

- (void)_requestNewCode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(PKApplyVerificationSMSOTPViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(PKApplyExplanationViewController *)self controller];
    objc_super v5 = [v4 featureApplication];
    v6 = [v5 applicationIdentifier];
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Requesting new otp code for application %@", buf, 0xCu);
  }
  v7 = [(PKApplyExplanationViewController *)self controller];
  verificationPage = self->_verificationPage;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke;
  v9[3] = &unk_1E59CEAC0;
  objc_copyWeak(&v10, &location);
  [v7 resendVerificationForPage:verificationPage completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke_2;
  v6[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v8);
}

void __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    uint64_t v4 = [v11 _smsOTPViewEntryErrorFromError:*(void *)(a1 + 32)];
    [v11 _updateViewWithEntryError:v4 source:0];
    if (*(void *)(a1 + 32))
    {
      id v5 = [v11 controller];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [v11 currentPage];
      id v8 = [v11 analyticsPageTag];
      [v5 reportAnalyticsError:v6 page:v7 pageTag:v8 additionalValues:0];

      int v9 = [v11 _shouldDisplayErrorForEntryError:v4];
      BOOL v3 = v11;
      if (!v9) {
        goto LABEL_9;
      }
      id v10 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
      if (v10) {
        [v11 presentViewController:v10 animated:1 completion:0];
      }
    }
    else
    {
      [v11[148] clearCurrentCode];
    }
    BOOL v3 = v11;
  }
LABEL_9:
}

- (void)_submitCode:(id)a3 skippedVerification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_initWeak(&location, self);
  [(PKApplyVerificationSMSOTPViewController *)self showNavigationBarSpinner:1];
  id v7 = [(PKApplyExplanationViewController *)self controller];
  id v8 = [v7 featureApplication];
  int v9 = [v8 applicationIdentifier];

  id v10 = PKLogFacilityTypeGetObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      objc_super v20 = v9;
      id v12 = "User skipped sms otp for application %@";
LABEL_6:
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    objc_super v20 = v9;
    id v12 = "Submitting otp code for application %@";
    goto LABEL_6;
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F844A0]);
  [v13 setData:v6];
  [v13 setSkippedVerification:v4];
  uint64_t v14 = [(PKApplyExplanationViewController *)self controller];
  verificationPage = self->_verificationPage;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke;
  v16[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v17, &location);
  [v14 submitVerificationPage:verificationPage verificationInfo:v13 completion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_3;
    aBlock[3] = &unk_1E59CB6D8;
    aBlock[4] = WeakRetained;
    BOOL v4 = _Block_copy(aBlock);
    uint64_t v5 = [v3 _smsOTPViewEntryErrorFromError:*(void *)(a1 + 32)];
    [v3 _updateViewWithEntryError:v5 source:0];
    if (*(void *)(a1 + 32))
    {
      id v6 = [v3 controller];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v3 currentPage];
      int v9 = [v3 analyticsPageTag];
      [v6 reportAnalyticsError:v7 page:v8 pageTag:v9 additionalValues:0];

      if ([v3 _shouldDisplayErrorForEntryError:v5])
      {
        id v10 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
        if (v10)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_4;
          v13[3] = &unk_1E59CAA98;
          id v14 = v4;
          [v3 presentViewController:v10 animated:1 completion:v13];
        }
        else
        {
          (*((void (**)(void *, uint64_t))v4 + 2))(v4, 1);
        }
      }
      else
      {
        (*((void (**)(void *, uint64_t))v4 + 2))(v4, 1);
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      [v3[148] resignFirstResponder];
      if (v11)
      {
        id v12 = [v3 navigationController];
        objc_msgSend(v12, "pk_presentPaymentSetupViewController:animated:completion:", *(void *)(a1 + 40), 1, v4);
      }
      else
      {
        (*((void (**)(void *, void))v4 + 2))(v4, 0);
      }
    }
  }
}

uint64_t __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) controller];
    [v5 endApplyFlow];

    id v6 = *(void **)(a1 + 32);
    return [v6 _terminateFlow];
  }
  return result;
}

uint64_t __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_smsOTPViewEntryErrorFromError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F871A0]];

    if (v6)
    {
      uint64_t v7 = [v4 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      BOOL v4 = (void *)v8;
    }
    int v9 = [v4 domain];
    id v10 = (void *)*MEMORY[0x1E4F87C30];
    id v11 = v9;
    id v12 = v10;
    if (v11 == v12)
    {
    }
    else
    {
      id v13 = v12;
      if (!v11 || !v12)
      {

        goto LABEL_16;
      }
      int v14 = [v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_16;
      }
    }
    uint64_t v16 = [v4 code];
    if (v16 > 40455)
    {
      if (v16 == 40456)
      {
        unint64_t v15 = 2;
        goto LABEL_17;
      }
      if (v16 == 40457)
      {
        unint64_t v15 = 3;
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (v16 == 40423)
    {
      unint64_t v15 = 5;
      goto LABEL_17;
    }
    if (v16 == 40454)
    {
      unint64_t v15 = 4;
      goto LABEL_17;
    }
LABEL_16:
    unint64_t v15 = 1;
    goto LABEL_17;
  }
  unint64_t v15 = 0;
LABEL_17:

  return v15;
}

- (void)_cancelApplication
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKApplyVerificationSMSOTPViewController__cancelApplication__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  id v3 = (void (**)(void))_Block_copy(aBlock);
  BOOL v4 = [(PKApplyExplanationViewController *)self controller];
  uint64_t v5 = [v4 cancelAlertWithContinueAction:v3];

  if (v5)
  {
    int v6 = [(PKApplyVerificationSMSOTPViewController *)self navigationController];
    [v6 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __61__PKApplyVerificationSMSOTPViewController__cancelApplication__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) controller];
  id v3 = [*(id *)(a1 + 32) currentPage];
  BOOL v4 = [*(id *)(a1 + 32) analyticsPageTag];
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v9[0] = *MEMORY[0x1E4F86308];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86128];
  v10[0] = *MEMORY[0x1E4F86380];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 reportAnalyticsDictionaryForPage:v3 pageTag:v4 additionalValues:v7];

  return [*(id *)(a1 + 32) _withdrawApplication];
}

- (void)_withdrawApplication
{
  [(PKApplyVerificationSMSOTPViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  id v3 = [(PKApplyExplanationViewController *)self controller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [v3 withdrawApplicationWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = [WeakRetained navigationController];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke_2;
      v12[3] = &unk_1E59CB6D8;
      v12[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
    }
    else
    {
      [WeakRetained showNavigationBarSpinner:0];
      if (!v6)
      {
        id v11 = [v8 controller];
        [v11 endApplyFlow];

        [v8 _terminateFlow];
        goto LABEL_7;
      }
      id v9 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      id v10 = [v8 navigationController];
      [v10 presentViewController:v9 animated:1 completion:0];
    }
  }
LABEL_7:
}

uint64_t __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

- (void)_terminateFlow
{
  id v3 = [(PKApplyExplanationViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    BOOL v4 = [(PKApplyVerificationSMSOTPViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_updateViewWithEntryError:(unint64_t)a3 source:(unint64_t)a4
{
  id v18 = [(PKExplanationViewController *)self explanationView];
  if (a3 == 1) {
    a3 = [(PKOneTimeCodeView *)self->_otpView entryError];
  }
  int v7 = 0;
  double v8 = 36.0;
  BOOL v9 = 0;
  uint64_t v10 = 0;
  BOOL v11 = 0;
  switch(a3)
  {
    case 0uLL:
      int v14 = [(PKOneTimeCodeView *)self->_otpView currentCode];
      uint64_t v15 = [v14 length];
      uint64_t v16 = [(PKApplyVerificationPage *)self->_verificationPage verificationCodeLength];

      uint64_t v10 = 0;
      BOOL v9 = v15 == v16;
      BOOL v11 = v15 == v16 && a4 == 1;
      int v7 = !v11;
      double v8 = 24.0;
      goto LABEL_12;
    case 2uLL:
      BOOL v9 = 0;
      uint64_t v10 = 0;
      BOOL v11 = 0;
      int v7 = 1;
      goto LABEL_11;
    case 3uLL:
      int v7 = 0;
      BOOL v9 = 0;
      BOOL v11 = 0;
      uint64_t v10 = 1;
LABEL_11:
      double v8 = 36.0;
      goto LABEL_12;
    case 4uLL:
    case 5uLL:
      id v12 = PKLocalizedPaymentString(&cfstr_ContinueWithPh.isa);
      [v18 setBodyButtonText:v12];

      BOOL v9 = 0;
      BOOL v11 = 0;
      BOOL v13 = 1;
      double v8 = 36.0;
      uint64_t v10 = 1;
      goto LABEL_15;
    default:
LABEL_12:
      id v17 = PKLocalizedPaymentString(&cfstr_SendNewCode.isa);
      [v18 setBodyButtonText:v17];

      if (v7)
      {
        [(PKOneTimeCodeView *)self->_otpView becomeFirstResponder];
        BOOL v13 = 0;
      }
      else
      {
        BOOL v13 = 0;
LABEL_15:
        [(PKOneTimeCodeView *)self->_otpView resignFirstResponder];
      }
      self->_isBodyButtonSkipToDocUpload = v13;
      [v18 setBodyViewPadding:v8];
      [(PKOneTimeCodeView *)self->_otpView setDisableEntry:v10];
      [(UIBarButtonItem *)self->_nextButton setEnabled:v9];
      [(PKOneTimeCodeView *)self->_otpView setEntryError:a3];
      [v18 setNeedsLayout];
      if (v11) {
        [(PKApplyVerificationSMSOTPViewController *)self _nextButtonPressed];
      }

      return;
  }
}

- (BOOL)_shouldDisplayErrorForEntryError:(unint64_t)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_activityButton, 0);
  objc_storeStrong((id *)&self->_otpView, 0);

  objc_storeStrong((id *)&self->_verificationPage, 0);
}

@end