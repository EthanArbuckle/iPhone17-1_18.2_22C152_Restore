@interface PlatformController
- (AuxiliaryTasksManager)auxiliaryTasksManager;
- (BOOL)_shouldCreateAuxiliaryTask:(Class)a3 forCreationPreference:(int64_t)a4;
- (BOOL)didReplaySessions;
- (BOOL)isPrimary;
- (ChromeViewController)chromeViewController;
- (EntryPointsCoordinator)entryPointsCoordinator;
- (GCDTimer)mapViewRenderTimeoutTimer;
- (GEOObserverHashTable)observers;
- (MapsSession)currentSession;
- (MapsSession)previousSession;
- (NSArray)sessionStack;
- (NSMutableArray)stack;
- (NSMutableSet)auxiliaryTaskCreationPreferencesSatisfied;
- (NavigationSession)currentNavigationSession;
- (PedestrianARSessionStateManager)pedestrianARSessionStateManager;
- (PlatformController)init;
- (id)description;
- (id)directionsDataSource;
- (void)_continuePushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 completion:(id)a5;
- (void)_createAllAuxiliaryTasks;
- (void)_createAuxiliaryTasksIfNecessaryForPreference:(int64_t)a3;
- (void)_handleInitialRouteLoaded:(id)a3;
- (void)_suspendSession:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)clearIfCurrentSession:(id)a3;
- (void)clearIfCurrentSessionIsKindOfClass:(Class)a3;
- (void)clearSessions;
- (void)dealloc;
- (void)mapViewDidBecomeFullyDrawnNotification:(id)a3;
- (void)popIfCurrentSession:(id)a3;
- (void)popSession;
- (void)popUntil:(id)a3;
- (void)prepareToReplaySessions;
- (void)pushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 shouldCheckNavSafetyAlert:(BOOL)a5 completion:(id)a6;
- (void)pushSession:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeSession:(id)a3;
- (void)replaceCurrentSessionWithSession:(id)a3;
- (void)replaySessions;
- (void)setAuxiliaryTaskCreationPreferencesSatisfied:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDidReplaySessions:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setMapViewRenderTimeoutTimer:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStack:(id)a3;
@end

@implementation PlatformController

- (PedestrianARSessionStateManager)pedestrianARSessionStateManager
{
  v2 = [(PlatformController *)self auxiliaryTasksManager];
  v3 = [v2 auxilaryTaskForClass:objc_opt_class()];

  v4 = [v3 stateManager];

  return (PedestrianARSessionStateManager *)v4;
}

- (void)setChromeViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:PlatformControllerDidChangeChromeViewControllerNotification object:self];

    v5 = obj;
  }
}

- (void)replaySessions
{
  if (![(PlatformController *)self didReplaySessions])
  {
    v3 = [(PlatformController *)self currentSession];

    if (v3)
    {
      v4 = [(PlatformController *)self observers];
      [v4 removeSnapshottedObservers];

      v5 = [(PlatformController *)self observers];
      unsigned int v6 = [v5 hasObservers];

      if (v6)
      {
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x3032000000;
        v35 = sub_1001042F0;
        v36 = sub_1001049E8;
        id v37 = 0;
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x3032000000;
        v29 = sub_1001042F0;
        v30 = sub_1001049E8;
        id v31 = 0;
        stackLock = self->_stackLock;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100AC2D1C;
        block[3] = &unk_1012F14D0;
        block[4] = self;
        block[5] = &v32;
        block[6] = &v26;
        dispatch_sync(stackLock, block);
        v8 = sub_1000DCFA0();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = v27[5];
          uint64_t v10 = v33[5];
          *(_DWORD *)buf = 134349570;
          v40 = self;
          __int16 v41 = 2112;
          uint64_t v42 = v9;
          __int16 v43 = 2112;
          uint64_t v44 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Replaying session transition: %@ => %@", buf, 0x20u);
        }

        objc_storeStrong((id *)&self->_previousSession, (id)v27[5]);
        v11 = [(PlatformController *)self observers];
        [v11 platformController:self willChangeCurrentSessionFromSession:v27[5] toSession:v33[5]];

        v12 = self->_stackLock;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100AC2DCC;
        v24[3] = &unk_1012E67C0;
        v24[4] = self;
        v24[5] = &v32;
        dispatch_sync(v12, v24);
        v13 = [(PlatformController *)self observers];
        [v13 platformController:self didChangeCurrentSessionFromSession:v27[5] toSession:v33[5]];

        [(id)v33[5] replayCurrentState];
        previousSession = self->_previousSession;
        self->_previousSession = 0;

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v32, 8);
      }
    }
    v15 = [(PlatformController *)self observers];
    [v15 restoreOriginalObservers];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v16 = [(PlatformController *)self sessionStack];
    id v17 = [v16 countByEnumeratingWithState:&v20 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) cleanupStateReplay];
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v16 countByEnumeratingWithState:&v20 objects:v38 count:16];
      }
      while (v17);
    }

    [(PlatformController *)self setDidReplaySessions:1];
  }
}

