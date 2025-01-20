@interface PKMerchantTokensViewController
+ (id)_collectionViewLayout;
- (BOOL)_hasMoreUnfetchedMerchantTokens;
- (BOOL)_isLoadingRow:(id)a3;
- (BOOL)_isMerchantRow:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (PKMerchantTokensViewController)initWithPass:(id)a3 merchantTokensResponse:(id)a4;
- (PKMerchantTokensViewControllerDelegate)delegate;
- (id)_initialSnapshot;
- (id)_updateIdentifiersWithMerchantTokens:(id)a3;
- (id)_updatedSnapshotRemovingMerchantToken:(id)a3;
- (id)_updatedSnapshotWithMerchantTokens:(id)a3;
- (void)_deselectSelectedItemAnimated:(BOOL)a3;
- (void)_fetchNextPageOfMerchantTokens;
- (void)_setUpCollectionView;
- (void)_setUpSelf;
- (void)_setUpViews;
- (void)_trackButtonTapForMerchantToken:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKMerchantTokensViewController

- (PKMerchantTokensViewController)initWithPass:(id)a3 merchantTokensResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(id)objc_opt_class() _collectionViewLayout];
  v21.receiver = self;
  v21.super_class = (Class)PKMerchantTokensViewController;
  v10 = [(PKMerchantTokensViewController *)&v21 initWithCollectionViewLayout:v9];

  if (v10)
  {
    if (([v7 hasMerchantTokens] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to show PKMerchantTokensViewController for pass that has no merchant tokens."];
    }
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v10->_previousMerchantTokensResponse, a4);
    v11 = [v8 merchantTokens];
    v12 = (void *)[v11 mutableCopy];
    id v13 = v12;
    if (!v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    objc_storeStrong((id *)&v10->_merchantTokens, v13);
    if (!v12) {

    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    idsToMerchantTokens = v10->_idsToMerchantTokens;
    v10->_idsToMerchantTokens = v14;

    v10->_isFetchingMerchantTokens = 0;
    uint64_t v16 = [MEMORY[0x1E4F84D50] sharedService];
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v16;

    v10->_merchantIconsEnabled = PKMerchantTokensForceMerchantIconsEnabled();
    v18 = [(PKMerchantTokensViewController *)v10 navigationItem];
    v19 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokens.isa);
    [v18 setTitle:v19];

    [v18 setBackButtonDisplayMode:2];
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokensViewController;
  [(PKMerchantTokensViewController *)&v3 viewDidLoad];
  [(PKMerchantTokensViewController *)self _setUpViews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  if (!self->_previousMerchantTokensResponse) {
    [(PKMerchantTokensViewController *)self _fetchNextPageOfMerchantTokens];
  }
  [(PKMerchantTokensViewController *)self _deselectSelectedItemAnimated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokensViewController;
  [(PKMerchantTokensViewController *)&v10 viewDidAppear:a3];
  v4 = [(PKMerchantTokensViewController *)self collectionView];
  [v4 flashScrollIndicators];

  objc_super v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87038];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86640];
  v12[0] = *MEMORY[0x1E4F864A0];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v5 subject:v6 sendEvent:v9];
}

- (void)viewDidDisappear:(BOOL)a3
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokensViewController;
  [(PKMerchantTokensViewController *)&v10 viewDidDisappear:a3];
  if (([(PKMerchantTokensViewController *)self isBeingDismissed] & 1) != 0
    || [(PKMerchantTokensViewController *)self isMovingFromParentViewController])
  {
    v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87038];
    uint64_t v6 = *MEMORY[0x1E4F86380];
    uint64_t v7 = *MEMORY[0x1E4F86120];
    v11[0] = *MEMORY[0x1E4F86308];
    v11[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F860D0];
    v12[0] = v6;
    v12[1] = v8;
    void v11[2] = *MEMORY[0x1E4F86730];
    v12[2] = *MEMORY[0x1E4F86640];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    [v4 subject:v5 sendEvent:v9];
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKMerchantTokensViewController;
  [(PKMerchantTokensViewController *)&v5 viewWillLayoutSubviews];
  BOOL v3 = [(PKMerchantTokensViewController *)self collectionView];
  v4 = [(PKMerchantTokensViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PKMerchantTokensViewController *)self _isMerchantRow:v5])
  {
    uint64_t v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v5];
    uint64_t v7 = [(NSMutableDictionary *)self->_idsToMerchantTokens objectForKeyedSubscript:v6];
    [(PKMerchantTokensViewController *)self _trackButtonTapForMerchantToken:v7];
    uint64_t v8 = [[PKMerchantTokenDetailViewController alloc] initWithMerchantToken:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v10[3] = &unk_1E59CAEA8;
    v11 = v8;
    v12 = self;
    v9 = v8;
    [(PKMerchantTokenDetailViewController *)v9 preflightWithCompletion:v10];
  }
}

