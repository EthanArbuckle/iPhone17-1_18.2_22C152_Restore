@interface SearchHomeDataSource
- (AutocompleteContext)autocompleteContext;
- (BOOL)needsToApplySnapshot;
- (BOOL)needsToResetKeyCommands;
- (BOOL)routePlanning;
- (BOOL)searchAlongRoute;
- (BOOL)shouldRemoveSearchHomeTip;
- (BOOL)shouldShowNoRecentSearchesCell;
- (BOOL)supportsFullTextSearch;
- (NSArray)cachedSnapshotObjects;
- (NSArray)dataFetchers;
- (NSArray)dataProviders;
- (NSArray)layoutProviders;
- (NSIndexPath)lastSelectedIndexPath;
- (SearchHomeAnalyticsManager)analyticsManager;
- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4 isSearchAlongRoute:(BOOL)a5 supportsFullTextSearch:(BOOL)a6;
- (SearchHomeDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4;
- (SearchHomeDataSourceDelegate)searchHomeDataSourceDelegate;
- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource;
- (UICollectionViewLayout)collectionViewLayout;
- (UITableViewDiffableDataSource)tableViewDiffableDataSource;
- (double)heightForFooterInSection:(int64_t)a3 dataProvider:(id)a4;
- (double)heightForHeaderInSection:(int64_t)a3 dataProvider:(id)a4;
- (double)isTouristHereValue;
- (id)_emptySection;
- (id)analyticsSuggestions;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)dataProviderOfType:(int64_t)a3;
- (id)dataProviderWithIdentifier:(id)a3;
- (id)keyCommands;
- (id)layoutProviderForDataProvider:(id)a3;
- (id)newTraits;
- (id)objectsForAnalytics;
- (id)tableView:(id)a3 indexPath:(id)a4 identifier:(id)a5;
- (int64_t)presentationStyle;
- (unint64_t)_ppt_numberOfDataFetchers;
- (void)_applyTableViewSnapshot;
- (void)_hoverGestureRecognizerStateDidChange:(id)a3;
- (void)_ppt_selectBrowseCities;
- (void)_ppt_selectCategoryAtIndex:(unint64_t)a3;
- (void)_ppt_selectExploreGuides;
- (void)_ppt_selectFirstCuratedGuide;
- (void)_ppt_selectFirstGuidePublisher;
- (void)_ppt_selectSeeAllCuratedCollections;
- (void)addKeyCommand:(id)a3;
- (void)addToCollectionObserver;
- (void)applySnapshotWithCompletion:(id)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)contentSizeDidChange:(id)a3;
- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3;
- (void)dealloc;
- (void)didUpdateDataFetcher:(id)a3;
- (void)performDeleteAnimationOnSectionWithIdentifier:(id)a3 itemAtIndex:(unint64_t)a4 dataProvider:(id)a5 animated:(BOOL)a6;
- (void)reloadSectionOfType:(int64_t)a3;
- (void)reorderKeyCommands;
- (void)sendNoTypingACAnalytics;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAutocompleteContext:(id)a3;
- (void)setCachedSnapshotObjects:(id)a3;
- (void)setCollectionViewDiffableDataSource:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setDataFetchers:(id)a3;
- (void)setDataProviders:(id)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setLayoutProviders:(id)a3;
- (void)setNeedsToApplySnapshot:(BOOL)a3;
- (void)setNeedsToResetKeyCommands:(BOOL)a3;
- (void)setNeedsUpdate;
- (void)setRoutePlanning:(BOOL)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchHomeDataSourceDelegate:(id)a3;
- (void)setShouldHideHairLine:(BOOL)a3;
- (void)setShouldRemoveSearchHomeTip:(BOOL)a3;
- (void)setSupportsFullTextSearch:(BOOL)a3;
- (void)setTableViewDiffableDataSource:(id)a3;
- (void)setupTableHeaderView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SearchHomeDataSource

- (SearchHomeDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SearchHomeDataSource;
  v7 = [(DataSource *)&v33 initWithTableView:v6 updateLocation:v4];
  v8 = v7;
  if (v7)
  {
    v7->_routePlanning = 1;
    v7->_supportsFullTextSearch = 0;
    v9 = +[NSMutableArray array];
    v10 = [[SearchHomeDataDownloader alloc] initWithDelegate:v8 isSearchAlongRoute:[(SearchHomeDataSource *)v8 searchAlongRoute]];
    [v9 addObject:v10];
    id v11 = [v9 copy];
    [(SearchHomeDataSource *)v8 setDataFetchers:v11];

    v12 = +[NSMutableArray array];
    v13 = [[SearchHomeBrowseCategoriesLayoutProvider alloc] initWithSearchAlongRoute:[(SearchHomeDataSource *)v8 searchAlongRoute] supportsFullTextSearch:v8->_supportsFullTextSearch];
    [v12 addObject:v13];

    v14 = (NSArray *)[v12 copy];
    layoutProviders = v8->_layoutProviders;
    v8->_layoutProviders = v14;

    [v6 setDelegate:v8];
    [(SearchHomeDataSource *)v8 setupTableHeaderView];
    v16 = self;
    v17 = +[BrowseCategoryTableViewCell identifier];
    [v6 registerClass:v16 forCellReuseIdentifier:v17];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v18 = [(SearchHomeDataSource *)v8 dataFetchers];
    id v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)v21) fetchContent];
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v19);
    }

    objc_initWeak(&location, v8);
    id v22 = objc_alloc((Class)UITableViewDiffableDataSource);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10052A2FC;
    v26[3] = &unk_1012EDE60;
    objc_copyWeak(&v27, &location);
    v23 = (UITableViewDiffableDataSource *)[v22 initWithTableView:v6 cellProvider:v26];
    tableViewDiffableDataSource = v8->_tableViewDiffableDataSource;
    v8->_tableViewDiffableDataSource = v23;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  return [(SearchHomeDataSource *)self initWithCollectionView:a3 updateLocation:a4 isSearchAlongRoute:0 supportsFullTextSearch:0];
}

- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4 isSearchAlongRoute:(BOOL)a5 supportsFullTextSearch:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v82.receiver = self;
  v82.super_class = (Class)SearchHomeDataSource;
  id v11 = [(DataSource *)&v82 initWithCollectionView:v10 updateLocation:v8];
  v12 = v11;
  if (v11)
  {
    [(SearchHomeDataSource *)v11 setSearchAlongRoute:v7];
    [(SearchHomeDataSource *)v12 setSupportsFullTextSearch:v6];
    v13 = +[NSMutableArray array];
    v14 = +[MapsOfflineUIHelper sharedHelper];
    v12->_isUsingOfflineMaps = [v14 isUsingOfflineMaps];

    if (![(SearchHomeDataSource *)v12 searchAlongRoute])
    {
      if (MapsFeature_IsEnabled_MapsWally() && (GEOConfigGetBOOL() & 1) == 0 && !v12->_isUsingOfflineMaps)
      {
        v15 = sub_100576A04();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SearchHome will show tip.", buf, 2u);
        }

        v16 = [[SearchHomeTipDataFetcher alloc] initWithDelegate:v12 isSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute]];
        [v13 addObject:v16];
      }
      v17 = [[SearchHomeRecentSearchesDataFetcher alloc] initWithDelegate:v12 isSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute]];
      [v13 addObject:v17];
    }
    if (v12->_isUsingOfflineMaps
      && ![(SearchHomeDataSource *)v12 searchAlongRoute]
      && ![(SearchHomeDataSource *)v12 supportsFullTextSearch])
    {
      v18 = [[_TtC4Maps31SearchHomeUserGuidesDataFetcher alloc] initWithDelegate:v12 isSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute]];
      [v13 addObject:v18];
    }
    id v19 = [[SearchHomeDataDownloader alloc] initWithDelegate:v12 isSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute]];
    [(SearchHomeDataDownloader *)v19 setSupportsFullTextSearch:[(SearchHomeDataSource *)v12 supportsFullTextSearch]];
    v68 = v19;
    [v13 addObject:v19];
    uint64_t v20 = [[SearchHomeNoDataDataFetcher alloc] initWithDelegate:v12 isSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute]];
    [v13 addObject:v20];

    v21 = (NSArray *)[v13 copy];
    dataFetchers = v12->_dataFetchers;
    v12->_dataFetchers = v21;

    v23 = +[NSMutableArray array];
    v24 = objc_alloc_init(SearchHomeNoDataLayoutProvider);
    [v23 addObject:v24];

    if (![(SearchHomeDataSource *)v12 searchAlongRoute])
    {
      if (MapsFeature_IsEnabled_MapsWally() && (GEOConfigGetBOOL() & 1) == 0 && !v12->_isUsingOfflineMaps)
      {
        v25 = objc_alloc_init(SearchHomeTipLayoutProvider);
        [v23 addObject:v25];
      }
      v26 = [v10 traitCollection];
      id v27 = [v26 userInterfaceIdiom];

      v28 = off_1012D3C90;
      if (v27 != (id)5) {
        v28 = off_1012D4580;
      }
      id v29 = objc_alloc_init(*v28);
      [v23 addObject:v29];
    }
    long long v30 = [[SearchHomeBrowseCategoriesLayoutProvider alloc] initWithSearchAlongRoute:[(SearchHomeDataSource *)v12 searchAlongRoute] supportsFullTextSearch:v12->_supportsFullTextSearch];
    [v23 addObject:v30];

    if (v12->_isUsingOfflineMaps
      && ![(SearchHomeDataSource *)v12 searchAlongRoute]
      && ![(SearchHomeDataSource *)v12 supportsFullTextSearch])
    {
      long long v31 = objc_alloc_init(_TtC4Maps34SearchHomeUserGuidesLayoutProvider);
      [v23 addObject:v31];
    }
    v69 = v13;
    if (![(SearchHomeDataSource *)v12 searchAlongRoute])
    {
      long long v32 = [[SearchHomeCuratedCollectionsLayoutProvider alloc] initWithTraitEnvironment:v10];
      [v23 addObject:v32];

      objc_super v33 = objc_alloc_init(SearchHomePublishersLayoutProvider);
      [v23 addObject:v33];

      if (MapsFeature_IsEnabled_Maps269())
      {
        if (sub_1000BBB44(v10) != 5)
        {
          v34 = [[SearchHomeCitiesLayoutProvider alloc] initWithTraitEnvironment:v10];
          [v23 addObject:v34];
        }
      }
    }
    v35 = [v23 copy];
    layoutProviders = v12->_layoutProviders;
    v12->_layoutProviders = v35;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v70 = v12;
    obj = v12->_layoutProviders;
    id v37 = [(NSArray *)obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v72 = *(void *)v78;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v78 != v72) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          v41 = [v40 cellClasses];
          id v42 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v74;
            do
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v74 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v46 = *(void *)(*((void *)&v73 + 1) + 8 * (void)j);
                v47 = [v40 cellReuseIdentifier];
                [v10 registerClass:v46 forCellWithReuseIdentifier:v47];
              }
              id v43 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
            }
            while (v43);
          }
        }
        id v38 = [(NSArray *)obj countByEnumeratingWithState:&v77 objects:v84 count:16];
      }
      while (v38);
    }

    uint64_t v48 = objc_opt_class();
    v49 = +[SectionHeaderCollectionReusableView reuseIdentifier];
    [v10 registerClass:v48 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v49];

    uint64_t v50 = objc_opt_class();
    v51 = +[SectionFooterCollectionReusableView reuseIdentifier];
    [v10 registerClass:v50 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v51];

    v12 = v70;
    if (MapsFeature_IsEnabled_Maps269()
      && sub_1000BBB44(v10) != 5
      && ![(SearchHomeDataSource *)v70 searchAlongRoute])
    {
      uint64_t v52 = objc_opt_class();
      v53 = +[MKExploreGuidesReusableView reuseIdentifier];
      [v10 registerClass:v52 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v53];
    }
    uint64_t v54 = objc_opt_class();
    v55 = +[ActionButtonCollectionReusableView reuseIdentifier];
    [v10 registerClass:v54 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v55];

    id v56 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v57 = [(DataSource *)v70 collectionView];
    v58 = sub_10001CBB8(v70);
    v59 = (UICollectionViewDiffableDataSource *)[v56 initWithCollectionView:v57 cellProvider:v58];
    collectionViewDiffableDataSource = v70->_collectionViewDiffableDataSource;
    v70->_collectionViewDiffableDataSource = v59;

    v61 = sub_1005B38D0(v70);
    [(UICollectionViewDiffableDataSource *)v70->_collectionViewDiffableDataSource setSupplementaryViewProvider:v61];

    if (sub_1000BBB44(v10) == 5)
    {
      id v62 = [objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v70 action:"_hoverGestureRecognizerStateDidChange:"];
      [v10 addGestureRecognizer:v62];
    }
    else
    {
      id v62 = +[NSNotificationCenter defaultCenter];
      [v62 addObserver:v70 selector:"contentSizeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
    }

    v63 = [[SearchHomeAnalyticsManager alloc] initWithSearchAlongRoute:[(SearchHomeDataSource *)v70 searchAlongRoute]];
    analyticsManager = v70->_analyticsManager;
    v70->_analyticsManager = v63;

    if (![(SearchHomeDataSource *)v70 searchAlongRoute])
    {
      v65 = +[CuratedCollectionSyncManager sharedManager];
      [v65 addObserver:v70];
    }
  }

  return v12;
}

