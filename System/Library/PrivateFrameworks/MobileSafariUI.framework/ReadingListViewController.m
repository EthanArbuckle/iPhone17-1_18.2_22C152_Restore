@interface ReadingListViewController
- (BOOL)_shouldUseTranslucentAppearance;
- (BOOL)restoreStateWithDictionary:(id)a3;
- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel;
- (BOOL)showingAllBookmarks;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (LinkPreviewProvider)linkPreviewProvider;
- (NSArray)bookmarksPanelToolbarItems;
- (ReadingListViewController)init;
- (ReadingListViewControllerDelegate)delegate;
- (TabGroupProvider)tabGroupProvider;
- (UITableView)tableView;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_URLForRowAtIndexPath:(id)a3;
- (id)_bookmarkAtIndexPath:(id)a3;
- (id)_createAction:(int64_t)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitle:(BOOL)a5 withBlock:(id)a6;
- (id)_createActions:(id)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitles:(BOOL)a5 withBlock:(id)a6;
- (id)_currentReadingListBookmark;
- (id)_deleteBarButtonItem;
- (id)_editButtonIdentifier;
- (id)_iconForUUID:(id)a3 iconData:(id)a4;
- (id)_saveOfflineBarButtonItem;
- (id)_unreadFilterBarButtonItem;
- (id)_unreadFilterButtonIdentifier;
- (id)_unreadFilterButtonTitle;
- (id)currentStateDictionary;
- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4;
- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4;
- (id)safari_tableViewForScrollPositionSaving;
- (id)safari_tableViewScrollPositionSaveIdentifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adjustContentOffsetIfNeeded;
- (void)_clearExplanationView;
- (void)_connectSafariFetcherServerProxy;
- (void)_deleteBookmarks:(id)a3;
- (void)_didChangeUnreadFilter;
- (void)_disconnectSafariFetcherServerProxy;
- (void)_fetchMetadataIfNeededForBookmark:(id)a3;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_postChangeNotification;
- (void)_readingListBookmarkMetadataDidUpdate:(id)a3;
- (void)_readingListItemAtIndexPath:(id)a3 lockAndPerformUpdates:(id)a4 performBlockIfLockFailed:(id)a5;
- (void)_readingListItemAtIndexPath:(id)a3 setUnread:(BOOL)a4;
- (void)_readingListItemAtIndexPathDelete:(id)a3;
- (void)_readingListItemsAtIndexPaths:(id)a3 lockAndPerformUpdate:(id)a4 performBlockIfLockFailed:(id)a5;
- (void)_reloadReadingList;
- (void)_reloadReadingListAndTable;
- (void)_restoreCellSeparator;
- (void)_saveForOffline:(id)a3;
- (void)_scheduleDelayedChangeNotification;
- (void)_setIconForBookmark:(id)a3 cell:(id)a4 synchronously:(BOOL)a5;
- (void)_showExplanationView;
- (void)_updateEditingButtonsEnabled;
- (void)_updateSearchBar;
- (void)_updateTableViewByComputingDifference;
- (void)_updateTableViewByRemovingReadingListItemAtIndexPath:(id)a3;
- (void)_updateToolbarItemsAnimated:(BOOL)a3;
- (void)_webBookmarksDidReload:(id)a3;
- (void)bookmarksServerProxy:(id)a3 didStartFetchingReadingListItem:(id)a4;
- (void)bookmarksServerProxy:(id)a3 didStopFetchingReadingListItem:(id)a4;
- (void)bookmarksServerProxyConnectionInvalidated:(id)a3;
- (void)bookmarksServerProxyDidFinishFetching:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)loadView;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setTabGroupProvider:(id)a3;
- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updateAndScrollToCurrentSelectedItemIfNeeded:(BOOL)a3;
- (void)updateColorSchemeForExplanationView;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation ReadingListViewController

- (ReadingListViewController)init
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)ReadingListViewController;
  v2 = [(ReadingListViewController *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    v2->_networkIsReachable = [v3 isNetworkReachable];
    [v3 addNetworkReachableObserver:v2 selector:sel__networkReachabilityChanged_];
    uint64_t v4 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    collection = v2->_collection;
    v2->_collection = (WebBookmarkCollection *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__readingListBookmarkDidUpdate_ name:@"ReadingListBookmarkDidUpdateNotification" object:0];
    [v6 addObserver:v2 selector:sel__webBookmarksDidReload_ name:*MEMORY[0x1E4FB6148] object:0];
    [v6 addObserver:v2 selector:sel__didAddNewReadingListBookmark name:@"ReadingListBookmarkAddedNotification" object:0];
    [v6 addObserver:v2 selector:sel__webBookmarksDidReload_ name:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
    [v6 addObserver:v2 selector:sel__readingListBookmarkMetadataDidUpdate_ name:@"ReadingListBookmarkMetadataDidUpdateNotification" object:0];
    [(ReadingListViewController *)v2 _connectSafariFetcherServerProxy];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)didReceiveWebBookmarksReadingListFetchingNotification, (CFStringRef)*MEMORY[0x1E4FB6170], 0, (CFNotificationSuspensionBehavior)1024);
    v2->_loadIconsSynchronously = 1;
    v8 = WebBookmarksReadingListFolderTitle();
    [(ReadingListViewController *)v2 setTitle:v8];

    v9 = +[Application sharedApplication];
    uint64_t v10 = [v9 readingListLeadImageCache];
    imageCache = v2->_imageCache;
    v2->_imageCache = (ReadingListLeadImageCache *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    visibleBookmarkIDs = v2->_visibleBookmarkIDs;
    v2->_visibleBookmarkIDs = (NSMutableSet *)v12;

    v2->_needsContentOffsetAdjustment = 1;
    v21[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v15 = (id)[(ReadingListViewController *)v2 registerForTraitChanges:v14 withTarget:v2 action:sel_contentSizeCategoryDidChange];

    v16 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v17 = (id)[(ReadingListViewController *)v2 registerForTraitChanges:v16 withTarget:v2 action:sel_updateColorSchemeForExplanationView];

    v18 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v4 removeNetworkReachableObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FB6170], 0);
  [(ReadingListViewController *)self _disconnectSafariFetcherServerProxy];
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  [(ReadingListViewController *)self _clearExplanationView];
  v6.receiver = self;
  v6.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v6 dealloc];
}

- (BOOL)_shouldUseTranslucentAppearance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained panelViewControllerShouldTranslucentAppearance:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_showExplanationView
{
  if (!self->_explanationView)
  {
    _WBSLocalizedString();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v3 = _WBSLocalizedString();
    char v4 = [MEMORY[0x1E4FB1658] emptyConfiguration];
    [v4 setTextToSecondaryTextPadding:8.0];
    [v4 setText:v13];
    [v4 setSecondaryText:v3];
    v5 = [(UIContentUnavailableView *)[ReadingListContentUnavailableView alloc] initWithConfiguration:v4];
    [(ReadingListContentUnavailableView *)v5 setAutoresizingMask:18];
    objc_super v6 = [(ReadingListViewController *)self view];
    [v6 bounds];
    -[ReadingListContentUnavailableView setFrame:](v5, "setFrame:");

    if ([(ReadingListViewController *)self _shouldUseTranslucentAppearance]) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    [(ReadingListContentUnavailableView *)v5 setBackgroundColor:v7];
    explanationView = self->_explanationView;
    self->_explanationView = &v5->super.super;
    v9 = v5;

    uint64_t v10 = [(ReadingListViewController *)self view];
    [v10 addSubview:self->_explanationView];

    id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UITableView *)self->_tableView setTableFooterView:v11];

    uint64_t v12 = [(UITableView *)self->_tableView tableHeaderView];

    [v12 setHidden:1];
  }
}

- (void)_clearExplanationView
{
  [(UIView *)self->_explanationView removeFromSuperview];
  explanationView = self->_explanationView;
  self->_explanationView = 0;

  [(UITableView *)self->_tableView setTableFooterView:0];
  id v4 = [(UITableView *)self->_tableView tableHeaderView];
  [v4 setHidden:0];
}

