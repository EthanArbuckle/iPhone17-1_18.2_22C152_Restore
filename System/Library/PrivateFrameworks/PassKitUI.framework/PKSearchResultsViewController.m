@interface PKSearchResultsViewController
- (BOOL)_isQueryIdentifierMatchingCurrentQuery:(id)a3;
- (BOOL)_updateGroup:(id)a3 withRegion:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKSearchResultsViewController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_thumbnailInset;
- (double)_thumbnailSpacing;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_groupItemForTransactionGroup:(id)a3 tokens:(id)a4;
- (id)_historyViewControllerForQuery:(id)a3 groups:(id)a4 headerGroup:(id)a5;
- (id)_queryWithIdentifier:(id)a3;
- (id)_resultsLayout;
- (id)_searchController;
- (id)_thumbnailLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_numberOfItemsInSection:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5;
- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4;
- (void)_configureSuggestionCell:(id)a3 withSuggestion:(id)a4;
- (void)_initiateSeeAllPresentationForQuery:(id)a3;
- (void)_saveResults:(id)a3 forQuery:(id)a4;
- (void)_scrollViewStoppedScrolling;
- (void)_seeAllHeaderGroupForQuery:(id)a3 groups:(id)a4 transactions:(id)a5 completion:(id)a6;
- (void)_udpateOrPresentSeeAllViewControllerForQuery:(id)a3 groups:(id)a4 transactions:(id)a5;
- (void)_updateAccountsWithCompletion:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updateUIIfPossibleWithResults:(id)a3 query:(id)a4 completion:(id)a5;
- (void)_updateUIWithResults:(id)a3 forQuery:(id)a4 completion:(id)a5;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)invalidateSearchResults;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchDidCompleteWithError:(id)a3 results:(id)a4 forIdentifier:(id)a5;
- (void)setQuery:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)worldRegionUpdated:(id)a3 updatedRegion:(id)a4;
@end

@implementation PKSearchResultsViewController

- (PKSearchResultsViewController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PKSearchResultsViewController *)self _thumbnailLayout];
  v60.receiver = self;
  v60.super_class = (Class)PKSearchResultsViewController;
  v13 = [(PKSearchResultsViewController *)&v60 initWithCollectionViewLayout:v12];

  if (v13)
  {
    id v52 = v11;
    id v53 = v10;
    id v54 = v9;
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_usingThumbnailLayout = 1;
    v13->_atNaturalRestingBounds = 1;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a3);
    objc_storeStrong((id *)&v13->_familyCollection, a5);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passbok.search.results", v15);
    queuePrepareResults = v13->_queuePrepareResults;
    v13->_queuePrepareResults = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    passesForResults = v13->_passesForResults;
    v13->_passesForResults = v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:10];
    lastQueries = v13->_lastQueries;
    v13->_lastQueries = (NSMutableOrderedSet *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
    lastResultsPerQueryIdentifier = v13->_lastResultsPerQueryIdentifier;
    v13->_lastResultsPerQueryIdentifier = (NSMutableDictionary *)v22;

    v24 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:0 detailViewStyle:0 avatarViewDelegate:v13];
    transactionPresenter = v13->_transactionPresenter;
    v13->_transactionPresenter = v24;

    v26 = objc_alloc_init(PKMapsSnapshotManager);
    v27 = objc_alloc_init(PKTransactionGroupItemPresenter);
    transactionGroupPresenter = v13->_transactionGroupPresenter;
    v13->_transactionGroupPresenter = v27;

    [(PKTransactionGroupItemPresenter *)v13->_transactionGroupPresenter setSnapshotManager:v26];
    [(PKTransactionGroupItemPresenter *)v13->_transactionGroupPresenter setPaymentDataProvider:v13->_paymentDataProvider];
    v29 = [PKContactAvatarManager alloc];
    v30 = [(PKTransactionGroupItemPresenter *)v13->_transactionGroupPresenter contactResolver];
    v31 = [(PKContactAvatarManager *)v29 initWithContactResolver:v30 paymentDataProvider:v13->_paymentDataProvider];

    [(PKTransactionGroupItemPresenter *)v13->_transactionGroupPresenter setAvatarManager:v31];
    v32 = objc_alloc_init(PKTransactionGroupThumbnailPresenter);
    thumbnailPresenter = v13->_thumbnailPresenter;
    v13->_thumbnailPresenter = v32;

    [(PKTransactionGroupThumbnailPresenter *)v13->_thumbnailPresenter setSnapshotManager:v26];
    [(PKTransactionGroupThumbnailPresenter *)v13->_thumbnailPresenter setPaymentDataProvider:v13->_paymentDataProvider];
    [(PKTransactionGroupThumbnailPresenter *)v13->_thumbnailPresenter setAvatarManager:v31];
    uint64_t v34 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v13->_accountService;
    v13->_accountService = (PKAccountService *)v34;

    [(PKAccountService *)v13->_accountService registerObserver:v13];
    v36 = (PKSearchService *)objc_alloc_init(MEMORY[0x1E4F84FA0]);
    searchService = v13->_searchService;
    v13->_searchService = v36;

    [(PKSearchService *)v13->_searchService registerObserver:v13];
    uint64_t v38 = [MEMORY[0x1E4F84898] sharedInstance];
    passLibrary = v13->_passLibrary;
    v13->_passLibrary = (PKPassLibrary *)v38;

    v40 = [[PKWorldRegionUpdater alloc] initWithSearchService:v13->_searchService];
    regionUpdater = v13->_regionUpdater;
    v13->_regionUpdater = v40;

    [(PKWorldRegionUpdater *)v13->_regionUpdater addObserver:v13];
    v42 = [(PKSearchResultsViewController *)v13 navigationItem];
    [v42 setBackButtonDisplayMode:2];
    v43 = PKLocalizedPaymentString(&cfstr_DashboardSearc.isa);
    [v42 setBackButtonTitle:v43];

    objc_initWeak(&location, v13);
    id v44 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke;
    v57[3] = &unk_1E59CFB08;
    v45 = v13;
    v58 = v45;
    [v44 addOperation:v57];
    v46 = [MEMORY[0x1E4F1CA98] null];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_3;
    v55[3] = &unk_1E59D3CD8;
    objc_copyWeak(&v56, &location);
    id v47 = (id)[v44 evaluateWithInput:v46 completion:v55];

    [(PKPaymentDataProvider *)v13->_paymentDataProvider addDelegate:v45];
    v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v48 addObserver:v45 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v48 addObserver:v45 selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v48 addObserver:v45 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
    v49 = (FHSearchSuggestionController *)objc_alloc_init(getFHSearchSuggestionControllerClass());
    searchSuggestionController = v45->_searchSuggestionController;
    v45->_searchSuggestionController = v49;

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);

    id v10 = v53;
    id v9 = v54;
    id v11 = v52;
  }

  return v13;
}

void __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_2;
  v11[3] = &unk_1E59CAD68;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 _updateAccountsWithCompletion:v11];
}

uint64_t __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1265] = 1;
    id v4 = WeakRetained;
    v2 = [WeakRetained _queryWithIdentifier:*((void *)WeakRetained + 143)];
    os_unfair_lock_lock((os_unfair_lock_t)v4 + 284);
    id v3 = *((id *)v4 + 146);
    os_unfair_lock_unlock((os_unfair_lock_t)v4 + 284);
    [v4 _updateUIIfPossibleWithResults:v3 query:v2 completion:0];

    WeakRetained = v4;
  }
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)PKSearchResultsViewController;
  [(PKSearchResultsViewController *)&v20 viewDidLoad];
  id v3 = [(PKSearchResultsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v3, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  id v4 = [(PKSearchResultsViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"transactionItemPresenter"];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"transactionGroupPresenter"];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"emptyCellIdentifier"];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKTransactionGroupThumbnailPresenterIdentifier"];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"suggestionIdentifier"];
  [v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"titleIdentifier"];
  [v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"separatorIdentifier"];
  [v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"ElementKindHeaderSpacing" withReuseIdentifier:@"ElementKindHeaderSpacing"];
  [v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"ElementKindFooterSpacing" withReuseIdentifier:@"ElementKindFooterSpacing"];
  v5 = +[PKDashboardViewController backgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setShowsVerticalScrollIndicator:1];
  [v4 setAlwaysBounceVertical:1];
  [v4 setKeyboardDismissMode:1];
  [v4 setContentInsetAdjustmentBehavior:2];
  id v6 = [PKDashboardTitleHeaderView alloc];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v11 = -[PKDashboardTitleHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  sampleHeaderView = self->_sampleHeaderView;
  self->_sampleHeaderView = v11;

  id v13 = -[PKSearchSuggestionCollectionViewCell initWithFrame:]([PKSearchSuggestionCollectionViewCell alloc], "initWithFrame:", v7, v8, v9, v10);
  sampleSuggestionCell = self->_sampleSuggestionCell;
  self->_sampleSuggestionCell = v13;

  v15 = +[PKUIForegroundActiveArbiter sharedInstance];
  dispatch_queue_t v16 = v15;
  p_foregroundActiveState = &self->_foregroundActiveState;
  if (v15) {
    $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)[v15 registerObserver:self];
  }
  else {
    $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
  }
  v18 = [(PKSearchResultsViewController *)self _queryWithIdentifier:self->_currentQueryIdentifier];
  os_unfair_lock_lock(&self->_lockQuery);
  v19 = self->_currentResults;
  os_unfair_lock_unlock(&self->_lockQuery);
  [(PKSearchResultsViewController *)self _updateUIIfPossibleWithResults:v19 query:v18 completion:0];
}

- (void)viewWillLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)PKSearchResultsViewController;
  [(PKSearchResultsViewController *)&v31 viewWillLayoutSubviews];
  id v3 = [(PKSearchResultsViewController *)self collectionView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(PKSearchResultsViewController *)self _searchController];
  id v13 = v12;
  if (v12)
  {
    v14 = [v12 searchBar];
    v15 = [v14 superview];

    if (v15)
    {
      dispatch_queue_t v16 = [v3 superview];
      [v14 bounds];
      objc_msgSend(v16, "convertPoint:fromView:", v14, 0.0, v17);
      double v19 = v18;

      double v20 = v9 + self->_keyboardFrame.size.height;
      [v3 contentInset];
      if (v7 != v24 || v19 != v21 || v11 != v23 || v20 != v22)
      {
        objc_msgSend(v3, "setContentInset:", v19, v7, v20, v11);
        [v3 verticalScrollIndicatorInsets];
        [v3 setVerticalScrollIndicatorInsets:v19 - v5];
      }
      if (self->_atNaturalRestingBounds)
      {
        [v3 contentOffset];
        double v26 = v25;
        double v28 = v27;
        objc_msgSend(v3, "pkui_naturalRestingBounds");
        if (v26 != v30 || v28 != v29) {
          objc_msgSend(v3, "setContentOffset:animated:", 0);
        }
      }
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isScrolling = 1;
  self->_atNaturalRestingBounds = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_isScrolling)
  {
    self->_isScrolling = 0;
    [(PKSearchResultsViewController *)self _scrollViewStoppedScrolling];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrolling)
  {
    self->_isScrolling = 0;
    [(PKSearchResultsViewController *)self _scrollViewStoppedScrolling];
  }
}

- (void)_scrollViewStoppedScrolling
{
  id v10 = [(PKSearchResultsViewController *)self collectionView];
  objc_msgSend(v10, "pkui_naturalRestingBounds");
  double v4 = v3;
  double v6 = v5;
  [v10 contentOffset];
  BOOL v8 = v7 == v4;
  if (v9 != v6) {
    BOOL v8 = 0;
  }
  self->_atNaturalRestingBounds = v8;
}

- (id)_searchController
{
  v2 = [(PKSearchResultsViewController *)self navigationController];
  double v3 = [v2 parentViewController];

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      double v3 = 0;
    }
  }

  return v3;
}

- (double)_thumbnailInset
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 20.0;
  if (!v2) {
    return 16.0;
  }
  return result;
}

- (double)_thumbnailSpacing
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 16.0;
  if (v2 < 5) {
    double result = 12.0;
  }
  if (!v2) {
    return 8.0;
  }
  return result;
}

