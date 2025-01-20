@interface MapsAppDelegate
+ (BOOL)mapsIsLaunchedForTesting;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (AppCoordinator)appCoordinator;
- (ApplicationSessionController)appSessionController;
- (BKSProcessAssertion)priorityAssertion;
- (BOOL)_isShowingLocationServicesAuthorizationPrompt;
- (BOOL)_supportsModernTransitNavigation:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)applicationCanPromptToCalibrateHeading:(id)a3;
- (BOOL)canPlayTrace;
- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3;
- (BOOL)isCoreRoutineEnabled;
- (BOOL)useLargeLabelsPreferenceForAppkitBundle;
- (Class)appKitBundleClass;
- (FeedbackSubmissionManager)submissionManager;
- (IOSChromeViewController)chromeViewController;
- (IdleTimerController)idleTimerController;
- (MapsDistanceUnitUpdater)distanceUnitUpdater;
- (NSArray)allVisibleMapViews;
- (NSArray)allVisibleMapViewsButNotCarPlay;
- (POISearchManager)poiSearchManager;
- (PlatformController)platformController;
- (SiriNavStatusUpdater)siriNavStatusUpdater;
- (double)timeIntervalSinceLastBackgrounded;
- (id)_currentInterruptionHandle;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)currentTest;
- (id)entryPointsCoordinator;
- (id)hardwareModel;
- (id)legacyDataMigrator;
- (id)loadAppKitBundle;
- (id)mainVKMapView;
- (id)photoAttributionPreferencesManager;
- (id)sceneDelegateForTesting;
- (id)testCoordinator;
- (id)visibleMapViewFromCarPlay;
- (int64_t)currentInterruptionKind;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (unint64_t)lockedOrientations;
- (void)_acquireDoubleHeightStatusBarAssertionIfNeeded;
- (void)_acquireProcessAssertionForTurnByTurn:(BOOL)a3;
- (void)_acquireSecureAppAssertion;
- (void)_cleanupAfterLocationServicesAlertController;
- (void)_clearDoubleHeightStatusBar;
- (void)_localeDidChange:(id)a3;
- (void)_locationAuthorizationDismissed:(id)a3;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_maps_applicationDidBecomeActive:(id)a3;
- (void)_maps_applicationDidEnterBackground:(id)a3;
- (void)_maps_applicationWillEnterForeground:(id)a3;
- (void)_maps_applicationWillResignActive:(id)a3;
- (void)_performPostExtendedLaunchInitialization;
- (void)_presentLocationServicesAlertController:(id)a3;
- (void)_registerDefaults;
- (void)_releaseProcessAssertion;
- (void)_releaseSecureAppAssertion;
- (void)_setCanShowInLockscreen:(BOOL)a3;
- (void)_setCurrentInterruptionHandle:(id)a3;
- (void)_setShowingLocationServicesAuthorizationPrompt:(BOOL)a3;
- (void)_setupSharedLocationManager;
- (void)_startLegacyDataMigration;
- (void)_suppressNetworkFlags;
- (void)_unsuppressNetworkFlags;
- (void)_updateSecureAppAssertion;
- (void)_userDefaultsDidChange:(id)a3;
- (void)appkitBundleSetUseLargeLabels:(BOOL)a3;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationDidRemoveDeactivationReason:(id)a3;
- (void)applicationWillAddDeactivationReason:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)carDisplayControllerDidUpdateNavigationVisibility:(id)a3;
- (void)checkCoreRoutineEnabledState;
- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5;
- (void)chromeViewController:(id)a3 willMoveFromContextStack:(id)a4 toContextStack:(id)a5;
- (void)createSubmissionManagerIfNeeded;
- (void)dealloc;
- (void)dismissCurrentInterruption;
- (void)doPostLaunchTestSetup;
- (void)endBackgroundNavigation;
- (void)endTransitTurnByTurn;
- (void)endTurnByTurn:(id)a3;
- (void)fetchNotificationAuthUndetermined:(id)a3;
- (void)interruptApplicationWithKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (void)interruptConvertToNavigableSavedRouteID:(id)a3 routeName:(id)a4 error:(id)a5 directionsError:(id)a6;
- (void)migrateARPConsentDefaults:(id)a3;
- (void)migrateNavigoDefaults:(id)a3;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationService:(id)a3 didFailWithError:(id)a4;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)newScene;
- (void)notificationButtonPressedWithCompletionHandler:(id)a3;
- (void)preferencesPrivacyControllerDidDismiss:(id)a3;
- (void)prepareBackgroundNavigationWithMessage:(id)a3;
- (void)prepareForCarPlayLaunch;
- (void)presentAboutAndPrivacyScreen;
- (void)presentAddAMissingPlace;
- (void)presentAddAMissingPlaceWith:(id)a3;
- (void)presentMacARPPreferences;
- (void)presentMacGeneralPreferences;
- (void)presentMacPreferencesTabWithType:(int64_t)a3;
- (void)presentMacRoutePlannerPreferences;
- (void)presentRAP;
- (void)presentRadar;
- (void)presentRatingsAndPhotosPrivacyScreen;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)promptLocationServicesAuthorizationWithHandler:(id)a3;
- (void)promptLocationServicesOff;
- (void)promptPreciseLocationOff;
- (void)receivedFullyDrawnNotification;
- (void)requestNewTab:(id)a3;
- (void)requestNewWindow:(id)a3;
- (void)sendDidEnterBackgroundNotification;
- (void)setAppSessionController:(id)a3;
- (void)setCurrentTest:(id)a3;
- (void)setDistanceUnitUpdater:(id)a3;
- (void)setIdleTimerController:(id)a3;
- (void)setLockedOrientations:(unint64_t)a3;
- (void)setMapsIsShowingTour:(BOOL)a3;
- (void)setPriorityAssertion:(id)a3;
- (void)setSiriNavStatusUpdater:(id)a3;
- (void)setTrackingMode:(int64_t)a3 monitorBatteryState:(BOOL)a4;
- (void)showLocationServicesAlertWithError:(id)a3;
- (void)showNavigationAdvisoryIfNeeded;
- (void)startPreparedBackgroundNavigationWithMessage:(id)a3;
- (void)startTransitTurnByTurn;
- (void)startTurnByTurn:(id)a3;
- (void)toggleDisableMenuSharing;
- (void)toggleScrollingOpensPlacecard;
- (void)toggleSidebarSelection;
- (void)updateNavigationIdleTimerConfiguration;
- (void)updateWithGuidance:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MapsAppDelegate

- (void)prepareForCarPlayLaunch
{
  id v3 = +[CarDisplayController sharedInstance];
  [v3 prepareCarPlay];
  [v3 setDelegate:self];
  self->_carNavigationWasVisible = [v3 isAnyCarSceneHostingDrivingNavigation];
}

- (void)checkCoreRoutineEnabledState
{
  id v3 = +[RTRoutineManager defaultManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108A6C;
  v4[3] = &unk_1012F42C8;
  v4[4] = self;
  [v3 fetchRoutineStateWithHandler:v4];
}

- (id)legacyDataMigrator
{
  legacyDataMigrator = self->_legacyDataMigrator;
  if (!legacyDataMigrator)
  {
    v4 = objc_alloc_init(MapsLegacyDataMigrator);
    v5 = self->_legacyDataMigrator;
    self->_legacyDataMigrator = v4;

    legacyDataMigrator = self->_legacyDataMigrator;
  }

  return legacyDataMigrator;
}

- (double)timeIntervalSinceLastBackgrounded
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:@"LastSuspendTime"];
  double v4 = v3;

  v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];
  [v5 timeIntervalSinceNow];
  double v7 = fabs(v6);

  return v7;
}

- (void)_startLegacyDataMigration
{
  v2 = [(MapsAppDelegate *)self legacyDataMigrator];
  [v2 performMigration];

  id v3 = +[UIApplication sharedApplication];
  [v3 registerForRemoteNotifications];
}

- (void)_setupSharedLocationManager
{
  +[MKLocationManager setCanMonitorWiFiStatus:1];
  v2 = +[MKLocationManager sharedLocationManager];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_100103E7C;
  v4[4] = sub_1001047C8;
  id v5 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100695664;
  v3[3] = &unk_1012E83B0;
  v3[4] = v4;
  [v2 setNetworkActivity:v3];
  [v2 setActivityType:4];
  _Block_object_dispose(v4, 8);
}

- (void)_maps_applicationWillEnterForeground:(id)a3
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_maps_applicationWillEnterForeground:", v4, 2u);
  }

  +[MapsSettings clearSelectedViewModeIfExpired];
}

- (id)sceneDelegateForTesting
{
  if (!+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground])
  {
LABEL_4:
    id v3 = +[UIApplication _maps_keyMapsSceneDelegate];
    if ([v3 conformsToProtocol:&OBJC_PROTOCOL___PPTTestableProtocol]) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }

    goto LABEL_8;
  }
  id v2 = +[UIApplication _maps_carPlayApplicationSceneDelegate];
  if (([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestableProtocol] & 1) == 0)
  {

    goto LABEL_4;
  }
LABEL_8:

  return v2;
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Could not register for sync push notifications with error: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)mainVKMapView
{
  id v2 = [(MapsAppDelegate *)self sceneDelegateForTesting];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapView];
  id v5 = [v4 _mapLayer];

  return v5;
}

- (void)_maps_applicationDidBecomeActive:(id)a3
{
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "-_maps_applicationDidBecomeActive:", v9, 2u);
  }

  [(MapsAppDelegate *)self _startLegacyDataMigration];
  if (!self->_siriNavStatusUpdater)
  {
    id v5 = [SiriNavStatusUpdater alloc];
    int v6 = +[MNNavigationService sharedService];
    id v7 = [(SiriNavStatusUpdater *)v5 initWithNavigationService:v6];
    siriNavStatusUpdater = self->_siriNavStatusUpdater;
    self->_siriNavStatusUpdater = v7;
  }
  [(MapsAppDelegate *)self checkCoreRoutineEnabledState];
}

- (id)currentTest
{
  return +[_MapsApplicationDelegateTestingCoordinator currentTest];
}

- (void)applicationWillAddDeactivationReason:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v5 = [v4 integerValue];

  if (v5 == 1)
  {
    int v6 = +[MKMapService sharedService];
    id v8 = v6;
    uint64_t v7 = 710;
  }
  else
  {
    if (v5 != 2) {
      return;
    }
    int v6 = +[MKMapService sharedService];
    id v8 = v6;
    uint64_t v7 = 709;
  }
  [v6 captureUserAction:26 onTarget:v7 eventValue:0];
}

