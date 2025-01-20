@interface TabCollectionViewManager
- (BOOL)_canUpdateClassicBar;
- (BOOL)_canUpdateUnifiedBar;
- (BOOL)_isPrivateBrowsingAndLocked;
- (BOOL)_isTabHiddenWithUUID:(id)a3;
- (BOOL)_shouldShowExplanationView;
- (BOOL)_shouldUpdateSnapshotsForTabHoverPreview;
- (BOOL)areSnapshotsEnabled;
- (BOOL)hasTabBar;
- (BOOL)isPlaceholderItemValid:(id)a3;
- (BOOL)isShowingTabView;
- (BOOL)isTabOverviewVisible;
- (BOOL)isTabThumbnailViewVisible;
- (BOOL)privateBrowsingEnabled;
- (BOOL)shouldDeferSnapshotRequest;
- (BOOL)snapshotInvalidationIsPostponed;
- (BOOL)suppressTabBarAnimation;
- (BOOL)tabBar:(id)a3 canMoveItem:(id)a4;
- (BOOL)tabBarItemsFixed;
- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4;
- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4;
- (BOOL)tabCollectionView:(id)a3 item:(id)a4 matchesSearchText:(id)a5;
- (BOOL)tabCollectionView:(id)a3 validSnapshotExistsForItem:(id)a4;
- (BOOL)tabCollectionViewCanDismiss:(id)a3;
- (BOOL)tabGroupSwitcherCanShowProfileInToolbar:(id)a3;
- (BOOL)tabItem:(id)a3 matchesSearchText:(id)a4;
- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3;
- (BOOL)tabViewDefersActivation;
- (BrowserController)browserController;
- (NSArray)tabCollectionViews;
- (NSSet)allSnapshotIdentifiers;
- (SFTabIconPool)iconPool;
- (SFTabSnapshotPool)snapshotPool;
- (TabBar)tabBar;
- (TabBarManager)tabBarManager;
- (TabCollectionViewManager)init;
- (TabCollectionViewManagerDataSource)dataSource;
- (TabContainerView)tabViewContainerView;
- (TabDragDropInteractionController)tabDragDropController;
- (TabGroupSwitcherViewController)tabGroupSwitcherViewController;
- (TabMenuProviderDataSource)tabMenuProviderDataSource;
- (TabOverview)tabOverview;
- (TabSnapshotCache)snapshotCache;
- (TabSwitcherViewController)tabSwitcherViewController;
- (TabThumbnailCollectionView)tabThumbnailCollectionView;
- (UIEdgeInsets)effectiveSafeAreaInsetsForTabCollectionView:(id)a3;
- (double)tabCollectionViewItemHeaderHeight:(id)a3;
- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3;
- (id)_blankSnapshotGroupIdentifierForTabGroup:(id)a3;
- (id)_contentForSnapshotWithIdentifier:(id)a3;
- (id)_extensionIconForTabWithURL:(id)a3 UUID:(id)a4;
- (id)_hiddenCollectionViewTabs;
- (id)_iconForTabWithUUID:(id)a3;
- (id)_openNewTabInteraction;
- (id)_recentlyClosedTabsMenu;
- (id)_tabCollectionItemsRemovingHiddenItems:(BOOL)a3 outHiddenItems:(id)a4 outIsDragging:(BOOL *)a5 itemRetriever:(id)a6;
- (id)_urlForTabWithUUID:(id)a3;
- (id)cachedContentImageForTabWithUUID:(id)a3 allowScaledImage:(BOOL)a4;
- (id)currentItemForTabOverview:(id)a3;
- (id)dragItemForTab:(id)a3 tabItem:(id)a4;
- (id)insertPlaceholderAfterTabItem:(id)a3;
- (id)postponedSnapshotInvalidationCondition;
- (id)replacePlaceholderItem:(id)a3 withTabsForDropSession:(id)a4 dragItems:(id)a5;
- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3;
- (id)tabCollectionView:(id)a3 borrowContentViewControllerForItem:(id)a4;
- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6;
- (id)tabCollectionView:(id)a3 snapshotForItem:(id)a4;
- (id)tabCollectionViewForItem:(id)a3;
- (id)tabWithUUID:(id)a3;
- (id)undoManagerForTabCollectionView:(id)a3;
- (int64_t)tabThumbnailCollectionViewStyle;
- (int64_t)visibleTabCollectionViewType;
- (unint64_t)_indexToInsertPlaceholderAtTabItem:(id)a3;
- (unint64_t)_snapshotCacheCapacity;
- (unint64_t)_snapshotCacheCapacityWithSnapshotsEnabled:(BOOL)a3;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_enumerateTabsOrderedByVisibility:(id)a3;
- (void)_movePlaceholder:(id)a3 toIndex:(unint64_t)a4;
- (void)_openTabFromNewTabButton;
- (void)_setTabsForDragItems:(id)a3 hidden:(BOOL)a4;
- (void)_setUpTabOverview;
- (void)_setUpTabSwitcherViewController;
- (void)_temporarilyUpdateSnapshotsForTabDocument:(id)a3;
- (void)_updateAddTabMenuProvider;
- (void)_updateClassicTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4;
- (void)_updateSnapshotCacheStateWithCapacity:(unint64_t)a3;
- (void)_updateTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4;
- (void)_updateTabSnapshotsAnimated:(BOOL)a3;
- (void)_updateTabSnapshotsWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)_updateUnifiedTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4;
- (void)addSnapshotCacheObserver:(id)a3;
- (void)beginFixingTabBarItems;
- (void)beginFixingTabOverviewItems;
- (void)clearSnapshotCache;
- (void)closeAllTabsForTabGroupSwitcher:(id)a3;
- (void)dealloc;
- (void)didBeginTrackingSession:(id)a3;
- (void)didEndTrackingSession:(id)a3;
- (void)dismissTabGroupSwitcher:(id)a3;
- (void)dismissTabHoverPreview;
- (void)endFixingTabBarItems;
- (void)endFixingTabOverviewItems;
- (void)flushPendingSnapshotsWithCompletion:(id)a3;
- (void)hideTabsForDragItems:(id)a3;
- (void)invalidateSnapshotForTab:(id)a3;
- (void)movePlaceholder:(id)a3 overTabItem:(id)a4;
- (void)movePlaceholderToEndOfPinnedTabs:(id)a3;
- (void)openNewTabForTabGroupSwitcher:(id)a3;
- (void)performBatchUpdatesWithBlock:(id)a3;
- (void)presentTabGroupSheetForTabGroupSwitcher:(id)a3;
- (void)removePlaceholderItem:(id)a3;
- (void)removeSnapshotCacheObserver:(id)a3;
- (void)removeSnapshotForTabWithUUID:(id)a3;
- (void)requestSnapshotForTabDocument:(id)a3 completion:(id)a4;
- (void)setBrowserController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPostponedSnapshotInvalidationCondition:(id)a3;
- (void)setPrivateBrowsingEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldDeferSnapshotRequest:(BOOL)a3;
- (void)setSnapshotInvalidationIsPostponed:(BOOL)a3;
- (void)setSnapshotsEnabled:(BOOL)a3;
- (void)setSuppressTabBarAnimation:(BOOL)a3;
- (void)setTabBar:(id)a3;
- (void)setTabBarManager:(id)a3;
- (void)setTabOverviewVisible:(BOOL)a3;
- (void)setTabThumbnailCollectionViewStyle:(int64_t)a3;
- (void)setTabThumbnailViewVisible:(BOOL)a3;
- (void)setTabViewDefersActivation:(BOOL)a3;
- (void)tabBar:(id)a3 toggleMediaStateMutedForItem:(id)a4;
- (void)tabBarManager:(id)a3 didCreateTabBar:(id)a4;
- (void)tabCollectionView:(id)a3 closeCloudTab:(id)a4 onDevice:(id)a5;
- (void)tabCollectionView:(id)a3 closeItem:(id)a4;
- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4;
- (void)tabCollectionView:(id)a3 item:(id)a4 didProduceNavigationIntent:(id)a5;
- (void)tabCollectionView:(id)a3 relinquishBorrowedContentView:(id)a4 forItem:(id)a5;
- (void)tabCollectionView:(id)a3 relinquishBorrowedContentViewController:(id)a4 forItem:(id)a5;
- (void)tabCollectionViewBeginIgnoringUserInteraction:(id)a3 reason:(id)a4;
- (void)tabCollectionViewDidCancelDismissal:(id)a3;
- (void)tabCollectionViewDidDismiss:(id)a3;
- (void)tabCollectionViewEndIgnoringUserInteraction:(id)a3 reason:(id)a4;
- (void)tabCollectionViewWillDismiss:(id)a3;
- (void)tabCollectionViewWillPresent:(id)a3;
- (void)tabHoverPreviewController:(id)a3 showPreviewForItem:(id)a4;
- (void)tabHoverPreviewControllerDismissPreview:(id)a3;
- (void)tabOverview:(id)a3 closeItems:(id)a4;
- (void)tabOverview:(id)a3 willInteractivelyCloseItem:(id)a4;
- (void)tabOverviewDidChangeAllowsInteractivePresentation:(id)a3;
- (void)tabOverviewWillUpdateInteractivePresentation:(id)a3;
- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4;
- (void)tabSnapshotCache:(id)a3 didEvictSnapshotWithIdentifier:(id)a4;
- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5;
- (void)tabSnapshotCacheDidFinishUpdating:(id)a3;
- (void)unhideTabsForDragItems:(id)a3;
- (void)updateExplanationViewVisibilityAnimated:(BOOL)a3;
- (void)updateSnapshotCacheAndSnapshotActiveTab;
- (void)updateSnapshotCacheState;
- (void)updateSnapshotIdentifiers;
- (void)updateSnapshotsForTabHoverPreviewIfNeeded;
- (void)updateStartPageSnapshotIfNeededForTabDocument:(id)a3 currentSnapshotSize:(CGSize)a4;
- (void)updateTabBarAnimated:(BOOL)a3;
- (void)updateTabBarAnimated:(BOOL)a3 keepingTabVisible:(id)a4;
- (void)updateTabOverviewItems;
- (void)updateTabViewsAnimatingTabBar:(BOOL)a3;
- (void)webViewDidFirstMeaningfulPaintForTabDocument:(id)a3;
- (void)willBeginDragSession:(id)a3;
- (void)willEndDragSession:(id)a3;
@end

@implementation TabCollectionViewManager

- (BOOL)isShowingTabView
{
  v2 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  BOOL v3 = [v2 presentationState] == 1 || objc_msgSend(v2, "presentationState") == 2;

  return v3;
}

- (TabThumbnailCollectionView)tabThumbnailCollectionView
{
  tabSwitcherViewController = self->_tabSwitcherViewController;
  if (!tabSwitcherViewController) {
    tabSwitcherViewController = self->_tabOverview;
  }
  id v3 = tabSwitcherViewController;
  return (TabThumbnailCollectionView *)v3;
}

- (BOOL)tabBarItemsFixed
{
  return self->_tabBarItemsFixed != 0;
}

- (TabGroupSwitcherViewController)tabGroupSwitcherViewController
{
  return self->_tabGroupSwitcherViewController;
}

- (void)endFixingTabOverviewItems
{
}

- (void)endFixingTabBarItems
{
}