- (id)_thumbnailLayout
{
  objc_initWeak(&location, self);
  [(PKSearchResultsViewController *)self _thumbnailInset];
  double v4 = v3;
  [(PKSearchResultsViewController *)self _thumbnailSpacing];
  double v6 = v5;
  id v7 = objc_alloc(MEMORY[0x1E4FB1580]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PKSearchResultsViewController__thumbnailLayout__block_invoke;
  v10[3] = &unk_1E59D3D00;
  objc_copyWeak(v11, &location);
  v11[1] = v4;
  v11[2] = v6;
  BOOL v8 = (void *)[v7 initWithSectionProvider:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v8;
}

char *__49__PKSearchResultsViewController__thumbnailLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v8 = (char *)[WeakRetained _numberOfItemsInSection:a2];
    unint64_t v9 = a2 + 1;
    do
    {
      unint64_t v10 = v9;
      if (v9 > 8) {
        break;
      }
      uint64_t v11 = [v7 _numberOfItemsInSection:v9];
      unint64_t v9 = v10 + 1;
    }
    while (!v11);
    if (v8)
    {
      v83 = v5;
      uint64_t v84 = a2;
      uint64_t v80 = a1;
      if (a2 == 1)
      {
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
        id v13 = 0;
        double v14 = 0.0;
        do
        {
          v15 = [v7 collectionView];
          dispatch_queue_t v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:1];
          double v17 = [v15 collectionViewLayout];
          [v7 collectionView:v15 layout:v17 sizeForItemAtIndexPath:v16];
          double v19 = v18;
          double v21 = v20;

          double v22 = (void *)MEMORY[0x1E4FB1338];
          double v23 = [MEMORY[0x1E4FB1308] absoluteDimension:v19];
          double v24 = [MEMORY[0x1E4FB1308] absoluteDimension:v21];
          double v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

          double v26 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v25];
          [v12 addObject:v26];
          double v14 = v14 + v21;

          ++v13;
        }
        while (v8 != v13);
        double v27 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        double v28 = [MEMORY[0x1E4FB1308] absoluteDimension:v14];
        double v29 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v27 heightDimension:v28];
        double v30 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v29 subitems:v12];
        objc_super v31 = [MEMORY[0x1E4FB1340] fixedSpacing:0.0];
        [v30 setInterItemSpacing:v31];

        BOOL v8 = [MEMORY[0x1E4FB1330] sectionWithGroup:v30];
        objc_msgSend(v8, "setContentInsets:", 0.0, 4.0, 0.0, *(double *)(v80 + 40));
        [v8 setSupplementariesFollowContentInsets:0];
        [v8 setInterGroupSpacing:0.0];
      }
      else
      {
        v32 = (void *)v7[131];
        v33 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        uint64_t v34 = [v7 collectionView];
        v35 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
        [v32 sizeForItem:v33 inCollectionView:v34 atIndexPath:v35];
        double v37 = v36;
        double v39 = v38;

        v40 = (void *)MEMORY[0x1E4FB1338];
        v41 = [MEMORY[0x1E4FB1308] absoluteDimension:v37];
        v42 = [MEMORY[0x1E4FB1308] absoluteDimension:v39];
        v43 = [v40 sizeWithWidthDimension:v41 heightDimension:v42];

        id v44 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v43];
        v45 = (void *)MEMORY[0x1E4FB1338];
        v46 = [MEMORY[0x1E4FB1308] absoluteDimension:*(double *)(a1 + 48) * (double)(unint64_t)(v8 - 1) + (double)(unint64_t)v8 * v37];
        id v47 = [MEMORY[0x1E4FB1308] absoluteDimension:v39];
        v48 = [v45 sizeWithWidthDimension:v46 heightDimension:v47];

        v49 = (void *)MEMORY[0x1E4FB1318];
        v86[0] = v44;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
        v51 = [v49 horizontalGroupWithLayoutSize:v48 subitems:v50];

        id v52 = [MEMORY[0x1E4FB1340] fixedSpacing:*(double *)(a1 + 48)];
        [v51 setInterItemSpacing:v52];

        BOOL v8 = [MEMORY[0x1E4FB1330] sectionWithGroup:v51];
        objc_msgSend(v8, "setContentInsets:", 0.0, *(double *)(a1 + 40), 0.0, *(double *)(a1 + 40));
        [v8 setSupplementariesFollowContentInsets:0];
        [v8 setInterGroupSpacing:0.0];
        [v8 setOrthogonalScrollingBehavior:1];
      }
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 _configureHeaderView:v7[127] inSection:v84];
      id v54 = (void *)v7[127];
      id v5 = v83;
      v55 = [v83 container];
      [v55 contentSize];
      objc_msgSend(v54, "sizeThatFits:");
      double v57 = v56;
      double v59 = v58;

      objc_super v60 = (void *)MEMORY[0x1E4FB1338];
      v61 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
      v62 = [MEMORY[0x1E4FB1308] absoluteDimension:v59 + 17.0];
      uint64_t v63 = [v60 sizeWithWidthDimension:v61 heightDimension:v62];

      v82 = (void *)v63;
      v81 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v63 elementKind:@"ElementKindHeaderSpacing" alignment:1];
      objc_msgSend(v53, "addObject:");
      v64 = (void *)MEMORY[0x1E4FB1338];
      v65 = [MEMORY[0x1E4FB1308] absoluteDimension:v57];
      v66 = [MEMORY[0x1E4FB1308] absoluteDimension:v59];
      v67 = [v64 sizeWithWidthDimension:v65 heightDimension:v66];

      v68 = objc_msgSend(MEMORY[0x1E4FB12F8], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v67, *MEMORY[0x1E4FB2770], 1, 0.0, -4.0);
      [v53 addObject:v68];
      if (v84 != 1 && v10 <= 8)
      {
        v69 = (void *)MEMORY[0x1E4FB1338];
        v70 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        v71 = [MEMORY[0x1E4FB1308] absoluteDimension:18.0];
        v85 = [v69 sizeWithWidthDimension:v70 heightDimension:v71];

        v72 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v85 elementKind:@"ElementKindFooterSpacing" alignment:5];
        [v53 addObject:v72];
        v73 = (void *)MEMORY[0x1E4FB1338];
        v74 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        v75 = [MEMORY[0x1E4FB1308] absoluteDimension:PKUIPixelLength()];
        v76 = [v73 sizeWithWidthDimension:v74 heightDimension:v75];

        id v5 = v83;
        v77 = objc_msgSend(MEMORY[0x1E4FB12F8], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v76, *MEMORY[0x1E4FB2760], 5, 0.0, 18.0);
        objc_msgSend(v77, "setContentInsets:", 0.0, *(double *)(v80 + 40), 0.0, 0.0);
        [v53 addObject:v77];
      }
      v78 = (void *)[v53 copy];
      [v8 setBoundarySupplementaryItems:v78];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_resultsLayout
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB15C0]);

  return v2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 section];
  id v12 = (void *)*MEMORY[0x1E4FB2770];
  id v13 = v9;
  id v14 = v12;
  if (v14 == v13)
  {
  }
  else
  {
    v15 = v14;
    if (!v13 || !v14)
    {

      goto LABEL_9;
    }
    int v16 = [v13 isEqualToString:v14];

    if (!v16)
    {
LABEL_9:
      double v18 = (void *)*MEMORY[0x1E4FB2760];
      id v19 = v13;
      id v20 = v18;
      if (v20 == v19)
      {
      }
      else
      {
        double v21 = v20;
        if (!v13 || !v20)
        {

LABEL_18:
          double v23 = (__CFString *)v19;
          double v24 = v23;
          if (v23 == @"ElementKindHeaderSpacing"
            || v23
            && ((char v25 = [(__CFString *)v23 isEqualToString:@"ElementKindHeaderSpacing"],
                 v24,
                 (v25 & 1) != 0)
             || (double v26 = v24, v26 == @"ElementKindFooterSpacing")
             || (double v27 = v26,
                 int v28 = [(__CFString *)v26 isEqualToString:@"ElementKindFooterSpacing"],
                 v27,
                 v28)))
          {
            double v17 = [v8 dequeueReusableSupplementaryViewOfKind:v24 withReuseIdentifier:v24 forIndexPath:v10];
          }
          else
          {
            double v17 = 0;
          }
          goto LABEL_27;
        }
        int v22 = [v19 isEqualToString:v20];

        if (!v22) {
          goto LABEL_18;
        }
      }
      double v17 = [v8 dequeueReusableSupplementaryViewOfKind:v19 withReuseIdentifier:@"separatorIdentifier" forIndexPath:v10];
      if (self->_usingThumbnailLayout) {
        [MEMORY[0x1E4FB1618] separatorColor];
      }
      else {
      double v29 = [MEMORY[0x1E4FB1618] clearColor];
      }
      [v17 setBackgroundColor:v29];

      goto LABEL_27;
    }
  }
  double v17 = [v8 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:@"titleIdentifier" forIndexPath:v10];
  [(PKSearchResultsViewController *)self _configureHeaderView:v17 inSection:v11];
LABEL_27:

  return v17;
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1uLL:
      if (!PKFinHealthTagsSectionEnabled() || ![(NSArray *)self->_transactionTags count]) {
        goto LABEL_5;
      }
      id v7 = @"SEARCH_TITLE_SUGGESTIONS";
      goto LABEL_8;
    case 2uLL:
      id v7 = @"SEARCH_TITLE_PAYMENT_PASSES";
      goto LABEL_8;
    case 3uLL:
      id v7 = @"SEARCH_TITLE_BARCODE_PASSES";
LABEL_8:
      id v9 = PKLocalizedString(&v7->isa);
      id v8 = 0;
      goto LABEL_9;
    case 4uLL:
      id v9 = PKLocalizedString(&cfstr_SearchTitleCat.isa);
      NSUInteger v11 = [(NSArray *)self->_categories count];
      BOOL v12 = v11 >= 3;
      BOOL v10 = v11 < 3;
      uint64_t v13 = 3;
      goto LABEL_15;
    case 5uLL:
      id v9 = PKLocalizedString(&cfstr_SearchTitleMer.isa);
      NSUInteger v14 = [(NSArray *)self->_merchants count];
      BOOL v10 = v14 < 3;
      id v8 = (void *)(4 * (v14 > 2));
      break;
    case 6uLL:
      id v9 = PKLocalizedString(&cfstr_SearchTitleTra.isa);
      NSUInteger v15 = [(NSArray *)self->_transactions count];
      BOOL v12 = v15 >= 3;
      BOOL v10 = v15 < 3;
      uint64_t v13 = 5;
      goto LABEL_15;
    case 7uLL:
      id v9 = PKLocalizedString(&cfstr_SearchTitlePeo.isa);
      NSUInteger v16 = [(NSArray *)self->_people count];
      BOOL v12 = v16 >= 3;
      BOOL v10 = v16 < 3;
      uint64_t v13 = 6;
      goto LABEL_15;
    case 8uLL:
      id v9 = PKLocalizedString(&cfstr_SearchTitleLoc.isa);
      NSUInteger v17 = [(NSArray *)self->_locations count];
      BOOL v12 = v17 >= 3;
      BOOL v10 = v17 < 3;
      uint64_t v13 = 7;
LABEL_15:
      if (v12) {
        id v8 = (void *)v13;
      }
      else {
        id v8 = 0;
      }
      break;
    default:
LABEL_5:
      id v8 = 0;
      id v9 = 0;
LABEL_9:
      BOOL v10 = 1;
      break;
  }
  if (self->_usingThumbnailLayout) {
    [(PKSearchResultsViewController *)self _thumbnailInset];
  }
  else {
    double v18 = 18.0;
  }
  [v6 setHorizontalInset:v18];
  [v6 setTitle:v9];
  if (v10 || self->_usingThumbnailLayout)
  {
    [v6 setActionTitle:0];
  }
  else
  {
    id v19 = PKLocalizedString(&cfstr_SearchSeeAll.isa);
    [v6 setActionTitle:v19];

    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PKSearchResultsViewController__configureHeaderView_inSection___block_invoke;
    v20[3] = &unk_1E59CF720;
    objc_copyWeak(v21, &location);
    v21[1] = v8;
    [v6 setAction:v20];
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __64__PKSearchResultsViewController__configureHeaderView_inSection___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v27 = WeakRetained;
    double v3 = [WeakRetained _queryWithIdentifier:*((void *)WeakRetained + 143)];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = objc_alloc(MEMORY[0x1E4F850B8]);
      id v5 = [MEMORY[0x1E4F29128] UUID];
      id v6 = [v5 UUIDString];
      id v7 = [v3 keyboardLanguage];
      id v8 = [v3 passUniqueIdentifier];
      id v9 = (void *)[v4 initWithIdentifier:v6 keyboardLanguage:v7 passUniqueIdentifier:v8];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F84F90]);
      id v5 = [MEMORY[0x1E4F29128] UUID];
      id v6 = [v5 UUIDString];
      id v7 = [v3 keyboardLanguage];
      id v9 = (void *)[v10 initWithIdentifier:v6 keyboardLanguage:v7];
    }

    [v9 setType:*(void *)(a1 + 40)];
    NSUInteger v11 = [v3 text];
    [v9 setText:v11];

    BOOL v12 = [v3 tokens];
    [v9 setTokens:v12];

    uint64_t v13 = (os_unfair_lock_s *)(v27 + 1136);
    os_unfair_lock_lock((os_unfair_lock_t)v27 + 284);
    uint64_t v14 = [*((id *)v27 + 144) indexOfObject:v9];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_16;
    }
    uint64_t v15 = v14;
    NSUInteger v16 = [*((id *)v27 + 144) objectAtIndex:v14];
    NSUInteger v17 = (id *)v27;
    if (v27[1176])
    {
      double v18 = [v16 identifier];
      id v19 = (void *)*((void *)v27 + 143);
      id v20 = v18;
      id v21 = v19;
      if (v20 == v21)
      {

        goto LABEL_13;
      }
      int v22 = v21;
      if (v20 && v21)
      {
        char v23 = [v20 isEqualToString:v21];

        NSUInteger v17 = (id *)v27;
        if ((v23 & 1) == 0) {
          goto LABEL_15;
        }
LABEL_13:

        os_unfair_lock_unlock(v13);
        id v9 = v16;
LABEL_17:

        WeakRetained = v27;
        goto LABEL_18;
      }

      NSUInteger v17 = (id *)v27;
    }
