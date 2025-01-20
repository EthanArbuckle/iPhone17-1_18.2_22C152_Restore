@interface PKRewardsHubSummarySectionController
- (BOOL)_hasFooterForSection:(id)a3;
- (BOOL)_hasHeaderForSection:(id)a3;
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (NSArray)items;
- (PKRewardsHubSummarySectionController)initWithSectionIdentifiers:(id)a3 rewardsFetcher:(id)a4 paymentDataProvider:(id)a5 showRewardsGraph:(BOOL)a6 delegate:(id)a7;
- (id)_cellPresenterIdentifierForItem:(id)a3;
- (id)_collectionView;
- (id)_createPresenterForSection:(id)a3;
- (id)_itemsForSection:(id)a3;
- (id)_presenterForSection:(id)a3;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureFooterView:(id)a3 inSection:(id)a4;
- (void)_configureHeaderView:(id)a3 inSection:(id)a4;
- (void)_reloadData;
- (void)_reloadDataAndUpdateDelegate;
- (void)_reloadDataWithCompletion:(id)a3;
- (void)_setCornerMaskForCell:(id)a3 indexPath:(id)a4 section:(id)a5;
- (void)_setItems:(id)a3 forSection:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)dealloc;
- (void)setIdentifiers:(id)a3;
- (void)setItems:(id)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
@end

@implementation PKRewardsHubSummarySectionController

- (PKRewardsHubSummarySectionController)initWithSectionIdentifiers:(id)a3 rewardsFetcher:(id)a4 paymentDataProvider:(id)a5 showRewardsGraph:(BOOL)a6 delegate:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)PKRewardsHubSummarySectionController;
  v17 = [(PKRewardsHubSummarySectionController *)&v38 init];
  v18 = v17;
  if (v17)
  {
    id v33 = v14;
    objc_storeStrong((id *)&v17->_identifiers, a3);
    v18->_showRewardsGraph = a6;
    objc_storeStrong((id *)&v18->_rewardsFetcher, a4);
    v18->_summaryFetchLock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingCompletionHandlers = v18->_pendingCompletionHandlers;
    v18->_pendingCompletionHandlers = v19;

    objc_storeStrong((id *)&v18->_paymentDataProvider, a5);
    [(PKPaymentDataProvider *)v18->_paymentDataProvider addDelegate:v18];
    objc_storeWeak((id *)&v18->_delegate, v16);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    sectionIDToPresenterMap = v18->_sectionIDToPresenterMap;
    v18->_sectionIDToPresenterMap = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    sectionIDToItemsMap = v18->_sectionIDToItemsMap;
    v18->_sectionIDToItemsMap = (NSMutableDictionary *)v23;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v31 = [(PKRewardsHubSummarySectionController *)v18 _createPresenterForSection:v30];
          [(NSMutableDictionary *)v18->_sectionIDToPresenterMap setObject:v31 forKey:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v27);
    }

    id v14 = v33;
  }

  return v18;
}

- (void)dealloc
{
  [(PKPaymentDataProvider *)self->_paymentDataProvider removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKRewardsHubSummarySectionController;
  [(PKRewardsHubSummarySectionController *)&v3 dealloc];
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(NSMutableDictionary *)self->_sectionIDToPresenterMap allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 traitCollectionDidChangeFromTrait:v8 toTrait:v9 inCollectionView:v10];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_showRewardsGraph)
  {
LABEL_10:
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1358]);
    uint64_t v15 = [(PKRewardsHubSummarySectionController *)self _itemsForSection:v8];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C978] array];
    }
    long long v18 = v17;

    [v13 appendItems:v18];
    goto LABEL_14;
  }
  id v9 = (__CFString *)v7;
  id v10 = @"PKRewardsHubSectionLifetimeSummary";
  if (v10 == v9)
  {

    goto LABEL_8;
  }
  v11 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_10;
  }
  int v12 = [(__CFString *)v9 isEqualToString:v10];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_8:
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v20[0] = self->_lifetimeSummary;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v13 appendItems:v14];