- (void)loadView
{
  id v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v19 objectForKey:@"showingAllReadingListBookmarks"];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }
  self->_showingAllBookmarks = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readingListViewController:self updateUnreadFilterShowingAllBookmarks:self->_showingAllBookmarks];
  }
  [(ReadingListViewController *)self _reloadReadingList];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(ReadingListViewController *)self setView:v7];

  v8 = [(ReadingListViewController *)self view];
  [v8 setAutoresizingMask:18];

  v9 = [(ReadingListViewController *)self _unreadFilterButtonTitle];
  uint64_t v10 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
  [v10 setTitle:v9];

  id v11 = [(ReadingListViewController *)self _unreadFilterButtonIdentifier];
  uint64_t v12 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
  [v12 setAccessibilityIdentifier:v11];

  id v13 = [[PreviewTableViewController alloc] initWithStyle:2];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v13;

  [(PreviewTableViewController *)self->_tableViewController setPreviewDelegate:self];
  id v15 = [(ReadingListViewController *)self linkPreviewProvider];
  [(PreviewTableViewController *)self->_tableViewController setLinkPreviewProvider:v15];

  [(PreviewTableViewController *)self->_tableViewController setViewRespectsSystemMinimumLayoutMargins:0];
  v16 = [(PreviewTableViewController *)self->_tableViewController tableView];
  tableView = self->_tableView;
  self->_tableView = v16;

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"ReadingListTable"];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDragDelegate:self];
  [(UITableView *)self->_tableView setDropDelegate:self];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"ReadingListTableViewCellWithImage"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"ReadingListTableViewCellWithoutImage"];
  [(UITableView *)self->_tableView setAllowsMultipleSelectionDuringEditing:1];
  +[ReadingListTableViewCell minimumCellHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)self->_tableView setSeparatorInsetReference:1];
  [(ReadingListViewController *)self addChildViewController:self->_tableViewController];
  v18 = [(ReadingListViewController *)self view];
  [v18 addSubview:self->_tableView];

  [(ReadingListViewController *)self _updateSearchBar];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v4 viewDidLoad];
  v3 = [(ReadingListViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  if (self->_deferEnteringEditMode)
  {
    self->_deferEnteringEditMode = 0;
    [(ReadingListViewController *)self setEditing:1 animated:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v4 viewDidDisappear:a3];
  [(ReadingListLeadImageCache *)self->_imageCache clearCache];
  [(ReadingListViewController *)self setEditing:0];
}

- (void)viewWillLayoutSubviews
{
  v3 = [(ReadingListViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v4 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v5 viewDidLayoutSubviews];
  searchBar = self->_searchBar;
  objc_super v4 = [(ReadingListViewController *)self tableView];
  [v4 layoutMargins];
  -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(WebBookmarkCollection *)self->_collection readingListWithUnreadOnly:0];
  int v6 = [v5 bookmarkCount];

  if (!v6) {
    [(ReadingListViewController *)self _showExplanationView];
  }
  v11.receiver = self;
  v11.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v11 viewWillAppear:v3];
  id v7 = [(ReadingListViewController *)self navigationController];
  [v7 setToolbarHidden:0 animated:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [(ReadingListViewController *)self bookmarksPanelToolbarItems];
    [(ReadingListViewController *)self setToolbarItems:v10 animated:v3];
  }
}

- (void)contentSizeCategoryDidChange
{
  if (!self->_shouldUseSearchControllerInNavigationBar)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ReadingListViewController_contentSizeCategoryDidChange__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__ReadingListViewController_contentSizeCategoryDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  _SFRoundFloatToPixels();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "setFrame:", 0.0, 0.0, 0.0, v2);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1088);
  objc_super v5 = *(void **)(v3 + 1152);
  return [v5 setTableHeaderView:v4];
}

- (void)updateColorSchemeForExplanationView
{
  if (self->_explanationView)
  {
    [(ReadingListViewController *)self _clearExplanationView];
    [(ReadingListViewController *)self _showExplanationView];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v9 viewDidAppear:a3];
  uint64_t v4 = [(ReadingListViewController *)self userActivity];
  objc_super v5 = [v4 activityType];
  uint64_t v6 = *MEMORY[0x1E4F3B1A8];
  char v7 = [v5 isEqualToString:*MEMORY[0x1E4F3B1A8]];

  if ((v7 & 1) == 0)
  {
    [v4 invalidate];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:v6];

    [(ReadingListViewController *)self setUserActivity:v8];
    uint64_t v4 = (void *)v8;
  }
  [v4 setNeedsSave:1];
}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (void)_adjustContentOffsetIfNeeded
{
  if (!self->_shouldUseSearchControllerInNavigationBar && self->_needsContentOffsetAdjustment)
  {
    self->_needsContentOffsetAdjustment = 0;
    if (!-[UIViewController safari_hasSavedTableViewScrollPosition]((BOOL)self)
      || !-[UIViewController safari_restoreTableViewScrollPosition](self))
    {
      tableView = self->_tableView;
      -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](tableView);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSTimer *)self->_deletionNotificationTimer isValid]) {
    [(ReadingListViewController *)self _postChangeNotification];
  }
  -[UIViewController safari_saveTableViewScrollPosition](self);
  objc_super v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_showingAllBookmarks];
  [v5 setObject:v6 forKey:@"showingAllReadingListBookmarks"];

  char v7 = [(ReadingListViewController *)self tableView];
  -[UITableView safari_dismissContextMenu](v7);

  v8.receiver = self;
  v8.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v8 viewWillDisappear:v3];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v5 willMoveToParentViewController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setPinnedPaletteForPanelViewController:self];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char v7 = [(UITableView *)self->_tableView window];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v5;
  }
  if (!v8) {
    self->_deferEnteringEditMode = 1;
  }
  [(ReadingListViewController *)self _restoreCellSeparator];
  v16.receiver = self;
  v16.super_class = (Class)ReadingListViewController;
  [(ReadingListViewController *)&v16 setEditing:v5 animated:v4];
  BOOL v9 = !v5;
  [(UISearchBar *)self->_searchBar setUserInteractionEnabled:v5 ^ 1];
  double v10 = 1.0;
  if (v5) {
    double v10 = 0.5;
  }
  [(UISearchBar *)self->_searchBar setAlpha:v10];
  [MEMORY[0x1E4F39CF8] begin];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__ReadingListViewController_setEditing_animated___block_invoke;
  v15[3] = &unk_1E6D77E20;
  v15[4] = self;
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v15];
  [(PreviewTableViewController *)self->_tableViewController setEditing:v5 animated:v4];
  [(ReadingListViewController *)self _updateToolbarItemsAnimated:v4];
  [(ReadingListViewController *)self _updateEditingButtonsEnabled];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, "End editing reading list items", v14, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidEndEditing:self];
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, "Begin editing reading list items", v14, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidBeginEditing:self];
    }
  }
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __49__ReadingListViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAndScrollToCurrentSelectedItemIfNeeded:0];
}

- (void)_updateToolbarItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained panelViewController:self updateToolbarItemsAnimated:1];
  }
  else
  {
    BOOL v5 = [(ReadingListViewController *)self bookmarksPanelToolbarItems];
    [(ReadingListViewController *)self setToolbarItems:v5 animated:v3];
  }
}

- (id)_bookmarkAtIndexPath:(id)a3
{
  readingList = self->_readingList;
  uint64_t v4 = [a3 row];
  return (id)[(WebBookmarkList *)readingList bookmarkAtIndex:v4];
}

- (void)_networkReachabilityChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x1E4F4BDA8]];
  self->_networkIsReachable = [v5 BOOLValue];

  [(ReadingListViewController *)self _reloadReadingListAndTable];
}

- (void)_reloadReadingList
{
  BOOL v3 = [(WebBookmarkCollection *)self->_collection readingListWithUnreadOnly:!self->_showingAllBookmarks filteredUsingString:self->_userTypedFilter];
  readingList = self->_readingList;
  self->_readingList = v3;
}