- (void)mapViewDidBecomeFullyDrawnNotification:(id)a3
{
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

  mapViewRenderTimeoutTimer = self->_mapViewRenderTimeoutTimer;
  self->_mapViewRenderTimeoutTimer = 0;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001080C8;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned int v6 = [(PlatformController *)self observers];
  [v6 unregisterObserver:v4];
}

- (void)prepareToReplaySessions
{
  if (![(PlatformController *)self didReplaySessions])
  {
    v3 = sub_1000DCFA0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(PlatformController *)self sessionStack];
      v5 = [(PlatformController *)self observers];
      *(_DWORD *)buf = 134349570;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      long long v20 = v4;
      __int16 v21 = 2112;
      long long v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Preparing to replay with sessions: %@ and current observers: %@", buf, 0x20u);
    }
    unsigned int v6 = [(PlatformController *)self observers];
    [v6 snapshotCurrentObservers];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v7 = [(PlatformController *)self sessionStack];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) prepareToReplayCurrentState];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (PlatformController)init
{
  v23.receiver = self;
  v23.super_class = (Class)PlatformController;
  v2 = [(PlatformController *)&v23 init];
  if (v2)
  {
    v3 = sub_1000DCFA0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v25 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("PlatformController.lock", v4);
    stackLock = v2->_stackLock;
    v2->_stackLock = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v7;

    id v9 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___PlatformControllerObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v9;

    v11 = [[AuxiliaryTasksManager alloc] initWithPlatformController:v2];
    auxiliaryTasksManager = v2->_auxiliaryTasksManager;
    v2->_auxiliaryTasksManager = v11;

    uint64_t v13 = +[NSMutableSet set];
    auxiliaryTaskCreationPreferencesSatisfied = v2->_auxiliaryTaskCreationPreferencesSatisfied;
    v2->_auxiliaryTaskCreationPreferencesSatisfied = (NSMutableSet *)v13;

    [(PlatformController *)v2 _createAuxiliaryTasksIfNecessaryForPreference:0];
    objc_initWeak((id *)buf, v2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100109738;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v22, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    long long v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"mapViewDidBecomeFullyDrawnNotification:" name:VKMapViewDidBecomeFullyDrawnNotification object:0];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100AC174C;
    v19[3] = &unk_1012E7638;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v16 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v19 block:5.0];
    mapViewRenderTimeoutTimer = v2->_mapViewRenderTimeoutTimer;
    v2->_mapViewRenderTimeoutTimer = (GCDTimer *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (EntryPointsCoordinator)entryPointsCoordinator
{
  entryPointsCoordinator = self->_entryPointsCoordinator;
  if (!entryPointsCoordinator)
  {
    id v4 = objc_alloc_init(EntryPointsCoordinator);
    dispatch_queue_t v5 = self->_entryPointsCoordinator;
    self->_entryPointsCoordinator = v4;

    entryPointsCoordinator = self->_entryPointsCoordinator;
  }

  return entryPointsCoordinator;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)_createAuxiliaryTasksIfNecessaryForPreference:(int64_t)a3
{
  dispatch_queue_t v5 = [(PlatformController *)self auxiliaryTaskCreationPreferencesSatisfied];
  unsigned int v6 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = sub_1000DCFA0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v122 = self;
      __int16 v123 = 2048;
      int64_t v124 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Creating auxiliary tasks for preference: %ld", buf, 0x16u);
    }

    id v9 = sub_1000DCFA0();
    os_signpost_id_t spid = os_signpost_id_generate(v9);

    uint64_t v10 = sub_1000DCFA0();
    v11 = v10;
    unint64_t v12 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CreateAuxiliaryTasks", "", buf, 2u);
    }

    uint64_t v13 = +[NSMutableArray array];
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      long long v14 = [NavigationStateMonitoringTask alloc];
      long long v15 = +[MNNavigationService sharedService];
      uint64_t v16 = [(NavigationStateMonitoringTask *)v14 initWithPlatformController:self navigationService:v15];
      [v13 addObject:v16];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      id v17 = [NavdDefaultsUpdater alloc];
      uint64_t v18 = +[NSUserDefaults standardUserDefaults];
      __int16 v19 = +[MNNavigationService sharedService];
      id v20 = +[CarDisplayController sharedInstance];
      __int16 v21 = [(NavdDefaultsUpdater *)v17 initWithDefaults:v18 navigationService:v19 carDisplayController:v20];
      [v13 addObject:v21];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      id v22 = [MapsLocationProviderUpdater alloc];
      objc_super v23 = +[MKLocationManager sharedLocationManager];
      v24 = [(MapsLocationProviderUpdater *)v22 initWithLocationManager:v23];
      [v13 addObject:v24];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v25 = [TilePreloadingTask alloc];
      uint64_t v26 = +[MNNavigationService sharedService];
      v27 = +[CarDisplayController sharedInstance];
      uint64_t v28 = [(TilePreloadingTask *)v25 initWithNavigationService:v26 carDisplayController:v27];
      [v13 addObject:v28];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      objc_initWeak((id *)buf, self);
      v116 = _NSConcreteStackBlock;
      uint64_t v117 = 3221225472;
      v118 = sub_100AC18DC;
      v119 = &unk_1013169F8;
      objc_copyWeak(&v120, (id *)buf);
      v29 = objc_retainBlock(&v116);
      v30 = [[RoutePlanningSessionRouteLoadedNotifier alloc] initWithPlatformController:self handler:v29];
      [v13 addObject:v30];

      objc_destroyWeak(&v120);
      objc_destroyWeak((id *)buf);
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      id v31 = [NavigationIntentCapturer alloc];
      uint64_t v32 = +[MKMapService sharedService];
      v33 = [(NavigationIntentCapturer *)v31 initWithMapService:v32];
      [v13 addObject:v33];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      uint64_t v34 = objc_alloc_init(RoutePlanningAnalyticsTask);
      [v13 addObject:v34];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v35 = objc_alloc_init(RoutePlanningUpdater);
      [v13 addObject:v35];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v36 = +[GEOPlatform sharedPlatform];
      unsigned int v37 = [v36 isInternalInstall];

      if (v37)
      {
        v38 = [MapsRadarAttachmentProviderTask alloc];
        v39 = +[MapsRadarController sharedInstance];
        v40 = [(MapsRadarAttachmentProviderTask *)v38 initWithRadarController:v39];
        [v13 addObject:v40];
      }
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      __int16 v41 = [[NavigationStateUpdater alloc] initWithPlatformController:self];
      [v13 addObject:v41];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      uint64_t v42 = objc_alloc_init(NavigationTrackingTask);
      [v13 addObject:v42];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      __int16 v43 = [_TtC4Maps31NavigationProgressCapturingTask alloc];
      uint64_t v44 = +[GEOUserSession sharedInstance];
      v45 = +[MNNavigationService sharedService];
      v46 = [(NavigationProgressCapturingTask *)v43 initWithPlatformController:self session:v44 navigationService:v45];

      [v13 addObject:v46];
    }
    else
    {
      v46 = 0;
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v47 = [_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask alloc];
      v48 = +[NSUserDefaults standardUserDefaults];
      v49 = [AudioPreferences alloc];
      v50 = +[NSUserDefaults standardUserDefaults];
      v51 = [(AudioPreferences *)v49 initWithDefaults:v50];
      v52 = [(NavigationAlertsOnlyOverrideSynchronizationTask *)v47 initWithPlatformController:self userDefaults:v48 audioPreferences:v51];
      [v13 addObject:v52];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v53 = +[MNNavigationService sharedService];
      v54 = [NavigationRouteInterrupter alloc];
      v55 = sub_100018584();
      v56 = [(NavigationRouteInterrupter *)v54 initWithSuggestionsEngine:v55 delegate:v46];

      v57 = [[NavigationRouteHistoryInfoProvider alloc] initWithNavigationService:v53];
      v58 = [[HistoryDirectionsItemSavingTask alloc] initWithNavigationService:v53 routeInfoProvider:v57 routeInterrupter:v56];
      [v13 addObject:v58];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v59 = [[AutomaticVehicleSelectionTask alloc] initWithPlatformController:self];
      [v13 addObject:v59];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v60 = objc_alloc_init(VehicleMonitoringTask);
      [v13 addObject:v60];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v61 = objc_alloc_init(VehicleDisambiguationTask);
      [v13 addObject:v61];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v62 = [[VIOSessionTask alloc] initWithPlatformController:self];
      [v13 addObject:v62];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[VLFSessionTask isVLFModeSupported])
    {
      v63 = [[VLFSessionTask alloc] initWithPlatformController:self];
      [v13 addObject:v63];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[VLFSessionTask isVLFModeSupported])
    {
      v64 = [[VLFPuckAnimationTask alloc] initWithPlatformController:self];
      [v13 addObject:v64];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[PedestrianARSessionTask isPedestrianARModeSupported])
    {
      v65 = [[PedestrianARSessionTask alloc] initWithPlatformController:self];
      [v13 addObject:v65];
    }
    else
    {
      v65 = 0;
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[PedestrianARSessionTask isPedestrianARModeSupported])
    {
      v66 = [(PedestrianARSessionTask *)v65 stateManager];
      if (v66)
      {
        v67 = [PedestrianARMotionMonitorTask alloc];
        v68 = +[PedestrianARSessionUsageTracker sharedInstance];
        v69 = [(PedestrianARMotionMonitorTask *)v67 initWithPlatformController:self stateManager:v66 usageTracker:v68];
        [v13 addObject:v69];
      }
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[PedestrianARSessionTask isPedestrianARModeSupported])
    {
      v70 = [PedestrianARMuteSpeechOverrideTask alloc];
      v71 = +[MNNavigationService sharedService];
      v72 = [(PedestrianARMuteSpeechOverrideTask *)v70 initWithNavigationService:v71];
      [v13 addObject:v72];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& +[PedestrianARSessionTask isPedestrianARModeSupported])
    {
      v73 = [PedestrianARUsageMigratorTask alloc];
      v74 = +[PedestrianARSessionUsageTracker sharedInstance];
      v75 = [(PedestrianARUsageMigratorTask *)v73 initWithUsageTracker:v74];
      [v13 addObject:v75];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v76 = +[GEOPlatform sharedPlatform];
      if (![v76 isInternalInstall])
      {
LABEL_70:

        goto LABEL_71;
      }
      v77 = +[NSUserDefaults standardUserDefaults];
      unsigned int v78 = [v77 BOOLForKey:@"PedestrianARDebugMapAnnotationsKey"];

      if (v78)
      {
        v79 = [PedestrianARDebugMapAnnotationsTask alloc];
        v76 = +[MNNavigationService sharedService];
        v80 = [(PedestrianARDebugMapAnnotationsTask *)v79 initWithPlatformController:self navigationService:v76];
        [v13 addObject:v80];

        goto LABEL_70;
      }
    }
