@interface DirectionsStepsListDataSource
- (BOOL)_isDimmedStepAtIndex:(int64_t)a3;
- (BOOL)_shouldDimStepWithRow:(unint64_t)a3 selectedStepIndex:(unint64_t)a4;
- (BOOL)_shouldHighlightCurrentStep;
- (BOOL)_stepsSectionItemsExcludesFirstStep;
- (BOOL)allowsStepSelection;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)enableNavigationUpdates;
- (BOOL)isDisplayedInRoutePlanning;
- (BOOL)scrollViewDecelerating;
- (BOOL)shouldFlattenToSingleSection;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)usesLargeCells;
- (Class)_directionsOriginDestinationCellClass;
- (Class)_directionsOriginDestinationCollectionViewCellClass;
- (Class)_directionsStepCellClass;
- (Class)_directionsStepCollectionViewCellClass;
- (DirectionsStepsListDataSource)init;
- (GEOComposedRoute)route;
- (NSArray)sections;
- (NSArray)stepsSectionItems;
- (RouteStepListDelegate)delegate;
- (UICollectionView)collectionView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UITableView)tableView;
- (double)_availableWidth;
- (double)_calculateWidthForCachedRowHeights;
- (double)_heightForRowAtIndexPath:(id)a3;
- (double)_rowHeightForStartEndCell:(BOOL)a3;
- (double)_rowHeightForStep:(id)a3;
- (double)_trailingViewWidth;
- (double)scrollViewOffsetStart;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_adjustedItemToSelectFromIndexPath:(id)a3;
- (id)_elevationCellForIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)_flatIndexFromIndexPath:(id)a3;
- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)_indexPathFromFlatIndexPath:(id)a3;
- (id)_itemAtIndexPath:(id)a3;
- (id)_stepCellForIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)_stepCellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)reloadHandler;
- (id)routeStepForIndexPath:(id)a3;
- (id)scrollDirectionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_footerCommands;
- (int64_t)_idiom;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)_sectionAtIndex:(int64_t)a3;
- (int64_t)_sectionIndexForSection:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)shieldArtworkSize;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_rowIndexForCurrentlyMatchedStep;
- (unint64_t)_selectionRouteStepIndexForRowIndex:(unint64_t)a3;
- (unint64_t)indexOfFirstDisplayedStep;
- (unint64_t)options;
- (unint64_t)routeStepIndexForRowIndex:(unint64_t)a3;
- (void)_buildDataSourceItems;
- (void)_configureStartEndCell:(id)a3 forIndexPath:(id)a4;
- (void)_configureStepCell:(id)a3 forIndexPath:(id)a4;
- (void)_consumeUpdatedGarage:(id)a3;
- (void)_handleElevationInfoButtonTap:(id)a3;
- (void)_handleLocaleChangeNotification:(id)a3;
- (void)_scrollToRouteStepAnimated:(BOOL)a3;
- (void)_updateElevationHeaderHeight;
- (void)_updateElevationHeaderTableInset;
- (void)_updateElevationHeaderView;
- (void)_updateRegisteredCellClasses;
- (void)_updateRouteFromNavigationProvider;
- (void)_willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3;
- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3;
- (void)directionsElevationGraphHeaderViewDidRecalculateHeights:(id)a3;
- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3;
- (void)invalidateLayoutAndReloadData;
- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5;
- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4;
- (void)navigationProvider:(id)a3 didUpdateElapsedDistanceAlongRoute:(double)a4;
- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadData;
- (void)resumeAutoscrollingToStep;
- (void)scrollToCurrentStep;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowStepSelection:(BOOL)a3;
- (void)setCollapsingHeaderSuperview:(id)a3 topAnchorConstraint:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedInRoutePlanning:(BOOL)a3;
- (void)setEnableNavigationUpdates:(BOOL)a3;
- (void)setFlattenToSingleSection:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReloadHandler:(id)a3;
- (void)setRoute:(id)a3;
- (void)setScrollDirectionHandler:(id)a3;
- (void)setScrollViewDecelerating:(BOOL)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setScrollViewOffsetStart:(double)a3;
- (void)setSections:(id)a3;
- (void)setShieldArtworkSize:(int64_t)a3;
- (void)setStepsSectionItems:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUseLargeCells:(BOOL)a3;
- (void)suspendAutoscrollingToStep;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation DirectionsStepsListDataSource

- (void)dealloc
{
  v3 = [(DirectionsStepsListDataSource *)self tableView];

  if (v3)
  {
    v4 = [(DirectionsStepsListDataSource *)self tableView];
    [v4 removeObserver:self forKeyPath:@"bounds"];
  }
  v5 = [(DirectionsStepsListDataSource *)self collectionView];

  if (v5)
  {
    v6 = [(DirectionsStepsListDataSource *)self collectionView];
    [v6 removeObserver:self forKeyPath:@"bounds"];
  }
  v7.receiver = self;
  v7.super_class = (Class)DirectionsStepsListDataSource;
  [(DirectionsStepsListDataSource *)&v7 dealloc];
}

- (DirectionsStepsListDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)DirectionsStepsListDataSource;
  v2 = [(DirectionsStepsListDataSource *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_options = 7;
    v2->_allowStepSelection = 1;
    v2->_shieldArtworkSize = 4;
    v4 = +[NSNotificationCenter defaultCenter];
    v5 = MNLocaleDidChangeNotification();
    [v4 addObserver:v3 selector:"_handleLocaleChangeNotification:" name:v5 object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    objc_super v7 = +[VGVirtualGarageService sharedService];
    [v7 registerObserver:v3];

    objc_initWeak(&location, v3);
    v8 = +[VGVirtualGarageService sharedService];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100688F88;
    v10[3] = &unk_1012E65A8;
    objc_copyWeak(&v11, &location);
    [v8 virtualGarageGetGarageWithReply:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
  }
}

- (void)setTableView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained removeObserver:self forKeyPath:@"bounds"];
    }
    objc_storeWeak((id *)&self->_tableView, obj);
    if (obj)
    {
      [(DirectionsStepsListDataSource *)self setCollectionView:0];
      [(DirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
      [obj registerClass:objc_opt_class() forCellReuseIdentifier:@"FooterView"];
      [obj addObserver:self forKeyPath:@"bounds" options:1 context:0];
      [(DirectionsStepsListDataSource *)self _updateElevationHeaderView];
    }
  }
}