- (void)_updateSearchBar
{
  int v3 = [(WebBookmarkList *)self->_readingList bookmarkCount];
  searchBar = self->_searchBar;
  if (v3)
  {
    if (searchBar) {
      return;
    }
    p_tableView = &self->_tableView;
    if (!self->_tableView) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(UISearchBar *)searchBar text];
  uint64_t v7 = [v6 length];

  BOOL v8 = self->_searchBar;
  if ((v7 != 0) != (v8 == 0)) {
    return;
  }
  p_tableView = &self->_tableView;
  if (!self->_tableView) {
    return;
  }
  if (v7)
  {
LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      int v9 = [WeakRetained panelViewControllerShouldUseSearchControllerInNavigationItem:self];
      self->_shouldUseSearchControllerInNavigationBar = v9;
      if (v9)
      {
LABEL_10:
        double v10 = (UISearchBar *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
        [(UISearchBar *)v10 setObscuresBackgroundDuringPresentation:0];
        objc_super v11 = [(UISearchBar *)v10 searchBar];
        uint64_t v12 = self->_searchBar;
        self->_searchBar = v11;

        BOOL v13 = [(ReadingListViewController *)self navigationItem];
        [v13 setPreferredSearchBarPlacement:2];

        v14 = [(ReadingListViewController *)self navigationItem];
        [v14 setSearchController:v10];

LABEL_14:
        [(UISearchBar *)self->_searchBar setDelegate:self];
        objc_super v16 = NSString;
        id v17 = _WBSLocalizedString();
        v18 = WebBookmarksReadingListFolderTitle();
        id v19 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v18);
        [(UISearchBar *)self->_searchBar setPlaceholder:v19];

        return;
      }
    }
    else if (self->_shouldUseSearchControllerInNavigationBar)
    {
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E4FB1BF0], "sf_installSearchBarInTableView:includeSeparator:", *p_tableView, 0);
    id v15 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_searchBar;
    self->_searchBar = v15;
    goto LABEL_14;
  }
  self->_searchBar = 0;

  [(UITableView *)*p_tableView setTableHeaderView:0];
  objc_super v20 = *p_tableView;
  [(UITableView *)v20 _setAllowedNavigationOverlapAmount:0.0];
}

- (void)_reloadReadingListAndTable
{
  if (([(ReadingListViewController *)self isEditing] & 1) == 0)
  {
    [(NSMutableSet *)self->_visibleBookmarkIDs removeAllObjects];
    [(ReadingListViewController *)self _reloadReadingList];
    [(ReadingListViewController *)self _updateSearchBar];
    if ([(WebBookmarkList *)self->_readingList bookmarkCount]) {
      [(ReadingListViewController *)self _clearExplanationView];
    }
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)_didChangeUnreadFilter
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_showingAllBookmarks ^= 1u;
  int v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_showingAllBookmarks) {
      uint64_t v4 = @"all";
    }
    else {
      uint64_t v4 = @"unread";
    }
    int v10 = 138543362;
    objc_super v11 = v4;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Toggle show unread reading list items: (showing %{public}@)", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readingListViewController:self updateUnreadFilterShowingAllBookmarks:self->_showingAllBookmarks];
  }
  uint64_t v6 = [(ReadingListViewController *)self _unreadFilterButtonTitle];
  uint64_t v7 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
  [v7 setTitle:v6];

  BOOL v8 = [(ReadingListViewController *)self _unreadFilterButtonIdentifier];
  int v9 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
  [v9 setAccessibilityIdentifier:v8];

  [(ReadingListViewController *)self _reloadReadingListAndTable];
  [(ReadingListViewController *)self _updateToolbarItemsAnimated:1];
}

- (id)_unreadFilterBarButtonItem
{
  if (!self->_cachedUnreadFilterBarButtonButton)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v4 = [(ReadingListViewController *)self _unreadFilterButtonTitle];
    BOOL v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:self action:sel__didChangeUnreadFilter];
    cachedUnreadFilterBarButtonButton = self->_cachedUnreadFilterBarButtonButton;
    self->_cachedUnreadFilterBarButtonButton = v5;
  }
  uint64_t v7 = [(ReadingListViewController *)self _unreadFilterButtonIdentifier];
  [(UIBarButtonItem *)self->_cachedUnreadFilterBarButtonButton setAccessibilityIdentifier:v7];

  BOOL v8 = self->_cachedUnreadFilterBarButtonButton;
  return v8;
}

- (NSArray)bookmarksPanelToolbarItems
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  if ([(WebBookmarkList *)self->_readingList bookmarkCount])
  {
    if (!self->_isUsingSwipeAction)
    {
      BOOL v8 = [(ReadingListViewController *)self _editButtonIdentifier];
      int v9 = [(ReadingListViewController *)self editButtonItem];
      [v9 setAccessibilityIdentifier:v8];

      int v10 = [(ReadingListViewController *)self isEditing];
      if (v10)
      {
        uint64_t v4 = [(ReadingListViewController *)self _deleteBarButtonItem];
        [v4 setAccessibilityIdentifier:@"ReadingListBarDeleteButton"];
      }
      else
      {
        uint64_t v4 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
      }
      objc_super v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      if ((objc_msgSend(v11, "safari_shouldAutomaticallyDownloadReadingListItems") & 1) != 0 || v10 != 1)
      {
        id v12 = v3;
      }
      else
      {
        id v12 = [(ReadingListViewController *)self _saveOfflineBarButtonItem];
      }
      BOOL v13 = v12;

      v14 = [(ReadingListViewController *)self editButtonItem];
      v16[4] = v14;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];

      goto LABEL_14;
    }
    v17[0] = v3;
    uint64_t v4 = [(ReadingListViewController *)self editButtonItem];
    v17[1] = v4;
    BOOL v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = v17;
  }
  else
  {
    uint64_t v4 = [(ReadingListViewController *)self _unreadFilterBarButtonItem];
    v18[0] = v4;
    v18[1] = v3;
    BOOL v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = v18;
  }
  uint64_t v7 = [v5 arrayWithObjects:v6 count:2];
LABEL_14:

  return (NSArray *)v7;
}

- (id)_deleteBarButtonItem
{
  cachedDeleteBarButtonItem = self->_cachedDeleteBarButtonItem;
  if (!cachedDeleteBarButtonItem)
  {
    uint64_t v4 = _WBSLocalizedString();
    BOOL v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v4 style:0 target:self action:sel__deleteBookmarks_];
    uint64_t v6 = self->_cachedDeleteBarButtonItem;
    self->_cachedDeleteBarButtonItem = v5;

    cachedDeleteBarButtonItem = self->_cachedDeleteBarButtonItem;
  }
  return cachedDeleteBarButtonItem;
}

- (void)_deleteBookmarks:(id)a3
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Tap delete selected reading list items", buf, 2u);
  }
  BOOL v5 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
  uint64_t v6 = +[FeatureManager sharedFeatureManager];
  int v7 = [v6 isInMemoryBookmarkChangeTrackingAvailable];

  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__ReadingListViewController__deleteBookmarks___block_invoke;
    v16[3] = &unk_1E6D7B058;
    v16[4] = self;
    id v17 = v5;
    BOOL v8 = (void *)MEMORY[0x1E4E42950](v16);
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __46__ReadingListViewController__deleteBookmarks___block_invoke_2;
  BOOL v13 = &unk_1E6D7B058;
  v14 = self;
  id v15 = v5;
  id v9 = v5;
  [(ReadingListViewController *)self _readingListItemsAtIndexPaths:v9 lockAndPerformUpdate:&v10 performBlockIfLockFailed:v8];
  -[ReadingListViewController setEditing:](self, "setEditing:", 0, v10, v11, v12, v13, v14);
}

