@interface MapsSceneDelegate
- (AppCoordinator)appCoordinator;
- (BOOL)canBecomeFirstResponder;
- (EntryPointsCoordinator)entryPointsCoordinator;
- (IOSBasedChromeViewController)chromeViewController;
- (MapsActionController)mapsActionController;
- (MapsActivity)mapsActivity;
- (MapsActivityController)mapsActivityController;
- (NSString)sceneIdentifier;
- (PPTTestCoordinatorProtocol)testCoordinator;
- (PlatformController)platformController;
- (RAPPresenter)rapPresenter;
- (UIViewController)topMostPresentedViewController;
- (UIWindow)window;
- (id)appSessionController;
- (id)mapsActivityWithFidelity:(unint64_t)a3;
- (id)searchPinsManager;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)_loadMapsForWindowScene:(id)a3 withCompletion:(id)a4;
- (void)_locationManagerAuthorizationChanged:(id)a3;
- (void)_sendMapsSuggestionsSignalsUsingBaseMode:(BOOL)a3 secondsSinceBackgrounding:(double)a4 routePlanningPresented:(BOOL)a5;
- (void)archiveMapsActivity;
- (void)dealloc;
- (void)dismissMapsDebugControllerWithCompletion:(id)a3;
- (void)geoDaemonDisconnectNotificationHandler:(id)a3;
- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4;
- (void)presentMapsDebugController;
- (void)presentMapsDebugControllerIfEnabled;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5;
- (void)refreshTitle;
- (void)refreshTitleAfterShortDelay;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setEntryPointsCoordinator:(id)a3;
- (void)setMapsActionController:(id)a3;
- (void)setMapsActivity:(id)a3;
- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5;
- (void)setMapsActivityController:(id)a3;
- (void)setNeedsUserActivityUpdate;
- (void)setPlatformController:(id)a3;
- (void)setRapPresenter:(id)a3;
- (void)setWindow:(id)a3;
- (void)updateDirectionsListVisibility:(BOOL)a3;
- (void)userActivityWillSave:(id)a3;
- (void)vkFaultNotificationHandler:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation MapsSceneDelegate

- (void)updateDirectionsListVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(MapsSceneDelegate *)self appCoordinator];
  id v5 = v4;
  if (v3) {
    [v4 showFullscreenDirectionsList];
  }
  else {
    [v4 hideFullscreenDirectionsList];
  }
}

- (void)_sendMapsSuggestionsSignalsUsingBaseMode:(BOOL)a3 secondsSinceBackgrounding:(double)a4 routePlanningPresented:(BOOL)a5
{
  obj = self;
  objc_sync_enter(obj);
  if (qword_101610F78 != -1) {
    dispatch_once(&qword_101610F78, &stru_101321AC8);
  }
  *(float *)&double v6 = a4;
  [(id)qword_101610F88 writeSignalValue:23 forType:v6];
  v7 = (void *)qword_101610F80;
  id v8 = [(id)qword_101610F88 copy];
  [v7 donateSignalPack:v8];

  objc_sync_exit(obj);
}

- (void)setNeedsUserActivityUpdate
{
  id v2 = [(MapsSceneDelegate *)self mapsActivityController];
  [v2 setNeedsUserActivityUpdate];
}

- (MapsActivityController)mapsActivityController
{
  mapsActivityController = self->_mapsActivityController;
  if (!mapsActivityController)
  {
    v4 = objc_alloc_init(MapsActivityController);
    id v5 = self->_mapsActivityController;
    self->_mapsActivityController = v4;

    [(MapsActivityController *)self->_mapsActivityController setDelegate:self];
    mapsActivityController = self->_mapsActivityController;
  }

  return mapsActivityController;
}

