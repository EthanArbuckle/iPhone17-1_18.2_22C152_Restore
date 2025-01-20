@interface CitySelectorDataSource
- (CitySelectorDataSource)initWithCollectionView:(id)a3 result:(id)a4 sections:(id)a5 routingDelegate:(id)a6 usingCollectionFetcher:(id)a7 usingBatchSize:(unint64_t)a8 selectedGuideLocation:(id)a9;
- (GEOAllGuidesLocationsViewResult)result;
- (GuidesLocationRoutingDelegate)routingDelegate;
- (MKPlaceCompactCollectionsLogicController)logicController;
- (NSArray)sections;
- (NSDiffableDataSourceSnapshot)snapshot;
- (UICollectionViewDiffableDataSource)dataSource;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dismissedCitySelector;
- (void)displayCitySelectorData;
- (void)initializeDataSource;
- (void)prepareSnapshot;
- (void)setDataSource:(id)a3;
- (void)setLogicController:(id)a3;
- (void)setResult:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4;
@end

@implementation CitySelectorDataSource

- (CitySelectorDataSource)initWithCollectionView:(id)a3 result:(id)a4 sections:(id)a5 routingDelegate:(id)a6 usingCollectionFetcher:(id)a7 usingBatchSize:(unint64_t)a8 selectedGuideLocation:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v36.receiver = self;
  v36.super_class = (Class)CitySelectorDataSource;
  v20 = [(DataSource *)&v36 initWithCollectionView:v14 updateLocation:0];
  v21 = v20;
  if (v20)
  {
    [(DataSource *)v20 collectionView];
    v22 = id v34 = v16;
    [v22 setDelegate:v21];

    objc_storeStrong((id *)&v21->_result, a4);
    objc_storeStrong((id *)&v21->_sections, a5);
    objc_storeWeak((id *)&v21->_routingDelegate, v17);
    v23 = [(DataSource *)v21 collectionView];
    uint64_t v24 = objc_opt_class();
    v25 = +[MKPlaceCompactCollectionCell reuseIdentifier];
    [v23 registerClass:v24 forCellWithReuseIdentifier:v25];

    uint64_t v26 = objc_opt_class();
    v27 = +[MKCollectionBatchCell reuseIdentifier];
    [v14 registerClass:v26 forCellWithReuseIdentifier:v27];

    v28 = [(DataSource *)v21 collectionView];
    uint64_t v29 = objc_opt_class();
    v30 = +[GuidesGenericSectionHeader reuseIdentifier];
    v31 = +[GuidesGenericSectionHeader reuseIdentifier];
    [v28 registerClass:v29 forSupplementaryViewOfKind:v30 withReuseIdentifier:v31];

    id v16 = v34;
    id v32 = [objc_alloc((Class)MKPlaceCompactCollectionsLogicController) initWithGuideLocationsResult:v15 context:0 usingCollectionFetcher:v18 usingGuideConsumer:v21 usingBatchSize:a8 selectedGuideLocation:v19];
    [(CitySelectorDataSource *)v21 setLogicController:v32];

    [(CitySelectorDataSource *)v21 initializeDataSource];
    [(CitySelectorDataSource *)v21 prepareSnapshot];
  }

  return v21;
}

- (void)displayCitySelectorData
{
  v3 = [(CitySelectorDataSource *)self snapshot];

  if (v3)
  {
    v4 = [(CitySelectorDataSource *)self dataSource];
    v5 = [(CitySelectorDataSource *)self snapshot];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100888190;
    v6[3] = &unk_1012E5D08;
    v6[4] = self;
    [v4 applySnapshot:v5 animatingDifferences:0 completion:v6];
  }
}

- (void)initializeDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v4 = [(DataSource *)self collectionView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100888388;
  v9[3] = &unk_1012EEE10;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  id v5 = [v3 initWithCollectionView:v4 cellProvider:v9];
  [(CitySelectorDataSource *)self setDataSource:v5];

  objc_copyWeak(&v8, &location);
  v6 = [(CitySelectorDataSource *)self dataSource];
  [v6 setSupplementaryViewProvider:&v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prepareSnapshot
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v4 = [(CitySelectorDataSource *)self sections];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(CitySelectorDataSource *)self sections];
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100888804;
  id v10 = &unk_1012FE7F8;
  v11 = self;
  id v12 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v7];

  -[CitySelectorDataSource setSnapshot:](self, "setSnapshot:", v6, v7, v8, v9, v10, v11);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CitySelectorDataSource *)self logicController];
  [v6 compactCollectionsInSection:[v5 section]];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v17 objectAtIndex:[v5 item]];
  uint64_t v8 = [v7 guideLocation];

  v9 = [(CitySelectorDataSource *)self routingDelegate];
  [v9 routeToGuideLocation:v8];

  id v10 = [v8 guideLocationIdentifier];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v10 muid]);
  id v12 = +[NSNumber numberWithInt:14];
  v13 = [v8 guideLocationIdentifier];
  id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 resultProviderID]);
  id v15 = [v5 section];

  id v16 = +[NSNumber numberWithInteger:v15];
  +[GEOAPPortal captureCuratedCollectionUserAction:177 target:27 value:v11 publisherId:0 following:0 collectionId:0 collectionCategory:0 collectionCurrentlySaved:0 verticalIndex:0 horizontalIndex:0 placeCardType:v12 possibleActions:0 impossibleActions:0 providerId:v14 repeatableSectionIndex:v16 modules:0];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a5;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = [(CitySelectorDataSource *)self logicController];
    [v9 willDisplayCellAtIndexpath:v10];
  }
}

- (void)dismissedCitySelector
{
  id v2 = [(CitySelectorDataSource *)self logicController];
  [v2 dismissedCompactCollections];
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  [(CitySelectorDataSource *)self prepareSnapshot];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100888C80;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (MKPlaceCompactCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
}

- (GEOAllGuidesLocationsViewResult)result
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

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (GuidesLocationRoutingDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);

  return (GuidesLocationRoutingDelegate *)WeakRetained;
}

- (void)setRoutingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_logicController, 0);
}

@end