@interface PKRewardsHubViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKRewardsHubViewController)initWithAccount:(id)a3 transactionSourceCollection:(id)a4 accountService:(id)a5;
- (id)_nonNilSections;
- (void)navigateToRewardsHubDestination:(int64_t)a3;
- (void)openLinkedApplication:(id)a3;
- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5;
- (void)preflightWithCompletion:(id)a3;
- (void)presentEducationViewController;
- (void)presentEnhancedMerchant:(id)a3;
- (void)presentEnhancedMerchantsListWithCompletion:(id)a3;
- (void)reportEventIfNecessary:(id)a3;
- (void)scrollToPromotionWithProgramIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PKRewardsHubViewController

- (PKRewardsHubViewController)initWithAccount:(id)a3 transactionSourceCollection:(id)a4 accountService:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PKRewardsHubViewController;
  v12 = [(PKDynamicCollectionViewController *)&v36 init];
  v13 = v12;
  if (v12)
  {
    [(PKDynamicCollectionViewController *)v12 setUseItemIdentityWhenUpdating:1];
    p_account = &v13->_account;
    objc_storeStrong((id *)&v13->_account, a3);
    p_accountService = &v13->_accountService;
    objc_storeStrong((id *)&v13->_accountService, a5);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F84F48]) initWithTransactionSourceCollection:v13->_transactionSourceCollection account:v13->_account];
    rewardsFetcher = v13->_rewardsFetcher;
    v13->_rewardsFetcher = (PKRewardsSummaryFetcher *)v16;

    id v18 = objc_alloc(MEMORY[0x1E4F841D8]);
    v19 = [(PKAccount *)v13->_account accountIdentifier];
    uint64_t v20 = [v18 initWithAccountIdentifier:v19 accountService:v13->_accountService];
    enhancedMerchantsFetcher = v13->_enhancedMerchantsFetcher;
    v13->_enhancedMerchantsFetcher = (PKAccountEnhancedMerchantsFetcher *)v20;

    uint64_t v22 = [(PKAccount *)v13->_account showRewardsGraph];
    v37[0] = @"PKRewardsHubSectionLifetimeSummary";
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    v24 = v23;
    if ((v22 & 1) == 0)
    {
      uint64_t v25 = [v23 arrayByAddingObject:@"PKRewardsHubSectionDateRangeSummary"];

      v24 = (void *)v25;
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    v27 = [[PKRewardsHubSummarySectionController alloc] initWithSectionIdentifiers:v24 rewardsFetcher:v13->_rewardsFetcher paymentDataProvider:v26 showRewardsGraph:v22 delegate:v13];
    summariesSectionController = v13->_summariesSectionController;
    v13->_summariesSectionController = v27;

    v29 = [[PKEnhancedMerchantsShelfSectionController alloc] initWithSectionIdentifier:@"PKRewardsHubSectionEnhancedMerchantShelf" fetcher:v13->_enhancedMerchantsFetcher delegate:v13];
    enhancedMerchantsShelfSectionController = v13->_enhancedMerchantsShelfSectionController;
    v13->_enhancedMerchantsShelfSectionController = v29;

    v31 = [[PKAccountPromotionsSectionController alloc] initWithSectionIdentifier:@"PKRewardsHubSectionAccountPromotions" account:*p_account accountService:*p_accountService delegate:v13];
    promotionsSectionController = v13->_promotionsSectionController;
    v13->_promotionsSectionController = v31;

    v33 = [[PKDailyCashSelectionSectionController alloc] initWithSectionIdentifier:@"PKRewardsHubSectionDailyCashSelection" account:*p_account accountService:*p_accountService delegate:v13];
    dailyCashSelectionSectionController = v13->_dailyCashSelectionSectionController;
    v13->_dailyCashSelectionSectionController = v33;
  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = dispatch_group_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 1;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2810000000;
  v23[3] = "";
  int v24 = 0;
  [(PKRewardsHubViewController *)self _nonNilSections];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        dispatch_group_enter(v4);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke;
        v15[3] = &unk_1E59CECB0;
        v17 = v23;
        id v18 = v25;
        uint64_t v16 = v4;
        [v8 preflightWithCompletion:v15];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }

  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CECD8;
    block[4] = self;
    id v12 = obj;
    id v13 = v9;
    v14 = v25;
    dispatch_group_notify(v4, MEMORY[0x1E4F14428], block);
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

void __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke(void *a1, char a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v4 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = a2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v6 = a1[4];

  dispatch_group_leave(v6);
}

