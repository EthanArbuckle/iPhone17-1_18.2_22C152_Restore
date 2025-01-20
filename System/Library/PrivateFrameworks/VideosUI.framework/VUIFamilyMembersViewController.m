@interface VUIFamilyMembersViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)lastCollectionViewSize;
- (NSDictionary)familyMemberHashToFamilyMemberDictionary;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (VUIFamilyMemberCell)sizingCell;
- (VUIFamilyMembersViewController)initWithDataSource:(id)a3;
- (VUIFamilyMembersViewControllerDelegate)delegate;
- (VUILegacyCollectionView)collectionView;
- (VUILibraryFamilyMembersDataSource)dataSource;
- (VUIViewControllerContentPresenter)contentPresenter;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)tvCellWidth;
- (id)_createCollectionView;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:(id)a3;
- (id)_getFamilyMemberIdentifiersFromFamilyMembers;
- (int64_t)gridStyle;
- (int64_t)gridType;
- (void)_clearCollectionViewSelections:(BOOL)a3;
- (void)_updateCurrentViewIfNeeded;
- (void)_updateLayoutForSizeIfNeeded:(CGSize)a3;
- (void)_updateNavigationBarPadding;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)registerForApplicationNotifications;
- (void)setCollectionView:(id)a3;
- (void)setContentPresenter:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFamilyMemberHashToFamilyMemberDictionary:(id)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setGridType:(int64_t)a3;
- (void)setLastCollectionViewSize:(CGSize)a3;
- (void)setSizingCell:(id)a3;
- (void)setTvCellWidth:(double)a3;
- (void)unregisterApplicationNotifications;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIFamilyMembersViewController

- (VUIFamilyMembersViewController)initWithDataSource:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VUIFamilyMembersViewController;
  v6 = [(VUIFamilyMembersViewController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    [(VUIViewControllerContentPresenter *)v7->_contentPresenter setLogName:@"VUIFamilyMembersViewController"];
    v7->_gridType = 1;
    v7->_gridStyle = 16;
    v7->_lastCollectionViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_itemWidthForGridStyle:gridType:", v7->_gridStyle, v7->_gridType);
    v7->_tvCellWidth = v10;
    objc_initWeak(&location, v7);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__VUIFamilyMembersViewController_initWithDataSource___block_invoke;
    v14[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v15, &location);
    id v12 = (id)[(VUIFamilyMembersViewController *)v7 registerForTraitChanges:v11 withHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__VUIFamilyMembersViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  v2 = [v1 collectionViewLayout];
  [v2 invalidateLayout];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)VUIFamilyMembersViewController;
  [(VUIFamilyMembersViewController *)&v12 loadView];
  v3 = +[VUILocalizationManager sharedInstance];
  v4 = [v3 localizedStringForKey:@"LIBRARY_FAMILY_SHARING"];
  [(VUIFamilyMembersViewController *)self setTitle:v4];

  id v5 = [(VUIFamilyMembersViewController *)self _createCollectionView];
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  v7 = [(VUIFamilyMembersViewController *)self _createDiffableDataSource];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v7;

  v9 = [(VUIFamilyMembersViewController *)self view];
  double v10 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [v9 setBackgroundColor:v10];

  v11 = [(VUIFamilyMembersViewController *)self contentPresenter];
  [v11 setRootViewForViewController:self];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)VUIFamilyMembersViewController;
  [(VUIFamilyMembersViewController *)&v13 viewDidLoad];
  v3 = [(VUIFamilyMembersViewController *)self dataSource];
  [v3 setDelegate:self];

  v4 = [(VUIFamilyMembersViewController *)self dataSource];
  [v4 startFetch];

  id v5 = [(VUIFamilyMembersViewController *)self contentPresenter];
  v6 = +[VUILocalizationManager sharedInstance];
  v7 = [v6 localizedStringForKey:@"LIBRARY_GENERIC_FETCH_ERROR_TITLE"];
  [v5 setNoContentErrorTitle:v7];

  v8 = [(VUIFamilyMembersViewController *)self contentPresenter];
  [v8 setCurrentContentViewType:1];

  v9 = [(VUIFamilyMembersViewController *)self contentPresenter];
  double v10 = [(VUIFamilyMembersViewController *)self collectionView];
  [v9 setContentView:v10];

  [(VUIFamilyMembersViewController *)self registerForApplicationNotifications];
  v11 = [(VUIFamilyMembersViewController *)self view];
  objc_super v12 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"FamilySharing\""];
  [v11 setAccessibilityIdentifier:v12];
}

