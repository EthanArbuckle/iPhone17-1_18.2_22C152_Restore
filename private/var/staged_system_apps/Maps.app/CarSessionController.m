@interface CarSessionController
+ (id)sharedInstance;
- (BOOL)isActive;
- (CarSessionController)init;
- (NSMutableSet)observers;
- (NSSet)sessionObservers;
- (NavigationSession)navigationSession;
- (PlatformController)platformController;
- (RouteGeniusSession)routeGeniusSession;
- (RoutePlanningSession)routePlanningSession;
- (id)navigationEndedHandler;
- (void)_handleIncomingSession:(id)a3;
- (void)_handleTransportType:(int64_t)a3;
- (void)_navigationSessionDidChangeState:(unint64_t)a3;
- (void)_promptToEndNavigationAccepted:(id)a3;
- (void)_routeGeniusSessionDidChangeState:(unint64_t)a3;
- (void)_routePlanningSessionDidChangeState:(unint64_t)a3;
- (void)_startNavigatingAnimated:(BOOL)a3;
- (void)_stopNavigation;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didUpdateRouteGenius:(id)a3;
- (void)endNavigationIfNeededWithPrompt:(BOOL)a3 andPerformBlock:(id)a4;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationServicePredictingDidArrive:(id)a3;
- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)removeObserver:(id)a3;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)setActive:(BOOL)a3;
- (void)setNavigationEndedHandler:(id)a3;
- (void)setNavigationSession:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRouteGeniusSession:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
@end

@implementation CarSessionController

- (CarSessionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarSessionController;
  v2 = [(CarSessionController *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:4];
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_active = 0;
  }
  return v2;
}

- (NSSet)sessionObservers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CarSessionController *)v2 observers];
  id v4 = [v3 copy];

  objc_sync_exit(v2);

  return (NSSet *)v4;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

+ (id)sharedInstance
{
  if (qword_10160FA08 != -1) {
    dispatch_once(&qword_10160FA08, &stru_1012F94A0);
  }
  v2 = (void *)qword_10160FA00;

  return v2;
}