- (void)dealloc
{
  v3 = +[CuratedCollectionSyncManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchHomeDataSource;
  [(SearchHomeDataSource *)&v4 dealloc];
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v13 = a4;
  BOOL v6 = [(DataSource *)self collectionView];
  uint64_t v7 = sub_1000BBB44(v6);

  if (v7 == 5)
  {
    BOOL v8 = [(DataSource *)self collectionView];
    [v8 deselectItemAtIndexPath:self->_lastSelectedIndexPath animated:0];

    v9 = [(DataSource *)self collectionView];
    id v10 = [v13 nextFocusedIndexPath];
    [v9 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];

    id v11 = [v13 nextFocusedIndexPath];
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = v11;
  }
}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  id v22 = a3;
  if (objc_msgSend(v22, "_maps_isHovering"))
  {
    objc_super v4 = [(DataSource *)self collectionView];
    [v22 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    v9 = [(DataSource *)self collectionView];
    id v10 = [v9 indexPathForItemAtPoint:v6, v8];

    id v11 = [(DataSource *)self collectionView];
    v12 = [v11 cellForItemAtIndexPath:v10];

    if (v12 && ([v12 frame], v24.x = v6, v24.y = v8, CGRectContainsPoint(v25, v24)))
    {
      if (v10)
      {
        if ([v10 isEqual:self->_lastSelectedIndexPath])
        {
          id v13 = 0;
LABEL_13:
          v18 = [(DataSource *)self collectionView];
          [v18 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v10);
          if (v12) {
            [v12 canBecomeFirstResponder];
          }
          [v12 becomeFirstResponder];
LABEL_16:

          if (!v13) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        char v16 = 0;
LABEL_12:
        id v13 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if (v16) {
          goto LABEL_16;
        }
        goto LABEL_13;
      }
    }
    else
    {

      id v10 = 0;
    }
    char v16 = 1;
    goto LABEL_12;
  }
  if ([v22 state] == (id)3)
  {
    v14 = self->_lastSelectedIndexPath;
    if (v14)
    {
      id v13 = v14;
      v15 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_17:
      id v19 = [(DataSource *)self collectionView];
      uint64_t v20 = [v19 cellForItemAtIndexPath:v13];

      [v20 resignFirstResponder];
      v21 = [(DataSource *)self collectionView];
      [v21 deselectItemAtIndexPath:v13 animated:0];
    }
  }
LABEL_18:
}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SearchHomeDataSource;
  -[DataSource setActive:](&v17, "setActive:");
  if (v3)
  {
    double v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"PPTTest_SearchHome_DidSetActive" object:self];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = [(SearchHomeDataSource *)self dataFetchers];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) fetchContent];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    [(SearchHomeDataSource *)self setNeedsUpdate];
  }
  else if (MapsFeature_IsEnabled_MapsWally() && (GEOConfigGetBOOL() & 1) == 0)
  {
    id v11 = sub_100109E50();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Data source marked inactive. Will not show SearchHome tip again.", v12, 2u);
    }

    [(SearchHomeDataSource *)self setShouldRemoveSearchHomeTip:1];
  }
}

- (void)setShouldRemoveSearchHomeTip:(BOOL)a3
{
  self->_shouldRemoveSearchHomeTip = a3;
  if (a3)
  {
    BOOL v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting SearchTip value to YES", v4, 2u);
    }

    GEOConfigSetBOOL();
  }
}

- (BOOL)shouldShowNoRecentSearchesCell
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v3 = [(SearchHomeDataSource *)self dataFetchers];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(v3);
      }
      if (![*(id *)(*((void *)&v21 + 1) + 8 * v7) isFetchingDataComplete]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v3 = [(SearchHomeDataSource *)self dataProviders];
    id v8 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (!v8)
    {
      BOOL v15 = 1;
      goto LABEL_20;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v3);
      }
      v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if ([v12 type])
      {
        long long v13 = [v12 objects];
        id v14 = [v13 count];

        if (v14) {
          break;
        }
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        BOOL v15 = 1;
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_20;
      }
    }
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (void)setNeedsUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10052B498;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_applyTableViewSnapshot
{
  if (self->_tableViewDiffableDataSource)
  {
    uint64_t v24 = 160;
    BOOL v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CGRect v25 = self;
    id v5 = [(SearchHomeDataSource *)self dataProviders];
    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v11 = [v10 identifier:v24];
          v12 = [v10 objects];
          id v13 = [v12 copy];

          if ([v13 count]) {
            BOOL v14 = v11 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
            long long v16 = sub_100576A04();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)long long v31 = v11;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "The section identifier - %@ and there are no objects to reload.", buf, 0xCu);
            }
          }
          else
          {
            v36 = v11;
            BOOL v15 = +[NSArray arrayWithObjects:&v36 count:1];
            [v4 appendSectionsWithIdentifiers:v15];

            [v4 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v11];
            v34 = v11;
            id v35 = v13;
            long long v16 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            [v3 addObject:v16];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v7);
    }

    long long v17 = sub_100576A04();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = [(SearchHomeDataSource *)v25 dataProviders];
      long long v19 = [(SearchHomeDataSource *)v25 layoutProviders];
      *(_DWORD *)buf = 138412802;
      *(void *)long long v31 = v4;
      *(_WORD *)&v31[8] = 2112;
      *(void *)long long v32 = v18;
      *(_WORD *)&v32[8] = 2112;
      objc_super v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The table view snapshot - (%@) will be applied, Data Providers : %@, Layout providers : %@", buf, 0x20u);
    }
    [*(id *)((char *)&v25->super.super.isa + v24) applySnapshotUsingReloadData:v4];
    goto LABEL_21;
  }
  BOOL v3 = sub_100576A04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v20 = [v4 isUsingOfflineMaps];
    BOOL supportsFullTextSearch = self->_supportsFullTextSearch;
    long long v22 = [(DataSource *)self tableView];
    long long v23 = [v22 dataSource];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)long long v31 = v20;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = supportsFullTextSearch;
    *(_WORD *)long long v32 = 2112;
    *(void *)&v32[2] = v23;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "The _tableViewDiffableDataSource is nil but the user is trying to add a stop in Route planning, The Maps Offline status: %d, Full text support: %d, Table view datasource: %@", buf, 0x18u);

LABEL_21:
  }
}

- (void)applySnapshotWithCompletion:(id)a3
{
  v34 = (void (**)(void))a3;
  id v4 = sub_10052C018();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = sub_10052C018();
  id v7 = v6;
  unint64_t v33 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SearchHomeApplyingSnapshot", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  id v35 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [(SearchHomeDataSource *)self dataProviders];
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v15 = [v14 identifier];
        if (v15)
        {
          long long v16 = [v14 objects];
          long long v17 = [v16 copy];

          if (![v14 type])
          {
            if (![(SearchHomeDataSource *)self shouldShowNoRecentSearchesCell]) {
              goto LABEL_20;
            }
            v51 = v15;
            unsigned int v20 = +[NSArray arrayWithObjects:&v51 count:1];
            [v8 appendSectionsWithIdentifiers:v20];

            long long v21 = [v14 objects];
            [v8 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v15];

            v49 = v15;
            long long v19 = [v14 objects];
            uint64_t v50 = v19;
            long long v22 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            [v35 addObject:v22];

            goto LABEL_19;
          }
          if (([v14 type] != (id)6
             || ![(SearchHomeDataSource *)self shouldRemoveSearchHomeTip])
            && [v17 count])
          {
            uint64_t v48 = v15;
            long long v18 = +[NSArray arrayWithObjects:&v48 count:1];
            [v8 appendSectionsWithIdentifiers:v18];

            [v8 appendItemsWithIdentifiers:v17 intoSectionWithIdentifier:v15];
            uint64_t v46 = v15;
            v47 = v17;
            long long v19 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            [v35 addObject:v19];
LABEL_19:
          }
        }
        else
        {
          long long v17 = sub_100576A04();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The section identifier - %@ is nil while applying the snapshot.", buf, 0xCu);
          }
        }
