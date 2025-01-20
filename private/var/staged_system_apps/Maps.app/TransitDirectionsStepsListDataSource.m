@interface TransitDirectionsStepsListDataSource
- (BOOL)_shouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)_supportsFooterItem;
- (BOOL)_useNavigationMetrics;
- (BOOL)allowsStepSelection;
- (BOOL)automaticallyScrollToDisplayedStep;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)enableNavigationUpdates;
- (BOOL)hasIncidentItems;
- (BOOL)isActive;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (BOOL)shouldFlattenToSingleSection;
- (BOOL)shouldShowSeparatorForItemAtIndexPath:(id)a3 insets:(NSDirectionalEdgeInsets *)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)transitDirectionsListView:(id)a3 canSelectItem:(id)a4;
- (BOOL)transitDirectionsListView:(id)a3 shouldShowSeparatorForItem:(id)a4 atIndexPath:(id)a5 insets:(NSDirectionalEdgeInsets *)a6;
- (BOOL)useCollapsedDisplayStyle;
- (CGRect)frameOfDisplayedComposedRouteStepCell;
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)activeComposedRouteStep;
- (GEOComposedRouteStep)displayedComposedRouteStep;
- (MNLocation)matchedLocation;
- (MapsThrottler)matchedLocationThrottler;
- (NSArray)_transitDirectionsListItems;
- (NSArray)transitSegmentSectionRanges;
- (NSIndexPath)activeItemIndexPath;
- (NSIndexPath)displayedItemIndexPath;
- (NSMapTable)estimatedHeightsByItem;
- (TransitDirectionsListView)listView;
- (TransitDirectionsStepsListDataProvider)dataProvider;
- (TransitDirectionsStepsListDataSource)init;
- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3;
- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3 delegate:(id)a4 forNavigation:(BOOL)a5;
- (TransitDirectionsStepsListDelegate)delegate;
- (UICollectionView)collectionView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UITableView)tableView;
- (_NSRange)_segementRangeForItemAtIndexPath:(id)a3;
- (double)_availableWidth;
- (double)leadingInstructionMargin;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_activeItem;
- (id)_additionalSelectionIndexPathsForIndexPath:(id)a3;
- (id)_displayedItem;
- (id)_expandedItemsIndices;
- (id)_flatIndexFromIndexPath:(id)a3;
- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)_indexPathFromFlatIndexPath:(id)a3;
- (id)_itemIndexPathForStepIndex:(unint64_t)a3;
- (id)_scrollView;
- (id)activeItemForTransitDirectionsListView:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)displayedItemIndexForAnalytics;
- (id)displayedTransitDirectionsListItemIndexPath;
- (id)listItemForIndexPath:(id)a3;
- (id)reloadHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)ticketingSegmentsForRoutePlanningFooterView:(id)a3;
- (id)transitDirectionsListView:(id)a3 stepViewForItemAtIndexPath:(id)a4;
- (int64_t)_cellNavStateForItem:(id)a3 atIndexPath:(id)a4;
- (int64_t)_userInterfaceIdiom;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pptTestCurrentStepIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)transitDirectionsListView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_numberOfRowsInSection:(unint64_t)a3;
- (unint64_t)_numberOfSections;
- (unint64_t)_stepViewDisplayOptionsForSection:(unint64_t)a3;
- (unint64_t)activeComposedRouteStepIndex;
- (unint64_t)activeItemIndex;
- (unint64_t)displayedComposedRouteStepIndex;
- (unint64_t)displayedItemIndex;
- (unint64_t)highlightingBehaviour;
- (unint64_t)indexOfItem:(id)a3;
- (unint64_t)options;
- (void)_cacheHeightForRow:(id)a3 atIndexPath:(id)a4;
- (void)_configureFooterView:(id)a3;
- (void)_configureSeparatorForCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)_configureStepView:(id)a3 forItem:(id)a4 atIndexPath:(id)a5;
- (void)_configureTransitDirectionsCollectionViewCell:(id)a3 withItem:(id)a4 atIndexPath:(id)a5;
- (void)_didFinishAnimatingListView;
- (void)_expandItemsAtIndices:(id)a3;
- (void)_localeDidChange;
- (void)_measureShieldWidthForListWidth:(double)a3;
- (void)_notifyDelegateOfUpdatedActiveStep;
- (void)_notifyDelegateOfUpdatedDisplayedStep;
- (void)_rebuildItems;
- (void)_refreshActiveItemIndexPath;
- (void)_refreshDisplayedItemIndexPath;
- (void)_refreshItemInstructionStrings;
- (void)_reloadListViewForRouteChange;
- (void)_reloadListViewForRouteChangeIfNotAnimating;
- (void)_reloadListViewForRouteChangeIfNotAnimating:(id)a3;
- (void)_reloadVisibleCells;
- (void)_resetArtworkSizesForAdaptiveItems;
- (void)_resetRowHeightCache;
- (void)_scrollToDisplayedItemIfNeeded:(id)a3 animated:(BOOL)a4;
- (void)_scrollToFirstCell;
- (void)_setUseCollapsedDisplayStyle:(BOOL)a3;
- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inCollectionView:(id)a5;
- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inTableView:(id)a5;
- (void)_transitDirectionsStepView:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inListView:(id)a5;
- (void)_updateActiveItemInListViewIfNeeded;
- (void)_updateDisplayStyleInVisibleCells;
- (void)_updateFooterInListView;
- (void)_updateListForClusteredRideOptionChangeInClusteredSegment:(id)a3;
- (void)_updateRegisteredCellClasses;
- (void)collapseAllItems;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)composedRoute:(id)a3 appliedTransitRouteUpdates:(id)a4;
- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)dealloc;
- (void)didTapGetTicketsOnRoutePlanningFooterView:(id)a3;
- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3;
- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3;
- (void)expandAllItems;
- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5;
- (void)navigationProvider:(id)a3 didReceiveRealtimeUpdates:(id)a4;
- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4;
- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4;
- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pptTestMoveToNextStep;
- (void)recalculateLeadingInstructionMarginForWidth:(double)a3;
- (void)routePlanningView:(id)a3 didTapGetTicketsForURL:(id)a4;
- (void)scrollToDisplayedItemAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActive:(BOOL)a3;
- (void)setActiveComposedRouteStepIndex:(unint64_t)a3;
- (void)setAllowStepSelection:(BOOL)a3;
- (void)setAutomaticallyScrollToDisplayedStep:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedComposedRouteStepIndex:(unint64_t)a3;
- (void)setEnableNavigationUpdates:(BOOL)a3;
- (void)setEstimatedHeightsByItem:(id)a3;
- (void)setFlattenToSingleSection:(BOOL)a3;
- (void)setHighlightingBehaviour:(unint64_t)a3;
- (void)setListView:(id)a3;
- (void)setMatchedLocation:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReloadHandler:(id)a3;
- (void)setRoute:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUseCollapsedDisplayStyle:(BOOL)a3;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableViewDidFinishReload:(id)a3;
- (void)transitDirectionsBoardingInfoStepView:(id)a3 didSelectScheduleForItem:(id)a4;
- (void)transitDirectionsCell:(id)a3 didTapAdvisory:(id)a4;
- (void)transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4;
- (void)transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:(id)a3;
- (void)transitDirectionsListView:(id)a3 didDisplayAdvisory:(id)a4;
- (void)transitDirectionsListView:(id)a3 didSelectItem:(id)a4;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)updateForClusteredLegSelectedRideIndexChange;
@end

@implementation TransitDirectionsStepsListDataSource

- (void)dealloc
{
  v3 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [v3 removeObserver:self forKeyPath:@"bounds"];

  v4 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [v4 removeObserver:self forKeyPath:@"bounds"];

  v5 = [(TransitDirectionsStepsListDataSource *)self listView];
  [v5 removeObserver:self forKeyPath:@"bounds"];

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStepsListDataSource;
  [(TransitDirectionsStepsListDataSource *)&v6 dealloc];
}

- (TransitDirectionsStepsListDataSource)init
{
  return [(TransitDirectionsStepsListDataSource *)self initWithRoute:0];
}

- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsStepsListDataSource;
  objc_super v6 = [(TransitDirectionsStepsListDataSource *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_options = 1;
    *(_OWORD *)&v6->_activeComposedRouteStepIndex = xmmword_100F739A0;
    v8 = (MKTransitItemReferenceDateUpdater *)[objc_alloc((Class)MKTransitItemReferenceDateUpdater) initWithDelegate:v6];
    referenceDateUpdater = v7->_referenceDateUpdater;
    v7->_referenceDateUpdater = v8;

    v7->_highlightingBehaviour = 0;
    objc_storeStrong((id *)&v7->_route, a3);
    if (v5 && [v5 transportType] != 1)
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v18 = "-[TransitDirectionsStepsListDataSource initWithRoute:]";
        __int16 v19 = 2080;
        v20 = "TransitDirectionsStepsListDataSource.m";
        __int16 v21 = 1024;
        int v22 = 171;
        __int16 v23 = 2080;
        v24 = "!route || route.transportType == GEOTransportType_TRANSIT";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    v10 = +[NSNotificationCenter defaultCenter];
    v11 = MNLocaleDidChangeNotification();
    [v10 addObserver:v7 selector:"_localeDidChange" name:v11 object:0];
  }
  return v7;
}

- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3 delegate:(id)a4 forNavigation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [(TransitDirectionsStepsListDataSource *)self initWithRoute:a3];
  v10 = v9;
  if (v9)
  {
    [(TransitDirectionsStepsListDataSource *)v9 setEnableNavigationUpdates:v5];
    [(TransitDirectionsStepsListDataSource *)v10 setAllowStepSelection:v5];
    [(TransitDirectionsStepsListDataSource *)v10 setDelegate:v8];
  }

  return v10;
}

- (void)setRoute:(id)a3
{
  BOOL v5 = (GEOComposedRoute *)a3;
  route = self->_route;
  if (route != v5)
  {
    [(GEOComposedRoute *)route unregisterObserver:self];
    dataProvider = self->_dataProvider;
    self->_dataProvider = 0;

    objc_storeStrong((id *)&self->_route, a3);
    [(GEOComposedRoute *)self->_route registerObserver:self];
    id v8 = sub_100C1423C();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      [(TransitDirectionsStepsListDataSource *)self _rebuildItems];
      *(_OWORD *)&self->_activeComposedRouteStepIndex = xmmword_100F739A0;
      activeItemIndexPath = self->_activeItemIndexPath;
      self->_activeItemIndexPath = 0;

      displayedItemIndexPath = self->_displayedItemIndexPath;
      self->_displayedItemIndexPath = 0;

      [(TransitDirectionsStepsListDataSource *)self _prepareForUpdatedRoute];
      self->_routeSetAwaitingTableViewReload = 1;
      objc_initWeak((id *)buf, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100C14290;
      v17[3] = &unk_1012E6708;
      objc_copyWeak(&v18, (id *)buf);
      [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChangeIfNotAnimating:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(TransitDirectionsStepsListDataSource *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2112;
    int v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] setRoute: %@", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
}

- (TransitDirectionsStepsListDataProvider)dataProvider
{
  dataProvider = self->_dataProvider;
  if (!dataProvider)
  {
    dataProvider = self->_route;
    if (dataProvider)
    {
      if (self->_navigationProvider)
      {
        v4 = [[TransitDirectionsStepsListDataProvider alloc] initWithRoute:self->_route forGuidance:1];
      }
      else
      {
        v4 = [dataProvider transitDirectionsStepsListDataProvider];
      }
      BOOL v5 = self->_dataProvider;
      self->_dataProvider = v4;

      dataProvider = self->_dataProvider;
    }
  }

  return (TransitDirectionsStepsListDataProvider *)dataProvider;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = sub_100C1423C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      self->_active = v3;
      [(MKTransitItemReferenceDateUpdater *)self->_referenceDateUpdater setActive:v3];
      if (v3) {
        [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
      }
      return;
    }
    objc_super v6 = self;
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    v12 = @"NO";
    if (v3) {
      v12 = @"YES";
    }
    v13 = v12;
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    __int16 v16 = 2114;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] setActive: %{public}@", buf, 0x16u);

    goto LABEL_11;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t obj = (unint64_t)v4;
  unint64_t v6 = (unint64_t)WeakRetained;
  if (obj | v6)
  {
    unsigned __int8 v7 = [(id)obj isEqual:v6];

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_delegate, (id)obj);
      [(TransitDirectionsStepsListDataSource *)self _notifyDelegateOfUpdatedActiveStep];
      [(TransitDirectionsStepsListDataSource *)self _notifyDelegateOfUpdatedDisplayedStep];
    }
  }
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  [(TransitDirectionsStepsListDataSource *)self _updateFooterInListView];
}

- (id)_scrollView
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self tableView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unint64_t v6 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(TransitDirectionsStepsListDataSource *)self listView];
    }
    id v5 = v8;
  }

  return v5;
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
      [(TransitDirectionsStepsListDataSource *)self setCollectionView:0];
      [(TransitDirectionsStepsListDataSource *)self setListView:0];
      [(TransitDirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
      [obj addObserver:self forKeyPath:@"bounds" options:1 context:0];
      [(TransitDirectionsStepsListDataSource *)self _resetRowHeightCache];
      [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
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
      [(TransitDirectionsStepsListDataSource *)self setTableView:0];
      [(TransitDirectionsStepsListDataSource *)self setListView:0];
      [(TransitDirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
      [obj addObserver:self forKeyPath:@"bounds" options:1 context:0];
      [(TransitDirectionsStepsListDataSource *)self _resetRowHeightCache];
      [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
    }
  }
}

- (void)setListView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listView);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained removeObserver:self forKeyPath:@"bounds"];
    }
    objc_storeWeak((id *)&self->_listView, obj);
    if (obj)
    {
      [(TransitDirectionsStepsListDataSource *)self setTableView:0];
      [(TransitDirectionsStepsListDataSource *)self setCollectionView:0];
      [(TransitDirectionsStepsListDataSource *)self _updateRegisteredCellClasses];
      [obj addObserver:self forKeyPath:@"bounds" options:1 context:0];
      [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
      [(TransitDirectionsStepsListDataSource *)self _updateActiveItemInListViewIfNeeded];
      [(TransitDirectionsStepsListDataSource *)self _updateFooterInListView];
    }
  }
}

