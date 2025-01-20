@interface BookmarksTableViewController
- (BOOL)_bookmarkAtIndexPathIsFolder:(id)a3;
- (BOOL)_inRootFolder;
- (BOOL)_isShowingAllSyntheticFolders;
- (BOOL)canCreateNewFolder;
- (BOOL)hasTranslucentAppearance;
- (BOOL)isPreviewing;
- (BOOL)restoreStateWithDictionary:(id)a3;
- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5;
- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4;
- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 activeSyntheticFolder:(id)a5 showAllSyntheticFolders:(BOOL)a6 skipOffset:(unsigned int)a7;
- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 skipOffset:(unsigned int)a5;
- (BookmarksTableViewControllerDelegate)delegate;
- (LinkPreviewProvider)linkPreviewProvider;
- (WebBookmark)folder;
- (WebBookmarkCollection)collection;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_bookmarkAtIndexPath:(id)a3;
- (id)_dragItemsAtIndexPath:(id)a3 includingFolders:(BOOL)a4;
- (id)_fontForCurrentTraitCollection;
- (id)_newViewControllerForFolder:(id)a3 syntheticFolder:(id)a4 showAllSyntheticFolders:(BOOL)a5;
- (id)_syntheticFolderAtIndexPath:(id)a3;
- (id)_tableViewCellForBookmark:(id)a3 syntheticFolder:(id)a4;
- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3;
- (id)bookmarksTableViewCellWithReuseIdentifier:(id)a3;
- (id)currentStateDictionary;
- (id)safari_tableViewScrollPositionSaveIdentifier;
- (id)selectedBookmarks;
- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)folderID;
- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)minimumNumberOfRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_deleteBookmark:(id)a3 atIndexPath:(id)a4;
- (void)_handleBookmarkItemDeleted:(BOOL)a3 atIndexPath:(id)a4 bookmarkCountBeforeDeletion:(unint64_t)a5 lockedDatabase:(BOOL)a6;
- (void)_moveBookmarks:(id)a3 toFolderID:(int)a4 toIndex:(unsigned int)a5 shouldReorder:(BOOL)a6 isAddingBookmark:(BOOL)a7;
- (void)_pushInfoViewControllerForBookmark:(id)a3;
- (void)_recreateBookmarkLists;
- (void)_updateContentOffsetIfNeeded;
- (void)_updateTableViewCellsTextStyleForEditing:(BOOL)a3;
- (void)_updateTitle;
- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5;
- (void)contentSizeCategoryDidChange;
- (void)loadView;
- (void)reloadAllSyntheticFolders;
- (void)reloadBookmarks;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolder:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setScrollViewScrollsToTop:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updateSeparatorInset;
- (void)updateSeparatorInsetForTraitChange;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation BookmarksTableViewController

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4
{
  return [(BookmarksTableViewController *)self initWithFolder:a3 inCollection:a4 skipOffset:0];
}

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 skipOffset:(unsigned int)a5
{
  return [(BookmarksTableViewController *)self initWithFolder:a3 inCollection:a4 activeSyntheticFolder:0 showAllSyntheticFolders:0 skipOffset:*(void *)&a5];
}

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 activeSyntheticFolder:(id)a5 showAllSyntheticFolders:(BOOL)a6 skipOffset:(unsigned int)a7
{
  BOOL v8 = a6;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BookmarksTableViewController;
  v16 = [(BookmarksTableViewController *)&v30 initWithStyle:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_folder, a3);
    objc_storeStrong((id *)&v17->_collection, a4);
    v17->_skipOffset = a7;
    if (v15 && !v8)
    {
      uint64_t v18 = [v15 bookmarkList];
      bookmarkList = v17->_bookmarkList;
      v17->_bookmarkList = (WebBookmarkList *)v18;

      objc_storeStrong((id *)&v17->_activeSyntheticFolder, a5);
    }
    if (v8)
    {
      allSyntheticFolders = v17->_allSyntheticFolders;
      v17->_allSyntheticFolders = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v21 = [(BookmarksTableViewController *)v17 traitCollection];
    v22 = [v21 preferredContentSizeCategory];
    v23 = +[BookmarksTableViewCellLayoutManager sharedManager];
    [v23 setCurrentContentSizeCategory:v22];

    [(BookmarksTableViewController *)v17 _updateTitle];
    [(BookmarksTableViewController *)v17 _recreateBookmarkLists];
    v32[0] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    id v25 = (id)[(BookmarksTableViewController *)v17 registerForTraitChanges:v24 withTarget:v17 action:sel_contentSizeCategoryDidChange];

    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v27 = (id)[(BookmarksTableViewController *)v17 registerForTraitChanges:v26 withTarget:v17 action:sel_updateSeparatorInsetForTraitChange];

    v28 = v17;
  }

  return v17;
}

- (void)setCollection:(id)a3
{
  v5 = (WebBookmarkCollection *)a3;
  if (self->_collection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collection, a3);
    [(BookmarksTableViewController *)self reloadBookmarks];
    v5 = v6;
  }
}

- (BOOL)_isShowingAllSyntheticFolders
{
  return self->_allSyntheticFolders && [(NSString *)self->_userTypedFilter length] == 0;
}

- (void)_updateTitle
{
  activeSyntheticFolder = self->_activeSyntheticFolder;
  if (activeSyntheticFolder)
  {
    uint64_t v4 = [(SFSyntheticBookmarkFolder *)activeSyntheticFolder title];
  }
  else
  {
    if (self->_allSyntheticFolders) {
      _WBSLocalizedString();
    }
    else {
    uint64_t v4 = [(WebBookmark *)self->_folder localizedTitle];
    }
  }
  id v8 = (id)v4;
  v5 = NSString;
  v6 = _WBSLocalizedString();
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  [(UISearchBar *)self->_searchBar setPlaceholder:v7];

  [(BookmarksTableViewController *)self setTitle:v8];
}

- (BOOL)_inRootFolder
{
  return !self->_activeSyntheticFolder
      && !self->_allSyntheticFolders
      && [(WebBookmark *)self->_folder identifier] == 0;
}

