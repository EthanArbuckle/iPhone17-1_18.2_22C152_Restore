@interface AllCollectionsDataSource
- (AllCollectionsAPIController)apiController;
- (AllCollectionsDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 sections:(id)a7 usingAPIController:(id)a8 withRoutingDelegate:(id)a9;
- (CollectionsFilterMenu)filterMenu;
- (MKCollectionCarouselRoutingDelegate)routingDelegate;
- (MKPlaceCollectionsLogicController)collectionsLogicController;
- (NSArray)placeCollections;
- (NSArray)resultFilters;
- (NSArray)sections;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSIndexPath)selectedFilterIndexPath;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)allCollectionsSectionOfType:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)presentationStyle;
- (void)_dispatchOnManThread:(id)a3;
- (void)applySnapshot;
- (void)clearGuidesFromSnapshot;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3;
- (void)dealloc;
- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4;
- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4;
- (void)didStartFetchingBatch;
- (void)didTapTryAgainOnErrorView;
- (void)dismissedCollections;
- (void)displayAllCollectionsData;
- (void)filterDataFetchStarted;
- (void)prepareSnapshotUsingCollections:(id)a3;
- (void)presentFirstCollection;
- (void)setApiController:(id)a3;
- (void)setCollectionsLogicController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFilterMenu:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setResultFilters:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedFilterIndexPath:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4;
- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4;
- (void)updateSnapshotUsingCollections:(id)a3;
@end

@implementation AllCollectionsDataSource

- (AllCollectionsDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 sections:(id)a7 usingAPIController:(id)a8 withRoutingDelegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v50 = a6;
  id v49 = a7;
  id v18 = a8;
  id v19 = a9;
  v51.receiver = self;
  v51.super_class = (Class)AllCollectionsDataSource;
  v20 = [(DataSource *)&v51 initWithCollectionView:v15 updateLocation:0];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_placeCollections, a4);
    objc_storeStrong((id *)&v21->_resultFilters, a6);
    objc_storeStrong((id *)&v21->_sections, a7);
    objc_storeStrong((id *)&v21->_apiController, a8);
    objc_storeWeak((id *)&v21->_routingDelegate, v19);
    uint64_t v22 = +[NSIndexPath indexPathForItem:0 inSection:0];
    selectedFilterIndexPath = v21->_selectedFilterIndexPath;
    v21->_selectedFilterIndexPath = (NSIndexPath *)v22;

    v24 = +[CuratedCollectionSyncManager sharedManager];
    [v24 addObserver:v21];

    v25 = [(DataSource *)v21 collectionView];
    [v25 setDelegate:v21];

    v26 = [(DataSource *)v21 collectionView];
    uint64_t v27 = objc_opt_class();
    v28 = +[MKPlaceCollectionCell reuseIdentifier];
    [v26 registerClass:v27 forCellWithReuseIdentifier:v28];

    v29 = [(DataSource *)v21 collectionView];
    uint64_t v30 = objc_opt_class();
    v31 = +[MKCollectionBatchCell reuseIdentifier];
    [v29 registerClass:v30 forCellWithReuseIdentifier:v31];

    uint64_t v32 = sub_1000BBB44(v15);
    v33 = [(DataSource *)v21 collectionView];
    uint64_t v34 = objc_opt_class();
    if (v32 == 5)
    {
      v35 = +[CollectionsFilterMenu reuseIdentifier];
      [v33 registerClass:v34 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v35];
    }
    else
    {
      v35 = +[CollectionsFilterCarouselView reuseIdentifier];
      v36 = +[CollectionsFilterCarouselView reuseIdentifier];
      [v33 registerClass:v34 forSupplementaryViewOfKind:v35 withReuseIdentifier:v36];
    }
    id v37 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v38 = sub_10001CBB8(v21);
    v39 = (UICollectionViewDiffableDataSource *)[v37 initWithCollectionView:v15 cellProvider:v38];
    dataSource = v21->_dataSource;
    v21->_dataSource = v39;

    v41 = v21->_dataSource;
    v42 = sub_1005B38D0(v21);
    [(UICollectionViewDiffableDataSource *)v41 setSupplementaryViewProvider:v42];

    id v43 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v44 = [(DataSource *)v21 collectionView];
    v45 = +[CuratedCollectionSyncManager sharedManager];
    v46 = (MKPlaceCollectionsLogicController *)objc_msgSend(v43, "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", v44, v16, v17, v18, v21, v45, 5, objc_msgSend(v18, "batchSize"));
    collectionsLogicController = v21->_collectionsLogicController;
    v21->_collectionsLogicController = v46;

    [(AllCollectionsDataSource *)v21 prepareSnapshotUsingCollections:v21->_placeCollections];
  }

  return v21;
}