- (void)dealloc
{
  [(VUIFamilyMembersViewController *)self unregisterApplicationNotifications];
  v3.receiver = self;
  v3.super_class = (Class)VUIFamilyMembersViewController;
  [(VUIFamilyMembersViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)VUIFamilyMembersViewController;
  [(VUIFamilyMembersViewController *)&v14 viewDidLayoutSubviews];
  objc_super v3 = [(VUIFamilyMembersViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(VUIFamilyMembersViewController *)self contentPresenter];
  objc_msgSend(v12, "configureCurrentViewFrameForBounds:", v5, v7, v9, v11);

  objc_super v13 = [(VUIFamilyMembersViewController *)self collectionView];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", v9, v11);
  [(VUIFamilyMembersViewController *)self _updateNavigationBarPadding];
}

- (void)registerForApplicationNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB3D80] object:0];
}

- (void)unregisterApplicationNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  double v4 = [(VUIFamilyMembersViewController *)self view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  double Width = CGRectGetWidth(v16);
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  double Height = CGRectGetHeight(v17);
  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", Width, Height);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIFamilyMembersViewController;
  id v7 = a4;
  -[VUIFamilyMembersViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__VUIFamilyMembersViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __85__VUIFamilyMembersViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 view];
  [v4 bounds];
  objc_msgSend(v1, "_updateLayoutForSizeIfNeeded:", v2, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(VUIFamilyMembersViewController *)self _clearCollectionViewSelections:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VUIFamilyMembersViewController;
  [(VUIFamilyMembersViewController *)&v11 viewDidAppear:a3];
  id v4 = [(VUIFamilyMembersViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", v6, v8);
  [(VUIFamilyMembersViewController *)self _updateNavigationBarPadding];
  objc_super v9 = [(VUIFamilyMembersViewController *)self navigationController];
  CGFloat v10 = [v9 navigationBar];
  [v10 sizeToFit];

  +[VUILibraryMetrics recordPageEventWithPageType:@"FamilySharingMembers"];
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = [(VUIFamilyMembersViewController *)self dataSource];
  double v5 = [v4 familyMembers];
  double v6 = (void *)[v5 copy];
  double v7 = [(VUIFamilyMembersViewController *)self _generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:v6];
  [(VUIFamilyMembersViewController *)self setFamilyMemberHashToFamilyMemberDictionary:v7];

  double v8 = [(VUIFamilyMembersViewController *)self _createDiffableDataSourceSnapshot];
  objc_super v9 = [(VUIFamilyMembersViewController *)self diffableDataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VUIFamilyMembersViewController_dataSourceDidFinishFetching___block_invoke;
  v10[3] = &unk_1E6DF3D58;
  v10[4] = self;
  [v9 applySnapshot:v8 animatingDifferences:1 completion:v10];
}

uint64_t __62__VUIFamilyMembersViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentViewIfNeeded];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(VUIFamilyMembersViewController *)self diffableDataSource];
  id v10 = [v6 itemIdentifierForIndexPath:v5];

  double v7 = [(VUIFamilyMembersViewController *)self familyMemberHashToFamilyMemberDictionary];
  double v8 = [v7 objectForKey:v10];

  objc_super v9 = [(VUIFamilyMembersViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 familyMemberViewController:self didSelectFamilyMember:v8];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  if (!self->_sizingCell)
  {
    double v7 = [VUIFamilyMemberCell alloc];
    double v8 = -[VUIFamilyMemberCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sizingCell = self->_sizingCell;
    self->_sizingCell = v8;
  }
  id v10 = [(VUIFamilyMembersViewController *)self collectionView];
  [v10 contentInset];
  double v12 = v11;
  double v14 = v13;

  id v15 = [(VUIFamilyMembersViewController *)self view];
  [v15 bounds];
  CGFloat v16 = CGRectGetWidth(v28) - v12 - v14;

  CGRect v17 = [(VUIFamilyMembersViewController *)self diffableDataSource];
  v18 = [v17 itemIdentifierForIndexPath:v6];

  v19 = [(VUIFamilyMembersViewController *)self familyMemberHashToFamilyMemberDictionary];
  v20 = [v19 objectForKey:v18];

  +[VUIFamilyMemberCell configureVUIFamilyMemberCell:self->_sizingCell withFamilyMember:v20 metricsOnly:1];
  [(VUIFamilyMemberCell *)self->_sizingCell configureMonogramImageLayoutForWindowWidth:v16];
  -[VUIFamilyMemberCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v16, 1.79769313e308);
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (id)_createCollectionView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  id v4 = [VUILegacyCollectionView alloc];
  id v5 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUILegacyCollectionView *)v5 setAutoresizingMask:18];
  [(VUILegacyCollectionView *)v5 setShowsHorizontalScrollIndicator:0];
  [(VUILegacyCollectionView *)v5 setShowsVerticalScrollIndicator:0];
  [(VUILegacyCollectionView *)v5 setAlwaysBounceVertical:1];
  [(VUILegacyCollectionView *)v5 setOpaque:0];
  [(VUILegacyCollectionView *)v5 setBackgroundColor:0];
  [(VUILegacyCollectionView *)v5 setDelegate:self];
  [(VUILegacyCollectionView *)v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"FamilyMemberCellIdentifier"];

  return v5;
}

- (id)_createDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v4 = [(VUIFamilyMembersViewController *)self collectionView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VUIFamilyMembersViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E6DF8D98;
  objc_copyWeak(&v8, &location);
  id v5 = (void *)[v3 initWithCollectionView:v4 cellProvider:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __59__VUIFamilyMembersViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  double v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"FamilyMemberCellIdentifier" forIndexPath:v8];

  double v12 = [WeakRetained familyMemberHashToFamilyMemberDictionary];
  double v13 = [v12 objectForKey:v7];

  +[VUIFamilyMemberCell configureVUIFamilyMemberCell:v11 withFamilyMember:v13 metricsOnly:0];
  double v14 = [WeakRetained view];
  [v14 bounds];
  [v11 configureMonogramImageLayoutForWindowWidth:CGRectGetWidth(v17)];

  return v11;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v7[0] = @"FamilyMemberSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUIFamilyMembersViewController *)self _getFamilyMemberIdentifiersFromFamilyMembers];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"FamilyMemberSection"];

  return v3;
}

- (id)_getFamilyMemberIdentifiersFromFamilyMembers
{
  double v2 = [(VUIFamilyMembersViewController *)self familyMemberHashToFamilyMemberDictionary];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)_generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
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
        double v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "hash", (void)v15));
        double v12 = [v11 stringValue];
        [v4 setValue:v10 forKey:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  double v13 = (void *)[v4 copy];
  return v13;
}