- (void)updateTabOverviewItems
{
  if (self->_tabOverviewItemsFixed) {
    return;
  }
  if (SFEnhancedTabOverviewEnabled())
  {
    tabSwitcherViewController = self->_tabSwitcherViewController;
    [(TabSwitcherViewController *)tabSwitcherViewController setNeedsApplyContentAnimated:1];
    return;
  }
  if (!self->_tabOverview) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v5 = SFTabGroupSwitcherEnabled();
  BOOL v6 = [(TabCollectionViewManager *)self _isPrivateBrowsingAndLocked];
  if (!v5)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v11 = [(TabCollectionViewManager *)self _tabCollectionItemsRemovingHiddenItems:1 outHiddenItems:0 outIsDragging:0 itemRetriever:&__block_literal_global_39];
      v8 = objc_msgSend(v11, "safari_partionedArrayUsingCondition:", &__block_literal_global_37);
    }
    v12 = +[Application sharedApplication];
    if ([v12 isPrivateBrowsingLocked])
    {
      BOOL v13 = [(TabCollectionViewManager *)self privateBrowsingEnabled];

      if (!v13)
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_22:
        if (self->_privateBrowsingEnabled) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 1;
        }
        [(TabOverview *)self->_tabOverview setItems:v8 alternateItems:v10 atPosition:v16];
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
    }
    v14 = [WeakRetained alternateTabs];
    v15 = objc_msgSend(v14, "safari_mapObjectsUsingBlock:", &__block_literal_global_39);

    v10 = objc_msgSend(v15, "safari_partionedArrayUsingCondition:", &__block_literal_global_39_0);

    goto LABEL_22;
  }
  if (!v6)
  {
    BOOL v9 = [(TabOverview *)self->_tabOverview showsLockedPrivateBrowsingView];
    [(TabOverview *)self->_tabOverview setShowsLockedPrivateBrowsingView:0 withUnlockHandler:0];
    v8 = [(TabOverview *)self->_tabOverview items];
    v10 = [(TabCollectionViewManager *)self _tabCollectionItemsRemovingHiddenItems:1 outHiddenItems:0 outIsDragging:0 itemRetriever:&__block_literal_global_39];
    [(TabOverview *)self->_tabOverview setItems:v10];
    if (v9 && (WBSIsEqual() & 1) == 0) {
      [(TabOverview *)self->_tabOverview resetPresentationScrollPosition];
    }
    goto LABEL_26;
  }
  objc_initWeak(&location, self);
  tabOverview = self->_tabOverview;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_2;
  v21 = &unk_1E6D78630;
  objc_copyWeak(&v22, &location);
  [(TabOverview *)tabOverview setShowsLockedPrivateBrowsingView:1 withUnlockHandler:&v18];
  -[TabOverview setItems:](self->_tabOverview, "setItems:", MEMORY[0x1E4F1CBF0], v18, v19, v20, v21);
  [(TabOverview *)self->_tabOverview layoutIfNeeded];
  [(TabOverview *)self->_tabOverview endAnimation];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_27:
  if ([(TabOverview *)self->_tabOverview presentationState]) {
    [(TabCollectionViewManager *)self updateSnapshotIdentifiers];
  }
  id v17 = objc_loadWeakRetained((id *)&self->_browserController);
  [v17 updateTabViewPinchRecognizer];
}

- (void)updateTabViewsAnimatingTabBar:(BOOL)a3
{
  [(TabCollectionViewManager *)self updateTabBarAnimated:a3 keepingTabVisible:0];
  [(TabCollectionViewManager *)self updateTabOverviewItems];
}

- (void)updateTabBarAnimated:(BOOL)a3
{
}

- (void)_updateClassicTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    if (self->_suppressTabBarAnimation)
    {
      BOOL v4 = 0;
    }
    else
    {
      v7 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
      BOOL v4 = [v7 presentationState] == 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  id v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = objc_loadWeakRetained((id *)&self->_browserController);
  [v10 updateShowingTabBarAnimated:v4];

  unsigned __int8 v15 = 0;
  v11 = [(TabCollectionViewManager *)self _tabCollectionItemsRemovingHiddenItems:1 outHiddenItems:0 outIsDragging:&v15 itemRetriever:&__block_literal_global_42];
  [WeakRetained setDraggingItem:v15];
  v12 = objc_msgSend(v11, "safari_partionedArrayUsingCondition:", &__block_literal_global_45_0);

  [WeakRetained layoutIfNeeded];
  objc_msgSend(WeakRetained, "setAllowsScrollingPinnedItems:", objc_msgSend(v9, "shouldAllowScrollingPinnedItems"));
  BOOL v13 = [WeakRetained items];
  int v14 = [v13 isEqualToArray:v12];

  if (v14) {
    [WeakRetained updatePinnedItems];
  }
  else {
    [WeakRetained setItems:v12 animated:v4];
  }
  [WeakRetained scrollToItem:v6 animated:v4];
}

- (void)_updateUnifiedTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  BOOL v4 = a3;
  id v34 = a4;
  if (v4 && !self->_suppressTabBarAnimation)
  {
    v32 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    BOOL v6 = [v32 presentationState] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = objc_loadWeakRetained((id *)&self->_browserController);
  [v9 updateShowingTabBarAnimated:v6];
  id v10 = [v8 currentTabs];
  if ((unint64_t)[v10 count] <= 1)
  {
    BOOL privateBrowsingEnabled = self->_privateBrowsingEnabled;

    if (privateBrowsingEnabled)
    {
      v12 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [MEMORY[0x1E4F1CA80] set];
LABEL_9:
  BOOL v13 = [(TabCollectionViewManager *)self _tabCollectionItemsRemovingHiddenItems:0 outHiddenItems:v12 outIsDragging:0 itemRetriever:&__block_literal_global_48];
  int v14 = (void *)[v12 copy];
  if (v14)
  {
    [WeakRetained setHiddenItems:v14];
  }
  else
  {
    unsigned __int8 v15 = [MEMORY[0x1E4F1CAD0] set];
    [WeakRetained setHiddenItems:v15];
  }
  uint64_t v16 = [v8 activeNonLibraryTab];
  id v17 = [v16 unifiedTabBarItem];

  if ([v9 favoritesFieldShouldBeExpanded])
  {
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v19 = [v9 tabController];
    [v19 activeTabDocument];
    v33 = v17;
    id v20 = v8;
    v21 = v12;
    id v22 = v9;
    id v23 = WeakRetained;
    v24 = v13;
    v26 = BOOL v25 = v6;
    v27 = [v26 sfScribbleControllerIfLoaded];
    uint64_t v18 = [v27 isScribbling];

    BOOL v6 = v25;
    BOOL v13 = v24;
    id WeakRetained = v23;
    id v9 = v22;
    v12 = v21;
    id v8 = v20;
    id v17 = v33;
  }
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F784F0]), "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v13, v17, v18, objc_msgSend(v8, "shouldAllowScrollingPinnedItems"));
  id v29 = v34;
  if (!v34)
  {
    if ([WeakRetained displayMode] == 2
      && ([v9 rootViewController],
          v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = [v30 isPerformingSizeTransition],
          v30,
          v31))
    {
      id v29 = v17;
    }
    else
    {
      id v29 = 0;
    }
  }
  id v35 = v29;
  [WeakRetained setItemArrangement:v28 animated:v6 keepingItemVisible:v29];
}

- (id)_tabCollectionItemsRemovingHiddenItems:(BOOL)a3 outHiddenItems:(id)a4 outIsDragging:(BOOL *)a5 itemRetriever:(id)a6
{
  id v10 = a4;
  v11 = (void (**)(id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v13 = [WeakRetained currentTabs];
  int v14 = v13;
  int v16 = 0;
  if (self->_placeholderItem)
  {
    unint64_t placeholderItemIndex = self->_placeholderItemIndex;
    if (placeholderItemIndex <= [v13 count]
      && self->_placeholderItemIsPrivate == self->_privateBrowsingEnabled)
    {
      int v16 = 1;
    }
  }
  if ([v14 count])
  {
    id v17 = [v14 firstObject];
    v11[2](v11, v17);
    v32 = v14;
    uint64_t v18 = v11;
    id v19 = WeakRetained;
    id v20 = v10;
    v21 = a5;
    v23 = BOOL v22 = a3;
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    a3 = v22;
    a5 = v21;
    id v10 = v20;
    id WeakRetained = v19;
    v11 = v18;
    int v14 = v32;

    v16 &= isKindOfClass;
  }
  BOOL v25 = [MEMORY[0x1E4F1CA48] array];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__TabCollectionViewManager__tabCollectionItemsRemovingHiddenItems_outHiddenItems_outIsDragging_itemRetriever___block_invoke;
  v33[3] = &unk_1E6D7BA58;
  char v38 = v16;
  v33[4] = self;
  id v26 = v25;
  id v34 = v26;
  v27 = v11;
  v36 = v27;
  v37 = a5;
  id v28 = v10;
  id v35 = v28;
  BOOL v39 = a3;
  [v14 enumerateObjectsUsingBlock:v33];
  if (v16)
  {
    unint64_t v29 = self->_placeholderItemIndex;
    if (v29 == [v14 count]) {
      [v26 addObject:self->_placeholderItem];
    }
  }
  v30 = (void *)[v26 copy];

  return v30;
}

uint64_t __82__TabCollectionViewManager__updateUnifiedTabBarAnimated_keepingTabVisibleForItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unifiedTabBarItem];
}

uint64_t __82__TabCollectionViewManager__updateClassicTabBarAnimated_keepingTabVisibleForItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tabBarItem];
}

- (void)updateTabBarAnimated:(BOOL)a3 keepingTabVisible:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if ([(TabCollectionViewManager *)self _canUpdateUnifiedBar])
  {
    BOOL v6 = [v8 unifiedTabBarItem];
    [(TabCollectionViewManager *)self _updateUnifiedTabBarAnimated:v4 keepingTabVisibleForItem:v6];
  }
  if ([(TabCollectionViewManager *)self _canUpdateClassicBar])
  {
    v7 = [v8 tabBarItem];
    [(TabCollectionViewManager *)self _updateClassicTabBarAnimated:v4 keepingTabVisibleForItem:v7];
  }
}

