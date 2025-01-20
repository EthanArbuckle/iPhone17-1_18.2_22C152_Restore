@interface PKPayLaterFinancingPlanViewController
- (PKPayLaterFinancingPlanViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5 merchantIcon:(id)a6 iconGenerator:(id)a7;
- (double)headerHeight;
- (id)navigationBarAnimationView;
- (void)_closeButtonTapped;
- (void)_configureFinancingPlanMoreMenu;
- (void)_configureFooter;
- (void)_presentBusinessChat;
- (void)_presentInStoreReturnsViewController;
- (void)_presentLoanAgreement;
- (void)_presentLoanCancellationFlow;
- (void)_sharePlan;
- (void)_updateMerchantIcon;
- (void)dashboardMessageComposer:(id)a3 requestPresentFinancingPlanDetails:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPresentPassDetailsForPass:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPresentViewController:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPushViewController:(id)a4;
- (void)didUpdateFinancingPlan:(id)a3;
- (void)didUpdatePayLaterAccount:(id)a3;
- (void)payLaterContentActionFooterViewDidTapButton;
- (void)preflightWithCompletion:(id)a3;
- (void)reloadMessages;
- (void)viewDidLoad;
@end

@implementation PKPayLaterFinancingPlanViewController

- (PKPayLaterFinancingPlanViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5 merchantIcon:(id)a6 iconGenerator:(id)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (PKPaymentTransactionIconGenerator *)a7;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterFinancingPlanViewController;
  v18 = [(PKPayLaterViewController *)&v36 initWithPayLaterAccount:v14];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    p_paymentIntentController = (id *)&v19->_paymentIntentController;
    objc_storeStrong((id *)&v19->_paymentIntentController, a5);
    v21 = v17;
    if (!v17) {
      v21 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    }
    objc_storeStrong((id *)&v19->_iconGenerator, v21);
    if (!v17) {

    }
    objc_storeStrong((id *)&v19->_merchantIcon, a6);
    [*p_paymentIntentController intentDetailsForFinancingPlan:v13 intent:2 completion:0];
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v22;

    v24 = v19->_dateFormatter;
    v25 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v24 setCalendar:v25];

    [(NSDateFormatter *)v19->_dateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    [(PKDynamicCollectionViewController *)v19 setUseItemIdentityWhenUpdating:1];
    [(PKPayLaterFinancingPlanViewController *)v19 _configureFooter];
    v26 = [MEMORY[0x1E4F84898] sharedInstance];
    v27 = [v14 associatedPassUniqueID];
    v28 = [v26 passWithUniqueID:v27];
    uint64_t v29 = [v28 paymentPass];
    payLaterPass = v19->_payLaterPass;
    v19->_payLaterPass = (PKPaymentPass *)v29;

    v31 = [PKPayLaterDashboardMessageComposer alloc];
    v37[0] = v13;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v33 = [(PKPayLaterDashboardMessageComposer *)v31 initWithContext:1 allFinancingPlans:v32 payLaterPass:v19->_payLaterPass payLaterAccount:v14 financingPlan:v13 paymentIntentController:*p_paymentIntentController delegate:v19];
    dashboardMessagesComposer = v19->_dashboardMessagesComposer;
    v19->_dashboardMessagesComposer = (PKPayLaterDashboardMessageComposer *)v33;

    [(PKPayLaterFinancingPlanViewController *)v19 _configureFinancingPlanMoreMenu];
  }

  return v19;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke;
  v14[3] = &unk_1E59CFB08;
  v14[4] = self;
  [v5 addOperation:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_3;
  v13[3] = &unk_1E59CFB08;
  v13[4] = self;
  [v5 addOperation:v13];
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F1CA98] null];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_6;
  v9[3] = &unk_1E59CFB80;
  objc_copyWeak(&v11, &location);
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  id v8 = (id)[v5 evaluateWithInput:v6 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 1384);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_2;
  v11[3] = &unk_1E59CAD68;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 preflightDashboardMessagesWithCompletion:v11];
}

