@interface RoutePlanningMapController
- (ActionCoordination)actionCoordinator;
- (BOOL)selectsCurrentRoute;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (NSNumber)originalViewMode;
- (PersonalizedItemManager)personalizedItemManager;
- (RouteCollection)previousRouteCollection;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningMapController)initWithChromeViewController:(id)a3;
- (id)_currentVehicleEntries;
- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4;
- (int64_t)observedRoutePlanningData;
- (void)_didEnterBackground:(id)a3;
- (void)_resetUserInteractionState;
- (void)_updateCurrentRouteForVehicleUpdater;
- (void)_updateRouteAnnotationsController;
- (void)_updateSearchPinsManagerIfPossible;
- (void)_updateVehicleManagerIfNeeded;
- (void)_willEnterForeground:(id)a3;
- (void)clearMapState:(BOOL)a3;
- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5;
- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5;
- (void)restoreOriginalMapViewMode:(BOOL)a3;
- (void)routePlanningDataCoordinator:(id)a3 didEnable:(BOOL)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateCurrentRouteDisplayedMapRect:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4;
- (void)saveOriginalMapViewModeAs:(int64_t)a3;
- (void)setActionCoordinator:(id)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setOriginalViewMode:(id)a3;
- (void)setPersonalizedItemManager:(id)a3;
- (void)setPreviousRouteCollection:(id)a3;
- (void)setSelectCurrentRoute:(BOOL)a3;
- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5;
- (void)updateCameraIfPossible;
@end

@implementation RoutePlanningMapController

- (RoutePlanningMapController)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningMapController;
  v5 = [(RoutePlanningMapController *)&v12 init];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_willEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_didEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"_chromeViewControllerDidUpdateMapInsets:" name:@"ChromeViewControllerDidUpdateMapInsetsNotification" object:v4];

    v5->_transportType = 0;
    v9 = (GEOTransitVehicleUpdater *)[objc_alloc((Class)GEOTransitVehicleUpdater) initWithDelegate:v5];
    transitVehicleUpdater = v5->_transitVehicleUpdater;
    v5->_transitVehicleUpdater = v9;

    [v4 registerAdditionalMapViewDelegate:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setActive:0];
  transitVehicleUpdater = self->_transitVehicleUpdater;
  self->_transitVehicleUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningMapController;
  [(RoutePlanningMapController *)&v4 dealloc];
}

- (void)setActionCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v7 = [v6 searchPinsManager];

    v8 = [obj searchPinsManager];
    objc_storeWeak((id *)&self->_actionCoordinator, obj);
    v9 = [v7 mapView];
    v10 = [v9 window];
    v11 = [v10 windowScene];

    if ([v11 activationState]) {
      BOOL v12 = [v11 activationState] == (id)1;
    }
    else {
      BOOL v12 = 1;
    }
    [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setActive:v12];
    if (v7 != v8)
    {
      [v7 removePOIShapeLoadingObserver:self];
      [v8 addPOIShapeLoadingObserver:self];
    }

    v5 = obj;
  }
}

- (void)setDataCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_dataCoordinator);
    [v5 removeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_dataCoordinator, obj);
    [obj addObserver:self];

    id v7 = objc_loadWeakRetained((id *)&self->_dataCoordinator);
    [v7 setupDataForObserver:self];
  }
}

- (void)setPersonalizedItemManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personalizedItemManager);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_personalizedItemManager);
    [v5 removeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_personalizedItemManager, obj);
    [obj addObserver:self];
  }
}

- (void)setSelectCurrentRoute:(BOOL)a3
{
  if (self->_selectCurrentRoute != a3)
  {
    self->_selectCurrentRoute = a3;
    [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
  }
}

- (void)clearMapState:(BOOL)a3
{
  objc_super v4 = +[NSSet set];
  [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setTripIDs:v4];

  self->_transportType = 0;
  [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
  id v6 = [(RoutePlanningMapController *)self actionCoordinator];
  id v5 = [v6 searchPinsManager];
  [v5 clearDirectionsPins];
}

- (void)restoreOriginalMapViewMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RoutePlanningMapController *)self originalViewMode];

  if (v5)
  {
    id v6 = [(RoutePlanningMapController *)self actionCoordinator];
    id v7 = [(RoutePlanningMapController *)self originalViewMode];
    [v6 setViewMode:[v7 integerValue] animated:v3];

    [(RoutePlanningMapController *)self setOriginalViewMode:0];
  }
}

