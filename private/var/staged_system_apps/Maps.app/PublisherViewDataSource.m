@interface PublisherViewDataSource
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CollectionsFilterMenu)filterMenu;
- (MKCollectionCarouselRoutingDelegate)routingDelegate;
- (MKPlaceCollectionsLogicController)logicController;
- (MKPlaceCollectionsSizeController)sizeController;
- (NSArray)placeCollectionViewModels;
- (NSArray)placeCollections;
- (NSArray)resultFilters;
- (NSIndexPath)selectedFilterIndexPath;
- (PublisherAPIController)apiController;
- (PublisherAnalytics)analyticsManager;
- (PublisherHeaderViewActionManager)actionsManager;
- (PublisherViewDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 withAPIController:(id)a7 withCollectionRoutingDelegate:(id)a8 usingAnalyticsManager:(id)a9 usingPublisherActionsManager:(id)a10;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)presentationStyle;
- (void)clearPublisherData;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3;
- (void)dealloc;
- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4;
- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4;
- (void)didTapTryAgainOnErrorView;
- (void)dismissedCollections;
- (void)displayCollections:(id)a3;
- (void)filterDataFetchStarted;
- (void)setActionsManager:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApiController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFilterMenu:(id)a3;
- (void)setLogicController:(id)a3;
- (void)setPlaceCollectionViewModels:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setResultFilters:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setSelectedFilterIndexPath:(id)a3;
- (void)setSizeController:(id)a3;
- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4;
@end

@implementation PublisherViewDataSource

- (PublisherViewDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 withAPIController:(id)a7 withCollectionRoutingDelegate:(id)a8 usingAnalyticsManager:(id)a9 usingPublisherActionsManager:(id)a10
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v53 = a6;
  id v19 = a7;
  id v20 = a8;
  id v52 = a9;
  id v51 = a10;
  v54.receiver = self;
  v54.super_class = (Class)PublisherViewDataSource;
  v21 = [(DataSource *)&v54 initWithCollectionView:v16 updateLocation:0];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_placeCollections, obj);
    objc_storeStrong((id *)&v22->_resultFilters, a6);
    objc_storeStrong((id *)&v22->_apiController, a7);
    objc_storeWeak((id *)&v22->_routingDelegate, v20);
    objc_storeStrong((id *)&v22->_analyticsManager, a9);
    objc_storeStrong((id *)&v22->_actionsManager, a10);
    uint64_t v23 = +[NSIndexPath indexPathForItem:0 inSection:0];
    selectedFilterIndexPath = v22->_selectedFilterIndexPath;
    v22->_selectedFilterIndexPath = (NSIndexPath *)v23;

    v25 = +[CuratedCollectionSyncManager sharedManager];
    [v25 addObserver:v22];

    v26 = [(DataSource *)v22 collectionView];
    [v26 setDelegate:v22];

    v27 = [(DataSource *)v22 collectionView];
    uint64_t v28 = objc_opt_class();
    v29 = +[MKPlaceCollectionCell reuseIdentifier];
    [v27 registerClass:v28 forCellWithReuseIdentifier:v29];

    v30 = [(DataSource *)v22 collectionView];
    uint64_t v31 = objc_opt_class();
    v32 = +[MKCollectionBatchCell reuseIdentifier];
    [v30 registerClass:v31 forCellWithReuseIdentifier:v32];

    uint64_t v33 = sub_1000BBB44(v16);
    v34 = [(DataSource *)v22 collectionView];
    uint64_t v35 = objc_opt_class();
    if (v33 == 5) {
      v36 = CollectionsFilterMenu;
    }
    else {
      v36 = PublisherActionView;
    }
    v37 = [(__objc2_class *)v36 reuseIdentifier];
    [v34 registerClass:v35 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v37];

    id v38 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v39 = sub_10001CBB8(v22);
    v40 = (UICollectionViewDiffableDataSource *)[v38 initWithCollectionView:v16 cellProvider:v39];
    dataSource = v22->_dataSource;
    v22->_dataSource = v40;

    v42 = v22->_dataSource;
    v43 = sub_1005B38D0(v22);
    [(UICollectionViewDiffableDataSource *)v42 setSupplementaryViewProvider:v43];

    id v44 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v45 = [(DataSource *)v22 collectionView];
    v46 = +[CuratedCollectionSyncManager sharedManager];
    id v47 = [v44 initWithCollectionView:v45 withPlaceCollections:v17 usingCollectionIds:v18 usingCollectionFetcher:0 usingGuideConsumer:v46 usingSyncCoordinator:v46 inContext:v19 usingBatchSize:[v19 batchSize]];
    [(PublisherViewDataSource *)v22 setLogicController:v47];

    id v48 = [objc_alloc((Class)MKPlaceCollectionsSizeController) initWithCollectionsConfiguration:2 isSingleCollection:2 usingTraitCollections:[v17 count] == (id)1 inContext:v16];
    [(PublisherViewDataSource *)v22 setSizeController:v48];
  }
  return v22;
}

