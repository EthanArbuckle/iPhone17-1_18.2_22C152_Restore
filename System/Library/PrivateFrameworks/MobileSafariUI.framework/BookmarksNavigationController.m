@interface BookmarksNavigationController
+ (NSString)test_savedStateCollection;
+ (void)test_setSavedStateCollection:(id)a3;
- (BOOL)_createSavedPanelStateForTesting;
- (BOOL)_isVisibleFolderID:(int)a3;
- (BOOL)_shouldShowPaletteForViewController:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)bookmarksTableViewIsReadOnly:(id)a3;
- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4;
- (BOOL)doneButtonHidden;
- (BOOL)hasTranslucentAppearance;
- (BOOL)isContentBorrowed;
- (BOOL)prefersHalfHeightSheetPresentationWithLoweredBar;
- (BOOL)rebaseOnAncestorBookmark:(id)a3 skipOffset:(unsigned int)a4;
- (BOOL)rebaseOnDescendentBookmark:(id)a3;
- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4;
- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 collection:(id)a5 showsOnlyActiveCollection:(BOOL)a6;
- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6;
- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate;
- (LinkPreviewProvider)linkPreviewProvider;
- (NSString)currentCollection;
- (TabGroupProvider)tabGroupProvider;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3;
- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3;
- (UIEdgeInsets)tableSeparatorInset;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (id)_favoritesFolderBasedOnContentRestriction;
- (id)_initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6 activeCollection:(id)a7 showsOnlyActiveCollection:(BOOL)a8;
- (id)_lastExistingBookmarkWithUUIDs:(id)a3;
- (id)_pathForBookmark:(id)a3 startingFromAncestor:(id)a4;
- (id)_segmentedControlItemForCollection:(id)a3;
- (id)_toolbarItemsForViewController:(id)a3;
- (id)importHandler;
- (id)makeHistoryViewController;
- (id)newBookmarksTableViewControllerWithFolder:(id)a3 skipOffset:(unsigned int)a4;
- (id)newRootViewControllerForCollection:(id)a3;
- (id)readingListViewControllerCurrentReadingListItem:(id)a3;
- (id)rootBookmark;
- (id)topBookmarksTableViewController;
- (id)topHistoryViewController;
- (id)topReadingListViewController;
- (id)topmostBookmarksTableViewController;
- (void)_applicationSuspended:(id)a3;
- (void)_bookmarkSyncTimerDidFire:(id)a3;
- (void)_clearBookmarkSyncTimer;
- (void)_createToolbarItemsIfNecessary;
- (void)_didPressEditButton;
- (void)_didPressEditingDoneButton;
- (void)_didPressNewFolderButton;
- (void)_doneButtonPressed;
- (void)_folderContentsDidChange:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadSavedPanelState;
- (void)_reloadFailed;
- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3;
- (void)_reloadSucceeded;
- (void)_restoreCurrentCollectionState;
- (void)_restorePanelState;
- (void)_savePanelState;
- (void)_selectedCollectionChanged:(id)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setContentsDirty;
- (void)_setEditingFromToolbarButton:(BOOL)a3;
- (void)_setupCollectionSegmentedControlIfNeeded;
- (void)_setupCollections;
- (void)_updateBookmarkCollection;
- (void)_updateClearHistoryButton;
- (void)_updateDoneButtonItemForViewController:(id)a3;
- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateToolbarVisibility;
- (void)anySizeClassDidChange;
- (void)bookmarkSourceContentsChanged:(id)a3;
- (void)dealloc;
- (void)dispatchNavigationIntent:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)panelViewController:(id)a3 updateToolbarItemsAnimated:(BOOL)a4;
- (void)panelViewControllerDidBeginEditing:(id)a3;
- (void)panelViewControllerDidEndEditing:(id)a3;
- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5;
- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4;
- (void)reloadViewControllers;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setBookmarksNavigationControllerDelegate:(id)a3;
- (void)setContentBorrowed:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCurrentCollection:(id)a3;
- (void)setDoneButtonHidden:(BOOL)a3;
- (void)setHasTranslucentAppearance:(BOOL)a3;
- (void)setImportHandler:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setPinnedPaletteForPanelViewController:(id)a3;
- (void)setPrefersHalfHeightSheetPresentationWithLoweredBar:(BOOL)a3;
- (void)setRootBookmark:(id)a3 skipOffset:(unsigned int)a4;
- (void)setRootBookmarkUUIDString:(id)a3;
- (void)setTableSeparatorInset:(UIEdgeInsets)a3;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4;
- (void)tabGroupManagerDidUpdateTabGroups:(id)a3;
- (void)toggleEditBookmarks;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BookmarksNavigationController

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4
{
  return (BookmarksNavigationController *)[(BookmarksNavigationController *)self _initWithBookmarksDelegate:a3 linkPreviewProvider:a4 topBookmark:0 skipOffset:0 activeCollection:0 showsOnlyActiveCollection:0];
}

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 collection:(id)a5 showsOnlyActiveCollection:(BOOL)a6
{
  return (BookmarksNavigationController *)[(BookmarksNavigationController *)self _initWithBookmarksDelegate:a3 linkPreviewProvider:a4 topBookmark:0 skipOffset:0 activeCollection:a5 showsOnlyActiveCollection:a6];
}

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6
{
  return (BookmarksNavigationController *)[(BookmarksNavigationController *)self _initWithBookmarksDelegate:a3 linkPreviewProvider:a4 topBookmark:a5 skipOffset:*(void *)&a6 activeCollection:0 showsOnlyActiveCollection:0];
}