- (BOOL)_canUpdateUnifiedBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  if (WeakRetained) {
    BOOL v4 = self->_tabBarItemsFixed == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_canUpdateClassicBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  if (WeakRetained) {
    BOOL v4 = self->_tabBarItemsFixed == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)_snapshotCacheCapacityWithSnapshotsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v6 = [WeakRetained viewControllerToPresentFrom];
  v7 = [v6 viewIfLoaded];

  if (v7)
  {
    id v8 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    [v7 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = [v7 traitCollection];
    unint64_t v18 = objc_msgSend(v8, "estimatedSnapshotsPerPageForBounds:withTraitCollection:", v17, v10, v12, v14, v16);

    if ([v8 presentationState])
    {
      if (v3)
      {
        if (+[Application systemMemorySize] > 0x40000000) {
          v18 *= 2;
        }
        else {
          unint64_t v18 = (unint64_t)((double)v18 * 1.5);
        }
      }
    }
    else if (v3)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_tabBar);
      BOOL v20 = [(TabCollectionViewManager *)self _shouldUpdateSnapshotsForTabHoverPreview];
      BOOL v21 = v20;
      if (v19 && v20)
      {
        v18 += [v19 maxNumberOfVisibleTabs];
      }
      else
      {
        id v22 = objc_loadWeakRetained((id *)&self->_tabBarManager);
        id v23 = [v22 effectiveTabBar];

        if (v23) {
          BOOL v24 = v21;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24) {
          v18 += [v23 maximumNumberOfVisibleItems];
        }
      }
    }
    else
    {
      unint64_t v18 = 0;
    }
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldUpdateSnapshotsForTabHoverPreview
{
  if (self->_snapshotsEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
    BOOL v4 = [WeakRetained effectiveTabBar];
    if (v4)
    {

LABEL_5:
      BOOL v6 = +[Application sharedApplication];
      char v7 = [v6 hasPointerDevice];

      return v7;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_tabBar);

    if (v5) {
      goto LABEL_5;
    }
  }
  return 0;
}

uint64_t __82__TabCollectionViewManager__updateClassicTabBarAnimated_keepingTabVisibleForItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (NSSet)allSnapshotIdentifiers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v4 = [WeakRetained normalAndPrivateTabs];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count") + 2);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) uuid];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v12 = objc_msgSend(WeakRetained, "allTabGroups", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [(TabCollectionViewManager *)self _blankSnapshotGroupIdentifierForTabGroup:*(void *)(*((void *)&v19 + 1) + 8 * j)];
        [v5 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return (NSSet *)v5;
}

- (id)_blankSnapshotGroupIdentifierForTabGroup:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F78558] settings];
  if ([v4 isSyncable])
  {
    id v6 = [v4 uuid];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [v4 isPrivateBrowsing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v9 = [WeakRetained UUID];

  double v10 = [v5 blankSnapshotGroupIdentifierForPrivateBrowsing:v7 syncableTabGroupUUID:v6 forWindowWithUUID:v9];
  if (!v10)
  {
    double v10 = [MEMORY[0x1E4F29128] UUID];
    [v5 setBlankSnapshotGroupIdentifier:v10 forPrivateBrowsing:v7 syncableTabGroupUUID:v6 forWindowWithUUID:v9];
  }

  return v10;
}

- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v9 = [v7 UUID];
  double v10 = [WeakRetained tabWithUUID:v9];

  if (!v10) {
    goto LABEL_4;
  }
  id v11 = objc_loadWeakRetained((id *)&self->_tabBar);
  if (v11 == v6)
  {

LABEL_6:
    id v15 = objc_loadWeakRetained((id *)&self->_tabBarManager);
    id v16 = [v15 inlineTabBar];
    if (v16 == v6)
    {
      uint64_t v17 = [v15 displayMode];

      if (v17 != 1)
      {
        char v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {
    }
    unint64_t v18 = [v7 UUID];
    char v14 = [WeakRetained canCloseTabWithUUID:v18];

LABEL_11:
    goto LABEL_12;
  }
  double v12 = v11;
  char v13 = [v7 isPinned];

  if ((v13 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  char v14 = 0;
LABEL_12:

  return v14;
}

- (TabOverview)tabOverview
{
  return self->_tabOverview;
}

- (TabContainerView)tabViewContainerView
{
  if (SFEnhancedTabOverviewEnabled())
  {
    BOOL v3 = 0;
  }
  else
  {
    if (self->_tabThumbnailCollectionViewStyle && !self->_tabGroupSwitcherViewController)
    {
      id v4 = [TabGroupSwitcherViewController alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v6 = [WeakRetained tabController];
      id v7 = [(TabGroupSwitcherViewController *)v4 initWithTabController:v6];
      tabGroupSwitcherViewController = self->_tabGroupSwitcherViewController;
      self->_tabGroupSwitcherViewController = v7;

      [(TabGroupSwitcherViewController *)self->_tabGroupSwitcherViewController setDelegate:self];
      [(TabOverview *)self->_tabOverview addPresentationObserver:self->_tabGroupSwitcherViewController];
    }
    BOOL v3 = [(TabGroupSwitcherViewController *)self->_tabGroupSwitcherViewController view];
  }
  return (TabContainerView *)v3;
}

- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (!SFEnhancedTabOverviewEnabled()) {
    goto LABEL_3;
  }
  id v4 = [WeakRetained tabController];
  id v5 = [v4 activeTabDocument];
  char v6 = [v5 isShowingSystemStartPage];

  double v7 = 0.0;
  if ((v6 & 1) == 0)
  {
LABEL_3:
    uint64_t v8 = [WeakRetained rootViewController];
    uint64_t v9 = [v8 documentAndTopBarsContainerView];
    [v8 navigationBarFrameInCoordinateSpace:v9];
    double MaxY = CGRectGetMaxY(v26);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = objc_msgSend(WeakRetained, "bannerController", 0);
    double v12 = [v11 topBannersAnchoredToStatusBar];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      double v16 = MaxY;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v18 bounds];
          objc_msgSend(v9, "convertRect:fromView:", v18);
          double v16 = fmax(v16, CGRectGetMaxY(v27));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = MaxY;
    }

    double v7 = v16 - MaxY;
  }

  return v7;
}

void __110__TabCollectionViewManager__tabCollectionItemsRemovingHiddenItems_outHiddenItems_outIsDragging_itemRetriever___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 56) == a3) {
      [*(id *)(a1 + 40) addObject:*(void *)(v5 + 48)];
    }
  }
  char v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v11 uuid];
  LODWORD(v7) = [v7 _isTabHiddenWithUUID:v8];

  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v9 = *(unsigned char **)(a1 + 64);
  if (v9) {
    *uint64_t v9 = 1;
  }
  double v10 = *(void **)(a1 + 48);
  if (v10) {
    [v10 addObject:v6];
  }
  if (!*(unsigned char *)(a1 + 73))
  {
LABEL_19:
    if (*(void *)(a1 + 64) && [v6 dragState]) {
      **(unsigned char **)(a1 + 64) = 1;
    }
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (BOOL)_isTabHiddenWithUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = [WeakRetained hiddenTabForExplanationView];
  double v7 = [v6 uuid];
  if ([v4 isEqual:v7]) {
    char v8 = 1;
  }
  else {
    char v8 = [(NSMutableSet *)self->_hiddenTabUUIDs containsObject:v4];
  }

  return v8;
}

- (void)_updateSnapshotCacheStateWithCapacity:(unint64_t)a3
{
  uint64_t v5 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  if ([v5 presentationState])
  {

LABEL_6:
    BOOL v8 = 1;
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v7 = [WeakRetained shouldSnapshotActiveTab];

  if ((v7 & 1) != 0 || self->_flushPendingSnapshots || self->_shouldUpdateSnapshotsTemporarily) {
    goto LABEL_6;
  }
  BOOL v8 = [(TabCollectionViewManager *)self _shouldUpdateSnapshotsForTabHoverPreview];
LABEL_7:
  BOOL v9 = self->_snapshotsEnabled && v8;
  [(TabSnapshotCache *)self->_snapshotCache setUpdating:v9 forDelegate:self];
  snapshotCache = self->_snapshotCache;
  [(TabSnapshotCache *)snapshotCache setCapacity:a3 forDelegate:self];
}

- (void)beginFixingTabOverviewItems
{
}

- (void)beginFixingTabBarItems
{
}

- (TabSwitcherViewController)tabSwitcherViewController
{
  return self->_tabSwitcherViewController;
}

- (SFTabIconPool)iconPool
{
  return self->_iconPool;
}

- (void)setTabBarManager:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBarManager, obj);
    [WeakRetained removeObserver:self];
    [obj addObserver:self];
  }
}

- (void)setDataSource:(id)a3
{
}

- (void)setBrowserController:(id)a3
{
}

- (TabCollectionViewManager)init
{
  v30.receiver = self;
  v30.super_class = (Class)TabCollectionViewManager;
  v2 = [(TabCollectionViewManager *)&v30 init];
  if (v2)
  {
    uint64_t v3 = +[TabSnapshotCache defaultSnapshotCache];
    snapshotCache = v2->_snapshotCache;
    v2->_snapshotCache = (TabSnapshotCache *)v3;

    v2->_snapshotsEnabled = 1;
    [(TabSnapshotCache *)v2->_snapshotCache setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    hiddenTabUUIDs = v2->_hiddenTabUUIDs;
    v2->_hiddenTabUUIDs = (NSMutableSet *)v5;

    objc_initWeak(&location, v2);
    id v7 = objc_alloc(MEMORY[0x1E4F783C8]);
    BOOL v8 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    uint64_t v9 = [v7 initWithSiteMetadataManager:v8];
    iconPool = v2->_iconPool;
    v2->_iconPool = (SFTabIconPool *)v9;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __32__TabCollectionViewManager_init__block_invoke;
    v27[3] = &unk_1E6D7B918;
    objc_copyWeak(&v28, &location);
    [(SFTabIconPool *)v2->_iconPool setExistingIconProvider:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __32__TabCollectionViewManager_init__block_invoke_2;
    v25[3] = &unk_1E6D7B940;
    objc_copyWeak(&v26, &location);
    [(SFTabIconPool *)v2->_iconPool setExtensionIconProvider:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__TabCollectionViewManager_init__block_invoke_3;
    v23[3] = &unk_1E6D7B968;
    objc_copyWeak(&v24, &location);
    [(SFTabIconPool *)v2->_iconPool setUrlProvider:v23];
    id v11 = (SFTabSnapshotPool *)objc_alloc_init(MEMORY[0x1E4F783D8]);
    snapshotPool = v2->_snapshotPool;
    v2->_snapshotPool = v11;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__TabCollectionViewManager_init__block_invoke_4;
    v21[3] = &unk_1E6D7B990;
    objc_copyWeak(&v22, &location);
    [(SFTabSnapshotPool *)v2->_snapshotPool setContentProvider:v21];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    unint64_t v18 = __32__TabCollectionViewManager_init__block_invoke_5;
    long long v19 = &unk_1E6D78630;
    objc_copyWeak(&v20, &location);
    [(SFTabSnapshotPool *)v2->_snapshotPool setSortedSnapshotIdentifiersDidChangeHandler:&v16];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v16, v17, v18, v19);
    [v13 addObserver:v2 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];
    uint64_t v14 = v2;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (SFTabSnapshotPool)snapshotPool
{
  return self->_snapshotPool;
}

- (void)tabSnapshotCacheDidFinishUpdating:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_flushPendingSnapshots = 0;
  self->_shouldUpdateSnapshotsTemporarily = 0;
  id v4 = self->_flushPendingSnapshotsCompletions;
  flushPendingSnapshotsCompletions = self->_flushPendingSnapshotsCompletions;
  self->_flushPendingSnapshotsCompletions = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v6 = v4;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(TabCollectionViewManager *)self updateSnapshotCacheState];
}

- (void)updateSnapshotCacheState
{
  unint64_t v3 = [(TabCollectionViewManager *)self _snapshotCacheCapacity];
  [(TabCollectionViewManager *)self _updateSnapshotCacheStateWithCapacity:v3];
}

- (unint64_t)_snapshotCacheCapacity
{
  return [(TabCollectionViewManager *)self _snapshotCacheCapacityWithSnapshotsEnabled:self->_snapshotsEnabled];
}

- (void)setSnapshotsEnabled:(BOOL)a3
{
  if (((!self->_snapshotsEnabled ^ a3) & 1) == 0)
  {
    self->_snapshotsEnabled = a3;
    if (a3)
    {
      postponedSnapshotInvalidationBlock = (void (**)(id, SEL))self->_postponedSnapshotInvalidationBlock;
      if (postponedSnapshotInvalidationBlock)
      {
        postponedSnapshotInvalidationBlock[2](postponedSnapshotInvalidationBlock, a2);
        id v5 = self->_postponedSnapshotInvalidationBlock;
        self->_postponedSnapshotInvalidationBlock = 0;
      }
    }
    [(TabCollectionViewManager *)self updateSnapshotCacheState];
  }
}

- (void)setPostponedSnapshotInvalidationCondition:(id)a3
{
}

id __32__TabCollectionViewManager_init__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _contentForSnapshotWithIdentifier:v3];

  return v5;
}

- (id)_contentForSnapshotWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TabSnapshotCache *)self->_snapshotCache snapshotWithIdentifier:v4];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v7 = [WeakRetained activeTabDocument];
    uint64_t v8 = [v7 uuid];
    int v9 = [v4 isEqual:v8];

    double v10 = 0.0;
    if (v9)
    {
      [(TabCollectionViewManager *)self tabCollectionViewItemHeaderHeightIncludedInSnapshot:self->_tabSwitcherViewController];
      double v10 = v11;
    }
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F783D0]), "initWithImage:bannerHeight:topBackdropHeight:isValid:", v5, -[TabSnapshotCache hasValidSnapshotWithIdentifier:](self->_snapshotCache, "hasValidSnapshotWithIdentifier:", v4), v10, 200.0);
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (NSArray)tabCollectionViews
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_tabOverview);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", WeakRetained);

  id v5 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  char v6 = [v5 effectiveTabBar];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v6);

  uint64_t v7 = (void *)[v3 copy];
  return (NSArray *)v7;
}

