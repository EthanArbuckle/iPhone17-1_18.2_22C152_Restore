@interface PKAccountPromotionsSectionController
- (BOOL)_updateImpressionCountForItem:(id)a3 shouldCountAsImpression:(BOOL)a4;
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKAccountPromotionsSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)_promotionsWithDefaultOrdering;
- (id)_promotionsWithOrderingContext:(unint64_t)a3;
- (id)itemsCopy;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)promotionForProgramIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_clearViewedPromotions;
- (void)_configureDataSource;
- (void)_reloadDataWithCompletion:(id)a3;
- (void)_updateImpressionCountsForAllItems:(id)a3 shouldCountAsImpression:(BOOL)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)dealloc;
- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setItems:(id)a3;
- (void)willDisplayItem:(id)a3;
@end

@implementation PKAccountPromotionsSectionController

- (PKAccountPromotionsSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKAccountPromotionsSectionController;
  v14 = [(PKAccountPromotionsSectionController *)&v32 init];
  if (v14)
  {
    v15 = @"PKRewardsHubSectionAccountPromotions";
    if (v10) {
      v15 = v10;
    }
    v33[0] = v15;
    v16 = (void *)MEMORY[0x1E4F1C978];
    v17 = v15;
    uint64_t v18 = [v16 arrayWithObjects:v33 count:1];
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v18;

    objc_storeStrong((id *)&v14->_account, a4);
    objc_storeStrong((id *)&v14->_accountService, a5);
    objc_storeWeak((id *)&v14->_delegate, v13);
    uint64_t v20 = [MEMORY[0x1E4F1C978] array];
    items = v14->_items;
    v14->_items = (NSArray *)v20;

    v14->_itemsLock._os_unfair_lock_opaque = 0;
    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    promotionsViewedSinceViewLoad = v14->_promotionsViewedSinceViewLoad;
    v14->_promotionsViewedSinceViewLoad = v22;

    v24 = (PKRemoteImagePreparer *)objc_alloc_init(MEMORY[0x1E4F84F18]);
    remoteImagePreparer = v14->_remoteImagePreparer;
    v14->_remoteImagePreparer = v24;

    v26 = [PKAccountPromotionsPresenter alloc];
    v27 = v14->_remoteImagePreparer;
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    uint64_t v29 = [(PKAccountPromotionsPresenter *)v26 initWithRemoteImagePreparer:v27 delegate:WeakRetained];
    presenter = v14->_presenter;
    v14->_presenter = (PKAccountPromotionsPresenter *)v29;

    [(PKAccountPromotionsSectionController *)v14 _configureDataSource];
    [(PKAccountService *)v14->_accountService registerObserver:v14];
  }
  return v14;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountPromotionsSectionController;
  [(PKAccountPromotionsSectionController *)&v3 dealloc];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKAccountPromotionsSectionController *)self _clearViewedPromotions];
  [(PKAccountPromotionsSectionController *)self _reloadDataWithCompletion:v4];
}

- (void)setItems:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_itemsLock);
  items = self->_items;
  self->_items = v4;

  os_unfair_lock_unlock(&self->_itemsLock);
}

- (id)itemsCopy
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = (void *)[(NSArray *)self->_items copy];
  os_unfair_lock_unlock(p_itemsLock);

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v6 = [(PKAccountPromotionsSectionController *)self _promotionsWithOrderingContext:100];
  if (!v6)
  {
    v6 = [(PKAccountPromotionsSectionController *)self _promotionsWithDefaultOrdering];
  }
  os_unfair_lock_lock(&self->_itemsLock);
  v7 = (void *)[(PKAccountPromotionBehavior *)self->_promotionBehavior copy];
  os_unfair_lock_unlock(&self->_itemsLock);
  v8 = [(PKAccountPromotionsSectionController *)self itemsCopy];
  [(PKAccountPromotionsSectionController *)self _updateImpressionCountsForAllItems:v8 shouldCountAsImpression:0];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeVisibleAfterCompleted];
  uint64_t v11 = v10;
  uint64_t v12 = [v7 maxImpressionCount];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PKAccountPromotionsSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke;
  v16[3] = &unk_1E59DE7B8;
  id v17 = v9;
  uint64_t v18 = v11;
  uint64_t v19 = v12;
  id v13 = v9;
  v14 = objc_msgSend(v6, "pk_objectsPassingTest:", v16);
  [v5 appendItems:v14];

  return v5;
}

BOOL __90__PKAccountPromotionsSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 state] > 4)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v4 = [v3 endDate];
    [*(id *)(a1 + 32) timeIntervalSinceDate:v4];
    BOOL v6 = v5 < *(double *)(a1 + 40);
  }
  BOOL v7 = [v3 impressionCount] < *(void *)(a1 + 48) && v6;

  return v7;
}