uint64_t __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)v10[171];
  if (v11)
  {
    [v11 size];
    if (v13 == 80.0 && v12 == 80.0)
    {
      v9[2](v9, v8, 0);
      goto LABEL_9;
    }
    id v10 = *(void **)(a1 + 32);
  }
  objc_initWeak(&location, v10);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 1392);
  v17 = [*(id *)(v15 + 1328) merchant];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_4;
  v21[3] = &unk_1E59CFB58;
  objc_copyWeak(&v22, &location);
  uint64_t v18 = objc_msgSend(v16, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v21, 80.0, 80.0);
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 1368);
  *(void *)(v19 + 1368) = v18;

  v9[2](v9, v8, 0);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_9:
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_5;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v5;
  char v10 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_5(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 171, *(id *)(a1 + 32));
    WeakRetained = v3;
    if (*(unsigned char *)(a1 + 48))
    {
      [v3 _updateMerchantIcon];
      WeakRetained = v3;
    }
  }
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1416) = 1;
    id v12 = WeakRetained;
    id v4 = [PKPayLaterFinancingPlanSectionController alloc];
    uint64_t v5 = *((void *)v12 + 166);
    id v6 = [v12 payLaterAccount];
    uint64_t v7 = [(PKPayLaterFinancingPlanSectionController *)v4 initWithFinancingPlan:v5 payLaterAccount:v6 payLaterPass:*((void *)v12 + 167) dynamicContentPage:0 merchantIcon:*((void *)v12 + 171) paymentIntentController:*((void *)v12 + 169) delegate:v12];
    id v8 = (void *)*((void *)v12 + 168);
    *((void *)v12 + 168) = v7;

    [*((id *)v12 + 168) setDynamicCollectionDelegate:*(void *)(a1 + 32)];
    id v9 = (void *)*((void *)v12 + 168);
    char v10 = [*((id *)v12 + 173) dashboardMessages];
    [v9 setDashboardMessages:v10];

    [v12 _updateMerchantIcon];
    v3 = v12;
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
      v3 = v12;
    }
  }
}

- (void)viewDidLoad
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanViewController;
  [(PKPayLaterViewController *)&v16 viewDidLoad];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    financingPlan = self->_financingPlan;
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = financingPlan;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Viewing financing plan %@", buf, 0xCu);
  }

  uint64_t v5 = [(PKPayLaterFinancingPlanViewController *)self navigationController];
  id v6 = [v5 viewControllers];
  BOOL v7 = [v6 count] == 1;

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 menu:0];
    [v8 setTarget:self];
    [v8 setAction:sel__closeButtonTapped];
    id v9 = [(PKPayLaterFinancingPlanViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v15, (id *)buf);
  char v10 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = v10;
  if (self->_preflightedData)
  {
    v10[2](v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke_2;
    v12[3] = &unk_1E59CA9F8;
    double v13 = v10;
    [(PKPayLaterFinancingPlanViewController *)self preflightWithCompletion:v12];
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 168))
  {
    v4[0] = *((void *)WeakRetained + 168);
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    [v2 setSections:v3 animated:0];
  }
}

uint64_t __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadMessages
{
  sectionController = self->_sectionController;
  id v4 = [(PKPayLaterDashboardMessageComposer *)self->_dashboardMessagesComposer dashboardMessages];
  [(PKPayLaterFinancingPlanSectionController *)sectionController setDashboardMessages:v4];

  [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];
}

- (void)dashboardMessageComposer:(id)a3 requestPresentViewController:(id)a4
{
  if (a4) {
    [(PKPayLaterFinancingPlanViewController *)self presentViewController:a4 animated:1 completion:0];
  }
}

- (void)dashboardMessageComposer:(id)a3 requestPushViewController:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = [(PKPayLaterFinancingPlanViewController *)self navigationController];
    [v6 pushViewController:v5 animated:1];
  }
}

- (void)dashboardMessageComposer:(id)a3 requestPresentPassDetailsForPass:(id)a4
{
  if (a4)
  {
    objc_msgSend(a4, "uniqueID", a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    PKOpenPassDetails();
  }
}

- (void)dashboardMessageComposer:(id)a3 requestPresentFinancingPlanDetails:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 planIdentifier];
    id v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      id v12 = v11;
      if (v10 && v11)
      {
        char v13 = [v10 isEqualToString:v11];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      id v10 = [v7 planIdentifier];
      PKOpenPayLaterFinancingPlanDetails();
    }
  }
LABEL_11:
}

- (id)navigationBarAnimationView
{
  return self->_navigationBarImageView;
}