- (void)saveOriginalMapViewModeAs:(int64_t)a3
{
  objc_super v4 = +[NSNumber numberWithInteger:a3];
  originalViewMode = self->_originalViewMode;
  self->_originalViewMode = v4;
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  if (!self->_userInteractedWithMap)
  {
    id v6 = sub_1007AF9C8();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_userInteractedWithMap = 1;
      return;
    }
    id v7 = self;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(RoutePlanningMapController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        BOOL v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    BOOL v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] User started interacting with map, will suppress camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (void)_resetUserInteractionState
{
  if (self->_userInteractedWithMap)
  {
    BOOL v3 = sub_1007AF9C8();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *(_WORD *)&self->_userInteractedWithMap = 0;
      return;
    }
    objc_super v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(RoutePlanningMapController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Clearing user interacted state, will allow camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (int64_t)observedRoutePlanningData
{
  return 53076;
}

- (void)routePlanningDataCoordinator:(id)a3 didEnable:(BOOL)a4
{
  [(RoutePlanningMapController *)self _resetUserInteractionState];

  [(RoutePlanningMapController *)self _updateCurrentRouteForVehicleUpdater];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  [(RoutePlanningMapController *)self _resetUserInteractionState];
  id v6 = [(RoutePlanningMapController *)self actionCoordinator];
  unint64_t v7 = (unint64_t)[v6 displayedViewMode];

  if (!a4)
  {
    p_transportType = &self->_transportType;
    if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0) {
      goto LABEL_32;
    }
    BOOL v8 = 1;
    goto LABEL_21;
  }
  if (v7 <= 7)
  {
    if (((1 << v7) & 0x67) != 0)
    {
      BOOL v8 = a4 != 3;
      p_transportType = &self->_transportType;
      if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      {
        if (a4 == 3)
        {
LABEL_6:
          int64_t v10 = 3;
          goto LABEL_39;
        }
LABEL_32:
        int64_t *p_transportType = a4;
        goto LABEL_41;
      }
LABEL_21:
      int64_t v12 = *p_transportType;
      BOOL v15 = a4 != 1 && v12 != 0 || v12 == a4;
      if (!v8 || !v15)
      {
        int64_t v10 = 7;
        switch(a4)
        {
          case 0:
          case 3:
            int64_t v10 = a4;
            break;
          case 2:
          case 5:
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
        goto LABEL_39;
      }
      goto LABEL_32;
    }
    if (v7 == 3)
    {
      BOOL v11 = a4 == 3;
      goto LABEL_15;
    }
    if (v7 == 7)
    {
      BOOL v11 = a4 == 1 || a4 == 4;
LABEL_15:
      BOOL v8 = v11;
      p_transportType = &self->_transportType;
      goto LABEL_21;
    }
  }
  p_transportType = &self->_transportType;
  if (((v7 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
  {
    BOOL v8 = 0;
    goto LABEL_21;
  }
  switch(a4)
  {
    case 5:
      goto LABEL_38;
    case 3:
      goto LABEL_6;
    case 2:
LABEL_38:
      int64_t v10 = 0;
      break;
    default:
      int64_t v10 = 7;
      break;
  }
LABEL_39:
  int64_t *p_transportType = a4;
  if (v10 != v7)
  {
    v16 = [(RoutePlanningMapController *)self actionCoordinator];
    [v16 updateViewMode:v10 animated:1];
  }
LABEL_41:

  [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v14 = a4;
  uint64_t v5 = [(RoutePlanningMapController *)self previousRouteCollection];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = (void *)v5;
  unint64_t v7 = [v14 currentRoute];
  unsigned int v8 = [v7 transportType];
  v9 = [(RoutePlanningMapController *)self previousRouteCollection];
  int64_t v10 = [v9 currentRoute];
  if (v8 != [v10 transportType])
  {

LABEL_6:
    [(RoutePlanningMapController *)self setPreviousRouteCollection:v14];
    goto LABEL_7;
  }
  id v11 = [v14 currentRouteIndex];
  int64_t v12 = [(RoutePlanningMapController *)self previousRouteCollection];
  id v13 = [v12 currentRouteIndex];

  [(RoutePlanningMapController *)self setPreviousRouteCollection:v14];
  if (v11 != v13) {
LABEL_7:
  }
    [(RoutePlanningMapController *)self _resetUserInteractionState];
  [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
  [(RoutePlanningMapController *)self _updateSearchPinsManagerIfPossible];
  [(RoutePlanningMapController *)self _updateCurrentRouteForVehicleUpdater];
  [(RoutePlanningMapController *)self updateCameraIfPossible];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCurrentRouteDisplayedMapRect:(id)a4
{
  self->_userInteractedWithMap = 0;
  [(RoutePlanningMapController *)self updateCameraIfPossible];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4
{
  objc_super v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/RoutePlanningMapController.m");
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Observing, but not doing anything"];
    int v7 = 136315394;
    unsigned int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4
{
  uint64_t v5 = [(RoutePlanningMapController *)self dataCoordinator];
  id v8 = [v5 routeCollection];

  id v6 = [v8 currentRoute];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);

  if (WeakRetained == v6) {
    [(RoutePlanningMapController *)self _updateVehicleManagerIfNeeded];
  }
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  id v6 = [(RoutePlanningMapController *)self actionCoordinator];
  unsigned int v7 = [v6 isRoutePlanningPresented];

  if (v7)
  {
    [(RoutePlanningMapController *)self updateCameraIfPossible];
  }
}

- (void)_updateSearchPinsManagerIfPossible
{
  BOOL v3 = [(RoutePlanningMapController *)self dataCoordinator];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100103F48;
  v24 = sub_100104830;
  id v25 = 0;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = [v3 resolvedWaypointSet];
  id v6 = [v5 waypointsOrNull];

  unsigned int v7 = [v3 waypointRequests];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007B0308;
  v16[3] = &unk_1012F89F8;
  id v8 = v6;
  id v17 = v8;
  v19 = &v20;
  id v9 = v4;
  id v18 = v9;
  [v7 enumerateObjectsUsingBlock:v16];

  id v10 = [(RoutePlanningMapController *)self actionCoordinator];
  id v11 = [v10 searchPinsManager];

  int64_t v12 = [v3 routeCollection];
  BOOL v13 = [v12 count] != 0;

  [v11 setDisableEndPins:v13];
  [v11 setDisableStartPin:v13];
  uint64_t v14 = v21[5];
  id v15 = [v9 copy];
  [v11 setStartPin:v14 endPins:v15];

  _Block_object_dispose(&v20, 8);
}

- (void)_updateRouteAnnotationsController
{
  id v2 = [(RoutePlanningMapController *)self actionCoordinator];
  [v2 updateRouteAnnotations];
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RoutePlanningMapController *)self dataCoordinator];
  id v6 = [v5 routeCollection];

  unsigned int v7 = [(RoutePlanningMapController *)self dataCoordinator];
  id v8 = [v7 transportType];

  if (v8 == (id)4 || !v6)
  {
    [v4 clear];
    goto LABEL_20;
  }
  id v31 = v8;
  v32 = v6;
  v33 = v4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = [v6 routes];
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v15 = [(RoutePlanningMapController *)self actionCoordinator];
        v16 = [v15 searchPinsManager];
        id v17 = [v16 routeStartEndItemSource];
        id v18 = [(RoutePlanningMapController *)self personalizedItemManager];
        [v14 updateWaypointStyleAttributesWithItemSource:v17 personalizedItemManager:v18];
      }
      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  id v6 = v32;
  v19 = [v32 routes];
  id v4 = v33;
  uint64_t v20 = [v33 routes];
  if (v19 == (void *)v20)
  {

    id v25 = v31;
    goto LABEL_15;
  }
  v21 = (void *)v20;
  uint64_t v22 = [v32 routes];
  v23 = [v33 routes];
  unsigned __int8 v24 = [v22 isEqualToArray:v23];

  id v25 = v31;
  if ((v24 & 1) == 0)
  {
    v19 = [v32 routes];
    [v33 setRoutes:v19];
LABEL_15:
  }
  unsigned int v26 = [(RoutePlanningMapController *)self selectsCurrentRoute];
  if (v25 == (id)3) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = v26;
  }
  BOOL v28 = v25 != (id)3;
  [v33 setSelectPolyline:v27];
  [v33 setSelectedRouteIndex:[v32 currentRouteIndex]];
  [v33 setRouteTrafficFeaturesActive:1];
  [v33 setAlternateRoutesEnabled:v28];
  [v33 setStyle:v28];
  [v33 setTransitVehiclePositions:self->_lastReceivedVehiclePositions];
  v29 = [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater tripIDs];
  [v33 filterTransitVehiclePositionsForTripsNotInSet:v29];

LABEL_20:
  return 1;
}

- (void)_willEnterForeground:(id)a3
{
  id v9 = [a3 object];
  id v4 = [(RoutePlanningMapController *)self actionCoordinator];
  uint64_t v5 = [v4 searchPinsManager];

  id v6 = [v5 mapView];
  unsigned int v7 = [v6 window];
  id v8 = [v7 windowScene];

  if (v9 == v8) {
    [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setActive:1];
  }
}

- (void)_didEnterBackground:(id)a3
{
  id v9 = [a3 object];
  id v4 = [(RoutePlanningMapController *)self actionCoordinator];
  uint64_t v5 = [v4 searchPinsManager];

  id v6 = [v5 mapView];
  unsigned int v7 = [v6 window];
  id v8 = [v7 windowScene];

  if (v9 == v8) {
    [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setActive:0];
  }
}

- (void)updateCameraIfPossible
{
  BOOL v3 = [(RoutePlanningMapController *)self actionCoordinator];
  unsigned int v4 = [v3 isPresentingAddStopSearchResults];

  if (!v4)
  {
    uint64_t v5 = [(RoutePlanningMapController *)self dataCoordinator];
    if (![v5 isEnabled]) {
      goto LABEL_46;
    }
    if (self->_userInteractedWithMap)
    {
      if (self->_loggedFirstCameraSuppress)
      {
        id v6 = sub_1007AF9C8();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v7 = self;
          id v8 = (objc_class *)objc_opt_class();
          id v9 = NSStringFromClass(v8);
          if (objc_opt_respondsToSelector())
          {
            id v10 = [(RoutePlanningMapController *)v7 performSelector:"accessibilityIdentifier"];
            id v11 = v10;
            if (v10 && ![v10 isEqualToString:v9])
            {
              uint64_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

              goto LABEL_13;
            }
          }
          uint64_t v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_13:

          *(_DWORD *)buf = 138543362;
          v51 = v12;
          BOOL v13 = v6;
          os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}@] Will suppress camera update, user has interacted with map since last update", buf, 0xCu);
        }
LABEL_45:

        goto LABEL_46;
      }
      self->_loggedFirstCameraSuppress = 1;
      id v6 = sub_1007AF9C8();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      id v25 = self;
      unsigned int v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      if (objc_opt_respondsToSelector())
      {
        BOOL v28 = [(RoutePlanningMapController *)v25 performSelector:"accessibilityIdentifier"];
        v29 = v28;
        if (v28 && ![v28 isEqualToString:v27])
        {
          uint64_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v29];

          goto LABEL_25;
        }
      }
      uint64_t v12 = +[NSString stringWithFormat:@"%@<%p>", v27, v25];
LABEL_25:

      *(_DWORD *)buf = 138543362;
      v51 = v12;
      BOOL v13 = v6;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_26;
    }
    [v5 currentRouteDisplayedMapRect];
    double v19 = v18;
    double v20 = v15;
    if (v18 != MKMapRectNull.origin.x || v15 != MKMapRectNull.origin.y)
    {
      double v22 = v16;
      double v23 = v17;
      id v6 = [(RoutePlanningMapController *)self actionCoordinator];
      unsigned __int8 v24 = [v6 mapCameraController];
      [v24 frameMapRect:1 animated:0 completion:v19, v20, v22, v23];
LABEL_44:

      goto LABEL_45;
    }
    id v6 = [v5 routeCollection];
    unsigned __int8 v24 = [v6 routes];
    if ([v5 transportType] == (id)3)
    {
      v30 = [v6 currentRoute];

      if (v30)
      {
        id v31 = [v6 currentRoute];
        v56 = v31;
        uint64_t v32 = +[NSArray arrayWithObjects:&v56 count:1];

        unsigned __int8 v24 = (void *)v32;
      }
    }
    id v33 = [v24 count];
    long long v34 = [(RoutePlanningMapController *)self actionCoordinator];
    long long v35 = v34;
    if (v33)
    {
      long long v36 = [v34 mapCameraController];
      [v36 frameRoutes:v24 includeCompassInset:1 animated:1 completion:0];
LABEL_43:

      goto LABEL_44;
    }
    long long v37 = [v34 searchPinsManager];

    long long v36 = [v37 startPOIShapeIfLoaded];
    v38 = [v37 endPOIShapesIfLoaded];
    v39 = v38;
    if (v36 && [v38 count])
    {
      v40 = [(RoutePlanningMapController *)self actionCoordinator];
      v41 = [v40 mapCameraController];
      [v41 frameApproximateRouteFromStartPOIShape:v36 toEndPOIShapes:v39 animated:1 completion:0];

LABEL_42:
      long long v35 = v37;
      goto LABEL_43;
    }
    v40 = sub_1007AF9C8();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
      goto LABEL_42;
    }
    v42 = self;
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    if (objc_opt_respondsToSelector())
    {
      v45 = [(RoutePlanningMapController *)v42 performSelector:"accessibilityIdentifier"];
      v46 = v45;
      if (v45 && ![v45 isEqualToString:v44])
      {
        uint64_t v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v44, v42, v46];
        v49 = v46;
        v47 = (RoutePlanningMapController *)v48;

        goto LABEL_41;
      }
    }
    v47 = +[NSString stringWithFormat:@"%@<%p>", v44, v42];
LABEL_41:

    *(_DWORD *)buf = 138543874;
    v51 = v47;
    __int16 v52 = 2112;
    v53 = v36;
    __int16 v54 = 2112;
    v55 = v39;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}@] Skipping waypoint based framing due to startPOIShape: %@, endPOIShapes: %@", buf, 0x20u);

    goto LABEL_42;
  }
  uint64_t v5 = sub_1007AF9C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v51 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Presenting Search results for adding a stop. Ignore route framing.", buf, 0xCu);
  }
