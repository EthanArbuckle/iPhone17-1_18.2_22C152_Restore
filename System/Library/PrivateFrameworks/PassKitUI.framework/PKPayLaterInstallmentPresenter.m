@interface PKPayLaterInstallmentPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterInstallmentPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterInstallmentPresenter

- (PKPayLaterInstallmentPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterInstallmentPresenter;
  v2 = [(PKPayLaterInstallmentPresenter *)&v9 init];
  if (v2)
  {
    v3 = [PKPayLaterFinancingPlanInstallmentCell alloc];
    uint64_t v4 = -[PKDashboardCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPayLaterFinancingPlanInstallmentCell *)v4;

    v6 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v2->_iconGenerator;
    v2->_iconGenerator = v6;
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
  uint64_t v4 = @"kInstallmentCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"kInstallmentCellIdentifier" forIndexPath:v8];
  [(PKPayLaterInstallmentPresenter *)self _configureCell:v11 item:v10 collectionView:v9 indexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKPayLaterInstallmentPresenter *)self _configureCell:sampleCell item:a3 collectionView:v9 indexPath:a5];
  id v10 = self->_sampleCell;
  [v9 bounds];
  double v12 = v11;

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v14 = v12 + v13 * -2.0;

  -[PKPayLaterIconCell sizeThatFits:](v10, "sizeThatFits:", v14, 3.40282347e38);
  result.height = v16;
  result.width = v15;
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
    id v24 = v14;
    id v17 = v12;
    v18 = [v17 financingPlan];
    v19 = [v17 paymentIntentController];
    v20 = [PKPayLaterFinancingPlanViewController alloc];
    v21 = [v19 payLaterAccount];
    v22 = [(PKPayLaterFinancingPlanViewController *)v20 initWithFinancingPlan:v18 payLaterAccount:v21 paymentIntentController:v19 merchantIcon:0 iconGenerator:self->_iconGenerator];

    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __109__PKPayLaterInstallmentPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v25[3] = &unk_1E59CCC78;
    objc_copyWeak(&v28, &location);
    id v26 = v13;
    v23 = v22;
    v27 = v23;
    [(PKPayLaterFinancingPlanViewController *)v23 preflightWithCompletion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    id v14 = v24;
  }
}

void __109__PKPayLaterInstallmentPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
    uint64_t v4 = [v3 navigationController];
    [v4 pushViewController:*(void *)(a1 + 40) animated:1];

    id WeakRetained = v5;
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
        double v11 = [PKPayLaterFinancingPlanInstallmentCell alloc];
        id v12 = -[PKDashboardCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6
{
  id v20 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v9;
      id v13 = v20;
      id v14 = [v12 financingPlan];
      id v15 = [v12 relevantInstallment];
      id v16 = objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
      uint64_t v17 = [v11 row];
      v18 = [v12 paymentIntentController];

      [v13 setFinancingPlan:v14 installment:v15 rowIndex:v17 paymentIntentController:v18 presentingViewController:v16];
      v19 = [v15 dueDate];
      [v13 setIconDate:v19 animated:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGenerator, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end