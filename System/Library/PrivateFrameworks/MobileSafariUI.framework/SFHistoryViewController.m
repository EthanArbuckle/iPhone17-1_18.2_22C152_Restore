@interface SFHistoryViewController
- (BOOL)_shouldSessionBeExpanded:(id)a3;
- (BOOL)restoreStateWithDictionary:(id)a3;
- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel;
- (BookmarksPanelViewControllerDelegate)delegate;
- (History)history;
- (LinkPreviewProvider)linkPreviewProvider;
- (SFHistoryViewController)initWithHistory:(id)a3;
- (TabGroupProvider)tabGroupProvider;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (id)_clearHistoryBarButtonItem;
- (id)_clearHistoryText;
- (id)_createCollectionViewLayout;
- (id)_deleteSelectedBarButtonItem;
- (id)_doneBarButtonItem;
- (id)_editBarButtonItem;
- (id)_makeHeaderRegistration;
- (id)_makeHistoryCellRegistration;
- (id)_makeSearchBarContainerRegistration;
- (id)_previewMenuForHistoryItems:(id)a3;
- (id)_savedStateDictionary;
- (id)_toolbarItems;
- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)currentStateDictionary;
- (void)_addIndexPathsOfItemsNeedingReconfiguration:(id)a3;
- (void)_adjustContentOffsetHidingSearchBar;
- (void)_clearExplanationView;
- (void)_configureClearHistoryButton;
- (void)_deleteCurrentlySelectedItems;
- (void)_deselectHistoryItemsInSession:(id)a3;
- (void)_reconfigureItemsIfNeeded;
- (void)_reloadItemsInSession:(id)a3 animated:(BOOL)a4;
- (void)_reloadWithSessions:(id)a3 animated:(BOOL)a4;
- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:(id)a3;
- (void)_restoreScrollPositionIfNeeded;
- (void)_saveViewState;
- (void)_showClearHistoryMenu:(id)a3;
- (void)_showExplanationView;
- (void)_toggleEditMode;
- (void)_updateContentOffsetIfNeeded;
- (void)_updateDeleteSelectedItemsButtonEnabled;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)historyViewDataSource:(id)a3 didComputeSessions:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setTabGroupProvider:(id)a3;
- (void)updateClearHistoryButtonEnabled;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SFHistoryViewController

- (SFHistoryViewController)initWithHistory:(id)a3
{
  id v4 = a3;
  v5 = [(SFHistoryViewController *)self _createCollectionViewLayout];
  v31.receiver = self;
  v31.super_class = (Class)SFHistoryViewController;
  v6 = [(SFHistoryViewController *)&v31 initWithCollectionViewLayout:v5];

  if (v6)
  {
    v7 = WebBookmarksHistoryFolderTitle();
    [(SFHistoryViewController *)v6 setTitle:v7];

    [(SFHistoryViewController *)v6 setClearsSelectionOnViewWillAppear:0];
    v8 = [[SFHistoryViewDataSource alloc] initWithHistory:v4];
    historyDataSource = v6->_historyDataSource;
    v6->_historyDataSource = v8;

    [(SFHistoryViewDataSource *)v6->_historyDataSource setDelegate:v6];
    v10 = (WBSSiriIntelligenceHistorySearch *)objc_alloc_init(MEMORY[0x1E4F98E70]);
    siriHistorySearch = v6->_siriHistorySearch;
    v6->_siriHistorySearch = v10;

    v12 = [(SFHistoryViewController *)v6 _savedStateDictionary];
    v13 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v14 = [v12 objectForKeyedSubscript:@"savedExpandedSections"];
    v15 = (void *)v14;
    uint64_t v16 = MEMORY[0x1E4F1CBF0];
    if (v14) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v18 = [v13 setWithArray:v17];
    expandedSessionIdentifiers = v6->_expandedSessionIdentifiers;
    v6->_expandedSessionIdentifiers = (NSMutableSet *)v18;

    v20 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v21 = [v12 objectForKeyedSubscript:@"savedCollapsedSections"];
    v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v16;
    }
    uint64_t v24 = [v20 setWithArray:v23];
    collapsedSessionIdentifiers = v6->_collapsedSessionIdentifiers;
    v6->_collapsedSessionIdentifiers = (NSMutableSet *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.mobilesafari.SFHistoryViewController.IgnoredSiriSuggestedSites", v26);
    ignoredSiriSuggestedSitesQueue = v6->_ignoredSiriSuggestedSitesQueue;
    v6->_ignoredSiriSuggestedSitesQueue = (OS_dispatch_queue *)v27;

    v29 = v6;
  }

  return v6;
}

- (History)history
{
  return [(SFHistoryViewDataSource *)self->_historyDataSource history];
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v40 viewDidLoad];
  self->_needsContentOffsetUpdate = 1;
  v3 = [(SFHistoryViewController *)self collectionView];
  [v3 setAllowsMultipleSelectionDuringEditing:1];
  [v3 setDragDelegate:self];
  [v3 setKeyboardDismissMode:1];
  [v3 setAccessibilityIdentifier:@"HistoryCollectionView"];
  id v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(SFHistoryViewController *)self _makeHeaderRegistration];
  v6 = [(SFHistoryViewController *)self _makeHistoryCellRegistration];
  v7 = [(SFHistoryViewController *)self _makeSearchBarContainerRegistration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (self->_shouldUseSearchControllerInNavigationItem) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E4FB1BF0]);
    searchBar = self->_searchBar;
    self->_searchBar = v16;

    uint64_t v18 = [(SFHistoryViewController *)self view];
    [v18 bounds];
    double Width = CGRectGetWidth(v41);
    -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, 0.0, Width, v20);

    [(UISearchBar *)self->_searchBar setSearchBarStyle:2];
    goto LABEL_6;
  }
  int v9 = [WeakRetained panelViewControllerShouldUseSearchControllerInNavigationItem:self];
  self->_shouldUseSearchControllerInNavigationItem = v9;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(SFHistoryViewController *)self navigationItem];
  v11 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  [(UISearchController *)v11 setObscuresBackgroundDuringPresentation:0];
  [v10 setPreferredSearchBarPlacement:2];
  [v10 setSearchController:v11];
  searchController = self->_searchController;
  self->_searchController = v11;
  v13 = v11;

  uint64_t v14 = [(UISearchController *)v13 searchBar];
  v15 = self->_searchBar;
  self->_searchBar = v14;