- (void)setFlattenToSingleSection:(BOOL)a3
{
  if (self->_flattenToSingleSection != a3)
  {
    self->_flattenToSingleSection = a3;
    [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(TransitDirectionsStepsListDataSource *)self _scrollView];

  if (v13 == v11)
  {
    [(TransitDirectionsStepsListDataSource *)self _availableWidth];
    double v15 = v14;
    if (self->_listWidthForCachedRowHeights == v14) {
      goto LABEL_12;
    }
    __int16 v16 = sub_100C1423C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      [(TransitDirectionsStepsListDataSource *)self recalculateLeadingInstructionMarginForWidth:v15];
      __int16 v23 = [(TransitDirectionsStepsListDataSource *)self tableView];
      [v23 reloadData];

      v24 = [(TransitDirectionsStepsListDataSource *)self collectionView];
      [v24 reloadData];

      v25 = [(TransitDirectionsStepsListDataSource *)self listView];
      [v25 reloadData];

      goto LABEL_12;
    }
    v17 = self;
    id v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(TransitDirectionsStepsListDataSource *)v17 performSelector:"accessibilityIdentifier"];
      __int16 v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        int v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_10;
      }
    }
    int v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] available width did change", buf, 0xCu);

    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)TransitDirectionsStepsListDataSource;
  [(TransitDirectionsStepsListDataSource *)&v26 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_12:
}

- (void)_updateRegisteredCellClasses
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self tableView];

  if (v3)
  {
    id v4 = [(TransitDirectionsStepsListDataSource *)self tableView];
    +[TransitDirectionsCell registerCellsForTableView:v4];

    id v5 = [(TransitDirectionsStepsListDataSource *)self tableView];
    [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"TransitDirectionsListSharingIdentifier"];
  }
  unint64_t v6 = [(TransitDirectionsStepsListDataSource *)self collectionView];

  if (v6)
  {
    unsigned __int8 v7 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    +[TransitDirectionsCell registerCellsForCollectionView:v7];

    id v8 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TransitDirectionsListSharingIdentifier"];
  }
}

- (void)_reloadListViewForRouteChange
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self _scrollView];

  uint64_t v4 = sub_100C1423C();
  BOOL v5 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (!v5) {
      goto LABEL_24;
    }
    id v12 = self;
    if (!v12)
    {
      v17 = @"<nil>";
      goto LABEL_23;
    }
    id v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      double v15 = [(TransitDirectionsStepsListDataSource *)v12 performSelector:"accessibilityIdentifier"];
      __int16 v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_17;
      }
    }
    v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_17:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    __int16 v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Will not reload table for route change, no scroll view yet", buf, 0xCu);

    goto LABEL_24;
  }
  if (!v5) {
    goto LABEL_20;
  }
  unint64_t v6 = self;
  if (!v6)
  {
    id v11 = @"<nil>";
    goto LABEL_19;
  }
  unsigned __int8 v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_9;
    }
  }
  id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_19:
  *(_DWORD *)buf = 138543362;
  __int16 v23 = v11;
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Will reload table for route change", buf, 0xCu);

LABEL_20:
  [(TransitDirectionsStepsListDataSource *)self _resetRowHeightCache];
  [(TransitDirectionsStepsListDataSource *)self _availableWidth];
  -[TransitDirectionsStepsListDataSource recalculateLeadingInstructionMarginForWidth:](self, "recalculateLeadingInstructionMarginForWidth:");
  id v18 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [v18 reloadData];

  __int16 v19 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [v19 reloadData];

  v20 = [(TransitDirectionsStepsListDataSource *)self listView];
  [v20 reloadData];

  [(TransitDirectionsStepsListDataSource *)self _updateFooterInListView];
  uint64_t v4 = (uint64_t)objc_retainBlock(self->_reloadTableCompletionBlock);
  id reloadTableCompletionBlock = self->_reloadTableCompletionBlock;
  self->_id reloadTableCompletionBlock = 0;

  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
LABEL_24:
}

- (void)_reloadListViewForRouteChangeIfNotAnimating
{
}

- (void)_reloadListViewForRouteChangeIfNotAnimating:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id reloadTableCompletionBlock = self->_reloadTableCompletionBlock;
  self->_id reloadTableCompletionBlock = v5;

  if (!self->_animatingExpansion)
  {
    [(TransitDirectionsStepsListDataSource *)self _didFinishAnimatingListView];
    goto LABEL_13;
  }
  self->_listViewReloadWaitingAnimationCompletion = 1;
  unsigned __int8 v7 = sub_100C1423C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = self;
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(TransitDirectionsStepsListDataSource *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    double v14 = @"YES";
    if (!v4) {
      double v14 = @"NO";
    }
    double v15 = v14;
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    __int16 v18 = 2112;
    __int16 v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Will defer table reload until after expansion/collapse animation (completion block: %@)", buf, 0x16u);
  }
LABEL_13:
}

- (void)_reloadVisibleCells
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self collectionView];

  if (!v3)
  {
    id v11 = [(TransitDirectionsStepsListDataSource *)self tableView];

    if (v11)
    {
      id v12 = sub_100C1423C();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
LABEL_33:

        v32 = [(TransitDirectionsStepsListDataSource *)self tableView];
LABEL_38:
        v30 = v32;
        [v32 reloadData];
        goto LABEL_39;
      }
      id v13 = self;
      if (!v13)
      {
        __int16 v18 = @"<nil>";
        goto LABEL_32;
      }
      double v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      if (objc_opt_respondsToSelector())
      {
        __int16 v16 = [(TransitDirectionsStepsListDataSource *)v13 performSelector:"accessibilityIdentifier"];
        v17 = v16;
        if (v16 && ![v16 isEqualToString:v15])
        {
          __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

          goto LABEL_18;
        }
      }
      __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_18:

LABEL_32:
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading visible cells in table view", buf, 0xCu);

      goto LABEL_33;
    }
    __int16 v19 = [(TransitDirectionsStepsListDataSource *)self listView];

    if (!v19) {
      return;
    }
    v20 = sub_100C1423C();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
LABEL_37:

      v32 = [(TransitDirectionsStepsListDataSource *)self listView];
      goto LABEL_38;
    }
    __int16 v21 = self;
    if (!v21)
    {
      objc_super v26 = @"<nil>";
      goto LABEL_36;
    }
    int v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      v24 = [(TransitDirectionsStepsListDataSource *)v21 performSelector:"accessibilityIdentifier"];
      v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        objc_super v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_27;
      }
    }
    objc_super v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_27:

LABEL_36:
    *(_DWORD *)buf = 138543362;
    v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading all cells in list view", buf, 0xCu);

    goto LABEL_37;
  }
  id v4 = sub_100C1423C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = self;
    if (!v5)
    {
      id v10 = @"<nil>";
      goto LABEL_29;
    }
    unint64_t v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(TransitDirectionsStepsListDataSource *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading individual visible cells in collection view", buf, 0xCu);
  }
  v27 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  v28 = [v27 indexPathsForVisibleItems];

  v29 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  v30 = [v29 visibleCells];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100C15698;
  v33[3] = &unk_10131B900;
  id v34 = v28;
  v35 = self;
  id v31 = v28;
  [v30 enumerateObjectsUsingBlock:v33];

LABEL_39:
}

- (void)_updateFooterInListView
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self listView];

  if (v3)
  {
    unsigned __int8 v4 = [(TransitDirectionsStepsListDataSource *)self options];
    id v5 = [(TransitDirectionsStepsListDataSource *)self listView];
    unint64_t v6 = [v5 footerView];
    unsigned __int8 v7 = v6;
    if ((v4 & 8) != 0)
    {

      if (v7)
      {
        id v8 = [(TransitDirectionsStepsListDataSource *)self listView];
        v9 = [v8 footerView];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v12 = v10;

        [(TransitDirectionsStepsListDataSource *)self _configureFooterView:v12];
      }
      else
      {
        id v12 = -[RoutePlanningFooterView initWithFrame:]([RoutePlanningFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        [(TransitDirectionsStepsListDataSource *)self _configureFooterView:v12];
        id v11 = [(TransitDirectionsStepsListDataSource *)self listView];
        [v11 setFooterView:v12];
      }
    }
    else
    {

      if (!v7) {
        return;
      }
      id v12 = [(TransitDirectionsStepsListDataSource *)self listView];
      [(RoutePlanningFooterView *)v12 setFooterView:0];
    }
  }
}

- (void)_didFinishAnimatingListView
{
  if (self->_listViewReloadWaitingAnimationCompletion)
  {
    BOOL v3 = sub_100C1423C();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      self->_listViewReloadWaitingAnimationCompletion = 0;
      goto LABEL_13;
    }
    unsigned __int8 v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    if (v4->_reloadTableCompletionBlock) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    id v11 = v10;
    *(_DWORD *)buf = 138543618;
    id v13 = v9;
    __int16 v14 = 2112;
    double v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Will perform deferred table reload (completion block: %@)", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
  [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
}

- (double)_availableWidth
{
  v2 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
  [v2 bounds];
  double Width = CGRectGetWidth(v5);

  return Width;
}

- (int64_t)_userInterfaceIdiom
{
  v2 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
  BOOL v3 = [v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  return (int64_t)v4;
}

- (void)recalculateLeadingInstructionMarginForWidth:(double)a3
{
  self->_listWidthForCachedRowHeights = a3;
}

- (void)_measureShieldWidthForListWidth:(double)a3
{
  if (self->_listWidthForLeadingInset != a3)
  {
    self->_listWidthForLeadingInset = a3;
    CGRect v5 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
    double v6 = dbl_100F739B0[sub_1000BBB44(v5) == 5];

    unsigned __int8 v7 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
    sub_1000BBB44(v7);

    id v8 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
    if (sub_1000BBB44(v8) == 5) {
      double v9 = 30.0;
    }
    else {
      double v9 = 40.0;
    }

    id v10 = +[NSMapTable strongToStrongObjectsMapTable];
    id v11 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v12 = [v11 items];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100C15E2C;
    v31[3] = &unk_10131B928;
    id v13 = v10;
    id v32 = v13;
    __int16 v14 = sub_100099700(v12, v31);

    *(double *)v28 = v9;
    *(double *)&v28[1] = a3 - v6;
    long long v29 = xmmword_100F739C0;
    long long v30 = xmmword_100F739C0;
    double v15 = [[TransitDirectionsListArtworkWidthCalculator alloc] initWithSizedArtworks:v14 sizeParameter:v28];
    __int16 v16 = [(TransitDirectionsListArtworkWidthCalculator *)v15 calculateArtworkViewWidthAndArtworkSizes:&self->_transitDirectionsListInstructionsLeadingInset];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          int v22 = [v16 objectForKey:v21];
          __int16 v23 = [v13 objectForKey:v21];
          [v23 setSelectedSize:[v22 shieldSize]];
        }
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v18);
    }
  }
}

- (void)_resetArtworkSizesForAdaptiveItems
{
  self->_listWidthForLeadingInset = 0.0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  BOOL v3 = [v2 items];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned __int8 v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if ([v9 adaptiveShieldSize]) {
            [v9 setSelectedSize:[v9 initialAdaptiveSizeGroup]];
          }
        }
        unsigned __int8 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_scrollToFirstCell
{
  BOOL v3 = sub_100C1423C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Scrolling to first cell", buf, 0xCu);
  }
  uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self tableView];
  if (!v10) {
    goto LABEL_19;
  }
  long long v11 = (void *)v10;
  long long v12 = [(TransitDirectionsStepsListDataSource *)self tableView];
  if ((uint64_t)[v12 numberOfSections] < 1) {
    goto LABEL_18;
  }
  long long v13 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double height = CGSizeZero.height;

  if (CGSizeZero.width != v15 || height != v17)
  {
    long long v11 = [(TransitDirectionsStepsListDataSource *)self tableView];
    long long v12 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v11 scrollToRowAtIndexPath:v12 atScrollPosition:1 animated:0];
LABEL_18:
  }
LABEL_19:
  uint64_t v20 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  if (!v20) {
    goto LABEL_27;
  }
  uint64_t v21 = (void *)v20;
  int v22 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  if ((uint64_t)[v22 numberOfSections] < 1) {
    goto LABEL_26;
  }
  __int16 v23 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double v28 = CGSizeZero.height;

  if (CGSizeZero.width != v25 || v28 != v27)
  {
    uint64_t v21 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    int v22 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v21 scrollToItemAtIndexPath:v22 atScrollPosition:1 animated:0];
LABEL_26:
  }
LABEL_27:
  uint64_t v30 = [(TransitDirectionsStepsListDataSource *)self listView];
  if (v30)
  {
    id v31 = (void *)v30;
    id v32 = [(TransitDirectionsStepsListDataSource *)self listView];
    [v32 bounds];
    double v34 = v33;
    double v36 = v35;
    double v37 = CGSizeZero.height;

    if (CGSizeZero.width != v34 || v37 != v36)
    {
      v39 = [(TransitDirectionsStepsListDataSource *)self listView];
      v40 = [(TransitDirectionsStepsListDataSource *)self listView];
      [v40 contentInset];
      [v39 setContentOffset:0, 0.0, v41];
    }
  }
}

- (void)scrollToDisplayedItemAnimated:(BOOL)a3
{
}