uint64_t __46__ReadingListViewController__deleteBookmarks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1000);
  BOOL v5 = *(void **)(v3 + 1016);
  id v6 = a2;
  objc_msgSend(v4, "deleteBookmarksInMemory:inFolder:", v6, objc_msgSend(v5, "folderID"));

  int v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v7, "didDeleteNumberOfBookmarksInMemory:", objc_msgSend(*(id *)(a1 + 40), "count"));

  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  return [v8 _updateTableViewByRemovingReadingListItemsAtIndexPaths:v9];
}

uint64_t __46__ReadingListViewController__deleteBookmarks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1000) deleteBookmarks:a2 postChangeNotification:0];
  if (result)
  {
    [*(id *)(a1 + 32) _scheduleDelayedChangeNotification];
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _updateTableViewByRemovingReadingListItemsAtIndexPaths:v5];
  }
  return result;
}

- (id)_saveOfflineBarButtonItem
{
  cachedSaveOfflineBarButtonItem = self->_cachedSaveOfflineBarButtonItem;
  if (!cachedSaveOfflineBarButtonItem)
  {
    uint64_t v4 = _WBSLocalizedString();
    uint64_t v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v4 style:0 target:self action:sel__saveForOffline_];
    id v6 = self->_cachedSaveOfflineBarButtonItem;
    self->_cachedSaveOfflineBarButtonItem = v5;

    cachedSaveOfflineBarButtonItem = self->_cachedSaveOfflineBarButtonItem;
  }
  return cachedSaveOfflineBarButtonItem;
}

- (void)_saveForOffline:(id)a3
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Tap save archives for selected reading list items", buf, 2u);
  }
  uint64_t v5 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ReadingListViewController__saveForOffline___block_invoke;
  v7[3] = &unk_1E6D78008;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ReadingListViewController__saveForOffline___block_invoke_3;
  v6[3] = &unk_1E6D78008;
  [(ReadingListViewController *)self _readingListItemsAtIndexPaths:v5 lockAndPerformUpdate:v7 performBlockIfLockFailed:v6];
  [(ReadingListViewController *)self setEditing:0];
}

void __45__ReadingListViewController__saveForOffline___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_26);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 1000) saveArchivesForReadingListBookmarks:v3];
}

uint64_t __45__ReadingListViewController__saveForOffline___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shouldArchive] ^ 1;
}

void __45__ReadingListViewController__saveForOffline___block_invoke_3(uint64_t a1)
{
  [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:*(void *)(a1 + 32)];
  id v1 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v1 didPreventBookmarkActionWithBookmarkType:2 actionType:2];
}

- (void)_updateEditingButtonsEnabled
{
  id v3 = [(ReadingListViewController *)self _deleteBarButtonItem];
  uint64_t v4 = [(ReadingListViewController *)self _saveOfflineBarButtonItem];
  if ([(ReadingListViewController *)self isEditing])
  {
    uint64_t v5 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
    objc_msgSend(v3, "setEnabled:", objc_msgSend(v5, "count") != 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__ReadingListViewController__updateEditingButtonsEnabled__block_invoke;
    v7[3] = &unk_1E6D7B0A0;
    v7[4] = self;
    id v6 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v7);
    [v4 setEnabled:v6 != 0];
  }
  else
  {
    [v3 setEnabled:0];
    [v4 setEnabled:0];
  }
}

uint64_t __57__ReadingListViewController__updateEditingButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = [*(id *)(a1 + 32) _bookmarkAtIndexPath:a2];
  uint64_t v3 = [v2 shouldArchive] ^ 1;

  return v3;
}

- (id)_unreadFilterButtonTitle
{
  double v2 = _WBSLocalizedString();
  return v2;
}

- (id)_unreadFilterButtonIdentifier
{
  if (self->_showingAllBookmarks) {
    return @"ReadingListShowUnreadButton";
  }
  else {
    return @"ReadingListShowAllButton";
  }
}

- (id)_editButtonIdentifier
{
  if ([(ReadingListViewController *)self isEditing]) {
    double v2 = @"ReadingListDoneButton";
  }
  else {
    double v2 = @"ReadingListEditButton";
  }
  return v2;
}

- (void)_scheduleDelayedChangeNotification
{
  if ([(NSTimer *)self->_deletionNotificationTimer isValid]) {
    [(NSTimer *)self->_deletionNotificationTimer invalidate];
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__postChangeNotification selector:0 userInfo:0 repeats:10.0];
  deletionNotificationTimer = self->_deletionNotificationTimer;
  self->_deletionNotificationTimer = v3;
}

- (void)_postChangeNotification
{
  [(NSTimer *)self->_deletionNotificationTimer invalidate];
  deletionNotificationTimer = self->_deletionNotificationTimer;
  self->_deletionNotificationTimer = 0;

  collection = self->_collection;
  [(WebBookmarkCollection *)collection _postBookmarksChangedSyncNotification];
}

- (void)_connectSafariFetcherServerProxy
{
  uint64_t v3 = +[FeatureManager sharedFeatureManager];
  int v4 = [v3 isOfflineReadingListAvailable];

  if (v4 && !self->_safariFetcherServerProxy)
  {
    uint64_t v5 = (SafariFetcherServerProxy *)objc_alloc_init(MEMORY[0x1E4FB6058]);
    safariFetcherServerProxy = self->_safariFetcherServerProxy;
    self->_safariFetcherServerProxy = v5;

    int v7 = self->_safariFetcherServerProxy;
    [(SafariFetcherServerProxy *)v7 setDelegate:self];
  }
}

- (void)_disconnectSafariFetcherServerProxy
{
  safariFetcherServerProxy = self->_safariFetcherServerProxy;
  if (safariFetcherServerProxy)
  {
    [(SafariFetcherServerProxy *)safariFetcherServerProxy setDelegate:0];
    int v4 = self->_safariFetcherServerProxy;
    self->_safariFetcherServerProxy = 0;
  }
}

- (void)_webBookmarksDidReload:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB60E8], "mainBookmarkCollection", a3);
  int v4 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
  collection = self->_collection;
  self->_collection = v4;

  [(ReadingListViewController *)self _reloadReadingListAndTable];
}

- (void)_readingListBookmarkMetadataDidUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ReadingListViewController *)self _updateTableViewByComputingDifference];
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"BookmarkWithUpdatedMetadataKey"];

  if (v6)
  {
    visibleBookmarkIDs = self->_visibleBookmarkIDs;
    BOOL v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "identifier"));
    LODWORD(visibleBookmarkIDs) = [(NSMutableSet *)visibleBookmarkIDs containsObject:v8];

    if (visibleBookmarkIDs)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v9 = [(UITableView *)self->_tableView visibleCells];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v16 + 1) + 8 * i);
            int v15 = [v14 bookmarkID];
            if (v15 == [v6 identifier])
            {
              [v14 setBookmark:v6];
              [(ReadingListViewController *)self _setIconForBookmark:v6 cell:v14 synchronously:self->_loadIconsSynchronously];

              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
}

- (id)_currentReadingListBookmark
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained readingListViewControllerCurrentReadingListItem:self];
  uint64_t v5 = [v4 readingListBookmark];

  return v5;
}

- (void)updateAndScrollToCurrentSelectedItemIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v20 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  if (([(ReadingListViewController *)self isEditing] & 1) == 0)
  {
    [(ReadingListViewController *)self _restoreCellSeparator];
    uint64_t v5 = [(UITableView *)self->_tableView indexPathsForVisibleRows];
    id v6 = [(ReadingListViewController *)self _currentReadingListBookmark];
    if (v6)
    {
      int v7 = [(WebBookmarkList *)self->_readingList bookmarkArray];
      uint64_t v8 = [v7 indexOfObject:v6];

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:0];
        uint64_t v10 = [v5 firstObject];
        uint64_t v11 = [v5 lastObject];
        uint64_t v12 = [v9 row];
        if (v12 <= [v10 row])
        {
          tableView = self->_tableView;
          BOOL v16 = v3;
          int v15 = v9;
        }
        else
        {
          uint64_t v13 = [v9 row];
          if (v13 >= [v11 row])
          {
            long long v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v9, "row") - 1, 0);
            long long v18 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v17];
            [v18 setSeparatorStyle:0];

            if (v3) {
              uint64_t v19 = 3;
            }
            else {
              uint64_t v19 = 0;
            }
            [(UITableView *)self->_tableView selectRowAtIndexPath:v9 animated:1 scrollPosition:v19];

            goto LABEL_14;
          }
          tableView = self->_tableView;
          int v15 = v9;
          BOOL v16 = 0;
        }
        [(UITableView *)tableView selectRowAtIndexPath:v15 animated:1 scrollPosition:v16];
