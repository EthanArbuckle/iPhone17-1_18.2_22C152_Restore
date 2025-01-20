@interface MapsAppTestRoute
- (BOOL)runTest;
- (int64_t)transportType;
- (unint64_t)numWaypointsLoaded;
- (void)_requestRouteWithResolvedDestination:(id)a3;
- (void)_showDirectionSearchView:(id)a3;
- (void)didDisplayRoutes:(id)a3;
- (void)didEndGEOPPTTest_PlaceDataRequest_GEOD:(id)a3;
- (void)didEndGEOPPTTest_PlaceRequest:(id)a3;
- (void)didEndGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3;
- (void)didEndGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3;
- (void)didEndGEOPPTTest_RouteManager_DirectionsRequest:(id)a3;
- (void)didEndMapsPPTTest_ComposeWaypoint:(id)a3;
- (void)didEndMapsPPTTest_Route_SetDirectionsPlan:(id)a3;
- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3;
- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3;
- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3;
- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3;
- (void)didResolveWaypointsForRouting:(id)a3;
- (void)registerGEOSubtestsForRouting;
- (void)setTransportType:(int64_t)a3;
- (void)tapOnSearchBar;
- (void)willBeginGEOPPTTest_PlaceDataRequest_GEOD:(id)a3;
- (void)willBeginGEOPPTTest_PlaceRequest:(id)a3;
- (void)willBeginGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3;
- (void)willBeginGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3;
- (void)willBeginGEOPPTTest_RouteManager_DirectionsRequest:(id)a3;
- (void)willBeginMapsPPTTest_ComposeWaypoint:(id)a3;
- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan:(id)a3;
- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3;
- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3;
- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3;
- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3;
- (void)willResolveWaypointsForRouting:(id)a3;
@end

@implementation MapsAppTestRoute

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  v4 = [v3 _mapstest_waypointStrings];
  if ([(MapsAppTest *)self isRunningOnCarPlay])
  {
    [(MapsAppTest *)self startedTest];
    [(MapsAppTest *)self startedSubTest:@"loadPlaceCard"];
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [(MapsAppTest *)self testCoordinator];
    [v6 pptTestResetForLaunchURL];

    [self switchToMapType:[v3 _mapstest_mapType]];
    v7 = [(MapsAppTest *)self options];
    v8 = [v7 objectForKeyedSubscript:@"mapType"];

    if ([v8 isEqualToString:@"transit"]) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  [(MapsAppTestRoute *)self setTransportType:v5];
  uint64_t v9 = [v3 _mapstest_originString];
  unsigned int v10 = [(MapsAppTest *)self isRunningOnCarPlay];
  v11 = [v3 _mapstest_destinationString];
  uint64_t v12 = (uint64_t)v11;
  if (v10)
  {
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v3 objectForKeyedSubscript:@"endAddr"];
    }
    uint64_t v14 = (uint64_t)v13;

    uint64_t v12 = v14;
  }
  if (v9 | v12)
  {
LABEL_15:
    if (v4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if ([v4 count] == (id)2)
  {
    uint64_t v9 = [v4 objectAtIndexedSubscript:0];
    uint64_t v12 = [v4 objectAtIndexedSubscript:1];
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  uint64_t v12 = 0;
  if (v4) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v9 && !v12)
  {
    NSExceptionName v20 = NSInvalidArgumentException;
    CFStringRef v21 = @"No waypoints provided for route test";
    goto LABEL_36;
  }
LABEL_18:
  if (v4 && (unint64_t)[v4 count] <= 1)
  {
    NSExceptionName v20 = NSInvalidArgumentException;
    CFStringRef v21 = @"Not enough waypoints provided for route test";
LABEL_36:
    id v22 = +[NSException exceptionWithName:v20 reason:v21 userInfo:0];
    objc_exception_throw(v22);
  }
  if (((objc_msgSend((id)v9, "_mapstest_isCurrentLocationString") & 1) != 0
     || [(MapsAppTest *)self isRunningOnCarPlay])
    && (unint64_t)[v4 count] <= 2)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = sub_100103AEC;
    v30[4] = sub_100104600;
    id v31 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100377870;
    v29[3] = &unk_1012E6618;
    v29[4] = self;
    v29[5] = v30;
    +[PPTNotificationCenter addOnceObserverForName:@"SearchSessionDidChangeSearchResultsNotification" object:0 usingBlock:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10037791C;
    v28[3] = &unk_1012E6640;
    v28[4] = self;
    v28[5] = v30;
    +[PPTNotificationCenter addOnceObserverForName:@"MapsPinsDroppedForSearchResultsNotification" object:0 usingBlock:v28];
    if ([(MapsAppTest *)self isRunningOnCarPlay])
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1003779EC;
      v27[3] = &unk_1012E6668;
      v27[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:@"CarPlaceCardCardViewControllerDidAppearNotification" object:0 usingBlock:v27];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100377A38;
      v26[3] = &unk_1012E6668;
      v26[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:@"CarPlaceCardCardViewControllerDidLoadRouteNotification" object:0 usingBlock:v26];
    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100377A7C;
      v25[3] = &unk_1012E6640;
      v25[4] = self;
      v25[5] = v30;
      +[PPTNotificationCenter addOnceObserverForName:MKPlaceViewControllerDidShowNotification object:0 usingBlock:v25];
    }
    v15 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v15 setSearchString:v12];
    if ([(MapsAppTest *)self isRunningOnCarPlay])
    {
      v16 = [(MapsAppTest *)self testCoordinator];
      [v16 pptTestEnterSearchMode];

      dispatch_time_t v17 = dispatch_time(0, 2000000000);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100377CD4;
      v23[3] = &unk_1012E5D58;
      v23[4] = self;
      v24 = v15;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v23);
    }
    else
    {
      v18 = [(MapsAppTest *)self testCoordinator];
      [v18 pptTestSearchForFieldItem:v15];
    }
    _Block_object_dispose(v30, 8);
  }
  else
  {
    [(MapsAppTestRoute *)self _requestRouteWithResolvedDestination:0];
  }

  return 1;
}