LABEL_71:
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v81 = +[GEOPlatform sharedPlatform];
      unsigned int v82 = [v81 isInternalInstall];

      if (v82)
      {
        v83 = objc_alloc_init(RoutePlanningServerEnvrionmentChangeRouteRefreshTask);
        [v13 addObject:v83];
      }
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      if ((GEOConfigGetBOOL() & 1) == 0)
      {
        v84 = +[GEOPlatform sharedPlatform];
        unsigned int v85 = [v84 isInternalInstall];

        if (!v85)
        {
LABEL_117:

          return;
        }
      }
      v86 = [ThermalPressureAnalyticsTask alloc];
      v87 = +[MapsThermalPressureController sharedController];
      v88 = +[MNNavigationService sharedService];
      v89 = +[MapsPowerSourceController sharedController];
      v90 = [(ThermalPressureAnalyticsTask *)v86 initWithPlatformController:self thermalPressureController:v87 navigationService:v88 powerSourceController:v89];
      [v13 addObject:v90];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& MapsFeature_IsEnabled_Bakersfield())
    {
      v91 = +[TrafficIncidentLayoutManager sharedInstance];
      [v13 addObject:v91];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3]&& MapsFeature_IsEnabled_Bakersfield())
    {
      v92 = +[TrafficIncidentsStorageManager sharedInstance];
      [v13 addObject:v92];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v93 = +[RAPRecordManagerTrafficIncidentReportSaver sharedInstance];
      [v13 addObject:v93];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v94 = +[IPCServer sharedServer];
      BOOL v95 = v94 == 0;

      if (!v95)
      {
        v96 = [NanoCompanionController alloc];
        v97 = +[IPCServer sharedServer];
        v98 = [(NanoCompanionController *)v96 initWithPlatformController:self ipcServer:v97];
        [v13 addObject:v98];
      }
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v99 = objc_alloc_init(VirtualGarageServiceTask);
      [v13 addObject:v99];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v100 = +[GEOPlatform sharedPlatform];
      unsigned int v101 = [v100 isInternalInstall];

      if (v101)
      {
        v102 = objc_alloc_init(InternalDebugTask);
        [v13 addObject:v102];
      }
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v103 = +[GEOPlatform sharedPlatform];
      if ([(DebugCoreMotionCompassAvailabilityTask *)v103 isInternalInstall])
      {
        int BOOL = GEOConfigGetBOOL();

        if (!BOOL) {
          goto LABEL_99;
        }
        v103 = [[DebugCoreMotionCompassAvailabilityTask alloc] initWithPlatformController:self];
        [v13 addObject:v103];
      }
    }
