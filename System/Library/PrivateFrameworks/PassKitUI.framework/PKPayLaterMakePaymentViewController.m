@interface PKPayLaterMakePaymentViewController
- (PKPayLaterMakePaymentViewController)initWithFinancingPlan:(id)a3 paymentIntentController:(id)a4;
- (void)_cancelButtonTapped;
- (void)_createDockView;
- (void)_didSelectCustomAmount;
- (void)_didSelectPayNextPaymentAmount;
- (void)preflightWithCompletion:(id)a3;
- (void)sectionController:(id)a3 didUpdateCurrentSelectedAmount:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKPayLaterMakePaymentViewController

- (PKPayLaterMakePaymentViewController)initWithFinancingPlan:(id)a3 paymentIntentController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 payLaterAccount];
  v28.receiver = self;
  v28.super_class = (Class)PKPayLaterMakePaymentViewController;
  v10 = [(PKPayLaterViewController *)&v28 initWithPayLaterAccount:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_paymentIntentController, a4);
    v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v10->_dateFormatter;
    v10->_dateFormatter = v11;

    v13 = v10->_dateFormatter;
    uint64_t v14 = *MEMORY[0x1E4F1C318];
    v15 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v13 setCalendar:v15];

    [(NSDateFormatter *)v10->_dateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v16 = [(PKPayLaterViewController *)v10 payLaterAccount];
    v17 = [v16 payLaterDetails];
    v18 = objc_msgSend(v17, "productForProductType:", objc_msgSend(v7, "productType"));

    v19 = [v18 productDetails];
    v20 = [v19 productTimeZone];

    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    timeFormatter = v10->_timeFormatter;
    v10->_timeFormatter = v21;

    v23 = v10->_timeFormatter;
    v24 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v14];
    [(NSDateFormatter *)v23 setCalendar:v24];

    [(NSDateFormatter *)v10->_timeFormatter setLocalizedDateFormatFromTemplate:@"j:mm a v"];
    [(NSDateFormatter *)v10->_timeFormatter setTimeZone:v20];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v10 action:sel__cancelButtonTapped];
    v26 = [(PKPayLaterMakePaymentViewController *)v10 navigationItem];
    [v26 setLeftBarButtonItem:v25];
  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentIntentController = self->_paymentIntentController;
    financingPlan = self->_financingPlan;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E59D0040;
    v8[4] = self;
    id v9 = v4;
    [(PKPayLaterPaymentIntentController *)paymentIntentController intentDetailsForFinancingPlan:financingPlan intent:1 completion:v8];
  }
}

void __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E59CB728;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1368), *(id *)(a1 + 40));
  v2 = [PKPayLaterMakePaymentSectionController alloc];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[166];
  id v5 = [v3 payLaterAccount];
  uint64_t v6 = -[PKPayLaterMakePaymentSectionController initWithFinancingPlan:payLaterAccount:intentDetails:dynamicContentPage:delegate:](v2, "initWithFinancingPlan:payLaterAccount:intentDetails:dynamicContentPage:delegate:", v4, v5, *(void *)(*(void *)(a1 + 32) + 1368), 0);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1344);
  *(void *)(v7 + 1344) = v6;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1344), "setDynamicCollectionDelegate:");
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v9();
}

- (void)viewDidLoad
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterMakePaymentViewController;
  [(PKPayLaterViewController *)&v22 viewDidLoad];
  if (self->_sectionController)
  {
    v23[0] = self->_sectionController;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];
  }
  uint64_t v4 = PKLocalizedCocoonString(&cfstr_MakeAPaymentTi.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v21 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  id v5 = [v21 nextInstallmentDueDate];
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v7 = [v6 components:32 fromDate:v5];
  uint64_t v8 = [v7 hour];
  id v9 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v5];
  v10 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v5];
  id v11 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  id v12 = [v11 displayName];

  if ([(PKPayLaterFinancingPlan *)self->_financingPlan state] == 4)
  {
    id v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
    uint64_t v14 = [v13 installments];
    unint64_t v15 = objc_msgSend(v14, "pk_countObjectsPassingTest:", &__block_literal_global_215);

    if (v15 > 1) {
      v16 = @"MAKE_PAST_DUE_PAYMENTS_DESCRIPTION";
    }
    else {
      v16 = @"MAKE_A_PAST_DUE_PAYMENT_DESCRIPTION";
    }
    PKLocalizedCocoonString(&v16->isa, &stru_1EF1B4C70.isa, v12);
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_MakeAPaymentDe.isa, &cfstr_Ld_3.isa, v8, v12, v9, v10);
  v17 = };
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v17];
  [(PKPayLaterMakePaymentViewController *)self _createDockView];
  v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v19 = [(PKPayLaterMakePaymentViewController *)self view];
  [v19 setBackgroundColor:v18];

  v20 = [(PKDynamicCollectionViewController *)self collectionView];
  [v20 setBackgroundColor:v18];
}

BOOL __50__PKPayLaterMakePaymentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

- (void)sectionController:(id)a3 didUpdateCurrentSelectedAmount:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PKPaymentSetupOptionsViewController *)self dockView];
  id v9 = [v6 primaryButton];

  uint64_t v7 = [v5 formattedStringValue];

  uint64_t v8 = PKLocalizedCocoonString(&cfstr_PayAmount.isa, &stru_1EF1B4C70.isa, v7);
  [v9 setTitle:v8 forState:0];
}

- (void)_cancelButtonTapped
{
}

- (void)_didSelectPayNextPaymentAmount
{
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  v3 = [(PKPayLaterMakePaymentSectionController *)self->_sectionController currentSelectedAmount];
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v5 = [(PKPayLaterMakePaymentViewController *)self view];
  uint64_t v6 = [v5 window];
  uint64_t v7 = [v6 windowScene];
  uint64_t v8 = [v7 _sceneIdentifier];

  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKPayLaterMakePaymentViewController__didSelectPayNextPaymentAmount__block_invoke;
  v14[3] = &unk_1E59DBF30;
  objc_copyWeak(v17, &location);
  id v12 = v3;
  id v15 = v12;
  id v13 = v4;
  id v16 = v13;
  v17[1] = (id)1;
  [(PKPayLaterPaymentIntentController *)paymentIntentController presentPaymentAuthorizationForFinancingPlan:financingPlan primaryPaymentSource:0 intentDetails:intentDetails intent:1 currencyAmount:v12 presentationSceneIdentifier:v8 completion:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __69__PKPayLaterMakePaymentViewController__didSelectPayNextPaymentAmount__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setShowNavigationBarSpinner:0];
    if ((a2 & 1) == 0)
    {
      if (v7 || (a3 & 1) == 0)
      {
        uint64_t v14 = PKAccountDisplayableError();
        id v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);

        [v9 presentViewController:v15 animated:1 completion:0];
        id v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          id v18 = v7;
          _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Failed to present financing plan payment intent authorization %@", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          id v13 = PKFinancingPlanPaymentIntentTypeToString();
          int v17 = 138412802;
          id v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          __int16 v21 = 2112;
          objc_super v22 = v13;
          _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Completed presenting financing plan payment intent authorization for amount %@, planIdentifier %@, intent %@", (uint8_t *)&v17, 0x20u);
        }
        [v9 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

- (void)_didSelectCustomAmount
{
  v3 = [PKPayLaterEnterAmountPaymentViewController alloc];
  uint64_t v4 = [(PKPayLaterViewController *)self payLaterAccount];
  uint64_t v6 = [(PKPayLaterEnterAmountPaymentViewController *)v3 initWithPayLaterAccount:v4 financingPlan:self->_financingPlan intentDetails:self->_intentDetails paymentIntentController:self->_paymentIntentController];

  id v5 = [(PKPayLaterMakePaymentViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_createDockView
{
  id v10 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v3 = [v10 primaryButton];
  [v3 addTarget:self action:sel__didSelectPayNextPaymentAmount forControlEvents:0x2000];

  sectionController = self->_sectionController;
  id v5 = [(PKPayLaterMakePaymentSectionController *)sectionController currentSelectedAmount];
  [(PKPayLaterMakePaymentViewController *)self sectionController:sectionController didUpdateCurrentSelectedAmount:v5];

  uint64_t v6 = [v10 footerView];
  [v6 setForceShowSetupLaterButton:1];
  id v7 = [v6 setupLaterButton];
  uint64_t v8 = PKLocalizedCocoonString(&cfstr_CustomAmount.isa);
  [v7 setTitle:v8 forState:0];

  id v9 = [v6 setupLaterButton];
  [v9 addTarget:self action:sel__didSelectCustomAmount forControlEvents:64];

  [v6 setManualEntryButton:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end