void __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v4[3] = &unk_1E59CA870;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) navigationController];
  [v2 pushViewController:*(void *)(a1 + 32) animated:1];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(PKMerchantTokensViewController *)self _isMerchantRow:a4];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  if (-[PKMerchantTokensViewController _isLoadingRow:](self, "_isLoadingRow:", a5, a4))
  {
    [(PKMerchantTokensViewController *)self _fetchNextPageOfMerchantTokens];
  }
}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  [(NSMutableArray *)self->_merchantTokens removeObject:v6];
  dataSource = self->_dataSource;
  uint64_t v8 = [(PKMerchantTokensViewController *)self _updatedSnapshotRemovingMerchantToken:v6];
  [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v8 animatingDifferences:1];

  v9 = [(PKMerchantTokensViewController *)self navigationController];
  if (!v9 || [(NSMutableArray *)self->_merchantTokens count])
  {
    id v10 = [v9 topViewController];
    if (v10)
    {
      if (v10 == v20
        || ([v20 parentViewController],
            id v11 = (id)objc_claimAutoreleasedReturnValue(),
            v11,
            v10 == v11))
      {
        id v12 = (id)[v9 popViewControllerAnimated:1];
      }
    }
    goto LABEL_10;
  }
  id v13 = [v9 viewControllers];
  uint64_t v14 = [v13 indexOfObject:self];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL
    || ([v9 viewControllers],
        v15 = objc_claimAutoreleasedReturnValue(),
        [(PKMerchantTokensViewController *)self parentViewController],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v15 indexOfObject:v16],
        v16,
        v15,
        v14 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v17 = [v9 viewControllers];
    id v10 = [v17 objectAtIndex:v14 - 1];

    id v18 = (id)[v9 popToViewController:v10 animated:1];
LABEL_10:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained merchantTokensViewController:self didDeleteMerchantToken:v6];
}

- (void)_setUpViews
{
  [(PKMerchantTokensViewController *)self _setUpSelf];

  [(PKMerchantTokensViewController *)self _setUpCollectionView];
}

- (void)_setUpSelf
{
}

