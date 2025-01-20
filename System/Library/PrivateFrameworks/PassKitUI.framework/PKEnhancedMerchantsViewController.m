@interface PKEnhancedMerchantsViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKEnhancedMerchantsViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5;
- (id)_nonNilSections;
- (void)navigateToRewardsHubDestination:(int64_t)a3;
- (void)openLinkedApplication:(id)a3;
- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5;
- (void)preflightWithCompletion:(id)a3;
- (void)presentDisplayableError:(id)a3;
- (void)reportEventIfNecessary:(id)a3;
- (void)scrollToMerchantWithPrivateIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKEnhancedMerchantsViewController

- (PKEnhancedMerchantsViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKEnhancedMerchantsViewController;
  v12 = [(PKDynamicCollectionViewController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(PKDynamicCollectionViewController *)v12 setUseItemIdentityWhenUpdating:1];
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_accountService, a4);
    objc_storeStrong((id *)&v13->_enhancedMerchantsFetcher, a5);
    v21[0] = @"PKEnhancedMerchantsListSectionMerchantList";
    v21[1] = @"PKEnhancedMerchantsListSectionMerchantDisclosures";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v15 = [[PKEnhancedMerchantsListSectionController alloc] initWithSectionIdentifiers:v14 fetcher:v13->_enhancedMerchantsFetcher delegate:v13];
    enhancedMerchantsListSectionController = v13->_enhancedMerchantsListSectionController;
    v13->_enhancedMerchantsListSectionController = v15;

    v20 = v13->_enhancedMerchantsListSectionController;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [(PKDynamicCollectionViewController *)v13 setSections:v17 animated:0];
  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v4 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2810000000;
  v24[3] = "";
  int v25 = 0;
  id v10 = [(PKEnhancedMerchantsViewController *)self _nonNilSections];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  v5 = [(PKEnhancedMerchantsViewController *)self _nonNilSections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        dispatch_group_enter(v4);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke;
        v16[3] = &unk_1E59CECB0;
        v18 = v24;
        objc_super v19 = v26;
        v17 = v4;
        [v9 preflightWithCompletion:v16];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  if (v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CECD8;
    block[4] = self;
    id v13 = v10;
    id v14 = v11;
    v15 = v26;
    dispatch_group_notify(v4, MEMORY[0x1E4F14428], block);
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke(void *a1, char a2)
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

uint64_t __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSections:*(void *)(a1 + 40) animated:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKEnhancedMerchantsViewController;
  [(PKDynamicCollectionViewController *)&v16 viewDidLoad];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __48__PKEnhancedMerchantsViewController_viewDidLoad__block_invoke;
  id v13 = &unk_1E59CBEE0;
  objc_copyWeak(&v14, &location);
  char v5 = [v4 actionWithHandler:&v10];
  uint64_t v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 24, v5, v10, v11, v12, v13);

  uint64_t v7 = [(PKEnhancedMerchantsViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = [(PKDynamicCollectionViewController *)self collectionView];
  [v8 setShowsVerticalScrollIndicator:1];
  [v8 setAlwaysBounceVertical:1];
  [v8 setBounces:1];
  id v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setBackgroundColor:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __48__PKEnhancedMerchantsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  [(PKDynamicCollectionViewController *)&v5 viewDidAppear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKEnhancedMerchantsViewController *)self reportEventIfNecessary:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  [(PKEnhancedMerchantsViewController *)&v5 viewDidDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKEnhancedMerchantsViewController *)self reportEventIfNecessary:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKEnhancedMerchantsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PKDynamicCollectionViewController *)self reloadDataWithoutRebuildingDataStores];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKEnhancedMerchantsViewController;
  [(PKEnhancedMerchantsViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKEnhancedMerchantsViewController *)self traitCollection];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      uint64_t v7 = [v4 preferredContentSizeCategory];
      v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKDynamicCollectionViewController *)self reloadDataWithoutRebuildingDataStores];
      }
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)scrollToMerchantWithPrivateIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke;
  aBlock[3] = &unk_1E59CA9F8;
  id v9 = v8;
  id v16 = v9;
  objc_super v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke_2;
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

uint64_t __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1080) merchantForPrivateIdentifier:*(void *)(a1 + 40)];
  id v3 = (id)v2;
  if (v2) {
    [*(id *)(a1 + 32) scrollToItem:v2 atScrollPosition:1 animated:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)navigateToRewardsHubDestination:(int64_t)a3
{
  if (!a3)
  {
    v7[3] = v3;
    v7[4] = v4;
    objc_initWeak(v7, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__PKEnhancedMerchantsViewController_navigateToRewardsHubDestination___block_invoke;
    v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, v7);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(v7);
  }
}

void __69__PKEnhancedMerchantsViewController_navigateToRewardsHubDestination___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  id v2 = [v1 topViewController];

  if (v2 == WeakRetained)
  {
    id v3 = [WeakRetained navigationController];
    id v4 = (id)[v3 popViewControllerAnimated:1];
  }
}

- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v8 = v7;
    if (v5) {
      [v7 openSensitiveURL:v9 withOptions:0];
    }
    else {
      [v7 openURL:v9 withOptions:0];
    }

    id v6 = v9;
  }
}

- (void)openLinkedApplication:(id)a3
{
}

- (void)reportEventIfNecessary:(id)a3
{
  id v5 = (id)[a3 mutableCopy];
  [v5 setObject:*MEMORY[0x1E4F862D8] forKey:*MEMORY[0x1E4F86730]];
  id v3 = (void *)MEMORY[0x1E4F843E0];
  id v4 = (void *)[v5 copy];
  [v3 reportAccountRewardsEventIfNecessary:v4];
}

- (void)presentDisplayableError:(id)a3
{
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  [(PKEnhancedMerchantsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_nonNilSections
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_enhancedMerchantsListSectionController];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedMerchantsListSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end