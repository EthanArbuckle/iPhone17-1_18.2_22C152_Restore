@interface HomeOutlineRootController
- (BOOL)_isLoading;
- (BOOL)_needsSnapshotUpdate;
- (BOOL)active;
- (BOOL)applySnapshotIfNeededWithSectionController:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasCollectionViewDropSessionWithSectionController:(id)a3;
- (BOOL)isCollectionViewFocusedWithSectionController:(id)a3;
- (BOOL)isCollectionViewProxyFocusedWithSectionController:(id)a3;
- (GEOObserverHashTable)hoverChangeObservers;
- (HomeOutlineRootController)initWithConfiguration:(id)a3;
- (HomeOutlineRootControllerConfiguration)configuration;
- (KeyboardProxyingView)keyboardProxy;
- (SuggestionsItemSource)suggestionsItemSource;
- (UICollectionViewDataSource)dataSource;
- (UICollectionViewLayout)collectionViewLayout;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UIScrollView)hoverScrollView;
- (id)_focusedIdentifierPath;
- (id)_identifierPathForIndexPath:(id)a3;
- (id)_indexPathForIdentifierPath:(id)a3;
- (id)_loadingDataProviders;
- (id)_nodeSnapshotAtIdentifierPath:(id)a3;
- (id)_nodeSnapshotAtIndexPath:(id)a3;
- (id)_sectionControllerForIdentifierPath:(id)a3;
- (id)_sectionControllerForIndexPath:(id)a3;
- (id)_selectedIdentifierPaths;
- (id)_storage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)sectionController:(id)a3 indexPathForIdentifierPath:(id)a4;
- (id)sectionController:(id)a3 nodeSnapshotAtIndexPath:(id)a4;
- (id)viewForProfileToolTipPopoverWithType:(int64_t)a3;
- (void)_applySnapshotUpdatesInSectionControllers:(id)a3 animateCells:(BOOL)a4 animateCollectionView:(BOOL)a5 completion:(id)a6;
- (void)_collapseItem:(id)a3;
- (void)_completeFocusAfterScrollingWithSuccess:(BOOL)a3;
- (void)_deselectItemAtIndexPath:(id)a3;
- (void)_didCompleteInitialUpdate;
- (void)_expandItem:(id)a3;
- (void)_focusAfterScrollingAnimationDidEnd;
- (void)_focusAfterScrollingCellWillDisplay;
- (void)_focusCellAtVisibleSelectedIdentifierPath:(id)a3 completion:(id)a4;
- (void)_loadingTimerDidFire;
- (void)_notifyCellHoverObservers;
- (void)_resetSnapshotUpdateState;
- (void)_selectItemAtIdentifierPath:(id)a3 notifyDelegate:(BOOL)a4 completion:(id)a5;
- (void)_setFocusAfterScrollingIdentifierPath:(id)a3 completion:(id)a4;
- (void)_setNeedsSnapshotUpdatesForSectionControllers:(id)a3 animated:(BOOL)a4;
- (void)_setupSectionControllers;
- (void)_updateContentInjectionWithSelectedIndexPath:(id)a3;
- (void)_updateFocusAfterScrolling;
- (void)_updateLoadingTimer;
- (void)clearSelectionWithReason:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)downArrowPressed:(id)a3;
- (void)editCollection:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)keyboardProxyingView:(id)a3 didUpdateFocusState:(BOOL)a4;
- (void)keyboardProxyingView:(id)a3 pressesBegan:(id)a4 withEvent:(id)a5;
- (void)presentVenueWithVenueCardItem:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)sectionController:(id)a3 deselectItemAtIdentifierPath:(id)a4;
- (void)sectionController:(id)a3 selectItemAtIdentifierPath:(id)a4 completion:(id)a5;
- (void)sectionController:(id)a3 setNeedsApplySnapshotAnimated:(BOOL)a4;
- (void)setActive:(BOOL)a3;
- (void)setKeyboardProxy:(id)a3;
- (void)showCollection:(id)a3;
- (void)upArrowPressed:(id)a3;
- (void)updateIfNeeded;
- (void)venueDidReceiveEVChargersUpdate:(id)a3;
@end

@implementation HomeOutlineRootController

- (HomeOutlineRootController)initWithConfiguration:(id)a3
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HomeOutlineRootController;
  v7 = [(HomeOutlineRootController *)&v30 init];
  if (v7)
  {
    v8 = sub_1000AA148();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v32 = v10;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
    }
    v12 = sub_1000AA148();
    v7->_signpostID = os_signpost_id_make_with_pointer(v12, v7);

    objc_storeStrong((id *)&v7->_configuration, a3);
    v13 = [SuggestionsDataProvider alloc];
    id v14 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_1012F7F08];
    v15 = [(SuggestionsDataProvider *)v13 initWithViewMode:0 filter:v14 includePlaceholderShortcuts:1];
    suggestionsDataProvider = v7->_suggestionsDataProvider;
    v7->_suggestionsDataProvider = v15;

    uint64_t v17 = +[MapsFavoritesManager sharedManager];
    favoritesDataProvider = v7->_favoritesDataProvider;
    v7->_favoritesDataProvider = (_TtC4Maps20MapsFavoritesManager *)v17;

    v19 = [_TtC4Maps33HomeListLibraryCountsDataProvider alloc];
    v20 = +[LibraryItemsCountManager sharedManager];
    v21 = [(HomeListLibraryCountsDataProvider *)v19 initWithCountsManager:v20];
    libraryCountsDataProvider = v7->_libraryCountsDataProvider;
    v7->_libraryCountsDataProvider = v21;

    [(HomeOutlineRootController *)v7 _setupSectionControllers];
    v23 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v7 action:"_hoverGestureRecognizerDidChange:"];
    hoverGestureRecognizer = v7->_hoverGestureRecognizer;
    v7->_hoverGestureRecognizer = v23;

    v25 = [(HomeOutlineRootController *)v7 configuration];
    v26 = [v25 collectionView];
    [v26 addGestureRecognizer:v7->_hoverGestureRecognizer];

    v27 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___SidebarOutlineCellHoverObserver queue:0];
    hoverChangeObservers = v7->_hoverChangeObservers;
    v7->_hoverChangeObservers = v27;

    v7->_loadingState = 0;
  }

  return v7;
}