- (void)_setUpCollectionView
{
  uint64_t v3 = [(PKMerchantTokensViewController *)self collectionView];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [v3 layoutMargins];
    objc_msgSend(v3, "setLayoutMargins:");
  }
  [v3 contentInset];
  objc_msgSend(v3, "setContentInset:");
  BOOL merchantIconsEnabled = self->_merchantIconsEnabled;
  id v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = objc_opt_class();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke;
  v31[3] = &__block_descriptor_33_e65_v32__0__PKMerchantTokenCell_8__NSIndexPath_16__PKMerchantToken_24l;
  BOOL v32 = merchantIconsEnabled;
  uint64_t v7 = [v5 registrationWithCellClass:v6 configurationHandler:v31];
  uint64_t v8 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v9 = objc_opt_class();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_2;
  v29[3] = &__block_descriptor_33_e65_v32__0__PKMerchantTokenLoadingCell_8__NSIndexPath_16__NSString_24l;
  BOOL v30 = merchantIconsEnabled;
  id v10 = [v8 registrationWithCellClass:v9 configurationHandler:v29];
  id v11 = [MEMORY[0x1E4FB15F8] registrationWithSupplementaryClass:objc_opt_class() elementKind:*MEMORY[0x1E4FB2760] configurationHandler:&__block_literal_global_190];
  objc_initWeak(&location, self);
  id v12 = objc_alloc(MEMORY[0x1E4FB1598]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_4;
  v24[3] = &unk_1E59DC078;
  objc_copyWeak(&v27, &location);
  id v13 = v7;
  id v25 = v13;
  id v14 = v10;
  id v26 = v14;
  v15 = (UICollectionViewDiffableDataSource *)[v12 initWithCollectionView:v3 cellProvider:v24];
  dataSource = self->_dataSource;
  self->_dataSource = v15;

  v17 = self->_dataSource;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_5;
  v22[3] = &unk_1E59DC0A0;
  id v18 = v11;
  id v23 = v18;
  [(UICollectionViewDiffableDataSource *)v17 setSupplementaryViewProvider:v22];
  v19 = [(PKMerchantTokensViewController *)self collectionView];
  [v19 setDataSource:self->_dataSource];

  id v20 = self->_dataSource;
  objc_super v21 = [(PKMerchantTokensViewController *)self _initialSnapshot];
  [(UICollectionViewDiffableDataSource *)v20 applySnapshot:v21 animatingDifferences:0];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 updateCellWithMerchantToken:a4 showMerchantIcon:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_2(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(result + 32)) {
    return [a2 useSmallHeight];
  }
  return result;
}

void __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 defaultContentConfiguration];
  uint64_t v3 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokens_0.isa);
  [v4 setText:v3];

  [v2 setContentConfiguration:v4];
}

id __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained _isMerchantRow:v8])
  {
    uint64_t v11 = [WeakRetained[131] objectForKeyedSubscript:v9];

    id v12 = (void *)(a1 + 32);
    id v9 = (id)v11;
  }
  else
  {
    id v12 = (void *)(a1 + 40);
  }
  id v13 = [v7 dequeueConfiguredReusableCellWithRegistration:*v12 forIndexPath:v8 item:v9];

  return v13;
}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(void *)(a1 + 32));
}

+ (id)_collectionViewLayout
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v2 setFooterMode:1];
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKMerchantTokensViewController__collectionViewLayout__block_invoke;
  v7[3] = &unk_1E59DC0C8;
  id v8 = v2;
  id v4 = v2;
  id v5 = (void *)[v3 initWithSectionProvider:v7];

  return v5;
}

id __55__PKMerchantTokensViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    [v3 setContentInsetsReference:4];
    [v3 contentInsets];
    objc_msgSend(v3, "setContentInsets:");
  }

  return v3;
}

- (id)_initialSnapshot
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKMerchantTokensViewController *)self _updateIdentifiersWithMerchantTokens:self->_merchantTokens];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v9[0] = @"MerchantTokenMainSection";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  [v4 appendItemsWithIdentifiers:v3];
  if ([(PKMerchantTokensViewController *)self _shouldShowLoadingRow])
  {
    id v8 = @"MerchantTokenLoadingCell";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [v4 appendItemsWithIdentifiers:v6];
  }

  return v4;
}

- (id)_updatedSnapshotWithMerchantTokens:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKMerchantTokensViewController *)self _updateIdentifiersWithMerchantTokens:a3];
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  v10[0] = @"MerchantTokenLoadingCell";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 deleteItemsWithIdentifiers:v6];

  [v5 appendItemsWithIdentifiers:v4];
  if ([(PKMerchantTokensViewController *)self _shouldShowLoadingRow])
  {
    id v9 = @"MerchantTokenLoadingCell";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [v5 appendItemsWithIdentifiers:v7];
  }

  return v5;
}

- (id)_updatedSnapshotRemovingMerchantToken:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 merchantTokenId];
  [(NSMutableDictionary *)self->_idsToMerchantTokens setObject:0 forKeyedSubscript:v4];
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  v8[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 deleteItemsWithIdentifiers:v6];

  return v5;
}