- (id)_initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6 activeCollection:(id)a7 showsOnlyActiveCollection:(BOOL)a8
{
  BOOL v8 = a8;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v38.receiver = self;
  v38.super_class = (Class)BookmarksNavigationController;
  v18 = [(BookmarksNavigationController *)&v38 initWithNavigationBarClass:0 toolbarClass:0];
  v19 = v18;
  if (v18)
  {
    unsigned int v37 = a6;
    [(BookmarksNavigationController *)v18 setDelegate:v18];
    [(BookmarksNavigationController *)v19 _setClipUnderlapWhileTransitioning:1];
    v19->_prefersHalfHeightSheetPresentationWithLoweredBar = 1;
    objc_storeWeak((id *)&v19->_bookmarksNavigationControllerDelegate, v14);
    objc_storeWeak((id *)&v19->_linkPreviewProvider, v15);
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB60F0]) initReadonlySafariBookmarkCollection];
    readonlyCollection = v19->_readonlyCollection;
    v19->_readonlyCollection = (WebBookmarkReadonlyCollection *)v20;

    id v22 = [NSString stringWithFormat:@"com.apple.mobilesafari.%@.%p", objc_opt_class(), v19];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    readonlyCollectionQueue = v19->_readonlyCollectionQueue;
    v19->_readonlyCollectionQueue = (OS_dispatch_queue *)v23;

    if (v17) {
      BOOL v25 = v8;
    }
    else {
      BOOL v25 = 0;
    }
    if (!v16 && !v25) {
      v19->_showCollections = 1;
    }
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v19 selector:sel__bookmarkCollectionHasBecomeAvailable_ name:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
    [v26 addObserver:v19 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [(BookmarksNavigationController *)v19 _updateBookmarkCollection];
    v27 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
    int v28 = [v27 usesAllowedSitesOnly];

    [(BookmarksNavigationController *)v19 setAllowsEditing:v28 ^ 1u];
    v29 = [[BookmarkImporter alloc] initWithBookmarkCollection:v19->_bookmarkCollection];
    [(BookmarkImporter *)v29 migrateYouTubeBookmarks];
    v19->_contentDirtyFlag = 1;
    [(BookmarksNavigationController *)v19 _setupCollections];
    if (v25)
    {
      [(BookmarksNavigationController *)v19 setCurrentCollection:v17];
    }
    else if (v19->_showCollections)
    {
      [(BookmarksNavigationController *)v19 _loadSavedPanelState];
      [(BookmarksNavigationController *)v19 _restorePanelState];
    }
    else
    {
      id v30 = [(BookmarksNavigationController *)v19 newBookmarksTableViewControllerWithFolder:v16 skipOffset:v37];
      [(BookmarksNavigationController *)v19 pushViewController:v30 animated:0];
    }
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    id v32 = (id)[(BookmarksNavigationController *)v19 registerForTraitChanges:v31 withTarget:v19 action:sel_anySizeClassDidChange];

    v33 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v34 = (id)[(BookmarksNavigationController *)v19 registerForTraitChanges:v33 withTarget:v19 action:sel__setContentsDirty];

    v35 = v19;
  }

  return v19;
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB2EF8];
  v5 = [(BookmarksNavigationController *)self sheetPresentationController];
  [v5 setSelectedDetentIdentifier:v4];

  id v7 = [(BookmarksNavigationController *)self view];
  v6 = [v7 window];
  [v6 layoutIfNeeded];
}

- (void)_updateBookmarkCollection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  uint64_t v4 = self->_bookmarkCollection;
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    objc_storeStrong((id *)&self->_bookmarkCollection, v3);
    if (self->_showCollections)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v8 = *MEMORY[0x1E4FB6148];
      [v7 removeObserver:self name:*MEMORY[0x1E4FB6148] object:v5];
      [v7 addObserver:self selector:sel__webBookmarksDidReload_ name:v8 object:v3];
      uint64_t v9 = *MEMORY[0x1E4FB6158];
      [v7 removeObserver:self name:*MEMORY[0x1E4FB6158] object:v5];
      [v7 addObserver:self selector:sel__folderContentsDidChange_ name:v9 object:v3];
    }
    v10 = +[Application sharedApplication];
    v11 = [v10 tabGroupManager];
    [v11 addTabGroupObserver:self];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v12 = [(BookmarksNavigationController *)self viewControllers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v17 setCollection:v3];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    [(BookmarksNavigationController *)self reloadViewControllers];
  }
}

- (void)_applicationSuspended:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F781E8], "sharedCoordinator", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 unlockBookmarksIfNeeded];
}

- (void)_folderContentsDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E4FB6130]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[BookmarksNavigationController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", [v6 intValue]);
    v5 = v6;
  }
}

- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(BookmarksNavigationController *)self topmostBookmarksTableViewController];
  int v6 = [v5 folderID];

  if ([(BookmarksNavigationController *)self _isVisibleFolderID:v3]) {
    [(BookmarksNavigationController *)self _setContentsDirty];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(BookmarksNavigationController *)self viewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if ([v13 folderID] == v3)
          {
            if (v6 == v3) {
              [v13 reloadBookmarks];
            }
            else {
              [(BookmarksNavigationController *)self reloadViewControllers];
            }

            goto LABEL_18;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (BOOL)_isVisibleFolderID:(int)a3
{
  uint64_t v4 = [(BookmarksNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 folder];
    BOOL v6 = [v5 identifier] == a3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)anySizeClassDidChange
{
  uint64_t v3 = [(BookmarksNavigationController *)self topViewController];
  [(BookmarksNavigationController *)self _updateToolbarItemsForViewController:v3 animated:0];

  [(BookmarksNavigationController *)self _setupCollectionSegmentedControlIfNeeded];
  if ([(UISegmentedControl *)self->_collectionSegmentedControl selectedSegmentIndex] == -1)
  {
    collectionSegmentedControl = self->_collectionSegmentedControl;
    NSUInteger v5 = [(NSArray *)self->_topLevelCollections indexOfObject:self->_currentCollection];
    [(UISegmentedControl *)collectionSegmentedControl setSelectedSegmentIndex:v5];
  }
}

- (id)topHistoryViewController
{
  v2 = [(BookmarksNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)topBookmarksTableViewController
{
  v2 = [(BookmarksNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)topmostBookmarksTableViewController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BookmarksNavigationController *)self viewControllers];
  id v3 = [v2 reverseObjectEnumerator];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)topReadingListViewController
{
  v2 = [(BookmarksNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)rootBookmark
{
  v2 = [(BookmarksNavigationController *)self viewControllers];
  id v3 = [v2 objectAtIndex:0];

  id v4 = [v3 folder];

  return v4;
}

- (void)setRootBookmark:(id)a3 skipOffset:(unsigned int)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(BookmarksNavigationController *)self newBookmarksTableViewControllerWithFolder:a3 skipOffset:*(void *)&a4];
  v7[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(BookmarksNavigationController *)self setViewControllers:v6];
}

- (void)setRootBookmarkUUIDString:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F99690]])
    {
      BOOL v6 = [(BookmarksNavigationController *)self _favoritesFolderBasedOnContentRestriction];
      if (!v6) {
        goto LABEL_7;
      }
    }
    else
    {
      v8[0] = v5;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      BOOL v6 = [(BookmarksNavigationController *)self _lastExistingBookmarkWithUUIDs:v7];

      if (!v6)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    [(BookmarksNavigationController *)self setRootBookmark:v6 skipOffset:0];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v4 viewDidLoad];
  if (self->_showCollections)
  {
    id v3 = [(BookmarksNavigationController *)self view];
    [v3 setAccessibilityIdentifier:@"Sidebar"];
  }
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v20 viewDidLayoutSubviews];
  if (self->_showCollections)
  {
    id v3 = [(BookmarksNavigationController *)self presentingViewController];
    objc_super v4 = [v3 view];
    [v4 layoutMargins];
    double v6 = v5;
    double v8 = v7;

    long long v9 = [(BookmarksNavigationController *)self navigationBar];
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    [(UISegmentedControl *)self->_collectionSegmentedControl frame];
    double v19 = v18;
    v21.origin.x = v11;
    v21.origin.y = v13;
    v21.size.width = v15;
    v21.size.height = v17;
    -[UISegmentedControl setFrame:](self->_collectionSegmentedControl, "setFrame:", v6, 0.0, CGRectGetWidth(v21) - v6 - v8, v19);
  }
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  if (!self->_contentBorrowed)
  {
    v3.receiver = self;
    v3.super_class = (Class)BookmarksNavigationController;
    -[BookmarksNavigationController _setContentOverlayInsets:](&v3, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v6 viewWillAppear:a3];
  if (!self->_hasScheduledBookmarkSyncTimer)
  {
    objc_super v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__bookmarkSyncTimerDidFire_ selector:0 userInfo:0 repeats:5.0];
    bookmarkSyncTimer = self->_bookmarkSyncTimer;
    self->_bookmarkSyncTimer = v4;

    self->_hasScheduledBookmarkSyncTimer = 1;
  }
  if (self->_showCollections)
  {
    if (self->_needsReloadSavedState)
    {
      [(BookmarksNavigationController *)self _loadSavedPanelState];
      [(BookmarksNavigationController *)self _restorePanelState];
    }
    [(BookmarksNavigationController *)self _setupCollectionSegmentedControlIfNeeded];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v5 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerViewDidAppear:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v4 viewWillDisappear:a3];
  if (self->_showCollections) {
    [(BookmarksNavigationController *)self _savePanelState];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v6 viewDidDisappear:a3];
  if (self->_showCollections) {
    self->_needsReloadSavedState = 1;
  }
  [(BookmarksNavigationController *)self _clearBookmarkSyncTimer];
  if (self->_isEditing)
  {
    [(BookmarksNavigationController *)self _setEditingFromToolbarButton:0];
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F781E8] sharedCoordinator];
    [v4 unlockBookmarksIfNeeded];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerViewDidDisappear:self];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(BookmarksNavigationController *)self _setContentsDirty];
}

- (void)reloadViewControllers
{
  v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  currentCollection = self->_currentCollection;
  if (!currentCollection
    || [(NSString *)currentCollection isEqualToString:@"BookmarksCollection"])
  {
    id v4 = [(BookmarksNavigationController *)v2 viewControllers];
    if ([v4 count])
    {
      objc_super v5 = [v4 firstObject];
      objc_super v6 = [(BookmarksNavigationController *)v2 topHistoryViewController];
      if (v6 || [v4 count] == 1)
      {
        [v5 reloadBookmarks];
        [(BookmarksNavigationController *)v2 _reloadSucceeded];
      }
      else
      {
        v65 = v5;
        double v7 = [v4 lastObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v8 = v7;
        }
        else {
          double v8 = 0;
        }
        id v9 = v8;

        v66 = v9;
        if (v9)
        {
          uint64_t v10 = objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v4, "count") - 1);

          id v4 = (id)v10;
        }
        CGFloat v11 = [MEMORY[0x1E4F1CA48] array];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v4 = v4;
        uint64_t v12 = [v4 countByEnumeratingWithState:&v76 objects:v82 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v77 != v14) {
                objc_enumerationMutation(v4);
              }
              double v16 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CGFloat v17 = [v16 folder];
                double v18 = [v17 UUID];
                [v11 addObject:v18];
              }
            }
            uint64_t v13 = [v4 countByEnumeratingWithState:&v76 objects:v82 count:16];
          }
          while (v13);
        }

        double v19 = [(BookmarksNavigationController *)v2 _lastExistingBookmarkWithUUIDs:v11];
        if (v19)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&v2->_bookmarksNavigationControllerDelegate);
          if (objc_opt_respondsToSelector())
          {
            CGRect v21 = [WeakRetained containingBookmarkForNavigationController:v2];
          }
          else
          {
            CGRect v21 = 0;
          }
          uint64_t v23 = [(BookmarksNavigationController *)v2 _pathForBookmark:v19 startingFromAncestor:v21];
          v64 = v23;
          if (v23)
          {
            v24 = v23;
            v61 = v21;
            id v62 = WeakRetained;
            v63 = v19;
            BOOL v25 = [v23 valueForKey:@"UUID"];
            unint64_t v26 = [v11 count];
            unint64_t v27 = [v25 count];
            v60 = v25;
            if (v27 <= v26
              && (unint64_t v28 = v27,
                  objc_msgSend(v11, "subarrayWithRange:", 0, v27),
                  v29 = objc_claimAutoreleasedReturnValue(),
                  int v30 = [v25 isEqualToArray:v29],
                  v29,
                  v30))
            {
              if (v28 < v26)
              {

                v31 = [v4 objectAtIndex:v28 - 1];
                id v32 = (id)[(BookmarksNavigationController *)v2 popToViewController:v31 animated:1];

                uint64_t v33 = objc_msgSend(v4, "subarrayWithRange:", 0, v28);

                v66 = 0;
                id v4 = (id)v33;
              }
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v4 = v4;
              uint64_t v34 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v73;
                p_info = ActionPanel.info;
                id v67 = v4;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v73 != v36) {
                      objc_enumerationMutation(v4);
                    }
                    v39 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v40 = v35;
                      bookmarkCollection = v2->_bookmarkCollection;
                      id v42 = v39;
                      v43 = [v42 folder];
                      [v43 UUID];
                      v44 = v11;
                      uint64_t v45 = v36;
                      v46 = v2;
                      v48 = v47 = p_info;
                      v49 = [(WebBookmarkCollection *)bookmarkCollection bookmarkWithUUID:v48];
                      [v42 setFolder:v49];

                      uint64_t v35 = v40;
                      id v4 = v67;

                      p_info = v47;
                      v2 = v46;
                      uint64_t v36 = v45;
                      CGFloat v11 = v44;
                    }
                  }
                  uint64_t v35 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
                }
                while (v35);
              }

              id v22 = v66;
              [v66 reloadData];
              [(BookmarksNavigationController *)v2 _reloadSucceeded];
            }
            else
            {
              v50 = [MEMORY[0x1E4F1CA48] array];
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              id v51 = v24;
              uint64_t v52 = [v51 countByEnumeratingWithState:&v68 objects:v80 count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v69;
                do
                {
                  for (uint64_t k = 0; k != v53; ++k)
                  {
                    if (*(void *)v69 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    id v56 = [(BookmarksNavigationController *)v2 newBookmarksTableViewControllerWithFolder:*(void *)(*((void *)&v68 + 1) + 8 * k) skipOffset:0];
                    [v50 addObject:v56];
                  }
                  uint64_t v53 = [v51 countByEnumeratingWithState:&v68 objects:v80 count:16];
                }
                while (v53);
              }

              v57 = [v63 UUID];
              v58 = [v11 lastObject];
              uint64_t v59 = [v57 isEqualToString:v58] ^ 1;

              [(BookmarksNavigationController *)v2 setViewControllers:v50 animated:v59];
              [(BookmarksNavigationController *)v2 _reloadSucceeded];

              id v22 = v66;
            }

            objc_super v6 = 0;
            objc_super v5 = v65;
            id WeakRetained = v62;
            double v19 = v63;
            CGRect v21 = v61;
          }
          else
          {
            [(BookmarksNavigationController *)v2 _reloadFailed];
            objc_super v5 = v65;
            id v22 = v66;
          }
        }
        else
        {
          [(BookmarksNavigationController *)v2 _reloadFailed];
          objc_super v5 = v65;
          id v22 = v66;
        }
      }
    }
  }
}