- (void)dealloc
{
  v3 = +[CuratedCollectionSyncManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PublisherViewDataSource;
  [(PublisherViewDataSource *)&v4 dealloc];
}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)displayCollections:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(PublisherViewDataSource *)self logicController];
  v6 = [(PublisherViewDataSource *)self dataSource];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D727F8;
  v8[3] = &unk_1012E9950;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 getCollectionsUsingDataSource:v6 onCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)clearPublisherData
{
  id v2 = [(PublisherViewDataSource *)self logicController];
  [v2 clearSnapshotData];
}

- (void)didTapTryAgainOnErrorView
{
  v3 = [(PublisherViewDataSource *)self resultFilters];
  id v4 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
  [v3 objectAtIndex:[v4 item]];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v8 filterType];
  if (v5 == (id)2)
  {
    v6 = [v8 keywordFilter];
    id v7 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
    [(PublisherViewDataSource *)self didRouteToKeywordFilter:v6 atIndexPath:v7];
  }
  else
  {
    if (v5 != (id)1) {
      goto LABEL_6;
    }
    v6 = [v8 addressFilter];
    id v7 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
    [(PublisherViewDataSource *)self didRouteToAddressFilter:v6 atIndexPath:v7];
  }

LABEL_6:
}

- (void)filterDataFetchStarted
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100D72A74;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PublisherViewDataSource *)self logicController];
  id v10 = [v9 sectionKindAtIndex:[v7 section]];

  if (v10 == (id)1)
  {
    v11 = +[MKCollectionBatchCell reuseIdentifier];
    v12 = [v8 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];

    [v12 startedLoadingBatch];
  }
  else
  {
    v13 = +[MKPlaceCollectionCell reuseIdentifier];
    v12 = [v8 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v7];

    v14 = [(PublisherViewDataSource *)self logicController];
    v15 = [v14 collectionAtIndex:[v7 item]];
    [v12 configureWithModel:v15];
  }

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (UICollectionElementKindSectionHeader == v9
    && ([(PublisherViewDataSource *)self logicController],
        v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = objc_msgSend(v11, "sectionKindAtIndex:", objc_msgSend(v10, "section")),
        v11,
        !v12))
  {
    uint64_t v15 = sub_1000BBB44(v8);
    id v16 = [(DataSource *)self collectionView];
    if (v15 == 5)
    {
      id v17 = +[CollectionsFilterMenu reuseIdentifier];
      id v18 = [v16 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v17 forIndexPath:v10];
      [(PublisherViewDataSource *)self setFilterMenu:v18];

      id v19 = [(PublisherViewDataSource *)self filterMenu];
      id v20 = [(PublisherViewDataSource *)self resultFilters];
      v21 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
      v22 = [(PublisherViewDataSource *)self apiController];
      uint64_t v23 = [v22 publisherViewIdentifiers];
      [v19 configureForPublisherWithRoutingDelegate:self withPublishersResultFilters:v20 withSelectedFilterIndex:v21 selectedFilterResultsCount:[v23 count]];

      v24 = [(PublisherViewDataSource *)self filterMenu];
      filterAnalyticsProvider = self->_filterAnalyticsProvider;
      self->_filterAnalyticsProvider = v24;

      v13 = [(PublisherViewDataSource *)self filterMenu];
    }
    else
    {
      v26 = +[PublisherActionView reuseIdentifier];
      v13 = [v16 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v26 forIndexPath:v10];

      v27 = [(PublisherViewDataSource *)self actionsManager];
      uint64_t v28 = [(PublisherViewDataSource *)self apiController];
      v29 = [v28 publisherViewResultFilters];
      v30 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
      [v13 configureWithActionManager:v27 publishersResultFilters:v29 routingDelegate:self selectedFilterIndex:v30];

      objc_storeStrong((id *)&self->_filterAnalyticsProvider, v13);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PublisherViewDataSource *)self apiController];
  [v8 cancelFetchingPublisher];

  [(PublisherViewDataSource *)self setSelectedFilterIndexPath:v7];
  [(PublisherViewDataSource *)self filterDataFetchStarted];
  objc_initWeak(&location, self);
  id v9 = [(PublisherViewDataSource *)self apiController];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100D73060;
  uint64_t v15 = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  [v9 fetchPublisherViewForKeywordFilter:v6 addressFilter:0 onCompletion:&v12];

  id v10 = [(PublisherViewDataSource *)self analyticsManager];
  v11 = [(FilterAnalyticsProvider *)self->_filterAnalyticsProvider titleForFilterAtIndexPath:v7];
  [v10 publisherFilterTappedWithValue:v11 atIndex:[v7 item]];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PublisherViewDataSource *)self apiController];
  [v8 cancelFetchingPublisher];

  [(PublisherViewDataSource *)self setSelectedFilterIndexPath:v7];
  [(PublisherViewDataSource *)self filterDataFetchStarted];
  objc_initWeak(&location, self);
  id v9 = [(PublisherViewDataSource *)self apiController];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100D73340;
  uint64_t v15 = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  [v9 fetchPublisherViewForKeywordFilter:0 addressFilter:v6 onCompletion:&v12];

  id v10 = [(PublisherViewDataSource *)self analyticsManager];
  v11 = [(FilterAnalyticsProvider *)self->_filterAnalyticsProvider titleForFilterAtIndexPath:v7];
  [v10 publisherFilterTappedWithValue:v11 atIndex:[v7 item]];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(PublisherViewDataSource *)self logicController];
  id v9 = [v8 sectionKindAtIndex:a5];

  if (v9 == (id)1) {
    goto LABEL_2;
  }
  if (sub_1000BBB44(v7) != 5)
  {
    id v16 = [PublisherActionView alloc];
    [v7 frame];
    id v17 = -[PublisherActionView initWithFrame:](v16, "initWithFrame:", 0.0, 0.0);
    id v18 = [(PublisherViewDataSource *)self actionsManager];
    id v19 = [(PublisherViewDataSource *)self apiController];
    id v20 = [v19 publisherViewResultFilters];
    v21 = [(PublisherViewDataSource *)self selectedFilterIndexPath];
    [(PublisherActionView *)v17 configureWithActionManager:v18 publishersResultFilters:v20 routingDelegate:self selectedFilterIndex:v21];

    [(PublisherActionView *)v17 frame];
    double v23 = v22;
    double v25 = v24;
    LODWORD(v22) = 1144750080;
    LODWORD(v24) = 1132068864;
    -[PublisherActionView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v17, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v23, v25, v22, v24);
    CGFloat width = v26;
    CGFloat height = v27;

    goto LABEL_7;
  }
  id v12 = [(PublisherViewDataSource *)self resultFilters];
  id v13 = [v12 count];

  if (v13 == (id)1)
  {
LABEL_2:
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    [v7 frame];
    CGFloat width = v14;
    +[CollectionsFilterMenu defaultHeightForDisplayStyle:1 inContext:0];
    CGFloat height = v15;
  }