- (void)_recreateBookmarkLists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v19 = [WeakRetained tabGroupProvider];

  if (!self->_activeSyntheticFolder)
  {
    if (self->_allSyntheticFolders)
    {
      v7 = [v19 allSyntheticBookmarkFolders];
      allSyntheticFolders = v7;
      if (!v7) {
        allSyntheticFolders = self->_allSyntheticFolders;
      }
      objc_storeStrong((id *)&self->_allSyntheticFolders, allSyntheticFolders);

      v9 = [v19 perTabGroupBookmarkListForFolderID:0 filteredUsingString:self->_userTypedFilter];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
      int v13 = [v12 usesAllowedSitesOnly];

      if (!v13)
      {
        [(WebBookmarkCollection *)self->_collection listWithID:[(WebBookmark *)self->_folder identifier] skipOffset:LODWORD(self->_skipOffset) includeHidden:0 includeDescendantsAsChildren:[(NSString *)self->_userTypedFilter length] != 0 filteredUsingString:self->_userTypedFilter];
        v16 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
        bookmarkList = self->_bookmarkList;
        self->_bookmarkList = v16;

        if ([(BookmarksTableViewController *)self _inRootFolder])
        {
          uint64_t v18 = [v19 perTabGroupBookmarkListForFolderID:0 filteredUsingString:self->_userTypedFilter];
          [(WebBookmarkList *)self->_bookmarkList setShadowBookmarkList:v18];
        }
        v9 = [(WebBookmarkCollection *)self->_collection favoritesFolder];
        uint64_t v10 = 1080;
        goto LABEL_10;
      }
      id v14 = [(WebBookmarkCollection *)self->_collection webFilterAllowedSitesFolder];
      favoritesFolder = self->_favoritesFolder;
      self->_favoritesFolder = v14;

      if ([(BookmarksTableViewController *)self _inRootFolder])
      {
        v11 = self->_bookmarkList;
        self->_bookmarkList = 0;
        goto LABEL_11;
      }
      [(WebBookmarkCollection *)self->_collection listWithID:[(WebBookmark *)self->_folder identifier] skipOffset:LODWORD(self->_skipOffset) includeHidden:0 includeDescendantsAsChildren:[(NSString *)self->_userTypedFilter length] != 0 filteredUsingString:self->_userTypedFilter];
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = 1072;
LABEL_10:
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;
LABEL_11:

    goto LABEL_12;
  }
  p_bookmarkList = &self->_bookmarkList;
  objc_msgSend(v19, "perTabGroupBookmarkListForFolderID:filteredUsingString:", -[WebBookmarkList folderID](self->_bookmarkList, "folderID"), self->_userTypedFilter);
  v5 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5) {
    v6 = *p_bookmarkList;
  }
  objc_storeStrong((id *)&self->_bookmarkList, v6);

  [(SFSyntheticBookmarkFolder *)self->_activeSyntheticFolder setBookmarkList:*p_bookmarkList];
LABEL_12:
}

- (void)reloadBookmarks
{
  if (!self->_shouldDeferReload)
  {
    [(BookmarksTableViewController *)self _recreateBookmarkLists];
    v3 = [(BookmarksTableViewController *)self tableView];
    [v3 reloadData];

    [(BookmarksTableViewController *)self _updateTitle];
  }
}

- (void)reloadAllSyntheticFolders
{
  if (self->_allSyntheticFolders) {
    [(BookmarksTableViewController *)self reloadBookmarks];
  }
}

- (int)folderID
{
  if (self->_activeSyntheticFolder) {
    return [(WebBookmarkList *)self->_bookmarkList folderID];
  }
  else {
    return [(WebBookmark *)self->_folder identifier];
  }
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
  [(BookmarksTableViewController *)self reloadBookmarks];
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    BOOL v3 = a3;
    self->_previewing = a3;
    v5 = [(BookmarksTableViewController *)self tableView];
    id v7 = v5;
    if (!self->_shouldUseSearchControllerInNavigationBar)
    {
      if (v3) {
        searchBar = 0;
      }
      else {
        searchBar = self->_searchBar;
      }
      [v5 setTableHeaderView:searchBar];
      v5 = v7;
    }
    [v5 setShowsVerticalScrollIndicator:!v3];
  }
}

- (int64_t)minimumNumberOfRows
{
  if (self->_previewing) {
    return 3;
  }
  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewController;
  return [(SFPopoverSizingTableViewController *)&v3 minimumNumberOfRows];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setAllowsSelectionDuringEditing:1];
  [v4 setCellLayoutMarginsFollowReadableWidth:0];
  [v4 setDragDelegate:self];
  [v4 setDropDelegate:self];
  [v4 setKeyboardDismissMode:1];
  [v4 setSpringLoaded:1];
  [(BookmarksTableViewController *)self setTableView:v4];
}

- (void)contentSizeCategoryDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BookmarksTableViewController_contentSizeCategoryDidChange__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__BookmarksTableViewController_contentSizeCategoryDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  _SFRoundFloatToPixels();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setFrame:", 0.0, 0.0, 0.0, v2);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 1139))
  {
    uint64_t v4 = *(void *)(v3 + 1104);
    id v5 = [(id)v3 tableView];
    [v5 setTableHeaderView:v4];
  }
}