LABEL_15:
    [v17[144] removeObjectAtIndex:v15];

LABEL_16:
    uint64_t v24 = [v9 identifier];
    char v25 = (void *)*((void *)v27 + 143);
    *((void *)v27 + 143) = v24;

    v27[1176] = 1;
    [*((id *)v27 + 144) addObject:v9];
    os_unfair_lock_unlock(v13);
    uint64_t v26 = *((void *)v27 + 159) + 1;
    *((void *)v27 + 159) = v26;
    *((void *)v27 + 160) = v26;
    v27[1328] = 0;
    [*((id *)v27 + 134) searchWithQuery:v9];
    [v27 _initiateSeeAllPresentationForQuery:v9];
    goto LABEL_17;
  }
LABEL_18:
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_hasLoadedRequiredData) {
    return 9;
  }
  else {
    return 0;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PKSearchResultsViewController *)self _numberOfItemsInSection:a4];
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  double v3 = &OBJC_IVAR___PKSearchResultsViewController__categories;
  switch(a3)
  {
    case 0:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__suggestions;
      if (!self->_usingThumbnailLayout) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 1:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__transactionTags;
      goto LABEL_9;
    case 4:
      goto LABEL_9;
    case 5:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__merchants;
      goto LABEL_9;
    case 6:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__transactions;
      goto LABEL_9;
    case 7:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__people;
      goto LABEL_9;
    case 8:
      double v3 = &OBJC_IVAR___PKSearchResultsViewController__locations;
LABEL_9:
      int64_t result = [*(id *)((char *)&self->super.super.super.super.isa + *v3) count];
      break;
    default:
LABEL_3:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  switch([v7 section])
  {
    case 0:
      id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"suggestionIdentifier" forIndexPath:v7];
      suggestions = self->_suggestions;
      id v8 = v9;
      NSUInteger v11 = -[NSArray objectAtIndex:](suggestions, "objectAtIndex:", [v7 row]);
      [(PKSearchResultsViewController *)self _configureSuggestionCell:v8 withSuggestion:v11];

      goto LABEL_10;
    case 1:
      BOOL v12 = [v6 dequeueReusableCellWithReuseIdentifier:@"suggestionIdentifier" forIndexPath:v7];
      transactionTags = self->_transactionTags;
      id v8 = v12;
      NSUInteger v11 = -[NSArray objectAtIndex:](transactionTags, "objectAtIndex:", [v7 row]);
      uint64_t v14 = [v11 group];
      id v15 = objc_alloc_init(MEMORY[0x1E4F84FA8]);
      NSUInteger v16 = [v14 tag];
      [v15 setTag:v16];
      [(PKSearchResultsViewController *)self _configureSuggestionCell:v8 withSuggestion:v15];

      goto LABEL_10;
    case 4:
      BOOL usingThumbnailLayout = self->_usingThumbnailLayout;
      uint64_t v18 = 1208;
      goto LABEL_8;
    case 5:
      BOOL usingThumbnailLayout = self->_usingThumbnailLayout;
      uint64_t v18 = 1216;
      goto LABEL_8;
    case 6:
      transactionPresenter = self->_transactionPresenter;
      int v22 = -[NSArray objectAtIndex:](self->_transactions, "objectAtIndex:", [v7 row]);
      char v23 = transactionPresenter;
      goto LABEL_13;
    case 7:
      BOOL usingThumbnailLayout = self->_usingThumbnailLayout;
      uint64_t v18 = 1232;
      goto LABEL_8;
    case 8:
      BOOL usingThumbnailLayout = self->_usingThumbnailLayout;
      uint64_t v18 = 1224;
LABEL_8:
      id v19 = *(Class *)((char *)&self->super.super.super.super.isa + v18);
      if (usingThumbnailLayout)
      {
        thumbnailPresenter = self->_thumbnailPresenter;
        NSUInteger v11 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v7, "row"));
        id v8 = [(PKTransactionGroupThumbnailPresenter *)thumbnailPresenter cellForItem:v11 inCollectionView:v6 atIndexPath:v7];
LABEL_10:

        [v8 setWantsCustomAppearance:1];
      }
      else
      {
        transactionGroupPresenter = self->_transactionGroupPresenter;
        int v22 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v7, "row"));
        char v23 = transactionGroupPresenter;
LABEL_13:
        id v8 = [v23 cellForItem:v22 inCollectionView:v6 atIndexPath:v7];

LABEL_14:
        [v8 setWantsCustomAppearance:0];
        -[PKSearchResultsViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v8, [v7 row] == 0, objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v7, "section")) == objc_msgSend(v7, "row") + 1);
      }

      return v8;
    default:
      goto LABEL_14;
  }
}

- (void)_configureSuggestionCell:(id)a3 withSuggestion:(id)a4
{
  id v12 = 0;
  id v13 = 0;
  transactionGroupPresenter = self->_transactionGroupPresenter;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKTransactionGroupItemPresenter *)transactionGroupPresenter contactResolver];
  PKSearchAutoCompletionTextAndImageFromSuggestion(&v13, &v12, 0, v6, v8);

  id v9 = v13;
  id v10 = v12;

  [v7 setIcon:v10];
  [v7 setSuggestion:v9];

  [v7 setShowsBottomSeparator:1];
  NSUInteger v11 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v11];
}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v11 = v7;
  uint64_t v8 = 3;
  if (!v6 || !v5) {
    uint64_t v8 = 1;
  }
  uint64_t v9 = 2;
  if (!v5) {
    uint64_t v9 = 0;
  }
  if (v6) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  [v7 setMaskType:v10];
  [v11 setShowsBottomSeparator:!v5];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (!self->_queryHasNoResults)
  {
    id v14 = 0;
    [(PKSearchResultsViewController *)self _setContentUnavailableConfiguration:0];
    goto LABEL_15;
  }
  id v4 = (void *)MEMORY[0x1E4FB1658];
  id v5 = a3;
  BOOL v6 = [v4 searchConfiguration];
  id v14 = [v6 updatedConfigurationForState:v5];

  id v7 = [(PKSearchQuery *)self->_queryForCurrentResults text];
  if (([(PKSearchQuery *)self->_queryForCurrentResults isEmpty] & 1) == 0)
  {
    uint64_t v8 = PKLocalizedString(&cfstr_SearchNoResult.isa);
    if (self->_fullResultsNotAvailable)
    {
      uint64_t v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
      uint64_t v10 = [v9 localizedDescription];
      PKLocalizedString(&cfstr_SearchNoResult_0.isa, &stru_1EF1B4C70.isa, v10);
      goto LABEL_8;
    }
    if (!self->_hasSearchableContent)
    {
      uint64_t v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
      uint64_t v10 = [v9 localizedDescription];
      PKLocalizedString(&cfstr_SearchNoResult_1.isa, &stru_1EF1B4C70.isa, v10);
      goto LABEL_8;
    }
    if ([v7 length])
    {
      uint64_t v13 = PKLocalizedString(&cfstr_SearchNoResult_2.isa, &stru_1EF1B4C70.isa, v7);

      id v11 = PKLocalizedString(&cfstr_SearchNoResult_3.isa);
      uint64_t v8 = (void *)v13;
      goto LABEL_14;
    }
    id v12 = @"SEARCH_NO_RESULTS_SUBTITLE_NO_TEXT";
LABEL_10:
    id v11 = PKLocalizedString(&v12->isa);
    goto LABEL_14;
  }
  uint64_t v8 = PKLocalizedString(&cfstr_SearchNoSugges.isa);
  if (!self->_fullResultsNotAvailable)
  {
    id v12 = @"SEARCH_NO_SUGGESTIONS_SUBTITLE_NO_CONTENT";
    goto LABEL_10;
  }
  uint64_t v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  uint64_t v10 = [v9 localizedDescription];
  PKLocalizedString(&cfstr_SearchNoSugges_0.isa, &stru_1EF1B4C70.isa, v10);
  id v11 = LABEL_8:;

LABEL_14:
  [v14 setText:v8];
  [v14 setSecondaryText:v11];

  [(PKSearchResultsViewController *)self _setContentUnavailableConfiguration:v14];