LABEL_20:
      }
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v11);
  }

  id v23 = [v35 copy];
  uint64_t v24 = [(SearchHomeDataSource *)self cachedSnapshotObjects];
  unsigned __int8 v25 = [v23 isEqualToArray:v24];

  if ((v25 & 1) == 0)
  {
    [(SearchHomeDataSource *)self setCachedSnapshotObjects:v23];
    long long v26 = sub_100576A04();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      long long v27 = [(SearchHomeDataSource *)self dataProviders];
      long long v28 = [(SearchHomeDataSource *)self layoutProviders];
      *(_DWORD *)buf = 138412802;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v27;
      __int16 v44 = 2112;
      v45 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "The snapshot - (%@) will be applied, Data Providers : %@, Layout providers : %@", buf, 0x20u);
    }
    long long v29 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
    [v29 applySnapshotUsingReloadData:v8];
  }
  v34[2](v34);
  long long v30 = sub_10052C018();
  long long v31 = v30;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, spid, "SearchHomeApplyingSnapshot", "", buf, 2u);
  }
}

- (void)contentSizeDidChange:(id)a3
{
}

- (void)didUpdateDataFetcher:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = sub_10052C018();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = sub_10052C018();
  id v8 = v7;
  unint64_t v46 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UpdateDataFetcher", "", buf, 2u);
  }

  id v9 = +[NSMutableArray array];
  v47 = v4;
  os_signpost_id_t spid = v6;
  if (!self->_isUsingOfflineMaps
    || [(SearchHomeDataSource *)self searchAlongRoute]
    || [(SearchHomeDataSource *)self supportsFullTextSearch])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v10 = [(SearchHomeDataSource *)self dataFetchers];
    id v11 = [v10 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v57;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          long long v16 = [v15 dataProviders];

          if (v16)
          {
            long long v17 = [v15 dataProviders];
            [v9 addObjectsFromArray:v17];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v18 = [(SearchHomeDataSource *)self dataFetchers];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10052C5F4;
    v62[3] = &unk_1012EDCB0;
    id v19 = v9;
    id v63 = v19;
    [v18 enumerateObjectsUsingBlock:v62];

    unsigned int v20 = [(SearchHomeDataSource *)self dataFetchers];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10052C690;
    v60[3] = &unk_1012EDCB0;
    id v61 = v19;
    [v20 enumerateObjectsUsingBlock:v60];

    id v10 = v63;
  }

  id v21 = [v9 copy];
  [(SearchHomeDataSource *)self setDataProviders:v21];

  [(SearchHomeDataSource *)self setNeedsUpdate];
  long long v22 = +[NSMutableArray array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v23 = [(SearchHomeDataSource *)self dataProviders];
  id v24 = [v23 countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v53;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector())
        {
          long long v29 = [v28 objectsForAnalytics];
          if ([v29 count]) {
            [v22 addObjectsFromArray:v29];
          }
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v52 objects:v66 count:16];
    }
    while (v25);
  }

  long long v30 = (NSArray *)[v22 copy];
  objectsForAnalytics = self->_objectsForAnalytics;
  self->_objectsForAnalytics = v30;

  long long v32 = [[AutocompleteContext alloc] initWithQueryString:&stru_101324E70];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v33 = v22;
  id v34 = [v33 countByEnumeratingWithState:&v48 objects:v65 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v49;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v49 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v48 + 1) + 8 * (void)k);
        long long v39 = +[AutocompleteMatchInfo matchInfoWithType:0];
        [(AutocompleteContext *)v32 setMatchInfo:v39 forObject:v38];
      }
      id v35 = [v33 countByEnumeratingWithState:&v48 objects:v65 count:16];
    }
    while (v35);
  }

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = v32;
  id v41 = v32;

  __int16 v42 = +[NSNotificationCenter defaultCenter];

  [v42 postNotificationName:@"PPTTest_SearchHome_DidUpdateDataFetcher" object:v47];
  id v43 = sub_10052C018();
  __int16 v44 = v43;
  if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, spid, "UpdateDataFetcher", "", buf, 2u);
  }
}

- (id)newTraits
{
  v2 = [(SearchHomeDataSource *)self searchHomeDataSourceDelegate];
  id v3 = [v2 newTraits];

  return v3;
}

- (double)isTouristHereValue
{
  v2 = [(SearchHomeDataSource *)self searchHomeDataSourceDelegate];
  [v2 isTouristHereValue];
  double v4 = v3;

  return v4;
}

- (void)reloadSectionOfType:(int64_t)a3
{
  double v4 = [(SearchHomeDataSource *)self dataProviderOfType:a3];
  os_signpost_id_t v5 = [v4 identifier];

  os_signpost_id_t v6 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  id v7 = [v6 snapshot];

  if ([v5 length])
  {
    id v8 = [v7 sectionIdentifiers];
    unsigned __int8 v9 = [v8 containsObject:v5];

    id v10 = sub_100576A04();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Reloading section: %@", buf, 0xCu);
      }

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = [(SearchHomeDataSource *)self dataProviders];
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            long long v18 = [v17 identifier];
            unsigned int v19 = [v18 isEqualToString:v5];

            if (v19)
            {
              uint64_t v26 = v5;
              unsigned int v20 = +[NSArray arrayWithObjects:&v26 count:1];
              [v7 deleteItemsWithIdentifiers:v20];
              id v21 = [v17 objects];
              [v7 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v5];

              goto LABEL_17;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      id v11 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
      [v11 applySnapshot:v7 animatingDifferences:0];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to reload snapshot section named: %@ as it is not in the snapshot.", buf, 0xCu);
    }
  }
}

- (id)layoutProviderForDataProvider:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  os_signpost_id_t v5 = [(SearchHomeDataSource *)self layoutProviders];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 type];
        if (v10 == [v4 type])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dataProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  os_signpost_id_t v5 = [(SearchHomeDataSource *)self dataProviders];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dataProviderOfType:(int64_t)a3
{
  uint64_t v8 = 0;
  unsigned __int8 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unsigned __int8 v11 = sub_100103CBC;
  long long v12 = sub_1001046E8;
  id v13 = 0;
  id v4 = [(SearchHomeDataSource *)self dataProviders];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10052CE0C;
  v7[3] = &unk_1012EDCD8;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_emptySection
{
  v2 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  double v3 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  id v4 = +[NSCollectionLayoutSize sizeWithWidthDimension:v2 heightDimension:v3];

  id v5 = +[NSCollectionLayoutItem itemWithLayoutSize:v4];
  id v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  uint64_t v7 = +[NSCollectionLayoutDimension estimatedDimension:1.0];
  uint64_t v8 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v7];

  unsigned __int8 v9 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v8 repeatingSubitem:v5 count:1];
  uint64_t v10 = +[NSCollectionLayoutSection sectionWithGroup:v9];

  return v10;
}