- (void)_scrollToDisplayedItemIfNeeded:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  if ([(TransitDirectionsStepsListDataSource *)self automaticallyScrollToDisplayedStep])
  {
    id v8 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
    id v9 = v8;
    if (!v8) {
      goto LABEL_43;
    }
    [v8 bounds];
    if (vabdd_f64(0.0, v10) <= 2.22044605e-16) {
      goto LABEL_43;
    }
    [v9 contentSize];
    if (vabdd_f64(0.0, v11) <= 2.22044605e-16) {
      goto LABEL_43;
    }
    long long v12 = [(TransitDirectionsStepsListDataSource *)self tableView];
    if (v12)
    {
      id v4 = [(TransitDirectionsStepsListDataSource *)self tableView];
      if ((uint64_t)[v4 numberOfSections] >= 1)
      {

LABEL_43:
        goto LABEL_44;
      }
    }
    uint64_t v13 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    if (v13)
    {
      double v14 = (void *)v13;
      double v15 = [(TransitDirectionsStepsListDataSource *)self collectionView];
      id v16 = [v15 numberOfSections];

      if (v12)
      {
      }
      if ((uint64_t)v16 > 0) {
        goto LABEL_43;
      }
    }
    else if (v12)
    {
    }
    if (v7
      || ([(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath],
          (uint64_t v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v17 = [v7 section];
      id v18 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];
      id v19 = [v18 section];

      if (v17 == v19) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    uint64_t v21 = sub_100C1423C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      [(TransitDirectionsStepsListDataSource *)self frameOfDisplayedComposedRouteStepCell];
      CGFloat x = v49.origin.x;
      CGFloat y = v49.origin.y;
      CGFloat width = v49.size.width;
      CGFloat height = v49.size.height;
      if (!CGRectIsNull(v49))
      {
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.CGFloat width = width;
        v50.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v50);
        [v9 contentInset];
        [v9 setContentOffset:v5 animated:MinY - v41];
        goto LABEL_43;
      }
      double v33 = sub_100C1423C();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
LABEL_42:

        goto LABEL_43;
      }
      double v34 = self;
      if (!v34)
      {
        v39 = @"<nil>";
        goto LABEL_41;
      }
      double v35 = (objc_class *)objc_opt_class();
      double v36 = NSStringFromClass(v35);
      if (objc_opt_respondsToSelector())
      {
        double v37 = [(TransitDirectionsStepsListDataSource *)v34 performSelector:"accessibilityIdentifier"];
        v38 = v37;
        if (v37 && ![v37 isEqualToString:v36])
        {
          v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

          goto LABEL_38;
        }
      }
      v39 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_38:

LABEL_41:
      v42 = [(TransitDirectionsStepsListDataSource *)v34 displayedItemIndexPath];
      *(_DWORD *)buf = 138543618;
      v44 = v39;
      __int16 v45 = 2114;
      id v46 = v42;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't scroll to displayed step: %{public}@ (invalid frame)", buf, 0x16u);

      goto LABEL_42;
    }
    int v22 = self;
    if (!v22)
    {
      double v27 = @"<nil>";
      goto LABEL_29;
    }
    __int16 v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      double v25 = [(TransitDirectionsStepsListDataSource *)v22 performSelector:"accessibilityIdentifier"];
      double v26 = v25;
      if (v25 && ![v25 isEqualToString:v24])
      {
        double v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        goto LABEL_27;
      }
    }
    double v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_27:

LABEL_29:
    double v28 = [(TransitDirectionsStepsListDataSource *)v22 displayedItemIndexPath];
    *(_DWORD *)buf = 138543874;
    v44 = v27;
    __int16 v45 = 2112;
    id v46 = v7;
    __int16 v47 = 2112;
    v48 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] Scrolling to updated displayed index path (previous: %@, updated: %@)", buf, 0x20u);

    goto LABEL_30;
  }
LABEL_44:
}

- (BOOL)_supportsFooterItem
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self tableView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)listItemForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
    if ([(TransitDirectionsStepsListDataSource *)self _supportsFooterItem]
      && ([(TransitDirectionsStepsListDataSource *)self options] & 8) != 0
      && (id)(v5 - 1) == [v4 section])
    {
      uint64_t v6 = @"TransitDirectionsListSharingIdentifier";
    }
    else
    {
      id v7 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
      uint64_t v6 = [v7 itemAtIndexPath:v4];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfSections
{
  BOOL v3 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  id v4 = (char *)[v3 numberOfSections];

  if ([(TransitDirectionsStepsListDataSource *)self _supportsFooterItem]) {
    v4 += ([(TransitDirectionsStepsListDataSource *)self options] >> 3) & 1;
  }
  return (unint64_t)v4;
}

- (unint64_t)_numberOfRowsInSection:(unint64_t)a3
{
  unint64_t v5 = [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
  if ([(TransitDirectionsStepsListDataSource *)self _supportsFooterItem]
    && ([(TransitDirectionsStepsListDataSource *)self options] & 8) != 0
    && v5 - 1 == a3)
  {
    return 1;
  }
  id v7 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  id v8 = [v7 numberOfItemsInSection:a3];

  return (unint64_t)v8;
}

- (id)_flatIndexFromIndexPath:(id)a3
{
  id v4 = a3;
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    unint64_t v5 = (char *)[v4 row];
    uint64_t v6 = (char *)[v4 section];
    if (v6)
    {
      id v7 = v6;
      for (i = 0; i != v7; ++i)
        unint64_t v5 = &v5[[(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:i]];
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
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    unint64_t v5 = (char *)[v4 row];
    unint64_t v6 = [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
    if (!v6)
    {
LABEL_6:
      double v10 = 0;
      goto LABEL_10;
    }
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:v8];
      if ((unint64_t)v5 < v9) {
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

- (NSArray)transitSegmentSectionRanges
{
  v2 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  BOOL v3 = [v2 segmentRanges];

  return (NSArray *)v3;
}

- (BOOL)hasIncidentItems
{
  v2 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  unsigned __int8 v3 = [v2 hasIncidentItems];

  return v3;
}

- (void)collapseAllItems
{
  unsigned __int8 v3 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  unsigned int v4 = [v3 hasBuiltItems];

  if (!v4) {
    return;
  }
  unint64_t v5 = sub_100C1423C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_11;
    }
    unint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    double v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Collapse all items", buf, 0xCu);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v12 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  uint64_t v13 = [v12 items];

  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v18 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])[v18 setExpanded:0]; {
      }
        }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  id v19 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [v19 reloadData];

  uint64_t v20 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [v20 reloadData];

  uint64_t v21 = [(TransitDirectionsStepsListDataSource *)self listView];
  [v21 reloadData];
}

- (void)expandAllItems
{
  unsigned __int8 v3 = sub_100C1423C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = self;
    if (!v4)
    {
      unint64_t v9 = @"<nil>";
      goto LABEL_10;
    }
    unint64_t v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        unint64_t v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    unint64_t v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    double v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Expand all items", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v10 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  id v11 = [v10 items];

  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v16 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])[v16 setExpanded:1]; {
      }
        }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v17 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [v17 reloadData];

  id v18 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [v18 reloadData];

  id v19 = [(TransitDirectionsStepsListDataSource *)self listView];
  [v19 reloadData];
}

- (void)_refreshItemInstructionStrings
{
  unsigned __int8 v3 = sub_100C1423C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = self;
    if (!v4)
    {
      unint64_t v9 = @"<nil>";
      goto LABEL_10;
    }
    unint64_t v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        unint64_t v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    unint64_t v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] refreshItemInstructionStrings", buf, 0xCu);
  }
  [(TransitDirectionsStepsListDataSource *)self _rebuildItems];
}

- (void)updateForClusteredLegSelectedRideIndexChange
{
  unsigned __int8 v3 = sub_100C1423C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = self;
    if (!v4)
    {
      unint64_t v9 = @"<nil>";
      goto LABEL_10;
    }
    unint64_t v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        unint64_t v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    unint64_t v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] updateForClusteredLegSelectedRideIndexChanage", buf, 0xCu);
  }
  [(TransitDirectionsStepsListDataSource *)self _rebuildItems];
}

- (void)_rebuildItems
{
  unsigned __int8 v3 = sub_100C1423C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = self;
    if (!v4)
    {
      unint64_t v9 = @"<nil>";
      goto LABEL_10;
    }
    unint64_t v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v7 = [(TransitDirectionsStepsListDataSource *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        unint64_t v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    unint64_t v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] rebuildItems", buf, 0xCu);
  }
  double v10 = [(TransitDirectionsStepsListDataSource *)self _expandedItemsIndices];
  id v11 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  [v11 forceRebuild];

  [(TransitDirectionsStepsListDataSource *)self _expandItemsAtIndices:v10];
}

- (id)_expandedItemsIndices
{
  unsigned __int8 v3 = +[NSMutableIndexSet indexSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v4 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  unint64_t v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]&& objc_msgSend(v11, "expanded"))
        {
          [v3 addIndex:(char *)i + v8];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v8 += (uint64_t)i;
    }
    while (v7);
  }

  return v3;
}

- (void)_expandItemsAtIndices:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C1794C;
  v3[3] = &unk_1012EB2B8;
  v3[4] = self;
  [a3 enumerateIndexesUsingBlock:v3];
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id v10 = &_dispatch_main_q;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_100C17BD8;
  id v19 = &unk_1012E9340;
  objc_copyWeak(&v22, &location);
  long long v20 = self;
  id v11 = v9;
  id v21 = v11;
  id v12 = &_dispatch_main_q;
  long long v13 = v17;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  long long v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && !strcmp(label, v15))
  {
    v18((uint64_t)v13);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)composedRoute:(id)a3 appliedTransitRouteUpdates:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C17CA0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_useNavigationMetrics
{
  return self->_navigationProvider != 0;
}

- (void)setEnableNavigationUpdates:(BOOL)a3
{
  if (self->_enableNavigationUpdates != a3)
  {
    self->_enableNavigationUpdates = a3;
    if (a3)
    {
      unsigned int v4 = [[DirectionsStepsListNavigationProvider alloc] initWithDelegate:self];
      navigationProvider = self->_navigationProvider;
      self->_navigationProvider = v4;

      id v6 = self->_navigationProvider;
      BOOL v7 = [(DirectionsStepsListNavigationProvider *)v6 isNavigating];
      id v8 = [(DirectionsStepsListNavigationProvider *)self->_navigationProvider route];
      [(TransitDirectionsStepsListDataSource *)self navigationProvider:v6 didChangeToNavigating:v7 withRoute:v8];
    }
    else
    {
      id v9 = self->_navigationProvider;
      self->_navigationProvider = 0;

      if (!self->_route)
      {
        id v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315906;
          long long v16 = "-[TransitDirectionsStepsListDataSource setEnableNavigationUpdates:]";
          __int16 v17 = 2080;
          id v18 = "TransitDirectionsStepsListDataSource.m";
          __int16 v19 = 1024;
          int v20 = 865;
          __int16 v21 = 2080;
          id v22 = "_route != nil";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
        }

        if (sub_100BB36BC())
        {
          long long v13 = sub_1005762E4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            long long v14 = +[NSThread callStackSymbols];
            int v15 = 138412290;
            long long v16 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
          }
        }
      }
      id v10 = [(GEOComposedRoute *)self->_route transitDirectionsStepsListDataProvider];
      dataProvider = self->_dataProvider;
      self->_dataProvider = v10;

      [(TransitDirectionsStepsListDataSource *)self setActiveComposedRouteStepIndex:0x7FFFFFFFFFFFFFFFLL];
      [(TransitDirectionsStepsListDataSource *)self setDisplayedComposedRouteStepIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChange];
  }
}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5
{
  if (a4) {
    [(TransitDirectionsStepsListDataSource *)self navigationProvider:a3 didUpdateRoute:a5];
  }
}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4
{
  id v6 = a3;
  [(TransitDirectionsStepsListDataSource *)self setRoute:a4];
  -[TransitDirectionsStepsListDataSource navigationProvider:didUpdateActiveStepIndex:](self, "navigationProvider:didUpdateActiveStepIndex:", v6, [v6 activeStepIndex]);
  -[TransitDirectionsStepsListDataSource navigationProvider:didUpdateDisplayedStepIndex:](self, "navigationProvider:didUpdateDisplayedStepIndex:", v6, [v6 displayedStepIndex]);
}

- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = sub_100C1423C();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      goto LABEL_36;
    }
    id v9 = self;
    if (!v9)
    {
      long long v14 = @"<nil>";
      goto LABEL_29;
    }
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(TransitDirectionsStepsListDataSource *)v9 performSelector:"accessibilityIdentifier"];
      long long v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        long long v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    long long v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advance step index is NSNotFound, meaning no matched step. Ignore it and maintain what we have.", buf, 0xCu);

    goto LABEL_30;
  }
  if ([v6 displayedStepIndex] != (id)0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[v7 displayedStepIndex] <= a4)
  {
    long long v24 = sub_100C1423C();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_35:

      self->_activeComposedRouteStepIndeCGFloat x = a4;
      [v7 setDisplayedStepIndex:0x7FFFFFFFFFFFFFFFLL];
      goto LABEL_36;
    }
    long long v25 = self;
    if (!v25)
    {
      uint64_t v30 = @"<nil>";
      goto LABEL_34;
    }
    double v26 = (objc_class *)objc_opt_class();
    double v27 = NSStringFromClass(v26);
    if (objc_opt_respondsToSelector())
    {
      double v28 = [(TransitDirectionsStepsListDataSource *)v25 performSelector:"accessibilityIdentifier"];
      long long v29 = v28;
      if (v28 && ![v28 isEqualToString:v27])
      {
        uint64_t v30 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v29];

        goto LABEL_27;
      }
    }
    uint64_t v30 = +[NSString stringWithFormat:@"%@<%p>", v27, v25];
LABEL_27:

LABEL_34:
    *(_DWORD *)buf = 138543874;
    id v32 = v30;
    __int16 v33 = 2048;
    unint64_t v34 = a4;
    __int16 v35 = 2048;
    id v36 = [v7 displayedStepIndex];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advance step index %lu has caught up to manually-selected step index %lu", buf, 0x20u);

    goto LABEL_35;
  }
  activeComposedRouteStepIndeCGFloat x = self->_activeComposedRouteStepIndex;
  long long v16 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];
  __int16 v17 = sub_100C1423C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = self;
    __int16 v19 = (objc_class *)objc_opt_class();
    int v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      __int16 v21 = [(TransitDirectionsStepsListDataSource *)v18 performSelector:"accessibilityIdentifier"];
      id v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        long long v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_18;
      }
    }
    long long v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_18:

    *(_DWORD *)buf = 138544130;
    id v32 = v23;
    __int16 v33 = 2048;
    unint64_t v34 = a4;
    __int16 v35 = 2048;
    id v36 = (id)activeComposedRouteStepIndex;
    __int16 v37 = 2048;
    id v38 = [v7 displayedStepIndex];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advanced to step index %lu (previous: %lu, displayedStepIndex: %lu)", buf, 0x2Au);
  }
  [(TransitDirectionsStepsListDataSource *)self setActiveComposedRouteStepIndex:a4];
  [(TransitDirectionsStepsListDataSource *)self _scrollToDisplayedItemIfNeeded:v16 animated:1];

LABEL_36:
}

- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4
{
  id v6 = self->_displayedItemIndexPath;
  BOOL v7 = sub_100C1423C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = self;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(TransitDirectionsStepsListDataSource *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        long long v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_7;
      }
    }
    long long v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_7:

    activeComposedRouteStepIndeCGFloat x = v8->_activeComposedRouteStepIndex;
    displayedComposedRouteStepIndeCGFloat x = v8->_displayedComposedRouteStepIndex;
    *(_DWORD *)buf = 138544130;
    __int16 v17 = v13;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2048;
    unint64_t v21 = displayedComposedRouteStepIndex;
    __int16 v22 = 2048;
    unint64_t v23 = activeComposedRouteStepIndex;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index did change to %lu (previous: %lu, activeStepIndex: %lu)", buf, 0x2Au);
  }
  [(TransitDirectionsStepsListDataSource *)self setDisplayedComposedRouteStepIndex:a4];
  [(TransitDirectionsStepsListDataSource *)self _scrollToDisplayedItemIfNeeded:v6 animated:1];
}

- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4
{
}

- (void)navigationProvider:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5 = a4;
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateWillUpdateRoute" object:0 userInfo:0];
  id v6 = [(TransitDirectionsStepsListDataSource *)self route];
  [v6 applyUpdatesToTransitRoute:v5];

  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateDidUpdateRoute" object:0 userInfo:0];
}

- (void)setActiveComposedRouteStepIndex:(unint64_t)a3
{
  activeComposedRouteStepIndeCGFloat x = self->_activeComposedRouteStepIndex;
  if (activeComposedRouteStepIndex != a3)
  {
    id v6 = sub_100C1423C();
    BOOL v7 = v6;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL && activeComposedRouteStepIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
LABEL_11:

        return;
      }
      id v8 = self;
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      if (objc_opt_respondsToSelector())
      {
        id v11 = [(TransitDirectionsStepsListDataSource *)v8 performSelector:"accessibilityIdentifier"];
        id v12 = v11;
        if (v11 && ![v11 isEqualToString:v10])
        {
          long long v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

          goto LABEL_10;
        }
      }
      long long v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_10:

      *(_DWORD *)buf = 138543362;
      __int16 v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[%{public}@] Suppressing attempt to set matched step index to NSNotFound", buf, 0xCu);

      goto LABEL_11;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    long long v14 = self;
    int v15 = (objc_class *)objc_opt_class();
    long long v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      __int16 v17 = [(TransitDirectionsStepsListDataSource *)v14 performSelector:"accessibilityIdentifier"];
      __int16 v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        unint64_t v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_18;
      }
    }
    unint64_t v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_18:

    unint64_t v20 = self->_activeComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    __int16 v22 = v19;
    __int16 v23 = 2048;
    unint64_t v24 = v20;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Active step index changed from %lu to %lu", buf, 0x20u);

LABEL_19:
    self->_activeComposedRouteStepIndeCGFloat x = a3;
    [(TransitDirectionsStepsListDataSource *)self _refreshActiveItemIndexPath];
    [(TransitDirectionsStepsListDataSource *)self _refreshDisplayedItemIndexPath];
  }
}

- (NSIndexPath)activeItemIndexPath
{
  activeItemIndexPath = self->_activeItemIndexPath;
  if (!activeItemIndexPath)
  {
    [(TransitDirectionsStepsListDataSource *)self _refreshActiveItemIndexPath];
    activeItemIndexPath = self->_activeItemIndexPath;
  }

  return activeItemIndexPath;
}

- (void)_refreshActiveItemIndexPath
{
  unsigned __int8 v3 = self->_activeItemIndexPath;
  if (!self->_navigationProvider)
  {
    id v6 = sub_100C1423C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    unint64_t v20 = self;
    unint64_t v21 = (objc_class *)objc_opt_class();
    __int16 v22 = NSStringFromClass(v21);
    if (objc_opt_respondsToSelector())
    {
      __int16 v23 = [(TransitDirectionsStepsListDataSource *)v20 performSelector:"accessibilityIdentifier"];
      unint64_t v24 = v23;
      if (v23 && ![v23 isEqualToString:v22])
      {
        __int16 v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

        goto LABEL_25;
      }
    }
    __int16 v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_25:

    *(_DWORD *)buf = 138543362;
    __int16 v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Not navigating, clearing active step index path", buf, 0xCu);

    goto LABEL_26;
  }
  activeComposedRouteStepIndeCGFloat x = self->_activeComposedRouteStepIndex;
  if (activeComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL
    || activeComposedRouteStepIndex >= (unint64_t)[(GEOComposedRoute *)self->_route stepsCount])
  {
    id v6 = sub_100C1423C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_26:
      id v5 = 0;
      goto LABEL_27;
    }
    long long v13 = self;
    long long v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      long long v16 = [(TransitDirectionsStepsListDataSource *)v13 performSelector:"accessibilityIdentifier"];
      __int16 v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_18;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_18:

    id v19 = [(GEOComposedRoute *)v13->_route stepsCount];
    *(_DWORD *)buf = 138543874;
    __int16 v35 = v18;
    __int16 v36 = 2048;
    __int16 v37 = (const char *)activeComposedRouteStepIndex;
    __int16 v38 = 2048;
    *(void *)v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Active step index %lu is out of bounds %lu", buf, 0x20u);

    goto LABEL_26;
  }
  id v5 = [(TransitDirectionsStepsListDataSource *)self _itemIndexPathForStepIndex:activeComposedRouteStepIndex];
  if (!v5)
  {
    uint64_t v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = +[NSString stringWithFormat:@"No indexPath found for active step with index %lu", activeComposedRouteStepIndex];
      *(_DWORD *)buf = 136316162;
      __int16 v35 = "-[TransitDirectionsStepsListDataSource _refreshActiveItemIndexPath]";
      __int16 v36 = 2080;
      __int16 v37 = "TransitDirectionsStepsListDataSource.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 981;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = "indexPath != nil";
      __int16 v40 = 2112;
      double v41 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v35 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v6 = sub_100C1423C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(TransitDirectionsStepsListDataSource *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_11;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_11:

    *(_DWORD *)buf = 138543874;
    __int16 v35 = v12;
    __int16 v36 = 2048;
    __int16 v37 = (const char *)activeComposedRouteStepIndex;
    __int16 v38 = 2112;
    *(void *)v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Active stepIndex %lu corresponds to indexPath: %@", buf, 0x20u);
  }
LABEL_27:

  activeItemIndexPath = self->_activeItemIndexPath;
  self->_activeItemIndexPath = v5;

  unint64_t v27 = self->_activeItemIndexPath;
  id v28 = v3;
  if ((unint64_t)v28 | v27)
  {
    unsigned __int8 v29 = [(id)v27 isEqual:v28];

    if ((v29 & 1) == 0)
    {
      [(TransitDirectionsStepsListDataSource *)self _updateActiveItemInListViewIfNeeded];
      [(TransitDirectionsStepsListDataSource *)self _notifyDelegateOfUpdatedActiveStep];
    }
  }
}

- (void)setDisplayedComposedRouteStepIndex:(unint64_t)a3
{
  if (self->_displayedComposedRouteStepIndex != a3)
  {
    if (![(TransitDirectionsStepsListDataSource *)self enableNavigationUpdates]
      || [(DirectionsStepsListNavigationProvider *)self->_navigationProvider displayedStepIndex] == a3)
    {
      id v5 = sub_100C1423C();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        self->_displayedComposedRouteStepIndeCGFloat x = a3;
        [(TransitDirectionsStepsListDataSource *)self _refreshDisplayedItemIndexPath];
        return;
      }
      id v6 = self;
      BOOL v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      if (objc_opt_respondsToSelector())
      {
        id v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
        id v10 = v9;
        if (v9 && ![v9 isEqualToString:v8])
        {
          id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

          goto LABEL_10;
        }
      }
      id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

      displayedComposedRouteStepIndeCGFloat x = self->_displayedComposedRouteStepIndex;
      *(_DWORD *)buf = 138543874;
      unint64_t v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = displayedComposedRouteStepIndex;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index changed from %lu to %lu", buf, 0x20u);

      goto LABEL_11;
    }
    long long v13 = sub_100C1423C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    long long v14 = self;
    int v15 = (objc_class *)objc_opt_class();
    long long v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      __int16 v17 = [(TransitDirectionsStepsListDataSource *)v14 performSelector:"accessibilityIdentifier"];
      __int16 v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        id v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_18;
      }
    }
    id v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_18:

    *(_DWORD *)buf = 138543618;
    unint64_t v21 = v19;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] Updating navigation provider with updated displayed step index %lu", buf, 0x16u);

LABEL_19:
    [(DirectionsStepsListNavigationProvider *)self->_navigationProvider setDisplayedStepIndex:a3];
  }
}

- (id)displayedTransitDirectionsListItemIndexPath
{
  displayedItemIndexPath = self->_displayedItemIndexPath;
  if (!displayedItemIndexPath)
  {
    [(TransitDirectionsStepsListDataSource *)self _refreshDisplayedItemIndexPath];
    displayedItemIndexPath = self->_displayedItemIndexPath;
  }

  return displayedItemIndexPath;
}

- (void)_refreshDisplayedItemIndexPath
{
  unsigned __int8 v3 = self->_displayedItemIndexPath;
  displayedComposedRouteStepIndeCGFloat x = self->_displayedComposedRouteStepIndex;
  if (displayedComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL) {
    displayedComposedRouteStepIndeCGFloat x = self->_activeComposedRouteStepIndex;
  }
  if (!self->_navigationProvider)
  {
    id v6 = sub_100C1423C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    unint64_t v20 = self;
    unint64_t v21 = (objc_class *)objc_opt_class();
    __int16 v22 = NSStringFromClass(v21);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v23 = [(TransitDirectionsStepsListDataSource *)v20 performSelector:"accessibilityIdentifier"];
      __int16 v24 = v23;
      if (v23 && ![v23 isEqualToString:v22])
      {
        unint64_t v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

        goto LABEL_27;
      }
    }
    unint64_t v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_27:

    *(_DWORD *)buf = 138543362;
    __int16 v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Not navigating, clearing displayed step index path", buf, 0xCu);

    goto LABEL_28;
  }
  if (displayedComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL
    || displayedComposedRouteStepIndex >= (unint64_t)[(GEOComposedRoute *)self->_route stepsCount])
  {
    id v6 = sub_100C1423C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_28:
      id v5 = 0;
      goto LABEL_29;
    }
    long long v13 = self;
    long long v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      long long v16 = [(TransitDirectionsStepsListDataSource *)v13 performSelector:"accessibilityIdentifier"];
      __int16 v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_20;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_20:

    id v19 = [(GEOComposedRoute *)v13->_route stepsCount];
    *(_DWORD *)buf = 138543874;
    __int16 v35 = v18;
    __int16 v36 = 2048;
    __int16 v37 = (const char *)displayedComposedRouteStepIndex;
    __int16 v38 = 2048;
    *(void *)v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index %lu is out of bounds %lu", buf, 0x20u);

    goto LABEL_28;
  }
  id v5 = [(TransitDirectionsStepsListDataSource *)self _itemIndexPathForStepIndex:displayedComposedRouteStepIndex];
  if (!v5)
  {
    uint64_t v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = +[NSString stringWithFormat:@"No indexPath found for displayed step with index %lu", displayedComposedRouteStepIndex];
      *(_DWORD *)buf = 136316162;
      __int16 v35 = "-[TransitDirectionsStepsListDataSource _refreshDisplayedItemIndexPath]";
      __int16 v36 = 2080;
      __int16 v37 = "TransitDirectionsStepsListDataSource.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 1040;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = "indexPath != nil";
      __int16 v40 = 2112;
      double v41 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v35 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v6 = sub_100C1423C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(TransitDirectionsStepsListDataSource *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_13;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_13:

    *(_DWORD *)buf = 138543874;
    __int16 v35 = v12;
    __int16 v36 = 2048;
    __int16 v37 = (const char *)displayedComposedRouteStepIndex;
    __int16 v38 = 2112;
    *(void *)v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] displayed stepIndex %lu corresponds to indexPath: %@", buf, 0x20u);
  }
LABEL_29:

  displayedItemIndexPath = self->_displayedItemIndexPath;
  self->_displayedItemIndexPath = v5;

  unint64_t v27 = self->_displayedItemIndexPath;
  id v28 = v3;
  if ((unint64_t)v28 | v27)
  {
    unsigned __int8 v29 = [(id)v27 isEqual:v28];

    if ((v29 & 1) == 0)
    {
      [(TransitDirectionsStepsListDataSource *)self _updateActiveItemInListViewIfNeeded];
      [(TransitDirectionsStepsListDataSource *)self _updateDisplayStyleInVisibleCells];
      [(TransitDirectionsStepsListDataSource *)self _notifyDelegateOfUpdatedDisplayedStep];
    }
  }
}

- (id)_itemIndexPathForStepIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[(GEOComposedRoute *)self->_route stepsCount] > a3)
  {
    id v5 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    uint64_t v6 = (uint64_t)[v5 numberOfSections];

    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      id v8 = NSCollectionLayoutEdgeSpacing_ptr;
      uint64_t v25 = v6;
      do
      {
        id v9 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
        uint64_t v10 = (uint64_t)[v9 numberOfItemsInSection:v7 includingHiddenSubitems:1];

        if (v10 >= 1)
        {
          uint64_t v11 = v10;
          uint64_t v12 = 0;
          uint64_t v26 = v10;
          uint64_t v27 = v7;
          do
          {
            long long v13 = [v8[26] indexPathForRow:v12 inSection:v7];
            long long v14 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v13];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 matchingRouteStepIndex] == (id)a3)
              {
LABEL_23:

                goto LABEL_31;
              }
              long long v30 = 0u;
              long long v31 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              long long v16 = [v15 composedRouteSteps];
              id v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v19 = *(void *)v29;
                while (2)
                {
                  for (i = 0; i != v18; i = (char *)i + 1)
                  {
                    if (*(void *)v29 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    if ([*(id *)(*((void *)&v28 + 1) + 8 * i) stepIndex] == (id)a3)
                    {

                      goto LABEL_23;
                    }
                  }
                  id v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v6 = v25;
              uint64_t v11 = v26;
              uint64_t v7 = v27;
              id v8 = NSCollectionLayoutEdgeSpacing_ptr;
            }

            ++v12;
          }
          while (v12 != v11);
        }
        ++v7;
      }
      while (v7 != v6);
    }
    if (a3)
    {
      long long v13 = [(TransitDirectionsStepsListDataSource *)self _itemIndexPathForStepIndex:a3 - 1];
      goto LABEL_31;
    }
    unint64_t v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v33 = "-[TransitDirectionsStepsListDataSource _itemIndexPathForStepIndex:]";
      __int16 v34 = 2080;
      __int16 v35 = "TransitDirectionsStepsListDataSource.m";
      __int16 v36 = 1024;
      int v37 = 1091;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      __int16 v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unint64_t v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v33 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  long long v13 = 0;
LABEL_31:

  return v13;
}