- (void)setCollectionView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained removeObserver:self forKeyPath:@"bounds"];
    }
    objc_storeWeak((id *)&self->_collectionView, obj);
    if (obj)
    {
      [(DirectionsStepsListDataSource *)self setTableView:0];
      [(DirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
      [obj registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Elevation"];
      [obj registerClass:objc_opt_class() forCellWithReuseIdentifier:@"FooterView"];
      [obj addObserver:self forKeyPath:@"bounds" options:1 context:0];
    }
  }
}

- (void)setFlattenToSingleSection:(BOOL)a3
{
  if (self->_flattenToSingleSection != a3)
  {
    self->_flattenToSingleSection = a3;
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
  }
}

- (void)setUseLargeCells:(BOOL)a3
{
  if (self->_useLargeCells != a3)
  {
    self->_useLargeCells = a3;
    [(DirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
  }
}

- (void)setDisplayedInRoutePlanning:(BOOL)a3
{
  if (self->_displayedInRoutePlanning != a3)
  {
    self->_displayedInRoutePlanning = a3;
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
  }
}

- (void)_consumeUpdatedGarage:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_virtualGarage] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_virtualGarage, a3);
    v5 = [(DirectionsStepsListDataSource *)self route];
    unsigned int v6 = [v5 isEVRoute];

    if (v6) {
      [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(DirectionsStepsListDataSource *)self tableView];
  if ((id)v13 == v11)
  {
  }
  else
  {
    v14 = (void *)v13;
    id v15 = [(DirectionsStepsListDataSource *)self collectionView];

    if (v15 != v11)
    {
      v17.receiver = self;
      v17.super_class = (Class)DirectionsStepsListDataSource;
      [(DirectionsStepsListDataSource *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_8;
    }
  }
  [(DirectionsStepsListDataSource *)self _calculateWidthForCachedRowHeights];
  if (self->_routeStepRowHeights && self->_availableWidthForCachedRowHeights != v16) {
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
  }
LABEL_8:
}

- (Class)_directionsStepCellClass
{
  [(DirectionsStepsListDataSource *)self usesLargeCells];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (Class)_directionsOriginDestinationCellClass
{
  [(DirectionsStepsListDataSource *)self usesLargeCells];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (Class)_directionsStepCollectionViewCellClass
{
  [(DirectionsStepsListDataSource *)self usesLargeCells];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (Class)_directionsOriginDestinationCollectionViewCellClass
{
  [(DirectionsStepsListDataSource *)self usesLargeCells];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (void)_updateRegisteredCellClasses
{
  v3 = [(DirectionsStepsListDataSource *)self tableView];

  if (v3)
  {
    v4 = [(DirectionsStepsListDataSource *)self _directionsStepCellClass];
    v5 = [(DirectionsStepsListDataSource *)self _directionsOriginDestinationCellClass];
    unsigned int v6 = [(DirectionsStepsListDataSource *)self tableView];
    id v7 = [(objc_class *)v4 reuseIdentifier];
    [v6 registerClass:v4 forCellReuseIdentifier:v7];

    id v14 = [(DirectionsStepsListDataSource *)self tableView];
    v8 = [(objc_class *)v5 reuseIdentifier];
    [v14 registerClass:v5 forCellReuseIdentifier:v8];
  }
  else
  {
    v9 = [(DirectionsStepsListDataSource *)self collectionView];

    if (!v9) {
      return;
    }
    id v10 = [(DirectionsStepsListDataSource *)self _directionsStepCollectionViewCellClass];
    id v11 = [(DirectionsStepsListDataSource *)self _directionsOriginDestinationCollectionViewCellClass];
    id v12 = [(DirectionsStepsListDataSource *)self collectionView];
    uint64_t v13 = [(objc_class *)v10 reuseIdentifier];
    [v12 registerClass:v10 forCellWithReuseIdentifier:v13];

    id v14 = [(DirectionsStepsListDataSource *)self collectionView];
    v8 = [(objc_class *)v11 reuseIdentifier];
    [v14 registerClass:v11 forCellWithReuseIdentifier:v8];
  }
}

- (NSArray)sections
{
  sections = self->_sections;
  if (!sections)
  {
    [(DirectionsStepsListDataSource *)self _buildDataSourceItems];
    sections = self->_sections;
  }

  return sections;
}

- (NSArray)stepsSectionItems
{
  stepsSectionItems = self->_stepsSectionItems;
  if (!stepsSectionItems)
  {
    [(DirectionsStepsListDataSource *)self _buildDataSourceItems];
    stepsSectionItems = self->_stepsSectionItems;
  }

  return stepsSectionItems;
}

- (unint64_t)indexOfFirstDisplayedStep
{
  return [(DirectionsStepsListDataSource *)self _stepsSectionItemsExcludesFirstStep];
}

- (BOOL)_stepsSectionItemsExcludesFirstStep
{
  id v2 = [(DirectionsStepsListDataSource *)self route];
  v3 = [v2 steps];
  v4 = [v3 firstObject];

  if ([v4 isStartOrResumeStep])
  {
    v5 = [v4 geoStep];
    unsigned int v6 = [v5 instructionSet];
    unsigned int v7 = [v6 hasDrivingWalkingListInstruction] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)reloadData
{
  [(DirectionsStepsListDataSource *)self _buildDataSourceItems];
  v3 = [(DirectionsStepsListDataSource *)self tableView];
  v4 = [v3 superview];
  if (v4)
  {
  }
  else
  {
    v5 = [(DirectionsStepsListDataSource *)self collectionView];
    unsigned int v6 = [v5 superview];

    if (!v6) {
      return;
    }
  }
  unsigned int v7 = [(DirectionsStepsListDataSource *)self route];

  if (v7)
  {
    self->_routeHasNoManeuvers = 1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = [(DirectionsStepsListDataSource *)self route];
    v9 = [v8 steps];

    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) geoStep];
          if ([v14 hasManeuverType] && objc_msgSend(v14, "maneuverType")) {
            self->_routeHasNoManeuvers = 0;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection]
      && ([(DirectionsStepsListDataSource *)self reloadHandler],
          id v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      double v16 = [(DirectionsStepsListDataSource *)self reloadHandler];
      v16[2]();
    }
    else
    {
      objc_super v17 = [(DirectionsStepsListDataSource *)self tableView];
      [v17 reloadData];

      double v16 = [(DirectionsStepsListDataSource *)self collectionView];
      [v16 reloadData];
    }

    if (!self->_temporarilyDisableAutoscroll) {
      [(DirectionsStepsListDataSource *)self scrollToCurrentStep];
    }
  }
}

- (void)invalidateLayoutAndReloadData
{
  free(self->_routeStepRowHeights);
  routeOverviewCellCachedHeight = self->_routeOverviewCellCachedHeight;
  self->_routeOverviewCellCachedHeight = 0;
  self->_routeStepRowHeights = 0;

  [(DirectionsStepsListDataSource *)self reloadData];

  [(DirectionsStepsListDataSource *)self _updateElevationHeaderView];
}

- (void)_buildDataSourceItems
{
  v3 = [(DirectionsStepsListDataSource *)self route];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    if (([(DirectionsStepsListDataSource *)self options] & 4) != 0)
    {
      v5 = [v3 elevationProfile];

      if (v5) {
        [v4 addObject:&off_1013A8158];
      }
    }
    unsigned int v6 = [v3 steps];
    unsigned int v7 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v14 = [v13 geoStep:(void)v22];
          if (![v14 hasManeuverType]
            || [v14 maneuverType] != 85)
          {
            [v7 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
    if ([(DirectionsStepsListDataSource *)self options]) {
      [v15 addObject:@"OriginPinRow"];
    }
    uint64_t v16 = [(DirectionsStepsListDataSource *)self _stepsSectionItemsExcludesFirstStep];
    objc_super v17 = objc_msgSend(v7, "subarrayWithRange:", v16, (char *)objc_msgSend(v7, "count") - v16);
    [v15 addObjectsFromArray:v17];

    if (([(DirectionsStepsListDataSource *)self options] & 2) != 0) {
      [v15 addObject:@"DestinationPinRow"];
    }
    if ([v15 count]) {
      [v4 addObject:&off_1013A8170];
    }
    if (([(DirectionsStepsListDataSource *)self options] & 8) != 0) {
      [v4 addObject:&off_1013A8188];
    }
  }
  else
  {
    id v15 = 0;
    id v4 = 0;
  }
  long long v18 = (NSArray *)[v4 copy];
  sections = self->_sections;
  self->_sections = v18;

  long long v20 = (NSArray *)[v15 copy];
  stepsSectionItems = self->_stepsSectionItems;
  self->_stepsSectionItems = v20;
}

- (void)setRoute:(id)a3
{
  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    unsigned int v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    [(DirectionsStepsListDataSource *)self setEnableNavigationUpdates:0];
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
    v5 = v6;
  }
}

- (void)setEnableNavigationUpdates:(BOOL)a3
{
  if (self->_enableNavigationUpdates != a3)
  {
    self->_enableNavigationUpdates = a3;
    if (a3)
    {
      id v4 = [[DirectionsStepsListNavigationProvider alloc] initWithDelegate:self];
      navigationProvider = self->_navigationProvider;
      self->_navigationProvider = v4;

      [(DirectionsStepsListDataSource *)self _updateRouteFromNavigationProvider];
    }
    else
    {
      unsigned int v6 = self->_navigationProvider;
      self->_navigationProvider = 0;
    }
  }
}

- (void)_updateRouteFromNavigationProvider
{
  navigationProvider = self->_navigationProvider;
  if (!navigationProvider) {
    return;
  }
  if (![(DirectionsStepsListNavigationProvider *)navigationProvider isNavigating]
    || ([(DirectionsStepsListNavigationProvider *)self->_navigationProvider route],
        (id v4 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = 0;
    p_route = (id *)&self->_route;
LABEL_8:
    id v7 = *p_route;
    id *p_route = 0;

LABEL_9:
    [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
    v5 = v8;
    goto LABEL_10;
  }
  v5 = v4;
  p_route = (id *)&self->_route;
  if (self->_route != v4)
  {
    id v8 = v4;
    objc_storeStrong((id *)&self->_route, v4);
    if ([*p_route transportType] != 1) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_10:
}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5
{
}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4
{
}

- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4
{
  self->_temporarilyDisableAutoscroll = 1;
  [(DirectionsStepsListDataSource *)self invalidateLayoutAndReloadData];
  self->_temporarilyDisableAutoscroll = 0;

  [(DirectionsStepsListDataSource *)self _scrollToRouteStepAnimated:1];
}

- (void)navigationProvider:(id)a3 didUpdateElapsedDistanceAlongRoute:(double)a4
{
}

- (id)routeStepForIndexPath:(id)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a3];
  if ((id)-[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]) != (id)1) {
    goto LABEL_7;
  }
  id v5 = [v4 row];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  id v6 = v5;
  id v7 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v8 = [v7 count];

  if (v6 >= v8
    || (v9 = -[DirectionsStepsListDataSource _selectionRouteStepIndexForRowIndex:](self, "_selectionRouteStepIndexForRowIndex:", v6), v9 == 0x7FFFFFFFFFFFFFFFLL)|| (v10 = v9, -[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"), uint64_t v11 = objc_claimAutoreleasedReturnValue(), v12 = [v11 count], v11, v10 >= (unint64_t)v12))
  {
LABEL_7:
    id v14 = 0;
  }
  else
  {
    uint64_t v13 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
    id v14 = [v13 objectAtIndexedSubscript:v10];
  }

  return v14;
}

- (unint64_t)_rowIndexForCurrentlyMatchedStep
{
  navigationProvider = self->_navigationProvider;
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (navigationProvider)
  {
    id v5 = [(DirectionsStepsListNavigationProvider *)navigationProvider activeStepIndex];
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = &v5[[(DirectionsStepsListDataSource *)self options] & 1];
      return (unint64_t)&v6[-[(DirectionsStepsListDataSource *)self _stepsSectionItemsExcludesFirstStep]];
    }
  }
  return v4;
}

- (id)_itemAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]);
  if (v5 == 2)
  {
    id v6 = @"FooterView";
  }
  else if (v5 == 1)
  {
    if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
      || (id v7 = [v4 row],
          [(DirectionsStepsListDataSource *)self stepsSectionItems],
          id v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = [v8 count],
          v8,
          v7 >= v9))
    {
      id v6 = 0;
    }
    else
    {
      unint64_t v10 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
      [v10 objectAtIndexedSubscript:[v4 row]];
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = @"Elevation";
  }

  return v6;
}

- (id)_adjustedItemToSelectFromIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v4];
  if (v5 == @"OriginPinRow")
  {
    uint64_t v11 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] + 1, objc_msgSend(v4, "section"));
    id v8 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v11];

    if (v8 == @"DestinationPinRow" || v8 == 0) {
      unint64_t v10 = @"OriginPinRow";
    }
    else {
      unint64_t v10 = v8;
    }
  }
  else
  {
    id v6 = v5;
    if (v5 != @"DestinationPinRow") {
      goto LABEL_16;
    }
    id v7 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] - 1, objc_msgSend(v4, "section"));
    id v8 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v7];

    if (v8 == @"OriginPinRow" || v8 == 0) {
      unint64_t v10 = @"DestinationPinRow";
    }
    else {
      unint64_t v10 = v8;
    }
  }
  id v6 = v10;

