@interface RoutingAppSelectionController
- (BOOL)_updateSuggestions;
- (BOOL)hasResolvedEndpoints;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)source;
- (MKLocationManagerOperation)locationLookupOperation;
- (NSArray)sortedInstalledApps;
- (NSArray)sortedStoreApps;
- (NSArray)suggestedInstalledApps;
- (NSArray)suggestedStoreApps;
- (RoutingAppSelectionController)initWithTransportType:(int64_t)a3;
- (RoutingAppSelectionControllerDelegate)delegate;
- (RoutingAppSuggestionProvider)suggestionProvider;
- (id)_appDataForStoreRow:(unint64_t)a3;
- (id)_sanitizedMapItemFromWaypoint:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)transportType;
- (unint64_t)_sectionAtIndex:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelRoutingSelection;
- (void)_handleSearchResultError:(BOOL)a3 error:(id)a4;
- (void)_reloadSection:(unint64_t)a3;
- (void)_updateSortedAppStoreAppsForTransportType:(int64_t)a3;
- (void)_updateSortedInstalledAppsForTransportType:(int64_t)a3;
- (void)_useInstalledApp:(id)a3 toRouteFromSource:(id)a4 toDestination:(id)a5;
- (void)didReceiveMemoryWarning;
- (void)reset;
- (void)routingAppSelectionCellRoutePressed:(id)a3;
- (void)routingAppSuggestionProvider:(id)a3 didFailToSuggestStoreApps:(id)a4;
- (void)routingAppSuggestionProvider:(id)a3 didSuggestInstalledApps:(id)a4;
- (void)routingAppSuggestionProvider:(id)a3 didSuggestStoreApps:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setLocationLookupOperation:(id)a3;
- (void)setResolvedEndpoints:(BOOL)a3;
- (void)setSortedInstalledApps:(id)a3;
- (void)setSortedStoreApps:(id)a3;
- (void)setSource:(id)a3;
- (void)setSuggestedInstalledApps:(id)a3;
- (void)setSuggestedStoreApps:(id)a3;
- (void)setSuggestionProvider:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateForWaypointSet:(id)a3;
- (void)viewDidLoad;
@end

@implementation RoutingAppSelectionController