- (UICollectionViewLayout)collectionViewLayout
{
  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10052D0E0;
    v8[3] = &unk_1012EBEE0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    id v5 = (UICollectionViewLayout *)[v4 initWithSectionProvider:v8];
    id v6 = self->_collectionViewLayout;
    self->_collectionViewLayout = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    collectionViewLayout = self->_collectionViewLayout;
  }

  return collectionViewLayout;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  long long v12 = [v11 snapshot];

  id v13 = [v12 sectionIdentifiers];
  if ([v13 count])
  {
    id v14 = [v9 section];
    long long v15 = [v12 sectionIdentifiers];
    id v16 = [v15 count];

    if (v14 < v16)
    {
      long long v17 = [v12 sectionIdentifiers];
      long long v18 = [v17 objectAtIndex:[v9 section]];

      unsigned int v19 = [(SearchHomeDataSource *)self dataProviderWithIdentifier:v18];
      id v20 = v10;
      if (objc_opt_respondsToSelector())
      {
        id v21 = [v19 viewModels];
        id v22 = [v21 count];

        if (v22)
        {
          long long v23 = [v19 viewModels];
          id v24 = [v9 row];
          if (v24 >= [v23 count])
          {
            long long v29 = sub_100109E50();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              long long v32 = v18;
              __int16 v33 = 2112;
              id v34 = v9;
              __int16 v35 = 2112;
              uint64_t v36 = v12;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error fetching SearchHome cell for section: %@, indexpath:%@, snapshot: %@", buf, 0x20u);
            }

            long long v27 = 0;
            goto LABEL_8;
          }
          long long v25 = [v19 viewModels];
          uint64_t v30 = [v25 objectAtIndex:[v9 row]];

          id v20 = (id)v30;
        }
      }
      uint64_t v26 = [(SearchHomeDataSource *)self layoutProviderForDataProvider:v19];
      long long v27 = [v26 cellForRowAtIndexPath:v9 collectionView:v8 item:v20];

LABEL_8:
      goto LABEL_13;
    }
  }
  else
  {
  }
  long long v18 = sub_100109E50();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    long long v32 = v9;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error fetching SearchHome section at indexpath: %@, snapshot: %@", buf, 0x16u);
  }
  long long v27 = 0;
LABEL_13:

  return v27;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  unsigned __int8 v11 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  long long v12 = [v11 snapshot];

  id v13 = [v12 sectionIdentifiers];
  id v14 = [v13 objectAtIndex:[v10 section]];

  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_100103CBC;
  v66 = sub_1001046E8;
  id v67 = [(SearchHomeDataSource *)self dataProviderWithIdentifier:v14];
  long long v15 = [(DataSource *)self collectionView];
  if (sub_1000BBB44(v15) == 5
    && [(id)v63[5] conformsToProtocol:&OBJC_PROTOCOL___SearchHomeDataProviderDeletable])
  {
    id v16 = UICollectionElementKindSectionFooter;

    if (UICollectionElementKindSectionFooter == v9)
    {
      id v17 = (id)v63[5];
      if ([v17 entriesState] == (id)1)
      {
        id v18 = 0;
      }
      else
      {
        v40 = +[SectionFooterCollectionReusableView reuseIdentifier];
        id v41 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v40 forIndexPath:v10];

        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_10052E9B4;
        v59[3] = &unk_1012E67C0;
        id v18 = v41;
        id v60 = v18;
        id v61 = &v62;
        +[UIView performWithoutAnimation:v59];
        [v18 setNeedsLayout];
        [v18 layoutIfNeeded];
      }
      goto LABEL_29;
    }
  }
  else
  {

    id v16 = UICollectionElementKindSectionFooter;
  }
  if (-[NSString isEqualToString:](v9, "isEqualToString:", v16) && [(id)v63[5] type] == (id)3)
  {
    id v48 = (id)v63[5];
    if (MapsFeature_IsEnabled_Maps269()
      && ([v48 exploreGuides], (unsigned int v19 = objc_claimAutoreleasedReturnValue()) != 0)
      && (BOOL v20 = sub_1000BBB44(v8) == 5, v19, !v20))
    {
      id v43 = +[MKExploreGuidesReusableView reuseIdentifier];
      id v18 = [v8 dequeueReusableSupplementaryViewOfKind:v16 withReuseIdentifier:v43 forIndexPath:v10];

      __int16 v44 = +[MKExploreGuidesReusableView reuseIdentifier];
      [v18 setAccessibilityLabel:v44];

      objc_initWeak((id *)location, self);
      v45 = [v48 exploreGuides];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10052EAEC;
      v57[3] = &unk_1012EDDC8;
      objc_copyWeak(&v58, (id *)location);
      [v18 configureWithExploreGuides:v45 tapHandler:v57];

      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v21 = +[NSBundle mainBundle];
      uint64_t v46 = [v21 localizedStringForKey:@"[Search Home] See All Guides" value:@"localized string not found" table:0];

      id v22 = +[ActionButtonCollectionReusableView reuseIdentifier];
      id v18 = [v8 dequeueReusableSupplementaryViewOfKind:v16 withReuseIdentifier:v22 forIndexPath:v10];

      long long v23 = +[ActionButtonCollectionReusableView reuseIdentifier];
      [v18 setAccessibilityIdentifier:v23];

      id v24 = [objc_alloc((Class)MKPlaceCollectionsSizeController) initWithDefaultCollectionsConfigurationUsingTraitCollections:v8 inContext:3];
      long long v25 = [(DataSource *)self collectionView];
      BOOL v26 = [v25 effectiveUserInterfaceLayoutDirection] == (id)1;

      [v24 sectionInsets];
      if (v26)
      {
        [v18 setLeadingPadding:v28];
        [v24 sectionInsets];
        double v30 = v29;
      }
      else
      {
        [v18 setLeadingPadding:v27];
        [v24 sectionInsets];
        double v30 = v39;
      }
      [v18 setTrailingPadding:v30, v46];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10052EB84;
      v56[3] = &unk_1012E5D08;
      v56[4] = self;
      [v18 setTitle:v47 completion:v56];
    }
  }
  else
  {
    long long v31 = [(id)v63[5] objects];
    if ([v31 count])
    {
      BOOL v32 = [(id)v63[5] type] == 0;

      if (!v32)
      {
        __int16 v33 = +[SectionHeaderCollectionReusableView reuseIdentifier];
        id v34 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v33 forIndexPath:v10];

        objc_initWeak((id *)location, self);
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10052EBEC;
        v49[3] = &unk_1012EDDF0;
        id v35 = v34;
        id v50 = v35;
        long long v54 = &v62;
        id v51 = v8;
        id v52 = v10;
        objc_copyWeak(&v55, (id *)location);
        long long v53 = self;
        +[UIView performWithoutAnimation:v49];
        id v18 = v35;
        objc_destroyWeak(&v55);

        objc_destroyWeak((id *)location);
        goto LABEL_29;
      }
    }
    else
    {
    }
    uint64_t v36 = sub_100109E50();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v63[5];
      *(_DWORD *)id location = 138413058;
      *(void *)&location[4] = v9;
      __int16 v69 = 2112;
      v70 = v14;
      __int16 v71 = 2112;
      uint64_t v72 = v12;
      __int16 v73 = 2112;
      uint64_t v74 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Unable to create a Supplementary View of kind : %@. Section Identifier: %@. Snapshot: %@. Data provider: %@", location, 0x2Au);
    }

    if ([(NSString *)v9 isEqualToString:v16])
    {
      uint64_t v38 = +[SectionFooterCollectionReusableView reuseIdentifier];
      [v8 dequeueReusableSupplementaryViewOfKind:v16 withReuseIdentifier:v38 forIndexPath:v10];
    }
    else
    {
      uint64_t v38 = +[SectionHeaderCollectionReusableView reuseIdentifier];
      [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v38 forIndexPath:v10];
    }
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    [v18 setAlpha:0.0];
  }