- (TabDragDropInteractionController)tabDragDropController
{
  tabDragDropController = self->_tabDragDropController;
  if (!tabDragDropController)
  {
    id v4 = [TabDocumentDropHandler alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    char v6 = [WeakRetained viewControllerToPresentFrom];
    uint64_t v7 = [(TabDocumentDropHandler *)v4 initWithAlertPresentationViewController:v6];

    uint64_t v8 = [[TabDragDropInteractionController alloc] initWithDataSource:self dropHandler:v7];
    int v9 = self->_tabDragDropController;
    self->_tabDragDropController = v8;

    tabDragDropController = self->_tabDragDropController;
  }
  return tabDragDropController;
}

- (void)setTabThumbnailCollectionViewStyle:(int64_t)a3
{
  if (self->_tabThumbnailCollectionViewStyle != a3)
  {
    id v5 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    char v6 = [v5 searchController];
    uint64_t v28 = [v6 searchTerm];

    self->_tabThumbnailCollectionViewStyle = a3;
    [v5 dismissAnimated:0];
    uint64_t v7 = [v5 view];
    [v7 removeFromSuperview];

    [v5 setDelegate:0];
    tabOverview = self->_tabOverview;
    self->_tabOverview = 0;

    tabGroupSwitcherViewController = self->_tabGroupSwitcherViewController;
    if (tabGroupSwitcherViewController)
    {
      double v10 = [(TabGroupSwitcherViewController *)tabGroupSwitcherViewController view];
      [v10 removeFromSuperview];

      double v11 = self->_tabGroupSwitcherViewController;
      self->_tabGroupSwitcherViewController = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    long long v13 = WeakRetained;
    if (self->_tabSwitcherViewController)
    {
      long long v14 = [WeakRetained rootViewController];
      [v14 tearDownTabSwitcherViewController];

      tabSwitcherViewController = self->_tabSwitcherViewController;
      self->_tabSwitcherViewController = 0;
    }
    if (a3 == 2)
    {
      if (SFEnhancedTabOverviewEnabled()) {
        [(TabCollectionViewManager *)self _setUpTabSwitcherViewController];
      }
    }
    else if (a3 == 1)
    {
      [(TabCollectionViewManager *)self _setUpTabOverview];
    }
    objc_initWeak(&location, self);
    uint64_t v16 = (void *)MEMORY[0x1E4FB13F0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke;
    v35[3] = &unk_1E6D78C18;
    objc_copyWeak(&v36, &location);
    uint64_t v17 = [v16 actionWithHandler:v35];
    unint64_t v18 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke_2;
    v33 = &unk_1E6D78C18;
    objc_copyWeak(&v34, &location);
    long long v19 = [v18 actionWithHandler:&v30];
    id v20 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    long long v21 = [v20 toolbar];

    [v21 addPrimaryAction:v17 forBarButton:1];
    [v21 addPrimaryAction:v19 forBarButton:2];
    id v22 = [(TabCollectionViewManager *)self _openNewTabInteraction];
    [v21 addInteraction:v22 toBarButton:1];

    long long v23 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_tabMenu");
    [v21 setMenu:v23 forBarButton:2];

    id v24 = +[FeatureManager sharedFeatureManager];
    LODWORD(v18) = [v24 isFloatingSidebarButtonEnabled];

    if (v18)
    {
      uint64_t v25 = [v13 sidebarAction];
      [v21 addPrimaryAction:v25 forBarButton:4];
    }
    [(TabCollectionViewManager *)self _updateAddTabMenuProvider];
    id v26 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    CGRect v27 = [v26 searchController];
    [v27 setSearchTerm:v29];

    [(TabCollectionViewManager *)self updateSnapshotCacheState];
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

- (void)setTabBar:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBar, obj);
    id v5 = [WeakRetained delegate];

    if (v5 == self) {
      [WeakRetained setDelegate:0];
    }
    char v6 = [WeakRetained tabHoverPreviewController];
    [v6 setDelegate:0];

    uint64_t v7 = [obj tabHoverPreviewController];
    [v7 setDelegate:self];

    [obj setDelegate:self];
    id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
    int v9 = [v8 activeNonLibraryTab];
    [(TabCollectionViewManager *)self updateTabBarAnimated:0 keepingTabVisible:v9];
  }
}

- (void)_updateAddTabMenuProvider
{
  id v5 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  id v3 = [v5 toolbar];
  id v4 = [(TabCollectionViewManager *)self _recentlyClosedTabsMenu];
  [v3 setMenu:v4 forBarButton:1];
}

- (void)_setUpTabSwitcherViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained rootViewController];
  id v5 = [v4 setUpTabSwitcherViewController];
  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = v5;

  [(TabSwitcherViewController *)self->_tabSwitcherViewController setDelegate:self];
  id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v7 didSetUpTabSwitcherViewController];
}

- (id)_recentlyClosedTabsMenu
{
  if (self->_privateBrowsingEnabled)
  {
    v2 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_initWeak(&from, WeakRetained);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __51__TabCollectionViewManager__recentlyClosedTabsMenu__block_invoke;
    long long v12 = &unk_1E6D7BA30;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    id v5 = (void *)MEMORY[0x1E4E42950](&v9);
    char v6 = (void *)MEMORY[0x1E4FB1970];
    id v7 = objc_msgSend(WeakRetained, "activeProfile", v9, v10, v11, v12);
    v2 = objc_msgSend(v6, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v7, objc_msgSend(WeakRetained, "hasMultipleProfiles"), v5);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)_openNewTabInteraction
{
  objc_copyWeak(&to, (id *)&self->_browserController);
  v2 = [UserNavigationDropInteraction alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__TabCollectionViewManager__openNewTabInteraction__block_invoke;
  v5[3] = &unk_1E6D7BA08;
  objc_copyWeak(&v6, &to);
  id v3 = [(UserNavigationDropInteraction *)v2 initWithOpensNewTab:1 tabOrder:1 navigationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&to);
  return v3;
}

void __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 48) != a3)
  {
    id v8 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v8;
    if (*(void *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL && *(void *)(a1 + 56) == a3)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      id v5 = v8;
    }
  }
}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v4 uuid];
  uint64_t v5 = [v4 isShowingSystemStartPage];

  (*(void (**)(uint64_t, id, uint64_t, void))(v3 + 16))(v3, v6, v5, *(void *)(a1 + 32));
}

void __32__TabCollectionViewManager_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSnapshotIdentifiers];
}

- (void)updateSnapshotIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  snapshotCache = self->_snapshotCache;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke;
  v6[3] = &unk_1E6D77D90;
  v6[4] = self;
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [(TabSnapshotCache *)snapshotCache performBatchUpdatesWithBlock:v6];
}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  if (v11)
  {
    [*(id *)(a1 + 32) addObject:v11];
    id v8 = *(void **)(*(void *)(a1 + 40) + 88);
    if (a3)
    {
      uint64_t v9 = [v8 groupIdentifierForSnapshotWithIdentifier:v11];
      char v10 = [v9 isEqual:v7];

      if ((v10 & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 40) + 88) addIdentifier:v11 toGroupWithIdentifier:v7];
        [*(id *)(*(void *)(a1 + 40) + 216) contentDidChangeForSnapshotsWithIdentifier:v11];
      }
    }
    else
    {
      [v8 removeIdentifier:v11 fromGroupWithIdentifier:v7];
    }
  }
}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_2;
  v81[3] = &unk_1E6D7BB48;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v54 = v3;
  id v82 = v3;
  uint64_t v83 = v4;
  id v5 = (void (**)(void, void, void, void))MEMORY[0x1E4E42950](v81);
  uint64_t v56 = [*(id *)(a1 + 40) activeTabGroup];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_blankSnapshotGroupIdentifierForTabGroup:");
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v60 = a1;
  id v7 = [*(id *)(a1 + 32) _hiddenCollectionViewTabs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        id v13 = [v12 uuid];
        ((void (**)(void, void *, uint64_t, void *))v5)[2](v5, v13, [v12 isShowingSystemStartPage], v6);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v9);
  }

  if (SFEnhancedTabOverviewEnabled()
    && ([*(id *)(v60 + 32) tabThumbnailCollectionView],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 presentationState],
        v14,
        v15))
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v16 = v60;
    uint64_t v17 = [*(id *)(*(void *)(v60 + 32) + 216) sortedSnapshotIdentifiers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v73 objects:v86 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v74;
      do
      {
        uint64_t v21 = 0;
        obuint64_t j = (id)v19;
        do
        {
          if (*(void *)v74 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v73 + 1) + 8 * v21);
          long long v23 = [*(id *)(v16 + 32) tabWithUUID:v22];
          id v24 = v23;
          if (v23)
          {
            uint64_t v25 = [v23 uuid];
            ((void (**)(void, void *, uint64_t, void *))v5)[2](v5, v25, [v24 isShowingSystemStartPage], v6);
          }
          else
          {
            id v26 = *(void **)(v16 + 40);
            [v22 UUIDString];
            uint64_t v27 = v20;
            uint64_t v29 = v28 = v17;
            uint64_t v25 = [v26 wbTabWithUUID:v29];

            uint64_t v30 = *(void **)(v16 + 40);
            uint64_t v31 = [v25 uuid];
            v32 = [v30 tabGroupRelatedToTabWithUUID:v31];

            v33 = [*(id *)(v60 + 32) _blankSnapshotGroupIdentifierForTabGroup:v32];
            ((void (**)(void, void *, uint64_t, void *))v5)[2](v5, v22, [v25 isBlank], v33);

            uint64_t v16 = v60;
            uint64_t v17 = v28;
            uint64_t v20 = v27;
            uint64_t v19 = (uint64_t)obj;
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v73 objects:v86 count:16];
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v16 = v60;
    id v34 = *(void **)(v60 + 32);
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_3;
    v70[3] = &unk_1E6D7BB70;
    v72 = v5;
    id v71 = v6;
    [v34 _enumerateTabsOrderedByVisibility:v70];

    uint64_t v17 = v72;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obja = [*(id *)(v16 + 40) allTabGroups];
  uint64_t v35 = [obja countByEnumeratingWithState:&v66 objects:v85 count:16];
  id v36 = (void *)v56;
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v67;
    uint64_t v55 = *(void *)v67;
    do
    {
      uint64_t v39 = 0;
      uint64_t v57 = v37;
      do
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(obja);
        }
        uint64_t v61 = v39;
        v40 = *(void **)(*((void *)&v66 + 1) + 8 * v39);
        v41 = [v40 uuid];
        v42 = [v36 uuid];
        char v43 = [v41 isEqual:v42];

        if ((v43 & 1) == 0)
        {
          uint64_t v44 = [*(id *)(v60 + 32) _blankSnapshotGroupIdentifierForTabGroup:v40];

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          v45 = [v40 tabs];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v62 objects:v84 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v63 != v48) {
                  objc_enumerationMutation(v45);
                }
                v50 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                id v51 = objc_alloc(MEMORY[0x1E4F29128]);
                v52 = [v50 uuid];
                v53 = (void *)[v51 initWithUUIDString:v52];
                ((void (**)(void, void *, uint64_t, uint64_t))v5)[2](v5, v53, [v50 isBlank], v44);
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v62 objects:v84 count:16];
            }
            while (v47);
          }

          id v6 = (void *)v44;
          uint64_t v38 = v55;
          id v36 = (void *)v56;
          uint64_t v37 = v57;
        }
        uint64_t v39 = v61 + 1;
      }
      while (v61 + 1 != v37);
      uint64_t v37 = [obja countByEnumeratingWithState:&v66 objects:v85 count:16];
    }
    while (v37);
  }

  objc_msgSend(*(id *)(*(void *)(v60 + 32) + 88), "setIdentifiersToCache:forDelegate:", v54);
}

- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3
{
  return self->_shouldDeferSnapshotRequest;
}

- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained allTabGroups];
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = objc_msgSend(v4, "safari_reduceObjectsWithInitialValue:usingBlock:", v5, &__block_literal_global_69_0);

  return v6;
}

- (id)_hiddenCollectionViewTabs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [WeakRetained currentTabs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__TabCollectionViewManager__hiddenCollectionViewTabs__block_invoke;
  v9[3] = &unk_1E6D78C60;
  v9[4] = self;
  id v6 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);
  id v7 = (void *)[v4 initWithArray:v6];

  return v7;
}