- (id)_favoritesFolderBasedOnContentRestriction
{
  objc_super v3 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
  int v4 = [v3 usesAllowedSitesOnly];

  bookmarkCollection = self->_bookmarkCollection;
  if (v4) {
    [(WebBookmarkCollection *)bookmarkCollection webFilterAllowedSitesFolder];
  }
  else {
  objc_super v6 = [(WebBookmarkCollection *)bookmarkCollection favoritesFolder];
  }
  return v6;
}

- (void)_reloadFailed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerReloadDidFail:self];
  }
}

- (void)_reloadSucceeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerDidReload:self];
  }
}

- (id)_lastExistingBookmarkWithUUIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarkWithUUID:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)_pathForBookmark:(id)a3 startingFromAncestor:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 UUID];
  double v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  while ([v6 identifier])
  {
    uint64_t v9 = v6;
    -[WebBookmarkCollection bookmarkWithID:](self->_bookmarkCollection, "bookmarkWithID:", [v6 parentID]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [v6 UUID];
    char v11 = [v10 isEqualToString:v7];

    if (v11) {
      break;
    }
    [v8 insertObject:v6 atIndex:0];
  }
  if (v7
    && ([v6 UUID],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v7 isEqualToString:v12],
        v12,
        !v13))
  {
    id v14 = 0;
  }
  else
  {
    id v14 = v8;
  }

  return v14;
}

- (void)_updateClearHistoryButton
{
  id v2 = [(BookmarksNavigationController *)self topHistoryViewController];
  [v2 updateClearHistoryButtonEnabled];
}

- (void)bookmarkSourceContentsChanged:(id)a3
{
  int v4 = [a3 object];
  uint64_t v5 = +[History sharedHistory];

  if (v4 == v5)
  {
    [(BookmarksNavigationController *)self _updateClearHistoryButton];
  }
}

- (BOOL)_shouldShowPaletteForViewController:(id)a3
{
  id v4 = a3;
  if (self->_showCollections && [(NSArray *)self->_topLevelCollections count] >= 2)
  {
    id v6 = [(BookmarksNavigationController *)self traitCollection];
    char v7 = objc_msgSend(v6, "sf_usesSidebarPresentation");

    if ((v7 & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_createToolbarItemsIfNecessary
{
  if (!self->_createFolderButtonItem)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = _WBSLocalizedString();
    uint64_t v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:self action:sel__didPressNewFolderButton];
    createFolderButtonItem = self->_createFolderButtonItem;
    self->_createFolderButtonItem = v5;

    [(UIBarButtonItem *)self->_createFolderButtonItem setAccessibilityIdentifier:@"BookmarksNewFolderButton"];
    char v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__didPressEditButton];
    editButtonItem = self->_editButtonItem;
    self->_editButtonItem = v7;

    [(UIBarButtonItem *)self->_editButtonItem setAccessibilityIdentifier:@"BookmarksEditButton"];
    uint64_t v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__didPressEditingDoneButton];
    editingDoneButtonItem = self->_editingDoneButtonItem;
    self->_editingDoneButtonItem = v9;

    [(UIBarButtonItem *)self->_editingDoneButtonItem setAccessibilityIdentifier:@"BookmarksDoneButton"];
    char v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpaceItem = self->_flexibleSpaceItem;
    self->_flexibleSpaceItem = v11;
  }
}

- (id)_toolbarItemsForViewController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BookmarksNavigationController *)self _createToolbarItemsIfNecessary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = +[FeatureManager sharedFeatureManager];
    int v6 = [v5 isBookmarksAvailable];

    if (v6)
    {
      if (self->_isEditing && [v4 canCreateNewFolder])
      {
        flexibleSpaceItem = self->_flexibleSpaceItem;
        createFolderButtonItem = self->_createFolderButtonItem;
        CGRect v21 = flexibleSpaceItem;
        editingDoneButtonItem = self->_editingDoneButtonItem;
        double v8 = (void *)MEMORY[0x1E4F1C978];
        p_createFolderButtonItem = &createFolderButtonItem;
        uint64_t v10 = 3;
      }
      else
      {
        if ([v4 isEditing])
        {
          int v13 = self->_editingDoneButtonItem;
          double v18 = self->_flexibleSpaceItem;
          double v19 = v13;
          double v8 = (void *)MEMORY[0x1E4F1C978];
          p_createFolderButtonItem = &v18;
        }
        else
        {
          editButtonItem = self->_editButtonItem;
          double v16 = self->_flexibleSpaceItem;
          uint64_t v17 = editButtonItem;
          double v8 = (void *)MEMORY[0x1E4F1C978];
          p_createFolderButtonItem = &v16;
        }
        uint64_t v10 = 2;
      }
      uint64_t v11 = objc_msgSend(v8, "arrayWithObjects:count:", p_createFolderButtonItem, v10, v16, v17, v18, v19, createFolderButtonItem, v21, editingDoneButtonItem, v23);
      goto LABEL_14;
    }