- (UIViewController)topMostPresentedViewController
{
  id v2 = [(MapsSceneDelegate *)self window];
  BOOL v3 = [v2 rootViewController];

  v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      id v5 = [v3 presentedViewController];

      double v6 = [v5 presentedViewController];

      BOOL v3 = v5;
    }
    while (v6);
  }
  else
  {
    id v5 = v3;
  }

  return (UIViewController *)v5;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", "", (uint8_t *)&v12, 2u);
  }

  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneWillEnterForeground: %@", (uint8_t *)&v12, 0xCu);
  }
  id v8 = dispatch_get_global_queue(0, 0);
  dispatch_async(v8, &stru_101321A30);

  v9 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  v10 = [v4 session];
  [v9 willEnterForegroundWithSession:v10];

  v11 = sub_1000A930C();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", "", (uint8_t *)&v12, 2u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", "", (uint8_t *)&v23, 2u);
  }

  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    int v23 = 138412290;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidBecomeActive: %@", (uint8_t *)&v23, 0xCu);
  }
  id v8 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  v9 = [v4 session];
  [v8 didBecomeActiveWithSession:v9];

  v10 = +[MapsLightLevelController sharedController];
  [v10 reloadForChangedLightLevelTrackers];

  v11 = [(MapsSceneDelegate *)self chromeViewController];
  uint64_t v12 = [v11 topContext];
  v13 = [(AppCoordinator *)self->_appCoordinator baseModeController];
  v14 = +[UIApplication sharedMapsDelegate];
  [v14 timeIntervalSinceLastBackgrounded];
  double v16 = v15;
  v17 = [(MapsSceneDelegate *)self appCoordinator];
  v18 = [v17 baseActionCoordinator];
  -[MapsSceneDelegate _sendMapsSuggestionsSignalsUsingBaseMode:secondsSinceBackgrounding:routePlanningPresented:](self, "_sendMapsSuggestionsSignalsUsingBaseMode:secondsSinceBackgrounding:routePlanningPresented:", v12 == (void)v13, [v18 isRoutePlanningPresented], v16);

  v19 = +[MKLocationManager sharedLocationManager];
  LOBYTE(v12) = [v19 isLocationServicesAuthorizationNeeded];

  if ((v12 & 1) == 0)
  {
    v20 = +[MKLocationManager sharedLocationManager];
    [v20 resetAfterResumeIfNecessary];
  }
  if (!self->_isTemporaryPreciseLocationAuthorizationPromptShown) {
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_1013219F0);
  }
  v21 = +[MKLocationManager sharedLocationManager];
  self->_isTemporaryPreciseLocationAuthorizationPromptShown = [v21 isTemporaryPreciseLocationAuthorizationPromptShown];

  v22 = sub_1000A930C();
  if (os_signpost_enabled(v22))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", "", (uint8_t *)&v23, 2u);
  }
}

- (EntryPointsCoordinator)entryPointsCoordinator
{
  BOOL v3 = [(MapsSceneDelegate *)self mapsActionController];
  id v4 = [(PlatformController *)self->_platformController entryPointsCoordinator];
  [v4 setDelegate:v3];

  platformController = self->_platformController;

  return [(PlatformController *)platformController entryPointsCoordinator];
}

