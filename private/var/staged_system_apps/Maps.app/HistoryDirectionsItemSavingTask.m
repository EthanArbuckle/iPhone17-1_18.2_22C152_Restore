@interface HistoryDirectionsItemSavingTask
+ (int64_t)creationPreference;
- (BOOL)_updateEVInfoForHistoryEntry:(id)a3;
- (HistoryDirectionsItemSavingTask)initWithNavigationService:(id)a3 routeInfoProvider:(id)a4 routeInterrupter:(id)a5;
- (id)_currentRouteHandleStorage;
- (id)historyEntryRoute;
- (unint64_t)_routeProgressWaypointIndexForCurrentLegIndex:(unint64_t)a3 inRoute:(id)a4;
- (void)_appWillTerminate:(id)a3;
- (void)_handleArrivalAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)_interruptAndSaveHistoryEntry:(id)a3 completion:(id)a4;
- (void)_launchRouteGeniusIfNeeded;
- (void)_preserveAutosharingContacts:(BOOL)a3 inHistoryEntry:(id)a4 completion:(id)a5;
- (void)_saveCustomRouteToHistory:(id)a3 uuid:(id)a4;
- (void)_saveRouteHistory:(id)a3 withOriginalHistoryIdentifier:(id)a4 arrivalState:(unint64_t)a5;
- (void)_uninterruptHistoryEntry:(id)a3 completion:(id)a4;
- (void)_updateHistoryEntry:(id)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateResumeRouteHandle:(id)a4;
- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4;
@end

@implementation HistoryDirectionsItemSavingTask

- (HistoryDirectionsItemSavingTask)initWithNavigationService:(id)a3 routeInfoProvider:(id)a4 routeInterrupter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HistoryDirectionsItemSavingTask;
  v12 = [(HistoryDirectionsItemSavingTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_navigationService, a3);
    [(MNNavigationService *)v13->_navigationService registerObserver:v13];
    objc_storeStrong((id *)&v13->_routeInfoProvider, a4);
    objc_storeStrong((id *)&v13->_routeInterrupter, a5);
    v14 = +[MSPSharedTripService sharedInstance];
    [v14 addSendingObserver:v13];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v13 selector:"_appWillTerminate:" name:UIApplicationWillTerminateNotification object:0];
  }
  return v13;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = +[MSPSharedTripService sharedInstance];
  [v3 removeSendingObserver:self];

  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)HistoryDirectionsItemSavingTask;
  [(HistoryDirectionsItemSavingTask *)&v4 dealloc];
}

- (id)historyEntryRoute
{
  return [(NavigationRouteHistoryInfoProviding *)self->_routeInfoProvider historyEntryRoute];
}

- (void)_preserveAutosharingContacts:(BOOL)a3 inHistoryEntry:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (v8)
  {
    if (v6)
    {
      id v10 = [(NavigationRouteHistoryInfoProviding *)self->_routeInfoProvider archivedTripSharingState];
    }
    else
    {
      id v10 = 0;
    }
    v12 = sub_100464444();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        v13 = "Will archive";
      }
      else {
        v13 = "Will clear";
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v15 = @"NO";
      if (isKindOfClass) {
        v15 = @"YES";
      }
      v16 = v15;
      *(_DWORD *)buf = 136315650;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2048;
      id v24 = [v10 length];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_preserveAutosharingContacts: %s autosharing: sharing data: %@ (%lu)", buf, 0x20u);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100464498;
    v17[3] = &unk_1012E76C0;
    v18 = v9;
    [v8 setSharedETAData:v10 completion:v17];
  }
  else
  {
    id v11 = sub_100464444();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "_preserveAutosharingContacts: We don't have an entry to update autosharing", buf, 2u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (BOOL)_updateEVInfoForHistoryEntry:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[MNNavigationService sharedService];
  v5 = [v4 route];

  BOOL v6 = +[MNNavigationService sharedService];
  v7 = [v6 upcomingStop];

  if ([v5 isEVRoute])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  id v9 = [v3 requiredCharge];
  if (v9)
  {
    id v10 = [v3 vehicleIdentifier];
    int v11 = v10 != 0;
  }
  else
  {
    int v11 = 0;
  }

  int v12 = isKindOfClass & 1;
  if (v11 != v12)
  {
    id v13 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    v16 = [v15 chargingInfo];

    if (isKindOfClass)
    {
      [v16 batteryPercentageAfterCharging];
      v18 = +[NSNumber numberWithDouble:v17 / 100.0];
      [v3 setRequiredCharge:v18];

      v19 = +[VGVirtualGarageService sharedService];
      v20 = [v19 activeVehicleIdentifier];
      [v3 setVehicleIdentifier:v20];
    }
    else
    {
      [v3 setRequiredCharge:0];
      [v3 setVehicleIdentifier:0];
    }
    [v3 setType:[v5 isEVRoute]];
  }
  return v11 != v12;
}