LABEL_6:
  [(UISearchBar *)self->_searchBar setDelegate:self];
  uint64_t v21 = _WBSLocalizedString();
  [(UISearchBar *)self->_searchBar setPlaceholder:v21];

  [(UISearchBar *)self->_searchBar setAccessibilityIdentifier:@"HistoryCollectionViewSearchBar"];
  id v22 = objc_alloc(MEMORY[0x1E4FB1598]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E6D7AA28;
  v36[4] = self;
  id v23 = v7;
  id v37 = v23;
  id v24 = v5;
  id v38 = v24;
  id v25 = v6;
  id v39 = v25;
  v26 = (UICollectionViewDiffableDataSource *)[v22 initWithCollectionView:v3 cellProvider:v36];
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v26;

  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke_2;
  v33[3] = &unk_1E6D7E118;
  objc_copyWeak(&v34, &location);
  v28 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource sectionSnapshotHandlers];
  [v28 setWillCollapseItemHandler:v33];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke_3;
  v31[3] = &unk_1E6D7E118;
  objc_copyWeak(&v32, &location);
  v29 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource sectionSnapshotHandlers];
  [v29 setWillExpandItemHandler:v31];

  v30 = [(SFHistoryViewController *)self _toolbarItems];
  [(SFHistoryViewController *)self setToolbarItems:v30 animated:0];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

id __38__SFHistoryViewController_viewDidLoad__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 section] || objc_msgSend(v8, "row") || *(unsigned char *)(a1[4] + 1112))
  {
    uint64_t v10 = [v8 row];
    v11 = a1 + 7;
    if (!v10) {
      v11 = a1 + 6;
    }
  }
  else
  {
    v11 = a1 + 5;
  }
  v12 = [v7 dequeueConfiguredReusableCellWithRegistration:*v11 forIndexPath:v8 item:v9];

  return v12;
}

void __38__SFHistoryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[140];
    id v6 = v10;
    id v7 = [v6 identifier];
    [v5 removeObject:v7];

    id v8 = (void *)v4[141];
    id v9 = [v6 identifier];
    [v8 addObject:v9];

    [v4 _deselectHistoryItemsInSession:v6];
  }
}

void __38__SFHistoryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[140];
    id v6 = v10;
    id v7 = [v6 identifier];
    [v5 addObject:v7];

    id v8 = (void *)v4[141];
    id v9 = [v6 identifier];

    [v8 removeObject:v9];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v6 viewWillDisappear:a3];
  [(SFHistoryViewController *)self _saveViewState];
  id v4 = [(SFHistoryViewController *)self collectionView];
  v5 = [v4 contextMenuInteraction];
  [v5 dismissMenu];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v4 viewDidDisappear:a3];
  [(SFHistoryViewController *)self setEditing:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v3 viewWillLayoutSubviews];
  [(SFHistoryViewController *)self _reconfigureItemsIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v5 viewDidLayoutSubviews];
  [(SFHistoryViewController *)self _updateContentOffsetIfNeeded];
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    searchBar = self->_searchBar;
    objc_super v4 = [(SFHistoryViewController *)self view];
    [v4 layoutMargins];
    -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFHistoryViewController;
  [(SFHistoryViewController *)&v5 willMoveToParentViewController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setPinnedPaletteForPanelViewController:self];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController setEditing:animated:](&v14, sel_setEditing_animated_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained panelViewController:self updateToolbarItemsAnimated:v4];
  }
  else
  {
    id v8 = [(SFHistoryViewController *)self _toolbarItems];
    [(SFHistoryViewController *)self setToolbarItems:v8 animated:v4];
  }
  id v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v10)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Begin editing history items", v13, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidBeginEditing:self];
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "End editing history items", v13, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidEndEditing:self];
    }
  }
  v11 = [(SFHistoryViewController *)self collectionView];
  v12 = [v11 indexPathsForVisibleItems];
  [(SFHistoryViewController *)self _addIndexPathsOfItemsNeedingReconfiguration:v12];
}

- (id)_makeHeaderRegistration
{
  v2 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 registrationWithCellClass:v3 configurationHandler:&__block_literal_global_58];
}

void __50__SFHistoryViewController__makeHeaderRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a2;
  id v8 = [v5 prominentInsetGroupedHeaderConfiguration];
  id v9 = [v6 title];

  [v8 setText:v9];
  [v7 setContentConfiguration:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1538]);
  [v10 setDisplayedState:0];
  v12[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 setAccessories:v11];
}

- (id)_makeHistoryCellRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __55__SFHistoryViewController__makeHistoryCellRegistration__block_invoke;
  id v8 = &unk_1E6D7E160;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1E4E42950](&v5);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __55__SFHistoryViewController__makeHistoryCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  [v6 setAutomaticallyUpdatesContentConfiguration:1];
  id v8 = [v7 url];
  id v9 = +[History titleForHistoryItem:v7];
  [v6 setURL:v8 withTitle:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1530]);
  [v10 setDisplayedState:1];
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v6 setAccessories:v11];

  [v6 setAccessibilityIdentifier:@"HistoryCollectionViewCell"];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained(WeakRetained + 148);
    v15 = [v14 activeProfileIdentifier];
    objc_msgSend(v6, "safari_annotateWithHistoryItem:inProfile:", v7, v15);

    objc_msgSend(v6, "safari_updateVisualStateIsSelected:isEditing:", objc_msgSend(v6, "isSelected"), objc_msgSend(v13, "isEditing"));
  }
}