- (void)dealloc
{
  [(CarSessionController *)self setActive:0];
  v3.receiver = self;
  v3.super_class = (Class)CarSessionController;
  [(CarSessionController *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [(CarSessionController *)v5 observers];
  unsigned __int8 v7 = [v6 containsObject:v4];

  if (v7)
  {
    objc_sync_exit(v5);
  }
  else
  {
    v8 = [(CarSessionController *)v5 observers];
    [v8 addObject:v4];

    v9 = [(CarSessionController *)v5 observers];
    id v10 = [v9 count];

    if (v10) {
      [(CarSessionController *)v5 setActive:1];
    }
    v11 = sub_100577ECC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = [(CarSessionController *)v5 observers];
      id v15 = [v14 count];
      unsigned int v16 = [(CarSessionController *)v5 isActive];
      v17 = @"NO";
      if (v16) {
        v17 = @"YES";
      }
      v18 = v17;
      int v20 = 138412802;
      id v21 = v13;
      __int16 v22 = 2048;
      id v23 = v15;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "addObserver: %@, observersCount: %lu, active: %@", (uint8_t *)&v20, 0x20u);
    }
    objc_sync_exit(v5);

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:off_1015EC260 object:v5];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [(CarSessionController *)v5 observers];
  unsigned __int8 v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = [(CarSessionController *)v5 observers];
    [v8 removeObject:v4];

    v9 = [(CarSessionController *)v5 observers];
    id v10 = [v9 count];

    if (!v10) {
      [(CarSessionController *)v5 setActive:0];
    }
    v11 = sub_100577ECC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = [(CarSessionController *)v5 observers];
      id v15 = [v14 count];
      unsigned int v16 = [(CarSessionController *)v5 isActive];
      v17 = @"NO";
      if (v16) {
        v17 = @"YES";
      }
      v18 = v17;
      int v20 = 138412802;
      id v21 = v13;
      __int16 v22 = 2048;
      id v23 = v15;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "removeObserver: %@, observersCount: %lu, active: %@", (uint8_t *)&v20, 0x20u);
    }
    objc_sync_exit(v5);

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:off_1015EC260 object:v5];
  }
  else
  {
    objc_sync_exit(v5);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      id v4 = [(CarSessionController *)self platformController];
      [v4 addObserver:self];

      v5 = +[MNNavigationService sharedService];
      [v5 registerObserver:self];

      objc_super v6 = +[CarRouteGeniusService sharedService];
      [v6 registerObserver:self];

      unsigned __int8 v7 = [(CarSessionController *)self platformController];
      v8 = [v7 currentSession];
      [(CarSessionController *)self _handleIncomingSession:v8];
    }
    else
    {
      [(CarSessionController *)self _handleIncomingSession:0];
      v9 = [(CarSessionController *)self platformController];
      [v9 removeObserver:self];

      id v10 = +[MNNavigationService sharedService];
      [v10 unregisterObserver:self];

      unsigned __int8 v7 = +[CarRouteGeniusService sharedService];
      [v7 unregisterObserver:self];
    }

    v11 = +[CarDisplayController sharedInstance];
    [v11 _carSessionController_updateNavigationHostingState];

    v12 = sub_100577ECC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (self->_active) {
        id v13 = @"YES";
      }
      else {
        id v13 = @"NO";
      }
      v14 = v13;
      int v15 = 138412290;
      unsigned int v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "setActive: %@, updating navigation hosting state", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (PlatformController)platformController
{
  v2 = +[CarDisplayController sharedInstance];
  objc_super v3 = [v2 platformController];

  return (PlatformController *)v3;
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = sub_100577ECC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v27 = 138412546;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "willChangeCurrentSessionFromSession from: %@ to: %@", (uint8_t *)&v27, 0x16u);
  }
  id v13 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  id v16 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v15)
  {
    if (v18)
    {
      v19 = [v15 configuration];
      int v20 = [v19 automaticSharingContacts];
      id v21 = [v20 count];

      if (v21)
      {
        __int16 v22 = sub_100577ECC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Adding automatic sharing contacts from planning session to navigation session", (uint8_t *)&v27, 2u);
        }

        id v23 = [v15 configuration];
        __int16 v24 = [v23 automaticSharingContacts];
        v25 = [v18 configuration];
        v26 = [v25 sharedTripPrefetchContext];
        [v26 setAutomaticSharingContacts:v24];
      }
    }
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_100577ECC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    int v34 = 138412546;
    v35 = v11;
    __int16 v36 = 2112;
    v37 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "didChangeCurrentSessionFromSession from: %@ to: %@", (uint8_t *)&v34, 0x16u);
  }
  id v14 = v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (!v14 || (isKindOfClass & 1) == 0)
  {
    id v16 = +[CarDisplayController sharedInstance];
    v17 = [v16 routeGeniusManager];
    [v17 deactivateForAllChromes];
  }
  [(CarSessionController *)self _handleIncomingSession:v14];
  id v18 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    id v21 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v22 = v21;
    }
    else {
      __int16 v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
    }
    else
    {
      id v24 = v21;
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (!v14 || (v25 & 1) == 0)
      {
        v33 = +[CarChromeModeCoordinator sharedInstance];
        [v33 endRoutePlanning];

        goto LABEL_24;
      }
    }
  }
  id v26 = v18;
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v26 && (v27 & 1) != 0)
  {
    [(CarSessionController *)self _stopNavigation];
LABEL_24:
    v31 = +[UIApplication sharedMapsDelegate];
    [v31 dismissCurrentInterruptionOfKind:8];
    goto LABEL_25;
  }
  id v28 = v26;
  objc_opt_class();
  char v29 = objc_opt_isKindOfClass();

  if (v26 && (v29 & 1) != 0)
  {
    v30 = +[CarChromeModeCoordinator sharedInstance];
    [v30 endRouteGenius];

    v31 = +[CarDisplayController sharedInstance];
    v32 = [v31 routeGeniusManager];
    [v32 deactivateForAllChromes];

LABEL_25:
  }
}

- (void)_handleIncomingSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [(CarSessionController *)self setRoutePlanningSession:v6];

  id v7 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [(CarSessionController *)self setNavigationSession:v9];
  id v12 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v12;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  [(CarSessionController *)self setRouteGeniusSession:v11];
  if (v12) {
    -[CarSessionController mapsSession:didChangeState:](self, "mapsSession:didChangeState:", v12, [v12 sessionState]);
  }
}