LABEL_99:
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v105 = +[RAPWebBundleDownloadManager sharedInstance];
      [v13 addObject:v105];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v106 = objc_alloc_init(CarDisplayConfigAuxiliaryTask);
      [v13 addObject:v106];
    }
    if ([(PlatformController *)self _shouldCreateAuxiliaryTask:objc_opt_class() forCreationPreference:a3])
    {
      v107 = objc_opt_new();
      [v13 addObject:v107];
    }
    -[AuxiliaryTasksManager addTasks:](self->_auxiliaryTasksManager, "addTasks:", v13, spid, v116, v117, v118, v119);
    v108 = sub_1000DCFA0();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349570;
      v122 = self;
      __int16 v123 = 2048;
      int64_t v124 = a3;
      __int16 v125 = 2112;
      v126 = v13;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "[%{public}p] Created auxiliary tasks for preference: %ld\n%@", buf, 0x20u);
    }

    if (a3)
    {
      if (a3 != 1)
      {
        if (a3 != 2)
        {
LABEL_113:
          v112 = sub_1000DCFA0();
          v113 = v112;
          if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v113, OS_SIGNPOST_INTERVAL_END, spida, "CreateAuxiliaryTasks", "", buf, 2u);
          }

          goto LABEL_117;
        }
        v109 = [(PlatformController *)self auxiliaryTaskCreationPreferencesSatisfied];
        [v109 addObject:&off_1013AA288];
      }
      v110 = [(PlatformController *)self auxiliaryTaskCreationPreferencesSatisfied];
      [v110 addObject:&off_1013AA270];
    }
    v111 = [(PlatformController *)self auxiliaryTaskCreationPreferencesSatisfied];
    [v111 addObject:&off_1013AA258];

    goto LABEL_113;
  }
}