LABEL_16:

  return v6;
}

- (unint64_t)routeStepIndexForRowIndex:(unint64_t)a3
{
  int64_t v5 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (char *)[(__CFString *)v6 stepIndex];
  }
  else if (v6 == @"DestinationPinRow")
  {
    id v8 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
    id v7 = (char *)[v8 count] - 1;
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (unint64_t)_selectionRouteStepIndexForRowIndex:(unint64_t)a3
{
  int64_t v5 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  if (v6 == @"OriginPinRow")
  {
    unint64_t v7 = a3 + 1;
  }
  else if (v6 == @"DestinationPinRow")
  {
    unint64_t v7 = a3 - 1;
  }
  else
  {
    unint64_t v7 = [(DirectionsStepsListDataSource *)self routeStepIndexForRowIndex:a3];
  }

  return v7;
}

- (BOOL)_shouldHighlightCurrentStep
{
  return self->_navigationProvider != 0;
}

- (void)setCollapsingHeaderSuperview:(id)a3 topAnchorConstraint:(id)a4
{
  id v6 = (UIView *)a3;
  unint64_t v7 = (NSLayoutConstraint *)a4;
  headerSuperview = self->_headerSuperview;
  self->_headerSuperview = v6;
  id v9 = v6;

  headerTableViewTopAnchorConstraint = self->_headerTableViewTopAnchorConstraint;
  self->_headerTableViewTopAnchorConstraint = v7;

  [(DirectionsStepsListDataSource *)self _updateElevationHeaderView];
}

- (void)_updateElevationHeaderView
{
  if (([(DirectionsStepsListDataSource *)self options] & 4) != 0)
  {
    id v4 = [(DirectionsStepsListDataSource *)self route];
    int64_t v5 = [v4 elevationProfile];
    BOOL v3 = v5 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  graphHeaderView = self->_graphHeaderView;
  if (self->_headerSuperview)
  {
    if (graphHeaderView) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v3;
    }
    if (v7)
    {
      id v8 = -[DirectionsElevationGraphHeaderView initWithFrame:]([DirectionsElevationGraphHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      id v9 = self->_graphHeaderView;
      self->_graphHeaderView = v8;

      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_headerSuperview addSubview:self->_graphHeaderView];
      unint64_t v10 = [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView heightAnchor];
      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView maximumHeight];
      [v10 constraintEqualToConstant:];
      uint64_t v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      graphHeaderViewHeightConstraint = self->_graphHeaderViewHeightConstraint;
      self->_graphHeaderViewHeightConstraint = v11;

      id v39 = [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView topAnchor];
      uint64_t v13 = [(UIView *)self->_headerSuperview topAnchor];
      id v14 = [v39 constraintEqualToAnchor:v13];
      v41[0] = v14;
      id v15 = [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView leadingAnchor];
      uint64_t v16 = [(UIView *)self->_headerSuperview leadingAnchor];
      objc_super v17 = [v15 constraintEqualToAnchor:v16];
      v41[1] = v17;
      long long v18 = [(UIView *)self->_headerSuperview trailingAnchor];
      long long v19 = [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView trailingAnchor];
      long long v20 = [v18 constraintEqualToAnchor:v19];
      long long v21 = self->_graphHeaderViewHeightConstraint;
      v41[2] = v20;
      v41[3] = v21;
      long long v22 = +[NSArray arrayWithObjects:v41 count:4];
      +[NSLayoutConstraint activateConstraints:v22];

      graphHeaderView = self->_graphHeaderView;
LABEL_14:
      [(DirectionsElevationGraphHeaderView *)graphHeaderView setDelegate:self];
      long long v24 = [(DirectionsStepsListDataSource *)self route];
      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setRoute:v24];

      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setStyleForNavigation:self->_navigationProvider != 0];
      long long v25 = self->_graphHeaderView;
      [(DirectionsStepsListNavigationProvider *)self->_navigationProvider elapsedDistance];
      -[DirectionsElevationGraphHeaderView setNavigationProgress:](v25, "setNavigationProgress:");
      [(DirectionsStepsListDataSource *)self _updateElevationHeaderTableInset];
      [(DirectionsStepsListDataSource *)self _updateElevationHeaderHeight];
      return;
    }
    if (graphHeaderView) {
      char v23 = v3;
    }
    else {
      char v23 = 1;
    }
    if (v23) {
      goto LABEL_14;
    }
  }
  [(DirectionsElevationGraphHeaderView *)graphHeaderView removeFromSuperview];
  [(NSLayoutConstraint *)self->_headerTableViewTopAnchorConstraint setConstant:0.0];
  v26 = self->_graphHeaderViewHeightConstraint;
  self->_graphHeaderViewHeightConstraint = 0;

  v27 = self->_graphHeaderView;
  self->_graphHeaderView = 0;

  v28 = [(DirectionsStepsListDataSource *)self tableView];
  [v28 contentInset];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = [(DirectionsStepsListDataSource *)self tableView];
  [v35 setContentInset:0.0, v30, v32, v34];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v40 = [(DirectionsStepsListDataSource *)self tableView];
  [v40 setVerticalScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];
}