LABEL_14:
      }
    }
    else
    {
      [(UITableView *)self->_tableView deselectRowAtIndexPath:v20 animated:0];
    }
  }
}

- (void)_restoreCellSeparator
{
  id v6 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  if ([v6 row])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") - 1, 0);
    UITableViewCellSeparatorStyle v4 = [(UITableView *)self->_tableView separatorStyle];
    uint64_t v5 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v3];
    [v5 setSeparatorStyle:v4];
  }
}

- (id)_URLForRowAtIndexPath:(id)a3
{
  BOOL v3 = [(ReadingListViewController *)self _bookmarkAtIndexPath:a3];
  UITableViewCellSeparatorStyle v4 = [MEMORY[0x1E4F78598] builder];
  uint64_t v5 = [v4 navigationIntentWithBookmark:v3];
  id v6 = [v5 URL];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(WebBookmarkList *)self->_readingList bookmarkCount];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v6];
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:@"ReadingListTableViewCellWithImage" forIndexPath:v6];

  [v9 setBookmark:v8];
  uint64_t v10 = [v8 UUID];
  objc_msgSend(v9, "setBookmark:isArchiving:", v8, objc_msgSend(v10, "isEqualToString:", self->_archivingBookmarkUUID));

  objc_msgSend(v9, "safari_annotateWithReadingListItem:", v8);
  if ([(ReadingListViewController *)self _shouldUseTranslucentAppearance]) {
    [v9 setUsesVibrantEffect:1];
  }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (self->_shouldUseSearchControllerInNavigationBar)
  {
    UITableViewCellSeparatorStyle v4 = 0;
  }
  else
  {
    UITableViewCellSeparatorStyle v4 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"ReadingListSpacingHeaderReuseIdentifier", a4);
    if (!v4) {
      UITableViewCellSeparatorStyle v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"ReadingListSpacingHeaderReuseIdentifier"];
    }
  }
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 0.0;
  if (!self->_shouldUseSearchControllerInNavigationBar) {
    return 12.0;
  }
  return result;
}

- (id)_iconForUUID:(id)a3 iconData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [(ReadingListLeadImageCache *)self->_imageCache loadImageSynchronouslyForIconUUID:v6];
    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (!v7) {
      goto LABEL_7;
    }
  }
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1818] imageWithData:v7];
  }
LABEL_7:

  return v8;
}

- (void)_setIconForBookmark:(id)a3 cell:(id)a4 synchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 bookmarkID];
  if (v10 == [v8 identifier])
  {
    uint64_t v11 = [v9 imageView];
    uint64_t v12 = [v11 image];

    if (!v12)
    {
      uint64_t v13 = [v8 readingListIconUUID];
      id v14 = [v8 iconData];
      int v15 = [v8 identifier];
      if (a5)
      {
        BOOL v16 = [(ReadingListViewController *)self _iconForUUID:v13 iconData:v14];
        if (v16) {
          [v9 setReadingListIcon:v16];
        }
      }
      else
      {
        int v17 = v15;
        long long v18 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke;
        block[3] = &unk_1E6D7B0F0;
        block[4] = self;
        id v20 = v13;
        id v21 = v14;
        id v22 = v9;
        int v23 = v17;
        dispatch_async(v18, block);
      }
    }
  }
}

void __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _iconForUUID:*(void *)(a1 + 40) iconData:*(void *)(a1 + 48)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke_2;
    block[3] = &unk_1E6D7B0C8;
    id v4 = *(id *)(a1 + 56);
    int v6 = *(_DWORD *)(a1 + 64);
    id v5 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bookmarkID];
  if (result == *(_DWORD *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setReadingListIcon:*(void *)(a1 + 40)];
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setNeedsDisplay];
  }
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_isUsingSwipeAction = 1;
  -[ReadingListViewController setEditing:](self, "setEditing:", 1, a4);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_isUsingSwipeAction = 0;
  -[ReadingListViewController setEditing:](self, "setEditing:", 0, a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v9];
  visibleBookmarkIDs = self->_visibleBookmarkIDs;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v10, "identifier"));
  [(NSMutableSet *)visibleBookmarkIDs addObject:v12];

  [(ReadingListViewController *)self _fetchMetadataIfNeededForBookmark:v10];
  [(ReadingListViewController *)self _setIconForBookmark:v10 cell:v8 synchronously:self->_loadIconsSynchronously];
  uint64_t v13 = [(ReadingListViewController *)self _currentReadingListBookmark];
  if ([v13 isEqualToBookmark:v10])
  {
    if (([v8 isSelected] & 1) == 0
      && ([(ReadingListViewController *)self isEditing] & 1) == 0)
    {
      [v17 selectRowAtIndexPath:v9 animated:1 scrollPosition:0];
    }
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v9, "row") + 1, 0);
    unint64_t v15 = [v14 row];
    if (v15 < [(WebBookmarkList *)self->_readingList bookmarkCount])
    {
      BOOL v16 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v14];
      if ([v13 isEqualToBookmark:v16]) {
        [v8 setSeparatorStyle:0];
      }
    }
  }
}

- (void)_fetchMetadataIfNeededForBookmark:(id)a3
{
  id v6 = a3;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v4 = objc_msgSend(v3, "safari_shouldAutomaticallyDownloadReadingListItems");

  if ((v4 & 1) == 0)
  {
    if (+[ReadingListMetadataFetcher shouldFetchMetadataForBookmark:v6])
    {
      id v5 = +[ReadingListMetadataFetcher sharedMetadataFetcher];
      [v5 fetchMetadataForReadingListBookmark:v6 withProvider:0];
    }
    else
    {
      if (!+[ReadingListMetadataFetcher shouldFetchThumbnailForBookmark:v6])goto LABEL_7; {
      id v5 = +[ReadingListMetadataFetcher sharedMetadataFetcher];
      }
      [v5 fetchThumbnailForReadingListBookmark:v6 withProvider:0];
    }
  }
LABEL_7:
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  visibleBookmarkIDs = self->_visibleBookmarkIDs;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(a4, "bookmarkID", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableSet *)visibleBookmarkIDs removeObject:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ReadingListViewController *)self isEditing];
  id v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      int v17 = 134218240;
      uint64_t v18 = [v7 row];
      __int16 v19 = 2048;
      uint64_t v20 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Tap to select reading list item at row %ld, number of rows: %ld", (uint8_t *)&v17, 0x16u);
    }
    [(ReadingListViewController *)self _updateEditingButtonsEnabled];
  }
  else
  {
    if (v10)
    {
      uint64_t v12 = v9;
      int v17 = 134218240;
      uint64_t v18 = [v7 row];
      __int16 v19 = 2048;
      uint64_t v20 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, "Tap reading list item at row %ld, number of rows: %ld", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v13 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v7];
    id v14 = [MEMORY[0x1E4F78598] builder];
    unint64_t v15 = [v14 navigationIntentWithBookmark:v13];

    [v15 setShouldDismissSidebarOnLoad:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
    [WeakRetained dispatchNavigationIntent:v15];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(ReadingListViewController *)self isEditing])
  {
    int v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      int v10 = 134218240;
      uint64_t v11 = [v7 row];
      __int16 v12 = 2048;
      uint64_t v13 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Tap to deselect editing reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);
    }
    [(ReadingListViewController *)self _updateEditingButtonsEnabled];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4
{
  return [(ReadingListViewController *)self _createActions:&unk_1F3C73E90 forRowAtIndexPath:a4 allowingNewlineInTitles:1 withBlock:&__block_literal_global_163];
}