- (id)_makeSearchBarContainerRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __62__SFHistoryViewController__makeSearchBarContainerRegistration__block_invoke;
  id v8 = &unk_1E6D7E188;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1E4E42950](&v5);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __62__SFHistoryViewController__makeSearchBarContainerRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained) {
    [v5 setSearchBar:*((void *)WeakRetained + 137)];
  }
}

- (id)_createCollectionViewLayout
{
  objc_initWeak(&location, self);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v2 setHeaderMode:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SFHistoryViewController__createCollectionViewLayout__block_invoke;
  v10[3] = &unk_1E6D7A988;
  objc_copyWeak(&v11, &location);
  [v2 setTrailingSwipeActionsConfigurationProvider:v10];
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFHistoryViewController__createCollectionViewLayout__block_invoke_2;
  v7[3] = &unk_1E6D7E1B0;
  objc_copyWeak(&v9, &location);
  id v4 = v2;
  id v8 = v4;
  id v5 = (void *)[v3 initWithSectionProvider:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v5;
}

id __54__SFHistoryViewController__createCollectionViewLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained _trailingSwipeActionConfigurationForIndexPath:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __54__SFHistoryViewController__createCollectionViewLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 || *((unsigned char *)WeakRetained + 1112))
    {
      id v9 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:v5];
    }
    else
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:1];
      [v8 setShowsSeparators:0];
      id v9 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v8 layoutEnvironment:v5];
      objc_msgSend(v9, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_reloadWithSessions:(id)a3 animated:(BOOL)a4
{
  BOOL v54 = a4;
  v68[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  v51 = self->_sessions;
  objc_storeStrong((id *)&self->_sessions, v5);
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    if ([(NSOrderedSet *)self->_sessions count]
      || ([(UISearchBar *)self->_searchBar isFirstResponder] & 1) != 0
      || ([(UISearchBar *)self->_searchBar text],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = +[SFSearchBarContainerCell dataSourceSectionIdentifier];
      v68[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
      [v6 appendSectionsWithIdentifiers:v9];

      id v10 = +[SFSearchBarContainerCell dataSourceItemIdentifier];
      v67 = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [v6 appendItemsWithIdentifiers:v11];
    }
  }
  v12 = [v5 array];
  [v6 appendSectionsWithIdentifiers:v12];

  v49 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
  v50 = self;
  p_sessions = &self->_sessions;
  v48 = v6;
  if ([v49 numberOfSections] >= 2 && !self->_shouldUseSearchControllerInNavigationItem
    || [v49 numberOfItems] && self->_shouldUseSearchControllerInNavigationItem)
  {
    obuint64_t j = v5;
    v13 = [v6 sectionIdentifiers];
    id v14 = v49;
    v15 = [v49 sectionIdentifiers];
    uint64_t v16 = [v13 differenceFromArray:v15 withOptions:4];

    uint64_t v17 = [v49 sectionIdentifiers];
    uint64_t v18 = objc_msgSend(v16, "safari_removalIndexes");
    v19 = [v17 objectsAtIndexes:v18];
    [v49 deleteSectionsWithIdentifiers:v19];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v46 = v16;
    double v20 = [v16 insertions];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          uint64_t v26 = [v25 index];
          dispatch_queue_t v27 = v14;
          uint64_t v28 = [v14 numberOfSections];
          uint64_t v29 = [v25 object];
          v30 = (void *)v29;
          if (v26 == v28)
          {
            uint64_t v65 = v29;
            objc_super v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
            [v27 appendSectionsWithIdentifiers:v31];
          }
          else
          {
            uint64_t v64 = v29;
            objc_super v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
            id v32 = [v27 sectionIdentifiers];
            v33 = [v32 objectAtIndexedSubscript:v26];
            [v27 insertSectionsWithIdentifiers:v31 beforeSectionWithIdentifier:v33];
          }
          id v14 = v27;
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v22);
    }

    self = v50;
    [(UICollectionViewDiffableDataSource *)v50->_collectionDataSource applySnapshot:v14 animatingDifferences:v54];

    id v5 = obj;
  }
  else
  {
    [(UICollectionViewDiffableDataSource *)self->_collectionDataSource applySnapshot:v6 animatingDifferences:v54];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = v5;
  uint64_t v34 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
  v35 = v51;
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(obja);
        }
        id v39 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        uint64_t v40 = [(NSOrderedSet *)v35 indexOfObject:v39];
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(SFHistoryViewController *)self _reloadItemsInSession:v39 animated:v54];
          continue;
        }
        CGRect v41 = [(NSOrderedSet *)v35 objectAtIndexedSubscript:v40];
        v42 = [(UISearchBar *)self->_searchBar text];
        if ([v42 length])
        {

LABEL_34:
          [(SFHistoryViewController *)self _reloadItemsInSession:v39 animated:v54];
          goto LABEL_35;
        }
        v43 = [v41 historyItems];
        v44 = [v39 historyItems];
        char v45 = [v43 isEqualToOrderedSet:v44];

        v35 = v51;
        self = v50;

        if ((v45 & 1) == 0) {
          goto LABEL_34;
        }
LABEL_35:
      }
      uint64_t v36 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v36);
  }

  if ([(NSOrderedSet *)*p_sessions count]) {
    [(SFHistoryViewController *)self _clearExplanationView];
  }
  else {
    [(SFHistoryViewController *)self _showExplanationView];
  }
}

- (void)_showExplanationView
{
  if (self->_explanationView) {
    [(SFHistoryViewController *)self _clearExplanationView];
  }
  id v3 = [(UISearchBar *)self->_searchBar text];
  uint64_t v4 = [v3 length];

  if (v4) {
    [MEMORY[0x1E4FB1658] searchConfiguration];
  }
  else {
  id v13 = [MEMORY[0x1E4FB1658] emptyConfiguration];
  }
  id v5 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1670]) initWithConfiguration:v13];
  [(UIView *)v5 setAutoresizingMask:18];
  id v6 = [(SFHistoryViewController *)self collectionView];
  [v6 bounds];
  -[UIView setFrame:](v5, "setFrame:");

  [(UIView *)v5 setUserInteractionEnabled:0];
  explanationView = self->_explanationView;
  self->_explanationView = v5;
  id v8 = v5;

  id v9 = [(SFHistoryViewController *)self collectionView];
  [v9 addSubview:self->_explanationView];

  id v10 = [(SFHistoryViewController *)self navigationItem];
  id v11 = [v10 searchController];
  v12 = v11;
  if (!v4) {
    [v11 setActive:0];
  }
  if (([v12 isActive] & 1) == 0) {
    [v10 setSearchController:0];
  }
}