LABEL_14:

  return v13;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  if (self->_showRewardsGraph)
  {
    v5 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_172];
  }
  else
  {
    id v6 = objc_opt_class();
    id v7 = [(PKRewardsHubSummarySectionController *)self _sectionIdentifierForItem:v4];
    id v8 = [(PKRewardsHubSummarySectionController *)self _presenterForSection:v7];
    if (v8)
    {
      id v9 = [(PKRewardsHubSummarySectionController *)self _cellPresenterIdentifierForItem:v4];
      id v10 = [v8 collectionViewCellClasses];
      uint64_t v11 = [v10 objectForKey:v9];

      if (v6 && [v6 isSubclassOfClass:objc_opt_class()]) {
        id v6 = (void *)v11;
      }
    }
    int v12 = [(PKRewardsHubSummarySectionController *)self _collectionView];
    objc_initWeak(&location, self);
    id v13 = (void *)MEMORY[0x1E4FB1578];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke_2;
    v18[3] = &unk_1E59DAAF8;
    objc_copyWeak(&v22, &location);
    id v14 = v8;
    id v19 = v14;
    id v15 = v12;
    id v20 = v15;
    id v16 = v7;
    id v21 = v16;
    v5 = [v13 registrationWithCellClass:v6 configurationHandler:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  [v6 performSelector:NSSelectorFromString(&cfstr_Configurewithr.isa) withObject:v5];
}

void __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v8 wrappedItem];

  [v10 updateCell:v12 forItem:v11 inCollectionView:*(void *)(a1 + 40) atIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained _setCornerMaskForCell:v12 indexPath:v7 section:*(void *)(a1 + 48)];
  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB1558];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithAppearance:2];
  LODWORD(v6) = [(PKRewardsHubSummarySectionController *)self _hasHeaderForSection:v7];
  LODWORD(self) = [(PKRewardsHubSummarySectionController *)self _hasFooterForSection:v7];

  [v9 setHeaderMode:v6];
  [v9 setFooterMode:self];
  id v10 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v9 layoutEnvironment:v8];

  [v9 setHeaderTopPadding:0.0];
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  if (self) {
    double v12 = 0.0;
  }
  else {
    double v12 = 16.0;
  }
  objc_msgSend(v10, "setContentInsets:", 0.0, v11, v12, v11);

  return v10;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x1E4FB2770];
  id v8 = v5;
  id v9 = v7;
  if (v9 == v8)
  {
  }
  else
  {
    id v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    char v11 = [v8 isEqualToString:v9];

    if ((v11 & 1) == 0)
    {
LABEL_9:
      double v12 = (void *)*MEMORY[0x1E4FB2760];
      id v13 = v8;
      id v14 = v12;
      if (v14 == v13)
      {
      }
      else
      {
        id v15 = v14;
        if (v8 && v14)
        {
          [v13 isEqualToString:v14];
        }
        else
        {
        }
      }
    }
  }
  id v16 = objc_opt_class();

  return (Class)v16;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)*MEMORY[0x1E4FB2770];
  char v11 = (__CFString *)v8;
  double v12 = v10;
  if (v12 == v11)
  {
  }
  else
  {
    id v13 = v12;
    if (!v11 || !v12)
    {
      id v15 = v11;
      goto LABEL_13;
    }
    int v14 = [(__CFString *)v11 isEqualToString:v12];

    if (!v14)
    {
LABEL_14:
      if (self->_showRewardsGraph)
      {
        long long v18 = (__CFString *)v9;
        id v19 = @"PKRewardsHubSectionLifetimeSummary";
        id v20 = v19;
        if (v19 == v18)
        {
          int v21 = 1;
        }
        else
        {
          int v21 = 0;
          if (v18 && v19) {
            int v21 = [(__CFString *)v18 isEqualToString:v19];
          }
        }
      }
      else
      {
        int v21 = 0;
      }
      id v22 = (__CFString *)v9;
      uint64_t v23 = @"PKRewardsHubSectionDateRangeSummary";
      if (v23 == v22)
      {
      }
      else
      {
        v24 = v23;
        int v25 = 0;
        if (v22 && v23) {
          int v25 = [(__CFString *)v22 isEqualToString:v23];
        }

        if ((v21 | v25) != 1) {
          goto LABEL_33;
        }
      }
      [(PKRewardsHubSummarySectionController *)self _configureFooterView:v26 inSection:v22];
      goto LABEL_33;
    }
  }
  id v15 = (__CFString *)v9;
  id v16 = @"PKRewardsHubSectionLifetimeSummary";
  if (v16 == v15)
  {

    goto LABEL_21;
  }
  id v13 = v16;
  if (!v15 || !v16)
  {
LABEL_13:

    goto LABEL_14;
  }
  int v17 = [(__CFString *)v15 isEqualToString:v16];

  if (!v17) {
    goto LABEL_14;
  }