- (void)dealloc
{
  v3 = +[CuratedCollectionSyncManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AllCollectionsDataSource;
  [(AllCollectionsDataSource *)&v4 dealloc];
}

- (void)prepareSnapshotUsingCollections:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [(AllCollectionsDataSource *)self setSnapshot:v5];

  v6 = [(AllCollectionsDataSource *)self snapshot];
  v7 = [(AllCollectionsDataSource *)self sections];
  [v6 appendSectionsWithIdentifiers:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(AllCollectionsDataSource *)self sections];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v13)
        {
          [*(id *)(*((void *)&v17 + 1) + 8 * i) configuration];

          if (v16) {
            continue;
          }
        }
        else
        {
          long long v15 = 0u;
          uint64_t v16 = 0;
        }
        v14 = [(AllCollectionsDataSource *)self snapshot];
        [v14 appendItemsWithIdentifiers:v4 intoSectionWithIdentifier:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)updateSnapshotUsingCollections:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [(AllCollectionsDataSource *)self setSnapshot:v5];

  v6 = [(AllCollectionsDataSource *)self snapshot];
  v7 = [(AllCollectionsDataSource *)self sections];
  [v6 appendSectionsWithIdentifiers:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(AllCollectionsDataSource *)self sections];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!v13)
        {
          long long v15 = 0u;
          long long v16 = 0u;
LABEL_12:
          -[AllCollectionsDataSource setPlaceCollections:](self, "setPlaceCollections:", v4, v15, v16);
          v14 = [(AllCollectionsDataSource *)self snapshot];
          [v14 appendItemsWithIdentifiers:v4 intoSectionWithIdentifier:v13];

          goto LABEL_13;
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) configuration];

        if (!(void)v16) {
          goto LABEL_12;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)applySnapshot
{
  id v4 = [(AllCollectionsDataSource *)self dataSource];
  v3 = [(AllCollectionsDataSource *)self snapshot];
  [v4 applySnapshot:v3 animatingDifferences:0];
}

- (void)_dispatchOnManThread:(id)a3
{
  v3 = (void (**)(void))a3;
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      v3[2](v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B65CB4;
      block[3] = &unk_1012E6EA8;
      id v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }
}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)displayAllCollectionsData
{
  v3 = sub_10057611C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[<-->]Displaying All Collection data.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B65DD0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, buf);
  [(AllCollectionsDataSource *)self _dispatchOnManThread:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)didTapTryAgainOnErrorView
{
  v3 = [(AllCollectionsDataSource *)self resultFilters];
  id v4 = [(AllCollectionsDataSource *)self selectedFilterIndexPath];
  [v3 objectAtIndex:[v4 item]];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v8 filterType];
  if (v5 == (id)2)
  {
    v6 = [v8 keywordFilter];
    v7 = [(AllCollectionsDataSource *)self selectedFilterIndexPath];
    [(AllCollectionsDataSource *)self didRouteToKeywordFilter:v6 atIndexPath:v7];
  }
  else
  {
    if (v5 != (id)1) {
      goto LABEL_6;
    }
    v6 = [v8 addressFilter];
    v7 = [(AllCollectionsDataSource *)self selectedFilterIndexPath];
    [(AllCollectionsDataSource *)self didRouteToAddressFilter:v6 atIndexPath:v7];
  }

LABEL_6:
}