- (void)_enumerateTabsOrderedByVisibility:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  if ([v6 presentationState])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke;
    v30[3] = &unk_1E6D7BB98;
    id v32 = v4;
    id v31 = WeakRetained;
    id v7 = v4;
    [v6 enumerateItemsOrderedByVisibility:v30];

    uint64_t v8 = v32;
  }
  else
  {
    uint64_t v9 = [WeakRetained currentTabs];
    uint64_t v8 = [WeakRetained activeNonLibraryTab];
    uint64_t v10 = [v9 indexOfObject:v8];
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = v10;
    }
    if ((unint64_t)[v9 count] >= 2)
    {
      id v13 = [v9 lastObject];

      if (v8 == v13)
      {
        uint64_t v11 = 0;
      }
      else
      {
        id v14 = [v9 firstObject];

        if (v8 == v14) {
          uint64_t v11 = [v9 count] - 1;
        }
        else {
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke_2;
    uint64_t v25 = &unk_1E6D7BBC0;
    id v27 = v4;
    uint64_t v28 = v11;
    unint64_t v29 = v12;
    id v7 = v9;
    id v26 = v7;
    id v15 = v4;
    uint64_t v16 = (void *)MEMORY[0x1E4E42950](&v22);
    if ([(TabCollectionViewManager *)self _shouldUpdateSnapshotsForTabHoverPreview])
    {
      id v17 = objc_loadWeakRetained((id *)&self->_tabBar);
      id v18 = objc_loadWeakRetained((id *)&self->_tabBarManager);
      uint64_t v19 = [v18 effectiveTabBar];

      uint64_t v20 = v19;
      if ((v19 || (uint64_t v20 = v17, v21 = v12, v17))
        && (unint64_t v21 = [v20 indexOfCenterItem], v21 == 0x7FFFFFFFFFFFFFFFLL)
        || v21 >= [v7 count])
      {
        unint64_t v21 = v12;
      }
      objc_msgSend(v7, "safari_enumerateOutwardFromIndex:otherIndex:usingBlock:", v12, v21, v16);
    }
    else
    {
      objc_msgSend(v7, "safari_enumerateOutwardFromIndex:usingBlock:", v12, v16);
    }
  }
}

id __72__TabCollectionViewManager_snapshotsToPersistOnDiskForTabSnapshotCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 tabsUUIDSet];
  id v6 = [v4 setByAddingObjectsFromSet:v5];

  return v6;
}

uint64_t __53__TabCollectionViewManager__hiddenCollectionViewTabs__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 _isTabHiddenWithUUID:v3];

  return v4;
}

- (void)updateSnapshotsForTabHoverPreviewIfNeeded
{
  if ([(TabCollectionViewManager *)self _shouldUpdateSnapshotsForTabHoverPreview])
  {
    id v3 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    uint64_t v4 = [v3 presentationState];

    if (!v4)
    {
      [(TabCollectionViewManager *)self updateSnapshotIdentifiers];
    }
  }
}

id __32__TabCollectionViewManager_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _iconForTabWithUUID:v3];

  return v5;
}

id __32__TabCollectionViewManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [WeakRetained _extensionIconForTabWithURL:v6 UUID:v5];

  return v8;
}

id __32__TabCollectionViewManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _urlForTabWithUUID:v3];

  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_flushPendingSnapshotsCompletions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TabCollectionViewManager;
  [(TabCollectionViewManager *)&v8 dealloc];
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  [(TabCollectionViewManager *)self updateSnapshotIdentifiers];
  unint64_t v4 = [(TabCollectionViewManager *)self _snapshotCacheCapacityWithSnapshotsEnabled:0];
  [(TabCollectionViewManager *)self _updateSnapshotCacheStateWithCapacity:v4];
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_privateBrowsingEnabled != a3)
  {
    BOOL v4 = a4;
    self->_BOOL privateBrowsingEnabled = a3;
    [(TabCollectionViewManager *)self _updateAddTabMenuProvider];
    [(TabCollectionViewManager *)self updateExplanationViewVisibilityAnimated:v4];
    [(TabCollectionViewManager *)self updateTabOverviewItems];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v6 = [WeakRetained activeNonLibraryTab];
    [(TabCollectionViewManager *)self updateTabBarAnimated:0 keepingTabVisible:v6];
  }
}

- (BOOL)_isPrivateBrowsingAndLocked
{
  if (!self->_privateBrowsingEnabled) {
    return 0;
  }
  v2 = +[Application sharedApplication];
  char v3 = [v2 isPrivateBrowsingLocked];

  return v3;
}

- (BOOL)tabItem:(id)a3 matchesSearchText:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 lastSearchTerm];
  int v9 = [v8 isEqualToString:v7];

  long long v10 = [v6 title];
  long long v11 = [v6 titleForLastSearch];
  int v12 = [v10 isEqualToString:v11];

  id v13 = [v6 URLString];
  uint64_t v14 = [v6 URLStringForLastSearch];
  int v15 = [v13 isEqualToString:v14];

  if (v9 && v12 && v15)
  {
    LOBYTE(v16) = [v6 matchedLastSearch];
    goto LABEL_35;
  }
  if (([v7 isEqualToString:self->_lastSearchTerm] & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [v7 length];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke;
    v68[3] = &unk_1E6D7B9B8;
    id v69 = v17;
    id v19 = v17;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 3, v68);
    uint64_t v20 = (NSArray *)[v19 copy];
    searchTermWords = self->_searchTermWords;
    self->_searchTermWords = v20;
  }
  uint64_t v22 = (NSString *)[v7 copy];
  lastSearchTerm = self->_lastSearchTerm;
  self->_lastSearchTerm = v22;

  id v24 = [v6 title];
  uint64_t v25 = [v6 URLString];
  [v6 setLastSearchTerm:v7];
  [v6 setURLStringForLastSearch:v25];
  [v6 setTitleForLastSearch:v24];
  int v26 = [v24 localizedStandardContainsString:v7];
  char v27 = v26;
  if (((v12 ^ 1 | v26) & 1) == 0)
  {
    uint64_t v48 = [v6 titleWords];

    if (v48) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ((v12 & 1) == 0)
  {
LABEL_9:
    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v29 = [v24 length];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_2;
    v66[3] = &unk_1E6D7B9B8;
    id v67 = v28;
    id v30 = v28;
    objc_msgSend(v24, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 3, v66);
    [v6 setTitleWords:v30];
  }
LABEL_10:
  if (v27) {
    goto LABEL_33;
  }
  if ([(NSArray *)self->_searchTermWords count])
  {
    int v50 = v15;
    id v51 = v25;
    v52 = v24;
    id v53 = v7;
    id v31 = (void *)[(NSArray *)self->_searchTermWords mutableCopy];
    id v54 = v6;
    id v32 = [v6 titleWords];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = self->_searchTermWords;
    uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v63 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v38 = v32;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v59;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v59 != v41) {
                  objc_enumerationMutation(v38);
                }
                if (objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * j), "safari_hasLocalizedCaseAndDiacriticInsensitivePrefix:", v37))objc_msgSend(v31, "removeObject:", v37); {
              }
                }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
            }
            while (v40);
          }
        }
        uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v34);
    }

    uint64_t v43 = [v31 count];
    id v7 = v53;
    id v6 = v54;
    uint64_t v25 = v51;
    id v24 = v52;
    int v15 = v50;
    if (!v43) {
      goto LABEL_33;
    }
  }
  if (!v15
    || ([v6 URLStringComponents],
        uint64_t v44 = objc_claimAutoreleasedReturnValue(),
        v44,
        !v44))
  {
    v45 = objc_msgSend(v25, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
    uint64_t v46 = [v45 componentsSeparatedByString:@"."];
    [v6 setURLStringComponents:v46];
  }
  if ([v25 localizedStandardContainsString:v7])
  {
LABEL_33:
    LOBYTE(v16) = 1;
    [v6 setMatchedLastSearch:1];
  }
  else
  {
    v49 = [v6 URLStringComponents];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_3;
    v56[3] = &unk_1E6D7B9E0;
    id v57 = v7;
    uint64_t v16 = objc_msgSend(v49, "safari_containsObjectPassingTest:", v56);

    [v6 setMatchedLastSearch:v16];
  }

LABEL_35:
  return v16;
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_hasLocalizedCaseInsensitivePrefix:", *(void *)(a1 + 32));
}

- (void)_setUpTabOverview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [WeakRetained makeTabOverview];
  tabOverview = self->_tabOverview;
  self->_tabOverview = v4;

  [(TabOverview *)self->_tabOverview setDelegate:self];
  id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v6 didSetUpTabOverview];

  [(TabCollectionViewManager *)self updateTabOverviewItems];
  [(TabCollectionViewManager *)self updateExplanationViewVisibilityAnimated:0];
  id v7 = self->_tabOverview;
  tabGroupSwitcherViewController = self->_tabGroupSwitcherViewController;
  [(TabOverview *)v7 addPresentationObserver:tabGroupSwitcherViewController];
}

- (void)_openTabFromNewTabButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__TabCollectionViewManager__openTabFromNewTabButton__block_invoke;
  v4[3] = &unk_1E6D77C20;
  v4[4] = self;
  [WeakRetained openNewTabWithCompletionHandler:v4];
}

void __52__TabCollectionViewManager__openTabFromNewTabButton__block_invoke(uint64_t a1, int a2)
{
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Open new tab via tab view button", v6, 2u);
  }
  if (a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v5, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", 2, objc_msgSend(*(id *)(a1 + 32), "visibleTabCollectionViewType"));
  }
}

void __50__TabCollectionViewManager__openNewTabInteraction__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained dispatchNavigationIntent:v3];
}

void __51__TabCollectionViewManager__recentlyClosedTabsMenu__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 insertTabDocumentFromTabStateData:v7];
      id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v6, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(WeakRetained, "visibleTabCollectionViewType"));
    }
  }
}

void __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openTabFromNewTabButton];
}

void __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tabThumbnailCollectionView];
  [v1 dismissAnimated:1];
}

- (BOOL)hasTabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  id v4 = [WeakRetained effectiveTabBar];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_tabBar);
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (int64_t)visibleTabCollectionViewType
{
  id v3 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  uint64_t v4 = [v3 presentationState];

  if (v4) {
    return 2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

  return WeakRetained != 0;
}

- (id)tabCollectionViewForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = (TabOverview *)objc_loadWeakRetained((id *)&self->_tabBar);
LABEL_7:
    id v7 = WeakRetained;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_loadWeakRetained((id *)&self->_tabBarManager);
    id v7 = [v6 effectiveTabBar];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = self->_tabOverview;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)tabViewDefersActivation
{
  return [(TabOverview *)self->_tabOverview defersActivation];
}

- (void)setTabViewDefersActivation:(BOOL)a3
{
}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tabOverviewItem];
}

void __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 24);
    [v2 authenticateToUnlockPrivateBrowsing];

    id WeakRetained = v3;
  }
}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (void)_updateTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(TabCollectionViewManager *)self _canUpdateUnifiedBar])
    {
      [(TabCollectionViewManager *)self _updateUnifiedTabBarAnimated:v4 keepingTabVisibleForItem:v6];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [(TabCollectionViewManager *)self _canUpdateClassicBar])
      {
        [(TabCollectionViewManager *)self _updateClassicTabBarAnimated:v4 keepingTabVisibleForItem:v6];
      }
    }
  }
  else
  {
    [(TabCollectionViewManager *)self updateTabBarAnimated:v4 keepingTabVisible:0];
  }
}

- (BOOL)_shouldShowExplanationView
{
  if (!self->_privateBrowsingEnabled) {
    return 0;
  }
  id v3 = +[Application sharedApplication];
  char v4 = [v3 isPrivateBrowsingLocked];

  if (v4) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained currentTabs];
  if ((unint64_t)[v7 count] <= 1)
  {
    objc_super v8 = [v7 firstObject];
    int v9 = [WeakRetained hiddenTabForExplanationView];
    BOOL v5 = v8 == v9;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)updateExplanationViewVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  tabOverview = self->_tabOverview;
  BOOL v5 = [(TabCollectionViewManager *)self _shouldShowExplanationView];
  [(TabOverview *)tabOverview setShowsPrivateBrowsingExplanationView:v5 animated:v3];
}

- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  int v9 = [v8 activeNonLibraryTab];
  id v10 = [WeakRetained inlineTabBar];
  if (v10 == v21)
  {
    id v11 = [v9 unifiedTabBarItem];

    if (v11 == v6)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_browserController);
      [v13 unifiedTabBarActiveTabWasTapped];
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v12 = [v6 UUID];
  id v13 = [v8 tabWithUUID:v12];

  if (v13)
  {
    if (self->_privateBrowsingEnabled)
    {
      uint64_t v14 = [v8 hiddenTabForExplanationView];

      if (v13 == v14)
      {
        [v8 clearHiddenTabForExplanationView];
        [(TabCollectionViewManager *)self updateTabOverviewItems];
      }
    }
    [v8 setActiveTab:v13];
    id v15 = objc_loadWeakRetained((id *)&self->_tabBar);
    if (v15 == v21
      || ([WeakRetained effectiveTabBar],
          id v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v21))
    {
      +[Application postTestNotificationName:@"TabBarDidSwitchTabNotification" object:self];
    }
    else
    {
      id v17 = [v9 tabBarItem];
      [v15 scrollToItem:v17 animated:0];

      uint64_t v18 = [v9 unifiedTabBarItem];
      if ([WeakRetained displayMode] == 2)
      {
        uint64_t v19 = [v18 secondaryItem];

        uint64_t v18 = (void *)v19;
      }
      uint64_t v20 = [WeakRetained effectiveTabBar];
      [v20 scrollToItem:v18 animated:0];
    }
  }
LABEL_15:
}

- (void)tabCollectionView:(id)a3 closeItem:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v7 = [v6 UUID];

  id v8 = [WeakRetained tabWithUUID:v7];

  if (v8)
  {
    [WeakRetained closeTab:v8 animated:1];
  }
  else
  {
    [(TabCollectionViewManager *)self updateTabOverviewItems];
    [(TabCollectionViewManager *)self updateTabBarAnimated:1 keepingTabVisible:0];
  }
}

- (void)tabCollectionView:(id)a3 item:(id)a4 didProduceNavigationIntent:(id)a5
{
  id v11 = a5;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v9 = [v7 UUID];

  [WeakRetained insertTabWithUUIDForNavigation:v9];
  if (v11)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_browserController);
    [v10 dispatchNavigationIntent:v11];
  }
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  id v4 = a3;
  [(TabCollectionViewManager *)self updateExplanationViewVisibilityAnimated:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained tabCollectionViewWillPresent:v4];

  [(TabCollectionViewManager *)self updateSnapshotCacheAndSnapshotActiveTab];
  BOOL v5 = [WeakRetained rootViewController];
  id v6 = [v5 statusBarView];
  [v6 clearStatus];
}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained hiddenTabForExplanationView];
  if (v6)
  {
    BOOL privateBrowsingEnabled = self->_privateBrowsingEnabled;

    if (privateBrowsingEnabled)
    {
      [WeakRetained clearHiddenTabForExplanationView];
      [(TabCollectionViewManager *)self updateTabOverviewItems];
    }
  }
  id v8 = objc_loadWeakRetained((id *)&self->_browserController);
  [v8 tabCollectionViewWillDismiss:v5];
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained clearTabsClosedWhileTabViewPresentedCount];
  id v6 = [v5 searchController];
  [v6 setSearchTerm:&stru_1F3C268E8];

  [(TabCollectionViewManager *)self setShouldDeferSnapshotRequest:0];
  [(TabCollectionViewManager *)self updateSnapshotCacheState];
  id v7 = objc_loadWeakRetained((id *)&self->_browserController);
  [v7 tabCollectionViewDidDismiss:v5];
}

- (void)tabCollectionViewBeginIgnoringUserInteraction:(id)a3 reason:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained beginIgnoringUserInteraction:v5];
}

- (void)tabCollectionViewEndIgnoringUserInteraction:(id)a3 reason:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained endIgnoringUserInteraction:v5];
}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  [(TabCollectionViewManager *)self setShouldDeferSnapshotRequest:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained didCancelDismissingTabOverview];

  [(TabCollectionViewManager *)self updateExplanationViewVisibilityAnimated:1];
}

- (BOOL)tabCollectionViewCanDismiss:(id)a3
{
  BOOL v4 = [(TabCollectionViewManager *)self _isPrivateBrowsingAndLocked];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if ([WeakRetained activeWindowIsForeground] && !SBSGetScreenLockStatus()) {
      [WeakRetained authenticateToUnlockPrivateBrowsing];
    }
  }
  return !v4;
}

- (BOOL)tabCollectionView:(id)a3 validSnapshotExistsForItem:(id)a4
{
  snapshotCache = self->_snapshotCache;
  id v5 = objc_msgSend(a4, "UUID", a3);
  LOBYTE(snapshotCache) = [(TabSnapshotCache *)snapshotCache hasValidSnapshotWithIdentifier:v5];

  return (char)snapshotCache;
}

- (id)tabCollectionView:(id)a3 snapshotForItem:(id)a4
{
  snapshotCache = self->_snapshotCache;
  id v5 = objc_msgSend(a4, "UUID", a3);
  id v6 = [(TabSnapshotCache *)snapshotCache snapshotWithIdentifier:v5];

  return v6;
}

- (double)tabCollectionViewItemHeaderHeight:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [WeakRetained rootViewController];

  id v5 = [v4 view];
  [v4 navigationBarFrameInCoordinateSpace:v5];
  double MaxY = CGRectGetMaxY(v8);

  return MaxY;
}

- (UIEdgeInsets)effectiveSafeAreaInsetsForTabCollectionView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [WeakRetained rootViewController];
  id v5 = [v4 view];
  [v5 safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  double v7 = [v5 UUID];

  double v8 = [WeakRetained tabDocumentWithUUID:v7];
  char v9 = [v8 isShowingSystemStartPage] ^ 1;

  return v9;
}

- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6
{
  p_dataSource = &self->_dataSource;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  double v12 = [v10 UUID];

  double v13 = [WeakRetained tabDocumentWithUUID:v12];

  id v14 = objc_loadWeakRetained((id *)&self->_browserController);
  double v15 = [v14 borrowContentViewForTab:v13 withTopBackdropView:a5 ofHeight:a6];

  return v15;
}

- (void)tabCollectionView:(id)a3 relinquishBorrowedContentView:(id)a4 forItem:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  char v9 = [v7 UUID];

  id v11 = [WeakRetained tabDocumentWithUUID:v9];

  id v10 = objc_loadWeakRetained((id *)&self->_browserController);
  [v10 reinsertBorrowedContentViewForTab:v11];
}

- (id)tabCollectionView:(id)a3 borrowContentViewControllerForItem:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  double v8 = [WeakRetained activeTabDocument];

  char v9 = [v6 UUID];

  id v10 = [v8 uuid];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_browserController);
    double v13 = [v12 borrowContentViewControllerForTab:v8];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (void)tabCollectionView:(id)a3 relinquishBorrowedContentViewController:(id)a4 forItem:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  char v9 = [v7 UUID];

  id v11 = [WeakRetained tabDocumentWithUUID:v9];

  id v10 = objc_loadWeakRetained((id *)&self->_browserController);
  [v10 reinsertBorrowedContentViewForTab:v11];
}

- (void)tabCollectionView:(id)a3 closeCloudTab:(id)a4 onDevice:(id)a5
{
  p_browserController = &self->_browserController;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  char v9 = [WeakRetained browserWindowController];
  id v10 = [v9 cloudTabStore];
  [v10 closeTab:v8 onDevice:v7];
}

- (BOOL)tabCollectionView:(id)a3 item:(id)a4 matchesSearchText:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = [v8 UUID];

  id v11 = [WeakRetained tabWithUUID:v10];

  if (v11) {
    BOOL v12 = [(TabCollectionViewManager *)self tabItem:v11 matchesSearchText:v7];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)undoManagerForTabCollectionView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v4 = [WeakRetained undoManager];

  return v4;
}

- (id)currentItemForTabOverview:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v4 = [WeakRetained activeNonLibraryTab];
  id v5 = [v4 tabOverviewItem];

  return v5;
}

- (void)tabOverviewDidChangeAllowsInteractivePresentation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained updateTabViewPinchRecognizer];
}

- (void)tabOverviewWillUpdateInteractivePresentation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained dismissPageFormatMenu];
}

- (void)tabOverview:(id)a3 willInteractivelyCloseItem:(id)a4
{
  hiddenTabUUIDs = self->_hiddenTabUUIDs;
  id v6 = objc_msgSend(a4, "UUID", a3);
  [(NSMutableSet *)hiddenTabUUIDs addObject:v6];

  [(TabCollectionViewManager *)self updateTabOverviewItems];
}

- (void)tabOverview:(id)a3 closeItems:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        hiddenTabUUIDs = self->_hiddenTabUUIDs;
        id v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) UUID];
        [(NSMutableSet *)hiddenTabUUIDs removeObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke;
  v20[3] = &unk_1E6D7BB20;
  id v13 = WeakRetained;
  id v21 = v13;
  id v14 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v20);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke_2;
  v17[3] = &unk_1E6D77D90;
  id v18 = v13;
  id v19 = v14;
  id v15 = v14;
  id v16 = v13;
  [v16 registerUndoWithType:1 actions:v17];
}

id __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 UUID];
  BOOL v4 = [v2 tabWithUUID:v3];

  return v4;
}

uint64_t __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeTabs:*(void *)(a1 + 40) animated:1];
}

- (BOOL)tabBar:(id)a3 canMoveItem:(id)a4
{
  return 1;
}

- (void)tabBar:(id)a3 toggleMediaStateMutedForItem:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  uint64_t v7 = [v5 UUID];

  id v8 = [WeakRetained tabDocumentWithUUID:v7];

  [v8 toggleMediaStateMuted];
}

- (void)tabBarManager:(id)a3 didCreateTabBar:(id)a4
{
  id v5 = a4;
  [v5 setDelegate:self];
  id v6 = [v5 tabHoverPreviewController];

  [v6 setDelegate:self];
}

- (void)openNewTabForTabGroupSwitcher:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained openNewTabWithCompletionHandler:0];
}

- (void)presentTabGroupSheetForTabGroupSwitcher:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = (id)[WeakRetained showTabGroupPicker:0];
}

- (void)dismissTabGroupSwitcher:(id)a3
{
  id v3 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  [v3 dismissAnimated:1];
}

- (void)closeAllTabsForTabGroupSwitcher:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained closeAllTabs:0];
}

- (BOOL)tabGroupSwitcherCanShowProfileInToolbar:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained canShowProfileInTabOverviewToolbar];

  return v4;
}

- (id)_iconForTabWithUUID:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained tabController];
  uint64_t v7 = [v6 iconForTabUUID:v4];

  return v7;
}

- (id)_extensionIconForTabWithURL:(id)a3 UUID:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = [v7 UUIDString];

  id v11 = [WeakRetained tabGroupRelatedToTabWithUUID:v10];

  id v12 = objc_loadWeakRetained((id *)&self->_browserController);
  id v13 = [v12 tabGroupManager];
  id v14 = [v11 profileIdentifier];
  id v15 = [v13 profileWithIdentifier:v14];

  id v16 = +[Application sharedApplication];
  double v17 = [v15 identifierForExtensions];
  id v18 = [v16 webExtensionsControllerForProfileServerID:v17];

  id v19 = [v8 host];

  uint64_t v20 = [v18 webExtensionForBaseURIHost:v19];
  id v21 = [v20 icon];

  return v21;
}

- (id)_urlForTabWithUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained tabWithUUID:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 url];
  }
  else
  {
    uint64_t v9 = [v4 UUIDString];
    id v10 = [WeakRetained wbTabWithUUID:v9];
    id v8 = [v10 url];
  }
  return v8;
}

- (void)setShouldDeferSnapshotRequest:(BOOL)a3
{
  if (self->_shouldDeferSnapshotRequest != a3)
  {
    self->_shouldDeferSnapshotRequest = a3;
    if (!a3)
    {
      id v3 = +[TabSnapshotCache defaultSnapshotCache];
      [v3 requestNextSnapshotIfNecessary];
    }
  }
}

- (void)addSnapshotCacheObserver:(id)a3
{
}

- (void)removeSnapshotCacheObserver:(id)a3
{
}