uint64_t __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSections:*(void *)(a1 + 40) animated:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKRewardsHubViewController;
  [(PKDynamicCollectionViewController *)&v8 viewDidLoad];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  [v3 setShowsVerticalScrollIndicator:1];
  [v3 setAlwaysBounceVertical:1];
  [v3 setBounces:1];
  uint64_t v4 = +[PKDashboardViewController backgroundColor];
  [v3 setBackgroundColor:v4];

  char v5 = [(PKRewardsHubViewController *)self navigationItem];
  objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  [v5 setLargeTitleDisplayMode:1];
  uint64_t v6 = PKLocalizedFeatureString();
  [v5 setTitle:v6];

  v7 = [(PKRewardsHubViewController *)self view];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85928]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKRewardsHubViewController;
  [(PKDynamicCollectionViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [(PKRewardsHubViewController *)self navigationController];
  char v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  [(PKDynamicCollectionViewController *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(PKDailyCashSelectionSectionController *)self->_dailyCashSelectionSectionController analyticsEventReportWithPreSelect:1];
  [v4 setObject:*MEMORY[0x1E4F864A0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [(PKRewardsHubViewController *)self reportEventIfNecessary:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  [(PKRewardsHubViewController *)&v5 viewDidDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKRewardsHubViewController *)self reportEventIfNecessary:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PKDynamicCollectionViewController *)self reloadDataWithoutRebuildingDataStores];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRewardsHubViewController;
  [(PKRewardsHubViewController *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKRewardsHubViewController *)self traitCollection];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      v7 = [v4 preferredContentSizeCategory];
      objc_super v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        summariesSectionController = self->_summariesSectionController;
        id v11 = [(PKDynamicCollectionViewController *)self collectionView];
        [(PKRewardsHubSummarySectionController *)summariesSectionController traitCollectionDidChangeFromTrait:v4 toTrait:v6 inCollectionView:v11];

        [(PKDynamicCollectionViewController *)self reloadDataWithoutRebuildingDataStores];
      }
    }
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)willMoveToParentViewController:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController willMoveToParentViewController:](&v9, sel_willMoveToParentViewController_);
  if (!a3)
  {
    uint64_t v5 = *MEMORY[0x1E4F86380];
    uint64_t v6 = *MEMORY[0x1E4F86120];
    v10[0] = *MEMORY[0x1E4F86308];
    v10[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F860D0];
    v11[0] = v5;
    v11[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [(PKRewardsHubViewController *)self reportEventIfNecessary:v8];
  }
}

- (void)scrollToPromotionWithProgramIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke;
  aBlock[3] = &unk_1E59CA9F8;
  id v9 = v8;
  id v16 = v9;
  id v10 = _Block_copy(aBlock);
  id v11 = v10;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke_2;
    v12[3] = &unk_1E59CE110;
    v12[4] = self;
    id v13 = v7;
    id v14 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    (*((void (**)(void *, void))v10 + 2))(v10, 0);
  }
}

uint64_t __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1112) promotionForProgramIdentifier:*(void *)(a1 + 40)];
  id v3 = (id)v2;
  if (v2) {
    [*(id *)(a1 + 32) scrollToItem:v2 atScrollPosition:1 animated:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)navigateToRewardsHubDestination:(int64_t)a3
{
  if (a3 == 1) {
    [(PKRewardsHubViewController *)self presentEnhancedMerchantsListWithCompletion:0];
  }
}

- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v13 = v8;
    if (v6)
    {
      id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [(PKBasicWebViewController *)v9 openSensitiveURL:v13 withOptions:0];
    }
    else if (v5 {
           && ([v8 scheme],
    }
               id v10 = objc_claimAutoreleasedReturnValue(),
               int v11 = [v10 containsString:@"http"],
               v10,
               v11))
    {
      id v9 = [[PKBasicWebViewController alloc] initWithURL:v13];
      objc_super v12 = [[PKNavigationController alloc] initWithRootViewController:v9];
      [(PKRewardsHubViewController *)self presentViewController:v12 animated:1 completion:0];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [(PKBasicWebViewController *)v9 openURL:v13 withOptions:0];
    }

    id v8 = v13;
  }
}

- (void)openLinkedApplication:(id)a3
{
}

- (void)presentEducationViewController
{
  id v4 = [[PKRewardsEducationViewController alloc] initWithAccount:self->_account accountService:self->_accountService enhancedMerchantsFetcher:self->_enhancedMerchantsFetcher];
  id v3 = [[PKNavigationController alloc] initWithRootViewController:v4];
  [(PKRewardsHubViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)reportEventIfNecessary:(id)a3
{
  id v5 = (id)[a3 mutableCopy];
  [v5 setObject:*MEMORY[0x1E4F86210] forKey:*MEMORY[0x1E4F86730]];
  id v3 = (void *)MEMORY[0x1E4F843E0];
  id v4 = (void *)[v5 copy];
  [v3 reportAccountRewardsEventIfNecessary:v4];
}

- (void)presentEnhancedMerchant:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__PKRewardsHubViewController_presentEnhancedMerchant___block_invoke;
    v6[3] = &unk_1E59DA9B0;
    id v7 = v4;
    [(PKRewardsHubViewController *)self presentEnhancedMerchantsListWithCompletion:v6];
  }
}

uint64_t __54__PKRewardsHubViewController_presentEnhancedMerchant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scrollToItem:*(void *)(a1 + 32) atScrollPosition:1 animated:1];
}

- (id)_nonNilSections
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_summariesSectionController];
  [v3 safelyAddObject:self->_dailyCashSelectionSectionController];
  if ([(PKAccount *)self->_account showCardPromotions]) {
    [v3 safelyAddObject:self->_promotionsSectionController];
  }
  if ([(PKAccount *)self->_account showEnhancedMerchants]) {
    [v3 safelyAddObject:self->_enhancedMerchantsShelfSectionController];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)presentEnhancedMerchantsListWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[PKEnhancedMerchantsViewController alloc] initWithAccount:self->_account accountService:self->_accountService enhancedMerchantsFetcher:self->_enhancedMerchantsFetcher];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CB038;
  objc_copyWeak(&v15, &location);
  BOOL v6 = v5;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  id v8 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_4;
  v10[3] = &unk_1E59CA9F8;
  id v9 = v8;
  id v11 = v9;
  [(PKEnhancedMerchantsViewController *)v6 preflightWithCompletion:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:a1[4]];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_3;
  v4[3] = &unk_1E59CAD68;
  id v6 = a1[5];
  id v5 = a1[4];
  [WeakRetained presentViewController:v3 animated:1 completion:v4];
}

uint64_t __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyCashSelectionSectionController, 0);
  objc_storeStrong((id *)&self->_promotionsSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsShelfSectionController, 0);
  objc_storeStrong((id *)&self->_summariesSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_rewardsFetcher, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end