LABEL_46:
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(RoutePlanningMapController *)self dataCoordinator];
  v38 = [v8 routeCollection];

  if ([(RoutePlanningMapController *)self selectsCurrentRoute])
  {
    id v9 = [v38 currentRoute];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [(RoutePlanningMapController *)self actionCoordinator];
  id v11 = [v10 routeAnnotationsController];
  uint64_t v12 = [v11 configuration];
  unsigned int v13 = [v12 alternateRoutesEnabled];

  if (v13)
  {
    uint64_t v14 = [v38 routes];
LABEL_8:
    double v15 = (void *)v14;
    goto LABEL_9;
  }
  if (v9)
  {
    v49 = v9;
    uint64_t v14 = +[NSArray arrayWithObjects:&v49 count:1];
    goto LABEL_8;
  }
  double v15 = 0;
LABEL_9:
  double v16 = sub_1007AF9C8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v50.double x = x;
    v50.double y = y;
    double v17 = NSStringFromCGPoint(v50);
    unsigned int v18 = [(RoutePlanningMapController *)self selectsCurrentRoute];
    double v19 = @"YES";
    if (!v18) {
      double v19 = @"NO";
    }
    double v20 = v19;
    long long v37 = [v38 currentRoute];
    v21 = [v37 uniqueRouteID];
    double v22 = [v21 UUIDString];
    double v23 = @"YES";
    if (!v13) {
      double v23 = @"NO";
    }
    unsigned __int8 v24 = v23;
    *(_DWORD *)buf = 134350082;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v17;
    __int16 v43 = 2112;
    v44 = v20;
    __int16 v45 = 2112;
    v46 = v22;
    __int16 v47 = 2112;
    uint64_t v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Did receive map view tap at point %@; selectsCurrentRoute: %@; currentRoute: %@; showingAlternateRoutes: %@",
      buf,
      0x34u);
  }
  id v25 = &stru_1012F10B0;
  unsigned int v26 = +[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v7, v15, v9, &stru_1012F10B0, x, y);

  uint64_t v27 = sub_1007AF9C8();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    BOOL v28 = [v26 uniqueRouteID];
    v29 = [v28 UUIDString];
    *(_DWORD *)buf = 134349314;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Detected user tapped route: %@", buf, 0x16u);
  }
  if (v26)
  {
    v30 = [(RoutePlanningMapController *)self dataCoordinator];
    [v30 updateCurrentRoute:v26];

    p_actionCoordinator = &self->_actionCoordinator;
    id WeakRetained = objc_loadWeakRetained((id *)p_actionCoordinator);
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      id v34 = objc_loadWeakRetained((id *)p_actionCoordinator);
      id v35 = [v34 currentMapViewTargetForAnalytics];

      long long v36 = +[MKMapService sharedService];
      [v36 captureUserAction:3015 onTarget:v35 eventValue:0 routeIndex:[v26 _maps_routeIndex]];
    }
  }
}