- (BOOL)_shouldCreateAuxiliaryTask:(Class)a3 forCreationPreference:(int64_t)a4
{
  id v6 = [(objc_class *)a3 creationPreference];
  unsigned __int8 v7 = [(PlatformController *)self auxiliaryTaskCreationPreferencesSatisfied];
  id v8 = +[NSNumber numberWithInteger:v6];
  unsigned __int8 v9 = [v7 containsObject:v8];

  return ((uint64_t)v6 <= a4) & ~v9;
}

- (NSMutableSet)auxiliaryTaskCreationPreferencesSatisfied
{
  return self->_auxiliaryTaskCreationPreferencesSatisfied;
}

- (MapsSession)currentSession
{
  v2 = [(PlatformController *)self sessionStack];
  v3 = [v2 lastObject];

  return (MapsSession *)v3;
}

- (NSArray)sessionStack
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned __int8 v9 = sub_1001042F0;
  uint64_t v10 = sub_1001049E8;
  id v11 = 0;
  stackLock = self->_stackLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100076C50;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stackLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(PlatformController *)self observers];
  [v6 registerObserver:v4];
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)setDidReplaySessions:(BOOL)a3
{
  self->_didReplaySessions = a3;
}

- (BOOL)didReplaySessions
{
  return self->_didReplaySessions;
}

