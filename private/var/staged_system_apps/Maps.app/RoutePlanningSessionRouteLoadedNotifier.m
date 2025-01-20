@interface RoutePlanningSessionRouteLoadedNotifier
+ (id)_createAndSaveHistoryEntryFromSession:(id)a3 selectedRoute:(id)a4;
+ (int64_t)creationPreference;
- (HistoryEntryRecentsItem)currentRouteHistoryEntry;
- (RoutePlanningSession)observedRoutePlanningSession;
- (RoutePlanningSessionRouteLoadedNotifier)initWithPlatformController:(id)a3 handler:(id)a4;
- (id)handler;
- (void)_createAndSaveHistoryEntryFromOutgoingSession:(id)a3;
- (void)_createAndSaveHistoryEntryFromUpdatedSession:(id)a3;
- (void)_updateCurrentRouteHistoryEntryFromSession:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setCurrentRouteHistoryEntry:(id)a3;
- (void)setHandler:(id)a3;
- (void)setObservedRoutePlanningSession:(id)a3;
@end

@implementation RoutePlanningSessionRouteLoadedNotifier

- (void)setObservedRoutePlanningSession:(id)a3
{
  v5 = (RoutePlanningSession *)a3;
  v6 = v5;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    if (!v5 && observedRoutePlanningSession) {
      -[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromOutgoingSession:](self, "_createAndSaveHistoryEntryFromOutgoingSession:");
    }
    v8 = sub_100109EA4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_observedRoutePlanningSession;
      int v12 = 138412546;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setObservedRoutePlanningSession from: %@ to %@", (uint8_t *)&v12, 0x16u);
    }

    [self->_observedRoutePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    [self->_observedRoutePlanningSession addObserver:self];
    v10 = [self->_observedRoutePlanningSession currentRouteCollection];

    if (v10)
    {
      v11 = sub_100109EA4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "observedRoutePlanningSession has a loaded routeCollection. Will proceed to saving a history entry.", (uint8_t *)&v12, 2u);
      }

      [(RoutePlanningSessionRouteLoadedNotifier *)self _updateCurrentRouteHistoryEntryFromSession:self->_observedRoutePlanningSession];
    }
  }
}

- (RoutePlanningSessionRouteLoadedNotifier)initWithPlatformController:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[RoutePlanningSessionRouteLoadedNotifier initWithPlatformController:handler:]";
      __int16 v23 = 2080;
      v24 = "RoutePlanningSessionRouteLoadedNotifier.m";
      __int16 v25 = 1024;
      int v26 = 38;
      __int16 v27 = 2080;
      v28 = "handler != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)RoutePlanningSessionRouteLoadedNotifier;
  v8 = [(RoutePlanningSessionRouteLoadedNotifier *)&v20 init];
  if (v8)
  {
    id v9 = [v7 copy];
    id handler = v8->_handler;
    v8->_id handler = v9;

    v11 = [v6 sessionStack];
    int v12 = sub_1000AC254(v11, &stru_1013133C8);
    v13 = [v12 firstObject];
    [(RoutePlanningSessionRouteLoadedNotifier *)v8 setObservedRoutePlanningSession:v13];

    __int16 v14 = sub_100109EA4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [(RoutePlanningSessionRouteLoadedNotifier *)v8 observedRoutePlanningSession];
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Initiated a loader notifier with current routePlanningSession: %@", buf, 0xCu);
    }
  }

  return v8;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(RoutePlanningSessionRouteLoadedNotifier *)self setObservedRoutePlanningSession:v7];
}