- (void)_updateElevationHeaderTableInset
{
  BOOL v3 = [(DirectionsStepsListDataSource *)self tableView];
  if (v3 && (graphHeaderView = self->_graphHeaderView) != 0)
  {
    unsigned __int8 v5 = [(DirectionsElevationGraphHeaderView *)graphHeaderView isRecalatingHeights];

    if ((v5 & 1) == 0)
    {
      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView minimumHeight];
      -[NSLayoutConstraint setConstant:](self->_headerTableViewTopAnchorConstraint, "setConstant:");
      id v6 = [(DirectionsStepsListDataSource *)self tableView];
      [v6 contentInset];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView maximumHeight];
      double v14 = v13;
      [(NSLayoutConstraint *)self->_headerTableViewTopAnchorConstraint constant];
      double v16 = v14 - v15;
      objc_super v17 = [(DirectionsStepsListDataSource *)self tableView];
      [v17 setContentInset:v16, v8, v10, v12];

      double left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
      id v24 = [(DirectionsStepsListDataSource *)self tableView];
      [v24 setVerticalScrollIndicatorInsets:v16, left, bottom, right];
      goto LABEL_7;
    }
  }
  else
  {
  }
  double v21 = UIEdgeInsetsZero.left;
  double v22 = UIEdgeInsetsZero.bottom;
  double v23 = UIEdgeInsetsZero.right;
  id v24 = [(DirectionsStepsListDataSource *)self tableView];
  [v24 setScrollIndicatorInsets:UIEdgeInsetsZero.top, v21, v22, v23];
LABEL_7:
}

- (void)_updateElevationHeaderHeight
{
  BOOL v3 = [(DirectionsStepsListDataSource *)self tableView];
  if (v3 && (graphHeaderView = self->_graphHeaderView) != 0)
  {
    id v19 = v3;
    unsigned __int8 v5 = [(DirectionsElevationGraphHeaderView *)graphHeaderView isRecalatingHeights];

    if ((v5 & 1) == 0)
    {
      id v6 = [(DirectionsStepsListDataSource *)self tableView];
      [v6 contentOffset];
      double v8 = v7;
      double v9 = [(DirectionsStepsListDataSource *)self tableView];
      [v9 adjustedContentInset];
      double v11 = v8 + v10;

      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView maximumHeight];
      double v13 = v12;
      if (v11 > 0.0)
      {
        double v13 = v12 - v11;
        [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView minimumHeight];
        if (v13 <= v14)
        {
          [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView minimumHeight];
          double v13 = v15;
        }
      }
      [(NSLayoutConstraint *)self->_graphHeaderViewHeightConstraint setConstant:v13];
      double v16 = [(DirectionsStepsListDataSource *)self tableView];
      [v16 contentOffset];
      [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setBottomHairlineHidden:v17 <= 2.22044605e-16];

      graphHeaderViewHeightConstraint = self->_graphHeaderViewHeightConstraint;
      [(NSLayoutConstraint *)graphHeaderViewHeightConstraint setActive:1];
    }
  }
  else
  {
  }
}

- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3
{
}

- (void)directionsElevationGraphHeaderViewDidRecalculateHeights:(id)a3
{
  [(DirectionsStepsListDataSource *)self _updateElevationHeaderTableInset];

  [(DirectionsStepsListDataSource *)self _updateElevationHeaderHeight];
}

- (void)_handleLocaleChangeNotification:(id)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self tableView];
  [v4 performSelector:"reloadData" withObject:0 afterDelay:0.0];

  id v5 = [(DirectionsStepsListDataSource *)self collectionView];
  [v5 performSelector:"reloadData" withObject:0 afterDelay:0.0];
}

- (void)suspendAutoscrollingToStep
{
  self->_temporarilyDisableAutoscroll = 1;
}