- (AuxiliaryTasksManager)auxiliaryTasksManager
{
  return self->_auxiliaryTasksManager;
}

- (NavigationSession)currentNavigationSession
{
  v2 = self;
  id v3 = (void *)PlatformController.currentNavigationSession.getter();

  return (NavigationSession *)v3;
}

- (void)pushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 shouldCheckNavSafetyAlert:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = sub_10000AF10();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[PlatformController(CustomRoute) pushNavigationWithRoute:navigationMode:shouldCheckNavSafetyAlert:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v13 = +[NSUserDefaults standardUserDefaults];
  unsigned int v14 = [v13 BOOLForKey:@"HasShownCustomNavModeAdvisoryKey"];

  if ((!v7 | v14) == 1)
  {
    [(PlatformController *)self _continuePushNavigationWithRoute:v10 navigationMode:a4 completion:v11];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    long long v15 = +[UIApplication sharedMapsDelegate];
    CFStringRef v23 = @"kMapsInterruptionMessage";
    uint64_t v16 = +[NSBundle mainBundle];
    id v17 = [v16 localizedStringForKey:@"Custom Route Safety Warning Message" value:@"localized string not found" table:0];
    v24 = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100407770;
    v19[3] = &unk_1012E94C8;
    objc_copyWeak(v22, (id *)buf);
    id v20 = v10;
    v22[1] = (id)a4;
    id v21 = v11;
    [v15 interruptApplicationWithKind:1 userInfo:v18 completionHandler:v19];

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_continuePushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10000AF10();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PlatformController(CustomRoute) _continuePushNavigationWithRoute:navigationMode:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v11 = [(PlatformController *)self chromeViewController];
  unint64_t v12 = [v11 currentTraits];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  long long v15 = v14;

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1004079F4;
  v19[3] = &unk_1012E9518;
  objc_copyWeak(v22, (id *)buf);
  v22[1] = (id)a4;
  id v16 = v15;
  id v20 = v16;
  id v17 = v9;
  id v21 = v17;
  id v18 = [v8 _maps_convertToNavigableRouteWithTraits:v16 errorHandler:v17 completionHandler:v19];

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

- (id)directionsDataSource
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(PlatformController *)self sessionStack];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    dispatch_queue_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;

          uint64_t v6 = v10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v9;

          dispatch_queue_t v5 = v11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    dispatch_queue_t v5 = 0;
    uint64_t v6 = 0;
  }

  unint64_t v12 = [[NavigationSessionRAP alloc] initWithNavigationSession:v6 routePlanningSession:v5];

  return v12;
}