LABEL_21:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKRewardsHubSummarySectionController *)self _configureHeaderView:v26 inSection:v15];
  }
LABEL_33:
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 transactionType];
  uint64_t v9 = [v7 transactionStatus];
  if (!v8 && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v10 = [v7 rewardsTotalAmount];
    char v11 = v10;
    if (v10
      && (objc_msgSend(v10, "pk_isZeroNumber") & 1) == 0
      && [(PKRewardsSummaryFetcher *)self->_rewardsFetcher isTransactionSourceIdentifierRelevant:v6])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__PKRewardsHubSummarySectionController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
      block[3] = &unk_1E59CA7D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __90__PKRewardsHubSummarySectionController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDataAndUpdateDelegate];
}

- (BOOL)_hasHeaderForSection:(id)a3
{
  return 0;
}

- (void)_configureHeaderView:(id)a3 inSection:(id)a4
{
  id v4 = a3;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v4, "setHorizontalInset:");
  [v4 setUseCompactTopInset:0];
}

- (BOOL)_hasFooterForSection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = @"PKRewardsHubSectionLifetimeSummary";
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  id v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  int v7 = [(__CFString *)v4 isEqualToString:v5];

  if (v7)
  {
LABEL_7:
    BOOL showRewardsGraph = self->_showRewardsGraph;
    goto LABEL_20;
  }
LABEL_9:
  uint64_t v9 = v4;
  id v10 = @"PKRewardsHubSectionDateRangeSummary";
  if (v10 == v9)
  {

    goto LABEL_15;
  }
  char v11 = v10;
  if (v4 && v10)
  {
    char v12 = [(__CFString *)v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_15:
    BOOL showRewardsGraph = 1;
    goto LABEL_20;
  }

LABEL_17:
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v9;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier in rewards hub: %@", (uint8_t *)&v15, 0xCu);
  }

  BOOL showRewardsGraph = 0;
LABEL_20:

  return showRewardsGraph;
}

- (void)_configureFooterView:(id)a3 inSection:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v6, "setHorizontalInset:");
  uint64_t v8 = (__CFString *)v7;
  uint64_t v9 = @"PKRewardsHubSectionDateRangeSummary";
  if (v9 == v8)
  {
LABEL_13:

LABEL_14:
    id v16 = PKLocalizedFeatureString();
    uint64_t v17 = PKLocalizedFeatureString();
    objc_msgSend(v6, "setBottomInsetType:", 2, v16);
    [v6 setFooterText:v17];
    long long v18 = [MEMORY[0x1E4FB1618] linkColor];
    [v6 setLinkTextColor:v18];

    objc_initWeak(&location, self);
    id v19 = [PKTextRangeHyperlink alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__PKRewardsHubSummarySectionController__configureFooterView_inSection___block_invoke;
    v22[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v23, &location);
    id v20 = [(PKTextRangeHyperlink *)v19 initWithLinkText:v16 action:v22];
    v25[0] = v20;
    int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v6 setSources:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  id v10 = v9;
  if (v8 && v9)
  {
    char v11 = [(__CFString *)v8 isEqualToString:v9];

    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (self->_showRewardsGraph)
  {
    char v12 = v8;
    id v13 = @"PKRewardsHubSectionLifetimeSummary";
    if (v13 != v12)
    {
      int v14 = v13;
      if (!v8 || !v13)
      {

        goto LABEL_15;
      }
      char v15 = [(__CFString *)v12 isEqualToString:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_15:
}

void __71__PKRewardsHubSummarySectionController__configureFooterView_inSection___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    if (v3)
    {
      uint64_t v4 = *MEMORY[0x1E4F86380];
      uint64_t v5 = *MEMORY[0x1E4F86120];
      v8[0] = *MEMORY[0x1E4F86308];
      v8[1] = v5;
      uint64_t v6 = *MEMORY[0x1E4F86530];
      v9[0] = v4;
      v9[1] = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
      [v3 reportEventIfNecessary:v7];

      [v3 presentEducationViewController];
    }
  }
}

- (void)_setCornerMaskForCell:(id)a3 indexPath:(id)a4 section:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 row];
  if (self->_showRewardsGraph)
  {
    BOOL v10 = 0;
    uint64_t v11 = 3;
  }
  else
  {
    uint64_t v12 = v9;
    BOOL v13 = v9 != 0;
    int v14 = [(PKRewardsHubSummarySectionController *)self _itemsForSection:v8];
    uint64_t v15 = [v14 count];
    BOOL v10 = v12 != v15 - 1;
    int v16 = v12 != v15 - 1 || v13;
    BOOL v17 = v16 == 0;
    uint64_t v18 = 3;
    if (!v17) {
      uint64_t v18 = 1;
    }
    if (v12) {
      uint64_t v11 = 2 * (v12 == v15 - 1);
    }
    else {
      uint64_t v11 = v18;
    }
  }
  [v22 setMaskType:v11];
  [v22 setShowsBottomSeparator:v10];
  id v19 = [v22 traitCollection];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int v21 = [v22 layer];
    [v21 setCornerRadius:4.0];
  }
}

