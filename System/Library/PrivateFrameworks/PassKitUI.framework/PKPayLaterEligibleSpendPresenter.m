@interface PKPayLaterEligibleSpendPresenter
- (BOOL)_payLaterAccountHasEligibleSpend:(id)a3;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterEligibleSpendPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5;
- (void)_updateAccessoryForCell:(id)a3 eligibleSpendItem:(id)a4;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterEligibleSpendPresenter

- (PKPayLaterEligibleSpendPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterEligibleSpendPresenter;
  v2 = [(PKPayLaterEligibleSpendPresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKDashboardTitleDetailCell alloc];
    uint64_t v4 = -[PKDashboardTitleDetailCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTitleDetailCell *)v4;
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
  uint64_t v4 = @"kPayLaterEligibleSpendCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kPayLaterEligibleSpendCellIdentifier" forIndexPath:a5];
  [(PKPayLaterEligibleSpendPresenter *)self _configureCell:v10 item:v9 collectionView:v8];

  return v10;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v8 = a4;
  [(PKPayLaterEligibleSpendPresenter *)self _configureCell:sampleCell item:a3 collectionView:v8];
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
  v17 = [v13 cellForItemAtIndexPath:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_loadingContent)
    {
      id v18 = v12;
      if ([(PKPayLaterEligibleSpendPresenter *)self _payLaterAccountHasEligibleSpend:v18])
      {
        id v19 = v18;
        v20 = [PKPayLaterEligibleSpendViewController alloc];
        v21 = [v19 payLaterAccount];

        v22 = [(PKPayLaterEligibleSpendViewController *)v20 initWithPayLaterAccount:v21];
        v23 = objc_msgSend(v13, "pkui_viewControllerFromResponderChain");
        v24 = [v23 navigationController];
        [v24 pushViewController:v22 animated:1];
      }
      else
      {
        self->_loadingContent = 1;
        [(PKPayLaterEligibleSpendPresenter *)self _updateAccessoryForCell:v17 eligibleSpendItem:v18];
        v25 = [v18 payLaterAccount];
        v26 = +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:v25 controllerContext:3 referrerIdentifier:0];
        payLaterSetupFlowController = self->_payLaterSetupFlowController;
        self->_payLaterSetupFlowController = v26;

        objc_initWeak(&location, self);
        v28 = self->_payLaterSetupFlowController;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
        v29[3] = &unk_1E59CB668;
        objc_copyWeak(&v33, &location);
        v29[4] = self;
        id v30 = v17;
        id v31 = v18;
        id v32 = v13;
        [(PKPayLaterSetupFlowController *)v28 fetchPayLaterDynamicContentWithCompletion:v29];

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
  block[3] = &unk_1E59CB640;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v7 = *(id *)(a1 + 48);
  char v15 = a2;
  id v11 = v7;
  id v12 = v5;
  id v13 = *(id *)(a1 + 56);
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
    id v12 = &unk_1E59CB378;
    objc_copyWeak(&v15, &location);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    v3 = (void (**)(void))_Block_copy(&v9);
    if (!*(unsigned char *)(a1 + 80) || *(void *)(a1 + 56))
    {
      v6 = PKDisplayableErrorForCommonType();
      uint64_t v4 = PKAccountDisplayableError();

      id v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      if (v7)
      {
        id v5 = v7;
        id v8 = objc_msgSend(*(id *)(a1 + 64), "pkui_viewControllerFromResponderChain", v9, v10, v11, v12, v13);
        [v8 presentViewController:v5 animated:1 completion:v3];
      }
      else
      {
        v3[2](v3);
        id v5 = 0;
      }
    }
    else
    {
      uint64_t v4 = objc_msgSend(WeakRetained[2], "firstViewController", v9, v10, v11, v12, v13);
      id v5 = objc_msgSend(*(id *)(a1 + 64), "pkui_viewControllerFromResponderChain");
      [v5 presentViewController:v4 animated:1 completion:v3];
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[24] = 0;
    v3 = WeakRetained;
    [WeakRetained _updateAccessoryForCell:*(void *)(a1 + 32) eligibleSpendItem:*(void *)(a1 + 40)];
    WeakRetained = v3;
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
      uint64_t v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        id v11 = [PKDashboardTitleDetailCell alloc];
        id v12 = -[PKDashboardTitleDetailCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = v19;
      NSComparisonResult v10 = [v8 payLaterAccount];
      id v11 = [v10 payLaterDetails];

      id v12 = [v11 maximumEligibleSpendAmount];
      BOOL v13 = [(PKPayLaterEligibleSpendPresenter *)self _payLaterAccountHasEligibleSpend:v8];
      id v14 = [MEMORY[0x1E4FB1618] labelColor];
      if (v13)
      {
        id v15 = PKLocalizedCocoonString(&cfstr_AvailableToSpe.isa);
        id v16 = [v12 formattedStringValue];
      }
      else
      {
        id v15 = PKLocalizedCocoonString(&cfstr_NewPurchaseBut.isa);
        uint64_t v17 = [MEMORY[0x1E4FB1618] linkColor];

        id v16 = 0;
        id v14 = (void *)v17;
      }
      [v9 setTitleText:v15 detail:v16];
      [v9 setTitleTextColor:v14];
      id v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v9 setDetailTextColor:v18];

      [(PKPayLaterEligibleSpendPresenter *)self _updateAccessoryForCell:v9 eligibleSpendItem:v8];
    }
  }
}

- (void)_updateAccessoryForCell:(id)a3 eligibleSpendItem:(id)a4
{
  id v6 = a3;
  id v8 = v6;
  if (self->_loadingContent)
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = [(PKPayLaterEligibleSpendPresenter *)self _payLaterAccountHasEligibleSpend:a4];
    id v6 = v8;
  }
  [v6 setAccessory:v7];
}

- (BOOL)_payLaterAccountHasEligibleSpend:(id)a3
{
  v3 = [a3 payLaterAccount];
  uint64_t v4 = [v3 payLaterDetails];
  char v5 = [v4 hasEligibleSpend];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end