- (double)headerHeight
{
  [(PKPayLaterFinancingPlanSectionController *)self->_sectionController headerViewHeight];
  return result;
}

- (void)didUpdateFinancingPlan:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 planIdentifier];
  BOOL v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    id v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_17;
    }
    char v11 = [v8 isEqualToString:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_17;
    }
  }
  pendingFinancingPlanUpdate = self->_pendingFinancingPlanUpdate;
  objc_storeStrong((id *)&self->_pendingFinancingPlanUpdate, a3);
  if (!pendingFinancingPlanUpdate)
  {
    if (self->_lastUpdateOfFinancingPlan)
    {
      char v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:self->_lastUpdateOfFinancingPlan];
      uint64_t v15 = (uint64_t)v14;

      if (v15 <= 3) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 3;
    }
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(PKPayLaterFinancingPlan *)self->_pendingFinancingPlanUpdate planIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Waiting %ld seconds to update the UI for financing plan update: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v19 = dispatch_time(0, 1000000000 * v16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKPayLaterFinancingPlanViewController_didUpdateFinancingPlan___block_invoke;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v21, (id *)buf);
    dispatch_after(v19, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
LABEL_17:
}

void __64__PKPayLaterFinancingPlanViewController_didUpdateFinancingPlan___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    v3 = (void *)*((void *)WeakRetained + 178);
    *((void *)WeakRetained + 178) = v2;

    id v4 = (id *)(WeakRetained + 1328);
    objc_storeStrong((id *)WeakRetained + 166, *((id *)WeakRetained + 179));
    id v5 = (void *)*((void *)WeakRetained + 179);
    *((void *)WeakRetained + 179) = 0;

    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [*v4 planIdentifier];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Updating financing plan UI: %@", (uint8_t *)&v8, 0xCu);
    }
    [*((id *)WeakRetained + 173) setFinancingPlan:*v4];
    [*((id *)WeakRetained + 168) setFinancingPlan:*v4];
    [WeakRetained _configureFooter];
    [WeakRetained reloadMessages];
  }
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  dashboardMessagesComposer = self->_dashboardMessagesComposer;
  id v5 = a3;
  [(PKPayLaterDashboardMessageComposer *)dashboardMessagesComposer setPayLaterAccount:v5];
  [(PKPayLaterSectionController *)self->_sectionController setPayLaterAccount:v5];

  [(PKPayLaterFinancingPlanViewController *)self _configureFooter];

  [(PKPayLaterFinancingPlanViewController *)self reloadMessages];
}

- (void)payLaterContentActionFooterViewDidTapButton
{
  v3 = [[PKPayLaterMakePaymentViewController alloc] initWithFinancingPlan:self->_financingPlan paymentIntentController:self->_paymentIntentController];
  id v4 = [[PKNavigationController alloc] initWithRootViewController:v3];
  [(PKPayLaterContentActionFooterView *)self->_footerView setShowSpinner:1];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke;
  v6[3] = &unk_1E59CC710;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v5 = v4;
  BOOL v7 = v5;
  [(PKPayLaterMakePaymentViewController *)v3 preflightWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    char v11 = __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke_2;
    id v12 = &unk_1E59CA7F8;
    objc_copyWeak(&v13, &location);
    id v6 = (void (**)(void))_Block_copy(&v9);
    if (v4)
    {
      BOOL v7 = PKAccountDisplayableError();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8) {
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, v6, v9, v10, v11, v12);
      }
      else {
        v6[2](v6);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(void *)(a1 + 40), 1, v6, v9, v10, v11, v12);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[170] setShowSpinner:0];
    id WeakRetained = v2;
  }
}

- (void)_updateMerchantIcon
{
  navigationBarImageView = self->_navigationBarImageView;
  if (navigationBarImageView)
  {
    merchantIcon = self->_merchantIcon;
    [(UIImageView *)navigationBarImageView setImage:merchantIcon];
  }
  else
  {
    id v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:self->_merchantIcon];
    id v6 = self->_navigationBarImageView;
    self->_navigationBarImageView = v5;

    [(UIImageView *)self->_navigationBarImageView setContentMode:1];
    [(UIImageView *)self->_navigationBarImageView _setContinuousCornerRadius:3.0];
    BOOL v7 = self->_navigationBarImageView;
    [(UIImageView *)v7 setClipsToBounds:1];
  }
}