- (void)_registerDefaults
{
  v10[0] = @"LastViewMode";
  id v2 = +[NSNumber numberWithInt:0];
  v11[0] = v2;
  v10[1] = @"SearchMode";
  id v3 = +[NSNumber numberWithInt:1];
  v11[1] = v3;
  v11[2] = @"YES";
  v10[2] = @"PlaybackControls";
  v10[3] = @"TraceBookmarksAlert";
  v11[3] = @"NO";
  v11[4] = @"YES";
  v10[4] = @"__internal__AlwaysShowRouteTraffic";
  v10[5] = @"MapsWalkingEnableImageBasedHeading";
  v11[5] = &__kCFBooleanTrue;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = @"MapsEnablePedestrianARRaiseToStart";
  v10[7] = @"PedestrianARAutoFocusEnabledKey";
  v11[7] = &__kCFBooleanTrue;
  v11[8] = &__kCFBooleanTrue;
  v10[8] = @"PedestrianAREnableLowerToExitKey";
  v10[9] = @"PedestrianARSafetyUIKey";
  v11[9] = &__kCFBooleanTrue;
  v11[10] = &__kCFBooleanTrue;
  v10[10] = @"PedestrianARTTRButtonEnabledKey";
  v10[11] = @"PedestrianARIndoorOutdoorDetectionInterval";
  v11[11] = &off_1013AF108;
  v11[12] = &__kCFBooleanTrue;
  v10[12] = @"VLFSessionIgnoreFusedLocationForReplayKey";
  v10[13] = @"VLFSessionAppLaunchDelayMonitorAffectsPuckVisibilityKey";
  v11[13] = &__kCFBooleanTrue;
  v11[14] = &__kCFBooleanTrue;
  v10[14] = @"VLFSessionAppLaunchDelayMonitorAffectsBannerVisibilityKey";
  v10[15] = @"VLFSessionCarPlayConnectionMonitorAffectsPuckVisibilityKey";
  v11[15] = &__kCFBooleanTrue;
  v11[16] = &__kCFBooleanTrue;
  v10[16] = @"VLFSessionCarPlayConnectionMonitorAffectsBannerVisibilityKey";
  v10[17] = @"VLFSessionChromeStackMonitorAffectsPuckVisibilityKey";
  v11[17] = &__kCFBooleanTrue;
  v11[18] = &__kCFBooleanTrue;
  v10[18] = @"VLFSessionChromeStackMonitorAffectsBannerVisibilityKey";
  v10[19] = @"VLFSessionCoarseLocationMonitorAffectsPuckVisibilityKey";
  v11[19] = &__kCFBooleanTrue;
  v11[20] = &__kCFBooleanTrue;
  v10[20] = @"VLFSessionCoarseLocationMonitorAffectsBannerVisibilityKey";
  v10[21] = @"VLFSessionHistoricalLocationAccuracyMonitorAffectsPuckVisibilityKey";
  v11[21] = &__kCFBooleanTrue;
  v11[22] = &__kCFBooleanFalse;
  v10[22] = @"VLFSessionHistoricalLocationAccuracyMonitorAffectsBannerVisibilityKey";
  v10[23] = @"VLFSessionHomeWorkMonitorAffectsPuckVisibilityKey";
  v11[23] = &__kCFBooleanTrue;
  v11[24] = &__kCFBooleanTrue;
  v10[24] = @"VLFSessionHomeWorkMonitorAffectsBannerVisibilityKey";
  v10[25] = @"VLFSessionLocationHorizontalAccuracyMonitorAffectsPuckVisibilityKey";
  v11[25] = &__kCFBooleanTrue;
  v11[26] = &__kCFBooleanTrue;
  v10[26] = @"VLFSessionLocationHorizontalAccuracyMonitorAffectsBannerVisibilityKey";
  v10[27] = @"VLFSessionLocationOutdoorMonitorAffectsPuckVisibilityKey";
  v11[27] = &__kCFBooleanTrue;
  v11[28] = &__kCFBooleanTrue;
  v10[28] = @"VLFSessionLocationOutdoorMonitorAffectsBannerVisibilityKey";
  v10[29] = @"VLFSessionLocationTypeMonitorAffectsPuckVisibilityKey";
  v11[29] = &__kCFBooleanTrue;
  v11[30] = &__kCFBooleanTrue;
  v10[30] = @"VLFSessionLocationTypeMonitorAffectsBannerVisibilityKey";
  v10[31] = @"VLFSessionLocationSignalEnvironmentMonitorAffectsPuckVisibilityKey";
  v11[31] = &__kCFBooleanTrue;
  v11[32] = &__kCFBooleanTrue;
  v10[32] = @"VLFSessionLocationSignalEnvironmentMonitorAffectsBannerVisibilityKey";
  v10[33] = @"VLFSessionMapsHomeMonitorAffectsPuckVisibilityKey";
  v11[33] = &__kCFBooleanFalse;
  v11[34] = &__kCFBooleanTrue;
  v10[34] = @"VLFSessionMapsHomeMonitorAffectsBannerVisibilityKey";
  v10[35] = @"VLFSessionNetworkReachabilityMonitorAffectsPuckVisibilityKey";
  v11[35] = &__kCFBooleanTrue;
  v11[36] = &__kCFBooleanTrue;
  v10[36] = @"VLFSessionNetworkReachabilityMonitorAffectsBannerVisibilityKey";
  v10[37] = @"VLFSessionSunsetSunriseMonitorAffectsPuckVisibilityKey";
  v11[37] = &__kCFBooleanTrue;
  v11[38] = &__kCFBooleanFalse;
  v10[38] = @"VLFSessionSunsetSunriseMonitorAffectsBannerVisibilityKey";
  v10[39] = @"VLFSessionThermalStateMonitorAffectsPuckVisibilityKey";
  v11[39] = &__kCFBooleanTrue;
  v11[40] = &__kCFBooleanTrue;
  v10[40] = @"VLFSessionThermalStateMonitorAffectsBannerVisibilityKey";
  v10[41] = @"VLFSessionTransitSteppingMonitorAffectsPuckVisibilityKey";
  v10[42] = @"VLFSessionTransitSteppingMonitorAffectsBannerVisibilityKey";
  v10[43] = @"VLFSessionTileAvailabilityMonitorAffectsPuckVisibilityKey";
  v11[41] = &__kCFBooleanTrue;
  v11[42] = &__kCFBooleanTrue;
  v10[44] = @"VLFSessionTileAvailabilityMonitorAffectsBannerVisibilityKey";
  v10[45] = @"VLFSessionUsageMonitorAffectsPuckVisibilityKey";
  v11[43] = &__kCFBooleanTrue;
  v11[44] = &__kCFBooleanTrue;
  v11[45] = &__kCFBooleanFalse;
  v11[46] = &__kCFBooleanTrue;
  v10[46] = @"VLFSessionUsageMonitorAffectsBannerVisibilityKey";
  v10[47] = @"NavigationShowRawGPSTrail";
  v11[47] = @"NO";
  v11[48] = @"NO";
  v10[48] = @"NavigationShowMatchedLocationTrail";
  v10[49] = @"EnableEnvironmentSelectionInSettings";
  id v4 = +[MKSystemController sharedInstance];
  unsigned int v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isInternalInstall]);
  v11[49] = v5;
  v10[50] = @"EnableCustomEnvironmentsInSettings";
  int v6 = +[MKSystemController sharedInstance];
  uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isInternalInstall]);
  v10[51] = @"SCROLLING_OPENS_PLACECARD_KEY_ROTATED";
  v11[50] = v7;
  v11[51] = @"YES";
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:52];

  v9 = +[NSUserDefaults standardUserDefaults];
  [v9 registerDefaults:v8];
}

- (void)applicationDidRemoveDeactivationReason:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v5 = [v4 integerValue];

  if (v5 == 1)
  {
    int v6 = +[MKMapService sharedService];
    id v8 = v6;
    uint64_t v7 = 710;
  }
  else
  {
    if (v5 != 2) {
      return;
    }
    int v6 = +[MKMapService sharedService];
    id v8 = v6;
    uint64_t v7 = 709;
  }
  [v6 captureUserAction:27 onTarget:v7 eventValue:0];
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "application:configurationForConnectingSceneSession: %@, options: %@", (uint8_t *)&v23, 0x16u);
  }

  v9 = [v6 role];
  v10 = +[UISceneConfiguration configurationWithName:0 sessionRole:v9];

  v11 = [v6 role];
  unsigned int v12 = [v11 isEqualToString:UIWindowSceneSessionRoleApplication];

  if (v12)
  {
    v13 = [v7 userActivities];
    v14 = [v13 anyObject];
    v15 = [v14 activityType];
    [v15 isEqualToString:@"com.apple.Maps.MacPlacePhotoViewer"];

LABEL_7:
    [v10 setDelegateClass:objc_opt_class()];
    goto LABEL_8;
  }
  v16 = [v6 role];
  int v17 = [v16 isEqualToString:_UIWindowSceneSessionTypeCoverSheet];

  if (v17) {
    goto LABEL_7;
  }
  v18 = [v6 role];
  unsigned int v19 = [v18 isEqualToString:_UIWindowSceneSessionRoleCarPlay];

  if (v19) {
    goto LABEL_7;
  }