LABEL_8:
    long long v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v11 = [v4 bookmarksPanelToolbarItems];
LABEL_14:
  long long v12 = (void *)v11;
LABEL_15:

  return v12;
}

- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_allowsEditing && !self->_importHandler)
  {
    double v8 = v6;
    char v7 = [(BookmarksNavigationController *)self _toolbarItemsForViewController:v6];
    [v8 setToolbarItems:v7 animated:v4];

    id v6 = v8;
  }
}

- (void)_setEditingFromToolbarButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(BookmarksNavigationController *)self topReadingListViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v12, "setEditing:animated:", objc_msgSend(v12, "isEditing") ^ 1, 0);
    goto LABEL_11;
  }
  uint64_t v5 = [MEMORY[0x1E4F781E8] sharedCoordinator];
  id v6 = v5;
  if (!v3)
  {
    [v5 unlockBookmarksSoon];
    double v8 = [(BookmarksNavigationController *)self navigationBar];
    [v8 setNeedsLayout];

    goto LABEL_7;
  }
  if ([v5 lockBookmarks])
  {
LABEL_7:
    char v7 = [(BookmarksNavigationController *)self topBookmarksTableViewController];
    self->_isEditing = v3;
    [v7 setEditing:v3 animated:1];
    [(UISegmentedControl *)self->_collectionSegmentedControl setEnabled:v3 ^ 1];
    [(BookmarksNavigationController *)self setDoneButtonHidden:v3];
    if (self->_isEditing
      || ([(BookmarksNavigationController *)self viewControllers],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          unint64_t v10 = [v9 count],
          v9,
          v10 >= 2))
    {
      uint64_t v11 = [v7 navigationItem];
      [v11 setHidesBackButton:v3];
    }
    goto LABEL_10;
  }
  [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:self];
  char v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v7 didPreventBookmarkActionWithBookmarkType:0 actionType:2];
LABEL_10:

LABEL_11:
}

- (void)_didPressEditingDoneButton
{
}

- (void)_didPressEditButton
{
}

- (void)toggleEditBookmarks
{
}

- (void)_didPressNewFolderButton
{
  id v8 = [(BookmarksNavigationController *)self topBookmarksTableViewController];
  id v3 = objc_alloc(MEMORY[0x1E4FB60E0]);
  uint64_t v4 = [v8 folderID];
  uint64_t v5 = [(WebBookmarkCollection *)self->_bookmarkCollection configuration];
  id v6 = objc_msgSend(v3, "initFolderWithParentID:collectionType:", v4, objc_msgSend(v5, "collectionType"));

  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F3AF20]) initWithBookmark:v6 inCollection:self->_bookmarkCollection addingBookmark:0];
  [v7 setDelegate:self];
  [(BookmarksNavigationController *)self setPinnedPaletteForPanelViewController:v7];
  [(BookmarksNavigationController *)self pushViewController:v7 animated:1];
}

- (BOOL)rebaseOnDescendentBookmark:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(BookmarksNavigationController *)self viewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7)
  {

    goto LABEL_16;
  }
  uint64_t v8 = v7;
  double v16 = self;
  LOBYTE(v9) = 0;
  uint64_t v10 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v13 = [v12 folderID];
        if (!(v9 & 1 | (v13 == [v4 identifier]))) {
          goto LABEL_8;
        }
      }
      else if ((v9 & 1) == 0)
      {
LABEL_8:
        int v9 = 0;
        continue;
      }
      [v5 addObject:v12];
      int v9 = 1;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v8);

  if (!v9)
  {
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  [(BookmarksNavigationController *)v16 setViewControllers:v5];
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)rebaseOnAncestorBookmark:(id)a3 skipOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(BookmarksNavigationController *)self viewControllers];
  uint64_t v8 = [v7 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(BookmarksNavigationController *)self viewControllers];
    uint64_t v11 = (void *)[v10 mutableCopy];

    bookmarkCollection = self->_bookmarkCollection;
    int v13 = [(BookmarksNavigationController *)self viewControllers];
    BOOL v14 = [v13 objectAtIndex:0];
    long long v15 = -[WebBookmarkCollection bookmarkWithID:](bookmarkCollection, "bookmarkWithID:", [v14 folderID]);

    LODWORD(v13) = [v15 identifier];
    if (v13 == [v6 identifier])
    {
      id v16 = [(BookmarksNavigationController *)self newBookmarksTableViewControllerWithFolder:v6 skipOffset:v4];
      [v11 replaceObjectAtIndex:0 withObject:v16];
LABEL_4:
      [(BookmarksNavigationController *)self setViewControllers:v11];

      BOOL v17 = 1;
    }
    else
    {
      while (1)
      {
        int v18 = [v15 identifier];
        long long v19 = [(WebBookmarkCollection *)self->_bookmarkCollection rootBookmark];
        int v20 = [v19 identifier];

        if (v18 == v20) {
          break;
        }
        CGRect v21 = v15;
        long long v15 = -[WebBookmarkCollection bookmarkWithID:](self->_bookmarkCollection, "bookmarkWithID:", [v15 parentID]);

        LODWORD(v21) = [v15 identifier];
        if (v21 == [v6 identifier]) {
          uint64_t v22 = v4;
        }
        else {
          uint64_t v22 = 0;
        }
        id v16 = [(BookmarksNavigationController *)self newBookmarksTableViewControllerWithFolder:v15 skipOffset:v22];
        [v11 insertObject:v16 atIndex:0];
        int v23 = [v15 identifier];
        if (v23 == [v6 identifier]) {
          goto LABEL_4;
        }
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_setupCollections
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"BookmarksCollection"];
  uint64_t v4 = +[FeatureManager sharedFeatureManager];
  int v5 = [v4 isReadingListAvailable];

  if (v5) {
    [v3 addObject:@"ReadingListCollection"];
  }
  [v3 addObject:@"HistoryCollection"];
  id v6 = (NSArray *)[v3 copy];

  topLevelCollections = self->_topLevelCollections;
  self->_topLevelCollections = v6;
}

- (void)_setupCollectionSegmentedControlIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_collectionSegmentedControl)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = self->_topLevelCollections;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = -[BookmarksNavigationController _segmentedControlItemForCollection:](self, "_segmentedControlItemForCollection:", *(void *)(*((void *)&v12 + 1) + 8 * v8), (void)v12);
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v10 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v3];
    collectionSegmentedControl = self->_collectionSegmentedControl;
    self->_collectionSegmentedControl = v10;

    [(UISegmentedControl *)self->_collectionSegmentedControl setAccessibilityIdentifier:@"BookmarksSegmentedControl"];
    [(UISegmentedControl *)self->_collectionSegmentedControl setSpringLoaded:1];
    [(UISegmentedControl *)self->_collectionSegmentedControl addTarget:self action:sel__selectedCollectionChanged_ forControlEvents:4096];
  }
}

- (void)_doneButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerDidPressDoneButton:self];
  }
}

- (id)_segmentedControlItemForCollection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BookmarksCollection"])
  {
    uint64_t v4 = @"book";
  }
  else if ([v3 isEqualToString:@"ReadingListCollection"])
  {
    uint64_t v4 = @"eyeglasses";
  }
  else if ([v3 isEqualToString:@"HistoryCollection"])
  {
    uint64_t v4 = @"clock";
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];
  uint64_t v7 = [v5 actionWithTitle:&stru_1F3C268E8 image:v6 identifier:v3 handler:&__block_literal_global_6];

  return v7;
}

- (void)_selectedCollectionChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[NSArray objectAtIndex:](self->_topLevelCollections, "objectAtIndex:", [a3 selectedSegmentIndex]);
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tap %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(BookmarksNavigationController *)self setCurrentCollection:v4];
}

- (id)newBookmarksTableViewControllerWithFolder:(id)a3 skipOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [[BookmarksTableViewController alloc] initWithFolder:v6 inCollection:self->_bookmarkCollection skipOffset:v4];

  [(BookmarksTableViewController *)v7 setDelegate:self];
  uint64_t v8 = [(BookmarksNavigationController *)self linkPreviewProvider];
  [(BookmarksTableViewController *)v7 setLinkPreviewProvider:v8];

  [(BookmarksTableViewController *)v7 setNavigationIntentHandler:self];
  return v7;
}

- (id)newRootViewControllerForCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BookmarksNavigationController *)self linkPreviewProvider];
  if ([v4 isEqualToString:@"BookmarksCollection"])
  {
    id v6 = [(WebBookmarkCollection *)self->_bookmarkCollection rootBookmark];
    uint64_t v7 = [(BookmarksNavigationController *)self newBookmarksTableViewControllerWithFolder:v6 skipOffset:0];
  }
  else if ([v4 isEqualToString:@"HistoryCollection"])
  {
    uint64_t v7 = [(BookmarksNavigationController *)self makeHistoryViewController];
  }
  else if ([v4 isEqualToString:@"ReadingListCollection"])
  {
    uint64_t v7 = objc_alloc_init(ReadingListViewController);
    [(ReadingListViewController *)v7 setDelegate:self];
    [(ReadingListViewController *)v7 setLinkPreviewProvider:v5];
    [(ReadingListViewController *)v7 setNavigationIntentHandler:self];
    uint64_t v8 = [(BookmarksNavigationController *)self tabGroupProvider];
    [(ReadingListViewController *)v7 setTabGroupProvider:v8];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)makeHistoryViewController
{
  id v3 = [(BookmarksNavigationController *)self linkPreviewProvider];
  id v4 = [(BookmarksNavigationController *)self tabGroupProvider];
  uint64_t v5 = [v4 activeProfile];
  int v6 = [v4 hasMultipleProfiles];
  uint64_t v7 = +[Application sharedApplication];
  uint64_t v8 = [v7 historyController];
  int v9 = [v5 identifier];
  uint64_t v10 = [v8 historyForProfileIdentifier:v9 loadIfNeeded:1];

  uint64_t v11 = [[SFHistoryViewController alloc] initWithHistory:v10];
  [(SFHistoryViewController *)v11 setDelegate:self];
  [(SFHistoryViewController *)v11 setLinkPreviewProvider:v3];
  [(SFHistoryViewController *)v11 setNavigationIntentHandler:self];
  long long v12 = [(BookmarksNavigationController *)self tabGroupProvider];
  [(SFHistoryViewController *)v11 setTabGroupProvider:v12];

  if (v6)
  {
    long long v13 = NSString;
    long long v14 = _WBSLocalizedString();
    long long v15 = [v5 title];
    id v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);
    [(SFHistoryViewController *)v11 setTitle:v16];
  }
  return v11;
}

- (void)setCurrentCollection:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_currentCollection = &self->_currentCollection;
  if (([v5 isEqualToString:self->_currentCollection] & 1) == 0)
  {
    if (*p_currentCollection) {
      [(BookmarksNavigationController *)self _savePanelState];
    }
    id v7 = [(BookmarksNavigationController *)self newRootViewControllerForCollection:v5];
    objc_storeStrong((id *)&self->_currentCollection, a3);
    v9[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(BookmarksNavigationController *)self setViewControllers:v8];

    [(BookmarksNavigationController *)self _restoreCurrentCollectionState];
    [(UISegmentedControl *)self->_collectionSegmentedControl setSelectedSegmentIndex:[(NSArray *)self->_topLevelCollections indexOfObject:*p_currentCollection]];
    [(BookmarksNavigationController *)self _updateToolbarVisibility];
  }
}

- (void)_updateToolbarVisibility
{
  if (self->_importHandler)
  {
    if ([(BookmarksNavigationController *)self isToolbarHidden]) {
      return;
    }
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = !self->_allowsEditing;
    if ([(BookmarksNavigationController *)self isToolbarHidden] == v3) {
      return;
    }
  }
  [(BookmarksNavigationController *)self setToolbarHidden:v3];
}