- (void)_clearExplanationView
{
  [(UIView *)self->_explanationView removeFromSuperview];
  explanationView = self->_explanationView;
  self->_explanationView = 0;

  uint64_t v4 = [(SFHistoryViewController *)self navigationItem];
  id v5 = [v4 searchController];

  if (!v5)
  {
    searchController = self->_searchController;
    id v7 = [(SFHistoryViewController *)self navigationItem];
    [v7 setSearchController:searchController];
  }
}

- (void)_reloadItemsInSession:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v14[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 appendItems:v8];

  id v9 = [v6 historyItems];
  id v10 = [v9 array];
  [v7 appendItems:v10 intoParentItem:v6];

  if ([(SFHistoryViewController *)self _shouldSessionBeExpanded:v6])
  {
    id v13 = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v7 expandItems:v11];
  }
  else
  {
    id v12 = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v7 collapseItems:v11];
  }

  [(UICollectionViewDiffableDataSource *)self->_collectionDataSource applySnapshot:v7 toSection:v6 animatingDifferences:v4];
}

- (BOOL)_shouldSessionBeExpanded:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchBar *)self->_searchBar text];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    collapsedSessionIdentifiers = self->_collapsedSessionIdentifiers;
    id v9 = [v4 identifier];
    LOBYTE(collapsedSessionIdentifiers) = [(NSMutableSet *)collapsedSessionIdentifiers containsObject:v9];

    if (collapsedSessionIdentifiers)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    expandedSessionIdentifiers = self->_expandedSessionIdentifiers;
    id v11 = [v4 identifier];
    LOBYTE(expandedSessionIdentifiers) = [(NSMutableSet *)expandedSessionIdentifiers containsObject:v11];

    if ((expandedSessionIdentifiers & 1) == 0)
    {
      id v12 = [v4 lastVisitedDate];
      char v7 = objc_msgSend(v12, "safari_isInToday");

      goto LABEL_7;
    }
  }
  char v7 = 1;
LABEL_7:

  return v7;
}

- (void)_addIndexPathsOfItemsNeedingReconfiguration:(id)a3
{
  indexPathsOfItemsNeedingReconfiguration = self->_indexPathsOfItemsNeedingReconfiguration;
  if (indexPathsOfItemsNeedingReconfiguration)
  {
    [(NSMutableSet *)indexPathsOfItemsNeedingReconfiguration addObjectsFromArray:a3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
    uint64_t v6 = self->_indexPathsOfItemsNeedingReconfiguration;
    self->_indexPathsOfItemsNeedingReconfiguration = v5;
  }
  id v7 = [(SFHistoryViewController *)self view];
  [v7 setNeedsLayout];
}

- (void)_reconfigureItemsIfNeeded
{
  if ([(NSMutableSet *)self->_indexPathsOfItemsNeedingReconfiguration count])
  {
    id v3 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    id v4 = [(NSMutableSet *)self->_indexPathsOfItemsNeedingReconfiguration allObjects];
    indexPathsOfItemsNeedingReconfiguration = self->_indexPathsOfItemsNeedingReconfiguration;
    self->_indexPathsOfItemsNeedingReconfiguration = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SFHistoryViewController__reconfigureItemsIfNeeded__block_invoke;
    v7[3] = &unk_1E6D7E1D8;
    void v7[4] = self;
    uint64_t v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v7);
    [v3 reconfigureItemsWithIdentifiers:v6];

    [(UICollectionViewDiffableDataSource *)self->_collectionDataSource applySnapshot:v3 animatingDifferences:0];
  }
}

uint64_t __52__SFHistoryViewController__reconfigureItemsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) itemIdentifierForIndexPath:a2];
}

- (id)_toolbarItems
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if ([(SFHistoryViewController *)self isEditing])
  {
    id v3 = [(SFHistoryViewController *)self _doneBarButtonItem];
    v10[0] = v3;
    id v4 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
    v10[1] = v4;
    id v5 = [(SFHistoryViewController *)self _deleteSelectedBarButtonItem];
    v10[2] = v5;
    uint64_t v6 = v10;
  }
  else
  {
    id v3 = [(SFHistoryViewController *)self _editBarButtonItem];
    v9[0] = v3;
    id v4 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
    v9[1] = v4;
    id v5 = [(SFHistoryViewController *)self _clearHistoryBarButtonItem];
    v9[2] = v5;
    uint64_t v6 = v9;
  }
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  return v7;
}

- (id)_editBarButtonItem
{
  editButton = self->_editButton;
  if (!editButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = _WBSLocalizedString();
    uint64_t v6 = (UIBarButtonItem *)[v4 initWithTitle:v5 style:0 target:self action:sel__toggleEditMode];
    id v7 = self->_editButton;
    self->_editButton = v6;

    editButton = self->_editButton;
  }
  return editButton;
}

- (id)_doneBarButtonItem
{
  doneEditingButton = self->_doneEditingButton;
  if (!doneEditingButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = _WBSLocalizedString();
    uint64_t v6 = (UIBarButtonItem *)[v4 initWithTitle:v5 style:0 target:self action:sel__toggleEditMode];
    id v7 = self->_doneEditingButton;
    self->_doneEditingButton = v6;

    doneEditingButton = self->_doneEditingButton;
  }
  return doneEditingButton;
}

