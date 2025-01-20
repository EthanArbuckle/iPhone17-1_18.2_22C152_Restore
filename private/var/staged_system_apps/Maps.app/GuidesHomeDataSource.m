@interface GuidesHomeDataSource
- (BOOL)isFetchingData;
- (GEOGuidesHomeResult)result;
- (GuidesHomeAPIController)apiController;
- (GuidesHomeAnalytics)analyticsManager;
- (GuidesHomeDataSource)initWithCollectionView:(id)a3 result:(id)a4 routingDelegate:(id)a5 apiController:(id)a6 analyticsManager:(id)a7;
- (GuidesHomeHeaderCell)headerCell;
- (GuidesHomeLogicController)logicController;
- (GuidesHomeRoutingDelegate)routingDelegate;
- (NSDiffableDataSourceSnapshot)snapshot;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIEdgeInsets)actualContentInsets;
- (id)featuredGuideViewModel;
- (id)filterViewModels;
- (id)sectionAtIndex:(unint64_t)a3;
- (int64_t)currentState;
- (int64_t)filterSectionIndex;
- (unint64_t)guidesListCountAtIndex:(unint64_t)a3;
- (unint64_t)publishersListCountAtIndex:(unint64_t)a3;
- (void)cleanupGuidesHomeData;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3;
- (void)dealloc;
- (void)didChangeContentYOffset:(double)a3;
- (void)didRouteToConceptFilter:(id)a3 atIndexPath:(id)a4;
- (void)displayGuidesHomeByReloadingData;
- (void)displayGuidesHomeData;
- (void)filterDataFetchFinished;
- (void)filterDataFetchStarted;
- (void)initializeDataSource;
- (void)initializeSupplementaryViewProvider;
- (void)prepareSnapshot;
- (void)routeToCuratedCollectionAtIndex:(id)a3 inSection:(id)a4;
- (void)setActualContentInsets:(UIEdgeInsets)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApiController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHeaderCell:(id)a3;
- (void)setLogicController:(id)a3;
- (void)setResult:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4;
- (void)updateContentInset;
@end

@implementation GuidesHomeDataSource

- (GuidesHomeDataSource)initWithCollectionView:(id)a3 result:(id)a4 routingDelegate:(id)a5 apiController:(id)a6 analyticsManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v53.receiver = self;
  v53.super_class = (Class)GuidesHomeDataSource;
  v17 = [(DataSource *)&v53 initWithCollectionView:v12 updateLocation:0];
  v18 = v17;
  if (v17)
  {
    v19 = [(DataSource *)v17 collectionView];
    [v19 setDelegate:v18];

    objc_storeStrong((id *)&v18->_result, a4);
    objc_storeWeak((id *)&v18->_routingDelegate, v14);
    objc_storeStrong((id *)&v18->_apiController, a6);
    objc_storeWeak((id *)&v18->_analyticsManager, v16);
    v20 = [(DataSource *)v18 collectionView];
    uint64_t v21 = objc_opt_class();
    v22 = +[GuidesHomeHeaderCell reuseIdentifier];
    [v20 registerClass:v21 forCellWithReuseIdentifier:v22];

    v23 = [(DataSource *)v18 collectionView];
    uint64_t v24 = objc_opt_class();
    v25 = +[MKPlaceCompactCollectionCell reuseIdentifier];
    [v23 registerClass:v24 forCellWithReuseIdentifier:v25];

    v26 = [(DataSource *)v18 collectionView];
    uint64_t v27 = objc_opt_class();
    v28 = +[MKPlaceCollectionCell reuseIdentifier];
    [v26 registerClass:v27 forCellWithReuseIdentifier:v28];

    v29 = [(DataSource *)v18 collectionView];
    uint64_t v30 = objc_opt_class();
    v31 = +[PlaceCollectionListCell reuseIdentifier];
    [v29 registerClass:v30 forCellWithReuseIdentifier:v31];

    v32 = [(DataSource *)v18 collectionView];
    uint64_t v33 = objc_opt_class();
    v34 = +[CollectionsFilterCell reuseIdentifier];
    [v32 registerClass:v33 forCellWithReuseIdentifier:v34];

    v35 = [(DataSource *)v18 collectionView];
    uint64_t v36 = objc_opt_class();
    v37 = +[MKCollectionBatchCell reuseIdentifier];
    [v35 registerClass:v36 forCellWithReuseIdentifier:v37];

    v38 = [(DataSource *)v18 collectionView];
    uint64_t v39 = objc_opt_class();
    v40 = +[TwoLineCollectionViewListCell identifier];
    [v38 registerClass:v39 forCellWithReuseIdentifier:v40];

    v41 = [(DataSource *)v18 collectionView];
    uint64_t v42 = objc_opt_class();
    v43 = +[GuidesGenericSectionHeader reuseIdentifier];
    v44 = +[GuidesGenericSectionHeader reuseIdentifier];
    [v41 registerClass:v42 forSupplementaryViewOfKind:v43 withReuseIdentifier:v44];

    v45 = [GuidesHomeLogicController alloc];
    [v12 frame];
    double v47 = v46;
    v48 = [(GuidesHomeDataSource *)v18 apiController];
    v49 = [v15 guideLocation];
    v50 = [(GuidesHomeLogicController *)v45 initWithGuidesHomeResult:v13 maxWidth:v12 traitEnvironment:v48 guideFetcher:v18 guideConsumer:v49 guideLocation:v47];
    [(GuidesHomeDataSource *)v18 setLogicController:v50];

    [(GuidesHomeDataSource *)v18 initializeDataSource];
    [(GuidesHomeDataSource *)v18 prepareSnapshot];
    v51 = +[CuratedCollectionSyncManager sharedManager];
    [v51 addObserver:v18];
  }
  return v18;
}