- (void)updateSeparatorInsetForTraitChange
{
  uint64_t v3 = [(BookmarksTableViewController *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];
  id v5 = +[BookmarksTableViewCellLayoutManager sharedManager];
  [v5 setCurrentContentSizeCategory:v4];

  [(BookmarksTableViewController *)self updateSeparatorInset];
  id v6 = [(BookmarksTableViewController *)self tableView];
  [v6 setNeedsLayout];
}

- (void)updateSeparatorInset
{
  uint64_t v3 = [(BookmarksTableViewController *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained separatorInsetForBookmarksTableViewController:self];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = 50.0;
  if (IsAccessibilityCategory) {
    double v15 = 0.0;
  }
  double v16 = v15 + v10;
  v17 = [(BookmarksTableViewController *)self tableView];
  [v17 setSeparatorInsetReference:IsAccessibilityCategory];

  id v18 = [(BookmarksTableViewController *)self tableView];
  objc_msgSend(v18, "setSeparatorInset:", v8, v16, v12, v14);
}

- (BOOL)canCreateNewFolder
{
  return !self->_allSyntheticFolders && self->_activeSyntheticFolder == 0;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)BookmarksTableViewController;
  [(SFPopoverSizingTableViewController *)&v14 viewDidLoad];
  self->_needsContentOffsetUpdate = 1;
  [(BookmarksTableViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  uint64_t v3 = [(BookmarksTableViewController *)self tableView];
  [v3 setAutoresizingMask:18];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setAccessibilityIdentifier:@"BookmarksTable"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = WeakRetained;
  if (self->_skipOffset)
  {
    [WeakRetained contentInsetForBookmarksTableViewController:self];
    objc_msgSend(v3, "setContentInset:");
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (self->_shouldUseSearchControllerInNavigationBar) {
      goto LABEL_5;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E4FB1BF0], "sf_installSearchBarInTableView:includeSeparator:", v3, 0);
    double v12 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;
    self->_searchBar = v12;

    self->_needsInitialContentOffsetUpdateForTableHeaderView = 1;
    goto LABEL_8;
  }
  int v6 = [v5 panelViewControllerShouldUseSearchControllerInNavigationItem:self];
  self->_shouldUseSearchControllerInNavigationBar = v6;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_5:
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  [v7 setObscuresBackgroundDuringPresentation:0];
  double v8 = [(BookmarksTableViewController *)self navigationItem];
  [v8 setPreferredSearchBarPlacement:2];

  double v9 = [(BookmarksTableViewController *)self navigationItem];
  [v9 setSearchController:v7];

  double v10 = [v7 searchBar];
  double v11 = self->_searchBar;
  self->_searchBar = v10;

LABEL_8:
  [(UISearchBar *)self->_searchBar setDelegate:self];
LABEL_9:
  [(BookmarksTableViewController *)self updateSeparatorInset];
  if (self->_previewing) {
    [v3 setTableHeaderView:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BookmarksTableViewController;
  [(SFPopoverSizingTableViewController *)&v4 viewWillAppear:a3];
  [(BookmarksTableViewController *)self reloadBookmarks];
  [(BookmarksTableViewController *)self _updateContentOffsetIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BookmarksTableViewController;
  [(SFPopoverSizingTableViewController *)&v9 viewDidAppear:a3];
  self->_needsContentOffsetUpdate = 0;
  objc_super v4 = [(BookmarksTableViewController *)self userActivity];
  id v5 = [v4 activityType];
  uint64_t v6 = *MEMORY[0x1E4F3B128];
  char v7 = [v5 isEqualToString:*MEMORY[0x1E4F3B128]];

  if ((v7 & 1) == 0)
  {
    [v4 invalidate];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:v6];

    [(BookmarksTableViewController *)self setUserActivity:v8];
    objc_super v4 = (void *)v8;
  }
  [v4 setNeedsSave:1];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BookmarksTableViewController;
  [(SFPopoverSizingTableViewController *)&v5 willMoveToParentViewController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setPinnedPaletteForPanelViewController:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BookmarksTableViewController;
  [(BookmarksTableViewController *)&v6 viewWillDisappear:a3];
  -[UIViewController safari_saveTableViewScrollPosition](self);
  objc_super v4 = [(BookmarksTableViewController *)self tableView];
  -[UITableView safari_dismissContextMenu](v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksTableViewControllerWillDisappear:self];
  }
}

- (void)_updateContentOffsetIfNeeded
{
  if (!self->_previewing && self->_needsContentOffsetUpdate)
  {
    if (-[UIViewController safari_hasSavedTableViewScrollPosition]((BOOL)self)
      && -[UIViewController safari_restoreTableViewScrollPosition](self))
    {
      self->_needsInitialContentOffsetUpdateForTableHeaderView = 0;
    }
    if (self->_needsInitialContentOffsetUpdateForTableHeaderView)
    {
      uint64_t v3 = [(BookmarksTableViewController *)self tableView];
      -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](v3);

      self->_needsInitialContentOffsetUpdateForTableHeaderView = 0;
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)BookmarksTableViewController;
  [(SFPopoverSizingTableViewController *)&v5 viewDidLayoutSubviews];
  searchBar = self->_searchBar;
  objc_super v4 = [(BookmarksTableViewController *)self view];
  [v4 layoutMargins];
  -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);
}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(BookmarksTableViewController *)self _isShowingAllSyntheticFolders])
  {
    allSyntheticFolders = self->_allSyntheticFolders;
    return [(NSArray *)allSyntheticFolders count];
  }
  else
  {
    unsigned int v7 = [(WebBookmarkList *)self->_bookmarkList bookmarkCount];
    if ([(BookmarksTableViewController *)self _inRootFolder]
      && ![(NSString *)self->_userTypedFilter length])
    {
      v7 += 2;
    }
    return v7;
  }
}

- (id)_bookmarkAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 row];
  if ([(BookmarksTableViewController *)self _isShowingAllSyntheticFolders]) {
    goto LABEL_2;
  }
  if (![(BookmarksTableViewController *)self _inRootFolder])
  {
    if ([(WebBookmarkList *)self->_bookmarkList bookmarkCount] <= v4)
    {
LABEL_2:
      objc_super v5 = 0;
      goto LABEL_17;
    }
    bookmarkList = self->_bookmarkList;
    uint64_t v7 = v4;
    goto LABEL_16;
  }
  if (v4)
  {
    if (v4 != 1)
    {
LABEL_11:
      if ([(NSString *)self->_userTypedFilter length]) {
        uint64_t v4 = v4;
      }
      else {
        uint64_t v4 = (v4 - 2);
      }
      if ([(WebBookmarkList *)self->_bookmarkList bookmarkCount] <= v4) {
        goto LABEL_2;
      }
      bookmarkList = self->_bookmarkList;
      uint64_t v7 = v4;
LABEL_16:
      objc_super v5 = [(WebBookmarkList *)bookmarkList bookmarkAtIndex:v7];
      goto LABEL_17;
    }
LABEL_10:
    objc_super v5 = [(NSString *)self->_userTypedFilter length];
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if ([(NSString *)self->_userTypedFilter length]) {
    goto LABEL_10;
  }
  objc_super v5 = self->_favoritesFolder;
LABEL_17:
  return v5;
}

- (BOOL)_bookmarkAtIndexPathIsFolder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v4];
  if ([v5 isFolder])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(BookmarksTableViewController *)self _syntheticFolderAtIndexPath:v4];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (id)_syntheticFolderAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(BookmarksTableViewController *)self _inRootFolder]
    && [v4 row] == 1
    && ![(NSString *)self->_userTypedFilter length])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F3AEC8]);
    double v11 = _WBSLocalizedString();
    objc_super v9 = (void *)[v10 initWithBookmarkList:0 title:v11];
  }
  else
  {
    NSUInteger v5 = [(NSArray *)self->_allSyntheticFolders count];
    uint64_t v6 = [v4 row];
    if (!v5 || ((v7 = v6, ![(NSString *)self->_userTypedFilter length]) ? (BOOL v8 = v7 >= v5) : (BOOL v8 = 1), v8))
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = [(NSArray *)self->_allSyntheticFolders objectAtIndexedSubscript:v7];
    }
  }

  return v9;
}

