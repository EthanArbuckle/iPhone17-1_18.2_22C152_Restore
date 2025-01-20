@interface TilePreloadingTask
+ (int64_t)creationPreference;
- (CarDisplayController)carDisplayController;
- (MNNavigationService)navigationService;
- (NavigationSession)observedNavigationSession;
- (OverlayManager)overlayManager;
- (RouteCollection)currentRouteCollection;
- (RoutePlanningSession)observedRoutePlanningSession;
- (RouteTileLoadingSession)tileLoadingSession;
- (TilePreloadingTask)initWithNavigationService:(id)a3 carDisplayController:(id)a4;
- (id)traitsForPreloadingSession;
- (void)_clearPreloadingIfNecessary;
- (void)_updateNavServiceWithCurrentRouteCollectionInSession;
- (void)_updateRoutePreloadingAndNavService;
- (void)_updateRoutePreloadingSessionWithCurrentRouteCollectionInSession;
- (void)dealloc;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setCarDisplayController:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setObservedNavigationSession:(id)a3;
- (void)setObservedRoutePlanningSession:(id)a3;
- (void)setOverlayManager:(id)a3;
- (void)setTileLoadingSession:(id)a3;
@end

@implementation TilePreloadingTask

- (TilePreloadingTask)initWithNavigationService:(id)a3 carDisplayController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[TilePreloadingTask initWithNavigationService:carDisplayController:]";
      __int16 v20 = 2080;
      v21 = "TilePreloadingTask.m";
      __int16 v22 = 1024;
      int v23 = 53;
      __int16 v24 = 2080;
      v25 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TilePreloadingTask;
  v9 = [(TilePreloadingTask *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_carDisplayController, a4);
    objc_storeStrong((id *)&v10->_navigationService, a3);
    [(MNNavigationService *)v10->_navigationService openForClient:v10];
    carDisplayController = v10->_carDisplayController;
    v12 = NSStringFromSelector("state");
    [(CarDisplayController *)carDisplayController addObserver:v10 forKeyPath:v12 options:0 context:0];
  }
  return v10;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  carDisplayController = self->_carDisplayController;
  v4 = NSStringFromSelector("state");
  [(CarDisplayController *)carDisplayController removeObserver:self forKeyPath:v4 context:0];

  [(MNNavigationService *)self->_navigationService closeForClient:self];
  v5.receiver = self;
  v5.super_class = (Class)TilePreloadingTask;
  [(TilePreloadingTask *)&v5 dealloc];
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [(TilePreloadingTask *)self setObservedRoutePlanningSession:v8];

  id v17 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v17;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  [(TilePreloadingTask *)self setObservedNavigationSession:v10];
  v11 = [v17 platformController];
  v12 = [v11 chromeViewController];

  id v13 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  v16 = [v15 overlayManager];

  [(TilePreloadingTask *)self setOverlayManager:v16];
  [(TilePreloadingTask *)self _clearPreloadingIfNecessary];
}

- (void)_clearPreloadingIfNecessary
{
  v3 = [(TilePreloadingTask *)self observedRoutePlanningSession];
  if (v3)
  {
  }
  else
  {
    v4 = [(TilePreloadingTask *)self observedNavigationSession];

    if (!v4)
    {
      objc_super v5 = [(TilePreloadingTask *)self navigationService];
      [v5 setRoutesForPreview:0 selectedRouteIndex:0x7FFFFFFFFFFFFFFFLL];

      id v6 = +[UIApplication sharedMapsDelegate];
      id v7 = [v6 appSessionController];
      id v8 = [v7 currentlyNavigatingPlatformController];

      if (!v8)
      {
        v9 = [(TilePreloadingTask *)self navigationService];
        [v9 stopNavigationWithReason:2];
      }
      [(TilePreloadingTask *)self setTileLoadingSession:0];
    }
  }
}

- (void)setObservedRoutePlanningSession:(id)a3
{
  objc_super v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    id v7 = v5;
    [observedRoutePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    [self->_observedRoutePlanningSession addObserver:self];
    objc_super v5 = v7;
  }
}

- (void)setObservedNavigationSession:(id)a3
{
  objc_super v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    id v7 = v5;
    [observedNavigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    [self->_observedNavigationSession addObserver:self];
    objc_super v5 = v7;
  }
}

- (void)setTileLoadingSession:(id)a3
{
  objc_super v5 = (RouteTileLoadingSession *)a3;
  tileLoadingSession = self->_tileLoadingSession;
  p_tileLoadingSession = &self->_tileLoadingSession;
  id v6 = tileLoadingSession;
  if (tileLoadingSession != v5)
  {
    v9 = v5;
    [(RouteTileLoadingSession *)v6 stop];
    objc_storeStrong((id *)p_tileLoadingSession, a3);
    [(RouteTileLoadingSession *)*p_tileLoadingSession start];
    objc_super v5 = v9;
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 1) {
    [(TilePreloadingTask *)self _updateRoutePreloadingAndNavService];
  }
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(TilePreloadingTask *)self observedRoutePlanningSession];

  if (v8 != v7)
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      id v13 = "-[TilePreloadingTask routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
      __int16 v14 = 2080;
      id v15 = "TilePreloadingTask.m";
      __int16 v16 = 1024;
      int v17 = 159;
      __int16 v18 = 2080;
      v19 = "session == self.observedRoutePlanningSession";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  if ([v7 currentTransportType] == (id)a5) {
    [(TilePreloadingTask *)self _updateRoutePreloadingAndNavService];
  }
}