- (void)dealloc
{
  id v3 = sub_1000DCFA0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PlatformController;
  [(PlatformController *)&v4 dealloc];
}

- (void)_createAllAuxiliaryTasks
{
  [(PlatformController *)self _createAuxiliaryTasksIfNecessaryForPreference:0];
  [(PlatformController *)self _createAuxiliaryTasksIfNecessaryForPreference:1];

  [(PlatformController *)self _createAuxiliaryTasksIfNecessaryForPreference:2];
}

- (void)_handleInitialRouteLoaded:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[UIApplication sharedMapsDelegate];
  [v4 showNavigationAdvisoryIfNeeded];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AC19EC;
  block[3] = &unk_1012E5D08;
  id v7 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)pushSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    long long v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Pushing new session: %@", buf, 0x16u);
  }

  +[CATransaction setFrameStallSkipRequest:1];
  [(PlatformController *)self _createAllAuxiliaryTasks];
  uint64_t v6 = [(PlatformController *)self currentSession];
  objc_storeStrong((id *)&self->_previousSession, v6);
  id v7 = [(PlatformController *)self observers];
  [v7 platformController:self willChangeCurrentSessionFromSession:v6 toSession:v4];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AC1C88;
  v11[3] = &unk_1012E66E0;
  v11[4] = self;
  id v12 = v4;
  id v13 = v6;
  id v8 = v6;
  id v9 = v4;
  id v10 = objc_retainBlock(v11);
  [(PlatformController *)self _suspendSession:v8 completion:v10];
}

- (void)popSession
{
  id v3 = sub_1000DCFA0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[PlatformController popSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v6 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AC1FAC;
  v4[3] = &unk_101316A60;
  v4[4] = buf;
  [(PlatformController *)self popUntil:v4];
  _Block_object_dispose(buf, 8);
}

- (void)popIfCurrentSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(PlatformController *)self currentSession];
    int v8 = 134349570;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Pop if the current session (%@) is equal to: %@", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [(PlatformController *)self currentSession];

  if (v7 == v4) {
    [(PlatformController *)self popSession];
  }
}

- (void)replaceCurrentSessionWithSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(PlatformController *)self currentSession];
    int v10 = 134349570;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Replace current session (%@) with: %@", (uint8_t *)&v10, 0x20u);
  }
  if (v4)
  {
    id v7 = [(PlatformController *)self currentSession];
    [(PlatformController *)self pushSession:v4];
    if (v7)
    {
      [(PlatformController *)self removeSession:v7];
      int v8 = sub_1000DCFA0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [(PlatformController *)self sessionStack];
        int v10 = 134349314;
        id v11 = self;
        __int16 v12 = 2112;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Current session stack: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)popUntil:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[PlatformController popUntil:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  id obj = [(PlatformController *)self currentSession];
  uint64_t v6 = [(PlatformController *)self sessionStack];
  BOOL v7 = [v6 count] == 0;

  if (!v7)
  {
    do
    {
      int v8 = [(PlatformController *)self currentSession];
      char v9 = v4[2](v4, v8);

      if (v9) {
        break;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v26 = sub_1001042F0;
      v27 = sub_1001049E8;
      id v28 = 0;
      stackLock = self->_stackLock;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100AC2614;
      block[3] = &unk_1012E73F0;
      void block[4] = self;
      block[5] = buf;
      dispatch_sync(stackLock, block);
      [(PlatformController *)self removeSession:*(void *)(*(void *)&buf[8] + 40)];
      _Block_object_dispose(buf, 8);

      id v11 = [(PlatformController *)self sessionStack];
      BOOL v12 = [v11 count] == 0;
    }
    while (!v12);
  }
  id v13 = [(PlatformController *)self currentSession];
  BOOL v14 = obj == v13;

  if (!v14)
  {
    objc_storeStrong((id *)&self->_previousSession, obj);
    id v15 = [(PlatformController *)self observers];
    __int16 v16 = [(PlatformController *)self currentSession];
    [v15 platformController:self willChangeCurrentSessionFromSession:obj toSession:v16];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    id v22[2] = sub_100AC267C;
    v22[3] = &unk_1012E5D58;
    v22[4] = self;
    id v17 = obj;
    id v23 = v17;
    id v18 = objc_retainBlock(v22);
    [(PlatformController *)self _suspendSession:v17 completion:v18];
  }
  __int16 v19 = sub_1000DCFA0();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [(PlatformController *)self sessionStack];
    *(_DWORD *)buf = 134349314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] Current session stack: %@", buf, 0x16u);
  }
}

- (void)_suspendSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(void))a4;
  if (objc_opt_respondsToSelector())
  {
    int v8 = sub_1000DCFA0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134349056;
      int v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Outgoing session requires asynchronous suspension", (uint8_t *)&v9, 0xCu);
    }

    [v6 suspendWithCompletion:v7];
  }
  else
  {
    [v6 suspend];
    v7[2](v7);
  }
}

- (void)removeSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Removing session: %@", buf, 0x16u);
  }

  if (v4)
  {
    stackLock = self->_stackLock;
    int v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    int v10 = sub_100AC2968;
    id v11 = &unk_1012E5D58;
    BOOL v12 = self;
    id v7 = v4;
    id v13 = v7;
    dispatch_sync(stackLock, &v8);
    [v7 setPlatformController:0 v8, v9, v10, v11, v12];
  }
}

- (void)clearSessions
{
  id v3 = sub_1000DCFA0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 134349314;
    id v5 = self;
    __int16 v6 = 2080;
    id v7 = "-[PlatformController clearSessions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", (uint8_t *)&v4, 0x16u);
  }

  [(PlatformController *)self popUntil:&stru_101316A80];
}

- (void)clearIfCurrentSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __int16 v6 = [(PlatformController *)self currentSession];
    int v8 = 134349570;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Clear all sessions if the current session (%@) is equal to: %@", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [(PlatformController *)self currentSession];

  if (v7 == v4) {
    [(PlatformController *)self clearSessions];
  }
}

- (void)clearIfCurrentSessionIsKindOfClass:(Class)a3
{
  id v5 = sub_1000DCFA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __int16 v6 = [(PlatformController *)self currentSession];
    int v9 = 134349570;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    Class v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Clear all sessions if the current session (%@) is kind of class: %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [(PlatformController *)self currentSession];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PlatformController *)self clearSessions];
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PlatformController *)self sessionStack];
  id v5 = +[NSString stringWithFormat:@"<%@: %p, sessions=%@>", v3, self, v4];

  return v5;
}

- (MapsSession)previousSession
{
  return self->_previousSession;
}

- (void)setStack:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setAuxiliaryTaskCreationPreferencesSatisfied:(id)a3
{
}

- (GCDTimer)mapViewRenderTimeoutTimer
{
  return self->_mapViewRenderTimeoutTimer;
}

- (void)setMapViewRenderTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewRenderTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_auxiliaryTaskCreationPreferencesSatisfied, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_previousSession, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_auxiliaryTasksManager, 0);
  objc_storeStrong((id *)&self->_entryPointsCoordinator, 0);

  objc_storeStrong((id *)&self->_stackLock, 0);
}

@end