- (void)_setupSectionControllers
{
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100773F70;
  v53[3] = &unk_1012F7F30;
  v53[4] = self;
  v3 = objc_retainBlock(v53);
  v4 = [HomeOutlineSearchResultsSectionController alloc];
  v5 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Search Results");
  id v6 = [(HomeOutlineSearchResultsSectionController *)v4 initWithConfiguration:v5];
  searchResultsSectionController = self->_searchResultsSectionController;
  self->_searchResultsSectionController = v6;

  v8 = [HomeOutlineFeatureDiscoverySectionController alloc];
  v9 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Feature Discovery");
  v10 = [(HomeOutlineFeatureDiscoverySectionController *)v8 initWithConfiguration:v9 suggestionsDataProvider:self->_suggestionsDataProvider];
  featureDiscoverySectionController = self->_featureDiscoverySectionController;
  self->_featureDiscoverySectionController = v10;

  v12 = [HomeOutlineSuggestionsSectionController alloc];
  v13 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Suggestions");
  id v14 = [(HomeOutlineSuggestionsSectionController *)v12 initWithConfiguration:v13 suggestionsDataProvider:self->_suggestionsDataProvider];
  suggestionsSectionController = self->_suggestionsSectionController;
  self->_suggestionsSectionController = v14;

  unsigned int v16 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v17 = [HomeOutlineFavoritesSectionController alloc];
  v18 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Favorites");
  if (v16)
  {
    v19 = [(HomeOutlineFavoritesSectionController *)v17 initWithConfiguration:v18 favoritesDataProvider:self->_favoritesDataProvider libraryCountsDataProvider:self->_libraryCountsDataProvider];
    favoritesSectionController = self->_favoritesSectionController;
    self->_favoritesSectionController = v19;
  }
  else
  {
    v21 = [(HomeOutlineFavoritesSectionController *)v17 initWithConfiguration:v18 suggestionsDataProvider:self->_suggestionsDataProvider];
    v22 = self->_favoritesSectionController;
    self->_favoritesSectionController = v21;

    v23 = [HomeOutlineCollectionsSectionController alloc];
    v18 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Collections");
    v24 = [(HomeOutlineCollectionsSectionController *)v23 initWithConfiguration:v18];
    favoritesSectionController = self->_collectionsSectionController;
    self->_collectionsSectionController = v24;
  }

  v25 = [HomeOutlineRecentsSectionController alloc];
  v26 = ((void (*)(void *, const __CFString *))v3[2])(v3, @"Recents");
  v27 = [(HomeOutlineRecentsSectionController *)v25 initWithConfiguration:v26];
  recentsSectionController = self->_recentsSectionController;
  self->_recentsSectionController = v27;

  collectionsSectionController = self->_collectionsSectionController;
  if (collectionsSectionController)
  {
    objc_super v30 = self->_featureDiscoverySectionController;
    v58[0] = self->_searchResultsSectionController;
    v58[1] = v30;
    v31 = self->_favoritesSectionController;
    v58[2] = self->_suggestionsSectionController;
    v58[3] = v31;
    v32 = self->_recentsSectionController;
    v58[4] = collectionsSectionController;
    v58[5] = v32;
    __int16 v33 = v58;
    uint64_t v34 = 6;
  }
  else
  {
    v35 = self->_featureDiscoverySectionController;
    v55[0] = self->_searchResultsSectionController;
    v55[1] = v35;
    long long v56 = *(_OWORD *)&self->_suggestionsSectionController;
    v57 = self->_recentsSectionController;
    __int16 v33 = v55;
    uint64_t v34 = 5;
  }
  v36 = +[NSArray arrayWithObjects:v33 count:v34];
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v36;

  v38 = +[NSMutableDictionary dictionary];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v39 = self->_sectionControllers;
  id v40 = [(NSArray *)v39 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v50;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v50 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v45 = [v44 configuration:v49];
        v46 = [v45 sectionIdentifier];
        [v38 setObject:v44 forKeyedSubscript:v46];
      }
      id v41 = [(NSArray *)v39 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v41);
  }

  v47 = (NSDictionary *)[v38 copy];
  sectionControllersByIdentifier = self->_sectionControllersByIdentifier;
  self->_sectionControllersByIdentifier = v47;
}

- (UICollectionViewLayout)collectionViewLayout
{
  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    id v4 = [objc_alloc((Class)UICollectionLayoutListConfiguration) initWithAppearance:3];
    v5 = +[UICollectionViewCompositionalLayout layoutWithListConfiguration:v4];
    id v6 = self->_collectionViewLayout;
    self->_collectionViewLayout = v5;

    collectionViewLayout = self->_collectionViewLayout;
  }

  return collectionViewLayout;
}

- (UICollectionViewDataSource)dataSource
{
  diffableDataSource = self->_diffableDataSource;
  if (!diffableDataSource)
  {
    id v4 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v5 = [(HomeOutlineRootController *)self configuration];
    id v6 = [v5 collectionView];
    v7 = sub_10001CBB8(self);
    v8 = (UICollectionViewDiffableDataSource *)[v4 initWithCollectionView:v6 cellProvider:v7];
    v9 = self->_diffableDataSource;
    self->_diffableDataSource = v8;

    objc_initWeak(&location, self);
    id v10 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1007742F0;
    v14[3] = &unk_1012F7F58;
    objc_copyWeak(&v15, &location);
    [v10 setShouldExpandItemHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100774338;
    v12[3] = &unk_1012F7F58;
    objc_copyWeak(&v13, &location);
    [v10 setShouldCollapseItemHandler:v12];
    [(UICollectionViewDiffableDataSource *)self->_diffableDataSource setSectionSnapshotHandlers:v10];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    diffableDataSource = self->_diffableDataSource;
  }

  return (UICollectionViewDataSource *)diffableDataSource;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_loadingState)
  {
    self->_loadingState = 1;
    id v6 = sub_1000AA148();
    v7 = v6;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "HomeListSectionLoading", "", buf, 2u);
    }
  }
  if (self->_active != v3)
  {
    self->_active = v3;
    v9 = sub_1000AA148();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      id v13 = sub_100097E28(v3);
      *(_DWORD *)buf = 138412802;
      v25 = v11;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2112;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = self->_sectionControllers;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) setActive:self->_active v19];
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }

    if (v3)
    {
      [(HomeOutlineRootController *)self _resetSnapshotUpdateState];
      [(HomeOutlineRootController *)self _setNeedsSnapshotUpdatesForSectionControllers:self->_sectionControllers animated:0];
    }
    -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", 0, (void)v19);
  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestionsItemSource];
}

- (void)_expandItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v4];
  [v5 expandElementAtIdentifierPath:v4];
}

- (void)_collapseItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v4];
  [v5 collapseElementAtIdentifierPath:v4];
}

