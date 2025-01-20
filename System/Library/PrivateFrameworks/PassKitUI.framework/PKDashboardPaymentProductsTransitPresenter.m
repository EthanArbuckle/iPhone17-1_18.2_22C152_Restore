@interface PKDashboardPaymentProductsTransitPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardPaymentProductsTransitPresenter)initWithPassGroupView:(id)a3 paymentDataProvider:(id)a4;
- (id)_actionHandlerForItem:(id)a3 indexPath:(id)a4;
- (id)_allocViewForTransitItem:(id)a3;
- (id)_identifierForItem:(id)a3;
- (id)_passForTransitItem:(id)a3 indexPath:(id)a4;
- (id)_renewActionForItem:(id)a3 commutePlanIdentifier:(id)a4;
- (id)_sampleViewForTransitItem:(id)a3;
- (id)_topUpActionForItem:(id)a3 indexPath:(id)a4 balanceIdentifier:(id)a5;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (id)displayableBalancesForTransitItem:(id)a3;
- (int64_t)_viewTypeForTransitItem:(id)a3;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)_configureView:(id *)a3 transitItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardPaymentProductsTransitPresenter

- (PKDashboardPaymentProductsTransitPresenter)initWithPassGroupView:(id)a3 paymentDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKDashboardPaymentProductsTransitPresenter;
  v9 = [(PKDashboardPaymentProductsTransitPresenter *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passGroupView, a3);
    v11 = [PKAdjustableSingleCellView alloc];
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = -[PKAdjustableSingleCellView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    sampleSingleCellView = v10->_sampleSingleCellView;
    v10->_sampleSingleCellView = (PKAdjustableSingleCellView *)v16;

    v18 = -[PKFusedDoubleCellView initWithFrame:]([PKFusedDoubleCellView alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleFusedCellView = v10->_sampleFusedCellView;
    v10->_sampleFusedCellView = v18;

    v20 = -[PKSimplePrimaryButtonCellView initWithFrame:]([PKSimplePrimaryButtonCellView alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleSingleCellButtonView = v10->_sampleSingleCellButtonView;
    v10->_sampleSingleCellButtonView = v20;

    objc_storeStrong((id *)&v10->_paymentDataProvider, a4);
  }

  return v10;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"paymentProductsTransitPresenterAdjustableVIew";
  v5[0] = objc_opt_class();
  v4[1] = @"paymentProductsTransitPresenterFusedView";
  v5[1] = objc_opt_class();
  v4[2] = @"paymentProductsTransitPresenterButtonView";
  v5[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)_identifierForItem:(id)a3
{
  unint64_t v3 = [(PKDashboardPaymentProductsTransitPresenter *)self _viewTypeForTransitItem:a3];
  if (v3 > 2) {
    return 0;
  }
  else {
    return off_1E59D3558[v3];
  }
}

- (int64_t)_viewTypeForTransitItem:(id)a3
{
  id v4 = a3;
  v5 = [(PKDashboardPaymentProductsTransitPresenter *)self displayableBalancesForTransitItem:v4];
  uint64_t v6 = [v5 count];
  unint64_t v7 = [v4 transitItemType];

  uint64_t v8 = 2;
  if (v7 != 4) {
    uint64_t v8 = 0;
  }
  if (v7 >= 3) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = v6 != 1;
  }

  return v9;
}

- (id)displayableBalancesForTransitItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 transitItemType];
  switch(v4)
  {
    case 2:
      v5 = [v3 transitBalanceModel];
      uint64_t v6 = [v5 displayablePointsBalances];
      goto LABEL_7;
    case 1:
      v5 = [v3 transitBalanceModel];
      uint64_t v6 = [v5 displayableCurrencyBalances];
      goto LABEL_7;
    case 0:
      v5 = [v3 transitBalanceModel];
      uint64_t v6 = [v5 displayableBalances];
LABEL_7:
      unint64_t v7 = (void *)v6;

      goto LABEL_9;
  }
  unint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKDashboardPaymentProductsTransitPresenter *)self _identifierForItem:v10];
  double v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  [(PKDashboardPaymentProductsTransitPresenter *)self _configureCell:v12 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v12;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  double v12 = [v11 hostedContentView];
  double v13 = v12;
  if (!v12
    || (uint64_t v14 = [v12 viewType],
        v14 != [(PKDashboardPaymentProductsTransitPresenter *)self _viewTypeForTransitItem:v9]))
  {
    id v15 = [(PKDashboardPaymentProductsTransitPresenter *)self _allocViewForTransitItem:v9];

    double v13 = v15;
  }
  id v17 = v13;
  [(PKDashboardPaymentProductsTransitPresenter *)self _configureView:&v17 transitItem:v9 indexPath:v10 animated:0];
  id v16 = v17;

  [v11 setHostedContentView:v16];
}

- (id)_renewActionForItem:(id)a3 commutePlanIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 transitBalanceModel];
  unint64_t v7 = [v6 displayableCommutePlanActions];
  id v8 = objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_83);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke_2;
  v12[3] = &unk_1E59D34F0;
  id v13 = v5;
  id v9 = v5;
  id v10 = objc_msgSend(v8, "pk_firstObjectPassingTest:", v12);

  return v10;
}

