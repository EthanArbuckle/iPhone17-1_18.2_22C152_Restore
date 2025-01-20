@interface RAPNavigationTracker
- (BOOL)canPresentRapFeedbackView;
- (BOOL)isShowingDirections;
- (GEOComposedRoute)activeComposedRoute;
- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan;
- (RAPDisplayedRouteState)currentDirections;
- (RAPNavigationTracker)initWithPlatformController:(id)a3;
- (id)rapAppStateForCurrentNavigation;
- (void)_createRapAppStateWithCompletion:(id)a3;
- (void)_reset;
- (void)_updateWithRunningNavigation:(BOOL)a3;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
@end

@implementation RAPNavigationTracker

- (RAPNavigationTracker)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RAPNavigationTracker;
  v5 = [(RAPNavigationTracker *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = +[MNNavigationService sharedService];
    [v7 registerObserver:v6];

    v8 = sub_10057670C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Creating new RAPNavigationTracker.", v11, 2u);
    }

    v9 = +[MNNavigationService sharedService];
    -[RAPNavigationTracker _updateWithRunningNavigation:](v6, "_updateWithRunningNavigation:", [v9 isInNavigatingState]);
  }
  return v6;
}

- (void)_updateWithRunningNavigation:(BOOL)a3
{
  if (self->_isShowingDirections != a3)
  {
    BOOL v3 = a3;
    v5 = sub_10057670C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v3) {
        v6 = @"YES";
      }
      else {
        v6 = @"NO";
      }
      v7 = v6;
      if (self->_isShowingDirections) {
        v8 = @"YES";
      }
      else {
        v8 = @"NO";
      }
      v9 = v8;
      int v12 = 138412546;
      v13 = v7;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tracker _updateWithRunningNavigation: %@, currently running navigation: %@", (uint8_t *)&v12, 0x16u);
    }
    [(RAPNavigationTracker *)self _reset];
    self->_isShowingDirections = v3;
    if (v3)
    {
      v10 = sub_10057670C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Tracker _updateWithRunningNavigation: will try to capture recording", (uint8_t *)&v12, 2u);
      }

      self->_latestNavigationStartedDate = CFAbsoluteTimeGetCurrent();
      v11 = +[MNNavigationService sharedService];
      self->_latestNavigationIsDetour = [v11 isDetour];

      [(RAPNavigationTracker *)self _createRapAppStateWithCompletion:0];
    }
  }
}

- (void)_createRapAppStateWithCompletion:(id)a3
{
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100444C8C;
  v53[3] = &unk_1012E78F0;
  id v28 = a3;
  id v54 = v28;
  v31 = objc_retainBlock(v53);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v30 = [WeakRetained chromeViewController];
  if (!WeakRetained || !v30)
  {
    __int16 v14 = sub_10057670C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Tracker won't create RAP state because either platformController or chrome is missing.", buf, 2u);
    }

    ((void (*)(void *, const __CFString *))v31[2])(v31, @"Tracker was in invalid configuration and couldn't create app state.");
    goto LABEL_29;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  BOOL v3 = [WeakRetained sessionStack];
  id v4 = [v3 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v4)
  {

    id v5 = 0;
    id v33 = 0;
    goto LABEL_25;
  }
  id v33 = 0;
  id v5 = 0;
  uint64_t v6 = *(void *)v50;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v50 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v33;
        id v33 = v8;
        id v10 = v5;
      }
      else
      {
        objc_opt_class();
        v9 = v5;
        id v10 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
      }
      id v11 = v8;

      id v5 = v10;
    }
    id v4 = [v3 countByEnumeratingWithState:&v49 objects:v55 count:16];
  }
  while (v4);

  if (!v5 || !v33)
  {
LABEL_25:
    v15 = sub_10057670C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tracker won't create RAP state because we are not currently navigating", buf, 2u);
    }
    goto LABEL_27;
  }
  unint64_t v12 = (unint64_t)[v5 currentTransportType];
  if (v12 <= 4 && ((1 << v12) & 0x19) != 0)
  {
    v13 = sub_10057670C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Tracker won't create RAP state because this is not a supported transport type", buf, 2u);
    }

    ((void (*)(void *, const __CFString *))v31[2])(v31, @"Can't create directions RAP for transit.");
    goto LABEL_28;
  }
  v16 = [v5 currentRouteCollection:v28];
  if (!v16)
  {
    v16 = [v33 currentRouteCollection];
    if (!v16)
    {
      v15 = sub_10057670C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tracker can't create RAP state because we don't have a valid route collection", buf, 2u);
      }
LABEL_27:

      ((void (*)(void *, const __CFString *))v31[2])(v31, @"Tracker was in invalid configuration and couldn't create app state.");
      goto LABEL_28;
    }
  }
  v17 = [v33 reportAProblemRecorder];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    v27 = sub_10057670C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Tracker can't create RAP because the RP session doesn't have a recorder", buf, 2u);
    }

    ((void (*)(void *, const __CFString *))v31[2])(v31, @"Tracker was in invalid configuration and couldn't create app state.");
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v48 = 0;
    v19 = +[GEOUserSession sharedInstance];
    id v45 = [v19 navSessionID];
    uint64_t v46 = v20;

    if ((GEOSessionIDEquals() & 1) == 0)
    {
      v21 = [v33 reportAProblemRecorder];
      [v21 recordNewSessionID:v45, v46];
    }
    v22 = [v16 currentRoute];
    v23 = [v22 geoWaypointRoute];
    unsigned int v24 = [v23 identifier];

    objc_initWeak(&location, self);
    v25 = [v33 reportAProblemRecorder];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100444D98;
    v34[3] = &unk_1012EA6A0;
    objc_copyWeak(&v42, &location);
    id v40 = v28;
    unsigned int v43 = v24;
    v41 = v31;
    id v26 = v16;
    id v35 = v26;
    id v5 = v5;
    id v36 = v5;
    v37 = self;
    id v33 = v33;
    id v38 = v33;
    id v39 = v30;
    [v25 savePartialRecordingWithCompletion:v34];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