- (MapsActionController)mapsActionController
{
  mapsActionController = self->_mapsActionController;
  if (!mapsActionController)
  {
    id v4 = objc_alloc_init(MapsActionController);
    id v5 = self->_mapsActionController;
    self->_mapsActionController = v4;

    double v6 = [(MapsSceneDelegate *)self appCoordinator];
    [(MapsActionController *)self->_mapsActionController setAppCoordinator:v6];

    mapsActionController = self->_mapsActionController;
  }

  return mapsActionController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A930C();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillConnectTosSession", "", buf, 2u);
  }

  id v12 = v8;
  v13 = sub_1000A930C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v12 description];
    *(_DWORD *)buf = 138412802;
    v44 = v14;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", buf, 0x20u);
  }
  double v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.maps.analytics", v15);
  analyticsQueue = self->_analyticsQueue;
  self->_analyticsQueue = v16;

  v18 = sub_1000A930C();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlatformController", "", buf, 2u);
  }

  v19 = [(MapsSceneDelegate *)self appSessionController];
  v20 = [v19 addActiveiOSPlatformControllerForScene:v12];
  [(MapsSceneDelegate *)self setPlatformController:v20];

  v21 = [(MapsSceneDelegate *)self platformController];
  v22 = [(MapsSceneDelegate *)self appSessionController];
  int v23 = [v22 primaryPlatformController];
  BOOL v24 = v21 == v23;

  if (v24)
  {
    v25 = [(MapsSceneDelegate *)self platformController];
    [v25 prepareToReplaySessions];
  }
  v26 = sub_1000A930C();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlatformController", "", buf, 2u);
  }

  v27 = sub_1000A930C();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", "", buf, 2u);
  }

  v28 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  v29 = [v12 coordinateSpace];
  [v29 bounds];
  [v28 willConnectToSession:v9 options:v10 windowSize:v12 scene:v30];

  v32 = sub_1000A930C();
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v33 = sub_1000A930C();
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)v42 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LoadMapsForScene", "", v42, 2u);
  }

  v36 = _NSConcreteStackBlock;
  uint64_t v37 = 3221225472;
  v38 = sub_10006065C;
  v39 = &unk_1012E6830;
  objc_copyWeak(&v40, (id *)buf);
  BOOL v41 = v24;
  [(MapsSceneDelegate *)self _loadMapsForWindowScene:v12 withCompletion:&v36];
  v34 = +[NSNotificationCenter defaultCenter];
  [v34 addObserver:self selector:"_locationManagerAuthorizationChanged:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  v35 = sub_1000A930C();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)v42 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillConnectTosSession", "", v42, 2u);
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)_loadMapsForWindowScene:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000A930C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 description];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_loadMapsForWindowScene: %@", (uint8_t *)&buf, 0xCu);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100CFB9B8;
  v45[3] = &unk_1012E5D08;
  v45[4] = self;
  id v10 = [v6 statusBarManager];
  [v10 setDebugMenuHandler:v45];

  v11 = +[NSFileManager defaultManager];
  id v12 = [v11 URLsForDirectory:13 inDomains:1];
  v13 = [v12 firstObject];
  +[MKIconManager setDiskCacheURL:v13];

  v14 = +[GEOResourceManifestManager modernManager];
  id v15 = [v14 activeTileGroup];

  double v16 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  [v16 addObserver:self];

  objc_initWeak(&location, self);
  v17 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000098F0;
  v42[3] = &unk_101321A58;
  objc_copyWeak(&v43, &location);
  [v17 fetchCurrentAnnouncement:v42];

  id v18 = [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
  +[NSURLCache setSharedURLCache:v18];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  id v48 = sub_100104530;
  v49 = sub_100104B08;
  id v50 = 0;
  v19 = +[GEOResourceManifestManager modernManager];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100CFB9C0;
  v41[3] = &unk_1012E83B0;
  v41[4] = &buf;
  [v19 addNetworkActivityHandler:v41];

  v20 = +[VKDebugSettings sharedSettings];
  v21 = GEOFindOrCreateLog();
  [v20 setEnableLoggingInLockScreen:os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)];

  v22 = [(MapsSceneDelegate *)self chromeViewController];
  [(PlatformController *)self->_platformController setChromeViewController:v22];

  int v23 = [[EventSourceWindow alloc] initWithWindowScene:v6];
  [(MapsSceneDelegate *)self setWindow:v23];

  BOOL v24 = [(MapsSceneDelegate *)self window];
  [v24 setAccessibilityIdentifier:@"Maps.Application"];

  v25 = [(MapsSceneDelegate *)self chromeViewController];
  uint64_t v26 = [(MapsSceneDelegate *)self window];
  [(id)v26 setRootViewController:v25];

  v27 = [(MapsSceneDelegate *)self window];
  LOBYTE(v26) = sub_1000BBB44(v27) == 5;

  if ((v26 & 1) == 0)
  {
    v28 = +[UIColor _maps_keyColor];
    v29 = [(MapsSceneDelegate *)self window];
    [v29 setTintColor:v28];
  }
  double v30 = +[UIColor clearColor];
  double v31 = [(MapsSceneDelegate *)self window];
  [v31 setBackgroundColor:v30];

  v32 = [(MapsSceneDelegate *)self window];
  [v32 makeKeyAndVisible];

  v33 = +[MapsPinsController sharedController];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10010810C;
  v39[3] = &unk_101321AA8;
  objc_copyWeak(&v40, &location);
  [v33 getDroppedPinWithCompletion:v39];

  v34 = +[MKSystemController sharedInstance];
  unsigned int v35 = [v34 isInternalInstall];

  if (v35)
  {
    v36 = +[NSNotificationCenter defaultCenter];
    [v36 addObserver:self selector:"geoDaemonDisconnectNotificationHandler:" name:GEODaemonCommunicationInterruptedNotification object:0];

    uint64_t v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:self selector:"vkFaultNotificationHandler:" name:VKFaultNotification object:0];
  }
  [(MapsSceneDelegate *)self setNeedsUserActivityUpdate];
  v38 = [(MapsSceneDelegate *)self appCoordinator];
  [v38 startSearchModeWithCompletion:v7];

  objc_destroyWeak(&v40);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (UIWindow)window
{
  return self->_window;
}