- (CGRect)frameOfDisplayedComposedRouteStepCell
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100C19CF8;
  v24[3] = &unk_10131B950;
  v24[4] = self;
  uint64_t v7 = objc_retainBlock(v24);
  id v8 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];
  id v9 = [v8 section];
  uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  uint64_t v11 = (uint64_t)[v10 numberOfItemsInSection:v9];

  if (v11 < 1)
  {
    double v19 = height;
  }
  else
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      long long v13 = +[NSIndexPath indexPathForRow:i inSection:v9];
      long long v14 = [(TransitDirectionsStepsListDataSource *)self _flatIndexFromIndexPath:v13];
      ((void (*)(void *, void *))v7[2])(v7, v14);
      double v19 = v18;
      if (i)
      {
        double v19 = height + CGRectGetHeight(*(CGRect *)&v15);
      }
      else
      {
        CGFloat width = v17;
        CGFloat y = v16;
        CGFloat x = v15;
      }

      double height = v19;
    }
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = v19;
  result.size.double height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)_notifyDelegateOfUpdatedActiveStep
{
  id v14 = [(TransitDirectionsStepsListDataSource *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [(TransitDirectionsStepsListDataSource *)self activeItemIndexPath];

    if (!v3) {
      return;
    }
    unsigned int v4 = [(TransitDirectionsStepsListDataSource *)self activeComposedRouteStep];
    if (!v4) {
      goto LABEL_18;
    }
    id v5 = sub_100C1423C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      long long v13 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v13 transitDirectionsStepsListDataSource:self didUpdateActiveGuidanceStep:v4];

LABEL_18:
      return;
    }
    uint64_t v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_16;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_11;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_11:

LABEL_16:
    activeComposedRouteStepIndeCGFloat x = v6->_activeComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    double v16 = v11;
    __int16 v17 = 2048;
    unint64_t v18 = activeComposedRouteStepIndex;
    __int16 v19 = 2112;
    double v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Notifying delegate of updated ACTIVE (parent) route step for index %lu: %@", buf, 0x20u);

    goto LABEL_17;
  }
}

- (void)_notifyDelegateOfUpdatedDisplayedStep
{
  id v14 = [(TransitDirectionsStepsListDataSource *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];

    if (!v3) {
      return;
    }
    unsigned int v4 = [(TransitDirectionsStepsListDataSource *)self displayedComposedRouteStep];
    if (!v4) {
      goto LABEL_18;
    }
    id v5 = sub_100C1423C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      long long v13 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v13 transitDirectionsStepsListDataSource:self didUpdateDisplayedGuidanceStep:v4];

LABEL_18:
      return;
    }
    uint64_t v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_16;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_11;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_11:

LABEL_16:
    displayedComposedRouteStepIndeCGFloat x = v6->_displayedComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    double v16 = v11;
    __int16 v17 = 2048;
    unint64_t v18 = displayedComposedRouteStepIndex;
    __int16 v19 = 2112;
    double v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Notifying delegate of updated DISPLAYED (parent) route step for index %lu: %@", buf, 0x20u);

    goto LABEL_17;
  }
}

- (id)_activeItem
{
  unsigned __int8 v3 = [(TransitDirectionsStepsListDataSource *)self activeItemIndexPath];

  if (v3)
  {
    unsigned int v4 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v5 = [(TransitDirectionsStepsListDataSource *)self activeItemIndexPath];
    uint64_t v6 = [v4 itemAtIndexPath:v5];

    uint64_t v7 = [v6 parentItem];

    if (v7)
    {
      uint64_t v8 = [v6 parentItem];

      uint64_t v6 = (void *)v8;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (GEOComposedRouteStep)activeComposedRouteStep
{
  unsigned __int8 v3 = [(TransitDirectionsStepsListDataSource *)self _activeItem];
  unsigned int v4 = [v3 matchingRouteStep];
  if (!v4 && [v3 type])
  {
    uint64_t v11 = self;
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(TransitDirectionsStepsListDataSource *)v11 activeItemIndexPath];
      uint64_t v8 = +[NSString stringWithFormat:@"No step found for updated matched index path %@", v7];
      *(_DWORD *)buf = 136316162;
      long long v13 = "-[TransitDirectionsStepsListDataSource activeComposedRouteStep]";
      __int16 v14 = 2080;
      CGFloat v15 = "TransitDirectionsStepsListDataSource.m";
      __int16 v16 = 1024;
      int v17 = 1174;
      __int16 v18 = 2080;
      __int16 v19 = "step || item.type == TransitDirectionsListItemTypeOrigin";
      __int16 v20 = 2112;
      double v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        long long v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }

  return (GEOComposedRouteStep *)v4;
}

- (unint64_t)activeItemIndex
{
  v2 = [(TransitDirectionsStepsListDataSource *)self activeItemIndexPath];
  id v3 = [v2 section];

  return (unint64_t)v3;
}

- (id)_displayedItem
{
  id v3 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];

  if (v3)
  {
    unsigned int v4 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v5 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];
    uint64_t v6 = [v4 itemAtIndexPath:v5];

    uint64_t v7 = [v6 parentItem];

    if (v7)
    {
      uint64_t v8 = [v6 parentItem];

      uint64_t v6 = (void *)v8;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (GEOComposedRouteStep)displayedComposedRouteStep
{
  id v3 = [(TransitDirectionsStepsListDataSource *)self _displayedItem];
  unsigned int v4 = [v3 matchingRouteStep];
  if (!v4 && [v3 type])
  {
    uint64_t v11 = self;
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(TransitDirectionsStepsListDataSource *)v11 activeItemIndexPath];
      uint64_t v8 = +[NSString stringWithFormat:@"No step found for updated matched index path %@", v7];
      *(_DWORD *)buf = 136316162;
      long long v13 = "-[TransitDirectionsStepsListDataSource displayedComposedRouteStep]";
      __int16 v14 = 2080;
      CGFloat v15 = "TransitDirectionsStepsListDataSource.m";
      __int16 v16 = 1024;
      int v17 = 1200;
      __int16 v18 = 2080;
      __int16 v19 = "step || item.type == TransitDirectionsListItemTypeOrigin";
      __int16 v20 = 2112;
      double v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        long long v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }

  return (GEOComposedRouteStep *)v4;
}

- (unint64_t)displayedItemIndex
{
  v2 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexPath];
  id v3 = [v2 section];

  return (unint64_t)v3;
}

- (unint64_t)indexOfItem:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  uint64_t v6 = [v5 indexPathForItem:v4];

  id v7 = [v6 section];
  return (unint64_t)v7;
}

- (id)displayedItemIndexForAnalytics
{
  unint64_t v2 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndex];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[NSNumber numberWithUnsignedInteger:v2];
  }

  return v3;
}

- (void)_localeDidChange
{
  [(TransitDirectionsStepsListDataSource *)self _refreshItemInstructionStrings];

  [(TransitDirectionsStepsListDataSource *)self _reloadListViewForRouteChangeIfNotAnimating];
}

- (MapsThrottler)matchedLocationThrottler
{
  matchedLocationThrottler = self->_matchedLocationThrottler;
  if (!matchedLocationThrottler)
  {
    objc_initWeak(&location, self);
    id v4 = [MapsThrottler alloc];
    id v5 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100C1AB24;
    v9[3] = &unk_1012ED3A8;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [(MapsThrottler *)v4 initWithInitialValue:0 throttlingInterval:&_dispatch_main_q queue:v9 updateHandler:10.0];
    id v7 = self->_matchedLocationThrottler;
    self->_matchedLocationThrottler = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    matchedLocationThrottler = self->_matchedLocationThrottler;
  }

  return matchedLocationThrottler;
}

- (MNLocation)matchedLocation
{
  unint64_t v2 = [(TransitDirectionsStepsListDataSource *)self matchedLocationThrottler];
  id v3 = [v2 value];

  return (MNLocation *)v3;
}

- (void)setMatchedLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsStepsListDataSource *)self matchedLocationThrottler];
  [v5 setValue:v4];
}

- (void)setUseCollapsedDisplayStyle:(BOOL)a3
{
  if (self->_useCollapsedDisplayStyle != a3) {
    -[TransitDirectionsStepsListDataSource _setUseCollapsedDisplayStyle:](self, "_setUseCollapsedDisplayStyle:");
  }
}

- (void)_setUseCollapsedDisplayStyle:(BOOL)a3
{
  self->_useCollapsedDisplayStyle = a3;
  [(TransitDirectionsStepsListDataSource *)self _updateDisplayStyleInVisibleCells];
  id v4 = [(TransitDirectionsStepsListDataSource *)self _scrollView];
  [v4 layoutBelowIfNeeded];

  id v5 = [(TransitDirectionsStepsListDataSource *)self listView];
  [v5 reloadSeparators];
}

- (void)_updateDisplayStyleInVisibleCells
{
  id v3 = [(TransitDirectionsStepsListDataSource *)self collectionView];

  if (!v3)
  {
    uint64_t v11 = [(TransitDirectionsStepsListDataSource *)self tableView];

    if (v11)
    {
      uint64_t v12 = [(TransitDirectionsStepsListDataSource *)self tableView];
      long long v13 = [v12 visibleCells];

      __int16 v14 = [(TransitDirectionsStepsListDataSource *)self tableView];
      CGFloat v15 = [v14 indexPathsForVisibleRows];

      __int16 v16 = sub_100C1423C();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
LABEL_33:

        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100C1B37C;
        v38[3] = &unk_10131B978;
        v39 = v15;
        __int16 v40 = self;
        id v35 = v15;
        [v13 enumerateObjectsUsingBlock:v38];
        __int16 v36 = v39;
        goto LABEL_34;
      }
      int v17 = self;
      if (!v17)
      {
        double v22 = @"<nil>";
        goto LABEL_32;
      }
      __int16 v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      if (objc_opt_respondsToSelector())
      {
        __int16 v20 = [(TransitDirectionsStepsListDataSource *)v17 performSelector:"accessibilityIdentifier"];
        double v21 = v20;
        if (v20 && ![v20 isEqualToString:v19])
        {
          double v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

          goto LABEL_18;
        }
      }
      double v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_18:

LABEL_32:
      *(_DWORD *)buf = 138543362;
      __int16 v45 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual cells in table view", buf, 0xCu);

      goto LABEL_33;
    }
    double v23 = [(TransitDirectionsStepsListDataSource *)self listView];

    if (!v23) {
      return;
    }
    __int16 v24 = [(TransitDirectionsStepsListDataSource *)self listView];
    long long v13 = [v24 allStepViews];

    uint64_t v25 = sub_100C1423C();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
LABEL_40:

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100C1B474;
      v37[3] = &unk_1012F3290;
      v37[4] = self;
      [v13 enumerateObjectsUsingBlock:v37];
      goto LABEL_35;
    }
    uint64_t v26 = self;
    if (!v26)
    {
      long long v31 = @"<nil>";
      goto LABEL_39;
    }
    uint64_t v27 = (objc_class *)objc_opt_class();
    long long v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      long long v29 = [(TransitDirectionsStepsListDataSource *)v26 performSelector:"accessibilityIdentifier"];
      long long v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        long long v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_27;
      }
    }
    long long v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_27:

LABEL_39:
    *(_DWORD *)buf = 138543362;
    __int16 v45 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual step views in list view", buf, 0xCu);

    goto LABEL_40;
  }
  id v4 = sub_100C1423C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = self;
    if (!v5)
    {
      id v10 = @"<nil>";
      goto LABEL_29;
    }
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(TransitDirectionsStepsListDataSource *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    __int16 v45 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual visible cells in collection view", buf, 0xCu);
  }
  id v32 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  long long v13 = [v32 visibleCells];

  __int16 v33 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  __int16 v34 = [v33 indexPathsForVisibleItems];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100C1B284;
  v41[3] = &unk_10131B900;
  v42 = v34;
  v43 = self;
  id v35 = v34;
  [v13 enumerateObjectsUsingBlock:v41];
  __int16 v36 = v42;
LABEL_34:

LABEL_35:
}

- (unint64_t)_stepViewDisplayOptionsForSection:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v3 = 2;
  if (!self->_useCollapsedDisplayStyle) {
    unint64_t v3 = 4;
  }
  navigationProvider = self->_navigationProvider;
  if (navigationProvider) {
    unint64_t v3 = 4;
  }
  if (self->_useCollapsedDisplayStyle && navigationProvider != 0)
  {
    unint64_t v7 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndex];
    unint64_t v3 = 2;
    if (v7 == a3) {
      return 3;
    }
  }
  return v3;
}

- (NSMapTable)estimatedHeightsByItem
{
  estimatedHeightsByItem = self->_estimatedHeightsByItem;
  if (!estimatedHeightsByItem)
  {
    id v4 = +[NSMapTable mapTableWithKeyOptions:261 valueOptions:0];
    id v5 = self->_estimatedHeightsByItem;
    self->_estimatedHeightsByItem = v4;

    estimatedHeightsByItem = self->_estimatedHeightsByItem;
  }

  return estimatedHeightsByItem;
}

- (void)_resetRowHeightCache
{
  id v2 = [(TransitDirectionsStepsListDataSource *)self estimatedHeightsByItem];
  [v2 removeAllObjects];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection]) {
    return 1;
  }

  return [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    if (![(TransitDirectionsStepsListDataSource *)self _numberOfSections]) {
      return 0;
    }
    unint64_t v6 = 0;
    int64_t v7 = 0;
    do
      v7 += [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:v6++];
    while (v6 < [(TransitDirectionsStepsListDataSource *)self _numberOfSections]);
    return v7;
  }
  else
  {
    return [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:a4];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  id v9 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = +[TransitDirectionsCell dequeueCellForListItem:v9 fromTableView:v6 atIndexPath:v7];
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsExpandableCell]) {
      [v10 setExpandableCellDelegate:self];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 stepView];
      [v11 setBoardingInfoDelegate:self];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setDelegate:self];
        }