BOOL __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 2
    && [v2 isActionAvailable]
    && ([v2 unavailableActionBehavior] & 1) == 0;

  return v3;
}

BOOL __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 associatedPlanIdentifier];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
  if (v5 == v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if (v5 && v6) {
      BOOL v8 = [v5 caseInsensitiveCompare:v6] == 0;
    }
  }

  return v8;
}

- (id)_topUpActionForItem:(id)a3 indexPath:(id)a4 balanceIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  unint64_t v7 = [a3 pass];
  uint64_t v8 = [v7 activationState];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v7 availableActions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      if ([v14 type] == 6
        || ![v14 type]
        || [v14 type] == 1
        && ((unint64_t)(v8 - 1) < 2 || ([v14 unavailableActionBehavior] & 1) != 0))
      {
        break;
      }
      if ([v14 type] == 1
        && objc_msgSend(v6, "pk_hasObjectPassingTest:", &__block_literal_global_28))
      {
        goto LABEL_24;
      }
      if ([v14 featured])
      {
        id v15 = [v14 associatedEnteredValueIdentifier];

        if (!v15) {
          goto LABEL_24;
        }
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke_2;
      v20[3] = &unk_1E59CCAF0;
      v20[4] = v14;
      if (objc_msgSend(v6, "pk_hasObjectPassingTest:", v20))
      {
LABEL_24:
        id v18 = v14;
        goto LABEL_25;
      }
      if ([v14 type] == 1)
      {
        id v16 = [v14 relevantPropertyIdentifier];
        if (v16)
        {
        }
        else
        {
          id v17 = [v14 associatedEnteredValueIdentifier];

          if (!v17) {
            goto LABEL_24;
          }
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        id v18 = 0;
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_25;
      }
    }
  }
  id v18 = 0;
LABEL_25:

  return v18;
}

BOOL __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)*MEMORY[0x1E4F87980];
  id v4 = v2;
  id v5 = v4;
  if (v3 == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    if (v4 && v3) {
      BOOL v6 = [v3 caseInsensitiveCompare:v4] == 0;
    }
  }

  return v6;
}

BOOL __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) relevantPropertyIdentifier];
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
  if (v6 == v5)
  {
    BOOL v9 = 1;
    uint64_t v10 = v5;
LABEL_14:

    goto LABEL_15;
  }
  if (!v5 || !v6)
  {

    goto LABEL_8;
  }
  uint64_t v8 = [v5 caseInsensitiveCompare:v6];

  if (v8)
  {
LABEL_8:
    uint64_t v11 = [*(id *)(a1 + 32) associatedEnteredValueIdentifier];
    id v12 = v5;
    id v13 = v11;
    uint64_t v10 = v13;
    if (v13 == v12)
    {
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
      if (v5 && v13) {
        BOOL v9 = [v12 caseInsensitiveCompare:v13] == 0;
      }
    }

    goto LABEL_14;
  }
  BOOL v9 = 1;