LABEL_15:
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch([v8 section])
  {
    case 0:
      uint64_t v9 = -[NSArray objectAtIndex:](self->_suggestions, "objectAtIndex:", [v8 row]);
      [(PKSearchResultsViewController *)self _configureSuggestionCell:self->_sampleSuggestionCell withSuggestion:v9];
      sampleSuggestionCell = self->_sampleSuggestionCell;
      [v7 bounds];
      -[PKSearchSuggestionCollectionViewCell sizeThatFits:](sampleSuggestionCell, "sizeThatFits:", v11, 3.40282347e38);
      double v13 = v12;
      double v15 = v14;
      goto LABEL_4;
    case 1:
      uint64_t v9 = -[NSArray objectAtIndex:](self->_transactionTags, "objectAtIndex:", [v8 row]);
      NSUInteger v16 = [v9 group];
      id v17 = objc_alloc_init(MEMORY[0x1E4F84FA8]);
      uint64_t v18 = [v16 tag];
      [v17 setTag:v18];

      [(PKSearchResultsViewController *)self _configureSuggestionCell:self->_sampleSuggestionCell withSuggestion:v17];
      id v19 = self->_sampleSuggestionCell;
      [v7 bounds];
      -[PKSearchSuggestionCollectionViewCell sizeThatFits:](v19, "sizeThatFits:", v20, 3.40282347e38);
      double v13 = v21;
      double v15 = v22;

LABEL_4:
      break;
    case 4:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      uint64_t v24 = 1208;
      goto LABEL_12;
    case 5:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      uint64_t v24 = 1216;
      goto LABEL_12;
    case 6:
      char v25 = &OBJC_IVAR___PKSearchResultsViewController__transactionPresenter;
      goto LABEL_11;
    case 7:
      char v25 = &OBJC_IVAR___PKSearchResultsViewController__transactionGroupPresenter;
LABEL_11:
      transactionGroupPresenter = *(PKTransactionGroupItemPresenter **)((char *)&self->super.super.super.super.isa + *v25);
      uint64_t v24 = v25[20];
      goto LABEL_12;
    case 8:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      uint64_t v24 = 1224;
LABEL_12:
      uint64_t v26 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v24), "objectAtIndex:", objc_msgSend(v8, "row"));
      [(PKTransactionGroupItemPresenter *)transactionGroupPresenter sizeForItem:v26 inCollectionView:v7 atIndexPath:v8];
      double v13 = v27;
      double v15 = v28;

      break;
    default:
      double v13 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }

  double v29 = v13;
  double v30 = v15;
  result.height = v30;
  result.width = v29;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 numberOfItemsInSection:a5];
  if (a5 && v8)
  {
    [(PKSearchResultsViewController *)self _configureHeaderView:self->_sampleHeaderView inSection:a5];
    sampleHeaderView = self->_sampleHeaderView;
    [v7 bounds];
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v10, 3.40282347e38);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6 = a3;
  id v7 = v6;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!a5 && ![v6 numberOfItemsInSection:0])
  {
    [v7 bounds];
    double v8 = v10;
    double v9 = 20.0;
  }

  double v11 = v8;
  double v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a3;
  double v8 = *MEMORY[0x1E4FB2848];
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([v6 numberOfItemsInSection:a5] >= 1)
  {
    unint64_t v11 = a5 + 1;
    while (v11 <= 8)
    {
      if ([v6 numberOfItemsInSection:v11++])
      {
        double v9 = 20.0;
        double v10 = 0.0;
        double v7 = 0.0;
        double v8 = 0.0;
        break;
      }
    }
  }

  double v13 = v8;
  double v14 = v7;
  double v15 = v9;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (self->_usingThumbnailLayout)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 1;
    switch([v7 section])
    {
      case 0:
        break;
      case 4:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        uint64_t v11 = 1208;
        goto LABEL_11;
      case 5:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        uint64_t v11 = 1216;
        goto LABEL_11;
      case 6:
        double v12 = &OBJC_IVAR___PKSearchResultsViewController__transactionPresenter;
        goto LABEL_9;
      case 7:
        double v12 = &OBJC_IVAR___PKSearchResultsViewController__transactionGroupPresenter;
LABEL_9:
        transactionGroupPresenter = *(PKTransactionGroupItemPresenter **)((char *)&self->super.super.super.super.isa
                                                                        + *v12);
        uint64_t v11 = v12[20];
        goto LABEL_11;
      case 8:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        uint64_t v11 = 1224;
LABEL_11:
        double v13 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v11), "objectAtIndex:", objc_msgSend(v8, "row"));
        char v9 = [(PKTransactionGroupItemPresenter *)transactionGroupPresenter canSelectItem:v13 inCollectionView:v6 atIndexPath:v8];

        break;
      default:
        char v9 = 0;
        break;
    }
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  unint64_t v9 = self->_presentationCounter + 1;
  self->_presentationCounter = v9;
  if (self->_usingThumbnailLayout || ![v7 section])
  {
    double v10 = [(PKSearchResultsViewController *)self _searchController];
    uint64_t v11 = [v10 searchBar];
    double v12 = [v11 searchTextField];
  }
  else
  {
    double v12 = 0;
  }
  double v13 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  double v14 = [v13 associatedAccountServiceAccountIdentifier];
  v89 = v14;
  if ([v13 hasAssociatedPeerPaymentAccount])
  {
    uint64_t v15 = 1;
  }
  else if ([v14 length])
  {
    double v16 = [(NSDictionary *)self->_accountsPerIdentifier objectForKey:v14];
    uint64_t v17 = [v16 feature];
    if (v17 == 2) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v17 == 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  v90 = v8;
  uint64_t v18 = [v8 section];
  id v19 = 0;
  id v20 = 0;
  id v21 = 0;
  switch(v18)
  {
    case 0:
      double v22 = -[NSArray objectAtIndex:](self->_suggestions, "objectAtIndex:", [v90 row]);
      id v110 = 0;
      id v111 = 0;
      char v23 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
      PKSearchAutoCompletionTextAndImageFromSuggestion(&v111, &v110, 1, v22, v23);
      id v19 = v111;
      id v20 = v110;

      id v24 = v22;
      if ([v24 tokenType] == 9)
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v24 tag];
        uint64_t v26 = v86 = v24;
        double v27 = v13;
        id v28 = v6;
        uint64_t v29 = [v26 type];

        double v30 = [NSNumber numberWithInteger:v29];
        objc_super v31 = _MergedGlobals_1_16[0]();
        [v25 setObject:v30 forKey:v31];

        id v6 = v28;
        double v13 = v27;

        v32 = [NSNumber numberWithInteger:v15];
        v33 = off_1EC33AE78[0]();
        [v25 setObject:v32 forKey:v33];

        uint64_t v34 = [NSNumber numberWithInteger:2];
        v35 = off_1EC33AE80[0]();
        [v25 setObject:v34 forKey:v35];

        searchSuggestionController = self->_searchSuggestionController;
        double v37 = (void *)[v25 copy];
        [(FHSearchSuggestionController *)searchSuggestionController recordUserInteraction:v37];

        id v24 = v86;
        id v21 = v86;
        goto LABEL_37;
      }
      id v21 = v24;
      goto LABEL_38;
    case 1:
      v82 = v12;
      id v84 = v6;
      double v38 = -[NSArray objectAtIndex:](self->_transactionTags, "objectAtIndex:", [v90 row]);
      double v39 = [v38 group];
      id v40 = objc_alloc_init(MEMORY[0x1E4F84FA8]);
      v41 = [v39 tag];
      [v40 setTag:v41];

      id v105 = 0;
      id v106 = 0;
      v42 = v40;
      v43 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
      PKSearchAutoCompletionTextAndImageFromSuggestion(&v106, &v105, 1, v42, v43);
      id v19 = v106;
      id v20 = v105;

      id v44 = [v39 tag];
      uint64_t v45 = [v44 type];

      v87 = v38;
      v83 = v39;
      if (v45 == 19)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F84FB8]);
        [v21 setTransactionType:10];
      }
      else
      {
        id v21 = v42;
      }
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v58 = [v42 tag];
      uint64_t v59 = [v58 type];

      objc_super v60 = [NSNumber numberWithInteger:v59];
      v61 = _MergedGlobals_1_16[0]();
      [v57 setObject:v60 forKey:v61];

      v62 = [NSNumber numberWithInteger:v15];
      uint64_t v63 = off_1EC33AE78[0]();
      [v57 setObject:v62 forKey:v63];

      v64 = [NSNumber numberWithInteger:1];
      v65 = off_1EC33AE80[0]();
      [v57 setObject:v64 forKey:v65];

      v66 = self->_searchSuggestionController;
      v67 = (void *)[v57 copy];
      [(FHSearchSuggestionController *)v66 recordUserInteraction:v67];

      id v6 = v84;
      double v12 = v82;
      goto LABEL_36;
    case 4:
      v46 = v90;
      v87 = -[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", [v90 row]);
      uint64_t v51 = [v87 group];
      v48 = (void *)v51;
      if (self->_usingThumbnailLayout)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F84FB0]);
        [v21 setGroup:v48];
        v108 = 0;
        id v109 = 0;
        v49 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v109, &v108, 1, v21, v49);
        id v19 = v109;
        v50 = v108;
        goto LABEL_27;
      }
      v83 = (void *)v51;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v69 = -[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", [v90 row]);
      v70 = [(PKSearchResultsViewController *)self navigationController];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v107[3] = &unk_1E59D3D28;
      v107[4] = self;
      v107[5] = v9;
      v71 = v107;
      goto LABEL_35;
    case 5:
      v46 = v90;
      v87 = -[NSArray objectAtIndex:](self->_merchants, "objectAtIndex:", [v90 row]);
      uint64_t v52 = [v87 group];
      v48 = (void *)v52;
      if (self->_usingThumbnailLayout)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F84FB0]);
        [v21 setGroup:v48];
        v103 = 0;
        id v104 = 0;
        v49 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v104, &v103, 1, v21, v49);
        id v19 = v104;
        v50 = v103;
        goto LABEL_27;
      }
      v83 = (void *)v52;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v69 = -[NSArray objectAtIndex:](self->_merchants, "objectAtIndex:", [v90 row]);
      v70 = [(PKSearchResultsViewController *)self navigationController];
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
      v102[3] = &unk_1E59D3D28;
      v102[4] = self;
      v102[5] = v9;
      v71 = v102;
      goto LABEL_35;
    case 6:
      transactionPresenter = self->_transactionPresenter;
      id v54 = -[NSArray objectAtIndex:](self->_transactions, "objectAtIndex:", [v90 row]);
      v55 = [(PKSearchResultsViewController *)self navigationController];
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
      v101[3] = &unk_1E59D3D28;
      v101[4] = self;
      v101[5] = v9;
      [(PKDashboardPaymentTransactionItemPresenter *)transactionPresenter didSelectItem:v54 inCollectionView:v6 atIndexPath:v90 navigationController:v55 canPresent:v101];

      id v19 = 0;
      id v20 = 0;
      id v21 = 0;
      goto LABEL_51;
    case 7:
      v46 = v90;
      v87 = -[NSArray objectAtIndex:](self->_people, "objectAtIndex:", [v90 row]);
      uint64_t v47 = [v87 group];
      v48 = (void *)v47;
      if (self->_usingThumbnailLayout)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F84FB0]);
        [v21 setGroup:v48];
        v99 = 0;
        id v100 = 0;
        v49 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v100, &v99, 1, v21, v49);
        id v19 = v100;
        v50 = v99;
        goto LABEL_27;
      }
      v83 = (void *)v47;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v69 = -[NSArray objectAtIndex:](self->_people, "objectAtIndex:", [v90 row]);
      v70 = [(PKSearchResultsViewController *)self navigationController];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
      v98[3] = &unk_1E59D3D28;
      v98[4] = self;
      v98[5] = v9;
      v71 = v98;
      goto LABEL_35;
    case 8:
      v46 = v90;
      v87 = -[NSArray objectAtIndex:](self->_locations, "objectAtIndex:", [v90 row]);
      uint64_t v56 = [v87 group];
      v48 = (void *)v56;
      if (self->_usingThumbnailLayout)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F84FB0]);
        [v21 setGroup:v48];
        v96 = 0;
        id v97 = 0;
        v49 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v97, &v96, 1, v21, v49);
        id v19 = v97;
        v50 = v96;
LABEL_27:
        id v25 = v48;
        id v20 = v50;

        id v24 = v87;
      }
      else
      {
        v83 = (void *)v56;
        transactionGroupPresenter = self->_transactionGroupPresenter;
        v69 = -[NSArray objectAtIndex:](self->_locations, "objectAtIndex:", [v90 row]);
        v70 = [(PKSearchResultsViewController *)self navigationController];
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5;
        v95[3] = &unk_1E59D3D28;
        v95[4] = self;
        v95[5] = v9;
        v71 = v95;
LABEL_35:
        [(PKTransactionGroupItemPresenter *)transactionGroupPresenter didSelectItem:v69 inCollectionView:v6 atIndexPath:v46 navigationController:v70 canPresent:v71];

        id v21 = 0;
        id v20 = 0;
        id v19 = 0;
LABEL_36:
        id v24 = v87;
        id v25 = v83;
      }
LABEL_37:

LABEL_38:
      if (!v19 || !v21) {
        goto LABEL_51;
      }
      id v85 = v6;
      v88 = v13;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v72 = v12;
      v73 = [v12 tokens];
      uint64_t v74 = [v73 countByEnumeratingWithState:&v91 objects:v112 count:16];
      if (!v74) {
        goto LABEL_48;
      }
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v92;
      break;
    default:
      goto LABEL_51;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v75; ++i)
    {
      if (*(void *)v92 != v76) {
        objc_enumerationMutation(v73);
      }
      v78 = [*(id *)(*((void *)&v91 + 1) + 8 * i) representedObject];
      char v79 = PKEqualObjects();

      if (v79)
      {

        id v6 = v85;
        double v12 = v72;
        goto LABEL_50;
      }
    }
    uint64_t v75 = [v73 countByEnumeratingWithState:&v91 objects:v112 count:16];
    if (v75) {
      continue;
    }
    break;
  }
LABEL_48:

  uint64_t v80 = [MEMORY[0x1E4FB1C08] tokenWithIcon:v20 text:v19];
  [v80 setRepresentedObject:v21];
  double v12 = v72;
  [v72 setText:&stru_1EF1B5B50];
  v81 = [v72 tokens];
  objc_msgSend(v72, "insertToken:atIndex:", v80, objc_msgSend(v81, "count"));

  id v6 = v85;
LABEL_50:
  double v13 = v88;