- (void)_loadSavedPanelState
{
  if (![(BookmarksNavigationController *)self _createSavedPanelStateForTesting])
  {
    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    BOOL v3 = [v8 dictionaryForKey:@"BookmarksPanelSavedState"];
    id v4 = (NSMutableDictionary *)[v3 mutableCopy];
    savedCollectionState = self->_savedCollectionState;
    self->_savedCollectionState = v4;

    if (!self->_savedCollectionState)
    {
      int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = self->_savedCollectionState;
      self->_savedCollectionState = v6;
    }
  }
}

- (void)_savePanelState
{
  [(NSMutableDictionary *)self->_savedCollectionState setObject:self->_currentCollection forKey:@"CurrentCollection"];
  BOOL v3 = self->_currentCollection;
  id v4 = [(BookmarksNavigationController *)self viewControllers];
  id v8 = [v4 objectAtIndex:0];

  id v5 = [v8 currentStateDictionary];
  int v6 = (void *)[v5 mutableCopy];

  [(NSMutableDictionary *)self->_savedCollectionState setObject:v6 forKey:v3];
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setObject:self->_savedCollectionState forKey:@"BookmarksPanelSavedState"];
}

- (void)_restorePanelState
{
  if ([(NSMutableDictionary *)self->_savedCollectionState count])
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_savedCollectionState objectForKey:@"CurrentCollection"];
    topLevelCollections = self->_topLevelCollections;
    id v8 = (id)v3;
    if (!v3)
    {
LABEL_5:
      id v5 = [(NSArray *)topLevelCollections objectAtIndex:0];
      [(BookmarksNavigationController *)self setCurrentCollection:v5];

      goto LABEL_9;
    }
    if ([(NSArray *)topLevelCollections indexOfObject:v3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      topLevelCollections = self->_topLevelCollections;
      goto LABEL_5;
    }
    id v7 = self;
    uint64_t v6 = (uint64_t)v8;
  }
  else
  {
    uint64_t v6 = [(NSArray *)self->_topLevelCollections objectAtIndex:0];
    id v7 = self;
    id v8 = (id)v6;
  }
  [(BookmarksNavigationController *)v7 setCurrentCollection:v6];
LABEL_9:
}

- (void)_restoreCurrentCollectionState
{
  uint64_t v3 = [(BookmarksNavigationController *)self viewControllers];
  id v5 = [v3 objectAtIndex:0];

  id v4 = [(NSMutableDictionary *)self->_savedCollectionState objectForKey:self->_currentCollection];
  if (v4) {
    [v5 restoreStateWithDictionary:v4];
  }
}

+ (NSString)test_savedStateCollection
{
  return (NSString *)(id)_test_savedStateCollection;
}

+ (void)test_setSavedStateCollection:(id)a3
{
}

- (BOOL)_createSavedPanelStateForTesting
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  if (_test_savedStateCollection) {
    [v3 setObject:_test_savedStateCollection forKey:@"CurrentCollection"];
  }
  uint64_t v5 = [v4 count];
  if (v5) {
    objc_storeStrong((id *)&self->_savedCollectionState, v4);
  }

  return v5 != 0;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a4;
  id v7 = [(BookmarksNavigationController *)self viewControllers];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    int v9 = _WBSLocalizedString();
    uint64_t v10 = [v13 navigationItem];
    [v10 setBackButtonTitle:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(BookmarksNavigationController *)self _updateClearHistoryButton];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v13 updateSeparatorInset];
  }
  [(BookmarksNavigationController *)self _updateDoneButtonItemForViewController:v13];
  [(BookmarksNavigationController *)self _updateToolbarItemsForViewController:v13 animated:v5];
  [(BookmarksNavigationController *)self _updateToolbarVisibility];
  uint64_t v11 = [(BookmarksNavigationController *)self traitCollection];
  int v12 = objc_msgSend(v11, "sf_usesSidebarPresentation");

  if (v12) {
    [v13 setEdgesForExtendedLayout:0];
  }
}

- (void)_updateDoneButtonItemForViewController:(id)a3
{
  id v13 = a3;
  id v4 = [v13 navigationItem];
  BOOL v5 = [v4 rightBarButtonItem];
  uint64_t v6 = v5;
  if (!v5 || v5 == self->_doneButtonItem)
  {
    if (self->_doneButtonHidden)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      uint64_t v8 = [(BookmarksNavigationController *)self traitCollection];
      if ((objc_msgSend(v8, "sf_usesSidebarPresentation") & 1) != 0
        || !objc_msgSend(v13, "safari_wantsDoneButtonInModalBookmarksPanel"))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
        int v7 = objc_opt_respondsToSelector() ^ 1;
      }
    }
    if (!self->_doneButtonItem)
    {
      uint64_t v10 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:self->_importHandler != 0 target:self action:sel__doneButtonPressed];
      doneButtonItem = self->_doneButtonItem;
      self->_doneButtonItem = v10;

      [(UIBarButtonItem *)self->_doneButtonItem setAccessibilityIdentifier:@"Done"];
    }
    if ((v6 != 0) | v7 & 1)
    {
      if (v6 == 0 || (v7 & 1) == 0) {
        goto LABEL_17;
      }
      int v12 = 0;
    }
    else
    {
      int v12 = self->_doneButtonItem;
    }
    [v4 setRightBarButtonItem:v12 animated:1];
  }
LABEL_17:
}

- (void)setDoneButtonHidden:(BOOL)a3
{
  if (self->_doneButtonHidden != a3)
  {
    self->_doneButtonHidden = a3;
    id v4 = [(BookmarksNavigationController *)self topViewController];
    [(BookmarksNavigationController *)self _updateDoneButtonItemForViewController:v4];
  }
}

- (void)_bookmarkSyncTimerDidFire:(id)a3
{
  [(WebBookmarkCollection *)self->_bookmarkCollection _postBookmarksChangedSyncNotification];
  [(BookmarksNavigationController *)self _clearBookmarkSyncTimer];
}

- (void)_clearBookmarkSyncTimer
{
  [(NSTimer *)self->_bookmarkSyncTimer invalidate];
  bookmarkSyncTimer = self->_bookmarkSyncTimer;
  self->_bookmarkSyncTimer = 0;
}

- (void)setAllowsEditing:(BOOL)a3
{
  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    id v4 = [(BookmarksNavigationController *)self topViewController];
    [(BookmarksNavigationController *)self _updateToolbarItemsForViewController:v4 animated:0];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    id v7 = [(BookmarksNavigationController *)self topViewController];
    uint64_t v6 = [v7 view];
    [v6 setNeedsLayout];
  }
}