- (void)requestSnapshotForTabDocument:(id)a3 completion:(id)a4
{
  id v30 = a3;
  id v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained rootViewController];
    id v10 = [v9 view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    id v15 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    double v17 = snapshotSizeForSuggestedSize(v15, v12, v14);
    double v18 = v16;
    if (v17 == 1.79769313e308 && v16 == 1.79769313e308)
    {
      v6[2](v6, 0);
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v20 scale];
      double v22 = 200.0 / v21;

      id v23 = objc_loadWeakRetained((id *)&self->_dataSource);
      long long v24 = [v23 activeNonLibraryTab];

      long long v25 = +[TabSnapshotCache defaultSnapshotCache];
      int v26 = [v30 uuid];
      uint64_t v27 = [v24 uuid];
      int v28 = [v25 isIdentifier:v26 memberOfSameGroupAsIdentifier:v27];

      if (v28)
      {
        id v29 = v24;

        id v30 = v29;
      }
      objc_msgSend(v8, "snapshotTabDocument:size:topBackdropHeight:options:completion:", v30, 2 * (objc_msgSend(v15, "snapshotBorderOptions") & 0xF), v6, v17, v18, v22);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (id)cachedContentImageForTabWithUUID:(id)a3 allowScaledImage:(BOOL)a4
{
  id v6 = [(TabSnapshotCache *)self->_snapshotCache snapshotWithIdentifier:a3];
  id v7 = (CGImage *)[v6 CGImage];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    uint64_t v9 = [WeakRetained rootViewController];
    id v10 = [v9 view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    id v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    double v17 = v16;

    if (a4 || (double)CGImageGetWidth(v7) / (v12 * v17) >= 0.5 && (double)CGImageGetHeight(v7) / (v14 * v17) >= 0.5)
    {
      CGFloat Width = (double)CGImageGetWidth(v7);
      v22.size.height = (double)CGImageGetHeight(v7);
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = Width;
      CGRect v23 = CGRectInset(v22, 1.0, 1.0);
      v23.origin.y = v23.origin.y + 200.0;
      v23.size.height = v23.size.height + -200.0;
      id v19 = CGImageCreateWithImageInRect(v7, v23);
      id v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v19];
      CGImageRelease(v19);
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

void __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) tabWithUUID:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)updateSnapshotCacheAndSnapshotActiveTab
{
  snapshotCache = self->_snapshotCache;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__TabCollectionViewManager_updateSnapshotCacheAndSnapshotActiveTab__block_invoke;
  v3[3] = &unk_1E6D77E20;
  v3[4] = self;
  [(TabSnapshotCache *)snapshotCache performBatchUpdatesWithBlock:v3];
}

void __67__TabCollectionViewManager_updateSnapshotCacheAndSnapshotActiveTab__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSnapshotCacheState];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  if (![WeakRetained avoidSnapshotOfActiveTabIfPossible]
    || [WeakRetained shouldSnapshotActiveTab])
  {
    [WeakRetained setNeedsSnapshotUpdateForActiveTab];
  }
}

- (void)updateStartPageSnapshotIfNeededForTabDocument:(id)a3 currentSnapshotSize:(CGSize)a4
{
  id v5 = a3;
  if ([v5 isShowingSystemStartPage])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained windowSize];
    double v8 = v7;
    double v10 = v9;

    double v11 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
    snapshotSizeForSuggestedSize(v11, v8, v10);
    _SFScreenScale();
    if ((_SFEqualWithEpsilon() & 1) == 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke;
      v12[3] = &unk_1E6D77D90;
      v12[4] = self;
      id v13 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
}

void __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 88);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke_2;
  v3[3] = &unk_1E6D77D90;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performBatchUpdatesWithBlock:v3];
}

uint64_t __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateSnapshotForTab:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 flushPendingSnapshotsWithCompletion:0];
}

- (void)_temporarilyUpdateSnapshotsForTabDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(TabCollectionViewManager *)self tabThumbnailCollectionView];
  if ([v5 presentationState])
  {
  }
  else
  {
    char v6 = [v4 contentIsReadyForSnapshot];

    if (v6)
    {
      self->_shouldUpdateSnapshotsTemporarily = 1;
      snapshotCache = self->_snapshotCache;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __70__TabCollectionViewManager__temporarilyUpdateSnapshotsForTabDocument___block_invoke;
      v8[3] = &unk_1E6D77D90;
      v8[4] = self;
      id v9 = v4;
      [(TabSnapshotCache *)snapshotCache performBatchUpdatesWithBlock:v8];
    }
  }
}

uint64_t __70__TabCollectionViewManager__temporarilyUpdateSnapshotsForTabDocument___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSnapshotCacheState];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setNeedsNewTabSnapshot];
}

- (void)clearSnapshotCache
{
  snapshotCache = self->_snapshotCache;
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
  [(TabSnapshotCache *)snapshotCache setIdentifiersToCache:v4 forDelegate:self];

  id v5 = self->_snapshotCache;
  self->_snapshotCache = 0;
}

- (void)invalidateSnapshotForTab:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_snapshotsEnabled
    && self->_postponedSnapshotInvalidationCondition
    && self->_snapshotInvalidationIsPostponed)
  {
    double v10 = (void *)MEMORY[0x1E4E42950](self->_postponedSnapshotInvalidationBlock);
    double v11 = (void *)MEMORY[0x1E4E42950](self->_postponedSnapshotInvalidationCondition);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke;
    v19[3] = &unk_1E6D7BBE8;
    id v21 = v10;
    id v12 = v10;
    objc_copyWeak(&v23, &location);
    id v22 = v11;
    id v20 = v5;
    id v13 = v11;
    double v14 = (void *)MEMORY[0x1E4E42950](v19);
    id postponedSnapshotInvalidationBlock = self->_postponedSnapshotInvalidationBlock;
    self->_id postponedSnapshotInvalidationBlock = v14;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    snapshotCache = self->_snapshotCache;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke_2;
    v16[3] = &unk_1E6D77D90;
    id v7 = v4;
    id v17 = v7;
    double v18 = self;
    [(TabSnapshotCache *)snapshotCache performBatchUpdatesWithBlock:v16];
    snapshotPool = self->_snapshotPool;
    id v9 = [v7 uuid];
    [(SFTabSnapshotPool *)snapshotPool contentDidChangeForSnapshotsWithIdentifier:v9];
  }
}

void __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v5;
    if (v4)
    {
      [v5 invalidateSnapshotForTab:*(void *)(a1 + 32)];
      id WeakRetained = v5;
    }
  }
}

void __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isBlank] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 192));
    id v3 = [WeakRetained tabGroupManager];
    int v4 = [*(id *)(a1 + 32) wbTab];
    id v5 = [v4 tabGroupUUID];
    char v6 = [v3 tabGroupWithUUID:v5];

    id v7 = *(void **)(*(void *)(a1 + 40) + 88);
    double v8 = [*(id *)(a1 + 32) uuid];
    id v9 = [*(id *)(a1 + 40) _blankSnapshotGroupIdentifierForTabGroup:v6];
    [v7 removeIdentifier:v8 fromGroupWithIdentifier:v9];
  }
  double v10 = *(void **)(a1 + 32);
  double v11 = *(void **)(*(void *)(a1 + 40) + 88);
  id v12 = [v10 uuid];
  [v11 invalidateSnapshotWithIdentifier:v12];
}

- (void)removeSnapshotForTabWithUUID:(id)a3
{
  [(TabSnapshotCache *)self->_snapshotCache removeSnapshotWithIdentifier:a3];
  [(TabCollectionViewManager *)self _updateTabSnapshotsAnimated:1];
}

- (void)_updateTabSnapshotsAnimated:(BOOL)a3
{
}

- (void)_updateTabSnapshotsWithIdentifier:(id)a3 animated:(BOOL)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained normalAndPrivateTabs];
  double v8 = v7;
  int v26 = WeakRetained;
  uint64_t v27 = v5;
  long long v25 = v7;
  if (v5)
  {
    id v9 = [WeakRetained tabWithUUID:v5];
    if (v9 && [v8 containsObject:v9])
    {
      v33[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = v7;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        tabOverview = self->_tabOverview;
        double v18 = [v16 tabOverviewItem];
        [(TabOverview *)tabOverview updateSnapshotForItem:v18];

        id v19 = [v16 uuid];
        id v20 = [(TabCollectionViewManager *)self cachedContentImageForTabWithUUID:v19 allowScaledImage:1];

        if (v20)
        {
          id v21 = [v16 uuid];
          id v22 = [(CollectionViewTab *)self->_tabShowingPreview uuid];
          if ([v21 isEqual:v22])
          {
            char v23 = [v16 isActive];

            if (v23) {
              goto LABEL_19;
            }
            id v24 = objc_loadWeakRetained((id *)&self->_browserController);
            id v21 = [v24 tabHoverPreview];

            [v21 setSnapshotImage:v20];
          }
          else
          {
          }
        }
LABEL_19:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  if (v27) {
    [(SFTabSnapshotPool *)self->_snapshotPool contentDidChangeForSnapshotsWithIdentifier:v27];
  }
}

- (void)flushPendingSnapshotsWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t))a3;
  if (!self->_flushPendingSnapshots)
  {
    self->_flushPendingSnapshots = 1;
    [(TabCollectionViewManager *)self updateSnapshotCacheState];
  }
  if (v4)
  {
    snapshotCache = self->_snapshotCache;
    if (snapshotCache && ![(TabSnapshotCache *)snapshotCache isFinishedUpdating])
    {
      flushPendingSnapshotsCompletions = self->_flushPendingSnapshotsCompletions;
      p_flushPendingSnapshotsCompletions = &self->_flushPendingSnapshotsCompletions;
      double v8 = (void *)MEMORY[0x1E4E42950](v4);
      id v9 = [(NSArray *)flushPendingSnapshotsCompletions arrayByAddingObject:v8];
      if (v9)
      {
        objc_storeStrong((id *)p_flushPendingSnapshotsCompletions, v9);
      }
      else
      {
        id v10 = (void *)MEMORY[0x1E4E42950](v4);
        v13[0] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        uint64_t v12 = *p_flushPendingSnapshotsCompletions;
        *p_flushPendingSnapshotsCompletions = (NSArray *)v11;
      }
    }
    else
    {
      v4[2](v4, 1);
    }
  }
}

- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5
{
  id v22 = a4;
  id v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = [WeakRetained tabDocumentWithUUID:v22];
  if ([v9 inElementFullscreen])
  {
    v7[2](v7, 0);
LABEL_3:
    id v10 = v9;
    goto LABEL_14;
  }
  if (v9)
  {
    uint64_t v11 = [WeakRetained currentTabs];
    if ([v11 containsObject:v9])
    {
      char v12 = [v9 isClosed];

      if ((v12 & 1) == 0)
      {
        [(TabCollectionViewManager *)self requestSnapshotForTabDocument:v9 completion:v7];
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  uint64_t v13 = +[WBReusableTabManager sharedManager];
  id v10 = [v13 reusableTabDocumentWithUUID:v22];

  if (v10)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_browserController);
    id v15 = [v14 tabGroupManager];
    double v16 = [v10 tabGroupTab];
    id v17 = [v16 tabGroupUUID];
    double v18 = [v15 tabGroupWithUUID:v17];

    id v19 = [v10 uuid];
    id v20 = [v19 UUIDString];
    id v21 = [v18 tabWithUUID:v20];

    if (v21)
    {
      [(TabCollectionViewManager *)self requestSnapshotForTabDocument:v10 completion:v7];

      goto LABEL_14;
    }
  }
  v7[2](v7, 0);
LABEL_14:
}

- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4
{
}

- (void)tabSnapshotCache:(id)a3 didEvictSnapshotWithIdentifier:(id)a4
{
}

- (void)dismissTabHoverPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  int v4 = [WeakRetained tabHoverPreviewController];
  [v4 dismiss];

  id v7 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  id v5 = [v7 effectiveTabBar];
  char v6 = [v5 tabHoverPreviewController];
  [v6 dismiss];
}