LABEL_8:
  v20 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [v10 delegateClass];
    int v23 = 138412546;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "application:configurationForConnectingSceneSession:options: sceneConfiguration: %@, delegateClass: %@", (uint8_t *)&v23, 0x16u);
  }

  return v10;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "application:didFinishLaunchingWithOptions: %@", (uint8_t *)&v18, 0xCu);
  }

  id v7 = sub_1000A930C();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DidFinishLaunching", "", (uint8_t *)&v18, 2u);
  }

  id v8 = sub_1000A930C();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CarPlaySetup", "", (uint8_t *)&v18, 2u);
  }

  v9 = +[CarDisplayController sharedInstance];
  [v9 didFinishLaunchingSuspendedWithOptions:v5];

  v10 = sub_1000A930C();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CarPlaySetup", "", (uint8_t *)&v18, 2u);
  }

  v11 = sub_1000A930C();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NetworkFlags", "", (uint8_t *)&v18, 2u);
  }

  [(MapsAppDelegate *)self _unsuppressNetworkFlags];
  unsigned int v12 = sub_1000A930C();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NetworkFlags", "", (uint8_t *)&v18, 2u);
  }

  v13 = sub_1000A930C();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeActivityItemsConfiguration", "", (uint8_t *)&v18, 2u);
  }

  v14 = objc_alloc_init(MapsActivityItemsConfiguration);
  [(MapsAppDelegate *)self setActivityItemsConfiguration:v14];

  v15 = sub_1000A930C();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeActivityItemsConfiguration", "", (uint8_t *)&v18, 2u);
  }

  v16 = sub_1000A930C();
  if (os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DidFinishLaunching", "", (uint8_t *)&v18, 2u);
  }

  return 1;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  GEOFindOrCreateLog();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "application:willFinishLaunchingWithOptions: %@", buf, 0xCu);
  }

  v9 = sub_1000A930C();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillFinishLaunching", "", buf, 2u);
  }

  byte_10160F520 = [v6 launchedToTest];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 bundleIdentifier];
  unsigned int v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, 0);
  SBSSetAlertSuppressionContexts();

  +[GEOUserSession setInitialShareSessionWithMaps:1];
  v13 = sub_1000A930C();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetInstallState", "", buf, 2u);
  }

  +[MSPMapsInstallState setRunningInsideMapsApp];
  v14 = sub_1000A930C();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetInstallState", "", buf, 2u);
  }

  v15 = +[GEOPlatform sharedPlatform];
  v16 = [v15 hardwareIdentifier];

  int v17 = +[GEOMapService sharedService];
  [v17 setDefaultTraitsHardwareIdentifier:v16];

  int v18 = +[GEOPlatform sharedPlatform];
  [v18 setClientCapabilitiesHardwareIdentifier:v16];

  id v19 = sub_1000A930C();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartOfflineService", "", buf, 2u);
  }

  v20 = +[MapsOfflineHelper sharedHelper];
  [v20 startServiceIfEnabled];

  id v21 = sub_1000A930C();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartOfflineService", "", buf, 2u);
  }

  v22 = sub_1000A930C();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchVirtualGarageSetup", "", buf, 2u);
  }

  id v23 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v24 = sub_1000A930C();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchVirtualGarageSetup", "", buf, 2u);
  }

  __int16 v25 = sub_1000A930C();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NavigationServiceSetup", "", buf, 2u);
  }

  id v26 = +[MNNavigationService sharedService];
  [v26 registerObserver:self];

  id v27 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  v28 = sub_1000A930C();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NavigationServiceSetup", "", buf, 2u);
  }

  v29 = sub_1000A930C();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartIPCServer", "", buf, 2u);
  }

  v30 = +[IPCServer sharedServer];
  [v30 setBackgroundNavigationDelegate:self];

  v31 = sub_1000A930C();
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartIPCServer", "", buf, 2u);
  }

  v32 = sub_1000A930C();
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddNotificationObservers", "", buf, 2u);
  }

  v33 = +[NSNotificationCenter defaultCenter];
  [v33 addObserver:self selector:"_maps_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

  v34 = +[NSNotificationCenter defaultCenter];
  [v34 addObserver:self selector:"_maps_applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

  v35 = +[NSNotificationCenter defaultCenter];
  [v35 addObserver:self selector:"_maps_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

  v36 = +[NSNotificationCenter defaultCenter];
  [v36 addObserver:self selector:"_maps_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

  v37 = +[NSNotificationCenter defaultCenter];
  [v37 addObserver:self selector:"_userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

  v38 = +[NSNotificationCenter defaultCenter];
  [v38 addObserver:self selector:"_localeDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

  v39 = +[NSNotificationCenter defaultCenter];
  [v39 addObserver:self selector:"applicationWillAddDeactivationReason:" name:_UIApplicationWillAddDeactivationReasonNotification object:0];

  v40 = +[NSNotificationCenter defaultCenter];
  [v40 addObserver:self selector:"applicationDidRemoveDeactivationReason:" name:_UIApplicationDidRemoveDeactivationReasonNotification object:0];

  v41 = sub_1000A930C();
  if (os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddNotificationObservers", "", buf, 2u);
  }

  v42 = sub_1000A930C();
  if (os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrepareCarPlayLaunch", "", buf, 2u);
  }

  [(MapsAppDelegate *)self prepareForCarPlayLaunch];
  v43 = sub_1000A930C();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrepareCarPlayLaunch", "", buf, 2u);
  }

  v44 = sub_1000A930C();
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MigrateARPDefaults", "", buf, 2u);
  }

  v45 = +[NSUserDefaults standardUserDefaults];
  [(MapsAppDelegate *)self migrateARPConsentDefaults:v45];

  v46 = sub_1000A930C();
  if (os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MigrateARPDefaults", "", buf, 2u);
  }

  v47 = sub_1000A930C();
  if (os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RegisterDefaults", "", buf, 2u);
  }

  [(MapsAppDelegate *)self _registerDefaults];
  v48 = sub_1000A930C();
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RegisterDefaults", "", buf, 2u);
  }

  v49 = sub_1000A930C();
  if (os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeLocationManager", "", buf, 2u);
  }

  [(MapsAppDelegate *)self _setupSharedLocationManager];
  v50 = sub_1000A930C();
  if (os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeLocationManager", "", buf, 2u);
  }

  v51 = sub_1000A930C();
  if (os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMeasurementUnits", "", buf, 2u);
  }

  +[MapsSettings setSystemMeasurementUnits];
  v52 = sub_1000A930C();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMeasurementUnits", "", buf, 2u);
  }

  v53 = +[UNUserNotificationCenter currentNotificationCenter];
  [v53 setDelegate:self];

  if ([UIApp shouldLaunchSafe])
  {
    GEOResetAllDefaults();
    v54 = +[NSUserDefaults __maps_groupUserDefaults];
    [v54 removeObjectForKey:@"MapsActivity"];

    v55 = +[NSUserDefaults standardUserDefaults];
    [v55 removeObjectForKey:@"WebBasedPlacecardManifest"];
  }
  if ([UIApp launchedToTest])
  {
    [(MapsAppDelegate *)self doPostLaunchTestSetup];
  }
  else
  {
    v56 = +[NSNotificationCenter defaultCenter];
    [v56 addObserver:self selector:"receivedFullyDrawnNotification" name:VKMapViewDidBecomeFullyDrawnNotification object:0];
  }
  v57 = sub_1000A930C();
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeMapsXPCConnections", "", buf, 2u);
  }

  id v58 = +[MapsXPCConnectionsManager sharedManager];
  v59 = sub_1000A930C();
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeMapsXPCConnections", "", buf, 2u);
  }

  v60 = sub_1000A930C();
  if (os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsSignalPack", "", buf, 2u);
  }

  v61 = +[MKMapsSuggestionsPredictor sharedPredictor];
  v62 = +[MapsSuggestionsPredictor sharedPredictor];
  [v61 setSignalPackCacheInterface:v62];

  v63 = sub_1000A930C();
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsSignalPack", "", buf, 2u);
  }

  v64 = sub_1000A930C();
  if (os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SharedTripContactsSetup", "", buf, 2u);
  }

  +[MSPSharedTripContact _maps_prepareForFirstUse];
  v65 = sub_1000A930C();
  if (os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SharedTripContactsSetup", "", buf, 2u);
  }

  if (MGGetBoolAnswer())
  {
    v66 = sub_1000A930C();
    if (os_signpost_enabled(v66))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SiriContext", "", buf, 2u);
    }

    v67 = +[AFContextManager defaultContextManager];
    v68 = +[MapsSiriContextProvider sharedContextProvider];
    [v67 addContextProvider:v68];

    v69 = sub_1000A930C();
    if (os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SiriContext", "", buf, 2u);
    }
  }
  v70 = sub_1000A930C();
  if (os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillFinishLaunching", "", buf, 2u);
  }

  return 1;
}

- (void)updateWithGuidance:(id)a3
{
  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  id v5 = a3;
  [(NavigationIdleTimerProvider *)navigationIdleTimerProvider updateGuidanceState:v5];
  [(NavigationIdleTimerProvider *)self->_transitIdleTimerProvider updateGuidanceState:v5];
}

- (ApplicationSessionController)appSessionController
{
  appSessionController = self->_appSessionController;
  if (!appSessionController)
  {
    id v4 = objc_alloc_init(ApplicationSessionController);
    id v5 = self->_appSessionController;
    self->_appSessionController = v4;

    appSessionController = self->_appSessionController;
  }

  return appSessionController;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  if (![(MapsAppDelegate *)self lockedOrientations]) {
    return 30;
  }

  return [(MapsAppDelegate *)self lockedOrientations];
}

- (unint64_t)lockedOrientations
{
  return self->_lockedOrientations;
}

- (void)_userDefaultsDidChange:(id)a3
{
}

- (void)doPostLaunchTestSetup
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018660;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (FeedbackSubmissionManager)submissionManager
{
  [(MapsAppDelegate *)self createSubmissionManagerIfNeeded];
  submissionManager = self->_submissionManager;

  return submissionManager;
}

- (void)createSubmissionManagerIfNeeded
{
  if (!self->_submissionManager)
  {
    id v3 = objc_alloc_init(FeedbackSubmissionManager);
    submissionManager = self->_submissionManager;
    self->_submissionManager = v3;
  }
}

- (void)migrateARPConsentDefaults:(id)a3
{
  id v3 = a3;
  if (([v3 BOOLForKey:@"MigratedARPConsentPreference"] & 1) == 0)
  {
    GEOConfigGetBOOL();
    GEOConfigSetInteger();
    [v3 setBool:1 forKey:@"MigratedARPConsentPreference"];
    _GEOConfigRemoveValue();
  }
}

- (void)_unsuppressNetworkFlags
{
  uint64_t v2 = SBSSpringBoardServerPort();

  _SBSetApplicationNetworkFlags(v2, 1, 1);
}

+ (BOOL)mapsIsLaunchedForTesting
{
  id v2 = a1;
  objc_sync_enter(v2);
  char v3 = byte_10160F520;
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  char v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [UIApp setDelegate:0];
  [(MapsAppDelegate *)self _releaseSecureAppAssertion];
  id v4 = +[IPCServer sharedServer];
  [v4 setBackgroundNavigationDelegate:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  if (MGGetBoolAnswer())
  {
    id v6 = +[AFContextManager defaultContextManager];
    id v7 = +[MapsSiriContextProvider sharedContextProvider];
    [v6 removeContextProvider:v7];
  }
  [(BKSProcessAssertion *)self->_priorityAssertion invalidate];
  v8.receiver = self;
  v8.super_class = (Class)MapsAppDelegate;
  [(MapsAppDelegate *)&v8 dealloc];
}

- (PlatformController)platformController
{
  id v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  char v3 = [v2 platformController];

  return (PlatformController *)v3;
}

- (AppCoordinator)appCoordinator
{
  id v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  char v3 = [v2 appCoordinator];

  return (AppCoordinator *)v3;
}

- (IOSChromeViewController)chromeViewController
{
  id v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  char v3 = [v2 chromeViewController];

  return (IOSChromeViewController *)v3;
}

- (id)entryPointsCoordinator
{
  id v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  char v3 = [v2 entryPointsCoordinator];

  return v3;
}

- (IdleTimerController)idleTimerController
{
  idleTimerController = self->_idleTimerController;
  if (!idleTimerController)
  {
    id v4 = objc_alloc_init(IdleTimerController);
    id v5 = self->_idleTimerController;
    self->_idleTimerController = v4;

    idleTimerController = self->_idleTimerController;
  }

  return idleTimerController;
}

- (POISearchManager)poiSearchManager
{
  poiSearchManager = self->_poiSearchManager;
  if (!poiSearchManager)
  {
    id v4 = objc_alloc_init(POISearchManager);
    id v5 = self->_poiSearchManager;
    self->_poiSearchManager = v4;

    poiSearchManager = self->_poiSearchManager;
  }

  return poiSearchManager;
}

- (void)sendDidEnterBackgroundNotification
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MapsApplicationDidEnterBackgroundNotification" object:UIApp];
}

- (void)receivedFullyDrawnNotification
{
  char v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

  id v4 = +[UIApplication sharedApplication];
  if ([v4 shouldRecordExtendedLaunchTime]) {
    [v4 finishedTest:@"launch" extraResults:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100695840;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performPostExtendedLaunchInitialization
{
  char v3 = sub_1000A930C();
  if (os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PostExtendedLaunchInitialization", "", (uint8_t *)buf, 2u);
  }

  if (!self->_distanceUnitUpdater)
  {
    id v4 = objc_alloc_init(MapsDistanceUnitUpdater);
    distanceUnitUpdater = self->_distanceUnitUpdater;
    self->_distanceUnitUpdater = v4;

    [(MapsDistanceUnitUpdater *)self->_distanceUnitUpdater start];
  }
  if (!self->_placeholderGridCache)
  {
    id v6 = +[MUPlaceholderGridCache unretainedInstance];
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v6;

    [(MUPlaceholderGridCache *)self->_placeholderGridCache loadPlaceholderGridImages];
  }
  objc_initWeak(buf, self);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100695A34;
  v14 = &unk_1012E6708;
  objc_copyWeak(&v15, buf);
  geo_dispatch_async_qos();
  objc_super v8 = +[MapsMetroAnalyticsManager sharedManager];
  [v8 startMonitoring];

  v9 = sub_1000A930C();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PostExtendedLaunchInitialization", "", v10, 2u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  objc_super v8 = (void (**)(void))a5;
  if (+[FeedbackSubmissionManager canHandleSessionIdentifier:v7])
  {
    v9 = sub_100109EF8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received a call from the app delegate with identifier %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = [(MapsAppDelegate *)self submissionManager];
    [v10 updateEventsForBackgroundURLSessionWithCompletionHandler:v8];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "-applicationWillTerminate:", v10, 2u);
  }

  if (self->_isNavigatingTurnByTurn)
  {
    id v5 = +[MKMapService sharedService];
    [v5 captureUserAction:3002 onTarget:0 eventValue:0];
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"NavigationUserActivityDefault"];

  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 removeObjectForKey:@"NavigationRestorationAttempts"];

  objc_super v8 = +[MNNavigationService sharedService];
  [v8 stopNavigationWithReason:9];

  v9 = +[MNNavigationService sharedService];
  [v9 unregisterObserver:self];
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  char v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "applicationDidReceiveMemoryWarning:", v4, 2u);
  }
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Registered for sync push notifications with token: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  int v6 = (void (**)(id, uint64_t))a5;
  v6[2](v6, 2 * ([a3 applicationState] == (id)2));
}

- (void)_maps_applicationWillResignActive:(id)a3
{
  char v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_maps_applicationWillResignActive:", v5, 2u);
  }

  id v4 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  [v4 closeConnection];
}

- (void)_maps_applicationDidEnterBackground:(id)a3
{
  char v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "-_maps_applicationDidEnterBackground:", v5, 2u);
  }

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setDouble:@"LastSuspendTime" forKey:CFAbsoluteTimeGetCurrent()];
}

- (BOOL)applicationCanPromptToCalibrateHeading:(id)a3
{
  return 0;
}