- (id)_clearHistoryBarButtonItem
{
  if (!self->_clearHistoryButton)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = _WBSLocalizedString();
    id v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:0 action:0];
    clearHistoryButton = self->_clearHistoryButton;
    self->_clearHistoryButton = v5;

    [(UIBarButtonItem *)self->_clearHistoryButton setAccessibilityIdentifier:@"ShowClearHistoryOptionsButton"];
    [(SFHistoryViewController *)self _configureClearHistoryButton];
  }
  [(SFHistoryViewController *)self updateClearHistoryButtonEnabled];
  id v7 = self->_clearHistoryButton;
  return v7;
}

- (id)_deleteSelectedBarButtonItem
{
  if (!self->_deleteItemsButton)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = _WBSLocalizedString();
    id v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:self action:sel__deleteCurrentlySelectedItems];
    deleteItemsButton = self->_deleteItemsButton;
    self->_deleteItemsButton = v5;

    id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UIBarButtonItem *)self->_deleteItemsButton setTintColor:v7];
  }
  [(SFHistoryViewController *)self _updateDeleteSelectedItemsButtonEnabled];
  id v8 = self->_deleteItemsButton;
  return v8;
}

- (void)_configureClearHistoryButton
{
  id v3 = [MEMORY[0x1E4FB1618] systemRedColor];
  [(UIBarButtonItem *)self->_clearHistoryButton setTintColor:v3];

  [(UIBarButtonItem *)self->_clearHistoryButton setTarget:self];
  clearHistoryButton = self->_clearHistoryButton;
  [(UIBarButtonItem *)clearHistoryButton setAction:sel__showClearHistoryMenu_];
}

- (void)_showClearHistoryMenu:(id)a3
{
  clearBrowsingDataController = self->_clearBrowsingDataController;
  if (!clearBrowsingDataController)
  {
    id v5 = objc_alloc_init(SafariClearBrowsingDataController);
    uint64_t v6 = self->_clearBrowsingDataController;
    self->_clearBrowsingDataController = v5;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    [(SafariClearBrowsingDataController *)self->_clearBrowsingDataController setTabGroupProvider:WeakRetained];

    clearBrowsingDataController = self->_clearBrowsingDataController;
  }
  [(SafariClearBrowsingDataController *)clearBrowsingDataController showClearHistoryMenuFromViewController:self];
}

- (void)updateClearHistoryButtonEnabled
{
  objc_initWeak(&location, self);
  v2 = +[FeatureManager sharedFeatureManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke;
  v3[3] = &unk_1E6D7CE90;
  objc_copyWeak(&v4, &location);
  [v2 determineIfPrivateBrowsingIsAvailableWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke_2;
  v3[3] = &unk_1E6D7A588;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained[129] count] && *(unsigned char *)(a1 + 40) != 0;
    *((unsigned char *)v3 + 1041) = v4;
    objc_msgSend(v3[133], "setEnabled:");
    char v5 = WBS_LOG_CHANNEL_PREFIXHistoryViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v3 + 1041)) {
        uint64_t v6 = @"off";
      }
      else {
        uint64_t v6 = @"on";
      }
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Parental Controls are %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_updateDeleteSelectedItemsButtonEnabled
{
  id v5 = [(SFHistoryViewController *)self collectionView];
  id v3 = [v5 indexPathsForSelectedItems];
  if ([v3 count]) {
    BOOL allowClearingHistory = self->_allowClearingHistory;
  }
  else {
    BOOL allowClearingHistory = 0;
  }
  [(UIBarButtonItem *)self->_deleteItemsButton setEnabled:allowClearingHistory];
}

- (id)_clearHistoryText
{
  v2 = +[Application sharedApplication];
  [v2 isCloudHistoryEnabled];

  id v3 = _WBSLocalizedString();
  return v3;
}

- (void)_toggleEditMode
{
  uint64_t v3 = [(SFHistoryViewController *)self isEditing] ^ 1;
  [(SFHistoryViewController *)self setEditing:v3 animated:1];
}

- (void)_deleteCurrentlySelectedItems
{
  uint64_t v3 = [(SFHistoryViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke;
  v10[3] = &unk_1E6D7E1D8;
  void v10[4] = self;
  id v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v10);

  [(SFHistoryViewController *)self _removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:v5];
  objc_initWeak(&location, self);
  historyDataSource = self->_historyDataSource;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke_2;
  v7[3] = &unk_1E6D78630;
  objc_copyWeak(&v8, &location);
  [(SFHistoryViewDataSource *)historyDataSource deleteHistoryItems:v5 completionHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) itemIdentifierForIndexPath:a2];
}

void __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDeleteSelectedItemsButtonEnabled];
}

- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_allowClearingHistory)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke;
    v14[3] = &unk_1E6D7E200;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    id v5 = (void *)MEMORY[0x1E4E42950](v14);
    uint64_t v6 = (void *)MEMORY[0x1E4FB1688];
    int v7 = _WBSLocalizedString();
    id v8 = [v6 contextualActionWithStyle:1 title:v7 handler:v5];

    uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    [v8 setImage:v9];

    id v10 = (void *)MEMORY[0x1E4FB1CC0];
    v18[0] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v12 = [v10 configurationWithActions:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [*((id *)WeakRetained + 127) itemIdentifierForIndexPath:*(void *)(a1 + 32)];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 historyItems];
      id v10 = [v9 array];
    }
    else
    {
      v14[0] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    [v7 _removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:v10];
    id v11 = (void *)v7[128];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2;
    v12[3] = &unk_1E6D77E70;
    id v13 = v5;
    [v11 deleteHistoryItems:v10 completionHandler:v12];
  }
}

uint64_t __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:(id)a3
{
  id v4 = a3;
  ignoredSiriSuggestedSitesQueue = self->_ignoredSiriSuggestedSitesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke;
  v7[3] = &unk_1E6D77D90;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(ignoredSiriSuggestedSitesQueue, v7);
}