- (void)_interruptAndSaveHistoryEntry:(id)a3 completion:(id)a4
{
  BOOL v6 = (NavigationRouteHistoryInfoProviding *)a3;
  id v7 = a4;
  id v8 = sub_100464444();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will pause route with history entry: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    routeInterrupter = self->_routeInterrupter;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10046493C;
    v12[3] = &unk_1012EB188;
    id v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    [(NavigationRouteInterrupting *)routeInterrupter interruptHistoryEntryRoute:v6 withCompletion:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      routeInfoProvider = self->_routeInfoProvider;
      *(_DWORD *)buf = 138412290;
      v16 = routeInfoProvider;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to save historyEntryRoute because entry was nil. _routeInfoProvider: %@", buf, 0xCu);
    }
  }
}

- (void)_uninterruptHistoryEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100464444();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will un-pause route with history entry: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  routeInterrupter = self->_routeInterrupter;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100464C0C;
  v11[3] = &unk_1012EB188;
  id v10 = v7;
  id v12 = v10;
  objc_copyWeak(&v13, (id *)buf);
  [(NavigationRouteInterrupting *)routeInterrupter cancelInterruptionOnHistoryEntryRoute:v6 completion:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak((id *)buf);
}

- (void)_launchRouteGeniusIfNeeded
{
  if (self->_shouldLaunchRouteGeniusOnEnd)
  {
    [(MNNavigationService *)self->_navigationService state];
    if ((MNNavigationServiceStateIsNavigating() & 1) == 0)
    {
      self->_shouldLaunchRouteGeniusOnEnd = 0;
      id v3 = +[CarDisplayController sharedInstance];
      unsigned __int8 v4 = [v3 isCurrentlyConnectedToAnyCarScene];
      v5 = sub_100464444();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Route paused and connected to CP -> will start route genius", buf, 2u);
        }

        id v7 = [v3 platformController];
        id v8 = [v7 sessionStack];
        id v9 = [v8 count];

        if (v9)
        {
          id v10 = sub_100464444();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Session stack was not empty. clearing it out so that we can present RG.", v13, 2u);
          }

          int v11 = [v3 platformController];
          [v11 clearSessions];
        }
        v5 = [v3 routeGeniusManager];
        id v12 = [v3 chromeViewController];
        [v5 activateIfPossibleForChrome:v12];
      }
      else if (v6)
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "We're not connected to CP so we won't launch RG.", v15, 2u);
      }
    }
  }
}