LABEL_51:
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 1272);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 1272);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return *(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 1272);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return *(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 1272);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return *(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 1272);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKSearchResultsViewController;
  [(PKSearchResultsViewController *)&v26 traitCollectionDidChange:v4];
  if (self->_hasLoadedRequiredData)
  {
    id v5 = [(PKSearchResultsViewController *)self traitCollection];
    transactionPresenter = self->_transactionPresenter;
    id v7 = [(PKSearchResultsViewController *)self collectionView];
    [(PKDashboardPaymentTransactionItemPresenter *)transactionPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v5 inCollectionView:v7];

    transactionGroupPresenter = self->_transactionGroupPresenter;
    unint64_t v9 = [(PKSearchResultsViewController *)self collectionView];
    [(PKTransactionGroupItemPresenter *)transactionGroupPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v5 inCollectionView:v9];

    thumbnailPresenter = self->_thumbnailPresenter;
    uint64_t v11 = [(PKSearchResultsViewController *)self collectionView];
    [(PKTransactionGroupThumbnailPresenter *)thumbnailPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v5 inCollectionView:v11];

    if (!v4 || !v5) {
      goto LABEL_8;
    }
    double v12 = [v4 preferredContentSizeCategory];
    double v13 = [v5 preferredContentSizeCategory];
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, (UIContentSizeCategory)v13))
    {
    }
    else
    {
      uint64_t v14 = [v4 userInterfaceStyle];
      uint64_t v15 = [v5 userInterfaceStyle];

      if (v14 == v15)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    double v16 = [PKDashboardTitleHeaderView alloc];
    double v17 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v21 = -[PKDashboardTitleHeaderView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
    sampleHeaderView = self->_sampleHeaderView;
    self->_sampleHeaderView = v21;

    char v23 = -[PKSearchSuggestionCollectionViewCell initWithFrame:]([PKSearchSuggestionCollectionViewCell alloc], "initWithFrame:", v17, v18, v19, v20);
    sampleSuggestionCell = self->_sampleSuggestionCell;
    self->_sampleSuggestionCell = v23;

    id v25 = [(PKSearchResultsViewController *)self collectionView];
    [v25 reloadData];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ++self->_presentationCounter;
  id v5 = [v4 searchBar];
  id v6 = [v5 textInputMode];
  id v7 = [v6 primaryLanguage];

  double v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];

  uint64_t v10 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v44 = (void *)v9;
  v42 = (void *)v10;
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = objc_alloc(MEMORY[0x1E4F850B8]);
    double v13 = [v11 uniqueID];
    uint64_t v14 = (void *)[v12 initWithIdentifier:v9 keyboardLanguage:v7 passUniqueIdentifier:v13];
  }
  else
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F84F90]) initWithIdentifier:v9 keyboardLanguage:v7];
  }
  id v43 = v4;
  uint64_t v15 = [v4 searchBar];
  double v16 = [v15 text];
  [v14 setText:v16];

  double v17 = [v5 searchTextField];
  double v18 = [v17 tokens];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v45 + 1) + 8 * i) representedObject];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v22);
  }

  if ([v19 count])
  {
    objc_super v26 = (void *)[v19 copy];
    [v14 setTokens:v26];
  }
  else
  {
    [v14 setTokens:0];
  }
  os_unfair_lock_lock(&self->_lockQuery);
  BOOL queryInProgress = self->_queryInProgress;
  os_unfair_lock_unlock(&self->_lockQuery);
  id v28 = [(PKSearchResultsViewController *)self _queryWithIdentifier:self->_currentQueryIdentifier];
  char v29 = PKEqualObjects();

  if (queryInProgress && (v29 & 1) != 0)
  {
    objc_super v31 = v5;
    double v30 = v43;
  }
  else
  {
    os_unfair_lock_lock(&self->_lockQuery);
    uint64_t v32 = [(NSMutableOrderedSet *)self->_lastQueries indexOfObject:v14];
    lastQueries = self->_lastQueries;
    if (v32 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableOrderedSet *)lastQueries addObject:v14];
      uint64_t v34 = self->_currentQueryIdentifier;
      v35 = 0;
    }
    else
    {
      double v36 = -[NSMutableOrderedSet objectAtIndex:](lastQueries, "objectAtIndex:");

      lastResultsPerQueryIdentifier = self->_lastResultsPerQueryIdentifier;
      double v38 = [v36 identifier];
      v35 = [(NSMutableDictionary *)lastResultsPerQueryIdentifier objectForKey:v38];

      uint64_t v34 = 0;
      uint64_t v14 = v36;
    }
    objc_msgSend(v14, "identifier", 1176);
    double v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentQueryIdentifier = self->_currentQueryIdentifier;
    self->_currentQueryIdentifier = v39;

    os_unfair_lock_unlock(&self->_lockQuery);
    double v30 = v43;
    if (v35)
    {
      [(PKSearchResultsViewController *)self _updateUIWithResults:v35 forQuery:v14 completion:0];
      objc_super v31 = v5;
    }
    else
    {
      objc_super v31 = v5;
      if (v34) {
        [(PKSearchService *)self->_searchService cancelQueryWithIdentifier:v34];
      }
      os_unfair_lock_lock(&self->_lockQuery);
      *((unsigned char *)&self->super.super.super.super.isa + v41) = 1;
      os_unfair_lock_unlock(&self->_lockQuery);
      self->_queryIsReplay = 0;
      [(PKSearchService *)self->_searchService searchWithQuery:v14];
    }
  }
}

- (void)searchDidCompleteWithError:(id)a3 results:(id)a4 forIdentifier:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  double v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lockQuery);
  uint64_t v11 = self->_currentQueryIdentifier;
  id v12 = (NSString *)v10;
  double v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (!v12 || !v11)
  {

    goto LABEL_9;
  }
  BOOL v14 = [(NSString *)v11 isEqualToString:v12];

  if (v14) {
LABEL_7:
  }
    self->_BOOL queryInProgress = 0;
LABEL_9:
  os_unfair_lock_unlock(&self->_lockQuery);
  if (v8)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v54 = v8;
      __int16 v55 = 2112;
      uint64_t v56 = v13;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Error %@ for query %@", buf, 0x16u);
    }

    double v16 = [(NSString *)v8 domain];
    double v17 = (void *)*MEMORY[0x1E4F87D10];
    id v18 = v16;
    id v19 = v17;
    if (v18 == v19)
    {
    }
    else
    {
      id v20 = v19;
      if (!v18 || !v19)
      {

        goto LABEL_21;
      }
      int v21 = [v18 isEqualToString:v19];

      if (!v21) {
        goto LABEL_21;
      }
    }
    BOOL v22 = [(NSString *)v8 code] == 5;

    if (v22)
    {
      id v18 = v9;
      id v9 = objc_alloc_init(MEMORY[0x1E4F84F98]);
LABEL_21:
    }
  }
  if (v9 && [(NSString *)v8 code] != 4)
  {
    uint64_t v23 = [(PKSearchResultsViewController *)self _queryWithIdentifier:v13];
    if (v23)
    {
      objc_initWeak((id *)buf, self);
      char v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      switch([v23 type])
      {
        case 0:
          [(PKSearchResultsViewController *)self _saveResults:v9 forQuery:v23];
          self->_hasReceivedResults = 1;
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke;
          v49[3] = &unk_1E59CAEA8;
          v49[4] = self;
          id v50 = v23;
          [(PKSearchResultsViewController *)self _updateUIIfPossibleWithResults:v9 query:v50 completion:v49];

          uint64_t v25 = 0;
          goto LABEL_42;
        case 3:
          uint64_t v28 = [v9 categoryResults];
          goto LABEL_41;
        case 4:
          uint64_t v28 = [v9 merchantResults];
          goto LABEL_41;
        case 5:
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          double v30 = [v9 transactionResults];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v52 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v46 != v32) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v34 = [*(id *)(*((void *)&v45 + 1) + 8 * i) transaction];
                [v29 addObject:v34];
              }
              uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v52 count:16];
            }
            while (v31);
          }

          v35 = (void *)[v29 copy];
          double v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"transactionDate" ascending:0];
          uint64_t v51 = v36;
          double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
          uint64_t v26 = [v35 sortedArrayUsingDescriptors:v37];

          uint64_t v25 = 0;
          goto LABEL_43;
        case 6:
          uint64_t v28 = [v9 personResults];
LABEL_41:
          uint64_t v25 = v28;
LABEL_42:
          uint64_t v26 = 0;
LABEL_43:
          char v24 = 0;
          break;
        case 7:
          uint64_t v25 = [v9 locationResults];
          uint64_t v26 = 0;
          char v24 = 1;
          break;
        default:
          break;
      }
      if (v25 | v26)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke_2;
        v38[3] = &unk_1E59CE7E8;
        objc_copyWeak(&v43, (id *)buf);
        double v39 = v13;
        id v40 = (id)v25;
        char v44 = v24;
        id v41 = v23;
        id v42 = (id)v26;
        dispatch_async(MEMORY[0x1E4F14428], v38);

        objc_destroyWeak(&v43);
      }

      objc_destroyWeak((id *)buf);
    }
    else
    {
      double v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v13;
        _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Received results for unknown query identifier: %@", buf, 0xCu);
      }
    }
  }
}

void __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke(uint64_t a1, int a2)
{
  if (a2 && !*(unsigned char *)(*(void *)(a1 + 32) + 1328) && ![*(id *)(a1 + 40) type])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1369) = 1;
    id v3 = [*(id *)(a1 + 32) view];
    [v3 setNeedsLayout];
  }
}

void __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _isQueryIdentifierMatchingCurrentQuery:*(void *)(v1 + 32)]
      && v3[159] == v3[160])
    {
      v3[160] = 0;
      if (*(void *)(v1 + 40))
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id obj = *(id *)(v1 + 40);
        uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v23;
          do
          {
            uint64_t v8 = 0;
            uint64_t v20 = v6;
            do
            {
              if (*(void *)v23 != v7) {
                objc_enumerationMutation(obj);
              }
              id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
              id v10 = objc_msgSend(v9, "group", v20);
              [v4 addObject:v10];
              if (*(unsigned char *)(v1 + 72) && [v10 type] == 13)
              {
                uint64_t v11 = v7;
                id v12 = v4;
                uint64_t v13 = v1;
                BOOL v14 = (void *)v3[132];
                uint64_t v15 = [v9 group];
                double v16 = [v15 regions];
                double v17 = [v16 firstObject];
                id v18 = v14;
                uint64_t v1 = v13;
                id v4 = v12;
                uint64_t v7 = v11;
                uint64_t v6 = v20;
                [v18 updateCoordinatesForWorldRegionIfNeeded:v17];
              }
              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v6);
        }

        [v3 _udpateOrPresentSeeAllViewControllerForQuery:*(void *)(v1 + 48) groups:v4 transactions:0];
      }
      else if (*(void *)(v1 + 56))
      {
        objc_msgSend(v3, "_udpateOrPresentSeeAllViewControllerForQuery:groups:transactions:", *(void *)(v1 + 48), 0);
      }
    }
    else
    {
      id v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "See all query results arrived too late, user searched for something else, not presenting", buf, 2u);
      }
    }
  }
}

- (void)invalidateSearchResults
{
  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  [(NSMutableDictionary *)self->_lastResultsPerQueryIdentifier removeAllObjects];
  os_unfair_lock_unlock(p_lockQuery);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKSearchResultsViewController_invalidateSearchResults__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PKSearchResultsViewController_invalidateSearchResults__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _searchController];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) updateSearchResultsForSearchController:v2];
    id v2 = v3;
    *(unsigned char *)(*(void *)(a1 + 32) + 1328) = 1;
  }
}

- (id)_queryWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__23;
  double v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  lastQueries = self->_lastQueries;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PKSearchResultsViewController__queryWithIdentifier___block_invoke;
  v10[3] = &unk_1E59D3D50;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  [(NSMutableOrderedSet *)lastQueries enumerateObjectsUsingBlock:v10];
  os_unfair_lock_unlock(p_lockQuery);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __54__PKSearchResultsViewController__queryWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [v13 identifier];
  id v8 = *(void **)(a1 + 32);
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  id v11 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_9;
  }
  int v12 = [v9 isEqualToString:v10];

  if (v12)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
LABEL_9:
}

- (BOOL)_isQueryIdentifierMatchingCurrentQuery:(id)a3
{
  id v4 = a3;
  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  uint64_t v6 = self->_currentQueryIdentifier;
  os_unfair_lock_unlock(p_lockQuery);
  id v7 = v6;
  id v8 = (NSString *)v4;
  id v9 = v8;
  if (v7 == v8)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    if (v8 && v7) {
      char v10 = [(NSString *)v7 isEqualToString:v8];
    }
  }

  return v10;
}

- (void)_saveResults:(id)a3 forQuery:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lockQuery);
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = [v6 identifier];
  currentQueryIdentifier = self->_currentQueryIdentifier;
  currentResults = v7;
  char v10 = currentQueryIdentifier;
  if (currentResults == (PKSearchResults *)v10)
  {

    goto LABEL_8;
  }
  id v11 = v10;
  if (!currentResults || !v10)
  {

    goto LABEL_10;
  }
  int v12 = [(PKSearchResults *)currentResults isEqualToString:v10];

  if (v12)
  {
LABEL_8:
    id v13 = (PKSearchResults *)v19;
    currentResults = self->_currentResults;
    self->_currentResults = v13;
LABEL_10:
  }
  lastResultsPerQueryIdentifier = self->_lastResultsPerQueryIdentifier;
  uint64_t v15 = [v6 identifier];
  [(NSMutableDictionary *)lastResultsPerQueryIdentifier setObject:v19 forKey:v15];

  if ([(NSMutableDictionary *)self->_lastResultsPerQueryIdentifier count] == 10)
  {
    double v16 = [(NSMutableOrderedSet *)self->_lastQueries objectAtIndex:0];
    double v17 = self->_lastResultsPerQueryIdentifier;
    id v18 = [v16 identifier];
    [(NSMutableDictionary *)v17 removeObjectForKey:v18];

    [(NSMutableOrderedSet *)self->_lastQueries removeObjectAtIndex:0];
  }
