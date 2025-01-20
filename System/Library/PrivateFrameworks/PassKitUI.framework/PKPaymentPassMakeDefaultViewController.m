@interface PKPaymentPassMakeDefaultViewController
- (CGSize)_snapshotSize;
- (PKPaymentPassMakeDefaultViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5;
- (PKPaymentPassMakeDefaultViewControllerDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_makePaymentPassDefault;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)proceedToNextScreen;
- (void)setFlowItemDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPaymentPassMakeDefaultViewController

- (PKPaymentPassMakeDefaultViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  v11 = [(PKExplanationViewController *)&v14 initWithContext:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
    [(PKSecureElementPass *)v12->_pass loadImageSetSync:0 preheat:1];
  }

  return v12;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  [(PKExplanationViewController *)&v15 loadView];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v5 = [v4 footerView];
  if ([(PKSecureElementPass *)self->_pass supportsBarcodePayment])
  {
    v6 = PKLocalizedAquamanString(&cfstr_PaymentAccount.isa);
    v7 = PKLocalizedAquamanString(&cfstr_PaymentAccount_0.isa);
    PKLocalizedAquamanString(&cfstr_PaymentMakeDef.isa);
  }
  else
  {
    v6 = PKLocalizedPaymentString(&cfstr_PaymentMakeDef_0.isa);
    v7 = PKLocalizedPaymentString(&cfstr_PaymentMakeDef_1.isa);
    PKLocalizedPaymentString(&cfstr_PaymentMakeDef.isa);
  v8 = };
  [v3 setTitleText:v6];
  id v9 = [v4 primaryButton];
  [v9 setTitle:v8 forState:0];

  [v3 setForceShowSetupLaterButton:1];
  [v5 setManualEntryButton:0];
  [v3 setBodyText:v7];
  id v10 = [v5 setupLaterButton];
  v11 = PKLocalizedPaymentString(&cfstr_PaymentMakeDef_2.isa);
  [v10 setTitle:v11 forState:0];

  v12 = [[PKPassView alloc] initWithPass:self->_pass content:5 suppressedContent:1911];
  [(PKPaymentPassMakeDefaultViewController *)self _snapshotSize];
  v13 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v12, "snapshotOfFrontFaceWithRequestedSize:");
  [v3 setImage:v13];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  [v3 showCheckmark:0 animated:0];
  [v3 setNeedsLayout];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  objc_super v14 = [(PKPaymentPassMakeDefaultViewController *)self navigationItem];
  [v14 setHidesBackButton:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  [(PKPaymentPassMakeDefaultViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  v5 = [v4 dockView];
  [v5 setButtonsEnabled:0];

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  [(PKPaymentPassMakeDefaultViewController *)self _makePaymentPassDefault];

  [(PKPaymentPassMakeDefaultViewController *)self proceedToNextScreen];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  v5 = [v4 dockView];
  [v5 setButtonsEnabled:0];

  reporter = self->_reporter;
  uint64_t v8 = *MEMORY[0x1E4F86BA0];
  v9[0] = *MEMORY[0x1E4F86B98];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:3 context:v7];

  [(PKPaymentPassMakeDefaultViewController *)self proceedToNextScreen];
}

- (void)proceedToNextScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained paymentPassMakeDefaultViewControllerDidFinish:self];
}

- (CGSize)_snapshotSize
{
  double v2 = 220.0;
  double v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_makePaymentPassDefault
{
  if ([(PKSecureElementPass *)self->_pass supportsDefaultCardSelection])
  {
    double v3 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    objc_super v4 = [v3 targetDevice];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = [(PKSecureElementPass *)self->_pass uniqueID];
      [v4 paymentWebService:v3 setDefaultPaymentPassUniqueIdentifier:v5];

      reporter = self->_reporter;
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support setting default", v9, 2u);
      }

      reporter = self->_reporter;
      uint64_t v7 = 0;
    }
    [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportPageCompleted:v7 context:0];
  }
  else
  {
    double v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Attempted to set default with pass that does not allow default selection. Skipping.", buf, 2u);
    }
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(PKPaymentPassMakeDefaultViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (PKPaymentPassMakeDefaultViewControllerDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentPassMakeDefaultViewControllerDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end