- (IOSBasedChromeViewController)chromeViewController
{
  chromeViewController = self->_chromeViewController;
  if (!chromeViewController)
  {
    id v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    id v6 = off_1012D3C70;
    if (v5 != (id)5) {
      id v6 = off_1012D3398;
    }
    id v7 = (IOSBasedChromeViewController *)objc_alloc_init(*v6);
    id v8 = self->_chromeViewController;
    self->_chromeViewController = v7;

    id v9 = [(MapsSceneDelegate *)self mapsActionController];
    [(IOSBasedChromeViewController *)self->_chromeViewController setMapsActionController:v9];

    chromeViewController = self->_chromeViewController;
  }
  [(IOSBasedChromeViewController *)chromeViewController setAppCoordinator:self->_appCoordinator];
  id v10 = self->_chromeViewController;

  return v10;
}

- (NSString)sceneIdentifier
{
  return (NSString *)@"iOS";
}

- (id)mapsActivityWithFidelity:(unint64_t)a3
{
  id v4 = [(MapsSceneDelegate *)self appCoordinator];
  id v5 = [v4 appStateManager];
  id v6 = [v5 mapsActivityWithFidelity:a3];

  return v6;
}

- (AppCoordinator)appCoordinator
{
  appCoordinator = self->_appCoordinator;
  if (!appCoordinator)
  {
    id v4 = [AppCoordinator alloc];
    id v5 = [(MapsSceneDelegate *)self platformController];
    id v6 = [(AppCoordinator *)v4 initWithPlatformController:v5];
    id v7 = self->_appCoordinator;
    self->_appCoordinator = v6;

    [(AppCoordinator *)self->_appCoordinator setMapsSceneDelegate:self];
    id v8 = [(MapsSceneDelegate *)self chromeViewController];
    [(AppCoordinator *)self->_appCoordinator setChromeViewController:v8];

    appCoordinator = self->_appCoordinator;
  }

  return appCoordinator;
}

- (id)appSessionController
{
  id v2 = +[UIApplication sharedMapsDelegate];
  BOOL v3 = [v2 appSessionController];

  return v3;
}

- (void)setWindow:(id)a3
{
}

- (void)setPlatformController:(id)a3
{
}

- (void)_locationManagerAuthorizationChanged:(id)a3
{
  id v7 = +[MKLocationManager sharedLocationManager];
  if ([v7 isLocationServicesAuthorizationNeeded])
  {
    id v4 = [(MapsSceneDelegate *)self entryPointsCoordinator];
    id v5 = [v4 launchAlertsManager];

    [v5 enqueueAlert:0];
  }
  else
  {
    if (![v7 isLocationServicesDenied]) {
      goto LABEL_6;
    }
    id v5 = [(MapsSceneDelegate *)self chromeViewController];
    id v6 = [v5 mapView];
    [v6 setUserTrackingMode:0];
  }
LABEL_6:
}

- (void)dealloc
{
  [(MapsDebugValuesViewController *)self->_mapsDebugController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsSceneDelegate;
  [(MapsSceneDelegate *)&v3 dealloc];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", "", (uint8_t *)&v15, 2u);
  }

  id v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 description];
    int v15 = 138412290;
    double v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidDisconnect: %@", (uint8_t *)&v15, 0xCu);
  }
  [(MapsSceneDelegate *)self archiveMapsActivity];
  id v8 = [(MapsSceneDelegate *)self appSessionController];
  id v9 = [(MapsSceneDelegate *)self platformController];
  [v8 removeiOSPlatformController:v9];

  [(MapsSceneDelegate *)self setPlatformController:0];
  id v10 = +[MNNavigationService sharedService];
  [v10 closeForClient:self];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self];

  id v12 = [(MapsSceneDelegate *)self window];
  [v12 setHidden:1];

  v13 = [(MapsSceneDelegate *)self window];
  [v13 setRootViewController:0];

  [(MapsSceneDelegate *)self setWindow:0];
  v14 = sub_1000A930C();
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", "", (uint8_t *)&v15, 2u);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", "", (uint8_t *)&v15, 2u);
  }

  id v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 description];
    int v15 = 138412290;
    double v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneWillResignActive: %@", (uint8_t *)&v15, 0xCu);
  }
  id v8 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  id v9 = [v4 session];
  [v8 willResignActiveWithSession:v9];

  id v10 = +[UIApplication sharedApplication];
  if ([v10 isSuspendedUnderLock])
  {
    v11 = +[MNNavigationService sharedService];
    [v11 state];
    int IsNavigating = MNNavigationServiceStateIsNavigating();

    if (!IsNavigating) {
      goto LABEL_9;
    }
    id v10 = [(MapsSceneDelegate *)self chromeViewController];
    [v10 dismissAllModalViewsIfPresentAnimated:1 completion:0];
  }