- (void)_configureFooter
{
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  int v4 = [v3 autoPayment];

  id v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v38 = [v5 nextDueInstallment];

  id v6 = [v38 dueDate];
  [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if (PKPayLaterFinancingPlanStateIsPending()) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v38 == 0;
  }
  if (v7 || v6 == 0)
  {
    footerView = self->_footerView;
    self->_footerView = 0;

    [(PKPayLaterViewController *)self setFooterView:0];
    goto LABEL_34;
  }
  uint64_t v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if (v10 == 4) {
    goto LABEL_13;
  }
  if (v10 == 1)
  {
    char v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    id v13 = [v11 components:16 fromDate:v12 toDate:v6 options:0];

    uint64_t v14 = [v13 day];
    uint64_t v15 = *MEMORY[0x1E4F87960];

    if (v14 < v15)
    {
LABEL_13:
      uint64_t v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      v37 = [MEMORY[0x1E4FB1618] labelColor];
      v17 = PKLocalizedCocoonString(&cfstr_PayNowButton.isa);
      goto LABEL_16;
    }
    v17 = PKLocalizedCocoonString(&cfstr_PayEarlyButton.isa);
    uint64_t v16 = [MEMORY[0x1E4FB1618] labelColor];
    v37 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  }
  else
  {
    v17 = 0;
    uint64_t v16 = 0;
    v37 = 0;
  }
LABEL_16:
  uint64_t v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  dispatch_time_t v19 = (void *)MEMORY[0x1E4FB1830];
  v20 = +[PKPayLaterContentActionFooterView leadingTitleFont];
  id v21 = [v19 configurationWithFont:v20 scale:1];

  uint64_t v22 = [v38 status];
  if (v22 == 4)
  {
    uint64_t v26 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
    uint64_t v23 = [v26 pastDueAmount];

    v27 = PKLocalizedCocoonString(&cfstr_PastDueAmount.isa);
    [MEMORY[0x1E4FB1618] redColor];
    uint64_t v18 = v25 = v18;
    goto LABEL_24;
  }
  if (v22 == 1)
  {
    uint64_t v23 = [v38 currentBalance];
    uint64_t v24 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v6];
    v25 = (void *)v24;
    if (v4) {
      PKLocalizedCocoonString(&cfstr_AutopayOnDate.isa, &stru_1EF1B4C70.isa, v24);
    }
    else {
    v27 = PKLocalizedCocoonString(&cfstr_InstallmentDue.isa, &stru_1EF1B4C70.isa, v24);
    }
LABEL_24:

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E4F84998];
      [(PKPayLaterViewController *)self payLaterAccount];
      objc_super v36 = v21;
      v30 = uint64_t v29 = v16;
      LODWORD(v28) = objc_msgSend(v28, "canMakePaymentsWithAccountState:", objc_msgSend(v30, "state"));

      v31 = [[PKPayLaterContentActionFooterView alloc] initWithDelegate:self];
      v32 = self->_footerView;
      self->_footerView = v31;

      [(PKPayLaterContentActionFooterView *)self->_footerView setLeadingTitleText:v27];
      [(PKPayLaterContentActionFooterView *)self->_footerView setLeadingTitleIcon:0];
      [(PKPayLaterContentActionFooterView *)self->_footerView setLeadingTitleTextColor:v18];
      uint64_t v33 = self->_footerView;
      v34 = [v23 formattedStringValue];
      v35 = v33;
      uint64_t v16 = v29;
      id v21 = v36;
      [(PKPayLaterContentActionFooterView *)v35 setLeadingDetailText:v34];

      if (v28)
      {
        if ([v17 length]) {
          [(PKPayLaterContentActionFooterView *)self->_footerView setButtonText:v17];
        }
        if (v37) {
          -[PKPayLaterContentActionFooterView setButtonTintColor:](self->_footerView, "setButtonTintColor:");
        }
        if (v16) {
          [(PKPayLaterContentActionFooterView *)self->_footerView setButtonTitleColor:v16];
        }
      }
      [(PKPayLaterViewController *)self setFooterView:self->_footerView];
    }
    goto LABEL_33;
  }
  v27 = 0;
  uint64_t v23 = 0;