- (RoutingAppSelectionController)initWithTransportType:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RoutingAppSelectionController;
  v4 = [(RoutingAppSelectionController *)&v14 initWithStyle:0];
  v5 = v4;
  if (v4)
  {
    v4->_transportType = a3;
    v6 = [(RoutingAppSelectionController *)v4 navigationItem];
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v5 action:"_cancelRoutingSelection"];
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Routing Apps" value:@"localized string not found" table:0];
    [v6 setTitle:v9];

    [v6 setLeftBarButtonItem:v7];
    v10 = objc_alloc_init(RoutingAppSuggestionProvider);
    suggestionProvider = v5->_suggestionProvider;
    v5->_suggestionProvider = v10;

    [(RoutingAppSuggestionProvider *)v5->_suggestionProvider setDelegate:v5];
    if ([(RoutingAppSuggestionProvider *)v5->_suggestionProvider appInstallationDisallowed]) {
      v12 = &off_1013AE1D8;
    }
    else {
      v12 = &off_1013AE1F0;
    }
    objc_storeStrong((id *)&v5->_sections, v12);
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)RoutingAppSelectionController;
  [(RoutingAppSelectionController *)&v7 viewDidLoad];
  v3 = [(RoutingAppSelectionController *)self tableView];
  [v3 setSeparatorStyle:1];
  [v3 _setMarginWidth:15.0];
  [v3 setSectionHeaderTopPadding:0.0];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setBackgroundView:0];
  v5 = [(RoutingAppSelectionController *)self theme];
  v6 = [v5 hairlineColor];
  [v3 setSeparatorColor:v6];

  [v3 setRowHeight:UITableViewAutomaticDimension];
  [v3 setEstimatedRowHeight:84.0];
  [v3 setSectionHeaderHeight:UITableViewAutomaticDimension];
  [v3 _setHeaderAndFooterViewsFloat:0];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"Header"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"AppCell"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"LoadingCell"];
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)RoutingAppSelectionController;
  [(RoutingAppSelectionController *)&v3 didReceiveMemoryWarning];
  v2 = +[MKAppImageManager sharedImageManager];
  [v2 clearImageCache];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)updateForWaypointSet:(id)a3
{
  id v4 = a3;
  [(RoutingAppSelectionController *)self setResolvedEndpoints:0];
  [(RoutingAppSelectionController *)self setSortedStoreApps:0];
  [(RoutingAppSelectionController *)self setSortedInstalledApps:0];
  [(RoutingAppSelectionController *)self setSuggestedStoreApps:0];
  [(RoutingAppSelectionController *)self setSuggestedInstalledApps:0];
  v5 = [(RoutingAppSelectionController *)self suggestionProvider];
  [v5 reset];

  v6 = [(RoutingAppSelectionController *)self tableView];
  [v6 reloadData];

  objc_super v7 = [v4 origin];
  id v8 = [v7 copy];
  [(RoutingAppSelectionController *)self setSource:v8];

  v9 = [v4 destination];

  id v10 = [v9 copy];
  [(RoutingAppSelectionController *)self setDestination:v10];

  p_source = &self->_source;
  if (([(GEOComposedWaypoint *)self->_source isCurrentLocation] & 1) != 0
    || [(GEOComposedWaypoint *)self->_destination isCurrentLocation])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008D815C;
    v14[3] = &unk_1012FFC68;
    v14[4] = self;
    v12 = objc_retainBlock(v14);
    if (([(GEOComposedWaypoint *)*p_source isCurrentLocation] & 1) == 0) {
      p_source = &self->_destination;
    }
    v13 = ((void (*)(void *, GEOComposedWaypoint *))v12[2])(v12, *p_source);
    [(RoutingAppSelectionController *)self setLocationLookupOperation:v13];
  }
  [(RoutingAppSelectionController *)self _updateSuggestions];
}

- (BOOL)_updateSuggestions
{
  if ([(RoutingAppSelectionController *)self hasResolvedEndpoints])
  {
    objc_super v3 = sub_1008D836C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      id v4 = "Endpoints are already resolved, ignoring update command.";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v23, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v5 = [(GEOComposedWaypoint *)self->_source latLng];
  [v5 lat];
  double v7 = v6;
  id v8 = [(GEOComposedWaypoint *)self->_source latLng];
  [v8 lng];
  double v10 = v9;

  if (!self->_source || v10 < -180.0 || v10 > 180.0 || v7 < -90.0 || v7 > 90.0)
  {
    objc_super v3 = sub_1008D836C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      id v4 = "Can't update suggestions yet. Source coordinate is not yet resolved.";
      goto LABEL_22;
    }
LABEL_23:
    BOOL v21 = 0;
    goto LABEL_24;
  }
  v11 = [(GEOComposedWaypoint *)self->_destination latLng];
  [v11 lat];
  double v13 = v12;
  objc_super v14 = [(GEOComposedWaypoint *)self->_destination latLng];
  [v14 lng];
  double v16 = v15;

  if (!self->_destination || v16 < -180.0 || v16 > 180.0 || v13 < -90.0 || v13 > 90.0)
  {
    objc_super v3 = sub_1008D836C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      id v4 = "Can't update suggestions yet. Destination coordinate is not yet resolved.";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  [(RoutingAppSelectionController *)self setResolvedEndpoints:1];
  v17 = sub_1008D836C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "We've got the start and end coordinates. Requesting suggestions.", v23, 2u);
  }

  -[RoutingAppSuggestionProvider requestSuggestionsForSource:destination:](self->_suggestionProvider, "requestSuggestionsForSource:destination:", v7, v10, v13, v16);
  destination = self->_destination;
  v24[0] = self->_source;
  v24[1] = destination;
  objc_super v3 = +[NSArray arrayWithObjects:v24 count:2];
  unint64_t v19 = (unint64_t)[(RoutingAppSelectionController *)self transportType] - 1;
  if (v19 > 4) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = dword_100F72860[v19];
  }
  +[HistoryEntryRecentsItem saveWaypoints:v3 transportType:v20];
  BOOL v21 = 1;
