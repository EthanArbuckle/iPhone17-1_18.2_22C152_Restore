@interface PKSubcredentialPairingPinCodeViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)suppressFieldDetect;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (PKSubcredentialPairingPinCodeViewController)initWithFlowController:(id)a3 context:(id)a4;
- (id)localizedIssuerName;
- (unint64_t)operation;
- (void)cancelButtonPressed;
- (void)explanationViewDidUpdateLayout:(id)a3;
- (void)nextButtonPressed;
- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4;
- (void)resetPinCode;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSubcredentialPairingPinCodeViewController

- (PKSubcredentialPairingPinCodeViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKSubcredentialPairingPinCodeViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    [MEMORY[0x1E4FB18E0] sizeForInterfaceOrientation:1];
    v10->_keyboardSize.width = v11;
    v10->_keyboardSize.height = v12;
    v13 = [(PKSubcredentialPairingPinCodeViewController *)v10 navigationItem];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v10 action:sel_cancelButtonPressed];
    id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v16 = PKLocalizedPaymentString(&cfstr_Next.isa);
    uint64_t v17 = [v15 initWithTitle:v16 style:0 target:v10 action:sel_nextButtonPressed];
    nextButton = v10->_nextButton;
    v10->_nextButton = (UIBarButtonItem *)v17;

    [(UIBarButtonItem *)v10->_nextButton setEnabled:0];
    [v13 setLeftBarButtonItem:v14];
    [v13 setRightBarButtonItem:v10->_nextButton];
    id v19 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v19 configureWithTransparentBackground];
    v20 = [(PKSubcredentialPairingPinCodeViewController *)v10 navigationItem];
    [v20 setStandardAppearance:v19];
  }
  return v10;
}

- (unint64_t)operation
{
  return 2;
}

