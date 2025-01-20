@interface PKBarcodePaymentOnboardingViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKBarcodePaymentOnboardingViewController)initWithIssuerName:(id)a3 context:(int64_t)a4;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)_imageForWatchView;
- (id)continueHandler;
- (id)terminationHandler;
- (void)_terminateSetupFlow;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setContinueHandler:(id)a3;
- (void)setReporter:(id)a3;
- (void)setTerminationHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKBarcodePaymentOnboardingViewController

- (PKBarcodePaymentOnboardingViewController)initWithIssuerName:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  v8 = [(PKExplanationViewController *)&v11 initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_issuerName, a3);
    [(PKExplanationViewController *)v9 setExplanationViewControllerDelegate:v9];
  }

  return v9;
}

- (void)viewDidLoad
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  [(PKExplanationViewController *)&v32 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self context];
  [(PKExplanationViewController *)self setShowCancelButton:PKPaymentSetupContextIsIssuerApp()];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v30 = [v4 footerView];
  v5 = PKLocalizedAquamanString(&cfstr_BarcodePayment.isa, &stru_1EF1B4C70.isa, self->_issuerName);
  [v3 setTitleText:v5];

  [(PKExplanationViewController *)self context];
  if (PKPaymentSetupContextIsBridge())
  {
    v6 = PKLocalizedAquamanString(&cfstr_BarcodePayment_0.isa, &stru_1EF1B4C70.isa, self->_issuerName);
    id v7 = [PKWatchDeviceImageOverlayView alloc];
    v8 = -[PKWatchDeviceImageOverlayView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v9 = [(PKBarcodePaymentOnboardingViewController *)self _imageForWatchView];
    [(PKWatchDeviceImageOverlayView *)v8 setOverlayImage:v9];

    [v3 setBodyView:v8];
    uint64_t v10 = 1056;
  }
  else
  {
    if (PKPearlIsAvailable()) {
      objc_super v11 = @"BARCODE_PAYMENT_INTRO_BODY_FACEID";
    }
    else {
      objc_super v11 = @"BARCODE_PAYMENT_INTRO_BODY_TOUCHID";
    }
    v6 = PKLocalizedAquamanString(&v11->isa, &stru_1EF1B4C70.isa, self->_issuerName);
    v12 = [PKEducationPhone alloc];
    v8 = -[PKEducationPhone initWithFrame:displayOptions:](v12, "initWithFrame:displayOptions:", 3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v13 = PKUIImageNamed(@"BarcodePaymentEducation");
    [(PKWatchDeviceImageOverlayView *)v8 setPassImage:v13];

    [v3 setBodyView:v8];
    uint64_t v10 = 1048;
  }
  v14 = *(Class *)((char *)&self->super.super.super.super.isa + v10);
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)v8;

  [v3 setBodyText:v6];
  unint64_t v15 = PKUIGetMinScreenType() - 4;
  double v16 = 0.0;
  if (v15 <= 0xF) {
    double v16 = dbl_1A0442C70[v15];
  }
  [v3 setBodyViewPadding:v16];
  [v3 setShowPrivacyView:0];
  v17 = [v4 buttonExplanationTextView];
  v18 = PKLocalizedAquamanString(&cfstr_BarcodePayment_3.isa, &stru_1EF1B5770.isa, self->_issuerName, self->_issuerName);
  id v19 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v19 setLineBreakMode:0];
  [v19 setAlignment:1];
  v33[0] = *MEMORY[0x1E4FB06F8];
  v20 = [v17 font];
  uint64_t v21 = *MEMORY[0x1E4FB0738];
  v34[0] = v20;
  v34[1] = v19;
  uint64_t v22 = *MEMORY[0x1E4FB0700];
  v33[1] = v21;
  v33[2] = v22;
  [v17 textColor];
  v23 = v31 = v4;
  v34[2] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  v25 = PKAttributedStringByParsingLinksInString();
  [v17 setAttributedText:v25];
  [v17 setDelegate:self];
  [v17 setDataDetectorTypes:2];
  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsIssuerApp() & 1) == 0)
  {
    v26 = [v31 primaryButton];
    v27 = PKLocalizedAquamanString(&cfstr_BarcodePayment_4.isa, &stru_1EF1B4C70.isa, self->_issuerName);
    [v26 setTitle:v27 forState:0];
  }
  [v30 setManualEntryButton:0];
  v28 = [(PKBarcodePaymentOnboardingViewController *)self view];
  v29 = PKProvisioningBackgroundColor();
  [v28 setBackgroundColor:v29];

  PKPaymentSetupApplyContextAppearance([(PKExplanationViewController *)self context], v28);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  [(PKBarcodePaymentOnboardingViewController *)&v6 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  if (self->_educationPhone)
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKBarcodePaymentOnboardingViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __58__PKBarcodePaymentOnboardingViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1048) startAnimation];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = objc_msgSend(a4, "absoluteString", a3);
  int v8 = [v7 isEqualToString:@"OPEN_BARCODE_PAYMENT_PRIVACY_TEXT"];

  if (v8)
  {
    v9 = [[PKBarcodePaymentPrivacyViewController alloc] initWithIssuerName:self->_issuerName displayContext:0 paymentSetupContext:[(PKExplanationViewController *)self context]];
    uint64_t v10 = [[PKPortraitNavigationController alloc] initWithRootViewController:v9];
    [(PKBarcodePaymentOnboardingViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  if (self->_continueHandler)
  {
    v5 = [(PKExplanationViewController *)self explanationView];
    objc_super v6 = [v5 dockView];
    [v6 setButtonsEnabled:0];

    objc_initWeak(&location, self);
    continueHandler = (void (**)(id, void *))self->_continueHandler;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke;
    v8[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v9, &location);
    continueHandler[2](continueHandler, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKBarcodePaymentOnboardingViewController *)self _terminateSetupFlow];
  }
}

void __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained explanationView];
    v3 = [v2 dockView];
    [v3 setButtonsEnabled:1];

    id WeakRetained = v4;
  }
}

- (void)_terminateSetupFlow
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  terminationHandler = (void (**)(void))self->_terminationHandler;
  if (terminationHandler)
  {
    terminationHandler[2]();
  }
  else
  {
    v5 = [(PKBarcodePaymentOnboardingViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_imageForWatchView
{
  unint64_t v2 = +[PKBridgeWatchAttributeController heroWatchSize];
  if (v2 <= 4)
  {
    v3 = PKUIImageNamed(off_1E59CB2F8[v2]);
  }

  return v3;
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (void)setTerminationHandler:(id)a3
{
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
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_educationPhone, 0);

  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end