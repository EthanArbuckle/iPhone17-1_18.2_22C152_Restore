@interface PKPayLaterFinancingPlanListViewController
+ (id)activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 completedFinancingPlansCount:(int64_t)a6;
+ (id)completedFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 completedFinancingPlans:(id)a5 completedFinancingPlansQuery:(id)a6;
+ (id)disputeFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 businessChatTopic:(id)a5 financingPlans:(id)a6 completedFinancingPlans:(id)a7 financingPlansUpdateQuery:(id)a8 completedFinancingPlansQuery:(id)a9;
+ (id)financingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 financingPlansUpdateQuery:(id)a6;
- (PKPayLaterFinancingPlanListViewController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 primaryFinancingPlansUpdateQuery:(id)a11 secondaryFinancingPlansUpdateQuery:(id)a12;
- (void)_updatedFinancingPlan:(id)a3;
- (void)didUpdatePayLaterAccount:(id)a3;
- (void)openBusinessChatForTopic:(id)a3 financingPlan:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKPayLaterFinancingPlanListViewController

+ (id)disputeFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 businessChatTopic:(id)a5 financingPlans:(id)a6 completedFinancingPlans:(id)a7 financingPlansUpdateQuery:(id)a8 completedFinancingPlansQuery:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [[PKPayLaterFinancingPlanListViewController alloc] initWithPayLaterAccount:v21 context:3 primaryFinancingPlans:v18 secondaryFinancingPlans:v17 tertiaryFinancingPlansCount:0 payLaterPass:v20 businessChatTopic:v19 paymentIntentController:0 primaryFinancingPlansUpdateQuery:v16 secondaryFinancingPlansUpdateQuery:v15];

  return v22;
}

+ (id)completedFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 completedFinancingPlans:(id)a5 completedFinancingPlansQuery:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[PKPayLaterFinancingPlanListViewController alloc] initWithPayLaterAccount:v12 context:1 primaryFinancingPlans:v10 secondaryFinancingPlans:0 tertiaryFinancingPlansCount:0 payLaterPass:0 businessChatTopic:0 paymentIntentController:v11 primaryFinancingPlansUpdateQuery:v9 secondaryFinancingPlansUpdateQuery:0];

  return v13;
}

+ (id)financingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 financingPlansUpdateQuery:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[PKPayLaterFinancingPlanListViewController alloc] initWithPayLaterAccount:v12 context:0 primaryFinancingPlans:v10 secondaryFinancingPlans:0 tertiaryFinancingPlansCount:0 payLaterPass:0 businessChatTopic:0 paymentIntentController:v11 primaryFinancingPlansUpdateQuery:v9 secondaryFinancingPlansUpdateQuery:0];

  return v13;
}

+ (id)activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 completedFinancingPlansCount:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[PKPayLaterFinancingPlanListViewController alloc] initWithPayLaterAccount:v11 context:2 primaryFinancingPlans:v9 secondaryFinancingPlans:0 tertiaryFinancingPlansCount:a6 payLaterPass:0 businessChatTopic:0 paymentIntentController:v10 primaryFinancingPlansUpdateQuery:0 secondaryFinancingPlansUpdateQuery:0];

  return v12;
}

- (PKPayLaterFinancingPlanListViewController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 primaryFinancingPlansUpdateQuery:(id)a11 secondaryFinancingPlansUpdateQuery:(id)a12
{
  id v17 = a3;
  id v31 = a5;
  id v30 = a6;
  id v18 = a8;
  id v29 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v32.receiver = self;
  v32.super_class = (Class)PKPayLaterFinancingPlanListViewController;
  v22 = [(PKPayLaterViewController *)&v32 initWithPayLaterAccount:v17];
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v22->_accountService;
    v22->_accountService = (PKAccountService *)v23;

    objc_storeStrong((id *)&v22->_primaryFinancingPlansUpdateQuery, a11);
    objc_storeStrong((id *)&v22->_secondaryFinancingPlansUpdateQuery, a12);
    v25 = [[PKPayLaterFinancingPlanListSectionController alloc] initWithPayLaterAccount:v17 context:a4 primaryFinancingPlans:v31 secondaryFinancingPlans:v30 tertiaryFinancingPlansCount:a7 payLaterPass:v18 businessChatTopic:v29 paymentIntentController:v19 dynamicContentPage:0 delegate:v22];
    sectionController = v22->_sectionController;
    v22->_sectionController = v25;

    [(PKPayLaterSectionController *)v22->_sectionController setDynamicCollectionDelegate:v22];
    [(PKDynamicCollectionViewController *)v22 setUseItemIdentityWhenUpdating:1];
  }

  return v22;
}

- (void)viewDidLoad
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterFinancingPlanListViewController;
  [(PKPayLaterViewController *)&v8 viewDidLoad];
  v9[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];

  switch([(PKPayLaterFinancingPlanListSectionController *)self->_sectionController context])
  {
    case 0uLL:
    case 2uLL:
      v4 = [(PKPayLaterFinancingPlanListViewController *)self navigationItem];
      v5 = @"ALL_PURCHASES";
      goto LABEL_4;
    case 1uLL:
      v4 = [(PKPayLaterFinancingPlanListViewController *)self navigationItem];
      v5 = @"COMPLETED_INSTALLMENTS";
LABEL_4:
      v6 = PKLocalizedCocoonString(&v5->isa);
      [v4 setTitle:v6];

      goto LABEL_6;
    case 3uLL:
      v7 = PKLocalizedCocoonString(&cfstr_SelectOrderTit.isa);
      [(PKPaymentSetupOptionsViewController *)self setTitleText:v7];

      v4 = PKLocalizedCocoonString(&cfstr_SelectOrderDes.isa);
      [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];
LABEL_6:

      break;
    default:
      return;
  }
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  [(PKPayLaterSectionController *)self->_sectionController setPayLaterAccount:a3];

  [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];
}

