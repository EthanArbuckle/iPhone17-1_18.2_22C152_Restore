@interface PKPaymentAutoReloadSetupCompleteViewController
- (PKPaymentAutoReloadSetupCompleteViewController)initWithPass:(id)a3 amount:(id)a4 threshold:(id)a5 setupMode:(int64_t)a6 paymentDataProvider:(id)a7 delegate:(id)a8;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)setReporter:(id)a3;
- (void)showBalanceUpdatedUIWithAnimation:(BOOL)a3;
- (void)showWaitingOnBalanceUpdateUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentAutoReloadSetupCompleteViewController

- (PKPaymentAutoReloadSetupCompleteViewController)initWithPass:(id)a3 amount:(id)a4 threshold:(id)a5 setupMode:(int64_t)a6 paymentDataProvider:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v26 = a4;
  id v25 = a5;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  v18 = [(PKExplanationViewController *)&v27 init];
  v19 = v18;
  if (v18)
  {
    p_pass = (id *)&v18->_pass;
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_amount, a4);
    objc_storeStrong((id *)&v19->_threshold, a5);
    v19->_setupMode = a6;
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a7);
    v21 = [*p_pass autoTopUpMerchantTokenIdentifier];
    if (v21) {
      char v22 = [*p_pass isAutoTopEnabled];
    }
    else {
      char v22 = 0;
    }

    if (a6 == 1) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = v22;
    }
    v19->_passUpdated = v23;
    if (objc_opt_respondsToSelector()) {
      [(PKPaymentDataProvider *)v19->_paymentDataProvider addDelegate:v19];
    }
  }

  return v19;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  [(PKPaymentAutoReloadSetupCompleteViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  [(PKExplanationViewController *)&v28 viewDidLoad];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKPaymentAutoReloadSetupCompleteViewController *)self setModalInPresentation:1];
  v3 = [(PKPaymentAutoReloadSetupCompleteViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setTopMargin:80.0];
  [v4 setShowPrivacyView:0];
  [v4 setDelegate:self];
  objc_super v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:60.0];
  v6 = [(PKCurrencyAmount *)self->_amount currency];
  v7 = v6;
  if (v6 == @"KRW"
    || v6 && (int v8 = [(__CFString *)v6 isEqualToString:@"KRW"], v7, v8))
  {
    v9 = PKPassKitUIBundle();
    v10 = [v9 URLForResource:@"WonIconArrowCirclePath" withExtension:@"pdf"];
    double v11 = PKUIScreenScale();
    uint64_t v12 = PKUIImageFromPDF(v10, 80.0, 80.0, v11);
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"dollarsign.arrow.circlepath" withConfiguration:v5];
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v12 = [v10 imageWithTintColor:v9];
  }
  v13 = (void *)v12;

  v14 = [MEMORY[0x1E4FB1618] blackColor];
  id v15 = PKUIImageWithBackground(v13, v14, 80.0, 80.0);

  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15];
  id v17 = [v16 layer];
  [v17 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v17 setCornerRadius:14.0];
  [v17 setMasksToBounds:1];
  [v4 setHeroView:v16];
  if (self->_passUpdated)
  {
    [(PKPaymentAutoReloadSetupCompleteViewController *)self showBalanceUpdatedUIWithAnimation:0];
  }
  else
  {
    [(PKPaymentAutoReloadSetupCompleteViewController *)self showWaitingOnBalanceUpdateUI];
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v19 = self->_timer;
      self->_timer = 0;
    }
    objc_initWeak(&location, self);
    v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    v21 = self->_timer;
    self->_timer = v20;

    char v22 = self->_timer;
    dispatch_time_t v23 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v24 = self->_timer;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke;
    v25[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v24, v25);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[135];
    objc_super v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[135];
      v5[135] = 0;

      id v2 = v5;
    }
    [v2 showBalanceUpdatedUIWithAnimation:1];
    id v2 = v5;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  [(PKPaymentAutoReloadSetupCompleteViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)showWaitingOnBalanceUpdateUI
{
  id v5 = [(PKExplanationViewController *)self explanationView];
  [v5 setShowSpinner:1];
  id v2 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_4.isa);
  [v5 setTitleText:v2];

  v3 = [v5 dockView];
  [v3 setButtonsEnabled:0];
  objc_super v4 = [v3 primaryButton];
  [v4 setHidden:1];
}

- (void)showBalanceUpdatedUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = [(PKExplanationViewController *)self explanationView];
  [v13 setShowSpinner:0];
  id v5 = [(PKCurrencyAmount *)self->_amount formattedStringValue];
  v6 = [(PKCurrencyAmount *)self->_threshold formattedStringValue];
  v7 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_5.isa, &stru_1EF1B5770.isa, v5, v6);
  [v13 setBodyText:v7];

  [v13 showCheckmark:1 animated:v3];
  if (self->_setupMode == 1) {
    int v8 = @"PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE_CHANGES_SAVED";
  }
  else {
    int v8 = @"PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE";
  }
  v9 = PKLocalizedPaymentString(&v8->isa);
  [v13 setTitleText:v9];

  v10 = [v13 dockView];
  [v10 setButtonsEnabled:1];
  double v11 = [v10 primaryButton];
  [v11 setHidden:0];
  uint64_t v12 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_8.isa);
  [v11 setTitle:v12 forState:0];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__PKPaymentAutoReloadSetupCompleteViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __106__PKPaymentAutoReloadSetupCompleteViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1064) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    objc_super v4 = *(NSObject **)(*(void *)(a1 + 32) + 1080);
    if (v4)
    {
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 1080);
      *(void *)(v5 + 1080) = 0;

      v7 = *(void **)(a1 + 32);
      [v7 showBalanceUpdatedUIWithAnimation:1];
    }
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v7 = *MEMORY[0x1E4F86BA0];
  v8[0] = *MEMORY[0x1E4F86BA8];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:0 context:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoReloadSetupCompleteViewControllerDidComplete];
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_threshold, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end