LABEL_33:

LABEL_34:
}

- (void)_closeButtonTapped
{
}

- (void)_configureFinancingPlanMoreMenu
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v41 = [v3 panSuffix];

  objc_initWeak(&location, self);
  if (v41)
  {
    int v4 = (void *)MEMORY[0x1E4FB13F0];
    id v5 = PKLocalizedCocoonString(&cfstr_Returns.isa);
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.left"];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke;
    v51[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v52, &location);
    BOOL v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v51];

    [v42 addObject:v7];
    objc_destroyWeak(&v52);
  }
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v9 = PKLocalizedCocoonString(&cfstr_ReportAnIssue.isa);
  uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"flag"];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_2;
  v49[3] = &unk_1E59CBEE0;
  v39 = &v50;
  objc_copyWeak(&v50, &location);
  char v11 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:v49];

  [v42 addObject:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v14 = PKLocalizedCocoonString(&cfstr_ViewLoanAgreem.isa);
  uint64_t v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_3;
  v47[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v48, &location);
  uint64_t v16 = [v13 actionWithTitle:v14 image:v15 identifier:0 handler:v47];

  [v12 addObject:v16];
  if ([(PKPayLaterFinancingPlan *)self->_financingPlan isCancellable])
  {
    v17 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"minus.circle", &v50);
    uint64_t v18 = [MEMORY[0x1E4FB1618] redColor];
    dispatch_time_t v19 = [v17 imageWithTintColor:v18];
    v20 = [v19 imageWithRenderingMode:1];

    id v21 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v22 = PKLocalizedCocoonString(&cfstr_MarkAsCanceled.isa);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_4;
    v45[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v46, &location);
    uint64_t v23 = [v21 actionWithTitle:v22 image:v20 identifier:0 handler:v45];

    [v23 setAttributes:2];
    [v12 addObject:v23];

    objc_destroyWeak(&v46);
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4FB1970], "menuWithTitle:image:identifier:options:children:", &stru_1EF1B5B50, 0, 0, 1, v12, v39);
  [v42 safelyAddObject:v24];

  if (PKTransactionDebugDetailsEnabled())
  {
    v25 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant"];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_5;
    v43[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v44, &location);
    v27 = [v25 actionWithTitle:@"Debug Plan" image:v26 identifier:0 handler:v43];

    v28 = (void *)MEMORY[0x1E4FB1970];
    v54[0] = v27;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    v30 = [v28 menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v29];
    [v42 safelyAddObject:v30];

    objc_destroyWeak(&v44);
  }
  v31 = PKUIInfoButtonImageWithDefaultConfiguration();
  id v32 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v33 = [MEMORY[0x1E4FB1970] menuWithChildren:v42];
  v34 = (UIBarButtonItem *)[v32 initWithImage:v31 menu:v33];
  moreMenuButton = self->_moreMenuButton;
  self->_moreMenuButton = v34;

  objc_super v36 = self->_moreMenuButton;
  v37 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIBarButtonItem *)v36 setTintColor:v37];

  id v38 = [(PKPayLaterFinancingPlanViewController *)self navigationItem];
  [v38 setRightBarButtonItem:self->_moreMenuButton];

  objc_destroyWeak(&v48);
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentInStoreReturnsViewController];
    id WeakRetained = v2;
  }
}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentBusinessChat];
    id WeakRetained = v2;
  }
}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentLoanAgreement];
    id WeakRetained = v2;
  }
}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentLoanCancellationFlow];
    id WeakRetained = v2;
  }
}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _sharePlan];
    id WeakRetained = v2;
  }
}