LABEL_13:
  os_unfair_lock_unlock(&self->_lockQuery);
}

- (id)_groupItemForTransactionGroup:(id)a3 tokens:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  [(PKDashboardPaymentTransactionGroupItem *)v8 setGroup:v7];

  [(PKDashboardPaymentTransactionGroupItem *)v8 setTokens:v6];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setFamilyCollection:self->_familyCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setTransactionSourceCollection:self->_transactionSourceCollection];
  id v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  char v10 = v9;
  if (v9)
  {
    id v11 = [v9 associatedAccountServiceAccountIdentifier];
    int v12 = [(NSDictionary *)self->_accountsPerIdentifier objectForKey:v11];
    [(PKDashboardPaymentTransactionGroupItem *)v8 setAccount:v12];

    id v13 = [(NSDictionary *)self->_accountUserCollectionsPerIdentifier objectForKey:v11];
    [(PKDashboardPaymentTransactionGroupItem *)v8 setAccountUserCollection:v13];

    BOOL v14 = [(NSDictionary *)self->_physicalCardsPerIdentifier objectForKey:v11];
    [(PKDashboardPaymentTransactionGroupItem *)v8 setPhysicalCards:v14];
  }

  return v8;
}

- (void)_updateUIWithResults:(id)a3 forQuery:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    queuePrepareResults = self->_queuePrepareResults;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke;
    v12[3] = &unk_1E59CB728;
    v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    id v15 = v10;
    dispatch_async(queuePrepareResults, v12);
  }
}

void __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke(id *a1)
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] identifier];
  LODWORD(v2) = [v2 _isQueryIdentifierMatchingCurrentQuery:v3];

  if (v2)
  {
    id v111 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = [a1[5] tokens];
    uint64_t v5 = [a1[6] categoryResults];

    if (v5)
    {
      id v6 = [a1[6] categoryResults];
      BOOL v109 = [v6 count] != 0;

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v8 = [a1[6] categoryResults];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v166 objects:v176 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v167;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v167 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = a1[4];
            id v14 = [*(id *)(*((void *)&v166 + 1) + 8 * i) group];
            id v15 = [v13 _groupItemForTransactionGroup:v14 tokens:v4];

            [v7 addObject:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v166 objects:v176 count:16];
        }
        while (v10);
      }
    }
    else
    {
      id v7 = 0;
      BOOL v109 = 0;
    }
    id v18 = objc_msgSend(a1[6], "transactionResults", v7);

    v119 = (void *)v4;
    if (v18)
    {
      id v19 = [a1[6] transactionResults];
      uint64_t v20 = [v19 count];

      char v21 = v109;
      if (v20) {
        char v21 = 1;
      }
      char v110 = v21;
      id v116 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id obj = [a1[6] transactionResults];
      uint64_t v120 = [obj countByEnumeratingWithState:&v162 objects:v175 count:16];
      if (v120)
      {
        uint64_t v117 = *(void *)v163;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v163 != v117) {
              objc_enumerationMutation(obj);
            }
            long long v23 = *(void **)(*((void *)&v162 + 1) + 8 * v22);
            long long v24 = [v23 transaction];
            long long v25 = [v23 passUniqueIdentifier];
            uint64_t v26 = [*((id *)a1[4] + 141) paymentPass];
            double v27 = v26;
            if (v26)
            {
              id v28 = v26;
LABEL_24:
              id v29 = [v24 accountIdentifier];
              double v30 = [*((id *)a1[4] + 138) objectForKey:v29];
              [*((id *)a1[4] + 139) objectForKey:v29];
              v122 = v27;
              uint64_t v31 = v28;
              v33 = uint64_t v32 = v25;
              uint64_t v34 = [[PKDashboardPaymentTransactionItem alloc] initWithTransactionSourceCollection:*((void *)a1[4] + 141) familyCollection:*((void *)a1[4] + 133) transaction:v24 account:v30 accountUserCollection:v33 bankConnectInstitution:0];
              [v116 addObject:v34];

              long long v25 = v32;
              double v27 = v122;
              goto LABEL_25;
            }
            uint64_t v35 = [*((id *)a1[4] + 157) objectForKey:v25];
            id v28 = (id)v35;
            if (v25)
            {
              [v111 addObject:v25];
              if (v28) {
                goto LABEL_24;
              }
              double v36 = [*((id *)a1[4] + 136) passWithUniqueID:v25];
              id v28 = [v36 paymentPass];

              if (v28)
              {
                [*((id *)a1[4] + 157) setObject:v28 forKey:v25];
                goto LABEL_24;
              }
            }
            else if (v35)
            {
              goto LABEL_24;
            }
LABEL_25:

            ++v22;
          }
          while (v120 != v22);
          uint64_t v37 = [obj countByEnumeratingWithState:&v162 objects:v175 count:16];
          uint64_t v120 = v37;
        }
        while (v37);
      }

      uint64_t v4 = (uint64_t)v119;
      char v38 = v110;
    }
    else
    {
      id v116 = 0;
      char v38 = v109;
    }
    double v39 = [a1[6] merchantResults];

    if (v39)
    {
      id v40 = [a1[6] merchantResults];
      uint64_t v41 = [v40 count];

      if (v41) {
        char v38 = 1;
      }
      id v123 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v42 = [a1[6] merchantResults];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v158 objects:v174 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v159;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v159 != v45) {
              objc_enumerationMutation(v42);
            }
            id v47 = a1[4];
            long long v48 = [*(id *)(*((void *)&v158 + 1) + 8 * j) group];
            v49 = [v47 _groupItemForTransactionGroup:v48 tokens:v4];

            [v123 addObject:v49];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v158 objects:v174 count:16];
        }
        while (v44);
      }
    }
    else
    {
      id v123 = 0;
    }
    id v50 = [a1[6] personResults];

    if (v50)
    {
      uint64_t v51 = [a1[6] personResults];
      uint64_t v52 = [v51 count];

      if (v52) {
        char v53 = 1;
      }
      else {
        char v53 = v38;
      }
      id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      id v54 = [a1[6] personResults];
      uint64_t v55 = [v54 countByEnumeratingWithState:&v154 objects:v173 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v155;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v155 != v57) {
              objc_enumerationMutation(v54);
            }
            id v59 = a1[4];
            objc_super v60 = [*(id *)(*((void *)&v154 + 1) + 8 * k) group];
            v61 = [v59 _groupItemForTransactionGroup:v60 tokens:v4];

            [v121 addObject:v61];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v154 objects:v173 count:16];
        }
        while (v56);
      }

      char v38 = v53;
    }
    else
    {
      id v121 = 0;
    }
    v62 = [a1[6] locationResults];

    if (v62)
    {
      uint64_t v63 = [a1[6] locationResults];
      uint64_t v64 = [v63 count];

      if (v64) {
        char v38 = 1;
      }
      id v118 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id obja = [a1[6] locationResults];
      uint64_t v65 = [obja countByEnumeratingWithState:&v150 objects:v172 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v151;
        do
        {
          for (uint64_t m = 0; m != v66; ++m)
          {
            if (*(void *)v151 != v67) {
              objc_enumerationMutation(obja);
            }
            id v69 = a1[4];
            v70 = [*(id *)(*((void *)&v150 + 1) + 8 * m) group];
            v71 = [v69 _groupItemForTransactionGroup:v70 tokens:v119];

            [v118 addObject:v71];
            v72 = (void *)*((void *)a1[4] + 132);
            v73 = [v71 group];
            uint64_t v74 = [v73 regions];
            uint64_t v75 = [v74 firstObject];
            [v72 updateCoordinatesForWorldRegionIfNeeded:v75];
          }
          uint64_t v66 = [obja countByEnumeratingWithState:&v150 objects:v172 count:16];
        }
        while (v66);
      }
    }
    else
    {
      id v118 = 0;
    }
    id objb = [a1[6] suggestedAutocompleteTokens];
    if ([objb count])
    {
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v76 = objb;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v146 objects:v171 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v147;
        do
        {
          for (uint64_t n = 0; n != v78; ++n)
          {
            if (*(void *)v147 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = *(void **)(*((void *)&v146 + 1) + 8 * n);
            if (![v81 tokenType])
            {
              v82 = [v81 group];
              if ([v82 type] == 13)
              {
                v83 = (void *)*((void *)a1[4] + 132);
                id v84 = [v82 regions];
                id v85 = [v84 firstObject];
                [v83 updateCoordinatesForWorldRegionIfNeeded:v85];
              }
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v146 objects:v171 count:16];
        }
        while (v78);
      }

      char v38 = 1;
    }
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v87 = [a1[6] transactionTagResults];

    if (v87)
    {
      v88 = [a1[6] transactionTagResults];
      uint64_t v89 = [v88 count];

      if (v89) {
        char v38 = 1;
      }
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      v90 = [a1[6] transactionTagResults];
      uint64_t v91 = [v90 countByEnumeratingWithState:&v142 objects:v170 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v143;
        do
        {
          for (iuint64_t i = 0; ii != v92; ++ii)
          {
            if (*(void *)v143 != v93) {
              objc_enumerationMutation(v90);
            }
            v95 = *(void **)(*((void *)&v142 + 1) + 8 * ii);
            v96 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
            id v97 = [v95 group];
            [(PKDashboardPaymentTransactionGroupItem *)v96 setGroup:v97];

            [v86 addObject:v96];
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v142 objects:v170 count:16];
        }
        while (v92);
      }
    }
    v98 = (void *)*((void *)a1[4] + 157);
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_2;
    v140[3] = &unk_1E59D3D78;
    id v141 = v111;
    id v112 = v111;
    v99 = [v98 keysOfEntriesPassingTest:v140];
    id v100 = (void *)*((void *)a1[4] + 157);
    v101 = [v99 allObjects];
    [v100 removeObjectsForKeys:v101];

    objc_initWeak(&location, a1[4]);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_3;
    v126[3] = &unk_1E59D3DA0;
    objc_copyWeak(&v137, &location);
    id v136 = a1[7];
    id v127 = a1[5];
    id v128 = v108;
    id v129 = a1[4];
    id v130 = v116;
    id v131 = v123;
    id v132 = v121;
    id v133 = v118;
    id v134 = v86;
    id v135 = a1[6];
    char v138 = v38;
    id v102 = v86;
    id v103 = v118;
    id v104 = v121;
    id v105 = v123;
    id v106 = v116;
    id v107 = v108;
    dispatch_async(MEMORY[0x1E4F14428], v126);

    objc_destroyWeak(&v137);
    objc_destroyWeak(&location);

    double v17 = v119;
  }
  else
  {
    id v16 = a1[7];
    if (!v16) {
      return;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_245;
    block[3] = &unk_1E59CAA98;
    id v125 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
    double v17 = v125;
  }
}