- (void)_updateCurrentViewIfNeeded
{
  id v3 = [(VUIFamilyMembersViewController *)self dataSource];
  id v4 = [v3 familyMembers];
  uint64_t v5 = [v4 count];

  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = [(VUIFamilyMembersViewController *)self contentPresenter];
  uint64_t v8 = [v7 currentContentViewType];

  if (v6 != v8)
  {
    id v9 = [(VUIFamilyMembersViewController *)self contentPresenter];
    [v9 setCurrentContentViewType:v6];
  }
}

- (void)_updateLayoutForSizeIfNeeded:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  [(VUIFamilyMembersViewController *)self lastCollectionViewSize];
  if (width != v6)
  {
    self->_lastCollectionViewSize.double width = width;
    self->_lastCollectionViewSize.CGFloat height = height;
    sizingCell = self->_sizingCell;
    self->_sizingCell = 0;

    id v9 = [(VUIFamilyMembersViewController *)self collectionView];
    uint64_t v8 = [v9 collectionViewLayout];
    [v8 invalidateLayout];
  }
}

- (void)_clearCollectionViewSelections:(BOOL)a3
{
  uint64_t v5 = [(VUIFamilyMembersViewController *)self collectionView];
  double v6 = [v5 indexPathsForSelectedItems];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    uint64_t v8 = [(VUIFamilyMembersViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      id v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      id v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [v5 deselectItemAtIndexPath:v7 animated:1];
    }
  }
}

uint64_t __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke_2(uint64_t a1, void *a2)
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

- (void)_updateNavigationBarPadding
{
  id v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUIFamilyMembersViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(VUIFamilyMembersViewController *)self navigationController];
  id v14 = [v13 navigationBar];
  [v14 layoutMargins];
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    double v21 = v16;

    if (v10 == v21) {
      return;
    }
  }
  else
  {
  }
  double v22 = [(VUIFamilyMembersViewController *)self navigationController];
  double v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUIFamilyMembersViewController *)self navigationController];
  double v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (VUIFamilyMembersViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIFamilyMembersViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUILibraryFamilyMembersDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (VUILegacyCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (VUIFamilyMemberCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (NSDictionary)familyMemberHashToFamilyMemberDictionary
{
  return self->_familyMemberHashToFamilyMemberDictionary;
}

- (void)setFamilyMemberHashToFamilyMemberDictionary:(id)a3
{
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (CGSize)lastCollectionViewSize
{
  double width = self->_lastCollectionViewSize.width;
  double height = self->_lastCollectionViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastCollectionViewSize:(CGSize)a3
{
  self->_lastCollectionViewSize = a3;
}

- (double)tvCellWidth
{
  return self->_tvCellWidth;
}

- (void)setTvCellWidth:(double)a3
{
  self->_tvCelldouble Width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberHashToFamilyMemberDictionary, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end