- (void)_updateRoutePreloadingAndNavService
{
  [(TilePreloadingTask *)self _updateNavServiceWithCurrentRouteCollectionInSession];

  [(TilePreloadingTask *)self _updateRoutePreloadingSessionWithCurrentRouteCollectionInSession];
}

- (void)_updateRoutePreloadingSessionWithCurrentRouteCollectionInSession
{
  v3 = [(TilePreloadingTask *)self currentRouteCollection];
  id v18 = [v3 currentRoute];

  if (!v18) {
    goto LABEL_10;
  }
  v4 = [v18 origin];
  if (([v4 isCurrentLocation] & 1) == 0)
  {

    goto LABEL_10;
  }
  unsigned __int8 v5 = [v18 isOfflineRoute];

  if (v5)
  {
LABEL_10:
    [(TilePreloadingTask *)self setTileLoadingSession:0];
    goto LABEL_11;
  }
  id v6 = [(TilePreloadingTask *)self tileLoadingSession];
  id v7 = [v6 route];
  unsigned int v8 = [v18 isEqual:v7];

  if ((GEOConfigGetBOOL() & 1) == 0 && (id)[(CarDisplayController *)self->_carDisplayController state] == (id)2
    || GEOConfigGetBOOL())
  {
    uint64_t v9 = 1;
    if (!v8) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (!v8)
    {
LABEL_17:
      __int16 v14 = [RouteTileLoadingSession alloc];
      id v15 = [(TilePreloadingTask *)self overlayManager];
      __int16 v16 = [(TilePreloadingTask *)self traitsForPreloadingSession];
      int v17 = [(RouteTileLoadingSession *)v14 initWithRoute:v18 overlayManager:v15 traits:v16 options:v9];
      [(TilePreloadingTask *)self setTileLoadingSession:v17];

      goto LABEL_11;
    }
  }
  uint64_t v10 = [(TilePreloadingTask *)self tileLoadingSession];
  if (v10)
  {
    v11 = (void *)v10;
    int v12 = [(TilePreloadingTask *)self tileLoadingSession];
    id v13 = [v12 options];

    if ((id)v9 != v13) {
      goto LABEL_17;
    }
  }
LABEL_11:
}

- (void)_updateNavServiceWithCurrentRouteCollectionInSession
{
  v3 = [(TilePreloadingTask *)self currentRouteCollection];
  id v7 = v3;
  if (v3) {
    uint64_t v4 = (uint64_t)[v3 currentRouteIndex];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned __int8 v5 = [(TilePreloadingTask *)self navigationService];
  id v6 = [v7 routes];
  [v5 setRoutesForPreview:v6 selectedRouteIndex:v4];
}

- (RouteCollection)currentRouteCollection
{
  v3 = [(TilePreloadingTask *)self observedRoutePlanningSession];

  if (v3) {
    [(TilePreloadingTask *)self observedRoutePlanningSession];
  }
  else {
  uint64_t v4 = [(TilePreloadingTask *)self observedNavigationSession];
  }
  unsigned __int8 v5 = [v4 currentRouteCollection];

  return (RouteCollection *)v5;
}

- (id)traitsForPreloadingSession
{
  v3 = [(TilePreloadingTask *)self observedRoutePlanningSession];
  uint64_t v4 = [v3 configuration];
  unsigned __int8 v5 = [v4 traits];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    unsigned int v8 = [(TilePreloadingTask *)self observedNavigationSession];
    uint64_t v9 = [v8 configuration];
    id v7 = [v9 traits];
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (CarDisplayController *)a4;
  id v12 = a5;
  id v13 = NSStringFromSelector("state");
  if (![v10 isEqualToString:v13])
  {

    goto LABEL_5;
  }
  carDisplayController = self->_carDisplayController;

  if (carDisplayController != v11)
  {
LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)TilePreloadingTask;
    [(TilePreloadingTask *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_6;
  }
  [(TilePreloadingTask *)self _updateRoutePreloadingSessionWithCurrentRouteCollectionInSession];
LABEL_6:
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (CarDisplayController)carDisplayController
{
  return self->_carDisplayController;
}

- (void)setCarDisplayController:(id)a3
{
}

- (OverlayManager)overlayManager
{
  return self->_overlayManager;
}

- (void)setOverlayManager:(id)a3
{
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (RouteTileLoadingSession)tileLoadingSession
{
  return self->_tileLoadingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileLoadingSession, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_overlayManager, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end