- (void)dealloc
{
  [(GuidesHomeDataSource *)self cleanupGuidesHomeData];
  v3.receiver = self;
  v3.super_class = (Class)GuidesHomeDataSource;
  [(GuidesHomeDataSource *)&v3 dealloc];
}

- (void)displayGuidesHomeByReloadingData
{
  objc_super v3 = [(GuidesHomeDataSource *)self snapshot];

  if (v3)
  {
    self->_currentState = 1;
    v4 = [(GuidesHomeDataSource *)self dataSource];
    v5 = [(GuidesHomeDataSource *)self snapshot];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10055DC24;
    v6[3] = &unk_1012E5D08;
    v6[4] = self;
    [v4 applySnapshotUsingReloadData:v5 completion:v6];
  }
}

- (void)displayGuidesHomeData
{
  objc_super v3 = [(GuidesHomeDataSource *)self snapshot];

  if (v3)
  {
    self->_currentState = 1;
    v4 = [(GuidesHomeDataSource *)self dataSource];
    v5 = [(GuidesHomeDataSource *)self snapshot];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10055DD74;
    v6[3] = &unk_1012E5D08;
    v6[4] = self;
    [v4 applySnapshot:v5 animatingDifferences:0 completion:v6];
  }
}

- (void)didChangeContentYOffset:(double)a3
{
  v5 = [(GuidesHomeDataSource *)self headerCell];

  if (v5)
  {
    id v6 = [(GuidesHomeDataSource *)self headerCell];
    [v6 didChangeContentYOffset:a3];
  }
}

- (void)initializeDataSource
{
  self->_currentState = 0;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v4 = [(DataSource *)self collectionView];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10055DF3C;
  v6[3] = &unk_1012EEE10;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = [v3 initWithCollectionView:v4 cellProvider:v6];
  [(GuidesHomeDataSource *)self setDataSource:v5];

  [(GuidesHomeDataSource *)self initializeSupplementaryViewProvider];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)initializeSupplementaryViewProvider
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  v4 = [v3 _mapkit_fontWithWeight:UIFontWeightSemibold];

  NSAttributedStringKey v12 = NSFontAttributeName;
  id v13 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = [(GuidesHomeDataSource *)self dataSource];
  [v7 setSupplementaryViewProvider:&v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prepareSnapshot
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v4 = [(GuidesHomeDataSource *)self logicController];
  id v5 = [v4 allSections];

  [v3 appendSectionsWithIdentifiers:v5];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10055E8E4;
  id v10 = &unk_1012EEE60;
  id v11 = v3;
  NSAttributedStringKey v12 = self;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v7];
  -[GuidesHomeDataSource setSnapshot:](self, "setSnapshot:", v6, v7, v8, v9, v10);
}

- (BOOL)isFetchingData
{
  v2 = [(GuidesHomeDataSource *)self apiController];
  BOOL v3 = [v2 currentState] == (id)1;

  return v3;
}

- (void)filterDataFetchStarted
{
  [(GuidesHomeDataSource *)self updateContentInset];
  [(GuidesHomeDataSource *)self prepareSnapshot];

  [(GuidesHomeDataSource *)self displayGuidesHomeByReloadingData];
}