uint64_t __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained
    && ([*(id *)(a1 + 32) identifier],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [WeakRetained _isQueryIdentifierMatchingCurrentQuery:v3],
        v3,
        v4))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = [v5 copy];
      id v7 = (void *)*((void *)WeakRetained + 151);
      *((void *)WeakRetained + 151) = v6;
    }
    id v8 = TransactionIdentifierFromItems(*(void **)(*(void *)(a1 + 48) + 1200));
    uint64_t v9 = TransactionIdentifierFromItems(*(void **)(a1 + 56));
    if (*(void *)(a1 + 56) && (PKEqualObjects() & 1) == 0)
    {
      uint64_t v10 = [*(id *)(a1 + 56) copy];
      uint64_t v11 = (void *)*((void *)WeakRetained + 150);
      *((void *)WeakRetained + 150) = v10;
    }
    int v12 = *(void **)(a1 + 64);
    if (v12)
    {
      uint64_t v13 = [v12 copy];
      id v14 = (void *)*((void *)WeakRetained + 152);
      *((void *)WeakRetained + 152) = v13;
    }
    id v15 = *(void **)(a1 + 72);
    if (v15)
    {
      uint64_t v16 = [v15 copy];
      double v17 = (void *)*((void *)WeakRetained + 154);
      *((void *)WeakRetained + 154) = v16;
    }
    id v18 = *(void **)(a1 + 80);
    if (v18)
    {
      uint64_t v19 = [v18 copy];
      uint64_t v20 = (void *)*((void *)WeakRetained + 153);
      *((void *)WeakRetained + 153) = v19;
    }
    char v21 = *(void **)(a1 + 88);
    if (v21)
    {
      uint64_t v22 = [v21 copy];
      long long v23 = (void *)*((void *)WeakRetained + 155);
      *((void *)WeakRetained + 155) = v22;
    }
    uint64_t v24 = [*(id *)(a1 + 96) suggestedAutocompleteTokens];
    long long v25 = (void *)*((void *)WeakRetained + 156);
    *((void *)WeakRetained + 156) = v24;

    objc_storeStrong((id *)WeakRetained + 145, *(id *)(a1 + 32));
    if (*(unsigned char *)(a1 + 120)) {
      BOOL v26 = *((unsigned char *)WeakRetained + 1304) != 0;
    }
    else {
      BOOL v26 = 1;
    }
    *((unsigned char *)WeakRetained + 1304) = *(unsigned char *)(a1 + 120) ^ 1;
    if (*(unsigned char *)(a1 + 120))
    {
      *((unsigned char *)WeakRetained + 1305) = 1;
      *((unsigned char *)WeakRetained + 1306) = 1;
    }
    else
    {
      *((unsigned char *)WeakRetained + 1305) = [*((id *)WeakRetained + 134) canProvideFullResults] ^ 1;
      int v28 = [*((id *)WeakRetained + 134) hasSearchableContentForQuery:*(void *)(a1 + 32)];
      *((unsigned char *)WeakRetained + 1306) = v28;
      id v29 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        double v30 = @"YES";
        if (*((unsigned char *)WeakRetained + 1305)) {
          uint64_t v31 = @"YES";
        }
        else {
          uint64_t v31 = @"NO";
        }
        if (!v28) {
          double v30 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        __int16 v50 = 2112;
        uint64_t v51 = v30;
        _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Empty results set, full results not available: %@, has content: %@", buf, 0x16u);
      }
    }
    if ([WeakRetained isViewLoaded])
    {
      if (v26) {
        [WeakRetained _setNeedsUpdateContentUnavailableConfiguration];
      }
      uint64_t v32 = [WeakRetained collectionView];
      int v33 = [*(id *)(a1 + 32) isEmpty];
      [v32 reloadData];
      if (*((unsigned char *)WeakRetained + 1368))
      {
        if (!v33 || !*(unsigned char *)(a1 + 120))
        {
          *((unsigned char *)WeakRetained + 1368) = 0;
          uint64_t v34 = [WeakRetained _resultsLayout];
          [v32 setCollectionViewLayout:v34 animated:0];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v35 = objc_msgSend(v32, "subviews", 0);
          uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v44 != v38) {
                  objc_enumerationMutation(v35);
                }
                [*(id *)(*((void *)&v43 + 1) + 8 * i) removeFromSuperview];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
            }
            while (v37);
          }

          id v40 = [WeakRetained _resultsLayout];
          [v32 setCollectionViewLayout:v40 animated:0];

          [v32 reloadData];
        }
      }
      else if (v33 && *(unsigned char *)(a1 + 120))
      {
        *((unsigned char *)WeakRetained + 1368) = 1;
        uint64_t v41 = [WeakRetained _thumbnailLayout];
        [v32 setCollectionViewLayout:v41 animated:0];
      }
    }
    uint64_t v42 = *(void *)(a1 + 104);
    if (v42) {
      (*(void (**)(void))(v42 + 16))();
    }
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 104);
    if (v27) {
      (*(void (**)(void))(v27 + 16))();
    }
  }
}

uint64_t __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateUIIfPossibleWithResults:(id)a3 query:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9 && self->_hasReceivedResults && self->_hasLoadedRequiredData)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__PKSearchResultsViewController__updateUIIfPossibleWithResults_query_completion___block_invoke;
    v12[3] = &unk_1E59CAD18;
    v12[4] = self;
    id v13 = v10;
    [(PKSearchResultsViewController *)self _updateUIWithResults:v8 forQuery:v9 completion:v12];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __81__PKSearchResultsViewController__updateUIIfPossibleWithResults_query_completion___block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "First set of results presented", v8, 2u);
  }

  id v3 = [*(id *)(a1 + 32) collectionView];
  [v3 layoutIfNeeded];

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1376);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 1376);
    *(void *)(v5 + 1376) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)setQuery:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKSearchResultsViewController *)self _searchController];
  uint64_t v6 = [v5 searchBar];
  id v7 = [v6 searchTextField];

  if (v4)
  {
    uint64_t v19 = v7;
    uint64_t v20 = v5;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    char v21 = v4;
    id obj = [v4 tokens];
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
          id v23 = 0;
          id v24 = 0;
          id v14 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter contactResolver];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v24, &v23, 1, v13, v14);
          id v15 = v24;
          id v16 = v23;

          double v17 = [MEMORY[0x1E4FB1C08] tokenWithIcon:v16 text:v15];
          [v17 setRepresentedObject:v13];

          [v8 addObject:v17];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v7 = v19;
    [v19 setTokens:v8];
    id v4 = v21;
    id v18 = [v21 text];
    [v19 setText:v18];

    uint64_t v5 = v20;
  }
  else
  {
    [v7 setTokens:MEMORY[0x1E4F1CBF0]];
    [v7 setText:&stru_1EF1B5B50];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  pendingPreflightCompletiouint64_t n = self->_pendingPreflightCompletion;
  self->_pendingPreflightCompletiouint64_t n = v4;

  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v9 = [v8 languageCode];

  uint64_t v10 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F850B8]);
    uint64_t v12 = [v10 uniqueID];
    id v15 = (id)[v11 initWithIdentifier:v7 keyboardLanguage:v9 passUniqueIdentifier:v12];
  }
  else
  {
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F84F90]) initWithIdentifier:v7 keyboardLanguage:v9];
  }
  [v15 setText:&stru_1EF1B5B50];
  os_unfair_lock_lock(&self->_lockQuery);
  [(NSMutableOrderedSet *)self->_lastQueries addObject:v15];
  id v13 = [v15 identifier];
  currentQueryIdentifier = self->_currentQueryIdentifier;
  self->_currentQueryIdentifier = v13;

  self->_BOOL queryInProgress = 1;
  os_unfair_lock_unlock(&self->_lockQuery);
  self->_queryIsReplay = 0;
  [(PKSearchService *)self->_searchService searchWithQuery:v15];
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL foregroundActive = self->_foregroundActiveState.foregroundActive;
  self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)a4;
  if (!foregroundActive && (*(_WORD *)&a4 & 0x100) != 0 && self->_fullResultsNotAvailable) {
    [(PKSearchResultsViewController *)self invalidateSearchResults];
  }
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKSearchResultsViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKSearchResultsViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __50__PKSearchResultsViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1336);
  CGFloat v4 = *(double *)(v2 + 1344);
  CGFloat v5 = *(double *)(v2 + 1352);
  CGFloat v6 = *(double *)(v2 + 1360);
  *(unsigned char *)(v2 + 1329) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v9 = (void *)(v8 + 1336);
  if (v7)
  {
    [v7 CGRectValue];
    *uint64_t v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)uint64_t v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1352) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1336), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __52__PKSearchResultsViewController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKSearchResultsViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __52__PKSearchResultsViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 167;
  CGFloat v4 = *((double *)v2 + 167);
  CGFloat v5 = *((double *)v2 + 168);
  CGFloat v6 = *((double *)v2 + 169);
  CGFloat v7 = *((double *)v2 + 170);
  [*(id *)(a1 + 40) CGRectValue];
  *CGFloat v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1336), v13);
}

- (void)keyboardWillHide:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PKSearchResultsViewController_keyboardWillHide___block_invoke;
  v3[3] = &unk_1E59CADE0;
  v3[4] = self;
  [(PKSearchResultsViewController *)self _updateLayoutForKeyboardAction:v3];
}

BOOL __50__PKSearchResultsViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1336);
  *(unsigned char *)(v1 + 1329) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1336);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1336);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1344);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1352);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1360);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKSearchResultsViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __64__PKSearchResultsViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E59CA7D0;
        id v9 = v6;
        [v7 _animateUsingDefaultTimingWithOptions:134 animations:v8 completion:0];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __64__PKSearchResultsViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)worldRegionUpdated:(id)a3 updatedRegion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKSearchResultsViewController_worldRegionUpdated_updatedRegion___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __66__PKSearchResultsViewController_worldRegionUpdated_updatedRegion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1224);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v3) {
    goto LABEL_17;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v43;
  while (2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v4 + v5;
    do
    {
      if (*(void *)v43 != v6) {
        objc_enumerationMutation(v2);
      }
      id v9 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v9 group];
      LODWORD(v10) = [v10 _updateGroup:v11 withRegion:*(void *)(a1 + 40)];

      if (v10)
      {
        uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 + v7 inSection:8];
        CGRect v13 = [*(id *)(a1 + 32) collectionView];
        long long v14 = [v13 cellForItemAtIndexPath:v12];

        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = *(char **)(a1 + 32);
            uint64_t v16 = 1048;
LABEL_15:
            double v17 = *(void **)&v15[v16];
            id v18 = [v15 collectionView];
            [v17 updateCell:v14 forItem:v9 inCollectionView:v18 atIndexPath:v12];

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = *(char **)(a1 + 32);
            uint64_t v16 = 1040;
            goto LABEL_15;
          }
        }
LABEL_16:

        goto LABEL_17;
      }
      ++v7;
    }
    while (v4 != v7);
    uint64_t v4 = [v2 countByEnumeratingWithState:&v42 objects:v48 count:16];
    uint64_t v5 = v8;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_17:

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 1160) locationTokens];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
LABEL_19:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v39 != v22) {
        objc_enumerationMutation(v19);
      }
      id v24 = *(void **)(a1 + 32);
      long long v25 = [*(id *)(*((void *)&v38 + 1) + 8 * v23) group];
      LOBYTE(v24) = [v24 _updateGroup:v25 withRegion:*(void *)(a1 + 40)];

      if (v24) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v21) {
          goto LABEL_19;
        }
        break;
      }
    }
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v26 = *(id *)(*(void *)(a1 + 32) + 1248);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
LABEL_27:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v35 != v29) {
        objc_enumerationMutation(v26);
      }
      uint64_t v31 = *(void **)(*((void *)&v34 + 1) + 8 * v30);
      if (!objc_msgSend(v31, "tokenType", (void)v34))
      {
        uint64_t v32 = [v31 group];
        char v33 = [*(id *)(a1 + 32) _updateGroup:v32 withRegion:*(void *)(a1 + 40)];

        if (v33) {
          break;
        }
      }
      if (v28 == ++v30)
      {
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v28) {
          goto LABEL_27;
        }
        break;
      }
    }
  }
}

- (BOOL)_updateGroup:(id)a3 withRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] == 13)
  {
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [v5 regions];
    id v9 = (void *)[v8 mutableCopy];

    if ([v9 count])
    {
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = [v9 objectAtIndex:v10];
        id v12 = [v11 identifier];
        id v13 = v7;
        long long v14 = v13;
        if (v12 == v13) {
          break;
        }
        if (v7 && v12)
        {
          char v15 = [v12 isEqualToString:v13];

          if (v15) {
            goto LABEL_14;
          }
        }
        else
        {
        }
        if (++v10 >= (unint64_t)[v9 count]) {
          goto LABEL_11;
        }
      }

LABEL_14:
      [v9 replaceObjectAtIndex:v10 withObject:v6];
      double v17 = (void *)[v9 copy];
      [v5 setRegions:v17];

      BOOL v16 = 1;
    }
    else
    {
LABEL_11:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_initiateSeeAllPresentationForQuery:(id)a3
{
  id v4 = a3;
  id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  seeAllPresentationTimer = self->_seeAllPresentationTimer;
  self->_seeAllPresentationTimer = v5;

  seeAllPresentationCounter = (void *)self->_seeAllPresentationCounter;
  uint64_t v8 = self->_seeAllPresentationTimer;
  dispatch_time_t v9 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  objc_initWeak(&location, self);
  uint64_t v10 = self->_seeAllPresentationTimer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke;
  v12[3] = &unk_1E59CFBA8;
  objc_copyWeak(v14, &location);
  v14[1] = seeAllPresentationCounter;
  id v13 = v4;
  id v11 = v4;
  dispatch_source_set_event_handler(v10, v12);
  dispatch_resume((dispatch_object_t)self->_seeAllPresentationTimer);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *((void *)WeakRetained + 162);
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = (void *)v3[162];
      v3[162] = 0;
    }
    if (*(void *)(a1 + 48) == v3[160])
    {
      id v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke_2;
      v7[3] = &unk_1E59D3DC8;
      v7[4] = v3;
      id v8 = v6;
      [v3 _seeAllHeaderGroupForQuery:v8 groups:0 transactions:0 completion:v7];
    }
  }
}

void __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _historyViewControllerForQuery:*(void *)(a1 + 40) groups:0 headerGroup:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1288);
  *(void *)(v4 + 1288) = v3;

  id v6 = [*(id *)(a1 + 32) navigationController];
  [v6 pushViewController:*(void *)(*(void *)(a1 + 32) + 1288) animated:1];
}