- (void)_updateCurrentRouteForVehicleUpdater
{
  BOOL v3 = [(RoutePlanningMapController *)self dataCoordinator];
  unsigned int v4 = [v3 isEnabled];

  uint64_t v5 = [(RoutePlanningMapController *)self dataCoordinator];
  id v6 = [v5 transportType];

  id obj = 0;
  if (v4 && v6 == (id)3)
  {
    id v7 = [(RoutePlanningMapController *)self dataCoordinator];
    id v8 = [v7 routeCollection];

    id obj = [v8 currentRoute];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);

  id v10 = obj;
  if (obj != WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);
    [v11 unregisterObserver:self];

    objc_storeWeak((id *)&self->_currentRouteForVehicleUpdater, obj);
    [obj registerObserver:self];
    [(RoutePlanningMapController *)self _updateVehicleManagerIfNeeded];
    id v10 = obj;
  }
}

- (void)_updateVehicleManagerIfNeeded
{
  BOOL v3 = [(RoutePlanningMapController *)self _currentVehicleEntries];
  id v7 = v3;
  if (v3)
  {
    unsigned int v4 = [v3 tripIDs];
    uint64_t v5 = +[NSSet setWithArray:v4];
  }
  else
  {
    uint64_t v5 = +[NSSet set];
  }
  [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setTripIDs:v5];
  id v6 = [(RoutePlanningMapController *)self dataCoordinator];
  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", [v6 isEnabled]);

  [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
}

- (id)_currentVehicleEntries
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRouteForVehicleUpdater);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unsigned int v4 = [(RoutePlanningMapController *)self dataCoordinator];
  uint64_t v5 = [v4 timing];
  id v6 = [v5 departureDate];
  if (v6)
  {

LABEL_5:
    id v10 = 0;
    goto LABEL_6;
  }
  id v7 = [(RoutePlanningMapController *)self dataCoordinator];
  id v8 = [v7 timing];
  id v9 = [v8 arrivalDate];

  if (v9) {
    goto LABEL_5;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [WeakRetained segments];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v13)
  {
LABEL_26:
    id v10 = 0;
    goto LABEL_28;
  }
  id v14 = v13;
  char v15 = 0;
  char v16 = 0;
  uint64_t v17 = *(void *)v22;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v12);
      }
      double v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (!(v15 & 1 | ([v19 type] != (id)5)))
      {
        uint64_t v20 = sub_1007B16CC(v19);
        if (v20)
        {
LABEL_27:
          id v10 = (void *)v20;
          goto LABEL_28;
        }
        char v15 = 1;
LABEL_22:
        if (v16) {
          goto LABEL_26;
        }
        continue;
      }
      if (!(([v19 type] != (id)6) | v16 & 1))
      {
        uint64_t v20 = sub_1007B16CC(v19);
        if (v20) {
          goto LABEL_27;
        }
        char v16 = 1;
      }
      if (v15) {
        goto LABEL_22;
      }
    }
    id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    id v10 = 0;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_28:

LABEL_6:

  return v10;
}

- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(RoutePlanningMapController *)self _currentVehicleEntries];
  id UInteger = (id)GEOConfigGetUInteger();
  id v8 = +[NSMutableSet setWithCapacity:UInteger];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v6 upcomingTripIDs];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
      if ([v5 containsObject:v14]) {
        [v8 addObject:v14];
      }
      if ([v8 count] == UInteger) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v15 = [v8 copy];

  return v15;
}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  [a4 allObjects];
  id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastReceivedVehiclePositions = self->_lastReceivedVehiclePositions;
  self->_lastReceivedVehiclePositions = v6;

  [(RoutePlanningMapController *)self _updateRouteAnnotationsController];
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  p_currentRouteForVehicleUpdater = &self->_currentRouteForVehicleUpdater;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentRouteForVehicleUpdater);

  if (WeakRetained == v8)
  {
    [(RoutePlanningMapController *)self _updateVehicleManagerIfNeeded];
  }
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007B1B00;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (PersonalizedItemManager)personalizedItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personalizedItemManager);

  return (PersonalizedItemManager *)WeakRetained;
}

- (BOOL)selectsCurrentRoute
{
  return self->_selectCurrentRoute;
}

- (NSNumber)originalViewMode
{
  return self->_originalViewMode;
}

- (void)setOriginalViewMode:(id)a3
{
}

- (RouteCollection)previousRouteCollection
{
  return self->_previousRouteCollection;
}

- (void)setPreviousRouteCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRouteCollection, 0);
  objc_storeStrong((id *)&self->_originalViewMode, 0);
  objc_destroyWeak((id *)&self->_personalizedItemManager);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_destroyWeak((id *)&self->_currentRouteForVehicleUpdater);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);

  objc_storeStrong((id *)&self->_transitVehicleUpdater, 0);
}

@end