LABEL_15:

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v12 = v11;
  id v13 = v8;
  [v10 bounds];
  double v15 = v14;

  id v16 = [(PKDashboardPaymentProductsTransitPresenter *)self _sampleViewForTransitItem:v13];
  id v24 = v16;
  [(PKDashboardPaymentProductsTransitPresenter *)self _configureView:&v24 transitItem:v13 indexPath:v9 animated:0];

  id v17 = v24;
  objc_msgSend(v17, "sizeThatFits:", v15 + v12 * -2.0, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    if (a4)
    {
      id v24 = v8;
      id v9 = a4;
      id v10 = [a3 preferredContentSizeCategory];
      double v11 = [v9 preferredContentSizeCategory];

      NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v10, v11);
      id v8 = v24;
      if (v12)
      {
        id v13 = [PKAdjustableSingleCellView alloc];
        double v14 = *MEMORY[0x1E4F1DB28];
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v18 = -[PKAdjustableSingleCellView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
        sampleSingleCellView = self->_sampleSingleCellView;
        self->_sampleSingleCellView = v18;

        double v20 = -[PKFusedDoubleCellView initWithFrame:]([PKFusedDoubleCellView alloc], "initWithFrame:", v14, v15, v16, v17);
        sampleFusedCellView = self->_sampleFusedCellView;
        self->_sampleFusedCellView = v20;

        double v22 = -[PKSimplePrimaryButtonCellView initWithFrame:]([PKSimplePrimaryButtonCellView alloc], "initWithFrame:", v14, v15, v16, v17);
        sampleSingleCellButtonView = self->_sampleSingleCellButtonView;
        self->_sampleSingleCellButtonView = v22;

        [v24 reloadData];
        id v8 = v24;
      }
    }
  }
}

- (id)_sampleViewForTransitItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDashboardPaymentProductsTransitPresenter *)self displayableBalancesForTransitItem:v4];
  id v6 = (id)[v5 count];
  unint64_t v7 = [v4 transitItemType];

  if (v7 >= 3)
  {
    if (v7 == 3)
    {
      uint64_t v8 = 24;
    }
    else
    {
      if (v7 != 4) {
        goto LABEL_10;
      }
      uint64_t v8 = 40;
    }
  }
  else
  {
    uint64_t v8 = 32;
    if (v6 == (id)1) {
      uint64_t v8 = 24;
    }
  }
  id v6 = *(id *)((char *)&self->super.isa + v8);
LABEL_10:

  return v6;
}

- (id)_allocViewForTransitItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDashboardPaymentProductsTransitPresenter *)self displayableBalancesForTransitItem:v4];
  id v6 = (void *)[v5 count];
  unint64_t v7 = [v4 transitItemType];

  uint64_t v8 = &off_1E59C2848;
  if (v7 < 3)
  {
    if (v6 != (void *)1) {
      uint64_t v8 = off_1E59C3608;
    }
    goto LABEL_8;
  }
  if (v7 == 3)
  {
LABEL_8:
    id v9 = objc_alloc(*v8);
    id v6 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    goto LABEL_9;
  }
  if (v7 == 4)
  {
    uint64_t v8 = off_1E59C5428;
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void)_configureView:(id *)a3 transitItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v67 = a6;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 transitBalanceModel];
  v68 = [v11 displayableCommutePlans];
  unint64_t v12 = [v68 count];
  id v13 = [(PKDashboardPaymentProductsTransitPresenter *)self displayableBalancesForTransitItem:v9];
  uint64_t v14 = [v13 count];
  unint64_t v15 = [v9 transitItemType];
  double v16 = [(PKDashboardPaymentProductsTransitPresenter *)self _passForTransitItem:v9 indexPath:v10];
  if (v15 < 3)
  {
    if (v14 == 2)
    {
      id v18 = *a3;
      [v18 beginUpdates];
      double v19 = [v13 objectAtIndexedSubscript:0];
      uint64_t v26 = [v19 localizedTitle];
      if (v26)
      {
        [v18 setLeftTitle:v26];
      }
      else
      {
        PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
        v39 = v38 = a3;
        [v18 setLeftTitle:v39];

        a3 = v38;
      }
      v65 = a3;

      v40 = [v19 formattedValue];
      [v18 setLeftDetail:v40];

      [v18 setLeftSubDetail:0];
      double v21 = [v13 objectAtIndexedSubscript:1];
      v41 = [v21 localizedTitle];
      if (v41)
      {
        [v18 setRightTitle:v41];
      }
      else
      {
        v49 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
        [v18 setRightTitle:v49];
      }
      v50 = [v21 formattedValue];
      [v18 setRightDetail:v50];

      [v18 setRightSubDetail:0];
      [v18 setPass:v16];
      [v18 setEnableDisclosure:1];
      [v18 endUpdates:v67];
    }
    else
    {
      id v63 = v10;
      uint64_t v17 = v14 - 1;
      if (v14 != 1)
      {
        id v18 = *a3;
        [v18 beginUpdates];
        double v19 = [v13 objectAtIndexedSubscript:0];
        v33 = [v19 localizedTitle];
        if (v33)
        {
          [v18 setLeftTitle:v33];
        }
        else
        {
          PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
          v52 = v51 = a3;
          [v18 setLeftTitle:v52];

          a3 = v51;
        }

        v53 = [v19 formattedValue];
        [v18 setLeftDetail:v53];

        [v18 setLeftSubDetail:0];
        v54 = PKLocalizedPaymentString(&cfstr_PropertySummar_0.isa);
        [v18 setRightTitle:v54];

        v55 = PKLocalizedPaymentString(&cfstr_PropertySummar_1.isa, &cfstr_Lu.isa, v17);
        [v18 setRightDetail:v55];

        [v18 setRightSubDetail:0];
        [v18 setPass:v16];
        [v18 setEnableDisclosure:1];
        [v18 endUpdates:v67];
        id v10 = v63;
        goto LABEL_44;
      }
      v65 = a3;
      id v18 = *a3;
      [v18 beginUpdates];
      [v18 setAction:0];
      [v18 setActionHandler:0];
      double v19 = [v13 objectAtIndexedSubscript:0];
      double v20 = [v19 identifiers];
      id v10 = v63;
      double v21 = [(PKDashboardPaymentProductsTransitPresenter *)self _topUpActionForItem:v9 indexPath:v63 balanceIdentifier:v20];

      uint64_t v22 = [(PKDashboardPaymentProductsTransitPresenter *)self _actionHandlerForItem:v9 indexPath:v63];
      double v23 = (void *)v22;
      if (v21 && v22 && [v21 isActionAvailable])
      {
        [v18 setAction:v21];
        [v18 setActionHandler:v23];
      }
      v61 = v23;
      [v18 setEnableDisclosure:0];
      id v24 = [v19 localizedTitle];
      if (v24)
      {
        [v18 setTitle:v24];
      }
      else
      {
        v34 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
        [v18 setTitle:v34];
      }
      v35 = [v19 formattedValue];
      [v18 setDetail:v35];

      if ([v16 isAutoTopUpBalance:v19]
        && [v16 isAutoTopEnabled])
      {
        v36 = PKLocalizedPaymentString(&cfstr_DashboardBalan.isa);
        [v18 setSubDetail:v36];
      }
      else
      {
        [v18 setSubDetail:0];
      }
      v37 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v18 setSubDetailColor:v37];

      [v18 setPass:v16];
      [v18 endUpdates:v67];
    }
    a3 = v65;