- (id)_currentRouteHandleStorage
{
  id v3 = [(MNNavigationService *)self->_navigationService resumeRouteHandle];

  if (v3)
  {
    unsigned __int8 v4 = [(MNNavigationService *)self->_navigationService resumeRouteHandle];
    v5 = +[GEOResumeRouteHandle resumeRouteHandleStorageFromResumeRouteHandle:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_appWillTerminate:(id)a3
{
  [(MNNavigationService *)self->_navigationService state];
  if (MNNavigationServiceStateIsNavigating()
    && [(MNNavigationService *)self->_navigationService navigationState] == 7)
  {
    unsigned __int8 v4 = sub_100464444();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "App is terminating with navigation active at the end of segment, will try to update Share ETA contacts and save historyEntry.", buf, 2u);
    }

    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004650CC;
    v9[3] = &unk_1012E66E0;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = v5;
    BOOL v6 = v5;
    id v7 = v10;
    [(HistoryDirectionsItemSavingTask *)self _preserveAutosharingContacts:1 inHistoryEntry:v7 completion:v9];
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v6, v8);
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
  id v10 = v9;
  if (v9
    && ([v9 historyEntry],
        int v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) != 0))
  {
    id v13 = [v10 historyEntry];
    id v14 = [v13 storageIdentifier];

    id v15 = sub_100464444();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      double v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "didReroute: Will save route with ID: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v14 = 0;
  }
  if (((unint64_t)[v8 source] & 0xFFFFFFFFFFFFFFFELL) != 2) {
    -[HistoryDirectionsItemSavingTask _saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:](self, "_saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:", v8, v14, [v7 arrivalState]);
  }
}

- (void)navigationService:(id)a3 didUpdateResumeRouteHandle:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
  id v7 = [(HistoryDirectionsItemSavingTask *)self _currentRouteHandleStorage];
  id v8 = sub_100464444();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v5 resumeRouteHandle];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "navigationService:didUpdateResumeRouteHandle Will update resumeRouteHandle: %@", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004654A0;
  v11[3] = &unk_1012EB010;
  id v12 = v5;
  id v10 = v5;
  [v6 updateResumeRouteHandle:v7 completion:v11];
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v8 = a3;
  unint64_t v9 = a5 + 1;
  id v10 = [v8 route];
  int v11 = [v10 legs];
  id v12 = [v11 count];

  if (v9 < (unint64_t)v12)
  {
    id v13 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
    id v14 = [v13 historyEntry];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100465684;
    v15[3] = &unk_1012EB1B0;
    v15[4] = self;
    unint64_t v17 = v9;
    id v16 = v8;
    [(HistoryDirectionsItemSavingTask *)self _updateHistoryEntry:v14 withBlock:v15];
  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating()) {
    self->_navigationIsEnding = 0;
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    *(_WORD *)&self->_arrivedAtDestination = 0;
    id v7 = [v6 route];
    id v8 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
    unint64_t v9 = v8;
    if (v8
      && ([v8 historyEntry],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = objc_opt_respondsToSelector(),
          v10,
          (v11 & 1) != 0))
    {
      id v12 = [v9 historyEntry];
      id v13 = [v12 storageIdentifier];

      id v14 = sub_100464444();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didChangeFromState: Will save route with ID: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      id v13 = 0;
    }
    -[HistoryDirectionsItemSavingTask _saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:](self, "_saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:", v7, v13, [v6 arrivalState]);
  }
  else
  {
    [(HistoryDirectionsItemSavingTask *)self _launchRouteGeniusIfNeeded];
  }
}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 route];
  id v8 = [v7 legs];
  if ((unint64_t)[v8 count] <= a4)
  {
  }
  else
  {
    unint64_t v9 = [v6 route];
    id v10 = [v9 legs];
    char v11 = [v10 objectAtIndexedSubscript:a4];

    if (v11)
    {
      id v12 = [v11 destination];
      [(HistoryDirectionsItemSavingTask *)self _handleArrivalAtWaypoint:v12 endOfLegIndex:a4];

      goto LABEL_7;
    }
  }
  char v11 = sub_100464444();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 134217984;
    unint64_t v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "navigationService:isApproachingEndOfLeg: received an invalid legIndex: %lu", (uint8_t *)&v13, 0xCu);
  }