- (id)allCollectionsSectionOfType:(int64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(AllCollectionsDataSource *)self sections];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * i) configuration];
          uint64_t v10 = v14;
        }
        else
        {
          uint64_t v10 = 0;
          long long v13 = 0u;
          uint64_t v14 = 0;
        }
        if (v10 == a3)
        {
          id v11 = v9;
          goto LABEL_14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (void)filterDataFetchStarted
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B66120;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)clearGuidesFromSnapshot
{
  v3 = [(AllCollectionsDataSource *)self dataSource];
  id v9 = [v3 snapshot];

  id v4 = [(AllCollectionsDataSource *)self allCollectionsSectionOfType:0];
  id v5 = [v9 itemIdentifiersInSectionWithIdentifier:v4];

  id v6 = [(AllCollectionsDataSource *)self allCollectionsSectionOfType:1];
  uint64_t v7 = [v9 itemIdentifiersInSectionWithIdentifier:v6];

  if ([v5 count] || objc_msgSend(v7, "count"))
  {
    [v9 deleteItemsWithIdentifiers:v5];
    [v9 deleteItemsWithIdentifiers:v7];
    id v8 = [(AllCollectionsDataSource *)self dataSource];
    [v8 applySnapshot:v9 animatingDifferences:0];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(AllCollectionsDataSource *)self sections];
  uint64_t v10 = [v9 objectAtIndex:[v8 section]];

  if (v10 && ([v10 configuration], v19, v20))
  {
    [v10 configuration];

    if (v18 == 1)
    {
      id v11 = +[MKCollectionBatchCell reuseIdentifier];
      v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

      [v12 startedLoadingBatch];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    long long v13 = +[MKPlaceCollectionCell reuseIdentifier];
    v12 = [v7 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v8];

    uint64_t v14 = [(AllCollectionsDataSource *)self collectionsLogicController];
    long long v15 = [v14 collectionAtIndex:[v8 item]];
    [v12 configureWithModel:v15];
  }

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(AllCollectionsDataSource *)self sections];
  uint64_t v10 = [v9 objectAtIndex:[v8 section]];

  if (v10)
  {
    [v10 configuration];

    if (v29 == 1)
    {
      uint64_t v11 = sub_1000BBB44(v7);
      v12 = [(DataSource *)self collectionView];
      if (v11 == 5)
      {
        long long v13 = +[CollectionsFilterMenu reuseIdentifier];
        uint64_t v14 = [v12 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v13 forIndexPath:v8];
        [(AllCollectionsDataSource *)self setFilterMenu:v14];

        long long v15 = [(AllCollectionsDataSource *)self apiController];
        long long v16 = [v15 allCollectionViewFilters];

        long long v17 = [(AllCollectionsDataSource *)self filterMenu];
        uint64_t v18 = [(AllCollectionsDataSource *)self selectedFilterIndexPath];
        long long v19 = [(AllCollectionsDataSource *)self apiController];
        uint64_t v20 = [v19 allCollectionViewIdentifiers];
        [v17 configureForAllCollectionsWithRoutingDelegate:self withAllCollectionsResultFilters:v16 withSelectedFilterIndex:v18 selectedFilterResultsCount:[v20 count]];

        v21 = [(AllCollectionsDataSource *)self filterMenu];
      }
      else
      {
        uint64_t v22 = +[CollectionsFilterCarouselView reuseIdentifier];
        v23 = +[CollectionsFilterCarouselView reuseIdentifier];
        v21 = [v12 dequeueReusableSupplementaryViewOfKind:v22 withReuseIdentifier:v23 forIndexPath:v8];

        v24 = [(AllCollectionsDataSource *)self apiController];
        v25 = [v24 allCollectionViewFilters];

        v26 = [(AllCollectionsDataSource *)self selectedFilterIndexPath];
        [v21 configureWithContext:1 withRoutingDelegate:self withAllCollectionsResultFilters:v25 withSelectedFilterIndex:v26];

        [v21 displayFilters];
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(AllCollectionsDataSource *)self sections];
  long long v15 = [v14 objectAtIndex:[v13 section]];

  if (!v15)
  {
    long long v17 = 0;
LABEL_8:

    goto LABEL_9;
  }
  [v15 configuration];
  if (v19 != 1)
  {
    long long v17 = v18;
    goto LABEL_8;
  }
  uint64_t v16 = sub_1000BBB44(v10);

  if (v11 && v16 != 5) {
    [v11 scrollToSelectedFilter];
  }
LABEL_9:
}

- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  id v7 = [(AllCollectionsDataSource *)self collectionsLogicController];
  id v8 = [(AllCollectionsDataSource *)self apiController];
  id v9 = [(AllCollectionsDataSource *)self apiController];
  [v7 updateCollectionsWithoutPreparingSnapshot:v10 usingBatchedIdentifiers:v6 usingCollectionFetcher:v8 usingGuideConsumer:self usingBatchSize:[v9 batchSize]];

  [(AllCollectionsDataSource *)self updateSnapshotUsingCollections:v10];
}

- (void)dismissedCollections
{
  id v2 = [(AllCollectionsDataSource *)self collectionsLogicController];
  [v2 dismissedCollections];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(AllCollectionsDataSource *)self routingDelegate];
  id v6 = [(AllCollectionsDataSource *)self collectionsLogicController];
  id v7 = [v5 item];

  id v8 = [v6 geoCollectionAtIndex:v7];
  [v9 routeToCuratedCollection:v8];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a5;
  id v6 = [(AllCollectionsDataSource *)self collectionsLogicController];
  id v7 = [v6 sectionKindAtIndex:[v9 section]];

  if (v7 != (id)1)
  {
    id v8 = [(AllCollectionsDataSource *)self collectionsLogicController];
    [v8 willDisplayCellAtIndexpath:v9];
  }
}

- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AllCollectionsDataSource *)self apiController];
  [v8 cancelFetchingAllCollections];

  [(AllCollectionsDataSource *)self setSelectedFilterIndexPath:v7];
  [(AllCollectionsDataSource *)self filterDataFetchStarted];
  objc_initWeak(&location, self);
  id v9 = [(AllCollectionsDataSource *)self apiController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B66B74;
  v10[3] = &unk_1012E6708;
  objc_copyWeak(&v11, &location);
  [v9 fetchAllCollectionsViewForKeywordFilter:v6 addressFilter:0 onCompletion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AllCollectionsDataSource *)self apiController];
  [v8 cancelFetchingAllCollections];

  [(AllCollectionsDataSource *)self setSelectedFilterIndexPath:v7];
  [(AllCollectionsDataSource *)self filterDataFetchStarted];
  objc_initWeak(&location, self);
  id v9 = [(AllCollectionsDataSource *)self apiController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B66E0C;
  v10[3] = &unk_1012E6708;
  objc_copyWeak(&v11, &location);
  [v9 fetchAllCollectionsViewForKeywordFilter:0 addressFilter:v6 onCompletion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  BOOL v30 = a3;
  id v5 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [(AllCollectionsDataSource *)self sections];
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v7)
  {
    id v9 = 0;
    id v10 = 0;
    goto LABEL_17;
  }
  id v8 = v7;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v36;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v36 != v11) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if (!v13)
      {
        long long v33 = 0u;
        uint64_t v34 = 0;
        long long v31 = 0u;
        uint64_t v32 = 0;
LABEL_11:
        id v16 = v13;
        long long v15 = v9;
        id v9 = v16;
        goto LABEL_12;
      }
      [*(id *)(*((void *)&v35 + 1) + 8 * i) configuration];

      if (v34 != 1)
      {
        [v13 configuration];

        if (v32) {
          continue;
        }
        goto LABEL_11;
      }
      id v14 = v13;
      long long v15 = v10;
      id v10 = v14;
LABEL_12:
    }
    id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  }
  while (v8);
LABEL_17:

  long long v17 = sub_10057611C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource informed about batch load complete. Removing loading cell.", buf, 2u);
  }

  uint64_t v18 = [(AllCollectionsDataSource *)self snapshot];
  uint64_t v19 = [(AllCollectionsDataSource *)self snapshot];
  uint64_t v20 = [v19 itemIdentifiersInSectionWithIdentifier:v10];
  [v18 deleteItemsWithIdentifiers:v20];

  v21 = v5;
  if (v30 && [v5 count])
  {
    uint64_t v22 = [(AllCollectionsDataSource *)self apiController];
    v23 = [v22 placeCollectionsFromLastBatch];

    v24 = [(AllCollectionsDataSource *)self collectionsLogicController];
    [v24 appendBatchOfCollections:v23];

    v25 = [(AllCollectionsDataSource *)self snapshot];
    [v25 appendItemsWithIdentifiers:v23 intoSectionWithIdentifier:v9];

    v26 = sub_10057611C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v27 = [v23 count];
      *(_DWORD *)buf = 134217984;
      id v40 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource displaying %ld more collections.", buf, 0xCu);
    }

    [(AllCollectionsDataSource *)self displayAllCollectionsData];
  }
  else
  {
    if (![v5 count])
    {
      v28 = sub_10057611C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[<-->] AllCollectionDateSource received empty placeCollections when we were sure to load a batch.", buf, 2u);
      }
    }
    uint64_t v29 = sub_10057611C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource is removing loading indicator only as batch load failed.", buf, 2u);
    }

    [(AllCollectionsDataSource *)self displayAllCollectionsData];
  }
}