id __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6)
{
  id v8 = a6;
  id v9 = (void *)MEMORY[0x1E4FB1CB8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke_2;
  v13[3] = &unk_1E6D7B138;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 swipeActionWithStyle:a5 title:a2 handler:v13];

  return v11;
}

uint64_t __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4
{
  return [(ReadingListViewController *)self _createActions:&unk_1F3C73EA8 forRowAtIndexPath:a4 allowingNewlineInTitles:1 withBlock:&__block_literal_global_172];
}

id __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6)
{
  id v8 = a6;
  id v9 = (void *)MEMORY[0x1E4FB1CB8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke_2;
  v14[3] = &unk_1E6D7B138;
  id v15 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 swipeActionWithStyle:a5 title:a2 handler:v14];
  __int16 v12 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
  [v11 setColor:v12];

  return v11;
}

uint64_t __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PreviewTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_tableViewController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return [(PreviewTableViewController *)self->_tableViewController tableView:a3 previewForHighlightingContextMenuWithConfiguration:a4];
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return [(PreviewTableViewController *)self->_tableViewController tableView:a3 previewForDismissingContextMenuWithConfiguration:a4];
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)_readingListItemAtIndexPath:(id)a3 lockAndPerformUpdates:(id)a4 performBlockIfLockFailed:(id)a5
{
  uint64_t v11 = a4;
  id v8 = a5;
  id v9 = [(ReadingListViewController *)self _bookmarkAtIndexPath:a3];
  if ([MEMORY[0x1E4FB60E8] isLockedSync])
  {
    id v10 = (void (*)(void))v11[2];
LABEL_7:
    v10();
    goto LABEL_8;
  }
  if ([MEMORY[0x1E4FB60E8] lockSync])
  {
    ((void (*)(void *, void *))v11[2])(v11, v9);
    [MEMORY[0x1E4FB60E8] unlockSync];
    goto LABEL_8;
  }
  if (v8)
  {
    id v10 = (void (*)(void))v8[2];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_readingListItemsAtIndexPaths:(id)a3 lockAndPerformUpdate:(id)a4 performBlockIfLockFailed:(id)a5
{
  id v8 = (void (**)(id, void *))a4;
  id v9 = (void (**)(id, void *))a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__ReadingListViewController__readingListItemsAtIndexPaths_lockAndPerformUpdate_performBlockIfLockFailed___block_invoke;
  v11[3] = &unk_1E6D7B160;
  v11[4] = self;
  id v10 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v11);
  if ([MEMORY[0x1E4FB60E8] isLockedSync])
  {
    v8[2](v8, v10);
  }
  else if ([MEMORY[0x1E4FB60E8] lockSync])
  {
    v8[2](v8, v10);
    [MEMORY[0x1E4FB60E8] unlockSync];
  }
  else if (v9)
  {
    v9[2](v9, v10);
  }
}

uint64_t __105__ReadingListViewController__readingListItemsAtIndexPaths_lockAndPerformUpdate_performBlockIfLockFailed___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bookmarkAtIndexPath:a2];
}

- (void)_updateTableViewByComputingDifference
{
  BOOL v3 = self->_readingList;
  [(ReadingListViewController *)self _reloadReadingList];
  [(ReadingListViewController *)self _updateSearchBar];
  char v4 = [(WebBookmarkList *)self->_readingList differenceFromList:v3 withOptions:3];
  if ([v4 hasChanges])
  {
    id v5 = [(ReadingListViewController *)self tableView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke_2;
    v8[3] = &unk_1E6D7A938;
    id v10 = self;
    id v11 = &__block_literal_global_176;
    id v9 = v4;
    [v5 performBatchUpdates:v8 completion:0];

    -[UIViewController safari_saveTableViewScrollPosition](self);
    LODWORD(v5) = [(WebBookmarkList *)v3 bookmarkCount] != 0;
    if (((v5 ^ ([(WebBookmarkList *)self->_readingList bookmarkCount] == 0)) & 1) == 0) {
      [(ReadingListViewController *)self _updateToolbarItemsAnimated:1];
    }
    id v6 = [(WebBookmarkCollection *)self->_collection readingListWithUnreadOnly:0];
    int v7 = [v6 bookmarkCount];

    if (v7) {
      [(ReadingListViewController *)self _clearExplanationView];
    }
    else {
      [(ReadingListViewController *)self _showExplanationView];
    }
  }
}

id __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v2, "index"), 0);
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) insertions];
  BOOL v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", *(void *)(v1 + 48));

  if ([v3 count])
  {
    char v4 = [*(id *)(v1 + 40) tableView];
    id v5 = v4;
    if (*(void *)(*(void *)(v1 + 40) + 1072)) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 1;
    }
    [v4 insertRowsAtIndexPaths:v3 withRowAnimation:v6];

    int v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    if ([*(id *)(*(void *)(v1 + 40) + 1152) numberOfSections]
      && [*(id *)(*(void *)(v1 + 40) + 1152) numberOfRowsInSection:0]
      && [v3 containsObject:v7])
    {
      [*(id *)(*(void *)(v1 + 40) + 1152) scrollToRowAtIndexPath:v7 atScrollPosition:1 animated:1];
    }
  }
  int v23 = v3;
  id v8 = [*(id *)(v1 + 32) removals];
  id v9 = objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", *(void *)(v1 + 48));

  if ([v9 count]) {
    [*(id *)(*(void *)(v1 + 40) + 1152) deleteRowsAtIndexPaths:v9 withRowAnimation:2];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = objc_msgSend(*(id *)(v1 + 32), "insertions", v9);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = [v15 associatedIndex];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v1;
          uint64_t v18 = *(void **)(*(void *)(v1 + 40) + 1152);
          __int16 v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v16 inSection:0];
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v15, "index"), 0);
          uint64_t v21 = v18;
          uint64_t v1 = v17;
          [v21 moveRowAtIndexPath:v19 toIndexPath:v20];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
}

- (void)_updateTableViewByRemovingReadingListItemAtIndexPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[ReadingListViewController _updateTableViewByRemovingReadingListItemsAtIndexPaths:](self, "_updateTableViewByRemovingReadingListItemsAtIndexPaths:", v6, v7, v8);
}

- (void)_readingListItemAtIndexPathDelete:(id)a3
{
  id v4 = a3;
  id v5 = +[FeatureManager sharedFeatureManager];
  int v6 = [v5 isInMemoryBookmarkChangeTrackingAvailable];

  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke;
    v11[3] = &unk_1E6D7B1A8;
    v11[4] = self;
    id v12 = v4;
    id v7 = (void *)MEMORY[0x1E4E42950](v11);
  }
  else
  {
    id v7 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke_2;
  v9[3] = &unk_1E6D7B1A8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ReadingListViewController *)self _readingListItemAtIndexPath:v8 lockAndPerformUpdates:v9 performBlockIfLockFailed:v7];
}

uint64_t __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) deleteBookmarkInMemory:a2];
  BOOL v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v3 didDeleteBookmarkInMemory];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _updateTableViewByRemovingReadingListItemAtIndexPath:v5];
}

void __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 1000) deleteBookmark:v3 postChangeNotification:0])
  {
    [*(id *)(a1 + 32) _scheduleDelayedChangeNotification];
    [*(id *)(a1 + 32) _updateTableViewByRemovingReadingListItemAtIndexPath:*(void *)(a1 + 40)];
    if (([v3 isMarkedAsRead] & 1) == 0)
    {
      id v4 = +[Application sharedApplication];
      [v4 setReadingListWidgetNeedsReload];

      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXWidgets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item deletion", v6, 2u);
      }
    }
  }
}