LABEL_44:

    [v18 setAccessibilityIdentifier:*MEMORY[0x1E4F852A8]];
    goto LABEL_49;
  }
  if (v15 == 3)
  {
    v66 = a3;
    id v27 = *a3;
    [v27 beginUpdates];
    [v27 setPass:v16];
    [v27 setAction:0];
    [v27 setActionHandler:0];
    [v27 setEnableDisclosure:v12 > 1];
    char v72 = 0;
    id v71 = 0;
    v69 = &stru_1EF1B5B50;
    id v70 = 0;
    v62 = v11;
    [v11 getDisplayableCommutePlanDetailsForTitle:&v71 value:&v70 subtitle:&v69 isExpired:&v72];
    id v28 = v71;
    id v29 = v70;
    v30 = v69;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    v59 = v16;
    PKCommutePlanFormatTitleFromLabelAndValue();
    id v31 = v28;

    id v32 = v29;
    v60 = v31;
    [v27 setTitle:v31];
    v58 = v32;
    [v27 setDetail:v32];
    v64 = v30;
    [v27 setSubDetail:v30];
    if (v72) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [v27 setSubDetailColor:v42];

    a3 = v66;
    double v11 = v62;
    double v16 = v59;
    if (v12 == 1)
    {
      v43 = [v68 firstObject];
      v44 = [v43 identifier];
      v45 = [(PKDashboardPaymentProductsTransitPresenter *)self _renewActionForItem:v9 commutePlanIdentifier:v44];

      uint64_t v46 = [(PKDashboardPaymentProductsTransitPresenter *)self _actionHandlerForItem:v9 indexPath:v10];
      v47 = (void *)v46;
      if (v45 && v46 && [v45 isActionAvailable])
      {
        BOOL v48 = [v59 isSuicaPass]
           && [v45 type] == 2
           && [v59 transitCommutePlanType] == 1;
        [v45 setReverseButtonTitleForLegacySuica:v48];
        [v27 setAction:v45];
        [v27 setActionHandler:v47];
      }

      a3 = v66;
    }
    [v27 endUpdates:v67];
    uint64_t v56 = *MEMORY[0x1E4F85858];
    id v18 = v27;
    [v18 setAccessibilityIdentifier:v56];
  }
  else if (v15 == 4)
  {
    id v18 = *a3;
    [v18 beginUpdates];
    [v18 setPass:v16];
    if (([v11 hasCommutePlanContent] & 1) == 0) {
      [v11 hasBalanceContent];
    }
    v25 = PKPassLocalizedStringWithFormat();
    objc_msgSend(v18, "setTitle:", v25, 0);

    [v18 endUpdates:v67];
  }
  else
  {
    id v18 = 0;
  }