- (void)resumeAutoscrollingToStep
{
  self->_temporarilyDisableAutoscroll = 0;
}

- (void)scrollToCurrentStep
{
}

- (void)_scrollToRouteStepAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DirectionsStepsListDataSource *)self tableView];
  id v6 = [v5 superview];
  if (v6)
  {
  }
  else
  {
    double v7 = [(DirectionsStepsListDataSource *)self collectionView];
    double v8 = [v7 superview];

    if (!v8) {
      return;
    }
  }
  unint64_t v9 = [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:[(DirectionsStepsListDataSource *)self _sectionIndexForSection:1]];
  double v10 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v11 = [v10 count];

  if (v9 && v11 == (id)v9)
  {
    unint64_t v12 = [(DirectionsStepsListDataSource *)self _rowIndexForCurrentlyMatchedStep];
    if (v12 >= v9 || v12 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v14 = 0;
    }
    else {
      unint64_t v14 = v12;
    }
    double v15 = +[NSIndexPath indexPathForRow:v14 inSection:[(DirectionsStepsListDataSource *)self _sectionIndexForSection:1]];
    double v16 = [(DirectionsStepsListDataSource *)self _flatIndexFromIndexPath:v15];

    if (self->_navigationProvider) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    long long v18 = [(DirectionsStepsListDataSource *)self tableView];

    if (!v18)
    {
LABEL_24:
      v27 = [(DirectionsStepsListDataSource *)self collectionView];

      if (!v27)
      {
LABEL_33:

        return;
      }
      id v28 = [v16 section];
      double v29 = [(DirectionsStepsListDataSource *)self collectionView];
      if ((uint64_t)v28 >= (uint64_t)[v29 numberOfSections])
      {
      }
      else
      {
        id v30 = [v16 item];
        double v31 = [(DirectionsStepsListDataSource *)self collectionView];
        id v32 = [v31 numberOfItemsInSection:[v16 section]];

        if ((uint64_t)v30 < (uint64_t)v32)
        {
          double v33 = [(DirectionsStepsListDataSource *)self collectionView];
          [v33 scrollToItemAtIndexPath:v16 atScrollPosition:v17 animated:v3];
LABEL_32:

          goto LABEL_33;
        }
      }
      double v34 = sub_10000AF10();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [(DirectionsStepsListDataSource *)self collectionView];
        int v36 = 138412546;
        v37 = v16;
        __int16 v38 = 2112;
        id v39 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "indexPath (%@) out-of-bounds; resetting scroll position on %@",
          (uint8_t *)&v36,
          0x16u);
      }
      double v33 = [(DirectionsStepsListDataSource *)self collectionView];
      [v33 setContentOffset:CGPointZero.x, CGPointZero.y];
      goto LABEL_32;
    }
    id v19 = [v16 section];
    long long v20 = [(DirectionsStepsListDataSource *)self tableView];
    if ((uint64_t)v19 >= (uint64_t)[v20 numberOfSections])
    {
    }
    else
    {
      id v21 = [v16 row];
      double v22 = [(DirectionsStepsListDataSource *)self tableView];
      id v23 = [v22 numberOfRowsInSection:[v16 section]];

      if ((uint64_t)v21 < (uint64_t)v23)
      {
        id v24 = [(DirectionsStepsListDataSource *)self tableView];
        [v24 scrollToRowAtIndexPath:v16 atScrollPosition:v17 animated:v3];
LABEL_23:

        goto LABEL_24;
      }
    }
    long long v25 = sub_10000AF10();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [(DirectionsStepsListDataSource *)self tableView];
      int v36 = 138412546;
      v37 = v16;
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "indexPath (%@) out-of-bounds; resetting scroll position on %@",
        (uint8_t *)&v36,
        0x16u);
    }
    id v24 = [(DirectionsStepsListDataSource *)self tableView];
    [v24 setContentOffset:CGPointZero animated:0];
    goto LABEL_23;
  }
}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DirectionsStepsListDataSource *)self delegate];
    [v6 directionsStepsListDidTapShareButton:self];
  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DirectionsStepsListDataSource *)self delegate];
    [v6 directionsStepsListDidTapRAPButton:self];
  }
}

- (int64_t)_numberOfSections
{
  id v2 = [(DirectionsStepsListDataSource *)self sections];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  char v5 = [(DirectionsStepsListDataSource *)self sections];
  id v6 = [v5 count];

  if ((uint64_t)v6 <= a3) {
    return 0;
  }
  int64_t v7 = [(DirectionsStepsListDataSource *)self _sectionAtIndex:a3];
  if (v7 == 2) {
    return ([(DirectionsStepsListDataSource *)self options] >> 3) & 1;
  }
  if (v7 != 1)
  {
    if (!v7
      && (id)[(DirectionsStepsListDataSource *)self _idiom] == (id)5
      && ([(DirectionsStepsListDataSource *)self options] & 4) != 0)
    {
      unint64_t v12 = [(DirectionsStepsListDataSource *)self route];
      double v13 = [v12 elevationProfile];
      int64_t v8 = v13 != 0;

      return v8;
    }
    return 0;
  }
  double v10 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v11 = [v10 count];

  return (int64_t)v11;
}

- (id)_flatIndexFromIndexPath:(id)a3
{
  id v4 = a3;
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    char v5 = (char *)[v4 row];
    uint64_t v6 = (uint64_t)[v4 section];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        char v5 = &v5[[(DirectionsStepsListDataSource *)self _numberOfRowsInSection:i]];
    }
    id v9 = +[NSIndexPath indexPathForRow:v5 inSection:0];
  }
  else
  {
    id v9 = v4;
  }
  double v10 = v9;

  return v10;
}

- (id)_indexPathFromFlatIndexPath:(id)a3
{
  id v4 = a3;
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    char v5 = (char *)[v4 row];
    uint64_t v6 = [(DirectionsStepsListDataSource *)self _numberOfSections];
    if (v6 < 1)
    {
LABEL_6:
      double v10 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      int64_t v9 = [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:v8];
      if ((uint64_t)v5 < v9) {
        break;
      }
      ++v8;
      v5 -= v9;
      if (v7 == v8) {
        goto LABEL_6;
      }
    }
    id v11 = +[NSIndexPath indexPathForRow:v5 inSection:v8];
  }
  else
  {
    id v11 = v4;
  }
  double v10 = v11;
LABEL_10:

  return v10;
}

- (int64_t)_sectionIndexForSection:(int64_t)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self sections];
  char v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 indexOfObject:v5];

  return (int64_t)v6;
}

- (int64_t)_sectionAtIndex:(int64_t)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self sections];
  char v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection]) {
    return 1;
  }

  return [(DirectionsStepsListDataSource *)self _numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    if ([(DirectionsStepsListDataSource *)self _numberOfSections] < 1) {
      return 0;
    }
    uint64_t v6 = 0;
    int64_t v7 = 0;
    do
      v7 += [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:v6++];
    while (v6 < [(DirectionsStepsListDataSource *)self _numberOfSections]);
    return v7;
  }
  else
  {
    return [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:a4];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [(DirectionsStepsListDataSource *)self _heightForRowAtIndexPath:a4];
  return result;
}