- (id)_sectionControllerForIdentifierPath:(id)a3
{
  if (a3)
  {
    sectionControllersByIdentifier = self->_sectionControllersByIdentifier;
    id v4 = [a3 firstIdentifier];
    id v5 = [(NSDictionary *)sectionControllersByIdentifier objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_sectionControllerForIndexPath:(id)a3
{
  id v4 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:a3];
  id v5 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v4];

  return v5;
}

- (id)_identifierPathForIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_indexPathForIdentifierPath:(id)a3
{
  if (a3)
  {
    id v4 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_nodeSnapshotAtIndexPath:(id)a3
{
  id v4 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:a3];
  id v5 = [(HomeOutlineRootController *)self _nodeSnapshotAtIdentifierPath:v4];

  return v5;
}

- (id)_nodeSnapshotAtIdentifierPath:(id)a3
{
  if (a3)
  {
    id v4 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot nodeSnapshotAtIdentifierPath:](self->_rootSnapshot, "nodeSnapshotAtIdentifierPath:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setKeyboardProxy:(id)a3
{
  p_keyboardProxy = &self->_keyboardProxy;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_keyboardProxy);
  [WeakRetained setDelegate:0];

  [v5 setDelegate:self];
  objc_storeWeak((id *)p_keyboardProxy, v5);

  sectionControllers = self->_sectionControllers;

  [(HomeOutlineRootController *)self _setNeedsSnapshotUpdatesForSectionControllers:sectionControllers animated:1];
}

- (id)_loadingDataProviders
{
  uint64_t v3 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = self->_sectionControllers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = [v9 dataProviders];
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
              if (([v15 hasInitialData] & 1) == 0) {
                [v3 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  id v16 = [v3 copy];

  return v16;
}

- (BOOL)_isLoading
{
  uint64_t v3 = [(HomeOutlineRootController *)self _loadingDataProviders];
  id v4 = [v3 count];

  BOOL result = [(NSTimer *)self->_loadingTimer isValid];
  if (!v4) {
    return 0;
  }
  return result;
}

- (void)_updateLoadingTimer
{
  uint64_t v3 = [(HomeOutlineRootController *)self _loadingDataProviders];
  id v4 = [v3 count];

  loadingTimer = self->_loadingTimer;
  if (v4)
  {
    if (loadingTimer) {
      return;
    }
    GEOConfigGetDouble();
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_loadingTimerDidFire", 0, 0);
    id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [(NSTimer *)loadingTimer invalidate];
    id v6 = 0;
  }
  uint64_t v7 = self->_loadingTimer;
  self->_loadingTimer = v6;
}

- (void)_loadingTimerDidFire
{
  [(NSTimer *)self->_loadingTimer invalidate];
  if (self->_active)
  {
    sectionControllers = self->_sectionControllers;
    [(HomeOutlineRootController *)self _setNeedsSnapshotUpdatesForSectionControllers:sectionControllers animated:1];
  }
}

- (void)_resetSnapshotUpdateState
{
  self->_animateNextUpdate = 0;
  uint64_t v3 = +[NSMutableSet set];
  sectionControllersToUpdate = self->_sectionControllersToUpdate;
  self->_sectionControllersToUpdate = v3;
}

- (void)_setNeedsSnapshotUpdatesForSectionControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_active)
  {
    uint64_t v7 = sub_1000AA148();
    v8 = v7;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, signpostID, "SetNeedsApplySnapshot", "", (uint8_t *)&v23, 2u);
    }

    [(HomeOutlineRootController *)self _updateLoadingTimer];
    if (![(HomeOutlineRootController *)self _isLoading])
    {
      if ([(HomeOutlineRootController *)self _needsSnapshotUpdate]
        && self->_animateNextUpdate != v4
        && self->_appliedInitialUpdate)
      {
        [(HomeOutlineRootController *)self updateIfNeeded];
      }
      self->_animateNextUpdate = v4;
      [(NSMutableSet *)self->_sectionControllersToUpdate addObjectsFromArray:v6];
      uint64_t v17 = [(HomeOutlineRootController *)self configuration];
      long long v18 = [v17 homeUpdateDelegate];
      [v18 homeSetNeedsUpdate];
      goto LABEL_16;
    }
    id v10 = sub_1000AA148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v23 = 138412290;
      long long v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data is still loading", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v13 = sub_1000AA148();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      id v15 = [(HomeOutlineRootController *)self _loadingDataProviders];
      id v16 = sub_100099700(v15, &stru_1012F7F98);
      uint64_t v17 = +[NSSet setWithArray:v16];

      long long v18 = sub_1000AA148();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        long long v19 = (objc_class *)objc_opt_class();
        long long v20 = NSStringFromClass(v19);
        long long v21 = [v17 allObjects];
        long long v22 = [v21 componentsJoinedByString:@", "];
        int v23 = 138412546;
        long long v24 = v20;
        __int16 v25 = 2112;
        __int16 v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data has not loaded in data providers [%@]", (uint8_t *)&v23, 0x16u);
      }
LABEL_16:
    }
  }
}

- (BOOL)_needsSnapshotUpdate
{
  if (!self->_active || [(HomeOutlineRootController *)self _isLoading]) {
    return 0;
  }
  if ([(NSMutableSet *)self->_sectionControllersToUpdate count]) {
    return 1;
  }
  return !self->_appliedInitialUpdate;
}

- (void)updateIfNeeded
{
  if ([(HomeOutlineRootController *)self _needsSnapshotUpdate])
  {
    BOOL appliedInitialUpdate = self->_appliedInitialUpdate;
    if (appliedInitialUpdate)
    {
      BOOL v4 = +[NSSet setWithSet:self->_sectionControllersToUpdate];
      BOOL v5 = 0;
      BOOL animateNextUpdate = self->_animateNextUpdate;
    }
    else
    {
      self->_BOOL appliedInitialUpdate = 1;
      BOOL v4 = +[NSSet setWithArray:self->_sectionControllers];
      BOOL animateNextUpdate = 0;
      BOOL v5 = self->_animateNextUpdate;
    }
    objc_initWeak((id *)buf, self);
    [(HomeOutlineRootController *)self _resetSnapshotUpdateState];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100775268;
    id v16 = &unk_1012E6830;
    BOOL v18 = !appliedInitialUpdate;
    objc_copyWeak(&v17, (id *)buf);
    [(HomeOutlineRootController *)self _applySnapshotUpdatesInSectionControllers:v4 animateCells:animateNextUpdate animateCollectionView:v5 completion:&v13];
    id v11 = [(HomeOutlineRootController *)self configuration];
    id v12 = [v11 homeUpdateDelegate];
    [v12 homeDidUpdateAnimated:v5 | animateNextUpdate];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    BOOL v4 = sub_1000AA148();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = sub_100097E28(self->_active);
      v8 = sub_100097E28([(HomeOutlineRootController *)self _isLoading]);
      id v9 = [(NSMutableSet *)self->_sectionControllersToUpdate count];
      id v10 = sub_100097E28(self->_appliedInitialUpdate);
      *(_DWORD *)buf = 138413058;
      long long v20 = v7;
      __int16 v21 = 2112;
      long long v22 = v8;
      __int16 v23 = 2048;
      id v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Snapshot update is not needed because _action: %@, _loading: %@, _sectionControllersToUpdate count: %ld, _appliedInitialUpdate: %@", buf, 0x2Au);
    }
  }
}