- (void)didStartFetchingBatch
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v3 = [(AllCollectionsDataSource *)self sections];
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v4)
  {

    id v7 = 0;
    id v6 = 0;
    goto LABEL_22;
  }
  id v5 = v4;
  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v27;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if (!v10)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
LABEL_11:
        id v13 = v10;
        id v12 = v6;
        id v6 = v13;
        goto LABEL_12;
      }
      [*(id *)(*((void *)&v26 + 1) + 8 * i) configuration];

      if ((void)v25 != 1)
      {
        [v10 configuration];

        if ((void)v23) {
          continue;
        }
        goto LABEL_11;
      }
      id v11 = v10;
      id v12 = v7;
      id v7 = v11;
LABEL_12:
    }
    id v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  }
  while (v5);

  if (v7)
  {
    if (v6)
    {
      id v14 = [(AllCollectionsDataSource *)self snapshot];
      long long v15 = [v14 itemIdentifiersInSectionWithIdentifier:v7];
      id v16 = [v15 count];

      if (!v16)
      {
        long long v17 = sub_10057611C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource informed about batch load starting. Adding loading cell.", v21, 2u);
        }

        uint64_t v18 = [(AllCollectionsDataSource *)self snapshot];
        uint64_t v19 = +[MKCollectionBatchCell reuseIdentifier];
        BOOL v30 = v19;
        uint64_t v20 = +[NSArray arrayWithObjects:&v30 count:1];
        [v18 appendItemsWithIdentifiers:v20 intoSectionWithIdentifier:v7];

        [(AllCollectionsDataSource *)self displayAllCollectionsData];
      }
    }
  }
LABEL_22:
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(AllCollectionsDataSource *)self sections];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v16 + 1) + 8 * i) configuration];

          if (v15) {
            continue;
          }
        }
        else
        {
          long long v14 = 0u;
          uint64_t v15 = 0;
        }
        id v10 = [(AllCollectionsDataSource *)self dataSource];
        id v11 = [v10 snapshot];

        uint64_t v20 = v9;
        id v12 = +[NSArray arrayWithObjects:&v20 count:1];
        [v11 reloadSectionsWithIdentifiers:v12];

        id v13 = [(AllCollectionsDataSource *)self dataSource];
        [v13 applySnapshot:v11 animatingDifferences:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)presentFirstCollection
{
  v3 = [(AllCollectionsDataSource *)self placeCollections];
  id v4 = [v3 count];

  if (v4)
  {
    id v7 = [(AllCollectionsDataSource *)self routingDelegate];
    id v5 = [(AllCollectionsDataSource *)self collectionsLogicController];
    id v6 = [v5 geoCollectionAtIndex:0];
    [v7 routeToCuratedCollection:v6];
  }
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (MKCollectionCarouselRoutingDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);

  return (MKCollectionCarouselRoutingDelegate *)WeakRetained;
}

- (void)setRoutingDelegate:(id)a3
{
}

- (AllCollectionsAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (NSIndexPath)selectedFilterIndexPath
{
  return self->_selectedFilterIndexPath;
}

- (void)setSelectedFilterIndexPath:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (CollectionsFilterMenu)filterMenu
{
  return self->_filterMenu;
}

- (void)setFilterMenu:(id)a3
{
}

- (MKPlaceCollectionsLogicController)collectionsLogicController
{
  return self->_collectionsLogicController;
}

- (void)setCollectionsLogicController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsLogicController, 0);
  objc_storeStrong((id *)&self->_filterMenu, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedFilterIndexPath, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_resultFilters, 0);

  objc_storeStrong((id *)&self->_placeCollections, 0);
}

@end