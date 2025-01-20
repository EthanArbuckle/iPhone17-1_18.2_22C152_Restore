@interface MapsActionController
- (ActionCoordination)coordinator;
- (AppCoordinator)appCoordinator;
- (AppStateManager)appStateManager;
- (BOOL)isCarPlayOnlyContext;
- (BOOL)isNavigationTurnByTurnOrStepping;
- (BOOL)isRestoringState;
- (BOOL)pendingAction;
- (CarStateManager)carStateManager;
- (IOSChromeViewController)chrome;
- (MapsActionController)init;
- (NavActionCoordination)navActionCoordinator;
- (void)_applyActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5;
- (void)_performAction:(id)a3;
- (void)applyRichMapsActivity:(id)a3;
- (void)applyRichMapsActivityOrWaitForLocation:(id)a3;
- (void)entryPointsCoordinator:(id)a3 didMergedRichMapsActivity:(id)a4;
- (void)entryPointsCoordinator:(id)a3 performErrorAction:(id)a4;
- (void)getUserLocationIfneededFor:(id)a3;
- (void)navigationEnded;
- (void)setAppCoordinator:(id)a3;
@end

@implementation MapsActionController

- (BOOL)isNavigationTurnByTurnOrStepping
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  unsigned __int8 v3 = [WeakRetained isNavigationTurnByTurnOrStepping];

  return v3;
}

- (void)setAppCoordinator:(id)a3
{
}

- (MapsActionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsActionController;
  v2 = [(MapsActionController *)&v5 init];
  unsigned __int8 v3 = v2;
  if (v2) {
    [(MapsActionController *)v2 checkHandlersForActionClasses];
  }
  return v3;
}

- (IOSChromeViewController)chrome
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  unsigned __int8 v3 = [WeakRetained chromeViewController];

  return (IOSChromeViewController *)v3;
}

- (ActionCoordination)coordinator
{
  v2 = [(MapsActionController *)self chrome];
  unsigned __int8 v3 = [v2 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 actionCoordinator];
  }
  else
  {
    v4 = 0;
  }

  return (ActionCoordination *)v4;
}

- (NavActionCoordination)navActionCoordinator
{
  v2 = [(MapsActionController *)self chrome];
  unsigned __int8 v3 = [v2 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 actionCoordinator];
  }
  else
  {
    v4 = 0;
  }

  return (NavActionCoordination *)v4;
}

- (AppStateManager)appStateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  unsigned __int8 v3 = [WeakRetained appStateManager];

  return (AppStateManager *)v3;
}

- (BOOL)isRestoringState
{
  return self->_isRestoringState;
}

- (BOOL)isCarPlayOnlyContext
{
  return 0;
}

- (CarStateManager)carStateManager
{
  return 0;
}

- (void)entryPointsCoordinator:(id)a3 performErrorAction:(id)a4
{
  id v5 = a4;
  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsActionController: performErrorAction %@", (uint8_t *)&v7, 0xCu);
  }

  [(MapsActionController *)self _performAction:v5];
}

- (void)entryPointsCoordinator:(id)a3 didMergedRichMapsActivity:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    self->_isRestoringState = 1;
    int v7 = +[UIApplication sharedMapsDelegate];
    [v7 dismissCurrentInterruption];

    id v8 = [v6 action];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(MapsActionController *)self isNavigationTurnByTurnOrStepping]
      && ([v8 isCompatibleWithNavigation] & 1) == 0)
    {
      v9 = +[MNNavigationService sharedService];
      v10 = [v9 route];
      v11 = [v10 destination];

      v12 = [v6 mapsActivity];
      v13 = [v12 directionsPlan];
      v14 = [v13 planningWaypoints];
      v15 = [v14 lastObject];
      v16 = [v15 waypoint];

      if (v11)
      {
        if (v16)
        {
          v17 = [v11 mapItemStorage];
          v18 = [v16 mapItemStorage];
          int IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();

          if (IsEqualToMapItemForPurpose)
          {
            v20 = sub_1000A930C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = [v11 shortDescription];
              v22 = [v16 shortDescription];
              *(_DWORD *)buf = 138412546;
              v35 = v21;
              __int16 v36 = 2112;
              v37 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "MapsActionController: Skipping application of route restoration, currentDestination: %@, restorationDestination: %@", buf, 0x16u);
            }
            goto LABEL_19;
          }
        }
      }
    }
    if ([(MapsActionController *)self isNavigationTurnByTurnOrStepping]
      && ([v8 isCompatibleWithNavigation] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_pendingActivityToApplyAfterNavEnd, a4);
      v24 = sub_1000A930C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [(RichMapsActivity *)self->_pendingActivityToApplyAfterNavEnd shortDescription];
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "MapsActionController: NavigatingOrStepping is running for pending %@ ", buf, 0xCu);
      }
      unsigned __int8 v26 = [v8 forceEndNavigation];
      v27 = sub_1000A930C();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
      if (v26)
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MapsActionController: forceEndNavigation", buf, 2u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
        [WeakRetained endNavigationAndReturnToRoutePlanning:0];
      }
      else
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MapsActionController: ask for kMapsInterruptionMaybeEndNavigation", buf, 2u);
        }

        v30 = +[UIApplication sharedMapsDelegate];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100AD2A1C;
        v31[3] = &unk_101316D90;
        id v32 = v6;
        v33 = self;
        [v30 interruptApplicationWithKind:7 userInfo:0 completionHandler:v31];
      }
    }
    else
    {
      v23 = sub_1000A930C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "MapsActionController: call applyRichMapsActivityOrWaitForLocation", buf, 2u);
      }

      [(MapsActionController *)self applyRichMapsActivityOrWaitForLocation:v6];
    }
  }
  else
  {
    id v8 = sub_1000A930C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MapsActionController:  %@ didMergedRichMapsActivity richMapsActivity is nil", buf, 0xCu);
    }
  }