- (void)setCurrentRouteHistoryEntry:(id)a3
{
  v5 = (HistoryEntryRecentsItem *)a3;
  if (self->_currentRouteHistoryEntry != v5)
  {
    id v6 = sub_100109EA4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      currentRouteHistoryEntry = self->_currentRouteHistoryEntry;
      int v16 = 138412546;
      v17 = currentRouteHistoryEntry;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will update currentRouteHistoryEntry from: %@ to %@", (uint8_t *)&v16, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentRouteHistoryEntry, a3);
    id v8 = sub_100109EA4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [self->_observedRoutePlanningSession configuration];
      v10 = [v9 originalHistoryEntryIdentifier];
      v11 = [(HistoryEntryRecentsItem *)v5 historyEntry];
      int v12 = [v11 storageIdentifier];
      int v16 = 138412546;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will update session originalHistoryEntryIdentifier from %@ to %@", (uint8_t *)&v16, 0x16u);
    }
    v13 = [(HistoryEntryRecentsItem *)v5 historyEntry];
    __int16 v14 = [v13 storageIdentifier];
    v15 = [self->_observedRoutePlanningSession configuration];
    [v15 setOriginalHistoryEntryIdentifier:v14];
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7 = a3;
  id v8 = [v7 routeCollectionForTransportType:a4];

  if (v8)
  {
    id v9 = sub_100109EA4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "routePlanningSession:didChangeCurrentTransportType will save updated session: %@", (uint8_t *)&v10, 0xCu);
    }

    [(RoutePlanningSessionRouteLoadedNotifier *)self _createAndSaveHistoryEntryFromUpdatedSession:v7];
  }
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = (char *)a3;
  id v9 = a4;
  int v10 = [(RoutePlanningSessionRouteLoadedNotifier *)self observedRoutePlanningSession];

  if (v10 != v8)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315906;
      v19 = "-[RoutePlanningSessionRouteLoadedNotifier routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
      __int16 v20 = 2080;
      v21 = "RoutePlanningSessionRouteLoadedNotifier.m";
      __int16 v22 = 1024;
      int v23 = 118;
      __int16 v24 = 2080;
      __int16 v25 = "session == self.observedRoutePlanningSession";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  if ([v8 currentTransportType] == (id)a5)
  {
    unsigned int v11 = [v9 isSuccess];
    int v12 = sub_100109EA4();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "didUpdateRouteCollectionResult was successful, will create a resume item with session: %@", (uint8_t *)&v18, 0xCu);
      }

      [(RoutePlanningSessionRouteLoadedNotifier *)self _createAndSaveHistoryEntryFromUpdatedSession:v8];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "didUpdateRouteCollectionResult but it was not successful, will not create a resume item. session: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    __int16 v14 = [(RoutePlanningSessionRouteLoadedNotifier *)self handler];
    ((void (**)(void, id))v14)[2](v14, v9);
  }
}