- (id)_createActions:(id)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitles:(BOOL)a5 withBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__ReadingListViewController__createActions_forRowAtIndexPath_allowingNewlineInTitles_withBlock___block_invoke;
  v16[3] = &unk_1E6D7B1D0;
  v16[4] = self;
  id v17 = v10;
  BOOL v19 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v16);

  return v14;
}

uint64_t __96__ReadingListViewController__createActions_forRowAtIndexPath_allowingNewlineInTitles_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 integerValue];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  return [v3 _createAction:v4 forRowAtIndexPath:v6 allowingNewlineInTitle:v5 withBlock:v7];
}

- (id)_createAction:(int64_t)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitle:(BOOL)a5 withBlock:(id)a6
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = (void (**)(id, id, __CFString *, void *, uint64_t, void *))a6;
  objc_initWeak(&location, self);
  if (a3 == 1)
  {
    _WBSLocalizedString();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke;
    v63[3] = &unk_1E6D77F98;
    objc_copyWeak(&v65, &location);
    id v64 = v9;
    id v13 = v10[2](v10, v11, @"DeleteReadingListItem", v12, 1, v63);

    objc_destroyWeak(&v65);
    goto LABEL_20;
  }
  id v14 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v9];
  id v11 = v14;
  if (a3 == 4)
  {
    v28 = [v14 dateLastViewed];

    uint64_t v29 = _WBSLocalizedString();
    if (v28)
    {
      v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_228;
      v54[3] = &unk_1E6D77F98;
      objc_copyWeak(&v56, &location);
      id v55 = v9;
      id v13 = v10[2](v10, v29, @"MarkUnreadReadingListItem", v30, 0, v54);

      objc_destroyWeak(&v56);
    }
    else
    {
      v33 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_247;
      v51[3] = &unk_1E6D77F98;
      objc_copyWeak(&v53, &location);
      id v52 = v9;
      id v13 = v10[2](v10, v29, @"MarkReadReadingListItem", v33, 0, v51);

      objc_destroyWeak(&v53);
    }
  }
  else
  {
    if (a3 != 2
      || (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
          id v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = objc_msgSend(v15, "safari_shouldAutomaticallyDownloadReadingListItems"),
          v15,
          (v16 & 1) != 0))
    {
LABEL_6:
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_248;
      v47[3] = &unk_1E6D7B220;
      objc_copyWeak(&v50, &location);
      id v48 = v9;
      id v11 = v11;
      id v49 = v11;
      v40 = (void *)MEMORY[0x1E4E42950](v47);
      if (a3 == 16)
      {
        id v17 = _WBSLocalizedString();
        long long v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_4;
        v41[3] = &unk_1E6D77E20;
        id v42 = v11;
        id v13 = v10[2](v10, v17, @"CopyReadingListItem", v27, 0, v41);
      }
      else
      {
        if (a3 != 8)
        {
          id v13 = 0;
          goto LABEL_14;
        }
        id v17 = objc_msgSend(MEMORY[0x1E4FB13F0], "_sf_openInNewTabActionWithHandler:", &__block_literal_global_253);
        id v18 = [v17 title];
        BOOL v19 = [v17 image];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_257;
        v45[3] = &unk_1E6D77E70;
        id v20 = v40;
        id v46 = v20;
        v39 = v10[2](v10, v18, @"OpenInNewTabReadingListItem", v19, 0, v45);

        uint64_t v21 = [v11 address];
        id v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_259;
        v43[3] = &unk_1E6D77E70;
        id v44 = v20;
        long long v24 = [WeakRetained openInTabGroupMenuWithNewTabGroupName:0 URL:v22 descendantCount:0 handler:v43];

        long long v25 = (void *)MEMORY[0x1E4FB1970];
        v67[0] = v39;
        v67[1] = v24;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        id v13 = [v25 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v26];

        long long v27 = v46;
      }

LABEL_14:
      objc_destroyWeak(&v50);
      goto LABEL_20;
    }
    if ([v11 shouldArchive])
    {
      v34 = _WBSLocalizedString();
      v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.slash"];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_197;
      v60[3] = &unk_1E6D77F98;
      objc_copyWeak(&v62, &location);
      id v61 = v9;
      id v13 = v10[2](v10, v34, @"DontSaveReadingListItem", v35, 0, v60);

      objc_destroyWeak(&v62);
    }
    else
    {
      v31 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
      int v32 = [v31 isNetworkReachable];

      if (!v32) {
        goto LABEL_6;
      }
      v36 = _WBSLocalizedString();
      v37 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.and.arrow.down"];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3;
      v57[3] = &unk_1E6D77F98;
      objc_copyWeak(&v59, &location);
      id v58 = v9;
      id v13 = v10[2](v10, v36, @"SaveOfflineReadingListItem", v37, 0, v57);

      objc_destroyWeak(&v59);
    }
  }
LABEL_20:

  objc_destroyWeak(&location);
  return v13;
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v3;
      uint64_t v6 = [v4 row];
      uint64_t v7 = [WeakRetained tableView];
      uint64_t v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap delete reading list item at row %ld, number of rows: %ld", (uint8_t *)&v9, 0x16u);
    }
    [WeakRetained _readingListItemAtIndexPathDelete:*(void *)(a1 + 32)];
  }
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_197(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v3;
      uint64_t v6 = [v4 row];
      uint64_t v7 = [WeakRetained tableView];
      uint64_t v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap delete archive of reading list item at row %ld, number of rows: %ld", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    v10[4] = WeakRetained;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_198;
    v11[3] = &unk_1E6D7B1F8;
    v11[4] = WeakRetained;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2;
    v10[3] = &unk_1E6D7B1F8;
    [WeakRetained _readingListItemAtIndexPath:v9 lockAndPerformUpdates:v11 performBlockIfLockFailed:v10];
  }
}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_198(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "deleteArchiveForReadingListBookmarkWithID:", objc_msgSend(a2, "identifier"));
  id v3 = *(void **)(a1 + 32);
  return [v3 _reloadReadingListAndTable];
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:*(void *)(a1 + 32)];
  id v1 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v1 didPreventBookmarkActionWithBookmarkType:2 actionType:2];
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v3;
      uint64_t v6 = [v4 row];
      uint64_t v7 = [WeakRetained tableView];
      uint64_t v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap save archive of reading list item at row %ld, number of rows: %ld", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    v10[4] = WeakRetained;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_208;
    v11[3] = &unk_1E6D7B1F8;
    v11[4] = WeakRetained;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_209;
    v10[3] = &unk_1E6D7B1F8;
    [WeakRetained _readingListItemAtIndexPath:v9 lockAndPerformUpdates:v11 performBlockIfLockFailed:v10];
  }
}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_208(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "saveArchiveForReadingListBookmarkWithID:", objc_msgSend(a2, "identifier"));
  id v3 = *(void **)(a1 + 32);
  return [v3 _reloadReadingListAndTable];
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_209(uint64_t a1)
{
  [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:*(void *)(a1 + 32)];
  id v1 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v1 didPreventBookmarkActionWithBookmarkType:2 actionType:2];
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_228(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v3;
      uint64_t v6 = [v4 row];
      uint64_t v7 = [WeakRetained tableView];
      uint64_t v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      int v10 = 134218240;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap mark unread on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);
    }
    [WeakRetained _readingListItemAtIndexPath:*(void *)(a1 + 32) setUnread:1];
    uint64_t v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didManuallyMarkReadingListItemAsRead:0];
  }
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_247(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v3;
      uint64_t v6 = [v4 row];
      uint64_t v7 = [WeakRetained tableView];
      uint64_t v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      int v10 = 134218240;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap mark read on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);
    }
    [WeakRetained _readingListItemAtIndexPath:*(void *)(a1 + 32) setUnread:0];
    uint64_t v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didManuallyMarkReadingListItemAsRead:1];
  }
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_248(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = v5;
      uint64_t v8 = [v6 row];
      uint64_t v9 = [WeakRetained tableView];
      uint64_t v10 = objc_msgSend(v9, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      int v15 = 134218240;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_DEFAULT, "Tap open in new tab on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F78598] builder];
    [v11 setPrefersOpenInNewTab:1];
    [v11 setPreferredTabOrder:a2];
    __int16 v12 = [v11 navigationIntentWithBookmark:*(void *)(a1 + 40)];
    id v13 = objc_loadWeakRetained(WeakRetained + 142);
    [v13 dispatchNavigationIntent:v12];

    if ([v12 shouldOrderToForeground])
    {
      id v14 = objc_loadWeakRetained(WeakRetained + 143);
      [v14 removeSingleBlankTabFromActiveTabGroup];
    }
  }
}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_257(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_259(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_4(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) address];
  id v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = v2;
  if (v1) {
    [v2 setURL:v1];
  }
  else {
    [v2 setString:v4];
  }
}