LABEL_49:
  id v57 = v18;
  *a3 = v57;
}

- (id)_actionHandlerForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __78__PKDashboardPaymentProductsTransitPresenter__actionHandlerForItem_indexPath___block_invoke;
  uint64_t v14 = &unk_1E59D3538;
  objc_copyWeak(&v15, &location);
  uint64_t v8 = _Block_copy(&v11);
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __78__PKDashboardPaymentProductsTransitPresenter__actionHandlerForItem_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = [v5 pass];
    id v14 = 0;
    uint64_t v15 = 0;
    char v9 = [v8 canPerformAction:v6 unableReason:&v15 displayableError:&v14];
    id v10 = v14;
    if ((v9 & 1) != 0 || v15 == 2)
    {
      uint64_t v11 = [[PKPerformActionViewController alloc] initWithPass:v8 action:v6];
      uint64_t v12 = [[PKNavigationController alloc] initWithRootViewController:v11];
      id v13 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");

      [v13 presentViewController:v12 animated:1 completion:0];
      [(PKPerformActionViewController *)v11 setDelegate:WeakRetained];
    }
    else
    {
      uint64_t v11 = +[PKPerformActionViewController alertControllerForUnableReason:v15 action:v6 displayableError:v10 addCardActionHandler:0];
      objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
      uint64_t v12 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();

      [(PKNavigationController *)v12 presentViewController:v11 animated:1 completion:0];
    }
  }
}

- (id)_passForTransitItem:(id)a3 indexPath:(id)a4
{
  id v4 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v5 = [v4 pass];

  return v5;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [v11 hostedContentView];
  if (!v12) {
    id v12 = [(PKDashboardPaymentProductsTransitPresenter *)self _allocViewForTransitItem:v9];
  }
  id v14 = v12;
  [(PKDashboardPaymentProductsTransitPresenter *)self _configureView:&v14 transitItem:v9 indexPath:v10 animated:0];
  id v13 = v14;

  [v11 setHostedContentView:v13];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 transitItemType] == 4)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v8 cellForItemAtIndexPath:v9];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 hostedContentView];
      char v14 = [v13 enableDisclosure];
    }
    else
    {
      char v14 = 0;
    }
    uint64_t v15 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    double v16 = [v15 pass];

    if ([v16 activationState]) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v14;
    }
  }
  return v10;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  if ([v10 transitItemType] == 4)
  {
    id v11 = [PKPaymentPassCombinedActionDataController alloc];
    id v12 = [v10 pass];
    id v13 = [v10 actionGroups];
    paymentDataProvider = self->_paymentDataProvider;
    uint64_t v15 = [MEMORY[0x1E4F84D50] sharedService];
    double v16 = [v10 transitBalanceModel];

    uint64_t v17 = [(PKPaymentPassCombinedActionDataController *)v11 initWithPass:v12 actionGroups:v13 paymentDataProvider:paymentDataProvider webService:v15 balanceModel:v16 mode:0];
    combinedActionController = self->_combinedActionController;
    self->_combinedActionController = v17;

    double v19 = self->_combinedActionController;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __121__PKDashboardPaymentProductsTransitPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v24[3] = &unk_1E59D1070;
    id v25 = v9;
    [(PKPaymentPassCombinedActionDataController *)v19 fetchViewController:v24];
  }
  else
  {
    double v20 = [PKPassTransitProductsViewController alloc];
    double v21 = [v10 pass];
    uint64_t v22 = [v10 transitItemType];

    double v23 = [(PKPassTransitProductsViewController *)v20 initWithPaymentPass:v21 transitType:v22];
    objc_storeWeak((id *)&self->_productDetailsController, v23);
    [v9 pushViewController:v23 animated:1];
  }
}

void __121__PKDashboardPaymentProductsTransitPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) pushViewController:v6 animated:1];
  }
}

- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellButtonView, 0);
  objc_storeStrong((id *)&self->_sampleFusedCellView, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellView, 0);
  objc_destroyWeak((id *)&self->_productDetailsController);

  objc_storeStrong((id *)&self->_passGroupView, 0);
}

@end