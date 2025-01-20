@interface RouteWaypointSuggestionsTableViewController
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (BOOL)shouldFilterMapsSuggestionsEntry:(id)a3;
- (RouteWaypointSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (RouteWaypointSuggestionsTableViewControllerDelegate)delegate;
- (id)newTraits;
- (id)tableViewDidReloadHandler;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)listForDataSource:(id)a3;
- (void)_callTableHandlerIfNeeded;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)loadView;
- (void)reconfigureDataSources;
- (void)reloadSuggestionsTableView;
- (void)reset;
- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTableViewDidReloadHandler:(id)a3;
- (void)updateCategoryDataSource:(BOOL)a3;
- (void)updateDataSourceHasInput:(BOOL)a3 isEditing:(BOOL)a4;
- (void)updateInputText:(id)a3 traits:(id)a4 source:(int)a5;
- (void)updateRowHeightForCurrentDataSource;
- (void)updateTableViewHeader:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RouteWaypointSuggestionsTableViewController

- (RouteWaypointSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  v4 = [(RouteWaypointSuggestionsTableViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[MKLocationManager sharedLocationManager];
    v4->_wasLocationServicesApproved = [v5 isLocationServicesApproved];
    v4->_wasAuthorizedForPreciseLocation = [v5 isAuthorizedForPreciseLocation];
  }
  return v4;
}

- (void)loadView
{
  v3 = objc_alloc_init(MapsThemeTableView);
  [(RouteWaypointSuggestionsTableViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  [(RouteWaypointSuggestionsTableViewController *)&v23 viewDidLoad];
  v3 = [(RouteWaypointSuggestionsTableViewController *)self view];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v5 stringByReplacingOccurrencesOfString:@"Controller" withString:&stru_101324E70];
  [v3 setAccessibilityIdentifier:v6];

  objc_super v7 = +[UIColor clearColor];
  v8 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v8 setBackgroundColor:v7];

  v9 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v9 setSeparatorStyle:1];

  v10 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v10 setPreservesSuperviewLayoutMargins:1];

  v11 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v11 setSectionHeaderTopPadding:0.0];

  v12 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v12 setAccessibilityIdentifier:@"RouteSearchResultsTableView"];

  v13 = [SearchDataSource alloc];
  v14 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  v15 = [(SearchDataSource *)v13 initWithTableView:v14];
  acDataSource = self->_acDataSource;
  self->_acDataSource = v15;

  [(SearchDataSource *)self->_acDataSource setSearchMode:2];
  [(SearchDataSource *)self->_acDataSource setUsePlaceSummary:sub_1009DB5CC()];
  [(SearchDataSource *)self->_acDataSource setRoutePlanning:1];
  [self->_acDataSource setDelegate:self];
  [(RouteWaypointSuggestionsTableViewController *)self reconfigureDataSources];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100C22808;
  v22[3] = &unk_1012EA0F8;
  v22[4] = self;
  v17 = +[NSPredicate predicateWithBlock:v22];
  v18 = [RouteNoQueryDataSource alloc];
  v19 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  v20 = [(RouteNoQueryDataSource *)v18 initWithTableView:v19 filterPredicate:v17];
  noQueryDataSource = self->_noQueryDataSource;
  self->_noQueryDataSource = v20;

  [self->_noQueryDataSource setDelegate:self];
  [(RouteWaypointSuggestionsTableViewController *)self updateDataSourceHasInput:0 isEditing:0];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  [(RouteWaypointSuggestionsTableViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(RouteWaypointSuggestionsTableViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  v9 = [v8 dataSource];
  v10 = v9;
  if (v9 == self->_acDataSource)
  {
    unsigned int v11 = [(SearchDataSource *)v9 shouldReloadOnHeightChange];

    if (v11)
    {
      if (self->_lastSize.width != v5 || self->_lastSize.height != v7)
      {
        self->_lastSize.width = v5;
        self->_lastSize.height = v7;
        [(RouteWaypointSuggestionsTableViewController *)self reloadSuggestionsTableView];
      }
    }
  }
  else
  {
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(RouteWaypointSuggestionsTableViewController *)self reconfigureDataSources];
    double v5 = obj;
  }
}

- (void)reconfigureDataSources
{
  v3 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  id v6 = [v3 personalizedItemManagerForRouteSearchTableViewController:self];

  double v4 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  double v5 = [v4 userLocationSearchResultForRouteSearchTableViewController:self];

  [(SearchDataSource *)self->_acDataSource setMapPersonalizedItems:v6];
  [(SearchDataSource *)self->_acDataSource setUserLocationSearchResult:v5];
}

- (void)updateCategoryDataSource:(BOOL)a3
{
  double v5 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v5 setDataSource:0];

  id v6 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v6 setDelegate:0];

  [(SearchDataSource *)self->_acDataSource setActive:0];
  [(RouteNoQueryDataSource *)self->_noQueryDataSource setActive:0];
  self->_supportsFullTextSearch = a3;
  double v7 = [SearchHomeDataSource alloc];
  v8 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  v9 = [(SearchHomeDataSource *)v7 initWithTableView:v8 updateLocation:0];
  browseCategoryDataSource = self->_browseCategoryDataSource;
  self->_browseCategoryDataSource = v9;

  unsigned int v11 = self->_browseCategoryDataSource;

  [(DataSource *)v11 setDelegate:self];
}