- (void)_requestRouteWithResolvedDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MapsAppTest *)self options];
  [(MapsAppTestRoute *)self registerGEOSubtestsForRouting];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"willResolveWaypointsForRouting:" name:@"MapsWaypointResolutionDidBeginNotification" object:0];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100377F0C;
  block[3] = &unk_1012E66E0;
  id v11 = v5;
  id v12 = v4;
  id v13 = self;
  id v8 = v4;
  id v9 = v5;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerGEOSubtestsForRouting
{
  [(MapsAppTest *)self registerGEOManifestSubtests];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willBeginMapsPPTTest_Route_SetDirectionsPlan:" name:@"MapsPPTTest_Route_SetDirectionsPlanBEGIN" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didEndMapsPPTTest_Route_SetDirectionsPlan:" name:@"MapsPPTTest_Route_SetDirectionsPlanEND" object:0];

  uint64_t v5 = +[GEONotificationPreferenceManager sharedManager];
  [v5 setEnabled:1 forSubTestWithName:@"MapsPPTTest_Route_SetDirectionsPlan"];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:" name:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsStartedBEGIN" object:0];

  dispatch_time_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:" name:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsStartedEND" object:0];

  id v8 = +[GEONotificationPreferenceManager sharedManager];
  [v8 setEnabled:1 forSubTestWithName:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted"];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:" name:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePickingBEGIN" object:0];

  unsigned int v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:" name:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePickingEND" object:0];

  id v11 = +[GEONotificationPreferenceManager sharedManager];
  [v11 setEnabled:1 forSubTestWithName:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePicking"];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:" name:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypointsBEGIN" object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:" name:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypointsEND" object:0];

  uint64_t v14 = +[GEONotificationPreferenceManager sharedManager];
  [v14 setEnabled:1 forSubTestWithName:@"MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints"];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:" name:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearchBEGIN" object:0];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:" name:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearchEND" object:0];

  dispatch_time_t v17 = +[GEONotificationPreferenceManager sharedManager];
  [v17 setEnabled:1 forSubTestWithName:@"MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch"];

  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"willBeginMapsPPTTest_ComposeWaypoint:" name:@"MapsPPTTest_ComposeWaypointBEGIN" object:0];

  v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"didEndMapsPPTTest_ComposeWaypoint:" name:@"MapsPPTTest_ComposeWaypointEND" object:0];

  NSExceptionName v20 = +[GEONotificationPreferenceManager sharedManager];
  [v20 setEnabled:1 forSubTestWithName:@"MapsPPTTest_ComposeWaypoint"];

  CFStringRef v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"willBeginGEOPPTTest_PlaceRequest:" name:@"GEOPPTTest_PlaceRequestBEGIN" object:0];

  id v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"didEndGEOPPTTest_PlaceRequest:" name:@"GEOPPTTest_PlaceRequestEND" object:0];

  v23 = +[GEONotificationPreferenceManager sharedManager];
  [v23 setEnabled:1 forSubTestWithName:@"GEOPPTTest_PlaceRequest"];

  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"willBeginGEOPPTTest_PlaceRequest_RequestPreparing:" name:@"GEOPPTTest_PlaceRequest_RequestPreparingBEGIN" object:0];

  v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"didEndGEOPPTTest_PlaceRequest_RequestPreparing:" name:@"GEOPPTTest_PlaceRequest_RequestPreparingEND" object:0];

  v26 = +[GEONotificationPreferenceManager sharedManager];
  [v26 setEnabled:1 forSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

  v27 = +[NSNotificationCenter defaultCenter];
  [v27 addObserver:self selector:"willBeginGEOPPTTest_PlaceRequest_ResponseHandling:" name:@"GEOPPTTest_PlaceRequest_ResponseHandlingBEGIN" object:0];

  v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"didEndGEOPPTTest_PlaceRequest_ResponseHandling:" name:@"GEOPPTTest_PlaceRequest_ResponseHandlingEND" object:0];

  v29 = +[GEONotificationPreferenceManager sharedManager];
  [v29 setEnabled:1 forSubTestWithName:@"GEOPPTTest_PlaceRequest_ResponseHandling"];

  v30 = +[NSNotificationCenter defaultCenter];
  [v30 addObserver:self selector:"willBeginGEOPPTTest_PlaceDataRequest_GEOD:" name:@"GEOPPTTest_PlaceDataRequest_GEODBEGIN" object:0];

  id v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"didEndGEOPPTTest_PlaceDataRequest_GEOD:" name:@"GEOPPTTest_PlaceDataRequest_GEODEND" object:0];

  v32 = +[GEONotificationPreferenceManager sharedManager];
  [v32 setEnabled:1 forSubTestWithName:@"GEOPPTTest_PlaceDataRequest_GEOD"];

  v33 = +[NSNotificationCenter defaultCenter];
  [v33 addObserver:self selector:"willBeginGEOPPTTest_RouteManager_DirectionsRequest:" name:@"GEOPPTTest_RouteManager_DirectionsRequestBEGIN" object:0];

  v34 = +[NSNotificationCenter defaultCenter];
  [v34 addObserver:self selector:"didEndGEOPPTTest_RouteManager_DirectionsRequest:" name:@"GEOPPTTest_RouteManager_DirectionsRequestEND" object:0];

  id v35 = +[GEONotificationPreferenceManager sharedManager];
  [v35 setEnabled:1 forSubTestWithName:@"GEOPPTTest_RouteManager_DirectionsRequest"];
}