LABEL_9:
  [(MapsSceneDelegate *)self refreshTitle];
  v13 = +[MKLocationManager sharedLocationManager];
  self->_isTemporaryPreciseLocationAuthorizationPromptShown = [v13 isTemporaryPreciseLocationAuthorizationPromptShown];

  if (!self->_isTemporaryPreciseLocationAuthorizationPromptShown) {
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_101321A10);
  }
  v14 = sub_1000A930C();
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", "", (uint8_t *)&v15, 2u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", "", (uint8_t *)&v12, 2u);
  }

  id v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 description];
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidEnterBackground: %@", (uint8_t *)&v12, 0xCu);
  }
  id v8 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  id v9 = [v4 session];
  [v8 didEnterBackgroundWithSession:v9];

  [(MapsSceneDelegate *)self archiveMapsActivity];
  id v10 = +[MapsLightLevelController sharedController];
  [v10 reloadForChangedLightLevelTrackers];

  v11 = sub_1000A930C();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", "", (uint8_t *)&v12, 2u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activationState];
  id v6 = sub_100084D38();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == (id)-1)
  {
    if (v7)
    {
      id v10 = [(MapsSceneDelegate *)self mapsActivity];
      int v12 = 138478083;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "UIKit not archiving MapsActivity %{private}@ for Scene: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = 0;
  }
  else
  {
    if (v7)
    {
      id v8 = [(MapsSceneDelegate *)self mapsActivity];
      int v12 = 138477827;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "UIKit archiving MapsActivity: %{private}@", (uint8_t *)&v12, 0xCu);
    }
    id v6 = [(MapsSceneDelegate *)self mapsActivityController];
    id v9 = [v6 mapsUserActivityForStateRestoration];
  }

  return v9;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a4;
  id v6 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  [v6 willContinueUserActivityWithType:v5];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  BOOL v7 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  id v8 = [v12 session];
  id v9 = [v12 coordinateSpace];
  [v9 bounds];
  [v7 continueUserActivity:v6 session:v8 windowSize:v10 v11];
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  [v9 didFailToContinueUserActivityWithType:v8 error:v7];
}

- (void)archiveMapsActivity
{
  id v2 = [(MapsSceneDelegate *)self mapsActivityController];
  [v2 archiveMapsActivity];
}

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsSceneDelegate *)self mapsActivityController];
  [v5 userActivityWillSave:v4];
}

- (MapsActivity)mapsActivity
{
  return (MapsActivity *)[(MapsSceneDelegate *)self mapsActivityWithFidelity:0xFFFFFFFLL];
}

- (void)setMapsActivity:(id)a3
{
}

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v10 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    id v8 = [(MapsSceneDelegate *)self appCoordinator];
    id v9 = [v8 appStateManager];
    [v9 setMapsActivity:v10 assumedSourceFidelity:a4 source:a5];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000A930C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 description];
    int v20 = 138412546;
    v21 = v9;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-scene:openURLContexts: %@ contexts %@", (uint8_t *)&v20, 0x16u);
  }
  id v10 = v6;
  double v11 = +[MKLocationManager sharedLocationManager];
  [v11 resetAfterResumeIfNecessary];

  id v12 = [v7 anyObject];
  v13 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  __int16 v14 = [v12 URL];
  id v15 = [v10 session];
  double v16 = [v12 options];
  v17 = [v10 coordinateSpace];

  [v17 bounds];
  [v13 openURL:v14 session:v15 sceneOptions:v16 mkOptions:0 windowSize:v18 v19];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  [v7 openShortcutItem:v6];
}

- (id)searchPinsManager
{
  id v2 = [(MapsSceneDelegate *)self chromeViewController];
  objc_super v3 = [v2 searchPinsManager];

  return v3;
}

- (RAPPresenter)rapPresenter
{
  rapPresenter = self->_rapPresenter;
  if (!rapPresenter)
  {
    id v4 = [[RAPPresenter alloc] initWithSceneDelegate:self];
    id v5 = self->_rapPresenter;
    self->_rapPresenter = v4;

    rapPresenter = self->_rapPresenter;
  }

  return rapPresenter;
}