- (void)updateDataSourceHasInput:(BOOL)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  double v7 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  id v25 = [v7 selectedSearchFieldItem];

  v8 = [v25 composedWaypoint];
  unsigned int v9 = [v8 isServerProvidedWaypoint];

  if (!v4 || (v9 & ~v5) != 0)
  {
    [(SearchDataSource *)self->_acDataSource setActive:0];
    [(RouteNoQueryDataSource *)self->_noQueryDataSource setActive:0];
    v14 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
    [v14 setDataSource:0];

    [(RouteWaypointSuggestionsTableViewController *)self reloadSuggestionsTableView];
  }
  else if (v5)
  {
    if (![self->_acDataSource active])
    {
      [(RouteNoQueryDataSource *)self->_noQueryDataSource setActive:0];
      acDataSource = self->_acDataSource;
      unsigned int v11 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
      [v11 setDelegate:acDataSource];

      v12 = self->_acDataSource;
      objc_super v13 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
      [v13 setDataSource:v12];

      [(SearchDataSource *)self->_acDataSource setActive:1];
      [(RouteWaypointSuggestionsTableViewController *)self updateRowHeightForCurrentDataSource];
    }
  }
  else if (![self->_noQueryDataSource active])
  {
    [(SearchDataSource *)self->_acDataSource setActive:0];
    noQueryDataSource = self->_noQueryDataSource;
    v16 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
    [v16 setDelegate:noQueryDataSource];

    v17 = self->_noQueryDataSource;
    v18 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
    [v18 setDataSource:v17];

    v19 = +[MKLocationManager sharedLocationManager];
    LODWORD(v18) = [v19 isLocationServicesApproved];
    unsigned int v20 = [v19 isAuthorizedForPreciseLocation];
    if (v18)
    {
      unsigned int v21 = v20;
      v22 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
      if (([v22 waypointsIncludeCurrentLocationForRouteSearchTableViewController:self] & v21) == 1)
      {
        [(RouteNoQueryDataSource *)self->_noQueryDataSource setUserLocationSearchResult:0];
      }
      else
      {
        objc_super v23 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
        v24 = [v23 userLocationSearchResultForRouteSearchTableViewController:self];
        [(RouteNoQueryDataSource *)self->_noQueryDataSource setUserLocationSearchResult:v24];
      }
    }
    else
    {
      [(RouteNoQueryDataSource *)self->_noQueryDataSource setUserLocationSearchResult:0];
    }
    [(RouteNoQueryDataSource *)self->_noQueryDataSource setActive:1];
    [(RouteWaypointSuggestionsTableViewController *)self updateRowHeightForCurrentDataSource];
  }
}

- (void)updateInputText:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  [(SearchDataSource *)self->_acDataSource invalidateDataForFilterChange];
  acDataSource = self->_acDataSource;
  if (v8)
  {
    [(SearchDataSource *)acDataSource setInputText:v11 traits:v8 source:v5];
  }
  else
  {
    id v10 = [(RouteWaypointSuggestionsTableViewController *)self newTraits];
    [(SearchDataSource *)acDataSource setInputText:v11 traits:v10 source:v5];
  }
}