- (void)_applySnapshotUpdatesInSectionControllers:(id)a3 animateCells:(BOOL)a4 animateCollectionView:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v126 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = sub_1000AA148();
  id v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v14 = sub_100097E28(v126);
    id v15 = sub_100097E28(v7);
    *(_DWORD *)buf = 138412546;
    v154 = v14;
    __int16 v155 = 2112;
    v156 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ApplySnapshot", "animateCells = %@, animateCollectionView = %@", buf, 0x16u);
  }
  int v123 = v7;
  if (v7)
  {
    id v16 = [(HomeOutlineRootController *)self configuration];
    id v17 = [v16 collectionView];
    [v17 alpha];
    uint64_t v19 = v18;

    long long v20 = [(HomeOutlineRootController *)self configuration];
    __int16 v21 = [v20 collectionView];
    [v21 setAlpha:0.0];

    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = sub_10077602C;
    v152[3] = &unk_1012E69C0;
    v152[4] = self;
    v152[5] = v19;
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_100776098;
    v150[3] = &unk_1012EAFC0;
    id v151 = v10;
    +[UIView animateWithDuration:2 delay:v152 options:v150 animations:0.25 completion:0.0];
  }
  long long v22 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource snapshotForSection:@"root"];
  __int16 v23 = sub_1000AA148();
  id v24 = v23;
  os_signpost_id_t v25 = self->_signpostID;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "BuildSectionSnapshot", "", buf, 2u);
  }

  v132 = +[NSMutableArray array];
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  v134 = self;
  __int16 v26 = self->_sectionControllers;
  id v27 = [(NSArray *)v26 countByEnumeratingWithState:&v146 objects:v175 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v147;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v147 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        if ([v9 containsObject:v31]) {
          [v31 invalidateSectionSnapshot];
        }
        v32 = [v31 sectionSnapshot];
        __int16 v33 = [v32 childSnapshots];
        id v34 = [v33 count];

        if (v34) {
          [v132 addObject:v32];
        }
      }
      id v28 = [(NSArray *)v26 countByEnumeratingWithState:&v146 objects:v175 count:16];
    }
    while (v28);
  }

  v35 = v134->_rootSnapshot;
  v36 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
  v37 = +[IdentifierPath identifierPath];
  v38 = +[HomeOutlineHiddenViewModel sharedViewModel];
  v39 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v36 initWithIdentifierPath:v37 viewModel:v38 childSnapshots:v132 expanded:1];
  rootSnapshot = v134->_rootSnapshot;
  v134->_rootSnapshot = v39;

  v129 = v22;
  v125 = v35;
  id v41 = [v22 _maps_applyChangesWithNewRootSnapshot:v134->_rootSnapshot oldRootSnapshot:v35];
  uint64_t v42 = sub_1000AA148();
  v43 = v42;
  os_signpost_id_t v44 = v134->_signpostID;
  if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v44, "BuildSectionSnapshot", "", buf, 2u);
  }

  v133 = [(HomeOutlineRootController *)v134 _focusedIdentifierPath];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v45 = [v41 deletedItems];
  id v46 = [v45 countByEnumeratingWithState:&v142 objects:v174 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v143;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v143 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = [*(id *)(*((void *)&v142 + 1) + 8 * (void)j) identifierPath];
        if (v50 == v133)
        {
        }
        else
        {
          long long v51 = v50;
          unsigned int v52 = [v50 isEqual:];

          if (!v52) {
            continue;
          }
        }
        v53 = [(HomeOutlineRootController *)v134 configuration];
        v54 = [v53 actionCoordinator];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v55 = v54;
        }
        else {
          v55 = 0;
        }
        id v56 = v55;

        [v56 makeMapViewFirstResponder];
      }
      id v47 = [v45 countByEnumeratingWithState:&v142 objects:v174 count:16];
    }
    while (v47);
  }
  v130 = v9;
  v131 = (void (**)(void))v10;

  v57 = sub_1000AA148();
  v58 = v57;
  v59 = v134;
  os_signpost_id_t v60 = v134->_signpostID;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_BEGIN, v60, "ReloadCells", "", buf, 2u);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v128 = v41;
  v61 = [v41 reloadedItems];
  id v62 = [v61 countByEnumeratingWithState:&v138 objects:v173 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v139;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(void *)v139 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = *(void **)(*((void *)&v138 + 1) + 8 * (void)k);
        v67 = [v66 identifierPath];
        v68 = [(HomeOutlineRootController *)v59 _indexPathForIdentifierPath:v67];

        if (v68)
        {
          v69 = [(HomeOutlineRootController *)v59 configuration];
          v70 = [v69 collectionView];
          v71 = [v70 cellForItemAtIndexPath:v68];

          if (v71)
          {
            v72 = [v66 viewModel];
            v73 = [v72 cellRegistration];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v74 = v73;
            }
            else {
              v74 = 0;
            }
            id v75 = v74;

            if (v75)
            {
              [v75 cellClass];
              if (objc_opt_isKindOfClass())
              {
                v76 = [v75 viewModelConfigurationHandler];
                ((void (**)(void, void *, void *, void *))v76)[2](v76, v71, v68, v66);
              }
            }

            v59 = v134;
          }
        }
      }
      id v63 = [v61 countByEnumeratingWithState:&v138 objects:v173 count:16];
    }
    while (v63);
  }

  v77 = sub_1000AA148();
  v78 = v77;
  os_signpost_id_t v79 = v59->_signpostID;
  v80 = v129;
  if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, OS_SIGNPOST_INTERVAL_END, v79, "ReloadCells", "", buf, 2u);
  }

  v81 = sub_1000AA148();
  v82 = v81;
  os_signpost_id_t v83 = v59->_signpostID;
  v84 = v128;
  if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_BEGIN, v83, "ApplySectionSnapshot", "", buf, 2u);
  }

  if ([v128 hasChanges])
  {
    diffableDataSource = v134->_diffableDataSource;
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_1007760B0;
    v135[3] = &unk_1012E9AD0;
    char v137 = v123;
    v136 = v131;
    v86 = diffableDataSource;
    v59 = v134;
    [(UICollectionViewDiffableDataSource *)v86 applySnapshot:v129 toSection:@"root" animatingDifferences:v126 completion:v135];
  }
  else if (v131)
  {
    v131[2]();
  }
  v87 = sub_1000AA148();
  v88 = v87;
  os_signpost_id_t v89 = v59->_signpostID;
  if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_END, v89, "ApplySectionSnapshot", "", buf, 2u);
  }

  v90 = sub_1000AA148();
  BOOL v91 = os_log_type_enabled(v90, OS_LOG_TYPE_INFO);

  if (v91)
  {
    v92 = sub_100099700(v130, &stru_1012F7FD8);
    v93 = [v128 reloadedItems];
    v94 = sub_100099700(v93, &stru_1012F8018);

    v95 = [v128 insertedItems];
    v96 = sub_100099700(v95, &stru_1012F8038);

    v97 = [v128 deletedItems];
    v122 = sub_100099700(v97, &stru_1012F8058);

    v98 = [v128 movedItems];
    v121 = sub_100099700(v98, &stru_1012F8078);

    v99 = [v128 expandedItems];
    v120 = sub_100099700(v99, &stru_1012F8098);

    v100 = [v128 collapsedItems];
    v101 = sub_100099700(v100, &stru_1012F80B8);

    v102 = sub_1000AA148();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      v103 = (objc_class *)objc_opt_class();
      v118 = NSStringFromClass(v103);
      v116 = sub_100097E28(v126);
      v117 = sub_100097E28(v123);
      v104 = v92;
      uint64_t v105 = [v92 componentsJoinedByString:@", "];
      v106 = [v94 componentsJoinedByString:@", "];
      v107 = [v96 componentsJoinedByString:@", "];
      [v122 componentsJoinedByString:@", "];
      v127 = v96;
      v124 = v104;
      v108 = v119 = v94;
      v109 = [v121 componentsJoinedByString:@", "];
      v110 = [v120 componentsJoinedByString:@", "];
      v111 = [v101 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138414594;
      v154 = v118;
      __int16 v155 = 2112;
      v156 = v116;
      __int16 v157 = 2112;
      v158 = v117;
      __int16 v159 = 2112;
      uint64_t v160 = v105;
      v112 = (void *)v105;
      __int16 v161 = 2112;
      v162 = v106;
      __int16 v163 = 2112;
      v164 = v107;
      __int16 v165 = 2112;
      v166 = v108;
      __int16 v167 = 2112;
      v168 = v109;
      __int16 v169 = 2112;
      v170 = v110;
      __int16 v171 = 2112;
      v172 = v111;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "%@ applySnapshot {\n\tanimateCells: %@\n\tanimateCollectionView: %@\n\tupdatedSections: [%@]\n\treloads: [%@]\n\tinsertions: [%@]\n\tdeletions: [%@]\n\tmoves: [%@]\n\texpansions: [%@]\n\tcollapses: [%@]\n}", buf, 0x66u);

      v84 = v128;
      v94 = v119;
      v92 = v124;
      v96 = v127;

      v80 = v129;
    }
  }
  v113 = sub_1000AA148();
  v114 = v113;
  os_signpost_id_t v115 = v134->_signpostID;
  if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_INTERVAL_END, v115, "ApplySnapshot", "", buf, 2u);
  }
}