- (void)_presentBusinessChat
{
  v3 = [PKPayLaterBusinessChatTopicComposer alloc];
  int v4 = [(PKPayLaterViewController *)self payLaterAccount];
  id v5 = [(PKPayLaterBusinessChatTopicComposer *)v3 initWithPayLaterAccount:v4 payLaterPass:self->_payLaterPass financingPlan:self->_financingPlan installment:0 payment:0];
  topicsComposer = self->_topicsComposer;
  self->_topicsComposer = v5;

  objc_initWeak(&location, self);
  BOOL v7 = self->_topicsComposer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke;
  v8[3] = &unk_1E59CFBD0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)2;
  [(PKPayLaterBusinessChatTopicComposer *)v7 releventTopicsForContext:2 completion:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_2;
  block[3] = &unk_1E59CFBA8;
  objc_copyWeak(v8, (id *)(a1 + 32));
  int v4 = *(void **)(a1 + 40);
  id v7 = v3;
  v8[1] = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) count])
    {
      int v4 = [PKPayLaterBusinessChatTopicsViewController alloc];
      id v5 = [WeakRetained payLaterAccount];
      id v6 = [(PKPayLaterBusinessChatTopicsViewController *)v4 initWithPayLaterAccount:v5 payLaterPass:WeakRetained[167] financingPlan:WeakRetained[166] installment:0 payment:0 topics:*(void *)(a1 + 32) businessChatContext:*(void *)(a1 + 48)];

      id v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
      [WeakRetained presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      id v8 = (void *)WeakRetained[176];
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = objc_alloc_init(PKBusinessChatController);
      }
      uint64_t v10 = (void *)WeakRetained[176];
      WeakRetained[176] = v9;

      char v11 = [PKBusinessChatPayLaterContext alloc];
      id v12 = [WeakRetained payLaterAccount];
      uint64_t v13 = WeakRetained[167];
      uint64_t v14 = [MEMORY[0x1E4F84960] genericBusinessChatTopicForContext:*(void *)(a1 + 48)];
      uint64_t v15 = [(PKBusinessChatPayLaterContext *)v11 initWithPayLaterAccount:v12 paymentPass:v13 topic:v14 financingPlan:WeakRetained[166] installment:0 payment:0 dispute:0];

      uint64_t v16 = (void *)WeakRetained[176];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_3;
      v17[3] = &unk_1E59CB240;
      objc_copyWeak(&v18, v2);
      [v16 openBusinessChatWithContext:v15 completion:v17];
      objc_destroyWeak(&v18);
    }
  }
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_4;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v5 = WeakRetained;
    id v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4) {
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    [v5 presentViewController:v4 animated:1 completion:0];

    id WeakRetained = v5;
  }
}

- (void)_presentInStoreReturnsViewController
{
  id v3 = [PKPayLaterFinancingPlanInStoreReturnViewController alloc];
  financingPlan = self->_financingPlan;
  id v5 = [(PKPayLaterViewController *)self payLaterAccount];
  id v6 = [(PKPayLaterFinancingPlanInStoreReturnViewController *)v3 initWithFinancingPlan:financingPlan payLaterAccount:v5];

  [(PKPayLaterViewController *)self pushViewController:v6 animated:1];
}

- (void)_presentLoanAgreement
{
  id v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan termsDetails];
  id v4 = [v3 installmentAgreementIdentifier];

  if (v4)
  {
    id v5 = [PKAccountTermsAndConditionsController alloc];
    id v6 = [(PKPayLaterViewController *)self payLaterAccount];
    id v7 = [MEMORY[0x1E4F84D50] sharedService];
    id v8 = [(PKAccountTermsAndConditionsController *)v5 initWithAccount:v6 webService:v7 context:0 termsIdentifier:v4];
    termsController = self->_termsController;
    self->_termsController = v8;

    objc_initWeak(&location, self);
    uint64_t v10 = self->_termsController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PKPayLaterFinancingPlanViewController__presentLoanAgreement__block_invoke;
    v13[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v14, &location);
    [(PKAccountTermsAndConditionsController *)v10 termsViewControllerWithCompletion:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    char v11 = PKAccountDisplayableError();
    id v12 = PKAlertForDisplayableErrorWithHandlers(v11, 0, 0, 0);

    if (v12) {
      [(PKPayLaterFinancingPlanViewController *)self presentViewController:v12 animated:1 completion:0];
    }
  }
}