- (void)tapOnSearchBar
{
}

- (void)_showDirectionSearchView:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = [(MapsAppTest *)self options];
  v6 = [v5 objectForKeyedSubscript:@"transportType"];

  dispatch_time_t v7 = [(MapsAppTest *)self options];
  id v8 = v7;
  if (v6)
  {
    switch(objc_msgSend(v7, "_mapstest_transportType"))
    {
      case 1u:
      case 5u:
        uint64_t v9 = 3;
        break;
      case 2u:
        uint64_t v9 = 2;
        break;
      case 3u:
        uint64_t v9 = 5;
        break;
      case 4u:
        uint64_t v9 = 0;
        break;
      case 6u:
        uint64_t v9 = 4;
        break;
      default:
        uint64_t v9 = 1;
        break;
    }
  }
  else
  {
    unsigned int v10 = [v7 objectForKeyedSubscript:@"mapType"];

    if ([v10 isEqualToString:@"transit"]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 1;
    }
    id v8 = v10;
  }

  id v11 = [(MapsAppTest *)self options];
  id v12 = [v11 objectForKeyedSubscript:@"startAddr"];

  id v13 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v13 setSearchString:v12];
  uint64_t v14 = [(MapsAppTest *)self options];
  v15 = [v14 objectForKeyedSubscript:@"endAddr"];

  v16 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v16 setSearchString:v15];
  dispatch_time_t v17 = [DirectionItem alloc];
  v21[0] = v13;
  v21[1] = v16;
  v18 = +[NSArray arrayWithObjects:v21 count:2];
  v19 = [(DirectionItem *)v17 initWithItems:v18 transportType:v9];

  [v4 addObserver:self selector:"willResolveWaypointsForRouting:" name:@"MapsWaypointResolutionDidBeginNotification" object:0];
  NSExceptionName v20 = [(MapsAppTest *)self testCoordinator];
  [v20 pptTestDoDirectionItem:v19];
}