+ (id)_createAndSaveHistoryEntryFromSession:(id)a3 selectedRoute:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 routeCollectionForTransportType:[v5 currentTransportType]];
  id v8 = v7;
  if (v6)
  {
    id v9 = v6;
LABEL_4:
    int v10 = sub_100109EA4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [v5 configuration];
      int v12 = [v11 originalHistoryEntryIdentifier];
      int v51 = 138412290;
      v52 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Saving route as recent using identifier: %@", (uint8_t *)&v51, 0xCu);
    }
    v13 = [v5 configuration];
    __int16 v14 = [v13 originalHistoryEntryIdentifier];
    v15 = +[HistoryEntryRecentsItem saveRoute:v9 withOriginalHistoryIdentifier:v14 editBlock:0 completionBlock:&stru_1013133E8];

    int v16 = sub_100109EA4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v51 = 138412546;
      v52 = v15;
      __int16 v53 = 2112;
      v54 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Created a historyRecentsItem: %@ from session: %@", (uint8_t *)&v51, 0x16u);
    }

    if (v15)
    {
      v17 = [v5 configuration];
      int v18 = [v17 originalHistoryEntryIdentifier];

      if (!v18)
      {
        v19 = [v15 historyEntry];
        __int16 v20 = [v19 storageIdentifier];
        v21 = [v5 configuration];
        [v21 setOriginalHistoryEntryIdentifier:v20];
      }
      __int16 v22 = [v5 reportAProblemRecorder];
      [v22 clearAll];

      unint64_t v23 = (unint64_t)[v5 currentTransportType];
      if (v23 > 4 || ((1 << v23) & 0x19) == 0)
      {
        __int16 v24 = [v15 historyEntry];
        __int16 v25 = [v24 storageIdentifier];
        int v26 = [v5 reportAProblemRecorder];
        [v26 setHistoryItemIdentifier:v25];

        __int16 v27 = [v5 reportAProblemRecorder];
        v28 = [v9 routeInitializerData];
        v29 = [v28 directionsRequest];
        [v27 recordNewRequest:v29];

        v30 = [v5 reportAProblemRecorder];
        v31 = [v9 routeInitializerData];
        v32 = [v31 directionsResponse];
        [v30 recordNewResponse:v32];

        v33 = [v5 reportAProblemRecorder];
        [v33 recordNewRoute:v9];

        v34 = [v5 reportAProblemRecorder];
        uint64_t v35 = [v8 routes];
        [v34 setSelectedRoute:v9 fromRouteList:v35];

        v36 = [v5 resolvedWaypoints];
        LOBYTE(v35) = [v36 areAllValidWaypoints];

        if ((v35 & 1) == 0)
        {
          v37 = sub_10057670C();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v51) = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Found NSNulls in resolved waypoints.", (uint8_t *)&v51, 2u);
          }
        }
        v38 = [v5 resolvedWaypoints];
        v39 = [v38 waypointsOrNull];
        v40 = sub_1000AC254(v39, &stru_101313408);

        v41 = [v5 reportAProblemRecorder];
        [v41 recordWaypoints:v40 startWaypointSearchTicket:0 endWaypointSearchTicket:0];

        v42 = [v5 reportAProblemRecorder];
        [v42 setOriginatingDeviceFromOrigin:0];
      }
      v43 = v15;
    }
    else
    {
      v44 = sub_100109EA4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v51) = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Cannot save RAP history with because we failed to construct historyEntry.", (uint8_t *)&v51, 2u);
      }
    }
    goto LABEL_23;
  }
  id v9 = [v7 currentRoute];
  if (v9) {
    goto LABEL_4;
  }
  v46 = [v5 configuration];
  unsigned __int8 v47 = [v46 isNavigationTracePlayback];

  if ((v47 & 1) == 0)
  {
    v48 = sub_1005762E4();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      int v51 = 136315906;
      v52 = "+[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromSession:selectedRoute:]";
      __int16 v53 = 2080;
      v54 = "RoutePlanningSessionRouteLoadedNotifier.m";
      __int16 v55 = 1024;
      int v56 = 156;
      __int16 v57 = 2080;
      v58 = "composedRoute != nil || session.configuration.isNavigationTracePlayback";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v49 = sub_1005762E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = +[NSThread callStackSymbols];
        int v51 = 138412290;
        v52 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);
      }
    }
  }
  id v9 = sub_100109EA4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v51) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot save RAP history with a nil route.", (uint8_t *)&v51, 2u);
  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (void)_updateCurrentRouteHistoryEntryFromSession:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _createAndSaveHistoryEntryFromSession:v4 selectedRoute:0];

  [(RoutePlanningSessionRouteLoadedNotifier *)self setCurrentRouteHistoryEntry:v5];
}

- (void)_createAndSaveHistoryEntryFromUpdatedSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 routeCollectionForTransportType:[v4 currentTransportType]];
  id v6 = [v5 currentRoute];
  id v7 = [v6 waypoints];
  id v8 = [v7 count];

  id v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  unsigned int v11 = sub_100109EA4();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10 == (id)5 && (unint64_t)v8 <= 2)
  {
    if (v12)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromUpdatedSession nonMPR on macOS, ignoring", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    if (v12)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromUpdatedSession will create and save route from session: %@", (uint8_t *)&v13, 0xCu);
    }

    [(RoutePlanningSessionRouteLoadedNotifier *)self _updateCurrentRouteHistoryEntryFromSession:v4];
  }
}

- (void)_createAndSaveHistoryEntryFromOutgoingSession:(id)a3
{
  id v4 = a3;
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5)
  {
    id v7 = [v4 routeCollectionForTransportType:[v4 currentTransportType]];
    id v8 = [v7 currentRoute];
    id v9 = sub_100109EA4();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession will create and save route", buf, 2u);
      }

      [(RoutePlanningSessionRouteLoadedNotifier *)self _updateCurrentRouteHistoryEntryFromSession:v4];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)unsigned int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession does not have currentRoute. Ignoring", v11, 2u);
      }
    }
  }
  else
  {
    id v7 = sub_100109EA4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession not on macOS, ignoring", v13, 2u);
    }
  }
}

- (HistoryEntryRecentsItem)currentRouteHistoryEntry
{
  return self->_currentRouteHistoryEntry;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);

  objc_storeStrong((id *)&self->_currentRouteHistoryEntry, 0);
}

@end