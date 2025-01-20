@interface PKPaymentSetupBankAppDisambiguationViewController
- (PKPaymentSetupBankAppDisambiguationViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 paymentSetupProduct:(id)a6;
- (PKPaymentSetupBankAppDisambiguationViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)didSelectCameraWithCompletion:(id)a3;
- (void)didSelectInAppWithCompletion:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupBankAppDisambiguationViewController

- (PKPaymentSetupBankAppDisambiguationViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 paymentSetupProduct:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  v12 = [(PKPaymentSetupOptionsViewController *)&v15 initWithProvisioningController:a3 context:a4 delegate:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentSetupProduct, a6);
    [(PKDynamicCollectionViewController *)v13 setUseItemIdentityWhenUpdating:1];
  }

  return v13;
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  [(PKPaymentSetupOptionsViewController *)&v9 viewDidLoad];
  v3 = [(PKPaymentSetupBankAppDisambiguationViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  v4 = PKLocalizedPaymentString(&cfstr_CardType.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v5 = PKLocalizedPaymentString(&cfstr_CardTypeSelect.isa);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v5];

  v6 = [[PKPaymentSetupBankAppDisambiguationController alloc] initWithPaymentSetupProduct:self->_paymentSetupProduct];
  sectionController = self->_sectionController;
  self->_sectionController = v6;

  [(PKPaymentSetupBankAppDisambiguationController *)self->_sectionController setDelegate:self];
  v10[0] = self->_sectionController;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v8 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)didSelectInAppWithCompletion:(id)a3
{
  reporter = self->_reporter;
  id v5 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportOtherButtonPressed:@"inApp"];
  v6 = _Block_copy(v5);

  id loadingCompletion = self->_loadingCompletion;
  self->_id loadingCompletion = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained bankAppDisambiguationViewControllerDidSelectApp:self];
}

- (void)didSelectCameraWithCompletion:(id)a3
{
  reporter = self->_reporter;
  id v5 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportOtherButtonPressed:@"manualEntry"];
  v6 = _Block_copy(v5);

  id loadingCompletion = self->_loadingCompletion;
  self->_id loadingCompletion = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained bankAppDisambiguationViewControllerDidManualEntry:self];
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(PKDynamicCollectionViewController *)self collectionView];
  [v6 setUserInteractionEnabled:!v4];

  if (!v4)
  {
    id loadingCompletion = (void (**)(void))self->_loadingCompletion;
    if (loadingCompletion)
    {
      loadingCompletion[2]();
      id v8 = self->_loadingCompletion;
      self->_id loadingCompletion = 0;
    }
  }
}

- (PKPaymentSetupBankAppDisambiguationViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupBankAppDisambiguationViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong(&self->_loadingCompletion, 0);
  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);

  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end