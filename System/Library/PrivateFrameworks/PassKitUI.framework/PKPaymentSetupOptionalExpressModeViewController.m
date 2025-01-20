@interface PKPaymentSetupOptionalExpressModeViewController
- (CGSize)_snapshotSize;
- (PKPaymentSetupOptionalExpressModeViewController)initWithProvisioningController:(id)a3 secureElementPass:(id)a4 context:(int64_t)a5;
- (PKPaymentSetupOptionalExpressModeViewControllerFlowDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_terminateSetupFlow;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)proceedToNextScreen;
- (void)setFlowItemDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPaymentSetupOptionalExpressModeViewController

- (PKPaymentSetupOptionalExpressModeViewController)initWithProvisioningController:(id)a3 secureElementPass:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  v11 = [(PKExplanationViewController *)&v16 initWithContext:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
    uint64_t v13 = [v9 provisioningTracker];
    provisioningTracker = v12->_provisioningTracker;
    v12->_provisioningTracker = (PKPaymentProvisioningTracker *)v13;

    [(PKSecureElementPass *)v12->_pass loadImageSetAsync:0 preheat:1 withCompletion:&__block_literal_global_183];
  }

  return v12;
}

void __108__PKPaymentSetupOptionalExpressModeViewController_initWithProvisioningController_secureElementPass_context___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: front face for pass loaded", v1, 2u);
  }
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  [(PKExplanationViewController *)&v16 loadView];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v5 = [v4 footerView];
  v6 = PKLocalizedTransitString(&cfstr_OptionalExpres.isa);
  [v3 setTitleText:v6];

  v7 = [v4 primaryButton];
  v8 = PKLocalizedTransitString(&cfstr_OptionalExpres_0.isa);
  [v7 setTitle:v8 forState:0];

  [v3 setForceShowSetupLaterButton:1];
  [v5 setManualEntryButton:0];
  id v9 = [(PKSecureElementPass *)self->_pass localizedDescription];
  id v10 = PKLocalizedTransitString(&cfstr_OptionalExpres_1.isa, &stru_1EF1B4C70.isa, v9);
  [v3 setBodyText:v10];

  v11 = [v5 setupLaterButton];
  v12 = PKLocalizedTransitString(&cfstr_OptionalExpres_2.isa);
  [v11 setTitle:v12 forState:0];

  uint64_t v13 = [[PKPassView alloc] initWithPass:self->_pass content:5 suppressedContent:1911];
  [(PKPaymentSetupOptionalExpressModeViewController *)self _snapshotSize];
  v14 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v13, "snapshotOfFrontFaceWithRequestedSize:");
  [v3 setImage:v14];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  [v3 showCheckmark:0 animated:0];
  [v3 setNeedsLayout];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v15 = [(PKPaymentSetupOptionalExpressModeViewController *)self navigationItem];
  [v15 setHidesBackButton:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  [(PKPaymentSetupOptionalExpressModeViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PKSecureElementPass *)self->_pass uniqueID];
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Selected to set pass with uniqueID:%@ as express", buf, 0xCu);
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  [(PKExplanationViewController *)self showSpinner:1];
  objc_initWeak((id *)buf, self);
  provisioningController = self->_provisioningController;
  v8 = [(PKSecureElementPass *)self->_pass paymentPass];
  provisioningTracker = self->_provisioningTracker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectContinue___block_invoke;
  v11[3] = &unk_1E59CB100;
  objc_copyWeak(&v12, (id *)buf);
  [(PKPaymentProvisioningController *)provisioningController finishOptionalExpressModeSetupForPass:v8 withProvisioningTracker:provisioningTracker completion:v11];

  id v10 = self->_provisioningTracker;
  self->_provisioningTracker = 0;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __84__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained reporter];
    [v5 reportPageCompleted:1 context:0];

    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4[131] uniqueID];
      v8[0] = 67109378;
      v8[1] = a2;
      __int16 v9 = 2112;
      id v10 = v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Finished enabling express mode successfully:%d for pass with uniqueID:%@", (uint8_t *)v8, 0x12u);
    }
    [v4 proceedToNextScreen];
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PKSecureElementPass *)self->_pass uniqueID];
    *(_DWORD *)buf = 138412290;
    objc_super v16 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Selected to not set pass with uniqueID:%@ as express", buf, 0xCu);
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];
  [(PKExplanationViewController *)self showSpinner:1];
  v7 = [(PKExplanationViewController *)self explanationView];
  v8 = [v7 dockView];
  [v8 setButtonsEnabled:0];

  objc_initWeak((id *)buf, self);
  provisioningController = self->_provisioningController;
  id v10 = [(PKSecureElementPass *)self->_pass paymentPass];
  provisioningTracker = self->_provisioningTracker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectSetupLater___block_invoke;
  v13[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v14, (id *)buf);
  [(PKPaymentProvisioningController *)provisioningController handleOptionalExpressModeSetupDidFinishForPass:v10 withExpressModes:0 provisioningTracker:provisioningTracker completion:v13];

  id v12 = self->_provisioningTracker;
  self->_provisioningTracker = 0;

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __86__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [WeakRetained[131] uniqueID];
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Finish without enable express mode for pass with uniqueID:%@", (uint8_t *)&v5, 0xCu);

LABEL_4:
    id v4 = [WeakRetained reporter];
    [v4 reportPageCompleted:0 context:0];

    [WeakRetained proceedToNextScreen];
    goto LABEL_5;
  }

  if (WeakRetained) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)proceedToNextScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained optionalExpressModeViewControllerDidFinish:self];
}

- (void)_terminateSetupFlow
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: terminate flow", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained optionalExpressModeViewControllerDidFinish:self];
}

- (CGSize)_snapshotSize
{
  double v2 = 220.0;
  double v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(PKPaymentSetupOptionalExpressModeViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (PKPaymentSetupOptionalExpressModeViewControllerFlowDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentSetupOptionalExpressModeViewControllerFlowDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_provisioningTracker, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end