- (void)updateTableViewHeader:(BOOL)a3
{
}

- (void)reset
{
  [(RouteWaypointSuggestionsTableViewController *)self updateDataSourceHasInput:0 isEditing:0];
  [(SearchDataSource *)self->_acDataSource reset];
  acDataSource = self->_acDataSource;

  [(SearchDataSource *)acDataSource invalidateDataForFilterChange];
}

- (void)reloadSuggestionsTableView
{
  [(RouteWaypointSuggestionsTableViewController *)self updateRowHeightForCurrentDataSource];
  v3 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v3 reloadData];

  [(RouteWaypointSuggestionsTableViewController *)self _callTableHandlerIfNeeded];
}

- (void)_callTableHandlerIfNeeded
{
  v3 = [(RouteWaypointSuggestionsTableViewController *)self tableViewDidReloadHandler];

  if (v3)
  {
    BOOL v4 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
    uint64_t v5 = (uint64_t)[v4 numberOfSections];

    if (v5 < 1)
    {
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      do
      {
        double v7 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
        uint64_t v8 = (uint64_t)[v7 numberOfRowsInSection:v6];
        BOOL v9 = v8 > 0;

        if (v8 >= 1) {
          break;
        }
        ++v6;
        id v10 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
        id v11 = [v10 numberOfSections];
      }
      while (v6 < (uint64_t)v11);
    }
    v12 = [(RouteWaypointSuggestionsTableViewController *)self tableViewDidReloadHandler];
    v12[2](v12, v9);
  }
}

- (void)updateRowHeightForCurrentDataSource
{
  v3 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  BOOL v4 = [v3 dataSource];
  uint64_t v5 = 40;
  acDataSource = self->_acDataSource;

  if (v4 == acDataSource) {
    goto LABEL_4;
  }
  double v7 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  uint64_t v8 = [v7 dataSource];
  uint64_t v5 = 32;
  noQueryDataSource = self->_noQueryDataSource;

  if (v8 == noQueryDataSource)
  {
LABEL_4:
    [*(id *)((char *)&self->super.super.super.super.super.isa + v5) rowHeight];
    double v10 = v11;
  }
  else
  {
    double v10 = UITableViewAutomaticDimension;
  }
  v12 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
  [v12 rowHeight];
  double v14 = v13;

  if (v14 != v10)
  {
    id v15 = [(RouteWaypointSuggestionsTableViewController *)self tableView];
    [v15 setRowHeight:v10];
  }
}

- (int)listForDataSource:(id)a3
{
  return 10;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100104460;
  v45 = sub_100104AA0;
  id v46 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 _type];
    if (v9 && v9 != (id)3) {
      goto LABEL_10;
    }
    uint64_t v10 = +[SearchFieldItem searchFieldItemWithObject:v8];
    double v11 = (void *)v42[5];
    v42[5] = v10;
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (__CFString *)v7;
    uint64_t v13 = +[SearchFieldItem searchFieldItemWithObject:v12];
    double v14 = (void *)v42[5];
    v42[5] = v13;

    id v15 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    [v15 routeSearchController:self didSelectItem:v42[5]];