- (id)promotionForProgramIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    items = self->_items;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKAccountPromotionsSectionController_promotionForProgramIdentifier___block_invoke;
    v9[3] = &unk_1E59DE7E0;
    id v10 = v4;
    BOOL v7 = [(NSArray *)items pk_firstObjectPassingTest:v9];
    os_unfair_lock_unlock(p_itemsLock);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __70__PKAccountPromotionsSectionController_promotionForProgramIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 programIdentifier];
  id v4 = v2;
  id v5 = v3;
  BOOL v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (void)_configureDataSource
{
  uint64_t v3 = objc_opt_class();
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x1E4FB1578];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PKAccountPromotionsSectionController__configureDataSource__block_invoke;
  v7[3] = &unk_1E59DE808;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 registrationWithCellClass:v3 configurationHandler:v7];
  cellRegistration = self->_cellRegistration;
  self->_cellRegistration = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__PKAccountPromotionsSectionController__configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v5);
  [WeakRetained[5] configureCell:v7 withPromotion:v6];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", a3, a4, 1.0);
  id v4 = [MEMORY[0x1E4FB1308] estimatedDimension:500.0];
  uint64_t v18 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v19 heightDimension:v4];
  v16 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v18];
  id v17 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v5 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v17 heightDimension:v4];
  id v6 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v5 repeatingSubitem:v16 count:1];
  id v7 = [MEMORY[0x1E4FB1330] sectionWithGroup:v6];
  id v8 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v9 = [MEMORY[0x1E4FB1308] estimatedDimension:40.0];
  id v10 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v8 heightDimension:v9];
  uint64_t v11 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v10 elementKind:@"PKAccountPromotionsHeaderIdentifier" alignment:1];
  uint64_t v12 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v10 elementKind:@"PKAccountPromotionsFooterIdentifier" alignment:5];
  v20[0] = v11;
  v20[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v7 setBoundarySupplementaryItems:v13];

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v7, "setContentInsets:", 0.0, v14, 0.0, v14);
  [v7 setInterGroupSpacing:16.0];

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 != @"PKAccountPromotionsHeaderIdentifier")
  {
    if (v7)
    {
      char v9 = [(__CFString *)v7 isEqualToString:@"PKAccountPromotionsHeaderIdentifier"];

      if ((v9 & 1) == 0)
      {
        id v10 = v8;
        if (v10 != @"PKAccountPromotionsFooterIdentifier")
        {
          uint64_t v11 = v10;
          [(__CFString *)v10 isEqualToString:@"PKAccountPromotionsFooterIdentifier"];
        }
      }
    }
  }
  uint64_t v12 = objc_opt_class();

  return (Class)v12;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  char v9 = (__CFString *)v7;
  id v10 = v9;
  if (v9 == @"PKAccountPromotionsHeaderIdentifier") {
    goto LABEL_4;
  }
  if (!v9) {
    goto LABEL_6;
  }
  int v11 = [(__CFString *)v9 isEqualToString:@"PKAccountPromotionsHeaderIdentifier"];

  if (v11)
  {
LABEL_4:
    id v12 = v18;
    [v12 setUseLargeBottomInset:1];
    id v13 = PKLocalizedFeatureString();
    [v12 setTitle:v13];
LABEL_5:

    goto LABEL_6;
  }
  double v14 = v10;
  if (v14 == @"PKAccountPromotionsFooterIdentifier"
    || (v15 = v14,
        int v16 = [(__CFString *)v14 isEqualToString:@"PKAccountPromotionsFooterIdentifier"],
        v15,
        v16))
  {
    id v17 = v18;
    [v17 setBottomInsetType:2];
    [v17 setHorizontalAlignment:1];
    id v13 = PKLocalizedFeatureString();
    [v17 setFooterText:v13];
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)willDisplayItem:(id)a3
{
  id v8 = a3;
  if (-[PKAccountPromotionsSectionController _updateImpressionCountForItem:shouldCountAsImpression:](self, "_updateImpressionCountForItem:shouldCountAsImpression:"))
  {
    accountService = self->_accountService;
    uint64_t v5 = [v8 impressionCount];
    id v6 = [v8 programIdentifier];
    id v7 = [(PKAccount *)self->_account accountIdentifier];
    [(PKAccountService *)accountService updateImpressionCount:v5 promotionProgramIdentifier:v6 accountIdentifier:v7 completion:0];
  }
}

- (void)_updateImpressionCountsForAllItems:(id)a3 shouldCountAsImpression:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= [(PKAccountPromotionsSectionController *)self _updateImpressionCountForItem:*(void *)(*((void *)&v14 + 1) + 8 * i) shouldCountAsImpression:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
    if (v9)
    {
      accountService = self->_accountService;
      id v13 = [(PKAccount *)self->_account accountIdentifier];
      [(PKAccountService *)accountService updateImpressionCountsForPromotions:v6 accountIdentifier:v13 completion:0];
    }
  }
}