- (id)_updateIdentifiersWithMerchantTokens:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 merchantTokenId];
        if ([v11 length])
        {
          id v12 = [(NSMutableDictionary *)self->_idsToMerchantTokens objectForKeyedSubscript:v11];

          if (!v12)
          {
            [(NSMutableDictionary *)self->_idsToMerchantTokens setObject:v10 forKeyedSubscript:v11];
            [v14 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v14;
}

- (BOOL)_isLoadingRow:(id)a3
{
  id v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  char v4 = [v3 isEqualToString:@"MerchantTokenLoadingCell"];

  return v4;
}

- (BOOL)_isMerchantRow:(id)a3
{
  return ![(PKMerchantTokensViewController *)self _isLoadingRow:a3];
}

- (BOOL)_hasMoreUnfetchedMerchantTokens
{
  if (!self->_previousMerchantTokensResponse) {
    return 1;
  }
  unint64_t v3 = [(NSMutableArray *)self->_merchantTokens count];
  char v4 = [(PKRetrieveMerchantTokensResponse *)self->_previousMerchantTokensResponse totalMerchantTokens];
  BOOL v5 = v3 < [v4 integerValue];

  return v5;
}

- (void)_fetchNextPageOfMerchantTokens
{
  if ([(PKMerchantTokensViewController *)self _hasMoreUnfetchedMerchantTokens]
    && !self->_isFetchingMerchantTokens)
  {
    self->_isFetchingMerchantTokens = 1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F84F40]);
    [v3 setPass:self->_pass];
    char v4 = [(PKRetrieveMerchantTokensResponse *)self->_previousMerchantTokensResponse pageNumber];

    if (v4)
    {
      BOOL v5 = NSNumber;
      uint64_t v6 = [(PKRetrieveMerchantTokensResponse *)self->_previousMerchantTokensResponse pageNumber];
      uint64_t v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
      [v3 setPageNumber:v7];
    }
    uint64_t v8 = [(PKRetrieveMerchantTokensResponse *)self->_previousMerchantTokensResponse pageSize];

    if (v8)
    {
      id v9 = [(PKRetrieveMerchantTokensResponse *)self->_previousMerchantTokensResponse pageSize];
      [v3 setPageSize:v9];
    }
    objc_initWeak(&location, self);
    webService = self->_webService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke;
    void v11[3] = &unk_1E59DC0F0;
    objc_copyWeak(&v12, &location);
    [(PKPaymentWebService *)webService retrieveMerchantTokensWithRequest:v3 completion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1056) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_storeStrong(WeakRetained + 129, v4);
      uint64_t v5 = [*(id *)(a1 + 32) merchantTokens];
      id v6 = (void *)v5;
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
      if (v5) {
        id v7 = (void *)v5;
      }
      id v8 = v7;

      [v3[130] addObjectsFromArray:v8];
      id v9 = v3[127];
      id v10 = [v3 _updatedSnapshotWithMerchantTokens:v8];
      [v9 applySnapshot:v10 animatingDifferences:0];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = objc_msgSend(v3, "collectionView", 0);
      id v12 = [v11 indexPathsForVisibleItems];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            if ([v3 _isLoadingRow:*(void *)(*((void *)&v17 + 1) + 8 * v16)]) {
              [v3 _fetchNextPageOfMerchantTokens];
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)_deselectSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKMerchantTokensViewController *)self collectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [(PKMerchantTokensViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke;
      void v12[3] = &unk_1E59DC118;
      id v13 = v5;
      id v14 = v7;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke_2;
      v9[3] = &unk_1E59DC118;
      id v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [v5 deselectItemAtIndexPath:v7 animated:v3];
    }
  }
}

uint64_t __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:1];
}

uint64_t __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)_trackButtonTapForMerchantToken:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:*MEMORY[0x1E4F86380] forKey:*MEMORY[0x1E4F86308]];
  [v3 setValue:*MEMORY[0x1E4F86650] forKey:*MEMORY[0x1E4F86120]];
  [v3 setValue:*MEMORY[0x1E4F86640] forKey:*MEMORY[0x1E4F86730]];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87038] sendEvent:v3];
}

- (PKMerchantTokensViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKMerchantTokensViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_idsToMerchantTokens, 0);
  objc_storeStrong((id *)&self->_merchantTokens, 0);
  objc_storeStrong((id *)&self->_previousMerchantTokensResponse, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end