- (void)filterDataFetchFinished
{
  BOOL v3 = [(GuidesHomeDataSource *)self logicController];
  [v3 selectedFilterIndexPath];

  v4 = [(GuidesHomeDataSource *)self logicController];
  id v5 = [v4 selectedFilterIndexPath];

  if (!v5)
  {
    id v6 = [(GuidesHomeDataSource *)self apiController];
    [v6 cancelFetchingGuideHome];
  }
  id v7 = [(GuidesHomeDataSource *)self logicController];
  uint64_t v8 = [(GuidesHomeDataSource *)self apiController];
  id v9 = [v8 guideHomeFilteredCollectionResults];
  id v10 = [(GuidesHomeDataSource *)self apiController];
  id v11 = [v10 guideHomeFilteredCollectionResultsIds];
  [v7 updateFilteredCollectionsFromResults:v9 collectionIds:v11];

  [(GuidesHomeDataSource *)self prepareSnapshot];
  [(GuidesHomeDataSource *)self displayGuidesHomeByReloadingData];
  [(GuidesHomeDataSource *)self updateContentInset];
  NSAttributedStringKey v12 = [(GuidesHomeDataSource *)self logicController];
  id v13 = [v12 selectedFilterIndexPath];

  if (v13)
  {
    id v16 = [(GuidesHomeDataSource *)self analyticsManager];
    id v14 = [(GuidesHomeDataSource *)self apiController];
    id v15 = [v14 guideHomeFilteredCollectionResultsIds];
    [v16 guidesHomeDisplayFilteredGuideList:v15];
  }
}

- (void)updateContentInset
{
  if ([(GuidesHomeDataSource *)self isFetchingData])
  {
    BOOL v3 = [(DataSource *)self collectionView];
    [v3 contentInset];
    -[GuidesHomeDataSource setActualContentInsets:](self, "setActualContentInsets:");

    if ([(GuidesHomeDataSource *)self filterSectionIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    v4 = [(DataSource *)self collectionView];
    id v5 = [v4 collectionViewLayout];
    [v5 _layoutFrameForSection:[self filterSectionIndex]];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v36.origin.x = v7;
    v36.origin.y = v9;
    v36.size.width = v11;
    v36.size.height = v13;
    double MaxY = CGRectGetMaxY(v36);
    +[GuidesHomeSection loadingSectionHeight];
    double v16 = MaxY + v15;
    v17 = [(DataSource *)self collectionView];
    [v17 bounds];
    double v18 = CGRectGetMaxY(v37);

    if (v16 >= v18) {
      return;
    }
    v19 = [(DataSource *)self collectionView];
    [v19 contentInset];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    v28 = [(DataSource *)self collectionView];
    [v28 bounds];
    double v29 = v25 + CGRectGetMaxY(v38) - v16;
  }
  else
  {
    [(GuidesHomeDataSource *)self actualContentInsets];
    double v21 = v30;
    double v23 = v31;
    double v29 = v32;
    double v27 = v33;
  }
  id v34 = [(DataSource *)self collectionView];
  [v34 setContentInset:v21, v23, v29, v27];
}

- (int64_t)filterSectionIndex
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = [(GuidesHomeDataSource *)self logicController];
  BOOL v3 = [v2 allSections];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10055EE54;
  v6[3] = &unk_1012EEE88;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)routeToCuratedCollectionAtIndex:(id)a3 inSection:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = [(GuidesHomeDataSource *)self logicController];
  double v8 = [v7 itemsForSectionAtIndex:[v22 section]];

  uint64_t v9 = [v8 objectAtIndex:[v22 item]];
  uint64_t v10 = [v9 placeCollection];

  CGFloat v11 = +[CuratedCollectionSyncManager sharedManager];
  id v12 = [v11 collectionIsSaved:v10];

  if ([v6 contentType] == (id)1)
  {
    CGFloat v13 = [(GuidesHomeDataSource *)self analyticsManager];
    id v14 = [v10 collectionIdentifier];
    double v15 = [v10 publisher];
    double v16 = [v15 identifier];
    [v13 guidesHomeTappedEditorPickedGuide:v14 publisherId:v16 isCurrentlySaved:v12 atIndex:[v22 item] section:[v22 section]];
  }
  else if ([v6 contentType] == (id)2)
  {
    CGFloat v13 = [(GuidesHomeDataSource *)self analyticsManager];
    id v14 = [v10 collectionIdentifier];
    double v15 = [v10 publisher];
    double v16 = [v15 identifier];
    [v13 guidesHomeTappedTemporalGuide:v14 publisherId:v16 isCurrentlySaved:v12 atIndex:[v22 item] section:[v22 section]];
  }
  else if ([v6 kind] == (id)4)
  {
    CGFloat v13 = [(GuidesHomeDataSource *)self analyticsManager];
    id v14 = [v10 collectionIdentifier];
    double v15 = [v10 publisher];
    double v16 = [v15 identifier];
    [v13 guidesHomeTappedLatestGuide:v14 publisherId:v16 isCurrentlySaved:v12 atIndex:[v22 item] section:[v22 section]];
  }
  else
  {
    if ([v6 kind] != (id)6) {
      goto LABEL_10;
    }
    v17 = [(GuidesHomeDataSource *)self logicController];
    double v18 = [(GuidesHomeDataSource *)self logicController];
    v19 = [v18 selectedFilterIndexPath];
    CGFloat v13 = [v17 filterValueAtIndex:[v19 item]];

    id v14 = [(GuidesHomeDataSource *)self analyticsManager];
    double v15 = [v10 collectionIdentifier];
    double v16 = [v10 publisher];
    double v20 = [v16 identifier];
    [v14 guidesHomeTappedFilteredGuide:v15 publisherId:v20 isCurrentlySaved:[v22 item] section:[v22 section] atIndex:v12 carouselIndex:v13 filterValue:];
  }
LABEL_10:
  double v21 = [(GuidesHomeDataSource *)self routingDelegate];
  [v21 routeToCuratedCollection:v10];
}