- (void)_readingListItemAtIndexPath:(id)a3 setUnread:(BOOL)a4
{
  int v4 = a4;
  id v12 = a3;
  uint64_t v6 = -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:");
  uint64_t v7 = [v6 dateLastViewed];
  int v8 = v7 != 0;

  if (v8 != v4) {
    goto LABEL_5;
  }
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained readingListViewController:self setBookmark:v6 asRead:0];

LABEL_5:
    [(UITableView *)self->_tableView setEditing:0 animated:1];
    goto LABEL_6;
  }
  BOOL showingAllBookmarks = self->_showingAllBookmarks;
  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  [v11 readingListViewController:self setBookmark:v6 asRead:1];

  if (showingAllBookmarks) {
    goto LABEL_5;
  }
  [(ReadingListViewController *)self _updateTableViewByRemovingReadingListItemAtIndexPath:v12];
LABEL_6:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_loadIconsSynchronously = 0;
}

- (id)currentStateDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  return 0;
}

- (void)bookmarksServerProxyDidFinishFetching:(id)a3
{
  if (self->_archivingBookmarkUUID) {
    -[ReadingListViewController bookmarksServerProxy:didStopFetchingReadingListItem:](self, "bookmarksServerProxy:didStopFetchingReadingListItem:", self->_safariFetcherServerProxy);
  }
  [(ReadingListViewController *)self _disconnectSafariFetcherServerProxy];
}

- (void)bookmarksServerProxyConnectionInvalidated:(id)a3
{
  if (self->_safariFetcherServerProxy == a3)
  {
    [(ReadingListViewController *)self _disconnectSafariFetcherServerProxy];
    [(ReadingListViewController *)self _connectSafariFetcherServerProxy];
  }
}

- (void)bookmarksServerProxy:(id)a3 didStartFetchingReadingListItem:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (SafariFetcherServerProxy *)a3;
  id v7 = a4;
  if (v7
    && self->_safariFetcherServerProxy == v6
    && ![(NSString *)self->_archivingBookmarkUUID isEqualToString:v7])
  {
    if (self->_archivingBookmarkUUID) {
      -[ReadingListViewController bookmarksServerProxy:didStopFetchingReadingListItem:](self, "bookmarksServerProxy:didStopFetchingReadingListItem:", self->_safariFetcherServerProxy);
    }
    int v8 = [(WebBookmarkCollection *)self->_collection bookmarkWithUUID:v7];
    if (v8)
    {
      id v20 = v6;
      objc_storeStrong((id *)&self->_archivingBookmarkUUID, a4);
      [(UITableView *)self->_tableView indexPathsForVisibleRows];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        uint64_t v19 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            int v15 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v14];
            uint64_t v16 = [v15 UUID];
            int v17 = [v16 isEqualToString:v7];

            if (v17)
            {
              uint64_t v18 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v14];
              int v8 = v19;
              [v18 setBookmark:v19 isArchiving:1];

              goto LABEL_17;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
          int v8 = v19;
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      uint64_t v6 = v20;
    }
  }
}

- (void)bookmarksServerProxy:(id)a3 didStopFetchingReadingListItem:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (SafariFetcherServerProxy *)a3;
  id v7 = a4;
  if (self->_safariFetcherServerProxy == v6 && self->_archivingBookmarkUUID)
  {
    int v8 = -[WebBookmarkCollection bookmarkWithUUID:](self->_collection, "bookmarkWithUUID:");
    if (v8)
    {
      id v20 = v7;
      [(UITableView *)self->_tableView indexPathsForVisibleRows];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        uint64_t v19 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v14 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v13];
            int v15 = [v14 UUID];
            int v16 = [v15 isEqualToString:self->_archivingBookmarkUUID];

            if (v16)
            {
              int v17 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v13];
              int v8 = v19;
              [v17 setBookmark:v19 isArchiving:0];

              goto LABEL_14;
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          int v8 = v19;
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      archivingBookmarkUUID = self->_archivingBookmarkUUID;
      self->_archivingBookmarkUUID = 0;

      [(ReadingListViewController *)self _reloadReadingListAndTable];
      id v7 = v20;
    }
  }
}

- (id)safari_tableViewForScrollPositionSaving
{
  return self->_tableView;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return @"ReadingListCollection";
}

- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4
{
  return [(ReadingListViewController *)self _URLForRowAtIndexPath:a4];
}

- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4
{
  int v4 = [(ReadingListViewController *)self _createActions:&unk_1F3C73EC0 forRowAtIndexPath:a4 allowingNewlineInTitles:0 withBlock:&__block_literal_global_285];
  uint64_t v5 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v4];

  return v5;
}

id __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4FB13F0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2;
  v16[3] = &unk_1E6D7B248;
  id v17 = v10;
  id v12 = v10;
  id v13 = a3;
  uint64_t v14 = [v11 actionWithTitle:a2 image:a4 identifier:0 handler:v16];
  [v14 setAccessibilityIdentifier:v13];

  if (a5) {
    [v14 setAttributes:2];
  }

  return v14;
}

uint64_t __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v10 = a3;
  uint64_t v6 = (NSString *)a4;
  userTypedFilter = self->_userTypedFilter;
  if (userTypedFilter != v6 && ![(NSString *)userTypedFilter isEqualToString:v6])
  {
    int v8 = (NSString *)[(NSString *)v6 copy];
    uint64_t v9 = self->_userTypedFilter;
    self->_userTypedFilter = v8;

    [(ReadingListViewController *)self _reloadReadingListAndTable];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  userTypedFilter = self->_userTypedFilter;
  self->_userTypedFilter = 0;

  [(ReadingListViewController *)self _reloadReadingListAndTable];
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB1710];
  id v7 = a5;
  id v8 = [v6 alloc];
  uint64_t v9 = [(ReadingListViewController *)self _bookmarkAtIndexPath:v7];

  id v10 = objc_msgSend(v8, "_sf_initWithBookmark:", v9);
  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartDragWithDragContentType:9];
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5 = a4;
  if ([(ReadingListViewController *)self isEditing]) {
    char v6 = 0;
  }
  else {
    char v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "_sf_canCreateURLsFromDropSession:", v5);
  }

  return v6;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D28]), "initWithDropOperation:dropLocation:", -[WebBookmarkCollection dropOperationForReadingListDropSession:]((uint64_t)self->_collection, a4), 2);
  return v5;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  collection = self->_collection;
  objc_msgSend(a4, "session", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = [v7 items];
  -[WebBookmarkCollection dropDragItemsInReadingList:updatingController:]((uint64_t)collection, v6, self);
}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  id v3 = WebBookmarksReadingListFolderTitle();
  [v4 setTitle:v3];

  [v4 setEligibleForSearch:1];
  [v4 setEligibleForPrediction:1];
}

- (BOOL)showingAllBookmarks
{
  return self->_showingAllBookmarks;
}

- (ReadingListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ReadingListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
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

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visibleBookmarkIDs, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_deletionNotificationTimer, 0);
  objc_storeStrong((id *)&self->_archivingBookmarkUUID, 0);
  objc_storeStrong((id *)&self->_safariFetcherServerProxy, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_cachedSaveOfflineBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cachedDeleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cachedUnreadFilterBarButtonButton, 0);
}

@end