- (void)viewDidLoad
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  [(PKSubcredentialPairingPinCodeViewController *)&v38 viewDidLoad];
  uint64_t v3 = PKCredentialPairingPincodeLengthOverride();
  if (v3)
  {
    unint64_t v4 = v3;
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v40 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Overriding pin code length to: %ld", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v4 = 8;
  }
  v6 = [[PKPinCodeField alloc] initWithPinCodeLength:v4 delegate:self];
  pinCodeView = self->_pinCodeView;
  self->_pinCodeView = v6;

  [(PKPinCodeField *)self->_pinCodeView setHyphenatePinCode:v4 > 6];
  id v8 = [MEMORY[0x1E4F84EC8] sharedInstance];
  v9 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  v10 = [v9 provisioningTemplateIdentifier];

  CGFloat v11 = [[PKExplanationView alloc] initWithContext:0 delegate:self];
  explanationView = self->explanationView;
  self->explanationView = v11;

  [(PKExplanationView *)self->explanationView setTitleHyphenationFactor:0.5];
  v13 = [(PKExplanationView *)self->explanationView dockView];
  [v13 setPrimaryButton:0];

  v14 = [v8 provisioningString:@"CAR_KEY_PAIRING_AUTHENTICATION_CODE_TITLE" templateIdentifier:v10];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_CarKeyPairingA.isa);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v17 = v16;

  v37 = [(PKSubcredentialPairingPinCodeViewController *)self localizedIssuerName];
  v18 = PKStringWithValidatedFormat();

  -[PKExplanationView setTitleText:](self->explanationView, "setTitleText:", v18, v37);
  id v19 = self->explanationView;
  v20 = [v8 provisioningString:@"CAR_KEY_PAIRING_AUTHENTICATION_CODE_BODY" templateIdentifier:v10];
  if (v20)
  {
    [(PKExplanationView *)v19 setBodyText:v20];
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_CarKeyPairingA_0.isa);
    v22 = v21 = v17;
    [(PKExplanationView *)v19 setBodyText:v22];

    uint64_t v17 = v21;
  }

  v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  helpLabel = self->_helpLabel;
  self->_helpLabel = v23;

  [(UILabel *)self->_helpLabel setNumberOfLines:0];
  v25 = self->_helpLabel;
  v26 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB27D0]);
  [(UILabel *)v25 setFont:v26];

  v27 = self->_helpLabel;
  v28 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)v27 setTextColor:v28];

  [(UILabel *)self->_helpLabel setTextAlignment:1];
  v29 = self->_helpLabel;
  v30 = [v8 provisioningString:@"CAR_KEY_PAIRING_AUTHENTICATION_CODE_HELP" templateIdentifier:v10];
  if (v30)
  {
    [(UILabel *)v29 setText:v30];
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_CarKeyPairingA_1.isa);
    v31 = v8;
    v32 = v18;
    v34 = v33 = v17;
    [(UILabel *)v29 setText:v34];

    uint64_t v17 = v33;
    v18 = v32;
    id v8 = v31;
  }

  v35 = [(PKSubcredentialPairingPinCodeViewController *)self view];
  v36 = PKProvisioningBackgroundColor();
  [v35 setBackgroundColor:v36];

  [v35 addSubview:self->explanationView];
  [v35 addSubview:self->_pinCodeView];
  [v35 addSubview:self->_helpLabel];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  [(PKSubcredentialPairingPinCodeViewController *)&v21 viewWillLayoutSubviews];
  uint64_t v3 = [(PKSubcredentialPairingPinCodeViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  -[PKExplanationView setFrame:](self->explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
  -[PKPinCodeField sizeThatFits:](self->_pinCodeView, "sizeThatFits:", v9 * 0.8, 1.79769313e308);
  v14 = [(PKExplanationView *)self->explanationView bodyTextView];
  [v14 frame];
  CGRectGetMaxY(v22);

  UIRectCenteredXInRect();
  -[PKPinCodeField setFrame:](self->_pinCodeView, "setFrame:");
  id v15 = [v3 readableContentGuide];
  [v15 layoutFrame];
  double v17 = v16;
  double v19 = v18;

  -[UILabel sizeThatFits:](self->_helpLabel, "sizeThatFits:", v19, 1.79769313e308);
  -[UILabel setFrame:](self->_helpLabel, "setFrame:", v17, v11 - self->_keyboardSize.height - v20 + -24.0, v19, v20);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  [(PKSubcredentialPairingPinCodeViewController *)&v4 viewDidAppear:a3];
  [(PKPinCodeField *)self->_pinCodeView becomeFirstResponder];
  +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:1];
}

- (void)nextButtonPressed
{
  if (self->_isAdvancing)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:2 page:1];
    self->_isAdvancing = 1;
    objc_super v4 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
    double v5 = [(PKPinCodeField *)self->_pinCodeView pinCode];
    [v4 setPassword:v5];

    [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext setPasswordManuallyEntered:1];
    objc_initWeak(buf, self);
    flowController = self->_flowController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke;
    v7[3] = &unk_1E59CD960;
    objc_copyWeak(&v8, buf);
    v7[4] = self;
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      double v7 = [*(id *)(a1 + 32) navigationController];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke_2;
      v8[3] = &unk_1E59CB100;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      [WeakRetained[130] provisioningFinishedWithOperation:WeakRetained];
    }
  }
}

void __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[1024] = 0;
  }
}

- (void)cancelButtonPressed
{
  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:1 page:1];
  flowController = self->_flowController;
  if (flowController)
  {
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController provisioningWasCanceledWithOperation:self];
  }
  else
  {
    id v4 = [(PKSubcredentialPairingPinCodeViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)resetPinCode
{
}

- (id)localizedIssuerName
{
  id v3 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  id v4 = [v3 issuerIdentifier];

  double v5 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext localDeviceWebService];
  double v6 = [v5 targetDevice];
  double v7 = [v6 paymentWebService:v5 supportedRegionFeatureOfType:2];

  id v8 = [v7 localizedNameForIssuerWithIdentifier:v4];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_GenericPartner.isa);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = v10;

  return v11;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v3 = [(PKSubcredentialPairingPinCodeViewController *)self view];
  [v3 setNeedsLayout];
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
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_helpLabel, 0);
  objc_storeStrong((id *)&self->_pinCodeView, 0);

  objc_storeStrong((id *)&self->explanationView, 0);
}

@end