LABEL_24:

  return v21;
}

- (void)_handleSearchResultError:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  double v6 = sub_1008D836C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v7 = @"Destination";
    if (v4) {
      CFStringRef v7 = @"Source";
    }
    int v8 = 138543618;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error resolving %{public}@. %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)reset
{
  locationLookupOperation = self->_locationLookupOperation;
  if (locationLookupOperation)
  {
    [(MKLocationManagerOperation *)locationLookupOperation cancel];
    BOOL v4 = self->_locationLookupOperation;
    self->_locationLookupOperation = 0;
  }
  suggestionProvider = self->_suggestionProvider;

  [(RoutingAppSuggestionProvider *)suggestionProvider reset];
}

- (id)_appDataForStoreRow:(unint64_t)a3
{
  BOOL v4 = [(RoutingAppSelectionController *)self sortedStoreApps];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (unint64_t)_sectionAtIndex:(int64_t)a3
{
  if ([(NSArray *)self->_sections count] <= a3) {
    return -1;
  }
  id v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  id v6 = [v5 unsignedIntegerValue];

  return (unint64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(RoutingAppSelectionController *)self _sectionAtIndex:a4];
  if (v5)
  {
    if (v5 != 1) {
      return 0;
    }
    id v6 = &OBJC_IVAR___RoutingAppSelectionController__sortedStoreApps;
  }
  else
  {
    id v6 = &OBJC_IVAR___RoutingAppSelectionController__sortedInstalledApps;
  }
  int64_t result = (int64_t)[*(id *)((char *)&self->super.super.super.super.isa + *v6) count];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(RoutingAppSelectionController *)self _sectionAtIndex:a4];
  if (!v7)
  {
    int v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    switch(MGGetSInt32Answer())
    {
      case 1u:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (iPhone)";
        break;
      case 2u:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (iPod)";
        break;
      case 3u:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (iPad)";
        break;
      case 6u:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (watch)";
        break;
      case 9u:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (mac)";
        break;
      default:
        CFStringRef v9 = +[NSBundle mainBundle];
        __int16 v10 = v9;
        CFStringRef v11 = @"[RoutingApps] Installed Section Header (Device)";
        break;
    }
    goto LABEL_4;
  }
  if (v7 == 1)
  {
    int v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    CFStringRef v9 = +[NSBundle mainBundle];
    __int16 v10 = v9;
    CFStringRef v11 = @"From the App Store";
LABEL_4:
    double v12 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];
    [v8 setTitle:v12];

    [v8 setAccessibilityIdentifiersWithBaseString:@"RoutingApps"];
    goto LABEL_8;
  }
  int v8 = 0;