- (void)willResolveWaypointsForRouting:(id)a3
{
  self->_numWaypointsLoaded = 0;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"MapsWaypointResolutionDidBeginNotification" object:0];

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"didResolveWaypointsForRouting:" name:@"MapsWaypointResolutionDidLoadOriginNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"didResolveWaypointsForRouting:" name:@"MapsWaypointResolutionDidLoadDestinationNotification" object:0];

  [(MapsAppTest *)self finishedSubTest:@"directionsSetup"];
  [(MapsAppTest *)self startedSubTest:@"waypointResolution1"];

  [(MapsAppTest *)self startedSubTest:@"waypointResolution2"];
}

- (void)didResolveWaypointsForRouting:(id)a3
{
  unint64_t numWaypointsLoaded = self->_numWaypointsLoaded;
  self->_unint64_t numWaypointsLoaded = numWaypointsLoaded + 1;
  if (numWaypointsLoaded)
  {
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"MapsWaypointResolutionDidLoadOriginNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:@"MapsWaypointResolutionDidLoadDestinationNotification" object:0];

    [(MapsAppTest *)self finishedSubTest:@"waypointResolution2"];
    [(MapsAppTest *)self startedSubTest:@"routeRequestPrep"];
  }
  else
  {
    [(MapsAppTest *)self finishedSubTest:@"waypointResolution1"];
  }
}

- (void)willBeginGEOPPTTest_PlaceRequest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100378A88;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_PlaceRequest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100378B14;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100378B98;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100378C24;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100378CCC;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)didEndGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100378DFC;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)willBeginGEOPPTTest_PlaceDataRequest_GEOD:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100378F24;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)didEndGEOPPTTest_PlaceDataRequest_GEOD:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100379054;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379158;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003791E4;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379268;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003792F4;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379378;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379404;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379488;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379514;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379598;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379624;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_ComposeWaypoint:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003796A8;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_ComposeWaypoint:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379734;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_RouteManager_DirectionsRequest:(id)a3
{
  [(MapsAppTest *)self finishedSubTest:@"routeRequestPrep"];
  [(MapsAppTest *)self startedSubTest:@"routeRequestWaiting"];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didDisplayRoutes:" name:@"MapsRoutePlanningShowingRoutesNotification" object:0];
}

- (void)didEndGEOPPTTest_RouteManager_DirectionsRequest:(id)a3
{
  id v23 = a3;
  id v4 = [v23 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = v23;
  if (isKindOfClass)
  {
    dispatch_time_t v7 = [v23 object];
    if ([v7 count])
    {
      id v8 = [v7 firstObject];
      unsigned int v9 = [v8 transportType] - 1;
      if (v9 > 5) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = qword_100F6EEF0[v9];
      }
      if (v10 == [(MapsAppTestRoute *)self transportType])
      {
        id v11 = [v8 _maps_traceRecordingData];
        id v12 = [v11 initialDirectionsRequest];
        id v13 = [v11 initialDirectionsResponse];
        uint64_t v14 = [v12 data];
        v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 length]);
        v16 = [(MapsAppTest *)self results];
        [v16 setObject:v15 forKeyedSubscript:@"extras:routeRequestSize:bytes"];

        dispatch_time_t v17 = [v13 data];
        v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 length]);
        v19 = [(MapsAppTest *)self results];
        [v19 setObject:v18 forKeyedSubscript:@"extras:routeResponseSize:bytes"];

        NSExceptionName v20 = [v13 suggestedRoutes];
        CFStringRef v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 count]);
        id v22 = [(MapsAppTest *)self results];
        [v22 setObject:v21 forKeyedSubscript:@"extras:routeResponseSuggestedNumRoutes:count"];

        [(MapsAppTest *)self finishedSubTest:@"routeRequestWaiting"];
        [(MapsAppTest *)self startedSubTest:@"displayRoutes"];
      }
    }

    v6 = v23;
  }
}

- (void)didDisplayRoutes:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"MapsRoutePlanningShowingRoutesNotification" object:0];

  dispatch_time_t v5 = dispatch_time(0, 2650000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100379AEC;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)numWaypointsLoaded
{
  return self->_numWaypointsLoaded;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

@end