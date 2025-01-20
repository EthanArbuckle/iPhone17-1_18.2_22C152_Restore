@interface PKPayLaterFinancingPlanPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterFinancingPlanPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterFinancingPlanPresenter

- (PKPayLaterFinancingPlanPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanPresenter;
  v2 = [(PKPayLaterFinancingPlanPresenter *)&v9 init];
  if (v2)
  {
    v3 = [PKPayLaterFinancingPlanCell alloc];
    uint64_t v4 = -[PKDashboardCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPayLaterFinancingPlanCell *)v4;

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
  uint64_t v4 = @"kFinancingPlanCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"kFinancingPlanCellIdentifier" forIndexPath:v8];
  [(PKPayLaterFinancingPlanPresenter *)self _configureCell:v11 item:v10 collectionView:v9 indexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKPayLaterFinancingPlanPresenter *)self _configureCell:sampleCell item:a3 collectionView:v9 indexPath:a5];
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
    v19 = [PKPayLaterFinancingPlanViewController alloc];
    v20 = [v17 payLaterAccount];
    v21 = [v17 paymentIntentController];
    v22 = [(PKPayLaterFinancingPlanViewController *)v19 initWithFinancingPlan:v18 payLaterAccount:v20 paymentIntentController:v21 merchantIcon:0 iconGenerator:self->_iconGenerator];

    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __111__PKPayLaterFinancingPlanPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
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

void __111__PKPayLaterFinancingPlanPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
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
        double v11 = [PKPayLaterFinancingPlanCell alloc];
        id v12 = -[PKDashboardCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      id v24 = v11;
      id v15 = [v24 financingPlan];
      objc_msgSend(v14, "setFinancingPlan:context:rowIndex:", v15, 0, objc_msgSend(v13, "row"));
      objc_initWeak(&location, self);
      iconGenerator = self->_iconGenerator;
      id v17 = [v15 merchant];
      double v18 = PKPayLaterUICellIconSize();
      double v20 = v19;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke;
      v25[3] = &unk_1E59D5E10;
      objc_copyWeak(&v30, &location);
      id v26 = v14;
      id v21 = v15;
      id v27 = v21;
      id v28 = v12;
      id v22 = v26;
      id v29 = v22;
      v23 = -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v25, v18, v20);

      [v22 setIcon:v23 animated:0];
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
}

void __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke_2;
  v5[3] = &unk_1E59DB9B0;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v11, a1 + 8);
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v11);
}

void __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    id v3 = [*(id *)(a1 + 40) financingPlan];
    id v4 = [v3 planIdentifier];
    id v5 = [*(id *)(a1 + 48) planIdentifier];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_12;
      }
      char v9 = [v6 isEqualToString:v7];

      id WeakRetained = v13;
      if ((v9 & 1) == 0) {
        goto LABEL_13;
      }
    }
    id v10 = [*(id *)(a1 + 56) indexPathsForVisibleItems];
    id v11 = [*(id *)(a1 + 56) indexPathForCell:*(void *)(a1 + 64)];
    uint64_t v12 = [v10 containsObject:v11];

    [*(id *)(a1 + 40) setIcon:*(void *)(a1 + 32) animated:v12];
LABEL_12:
    id WeakRetained = v13;
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGenerator, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end