- (id)bookmarksTableViewCellWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(BookmarksTableViewController *)self tableView];
  uint64_t v6 = [v5 dequeueReusableCellWithIdentifier:v4];

  if (!v6)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v4];
    NSUInteger v7 = +[BookmarksTableViewCellLayoutManager sharedManager];
    [v6 setLayoutManager:v7];

    BOOL v8 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    objc_super v9 = [v6 imageView];
    [v9 setPreferredSymbolConfiguration:v8];
  }
  BOOL v10 = [(BookmarksTableViewController *)self hasTranslucentAppearance];
  if (v10) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  double v11 = [v6 backgroundColor];
  }
  [v6 setBackgroundColor:v11];

  objc_msgSend(v6, "sf_setUsesVibrantSelection:", v10);
  return v6;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  return v3;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = 0;
  if (!a4)
  {
    if (!self->_shouldUseSearchControllerInNavigationBar)
    {
      uint64_t v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"BookmarkSpacingHeaderReuseIdentifier"];
      if (!v6) {
        uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"BookmarkSpacingHeaderReuseIdentifier"];
      }
    }
    uint64_t v4 = vars8;
  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (!self->_shouldUseSearchControllerInNavigationBar)
  {
    if (!a4) {
      return 12.0;
    }
    return 0.0;
  }
  if (a4) {
    return 0.0;
  }
  double result = 12.0;
  if (!self->_previewing) {
    return 0.0;
  }
  return result;
}

- (id)_fontForCurrentTraitCollection
{
  double v2 = [(BookmarksTableViewController *)self traitCollection];
  uint64_t v3 = [v2 verticalSizeClass];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  if (v3 == 1) {
    [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v4 maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
  }
  else {
  NSUInteger v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
  }

  return v5;
}

- (id)_tableViewCellForBookmark:(id)a3 syntheticFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 || [(BookmarksTableViewController *)self _isShowingAllSyntheticFolders]) {
    int v8 = 1;
  }
  else {
    int v8 = [v6 isFolder];
  }
  objc_super v9 = [(BookmarksTableViewController *)self traitCollection];
  BOOL v10 = [v9 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (v8) {
    double v12 = @"FolderTableCell";
  }
  else {
    double v12 = @"BookmarkTableCell";
  }
  double v13 = [(BookmarksTableViewController *)self bookmarksTableViewCellWithReuseIdentifier:v12];
  objc_super v14 = [v13 textLabel];
  double v15 = [MEMORY[0x1E4FB1618] labelColor];
  [v14 setTextColor:v15];

  double v16 = [(BookmarksTableViewController *)self _fontForCurrentTraitCollection];
  [v14 setFont:v16];

  v17 = [v13 imageView];
  [v17 setTintColor:0];
  if (!v8)
  {
    objc_msgSend(v13, "safari_annotateWithBookmark:", v6);
    [v13 setAccessoryType:0];
    objc_msgSend(v13, "setEditingAccessoryType:", objc_msgSend(v6, "isEditable"));
    id v18 = [v6 title];
    id v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = [v6 address];
    v21 = [v19 URLWithString:v20];
    -[UITableViewCell safari_setLinkedPageTitle:URL:](v13, v18, (uint64_t)v21);

    if (IsAccessibilityCategory)
    {
      [v17 setImage:0];
    }
    else
    {
      v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"book"];
      [v17 setImage:v22];
    }
    v23 = @"BookmarksSidebarTableCellView";
    goto LABEL_30;
  }
  if (v7) {
    [v7 title];
  }
  else {
  v24 = [v6 localizedTitle];
  }
  [v14 setText:v24];

  [v13 setAccessoryType:1];
  [v13 setEditingAccessoryType:0];
  if (![(BookmarksTableViewController *)self _isShowingAllSyntheticFolders])
  {
    int v25 = [v6 identifier];
    if (v25 == [(WebBookmark *)self->_favoritesFolder identifier])
    {
      v26 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
      int v27 = [v26 usesAllowedSitesOnly];

      if (!v27)
      {
        if (IsAccessibilityCategory)
        {
          [v17 setImage:0];
        }
        else
        {
          v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
          [v17 setImage:v32];
        }
        if (![(BookmarksTableViewController *)self isEditing]) {
          goto LABEL_29;
        }
        v33 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v14 setTextColor:v33];

        objc_super v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v17 setTintColor:v30];
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  if (!v7)
  {
LABEL_24:
    if (IsAccessibilityCategory) {
      goto LABEL_25;
    }
    v28 = (void *)MEMORY[0x1E4FB1818];
    v29 = @"folder";
LABEL_27:
    objc_super v30 = [v28 systemImageNamed:v29];
    [v17 setImage:v30];
LABEL_28:

    goto LABEL_29;
  }
  if (!IsAccessibilityCategory)
  {
    v28 = (void *)MEMORY[0x1E4FB1818];
    v29 = @"star.square.on.square";
    goto LABEL_27;
  }
LABEL_25:
  [v17 setImage:0];
LABEL_29:
  v23 = @"BookmarksSidebarTableFolderCellView";
LABEL_30:
  [v13 setAccessibilityIdentifier:v23];

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(BookmarksTableViewController *)self _syntheticFolderAtIndexPath:v5];
  id v7 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v5];

  int v8 = [(BookmarksTableViewController *)self _tableViewCellForBookmark:v7 syntheticFolder:v6];

  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(BookmarksTableViewController *)self isEditing])
  {
    id v6 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v5];
    if ([v6 isEditable]) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (void)_pushInfoViewControllerForBookmark:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F3AF20];
  id v5 = a3;
  id v8 = (id)objc_msgSend([v4 alloc], "initWithBookmark:inCollection:addingBookmark:", v5, self->_collection, objc_msgSend(v5, "isInserted") ^ 1);

  [v8 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setPinnedPaletteForPanelViewController:self];
  }
  id v7 = [(BookmarksTableViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (id)_newViewControllerForFolder:(id)a3 syntheticFolder:(id)a4 showAllSyntheticFolders:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [[BookmarksTableViewController alloc] initWithFolder:v9 inCollection:self->_collection activeSyntheticFolder:v8 showAllSyntheticFolders:v5 skipOffset:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(BookmarksTableViewController *)v10 setDelegate:WeakRetained];

  id v12 = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  [(BookmarksTableViewController *)v10 setLinkPreviewProvider:v12];

  id v13 = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [(BookmarksTableViewController *)v10 setNavigationIntentHandler:v13];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(BookmarksTableViewController *)self isEditing]
    || ([(BookmarksTableViewController *)self tableView],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasActiveDrag],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = [(BookmarksTableViewController *)self _syntheticFolderAtIndexPath:v7];
    double v11 = v10;
    if (v10)
    {
      id v12 = [v10 bookmarkList];
      id v13 = [(BookmarksTableViewController *)self _newViewControllerForFolder:0 syntheticFolder:v11 showAllSyntheticFolders:v12 == 0];

      objc_super v14 = [(BookmarksTableViewController *)self navigationController];
      [v14 pushViewController:v13 animated:1];

      goto LABEL_21;
    }
    double v15 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v7];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__BookmarksTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v35[3] = &unk_1E6D78980;
    v35[4] = self;
    id v16 = v15;
    id v36 = v16;
    id v17 = v7;
    id v37 = v17;
    id v18 = (void (**)(void))MEMORY[0x1E4E42950](v35);
    int v19 = [v16 isFolder];
    v20 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        v22 = v20;
        uint64_t v23 = [v17 row];
        uint64_t v24 = [v17 section];
        uint64_t v25 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v17, "section"));
        *(_DWORD *)buf = 134218496;
        uint64_t v39 = v23;
        __int16 v40 = 2048;
        uint64_t v41 = v24;
        __int16 v42 = 2048;
        uint64_t v43 = v25;
        _os_log_impl(&dword_1E102C000, v22, OS_LOG_TYPE_DEFAULT, "Tap bookmark folder at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);
      }
      if (![MEMORY[0x1E4F78598] shouldOpenBookmarkFolderAsTabs])
      {
        id v26 = [(BookmarksTableViewController *)self _newViewControllerForFolder:v16 syntheticFolder:0 showAllSyntheticFolders:0];
        int v27 = [(BookmarksTableViewController *)self navigationController];
        [v27 pushViewController:v26 animated:1];

        if ([(BookmarksTableViewController *)self isEditing]) {
          [v26 setEditing:1 animated:0];
        }

        goto LABEL_20;
      }
    }
    else
    {
      if (v21)
      {
        objc_super v30 = v20;
        uint64_t v31 = [v17 row];
        uint64_t v32 = [v17 section];
        uint64_t v33 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v17, "section"));
        *(_DWORD *)buf = 134218496;
        uint64_t v39 = v31;
        __int16 v40 = 2048;
        uint64_t v41 = v32;
        __int16 v42 = 2048;
        uint64_t v43 = v33;
        _os_log_impl(&dword_1E102C000, v30, OS_LOG_TYPE_DEFAULT, "Tap bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);
      }
      v34 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v34 didVisitBookmarksWithOpenLocation:0 numberOfBookmarksVisited:1];
    }
    v18[2](v18);