- (void)migrateNavigoDefaults:(id)a3
{
  id v4 = a3;
  if (([v4 BOOLForKey:@"MigratedNavigoAppPreferences"] & 1) == 0)
  {
    char v3 = [v4 objectForKey:@"DefaultsDistanceUnits"];
    if (([v3 isEqualToString:@"Imperial"] & 1) != 0
      || [v3 isEqualToString:@"Metric"])
    {
      +[MapsSettings setValue:v3 forDefaultsKey:@"DistanceUnits" bundleID:0 syncToNano:0];
    }
    [v4 setBool:1 forKey:@"MigratedNavigoAppPreferences"];
  }
}

- (void)_localeDidChange:(id)a3
{
}

- (void)carDisplayControllerDidUpdateNavigationVisibility:(id)a3
{
  id v4 = a3;
  id v5 = +[MapsLightLevelController sharedController];
  [v5 reloadForChangedLightLevelTrackers];

  unsigned int v6 = [v4 isAnyCarSceneHostingDrivingNavigation];
  if (self->_carNavigationWasVisible != v6)
  {
    self->_carNavigationWasVisible = v6;
    if (v6)
    {
      [(MapsAppDelegate *)self _releaseSecureAppAssertion];
      id v8 = [(MapsAppDelegate *)self appCoordinator];
      [v8 showFullscreenDirectionsList];
    }
    else if (self->_isNavigatingTurnByTurn)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100696244;
      v11[3] = &unk_1012E5D08;
      v11[4] = self;
      id v7 = objc_retainBlock(v11);
      if (+[UIApplication _maps_isAnySceneConnectedForRole:UIWindowSceneSessionRoleApplication])
      {
        ((void (*)(void *))v7[2])(v7);
      }
      else
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10069629C;
        v9[3] = &unk_1012E76C0;
        v10 = v7;
        +[UIApplication _maps_openApplicationSceneSuspendedWithCompletion:v9];
      }
    }
  }
}

- (void)_suppressNetworkFlags
{
  uint64_t v2 = SBSSpringBoardServerPort();

  _SBSetApplicationNetworkFlags(v2, 0, 0);
}

- (void)_acquireDoubleHeightStatusBarAssertionIfNeeded
{
  if (!self->_doubleHeightStatusBarAssertion)
  {
    char v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Acquiring navigation status bar assertion", v8, 2u);
    }

    id v4 = (SBSStatusBarStyleOverridesAssertion *)[objc_alloc((Class)SBSStatusBarStyleOverridesAssertion) initWithStatusBarStyleOverrides:128 forPID:getpid() exclusive:0 showsWhenForeground:0];
    doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
    self->_doubleHeightStatusBarAssertion = v4;

    unsigned int v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Touch to return to Navigation" value:@"localized string not found" table:0];
    [(SBSStatusBarStyleOverridesAssertion *)self->_doubleHeightStatusBarAssertion setStatusString:v7];

    [(SBSStatusBarStyleOverridesAssertion *)self->_doubleHeightStatusBarAssertion acquireWithHandler:&stru_1012F42E8 invalidationHandler:&stru_1012F4308];
  }
}

- (void)_clearDoubleHeightStatusBar
{
  if (self->_doubleHeightStatusBarAssertion)
  {
    char v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating navigation status bar assertion", v5, 2u);
    }

    [(SBSStatusBarStyleOverridesAssertion *)self->_doubleHeightStatusBarAssertion invalidate];
    doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
    self->_doubleHeightStatusBarAssertion = 0;
  }
}

- (void)setTrackingMode:(int64_t)a3 monitorBatteryState:(BOOL)a4
{
  int isTrackingLocation = self->_isTrackingLocation;
  int v5 = a3 != 0;
  self->_int isTrackingLocation = v5;
  if (isTrackingLocation != v5)
  {
    uint64_t v6 = 1;
    if (a4) {
      uint64_t v6 = 2;
    }
    if (a3) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [(MapsAppDelegate *)self idleTimerController];
    [v8 setDesiredIdleTimerState:v7 forReason:0];
  }
}

- (void)setMapsIsShowingTour:(BOOL)a3
{
  BOOL isShowingTour = self->_isShowingTour;
  self->_BOOL isShowingTour = a3;
  if (isShowingTour || !a3)
  {
    if (isShowingTour && !a3)
    {
      dispatch_time_t v6 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100696820;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    id v7 = [(MapsAppDelegate *)self idleTimerController];
    [v7 setDesiredIdleTimerState:1 forReason:1];
  }
}

- (void)updateNavigationIdleTimerConfiguration
{
}

- (void)_setCanShowInLockscreen:(BOOL)a3
{
  if (self->_canShowInLockscreen != a3)
  {
    self->_BOOL canShowInLockscreen = a3;
    id v4 = [(MapsAppDelegate *)self appSessionController];
    int v5 = [v4 currentlyNavigatingCoverSheetSceneAssociation];
    dispatch_time_t v6 = [v5 mapsScene];
    id v7 = [v6 delegate];

    id v8 = [v7 chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    BOOL canShowInLockscreen = self->_canShowInLockscreen;
    id v12 = GEOFindOrCreateLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (canShowInLockscreen)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Now able to show in lockscreen", buf, 2u);
      }

      v14 = +[GEOTileLoader modernLoader];
      [v14 openForClient:@"LockScreenNav"];

      id v15 = +[GEOResourceManifestManager modernManager];
      [v15 openServerConnection];

      [(MapsAppDelegate *)self acquireSecureAppAssertionIfNeeded];
      [v10 addContextStackObserver:self];
    }
    else
    {
      if (v13)
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No longer able to show in lockscreen", v17, 2u);
      }

      [v10 removeContextStackObserver:self];
      [(MapsAppDelegate *)self _releaseSecureAppAssertion];
      v16 = +[GEOTileLoader modernLoader];
      [v16 closeForClient:@"LockScreenNav"];

      id v10 = +[GEOResourceManifestManager modernManager];
      [v10 closeServerConnection];
    }
  }
}

- (void)_updateSecureAppAssertion
{
  if (self->_canShowInLockscreen)
  {
    char v3 = [(MapsAppDelegate *)self appSessionController];
    id v4 = [v3 currentlyNavigatingCoverSheetSceneAssociation];
    int v5 = [v4 mapsScene];
    dispatch_time_t v6 = [v5 delegate];

    id v7 = [v6 chromeViewController];

    if (!v7)
    {
      int v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No chrome is navigating", buf, 2u);
      }

      [(MapsAppDelegate *)self _releaseSecureAppAssertion];
      goto LABEL_45;
    }
    id v8 = [v6 chromeViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      int v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [v6 chromeViewController];
        *(_DWORD *)buf = 138412290;
        v33 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Chrome not ready to take secure app assertion: %@", buf, 0xCu);
      }
      goto LABEL_45;
    }
    id v10 = [v6 chromeViewController];
    int v11 = [v10 topIOSBasedContext];
    if ([v11 conformsToProtocol:&OBJC_PROTOCOL___LockScreenProtocol])
    {
      if (objc_opt_respondsToSelector() & 1) == 0 || ([v11 supportsLockscreen])
      {
        id v12 = +[CarDisplayController sharedInstance];
        unsigned int v13 = [v12 isAnyCarSceneHostingNavigation];

        if (v13)
        {
          v14 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            id v15 = "Not taking secure app assertion for Maps navigation: CarPlay is hosting navigation";
LABEL_30:
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
          }
        }
        else
        {
          if (![(NavigationThermalWarningController *)self->_thermalWarningController isDeviceMelting])
          {
            [(MapsAppDelegate *)self _acquireSecureAppAssertion];
            goto LABEL_44;
          }
          v14 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            id v15 = "Not taking secure app assertion for Maps navigation: thermal level is too high";
            goto LABEL_30;
          }
        }
LABEL_43:

        [(MapsAppDelegate *)self _releaseSecureAppAssertion];
LABEL_44:

LABEL_45:
        return;
      }
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v26 = v11;
        if (!v26)
        {
          __int16 v25 = @"<nil>";
          goto LABEL_50;
        }
        id v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        if (objc_opt_respondsToSelector())
        {
          v29 = [v26 performSelector:"accessibilityIdentifier"];
          v30 = v29;
          if (v29 && ![v29 isEqualToString:v28])
          {
            __int16 v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

            goto LABEL_38;
          }
        }
        __int16 v25 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_38:

LABEL_50:
        *(_DWORD *)buf = 138412290;
        v33 = v25;
        v31 = "Not taking secure app assertion, topContext %@ reports that it currently does not support the lockscreen";
        goto LABEL_41;
      }
LABEL_42:

      goto LABEL_43;
    }
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_42;
    }
    id v20 = v11;
    if (!v20)
    {
      __int16 v25 = @"<nil>";
      goto LABEL_40;
    }
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    if (objc_opt_respondsToSelector())
    {
      id v23 = [v20 performSelector:"accessibilityIdentifier"];
      id v24 = v23;
      if (v23 && ![v23 isEqualToString:v22])
      {
        __int16 v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

        goto LABEL_26;
      }
    }
    __int16 v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_26:

LABEL_40:
    *(_DWORD *)buf = 138412290;
    v33 = v25;
    v31 = "Not taking secure app assertion for Maps navigation: top mode %@ doesn't conform to LockScreenProtocol";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v31, buf, 0xCu);

    goto LABEL_42;
  }
  v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not taking secure app assertion for Maps navigation: not permitted", buf, 2u);
  }

  [(MapsAppDelegate *)self _releaseSecureAppAssertion];
}

- (void)_acquireSecureAppAssertion
{
  secureAppAssertion = self->_secureAppAssertion;
  id v4 = GEOFindOrCreateLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (secureAppAssertion)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not taking secure app assertion for Maps navigation: we already have one", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Taking secure app assertion for Maps navigation", v7, 2u);
    }

    dispatch_time_t v6 = +[SBSSecureAppAssertion acquireContentProviderAssertionForType:2 slot:SBSLockScreenContentAssertionSlotApp identifier:@"com.apple.Maps" errorHandler:&stru_1012F4328];
    id v4 = self->_secureAppAssertion;
    self->_secureAppAssertion = v6;
  }
}

- (void)_releaseSecureAppAssertion
{
  if (self->_secureAppAssertion)
  {
    char v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Releasing secure app assertion for Maps navigation", v5, 2u);
    }

    [(SBSSecureAppAssertion *)self->_secureAppAssertion invalidate];
    secureAppAssertion = self->_secureAppAssertion;
    self->_secureAppAssertion = 0;
  }
}