- (double)_heightForRowAtIndexPath:(id)a3
{
  id v4 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a3];
  if (v4)
  {
    char v5 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v4];
    uint64_t v6 = v5;
    if (v5 == @"DestinationPinRow" || v5 == @"OriginPinRow")
    {
      [(DirectionsStepsListDataSource *)self _rowHeightForStartEndCell:v5 == @"OriginPinRow"];
    }
    else
    {
      if (v5 == @"FooterView")
      {
        if (([(DirectionsStepsListDataSource *)self options] & 8) != 0) {
          double v8 = UITableViewAutomaticDimension;
        }
        else {
          double v8 = 0.0;
        }
        goto LABEL_20;
      }
      if (v5 == @"Elevation")
      {
        int64_t v9 = [(DirectionsStepsListDataSource *)self tableView];
        double v10 = [v9 traitCollection];
        id v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          double v13 = [(DirectionsStepsListDataSource *)self collectionView];
          id v12 = [v13 traitCollection];
        }
        if ([v12 userInterfaceIdiom] == (id)5) {
          double v8 = UITableViewAutomaticDimension;
        }
        else {
          double v8 = 200.0;
        }

        goto LABEL_20;
      }
      [(DirectionsStepsListDataSource *)self _rowHeightForStep:v5];
    }
    double v8 = v7;
LABEL_20:

    goto LABEL_21;
  }
  +[DirectionsStepTableViewCell cellMetricsForIdiom:[(DirectionsStepsListDataSource *)self _idiom]];
  double v8 = v15;
LABEL_21:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  int64_t v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  int64_t v10 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v8 section]);
  if (v10 == 2)
  {
    uint64_t v11 = [(DirectionsStepsListDataSource *)self _footerCellForIndexPath:v7 inTableView:v6];
    goto LABEL_7;
  }
  if (v10 != 1)
  {
LABEL_5:
    id v12 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = [(DirectionsStepsListDataSource *)self _stepCellForIndexPath:v7 inTableView:v6];
LABEL_7:
  id v12 = (void *)v11;
LABEL_8:

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)_willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v29 = a3;
  id v6 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  unint64_t v7 = [(DirectionsStepsListDataSource *)self _rowIndexForCurrentlyMatchedStep];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    double v8 = 0;
  }
  else {
    double v8 = (char *)v7;
  }
  int64_t v9 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v6 section]);
  int64_t v10 = (char *)[v6 row];
  CFStringRef v11 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v6];
  id v12 = (__CFString *)v11;
  if (v9 == 1 && v8)
  {
    BOOL v13 = v10 == v8 - 1;
    BOOL v14 = v11 == @"DestinationPinRow";
LABEL_8:
    BOOL v15 = v13;
    BOOL v13 = v10 == v8;
    unsigned int v16 = ![(DirectionsStepsListDataSource *)self _shouldDimStepWithRow:v10 selectedStepIndex:v8];
    goto LABEL_10;
  }
  BOOL v13 = 0;
  BOOL v14 = v11 == @"DestinationPinRow";
  if (v9 == 1) {
    goto LABEL_8;
  }
  LOBYTE(v16) = 1;
  BOOL v15 = 0;
LABEL_10:
  uint64_t v17 = [v29 backgroundView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v19 = v13 && [(DirectionsStepsListDataSource *)self _shouldHighlightCurrentStep];
    long long v20 = [v29 backgroundView];
    [v20 setHighlightedColor:v19];
  }
  char v21 = !v14;
  if (v12 == @"FooterView") {
    char v21 = 1;
  }
  if (v21)
  {
    if (v12 == @"FooterView")
    {
LABEL_23:
      uint64_t v22 = 0;
      goto LABEL_25;
    }
  }
  else if (([(DirectionsStepsListDataSource *)self options] & 8) == 0)
  {
    goto LABEL_23;
  }
  if ((v13 || v15) && [(DirectionsStepsListDataSource *)self _shouldHighlightCurrentStep]) {
    goto LABEL_23;
  }
  uint64_t v22 = 1;
LABEL_25:
  [v29 setSeparatorStyle:v22];
  if ([v29 separatorStyle] == (id)1) {
    char v23 = v16;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0)
  {
    id v24 = [(DirectionsStepsListDataSource *)self tableView];
    long long v25 = [v24 separatorColor];
    v26 = [v25 colorWithAlphaComponent:0.150000006];
    [v29 setSeparatorColor:v26];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v27 = !v14 || ([(DirectionsStepsListDataSource *)self options] & 8) == 0;
    [v29 setAlignSeparatorWithLeadingText:v27];
  }
  id v28 = +[UIColor clearColor];
  [v29 setBackgroundColor:v28];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  char v5 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v6 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v5];
  if ([(DirectionsStepsListDataSource *)self allowsStepSelection])
  {
    char isKindOfClass = 1;
    if (v6 != @"OriginPinRow" && v6 != @"DestinationPinRow")
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  char v5 = -[DirectionsStepsListDataSource _adjustedItemToSelectFromIndexPath:](self, "_adjustedItemToSelectFromIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(DirectionsStepsListDataSource *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(DirectionsStepsListDataSource *)self delegate];
      [v8 directionsStepsList:self didTapRowForRouteStep:v5];
    }
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection]) {
    return 1;
  }

  return [(DirectionsStepsListDataSource *)self _numberOfSections];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(DirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    if ([(DirectionsStepsListDataSource *)self _numberOfSections] < 1) {
      return 0;
    }
    uint64_t v6 = 0;
    int64_t v7 = 0;
    do
      v7 += [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:v6++];
    while (v6 < [(DirectionsStepsListDataSource *)self _numberOfSections]);
    return v7;
  }
  else
  {
    return [(DirectionsStepsListDataSource *)self _numberOfRowsInSection:a4];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  id v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  int64_t v10 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v8 section]);
  if (v10 == 2)
  {
    uint64_t v11 = [(DirectionsStepsListDataSource *)self _footerCellForIndexPath:v7 inCollectionView:v6];
    goto LABEL_9;
  }
  if (v10 == 1)
  {
    uint64_t v11 = [(DirectionsStepsListDataSource *)self _stepCellForIndexPath:v7 inCollectionView:v6];
    goto LABEL_9;
  }
  if (v10)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = [(DirectionsStepsListDataSource *)self _elevationCellForIndexPath:v7 inCollectionView:v6];
LABEL_9:
  id v12 = (void *)v11;
LABEL_10:

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  char v5 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v6 = [(DirectionsStepsListDataSource *)self _itemAtIndexPath:v5];
  if ([(DirectionsStepsListDataSource *)self allowsStepSelection])
  {
    char isKindOfClass = 1;
    if (v6 != @"OriginPinRow" && v6 != @"DestinationPinRow")
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  char v5 = -[DirectionsStepsListDataSource _adjustedItemToSelectFromIndexPath:](self, "_adjustedItemToSelectFromIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(DirectionsStepsListDataSource *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(DirectionsStepsListDataSource *)self delegate];
      [v8 directionsStepsList:self didTapRowForRouteStep:v5];
    }
  }
}