LABEL_20:

    goto LABEL_21;
  }
  v28 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    *(_DWORD *)buf = 134218496;
    uint64_t v39 = [v7 row];
    __int16 v40 = 2048;
    uint64_t v41 = [v7 section];
    __int16 v42 = 2048;
    uint64_t v43 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
    _os_log_impl(&dword_1E102C000, v29, OS_LOG_TYPE_DEFAULT, "Tap to edit bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);
  }
  double v11 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v7];
  if (v11) {
    [(BookmarksTableViewController *)self _pushInfoViewControllerForBookmark:v11];
  }
LABEL_21:
}

void __66__BookmarksTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1152));
  int v3 = [WeakRetained bookmarksTableViewShouldDispatchNavigationIntent:*(void *)(a1 + 32) forSelectedBookmark:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F78598] builder];
    BOOL v5 = [v4 navigationIntentWithBookmark:*(void *)(a1 + 40)];

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1168));
      [v6 dispatchNavigationIntent:v5];
    }
  }
  id v7 = [*(id *)(a1 + 32) tableView];
  [v7 deselectRowAtIndexPath:*(void *)(a1 + 48) animated:1];
}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  BOOL v5 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:a4];
  char v6 = [v5 isFolder];

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = [WeakRetained bookmarksTableViewIsReadOnly:self];

  if (v8)
  {
    char v9 = 0;
  }
  else
  {
    BOOL v10 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v6];
    double v11 = [(BookmarksTableViewController *)self _syntheticFolderAtIndexPath:v6];
    id v12 = (void *)MEMORY[0x1E4FB1678];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v20[3] = &unk_1E6D78E60;
    id v21 = v11;
    id v22 = v10;
    uint64_t v23 = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v16[3] = &unk_1E6D78E88;
    id v17 = v22;
    id v18 = self;
    id v19 = v6;
    id v13 = v22;
    id v14 = v11;
    char v9 = [v12 configurationWithIdentifier:v19 previewProvider:v20 actionProvider:v16];
  }
  return v9;
}

id __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(void *a1)
{
  double v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = (void *)a1[6];
    goto LABEL_3;
  }
  if ([(id)a1[5] isFolder])
  {
    double v2 = (void *)a1[4];
    char v8 = a1 + 5;
    uint64_t v3 = a1[5];
    uint64_t v4 = (void *)v8[1];
    if (!v2)
    {
      id v6 = (void *)[v4 _newViewControllerForFolder:v3 syntheticFolder:0 showAllSyntheticFolders:0];
      goto LABEL_4;
    }
LABEL_3:
    BOOL v5 = [v2 bookmarkList];
    id v6 = (void *)[v4 _newViewControllerForFolder:v3 syntheticFolder:v2 showAllSyntheticFolders:v5 == 0];

LABEL_4:
    [v6 setPreviewing:1];
    goto LABEL_5;
  }
  char v9 = [MEMORY[0x1E4F78598] builder];
  BOOL v10 = [v9 navigationIntentWithBookmark:a1[5]];

  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 1160));
  id v12 = [v10 URL];
  id v6 = [WeakRetained linkPreviewViewControllerForURL:v12];

LABEL_5:
  return v6;
}

id __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(v2 + 1064);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 1152));
  id v6 = [WeakRetained tabGroupProvider];
  id v7 = objc_msgSend(v3, "_sf_contextMenuUsingCollection:tabGroupActionProvider:analyticsPayload:withUserInfo:handler:", v4, v6, 0, a1[6], a1[5]);

  return v7;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [a4 identifier];
  id v7 = [v5 cellForRowAtIndexPath:v6];

  char v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7];
  return v8;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 previewViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__BookmarksTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v15[3] = &unk_1E6D78AE8;
  id v16 = v11;
  id v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  [v10 addAnimations:v15];
}