- (id)_createPresenterForSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  uint64_t v4 = @"PKRewardsHubSectionLifetimeSummary";
  if (v4 == v3)
  {

    goto LABEL_7;
  }
  uint64_t v5 = v4;
  if (!v3 || !v4)
  {

    goto LABEL_9;
  }
  int v6 = [(__CFString *)v3 isEqualToString:v4];

  if (v6)
  {
LABEL_7:
    id v7 = objc_alloc_init(PKDashboardBalancePresenter);
    id v8 = v7;
    uint64_t v9 = 0;
LABEL_16:
    [(PKDashboardBalancePresenter *)v7 setCellStyle:v9];
    goto LABEL_21;
  }
LABEL_9:
  BOOL v10 = v3;
  uint64_t v11 = @"PKRewardsHubSectionDateRangeSummary";
  if (v11 == v10)
  {

LABEL_15:
    id v7 = objc_alloc_init(PKDashboardBalanceSummaryItemPresenter);
    id v8 = v7;
    uint64_t v9 = 1;
    goto LABEL_16;
  }
  uint64_t v12 = v11;
  if (v3 && v11)
  {
    int v13 = [(__CFString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_18:
  int v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    BOOL v17 = v10;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier in rewards hub: %@", (uint8_t *)&v16, 0xCu);
  }

  id v8 = 0;
LABEL_21:

  return v8;
}

- (void)_setItems:(id)a3 forSection:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    [(NSMutableDictionary *)self->_sectionIDToItemsMap removeObjectForKey:v6];
    if (v7) {
      [(NSMutableDictionary *)self->_sectionIDToItemsMap setObject:v7 forKey:v6];
    }
  }
}

- (id)_itemsForSection:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionIDToItemsMap objectForKey:a3];
}

- (id)_presenterForSection:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionIDToPresenterMap objectForKey:a3];
}

- (id)_sectionIdentifierForItem:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 wrappedItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = PKRewardsHubSectionLifetimeSummary;
LABEL_5:
    uint64_t v5 = *v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = PKRewardsHubSectionDateRangeSummary;
    goto LABEL_5;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized item type for rewards hub summary: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)_cellPresenterIdentifierForItem:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 wrappedItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = &PKDashboardBalancePresenterIdentifier;
LABEL_5:
    uint64_t v5 = *v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = PKDashboardBalanceSummaryItemPresenterIdentifier;
    goto LABEL_5;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized item type for rewards hub summary: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)_collectionView
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (uint64_t v4 = WeakRetained,
        id v5 = objc_loadWeakRetained((id *)p_delegate),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 rewardsHubCollectionView];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_reloadData
{
}

- (void)_reloadDataAndUpdateDelegate
{
  id v3 = self->_lifetimeSummary;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke;
  v5[3] = &unk_1E59CB268;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = v3;
  char v6 = v4;
  [(PKRewardsHubSummarySectionController *)self _reloadDataWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke_2;
    v6[3] = &unk_1E59CB010;
    objc_copyWeak(&v8, v4);
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);

    objc_destroyWeak(&v8);
  }
}