- (void)_seeAllHeaderGroupForQuery:(id)a3 groups:(id)a4 transactions:(id)a5 completion:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v49 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F84D10]);
  [v13 setType:14];
  id v47 = v10;
  [v13 setSearchQuery:v10];
  long long v46 = v11;
  long long v48 = v12;
  if (v12)
  {
    objc_msgSend(v13, "setTransactionCount:", objc_msgSend(v12, "count"));
    long long v14 = v13;
    [v13 setTransactions:v12];
    char v15 = [v12 firstObject];
    BOOL v16 = [v15 transactionDate];
    [v14 setEndDate:v16];

    double v17 = [v48 lastObject];
    id v18 = [v17 transactionDate];
    [v14 setStartDate:v18];

    id v13 = v14;
    uint64_t v19 = (void (*)(void))v49[2];
LABEL_3:
    v19();
    goto LABEL_42;
  }
  long long v44 = self;
  if (!v11)
  {
    uint64_t v19 = (void (*)(void))v49[2];
    goto LABEL_3;
  }
  unint64_t v20 = [v10 type] - 3;
  if (v20 > 4) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = qword_1A0444200[v20];
  }
  long long v45 = v13;
  [v13 setSecondaryType:v21];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v11;
  uint64_t v53 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v53)
  {
    uint64_t v55 = 0;
    uint64_t v51 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v89 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if ([v23 type] == 13)
        {
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v56 = [v23 regions];
          uint64_t v54 = [v56 countByEnumeratingWithState:&v84 objects:v93 count:16];
          if (v54)
          {
            uint64_t v24 = *(void *)v85;
            uint64_t v50 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v85 != v24) {
                  objc_enumerationMutation(v56);
                }
                id v26 = *(void **)(*((void *)&v84 + 1) + 8 * j);
                long long v80 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v83 = 0u;
                id v27 = obj;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v92 count:16];
                if (v28)
                {
                  uint64_t v29 = *(void *)v81;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v28; ++k)
                    {
                      if (*(void *)v81 != v29) {
                        objc_enumerationMutation(v27);
                      }
                      uint64_t v31 = *(void **)(*((void *)&v80 + 1) + 8 * k);
                      if (v31 != v23)
                      {
                        uint64_t v32 = [v31 regions];
                        int v33 = [v26 isIncludedInRegions:v32];

                        if (v33)
                        {

                          goto LABEL_34;
                        }
                      }
                    }
                    uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v92 count:16];
                    if (v28) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v24 = v50;
              }
              uint64_t v54 = [v56 countByEnumeratingWithState:&v84 objects:v93 count:16];
              uint64_t v24 = v50;
            }
            while (v54);
          }
        }
        v55 += [v23 transactionCount];
LABEL_34:
        ;
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v53);
  }
  else
  {
    uint64_t v55 = 0;
  }

  [v45 setTransactionCount:v55];
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x3032000000;
  uint64_t v77 = __Block_byref_object_copy__23;
  uint64_t v78 = __Block_byref_object_dispose__23;
  id v79 = 0;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__23;
  v72 = __Block_byref_object_dispose__23;
  id v73 = 0;
  long long v34 = [v47 dateToken];
  id v35 = objc_alloc_init(MEMORY[0x1E4F84518]);
  if (v34)
  {
    uint64_t v36 = [v34 startDate];
    long long v37 = (void *)v75[5];
    v75[5] = v36;

    uint64_t v38 = [v34 endDate];
    id v39 = (id)v69[5];
    v69[5] = v38;
  }
  else
  {
    long long v40 = [(PKTransactionSourceCollection *)v44->_transactionSourceCollection transactionSourceIdentifiers];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke;
    v65[3] = &unk_1E59CC7D8;
    v65[4] = v44;
    id v41 = v40;
    id v66 = v41;
    uint64_t v67 = &v74;
    [v35 addOperation:v65];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_3;
    v62[3] = &unk_1E59CC7D8;
    v62[4] = v44;
    id v39 = v41;
    id v63 = v39;
    uint64_t v64 = &v68;
    [v35 addOperation:v62];
  }
  long long v42 = [MEMORY[0x1E4F1CA98] null];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_5;
  v57[3] = &unk_1E59D3E18;
  id v58 = v45;
  objc_super v60 = &v74;
  v61 = &v68;
  id v59 = v49;
  id v43 = (id)[v35 evaluateWithInput:v42 completion:v57];

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  id v13 = v45;
LABEL_42:
}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1[5];
  dispatch_time_t v9 = *(void **)(a1[4] + 1096);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_2;
  v13[3] = &unk_1E59CC828;
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v9 transactionsForTransactionSourceIdentifiers:v8 withTransactionSource:0 withBackingData:1 startDate:0 endDate:0 orderedByDate:-1 limit:1 completion:v13];
}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 anyObject];
  uint64_t v4 = [v3 transactionDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1[5];
  dispatch_time_t v9 = *(void **)(a1[4] + 1096);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_4;
  v13[3] = &unk_1E59CC828;
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v9 transactionsForTransactionSourceIdentifiers:v8 withTransactionSource:0 withBackingData:1 startDate:0 endDate:0 orderedByDate:1 limit:1 completion:v13];
}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 anyObject];
  uint64_t v4 = [v3 transactionDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_6;
  block[3] = &unk_1E59D3DF0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v7 = v2;
  uint64_t v9 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) setEndDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (id)_historyViewControllerForQuery:(id)a3 groups:(id)a4 headerGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  transactionSourceCollectiouint64_t n = self->_transactionSourceCollection;
  id v11 = a5;
  id v27 = [(PKTransactionSourceCollection *)transactionSourceCollection paymentPass];
  id v12 = [v27 associatedAccountServiceAccountIdentifier];
  uint64_t v26 = [(NSDictionary *)self->_accountsPerIdentifier objectForKey:v12];
  uint64_t v25 = [(NSDictionary *)self->_accountUserCollectionsPerIdentifier objectForKey:v12];
  id v13 = [(NSDictionary *)self->_physicalCardsPerIdentifier objectForKey:v12];
  uint64_t v14 = [v8 type];
  id v15 = [PKTransactionHistoryViewController alloc];
  uint64_t v16 = v15;
  if (v14 == 5)
  {
    id v18 = (void *)v25;
    double v17 = (void *)v26;
    uint64_t v19 = [(PKTransactionHistoryViewController *)v15 initWithTransactionGroup:v11 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:v26 accountUserCollection:v25 physicalCards:v13 fetcher:0 transactionHistory:0 detailViewStyle:0];
  }
  else
  {
    regionUpdater = self->_regionUpdater;
    transactionGroupPresenter = self->_transactionGroupPresenter;
    unint64_t v20 = [v8 tokens];
    id v18 = (void *)v25;
    double v17 = (void *)v26;
    uint64_t v19 = [(PKTransactionHistoryViewController *)v16 initWithTransactionGroups:v9 headerGroup:v11 groupPresenter:transactionGroupPresenter regionUpdater:regionUpdater tokens:v20 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:v26 accountUserCollection:v25 physicalCards:v13];
  }
  uint64_t v21 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter avatarManager];
  [(PKTransactionHistoryViewController *)v19 setContactAvatarManager:v21];

  return v19;
}

- (void)_udpateOrPresentSeeAllViewControllerForQuery:(id)a3 groups:(id)a4 transactions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PKSearchResultsViewController__udpateOrPresentSeeAllViewControllerForQuery_groups_transactions___block_invoke;
  v12[3] = &unk_1E59D3E40;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PKSearchResultsViewController *)self _seeAllHeaderGroupForQuery:v11 groups:v10 transactions:a5 completion:v12];
}

void __98__PKSearchResultsViewController__udpateOrPresentSeeAllViewControllerForQuery_groups_transactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = v3;
  if (*(void *)(v4 + 1288))
  {
    uint64_t v5 = [*(id *)(a1 + 40) type];
    id v6 = *(void **)(*(void *)(a1 + 32) + 1288);
    if (v5 == 5) {
      [v6 updateGroup:v12];
    }
    else {
      [v6 updateGroups:*(void *)(a1 + 48) headerGroup:v12];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v9 = *(void **)(v11 + 1288);
    *(void *)(v11 + 1288) = 0;
  }
  else
  {
    if (*(void *)(v4 + 1296))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v4 + 1296));
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 1296);
      *(void *)(v7 + 1296) = 0;

      id v3 = v12;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    id v9 = [(id)v4 _historyViewControllerForQuery:*(void *)(a1 + 40) groups:*(void *)(a1 + 48) headerGroup:v3];
    id v10 = [*(id *)(a1 + 32) navigationController];
    [v10 pushViewController:v9 animated:1];
  }
}

- (void)accountAdded:(id)a3
{
}

- (void)accountRemoved:(id)a3
{
}

- (void)accountChanged:(id)a3
{
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
}

- (void)_updateAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E59D0068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKAccountService *)accountService accountsWithCompletion:v7];
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1104);
  *(void *)(v2 + 1104) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1112);
  *(void *)(v4 + 1112) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1120);
  *(void *)(v6 + 1120) = 0;

  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__23;
  long long v42 = __Block_byref_object_dispose__23;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__23;
  v36[4] = __Block_byref_object_dispose__23;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__23;
  v34[4] = __Block_byref_object_dispose__23;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = [v12 accountIdentifier];
        [(id)v39[5] setObject:v12 forKey:v13];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_3;
        v27[3] = &unk_1E59CC7D8;
        v27[4] = *(void *)(a1 + 32);
        id v14 = v13;
        id v28 = v14;
        uint64_t v29 = v36;
        [v8 addOperation:v27];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_6;
        v24[3] = &unk_1E59CC7D8;
        v24[4] = *(void *)(a1 + 32);
        id v15 = v14;
        id v25 = v15;
        uint64_t v26 = v34;
        [v8 addOperation:v24];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_9;
  v19[3] = &unk_1E59D3EB8;
  v19[4] = *(void *)(a1 + 32);
  uint64_t v21 = &v38;
  uint64_t v22 = v36;
  uint64_t v23 = v34;
  id v20 = *(id *)(a1 + 48);
  id v17 = (id)[v8 evaluateWithInput:v16 completion:v19];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)a1[5];
  uint64_t v9 = *(void **)(a1[4] + 1080);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_4;
  v12[3] = &unk_1E59D3E90;
  uint64_t v16 = a1[6];
  id v14 = v6;
  id v15 = v7;
  id v13 = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 accountUsersForAccountWithIdentifier:v13 completion:v12];
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_5;
  block[3] = &unk_1E59D3E68;
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_6(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)a1[5];
  id v9 = *(void **)(a1[4] + 1080);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_7;
  v12[3] = &unk_1E59D3E90;
  uint64_t v16 = a1[6];
  id v14 = v6;
  id v15 = v7;
  id v13 = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 physicalCardsForAccountWithIdentifier:v13 completion:v12];
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_8;
  block[3] = &unk_1E59D3E68;
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_9(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) copy];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 1104);
  *(void *)(v3 + 1104) = v2;

  uint64_t v5 = [*(id *)(*(void *)(a1[7] + 8) + 40) copy];
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 1112);
  *(void *)(v6 + 1112) = v5;

  uint64_t v8 = [*(id *)(*(void *)(a1[8] + 8) + 40) copy];
  uint64_t v9 = a1[4];
  id v10 = *(void **)(v9 + 1120);
  *(void *)(v9 + 1120) = v8;

  uint64_t result = a1[5];
  if (result)
  {
    id v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKSearchResultsViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PKSearchResultsViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1064), obj);
    uint64_t v2 = [*(id *)(a1 + 40) collectionView];
    [v2 reloadData];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionController, 0);
  objc_storeStrong(&self->_pendingPreflightCompletion, 0);
  objc_storeStrong((id *)&self->_noResultsBodyLabel, 0);
  objc_storeStrong((id *)&self->_noResultsTitleLabel, 0);
  objc_storeStrong((id *)&self->_seeAllPresentationTimer, 0);
  objc_storeStrong((id *)&self->_seeAllHistoryVC, 0);
  objc_storeStrong((id *)&self->_passesForResults, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_transactionTags, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_queuePrepareResults, 0);
  objc_storeStrong((id *)&self->_lastResultsPerQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_queryForCurrentResults, 0);
  objc_storeStrong((id *)&self->_lastQueries, 0);
  objc_storeStrong((id *)&self->_currentQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_physicalCardsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountUserCollectionsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_searchService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_regionUpdater, 0);
  objc_storeStrong((id *)&self->_thumbnailPresenter, 0);
  objc_storeStrong((id *)&self->_transactionGroupPresenter, 0);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_sampleSuggestionCell, 0);

  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
}

@end