- (id)_elevationCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  char v5 = [a4 dequeueReusableCellWithReuseIdentifier:@"Elevation" forIndexPath:a3];
  [v5 setRoute:self->_route];
  if (sub_1000BBB44(v5) == 5)
  {
    id v6 = [v5 trailingAccessoryConfigurations];
    id v7 = [v6 firstObject];

    if (!v7)
    {
      double v8 = +[UIButton buttonWithType:0];
      id v9 = +[UIColor secondaryLabelColor];
      [v8 setTintColor:v9];

      int64_t v10 = +[UIImage systemImageNamed:@"info.circle.fill"];
      [v8 setImage:v10 forState:0];
      [v8 sizeToFit];
      id v7 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v8];
      id v14 = v7;
      uint64_t v11 = +[NSArray arrayWithObjects:&v14 count:1];
      [v5 setTrailingAccessoryConfigurations:v11];
    }
    id v12 = [v7 customView];
    [v12 addTarget:self action:"_handleElevationInfoButtonTap:" forControlEvents:64];
  }

  return v5;
}

- (void)_handleElevationInfoButtonTap:(id)a3
{
  id v7 = a3;
  id v4 = [(DirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DirectionsStepsListDataSource *)self delegate];
    [v6 directionsStepsList:self didTapElevationInfoButton:v7];
  }
}

- (id)_stepCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  id v9 = [v8 row];
  int64_t v10 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

  if (v11 == @"OriginPinRow" || v11 == @"DestinationPinRow")
  {
    if (v6)
    {
      id v14 = [(objc_class *)[(DirectionsStepsListDataSource *)self _directionsOriginDestinationCellClass] reuseIdentifier];
      BOOL v15 = [v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7];
    }
    else
    {
      unsigned int v16 = [DirectionsStartEndTableViewCell alloc];
      id v14 = [(objc_class *)[(DirectionsStepsListDataSource *)self _directionsOriginDestinationCellClass] reuseIdentifier];
      BOOL v15 = [(DirectionsStartEndTableViewCell *)v16 initWithStyle:0 reuseIdentifier:v14];
    }
    BOOL v13 = v15;

    [(DirectionsStepsListDataSource *)self _configureStartEndCell:v13 forIndexPath:v7];
  }
  else
  {
    id v12 = [(objc_class *)[(DirectionsStepsListDataSource *)self _directionsStepCellClass] reuseIdentifier];
    BOOL v13 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];

    [(DirectionsStepsListDataSource *)self _configureStepCell:v13 forIndexPath:v7];
  }

  return v13;
}

- (id)_stepCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  id v9 = [v8 row];
  int64_t v10 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

  if (v11 == @"OriginPinRow" || v11 == @"DestinationPinRow")
  {
    id v14 = [(objc_class *)[(DirectionsStepsListDataSource *)self _directionsOriginDestinationCollectionViewCellClass] reuseIdentifier];
    BOOL v13 = [v6 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v7];

    [(DirectionsStepsListDataSource *)self _configureStartEndCell:v13 forIndexPath:v7];
  }
  else
  {
    id v12 = [(objc_class *)[(DirectionsStepsListDataSource *)self _directionsStepCollectionViewCellClass] reuseIdentifier];
    BOOL v13 = [v6 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];

    [(DirectionsStepsListDataSource *)self _configureStepCell:v13 forIndexPath:v7];
  }

  return v13;
}

- (void)_configureStartEndCell:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v15 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v7 = [v15 row];
  double v8 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  id v9 = [v8 objectAtIndexedSubscript:v7];

  int64_t v10 = [(DirectionsStepsListDataSource *)self route];
  uint64_t v11 = [v10 _maps_directionsWaypoints];

  if (v9 == @"OriginPinRow") {
    [v11 firstObject];
  }
  else {
  id v12 = [v11 lastObject];
  }
  BOOL v13 = [(DirectionsStepsListDataSource *)self route];
  id v14 = [(VGVirtualGarage *)self->_virtualGarage selectedVehicle];
  [v6 configureForWaypoint:v12 route:v13 selectedVehicle:v14 displayedInRoutePlanning:[self isDisplayedInRoutePlanning]];

  [v6 setIsDimmedStep:[self _isDimmedStepAtIndex:v7]];
}

- (void)_configureStepCell:(id)a3 forIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v7 = [v6 row];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v17;
    id v9 = [v8 backgroundView];

    if (!v9)
    {
      int64_t v10 = [DirectionsTableViewCellBackgroundView alloc];
      [v8 bounds];
      uint64_t v11 = -[DirectionsTableViewCellBackgroundView initWithFrame:](v10, "initWithFrame:");
      [v8 setBackgroundView:v11];
    }
  }
  id v12 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
  BOOL v13 = [v12 objectAtIndexedSubscript:v7];

  id v14 = [(DirectionsStepsListDataSource *)self route];
  [v17 setRoute:v14 step:v13 stepIndex:[v13 stepIndex] alignToLeftEdgeIfNoManeuverSign:self->_routeHasNoManeuvers size:self->_shieldArtworkSize];

  [v17 setIsDimmedStep:[self _isDimmedStepAtIndex:v7]];
  unint64_t v15 = [(DirectionsStepsListDataSource *)self _rowIndexForCurrentlyMatchedStep];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    id v16 = 0;
  }
  else {
    id v16 = (id)v15;
  }
  [v17 setIsSelectedRow:v7 == v16];
}

- (BOOL)_isDimmedStepAtIndex:(int64_t)a3
{
  if (!self->_navigationProvider) {
    return 0;
  }
  unint64_t v5 = [(DirectionsStepsListDataSource *)self _rowIndexForCurrentlyMatchedStep];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }

  return [(DirectionsStepsListDataSource *)self _shouldDimStepWithRow:a3 selectedStepIndex:v6];
}

- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v6];
  -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v8 section]);
  if (v7)
  {
    id v9 = [v7 dequeueReusableCellWithIdentifier:@"FooterView" forIndexPath:v6];
  }
  else
  {
    id v9 = [[RoutePlanningFooterCell alloc] initWithStyle:0 reuseIdentifier:@"FooterView"];
  }
  int64_t v10 = v9;
  int64_t v11 = [(DirectionsStepsListDataSource *)self _footerCommands];
  id v12 = [(RoutePlanningFooterCell *)v10 footerView];
  [v12 setVisibleCommandSet:v11];

  [(RoutePlanningFooterCell *)v10 set_mapkit_separatorStyleOverride:0];
  BOOL v13 = [(RoutePlanningFooterCell *)v10 footerView];
  [v13 setDelegate:self];

  return v10;
}

- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v8 section]);
  id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"FooterView" forIndexPath:v7];

  int64_t v10 = [(DirectionsStepsListDataSource *)self _footerCommands];
  int64_t v11 = [v9 footerView];
  [v11 setVisibleCommandSet:v10];

  id v12 = [v9 footerView];
  [v12 setDelegate:self];

  return v9;
}

- (int64_t)_footerCommands
{
  if ((id)[(DirectionsStepsListDataSource *)self _idiom] == (id)5) {
    return 8;
  }
  else {
    return 10;
  }
}

- (BOOL)_shouldDimStepWithRow:(unint64_t)a3 selectedStepIndex:(unint64_t)a4
{
  BOOL result = [(DirectionsStepsListDataSource *)self _shouldHighlightCurrentStep];
  if (a3 >= a4) {
    return 0;
  }
  return result;
}