void __62__PKPayLaterFinancingPlanViewController__presentLoanAgreement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      id v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)_presentLoanCancellationFlow
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if (v3 > 8)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = PKLocalizedCocoonString(&off_1E59CFC40[v3]->isa);
  }
  objc_initWeak(&location, self);
  id v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Presenting loan cancellation alert for %@", buf, 0xCu);
  }

  id v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = PKLocalizedCocoonString(&cfstr_MarkAsCanceled.isa);
  id v9 = [v7 alertControllerWithTitle:v8 message:v4 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  char v11 = PKLocalizedCocoonString(&cfstr_MarkAsCanceled_2.isa);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke;
  v21[3] = &unk_1E59CFC20;
  id v12 = v5;
  id v22 = v12;
  objc_copyWeak(&v24, &location);
  uint64_t v23 = self;
  uint64_t v13 = [v10 actionWithTitle:v11 style:2 handler:v21];
  [v9 addAction:v13];

  id v14 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v15 = PKLocalizedCocoonString(&cfstr_CancelButton.isa);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_137;
  v19[3] = &unk_1E59CB1F0;
  id v16 = v12;
  id v20 = v16;
  v17 = [v14 actionWithTitle:v15 style:1 handler:v19];
  [v9 addAction:v17];

  id v18 = [(PKPayLaterFinancingPlanViewController *)self navigationController];
  [v18 presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "User wants to cancel loan for %@", buf, 0xCu);
  }

  id v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = [*(id *)(a1 + 40) payLaterAccount];
    uint64_t v9 = WeakRetained[166];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_131;
    v10[3] = &unk_1E59CFBF8;
    objc_copyWeak(&v11, v6);
    +[PKPayLaterFinancingPlanCancellationViewController planCancellationReasonsDynamincContentForPayLaterAccount:v8 financingPlan:v9 completion:v10];

    objc_destroyWeak(&v11);
  }
}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_131(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Error getting loan cancellation reasons UI %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v13 = PKAccountDisplayableError();
      uint64_t v10 = (PKPayLaterFinancingPlanCancellationViewController *)PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);

      if (v10) {
        [WeakRetained presentViewController:v10 animated:1 completion:0];
      }
    }
    else
    {
      id v8 = [PKPayLaterFinancingPlanCancellationViewController alloc];
      uint64_t v9 = [WeakRetained payLaterAccount];
      uint64_t v10 = [(PKPayLaterFinancingPlanCancellationViewController *)v8 initWithPayLaterAccount:v9 financingPlan:WeakRetained[166] dynamicContentPage:v5];

      id v11 = [[PKNavigationController alloc] initWithRootViewController:v10];
      [WeakRetained presentViewController:v11 animated:1 completion:0];
    }
  }
}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_137(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User wants to keep loan for %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_sharePlan
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (PKTransactionDebugDetailsEnabled())
  {
    uint64_t v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan dictionaryRepresentation];
    if (v3)
    {
      id v22 = 0;
      int v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&v22];
      id v5 = v22;
      if (v4)
      {
        uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v7 = [NSString alloc];
        id v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
        uint64_t v9 = (void *)[v7 initWithFormat:@"financingPlan_%@.json", v8];

        uint64_t v10 = [v6 temporaryDirectory];
        id v11 = [v10 URLByAppendingPathComponent:v9];

        id v12 = [v11 path];
        char v13 = [v6 createFileAtPath:v12 contents:v4 attributes:0];

        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F9F2E8]);
          uint64_t v23 = v11;
          id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
          uint64_t v16 = [v14 initWithActivityItems:v15 applicationActivities:0];

          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __51__PKPayLaterFinancingPlanViewController__sharePlan__block_invoke;
          v19[3] = &unk_1E59CD068;
          id v20 = v6;
          id v21 = v11;
          [v16 setCompletionWithItemsHandler:v19];
          v17 = [v16 popoverPresentationController];
          [v17 setBarButtonItem:self->_moreMenuButton];

          [(PKPayLaterFinancingPlanViewController *)self presentViewController:v16 animated:1 completion:0];
        }
        else
        {
          uint64_t v16 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v11 path];
            *(_DWORD *)buf = 138412290;
            v25 = v18;
            _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error saving financing plan JSON to file path: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v3;
          __int16 v26 = 2112;
          id v27 = v5;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error converting financing plan dictionary %@ to JSON: %@", buf, 0x16u);
        }
      }
    }
  }
}

uint64_t __51__PKPayLaterFinancingPlanViewController__sharePlan__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_topicsComposer, 0);
  objc_storeStrong((id *)&self->_moreMenuButton, 0);
  objc_storeStrong((id *)&self->_pendingFinancingPlanUpdate, 0);
  objc_storeStrong((id *)&self->_lastUpdateOfFinancingPlan, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_navigationBarImageView, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dashboardMessagesComposer, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end