void __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = WeakRetained[4];
  if ((PKEqualObjects() & 1) == 0)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    if (objc_opt_respondsToSelector())
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v4 = WeakRetained[10];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_msgSend(v3, "reloadDataForSectionIdentifier:animated:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 1, (void)v9);
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)_reloadDataWithCompletion:(id)a3
{
  id v4 = a3;
  p_summaryFetchLock = &self->_summaryFetchLock;
  os_unfair_lock_lock(&self->_summaryFetchLock);
  if (self->_summaryFetchInProgress)
  {
    self->_transactionsNeedUpdate = 1;
    pendingCompletionHandlers = self->_pendingCompletionHandlers;
    uint64_t v7 = _Block_copy(v4);
    [(NSMutableSet *)pendingCompletionHandlers pk_safelyAddObject:v7];

    os_unfair_lock_unlock(p_summaryFetchLock);
  }
  else
  {
    self->_summaryFetchInProgress = 1;
    uint64_t v8 = self->_pendingCompletionHandlers;
    long long v9 = _Block_copy(v4);
    [(NSMutableSet *)v8 pk_safelyAddObject:v9];

    os_unfair_lock_unlock(&self->_summaryFetchLock);
    objc_initWeak(&location, self);
    rewardsFetcher = self->_rewardsFetcher;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke;
    v11[3] = &unk_1E59DAB20;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [(PKRewardsSummaryFetcher *)rewardsFetcher rewardsTierSummariesWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D4338;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  id v18 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, *(id *)(a1 + 32));
    id v4 = objc_alloc_init(PKDashboardBalanceItem);
    uint64_t v5 = [*(id *)(a1 + 32) totalCurrencyAmount];
    uint64_t v6 = [v5 formattedStringValue];
    [(PKDashboardBalanceItem *)v4 setBalance:v6];

    id v7 = PKLocalizedFeatureString();
    [(PKDashboardBalanceItem *)v4 setTitle:v7];

    id v8 = [[_PKDashboardItemWrapper alloc] initWithDashboardItem:v4];
    id v9 = objc_alloc_init(PKDashboardBalanceSummaryItem);
    [(PKDashboardBalanceSummaryItem *)v9 setType:19];
    id v10 = [*(id *)(a1 + 40) totalCurrencyAmount];
    [(PKDashboardBalanceSummaryItem *)v9 setRewardsCurrencyAmount:v10];

    id v11 = [[_PKDashboardItemWrapper alloc] initWithDashboardItem:v9];
    id v12 = objc_alloc_init(PKDashboardBalanceSummaryItem);
    [(PKDashboardBalanceSummaryItem *)v12 setType:20];
    id v13 = [*(id *)(a1 + 48) totalCurrencyAmount];
    [(PKDashboardBalanceSummaryItem *)v12 setRewardsCurrencyAmount:v13];

    uint64_t v14 = [[_PKDashboardItemWrapper alloc] initWithDashboardItem:v12];
    id v26 = v8;
    v33[0] = v8;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v3 _setItems:v15 forSection:@"PKRewardsHubSectionLifetimeSummary"];

    int v25 = v11;
    v32[0] = v11;
    v32[1] = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v3 _setItems:v16 forSection:@"PKRewardsHubSectionDateRangeSummary"];

    os_unfair_lock_lock((os_unfair_lock_t)v3 + 12);
    int v17 = *((unsigned __int8 *)v3 + 53);
    *((_WORD *)v3 + 26) = 0;
    id v18 = (void *)[v3[7] copy];
    [v3[7] removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 12);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * i) + 16))();
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v21);
    }

    if (v17) {
      [v3 _reloadData];
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 56);
    if (v24) {
      (*(void (**)(uint64_t, void))(v24 + 16))(v24, 0);
    }
  }
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_sectionIDToItemsMap, 0);
  objc_storeStrong((id *)&self->_sectionIDToPresenterMap, 0);
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lifetimeSummary, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);

  objc_storeStrong((id *)&self->_rewardsFetcher, 0);
}

@end