- (BOOL)canPlayTrace
{
  if (sub_100568D90())
  {
    uint64_t v2 = +[MNNavigationService sharedService];
    unsigned int v3 = [v2 isInNavigatingState] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)startTransitTurnByTurn
{
  unsigned int v3 = [[NavigationIdleTimerProvider alloc] initWithIdleStateHandler:0 undimHandler:&stru_1012F4348];
  transitIdleTimerProvider = self->_transitIdleTimerProvider;
  self->_transitIdleTimerProvider = v3;
}

- (void)startTurnByTurn:(id)a3
{
  id v4 = a3;
  self->_isNavigatingTurnByTurn = 1;
  BOOL v5 = [(MapsAppDelegate *)self idleTimerController];
  objc_initWeak(&location, v5);

  dispatch_time_t v6 = [NavigationIdleTimerProvider alloc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1006977CC;
  v24[3] = &unk_1012E6998;
  objc_copyWeak(&v25, &location);
  id v7 = [(NavigationIdleTimerProvider *)v6 initWithIdleStateHandler:v24 undimHandler:&stru_1012F4368];
  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  self->_navigationIdleTimerProvider = v7;

  v9 = objc_alloc_init(NavigationThermalWarningController);
  thermalWarningController = self->_thermalWarningController;
  self->_thermalWarningController = v9;

  objc_initWeak(&from, self);
  int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1006978D8;
  id v21 = &unk_1012E6998;
  objc_copyWeak(&v22, &from);
  [(NavigationThermalWarningController *)self->_thermalWarningController setChangeHandler:&v18];
  int v11 = +[IPCServer sharedServer];
  id v12 = +[MNNavigationService sharedService];
  unsigned int v13 = [v11 externalGuidanceSource];

  if (v13 != v12) {
    [v11 setExternalGuidanceSource:v12];
  }
  v14 = +[VGVirtualGarageService sharedService];
  id v15 = [v11 virtualGarageSource];

  if (v15 != v14) {
    [v11 setVirtualGarageSource:v14];
  }
  [(MapsAppDelegate *)self _acquireProcessAssertionForTurnByTurn:1];
  [(MapsAppDelegate *)self _setCanShowInLockscreen:1];
  if (!self->_hasNavNotifyToken)
  {
    if (notify_register_check("com.apple.Maps.Navigation", &self->_navNotifyToken))
    {
      NSLog(@"Failed to get notify token");
      if (!self->_hasNavNotifyToken) {
        goto LABEL_13;
      }
    }
    else
    {
      self->_hasNavNotifyToken = 1;
    }
  }
  if (notify_set_state(self->_navNotifyToken, 1uLL))
  {
    NSLog(@"Failed to set state for notify token");
  }
  else if (notify_post("com.apple.Maps.Navigation"))
  {
    NSLog(@"Failed to post notification for token");
  }
LABEL_13:
  if (!self->_navigatorDataActivationPopupAssertion)
  {
    v16 = objc_alloc_init(DataActivationPopupAssertion);
    navigatorDataActivationPopupAssertion = self->_navigatorDataActivationPopupAssertion;
    self->_navigatorDataActivationPopupAssertion = v16;
  }
  [(MapsAppDelegate *)self _suppressNetworkFlags];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)endTransitTurnByTurn
{
  transitIdleTimerProvider = self->_transitIdleTimerProvider;
  self->_transitIdleTimerProvider = 0;
}

- (void)endTurnByTurn:(id)a3
{
  self->_isNavigatingTurnByTurn = 0;
  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  self->_navigationIdleTimerProvider = 0;

  BOOL v5 = [(MapsAppDelegate *)self idleTimerController];
  [v5 setDesiredIdleTimerState:0 forReason:2];

  thermalWarningController = self->_thermalWarningController;
  self->_thermalWarningController = 0;

  id v11 = +[IPCServer sharedServer];
  id v7 = +[MNNavigationService sharedService];
  id v8 = [v11 externalGuidanceSource];

  if (v8 == v7) {
    [v11 setExternalGuidanceSource:0];
  }
  [(MapsAppDelegate *)self _setCanShowInLockscreen:0];
  [(MapsAppDelegate *)self _clearDoubleHeightStatusBar];
  [(MapsAppDelegate *)self _releaseSecureAppAssertion];
  [(MapsAppDelegate *)self _releaseProcessAssertion];
  if (self->_hasNavNotifyToken)
  {
    if (notify_set_state(self->_navNotifyToken, 0))
    {
      NSLog(@"Failed to set state for notify token");
    }
    else if (notify_post("com.apple.Maps.Navigation"))
    {
      NSLog(@"Failed to post notification for token");
    }
  }
  v9 = +[MapsLightLevelController sharedController];
  [v9 reloadForChangedLightLevelTrackers];

  [self->_navigatorDataActivationPopupAssertion invalidate];
  navigatorDataActivationPopupAssertion = self->_navigatorDataActivationPopupAssertion;
  self->_navigatorDataActivationPopupAssertion = 0;

  [(MapsAppDelegate *)self _unsuppressNetworkFlagsIfNecessary];
}

- (void)chromeViewController:(id)a3 willMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  if (self->_canShowInLockscreen)
  {
    [a5 lastObject];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___LockScreenProtocol]
      || (objc_opt_respondsToSelector() & 1) != 0 && ([v6 supportsLockscreen] & 1) == 0)
    {
      [(MapsAppDelegate *)self _updateSecureAppAssertion];
    }
  }
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  if (self->_canShowInLockscreen)
  {
    [a5 lastObject:a3, a4];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___LockScreenProtocol]
      && ((objc_opt_respondsToSelector() & 1) == 0 || [v6 supportsLockscreen]))
    {
      [(MapsAppDelegate *)self _updateSecureAppAssertion];
    }
  }
}

- (void)_acquireProcessAssertionForTurnByTurn:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MapsAppDelegate *)self priorityAssertion];

  if (!v5)
  {
    BOOL v6 = !v3;
    if (v3) {
      CFStringRef v7 = @".Navigation.TurnByTurn";
    }
    else {
      CFStringRef v7 = @".Navigation.Stepping";
    }
    if (v6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 11;
    }
    v9 = +[NSBundle mainBundle];
    id v10 = [v9 bundleIdentifier];
    id v11 = [v10 stringByAppendingString:v7];

    id v12 = [objc_alloc((Class)BKSProcessAssertion) initWithBundleIdentifier:@"com.apple.Maps" flags:v8 reason:7 name:v11];
    LODWORD(v10) = [v12 acquire];
    unsigned int v13 = GEOFindOrCreateLog();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Acquired priority assertion %@", (uint8_t *)&v15, 0xCu);
      }

      [(MapsAppDelegate *)self setPriorityAssertion:v12];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to acquire a priority assertion %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)_releaseProcessAssertion
{
  BOOL v3 = [(MapsAppDelegate *)self priorityAssertion];

  if (v3)
  {
    id v4 = [(MapsAppDelegate *)self priorityAssertion];
    [(MapsAppDelegate *)self setPriorityAssertion:0];
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [v4 name];
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = 0x4014000000000000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will invalidate priority assertion %@ in %#.1lfs", buf, 0x16u);
    }
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100697F74;
    block[3] = &unk_1012E5D08;
    id v10 = v4;
    id v8 = v4;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)_supportsModernTransitNavigation:(id)a3
{
  return [a3 desiredTransportType] == 1;
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v10 = a3;
  if (!MNNavigationServiceStateChangedToNavigating())
  {
    id v8 = v10;
    if (a5) {
      goto LABEL_15;
    }
    if ([v10 navigationType] == (id)2)
    {
      [(MapsAppDelegate *)self endTransitTurnByTurn];
      [(MapsAppDelegate *)self _releaseProcessAssertion];
      [(MapsAppDelegate *)self _setCanShowInLockscreen:0];
      [(MapsAppDelegate *)self _unsuppressNetworkFlagsIfNecessary];
    }
    if ([v10 navigationType] == (id)3) {
      [(MapsAppDelegate *)self endTurnByTurn:v10];
    }
    [(MapsAppDelegate *)self _clearDoubleHeightStatusBar];
    [(MapsAppDelegate *)self _releaseSecureAppAssertion];
    goto LABEL_14;
  }
  if ([v10 desiredNavigationType] == (id)2)
  {
    [(MapsAppDelegate *)self _suppressNetworkFlags];
    BOOL v7 = [(MapsAppDelegate *)self _supportsModernTransitNavigation:v10];
    [(MapsAppDelegate *)self _setCanShowInLockscreen:v7];
    id v8 = v10;
    if (!v7) {
      goto LABEL_15;
    }
    [(MapsAppDelegate *)self _acquireProcessAssertionForTurnByTurn:0];
    [(MapsAppDelegate *)self startTransitTurnByTurn];
    goto LABEL_14;
  }
  BOOL v9 = [v10 desiredNavigationType] == (id)3;
  id v8 = v10;
  if (v9)
  {
    [(MapsAppDelegate *)self startTurnByTurn:v10];
    [(MapsAppDelegate *)self _acquireDoubleHeightStatusBarAssertionIfNeeded];
LABEL_14:
    id v8 = v10;
  }
LABEL_15:
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v16 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    BOOL v7 = +[MapsLightLevelController sharedController];
    [v7 reloadForChangedLightLevelTrackers];

    if ([v16 desiredNavigationType] == (id)2)
    {
      id v8 = +[IPCServer sharedServer];
      BOOL v9 = v8;
      CFStringRef v10 = @"Stepping navigation started";
    }
    else
    {
      if ([v16 desiredNavigationType] != (id)3)
      {
LABEL_11:
        if (self->_foregroundDataActivationPopupAssertion) {
          goto LABEL_14;
        }
        __int16 v13 = objc_alloc_init(ForegroundOnlyDataActivationPopupAssertion);
        foregroundDataActivationPopupAssertion = self->_foregroundDataActivationPopupAssertion;
        self->_foregroundDataActivationPopupAssertion = v13;
        goto LABEL_13;
      }
      id v8 = +[IPCServer sharedServer];
      BOOL v9 = v8;
      CFStringRef v10 = @"TBT navigation started";
    }
    [v8 navigationStateDidChangeTo:1 reason:v10];

    goto LABEL_11;
  }
  if (!a5) {
    [(MapsAppDelegate *)self endTurnByTurn:v16];
  }
  id v11 = self->_foregroundDataActivationPopupAssertion;
  if (v11)
  {
    [(DataActivationPopupAssertion *)v11 invalidate];
    foregroundDataActivationPopupAssertion = self->_foregroundDataActivationPopupAssertion;
    self->_foregroundDataActivationPopupAssertion = 0;
LABEL_13:
  }
LABEL_14:
  uint64_t v14 = +[IPCServer sharedServer];
  [v14 setEtaOnlyNavMode:a5 == 5];

  int v15 = +[IPCServer sharedServer];
  [v15 setRoutePreviewGuidanceNavMode:a5 == 3];
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  BOOL v7 = [a3 route];
  LODWORD(a5) = [v7 isLegIndexOfLastLeg:a5];

  if (a5)
  {
    [(MapsAppDelegate *)self _clearDoubleHeightStatusBar];
  }
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v7 = a4;
  id v8 = sub_10000AF10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [v7 shortDescription];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Did resume from waypoint: %@; update idle timer state",
      (uint8_t *)&v10,
      0xCu);
  }
  [(NavigationIdleTimerProvider *)self->_navigationIdleTimerProvider updateConfiguration];
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    [(MapsAppDelegate *)self _acquireDoubleHeightStatusBarAssertionIfNeeded];
    [(MapsAppDelegate *)self _updateSecureAppAssertion];
  }
  else
  {
    [(MapsAppDelegate *)self _clearDoubleHeightStatusBar];
    if (![v6 navigationState]) {
      [(MapsAppDelegate *)self _releaseSecureAppAssertion];
    }
  }
}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = +[IPCServer sharedServer];
  id v7 = [v5 description];
  [v6 navigationStateDidChangeTo:3 reason:v7];

  id v8 = +[GEOPlatform sharedPlatform];
  if ([v8 isInternalInstall] && objc_msgSend(v5, "code") == (id)10)
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100698644;
    block[3] = &unk_1012E66E0;
    id v11 = v5;
    id v12 = self;
    id v13 = v8;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)hardwareModel
{
  uint64_t v2 = (void *)MGCopyAnswer();

  return v2;
}

- (void)prepareBackgroundNavigationWithMessage:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastPrepareNavigationMessage, a3);
  id v6 = +[UIApplication _maps_keyMapsSceneDelegate];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    dispatch_time_t v9 = +[UIApplication _maps_applicationScenes];
    int v10 = [v9 firstObject];
    id v8 = [v10 delegate];
  }
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  v37 = v13;
  uint64_t v14 = [v13 entryPointsCoordinator];
  int v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    int v17 = [(MapsAppDelegate *)self appSessionController];
    int v18 = [v17 primaryPlatformController];
    id v16 = [v18 entryPointsCoordinator];
  }
  uint64_t v19 = sub_100698E7C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v11;
    __int16 v42 = 2112;
    id v43 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Will prepare background navigation, sceneDelegate: %@, entryPointsCoordinator: %@", buf, 0x16u);
  }
  v36 = v11;

  [v16 prepareBackgroundNavigation];
  id v20 = +[MKLocationManager sharedLocationManager];
  [v20 resetAfterResumeIfNecessary];

  id v21 = [v5 routeContextData];
  id v22 = v16;
  if (v21) {
    id v23 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v21, v36];
  }
  else {
    id v23 = 0;
  }
  id v24 = [objc_alloc((Class)MKURLContext) initWithOriginatedFromWatch:[v5 originIsWatch] companionRouteContext:v23];
  id v25 = +[UIApplication sharedApplication];
  id v26 = [v25 windows];
  id v27 = [v26 firstObject];
  [v27 windowScene];
  v29 = v28 = v5;

  v30 = [v28 url];
  v31 = [v29 session];
  CFStringRef v38 = @"MKURLContext";
  id v39 = v24;
  v32 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v33 = [v29 coordinateSpace];
  [v33 bounds];
  [v22 openURL:v30 session:v31 sceneOptions:0 mkOptions:v32 windowSize:v34 v35];
}

- (void)startPreparedBackgroundNavigationWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = sub_100698E7C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will start prepared background navigation", buf, 2u);
  }

  id v6 = [(MapsAppDelegate *)self platformController];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    dispatch_time_t v9 = [(MapsAppDelegate *)self appSessionController];
    id v8 = [v9 primaryPlatformController];
  }
  int v10 = [v8 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  v52 = [v12 currentRouteCollection];
  id v13 = [v8 iosBasedChromeViewController];
  uint64_t v14 = [v13 appCoordinator];

  v51 = [v4 routeID];
  id v15 = [v4 routeIndex];
  id v16 = [v4 loadDirectionsMessage];
  int v17 = [v16 routePersistentData];

  if (v17)
  {
    int v18 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:0];
  }
  else
  {
    int v18 = 0;
  }
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100699548;
  v58[3] = &unk_1012F4390;
  v58[4] = self;
  id v19 = v4;
  id v59 = v19;
  id v20 = v14;
  id v60 = v20;
  id v21 = objc_retainBlock(v58);
  unsigned int v22 = [v19 originIsWatch];
  if (v17 && v22 && !v52)
  {
    id v23 = sub_100698E7C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Will recreate a navigable route from provided persistent data", buf, 2u);
    }

    id v24 = +[GEOComposedRoute _maps_composedRouteWithPersistentData:v18];
    if (v24)
    {
      id v25 = [(MapsAppDelegate *)self chromeViewController];
      [v25 currentTraits];
      id v26 = v20;
      v28 = id v27 = v18;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100699710;
      v55[3] = &unk_1012F43F8;
      v57 = v21;
      id v24 = v24;
      id v56 = v24;
      id v29 = [v24 _maps_convertToNavigableRouteWithTraits:v28 errorHandler:&stru_1012F43D0 completionHandler:v55];

      int v18 = v27;
      id v20 = v26;
    }
    goto LABEL_37;
  }
  if (!v52)
  {
    id v24 = +[IPCServer sharedServer];
    [v24 navigationStateDidChangeTo:3 reason:@"No routes available"];
    goto LABEL_37;
  }
  v50 = v19;
  if (v51)
  {
    *(void *)buf = 0;
    uint64_t v62 = 0;
    [v51 getBytes:buf length:[v51 length]];
    id v30 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
    [v52 routes];
    id v49 = v12;
    id v31 = v8;
    v33 = v32 = v18;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100699818;
    v53[3] = &unk_1012EAE80;
    id v54 = v30;
    double v34 = v21;
    id v35 = v20;
    id v36 = v15;
    id v37 = v30;
    uint64_t v38 = (uint64_t)[v33 indexOfObjectPassingTest:v53];

    int v18 = v32;
    id v8 = v31;
    id v12 = v49;

    id v15 = v36;
    id v20 = v35;
    id v21 = v34;
    if (v38 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_30;
    }
  }
  if (self->_lastPrepareNavigationMessage
    && (objc_msgSend(v50, "matchesLoadDirectionsMessage:") & 1) == 0)
  {
    id v39 = sub_100698E7C();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "This IPC request is not the same as the last Siri/Watch request we got, so we fail.", buf, 2u);
    }

    v40 = +[IPCServer sharedServer];
    [v40 navigationStateDidChangeTo:2 reason:@"Request to start navigation doesn't match prepared directions."];
  }
  uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_30;
  }
  uint64_t v38 = (uint64_t)v15;
  if (v15 >= [v52 count])
  {
    uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
    +[IPCServer sharedServer];
    id v41 = v21;
    id v42 = v20;
    id v43 = v12;
    id v44 = v8;
    v46 = v45 = v18;
    [v46 navigationStateDidChangeTo:2 reason:@"Requested route index not found in prepared directions."];

    int v18 = v45;
    id v8 = v44;
    id v12 = v43;
    id v20 = v42;
    id v21 = v41;
  }
  if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v38 = (uint64_t)[v52 currentRouteIndex];
  }
  [v12 setSelectedRouteIndex:v38 forTransportType:[v12 currentTransportType]];
  uint64_t v47 = [v12 currentRouteCollection];
  id v19 = v50;
  if (v47)
  {
    id v24 = (id)v47;
    ((void (*)(void *, uint64_t))v21[2])(v21, v47);
  }
  else
  {
    v48 = +[IPCServer sharedServer];
    [v48 navigationStateDidChangeTo:2 reason:@"No route collection to navigate"];

    id v24 = 0;
  }
LABEL_37:
}

- (void)endBackgroundNavigation
{
  BOOL v3 = sub_100698E7C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will end background navigation", v7, 2u);
  }

  id v4 = [(MapsAppDelegate *)self appSessionController];
  id v5 = [v4 currentlyNavigatingPlatformController];
  [v5 clearSessions];

  id v6 = +[MNNavigationService sharedService];
  [(MapsAppDelegate *)self endTurnByTurn:v6];
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  id v8 = [v6 request];
  unsigned __int8 v9 = [v8 shouldShowIfAppInForeground];

  int v10 = sub_100576414();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will present notification - %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v12 = 6;
  }
  else
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Skipping showing notification since app in FG - %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v12 = 0;
  }

  v7[2](v7, v12);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    id v14 = v5;
    id v6 = [v5 presentingViewController];

    id v5 = v14;
    if (!v6)
    {
      id v7 = +[UIApplication _maps_keyMapsWindow];
      id v8 = [v7 rootViewController];

      unsigned __int8 v9 = [v8 presentedViewController];

      if (v9)
      {
        do
        {
          int v10 = [v8 presentedViewController];

          BOOL v11 = [v10 presentedViewController];

          id v8 = v10;
        }
        while (v11);
      }
      else
      {
        int v10 = v8;
      }
      if ([v10 isViewLoaded])
      {
        uint64_t v12 = [v10 view];
        int v13 = [v12 window];

        if (v13)
        {
          [v14 setModalPresentationStyle:2];
          [v10 presentViewController:v14 animated:v4 completion:0];
        }
      }

      id v5 = v14;
    }
  }
}

- (NSArray)allVisibleMapViews
{
  uint64_t v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 connectedScenes];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          BOOL v11 = [v10 delegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            int v13 = [v10 delegate];
            id v14 = [v13 chromeViewController];
            id v15 = [v14 mapView];
            [v17 addObject:v15];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return (NSArray *)v17;
}

- (NSArray)allVisibleMapViewsButNotCarPlay
{
  uint64_t v2 = [(MapsAppDelegate *)self allVisibleMapViews];
  id v3 = [v2 mutableCopy];

  id v4 = +[CarDisplayController sharedInstance];
  id v5 = [v4 chromeViewController];
  id v6 = [v5 mapView];

  [v3 removeObject:v6];

  return (NSArray *)v3;
}

- (id)visibleMapViewFromCarPlay
{
  uint64_t v2 = +[CarDisplayController sharedInstance];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapView];

  return v4;
}

- (id)testCoordinator
{
  uint64_t v2 = [(MapsAppDelegate *)self sceneDelegateForTesting];
  id v3 = [v2 testCoordinator];

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v16 = a3;
  id v4 = [v16 system];
  id v5 = +[UIMenuSystem mainSystem];

  id v6 = v16;
  if (v4 == v5)
  {
    uint64_t v7 = +[UIScreen mainScreen];
    uint64_t v8 = sub_1000BBB44(v7);

    if (!self->_didSkipInitialUIKitBuildMenuCall && v8 == 5) {
      goto LABEL_11;
    }
    id v10 = [(MapsAppDelegate *)self chromeViewController];
    BOOL v11 = [v10 currentShareItemSource];

    BOOL v12 = 0;
    if (v8 == 5)
    {
      id v13 = v16;
      if (!v11)
      {
LABEL_10:
        +[MapsMenuBuilder buildMenuWithBuilder:v13 sendToDeviceEnabled:v12];

LABEL_11:
        self->_didSkipInitialUIKitBuildMenuCall = 1;
        id v6 = v16;
        goto LABEL_12;
      }
      id v14 = [(MapsAppDelegate *)self chromeViewController];
      id v15 = [v14 currentCollectionShareItemSource];
      BOOL v12 = v15 == 0;
    }
    id v13 = v16;
    goto LABEL_10;
  }
LABEL_12:
}

- (Class)appKitBundleClass
{
  return 0;
}

- (id)loadAppKitBundle
{
  return 0;
}

- (void)presentMacPreferencesTabWithType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      [(MapsAppDelegate *)self presentMacARPPreferences];
      break;
    case 1:
      [(MapsAppDelegate *)self presentMacRoutePlannerPreferences];
      break;
    case 0:
      [(MapsAppDelegate *)self presentMacGeneralPreferences];
      break;
  }
}

- (void)presentMacGeneralPreferences
{
}

- (void)presentMacRoutePlannerPreferences
{
}

- (void)presentMacARPPreferences
{
}

- (void)preferencesPrivacyControllerDidDismiss:(id)a3
{
  privacyController = self->_privacyController;
  self->_privacyController = 0;
}

- (void)fetchNotificationAuthUndetermined:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationCenter currentNotificationCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10069A104;
  v6[3] = &unk_1012F4420;
  id v7 = v3;
  id v5 = v3;
  [v4 getNotificationSettingsWithCompletionHandler:v6];
}

- (void)notificationButtonPressedWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationCenter currentNotificationCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10069A2A4;
  v6[3] = &unk_1012F4420;
  id v7 = v3;
  id v5 = v3;
  [v4 getNotificationSettingsWithCompletionHandler:v6];
}

- (void)presentRatingsAndPhotosPrivacyScreen
{
  if (self->_privacyController)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _privacyController == ((void *)0)", v6, 2u);
    }
  }
  else
  {
    id v3 = [[AppKitPreferencesPrivacyController alloc] initWithBundleIdentifier:@"com.apple.onboarding.ratingsAndPhotos"];
    privacyController = self->_privacyController;
    self->_privacyController = v3;

    [(AppKitPreferencesPrivacyController *)self->_privacyController setDelegate:self];
    id v5 = self->_privacyController;
    [(AppKitPreferencesPrivacyController *)v5 present];
  }
}

- (void)presentAboutAndPrivacyScreen
{
  if (self->_privacyController)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _privacyController == ((void *)0)", v6, 2u);
    }
  }
  else
  {
    id v3 = [[AppKitPreferencesPrivacyController alloc] initWithBundleIdentifier:@"com.apple.onboarding.maps"];
    privacyController = self->_privacyController;
    self->_privacyController = v3;

    [(AppKitPreferencesPrivacyController *)self->_privacyController setDelegate:self];
    id v5 = self->_privacyController;
    [(AppKitPreferencesPrivacyController *)v5 present];
  }
}

- (void)appkitBundleSetUseLargeLabels:(BOOL)a3
{
}

- (BOOL)useLargeLabelsPreferenceForAppkitBundle
{
  return GEOConfigGetInteger() == 1;
}

- (id)photoAttributionPreferencesManager
{
  return +[UGCPhotoAttributionPreferencesManager sharedManager];
}

- (void)setAppSessionController:(id)a3
{
}

- (void)setIdleTimerController:(id)a3
{
}

- (void)setLockedOrientations:(unint64_t)a3
{
  self->_lockedOrientations = a3;
}