- (void)cleanupGuidesHomeData
{
  BOOL v3 = +[CuratedCollectionSyncManager sharedManager];
  [v3 removeObserver:self];

  [(GuidesHomeDataSource *)self setLogicController:0];
  [(GuidesHomeDataSource *)self setResult:0];
  [(GuidesHomeDataSource *)self setDataSource:0];
  [(GuidesHomeDataSource *)self setSnapshot:0];
  [(GuidesHomeDataSource *)self setRoutingDelegate:0];
  [(GuidesHomeDataSource *)self setApiController:0];

  [(GuidesHomeDataSource *)self setHeaderCell:0];
}

- (id)sectionAtIndex:(unint64_t)a3
{
  int64_t v4 = [(GuidesHomeDataSource *)self logicController];
  id v5 = [v4 sectionAtIndex:a3];

  return v5;
}

- (id)filterViewModels
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  CGFloat v11 = sub_100103D0C;
  id v12 = sub_100104710;
  id v13 = 0;
  BOOL v3 = [(GuidesHomeDataSource *)self logicController];
  int64_t v4 = [v3 allSections];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10055F480;
  v7[3] = &unk_1012EEEB0;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)featuredGuideViewModel
{
  v2 = [(GuidesHomeDataSource *)self logicController];
  BOOL v3 = [v2 itemsForSectionAtIndex:0];
  int64_t v4 = [v3 firstObject];

  return v4;
}

- (unint64_t)guidesListCountAtIndex:(unint64_t)a3
{
  int64_t v4 = [(GuidesHomeDataSource *)self logicController];
  id v5 = [v4 itemsForSectionAtIndex:a3];
  id v6 = [v5 count];

  return (unint64_t)v6;
}

- (unint64_t)publishersListCountAtIndex:(unint64_t)a3
{
  int64_t v4 = [(GuidesHomeDataSource *)self logicController];
  id v5 = [v4 itemsForSectionAtIndex:a3];
  id v6 = [v5 count];

  return (unint64_t)v6;
}