LABEL_29:
  _Block_object_dispose(&v62, 8);

  return v18;
}

- (double)heightForHeaderInSection:(int64_t)a3 dataProvider:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 objects];
  if (![v7 count])
  {
    double v10 = 0.0;
LABEL_9:

    goto LABEL_10;
  }
  id v8 = [v6 type];

  if (v8)
  {
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___SearchHomeDataProviderDeletable])
    {
      id v9 = +[NSBundle mainBundle];
      uint64_t v7 = [v9 localizedStringForKey:@"Clear [No Query State]" value:@"localized string not found" table:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
    unsigned __int8 v11 = [(DataSource *)self collectionView];
    BOOL v12 = [v11 _maps_indexOfFirstNonEmptySection] == a3;

    id v13 = [v6 title];
    id v14 = [(DataSource *)self collectionView];
    [v14 bounds];
    double Width = CGRectGetWidth(v20);
    id v16 = [(DataSource *)self collectionView];
    id v17 = [v16 traitCollection];
    +[SectionHeaderCollectionReusableView heightWhenFirstNonEmptySection:v12 title:v13 actionTitle:v7 availableWidth:v17 traitCollection:Width];
    double v10 = v18;

    goto LABEL_9;
  }
  double v10 = 0.0;
LABEL_10:

  return v10;
}

- (double)heightForFooterInSection:(int64_t)a3 dataProvider:(id)a4
{
  id v5 = a4;
  id v6 = [(DataSource *)self collectionView];
  if (sub_1000BBB44(v6) == 5)
  {
    id v7 = [v5 type];

    if (v7 == (id)1 && ![v5 entriesState])
    {
      id v8 = [(DataSource *)self collectionView];
      id v9 = [v8 traitCollection];
      +[SectionFooterCollectionReusableView heightForFooterViewWithTraitCollection:v9];
      double v11 = v10;

      goto LABEL_11;
    }
  }
  else
  {
  }
  if ([v5 type] == (id)3
    || (double v11 = 0.0, MapsFeature_IsEnabled_Maps269())
    && [v5 type] == (id)5
    && ([(DataSource *)self collectionView],
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = sub_1000BBB44(v13),
        v13,
        v14 != 5))
  {
    +[ActionButtonCollectionReusableView estimatedHeight];
    double v11 = v12;
  }
LABEL_11:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  id v8 = [v7 snapshot];

  id v9 = [v8 sectionIdentifiers];
  double v10 = [v9 objectAtIndex:[v6 section]];

  double v11 = [(SearchHomeDataSource *)self dataProviderWithIdentifier:v10];
  switch((unint64_t)[v11 type])
  {
    case 1uLL:
      double v12 = [v11 objects];
      id v13 = [v12 objectAtIndex:[v6 row]];

      uint64_t v14 = [(DataSource *)self delegate];
      [v14 dataSource:self itemTapped:v13];

      long long v15 = [(SearchHomeDataSource *)self analyticsManager];
      id v16 = [v6 row];
      id v17 = [(SearchHomeDataSource *)self analyticsSuggestions];
      [v15 recentTappedAtIndex:v16 visibleSuggestions:v17];

      break;
    case 2uLL:
      double v18 = [v11 objects];
      unsigned int v19 = [v18 objectAtIndex:[v6 row]];

      CGRect v20 = [(DataSource *)self delegate];
      id v21 = [v19 category];
      [v20 dataSource:self itemTapped:v21];

      id v22 = [(SearchHomeDataSource *)self analyticsManager];
      long long v23 = [v19 name];
      [v22 browseCategoryTapped:v23];
      goto LABEL_7;
    case 3uLL:
      id v24 = [v11 objects];
      unsigned int v19 = [v24 objectAtIndex:[v6 row]];

      long long v25 = [(DataSource *)self delegate];
      [v25 dataSource:self itemTapped:v19];

      id v26 = [v11 itemIsSaved:v19];
      id v22 = [(SearchHomeDataSource *)self analyticsManager];
      double v27 = [v19 collectionIdentifier];
      [v22 curatedCollectionsTappedWithMuid:[v27 muid] horizontalIndex:[v6 row] isCurrentlySaved:v26];

      goto LABEL_8;
    case 4uLL:
      double v28 = [v11 objects];
      unsigned int v19 = [v28 objectAtIndex:[v6 row]];

      double v29 = [(DataSource *)self delegate];
      [v29 dataSource:self itemTapped:v19];

      id v22 = [(SearchHomeDataSource *)self analyticsManager];
      long long v23 = [v19 identifier];
      [v22 publisherTappedWithMuid:[v23 muid] verticalIndex:[v6 row]];
      goto LABEL_7;
    case 5uLL:
      double v30 = [v11 objects];
      unsigned int v19 = [v30 objectAtIndex:[v6 row]];

      long long v31 = [(DataSource *)self delegate];
      [v31 dataSource:self itemTapped:v19];

      id v22 = [(SearchHomeDataSource *)self analyticsManager];
      long long v23 = [v19 guideLocationIdentifier];
      [v22 guideLocationTappedWithMuid:[v23 muid] horizontalIndex:[v6 row]];
LABEL_7:

LABEL_8:
      goto LABEL_9;
    case 6uLL:
      if (MapsFeature_IsEnabled_MapsWally() && (GEOConfigGetBOOL() & 1) == 0)
      {
        BOOL v32 = sub_100576A04();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Removing SearchHome Tip.", v40, 2u);
        }

        GEOConfigSetBOOL();
        [(SearchHomeDataSource *)self setShouldRemoveSearchHomeTip:1];
        [(SearchHomeDataSource *)self setNeedsUpdate];
      }
      break;
    case 7uLL:
      __int16 v33 = [v11 objects];
      unsigned int v19 = [v33 objectAtIndex:[v6 row]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v34 = v19;
        id v35 = [(DataSource *)self delegate];
        uint64_t v36 = [v34 collections];
        [v35 dataSource:self itemTapped:v36];

        uint64_t v37 = [v34 collections];
        uint64_t v38 = [v37 identifier];
        unsigned int v39 = [v38 isEqualToString:@"__internal_CollectionPlaceholderIdentifier"];

        if (v39) {
          [(SearchHomeDataSource *)self addToCollectionObserver];
        }
      }
LABEL_9:

      break;
    default:
      break;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(SearchHomeDataSource *)self tableViewDiffableDataSource];
  id v15 = [v7 snapshot];

  id v8 = [v15 sectionIdentifiers];
  id v9 = [v8 objectAtIndex:[v6 section]];

  double v10 = [(SearchHomeDataSource *)self dataProviderWithIdentifier:v9];
  double v11 = [v10 objects];
  id v12 = [v6 row];

  id v13 = [v11 objectAtIndex:v12];

  uint64_t v14 = [(DataSource *)self delegate];
  [v14 dataSource:self itemTapped:v13];
}