- (void)_didCompleteInitialUpdate
{
  if (self->_loadingState == 1)
  {
    self->_loadingState = 2;
    uint64_t v3 = sub_1000AA148();
    BOOL v4 = v3;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, signpostID, "HomeListSectionLoading", "", buf, 2u);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_sectionControllers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) didApplyInitialSectionSnapshot:v11];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_updateContentInjectionWithSelectedIndexPath:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[HomeOutlineRootController _nodeSnapshotAtIndexPath:](self, "_nodeSnapshotAtIndexPath:");
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 identifierPath];
      id v7 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v6];

      id v12 = [v7 contentInjectorForSnapshot:v5];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v8 = [(HomeOutlineRootController *)self configuration];
  uint64_t v9 = [v8 actionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  [v11 setSidebarContentInjector:v12];
}

- (id)sectionController:(id)a3 nodeSnapshotAtIndexPath:(id)a4
{
  return [(HomeOutlineRootController *)self _nodeSnapshotAtIndexPath:a4];
}

- (id)sectionController:(id)a3 indexPathForIdentifierPath:(id)a4
{
  return [(HomeOutlineRootController *)self _indexPathForIdentifierPath:a4];
}

- (void)sectionController:(id)a3 setNeedsApplySnapshotAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Apply Snapshot for section controller: %@", buf, 0xCu);
  }

  id v9 = v6;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [(HomeOutlineRootController *)self _setNeedsSnapshotUpdatesForSectionControllers:v8 animated:v4];
}

- (BOOL)applySnapshotIfNeededWithSectionController:(id)a3
{
  return self->_appliedInitialUpdate;
}

- (BOOL)isCollectionViewProxyFocusedWithSectionController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardProxy);
  unsigned __int8 v4 = [WeakRetained shouldAppearFocused];

  return v4;
}

- (BOOL)isCollectionViewFocusedWithSectionController:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_sectionControllers;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) focusedIdentifierPath:(void)v9];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)hasCollectionViewDropSessionWithSectionController:(id)a3
{
  return self->_hasDropSession;
}

- (void)sectionController:(id)a3 selectItemAtIdentifierPath:(id)a4 completion:(id)a5
{
}