void __100__BookmarksTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v4 = v3;
    [v4 setPreviewing:0];
    id WeakRetained = [*(id *)(a1 + 40) navigationController];
    [WeakRetained pushViewController:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    id v5 = *(id **)(a1 + 40);
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained(v5 + 145);
      [WeakRetained commitLinkPreviewViewController:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id WeakRetained = [*(id *)(a1 + 56) identifier];
      objc_msgSend(v5, "tableView:didSelectRowAtIndexPath:", v6);
    }
  }
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![(BookmarksTableViewController *)self _bookmarkAtIndexPathIsFolder:v5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
    [WeakRetained linkPreviewProviderWillDismissPreview];
  }
  return 0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v4 = [(BookmarksTableViewController *)self tableView:a3 willSelectRowAtIndexPath:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_updateTableViewCellsTextStyleForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BookmarksTableViewController *)self _inRootFolder])
  {
    id v11 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    BOOL v5 = [(BookmarksTableViewController *)self tableView];
    uint64_t v6 = [v5 cellForRowAtIndexPath:v11];

    if (v6)
    {
      if (v3) {
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else {
      id v7 = [MEMORY[0x1E4FB1618] labelColor];
      }
      id v8 = [v6 textLabel];
      [v8 setTextColor:v7];

      if (v3)
      {
        id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else
      {
        id v9 = 0;
      }
      id v10 = [v6 imageView];
      [v10 setTintColor:v9];

      if (v3) {
    }
      }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BookmarksTableViewController;
  -[BookmarksTableViewController setEditing:animated:](&v11, sel_setEditing_animated_);
  [(BookmarksTableViewController *)self _updateTableViewCellsTextStyleForEditing:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained panelViewController:self updateToolbarItemsAnimated:v4];
  }
  id v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Begin editing bookmarks table view", v10, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidBeginEditing:self];
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "End editing bookmarks table view", v10, 2u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained panelViewControllerDidEndEditing:self];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (!self->_skipOffset)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [WeakRetained bookmarksTableViewIsReadOnly:self];

    if ((v7 & 1) == 0)
    {
      id v8 = +[FeatureManager sharedFeatureManager];
      int v9 = [v8 isBookmarksAvailable];

      if (v9)
      {
        id v10 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v5];
        if ([v10 isDeletable])
        {
          objc_super v11 = [(BookmarksTableViewController *)self bookmarksNavigationController];
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

LABEL_12:
            int64_t v14 = 1;
            goto LABEL_10;
          }
          id v12 = [(BookmarksTableViewController *)self bookmarksNavigationController];
          int v13 = [v12 allowsEditing];

          if (v13) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
  }
  int64_t v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = [WeakRetained bookmarksTableViewIsReadOnly:self];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    int v9 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v5];
    if ([v9 isEditable]) {
      BOOL v8 = self->_skipOffset == 0;
    }
    else {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = a5;
    id v8 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v7];
    [(BookmarksTableViewController *)self _deleteBookmark:v8 atIndexPath:v7];
  }
}

- (void)_deleteBookmark:(id)a3 atIndexPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BookmarksTableViewController *)self tableView];
  int v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    *(_DWORD *)buf = 134218496;
    uint64_t v31 = [v7 row];
    __int16 v32 = 2048;
    uint64_t v33 = [v7 section];
    __int16 v34 = 2048;
    uint64_t v35 = objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
    _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_DEFAULT, "Delete bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);
  }
  if ([v6 isDeletable])
  {
    objc_super v11 = [MEMORY[0x1E4F781E8] sharedCoordinator];
    if ([v11 hasBookmarksLock])
    {
      uint64_t v12 = 0;
      char v13 = 0;
    }
    else if ([v11 lockBookmarks])
    {
      char v13 = 0;
      uint64_t v12 = 1;
    }
    else
    {
      int64_t v14 = +[FeatureManager sharedFeatureManager];
      char v15 = [v14 isInMemoryBookmarkChangeTrackingAvailable];

      if ((v15 & 1) == 0)
      {
        [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:self];
        uint64_t v23 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v23 didPreventBookmarkActionWithBookmarkType:0 actionType:1];

        uint64_t v24 = [(BookmarksTableViewController *)self tableView];
        uint64_t v25 = [v24 cellForRowAtIndexPath:v7];
        [v25 setEditing:0 animated:1];

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v12 = 0;
      char v13 = 1;
    }
    uint64_t v16 = [(WebBookmarkList *)self->_bookmarkList bookmarkCount];
    self->_shouldDeferReload = 1;
    if ([v6 subtype] == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v18 = [WeakRetained tabGroupProvider];
      id v19 = [v6 UUID];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__BookmarksTableViewController__deleteBookmark_atIndexPath___block_invoke;
      v26[3] = &unk_1E6D78EB0;
      v26[4] = self;
      id v27 = v7;
      uint64_t v28 = v16;
      char v29 = v12;
      [v18 deleteScopedBookmarkWithUUID:v19 completionHandler:v26];
    }
    else
    {
      collection = self->_collection;
      if (v13)
      {
        [(WebBookmarkCollection *)collection deleteBookmarkInMemory:v6];
        id v21 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v21 didDeleteBookmarkInMemory];

        uint64_t v22 = 1;
      }
      else
      {
        uint64_t v22 = [(WebBookmarkCollection *)collection deleteBookmark:v6];
      }
      [(BookmarksTableViewController *)self _handleBookmarkItemDeleted:v22 atIndexPath:v7 bookmarkCountBeforeDeletion:v16 lockedDatabase:v12];
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __60__BookmarksTableViewController__deleteBookmark_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleBookmarkItemDeleted:a2 atIndexPath:*(void *)(a1 + 40) bookmarkCountBeforeDeletion:*(void *)(a1 + 48) lockedDatabase:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_handleBookmarkItemDeleted:(BOOL)a3 atIndexPath:(id)a4 bookmarkCountBeforeDeletion:(unint64_t)a5 lockedDatabase:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  objc_super v11 = [(BookmarksTableViewController *)self tableView];
  [(BookmarksTableViewController *)self _recreateBookmarkLists];
  int v12 = [(WebBookmarkList *)self->_bookmarkList bookmarkCount];
  if (v8)
  {
    int v13 = v12;
    if (![v10 row] && -[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
    {
      int64_t v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v11 reloadSections:v14 withRowAnimation:0];
LABEL_7:

      goto LABEL_9;
    }
    if (a5 - 1 == v13)
    {
      v16[0] = v10;
      int64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v11 deleteRowsAtIndexPaths:v14 withRowAnimation:2];
      goto LABEL_7;
    }
  }
  [v11 reloadData];
LABEL_9:
  self->_shouldDeferReload = 0;
  if (v6)
  {
    char v15 = [MEMORY[0x1E4F781E8] sharedCoordinator];
    [v15 unlockBookmarksSoon];
  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 section];
  uint64_t v11 = [v9 section];
  uint64_t v12 = [v8 numberOfRowsInSection:v10];
  if (v11 >= v10)
  {
    if (v11 <= v10) {
      goto LABEL_6;
    }
    int v13 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v14 = v12 - 1;
  }
  else
  {
    int v13 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v14 = 0;
  }
  uint64_t v15 = [v13 indexPathForRow:v14 inSection:v10];

  id v9 = (id)v15;
LABEL_6:
  uint64_t v16 = [v9 row];
  uint64_t v17 = v16;
  uint64_t v18 = v16;
  if (v16 < v12)
  {
    uint64_t v18 = v16;
    while (1)
    {
      id v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v18 inSection:v10];
      BOOL v20 = [(BookmarksTableViewController *)self tableView:v8 canMoveRowAtIndexPath:v19];

      if (v20) {
        break;
      }
      if (v12 == ++v18) {
        goto LABEL_12;
      }
    }
  }
  if (v18 == v12)
  {
LABEL_12:
    if ((v17 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        id v21 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:v10];
        BOOL v22 = [(BookmarksTableViewController *)self tableView:v8 canMoveRowAtIndexPath:v21];

        if (v22) {
          break;
        }
        if (v17-- <= 0)
        {
          uint64_t v18 = -1;
          goto LABEL_18;
        }
      }
    }
    uint64_t v18 = v17;
  }