LABEL_7:

  double v28 = width;
  double v29 = height;
  result.CGFloat height = v29;
  result.CGFloat width = v28;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(PublisherViewDataSource *)self logicController];
  id v10 = [v8 section];

  id v11 = [v9 sectionKindAtIndex:v10];
  if (v11 == (id)1)
  {
    [v7 frame];
    double v13 = v12;
    double v14 = 100.0;
  }
  else
  {
    double v15 = [(PublisherViewDataSource *)self sizeController];
    [v7 frame];
    [v15 sizeForCollectionWithMaxCollectionsWidth:v16];
    double v13 = v17;
    double v19 = v18;

    id v20 = [(PublisherViewDataSource *)self sizeController];
    [v20 sectionInsets];
    double v14 = v19 - v21;
  }
  double v22 = v13;
  double v23 = v14;
  result.CGFloat height = v23;
  result.CGFloat width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = [(PublisherViewDataSource *)self logicController];
  id v8 = [v7 sectionKindAtIndex:a5];

  if (v8 == (id)1)
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  else
  {
    double v13 = [(PublisherViewDataSource *)self sizeController];
    [v13 sectionInsets];
    CGFloat top = v14;
    CGFloat left = v15;
    CGFloat bottom = v16;
    CGFloat right = v17;
  }
  double v18 = top;
  double v19 = left;
  double v20 = bottom;
  double v21 = right;
  result.CGFloat right = v21;
  result.CGFloat bottom = v20;
  result.CGFloat left = v19;
  result.CGFloat top = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = [(PublisherViewDataSource *)self logicController];
  id v8 = [v7 sectionKindAtIndex:a5];

  if (v8 == (id)1) {
    return 0.0;
  }
  id v10 = [(PublisherViewDataSource *)self sizeController];
  [v10 minimumInterItemSpacing];
  double v12 = v11;

  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = [(PublisherViewDataSource *)self logicController];
  id v8 = [v7 sectionKindAtIndex:a5];

  if (v8 == (id)1) {
    return 0.0;
  }
  id v10 = [(PublisherViewDataSource *)self sizeController];
  [v10 minimumInterItemSpacing];
  double v12 = v11;

  return v12;
}

- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PublisherViewDataSource *)self logicController];
  id v8 = [(PublisherViewDataSource *)self apiController];
  id v9 = [(PublisherViewDataSource *)self apiController];
  [v10 updateCollections:v7 usingBatchedIdentifiers:v6 usingCollectionFetcher:v8 usingBatchSize:[v9 batchSize]];
}

- (void)dismissedCollections
{
  id v2 = [(PublisherViewDataSource *)self logicController];
  [v2 dismissedCollections];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a4;
  id v5 = [(PublisherViewDataSource *)self logicController];
  id v6 = [v5 sectionKindAtIndex:[v15 section]];

  if (v6 != (id)1)
  {
    id v7 = [(PublisherViewDataSource *)self routingDelegate];
    id v8 = [(PublisherViewDataSource *)self logicController];
    id v9 = [v8 geoCollectionAtIndex:[v15 item]];
    [v7 routeToCuratedCollection:v9];

    id v10 = [(PublisherViewDataSource *)self analyticsManager];
    double v11 = [(PublisherViewDataSource *)self logicController];
    double v12 = [v11 identifierForCollectionAtIndex:[v15 item]];
    id v13 = [v15 item];
    double v14 = [(PublisherViewDataSource *)self logicController];
    [v10 publisherCollectionTapped:v12 atIndex:v13 isCurrentlySaved:[v14 isCollectionSavedAtIndex:[v15 item]]];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a5;
  id v6 = [(PublisherViewDataSource *)self logicController];
  id v7 = [v6 sectionKindAtIndex:[v9 section]];

  if (v7 != (id)1)
  {
    id v8 = [(PublisherViewDataSource *)self logicController];
    [v8 willDisplayCellAtIndexpath:v9];
  }
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  id v3 = [(PublisherViewDataSource *)self logicController];
  [v3 refreshCollections];
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (NSArray)placeCollectionViewModels
{
  return self->_placeCollectionViewModels;
}

- (void)setPlaceCollectionViewModels:(id)a3
{
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
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

- (CollectionsFilterMenu)filterMenu
{
  return self->_filterMenu;
}

- (void)setFilterMenu:(id)a3
{
}

- (PublisherAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (MKPlaceCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
}

- (MKPlaceCollectionsSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
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

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (PublisherHeaderViewActionManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_filterMenu, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedFilterIndexPath, 0);
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_placeCollectionViewModels, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);

  objc_storeStrong((id *)&self->_filterAnalyticsProvider, 0);
}

@end