- (void)tabHoverPreviewController:(id)a3 showPreviewForItem:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  id v8 = [WeakRetained tabHoverPreviewController];
  if (v8 == v26)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [WeakRetained viewForItem:v6];
      if (!v10) {
        goto LABEL_21;
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v11 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  char v12 = [v11 effectiveTabBar];

  id v13 = [v12 tabHoverPreviewController];

  if (v13 == v26)
  {
    id v10 = [v12 viewForBarItem:v6];
  }
  else
  {
    id v10 = 0;
  }

  if (!v10) {
    goto LABEL_21;
  }
LABEL_10:
  id v14 = objc_loadWeakRetained((id *)&self->_browserController);
  id v15 = [v14 tabHoverPreview];

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v17 = [v6 UUID];
    double v18 = [v16 tabWithUUID:v17];

    objc_storeStrong((id *)&self->_tabShowingPreview, v18);
    if ([v18 isActive])
    {
      id v19 = 0;
    }
    else
    {
      id v20 = [v6 UUID];
      id v19 = [(TabCollectionViewManager *)self cachedContentImageForTabWithUUID:v20 allowScaledImage:1];
    }
    [v15 setSnapshotImage:v19];
    id v21 = [v6 title];
    [v15 setTitleText:v21];

    id v22 = [v18 url];
    if (objc_msgSend(v22, "safari_isSafariWebExtensionURL"))
    {
      objc_msgSend(v22, "safari_userVisibleHostOrExtensionDisplayName");
      char v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v24 = [v15 titleText];
      if ([v24 isEqualToString:v23]) {
        long long v25 = &stru_1F3C268E8;
      }
      else {
        long long v25 = v23;
      }
    }
    else
    {
      char v23 = [v22 host];
      long long v25 = [(__CFString *)v23 safari_stringByRemovingWwwDotPrefix];
      id v24 = v25;
    }
    [v15 setSecondaryTitleText:v25];

    [v15 showPreviewForItemView:v10];
  }

LABEL_21:
}

- (void)tabHoverPreviewControllerDismissPreview:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v6 = [WeakRetained tabHoverPreview];

  [v6 dismissPreview];
  tabShowingPreview = self->_tabShowingPreview;
  self->_tabShowingPreview = 0;
}

- (id)tabWithUUID:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained tabWithUUID:v4];

  return v6;
}

- (unint64_t)_indexToInsertPlaceholderAtTabItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v7 = [WeakRetained currentTabs];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__TabCollectionViewManager__indexToInsertPlaceholderAtTabItem___block_invoke;
    v14[3] = &unk_1E6D7BC30;
    id v15 = v4;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v14];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v7 objectAtIndexedSubscript:v9];
        id v11 = [WeakRetained hiddenTabForExplanationView];
        BOOL v12 = v10 == v11;

        if (v12) {
          unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v5 = v9;
        }
      }
      else
      {
        unint64_t v5 = v9;
      }
    }
  }
  return v5;
}

uint64_t __63__TabCollectionViewManager__indexToInsertPlaceholderAtTabItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)insertPlaceholderAfterTabItem:(id)a3
{
  self->_placeholderItemIsPrivate = self->_privateBrowsingEnabled;
  id v4 = a3;
  unint64_t v5 = [(TabCollectionViewManager *)self _indexToInsertPlaceholderAtTabItem:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }
  self->_unint64_t placeholderItemIndex = v6;
  id v7 = [(id)objc_opt_class() placeholderItem];
  placeholderItem = self->_placeholderItem;
  self->_placeholderItem = v7;

  uint64_t v9 = [v4 isPinned];
  [(TabCollectionItem *)self->_placeholderItem setPinned:v9];
  [(TabCollectionViewManager *)self updateTabOverviewItems];
  [(TabCollectionViewManager *)self updateTabBarAnimated:1 keepingTabVisible:0];
  id v10 = self->_placeholderItem;
  return v10;
}

- (BOOL)isPlaceholderItemValid:(id)a3
{
  return self->_placeholderItem == a3 && self->_privateBrowsingEnabled == self->_placeholderItemIsPrivate;
}

- (void)movePlaceholderToEndOfPinnedTabs:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v5 = [WeakRetained currentTabs];

  uint64_t v6 = [v5 indexOfObjectPassingTest:&__block_literal_global_76_0];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = [v5 count];
  }
  [(TabCollectionViewManager *)self _movePlaceholder:v7 toIndex:v6];
}

uint64_t __61__TabCollectionViewManager_movePlaceholderToEndOfPinnedTabs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (void)movePlaceholder:(id)a3 overTabItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (([v6 isPlaceholder] & 1) == 0)
  {
    unint64_t v7 = [(TabCollectionViewManager *)self _indexToInsertPlaceholderAtTabItem:v6];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v9 = [WeakRetained currentTabs];
      uint64_t v10 = [v9 count];
    }
    else if (v7 < self->_placeholderItemIndex)
    {
      uint64_t v10 = v7;
    }
    else
    {
      uint64_t v10 = v7 + 1;
    }
    [(TabCollectionViewManager *)self _movePlaceholder:v11 toIndex:v10];
  }
}

- (void)_movePlaceholder:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  if (-[TabCollectionViewManager isPlaceholderItemValid:](self, "isPlaceholderItemValid:"))
  {
    self->_unint64_t placeholderItemIndex = a4;
    [(TabCollectionViewManager *)self updateTabOverviewItems];
    [(TabCollectionViewManager *)self _updateTabBarAnimated:1 keepingTabVisibleForItem:v6];
  }
}

- (void)removePlaceholderItem:(id)a3
{
  unint64_t v5 = (TabCollectionItem *)a3;
  BOOL v4 = [(TabCollectionViewManager *)self isPlaceholderItemValid:v5];
  if (self->_placeholderItem != v5)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  self->_placeholderItem = 0;

  if (v4)
  {
LABEL_3:
    [(TabCollectionViewManager *)self updateTabOverviewItems];
    [(TabCollectionViewManager *)self _updateTabBarAnimated:1 keepingTabVisibleForItem:0];
  }
LABEL_4:
}

- (id)replacePlaceholderItem:(id)a3 withTabsForDropSession:(id)a4 dragItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v12 = [WeakRetained currentTabs];
  unint64_t v13 = [v12 count];

  if ([(TabCollectionViewManager *)self isPlaceholderItemValid:v8]
    && (unint64_t placeholderItemIndex = self->_placeholderItemIndex, placeholderItemIndex <= v13))
  {
    id v16 = objc_msgSend(WeakRetained, "dropTabsAtIndex:pinned:dropSession:dragItems:", placeholderItemIndex, -[TabCollectionItem isPinned](self->_placeholderItem, "isPinned"), v9, v10);
    [(TabCollectionViewManager *)self removePlaceholderItem:v8];
  }
  else
  {
    id v15 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[TabCollectionViewManager replacePlaceholderItem:withTabsForDropSession:dragItems:]((uint64_t)self, v13, v15);
    }
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)dragItemForTab:(id)a3 tabItem:(id)a4
{
  unint64_t v5 = (void *)MEMORY[0x1E4FB1710];
  p_browserController = &self->_browserController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  id v10 = objc_msgSend(v5, "safari_itemWithTab:tabItem:browserController:", v8, v7, WeakRetained);

  return v10;
}

- (void)hideTabsForDragItems:(id)a3
{
}

- (void)unhideTabsForDragItems:(id)a3
{
}

- (void)_setTabsForDragItems:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend(v12, "safari_localBrowserController");
        id v14 = [v6 objectForKey:v13];
        id v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [MEMORY[0x1E4F1CAD0] set];
        }
        id v17 = v16;

        double v18 = objc_msgSend(v12, "safari_localWBTab");

        if (v18)
        {
          id v19 = objc_msgSend(v12, "safari_localWBTab");
          uint64_t v20 = [v17 setByAddingObject:v19];

          id v17 = (void *)v20;
        }
        [v6 setObject:v17 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }
  id v32 = v7;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = [v6 keyEnumerator];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        uint64_t v27 = [v6 objectForKey:v26];
        long long v28 = objc_msgSend(v27, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_81);

        long long v29 = [v26 tabController];
        long long v30 = -[TabController tabCollectionViewManager]((uint64_t)v29);

        long long v31 = (void *)v30[9];
        if (v4) {
          [v31 unionSet:v28];
        }
        else {
          [v31 minusSet:v28];
        }
        [v30 updateTabOverviewItems];
        [v30 updateTabBarAnimated:1 keepingTabVisible:0];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }
}

id __56__TabCollectionViewManager__setTabsForDragItems_hidden___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 uuid];

  id v6 = (void *)[v4 initWithUUIDString:v5];
  return v6;
}

- (void)willBeginDragSession:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained tabDocumentWillBeginDragSession:v4];
}

- (void)willEndDragSession:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained tabDocumentWillEndDragSession:v4];
}

- (void)didBeginTrackingSession:(id)a3
{
  id v4 = a3;
  [(TabCollectionViewManager *)self dismissTabHoverPreview];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained beginTrackingDropSessionForTabBarVisibility:v4];
}

- (void)didEndTrackingSession:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained endTrackingDropSessionForTabBarVisibility:v4];
}

- (TabMenuProviderDataSource)tabMenuProviderDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v3 = [WeakRetained tabMenuProviderDataSource];

  return (TabMenuProviderDataSource *)v3;
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained performBatchUpdatesWithBlock:v4];
}

- (TabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (TabBar *)WeakRetained;
}

- (TabBarManager)tabBarManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  return (TabBarManager *)WeakRetained;
}

- (int64_t)tabThumbnailCollectionViewStyle
{
  return self->_tabThumbnailCollectionViewStyle;
}

- (BOOL)snapshotInvalidationIsPostponed
{
  return self->_snapshotInvalidationIsPostponed;
}

- (void)setSnapshotInvalidationIsPostponed:(BOOL)a3
{
  self->_snapshotInvalidationIsPostponed = a3;
}

- (BOOL)areSnapshotsEnabled
{
  return self->_snapshotsEnabled;
}

- (id)postponedSnapshotInvalidationCondition
{
  return self->_postponedSnapshotInvalidationCondition;
}

- (TabCollectionViewManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (TabCollectionViewManagerDataSource *)WeakRetained;
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (BOOL)privateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (BOOL)suppressTabBarAnimation
{
  return self->_suppressTabBarAnimation;
}

- (void)setSuppressTabBarAnimation:(BOOL)a3
{
  self->_suppressTabBarAnimation = a3;
}

- (BOOL)isTabOverviewVisible
{
  return self->_tabOverviewVisible;
}

- (void)setTabOverviewVisible:(BOOL)a3
{
  self->_tabOverviewVisible = a3;
}

- (BOOL)isTabThumbnailViewVisible
{
  return self->_tabThumbnailViewVisible;
}

- (void)setTabThumbnailViewVisible:(BOOL)a3
{
  self->_tabThumbnailViewVisible = a3;
}

- (TabSnapshotCache)snapshotCache
{
  return self->_snapshotCache;
}

- (BOOL)shouldDeferSnapshotRequest
{
  return self->_shouldDeferSnapshotRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotPool, 0);
  objc_storeStrong((id *)&self->_iconPool, 0);
  objc_storeStrong((id *)&self->_tabSwitcherViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_postponedSnapshotInvalidationCondition, 0);
  objc_storeStrong((id *)&self->_tabOverview, 0);
  objc_destroyWeak((id *)&self->_tabBarManager);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_tabShowingPreview, 0);
  objc_storeStrong(&self->_postponedSnapshotInvalidationBlock, 0);
  objc_storeStrong((id *)&self->_flushPendingSnapshotsCompletions, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_tabDragDropController, 0);
  objc_storeStrong((id *)&self->_hiddenTabUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderItem, 0);
  objc_storeStrong((id *)&self->_tabGroupSwitcherViewController, 0);
  objc_storeStrong((id *)&self->_searchTermWords, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
}

- (void)webViewDidFirstMeaningfulPaintForTabDocument:(id)a3
{
  id v4 = a3;
  if (([v4 isActive] & 1) == 0) {
    [(TabCollectionViewManager *)self _temporarilyUpdateSnapshotsForTabDocument:v4];
  }
}

- (void)replacePlaceholderItem:(uint64_t)a1 withTabsForDropSession:(uint64_t)a2 dragItems:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1E102C000, log, OS_LOG_TYPE_FAULT, "Failed to drop at index %lu of %lu tabs", (uint8_t *)&v4, 0x16u);
}

@end