- (void)performDeleteAnimationOnSectionWithIdentifier:(id)a3 itemAtIndex:(unint64_t)a4 dataProvider:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  double v10 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  double v11 = [v10 snapshot];

  if ([v11 numberOfItemsInSection:v9] == (id)1)
  {
    id v17 = v9;
    id v12 = +[NSArray arrayWithObjects:&v17 count:1];
    [v11 deleteSectionsWithIdentifiers:v12];
  }
  else
  {
    id v12 = [v11 itemIdentifiersInSectionWithIdentifier:v9];
    id v13 = [v12 objectAtIndex:a4];
    id v16 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v16 count:1];
    [v11 deleteItemsWithIdentifiers:v14];
  }
  id v15 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
  [v15 applySnapshot:v11 animatingDifferences:v6];
}

- (void)addKeyCommand:(id)a3
{
  id v12 = a3;
  if ([(SearchHomeDataSource *)self needsToResetKeyCommands])
  {
    keyCommands = self->_keyCommands;
    self->_keyCommands = (NSArray *)&__NSArray0__struct;

    [(SearchHomeDataSource *)self setNeedsToResetKeyCommands:0];
  }
  id v5 = self->_keyCommands;
  if ([(NSArray *)v5 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSArray *)v5 objectAtIndexedSubscript:v6];
      id v8 = [v7 action];
      id v9 = [v12 action];

      if (v8 == v9) {
        break;
      }
      if (++v6 >= [(NSArray *)v5 count]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    double v10 = [(NSArray *)v5 arrayByAddingObject:v12];
    double v11 = self->_keyCommands;
    self->_keyCommands = v10;
  }
}

- (void)reorderKeyCommands
{
  id v3 = objc_alloc((Class)NSMutableArray);
  NSUInteger v4 = [(NSArray *)self->_keyCommands count];
  id v5 = v3;
  uint64_t v6 = self;
  id v31 = [v5 initWithCapacity:v4];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_keyCommands, "count")];
  if ([(NSArray *)v6->_keyCommands count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [(NSArray *)v6->_keyCommands objectAtIndexedSubscript:v8];
      double v10 = [v9 propertyList];
      double v11 = [v10 objectForKeyedSubscript:@"section"];
      id v12 = [v11 unsignedIntegerValue];

      id v13 = +[NSString stringWithFormat:@"%lu:%lu", v12, v8];
      [v7 addObject:v13];

      ++v8;
    }
    while (v8 < [(NSArray *)v6->_keyCommands count]);
  }
  BOOL v32 = v6;
  [v7 sortUsingSelector:"localizedCaseInsensitiveCompare:"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  id v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v30 = *(void *)v35;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(obj);
        }
        id v15 = [*(id *)(*((void *)&v34 + 1) + 8 * i) componentsSeparatedByString:@":"];
        id v16 = [v15 lastObject];
        id v17 = [v16 integerValue];

        double v18 = [(NSArray *)v32->_keyCommands objectAtIndexedSubscript:v17];
        unsigned int v19 = [v18 title];
        CGRect v20 = [v18 image];
        id v21 = [v18 action];
        id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v31 count] + 1);
        long long v23 = [v22 stringValue];
        id v24 = [v18 modifierFlags];
        long long v25 = [v18 propertyList];
        id v26 = +[UIKeyCommand commandWithTitle:v19 image:v20 action:v21 input:v23 modifierFlags:v24 propertyList:v25];
        [v31 addObject:v26];
      }
      id v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
  }

  double v27 = (NSArray *)[v31 copy];
  keyCommands = v32->_keyCommands;
  v32->_keyCommands = v27;
}

- (void)sendNoTypingACAnalytics
{
  id v4 = [(SearchHomeDataSource *)self analyticsManager];
  id v3 = [(SearchHomeDataSource *)self analyticsSuggestions];
  [v4 autocompleteSessionsStartedWithVisibleSuggestions:v3];
}

- (id)analyticsSuggestions
{
  id v3 = [(SearchHomeDataSource *)self autocompleteContext];

  if (v3)
  {
    id v4 = [(SearchHomeDataSource *)self objectsForAnalytics];
    id v5 = [(SearchHomeDataSource *)self autocompleteContext];
    id v6 = [(SearchHomeDataSource *)self newTraits];
    id v7 = +[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:v4 context:v5 mapsSuggestionsInsights:0 skipReportASearchItems:1 traits:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
}

- (id)tableView:(id)a3 indexPath:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(SearchHomeDataSource *)self tableViewDiffableDataSource];
  id v12 = [v11 snapshot];

  id v13 = [v9 section];
  uint64_t v14 = [v12 sectionIdentifiers];
  if ([v14 count])
  {
    id v15 = [v12 sectionIdentifiers];
    id v16 = [v15 count];

    if (v13 < v16)
    {
      id v17 = [v12 sectionIdentifiers];
      double v18 = [v17 objectAtIndex:v13];

      unsigned int v19 = [(SearchHomeDataSource *)self dataProviderWithIdentifier:v18];
      id v20 = v10;
      if (objc_opt_respondsToSelector())
      {
        id v21 = [v19 viewModels];
        id v22 = [v21 count];

        if (v22)
        {
          long long v23 = [v19 viewModels];
          id v24 = [v9 row];
          if (v24 >= [v23 count])
          {
            uint64_t v30 = sub_100109E50();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v33 = v18;
              __int16 v34 = 2112;
              long long v35 = v9;
              __int16 v36 = 2112;
              long long v37 = v12;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error fetching SearchHome cell for section: %@, indexpath:%@, snapshot: %@", buf, 0x20u);
            }

            double v28 = 0;
            goto LABEL_15;
          }
          long long v25 = [v19 viewModels];
          uint64_t v31 = [v25 objectAtIndex:[v9 row]];

          id v20 = (id)v31;
        }
      }
      id v26 = [(SearchHomeDataSource *)self layoutProviderForDataProvider:v19];
      if (objc_opt_respondsToSelector())
      {
        id v27 = [v26 cellForRowAtIndexPath:v9 tableview:v8 item:v20];
      }
      else
      {
        id v27 = objc_alloc_init((Class)UITableViewCell);
      }
      double v28 = v27;

LABEL_15:
      goto LABEL_16;
    }
  }
  else
  {
  }
  double v18 = sub_100109E50();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v9;
    __int16 v34 = 2112;
    long long v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error fetching SearchHome section at indexpath: %@, snapshot: %@", buf, 0x16u);
  }
  double v28 = 0;