LABEL_8:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  unint64_t v9 = -[RoutingAppSelectionController _sectionAtIndex:](self, "_sectionAtIndex:", [v7 section]);
  if (v9)
  {
    if (v9 == 1 && ![(NSArray *)self->_sortedStoreApps count])
    {
      __int16 v10 = [v6 dequeueReusableCellWithIdentifier:@"LoadingCell" forIndexPath:v7];
      uint64_t v11 = [(RoutingAppSelectionController *)self suggestedStoreApps];
LABEL_11:
      double v12 = (void *)v11;
      [v10 setMode:v11 != 0];
      goto LABEL_12;
    }
  }
  else if (![(NSArray *)self->_sortedInstalledApps count])
  {
    __int16 v10 = [v6 dequeueReusableCellWithIdentifier:@"LoadingCell" forIndexPath:v7];
    uint64_t v11 = [(RoutingAppSelectionController *)self suggestedInstalledApps];
    goto LABEL_11;
  }
  __int16 v10 = [v6 dequeueReusableCellWithIdentifier:@"AppCell" forIndexPath:v7];
  [v10 setDelegate:self];
  [v10 setIntendedTransportType:self->_transportType];
  if ([v7 section])
  {
    if ([v7 section] != (id)1) {
      goto LABEL_13;
    }
    double v12 = [(RoutingAppSelectionController *)self _appDataForStoreRow:v8];
    [v10 setAppStoreApp:v12];
  }
  else
  {
    double v12 = [(NSArray *)self->_sortedInstalledApps objectAtIndexedSubscript:v8];
    [v10 setAppProxy:v12];
  }
LABEL_12:

LABEL_13:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [a4 section] == (id)1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  if ([v8 section] == (id)1)
  {
    unint64_t v5 = [(RoutingAppSelectionController *)self tableView];
    [v5 deselectRowAtIndexPath:v8 animated:1];

    id v6 = -[RoutingAppSelectionController _appDataForStoreRow:](self, "_appDataForStoreRow:", [v8 row]);
    id v7 = [v6 iOSBundleIdentifier];
    +[GEOAPPortal captureUserAction:45 target:733 value:v7];
  }
}

- (void)_cancelRoutingSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routingAppSelectionControllerDidCancel:self];
}

- (void)_reloadSection:(unint64_t)a3
{
  if ([(RoutingAppSelectionController *)self isViewLoaded]
    && ([(RoutingAppSelectionController *)self view],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 window],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v8 = [objc_alloc((Class)NSIndexSet) initWithIndex:a3];
    id v7 = [(RoutingAppSelectionController *)self tableView];
    [v7 reloadSections:v8 withRowAnimation:100];
  }
  else
  {
    id v8 = [(RoutingAppSelectionController *)self tableView];
    [v8 reloadData];
  }
}

- (void)routingAppSuggestionProvider:(id)a3 didSuggestStoreApps:(id)a4
{
  id v5 = a4;
  id v6 = sub_1008D836C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    id v8 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received %lu App Store suggestions", (uint8_t *)&v7, 0xCu);
  }

  [(RoutingAppSelectionController *)self setSuggestedStoreApps:v5];
  [(RoutingAppSelectionController *)self _updateSortedAppStoreAppsForTransportType:self->_transportType];
  [(RoutingAppSelectionController *)self _reloadSection:1];
}

- (void)routingAppSuggestionProvider:(id)a3 didFailToSuggestStoreApps:(id)a4
{
  id v5 = a4;
  id v6 = sub_1008D836C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = [v5 description];
    int v8 = 138412290;
    unint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error fetching store suggestions: %@.", (uint8_t *)&v8, 0xCu);
  }
  [(RoutingAppSelectionController *)self setSuggestedStoreApps:&__NSArray0__struct];
  [(RoutingAppSelectionController *)self _reloadSection:1];
}

- (void)routingAppSuggestionProvider:(id)a3 didSuggestInstalledApps:(id)a4
{
  id v5 = a4;
  id v6 = sub_1008D836C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    id v8 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received %lu Installed App suggestions", (uint8_t *)&v7, 0xCu);
  }

  [(RoutingAppSelectionController *)self setSuggestedInstalledApps:v5];
  [(RoutingAppSelectionController *)self _updateSortedInstalledAppsForTransportType:self->_transportType];
  [(RoutingAppSelectionController *)self _reloadSection:0];
}