- (BOOL)isCoreRoutineEnabled
{
  return self->_coreRoutineEnabled;
}

- (BKSProcessAssertion)priorityAssertion
{
  return self->_priorityAssertion;
}

- (void)setPriorityAssertion:(id)a3
{
}

- (SiriNavStatusUpdater)siriNavStatusUpdater
{
  return self->_siriNavStatusUpdater;
}

- (void)setSiriNavStatusUpdater:(id)a3
{
}

- (MapsDistanceUnitUpdater)distanceUnitUpdater
{
  return self->_distanceUnitUpdater;
}

- (void)setDistanceUnitUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceUnitUpdater, 0);
  objc_storeStrong((id *)&self->_siriNavStatusUpdater, 0);
  objc_storeStrong((id *)&self->_priorityAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerController, 0);
  objc_storeStrong((id *)&self->_appSessionController, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_secureAppAssertion, 0);
  objc_storeStrong((id *)&self->_doubleHeightStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_thermalWarningController, 0);
  objc_storeStrong((id *)&self->_transitIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_navigationIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_lastPrepareNavigationMessage, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_legacyDataMigrator, 0);
  objc_storeStrong((id *)&self->_poiSearchManager, 0);
  objc_storeStrong((id *)&self->_foregroundDataActivationPopupAssertion, 0);

  objc_storeStrong((id *)&self->_navigatorDataActivationPopupAssertion, 0);
}

- (id)_currentInterruptionHandle
{
  return objc_getAssociatedObject(self, &unk_101610648);
}

- (void)_setCurrentInterruptionHandle:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector("_currentInterruptionHandle");
  [(MapsAppDelegate *)self willChangeValueForKey:v5];

  objc_setAssociatedObject(self, &unk_101610648, v4, (void *)1);
  NSStringFromSelector("_currentInterruptionHandle");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MapsAppDelegate *)self didChangeValueForKey:v6];
}

- (BOOL)_isShowingLocationServicesAuthorizationPrompt
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_101610649);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 BOOLValue];
  id v5 = sub_100A8DE88();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    if (!v3) {
      CFStringRef v6 = @"nil";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current value of kIsShowingLocationServicesAuthorizationPromptKey => %@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)_setShowingLocationServicesAuthorizationPrompt:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100A8DE88();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will start observing LocationAuthorizationDismissedNotification", (uint8_t *)&v11, 2u);
    }

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_locationAuthorizationDismissed:" name:@"LocationAuthorizationDismissedNotification" object:0];
  }
  else
  {
    if (v6)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will stop observing LocationAuthorizationDismissedNotification", (uint8_t *)&v11, 2u);
    }

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:@"LocationAuthorizationDismissedNotification" object:0];
  }

  int v8 = sub_100A8DE88();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v3) {
      CFStringRef v9 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting value of kIsShowingLocationServicesAuthorizationPromptKey to %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = +[NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, &unk_101610649, v10, (void *)1);
}

- (void)_locationAuthorizationDismissed:(id)a3
{
}

- (int64_t)currentInterruptionKind
{
  uint64_t v2 = [(MapsAppDelegate *)self _currentInterruptionHandle];
  BOOL v3 = v2;
  if (v2) {
    id v4 = [v2 interruptionKind];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)dismissCurrentInterruption
{
  BOOL v3 = sub_100A8DE88();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(MapsAppDelegate *)self currentInterruptionKind];
    if ((unint64_t)(v4 - 1) > 0x16) {
      CFStringRef v5 = @"kMapsInterruptionNone";
    }
    else {
      CFStringRef v5 = *(&off_101315FE8 + v4 - 1);
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing the current interruption with kind: %@", buf, 0xCu);
  }

  BOOL v6 = [(MapsAppDelegate *)self _currentInterruptionHandle];
  id v7 = v6;
  if (v6)
  {
    int v8 = [v6 dismissalBlock];
    id v9 = [v8 copy];

    if (v9)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100A8E2CC;
      v12[3] = &unk_1012E6EA8;
      id v13 = v9;
      +[UIViewController _performWithoutDeferringTransitions:v12];
    }
    [(MapsAppDelegate *)self _setCurrentInterruptionHandle:0];
    [(MapsAppDelegate *)self _setShowingLocationServicesAuthorizationPrompt:0];
  }
  id v10 = +[CarDisplayController sharedInstance];
  if ([v10 isChromeAvailable])
  {
    int v11 = [v10 chromeViewController];
    [v11 dismissInterruption];
  }
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  int64_t v5 = [(MapsAppDelegate *)self currentInterruptionKind];
  if (v5 == a3) {
    [(MapsAppDelegate *)self dismissCurrentInterruption];
  }
  return v5 == a3;
}

- (void)interruptApplicationWithKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v56 = a4;
  id v7 = a5;
  int v8 = sub_100A8DE88();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
  id v9 = self;
  if (!v9)
  {
    id v14 = @"<nil>";
    goto LABEL_10;
  }
  id v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  if (objc_opt_respondsToSelector())
  {
    CFStringRef v12 = [(MapsAppDelegate *)v9 performSelector:"accessibilityIdentifier"];
    id v13 = v12;
    if (v12 && ![v12 isEqualToString:v11])
    {
      id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

      goto LABEL_8;
    }
  }
  id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
  if ((unint64_t)(a3 - 1) > 0x16) {
    CFStringRef v15 = @"kMapsInterruptionNone";
  }
  else {
    CFStringRef v15 = *(&off_101315FE8 + a3 - 1);
  }
  *(_DWORD *)buf = 138543618;
  *(void *)&uint8_t buf[4] = v14;
  *(_WORD *)&buf[12] = 2112;
  *(void *)&buf[14] = v15;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Showing interrupt with kind: %@", buf, 0x16u);

LABEL_14:
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  char v75 = 0;
  id v16 = objc_alloc_init(DismissalHandle);
  id v17 = objc_alloc_init(DismissalHandle);
  long long v18 = objc_alloc_init(InterruptionHandle);
  [(InterruptionHandle *)v18 setInterruptionKind:a3];
  [(MapsAppDelegate *)self _setCurrentInterruptionHandle:v18];
  long long v19 = [v56 objectForKeyedSubscript:@"kMapsInterruptionActions"];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v83 = sub_100104284;
  v84 = sub_1001049C0;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100A8EBA8;
  v67[3] = &unk_101315F08;
  v67[4] = self;
  long long v20 = v18;
  v68 = v20;
  id v73 = v74;
  id v54 = v19;
  id v69 = v54;
  id v53 = v7;
  id v72 = v53;
  long long v21 = v17;
  v70 = v21;
  unsigned int v22 = v16;
  v71 = v22;
  v85 = objc_retainBlock(v67);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100A8EC9C;
  v63[3] = &unk_101315F30;
  id v23 = v22;
  v64 = v23;
  id v24 = v21;
  v65 = v24;
  v66 = buf;
  [(DismissalHandle *)v20 setDismissalBlock:v63];
  id v25 = +[UIApplication sharedMapsDelegate];
  id v26 = [v25 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  if (v28)
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100A8ED70;
    v60[3] = &unk_101315F58;
    v61 = v24;
    uint64_t v62 = buf;
    id v29 = objc_retainBlock(v60);
    id v30 = sub_100A8DE88();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
LABEL_36:

      id v44 = [v28 presentInterruptionOfKind:a3 userInfo:v56 completionHandler:v29];
      [(DismissalHandle *)v23 setDismissalBlock:v44];

      id v37 = v61;
      goto LABEL_39;
    }
    id v31 = self;
    if (!v31)
    {
      id v36 = @"<nil>";
      goto LABEL_35;
    }
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    if (objc_opt_respondsToSelector())
    {
      double v34 = [(MapsAppDelegate *)v31 performSelector:"accessibilityIdentifier"];
      id v35 = v34;
      if (v34 && ([v34 isEqualToString:v33] & 1) == 0)
      {
        id v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

        goto LABEL_25;
      }
    }
    id v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_25:

LABEL_35:
    *(_DWORD *)v76 = 138543362;
    v77 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Showing interruption on iOS", v76, 0xCu);

    goto LABEL_36;
  }
  id v37 = sub_100A8DE88();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = self;
    if (!v38)
    {
      id v43 = @"<nil>";
      goto LABEL_38;
    }
    id v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    if (objc_opt_respondsToSelector())
    {
      id v41 = [(MapsAppDelegate *)v38 performSelector:"accessibilityIdentifier"];
      id v42 = v41;
      if (v41 && ([v41 isEqualToString:v40] & 1) == 0)
      {
        id v43 = +[NSString stringWithFormat:@"%@<%p, %@>", v40, v38, v42];

        goto LABEL_33;
      }
    }
    id v43 = +[NSString stringWithFormat:@"%@<%p>", v40, v38];
LABEL_33:

LABEL_38:
    v45 = v43;
    id v46 = [(MapsAppDelegate *)v38 appSessionController];
    uint64_t v47 = [(MapsAppDelegate *)v38 appSessionController];
    v48 = [v47 primaryPlatformController];
    *(_DWORD *)v76 = 138543874;
    v77 = v45;
    __int16 v78 = 2112;
    id v79 = v46;
    __int16 v80 = 2112;
    v81 = v48;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will NOT show interrupt on iOS; appSessionController: %@; primaryPlatformController: %@",
      v76,
      0x20u);
  }
LABEL_39:

  id v49 = +[CarDisplayController sharedInstance];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100A8EE14;
  v57[3] = &unk_101315F58;
  v50 = v23;
  id v58 = v50;
  id v59 = buf;
  v51 = objc_retainBlock(v57);
  v52 = [v49 presentInterruptionOfKind:a3 userInfo:v56 completionHandler:v51];
  [(DismissalHandle *)v24 setDismissalBlock:v52];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v74, 8);
}

- (void)showLocationServicesAlertWithError:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_getAssociatedObject(self, off_1015F3900);
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = [v4 domain];
  unsigned int v8 = [v7 isEqualToString:MKLocationErrorDomain];

  if (v8 && (v6 & 1) == 0)
  {
    objc_setAssociatedObject(self, off_1015F3900, &__kCFBooleanTrue, (void *)3);
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"LocationServiceAlert_Title" value:@"localized string not found" table:0];

    int v11 = +[NSMutableDictionary dictionary];
    CFStringRef v12 = v11;
    if (v10) {
      [v11 setObject:v10 forKeyedSubscript:@"kMapsInterruptionTitle"];
    }
    if (v4) {
      [v12 setObject:v4 forKeyedSubscript:@"kMapsInterruptionError"];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A8F048;
    v13[3] = &unk_1012E8E50;
    v13[4] = self;
    [(MapsAppDelegate *)self interruptApplicationWithKind:6 userInfo:v12 completionHandler:v13];
  }
}

- (void)promptLocationServicesAuthorizationWithHandler:(id)a3
{
  id v4 = a3;
  int64_t v5 = sub_100A8DE88();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"handler";
    if (!v4) {
      CFStringRef v6 = @"no handler";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing Location Services Authorization Prompt with %@", buf, 0xCu);
  }

  if (![(MapsAppDelegate *)self _isShowingLocationServicesAuthorizationPrompt])
  {
    [(MapsAppDelegate *)self _setShowingLocationServicesAuthorizationPrompt:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100A8F1B4;
    v7[3] = &unk_1013149E8;
    id v8 = v4;
    [(MapsAppDelegate *)self interruptApplicationWithKind:5 userInfo:0 completionHandler:v7];
  }
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  id v4 = objc_getAssociatedObject(self, off_1015F3968);
  if (v4)
  {
    id v13 = v4;
    int64_t v5 = +[MKLocationManager sharedLocationManager];
    unsigned int v6 = [v5 isLocationServicesApproved];

    id v7 = objc_getAssociatedObject(self, off_1015F3970);
    unsigned int v8 = [v7 BOOLValue];

    id v9 = +[MKLocationManager sharedLocationManager];
    unsigned int v10 = [v9 isAuthorizedForPreciseLocation];

    int v11 = objc_getAssociatedObject(self, off_1015F3978);
    unsigned int v12 = [v11 BOOLValue];

    id v4 = v13;
    if (v6 != v8 || v10 != v12)
    {
      [v13 dismissViewControllerAnimated:1 completion:0];
      [(MapsAppDelegate *)self _cleanupAfterLocationServicesAlertController];
      id v4 = v13;
    }
  }
}

- (void)_cleanupAfterLocationServicesAlertController
{
  objc_setAssociatedObject(self, off_1015F3968, 0, (void *)1);
  objc_setAssociatedObject(self, off_1015F3970, 0, (void *)3);
  objc_setAssociatedObject(self, off_1015F3978, 0, (void *)3);
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];
}