LABEL_19:
}

- (BOOL)pendingAction
{
  return self->_pendingActivityToApplyAfterNavEnd != 0;
}

- (void)navigationEnded
{
  if (self->_pendingActivityToApplyAfterNavEnd)
  {
    unsigned __int8 v3 = sub_1000A930C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(RichMapsActivity *)self->_pendingActivityToApplyAfterNavEnd shortDescription];
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsActionController : navigationEnded for pending %@ ", buf, 0xCu);
    }
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AD2CB4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)applyRichMapsActivityOrWaitForLocation:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 shortDescription];
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivityOrWaitForLocation for %@ ", (uint8_t *)&v11, 0xCu);
  }
  int v7 = +[MKLocationManager sharedLocationManager];
  unsigned int v8 = [v7 isAuthorizedForPreciseLocation];

  if (!v8) {
    goto LABEL_8;
  }
  v9 = [v4 action];
  if (![v9 needsUserLocation])
  {
    int BOOL = GEOConfigGetBOOL();

    if (BOOL) {
      goto LABEL_7;
    }
LABEL_8:
    [(MapsActionController *)self applyRichMapsActivity:v4];
    goto LABEL_9;
  }

LABEL_7:
  [(MapsActionController *)self getUserLocationIfneededFor:v4];
LABEL_9:
}

- (void)getUserLocationIfneededFor:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 shortDescription];
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MapsActionController : Wait Location for %@ ", buf, 0xCu);
  }
  GEOConfigGetDouble();
  double v8 = v7;
  GEOConfigGetDouble();
  double v10 = v9;
  int v11 = +[MKLocationManager sharedLocationManager];
  v12 = [v4 action];
  [v12 userLocationDesiredAccuracy];
  double v14 = v13;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100AD3000;
  v20 = &unk_101316DB8;
  double v23 = v8;
  double v24 = v10;
  id v21 = v4;
  v22 = self;
  id v15 = v4;
  v16 = [v11 singleLocationUpdateWithDesiredAccuracy:&v17 handler:v14 timeout:v8 maxLocationAge:v10];
  [v16 start:v17, v18, v19, v20];
}

- (void)applyRichMapsActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_time_t v5 = sub_1000A930C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 shortDescription];
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity %@", buf, 0xCu);
    }
    if ([v4 isTestingAction])
    {
      double v7 = sub_1000A930C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity Resetting UI for Testing Action", buf, 2u);
      }

      double v8 = [(MapsActionController *)self chrome];
      [v8 resetForTestingAction];

      double v9 = sub_1000A930C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity Reset for Testing Complete", buf, 2u);
      }
    }
    if ([v4 needsUIReset])
    {
      double v10 = sub_1000A930C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity resetting UI", buf, 2u);
      }

      int v11 = [(MapsActionController *)self chrome];
      [v11 resetForLaunchURLWithOptions:0];
    }
    v12 = [v4 action];
    double v13 = [v4 mapsActivity];
    if (v13)
    {
      double v14 = +[NSUUID UUID];
      id v15 = [v14 UUIDString];

      v16 = sub_1000A930C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MapsActionController: apply (tag %@)", buf, 0xCu);
      }

      v17 = dispatch_get_global_queue(-2, 0);
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      v33 = sub_100AD3600;
      v34 = &unk_1012E5D58;
      id v18 = v15;
      id v35 = v18;
      id v19 = v13;
      id v36 = v19;
      dispatch_async(v17, &v31);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v12;
        -[MapsActionController _applyActivity:assumedSourceFidelity:source:](self, "_applyActivity:assumedSourceFidelity:source:", v19, [v20 fidelity:v31, v32, v33, v34, v35], [v20 source]);
        id v21 = +[GEOPlatform sharedPlatform];
        unsigned int v22 = [v21 isInternalInstall];

        if (v22)
        {
          double v24 = [v19 description];
          v25 = [v24 dataUsingEncoding:4];
          unsigned __int8 v26 = [v25 bzip2CompressedData];

          v27 = +[NSUserDefaults standardUserDefaults];
          BOOL v28 = +[NSDate date];
          v29 = [v28 description];
          [v27 setObject:v29 forKey:@"dateLastUserActivity"];

          v30 = +[NSUserDefaults standardUserDefaults];
          [v30 setObject:v26 forKey:@"lastUserActivityData"];
        }
      }
      else
      {
        -[MapsActionController _applyActivity:assumedSourceFidelity:source:](self, "_applyActivity:assumedSourceFidelity:source:", v19, 268435407, 2, v31, v32, v33, v34, v35);
      }
    }
    [(MapsActionController *)self _performAction:v12];
    self->_isRestoringState = 0;
  }
}

- (void)_performAction:(id)a3
{
}

- (void)_applyActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(MapsActionController *)self appStateManager];
  [v9 setMapsActivity:v8 assumedSourceFidelity:a4 source:a5];
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appCoordinator);

  objc_storeStrong((id *)&self->_pendingActivityToApplyAfterNavEnd, 0);
}

@end