- (void)_updatedFinancingPlan:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(PKPayLaterViewController *)self payLaterAccount];
  v6 = [v5 accountIdentifier];

  switch([(PKPayLaterFinancingPlanListSectionController *)self->_sectionController context])
  {
    case 0uLL:
      accountService = self->_accountService;
      primaryFinancingPlansUpdateQuery = self->_primaryFinancingPlansUpdateQuery;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_7;
      v17[3] = &unk_1E59CD720;
      objc_copyWeak(&v18, &location);
      [(PKAccountService *)accountService financingPlansWithQuery:primaryFinancingPlansUpdateQuery completion:v17];
      id v9 = &v18;
      goto LABEL_5;
    case 1uLL:
      v14 = self->_accountService;
      id v15 = self->_primaryFinancingPlansUpdateQuery;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke;
      v23[3] = &unk_1E59CD6D0;
      objc_copyWeak(&v24, &location);
      v23[4] = self;
      [(PKAccountService *)v14 financingPlansWithQuery:v15 completion:v23];
      id v9 = &v24;
LABEL_5:
      objc_destroyWeak(v9);
      break;
    case 2uLL:
      id v10 = (id)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:v6 queryItems:80];
      id v11 = [MEMORY[0x1E4F84998] completedFinancingPlanStates];
      [v10 setCountFinancingPlanStates:v11];

      id v12 = self->_accountService;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_5;
      v19[3] = &unk_1E59CD720;
      objc_copyWeak(&v20, &location);
      [(PKAccountService *)v12 financingPlansWithQuery:v10 completion:v19];
      v13 = &v20;
      goto LABEL_7;
    case 3uLL:
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v10 safelyAddObject:self->_primaryFinancingPlansUpdateQuery];
      [v10 safelyAddObject:self->_secondaryFinancingPlansUpdateQuery];
      id v16 = self->_accountService;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_3;
      v21[3] = &unk_1E59CD6F8;
      objc_copyWeak(&v22, &location);
      v21[4] = self;
      [(PKAccountService *)v16 financingPlansWithQueries:v10 completion:v21];
      v13 = &v22;
LABEL_7:
      objc_destroyWeak(v13);

      break;
    default:
      break;
  }

  objc_destroyWeak(&location);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      if (*(void *)(*(void *)(a1 + 40) + 1360))
      {
        uint64_t v4 = (void *)WeakRetained[167];
        v6 = WeakRetained;
        id v5 = [v3 completedFinancingPlans];
        [v4 setPrimaryFinancingPlans:v5];

        [v6 reloadDataAnimated:1];
        WeakRetained = v6;
      }
    }
  }
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_4;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && [*(id *)(a1 + 32) count])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 1360);
    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = [v3 queryIdentifier];
      v6 = [v4 objectForKey:v5];
      id v7 = [v6 relevantFinancingPlans];

      [WeakRetained[167] setPrimaryFinancingPlans:v7];
      uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1368);
      if (!v8) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v8 = *(void **)(v2 + 1368);
      if (!v8) {
        goto LABEL_9;
      }
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = [v8 queryIdentifier];
    id v11 = [v9 objectForKey:v10];
    id v12 = [v11 relevantFinancingPlans];

    [WeakRetained[167] setSecondaryFinancingPlans:v12];
LABEL_8:
    [WeakRetained reloadDataAnimated:1];
  }
LABEL_9:
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_6;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_6(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = WeakRetained[167];
      id v6 = WeakRetained;
      id v5 = [v3 activeFinancingPlans];
      [v4 setPrimaryFinancingPlans:v5];

      objc_msgSend(v6[167], "setTertiaryFinancingPlansCount:", objc_msgSend(*(id *)(a1 + 32), "financingPlanCount"));
      [v6 reloadDataAnimated:1];
      WeakRetained = v6;
    }
  }
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_8;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_8(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = (void *)WeakRetained[167];
      id v6 = WeakRetained;
      id v5 = [v3 relevantFinancingPlans];
      [v4 setPrimaryFinancingPlans:v5];

      [v6 reloadDataAnimated:1];
      WeakRetained = v6;
    }
  }
}

- (void)openBusinessChatForTopic:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  businessChatController = self->_businessChatController;
  if (businessChatController) {
    id v9 = businessChatController;
  }
  else {
    id v9 = objc_alloc_init(PKBusinessChatController);
  }
  id v10 = self->_businessChatController;
  self->_businessChatController = v9;

  objc_initWeak(&location, self);
  id v11 = [PKBusinessChatPayLaterContext alloc];
  id v12 = [(PKPayLaterViewController *)self payLaterAccount];
  v13 = [(PKPayLaterFinancingPlanListSectionController *)self->_sectionController payLaterPass];
  v14 = [(PKBusinessChatPayLaterContext *)v11 initWithPayLaterAccount:v12 paymentPass:v13 topic:v6 financingPlan:v7 installment:0 payment:0 dispute:0];

  id v15 = self->_businessChatController;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke;
  v16[3] = &unk_1E59CB240;
  objc_copyWeak(&v17, &location);
  [(PKBusinessChatController *)v15 openBusinessChatWithContext:v14 completion:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke_2(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFinancingPlansUpdateQuery, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlansUpdateQuery, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end