void __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "safari_mapObjectsUsingBlock:", &__block_literal_global_139_0);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1184));
  id v4 = [WeakRetained activeProfile];
  id v5 = [v4 identifier];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = objc_msgSend(MEMORY[0x1E4F3B060], "sharedInstance", (void)v17);
        id v13 = [v12 userVisibleQueryFromSearchURL:v11];

        id v14 = [MEMORY[0x1E4F98BB8] sharedController];
        id v15 = v14;
        if (v13)
        {
          [v14 removeIgnoredSiriSuggestedSitesInProfile:v5 query:v13];
        }
        else
        {
          id v16 = [v11 host];
          [v15 removeIgnoredSiriSuggestedSitesInProfile:v5 visitedURLHost:v16];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

uint64_t __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 url];
}

- (id)_previewMenuForHistoryItems:(id)a3
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  objc_super v31 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_msgSend(v32, "safari_mapObjectsUsingBlock:", &__block_literal_global_144);
  uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = _WBSLocalizedString();
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_2;
  v44[3] = &unk_1E6D78F48;
  id v10 = v6;
  id v45 = v10;
  id v11 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:v44];
  [v4 addObject:v11];

  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_3;
  v40[3] = &unk_1E6D7BED8;
  objc_copyWeak(&v42, &location);
  id v12 = v10;
  id v41 = v12;
  id v13 = (void *)MEMORY[0x1E4E42950](v40);
  id v14 = (void *)MEMORY[0x1E4FB13F0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_5;
  v38[3] = &unk_1E6D77E70;
  id v15 = v13;
  id v39 = v15;
  id v16 = objc_msgSend(v14, "_sf_openInNewTabActionWithHandler:", v38);
  [v5 addObject:v16];

  if ([v12 count] == 1)
  {
    long long v17 = [(SFHistoryViewController *)self tabGroupProvider];
    long long v18 = [v12 firstObject];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_6;
    v36[3] = &unk_1E6D77E70;
    id v37 = v15;
    long long v19 = [v17 openInTabGroupMenuWithNewTabGroupName:0 URL:v18 descendantCount:0 handler:v36];
    [v5 addObject:v19];
  }
  if (self->_allowClearingHistory)
  {
    long long v20 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v21 = _WBSLocalizedString();
    uint64_t v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_7;
    v33[3] = &unk_1E6D7CB90;
    objc_copyWeak(&v35, &location);
    id v34 = v32;
    uint64_t v23 = [v20 actionWithTitle:v21 image:v22 identifier:0 handler:v33];

    [v23 setAttributes:2];
    [v31 addObject:v23];

    objc_destroyWeak(&v35);
  }
  id v24 = (void *)MEMORY[0x1E4FB1970];
  id v25 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v4];
  v46[0] = v25;
  uint64_t v26 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v5];
  v46[1] = v26;
  dispatch_queue_t v27 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v31];
  v46[2] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  uint64_t v29 = [v24 menuWithTitle:&stru_1F3C268E8 children:v28];

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

  return v29;
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 url];
}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setURLs:v1];
}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F78598] builder];
    [v5 setPreferredTabOrder:a2];
    [v5 setPrefersOpenInNewTab:1];
    unint64_t v6 = [*(id *)(a1 + 32) count];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6 < 2)
    {
      id v11 = [v7 firstObject];
      id v10 = [v5 navigationIntentWithURL:v11];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_4;
      v14[3] = &unk_1E6D7AE30;
      id v8 = v5;
      id v15 = v8;
      uint64_t v9 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v14);
      id v10 = [v8 navigationIntentWithMultipleIntents:v9];
    }
    id v12 = objc_loadWeakRetained(WeakRetained + 146);
    [v12 dispatchNavigationIntent:v10];

    if ([v10 shouldOrderToForeground])
    {
      id v13 = objc_loadWeakRetained(WeakRetained + 148);
      [v13 removeSingleBlankTabFromActiveTabGroup];
    }
  }
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) navigationIntentWithHistoryURL:a2];
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_7(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:*(void *)(a1 + 32)];
    [v3[128] deleteHistoryItems:*(void *)(a1 + 32) completionHandler:0];
    id WeakRetained = v3;
  }
}

- (void)_deselectHistoryItemsInSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFHistoryViewController *)self isEditing])
  {
    id v5 = [(SFHistoryViewController *)self collectionView];
    unint64_t v6 = [v5 indexPathsForSelectedItems];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__SFHistoryViewController__deselectHistoryItemsInSession___block_invoke;
    v17[3] = &unk_1E6D7E228;
    v17[4] = self;
    id v18 = v4;
    uint64_t v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v17);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v5, "deselectItemAtIndexPath:animated:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), 0, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v10);
    }

    [(SFHistoryViewController *)self _updateDeleteSelectedItemsButtonEnabled];
  }
}