- (void)_handleTransportType:(int64_t)a3
{
  id v4 = sub_100577ECC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v5 = @"Undefined";
    }
    else {
      CFStringRef v5 = off_1012F94E8[a3 - 1];
    }
    int v8 = 138412290;
    CFStringRef v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_handleTransportType: %@", (uint8_t *)&v8, 0xCu);
  }

  if (a3)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    if (a3 == 1)
    {
      [v6 dismissCurrentInterruptionOfKind:8];
    }
    else
    {
      id v7 = CarInterruptionUserInfoWithMSPTransportType(a3);
      [v6 interruptApplicationWithKind:8 userInfo:v7 completionHandler:0];
    }
  }
}

- (void)setRoutePlanningSession:(id)a3
{
  CFStringRef v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    id v7 = v5;
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
    CFStringRef v5 = v7;
  }
}

- (void)setNavigationSession:(id)a3
{
  CFStringRef v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    id v7 = v5;
    [(NavigationSession *)navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
    CFStringRef v5 = v7;
  }
}

- (void)setRouteGeniusSession:(id)a3
{
  CFStringRef v5 = (RouteGeniusSession *)a3;
  routeGeniusSession = self->_routeGeniusSession;
  if (routeGeniusSession != v5)
  {
    id v7 = v5;
    [(RouteGeniusSession *)routeGeniusSession removeObserver:self];
    objc_storeStrong((id *)&self->_routeGeniusSession, a3);
    [(RouteGeniusSession *)self->_routeGeniusSession addObserver:self];
    CFStringRef v5 = v7;
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100577ECC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = (void *)v9;
    CFStringRef v11 = @"NotStarted";
    if (a4 == 1) {
      CFStringRef v11 = @"Running";
    }
    if (a4 == 2) {
      CFStringRef v11 = @"Suspended";
    }
    int v30 = 138412546;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    CFStringRef v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "mapsSession:didChangeState: class: %@, state: %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v12 = [(CarSessionController *)self navigationSession];
  if (!v12) {
    goto LABEL_12;
  }
  id v13 = (void *)v12;
  id v14 = v6;
  objc_opt_class();
  id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
  id v16 = v15;

  id v17 = [(CarSessionController *)self navigationSession];

  if (v16 == v17)
  {
    [(CarSessionController *)self _navigationSessionDidChangeState:a4];
  }
  else
  {
LABEL_12:
    uint64_t v18 = [(CarSessionController *)self routePlanningSession];
    if (!v18) {
      goto LABEL_17;
    }
    v19 = (void *)v18;
    id v20 = v6;
    objc_opt_class();
    id v21 = (objc_opt_isKindOfClass() & 1) != 0 ? v20 : 0;
    id v22 = v21;

    id v23 = [(CarSessionController *)self routePlanningSession];

    if (v22 == v23)
    {
      [(CarSessionController *)self _routePlanningSessionDidChangeState:a4];
    }
    else
    {
LABEL_17:
      uint64_t v24 = [(CarSessionController *)self routeGeniusSession];
      if (v24)
      {
        char v25 = (void *)v24;
        id v26 = v6;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v27 = v26;
        }
        else {
          char v27 = 0;
        }
        id v28 = v27;

        id v29 = [(CarSessionController *)self routeGeniusSession];

        if (v28 == v29) {
          [(CarSessionController *)self _routeGeniusSessionDidChangeState:a4];
        }
      }
    }
  }
}

- (void)_navigationSessionDidChangeState:(unint64_t)a3
{
  if (a3 == 2)
  {
    [(CarSessionController *)self _stopNavigation];
  }
  else if (a3 == 1)
  {
    -[CarSessionController _startNavigatingAnimated:](self, "_startNavigatingAnimated:");
  }
}