- (void)didRouteToConceptFilter:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GuidesHomeDataSource *)self isFetchingData])
  {
    uint64_t v8 = [(GuidesHomeDataSource *)self apiController];
    [v8 cancelFetchingGuideHome];
  }
  objc_initWeak(&location, self);
  uint64_t v9 = [(GuidesHomeDataSource *)self apiController];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  double v15 = sub_10055F804;
  double v16 = &unk_1012E6708;
  objc_copyWeak(&v17, &location);
  [v9 fetchGuidesHomeViewFilteredBy:v6 onCompletion:&v13];

  [(GuidesHomeDataSource *)self filterDataFetchStarted];
  if (v7)
  {
    uint64_t v10 = [(GuidesHomeDataSource *)self analyticsManager];
    CGFloat v11 = [(GuidesHomeDataSource *)self logicController];
    id v12 = [v11 filterValueAtIndex:[v7 item]];
    [v10 guideHomeTappedFilter:v12 atIndex:[v7 item] section:[v7 section]];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:0];
  id v7 = [(GuidesHomeDataSource *)self logicController];
  uint64_t v8 = [v7 sectionAtIndex:[v6 section]];

  if (v8)
  {
    [v8 configuration];

    switch(v29)
    {
      case 1:
        uint64_t v9 = [(GuidesHomeDataSource *)self logicController];
        uint64_t v10 = [v9 selectedFilterIndexPath];
        unsigned int v11 = [v10 isEqual:v6];

        id v12 = [(GuidesHomeDataSource *)self logicController];
        id v13 = v12;
        if (v11)
        {
          id v14 = [v12 routeToSelectedGuidesHomeFilterAtIndexPath:0];

          [(GuidesHomeDataSource *)self didRouteToConceptFilter:0 atIndexPath:0];
        }
        else
        {
          double v26 = [v12 routeToSelectedGuidesHomeFilterAtIndexPath:v6];

          double v27 = [v26 conceptFilter];
          [(GuidesHomeDataSource *)self didRouteToConceptFilter:v27 atIndexPath:v6];
        }
        break;
      case 2:
        double v15 = [(GuidesHomeDataSource *)self logicController];
        double v16 = [v15 itemsForSectionAtIndex:[v6 section]];

        id v17 = [v16 objectAtIndex:[v6 item]];
        double v18 = [v17 guideLocation];

        v19 = [(GuidesHomeDataSource *)self analyticsManager];
        double v20 = [v18 guideLocationIdentifier];
        [v19 guidesHomeTappedCityGuide:v20 atIndex:[v6 item] section:[v6 section]];

        double v21 = [(GuidesHomeDataSource *)self routingDelegate];
        [v21 routeToGuideLocation:v18];
        goto LABEL_9;
      case 3:
      case 4:
      case 6:
        [(GuidesHomeDataSource *)self routeToCuratedCollectionAtIndex:v6 inSection:v8];
        break;
      case 5:
        id v22 = [(GuidesHomeDataSource *)self logicController];
        double v16 = [v22 itemsForSectionAtIndex:[v6 section]];

        double v23 = [v16 objectAtIndex:[v6 item]];
        double v18 = [v23 publisher];

        double v24 = [(GuidesHomeDataSource *)self analyticsManager];
        double v25 = [v18 identifier];
        [v24 guidesHomeTappedPublisher:v25 atIndex:[v6 item] section:[v6 section]];

        double v21 = [(GuidesHomeDataSource *)self routingDelegate];
        [v21 routeToPublisher:v18];
LABEL_9:

        break;
      default:
        break;
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(GuidesHomeDataSource *)self logicController];
  [v7 willDisplayCellAtIndexpath:v6];
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(GuidesHomeDataSource *)self logicController];
  id v6 = [v5 allSections];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = sub_10055FD04;
  id v12 = &unk_1012EEE60;
  id v7 = v4;
  id v13 = v7;
  id v14 = self;
  [v6 enumerateObjectsUsingBlock:&v9];

  if (objc_msgSend(v7, "count", v9, v10, v11, v12))
  {
    uint64_t v8 = [(GuidesHomeDataSource *)self snapshot];
    [v8 reconfigureItemsWithIdentifiers:v7];
    [(GuidesHomeDataSource *)self setSnapshot:v8];
    [(GuidesHomeDataSource *)self displayGuidesHomeData];
  }
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  id v5 = a4;
  id v6 = [(GuidesHomeDataSource *)self dataSource];
  id v7 = [v6 snapshot];

  uint64_t v8 = [(GuidesHomeDataSource *)self logicController];
  [v8 appendBatchOfCollections:v5];

  uint64_t v9 = [(GuidesHomeDataSource *)self logicController];
  uint64_t v10 = [v9 allSections];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10055FEC8;
  v13[3] = &unk_1012EEED8;
  id v14 = v7;
  double v15 = self;
  id v16 = v5;
  id v11 = v5;
  id v12 = v7;
  [v10 enumerateObjectsUsingBlock:v13];
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (GuidesHomeLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
}

- (GEOGuidesHomeResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
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

- (GuidesHomeRoutingDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);

  return (GuidesHomeRoutingDelegate *)WeakRetained;
}

- (void)setRoutingDelegate:(id)a3
{
}

- (GuidesHomeAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (GuidesHomeAnalytics)analyticsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsManager);

  return (GuidesHomeAnalytics *)WeakRetained;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (GuidesHomeHeaderCell)headerCell
{
  return self->_headerCell;
}

- (void)setHeaderCell:(id)a3
{
}

- (UIEdgeInsets)actualContentInsets
{
  double top = self->_actualContentInsets.top;
  double left = self->_actualContentInsets.left;
  double bottom = self->_actualContentInsets.bottom;
  double right = self->_actualContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setActualContentInsets:(UIEdgeInsets)a3
{
  self->_actualContentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_destroyWeak((id *)&self->_analyticsManager);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_logicController, 0);
}

@end