- (void)sectionController:(id)a3 deselectItemAtIdentifierPath:(id)a4
{
  uint64_t v5 = [(HomeOutlineRootController *)self _indexPathForIdentifierPath:a4];
  if (v5)
  {
    id v6 = v5;
    [(HomeOutlineRootController *)self _deselectItemAtIndexPath:v5];
    uint64_t v5 = v6;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = sub_1000AA148();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dequeuing cell at index path: %@, identifier path: %@", (uint8_t *)&v27, 0x16u);
  }

  id v12 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v13 = v12;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;

  id v15 = [(HomeOutlineRootController *)self _nodeSnapshotAtIdentifierPath:v14];
  id v16 = [v15 viewModel];
  id v17 = [v16 cellRegistration];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  long long v20 = sub_1000AA148();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412290;
    id v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Dequeuing cell with cell registration :%@", (uint8_t *)&v27, 0xCu);
  }

  if (v19)
  {
    __int16 v21 = [v8 dequeueConfiguredReusableCellWithRegistration:v19 forIndexPath:v9 item:v12];
    long long v22 = [v14 firstIdentifier];
    __int16 v23 = [v22 stringByReplacingOccurrencesOfString:@" " withString:&stru_101324E70];
    [v21 setAxSectionIdentifier:v23];

    id v24 = [v19 viewModelConfigurationHandler];
    ((void (**)(void, void *, id, void *))v24)[2](v24, v21, v9, v15);

    [v21 setHoverSource:self];
    if ((uint64_t)[v14 length] >= 2) {
      os_signpost_id_t v25 = (char *)[v14 length] - 2;
    }
    else {
      os_signpost_id_t v25 = 0;
    }
    [v21 setIndentationLevel:v25];
  }
  else
  {
    __int16 v21 = 0;
  }

  return v21;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v7];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v9 = [v8 collectionView:v6 shouldHighlightItemAtIndexPath:v7];
  }
  else {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    int v14 = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v14, 0x20u);
  }
  [(HomeOutlineRootController *)self _updateContentInjectionWithSelectedIndexPath:v8];
  long long v13 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v8];
  if (objc_opt_respondsToSelector()) {
    [v13 collectionView:v7 didSelectItemAtIndexPath:v8];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    int v14 = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v14, 0x20u);
  }
  [(HomeOutlineRootController *)self _updateContentInjectionWithSelectedIndexPath:0];
  long long v13 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v8];
  if (objc_opt_respondsToSelector()) {
    [v13 collectionView:v7 didDeselectItemAtIndexPath:v8];
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v7];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v9 = [v8 collectionView:v6 shouldHighlightItemAtIndexPath:v7];
  }
  else {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->_sectionControllers;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v15);
        if (objc_opt_respondsToSelector()) {
          [v16 collectionView:v8 didUpdateFocusInContext:v9 withAnimationCoordinator:v10];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if ([v10 count] == (id)1)
  {
    long long v11 = [v10 firstObject];
    id v12 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v11];

    if (objc_opt_respondsToSelector())
    {
      id v13 = [v12 collectionView:v9 contextMenuConfigurationForItemsAtIndexPaths:v10 point:x, y];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [a4 identifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v18 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v8];
  id v9 = [(HomeOutlineRootController *)self _nodeSnapshotAtIdentifierPath:v8];

  if (v9)
  {
    id v10 = [v18 shareItemSourceForSnapshot:v9];
    if (v10)
    {
      id v11 = objc_alloc((Class)UIActivityItemsConfiguration);
      id v12 = [v10 activityProviders];
      id v13 = [v10 applicationActivities];
      id v14 = [v11 _initWithActivityItems:v12 applicationActivities:v13];

      id v15 = [v10 excludedActivityTypes];
      [v14 _setExcludedActivityTypes:v15];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  __int16 v16 = [(HomeOutlineRootController *)self configuration];
  long long v17 = [v16 collectionView];
  [v17 setActivityItemsConfiguration:v14];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [(HomeOutlineRootController *)self configuration];
  uint64_t v5 = [v6 collectionView];
  [v5 setActivityItemsConfiguration:0];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[MapsDragAndDropManager sharedManager];
  unsigned int v12 = [v11 canStartNewDrag];

  if (v12)
  {
    id v13 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v10];
    id v14 = [v13 collectionView:v8 itemsForBeginningDragSession:v9 atIndexPath:v10];
    if ([v14 count]) {
      objc_storeStrong((id *)&self->_draggingSectionController, v13);
    }
  }
  else
  {
    id v14 = &__NSArray0__struct;
  }

  return v14;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = +[MapsDragAndDropManager sharedManager];
  [v7 setDragSession:v6];

  id v8 = [MapsDragLocalContext alloc];
  id v9 = [v12 window];
  id v10 = [v9 windowScene];
  id v11 = [(MapsDragLocalContext *)v8 initWithWindowScene:v10];
  [v6 setLocalContext:v11];

  if (objc_opt_respondsToSelector()) {
    [(HomeOutlineSectionControllerSubclassing *)self->_draggingSectionController collectionView:v12 dragSessionWillBegin:v6];
  }
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(HomeOutlineSectionControllerSubclassing *)self->_draggingSectionController collectionView:v9 dragSessionDidEnd:v6];
  }
  draggingSectionController = self->_draggingSectionController;
  self->_draggingSectionController = 0;

  id v8 = +[MapsDragAndDropManager sharedManager];
  [v8 setDragSession:0];
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = [a4 localDragSession:a3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_hasDropSession = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_sectionControllers;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 collectionView:dropSessionDidEnter:v6, v7, v14];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_1000AA148();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    long long v14 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v11];
    long long v15 = sub_1000AA148();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = objc_opt_class();
      id v17 = v16;
      id v18 = NSStringFromSelector(a2);
      int v26 = 138413058;
      int v27 = v16;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      __int16 v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ %@, indexPath = %@, identifierPath = %@", (uint8_t *)&v26, 0x2Au);
    }
  }
  long long v19 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v11];
  dropTargetSectionController = self->_dropTargetSectionController;
  p_dropTargetSectionController = &self->_dropTargetSectionController;
  if (v19 != dropTargetSectionController)
  {
    if (objc_opt_respondsToSelector()) {
      id v22 = [(HomeOutlineSectionControllerSubclassing *)*p_dropTargetSectionController collectionView:v9 dropSessionDidUpdate:v10 withDestinationIndexPath:0];
    }
    objc_storeStrong((id *)p_dropTargetSectionController, v19);
  }
  if (objc_opt_respondsToSelector())
  {
    id v23 = [(HomeOutlineSectionControllerSubclassing *)v19 collectionView:v9 dropSessionDidUpdate:v10 withDestinationIndexPath:v11];
  }
  else
  {
    id v23 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:0];
  }
  id v24 = v23;

  return v24;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000AA148();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    id v11 = [v8 destinationIndexPath];
    id v12 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v11];
    BOOL v13 = sub_1000AA148();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = objc_opt_class();
      id v15 = v14;
      long long v16 = NSStringFromSelector(a2);
      int v19 = 138413058;
      long long v20 = v14;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      int v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@, indexPath = %@, identifierPath = %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  id v17 = [v8 destinationIndexPath];
  id v18 = [(HomeOutlineRootController *)self _sectionControllerForIndexPath:v17];

  if (objc_opt_respondsToSelector()) {
    [v18 collectionView:v7 performDropWithCoordinator:v8];
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_hasDropSession = 0;
  dropTargetSectionController = self->_dropTargetSectionController;
  self->_dropTargetSectionController = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = self->_sectionControllers;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      BOOL v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 collectionView:dropSessionDidExit:v6, v7];
        }
        BOOL v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_hasDropSession = 0;
  dropTargetSectionController = self->_dropTargetSectionController;
  self->_dropTargetSectionController = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = self->_sectionControllers;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      BOOL v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 collectionView:v6 dropSessionDidEnd:v7];
        }
        BOOL v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v10];
  uint64_t v12 = sub_1000AA148();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v10;
    __int16 v16 = 2112;
    long long v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will display cell at index path: %@, identifier path: %@", (uint8_t *)&v14, 0x16u);
  }

  BOOL v13 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v11];
  if (objc_opt_respondsToSelector()) {
    [v13 collectionView:v8 willDisplayCell:v9 forItemAtIndexPath:v10];
  }
  if (v11 == self->_focusAfterScrollingIndentifierPath || -[IdentifierPath isEqual:](v11, "isEqual:")) {
    [(HomeOutlineRootController *)self _focusAfterScrollingCellWillDisplay];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  id v4 = [(HomeOutlineRootController *)self configuration];
  BOOL v5 = [v4 homeUpdateDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(HomeOutlineRootController *)self configuration];
    id v8 = [v7 homeUpdateDelegate];
    [v8 scrollViewDidScroll:v9];
  }
  [(HomeOutlineRootController *)self _notifyCellHoverObservers];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
}

- (void)showCollection:(id)a3
{
  id v4 = a3;
  if ([v4 handlerType] == (id)3) {
    [(HomeOutlineSuggestionsSectionController *)self->_suggestionsSectionController showSharedCollection:v4];
  }
  else {
    [(HomeOutlineCollectionsSectionController *)self->_collectionsSectionController showCollection:v4];
  }
}

- (void)editCollection:(id)a3
{
}

- (id)viewForProfileToolTipPopoverWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = 112;
LABEL_5:
    char v6 = [*(id *)((char *)&self->super.isa + v5) sourceViewForProfileTipPopover:v3];
    return v6;
  }
  if (a3 == 2)
  {
    uint64_t v5 = 120;
    goto LABEL_5;
  }
  char v6 = 0;
  return v6;
}

- (id)_selectedIdentifierPaths
{
  uint64_t v3 = [(HomeOutlineRootController *)self configuration];
  uint64_t v4 = [v3 collectionView];
  uint64_t v5 = [v4 indexPathsForSelectedItems];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100778190;
  v9[3] = &unk_1012EBC90;
  v9[4] = self;
  char v6 = sub_100099700(v5, v9);
  id v7 = +[NSSet setWithArray:v6];

  return v7;
}

- (void)_selectItemAtIdentifierPath:(id)a3 notifyDelegate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void))a5;
  [(HomeOutlineRootController *)self updateIfNeeded];
  id v11 = [(HomeOutlineRootController *)self _indexPathForIdentifierPath:v9];
  uint64_t v12 = sub_1000AA148();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = objc_opt_class();
    id v14 = v13;
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    int v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v15;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ %@ index path = %@, identifier path = %@", buf, 0x2Au);
  }
  if (v9 && v11)
  {
    __int16 v16 = [(HomeOutlineRootController *)self configuration];
    long long v17 = [v16 collectionView];

    long long v18 = [v17 indexPathsForVisibleItems];
    unsigned int v19 = [v18 containsObject:v11];
    if (v19) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 2;
    }

    [v17 selectItemAtIndexPath:v11 animated:1 scrollPosition:v20];
    if (v6)
    {
      [(NSTimer *)self->_keyboardSelectionTimer invalidate];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10077844C;
      v23[3] = &unk_1012F80E0;
      id v24 = v17;
      id v25 = v11;
      __int16 v21 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v23 block:0.2];
      keyboardSelectionTimer = self->_keyboardSelectionTimer;
      self->_keyboardSelectionTimer = v21;
    }
    else
    {
      [(HomeOutlineRootController *)self _updateContentInjectionWithSelectedIndexPath:v11];
      [(HomeOutlineRootController *)self _setFocusAfterScrollingIdentifierPath:v9 completion:v10];
      if (v19) {
        [(HomeOutlineRootController *)self _updateFocusAfterScrolling];
      }
      else {
        *(_WORD *)&self->_needsFocusAfterScrollingAnimationDidEnd = 257;
      }
    }
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }
}

- (void)_deselectItemAtIndexPath:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v5];
  id v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    int v17 = 138413058;
    long long v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ index path = %@, identifier path = %@", (uint8_t *)&v17, 0x2Au);
  }
  id v11 = [(HomeOutlineRootController *)self configuration];
  uint64_t v12 = [v11 collectionView];
  BOOL v13 = [v12 indexPathsForSelectedItems];
  unsigned int v14 = [v13 containsObject:v5];

  if (v14)
  {
    id v15 = [(HomeOutlineRootController *)self configuration];
    __int16 v16 = [v15 collectionView];
    [v16 deselectItemAtIndexPath:v5 animated:1];

    [(HomeOutlineRootController *)self _updateContentInjectionWithSelectedIndexPath:0];
  }
}

- (void)clearSelectionWithReason:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(HomeOutlineRootController *)self _selectedIdentifierPaths];
  id v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v19 = v5;
    id v8 = objc_opt_class();
    id v18 = v8;
    id v9 = NSStringFromSelector(a2);
    int v17 = [(HomeOutlineRootController *)self configuration];
    id v10 = [v17 collectionView];
    id v11 = [v10 indexPathsForSelectedItems];
    uint64_t v12 = [v11 componentsJoinedByString:@", "];
    BOOL v13 = [v6 allObjects];
    unsigned int v14 = [v13 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413314;
    __int16 v21 = v8;
    id v5 = v19;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    int v27 = v14;
    __int16 v28 = 2112;
    id v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ selected index paths = [%@], selected identifier paths = [%@], deselection reason = %@", buf, 0x34u);
  }
  if ([v6 count] && (unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    id v15 = [v6 anyObject];
    __int16 v16 = [(HomeOutlineRootController *)self _sectionControllerForIdentifierPath:v15];
    [v16 clearSelectionWithReason:v5];
  }
}