- (id)_sanitizedMapItemFromWaypoint:(id)a3
{
  id v3 = a3;
  if ([v3 isCurrentLocation])
  {
    id v4 = +[MKMapItem mapItemForCurrentLocation];
    goto LABEL_12;
  }
  id v5 = [v3 geoMapItem];
  id v6 = [v5 _clientAttributes];
  int v7 = [v6 addressBookAttributes];

  if (v7)
  {
    id v8 = [v3 geoMapItem];
    [v8 coordinate];
    double v10 = v9;
    double v12 = v11;

    id v13 = [objc_alloc((Class)MKPlacemark) initWithCoordinate:0 addressDictionary:v10 v12];
    id v4 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v13];
    objc_super v14 = [v3 geoMapItem];
    double v15 = [v14 contactName];
    if (v15)
    {
      [v4 setName:v15];
    }
    else
    {
      BOOL v21 = [v3 geoMapItem];
      v22 = [v21 name];
      [v4 setName:v22];
    }
    goto LABEL_10;
  }
  id v16 = objc_alloc((Class)MKMapItem);
  v17 = [v3 geoMapItem];
  id v4 = [v16 initWithGeoMapItem:v17 isPlaceHolderPlace:0];

  v18 = [v3 geoMapItem];
  unint64_t v19 = [v18 name];
  [v4 setName:v19];

  uint64_t v20 = [v4 _activityURL];
  id v13 = [v20 absoluteString];

  if (v13)
  {
    objc_super v14 = +[NSURL URLWithString:v13];
    [v4 setUrl:v14];
LABEL_10:
  }
LABEL_12:

  return v4;
}

- (void)_useInstalledApp:(id)a3 toRouteFromSource:(id)a4 toDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 geoMapItem];
  double v12 = -180.0;
  double v13 = -180.0;
  double v14 = -180.0;
  if (v11)
  {
    double v15 = [v9 geoMapItem];
    [v15 coordinate];
    double v13 = v16;
    double v14 = v17;
  }
  v18 = [v10 geoMapItem];
  double v19 = -180.0;
  if (v18)
  {
    uint64_t v20 = [v10 geoMapItem];
    [v20 coordinate];
    double v12 = v21;
    double v19 = v22;
  }
  v23 = [v8 bundleIdentifier];
  +[GEOAPPortal captureTransitAppLaunchSource:destination:bundleIdentifier:](GEOAPPortal, "captureTransitAppLaunchSource:destination:bundleIdentifier:", v23, v13, v14, v12, v19);

  id v24 = objc_alloc_init((Class)MKDirectionsRequest);
  v25 = [(RoutingAppSelectionController *)self _sanitizedMapItemFromWaypoint:v9];
  [v24 setSource:v25];

  v26 = [(RoutingAppSelectionController *)self _sanitizedMapItemFromWaypoint:v10];
  [v24 setDestination:v26];

  unint64_t v27 = [(RoutingAppSelectionController *)self transportType];
  if (v27 > 5) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = qword_100F72878[v27];
  }
  [v24 setTransportType:v28];
  v29 = NSTemporaryDirectory();
  v30 = [v29 stringByAppendingPathComponent:@"request"];
  v31 = [v30 stringByAppendingPathExtension:MKDirectionsRequestFileExtension];

  v32 = +[NSURL fileURLWithPath:v31];
  id v43 = 0;
  unsigned __int8 v33 = [v24 writeToURL:v32 error:&v43];
  id v34 = v43;
  if ((v33 & 1) == 0)
  {
    v35 = sub_1008D836C();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v32;
      __int16 v46 = 2112;
      id v47 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't write directions request to URL: %@.  Error: %@", buf, 0x16u);
    }
  }
  v36 = +[LSApplicationWorkspace defaultWorkspace];
  v37 = [v8 bundleIdentifier];
  v38 = [v36 operationToOpenResource:v32 usingApplication:v37 uniqueDocumentIdentifier:0 userInfo:0 delegate:0];

  [v38 start];
  v39 = +[RoutingAppsManager defaultManager];
  v40 = [v8 bundleIdentifier];
  [v39 recordAppLaunch:v40];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routingAppSelectionControllerDidSelectApp:self];
}