LABEL_11:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
          [v10 setLeadingInstructionMargin:];
        }
        [v10 setUseNavigationMetrics:[self _useNavigationMetrics]];
        objc_msgSend(v10, "setDisplayOptions:", -[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", objc_msgSend(v7, "section")));
        [v10 configureWithItem:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v10 stepView];
          if ((uint64_t)[v7 row] <= 0)
          {
            double v23 = sub_1005762E4();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              int v26 = 136315906;
              uint64_t v27 = "-[TransitDirectionsStepsListDataSource tableView:cellForRowAtIndexPath:]";
              __int16 v28 = 2080;
              long long v29 = "TransitDirectionsStepsListDataSource.m";
              __int16 v30 = 1024;
              int v31 = 1431;
              __int16 v32 = 2080;
              __int16 v33 = "indexPath.row > 0";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v26, 0x26u);
            }

            if (sub_100BB36BC())
            {
              __int16 v24 = sub_1005762E4();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                uint64_t v25 = +[NSThread callStackSymbols];
                int v26 = 138412290;
                uint64_t v27 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
              }
            }
          }
          if ((uint64_t)[v7 row] >= 1)
          {
            long long v13 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v7 row] - 1, objc_msgSend(v7, "section"));
            __int16 v14 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
            CGFloat v15 = [v14 itemAtIndexPath:v13];

            [v12 setPreviousItem:v15 withPreviousNavigationState:[self _cellNavStateForItem:v15 atIndexPath:v13]];
          }
        }
        [v10 setNavigationState:[self _cellNavStateForItem:v9 atIndexPath:v7]];
        if (v10) {
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      uint64_t v11 = [v10 stepView];
      [v11 setDelegate:self];
    }

    goto LABEL_11;
  }
  if ([v9 isEqual:@"TransitDirectionsListSharingIdentifier"])
  {
    id v10 = [(TransitDirectionsStepsListDataSource *)self _footerCellForIndexPath:v7 inTableView:v6];
    goto LABEL_27;
  }
LABEL_19:
  __int16 v16 = sub_1005762E4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315650;
    uint64_t v27 = "-[TransitDirectionsStepsListDataSource tableView:cellForRowAtIndexPath:]";
    __int16 v28 = 2080;
    long long v29 = "TransitDirectionsStepsListDataSource.m";
    __int16 v30 = 1024;
    int v31 = 1450;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v26, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    int v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = +[NSThread callStackSymbols];
      int v26 = 138412290;
      uint64_t v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
    }
  }
  id v19 = objc_alloc((Class)MKTableViewCell);
  __int16 v20 = (objc_class *)objc_opt_class();
  double v21 = NSStringFromClass(v20);
  id v10 = [v19 initWithStyle:0 reuseIdentifier:v21];

LABEL_26:
  [(TransitDirectionsStepsListDataSource *)self _configureSeparatorForCell:v10 forRowAtIndexPath:v7];
LABEL_27:

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v6 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v5];
  id v7 = [(TransitDirectionsStepsListDataSource *)self estimatedHeightsByItem];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v8 floatValue];
    double v10 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[TransitDirectionsStepView estimatedHeightForListItem:v6];
      double v10 = v11;
    }
    else
    {
      double v10 = 70.0;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v6 cellForRowAtIndexPath:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        [v12 setHighlighted:1];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  id v8 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [v6 cellForRowAtIndexPath:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        [v13 setHighlighted:0];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 selectRowAtIndexPath:*(void *)(*((void *)&v14 + 1) + 8 * i) animated:0 scrollPosition:0];
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:v7];
  uint64_t v9 = sub_1000BBB44(v6);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = [v6 indexPathsForSelectedRows];
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v14);
        if (v9 != 5
          || ([*(id *)(*((void *)&v28 + 1) + 8 * (void)v14) isEqual:v7] & 1) == 0
          && ([v8 containsObject:v15] & 1) == 0)
        {
          [v6 deselectRowAtIndexPath:v15 animated:v9 != 5];
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  long long v16 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  id v17 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v18 = [v8 firstObject];
    if ([v18 compare:v16] == (id)-1)
    {
      uint64_t v19 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v18];

      id v17 = (id)v19;
    }
    id v17 = v17;
    if ([v17 type] == (id)3
      && ([(TransitDirectionsStepsListDataSource *)self delegate],
          __int16 v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = objc_opt_respondsToSelector(),
          v20,
          (v21 & 1) != 0))
    {
      double v22 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v22 transitDirectionsStepsListDataSource:self didSelectTrip:v17];
    }
    else if ([v17 type] == (id)4 {
           && ([(TransitDirectionsStepsListDataSource *)self delegate],
    }
               double v23 = objc_claimAutoreleasedReturnValue(),
               char v24 = objc_opt_respondsToSelector(),
               v23,
               (v24 & 1) != 0))
    {
      double v22 = [v6 cellForRowAtIndexPath:v16];
      uint64_t v25 = [v22 stepView];
      [(TransitDirectionsStepsListDataSource *)self transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:v25];
    }
    else
    {
      int v26 = [(TransitDirectionsStepsListDataSource *)self delegate];
      char v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      double v22 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v22 transitDirectionsStepsListDataSource:self didTapRowForItem:v17];
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(TransitDirectionsStepsListDataSource *)self _shouldHighlightItemAtIndexPath:a4];
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v4 = a3;
  if (self->_routeSetAwaitingTableViewReload)
  {
    self->_routeSetAwaitingTableViewReload = 0;
    id v14 = v4;
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [(TransitDirectionsStepsListDataSource *)self tableView];
    id v10 = [v9 safeAreaLayoutGuide];
    [v10 layoutFrame];
    double v11 = -CGRectGetMinY(v16);
    BOOL v12 = v6 == 0.0 && v8 == v11;
    if (v12 || (uint64_t)[v14 numberOfSections] < 1)
    {
    }
    else
    {
      uint64_t v13 = (uint64_t)[v14 numberOfRowsInSection:0];

      id v4 = v14;
      if (v13 < 1) {
        goto LABEL_11;
      }
      uint64_t v9 = +[NSIndexPath indexPathForRow:0 inSection:0];
      [v14 scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:0];
    }

    id v4 = v14;
  }
LABEL_11:
}

- (void)_cacheHeightForRow:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:a4];
  double v8 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v7];
  if (v8)
  {
    uint64_t v9 = [(TransitDirectionsStepsListDataSource *)self estimatedHeightsByItem];
    [v6 bounds];
    id v10 = +[NSNumber numberWithDouble:CGRectGetHeight(v20)];
    [v9 setObject:v10 forKey:v8];
    goto LABEL_3;
  }
  double v11 = sub_1005762E4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315906;
    uint64_t v13 = "-[TransitDirectionsStepsListDataSource _cacheHeightForRow:atIndexPath:]";
    __int16 v14 = 2080;
    uint64_t v15 = "TransitDirectionsStepsListDataSource.m";
    __int16 v16 = 1024;
    int v17 = 1567;
    __int16 v18 = 2080;
    uint64_t v19 = "item";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
  }

  if (sub_100BB36BC())
  {
    uint64_t v9 = sub_1005762E4();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    id v10 = +[NSThread callStackSymbols];
    int v12 = 138412290;
    uint64_t v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
LABEL_3:

LABEL_4:
  }
}

- (int64_t)_cellNavStateForItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(TransitDirectionsStepsListDataSource *)self activeItemIndexPath];
  if (v8)
  {
    uint64_t v9 = [(TransitDirectionsStepsListDataSource *)self matchedLocation];
    unsigned int v10 = [v9 _navigation_isStale];

    id v11 = [v7 section];
    id v12 = [v8 section];
    uint64_t v13 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
    if (v11 != v12)
    {
      if ([v8 compare:v13] == (id)1)
      {
        id v19 = [(TransitDirectionsStepsListDataSource *)self _segementRangeForItemAtIndexPath:v8];
        NSUInteger v21 = v20;
        id v22 = [(TransitDirectionsStepsListDataSource *)self _segementRangeForItemAtIndexPath:v13];
        NSUInteger v24 = v23;
        v30.id location = (NSUInteger)v19;
        v30.length = v21;
        v31.id location = (NSUInteger)v22;
        v31.length = v24;
        NSRange v25 = NSIntersectionRange(v30, v31);
        if (v25.length)
        {
          if ((id)v25.location == v22 && v25.length == v24)
          {
            int64_t v18 = 1;
          }
          else
          {
            char v27 = [v6 parentItem];
            BOOL v28 = v27 == 0;

            int64_t v18 = 2 * v28;
          }
        }
        else
        {
          int64_t v18 = 3;
        }
      }
      else
      {
        int64_t v18 = 0;
      }
      goto LABEL_24;
    }
    id v14 = [v6 matchingRouteStepIndex];
    activeComposedRouteStepIndeCGFloat x = self->_activeComposedRouteStepIndex;
    uint64_t v16 = [v6 parentItem];
    if (!v16) {
      goto LABEL_20;
    }
    int v17 = (void *)v16;
    if ([v6 type] == (id)5 || objc_msgSend(v6, "type") == (id)14)
    {
    }
    else
    {
      id v26 = [v6 type];

      if (v26 != (id)6) {
        goto LABEL_20;
      }
    }
    if ((unint64_t)v14 <= activeComposedRouteStepIndex)
    {
      if (v10) {
        int64_t v18 = 1;
      }
      else {
        int64_t v18 = 5;
      }
LABEL_24:

      goto LABEL_25;
    }
LABEL_20:
    if (v10) {
      int64_t v18 = 0;
    }
    else {
      int64_t v18 = 4;
    }
    goto LABEL_24;
  }
  int64_t v18 = 0;
LABEL_25:

  return v18;
}

- (_NSRange)_segementRangeForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(TransitDirectionsStepsListDataSource *)self transitSegmentSectionRanges];
  double v5 = (char *)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    double v8 = 0;
    uint64_t v9 = *(void *)v23;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      id v11 = 0;
      NSUInteger v20 = &v8[(void)v6];
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v11) rangeValue:v20];
        unint64_t v14 = v13;
        uint64_t v15 = [v4 section];
        BOOL v17 = v15 >= v12 && v15 - v12 < v14;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v17) {
            uint64_t v10 = (uint64_t)&v11[(void)v8];
          }
          else {
            uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v17) {
            uint64_t v7 = 1;
          }
        }
        else
        {
          if (!v17) {
            goto LABEL_25;
          }
          ++v7;
        }
        ++v11;
      }
      while (v6 != v11);
      id v6 = (char *)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      double v8 = v20;
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_25:

  NSUInteger v18 = v10;
  NSUInteger v19 = v7;
  result.length = v19;
  result.id location = v18;
  return result;
}

- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4
{
  if (a4)
  {
    double v5 = [a4 dequeueReusableCellWithIdentifier:@"TransitDirectionsListSharingIdentifier" forIndexPath:a3];
  }
  else
  {
    double v5 = -[RoutePlanningFooterCell initWithFrame:]([RoutePlanningFooterCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  id v6 = v5;
  [(RoutePlanningFooterCell *)v5 set_mapkit_separatorStyleOverride:0];
  uint64_t v7 = [(RoutePlanningFooterCell *)v6 footerView];
  [(TransitDirectionsStepsListDataSource *)self _configureFooterView:v7];

  return v6;
}

- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  double v5 = [a4 dequeueReusableCellWithReuseIdentifier:@"TransitDirectionsListSharingIdentifier" forIndexPath:a3];
  id v6 = [v5 footerView];
  [(TransitDirectionsStepsListDataSource *)self _configureFooterView:v6];

  return v5;
}

- (void)_configureFooterView:(id)a3
{
  route = self->_route;
  id v9 = a3;
  double v5 = [(GEOComposedRoute *)route ticketingSegmentsForSelectedRides];
  id v6 = [v5 count];

  BOOL v7 = sub_1000BBB44(v9) != 5;
  if (v6) {
    uint64_t v8 = (2 * v7) | 4;
  }
  else {
    uint64_t v8 = 2 * v7;
  }
  [v9 setVisibleCommandSet:v8];
  [v9 setDelegate:self];
}

- (void)_configureSeparatorForCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![v6 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsCell]
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315906;
        BOOL v28 = "-[TransitDirectionsStepsListDataSource _configureSeparatorForCell:forRowAtIndexPath:]";
        __int16 v29 = 2080;
        NSRange v30 = "TransitDirectionsStepsListDataSource.m";
        __int16 v31 = 1024;
        int v32 = 1683;
        __int16 v33 = 2080;
        __int16 v34 = "[cell isKindOfClass:[MKTableViewCell class]] && [cell conformsToProtocol:@protocol(TransitDirectionsCell)]"
              " && [cell respondsToSelector:@selector(setUseLeadingInstructionMarginAsLeadingSeparatorInset:)]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v27, 0x26u);
      }

      if (sub_100BB36BC())
      {
        long long v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = +[NSThread callStackSymbols];
          int v27 = 138412290;
          BOOL v28 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);
        }
      }
    }
    id v9 = [(TransitDirectionsStepsListDataSource *)self tableView];
    if (v9) {
      [(TransitDirectionsStepsListDataSource *)self tableView];
    }
    else {
    uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    }
    id v11 = (char *)[v10 numberOfSections];

    id v12 = [(TransitDirectionsStepsListDataSource *)self tableView];
    if (v12)
    {
      unint64_t v13 = [(TransitDirectionsStepsListDataSource *)self tableView];
      int64_t v14 = -[TransitDirectionsStepsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v13, [v7 section]);
    }
    else
    {
      unint64_t v13 = [(TransitDirectionsStepsListDataSource *)self collectionView];
      int64_t v14 = -[TransitDirectionsStepsListDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v13, [v7 section]);
    }
    int64_t v15 = v14;

    id v16 = (id)(v15 - 1);
    id v17 = [v7 row];
    unsigned __int8 v18 = [(TransitDirectionsStepsListDataSource *)self options];
    unsigned int v19 = [(TransitDirectionsStepsListDataSource *)self _supportsFooterItem];
    BOOL v20 = 1;
    if ((v18 & 8) != 0 && v16 == v17)
    {
      uint64_t v21 = -2;
      if (!v19) {
        uint64_t v21 = -1;
      }
      BOOL v20 = &v11[v21] != [v7 section];
    }
    id v22 = v6;
    [v22 setUseLeadingInstructionMarginAsLeadingSeparatorInset:v20];
    if (v16 == v17) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v20 ^ 1;
    }
    [v22 set_mapkit_separatorStyleOverride:v23];
  }
}

- (void)transitDirectionsCell:(id)a3 didTapAdvisory:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = +[MKMapService sharedService];
  uint64_t v8 = [(TransitDirectionsStepsListDataSource *)self delegate];
  [v7 captureUserAction:250 onTarget:[v8 currentUITargetForAnalytics] forAdvisory:v6];

  id v9 = [(TransitDirectionsStepsListDataSource *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v10 transitDirectionsStepsListDataSource:self didTapIncidentsCell:v11 withAdvisory:v6];
  }
}

- (void)transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 cell];
  id v9 = [(TransitDirectionsStepsListDataSource *)self tableView];
  [(TransitDirectionsStepsListDataSource *)self _transitDirectionsCell:v8 wantsToExpandOrCollapseItem:v6 inTableView:v9];

  uint64_t v10 = [v7 cell];
  id v11 = [(TransitDirectionsStepsListDataSource *)self collectionView];
  [(TransitDirectionsStepsListDataSource *)self _transitDirectionsCell:v10 wantsToExpandOrCollapseItem:v6 inCollectionView:v11];

  id v12 = [(TransitDirectionsStepsListDataSource *)self listView];
  [(TransitDirectionsStepsListDataSource *)self _transitDirectionsStepView:v7 wantsToExpandOrCollapseItem:v6 inListView:v12];
}

- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self tableView];
    id v11 = [v10 indexPathForCell:v8];

    if (v9 && v11)
    {
      self->_animatingExpansion = 1;
      id v12 = [(TransitDirectionsStepsListDataSource *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        int64_t v14 = [(TransitDirectionsStepsListDataSource *)self delegate];
        [v14 transitDirectionsStepsListDataSource:self willExpandItem:v9];
      }
      int64_t v15 = [(TransitDirectionsStepsListDataSource *)self tableView];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100C1D4DC;
      v21[3] = &unk_1012E85E0;
      v21[4] = self;
      id v22 = v11;
      id v23 = v9;
      id v24 = v8;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100C1DBC8;
      v19[3] = &unk_1012E6160;
      v19[4] = self;
      id v20 = v23;
      [v15 performBatchUpdates:v21 completion:v19];
    }
    else
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v26 = "-[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inTableView:]";
        __int16 v27 = 2080;
        BOOL v28 = "TransitDirectionsStepsListDataSource.m";
        __int16 v29 = 1024;
        int v30 = 1737;
        __int16 v31 = 2080;
        int v32 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v18 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          id v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inCollectionView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self collectionView];
    id v11 = [v10 indexPathForCell:v8];

    if (v9 && v11)
    {
      self->_animatingExpansion = 1;
      if (([v9 expanded] & 1) == 0)
      {
        id v12 = [(TransitDirectionsStepsListDataSource *)self delegate];
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          int64_t v14 = [(TransitDirectionsStepsListDataSource *)self delegate];
          [v14 transitDirectionsStepsListDataSource:self willExpandItem:v9];
        }
      }
      int64_t v15 = [(TransitDirectionsStepsListDataSource *)self collectionView];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100C1E060;
      v21[3] = &unk_1012E85E0;
      v21[4] = self;
      id v22 = v11;
      id v23 = v9;
      id v24 = v8;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100C1E744;
      v19[3] = &unk_1012E6160;
      v19[4] = self;
      id v20 = v23;
      [v15 performBatchUpdates:v21 completion:v19];
    }
    else
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v26 = "-[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inCollectionView:]";
        __int16 v27 = 2080;
        BOOL v28 = "TransitDirectionsStepsListDataSource.m";
        __int16 v29 = 1024;
        int v30 = 1811;
        __int16 v31 = 2080;
        int v32 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v18 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          id v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_transitDirectionsStepView:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inListView:(id)a5
{
  id v7 = a4;
  if (a5)
  {
    id v8 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v9 = [v8 indexPathForItem:v7];

    if (v7 && v9)
    {
      self->_animatingExpansion = 1;
      uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = [(TransitDirectionsStepsListDataSource *)self delegate];
        [v12 transitDirectionsStepsListDataSource:self willExpandItem:v7];
      }
      [v7 setExpanded:[v7 expanded] ^ 1];
      char v13 = [(TransitDirectionsStepsListDataSource *)self listView];
      id v14 = [v9 section];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100C1EB68;
      v18[3] = &unk_1012E6160;
      v18[4] = self;
      id v19 = v7;
      [v13 reloadSectionAtIndex:v14 animated:1 completion:v18];
    }
    else
    {
      int64_t v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = "-[TransitDirectionsStepsListDataSource _transitDirectionsStepView:wantsToExpandOrCollapseItem:inListView:]";
        __int16 v22 = 2080;
        id v23 = "TransitDirectionsStepsListDataSource.m";
        __int16 v24 = 1024;
        int v25 = 1885;
        __int16 v26 = 2080;
        __int16 v27 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = +[MKMapService sharedService];
    id v7 = [(TransitDirectionsStepsListDataSource *)self delegate];
    id v8 = [v7 currentUITargetForAnalytics];
    id v9 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexForAnalytics];
    [v6 captureUserAction:6013 onTarget:v8 eventValue:0 transitStep:v9];
  }
  uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v12 directionsStepsListDidTapShareButton:self];
  }
}

- (void)didTapGetTicketsOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(TransitDirectionsStepsListDataSource *)self delegate];
    id v6 = [(GEOComposedRoute *)self->_route ticketingSegmentsForSelectedRides];
    [v7 transitDirectionsStepsListDataSource:self didTapGetTicketsForSegments:v6];
  }
}

- (id)ticketingSegmentsForRoutePlanningFooterView:(id)a3
{
  return [(GEOComposedRoute *)self->_route ticketingSegmentsForSelectedRides];
}

- (void)routePlanningView:(id)a3 didTapGetTicketsForURL:(id)a4
{
  id v8 = a4;
  char v5 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v7 transitDirectionsStepsListDataSource:self didTapGetTicketsWithURL:v8];
  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = +[MKMapService sharedService];
    id v7 = [(TransitDirectionsStepsListDataSource *)self delegate];
    id v8 = [v7 currentUITargetForAnalytics];
    id v9 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexForAnalytics];
    [v6 captureUserAction:5013 onTarget:v8 eventValue:0 transitStep:v9];
  }
  uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v12 directionsStepsListDidTapRAPButton:self];
  }
}

- (void)transitDirectionsBoardingInfoStepView:(id)a3 didSelectScheduleForItem:(id)a4
{
  id v11 = a4;
  id v5 = [v11 type];
  char v6 = v11;
  if (v11 && v5 == (id)9)
  {
    while (1)
    {
      id v12 = v6;
      if ([v6 type] == (id)2) {
        break;
      }
      uint64_t v7 = [v12 nextItem];

      char v6 = (void *)v7;
      if (!v7) {
        goto LABEL_7;
      }
    }
    char v6 = v12;
  }
LABEL_7:
  id v13 = v6;
  if ([v6 type] == (id)2)
  {
    id v8 = [(TransitDirectionsStepsListDataSource *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v10 transitDirectionsStepsListDataSource:self didSelectTrip:v13];
    }
  }
}

- (void)transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexForAnalytics];
  +[GEOAPPortal captureUserAction:17098 target:0 value:0 transitStep:v4];

  id v5 = [(TransitDirectionsStepsListDataSource *)self delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    char v6 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v6 transitDirectionsStepsListDataSource:self didTapClusteredVehiclesCell:v7];
  }
}

- (void)_updateListForClusteredRideOptionChangeInClusteredSegment:(id)a3
{
  id v4 = a3;
  if (!self->_clusteredRideUpdateThrottler)
  {
    id v5 = sub_100C1423C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      objc_initWeak((id *)buf, self);
      id v12 = [MapsThrottler alloc];
      id v13 = &_dispatch_main_q;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      void v17[2] = sub_100C1F4E4;
      v17[3] = &unk_1012ED3A8;
      objc_copyWeak(&v18, (id *)buf);
      id v14 = [(MapsThrottler *)v12 initWithInitialValue:0 throttlingInterval:&_dispatch_main_q queue:v17 updateHandler:0.0];
      clusteredRideUpdateThrottler = self->_clusteredRideUpdateThrottler;
      self->_clusteredRideUpdateThrottler = v14;

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    char v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      char v9 = [(TransitDirectionsStepsListDataSource *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Will prepare transit clustered ride update throttler to prevent more than one rebuild/reload per run loop", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  id v16 = +[NSDate date];
  [(MapsThrottler *)self->_clusteredRideUpdateThrottler setValue:v16];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection]) {
    return 1;
  }

  return [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(TransitDirectionsStepsListDataSource *)self shouldFlattenToSingleSection])
  {
    if (![(TransitDirectionsStepsListDataSource *)self _numberOfSections]) {
      return 0;
    }
    unint64_t v6 = 0;
    int64_t v7 = 0;
    do
      v7 += [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:v6++];
    while (v6 < [(TransitDirectionsStepsListDataSource *)self _numberOfSections]);
    return v7;
  }
  else
  {
    return [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:a4];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v7];
  char v9 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[TransitDirectionsCell dequeueCellForListItem:v9 fromCollectionView:v6 atIndexPath:v7];
    [(TransitDirectionsStepsListDataSource *)self _configureTransitDirectionsCollectionViewCell:v10 withItem:v9 atIndexPath:v7];
  }
  else if ([v9 isEqual:@"TransitDirectionsListSharingIdentifier"])
  {
    uint64_t v10 = [(TransitDirectionsStepsListDataSource *)self _footerCellForIndexPath:v7 inCollectionView:v6];
  }
  else
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315650;
      id v18 = "-[TransitDirectionsStepsListDataSource collectionView:cellForItemAtIndexPath:]";
      __int16 v19 = 2080;
      id v20 = "TransitDirectionsStepsListDataSource.m";
      __int16 v21 = 1024;
      int v22 = 2064;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v17, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      id v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        id v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
    id v14 = (objc_class *)objc_opt_class();
    int64_t v15 = NSStringFromClass(v14);
    uint64_t v10 = [v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];
  }

  return v10;
}

- (void)_configureTransitDirectionsCollectionViewCell:(id)a3 withItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsExpandableCell]) {
    [v8 setExpandableCellDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 stepView];
    [v11 setBoardingInfoDelegate:self];
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 stepView];
    [v11 setDelegate:self];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setDelegate:self];
  }
LABEL_8:
  [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
  [v8 setLeadingInstructionMargin:];
  [v8 setUseNavigationMetrics:[self _useNavigationMetrics]];
  [v8 setDisplayOptions:[self _stepViewDisplayOptionsForSection:[v10 section]]];
  [v8 configureWithItem:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v8 stepView];
    if ((uint64_t)[v10 row] <= 0)
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315906;
        id v20 = "-[TransitDirectionsStepsListDataSource _configureTransitDirectionsCollectionViewCell:withItem:atIndexPath:]";
        __int16 v21 = 2080;
        int v22 = "TransitDirectionsStepsListDataSource.m";
        __int16 v23 = 1024;
        int v24 = 2097;
        __int16 v25 = 2080;
        __int16 v26 = "indexPath.row > 0";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
      }

      if (sub_100BB36BC())
      {
        int v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = +[NSThread callStackSymbols];
          int v19 = 138412290;
          id v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    if ((uint64_t)[v10 row] >= 1)
    {
      id v13 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v10 row] - 1, objc_msgSend(v10, "section"));
      id v14 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
      int64_t v15 = [v14 itemAtIndexPath:v13];

      [v12 setPreviousItem:v15 withPreviousNavigationState:[self _cellNavStateForItem:v15 atIndexPath:v13]];
    }
  }
  [v8 setNavigationState:[self _cellNavStateForItem:v9 atIndexPath:v10]];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(TransitDirectionsStepsListDataSource *)self _shouldHighlightItemAtIndexPath:a4];
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v6 cellForItemAtIndexPath:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        [v12 setHighlighted:1];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v6 cellForItemAtIndexPath:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        [v12 setHighlighted:0];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 selectItemAtIndexPath:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) animated:0 scrollPosition:0];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:v7];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = [v6 indexPathsForSelectedItems];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v14 isEqual:v7] & 1) == 0
          && ([v8 containsObject:v14] & 1) == 0)
        {
          [v6 deselectItemAtIndexPath:v14 animated:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  if (sub_1000BBB44(v6) == 5)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
          __int16 v21 = [v6 cellForItemAtIndexPath:v20];
          if (([v21 isSelected] & 1) == 0) {
            [v6 selectItemAtIndexPath:v20 animated:0 scrollPosition:0];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v17);
    }
  }
  int v22 = -[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7, (void)v33);
  id v23 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v24 = [v8 firstObject];
    if ([v24 compare:v7] == (id)-1)
    {
      __int16 v25 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v24];
      uint64_t v26 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v25];

      id v23 = (id)v26;
    }
    id v23 = v23;
    if ([v23 type] == (id)4
      && ([(TransitDirectionsStepsListDataSource *)self delegate],
          __int16 v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = objc_opt_respondsToSelector(),
          v27,
          (v28 & 1) != 0))
    {
      __int16 v29 = [v6 cellForItemAtIndexPath:v7];
      int v30 = [v29 stepView];
      [(TransitDirectionsStepsListDataSource *)self transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:v30];
    }
    else
    {
      __int16 v31 = [(TransitDirectionsStepsListDataSource *)self delegate];
      char v32 = objc_opt_respondsToSelector();

      if ((v32 & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
      __int16 v29 = [(TransitDirectionsStepsListDataSource *)self delegate];
      [v29 transitDirectionsStepsListDataSource:self didTapRowForItem:v23];
    }

    goto LABEL_31;
  }
LABEL_32:
}

- (int64_t)transitDirectionsListView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(TransitDirectionsStepsListDataSource *)self _numberOfRowsInSection:a4];
}

- (id)transitDirectionsListView:(id)a3 stepViewForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v6];
  id v9 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v8];
  id v10 = [v7 dequeueStepViewForItem:v9];

  [(TransitDirectionsStepsListDataSource *)self _configureStepView:v10 forItem:v9 atIndexPath:v6];

  return v10;
}