- (void)_startNavigatingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CarSessionController *)self navigationSession];
  CFStringRef v5 = [v4 currentRouteCollection];
  id v6 = [v5 currentRoute];

  id v7 = [v6 origin];
  int v8 = [v7 geoMapItem];

  uint64_t v9 = [v6 destination];
  id v10 = [v9 geoMapItem];

  if (![v6 isMultipointRoute] && v8 && v10 && GEOConfigGetBOOL())
  {
    CFStringRef v11 = +[MapsSuggestionsPredictor sharedPredictor];
    [v11 captureActualTransportationMode:0 originMapItem:v8 destinationMapItem:v10];
  }
  uint64_t v12 = sub_100577ECC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = @"NO";
    if (v3) {
      id v13 = @"YES";
    }
    id v14 = v13;
    int v21 = 138412290;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Navigation will launch animated=%@", (uint8_t *)&v21, 0xCu);
  }
  id v15 = +[CarDisplayController sharedInstance];
  id v16 = [v15 isCurrentlyConnectedToCarAppScene];
  id v17 = +[MNNavigationService sharedService];
  [v17 setIsConnectedToCarplay:v16];

  uint64_t v18 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  [v18 setIsConnectedToCarplay:v16];

  v19 = +[CarChromeModeCoordinator sharedInstance];
  id v20 = v19;
  if (v3) {
    [v19 displayNavigation];
  }
  else {
    [v19 launchIntoNavigation];
  }

  [v15 _carSessionController_updateNavigationHostingState];
}

- (void)_stopNavigation
{
  BOOL v3 = sub_100577ECC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Navigation will stop running", v13, 2u);
  }

  id v4 = +[CarChromeModeCoordinator sharedInstance];
  [v4 endNavigation];

  CFStringRef v5 = +[CarDisplayController sharedInstance];
  [v5 _carSessionController_updateNavigationHostingState];

  id v6 = [(CarSessionController *)self navigationEndedHandler];

  if (v6)
  {
    id v7 = (void (**)(void, void))objc_retainBlock(self->_navigationEndedHandler);
    [(CarSessionController *)self setNavigationEndedHandler:0];
    v7[2](v7, 1);
  }
  else
  {
    int v8 = +[MNNavigationService sharedService];
    unsigned int v9 = [v8 isDetour];

    if (!v9) {
      return;
    }
    id v7 = +[CarChromeModeCoordinator sharedInstance];
    id v10 = +[MNNavigationService sharedService];
    CFStringRef v11 = [v10 originalDestination];
    CFStringRef v14 = @"isOriginalDestination";
    id v15 = &__kCFBooleanTrue;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v7 displayRoutePlanningForDestination:v11 userInfo:v12];
  }
}

- (void)endNavigationIfNeededWithPrompt:(BOOL)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  [(CarSessionController *)self setNavigationEndedHandler:0];
  id v7 = [(CarSessionController *)self navigationSession];

  if (v7)
  {
    if (a3)
    {
      objc_initWeak(location, self);
      int v8 = sub_100577ECC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CarSessionController : Will prompt kMapsInterruptionMaybeEndNavigation", buf, 2u);
      }

      unsigned int v9 = +[UIApplication sharedMapsDelegate];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1007E009C;
      v11[3] = &unk_1012F94C8;
      objc_copyWeak(&v13, location);
      id v12 = v6;
      [v9 interruptApplicationWithKind:7 userInfo:0 completionHandler:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    else
    {
      id v10 = sub_100577ECC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CarSessionController : Will not kMapsInterruptionMaybeEndNavigation, ending navigation and performing block immediately", (uint8_t *)location, 2u);
      }

      [(CarSessionController *)self _promptToEndNavigationAccepted:v6];
    }
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

- (void)_promptToEndNavigationAccepted:(id)a3
{
  id v9 = a3;
  id v4 = +[MNNavigationService sharedService];
  unsigned int v5 = [v4 isInNavigatingState];

  if (v5)
  {
    id v6 = [v9 copy];
    id navigationEndedHandler = self->_navigationEndedHandler;
    self->_id navigationEndedHandler = v6;

    int v8 = +[MNNavigationService sharedService];
    [v8 stopNavigationWithReason:2];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5 = a3;
  id v6 = [(CarSessionController *)self navigationSession];

  if (v6 == v5)
  {
    id v8 = [(CarSessionController *)self navigationSession];
    -[CarSessionController _handleTransportType:](self, "_handleTransportType:", [v8 currentTransportType]);
  }
  else
  {
    id v7 = sub_100577ECC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Navigation session didUpdateRouteCollection:, but currentSession is not navigation.", buf, 2u);
    }
  }
}

- (void)navigationServicePredictingDidArrive:(id)a3
{
  id v3 = [(CarSessionController *)self platformController];
  [v3 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 arrivalState] && objc_msgSend(v6, "arrivalState") != (id)-1)
  {
    id v7 = sub_100577ECC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarSessionController: didUpdateArrivalInfo: %@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [v5 route];
    unsigned int v9 = [v8 isLegIndexOfLastLeg:[v6 legIndex]];

    if (v9)
    {
      id v10 = +[CarChromeModeCoordinator sharedInstance];
      [v10 displayNavigation];
    }
  }
}