- (id)_focusedIdentifierPath
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_sectionControllers;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = [v6 focusedIdentifierPath:v9];

        if (v7)
        {
          id v3 = [v6 focusedIdentifierPath];
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_focusCellAtVisibleSelectedIdentifierPath:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  long long v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    long long v12 = NSStringFromSelector(a2);
    int v22 = 138412802;
    __int16 v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, identifier path = %@", (uint8_t *)&v22, 0x20u);
  }
  BOOL v13 = [(HomeOutlineRootController *)self _indexPathForIdentifierPath:v7];
  if (v13)
  {
    unsigned int v14 = [(HomeOutlineRootController *)self _selectedIdentifierPaths];
    if (([v14 containsObject:v7] & 1) == 0)
    {
      if (v8) {
        v8[2](v8, 0);
      }
      goto LABEL_21;
    }
    id v15 = [(HomeOutlineRootController *)self configuration];
    __int16 v16 = [v15 collectionView];
    int v17 = [v16 cellForItemAtIndexPath:v13];

    if (!v17)
    {
      if (v8) {
        v8[2](v8, 0);
      }
      goto LABEL_20;
    }
    id v18 = [(HomeOutlineRootController *)self _focusedIdentifierPath];
    id v19 = v18;
    if (v18 == v7 || [v18 isEqual:v7])
    {
      if (v8)
      {
        uint64_t v20 = 1;
LABEL_18:
        v8[2](v8, v20);
      }
    }
    else
    {
      id v21 = [v17 becomeFirstResponder];
      if (v8)
      {
        uint64_t v20 = (uint64_t)v21;
        goto LABEL_18;
      }
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  if (v8) {
    v8[2](v8, 0);
  }
LABEL_22:
}

- (void)_setFocusAfterScrollingIdentifierPath:(id)a3 completion:(id)a4
{
  BOOL v6 = (IdentifierPath *)a3;
  id v11 = a4;
  if (self->_focusAfterScrollingIndentifierPath)
  {
    [(HomeOutlineRootController *)self _completeFocusAfterScrollingWithSuccess:0];
    focusAfterScrollingIndentifierPath = self->_focusAfterScrollingIndentifierPath;
  }
  else
  {
    focusAfterScrollingIndentifierPath = 0;
  }
  self->_focusAfterScrollingIndentifierPath = v6;
  id v8 = v6;

  id v9 = objc_retainBlock(v11);
  id focusAfterScrollingCompletion = self->_focusAfterScrollingCompletion;
  self->_id focusAfterScrollingCompletion = v9;
}

- (void)_updateFocusAfterScrolling
{
  if (self->_focusAfterScrollingIndentifierPath
    && !self->_needsFocusAfterScrollingAnimationDidEnd
    && !self->_needsFocusAfterScrollingCellWillDisplay)
  {
    -[HomeOutlineRootController _focusCellAtVisibleSelectedIdentifierPath:completion:](self, "_focusCellAtVisibleSelectedIdentifierPath:completion:");
  }
}

- (void)_focusAfterScrollingAnimationDidEnd
{
  if (self->_focusAfterScrollingIndentifierPath)
  {
    self->_needsFocusAfterScrollingAnimationDidEnd = 0;
    [(HomeOutlineRootController *)self _updateFocusAfterScrolling];
  }
}

- (void)_focusAfterScrollingCellWillDisplay
{
  if (self->_focusAfterScrollingIndentifierPath)
  {
    self->_needsFocusAfterScrollingCellWillDispladouble y = 0;
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100778DC0;
    v2[3] = &unk_1012E6708;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_completeFocusAfterScrollingWithSuccess:(BOOL)a3
{
  if (self->_focusAfterScrollingIndentifierPath)
  {
    BOOL v3 = a3;
    id v8 = objc_retainBlock(self->_focusAfterScrollingCompletion);
    focusAfterScrollingIndentifierPath = self->_focusAfterScrollingIndentifierPath;
    self->_focusAfterScrollingIndentifierPath = 0;

    id focusAfterScrollingCompletion = self->_focusAfterScrollingCompletion;
    self->_id focusAfterScrollingCompletion = 0;

    id v7 = v8;
    *(_WORD *)&self->_needsFocusAfterScrollingAnimationDidEnd = 0;
    if (v8)
    {
      (*((void (**)(id, BOOL))v8 + 2))(v8, v3);
      id v7 = v8;
    }
  }
}

- (void)_notifyCellHoverObservers
{
}

- (UIScrollView)hoverScrollView
{
  v2 = [(HomeOutlineRootController *)self configuration];
  BOOL v3 = [v2 collectionView];

  return (UIScrollView *)v3;
}

- (void)keyboardProxyingView:(id)a3 didUpdateFocusState:(BOOL)a4
{
}

- (void)keyboardProxyingView:(id)a3 pressesBegan:(id)a4 withEvent:(id)a5
{
  id v13 = a4;
  BOOL v6 = [v13 count] == (id)1;
  id v7 = v13;
  if (v6)
  {
    id v8 = [v13 anyObject];
    id v9 = [v8 key];
    id v10 = [v9 keyCode];

    if (v10 == (id)82)
    {
      [(HomeOutlineRootController *)self upArrowPressed:v8];
    }
    else
    {
      id v11 = [v8 key];
      id v12 = [v11 keyCode];

      if (v12 == (id)81) {
        [(HomeOutlineRootController *)self downArrowPressed:v8];
      }
    }

    id v7 = v13;
  }
}

- (void)upArrowPressed:(id)a3
{
  uint64_t v4 = [(HomeOutlineRootController *)self configuration];
  id v14 = [v4 collectionView];

  id v5 = [v14 indexPathsForSelectedItems];
  BOOL v6 = [v5 firstObject];

  if (objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v6, "section")))
  {
    id v7 = [v6 copy];
    if (v7)
    {
      while (1)
      {
        id v8 = v7;
        uint64_t v9 = (uint64_t)[v7 row];
        if (v9 < 2) {
          break;
        }
        +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9 - 1, [v7 section]);
        id v7 = (id)objc_claimAutoreleasedReturnValue();

        id v10 = [v14 delegate];
        unsigned int v11 = [v10 collectionView:v14 shouldHighlightItemAtIndexPath:v7];

        if (v11)
        {
          id v12 = v7;
          if (v12) {
            goto LABEL_9;
          }
        }
      }
      id v12 = 0;
    }
    else
    {
      id v12 = 0;
LABEL_9:
      id v13 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v12];
      if (v13) {
        [(HomeOutlineRootController *)self _selectItemAtIdentifierPath:v13 notifyDelegate:1 completion:0];
      }
    }
  }
}

- (void)downArrowPressed:(id)a3
{
  uint64_t v4 = [(HomeOutlineRootController *)self configuration];
  id v16 = [v4 collectionView];

  id v5 = [v16 indexPathsForSelectedItems];
  BOOL v6 = [v5 firstObject];

  id v7 = (char *)[v16 numberOfItemsInSection:[v6 section]];
  if (v7)
  {
    id v8 = v7;
    id v9 = [v6 copy];
    if (v9)
    {
      while (1)
      {
        id v10 = v9;
        unsigned int v11 = (char *)[v9 row];
        if ((uint64_t)v11 >= (uint64_t)v8) {
          break;
        }
        +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11 + 1, [v9 section]);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = [v16 delegate];
        unsigned int v13 = [v12 collectionView:v16 shouldHighlightItemAtIndexPath:v9];

        if (v13)
        {
          id v14 = v9;
          if (v14) {
            goto LABEL_9;
          }
        }
      }
      id v14 = 0;
    }
    else
    {
      id v14 = 0;
LABEL_9:
      id v15 = [(HomeOutlineRootController *)self _identifierPathForIndexPath:v14];
      if (v15) {
        [(HomeOutlineRootController *)self _selectItemAtIdentifierPath:v15 notifyDelegate:1 completion:0];
      }
    }
  }
}

- (id)_storage
{
  storage = self->_storage;
  if (!storage)
  {
    uint64_t v4 = objc_alloc_init(HomeStorage);
    id v5 = self->_storage;
    self->_storage = v4;

    storage = self->_storage;
  }

  return storage;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (GEOObserverHashTable)hoverChangeObservers
{
  return self->_hoverChangeObservers;
}

- (HomeOutlineRootControllerConfiguration)configuration
{
  return self->_configuration;
}

- (KeyboardProxyingView)keyboardProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardProxy);

  return (KeyboardProxyingView *)WeakRetained;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardProxy);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_focusAfterScrollingCompletion, 0);
  objc_storeStrong((id *)&self->_focusAfterScrollingIndentifierPath, 0);
  objc_storeStrong((id *)&self->_keyboardSelectionTimer, 0);
  objc_storeStrong((id *)&self->_hoverChangeObservers, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dropTargetSectionController, 0);
  objc_storeStrong((id *)&self->_draggingSectionController, 0);
  objc_storeStrong((id *)&self->_sectionControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_featureDiscoverySectionController, 0);
  objc_storeStrong((id *)&self->_searchResultsSectionController, 0);
  objc_storeStrong((id *)&self->_recentsSectionController, 0);
  objc_storeStrong((id *)&self->_collectionsSectionController, 0);
  objc_storeStrong((id *)&self->_favoritesSectionController, 0);
  objc_storeStrong((id *)&self->_suggestionsSectionController, 0);
  objc_storeStrong((id *)&self->_sectionControllersToUpdate, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_rootSnapshot, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_libraryCountsDataProvider, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);

  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end