- (void)_presentLocationServicesAlertController:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[MKLocationManager sharedLocationManager];
  id v6 = [v5 isLocationServicesApproved];

  id v7 = +[MKLocationManager sharedLocationManager];
  id v8 = [v7 isAuthorizedForPreciseLocation];

  objc_setAssociatedObject(self, off_1015F3968, v4, (void *)1);
  id v9 = off_1015F3970;
  unsigned int v10 = +[NSNumber numberWithBool:v6];
  objc_setAssociatedObject(self, v9, v10, (void *)3);

  int v11 = off_1015F3978;
  unsigned int v12 = +[NSNumber numberWithBool:v8];
  objc_setAssociatedObject(self, v11, v12, (void *)3);

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  id v14 = [(MapsAppDelegate *)self chromeViewController];
  [v14 _maps_topMostPresentViewController:v4 animated:1 completion:0];
}

- (void)promptLocationServicesOff
{
  id v3 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v4 = [v3 isLocationServicesAuthorizationNeeded];

  if ((v4 & 1) == 0)
  {
    id v6 = +[MKLocationManager sharedLocationManager];
    v33[0] = 0;
    unsigned __int8 v7 = [v6 isLocationServicesPossiblyAvailable:v33];
    id v8 = v33[0];

    id v24 = v8;
    if ((v7 & 1) == 0)
    {
      id v9 = [v8 domain];
      if ([v9 isEqualToString:MKLocationErrorDomain])
      {
        BOOL v10 = [v8 code] != 0;

        uint64_t v5 = 2 * v10;
        goto LABEL_8;
      }
    }
    uint64_t v5 = 2;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  id v24 = 0;
LABEL_8:
  int v11 = +[NSError errorWithDomain:MKLocationErrorDomain code:v5 userInfo:0];
  unsigned int v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Maps works best with Location Services turned on." value:@"localized string not found" table:0];

  id v14 = +[NSBundle mainBundle];
  CFStringRef v15 = [v14 localizedStringForKey:@"You'll get turn-by-turn directions, estimated travel times, and improved search results when you turn on Location Services for Maps.", @"localized string not found", 0 value table];

  id v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"Turn On in Settings" value:@"localized string not found" table:0];

  long long v18 = +[NSBundle mainBundle];
  long long v19 = [v18 localizedStringForKey:@"Keep Location Services Off" value:@"localized string not found" table:0];

  long long v20 = +[UIAlertController alertControllerWithTitle:v13 message:v15 preferredStyle:1];
  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100A8F91C;
  v28[3] = &unk_101315F80;
  objc_copyWeak(&v30, &location);
  int v31 = 0;
  id v21 = v11;
  id v29 = v21;
  unsigned int v22 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v28];
  [v20 addAction:v22];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100A8F9D4;
  v25[3] = &unk_101315FA8;
  objc_copyWeak(&v26, &location);
  int v27 = 0;
  id v23 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v25];
  [v20 addAction:v23];
  [(MapsAppDelegate *)self _presentLocationServicesAlertController:v20];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)promptPreciseLocationOff
{
  id v3 = +[NSError errorWithDomain:MKLocationErrorDomain code:6 userInfo:0];
  unsigned __int8 v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Maps works best with your precise location." value:@"localized string not found" table:0];

  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"You'll get turn-by-turn directions, estimated travel times, and improved search results when you allow Maps to use your precise location.", @"localized string not found", 0 value table];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Turn On in Settings" value:@"localized string not found" table:0];

  BOOL v10 = +[NSBundle mainBundle];
  int v11 = [v10 localizedStringForKey:@"Keep Precise Off" value:@"localized string not found" table:0];

  long long v20 = (void *)v7;
  unsigned int v12 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];
  id v21 = self;
  objc_initWeak(location, self);
  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"Allow Once" value:@"localized string not found" table:0];
  long long v19 = (void *)v5;

  if (v14)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100A8FE60;
    v29[3] = &unk_1012E8EB8;
    objc_copyWeak(&v30, location);
    CFStringRef v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v29];
    [v12 addAction:v15];
    objc_destroyWeak(&v30);
  }
  else
  {
    CFStringRef v15 = 0;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100A8FED4;
  v25[3] = &unk_101315F80;
  objc_copyWeak(&v27, location);
  int v28 = 688;
  id v16 = v3;
  id v26 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v25];
  [v12 addAction:v17];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A8FF8C;
  v22[3] = &unk_101315FA8;
  objc_copyWeak(&v23, location);
  int v24 = 688;
  long long v18 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v22];
  [v12 addAction:v18];
  [(MapsAppDelegate *)v21 _presentLocationServicesAlertController:v12];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);

  objc_destroyWeak(location);
}

- (void)showNavigationAdvisoryIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A900A0;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  if (qword_101610650 != -1) {
    dispatch_once(&qword_101610650, block);
  }
}

- (void)interruptConvertToNavigableSavedRouteID:(id)a3 routeName:(id)a4 error:(id)a5 directionsError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100A8DE88();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v15 = self;
    if (!v15)
    {
      long long v20 = @"<nil>";
      goto LABEL_10;
    }
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      long long v18 = [(MapsAppDelegate *)v15 performSelector:"accessibilityIdentifier"];
      long long v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        long long v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_8;
      }
    }
    long long v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138544386;
    v40 = v20;
    __int16 v41 = 2112;
    id v42 = v11;
    __int16 v43 = 2114;
    id v44 = v10;
    __int16 v45 = 2114;
    id v46 = v12;
    __int16 v47 = 2114;
    id v48 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] interrupting navigable conversion for %@ (%{public}@) with error: %{public}@ directionsError: %{public}@", buf, 0x34u);
  }
  id v21 = objc_opt_new();
  unsigned int v22 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v23 = [v22 isUsingOfflineMaps];

  int v24 = +[NSBundle mainBundle];
  id v25 = v24;
  if (v23)
  {
    id v26 = [v24 localizedStringForKey:@"[Interruption] Offline Custom Route Error Title" value:@"localized string not found" table:0];
    [v21 setObject:v26 forKeyedSubscript:@"kMapsInterruptionTitle"];

    id v27 = +[NSBundle mainBundle];
    int v28 = [v27 localizedStringForKey:@"[Interruption] Offline Custom Route Error Message" value:@"localized string not found" table:0];
    [v21 setObject:v28 forKeyedSubscript:@"kMapsInterruptionMessage"];

LABEL_17:
    v33 = [(MapsAppDelegate *)self chromeViewController];
    id v34 = [v33 presentInterruptionOfKind:3 userInfo:v21 completionHandler:0];
    goto LABEL_18;
  }
  id v29 = [v24 localizedStringForKey:@"[Interruption] Generic Error Title" value:@"localized string not found" table:0];
  [v21 setObject:v29 forKeyedSubscript:@"kMapsInterruptionTitle"];

  id v30 = +[NSBundle mainBundle];
  int v31 = [v30 localizedStringForKey:@"[Interruption] Generic Error Message" value:@"localized string not found" table:0];
  [v21 setObject:v31 forKeyedSubscript:@"kMapsInterruptionMessage"];

  [v21 setObject:v11 forKeyedSubscript:@"kMapsInterruptionRouteNameKey"];
  [v21 setObject:v10 forKeyedSubscript:@"kMapsInterruptionRouteStorageIDKey"];
  if (![v13 problemDetailsCount]) {
    goto LABEL_17;
  }
  uint64_t v32 = 0;
  while ([v13 problemDetailAtIndex:v32] != 8)
  {
    if (++v32 >= (unint64_t)[v13 problemDetailsCount]) {
      goto LABEL_17;
    }
  }
  id v35 = [(MapsAppDelegate *)self chromeViewController];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100A90688;
  v37[3] = &unk_1012E8E50;
  id v38 = v10;
  id v36 = [v35 presentInterruptionOfKind:22 userInfo:v21 completionHandler:v37];

  v33 = v38;
LABEL_18:
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector("currentInterruptionKind");
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = NSStringFromSelector("_currentInterruptionHandle");
    id v8 = +[NSSet setWithObject:v7];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___MapsAppDelegate;
    [super keyPathsForValuesAffectingValueForKey:v4];
  }

  return v8;
}

- (void)presentRAP
{
  id v3 = +[UIApplication _maps_keyMapsSceneDelegate];
  uint64_t v2 = [v3 rapPresenter];
  [v2 presentReportAProblemWithCompletion:0];
}

- (void)presentAddAMissingPlace
{
  id v3 = +[UIApplication _maps_keyMapsSceneDelegate];
  uint64_t v2 = [v3 rapPresenter];
  [v2 presentAddAPlaceWithCompletion:0];
}

- (void)toggleSidebarSelection
{
  uint64_t v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"SIDEBAR_SELECTION_ENABLED_KEY"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [v4 BOOLValue] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  [v2 setBool:v5 forKey:@"SIDEBAR_SELECTION_ENABLED_KEY"];
  exit(0);
}

- (void)toggleScrollingOpensPlacecard
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v2 = +[NSUserDefaults standardUserDefaults];
  objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v2, "BOOLForKey:", @"SCROLLING_OPENS_PLACECARD_KEY_ROTATED") ^ 1, @"SCROLLING_OPENS_PLACECARD_KEY_ROTATED");
}

- (void)toggleDisableMenuSharing
{
  uint64_t v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = +[NSUserDefaults standardUserDefaults];
  objc_msgSend(v2, "setBool:forKey:", objc_msgSend(v3, "BOOLForKey:", @"MENU_SHARING_DISABLED_KEY") ^ 1, @"MENU_SHARING_DISABLED_KEY");

  exit(0);
}

- (void)presentRadar
{
  id v3 = objc_opt_new();
  [v3 setTitle:@"[macOS]"];
  id v4 = +[MapsRadarComponent mapsComponent];
  [v3 setComponent:v4];

  if (qword_101610B68 != -1) {
    dispatch_once(&qword_101610B68, &stru_10131BBA0);
  }
  uint64_t v5 = (id)qword_101610B60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_12;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(MapsAppDelegate *)v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR", buf, 0xCu);
  }
  id v12 = +[MapsRadarController sharedInstance];
  [v12 launchTTRWithRadar:v3];
}

- (void)requestNewTab:(id)a3
{
}

- (void)requestNewWindow:(id)a3
{
}

- (void)newScene
{
  id v4 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.NewWindow"];
  [v4 setEligibleForHandoff:0];
  id v2 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  id v3 = +[UIApplication sharedApplication];
  [v3 requestSceneSessionActivation:0 userActivity:v4 options:v2 errorHandler:0];
}

- (void)presentAddAMissingPlaceWith:(id)a3
{
  id v4 = +[UIApplication _maps_keyMapsSceneDelegate];
  id v3 = [v4 rapPresenter];
  [v3 presentAddAPlaceWithCompletion:0];
}

- (void)setCurrentTest:(id)a3
{
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  notify_post("com.apple.Maps.PPT.start");
  id v10 = [v9 _mapstest_isUsingSampleProactiveData];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100CE69E0;
  v15[3] = &unk_101321608;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  BOOL v13 = +[_MapsApplicationDelegateTestingCoordinator application:v12 testName:v11 options:v9 shouldLoadSampleProactiveData:v10 shouldRaiseExceptionIfNeeded:0 runTest:v15];

  return v13;
}

@end