- (void)_routePlanningSessionDidChangeState:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (!GEOConfigGetBOOL()) {
      return;
    }
    id v8 = +[MapsSuggestionsPredictor sharedPredictor];
    [v8 cancelCapturingAnalytics];
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    if (GEOConfigGetBOOL())
    {
      id v4 = +[MapsSuggestionsPredictor sharedPredictor];
      [v4 capturePredictedTransportationMode:0];
    }
    id v5 = [(CarSessionController *)self routePlanningSession];
    id v6 = [v5 sessionInitiator];

    if (v6 != (id)2)
    {
      id v7 = +[CarChromeModeCoordinator sharedInstance];
      [v7 displayRoutePlanningForExistingRoute];
    }
    id v8 = [(CarSessionController *)self routePlanningSession];
    -[CarSessionController _handleTransportType:](self, "_handleTransportType:", [v8 currentTransportType]);
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = sub_100577ECC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 4) {
      CFStringRef v9 = @"Undefined";
    }
    else {
      CFStringRef v9 = off_1012F94E8[a4 - 1];
    }
    int v10 = 138412546;
    CFStringRef v11 = v9;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "routePlanningSession:didChangeCurrentTransportType %@ userInitiated:%d", (uint8_t *)&v10, 0x12u);
  }

  [(CarSessionController *)self _handleTransportType:a4];
}

- (void)_routeGeniusSessionDidChangeState:(unint64_t)a3
{
  id v4 = sub_100577ECC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"NotStarted";
    if (a3 == 1) {
      CFStringRef v5 = @"Running";
    }
    if (a3 == 2) {
      CFStringRef v5 = @"Suspended";
    }
    int v9 = 138412290;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_routeGeniusSessionDidChangeState: %@", (uint8_t *)&v9, 0xCu);
  }

  if (a3 == 2)
  {
    if (GEOConfigGetBOOL())
    {
      id v8 = +[MapsSuggestionsPredictor sharedPredictor];
      [v8 cancelCapturingAnalytics];
    }
    id v7 = +[CarChromeModeCoordinator sharedInstance];
    [v7 endRouteGenius];
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    if (GEOConfigGetBOOL())
    {
      id v6 = +[MapsSuggestionsPredictor sharedPredictor];
      [v6 capturePredictedTransportationMode:0];
    }
    id v7 = +[CarChromeModeCoordinator sharedInstance];
    [v7 displayRouteGenius];
  }
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __int16 v12 = sub_100577ECC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "didUpdateRouteGenius with nil entry, will pop RG session.", v17, 2u);
    }

    CFStringRef v11 = [(CarSessionController *)self platformController];
    [(RouteGeniusSession *)v11 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];
    goto LABEL_12;
  }
  CFStringRef v5 = [(CarSessionController *)self platformController];
  id v6 = [v5 sessionStack];
  id v7 = [v6 count];

  if (!v7)
  {
    BOOL v13 = sub_100577ECC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "RG: pushing routeGeniusSession on platform sessionStack.", v15, 2u);
    }

    CFStringRef v11 = objc_alloc_init(RouteGeniusSession);
    CFStringRef v14 = [(CarSessionController *)self platformController];
    [v14 pushSession:v11];

    goto LABEL_12;
  }
  id v8 = [(CarSessionController *)self platformController];
  int v9 = [v8 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    sub_100577ECC();
    CFStringRef v11 = (RouteGeniusSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_ERROR, "didUpdateRouteGenius, but the platform controller is in an invalid state.", buf, 2u);
    }
LABEL_12:
  }
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (RouteGeniusSession)routeGeniusSession
{
  return self->_routeGeniusSession;
}

- (id)navigationEndedHandler
{
  return self->_navigationEndedHandler;
}

- (void)setNavigationEndedHandler:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_navigationEndedHandler, 0);
  objc_storeStrong((id *)&self->_routeGeniusSession, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);

  objc_storeStrong((id *)&self->_navigationSession, 0);
}

@end