- (double)_rowHeightForStartEndCell:(BOOL)a3
{
  unint64_t v5 = [(DirectionsStepsListDataSource *)self route];
  id v6 = [v5 _maps_directionsWaypoints];

  if (a3) {
    [v6 firstObject];
  }
  else {
  id v7 = [v6 lastObject];
  }
  if (v7)
  {
    id v8 = [(DirectionsStepsListDataSource *)self tableView];
    if (v8) {
      [(DirectionsStepsListDataSource *)self tableView];
    }
    else {
    int64_t v10 = [(DirectionsStepsListDataSource *)self collectionView];
    }
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    id v19 = [objc_alloc(-[DirectionsStepsListDataSource _directionsOriginDestinationCellClass](self, "_directionsOriginDestinationCellClass")) initWithFrame:v12, v14, v16, v18];
    long long v20 = [(DirectionsStepsListDataSource *)self route];
    char v21 = [(VGVirtualGarage *)self->_virtualGarage selectedVehicle];
    BOOL v22 = [(DirectionsStepsListDataSource *)self isDisplayedInRoutePlanning];
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    [v19 heightForWaypoint:v7 route:v20 selectedVehicle:v21 displayedInRoutePlanning:v22 width:CGRectGetWidth(v25)];
    double v9 = v23;
  }
  else
  {
    double v9 = 70.0;
  }

  return v9;
}

- (double)_availableWidth
{
  id v3 = [(DirectionsStepsListDataSource *)self tableView];
  if (v3) {
    [(DirectionsStepsListDataSource *)self tableView];
  }
  else {
  id v4 = [(DirectionsStepsListDataSource *)self collectionView];
  }
  [v4 bounds];
  double Width = CGRectGetWidth(v7);

  return Width;
}

- (int64_t)_idiom
{
  id v3 = [(DirectionsStepsListDataSource *)self tableView];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [(DirectionsStepsListDataSource *)self collectionView];
  }
  unint64_t v5 = [v4 traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v3) {
  return (int64_t)v6;
  }
}

- (double)_calculateWidthForCachedRowHeights
{
  [(DirectionsStepsListDataSource *)self _availableWidth];
  double v4 = v3;
  [(DirectionsStepsListDataSource *)self _trailingViewWidth];
  return v4 - v5;
}

- (double)_rowHeightForStep:(id)a3
{
  double v4 = (objc_class *)a3;
  if (v4)
  {
    double v5 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
    id v6 = [v5 indexOfObject:v4];

    [(DirectionsStepsListDataSource *)self _calculateWidthForCachedRowHeights];
    double v8 = v7;
    if (!self->_routeStepRowHeights)
    {
      self->_availableWidthForCachedRowHeights = v7;
      double v9 = [(DirectionsStepsListDataSource *)self stepsSectionItems];
      self->_routeStepRowHeights = (double *)malloc_type_calloc((size_t)[v9 count], 8uLL, 0x100004000313F17uLL);
    }
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = sub_10000AF10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Invalid step: %@", buf, 0xCu);
      }

      double v11 = [(DirectionsStepsListDataSource *)self _directionsStepCellClass];
      double v12 = [(DirectionsStepsListDataSource *)self route];
      [(objc_class *)v11 heightForWidth:v12 route:v4 step:[(DirectionsStepsListDataSource *)self _idiom] idiom:v8];
      double v14 = v13;
    }
    else
    {
      double v14 = self->_routeStepRowHeights[(void)v6];
      if (v14 == 0.0)
      {
        double v15 = [(DirectionsStepsListDataSource *)self _directionsStepCellClass];
        double v16 = [(DirectionsStepsListDataSource *)self route];
        [(objc_class *)v15 heightForWidth:v16 route:v4 step:[(DirectionsStepsListDataSource *)self _idiom] idiom:v8];
        double v14 = v17;

        if (v14 <= 0.0)
        {
          double v18 = sub_10000AF10();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            id v19 = [(DirectionsStepsListDataSource *)self route];
            *(_DWORD *)buf = 138413058;
            double v23 = v15;
            __int16 v24 = 2048;
            double v25 = v8;
            __int16 v26 = 2112;
            BOOL v27 = v4;
            __int16 v28 = 2112;
            id v29 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Invalid middle row height, cellClass: %@ width: %f step: %@ route: %@", buf, 0x2Au);
          }
          double v14 = self->_routeStepRowHeights[(void)v6];
        }
        else
        {
          self->_routeStepRowHeights[(void)v6] = v14;
        }
      }
    }
  }
  else
  {
    +[DirectionsStepTableViewCell cellMetricsForIdiom:[(DirectionsStepsListDataSource *)self _idiom]];
    double v14 = v21;
  }

  return v14;
}

- (double)_trailingViewWidth
{
  return 0.0;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10068D21C;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = [(DirectionsStepsListDataSource *)self scrollViewDelegate];
  [v10 scrollViewWillEndDragging:v9 withVelocity:a5 targetContentOffset:x, y];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsListDataSource *)self scrollViewDelegate];
  [v5 scrollViewDidScroll:v4];

  [(DirectionsStepsListDataSource *)self _updateElevationHeaderHeight];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsListDataSource *)self scrollViewDelegate];
  [v5 scrollViewWillBeginDragging:v4];

  [v4 contentOffset];
  double v7 = v6;

  [(DirectionsStepsListDataSource *)self setScrollViewOffsetStart:v7];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (BOOL)allowsStepSelection
{
  return self->_allowStepSelection;
}

- (void)setAllowStepSelection:(BOOL)a3
{
  self->_allowStepSelection = a3;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (RouteStepListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteStepListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldFlattenToSingleSection
{
  return self->_flattenToSingleSection;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (BOOL)enableNavigationUpdates
{
  return self->_enableNavigationUpdates;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)usesLargeCells
{
  return self->_useLargeCells;
}

- (BOOL)isDisplayedInRoutePlanning
{
  return self->_displayedInRoutePlanning;
}

- (id)scrollDirectionHandler
{
  return self->_scrollDirectionHandler;
}

- (void)setScrollDirectionHandler:(id)a3
{
}

- (int64_t)shieldArtworkSize
{
  return self->_shieldArtworkSize;
}

- (void)setShieldArtworkSize:(int64_t)a3
{
  self->_shieldArtworkSize = a3;
}

- (void)setSections:(id)a3
{
}

- (void)setStepsSectionItems:(id)a3
{
}

- (double)scrollViewOffsetStart
{
  return self->_scrollViewOffsetStart;
}

- (void)setScrollViewOffsetStart:(double)a3
{
  self->_scrollViewOffsetStart = a3;
}

- (BOOL)scrollViewDecelerating
{
  return self->_scrollViewDecelerating;
}

- (void)setScrollViewDecelerating:(BOOL)a3
{
  self->_scrollViewDecelerating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepsSectionItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong(&self->_scrollDirectionHandler, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_graphHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphHeaderView, 0);
  objc_storeStrong((id *)&self->_headerTableViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_headerSuperview, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);

  objc_storeStrong((id *)&self->_routeOverviewCellCachedHeight, 0);
}

@end