- (void)setTableSeparatorInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_tableSeparatorInset.left
    || a3.top != self->_tableSeparatorInset.top
    || a3.right != self->_tableSeparatorInset.right
    || a3.bottom != self->_tableSeparatorInset.bottom)
  {
    self->_tableSeparatorInset = a3;
    id v7 = [(BookmarksNavigationController *)self topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 updateSeparatorInset];
    }
    uint64_t v6 = [v7 view];
    [v6 setNeedsLayout];
  }
}

- (void)_setContentsDirty
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationControllerContentDidBecomeDirty:self];
  }
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return self->_prefersHalfHeightSheetPresentationWithLoweredBar;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[Application sharedApplication];
  BOOL v5 = [v4 tabGroupManager];
  [v5 removeTabGroupObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  [(BookmarksNavigationController *)&v6 dealloc];
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  p_navigationIntentHandler = &self->_navigationIntentHandler;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  [WeakRetained handleNavigationIntent:v7 completion:v6];
}

- (void)dispatchNavigationIntent:(id)a3
{
  p_navigationIntentHandler = &self->_navigationIntentHandler;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  [WeakRetained dispatchNavigationIntent:v4];
}

- (void)panelViewController:(id)a3 updateToolbarItemsAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(BookmarksNavigationController *)self topViewController];

  id v7 = v8;
  if (v6 == v8)
  {
    [(BookmarksNavigationController *)self _updateToolbarItemsForViewController:v8 animated:v4];
    id v7 = v8;
  }
}

- (void)setPinnedPaletteForPanelViewController:(id)a3
{
  id v12 = a3;
  if (-[BookmarksNavigationController _shouldShowPaletteForViewController:](self, "_shouldShowPaletteForViewController:"))
  {
    [(BookmarksNavigationController *)self _setupCollectionSegmentedControlIfNeeded];
    palette = self->_palette;
    if (!palette)
    {
      BOOL v5 = [(BookmarksNavigationController *)self view];
      [v5 bounds];
      double Width = CGRectGetWidth(v14);
      [(UISegmentedControl *)self->_collectionSegmentedControl bounds];
      CGFloat v7 = CGRectGetHeight(v15) + 12.0;

      id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, Width, v7);
      [v8 addSubview:self->_collectionSegmentedControl];
      int v9 = (_UINavigationBarPalette *)[objc_alloc(MEMORY[0x1E4FB21F8]) initWithContentView:v8];
      uint64_t v10 = self->_palette;
      self->_palette = v9;

      palette = self->_palette;
    }
    uint64_t v11 = [v12 navigationItem];
    [v11 _setBottomPalette:palette];
  }
}

- (void)panelViewControllerDidBeginEditing:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v8 tableView];
    BOOL v5 = [v4 _swipeActionController];
    id v6 = [v5 swipedIndexPaths];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  [(BookmarksNavigationController *)self setDoneButtonHidden:v7];
}

- (void)panelViewControllerDidEndEditing:(id)a3
{
}

- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3
{
  double top = self->_tableSeparatorInset.top;
  double left = self->_tableSeparatorInset.left;
  double bottom = self->_tableSeparatorInset.bottom;
  double right = self->_tableSeparatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4
{
  importHandler = (void (**)(id, id, id))self->_importHandler;
  if (importHandler) {
    importHandler[2](self->_importHandler, a4, a3);
  }
  return importHandler == 0;
}

- (BOOL)bookmarksTableViewIsReadOnly:(id)a3
{
  return self->_importHandler != 0;
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [WeakRetained tabGroupProvider];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (TabGroupProvider *)v3;
}

- (id)readingListViewControllerCurrentReadingListItem:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [WeakRetained bookmarksNavigationControllerCurrentContinuousReadingItem:self];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationController:self updateReadingListUnreadFilterShowingAllBookmarks:v4];
  }
}

- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksNavigationController:self setBookmark:v8 asRead:v5];
  }
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v3 = [(BookmarksNavigationController *)self topmostBookmarksTableViewController];
  [v3 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  id v4 = [(BookmarksNavigationController *)self topmostBookmarksTableViewController];
  [v4 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  id v4 = [(BookmarksNavigationController *)self topmostBookmarksTableViewController];
  [v4 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "folderID", a3);
  [(BookmarksNavigationController *)self _reloadFolderContentsForFolderIDIfNeeded:v5];
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  return (BookmarksNavigationControllerDelegate *)WeakRetained;
}

- (void)setBookmarksNavigationControllerDelegate:(id)a3
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

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)tableSeparatorInset
{
  double top = self->_tableSeparatorInset.top;
  double left = self->_tableSeparatorInset.left;
  double bottom = self->_tableSeparatorInset.bottom;
  double right = self->_tableSeparatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)hasTranslucentAppearance
{
  return self->_hasTranslucentAppearance;
}

- (void)setHasTranslucentAppearance:(BOOL)a3
{
  self->_hasTranslucentAppearance = a3;
}

- (BOOL)isContentBorrowed
{
  return self->_contentBorrowed;
}

- (void)setContentBorrowed:(BOOL)a3
{
  self->_contentBorrowed = a3;
}

- (BOOL)prefersHalfHeightSheetPresentationWithLoweredBar
{
  return self->_prefersHalfHeightSheetPresentationWithLoweredBar;
}

- (void)setPrefersHalfHeightSheetPresentationWithLoweredBar:(BOOL)a3
{
  self->_prefersHalfHeightSheetPresentationWithLoweredBar = a3;
}

- (NSString)currentCollection
{
  return self->_currentCollection;
}

- (id)importHandler
{
  return self->_importHandler;
}

- (void)setImportHandler:(id)a3
{
}

- (BOOL)doneButtonHidden
{
  return self->_doneButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_importHandler, 0);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_bookmarksNavigationControllerDelegate);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_savedCollectionState, 0);
  objc_storeStrong((id *)&self->_currentCollection, 0);
  objc_storeStrong((id *)&self->_topLevelCollections, 0);
  objc_storeStrong((id *)&self->_collectionSegmentedControl, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_editingDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_createFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_bookmarkSyncTimer, 0);
  objc_storeStrong((id *)&self->_readonlyCollectionQueue, 0);
  objc_storeStrong((id *)&self->_readonlyCollection, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

@end