LABEL_7:
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)_handleArrivalAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100464444();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v6 shortDescription];
    *(_DWORD *)buf = 136315650;
    v18 = "-[HistoryDirectionsItemSavingTask _handleArrivalAtWaypoint:endOfLegIndex:]";
    __int16 v19 = 2112;
    v20 = v8;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s waypoint: %@ legIndex: %lu", buf, 0x20u);
  }
  unint64_t v9 = +[MNNavigationService sharedService];
  id v10 = [v9 route];
  self->_arrivedAtDestination = [v10 isLegIndexOfLastLeg:a4];

  char v11 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
  id v12 = [v11 historyEntry];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100465D04;
  v14[3] = &unk_1012EB1B0;
  id v15 = v9;
  unint64_t v16 = a4;
  v14[4] = self;
  id v13 = v9;
  [(HistoryDirectionsItemSavingTask *)self _updateHistoryEntry:v12 withBlock:v14];
}

- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4
{
  id v6 = a3;
  self->_navigationIsEnding = 1;
  id v7 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
  id v8 = [v6 route];
  unint64_t v9 = sub_100464444();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v22 = a4;
    if (a4 - 1 > 9) {
      CFStringRef v10 = @"Unknown";
    }
    else {
      CFStringRef v10 = off_1012EB258[a4 - 1];
    }
    if ([v6 isResumingMultipointRoute]) {
      char v11 = @"YES";
    }
    else {
      char v11 = @"NO";
    }
    id v12 = v11;
    if (self->_arrivedAtDestination) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    __int16 v21 = v13;
    if ([v8 isMultipointRoute]) {
      unint64_t v14 = @"YES";
    }
    else {
      unint64_t v14 = @"NO";
    }
    id v15 = v14;
    id v20 = [v6 targetLegIndex];
    unint64_t v16 = [v6 route];
    unint64_t v17 = [v16 legs];
    *(_DWORD *)buf = 138544898;
    CFStringRef v24 = v10;
    __int16 v25 = 2114;
    v26 = v12;
    __int16 v27 = 2114;
    v28 = v21;
    __int16 v29 = 2114;
    v30 = v15;
    __int16 v31 = 2048;
    id v32 = v20;
    __int16 v33 = 2048;
    id v34 = [v17 count];
    __int16 v35 = 2048;
    id v36 = [v6 stepIndex];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Navigation will end with reason: %{public}@ (resumed: %{public}@, arrived: %{public}@, multi-point: %{public}@, target leg: %lu/%lu, step: %lu).", buf, 0x48u);

    a4 = v22;
  }

  if (self->_arrivedAtDestination || !sub_1004640E8(v6, a4))
  {
    __int16 v19 = sub_100464444();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Will not interrupt history for resuming later. Will clear Share ETA contacts and re-save.", buf, 2u);
    }

    [(HistoryDirectionsItemSavingTask *)self _preserveAutosharingContacts:0 inHistoryEntry:v7 completion:0];
    [(HistoryDirectionsItemSavingTask *)self _uninterruptHistoryEntry:v7 completion:0];
  }
  else
  {
    v18 = sub_100464444();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Have not arrived at final destination, will interrupt and save history item to resume later.", buf, 2u);
    }

    [(HistoryDirectionsItemSavingTask *)self _interruptAndSaveHistoryEntry:v7 completion:0];
  }
}

- (void)_updateHistoryEntry:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = sub_100464444();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [v7 identifier];
      id v10 = objc_retainBlock(v6);
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v9;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Adding edit+commit blocks to history entry (non-MPR): %{public}@, block: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, id, void))v6 + 2))(v6, v7, 0);
    char v11 = +[MapsSyncStore sharedStore];
    id v19 = v7;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
    id v13 = &stru_1012EB1D0;