uint64_t __58__SFHistoryViewController__deselectHistoryItemsInSession___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1016) itemIdentifierForIndexPath:a2];
  id v4 = [*(id *)(a1 + 40) historyItems];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource itemIdentifierForIndexPath:v7];
  int v9 = [(SFHistoryViewController *)self isEditing];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v9)
  {
    if ((isKindOfClass & 1) == 0) {
      [v6 deselectItemAtIndexPath:v7 animated:0];
    }
    [(SFHistoryViewController *)self _updateDeleteSelectedItemsButtonEnabled];
    v18[0] = v7;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(SFHistoryViewController *)self _addIndexPathsOfItemsNeedingReconfiguration:v11];
  }
  else
  {
    if (isKindOfClass)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F78598];
      id v13 = v8;
      long long v14 = [v12 builder];
      long long v15 = [v13 url];

      long long v16 = [v14 navigationIntentWithHistoryURL:v15];

      [v16 setShouldDismissSidebarOnLoad:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
      [WeakRetained dispatchNavigationIntent:v16];
    }
    [v6 deselectItemAtIndexPath:v7 animated:1];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(SFHistoryViewController *)self isEditing])
  {
    [(SFHistoryViewController *)self _updateDeleteSelectedItemsButtonEnabled];
    v7[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(SFHistoryViewController *)self _addIndexPathsOfItemsNeedingReconfiguration:v6];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    if ([v8 count] == 1)
    {
      collectionDataSource = self->_collectionDataSource;
      uint64_t v10 = [v8 firstObject];
      uint64_t v11 = [(UICollectionViewDiffableDataSource *)collectionDataSource itemIdentifierForIndexPath:v10];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        id v13 = [v11 historyItems];
        long long v14 = [v13 array];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28[0] = v11;
          long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        }
        else
        {
          long long v14 = 0;
        }
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
      v27[3] = &unk_1E6D7E1D8;
      v27[4] = self;
      long long v14 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v27);
      char isKindOfClass = 0;
    }
    if ([v14 count])
    {
      objc_initWeak(&location, self);
      long long v16 = (void *)MEMORY[0x1E4FB1678];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_2;
      v22[3] = &unk_1E6D7E250;
      objc_copyWeak(&v24, &location);
      char v25 = isKindOfClass & 1;
      id v17 = v14;
      id v23 = v17;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_3;
      v19[3] = &unk_1E6D7AF80;
      objc_copyWeak(&v21, &location);
      id v20 = v17;
      long long v15 = [v16 configurationWithIdentifier:0 previewProvider:v22 actionProvider:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1016) itemIdentifierForIndexPath:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && !*(unsigned char *)(a1 + 48))
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 147);
    id v6 = [*(id *)(a1 + 32) firstObject];
    id v7 = [v6 url];
    id v4 = [v5 linkPreviewViewControllerForURL:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _previewMenuForHistoryItems:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [v10 previewViewController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__SFHistoryViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v13[3] = &unk_1E6D77F98;
  objc_copyWeak(&v15, &location);
  id v12 = v11;
  id v14 = v12;
  [v10 addAnimations:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __100__SFHistoryViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 147);
    [v3 commitLinkPreviewViewController:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v6 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", a5, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(SFHistoryViewController *)self collectionView];
    id v8 = [v7 indexPathsForSelectedItems];
    unint64_t v9 = [v8 count];

    if (v9 <= 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
      [WeakRetained linkPreviewProviderWillDismissPreview];
    }
  }

  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", a5, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (objc_class *)MEMORY[0x1E4F28D78];
    id v7 = v5;
    id v8 = [v6 alloc];
    unint64_t v9 = [v7 url];

    id v10 = (void *)[v8 initWithObject:v9];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v10];
    v14[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartDragWithDragContentType:11];
}

- (void)historyViewDataSource:(id)a3 didComputeSessions:(id)a4
{
  self->_hasLoadedHistory = 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v7 = a4;
  id v8 = +[History lowercaseStringTrimmedForHistorySearch:v7];
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F98F70]) initWithString:v8];
  uint64_t v10 = [v8 length];
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke;
    v20[3] = &unk_1E6D7E278;
    id v4 = &v21;
    id v21 = v9;
    id v5 = &v22;
    id v22 = v7;
    id v12 = [v11 predicateWithBlock:v20];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = self->_historyDataSource;
  siriHistorySearch = self->_siriHistorySearch;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_2;
  v17[3] = &unk_1E6D7E2A0;
  id v18 = v13;
  id v19 = v12;
  id v15 = v12;
  long long v16 = v13;
  [(WBSSiriIntelligenceHistorySearch *)siriHistorySearch findURLStringsForHistoryItemsContainingString:v8 completionHandler:v17];

  if (v10)
  {
  }
}

BOOL __51__SFHistoryViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 urlString];
  if (+[History historyItemURL:v4 matchesFilter:*(void *)(a1 + 32)])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 title];
    BOOL v5 = +[History historyItemTitle:matchesFilterString:](History, "historyItemTitle:matchesFilterString:", v6, *(void *)(a1 + 40))|| +[History filterString:*(void *)(a1 + 32) matchesHistoryItemAnywhereInTitleOrURL:v3];
  }
  return v5;
}

void __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_3;
  block[3] = &unk_1E6D78980;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_3(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_4;
    id v13 = &unk_1E6D78FE8;
    id v14 = *(id *)(a1 + 32);
    id v3 = [v2 predicateWithBlock:&v10];
    id v4 = (void *)MEMORY[0x1E4F28BA0];
    BOOL v5 = *(void **)(a1 + 40);
    v15[0] = *(void *)(a1 + 48);
    v15[1] = v3;
    id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 2, v10, v11, v12, v13);
    id v7 = [v4 orPredicateWithSubpredicates:v6];
    [v5 filterUsingPredicate:v7];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    [v8 filterUsingPredicate:v9];
  }
}

uint64_t __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 urlString];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  return 0;
}

- (id)currentStateDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (void)_updateContentOffsetIfNeeded
{
  if (self->_needsContentOffsetUpdate && self->_hasLoadedHistory)
  {
    self->_needsContentOffsetUpdate = 0;
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v4 = [v3 objectForKey:@"SavedCollectionViewScrollState-HistoryView"];

    if (v4)
    {
      [(SFHistoryViewController *)self _restoreScrollPositionIfNeeded];
    }
    else
    {
      [(SFHistoryViewController *)self _adjustContentOffsetHidingSearchBar];
    }
  }
}