- (void)_updateSortedInstalledAppsForTransportType:(int64_t)a3
{
  id v5 = +[RoutingAppSelectionCell _preferredModesForTransportType:](RoutingAppSelectionCell, "_preferredModesForTransportType:");
  id v6 = +[NSSet setWithArray:v5];

  id v7 = [v6 count];
  if (a3 && v7)
  {
    id v8 = objc_alloc((Class)NSMutableArray);
    id v9 = [(RoutingAppSelectionController *)self suggestedInstalledApps];
    id v10 = [v8 initWithArray:v9];

    double v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    double v14 = sub_1008D9A60;
    double v15 = &unk_1012FFC90;
    id v16 = v6;
    double v17 = self;
    [v10 sortUsingComparator:&v12];
    id v11 = [v10 copy:v12, v13, v14, v15];
    [(RoutingAppSelectionController *)self setSortedInstalledApps:v11];
  }
  else
  {
    id v10 = [(RoutingAppSelectionController *)self suggestedInstalledApps];
    [(RoutingAppSelectionController *)self setSortedInstalledApps:v10];
  }
}

- (void)_updateSortedAppStoreAppsForTransportType:(int64_t)a3
{
  id v5 = +[RoutingAppSelectionCell _preferredModesForTransportType:](RoutingAppSelectionCell, "_preferredModesForTransportType:");
  id v6 = +[NSSet setWithArray:v5];

  id v7 = [v6 count];
  if (a3 && v7)
  {
    id v8 = objc_alloc((Class)NSMutableArray);
    id v9 = [(RoutingAppSelectionController *)self suggestedStoreApps];
    id v10 = [v8 initWithArray:v9];

    double v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    double v14 = sub_1008D9D38;
    double v15 = &unk_1012FFCB8;
    id v16 = v6;
    double v17 = self;
    [v10 sortUsingComparator:&v12];
    id v11 = [v10 copy:v12, v13, v14, v15];
    [(RoutingAppSelectionController *)self setSortedStoreApps:v11];
  }
  else
  {
    id v10 = [(RoutingAppSelectionController *)self suggestedStoreApps];
    [(RoutingAppSelectionController *)self setSortedStoreApps:v10];
  }
}

- (void)routingAppSelectionCellRoutePressed:(id)a3
{
  id v4 = [a3 appProxy];
  [(RoutingAppSelectionController *)self _useInstalledApp:v4 toRouteFromSource:self->_source toDestination:self->_destination];
}

- (RoutingAppSelectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutingAppSelectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSArray)suggestedStoreApps
{
  return self->_suggestedStoreApps;
}

- (void)setSuggestedStoreApps:(id)a3
{
}

- (NSArray)sortedStoreApps
{
  return self->_sortedStoreApps;
}

- (void)setSortedStoreApps:(id)a3
{
}

- (NSArray)suggestedInstalledApps
{
  return self->_suggestedInstalledApps;
}

- (void)setSuggestedInstalledApps:(id)a3
{
}

- (NSArray)sortedInstalledApps
{
  return self->_sortedInstalledApps;
}

- (void)setSortedInstalledApps:(id)a3
{
}

- (GEOComposedWaypoint)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (MKLocationManagerOperation)locationLookupOperation
{
  return self->_locationLookupOperation;
}

- (void)setLocationLookupOperation:(id)a3
{
}

- (RoutingAppSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setSuggestionProvider:(id)a3
{
}

- (BOOL)hasResolvedEndpoints
{
  return self->_resolvedEndpoints;
}

- (void)setResolvedEndpoints:(BOOL)a3
{
  self->_resolvedEndpoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_locationLookupOperation, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sortedInstalledApps, 0);
  objc_storeStrong((id *)&self->_suggestedInstalledApps, 0);
  objc_storeStrong((id *)&self->_sortedStoreApps, 0);
  objc_storeStrong((id *)&self->_suggestedStoreApps, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end