- (void)_configureStepView:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsExpandableCell]) {
    [v8 setExpandableCellDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setBoardingInfoDelegate:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [v8 setDelegate:self];
    }
  }
  [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
  [v8 setLeadingInstructionMargin:];
  [v8 setUseNavigationMetrics:[self _useNavigationMetrics]];
  [v8 setDisplayOptions:[self _stepViewDisplayOptionsForSection:[v10 section]]];
  [v8 configureWithItem:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    if ((uint64_t)[v10 row] <= 0)
    {
      id v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315906;
        int v19 = "-[TransitDirectionsStepsListDataSource _configureStepView:forItem:atIndexPath:]";
        __int16 v20 = 2080;
        __int16 v21 = "TransitDirectionsStepsListDataSource.m";
        __int16 v22 = 1024;
        int v23 = 2243;
        __int16 v24 = 2080;
        __int16 v25 = "indexPath.row > 0";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          int v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
    if ((uint64_t)[v10 row] >= 1)
    {
      uint64_t v12 = [NSIndexPath indexPathForRow:((char *)[v10 row] - 1) inSection:[v10 section]];
      long long v13 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
      long long v14 = [v13 itemAtIndexPath:v12];

      [v11 setPreviousItem:v14 withPreviousNavigationState:[self _cellNavStateForItem:v14 atIndexPath:v12]];
    }
  }
  [v8 setNavigationState:[self _cellNavStateForItem:v9 atIndexPath:v10]];
}

- (BOOL)transitDirectionsListView:(id)a3 shouldShowSeparatorForItem:(id)a4 atIndexPath:(id)a5 insets:(NSDirectionalEdgeInsets *)a6
{
  return [(TransitDirectionsStepsListDataSource *)self shouldShowSeparatorForItemAtIndexPath:a5 insets:a6];
}

- (id)activeItemForTransitDirectionsListView:(id)a3
{
  unint64_t v4 = [(TransitDirectionsStepsListDataSource *)self highlightingBehaviour];
  if (v4 == 2)
  {
    id v5 = [(TransitDirectionsStepsListDataSource *)self _displayedItem];
    id v6 = [(TransitDirectionsStepsListDataSource *)self _activeItem];

    if (v5 == v6) {
      id v7 = 0;
    }
    else {
      id v7 = v5;
    }
  }
  else
  {
    if (v4 == 1) {
      [(TransitDirectionsStepsListDataSource *)self _displayedItem];
    }
    else {
    id v7 = [(TransitDirectionsStepsListDataSource *)self _activeItem];
    }
  }

  return v7;
}

- (BOOL)transitDirectionsListView:(id)a3 canSelectItem:(id)a4
{
  id v5 = a4;
  id v6 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  id v7 = [v6 indexPathForItem:v5];

  id v8 = [(TransitDirectionsStepsListDataSource *)self _flatIndexFromIndexPath:v7];
  LOBYTE(self) = [(TransitDirectionsStepsListDataSource *)self _shouldHighlightItemAtIndexPath:v8];

  return (char)self;
}

- (void)transitDirectionsListView:(id)a3 didSelectItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v6 type] == (id)4
    && ([(TransitDirectionsStepsListDataSource *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = [v12 stepViewForItem:v6];
    [(TransitDirectionsStepsListDataSource *)self transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:v9];
  }
  else
  {
    id v10 = [(TransitDirectionsStepsListDataSource *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_7;
    }
    id v9 = [(TransitDirectionsStepsListDataSource *)self delegate];
    [v9 transitDirectionsStepsListDataSource:self didTapRowForItem:v6];
  }

LABEL_7:
}

- (void)transitDirectionsListView:(id)a3 didDisplayAdvisory:(id)a4
{
  id v5 = a4;
  id v7 = +[MKMapService sharedService];
  id v6 = [(TransitDirectionsStepsListDataSource *)self delegate];
  [v7 captureUserAction:247 onTarget:[v6 currentUITargetForAnalytics] forAdvisory:v5];
}

- (void)_updateActiveItemInListViewIfNeeded
{
  id v5 = [(TransitDirectionsStepsListDataSource *)self listView];
  unint64_t v3 = [(TransitDirectionsStepsListDataSource *)self listView];
  unint64_t v4 = [(TransitDirectionsStepsListDataSource *)self activeItemForTransitDirectionsListView:v3];
  [v5 setActiveTransitDirectionsListItem:v4];
}

- (id)_additionalSelectionIndexPathsForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v4];
  id v6 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v5];
  id v7 = +[NSMutableArray array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v24 = v6;
    id v8 = v6;
    uint64_t v26 = v5;
    id v9 = v5;
    if (([v8 selectable] & 1) == 0)
    {
      while ((uint64_t)objc_msgSend(v9, "row", v24) >= 1)
      {
        id v10 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v9 row] - 1, objc_msgSend(v9, "section"));

        char v11 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v10];

        id v8 = v11;
        id v9 = v10;
        if ([v11 selectable]) {
          goto LABEL_6;
        }
      }
    }
    id v10 = v9;
    char v11 = v8;
LABEL_6:
    if ((objc_msgSend(v11, "selectable", v24) & 1) == 0)
    {
      __int16 v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        char v28 = "-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:]";
        __int16 v29 = 2080;
        int v30 = "TransitDirectionsStepsListDataSource.m";
        __int16 v31 = 1024;
        int v32 = 2349;
        __int16 v33 = 2080;
        long long v34 = "currentTransitItem.selectable";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        __int16 v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          char v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    id v12 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v13 = [v12 numberOfItemsInSection:[v10 section]];

    long long v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v10 row] + 1, objc_msgSend(v10, "section"));

    id v15 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v14];

    if ((uint64_t)[v14 row] < (uint64_t)v13)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v15 selectable] & 1) != 0
          || [v15 type] == (id)7)
        {
          break;
        }
        id v16 = [(TransitDirectionsStepsListDataSource *)self _flatIndexFromIndexPath:v14];
        id v17 = [NSIndexPath indexPathForRow:[v16 row] inSection:[v4 section]];
        [v7 addObject:v17];

        int v18 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v16 row] + 1, objc_msgSend(v16, "section"));

        int v19 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v18];

        id v15 = v19;
        long long v14 = v18;
        if ((uint64_t)[v18 row] >= (uint64_t)v13) {
          goto LABEL_14;
        }
      }
    }
    int v18 = v14;
    int v19 = v15;
LABEL_14:

    id v6 = v25;
    id v5 = v26;
  }

  return v7;
}

- (BOOL)_shouldHighlightItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v4];
  id v6 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v8;
  if (!v8)
  {
    if ([(TransitDirectionsStepsListDataSource *)self allowsStepSelection]) {
      [v6 isEqual:@"TransitDirectionsListSharingIdentifier"];
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  if ([v8 type] == (id)7
    || [v9 type] == (id)13
    || ![(TransitDirectionsStepsListDataSource *)self allowsStepSelection])
  {
    goto LABEL_14;
  }
  if (![v9 type])
  {
    BOOL v10 = [(TransitDirectionsStepsListDataSource *)self allowsStepSelection];
    goto LABEL_15;
  }
  if ([v6 isEqual:@"TransitDirectionsListSharingIdentifier"]) {
    goto LABEL_14;
  }
  if ([v9 selectable])
  {
    BOOL v10 = 1;
  }
  else
  {
    id v12 = [(TransitDirectionsStepsListDataSource *)self _additionalSelectionIndexPathsForIndexPath:v4];
    id v13 = [v12 firstObject];
    if ([v13 compare:v4] == (id)-1) {
      BOOL v10 = [(TransitDirectionsStepsListDataSource *)self _shouldHighlightItemAtIndexPath:v13];
    }
    else {
      BOOL v10 = 0;
    }
  }
LABEL_15:

  return v10;
}

- (BOOL)shouldShowSeparatorForItemAtIndexPath:(id)a3 insets:(NSDirectionalEdgeInsets *)a4
{
  id v6 = a3;
  CGFloat top = a4->top;
  CGFloat leading = a4->leading;
  CGFloat bottom = a4->bottom;
  double trailing = a4->trailing;
  char v11 = [(TransitDirectionsStepsListDataSource *)self _indexPathFromFlatIndexPath:v6];
  id v12 = [(TransitDirectionsStepsListDataSource *)self listItemForIndexPath:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v13 = [(TransitDirectionsStepsListDataSource *)self _numberOfSections];
    long long v14 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v15 = [v14 numberOfItemsInSection:[v11 section]];

    id v16 = v12;
    unint64_t v34 = v13;
    long long v36 = v6;
    if ((-[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", [v11 section]) & 4) != 0)
    {
      uint64_t v17 = [v16 nextItem];
      if (v17)
      {
        int v18 = (void *)v17;
        do
        {
          uint64_t v19 = [v18 parentItem];
          if ((id)v19 == v16)
          {
          }
          else
          {
            __int16 v20 = (void *)v19;
            __int16 v21 = [v18 parentItem];
            __int16 v22 = [v16 parentItem];

            if (v21 != v22) {
              break;
            }
          }
          v15 -= [v18 shouldHideInExpandedDisplayStyle];
          uint64_t v23 = [v18 nextItem];

          int v18 = (void *)v23;
        }
        while (v23);
      }
    }
    __int16 v24 = v15 - 1;
    __int16 v25 = [v11 row:v34];
    LOBYTE(v15) = v15 - 1 == v25;
    unsigned __int8 v26 = [(TransitDirectionsStepsListDataSource *)self options];
    unsigned int v27 = [(TransitDirectionsStepsListDataSource *)self _supportsFooterItem];
    if ((v26 & 8) != 0 && v24 == v25)
    {
      uint64_t v28 = -2;
      if (!v27) {
        uint64_t v28 = -1;
      }
      id v6 = v36;
      if ((id)(v28 + v35) == [v36 section])
      {
        LOBYTE(v15) = 1;
      }
      else
      {
        [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
        CGFloat leading = v32;
        LOBYTE(v15) = 1;
        double trailing = 16.0;
      }
    }
    else
    {
      if ((v26 & 8) != 0 || v24 != v25)
      {
        [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
        CGFloat leading = v31;
      }
      else
      {
        BOOL v29 = v35 - 1 == (void)[v11 section];
        [(TransitDirectionsStepsListDataSource *)self leadingInstructionMargin];
        CGFloat leading = v30;
        LOBYTE(v15) = !v29;
      }
      double trailing = 16.0;
      id v6 = v36;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LODWORD(v15) = [v12 isEqualToString:@"TransitDirectionsListSharingIdentifier"] ^ 1;
    }
    else {
      LOBYTE(v15) = 1;
    }
  }
  a4->CGFloat top = top;
  a4->CGFloat leading = leading;
  a4->CGFloat bottom = bottom;
  a4->double trailing = trailing;

  return (char)v15;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v19 = a3;
  id v9 = [(TransitDirectionsStepsListDataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (y <= 0.0) {
      uint64_t v11 = 7;
    }
    else {
      uint64_t v11 = 8;
    }
    id v12 = +[MKMapService sharedService];
    unint64_t v13 = [(TransitDirectionsStepsListDataSource *)self delegate];
    id v14 = [v13 currentUITargetForAnalytics];
    id v15 = [(TransitDirectionsStepsListDataSource *)self displayedItemIndexForAnalytics];
    [v12 captureUserAction:v11 onTarget:v14 eventValue:0 transitStep:v15];
  }
  id v16 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    int v18 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
    [v18 scrollViewWillEndDragging:v19 withVelocity:a5 targetContentOffset:x, y];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
    [v6 scrollViewDidScroll:v7];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  id v4 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TransitDirectionsStepsListDataSource *)self scrollViewDelegate];
    [v6 scrollViewWillBeginDragging:v7];
  }
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  id v2 = [(TransitDirectionsStepsListDataSource *)self displayedTransitDirectionsListItemIndexPath];
  unint64_t v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 section];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (BOOL)pptTestHasNextStep
{
  unint64_t v3 = [(TransitDirectionsStepsListDataSource *)self displayedTransitDirectionsListItemIndexPath];
  int64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 section];
    BOOL v6 = v5 < (id)[(TransitDirectionsStepsListDataSource *)self _numberOfSections];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)pptTestMoveToNextStep
{
  if ([(TransitDirectionsStepsListDataSource *)self pptTestHasNextStep])
  {
    int64_t v3 = [(TransitDirectionsStepsListDataSource *)self pptTestCurrentStepIndex];
    int64_t v4 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
    id v5 = +[NSIndexPath indexPathForItem:0 inSection:v3 + 1];
    id v7 = [v4 itemAtIndexPath:v5];

    BOOL v6 = v7;
    if (v7)
    {
      -[DirectionsStepsListNavigationProvider setDisplayedStepIndex:](self->_navigationProvider, "setDisplayedStepIndex:", [v7 matchingRouteStepIndex]);
      BOOL v6 = v7;
    }
  }
}

- (BOOL)pptTestMoveToBoardStep
{
  int64_t v3 = [(TransitDirectionsStepsListDataSource *)self pptTestCurrentStepIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = v3;
  BOOL v6 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  id v7 = [v6 items];

  while (v5 < (unint64_t)[v7 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:v5];
    if ([v8 type] == (id)2)
    {
      if (v8)
      {
        -[DirectionsStepsListNavigationProvider setDisplayedStepIndex:](self->_navigationProvider, "setDisplayedStepIndex:", [v8 matchingRouteStepIndex]);

        BOOL v4 = 1;
        goto LABEL_10;
      }
      break;
    }

    ++v5;
  }
  BOOL v4 = 0;
LABEL_10:

  return v4;
}

- (TransitDirectionsStepsListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitDirectionsStepsListDelegate *)WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)shouldFlattenToSingleSection
{
  return self->_flattenToSingleSection;
}

- (NSIndexPath)displayedItemIndexPath
{
  return self->_displayedItemIndexPath;
}

- (BOOL)allowsStepSelection
{
  return self->_allowStepSelection;
}

- (void)setAllowStepSelection:(BOOL)a3
{
  self->_allowStepSelection = a3;
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

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
}

- (BOOL)enableNavigationUpdates
{
  return self->_enableNavigationUpdates;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)leadingInstructionMargin
{
  return self->_transitDirectionsListInstructionsLeadingInset;
}

- (BOOL)isActive
{
  return self->_active;
}

- (TransitDirectionsListView)listView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listView);

  return (TransitDirectionsListView *)WeakRetained;
}

- (unint64_t)highlightingBehaviour
{
  return self->_highlightingBehaviour;
}

- (void)setHighlightingBehaviour:(unint64_t)a3
{
  self->_highlightingBehaviour = a3;
}

- (unint64_t)activeComposedRouteStepIndex
{
  return self->_activeComposedRouteStepIndex;
}

- (unint64_t)displayedComposedRouteStepIndex
{
  return self->_displayedComposedRouteStepIndex;
}

- (BOOL)automaticallyScrollToDisplayedStep
{
  return self->_automaticallyScrollToDisplayedStep;
}

- (void)setAutomaticallyScrollToDisplayedStep:(BOOL)a3
{
  self->_automaticallyScrollToDisplayedStep = a3;
}

- (BOOL)useCollapsedDisplayStyle
{
  return self->_useCollapsedDisplayStyle;
}

- (void)setEstimatedHeightsByItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedHeightsByItem, 0);
  objc_destroyWeak((id *)&self->_listView);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_matchedLocationThrottler, 0);
  objc_storeStrong((id *)&self->_displayedItemIndexPath, 0);
  objc_storeStrong((id *)&self->_activeItemIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_referenceDateUpdater, 0);
  objc_storeStrong((id *)&self->_clusteredRideUpdateThrottler, 0);

  objc_storeStrong(&self->_reloadTableCompletionBlock, 0);
}

- (NSArray)_transitDirectionsListItems
{
  id v2 = [(TransitDirectionsStepsListDataSource *)self dataProvider];
  int64_t v3 = [v2 items];

  return (NSArray *)v3;
}

@end