LABEL_18:
  uint64_t v24 = [MEMORY[0x1E4F28D58] indexPathForRow:v18 inSection:v10];

  return v24;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 section];
  uint64_t v10 = [v8 section];
  uint64_t v11 = [v7 row];
  uint64_t v12 = [v8 row];

  BOOL v13 = [(BookmarksTableViewController *)self _inRootFolder];
  if (v13) {
    uint64_t v14 = v12 - 2;
  }
  else {
    uint64_t v14 = v12;
  }
  if (v13) {
    v11 -= 2;
  }
  uint64_t v15 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134218752;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v10;
    _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_DEFAULT, "Move bookmark from row: %ld, section: %ld, to row: %ld, section: %ld", (uint8_t *)&v23, 0x2Au);
  }
  if (self->_activeSyntheticFolder)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v17 = [WeakRetained tabGroupProvider];

    uint64_t v18 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v7];
    if (v14)
    {
      id v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:v10];
      BOOL v20 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v19];
    }
    else
    {
      BOOL v20 = 0;
    }
    id v21 = [v18 UUID];
    BOOL v22 = [v20 UUID];
    [v17 reorderScopedBookmarkWithUUID:v21 afterBookmarkWithUUID:v22 notify:1];
  }
  else
  {
    [(WebBookmarkCollection *)self->_collection reorderList:self->_bookmarkList moveBookmarkAtIndex:v11 toIndex:v14];
  }
}

- (void)setScrollViewScrollsToTop:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BookmarksTableViewController *)self tableView];
  [v4 setScrollsToTop:v3];
}

- (id)currentStateDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BookmarksTableViewController *)self bookmarksNavigationController];
  BOOL v3 = [v2 topmostBookmarksTableViewController];

  if (v3)
  {
    id v4 = [v3 folder];
    uint64_t v5 = [v4 UUID];

    if (v5)
    {
      uint64_t v9 = @"CurrentFolderUUID";
      v10[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v7;
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  id v4 = [a3 objectForKey:@"CurrentFolderUUID"];
  if (v4)
  {
    uint64_t v5 = [(WebBookmarkCollection *)self->_collection bookmarkWithUUID:v4];
    uint64_t v6 = v5;
    if (v5 && [v5 isFolder])
    {
      id v7 = [(WebBookmarkCollection *)self->_collection rootBookmark];
      int v8 = [v7 identifier];

      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      do
      {
        if ([v6 identifier] == v8) {
          break;
        }
        [v9 addObject:v6];
        uint64_t v10 = -[WebBookmarkCollection bookmarkWithID:](self->_collection, "bookmarkWithID:", [v6 parentID]);

        uint64_t v6 = (void *)v10;
      }
      while (v10);
      BOOL v11 = [v6 identifier] == v8;
      if (v11)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __59__BookmarksTableViewController_restoreStateWithDictionary___block_invoke;
        v13[3] = &unk_1E6D78ED8;
        v13[4] = self;
        [v9 enumerateObjectsWithOptions:2 usingBlock:v13];
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __59__BookmarksTableViewController_restoreStateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 navigationController];
  uint64_t v5 = (void *)[*(id *)(a1 + 32) _newViewControllerForFolder:v4 syntheticFolder:0 showAllSyntheticFolders:0];

  [v6 pushViewController:v5 animated:0];
}

- (id)selectedBookmarks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(BookmarksTableViewController *)self tableView];
  uint64_t v5 = [v4 indexPathsForSelectedRows];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return (id)[NSString stringWithFormat:@"%@-%i", @"BookmarksCollection", -[BookmarksTableViewController folderID](self, "folderID")];
}

- (BOOL)hasTranslucentAppearance
{
  v6.receiver = self;
  v6.super_class = (Class)BookmarksTableViewController;
  if ([(SFPopoverSizingTableViewController *)&v6 hasTranslucentAppearance]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained panelViewControllerShouldTranslucentAppearance:self];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained tabGroupProvider];

  return v4;
}

- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 navigationIntents];
  id v12 = v7;
  if (v7) {
    uint64_t v8 = [v7 count];
  }
  else {
    uint64_t v8 = 1;
  }
  if ([v6 policy] == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v10 didVisitBookmarksWithOpenLocation:v9 numberOfBookmarksVisited:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [WeakRetained dispatchNavigationIntent:v6];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v10 = a3;
  id v6 = (NSString *)a4;
  userTypedFilter = self->_userTypedFilter;
  if (userTypedFilter != v6 && ![(NSString *)userTypedFilter isEqualToString:v6])
  {
    uint64_t v8 = (NSString *)[(NSString *)v6 copy];
    uint64_t v9 = self->_userTypedFilter;
    self->_userTypedFilter = v8;

    [(BookmarksTableViewController *)self reloadBookmarks];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  userTypedFilter = self->_userTypedFilter;
  self->_userTypedFilter = (NSString *)&stru_1F3C268E8;

  [(BookmarksTableViewController *)self reloadBookmarks];
}

- (id)_dragItemsAtIndexPath:(id)a3 includingFolders:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = [WeakRetained bookmarksTableViewIsReadOnly:self];

  if ((v8 & 1) != 0
    || [v6 row] <= 1 && -[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v10 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v6];
    BOOL v11 = v10;
    if (v10 && (![v10 isFolder] || v4))
    {
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1710]), "_sf_initWithBookmark:", v11);
      v14[0] = v12;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v9;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(BookmarksTableViewController *)self _dragItemsAtIndexPath:a5 includingFolders:1];
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[BookmarksTableViewController _dragItemsAtIndexPath:includingFolders:](self, "_dragItemsAtIndexPath:includingFolders:", a5, 0, a6.x, a6.y);
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartDragWithDragContentType:8];
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5 = a4;
  if (self->_skipOffset
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v7 = [WeakRetained bookmarksTableViewIsReadOnly:self],
        WeakRetained,
        (v7 & 1) != 0))
  {
    BOOL v8 = 0;
  }
  else if ([(BookmarksTableViewController *)self isEditing])
  {
    BOOL v8 = objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_operationForDropSession:destinationSubtype:", v5, self->_activeSyntheticFolder != 0) == 3;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_operationForDropSession:destinationSubtype:", a4, self->_activeSyntheticFolder != 0);
  if (v10 > 1)
  {
    unint64_t v12 = v10;
    if (v9
      && (uint64_t v13 = [v9 row], v13 <= objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v9, "section"))))
    {
      long long v15 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v9];
      int v16 = [v15 isFolder];

      if (v16) {
        uint64_t v14 = 3;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1D28]) initWithDropOperation:v12 intent:v14];
  }
  else
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1D28]) initWithDropOperation:1];
  }
  uint64_t v17 = (void *)v11;

  return v17;
}

- (void)_moveBookmarks:(id)a3 toFolderID:(int)a4 toIndex:(unsigned int)a5 shouldReorder:(BOOL)a6 isAddingBookmark:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](self->_collection, v11, v9, self, v7);
  if (a6)
  {
    [(BookmarksTableViewController *)self _recreateBookmarkLists];
    if (self->_bookmarkList)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v20 = v11;
      id obj = [v11 reverseObjectEnumerator];
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            collection = self->_collection;
            bookmarkList = self->_bookmarkList;
            id v19 = [(WebBookmarkList *)bookmarkList bookmarkArray];
            -[WebBookmarkCollection reorderList:moveBookmarkAtIndex:toIndex:](collection, "reorderList:moveBookmarkAtIndex:toIndex:", bookmarkList, [v19 indexOfObject:v16], a5);
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      id v11 = v20;
    }
  }
  else
  {
    [(BookmarksTableViewController *)self reloadBookmarks];
  }
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 session];
  BOOL v7 = [v5 destinationIndexPath];
  id v8 = [(BookmarksTableViewController *)self _bookmarkAtIndexPath:v7];
  if ([(WebBookmark *)v8 isFolder]
    && ([v5 proposal],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 intent],
        v9,
        v10 == 2))
  {
    id v11 = (void *)v6;
    char v12 = 1;
    folder = v8;
  }
  else
  {
    id v11 = (void *)v6;
    char v12 = 0;
    folder = self->_folder;
  }
  HIDWORD(v29) = [(WebBookmark *)folder identifier];
  uint64_t v14 = [v5 items];
  long long v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 dragItem];
  uint64_t v17 = objc_msgSend(v16, "_sf_localBookmark");

  uint64_t v18 = [v7 row];
  BOOL v19 = 0;
  if (v7 && (v12 & 1) == 0) {
    BOOL v19 = [(WebBookmarkList *)self->_bookmarkList bookmarkCount] > v18;
  }
  id v20 = [v5 proposal];
  uint64_t v21 = [v20 operation];

  if (v21 == 2)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__BookmarksTableViewController_tableView_performDropWithCoordinator___block_invoke;
    v30[3] = &unk_1E6D78F00;
    v30[4] = self;
    int v31 = HIDWORD(v29);
    int v32 = v18;
    BOOL v33 = v19;
    long long v23 = v11;
    objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_webBookmarksFromDropSession:completionHandler:", v11, v30);
  }
  else
  {
    BOOL v22 = v21 == 3;
    long long v23 = v11;
    if (v22)
    {
      uint64_t v24 = HIDWORD(v29);
      if ([v17 parentID] == HIDWORD(v29))
      {
        long long v25 = v23;
        long long v26 = [(BookmarksTableViewController *)self tableView];
        if ([v26 hasActiveDrag])
        {
        }
        else
        {
          __int16 v27 = [(WebBookmarkList *)self->_bookmarkList bookmarkArray];
          LODWORD(v29) = [v27 indexOfObject:v17] < (unint64_t)v18;

          uint64_t v18 = v18 - (v29 & 1);
        }
        long long v23 = v25;
        uint64_t v24 = HIDWORD(v29);
      }
      v34[0] = v17;
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 1, v29);
      [(BookmarksTableViewController *)self _moveBookmarks:v28 toFolderID:v24 toIndex:v18 shouldReorder:v19 isAddingBookmark:0];
    }
  }
}

void __69__BookmarksTableViewController_tableView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) _moveBookmarks:v3 toFolderID:*(unsigned int *)(a1 + 40) toIndex:*(unsigned int *)(a1 + 44) shouldReorder:*(unsigned __int8 *)(a1 + 48) isAddingBookmark:1];
  }
}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  [a3 adjustedContentInset];
  if (v4 > 0.0)
  {
    [(BookmarksTableViewController *)self _updateContentOffsetIfNeeded];
  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  id v3 = WebBookmarksRootBookmarkTitle();
  [v4 setTitle:v3];

  [v4 setEligibleForSearch:1];
  [v4 setEligibleForPrediction:1];
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)folder
{
  return self->_folder;
}

- (BookmarksTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BookmarksTableViewControllerDelegate *)WeakRetained;
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

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_allSyntheticFolders, 0);
  objc_storeStrong((id *)&self->_activeSyntheticFolder, 0);
  objc_storeStrong((id *)&self->_favoritesFolder, 0);
  objc_storeStrong((id *)&self->_bookmarkList, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end