- (void)geoDaemonDisconnectNotificationHandler:(id)a3
{
  if (GEOConfigGetBOOL())
  {
    id v4 = +[MKSystemController sharedInstance];
    unsigned int v5 = [v4 isInternalInstall];

    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100CFBB9C;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)vkFaultNotificationHandler:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    unsigned int v5 = +[MKSystemController sharedInstance];
    unsigned int v6 = [v5 isInternalInstall];

    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100CFBE90;
      v7[3] = &unk_1012E5D58;
      id v8 = v4;
      id v9 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    }
  }
}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(MapsSceneDelegate *)self entryPointsCoordinator];
  [v11 openNotificationData:v10 forType:v9 recordIdentifier:v8];

  id v12 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  [v12 clearBulletinWithRecordID:v8];
}

- (void)presentMapsDebugControllerIfEnabled
{
  if (sub_100568D90())
  {
    [(MapsSceneDelegate *)self presentMapsDebugController];
  }
}

- (void)presentMapsDebugController
{
  if (!self->_mapsDebugController)
  {
    objc_super v3 = objc_alloc_init(MapsDebugController);
    mapsDebugController = self->_mapsDebugController;
    self->_mapsDebugController = v3;

    unsigned int v5 = [(MapsSceneDelegate *)self chromeViewController];
    [(MapsDebugValuesViewController *)self->_mapsDebugController setDelegate:v5];
  }
  debugNavigationController = self->_debugNavigationController;
  if (!debugNavigationController)
  {
    id v7 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_mapsDebugController];
    id v8 = self->_debugNavigationController;
    self->_debugNavigationController = v7;

    debugNavigationController = self->_debugNavigationController;
  }
  id v9 = [(UINavigationController *)debugNavigationController presentingViewController];

  if (!v9)
  {
    id v10 = self->_debugNavigationController;
    [(MapsSceneDelegate *)self presentViewController:v10 animated:1];
  }
}

- (void)dismissMapsDebugControllerWithCompletion:(id)a3
{
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v11 = v6;
    id v7 = [v6 presentingViewController];

    id v6 = v11;
    if (!v7)
    {
      id v8 = [(MapsSceneDelegate *)self topMostPresentedViewController];
      if ([v8 isViewLoaded])
      {
        id v9 = [v8 view];
        id v10 = [v9 window];

        if (v10)
        {
          [v11 setModalPresentationStyle:2];
          [v8 presentViewController:v11 animated:v4 completion:0];
        }
      }

      id v6 = v11;
    }
  }
}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(MapsSceneDelegate *)self appCoordinator];
  id v7 = [v6 baseActionCoordinator];
  [v5 setContaineeDelegate:v7];

  id v10 = [(MapsSceneDelegate *)self appCoordinator];
  id v8 = [v10 baseActionCoordinator];
  id v9 = [v8 containerViewController];
  [v9 presentController:v5 animated:1];
}

- (void)refreshTitle
{
  objc_super v3 = [(MapsSceneDelegate *)self appCoordinator];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100CFC570;
  v4[3] = &unk_1012E78C8;
  v4[4] = self;
  [v3 getCurrentSceneTitleWithCompletion:v4];
}

- (void)refreshTitleAfterShortDelay
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"refreshTitle" object:0];

  [(MapsSceneDelegate *)self performSelector:"refreshTitle" withObject:0 afterDelay:1.0];
}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  objc_super v3 = [(MapsSceneDelegate *)self appCoordinator];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PPTTestCoordinatorProtocol];

  if (v4)
  {
    id v5 = [(MapsSceneDelegate *)self appCoordinator];
  }
  else
  {
    id v5 = 0;
  }

  return (PPTTestCoordinatorProtocol *)v5;
}

- (void)setAppCoordinator:(id)a3
{
}

- (void)setChromeViewController:(id)a3
{
}

- (void)setEntryPointsCoordinator:(id)a3
{
}

- (void)setRapPresenter:(id)a3
{
}

- (void)setMapsActionController:(id)a3
{
}

- (void)setMapsActivityController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsActivityController, 0);
  objc_storeStrong((id *)&self->_mapsActionController, 0);
  objc_storeStrong((id *)&self->_rapPresenter, 0);
  objc_storeStrong((id *)&self->_entryPointsCoordinator, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_appCoordinator, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_mapsDebugController, 0);

  objc_storeStrong((id *)&self->_debugNavigationController, 0);
}

@end