LABEL_16:

  return v28;
}

- (void)setupTableHeaderView
{
  id v3 = +[NSBundle mainBundle];
  id v13 = [v3 localizedStringForKey:@"[Offline Route Planning] Find Nearby" value:@"localized string not found" table:0];

  id v4 = [[SectionHeaderTableViewHeaderFooterView alloc] initWithTitle:v13 isFirstNonEmptySection:1];
  id v5 = [(DataSource *)self tableView];
  [v5 frame];
  double Width = CGRectGetWidth(v15);
  id v7 = [(DataSource *)self tableView];
  id v8 = [v7 traitCollection];
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:1 title:v13 actionTitle:0 availableWidth:v8 traitCollection:Width];
  double v10 = v9;

  double v11 = [(DataSource *)self tableView];
  [v11 frame];
  -[SectionHeaderTableViewHeaderFooterView setBounds:](v4, "setBounds:", 0.0, 0.0, CGRectGetWidth(v16), v10);

  [(SectionHeaderTableViewHeaderFooterView *)v4 layoutIfNeeded];
  id v12 = [(DataSource *)self tableView];
  [v12 setTableHeaderView:v4];
}

- (void)_ppt_selectCategoryAtIndex:(unint64_t)a3
{
  uint64_t v14 = 0;
  CGRect v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100103CBC;
  double v18 = sub_1001046E8;
  id v19 = 0;
  id v5 = [(SearchHomeDataSource *)self dataProviders];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100530C14;
  v13[3] = &unk_1012EDE18;
  v13[4] = &v14;
  [v5 enumerateObjectsUsingBlock:v13];

  if (v15[5])
  {
    id v6 = [(SearchHomeDataSource *)self collectionViewDiffableDataSource];
    id v7 = [v6 snapshot];

    id v8 = [v7 sectionIdentifiers];
    double v9 = [(id)v15[5] identifier];
    id v10 = [v8 indexOfObject:v9];

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      double v11 = +[NSIndexPath indexPathForRow:a3 inSection:v10];
      id v12 = [(DataSource *)self collectionView];
      [(SearchHomeDataSource *)self collectionView:v12 didSelectItemAtIndexPath:v11];
    }
  }
  _Block_object_dispose(&v14, 8);
}

- (unint64_t)_ppt_numberOfDataFetchers
{
  v2 = [(SearchHomeDataSource *)self dataFetchers];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)_ppt_selectSeeAllCuratedCollections
{
  id v2 = [(SearchHomeDataSource *)self searchHomeDataSourceDelegate];
  [v2 seeAllTappedForCollections];
}

- (void)_ppt_selectFirstGuidePublisher
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(SearchHomeDataSource *)self dataProviders];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 type] == (id)4)
        {
          double v9 = [v8 objects];
          id v10 = [v9 count];

          if (v10)
          {
            double v11 = [v8 objects];
            id v12 = [v11 firstObject];

            id v13 = [(DataSource *)self delegate];
            [v13 dataSource:self itemTapped:v12];

            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)_ppt_selectExploreGuides
{
  id v3 = [(SearchHomeDataSource *)self dataProviderOfType:3];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 exploreGuides];
    if (v4)
    {
      id v5 = [(SearchHomeDataSource *)self searchHomeDataSourceDelegate];
      [v5 showGuidesHomeFromExploreGuides:v4];
    }
    id v3 = v6;
  }
}

- (void)_ppt_selectBrowseCities
{
  id v2 = [(SearchHomeDataSource *)self searchHomeDataSourceDelegate];
  [v2 showCitySelector];
}

- (void)_ppt_selectFirstCuratedGuide
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(SearchHomeDataSource *)self dataProviders];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 type] == (id)3)
        {
          double v9 = [v8 objects];
          id v10 = [v9 count];

          if (v10)
          {
            double v11 = [v8 objects];
            id v12 = [v11 firstObject];

            id v13 = [(DataSource *)self delegate];
            [v13 dataSource:self itemTapped:v12];

            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SearchHomeDataSource *)self dataFetchers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 fetchContent];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100531244;
  v12[3] = &unk_1012E5D08;
  v12[4] = self;
  +[UIView performWithoutAnimation:v12];
  double v11 = +[CollectionManager sharedManager];
  [v11 removeObserver:self];
}

- (void)addToCollectionObserver
{
  id v3 = +[CollectionManager sharedManager];
  [v3 removeObserver:self];

  id v4 = +[CollectionManager sharedManager];
  [v4 addObserver:self];
}

- (id)objectsForAnalytics
{
  return self->_objectsForAnalytics;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (void)setShouldHideHairLine:(BOOL)a3
{
  self->_shouldHideHairLine = a3;
}

- (BOOL)shouldRemoveSearchHomeTip
{
  return self->_shouldRemoveSearchHomeTip;
}

- (SearchHomeDataSourceDelegate)searchHomeDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchHomeDataSourceDelegate);

  return (SearchHomeDataSourceDelegate *)WeakRetained;
}

- (void)setSearchHomeDataSourceDelegate:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (void)setCollectionViewDiffableDataSource:(id)a3
{
}

- (UITableViewDiffableDataSource)tableViewDiffableDataSource
{
  return self->_tableViewDiffableDataSource;
}

- (void)setTableViewDiffableDataSource:(id)a3
{
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
}

- (NSArray)dataFetchers
{
  return self->_dataFetchers;
}

- (void)setDataFetchers:(id)a3
{
}

- (NSArray)layoutProviders
{
  return self->_layoutProviders;
}

- (void)setLayoutProviders:(id)a3
{
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (void)setAutocompleteContext:(id)a3
{
}

- (SearchHomeAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BOOL)needsToApplySnapshot
{
  return self->_needsToApplySnapshot;
}

- (void)setNeedsToApplySnapshot:(BOOL)a3
{
  self->_needsToApplySnapshot = a3;
}

- (BOOL)needsToResetKeyCommands
{
  return self->_needsToResetKeyCommands;
}

- (void)setNeedsToResetKeyCommands:(BOOL)a3
{
  self->_needsToResetKeyCommands = a3;
}

- (NSArray)cachedSnapshotObjects
{
  return self->_cachedSnapshotObjects;
}

- (void)setCachedSnapshotObjects:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_BOOL supportsFullTextSearch = a3;
}

- (BOOL)routePlanning
{
  return self->_routePlanning;
}

- (void)setRoutePlanning:(BOOL)a3
{
  self->_routePlanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotObjects, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_autocompleteContext, 0);
  objc_storeStrong((id *)&self->_layoutProviders, 0);
  objc_storeStrong((id *)&self->_dataFetchers, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_destroyWeak((id *)&self->_searchHomeDataSourceDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);

  objc_storeStrong((id *)&self->_objectsForAnalytics, 0);
}

@end