LABEL_28:

LABEL_29:
}

- (void)_reset
{
  self->_latestNavigationStartedDate = 0.0;
  self->_latestNavigationIsDetour = 0;
  activeComposedRoute = self->_activeComposedRoute;
  self->_activeComposedRoute = 0;

  currentDirections = self->_currentDirections;
  self->_currentDirections = 0;

  displayedDirectionsPlan = self->_displayedDirectionsPlan;
  self->_displayedDirectionsPlan = 0;

  self->_isShowingDirections = 0;
  appState = self->_appState;
  self->_appState = 0;
}

- (BOOL)canPresentRapFeedbackView
{
  BOOL v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v4 = [v3 isUsingOfflineMaps];

  if ((v4 & 1) == 0)
  {
    if (!_MKRAPIsAvailable() || sub_100521BD0())
    {
      uint64_t v6 = sub_10057670C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        CFStringRef v25 = @"NO";
        v7 = "shouldDisplayAfterNavigationFeedbackFlow returned NO -> isRAPAvailable: %@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v24, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    int v8 = sub_100525D78();
    if (v8 && !self->_latestNavigationIsDetour)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      GEOConfigGetDouble();
      double v16 = v15;
      if (Current < v15 + self->_latestNavigationStartedDate)
      {
        uint64_t v6 = sub_10057670C();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
        int v24 = 134217984;
        CFStringRef v25 = (const __CFString *)(uint64_t)v16;
        v7 = "shouldDisplayAfterNavigationFeedbackFlow returned NO -> required delay of: %ld hasn't passed since nav started";
        goto LABEL_7;
      }
      if (self->_displayedDirectionsPlan && self->_activeComposedRoute && self->_currentDirections && self->_appState)
      {
        uint64_t v6 = sub_10057670C();
        BOOL v5 = 1;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned YES -> All requirements met", (uint8_t *)&v24, 2u);
        }
        goto LABEL_20;
      }
      uint64_t v6 = sub_10057670C();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_19:
        BOOL v5 = 0;
LABEL_20:

        return v5;
      }
      if (self->_displayedDirectionsPlan) {
        v17 = @"NO";
      }
      else {
        v17 = @"YES";
      }
      id v10 = v17;
      if (self->_activeComposedRoute) {
        BOOL v18 = @"NO";
      }
      else {
        BOOL v18 = @"YES";
      }
      v19 = v18;
      if (self->_currentDirections) {
        uint64_t v20 = @"NO";
      }
      else {
        uint64_t v20 = @"YES";
      }
      v21 = v20;
      if (self->_appState) {
        v22 = @"NO";
      }
      else {
        v22 = @"YES";
      }
      v23 = v22;
      int v24 = 138413058;
      CFStringRef v25 = v10;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned NO -> a required property was nil. _displayedDirectionsPlan: %@, _activeComposedRoute: %@, _currentDirections: %@, _appState: %@", (uint8_t *)&v24, 0x2Au);
    }
    else
    {
      uint64_t v6 = sub_10057670C();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      if (v8) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      id v10 = v9;
      if (self->_latestNavigationIsDetour) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      unint64_t v12 = v11;
      int v24 = 138412546;
      CFStringRef v25 = v10;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned NO -> isAfterNavigationFlowAvailable: %@, _latestNavigationIsDetour: %@", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_19;
  }
  return 0;
}

- (id)rapAppStateForCurrentNavigation
{
  return self->_appState;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v6 = sub_10057670C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = MNNavigationServiceStateAsString();
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Tracker: navigationService is now in state: %@", (uint8_t *)&v8, 0xCu);
  }
  [(RAPNavigationTracker *)self _updateWithRunningNavigation:MNNavigationServiceStateChangedToNavigating()];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  self->_latestNavigationIsDetour = [a3 isDetour];
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (GEOComposedRoute)activeComposedRoute
{
  return self->_activeComposedRoute;
}

- (RAPDisplayedRouteState)currentDirections
{
  return self->_currentDirections;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  return self->_displayedDirectionsPlan;
}

- (BOOL)isShowingDirections
{
  return self->_isShowingDirections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_displayedDirectionsPlan, 0);
  objc_storeStrong((id *)&self->_currentDirections, 0);
  objc_storeStrong((id *)&self->_activeComposedRoute, 0);

  objc_destroyWeak((id *)&self->_platformController);
}

@end