- (void)_saveViewState
{
  v50[6] = *MEMORY[0x1E4F143B8];
  id v3 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
  uint64_t v4 = [v3 numberOfItems];

  if (v4)
  {
    BOOL v5 = [(SFHistoryViewController *)self collectionView];
    id v6 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    id v7 = [v6 itemIdentifiers];
    id v8 = [v7 lastObject];

    uint64_t v9 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:v8];
    uint64_t v10 = [v5 layoutAttributesForItemAtIndexPath:v9];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v51.origin.x = v12;
    v51.origin.y = v14;
    v51.size.width = v16;
    v51.size.height = v18;
    double MaxY = CGRectGetMaxY(v51);
    [v5 frame];
    if (MaxY >= CGRectGetMaxY(v52))
    {
      [v5 contentOffset];
      double v25 = v24;
      double v27 = v26;
      uint64_t v28 = [v5 indexPathsForVisibleItems];
      uint64_t v29 = [v28 sortedArrayUsingSelector:sel_compare_];
      id v20 = [v29 firstObject];

      v30 = [v5 layoutAttributesForItemAtIndexPath:v20];
      [v30 frame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      v53.origin.x = v32;
      v53.origin.y = v34;
      v53.size.width = v36;
      v53.size.height = v38;
      CGRect v54 = CGRectOffset(v53, -v25, -v27);
      double MinY = CGRectGetMinY(v54);
      [v5 adjustedContentInset];
      double v41 = MinY - v40;
      v49[0] = @"TopVisibleCellSection";
      id v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v20, "section"));
      v50[0] = v21;
      v49[1] = @"TopVisibleCellRow";
      id v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v20, "row"));
      v50[1] = v22;
      v49[2] = @"TopVisibleCellOffset";
      id v42 = [MEMORY[0x1E4F28ED0] numberWithDouble:v41];
      v50[2] = v42;
      v49[3] = @"savedExpandedSections";
      v43 = [(NSMutableSet *)self->_expandedSessionIdentifiers allObjects];
      v50[3] = v43;
      v49[4] = @"savedCollapsedSections";
      v44 = [(NSMutableSet *)self->_collapsedSessionIdentifiers allObjects];
      v50[4] = v44;
      v49[5] = @"Timestamp";
      id v45 = [MEMORY[0x1E4F1C9C8] now];
      v50[5] = v45;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:6];
    }
    else
    {
      id v20 = [(NSMutableSet *)self->_expandedSessionIdentifiers allObjects];
      v48[0] = v20;
      v47[1] = @"savedCollapsedSections";
      id v21 = [(NSMutableSet *)self->_collapsedSessionIdentifiers allObjects];
      v48[1] = v21;
      v47[2] = @"Timestamp";
      id v22 = [MEMORY[0x1E4F1C9C8] now];
      v48[2] = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
    }

    v46 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v46 setObject:v23 forKey:@"SavedCollectionViewScrollState-HistoryView"];
  }
}

- (id)_savedStateDictionary
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = [v2 objectForKey:@"SavedCollectionViewScrollState-HistoryView"];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v5 = [v3 objectForKeyedSubscript:@"Timestamp"];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v9 = v8;
    if (v7 <= 480.0)
    {
      uint64_t v10 = [v8 objectForKey:@"SavedCollectionViewScrollState-HistoryView"];
    }
    else
    {
      [v8 removeObjectForKey:@"SavedCollectionViewScrollState-HistoryView"];
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_restoreScrollPositionIfNeeded
{
  id v3 = [(SFHistoryViewController *)self _savedStateDictionary];
  id v24 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"TopVisibleCellRow"];
    uint64_t v5 = [v4 integerValue];

    double v6 = [v24 objectForKeyedSubscript:@"TopVisibleCellSection"];
    uint64_t v7 = [v6 integerValue];

    id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 inSection:v7];
    uint64_t v9 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    uint64_t v10 = [v8 section];
    if (v10 >= [v9 numberOfSections]) {
      goto LABEL_5;
    }
    uint64_t v11 = [v8 row];
    CGFloat v12 = [v9 sectionIdentifiers];
    double v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    uint64_t v14 = [v9 numberOfItemsInSection:v13];

    if (v11 >= v14)
    {
LABEL_5:
      [(SFHistoryViewController *)self _adjustContentOffsetHidingSearchBar];
    }
    else
    {
      double v15 = [(SFHistoryViewController *)self collectionView];
      [v15 scrollToItemAtIndexPath:v8 atScrollPosition:1 animated:0];
      [v15 contentOffset];
      double v17 = v16;
      double v19 = v18;
      id v20 = [v24 objectForKey:@"TopVisibleCellOffset"];
      [v20 doubleValue];
      double v22 = v19 - v21;

      objc_msgSend(v15, "setContentOffset:animated:", 0, v17, v22);
      id v23 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v23 removeObjectForKey:@"SavedCollectionViewScrollState-HistoryView"];
    }
  }
  else
  {
    [(SFHistoryViewController *)self _adjustContentOffsetHidingSearchBar];
  }
}

- (void)_adjustContentOffsetHidingSearchBar
{
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    id v7 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    if ([v7 numberOfItems])
    {
      id v3 = [v7 itemIdentifiers];
      uint64_t v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_189_0);

      uint64_t v5 = [(SFHistoryViewController *)self collectionView];
      double v6 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:v4];
      [v5 scrollToItemAtIndexPath:v6 atScrollPosition:1 animated:0];
    }
  }
}

uint64_t __62__SFHistoryViewController__adjustContentOffsetHidingSearchBar__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    uint64_t v4 = +[SFSearchBarContainerCell dataSourceSectionIdentifier];
    if ([v3 isEqualToString:v4])
    {
      uint64_t v5 = 0;
    }
    else
    {
      double v6 = +[SFSearchBarContainerCell dataSourceItemIdentifier];
      uint64_t v5 = [v3 isEqualToString:v6] ^ 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    double y = a5->y;
    id v8 = [(SFHistoryViewController *)self collectionView];
    [v8 adjustedContentInset];
    double v10 = v9;

    [(UISearchBar *)self->_searchBar bounds];
    CGFloat Height = CGRectGetHeight(v14);
    double v12 = Height * 0.5 - v10;
    double v13 = fmax(y, Height - v10);
    if (y < v12) {
      double v13 = -v10;
    }
    a5->double y = v13;
  }
}

- (BookmarksPanelViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BookmarksPanelViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return (TabGroupProvider *)WeakRetained;
}

- (void)setTabGroupProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexPathsOfItemsNeedingReconfiguration, 0);
  objc_storeStrong((id *)&self->_ignoredSiriSuggestedSitesQueue, 0);
  objc_storeStrong((id *)&self->_clearBrowsingDataController, 0);
  objc_storeStrong((id *)&self->_collapsedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_siriHistorySearch, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_deleteItemsButton, 0);
  objc_storeStrong((id *)&self->_doneEditingButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clearHistoryButton, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_historyDataSource, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
}

@end