@interface PKPayLaterFinancingPlanGroupPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterFinancingPlanGroupPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5;
- (void)_removeCachedFinancingPlans;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterFinancingPlanGroupPresenter

- (PKPayLaterFinancingPlanGroupPresenter)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingPlanGroupPresenter;
  v2 = [(PKPayLaterFinancingPlanGroupPresenter *)&v11 init];
  if (v2)
  {
    v3 = [PKDashboardTitleDetailCell alloc];
    uint64_t v4 = -[PKDashboardTitleDetailCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTitleDetailCell *)v4;

    v6 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v6;

    uint64_t v8 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v8;

    [(PKAccountService *)v2->_accountService registerObserver:v2];
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"kFinancingPlanGroupCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kFinancingPlanGroupCellIdentifier" forIndexPath:a5];
  [(PKPayLaterFinancingPlanGroupPresenter *)self _configureCell:v10 item:v9 collectionView:v8];

  return v10;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v8 = a4;
  [(PKPayLaterFinancingPlanGroupPresenter *)self _configureCell:sampleCell item:a3 collectionView:v8];
  id v9 = self->_sampleCell;
  [v8 bounds];
  double v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v13 = v11 + v12 * -2.0;

  -[PKDashboardTitleDetailCell sizeThatFits:](v9, "sizeThatFits:", v13, 3.40282347e38);
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v12;
    id v18 = objc_alloc(MEMORY[0x1E4F84280]);
    v19 = [v17 payLaterAccount];
    v20 = [v19 accountIdentifier];
    v21 = (void *)[v18 initWithAccountIdentifier:v20 queryItems:8];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    aBlock[3] = &unk_1E59CB8B0;
    id v22 = v17;
    id v32 = v22;
    v33 = self;
    id v23 = v21;
    id v34 = v23;
    id v35 = v13;
    v24 = _Block_copy(aBlock);
    v25 = v24;
    if (self->_completedFinancingPlans)
    {
      (*((void (**)(void *))v24 + 2))(v24);
    }
    else
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
      v27[3] = &unk_1E59D0498;
      objc_copyWeak(&v29, &location);
      id v28 = v25;
      [(PKAccountService *)accountService financingPlansWithQuery:v23 completion:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) payLaterAccount];
  v3 = [*(id *)(a1 + 32) paymentIntentController];
  id v6 = +[PKPayLaterFinancingPlanListViewController completedFinancingPlansListViewControllerWithPayLaterAccount:v2 paymentIntentController:v3 completedFinancingPlans:*(void *)(*(void *)(a1 + 40) + 32) completedFinancingPlansQuery:*(void *)(a1 + 48)];

  uint64_t v4 = objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
  v5 = [v4 navigationController];
  [v5 pushViewController:v6 animated:1];
}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) completedFinancingPlans];
    id v3 = (void *)WeakRetained[4];
    WeakRetained[4] = v2;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        double v11 = [PKDashboardTitleDetailCell alloc];
        id v12 = -[PKDashboardTitleDetailCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = v16;
      NSComparisonResult v10 = PKLocalizedCocoonString(&cfstr_CompletedLoans.isa);
      numberFormatter = self->_numberFormatter;
      id v12 = NSNumber;
      uint64_t v13 = [v8 financingPlansCount];

      id v14 = [v12 numberWithInteger:v13];
      id v15 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v14];

      [v9 setTitleText:v10 detail:v15];
      [v9 setAccessory:1];
    }
  }
}

- (void)_removeCachedFinancingPlans
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPayLaterFinancingPlanGroupPresenter__removeCachedFinancingPlans__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__PKPayLaterFinancingPlanGroupPresenter__removeCachedFinancingPlans__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedFinancingPlans, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end