- (BOOL)_updateImpressionCountForItem:(id)a3 shouldCountAsImpression:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 isInTerminalState])
  {
    if ([v6 impressionCount] >= 1)
    {
      [v6 resetImpressionCount];
      char v11 = 1;
      goto LABEL_12;
    }
LABEL_11:
    char v11 = 0;
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v7 = [v6 impressionCount];
  uint64_t v8 = [v6 programIdentifier];
  os_unfair_lock_lock(&self->_itemsLock);
  char v9 = [(NSMutableSet *)self->_promotionsViewedSinceViewLoad containsObject:v8];
  [(NSMutableSet *)self->_promotionsViewedSinceViewLoad addObject:v8];
  os_unfair_lock_unlock(&self->_itemsLock);
  if (v7) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  if ((v10 & 1) == 0) {
    [v6 incrementImpressionCount];
  }
  char v11 = v10 ^ 1;

LABEL_12:
  return v11;
}

- (id)_promotionsWithOrderingContext:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = [(PKAccountPromotionsSectionController *)self itemsCopy];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    orderings = self->_orderings;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke;
    v26[3] = &__block_descriptor_40_e33_B16__0__PKAccountEntityOrdering_8l;
    v26[4] = a3;
    char v9 = [(NSArray *)orderings pk_firstObjectPassingTest:v26];
    char v10 = (void *)[v9 copy];
    os_unfair_lock_unlock(p_itemsLock);
    if (v10)
    {
      uint64_t v20 = v10;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      char v11 = [v10 ordering];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke_2;
            v21[3] = &unk_1E59DE7E0;
            v21[4] = v16;
            long long v17 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v21);
            [v6 safelyAddObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      id v18 = (void *)[v6 copy];
      char v10 = v20;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

BOOL __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 context];
}

uint64_t __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 programIdentifier];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (id)_promotionsWithDefaultOrdering
{
  uint64_t v2 = [(PKAccountPromotionsSectionController *)self itemsCopy];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_218];

  return v3;
}

uint64_t __70__PKAccountPromotionsSectionController__promotionsWithDefaultOrdering__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 startDate];
  BOOL v7 = [v5 startDate];
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [v7 compare:v6];
      if (!v9)
      {
        char v10 = [v5 programIdentifier];
        char v11 = [v4 programIdentifier];
        uint64_t v9 = [v10 compare:v11];
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)_clearViewedPromotions
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  [(NSMutableSet *)self->_promotionsViewedSinceViewLoad removeAllObjects];

  os_unfair_lock_unlock(p_itemsLock);
}

- (void)_reloadDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  id v6 = [(PKAccount *)self->_account accountIdentifier];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke;
  v21[3] = &unk_1E59CD438;
  v21[4] = self;
  id v7 = v6;
  id v22 = v7;
  objc_copyWeak(&v23, &location);
  [v5 addOperation:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_3;
  v18[3] = &unk_1E59CD438;
  v18[4] = self;
  id v8 = v7;
  id v19 = v8;
  objc_copyWeak(&v20, &location);
  [v5 addOperation:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_5;
  v15[3] = &unk_1E59CD438;
  v15[4] = self;
  id v9 = v8;
  id v16 = v9;
  objc_copyWeak(&v17, &location);
  [v5 addOperation:v15];
  char v10 = [MEMORY[0x1E4F1CA98] null];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_7;
  v13[3] = &unk_1E59CEC00;
  id v11 = v4;
  id v14 = v11;
  id v12 = (id)[v5 evaluateWithInput:v10 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_2;
  v14[3] = &unk_1E59D9A58;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v11 accountPromotionsForAccountWithIdentifier:v10 completion:v14];

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setItems:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_4;
  v14[3] = &unk_1E59DE870;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v11 accountPromotionBehaviorForAccountWithIdentifier:v10 completion:v14];

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    objc_storeStrong((id *)&v5[12], a2);
    os_unfair_lock_unlock(v5 + 20);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_6;
  v14[3] = &unk_1E59D9A58;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v11 accountEntityOrderingsForAccountWithIdentifier:v10 entityType:2 completion:v14];

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    objc_storeStrong((id *)&v5[14], a2);
    os_unfair_lock_unlock(v5 + 20);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  [a4 isCanceled];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKAccount *)self->_account accountIdentifier];
  id v9 = v7;
  id v10 = v8;
  if (v10 == v9)
  {
  }
  else
  {
    id v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_11;
    }
    int v12 = [v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_11;
    }
  }
  [(PKAccountPromotionsSectionController *)self setItems:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PKAccountPromotionsSectionController_didUpdateAccountPromotions_accountIdentifier___block_invoke;
    block[3] = &unk_1E59CA7D0;
    id v15 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_11:
}

uint64_t __85__PKAccountPromotionsSectionController_didUpdateAccountPromotions_accountIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataForSectionIdentifier:@"PKRewardsHubSectionAccountPromotions" animated:1];
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_remoteImagePreparer, 0);
  objc_storeStrong((id *)&self->_promotionsViewedSinceViewLoad, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_promotionBehavior, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end