LABEL_24:

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v7;
    v17 = [v16 historyEntry];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100C23A2C;
    v38[3] = &unk_1012EA888;
    v40 = &v41;
    id v39 = v16;
    [v17 ifSearch:v38 ifRoute:0 ifPlaceDisplay:0 ifTransitLineItem:0];

    double v11 = v39;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (__CFString *)v7;
    v28 = [SearchResult alloc];
    v29 = [(__CFString *)v12 MKMapItem];
    v30 = [(SearchResult *)v28 initWithMapItem:v29];
    uint64_t v31 = +[SearchFieldItem searchFieldItemWithObject:v30];
    v32 = (void *)v42[5];
    v42[5] = v31;

    id v15 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    [v15 routeSearchController:self didSelectItem:v42[5]];
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_supportsFullTextSearch)
  {
    v33 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v34 = [v33 isUsingOfflineMaps];

    if (v34)
    {
      v12 = (__CFString *)v7;
      v35 = [(__CFString *)v12 category];
      id v15 = +[SearchFieldItem searchFieldItemWithObject:v35];

      id v25 = +[NSMutableDictionary dictionaryWithDictionary:&off_1013AEE98];
      [v25 setObject:&off_1013AAB88 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
      id v27 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
      [v27 routeSearchController:self doSearchItem:v15 userInfo:v25];
LABEL_23:

      goto LABEL_24;
    }
  }
LABEL_11:
  if (v42[5])
  {
    v12 = +[NSMutableDictionary dictionaryWithDictionary:&off_1013AEEC0];
    [(__CFString *)v12 setObject:&off_1013AAB88 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
    v18 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
      unsigned int v20 = [v19 hasInputsInSearchField];

      if (v20) {
        unsigned int v21 = &off_1013AAB88;
      }
      else {
        unsigned int v21 = &off_1013AABA0;
      }
    }
    else
    {

      unsigned int v21 = &off_1013AABA0;
    }
    [(__CFString *)v12 setObject:v21 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
    v24 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    id v15 = [v24 latLngForRouteSearchTableViewController:self];

    if (v15) {
      [(__CFString *)v12 setObject:v15 forKeyedSubscript:@"kAddStopPreviousLocationLatLng"];
    }
    id v25 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    uint64_t v26 = v42[5];
    id v27 = [(__CFString *)v12 copy];
    [v25 routeSearchController:self doSearchItem:v26 userInfo:v27];
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isDynamicCurrentLocation])
  {
    v12 = @"AppInfoTemporaryPreciseLocationAuthorizationForDirectionsPurposeKey";
    v22 = +[MKMapService sharedService];
    [v22 captureUserAction:56 onTarget:607 eventValue:0];

    objc_super v23 = +[MKLocationManager sharedLocationManager];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100C23A80;
    v36[3] = &unk_1012EAC50;
    v36[4] = self;
    id v37 = v7;
    [v23 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:v12 completion:v36];
  }
  else
  {
    v12 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    [(__CFString *)v12 routeSearchController:self didSelectItem:v7];
  }
LABEL_26:

  _Block_object_dispose(&v41, 8);
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = [(RouteWaypointSuggestionsTableViewController *)self shouldFilterMapsSuggestionsEntry:v7];
    *((unsigned char *)v17 + 24) = v8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
      unint64_t v12 = (unint64_t)[v11 _type] & 0xFFFFFFFFFFFFFFFELL;

      if (v12 == 4)
      {
        BOOL v10 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((unsigned char *)v17 + 24) = 1;
        double v14 = [v7 historyEntry];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100C23CFC;
        v15[3] = &unk_1012F87C0;
        v15[4] = &v16;
        [v14 ifSearch:v15 ifRoute:0 ifPlaceDisplay:0 ifTransitLineItem:0];
      }
    }
  }
  id v9 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  BOOL v10 = ([v9 routeSearchController:self waypointsIncludeObject:v7] & 1) != 0
     || *((unsigned char *)v17 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (BOOL)shouldFilterMapsSuggestionsEntry:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 type];
  return (v3 < 0x19) & (0x1F3FF69u >> v3);
}

- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
    [v7 didTapOnQueryAcceleratorWithItem:v8];
  }
}

- (int)currentUITargetForAnalytics
{
  return 607;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (id)newTraits
{
  unint64_t v3 = [(RouteWaypointSuggestionsTableViewController *)self delegate];
  BOOL v4 = [v3 traitsForRouteSearchTableViewController:self];

  return v4;
}

- (RouteWaypointSuggestionsTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteWaypointSuggestionsTableViewControllerDelegate *)WeakRetained;
}

- (id)tableViewDidReloadHandler
{
  return self->_tableViewDidReloadHandler;
}

- (void)setTableViewDidReloadHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewDidReloadHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browseCategoryDataSource, 0);
  objc_storeStrong((id *)&self->_acDataSource, 0);

  objc_storeStrong((id *)&self->_noQueryDataSource, 0);
}

@end