LABEL_9:
    [v11 saveWithObjects:v12 completionHandler:v13];

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v5;
    id v15 = sub_100464444();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unint64_t v16 = [v14 identifier];
      id v17 = objc_retainBlock(v6);
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Adding edit+commit blocks to history entry (MPR): %{public}@, block: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v14);
    char v11 = +[MapsSyncStore sharedStore];
    id v18 = v14;
    id v12 = +[NSArray arrayWithObjects:&v18 count:1];
    id v13 = &stru_1012EB1F0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_saveRouteHistory:(id)a3 withOriginalHistoryIdentifier:(id)a4 arrivalState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 source] == (id)3 || objc_msgSend(v8, "source") == (id)2)
  {
    [(HistoryDirectionsItemSavingTask *)self _saveCustomRouteToHistory:v8 uuid:v9];
  }
  else
  {
    id v10 = sub_100464444();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
      id v12 = sub_10078D488(a5);
      *(_DWORD *)buf = 138412802;
      id v19 = v11;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating historyEntryRoute : %@. originalUUID: %@, arrivalState: %{public}@", buf, 0x20u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100466834;
    v14[3] = &unk_1012EB218;
    unint64_t v16 = self;
    unint64_t v17 = a5;
    id v15 = v8;
    id v13 = +[HistoryEntryRecentsItem saveRoute:v15 withOriginalHistoryIdentifier:v9 editBlock:v14];
    [(NavigationRouteHistoryInfoProviding *)self->_routeInfoProvider updateHistoryEntryRoute:v13];
  }
}

- (void)_saveCustomRouteToHistory:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100464444();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 uniqueRouteID];
    id v10 = [v6 storageID];
    int v13 = 138543874;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving custom route %{public}@ on uuid %{public}@, storageID %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v11 = [objc_alloc((Class)GEOComposedWaypointToRoute) initWithRoute:v6];
  id v12 = +[HistoryEntryRecentsItem saveCustomRoute:v6 asWaypoint:v11 withOriginalHistoryIdentifier:v7];
  [(NavigationRouteHistoryInfoProviding *)self->_routeInfoProvider updateHistoryEntryRoute:v12];
}

- (unint64_t)_routeProgressWaypointIndexForCurrentLegIndex:(unint64_t)a3 inRoute:(id)a4
{
  id v5 = a4;
  id v6 = sub_100464444();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Calculating route progress waypoint index for current leg %lu", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v26 = v5;
  id v7 = [v5 legs];
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    unint64_t v11 = 1;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ((unint64_t)[v13 legIndex] >= a3)
        {
          __int16 v20 = sub_100464444();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v13 legIndex];
            __int16 v22 = [v13 destination];
            id v23 = [v22 name];
            *(_DWORD *)buf = 134218243;
            unint64_t v32 = (unint64_t)v21;
            __int16 v33 = 2113;
            unint64_t v34 = (unint64_t)v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "\tFound user-provided waypoint for resuming is %lu (%{private}@)", buf, 0x16u);
          }
          goto LABEL_21;
        }
        id v14 = [v13 destination];
        unsigned int v15 = [v14 isServerProvidedWaypoint];

        if (v15)
        {
          id v16 = sub_100464444();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v13 legIndex];
            id v18 = [v13 destination];
            id v19 = [v18 name];
            *(_DWORD *)buf = 134218243;
            unint64_t v32 = (unint64_t)v17;
            __int16 v33 = 2113;
            unint64_t v34 = (unint64_t)v19;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "\tSkipping leg %lu (%{private}@), is server-provided waypoint", buf, 0x16u);
          }
        }
        else
        {
          ++v11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 1;
  }
LABEL_21:

  CFStringRef v24 = sub_100464444();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v32 = v11;
    __int16 v33 = 2048;
    unint64_t v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "\tCalculated route progress index %lu given current leg %lu", buf, 0x16u);
  }

  return v11;
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5 = a4;
  BOOL navigationIsEnding = self->_navigationIsEnding;
  id v7 = sub_100464444();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (navigationIsEnding)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will not update Share ETA receivers in history item, navigation is ending", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (v8)
    {
      int v9 = 134217984;
      id v10 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Share ETA updated with %lu receivers, will update history item", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [(HistoryDirectionsItemSavingTask *)self historyEntryRoute];
    [(HistoryDirectionsItemSavingTask *)self _preserveAutosharingContacts:1 inHistoryEntry:v7 completion:0];
  }
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInterrupter, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end