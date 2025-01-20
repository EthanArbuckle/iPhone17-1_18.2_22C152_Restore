@interface BKAppDelegate
+ (BKAppDelegate)delegate;
+ (id)anySceneController;
+ (id)currentSceneController;
+ (id)sceneControllerForViewController:(id)a3;
+ (id)sceneManager;
- (AEAnnotationProvider)sharedAnnotationProvider;
- (BAAnalyticsController)primaryAnalyticsController;
- (BDSICloudIdentityTokenTracker)iCloudIdentityTokenTracker;
- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor;
- (BKAirTrafficController)airTrafficController;
- (BKAppAccountActionHandler)appAccountActionHandler;
- (BKAppDelegate)init;
- (BKAppGlobalActionHandler)appGlobalActionHandler;
- (BKAppImportCoordinator)importCoordinator;
- (BKAppInternalActionHandler)appInternalActionHandler;
- (BKAppLaunchCoordinator)appLaunchCoordinator;
- (BKAppLifecycleObserver)appLifecycleObserver;
- (BKAppSceneManager)sceneManager;
- (BKAssetCoverImageHelper)coverImageHelper;
- (BKAssetMetadataCache)assetMetadataCache;
- (BKAudiobookController)audiobookController;
- (BKBookletMigrationManager)bookletMigrationManager;
- (BKContainerHost)containerHost;
- (BKCriticalAlertCoordinating)criticalAlertCoordinator;
- (BKEngagementManager)engagementManager;
- (BKFinishedAssetManager)finishedAssetManager;
- (BKLaunchOperationQueue)librarySetupQueue;
- (BKLaunchOperationQueue)preLaunchQueue;
- (BKLaunchOperationQueue)startupQueue;
- (BKLibraryAssetIsNewManager)libraryAssetIsNewManager;
- (BKLibraryAssetModificationDateManager)libraryAssetModificationDateManager;
- (BKLibraryAssetPostProcessor)libraryAssetPostProcessor;
- (BKLibraryDataSourcePlistUntetheredBooks)untetheredPlistDataSource;
- (BKLibraryDataSourceUbiquityiOS)ubiquityiOSDataSource;
- (BKLibraryItemStateProvider)libraryItemStateProvider;
- (BKLibraryManager)libraryManager;
- (BKLibraryOperationObserver)libraryOperationObserver;
- (BKMenuController)menuController;
- (BKObjectGraphHost)objectGraphHost;
- (BKOfflineCacheLoadingController)offlineCacheLoadingController;
- (BKReachability)networkReachability;
- (BKServiceCenter)serviceCenter;
- (BKStoreController)storeController;
- (BKUbiquitousDocumentsController)ubiquitousDocumentsController;
- (BKUbiquityOptInController)ubiquityOptInController;
- (BOOL)annotationProvider:(id)a3 acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5;
- (BOOL)establishedRecordSalt;
- (BOOL)isConnectedToInternet;
- (BOOL)isRestoringFromiCloud;
- (BOOL)isShowPurchasesEnabled;
- (BOOL)isStoreAllowed;
- (BOOL)isSyncingEnabledForIsNewManager:(id)a3;
- (BOOL)libraryAssetStatusController:(id)a3 isAccountPrimaryAndSignedIn:(id)a4;
- (BOOL)suppressOpenLastBook;
- (BOOL)userHasCancelledAuthorizationPrompt;
- (BSUIDownloadProgressCenter)downloadProgressCenter;
- (BSUIJetActionHandling)jetActionHandler;
- (BUAssertion)analyticsSessionAssertion;
- (BUCoalescingCallBlock)coalescedUpdateEnableSync;
- (BUCoalescingCallBlock)coalescingJaliscoBlock;
- (BUNetworkMonitoring)networkMonitor;
- (BUOSStateHandler)bcSyncUserDefaultsStateHandler;
- (BUOSStateHandler)syncUserDefaultsStateHandler;
- (BUOSStateHandler)ubiquityStatusMonitorStateHandler;
- (IMUbiquityStatusMonitor)ubiquityStatusMonitor;
- (NSDate)analyticsTimeoutStart;
- (NSDictionary)launchOptions;
- (NSString)currentLocalAccountIdentifier;
- (OS_dispatch_queue)workloopBackgroundQueue;
- (OS_dispatch_queue)workloopUserInitiatedQueue;
- (OS_dispatch_queue)workloopUserInteractiveQueue;
- (OS_dispatch_queue)workloopUtilityQueue;
- (OS_dispatch_workloop)workloop;
- (UIWindow)window;
- (_TtP5Books20BKStartupTaskManager_)bkStartupTaskManager;
- (double)finishedAssetRemovalThreshold;
- (id)_analyticsSessionHost;
- (id)_engagementManagerDirectory;
- (id)_primarySceneControllerAnalyticsManager;
- (id)analyticsTrackerForStoreServices:(id)a3;
- (id)cleanupSnapshotManager;
- (id)contentPrivateIDForContentID:(id)a3;
- (id)contentUserIDForContentID:(id)a3;
- (id)flowControllers;
- (id)keyWindowAnalyticsTracker;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int)iCloudRestoreToken;
- (int)tccNotifyToken;
- (unint64_t)analyticsApplicationState;
- (unint64_t)bl_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4;
- (unint64_t)ec_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4;
- (unint64_t)lastRequestedReloadGeneration;
- (void)_analyticsForceEndSessionOnViewControllers;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidBecomeFrontmost:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_applicationWillTerminate:(id)a3;
- (void)_beginObservingICloudRestoreStatus;
- (void)_cleanup;
- (void)_createBackgroundTaskAssertionForLaunch;
- (void)_createCoverCache;
- (void)_createCoverCacheForcingEmptyPPTCache:(BOOL)a3;
- (void)_didFinishUpgradingWithOptions:(id)a3;
- (void)_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:(id)a3;
- (void)_endObservingICloudRestoreStatus;
- (void)_endObservingNotifications;
- (void)_extendedLaunchComplete:(id)a3;
- (void)_finishLaunching;
- (void)_iCloudStatusChanged;
- (void)_logIfError:(id)a3 operation:(id)a4;
- (void)_observeExtendedLaunchComplete;
- (void)_prewarmAEPluginRegistry;
- (void)_reloadLibraryForLaunch;
- (void)_reloadUbiquityDataSources;
- (void)_resumeFromBackground;
- (void)_setupUbiquity;
- (void)_setupUserEngagement;
- (void)_showMainViewControllerOrWelcomeScreen;
- (void)_showWelcomeScreenIfNeeded:(id)a3 completion:(id)a4;
- (void)_signalEnableSyncCheck;
- (void)_signalExtendedLaunchComplete;
- (void)_startLibraryReloadForLaunchWhenNeeded;
- (void)_startObservingNotifications;
- (void)_updateEnableSync;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)appGlobalActionHandler:(id)a3 open:(id)a4;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4;
- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationWillTerminate:(id)a3;
- (void)bl_endBackgroundTask:(unint64_t)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)clearReadingGoals:(id)a3;
- (void)clearWidgetImageCacheIfNeeded;
- (void)clientDetectedPredicateChange:(id)a3;
- (void)clientDetectedPurchaseServerClientExpired:(id)a3;
- (void)clientDetectedStoreChange:(id)a3;
- (void)clientDetectedStoreChangeAndAccountChange:(id)a3;
- (void)clientRequestITunesAuthentication:(id)a3 withCompletion:(id)a4;
- (void)cloudStorageUpgradeSheetWasDismissed;
- (void)deleteCloudDataWithCompletion:(id)a3;
- (void)didMigrateBooksCollection:(id)a3;
- (void)ec_endBackgroundTask:(unint64_t)a3;
- (void)flushJetMetricsWithCompletionHandler:(id)a3;
- (void)importMigratedBooks;
- (void)initialDataSourceFetchInitiated;
- (void)libraryAssetStatusController:(id)a3 makeAccountPrimaryAndSignedIn:(id)a4 completion:(id)a5;
- (void)libraryDidReload:(id)a3;
- (void)listeningSessionWillEnd;
- (void)mergeSyncSidecar;
- (void)networkReachabilityChanged:(id)a3;
- (void)orderFrontStandardAboutPanel:(id)a3;
- (void)performActionForShortcutItem:(id)a3 sceneController:(id)a4 completionHandler:(id)a5;
- (void)playSessionDidEnd:(id)a3 playTime:(double)a4;
- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3;
- (void)q_deleteLocaliCloudDataIfUserLoggedOutFromiCloud;
- (void)q_setupLibrary;
- (void)readSessionDidEnd:(id)a3 readTime:(double)a4;
- (void)registerAppIntentsDependencies;
- (void)registerReadingSettings;
- (void)resetAnalyticsIdentifier:(id)a3;
- (void)resetOnlineContentAccess:(id)a3;
- (void)saveStateClosing:(BOOL)a3;
- (void)seriesCoversForSeriesIdsChanged:(id)a3;
- (void)setAirTrafficController:(id)a3;
- (void)setAnalyticsApplicationState:(unint64_t)a3;
- (void)setAnalyticsSessionAssertion:(id)a3;
- (void)setAnalyticsTimeoutStart:(id)a3;
- (void)setAppLaunchCoordinator:(id)a3;
- (void)setAppLifecycleObserver:(id)a3;
- (void)setBcSyncUserDefaultsStateHandler:(id)a3;
- (void)setBookletMigrationManager:(id)a3;
- (void)setCoalescedUpdateEnableSync:(id)a3;
- (void)setCoalescingJaliscoBlock:(id)a3;
- (void)setContainerHost:(id)a3;
- (void)setCurrentLocalAccountIdentifier:(id)a3;
- (void)setDownloadProgressCenter:(id)a3;
- (void)setEngagementManager:(id)a3;
- (void)setEstablishedRecordSalt:(BOOL)a3;
- (void)setFinishedAssetManager:(id)a3;
- (void)setFinishedAssetRemovalThreshold:(double)a3;
- (void)setICloudIdentityTokenTracker:(id)a3;
- (void)setICloudRestoreToken:(int)a3;
- (void)setImportCoordinator:(id)a3;
- (void)setLastRequestedReloadGeneration:(unint64_t)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setLibraryAssetIsNewManager:(id)a3;
- (void)setLibraryAssetModificationDateManager:(id)a3;
- (void)setLibraryAssetPostProcessor:(id)a3;
- (void)setLibraryItemStateProvider:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setLibraryOperationObserver:(id)a3;
- (void)setLibrarySetupQueue:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setNetworkReachability:(id)a3;
- (void)setOfflineCacheLoadingController:(id)a3;
- (void)setPreLaunchQueue:(id)a3;
- (void)setRestoringFromICloud:(BOOL)a3;
- (void)setServiceCenter:(id)a3;
- (void)setSharedAnnotationProvider:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)setStoreController:(id)a3;
- (void)setSuppressOpenLastBook:(BOOL)a3;
- (void)setSyncUserDefaultsStateHandler:(id)a3;
- (void)setTccNotifyToken:(int)a3;
- (void)setUbiquitousDocumentsController:(id)a3;
- (void)setUbiquityOptInController:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)setUbiquityStatusMonitorStateHandler:(id)a3;
- (void)setUbiquityiOSDataSource:(id)a3;
- (void)setUntetheredPlistDataSource:(id)a3;
- (void)setUserHasCancelledAuthorizationPrompt:(BOOL)a3;
- (void)setWorkloop:(id)a3;
- (void)setWorkloopBackgroundQueue:(id)a3;
- (void)setWorkloopUserInitiatedQueue:(id)a3;
- (void)setWorkloopUserInteractiveQueue:(id)a3;
- (void)setWorkloopUtilityQueue:(id)a3;
- (void)setupAEAssetFactory;
- (void)showConfigurationErrorAndQuit;
- (void)sq_kickoffFinishLaunching;
- (void)startDownloadPurchaseMonitor;
- (void)storeChangedNotification:(id)a3;
- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4;
- (void)userDefaultsChanged:(id)a3;
- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5;
@end

@implementation BKAppDelegate

- (BSUIJetActionHandling)jetActionHandler
{
  v2 = self;
  v3 = [(BKAppDelegate *)v2 objectGraphHost];
  swift_retain();

  sub_100058D18(&qword_100B2E000);
  sub_1007FD8A0();
  swift_release();

  return (BSUIJetActionHandling *)v5;
}

- (void)clearWidgetImageCacheIfNeeded
{
  uint64_t v0 = sub_1007F29D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = self;
  id v39 = [v4 bu_groupUserDefaults];
  NSString v5 = sub_1007FDC30();
  id v6 = [v39 integerForKey:v5];

  if (!v6)
  {
    id v7 = [v4 standardUserDefaults];
    NSString v8 = sub_1007FDC30();
    [v7 integerForKey:v8];

    Class isa = sub_1007FE290().super.super.isa;
    NSString v10 = sub_1007FDC30();
    [v39 setValue:isa forKey:v10];
  }
  NSString v11 = sub_1007FDC30();
  uint64_t v12 = (uint64_t)[v39 integerForKey:v11];

  if (v12 > 3)
  {
    id v30 = v39;
  }
  else
  {
    if (qword_100B22F80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10005B838(v0, (uint64_t)qword_100B3BAE8);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
    LOBYTE(v40) = 1;
    v14 = self;
    id v15 = [v14 defaultManager];
    sub_1007F29A0();
    NSString v16 = sub_1007FDC30();
    swift_bridgeObjectRelease();
    unsigned int v17 = [v15 fileExistsAtPath:v16 isDirectory:&v40];

    if (v17)
    {
      id v18 = [v14 defaultManager];
      sub_1007F2960(v19);
      v21 = v20;
      uint64_t v41 = 0;
      unsigned int v22 = [v18 removeItemAtURL:v20 error:&v41];

      if (v22)
      {
        id v23 = (id)v41;
        Class v24 = sub_1007FE290().super.super.isa;
        NSString v25 = sub_1007FDC30();
        [v39 setValue:v24 forKey:v25];

        if (qword_100B22F90 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_1007F6BC0();
        sub_10005B838(v26, (uint64_t)qword_100B3BB08);
        v27 = sub_1007F6BA0();
        os_log_type_t v28 = sub_1007FE3E0();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v29 = 134217984;
          uint64_t v41 = 4;
          sub_1007FEE10();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Successfully deleted previous image cache folder. Updated current cache folder version to %ld.", v29, 0xCu);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      }
      else
      {
        id v31 = (id)v41;
        sub_1007F2800();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        if (qword_100B22F90 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_1007F6BC0();
        sub_10005B838(v32, (uint64_t)qword_100B3BB08);
        swift_errorRetain();
        swift_errorRetain();
        v33 = sub_1007F6BA0();
        os_log_type_t v34 = sub_1007FE3C0();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (uint8_t *)swift_slowAlloc();
          uint64_t v41 = swift_slowAlloc();
          *(_DWORD *)v35 = 136315138;
          swift_getErrorValue();
          uint64_t v36 = sub_1007FF540();
          uint64_t v40 = sub_10005B0A8(v36, v37, &v41);
          sub_1007FEE10();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to delete previous image cache folder: %s", v35, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
  }
}

- (id)cleanupSnapshotManager
{
  uint64_t v0 = self;
  id v1 = [v0 applicationCacheDirectory];
  if (!v1)
  {
    __break(1u);
LABEL_12:
    __break(1u);
  }
  uint64_t v2 = v1;
  sub_1007FDC70();

  v19._countAndFlagsBits = 0xD000000000000011;
  v19._object = (void *)0x800000010090EC10;
  sub_1007FDD20(v19);
  swift_bridgeObjectRelease();
  id v3 = [v0 applicationDocumentsDirectory];
  if (!v3) {
    goto LABEL_12;
  }
  v4 = v3;
  sub_1007FDC70();

  v20._countAndFlagsBits = 0xD000000000000011;
  v20._object = (void *)0x800000010090EC10;
  sub_1007FDD20(v20);
  swift_bridgeObjectRelease();
  NSString v5 = self;
  id v6 = [v5 defaultManager];
  NSString v7 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  id v17 = 0;
  unsigned int v8 = [v6 removeItemAtPath:v7 error:&v17];

  if (v8)
  {
    id v9 = v17;
  }
  else
  {
    id v10 = v17;
    sub_1007F2800();

    swift_willThrow();
    swift_errorRelease();
  }
  id v11 = [v5 defaultManager];
  NSString v12 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  id v17 = 0;
  unsigned int v13 = [v11 removeItemAtPath:v12 error:&v17];

  id v14 = v17;
  if (v13)
  {
    return v14;
  }
  else
  {
    id v16 = v17;
    sub_1007F2800();

    swift_willThrow();
    return (id)swift_errorRelease();
  }
}

- (unint64_t)ec_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  NSString v7 = +[UIApplication sharedApplication];
  id v8 = [v7 beginBackgroundTaskWithName:v6 expirationHandler:v5];

  return (unint64_t)v8;
}

- (BKAssetMetadataCache)assetMetadataCache
{
  return self->_assetMetadataCache;
}

- (BKAssetCoverImageHelper)coverImageHelper
{
  return self->_coverImageHelper;
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (BKUbiquitousDocumentsController)ubiquitousDocumentsController
{
  return self->_ubiquitousDocumentsController;
}

- (BKLibraryItemStateProvider)libraryItemStateProvider
{
  return self->_libraryItemStateProvider;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = +[BKReadingActivityService includePDFsDefaultsKey];
  v88 = v9;
  v89 = &__kCFBooleanFalse;
  id v10 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  [v8 registerDefaults:v10];

  [(BKAppDelegate *)self enableMetricsInspectorOnDebugMode];
  id v11 = +[NSUserDefaults standardUserDefaults];
  NSString v12 = +[BKReadingActivityService readingGoalsUserDefaultsKey];
  unsigned int v13 = [v11 objectForKey:v12];

  id v14 = +[BUAppGroup books];
  id v15 = [v14 userDefaults];
  id v16 = +[BKReadingActivityService readingGoalsUserDefaultsKey];
  v86 = v16;
  id v17 = &__kCFBooleanTrue;
  if (v13) {
    id v17 = v13;
  }
  v87 = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
  [v15 registerDefaults:v18];

  if (v13)
  {
    Swift::String v19 = +[NSUserDefaults standardUserDefaults];
    Swift::String v20 = +[BKReadingActivityService readingGoalsUserDefaultsKey];
    [v19 removeObjectForKey:v20];
  }
  v21 = +[NSUserDefaults standardUserDefaults];
  unsigned int v22 = [v21 objectForKey:@"BKIncludeBookStoreResultsInSearch"];

  if (!v22)
  {
    objc_opt_class();
    id v23 = +[NSUserDefaults standardUserDefaults];
    Class v24 = [v23 objectForKey:@"BKExcludeBookStoreResultsInSearch"];
    NSString v25 = BUDynamicCast();

    uint64_t v26 = +[NSUserDefaults standardUserDefaults];
    v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 BOOLValue] ^ 1);
    [v26 setObject:v27 forKey:@"BKIncludeBookStoreResultsInSearch"];

    os_log_type_t v28 = +[NSUserDefaults standardUserDefaults];
    [v28 removeObjectForKey:@"BKExcludeBookStoreResultsInSearch"];
  }
  v29 = +[NSUserDefaults standardUserDefaults];
  [v29 removeObjectForKey:@"BKLibraryClearICloudMergeDataOnRestart"];

  id v30 = +[NSUserDefaults standardUserDefaults];
  [v30 removeObjectForKey:@"REI.EnableCellularFontDownload"];

  [v6 setMinimumBackgroundFetchInterval:3600.0];
  +[INPreferences requestSiriAuthorization:&stru_100A4B800];
  id v31 = sub_100045ED0();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Registering Link actions", buf, 2u);
  }

  [(BKAppDelegate *)self registerAppIntentsDependencies];
  [(BKAppDelegate *)self _createBackgroundTaskAssertionForLaunch];
  [(BKAppDelegate *)self setLaunchOptions:v7];
  uint64_t v32 = BCIMLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v85 = v7;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Books launching with launchOptions=%{private}@", buf, 0xCu);
  }

  v33 = [(BKAppDelegate *)self startupQueue];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100027320;
  v83[3] = &unk_100A43D60;
  v83[4] = self;
  [v33 addOperationWithBlock:v83];

  os_log_type_t v34 = [(BKAppDelegate *)self startupQueue];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100026240;
  v82[3] = &unk_100A43D60;
  v82[4] = self;
  [v34 addOperationWithBlock:v82];

  v35 = [(BKAppDelegate *)self startupQueue];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100078768;
  v81[3] = &unk_100A43D60;
  v81[4] = self;
  [v35 addOperationWithBlock:v81];

  uint64_t v36 = [(BKAppDelegate *)self startupQueue];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100015918;
  v80[3] = &unk_100A43D60;
  v80[4] = self;
  [v36 addOperationWithBlock:v80];

  unint64_t v37 = [(BKAppDelegate *)self startupQueue];
  [v37 addOperationWithBlock:&stru_100A4B820];

  uint64_t v38 = [(BKAppDelegate *)self startupQueue];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10006F158;
  v79[3] = &unk_100A43D60;
  v79[4] = self;
  [v38 addOperationWithBlock:v79];

  id v39 = [(BKAppDelegate *)self startupQueue];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100078698;
  v78[3] = &unk_100A43D60;
  v78[4] = self;
  [v39 addOperationWithBlock:v78];

  uint64_t v40 = [(BKAppDelegate *)self startupQueue];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1000151A8;
  v77[3] = &unk_100A43D60;
  v77[4] = self;
  [v40 addOperationWithBlock:v77];

  uint64_t v41 = [(BKAppDelegate *)self startupQueue];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100043DE8;
  v76[3] = &unk_100A43D60;
  v76[4] = self;
  [v41 addOperationWithBlock:v76];

  v42 = [(BKAppDelegate *)self startupQueue];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100014DFC;
  v75[3] = &unk_100A43D60;
  v75[4] = self;
  [v42 addOperationWithBlock:v75];

  v43 = [(BKAppDelegate *)self startupQueue];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10000F194;
  v74[3] = &unk_100A43D60;
  v74[4] = self;
  [v43 addOperationWithBlock:v74];

  v44 = [(BKAppDelegate *)self startupQueue];
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100015E44;
  v73[3] = &unk_100A43D60;
  v73[4] = self;
  [v44 addOperationWithBlock:v73];

  v45 = [(BKAppDelegate *)self startupQueue];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10000B5AC;
  v71[3] = &unk_100A43DD8;
  v71[4] = self;
  id v72 = v7;
  id v46 = v7;
  [v45 addOperationWithBlock:v71];

  v47 = [(BKAppDelegate *)self startupQueue];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100017E88;
  v70[3] = &unk_100A43D60;
  v70[4] = self;
  [v47 addOperationWithBlock:v70];

  v48 = [(BKAppDelegate *)self startupQueue];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100078814;
  v69[3] = &unk_100A43D60;
  v69[4] = self;
  [v48 addOperationWithBlock:v69];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100A4B840);
  [v6 registerForRemoteNotifications];
  v49 = +[BAAppManager sharedManager];
  [v49 startAppSessionWithApplicationGroupIdentifier:BUBooksGroupContainerIdentifier enableUploads:1];

  v50 = [(BKAppDelegate *)self appLaunchCoordinator];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100022378;
  v67[3] = &unk_100A447C8;
  v67[4] = self;
  id v68 = v6;
  id v51 = v6;
  [v50 appLaunchCoordinatorOnConditionMask:512 blockID:@"actionHandler initialization" performBlock:v67];

  v52 = [BKMenuController alloc];
  v53 = [(BKAppDelegate *)self appLaunchCoordinator];
  v54 = [(BKAppDelegate *)self sceneManager];
  v55 = [(BKMenuController *)v52 initWithAppLaunchCoordinator:v53 sceneManager:v54];
  menuController = self->_menuController;
  self->_menuController = v55;

  v57 = [(BKAppDelegate *)self appLaunchCoordinator];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10002F31C;
  v66[3] = &unk_100A44268;
  v66[4] = self;
  [v57 appLaunchCoordinatorOnConditionMask:512 blockID:@"audioBookController initialization" performBlock:v66];

  v58 = [(BKAppDelegate *)self appLaunchCoordinator];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10000AE4C;
  v65[3] = &unk_100A44268;
  v65[4] = self;
  [v58 appLaunchCoordinatorOnConditionMask:512 blockID:@"jsaBridge startEviction" performBlock:v65];

  v59 = [(BKAppDelegate *)self appLaunchCoordinator];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000787D4;
  v64[3] = &unk_100A44268;
  v64[4] = self;
  [v59 appLaunchCoordinatorOnConditionMask:512 blockID:@"SnapshotManager cleanup" performBlock:v64];

  v60 = [(BKAppDelegate *)self appLaunchCoordinator];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10000B37C;
  v63[3] = &unk_100A44268;
  v63[4] = self;
  [v60 appLaunchCoordinatorOnConditionMask:512 blockID:@"Start after-launching tasks" performBlock:v63];

  v61 = [(BKAppDelegate *)self bkStartupTaskManager];
  [v61 startAllTasksInPhase:1];

  kdebug_trace();
  return 1;
}

- (BKLaunchOperationQueue)startupQueue
{
  return self->_startupQueue;
}

- (void)_finishLaunching
{
  id v3 = [(BKAppDelegate *)self workloopUtilityQueue];
  dispatch_async(v3, &stru_100A4B5A8);

  kdebug_trace();
  kdebug_trace();
  [(BKAppDelegate *)self _setupUbiquity];
  kdebug_trace();
  id v4 = +[BCLayerRenderer sharedInstance];
  id v5 = [(BKAppDelegate *)self preLaunchQueue];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100023BCC;
  v35[3] = &unk_100A43D60;
  v35[4] = self;
  [v5 addOperationWithBlock:v35];

  id v6 = [(BKAppDelegate *)self preLaunchQueue];
  [v6 addOperationWithBlock:&stru_100A4B5C8];

  id v7 = [(BKAppDelegate *)self preLaunchQueue];
  [v7 addOperationWithBlock:&stru_100A4B5E8];

  id v8 = [(BKAppDelegate *)self preLaunchQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000153D8;
  v34[3] = &unk_100A43D60;
  v34[4] = self;
  [v8 addOperationWithBlock:v34];

  id v9 = [(BKAppDelegate *)self preLaunchQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100078EA0;
  v33[3] = &unk_100A43D60;
  v33[4] = self;
  [v9 addOperationWithBlock:v33];

  id v10 = [(BKAppDelegate *)self workloopUserInitiatedQueue];
  dispatch_async(v10, &stru_100A4B608);

  id v11 = [(BKAppDelegate *)self preLaunchQueue];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001904C;
  v32[3] = &unk_100A43D60;
  v32[4] = self;
  [v11 addOperationWithBlock:v32];

  NSString v12 = [(BKAppDelegate *)self preLaunchQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000088F4;
  v31[3] = &unk_100A43D60;
  v31[4] = self;
  [v12 addOperationWithBlock:v31];

  unsigned int v13 = [(BKAppDelegate *)self preLaunchQueue];
  [v13 addOperationWithBlock:&stru_100A4B628];

  id v14 = [(BKAppDelegate *)self preLaunchQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001C484;
  v30[3] = &unk_100A43D60;
  v30[4] = self;
  [v14 addOperationWithBlock:v30];

  id v15 = [(BKAppDelegate *)self preLaunchQueue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100079014;
  v29[3] = &unk_100A43D60;
  v29[4] = self;
  [v15 addOperationWithBlock:v29];

  id v16 = [(BKAppDelegate *)self preLaunchQueue];
  [v16 addOperationWithBlock:&stru_100A4B648];

  id v17 = [(BKAppDelegate *)self preLaunchQueue];
  [v17 addOperationWithBlock:&stru_100A4B668];

  id v18 = [(BKAppDelegate *)self preLaunchQueue];
  [v18 addOperationWithBlock:&stru_100A4B688];

  Swift::String v19 = [(BKAppDelegate *)self preLaunchQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100009E84;
  v28[3] = &unk_100A43D60;
  v28[4] = self;
  [v19 addOperationWithBlock:v28];

  Swift::String v20 = [(BKAppDelegate *)self preLaunchQueue];
  [v20 addOperationWithBlock:&stru_100A4B6C8];

  id v21 = objc_alloc((Class)BUNetworkMonitor);
  unsigned int v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v23 = dispatch_queue_create("com.apple.iBooks.networkMonitoringQueue", v22);
  id v24 = [v21 initWithQueue:v23];
  [(BKAppDelegate *)self setNetworkMonitor:v24];

  NSString v25 = +[BCSyncUserDefaults makeOSStateHandler];
  [(BKAppDelegate *)self setBcSyncUserDefaultsStateHandler:v25];

  uint64_t v26 = [(BKAppDelegate *)self preLaunchQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000FC88;
  v27[3] = &unk_100A43D60;
  v27[4] = self;
  [v26 addOperationWithBlock:v27];

  kdebug_trace();
}

- (BKLaunchOperationQueue)preLaunchQueue
{
  return self->_preLaunchQueue;
}

+ (BKAppDelegate)delegate
{
  objc_opt_class();
  uint64_t v2 = +[UIApplication sharedApplication];
  id v3 = [v2 delegate];
  id v4 = BUDynamicCast();

  return (BKAppDelegate *)v4;
}

- (BKAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (BKAppLaunchCoordinator)appLaunchCoordinator
{
  return self->_appLaunchCoordinator;
}

- (void)ec_endBackgroundTask:(unint64_t)a3
{
  id v4 = +[UIApplication sharedApplication];
  [v4 endBackgroundTask:a3];
}

- (_TtP5Books20BKStartupTaskManager_)bkStartupTaskManager
{
  uint64_t v2 = self;
  id v3 = [(BKAppDelegate *)v2 containerHost];
  sub_10006023C((uint64_t)v6);

  sub_10005DA74(v6, v6[3]);
  sub_1007F4CF0();
  result = (_TtP5Books20BKStartupTaskManager_ *)sub_1007F4C60();
  if (result)
  {
    id v5 = result;
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v6);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BKContainerHost)containerHost
{
  swift_beginAccess();
  id v3 = self;
  id v4 = objc_getAssociatedObject(v3, &unk_100B757A0);
  result = (BKContainerHost *)swift_endAccess();
  if (v4)
  {
    sub_1007FEEC0();
    swift_unknownObjectRelease();
    sub_10005E614(&v7, &v8);
    type metadata accessor for ContainerHost();
    swift_dynamicCast();

    return (BKContainerHost *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_extendedLaunchComplete:(id)a3
{
  id v4 = a3;
  id v5 = sub_100045ED0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received %@. Marking extended launch as complete.", buf, 0xCu);
  }
  long long v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = BSUIFeedInitialContentReadyNotification;
  [v7 removeObserver:self name:BSUIFeedInitialContentReadyNotification object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:BSUIFeedViewControllerDidDisappearNotification object:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  id v11 = +[BKRootBarCoordinator didSwitchRootBarItemNotification];
  [v10 removeObserver:self name:v11 object:0];

  NSString v12 = +[NSNotificationCenter defaultCenter];
  unsigned int v13 = +[BKRootBarCoordinator rootViewControllerDidDisappearNotification];
  [v12 removeObserver:self name:v13 object:0];

  id v14 = [v4 name];
  LODWORD(v8) = [v14 isEqualToString:v8];

  if (v8)
  {
    [(BKAppDelegate *)self _signalExtendedLaunchComplete];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001F9BEC;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_didFinishUpgradingWithOptions:(id)a3
{
  id v4 = +[BKSeriesCoverManager sharedInstance];
  [v4 addSeriesCoverObserver:self];

  id v5 = +[BKSeriesCoverManager sharedInstance];
  [v5 prewarm];

  +[BKPDFModernBookViewController setupModernPDF];
  objc_opt_class();
  id v6 = [(BKAppDelegate *)self mainLibrary];
  long long v7 = BUDynamicCast();

  uint64_t v8 = [BKLibraryAssetIsNewManager alloc];
  uint64_t v9 = [(BKAppDelegate *)self sharedAnnotationProvider];
  id v10 = [(BKAppDelegate *)self workloopBackgroundQueue];
  id v11 = [(BKLibraryAssetIsNewManager *)v8 initWithLibraryManager:v7 annotationProvider:v9 queue:v10];
  [(BKAppDelegate *)self setLibraryAssetIsNewManager:v11];

  NSString v12 = [(BKAppDelegate *)self libraryAssetIsNewManager];
  [v12 setDelegate:self];

  [(BKAppDelegate *)self _startLibraryReloadForLaunchWhenNeeded];
  unsigned int v13 = +[NSUserDefaults standardUserDefaults];
  LOBYTE(v9) = [v13 BOOLForKey:@"BKTestEPubLayout"];

  id v14 = +[NSUserDefaults standardUserDefaults];
  unsigned int v15 = [v14 BOOLForKey:@"BKTestEPubPowerConsumption"];

  if ((v9 & 1) != 0 || v15) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100A4BA70);
  }
  id v16 = +[BKLastOpenBookManager sharedInstance];
  [v16 prewarmAppState];

  [(BKAppDelegate *)self _showMainViewControllerOrWelcomeScreen];
  dispatch_time_t v17 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F8D94;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_observeExtendedLaunchComplete
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_extendedLaunchComplete:" name:BSUIFeedInitialContentReadyNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_extendedLaunchComplete:" name:BSUIFeedViewControllerDidDisappearNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  id v6 = +[BKRootBarCoordinator didSwitchRootBarItemNotification];
  [v5 addObserver:self selector:"_extendedLaunchComplete:" name:v6 object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  long long v7 = +[BKRootBarCoordinator rootViewControllerDidDisappearNotification];
  [v8 addObserver:self selector:"_extendedLaunchComplete:" name:v7 object:0];
}

- (BAAnalyticsController)primaryAnalyticsController
{
  uint64_t v2 = [(BKAppDelegate *)self _primarySceneControllerAnalyticsManager];
  id v3 = [v2 analyticsController];

  return (BAAnalyticsController *)v3;
}

- (id)_primarySceneControllerAnalyticsManager
{
  objc_opt_class();
  id v3 = [(BKAppDelegate *)self sceneManager];
  id v4 = [v3 primarySceneController];
  id v5 = BUDynamicCast();

  id v6 = [v5 analyticsManager];

  return v6;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  +[JSAApplication didBecomeActive];
  id v4 = [(BKAppDelegate *)self sceneManager];
  id v5 = [v4 appStoreReviewManager];
  [v5 applicationDidForeground];

  id v6 = +[BCCloudKitController sharedInstance];
  [v6 applicationDidBecomeActive];

  if ((id)[(BKAppDelegate *)self analyticsApplicationState] == (id)1)
  {
    long long v7 = [(BKAppDelegate *)self sceneManager];
    [v7 analyticsVisibilityDidDisappear];
  }
  [(BKAppDelegate *)self setAnalyticsApplicationState:2];
  id v8 = [(BKAppDelegate *)self sceneManager];
  [v8 analyticsVisibilityUpdate];
}

- (id)flowControllers
{
  uint64_t v2 = [(BKAppDelegate *)self sceneManager];
  id v3 = BUProtocolCast();
  id v4 = [v3 flowControllers];

  return v4;
}

- (UIWindow)window
{
  id v3 = [(BKAppDelegate *)self sceneManager];
  id v4 = [v3 currentSceneController];

  if (v4)
  {
    id v5 = [(BKAppDelegate *)self sceneManager];
    id v6 = [v5 currentSceneController];
    long long v7 = [v6 bk_window];
  }
  else
  {
    id v8 = sub_100045ED0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007F02D0();
    }

    long long v7 = 0;
  }

  return (UIWindow *)v7;
}

+ (id)sceneManager
{
  uint64_t v2 = +[BKAppDelegate delegate];
  id v3 = [v2 sceneManager];

  return v3;
}

- (BKEngagementManager)engagementManager
{
  uint64_t v2 = self;
  id v3 = (void *)BKAppDelegate.engagementManager.getter();

  return (BKEngagementManager *)v3;
}

- (void)_setupUbiquity
{
  id v3 = objc_alloc((Class)BDSICloudIdentityTokenTracker);
  id v4 = +[BDSApplication applicationDocumentsDirectory];
  id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  id v6 = (BDSICloudIdentityTokenTracker *)[v3 initWithContainerURL:v5 trackingLiverpool:0];
  iCloudIdentityTokenTracker = self->_iCloudIdentityTokenTracker;
  self->_iCloudIdentityTokenTracker = v6;

  id v8 = (IMUbiquityStatusMonitor *)objc_alloc_init((Class)IMUbiquityStatusMonitor);
  ubiquityStatusMonitor = self->_ubiquityStatusMonitor;
  self->_ubiquityStatusMonitor = v8;

  [(IMUbiquityStatusMonitor *)self->_ubiquityStatusMonitor registerCoordinatingObserver:self];
  id v10 = [(BKAppDelegate *)self liverpoolStatusMonitor];
  [v10 registerCoordinatingObserver:self];

  id v11 = [BKUbiquityOptInController alloc];
  NSString v12 = self->_ubiquityStatusMonitor;
  unsigned int v13 = [(BKAppDelegate *)self liverpoolStatusMonitor];
  id v14 = [(BKUbiquityOptInController *)v11 initWithStatusMonitor:v12 liverpoolStatusMonitor:v13];
  ubiquityOptInController = self->_ubiquityOptInController;
  self->_ubiquityOptInController = v14;

  id v16 = +[BDSLiverpoolStatusMonitor makeOSStateHandler];
  [(BKAppDelegate *)self setSyncUserDefaultsStateHandler:v16];

  id v17 = [(IMUbiquityStatusMonitor *)self->_ubiquityStatusMonitor makeOSStateHandler];
  [(BKAppDelegate *)self setUbiquityStatusMonitorStateHandler:v17];
}

- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor
{
  if (qword_100B4A648 != -1) {
    dispatch_once(&qword_100B4A648, &stru_100A4B6E8);
  }
  uint64_t v2 = (void *)qword_100B4A650;

  return (BDSLiverpoolStatusMonitor *)v2;
}

- (BKStoreController)storeController
{
  storeController = self->_storeController;
  if (!storeController)
  {
    BCReportAssertionFailureWithMessage();
    storeController = self->_storeController;
  }

  return storeController;
}

- (void)setupAEAssetFactory
{
  id v3 = +[AEBookProtocolCacheItemProvider sharedInstance];
  id v4 = +[BEProtocolCache sharedInstance];
  [v4 setItemProvider:v3];

  id v5 = +[BKLibraryManager defaultManager];
  +[AEAssetEngine setLibraryMgr:v5];

  id v23 = (id)objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(BKAppDelegate *)self sharedAnnotationProvider];
    [v23 setSharedAnnotationProvider:v6];
  }
  long long v7 = +[BKLibraryManager defaultManager];
  id v8 = BUProtocolCast();
  [v23 setSharedBookCoverResetter:v8];

  uint64_t v9 = [REEpubPlugin alloc];
  id v10 = [(BKAppDelegate *)self storeController];
  id v11 = [(BKAppDelegate *)self engagementManager];
  NSString v12 = [(REEpubPlugin *)v9 initWithStoreController:v10 engagementManager:v11];

  if (objc_opt_respondsToSelector())
  {
    unsigned int v13 = [(BKAppDelegate *)self sharedAnnotationProvider];
    [(REEpubPlugin *)v12 setSharedAnnotationProvider:v13];
  }
  id v14 = objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    unsigned int v15 = [(BKAppDelegate *)self sharedAnnotationProvider];
    [v14 setSharedAnnotationProvider:v15];
  }
  id v16 = objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    id v17 = [(BKAppDelegate *)self sharedAnnotationProvider];
    [v16 setSharedAnnotationProvider:v17];
  }
  if (qword_100B4A668 != -1) {
    dispatch_once(&qword_100B4A668, &stru_100A4BB78);
  }
  id v18 = +[AEPluginRegistry sharedInstance];
  [v18 registerAssetEnginePlugin:v23];
  [v18 registerAssetEnginePlugin:v12];
  [v18 registerAssetEnginePlugin:v14];
  [v18 registerAssetEnginePlugin:v16];
  if ((isARMv6() & 1) == 0)
  {
    Class v19 = NSClassFromString(@"THApplePubAssetPluginProvider");
    if (v19)
    {
      Swift::String v20 = [(objc_class *)v19 sharedPlugin];
      id v21 = v20;
      if (v20 && [v20 conformsToProtocol:&OBJC_PROTOCOL___AEPlugin])
      {
        if (objc_opt_respondsToSelector())
        {
          unsigned int v22 = [(BKAppDelegate *)self sharedAnnotationProvider];
          [v21 setSharedAnnotationProvider:v22];
        }
        [v18 registerAssetEnginePlugin:v21];
      }
    }
  }
  SetBookFormatByExtensionCB();
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (BKAppDelegate)init
{
  v69.receiver = self;
  v69.super_class = (Class)BKAppDelegate;
  id v2 = [(BKAppDelegate *)&v69 init];
  if (v2)
  {
    kdebug_trace();
    if (!MKBDeviceUnlockedSinceBoot())
    {
      id v3 = BCIMLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1007EFE00();
      }

      raise(9);
    }
    [v2 _observeExtendedLaunchComplete];
    id v4 = +[BUAccountsProvider sharedProvider];
    [v4 addObserver:v2 accountTypes:1];

    dispatch_workloop_t v5 = dispatch_workloop_create("com.apple.iBooks.workloop");
    id v6 = (void *)*((void *)v2 + 37);
    *((void *)v2 + 37) = v5;

    id v7 = [objc_alloc((Class)BUCoalescingCallBlock) initWithNotifyBlock:&stru_100A4B4E0 blockDescription:@"BKApp Jalisco Authentication Request"];
    id v8 = (void *)*((void *)v2 + 52);
    *((void *)v2 + 52) = v7;

    [*((id *)v2 + 52) setCoalescingDelay:2.0];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUserInteractiveQueue", v10, *((dispatch_queue_t *)v2 + 37));
    NSString v12 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = v11;

    unsigned int v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUserInitiateQueue", v14, *((dispatch_queue_t *)v2 + 37));
    id v16 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUtilityQueue", v18, *((dispatch_queue_t *)v2 + 37));
    Swift::String v20 = (void *)*((void *)v2 + 40);
    *((void *)v2 + 40) = v19;

    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v23 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopBackgroundQueue", v22, *((dispatch_queue_t *)v2 + 37));
    id v24 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v23;

    setiopolicy_np(3, 0, 1);
    NSString v25 = [BKLaunchOperationQueue alloc];
    uint64_t v26 = BCSignpostPreLaunchQueue();
    v27 = [(BKLaunchOperationQueue *)v25 initWithName:@"com.apple.iBooks.preLaunch" signpostLog:v26 targetQueue:0 activate:1];
    os_log_type_t v28 = (void *)*((void *)v2 + 42);
    *((void *)v2 + 42) = v27;

    [*((id *)v2 + 42) setQosClass:25];
    v29 = [BKLaunchOperationQueue alloc];
    id v30 = BCSignpostLibrarySetupQueue();
    id v31 = [(BKLaunchOperationQueue *)v29 initWithName:@"com.apple.iBooks.librarySetup" signpostLog:v30 targetQueue:0 activate:1];
    uint64_t v32 = (void *)*((void *)v2 + 43);
    *((void *)v2 + 43) = v31;

    [*((id *)v2 + 43) setQosClass:25];
    v33 = [BKLaunchOperationQueue alloc];
    os_log_type_t v34 = BCSignpostStartupQueue();
    v35 = [(BKLaunchOperationQueue *)v33 initWithName:@"com.apple.iBooks.startup" signpostLog:v34 targetQueue:0 activate:0];
    uint64_t v36 = (void *)*((void *)v2 + 44);
    *((void *)v2 + 44) = v35;

    [*((id *)v2 + 44) setQosClass:33];
    BCSetUnsafeAppDelegateReference();
    unint64_t v37 = objc_alloc_init(BKAppLaunchCoordinator);
    uint64_t v38 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v37;

    id v39 = BCSignpostLaunch();
    os_signpost_id_t v40 = os_signpost_id_generate(v39);

    uint64_t v41 = BCSignpostLaunch();
    v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "Hold at launch", "", buf, 2u);
    }

    [*((id *)v2 + 15) appLaunchCoordinatorHoldAtLaunchingAssertion];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000706E8;
    block[3] = &unk_100A45688;
    id v65 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = v2;
    id v66 = v43;
    os_signpost_id_t v67 = v40;
    id v44 = v65;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v45 = +[JSAProcessEnvironment currentEnvironment];
    [v45 setup];

    id v46 = objc_alloc_init(BKBagOfflineCacheProvider);
    +[BUBag setOfflineCacheProvider:v46];

    v47 = objc_alloc_init(BKTUIOfflineCacheProvider);
    +[TUIOfflineCache setProvider:v47];

    v48 = [v43 workloopUserInitiatedQueue];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10001F2E8;
    v62[3] = &unk_100A43D60;
    id v49 = v43;
    id v63 = v49;
    dispatch_async(v48, v62);

    v50 = [v49 workloopUserInitiatedQueue];
    dispatch_async(v50, &stru_100A4B500);

    id v51 = [v49 workloopUserInitiatedQueue];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100079120;
    v60[3] = &unk_100A43D60;
    v52 = v49;
    id v61 = v52;
    dispatch_async(v51, v60);

    v53 = [v52 workloopUserInitiatedQueue];
    dispatch_async(v53, &stru_100A4B520);

    dispatch_async(*((dispatch_queue_t *)v2 + 40), &stru_100A4B540);
    id v54 = +[BCAnalyticsVisibilityPresentationNotifier sharedInstance];
    v55 = objc_alloc_init(BKAppImportCoordinator);
    v56 = (void *)v52[24];
    v52[24] = v55;

    v57 = [[BKAppSceneManager alloc] initWithLaunchCoordinator:*((void *)v2 + 15) importCoordinator:v52[24]];
    v58 = (void *)v52[6];
    v52[6] = v57;

    v52[54] = 0;
    kdebug_trace();
    +[BLLockFile setBackgroundTaskDelegate:v52];
    +[BMManagerConfiguration setBackgroundTaskDelegate:v52];
    [v52 _finishLaunching];
  }
  return (BKAppDelegate *)v2;
}

- (OS_dispatch_queue)workloopUserInitiatedQueue
{
  return self->_workloopUserInitiatedQueue;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = +[BKUserActivityManager sharedInstance];
  [v4 willEnterForeground];

  +[JSAApplication willEnterForeground];
  [(BKAppDelegate *)self _resumeFromBackground];
  id v5 = +[BCBookReadingTimeTracker sharedInstance];
  [v5 scrubRecents];
}

- (void)_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:", buf, 2u);
  }

  id v6 = [(BKAppDelegate *)self iCloudIdentityTokenTracker];
  [v6 fetchCurrentToken];
  if ([v6 didUnacknowledgediCloudLogoutOccur])
  {
    id v7 = BDSCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User logged out of iCloud.  Signalling to prevent a crash", v10, 2u);
    }

    raise(9);
  }
  else
  {
    id v8 = [(BKAppDelegate *)self iCloudIdentityTokenTracker];
    [v8 acknowledgeiCloudIdentity];
  }
  uint64_t v9 = (void (**)(void))objc_retainBlock(v4);

  if (v9) {
    v9[2](v9);
  }
}

- (BDSICloudIdentityTokenTracker)iCloudIdentityTokenTracker
{
  return self->_iCloudIdentityTokenTracker;
}

- (BKObjectGraphHost)objectGraphHost
{
  id v2 = self;
  id v3 = BKAppDelegate.objectGraphHost.getter();

  return (BKObjectGraphHost *)v3;
}

- (BKServiceCenter)serviceCenter
{
  id v2 = self;
  id v3 = (void *)BKAppDelegate.serviceCenter.getter();

  return (BKServiceCenter *)v3;
}

- (void)sq_kickoffFinishLaunching
{
  kdebug_trace();
  id v3 = [(BKAppDelegate *)self preLaunchQueue];
  [v3 waitUntilAllOperationsAreFinished];

  kdebug_trace();
  preLaunchQueue = self->_preLaunchQueue;
  self->_preLaunchQueue = 0;

  kdebug_trace();
  id v5 = [(BKAppDelegate *)self librarySetupQueue];
  [v5 waitUntilAllOperationsAreFinished];

  kdebug_trace();
  librarySetupQueue = self->_librarySetupQueue;
  self->_librarySetupQueue = 0;

  kdebug_trace();
  id v7 = [(BKAppDelegate *)self ubiquityOptInController];
  [v7 finalizeSetup];

  id v8 = +[BKCloudQuotaUIServices sharedInstance];
  [v8 addObserver:self];

  +[BCSyncUserDefaults syncDefaultsWithTCC];
  kdebug_trace();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020F44;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  kdebug_trace();
  uint64_t v9 = +[BSUIStoreServices sharedInstance];
  [v9 setDelegate:self];
  [(BKAppDelegate *)self startDownloadPurchaseMonitor];
  id v10 = [(BKAppDelegate *)self libraryManager];
  dispatch_queue_t v11 = [v10 assetDetailsManager];
  NSString v12 = +[BCAnnotationSyncManager sharedInstance];
  [v12 setDelegate:v11];

  kdebug_trace();
  objc_initWeak(&location, self);
  unsigned int v13 = [(BKAppDelegate *)self appLaunchCoordinator];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CE74;
  v14[3] = &unk_100A444A8;
  objc_copyWeak(&v15, &location);
  [v13 appLaunchCoordinatorOnConditionMask:512 blockID:@"clearWidgetImageCacheIfNeeded" performBlock:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)registerAppIntentsDependencies
{
  id v2 = self;
  BKAppDelegate.registerAppIntentsDependencies()();
}

- (void)startDownloadPurchaseMonitor
{
  id v2 = self;
  BKAppDelegate.startDownloadPurchaseMonitor()();
}

- (void)registerReadingSettings
{
}

- (void)setEngagementManager:(id)a3
{
}

- (void)setServiceCenter:(id)a3
{
}

- (void)setContainerHost:(id)a3
{
}

- (OS_dispatch_queue)workloopUtilityQueue
{
  return self->_workloopUtilityQueue;
}

- (OS_dispatch_queue)workloopBackgroundQueue
{
  return self->_workloopBackgroundQueue;
}

- (BKLibraryDataSourcePlistUntetheredBooks)untetheredPlistDataSource
{
  return self->_untetheredPlistDataSource;
}

- (BKUbiquityOptInController)ubiquityOptInController
{
  return self->_ubiquityOptInController;
}

- (void)setUbiquityStatusMonitorStateHandler:(id)a3
{
}

- (void)setUbiquitousDocumentsController:(id)a3
{
}

- (void)setSyncUserDefaultsStateHandler:(id)a3
{
}

- (void)setStoreController:(id)a3
{
}

- (void)setStartupQueue:(id)a3
{
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (void)setOfflineCacheLoadingController:(id)a3
{
}

- (void)setNetworkMonitor:(id)a3
{
}

- (void)setLibraryManager:(id)a3
{
}

- (void)setLibraryItemStateProvider:(id)a3
{
}

- (void)setLibraryAssetIsNewManager:(id)a3
{
}

- (void)setLaunchOptions:(id)a3
{
}

- (void)setDownloadProgressCenter:(id)a3
{
}

- (void)setBookletMigrationManager:(id)a3
{
}

- (void)setBcSyncUserDefaultsStateHandler:(id)a3
{
}

- (void)setAppLifecycleObserver:(id)a3
{
}

- (void)setAnalyticsApplicationState:(unint64_t)a3
{
  self->_analyticsApplicationState = a3;
}

- (void)setAirTrafficController:(id)a3
{
}

- (void)q_setupLibrary
{
  id v3 = [(BKAppDelegate *)self librarySetupQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043EEC;
  v4[3] = &unk_100A43D60;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)q_deleteLocaliCloudDataIfUserLoggedOutFromiCloud
{
  id v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "q_deleteLocaliCloudDataIfUserLoggedOutFromiCloudWithCompletion:", buf, 2u);
  }

  id v4 = [(BKAppDelegate *)self iCloudIdentityTokenTracker];
  [v4 fetchCurrentToken];
  if ([v4 didUnacknowledgediCloudLogoutOccur])
  {
    id v5 = BDSCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User logged out from iCloud.  Deleting local copies of cloud data.", buf, 2u);
    }

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001FB880;
    v9[3] = &unk_100A43E90;
    id v10 = v4;
    dispatch_semaphore_t v11 = v6;
    id v7 = v6;
    [(BKAppDelegate *)self deleteCloudDataWithCompletion:v9];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v7, v8);
  }
  else
  {
    [v4 acknowledgeiCloudIdentity];
  }
}

- (BKOfflineCacheLoadingController)offlineCacheLoadingController
{
  return self->_offlineCacheLoadingController;
}

- (void)mergeSyncSidecar
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B8D4;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  if (qword_100B4A670 != -1) {
    dispatch_once(&qword_100B4A670, block);
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  UIBackgroundTaskIdentifier v16 = UIBackgroundTaskInvalid;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008470;
  v12[3] = &unk_100A44688;
  v12[4] = &v13;
  id v3 = objc_retainBlock(v12);
  id v4 = +[UIApplication sharedApplication];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FB068;
  v10[3] = &unk_100A442B8;
  id v5 = v3;
  id v11 = v5;
  id v6 = [v4 beginBackgroundTaskWithName:@"BKAppDelegate merge" expirationHandler:v10];
  v14[3] = (uint64_t)v6;

  id v7 = [BKDatabaseBackupFileManager alloc];
  dispatch_time_t v8 = [(BKAppDelegate *)self sharedAnnotationProvider];
  uint64_t v9 = [(BKDatabaseBackupFileManager *)v7 initWithLibraryManager:0 annotationProvider:v8];

  [(BKDatabaseBackupFileManager *)v9 mergeSyncSidecarWithCompletionBlock:v5];
  _Block_object_dispose(&v13, 8);
}

- (BKMenuController)menuController
{
  return self->_menuController;
}

- (BKLaunchOperationQueue)librarySetupQueue
{
  return self->_librarySetupQueue;
}

- (BKLibraryAssetIsNewManager)libraryAssetIsNewManager
{
  return self->_libraryAssetIsNewManager;
}

- (BSUIDownloadProgressCenter)downloadProgressCenter
{
  return self->_downloadProgressCenter;
}

- (BUCoalescingCallBlock)coalescingJaliscoBlock
{
  return self->_coalescingJaliscoBlock;
}

- (BUCoalescingCallBlock)coalescedUpdateEnableSync
{
  return self->_coalescedUpdateEnableSync;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = [BKContainerHost alloc];
  uint64_t v9 = [(BKAppDelegate *)self appLaunchCoordinator];
  id v10 = [(BKContainerHost *)v8 initWithLaunchCoordinator:v9];
  [(BKAppDelegate *)self setContainerHost:v10];

  id v11 = [BKAppLifecycleObserver alloc];
  NSString v12 = [(BKAppDelegate *)self appLaunchCoordinator];
  uint64_t v13 = [(BKAppLifecycleObserver *)v11 initWithCoordinator:v12];

  [(BKAppDelegate *)self setAppLifecycleObserver:v13];
  objc_initWeak(location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100007C78;
  v43[3] = &unk_100A47A50;
  id v24 = &v45;
  objc_copyWeak(&v45, location);
  id v14 = v6;
  id v44 = v14;
  [(BKAppLifecycleObserver *)v13 setOnWillEnterForeground:v43];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001F64C8;
  v40[3] = &unk_100A47A50;
  objc_copyWeak(&v42, location);
  id v15 = v14;
  id v41 = v15;
  [(BKAppLifecycleObserver *)v13 setOnDidEnterBackground:v40];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001F6518;
  v37[3] = &unk_100A47A50;
  objc_copyWeak(&v39, location);
  id v16 = v15;
  id v38 = v16;
  [(BKAppLifecycleObserver *)v13 setOnWillResignActive:v37];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000DB40;
  v34[3] = &unk_100A47A50;
  objc_copyWeak(&v36, location);
  id v17 = v16;
  id v35 = v17;
  [(BKAppLifecycleObserver *)v13 setOnDidBecomeActive:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001F6568;
  v31[3] = &unk_100A47A50;
  objc_copyWeak(&v33, location);
  id v18 = v17;
  id v32 = v18;
  [(BKAppLifecycleObserver *)v13 setOnWillResignFrontmost:v31];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100078648;
  v28[3] = &unk_100A47A50;
  objc_copyWeak(&v30, location);
  id v19 = v18;
  id v29 = v19;
  [(BKAppLifecycleObserver *)v13 setOnDidBecomeFrontmost:v28];
  if ([v19 launchedToTest]
    && objc_msgSend(v19, "shouldRecordExtendedLaunchTime", &v45))
  {
    [v19 observeExtendedLaunchTestCompletion];
  }
  Swift::String v20 = [(BKAppDelegate *)self preLaunchQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100078600;
  v26[3] = &unk_100A43D60;
  id v21 = v19;
  id v27 = v21;
  [v20 addOperationWithBlock:v26];

  unsigned int v22 = [(BKAppDelegate *)self bkStartupTaskManager];
  [v22 startAllTasksInPhase:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v42);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);

  return 1;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppDelegate *)self sceneManager];
  [v8 application:v7 didDiscardSceneSessions:v6];
}

- (unint64_t)analyticsApplicationState
{
  return self->_analyticsApplicationState;
}

- (void)_startLibraryReloadForLaunchWhenNeeded
{
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10000B51C;
  v19[4] = sub_1001F896C;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001F8974;
  v18[3] = &unk_100A43D60;
  v18[4] = self;
  Swift::String v20 = objc_retainBlock(v18);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v3 = [(BKAppDelegate *)self appLaunchCoordinator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000160E4;
  v13[3] = &unk_100A4BA08;
  v13[4] = &v14;
  v13[5] = v19;
  [v3 appLaunchCoordinatorOnConditionMask:512 blockID:@"_startLibraryReloadForLaunchWhenNeeded extended reloadLibrary" performBlock:v13];

  id v4 = [(BKAppDelegate *)self appLaunchCoordinator];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001F89F4;
  v12[3] = &unk_100A4BA08;
  v12[4] = &v14;
  void v12[5] = v19;
  [v4 appLaunchCoordinatorOnConditionMask:256 blockID:@"_startLibraryReloadForLaunchWhenNeeded carPlay reloadLibrary" performBlock:v12];

  id v5 = sub_100045ED0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v6 applicationState];
    *(_DWORD *)buf = 134217984;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Library Reload: Initial applicationState: %ld", buf, 0xCu);
  }
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F8AC0;
  block[3] = &unk_100A45F58;
  void block[4] = &v14;
  void block[5] = v19;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  if (!*((unsigned char *)v15 + 24))
  {
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001F8C38;
    v10[3] = &unk_100A45570;
    void v10[4] = self;
    v10[5] = &v14;
    v10[6] = v19;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v19, 8);
}

- (void)_signalExtendedLaunchComplete
{
  if (![(BKAppLaunchCoordinator *)self->_appLaunchCoordinator appLaunchCoordinatorIsConditionSatisfied:9])
  {
    appLaunchCoordinator = self->_appLaunchCoordinator;
    [(BKAppLaunchCoordinator *)appLaunchCoordinator signalConditionSatisfied:9];
  }
}

- (void)_signalEnableSyncCheck
{
  id v2 = [(BKAppDelegate *)self coalescedUpdateEnableSync];
  [v2 signalWithCompletion:&stru_100A4B588];
}

- (void)_showMainViewControllerOrWelcomeScreen
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014FE4;
  v5[3] = &unk_100A43F68;
  objc_copyWeak(&v6, &location);
  id v2 = objc_retainBlock(v5);
  if (v2)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v2[2])(v2);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001F9004;
      block[3] = &unk_100A442B8;
      id v4 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupUserEngagement
{
  id v7 = [(BKAppDelegate *)self _engagementManagerDirectory];
  id v3 = [objc_alloc((Class)BMManagerConfiguration) initWithDirectory:v7 shouldRunUpdatesOnSchedule:0 shouldPurgeOutdatedData:1];
  id v4 = [BKEngagementManager alloc];
  id v5 = +[BCRCDataContainer defaultContainer];
  id v6 = [(BKEngagementManager *)v4 initWithConfiguration:v3 configurationContainer:v5];
  [(BKAppDelegate *)self setEngagementManager:v6];
}

- (void)_resumeFromBackground
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10006EEEC;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  [(BKAppDelegate *)self _dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:v2];
}

- (void)_prewarmAEPluginRegistry
{
  objc_initWeak(&location, self->_appLaunchCoordinator);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F65B8;
  v8[3] = &unk_100A44950;
  objc_copyWeak(&v9, &location);
  id v2 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:5.0];
  id v3 = +[AEPluginRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001F6618;
  v5[3] = &unk_100A47A50;
  objc_copyWeak(&v7, &location);
  id v4 = v2;
  id v6 = v4;
  [v3 prewarmSharedResourcesWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_engagementManagerDirectory
{
  id v2 = +[BUAppGroup books];
  id v3 = [v2 containerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"EngagementCollector" isDirectory:1];

  return v4;
}

- (void)_createCoverCache
{
}

- (void)_createCoverCacheForcingEmptyPPTCache:(BOOL)a3
{
  if (a3)
  {
    id v16 = (id)objc_opt_new();
  }
  else
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQHigh", v4, 0);
    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQLow", v6, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.coverTaskQ_high", v4, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.coverTaskQ_low", v6, 0);
    id v11 = objc_opt_new();
    NSString v12 = +[BKSeriesCoverManager sharedInstance];
    uint64_t v13 = +[BCCacheManager defaultClassDefinitionsWithProtocolHandler:v11 stackDecomposer:v12];

    id v14 = objc_alloc((Class)BCCacheManager);
    id v15 = [(BKAppDelegate *)self libraryManager];
    id v16 = [v14 initWithClassDefinitions:v13 highPriorityGeneralQueue:v7 lowPriorityGeneralQueue:v8 highPriorityTargetQueue:v9 backgroundTargetQueue:v10 delegate:v15];
  }
  +[BCCacheManager setDefaultCacheManager:v16];
}

- (void)_createBackgroundTaskAssertionForLaunch
{
  id v3 = +[BCBackgroundTaskAssertion sharedAssertion];
  [v3 claimAssertionForIdentifier:@"kAppLaunchBackgroundTaskIdentifier" description:@"Launch in progress"];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_10000B51C;
  void v8[4] = sub_1001F896C;
  dispatch_queue_t v9 = &stru_100A4BA28;
  id v4 = [(BKAppDelegate *)self appLaunchCoordinator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009E0C;
  v7[3] = &unk_100A4BA50;
  v7[4] = v8;
  [v4 appLaunchCoordinatorOnConditionMask:32 blockID:@"releaseLaunchAssertion launched" performBlock:v7];

  id v5 = [(BKAppDelegate *)self appLaunchCoordinator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001F8CE4;
  v6[3] = &unk_100A4BA50;
  void v6[4] = v8;
  [v5 appLaunchCoordinatorOnConditionMask:0x2000 blockID:@"releaseLaunchAssertion libraryDidFinish" performBlock:v6];

  _Block_object_dispose(v8, 8);
}

- (void)_applicationDidBecomeFrontmost:(id)a3
{
  id v4 = _os_activity_create((void *)&_mh_execute_header, "BKAppLaunchJaliscoUpdate", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000789F4;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  os_activity_apply(v4, block);
  id v5 = [(BKAppDelegate *)self menuController];
  [v5 updateKeyWindow];
}

- (void)orderFrontStandardAboutPanel:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001F54A4;
  v11[3] = &unk_100A4B568;
  v11[4] = self;
  id v3 = objc_retainBlock(v11);
  id v4 = objc_alloc_init((Class)NSMutableAttributedString);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Acknowledgments" value:&stru_100A70340 table:0];

  dispatch_queue_t v7 = ((void (*)(void *, void *, const __CFString *))v3[2])(v3, v6, @"Acknowledgments.pdf");
  [v4 appendAttributedString:v7];

  id v8 = +[BCAppKitBundleLoader appKitBundleClass];
  dispatch_queue_t v9 = [v8 aboutPanelOptionCreditsKey];
  NSString v12 = v9;
  id v13 = v4;
  dispatch_queue_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  [v8 orderFrontStandardAboutPanelWithOptions:v10];
}

- (void)_cleanup
{
  [(BKAppDelegate *)self _endObservingNotifications];
  id v3 = +[UIApplication sharedApplication];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v3];

  networkReachability = self->_networkReachability;
  if (networkReachability) {
    [(BKReachability *)networkReachability stopNotifier];
  }
  sharedAnnotationProvider = self->_sharedAnnotationProvider;
  self->_sharedAnnotationProvider = 0;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  return [(BKAppDelegate *)self applicationOpenURL:a4 options:a5 sceneController:0];
}

- (BOOL)applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  id v11 = BCSceneLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSString v12 = [v10 scene];
    id v13 = [v12 session];
    id v14 = [v13 persistentIdentifier];
    *(_DWORD *)buf = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "applicationOpenURL: url=%@, options=%@, withSceneID=%@", buf, 0x20u);
  }
  [(BKAppDelegate *)self setSuppressOpenLastBook:1];
  objc_initWeak((id *)buf, self);
  id v15 = [(BKAppDelegate *)self appLaunchCoordinator];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001F5950;
  v20[3] = &unk_100A445E8;
  objc_copyWeak(&v24, (id *)buf);
  id v16 = v8;
  id v21 = v16;
  id v17 = v9;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  [v15 appLaunchCoordinatorPerformWhenLaunched:@"app openURL" block:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)_applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [(BKAppDelegate *)self sceneManager];
    id v12 = [v13 currentSceneController];
  }
  id v52 = [v12 newShowURLTransaction];
  objc_opt_class();
  id v14 = [v9 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
  id v15 = BUDynamicCast();

  v50 = [v9 objectForKeyedSubscript:UIApplicationOpenURLOptionsAnnotationKey];
  v53 = self;
  id val = [(BKAppDelegate *)self _primarySceneControllerAnalyticsManager];
  [val analyticsSetReferralURL:v8 app:v15];
  id v51 = v15;
  if ([v15 isEqualToString:@"com.apple.iBooks.BooksWidget"])
  {
    id v47 = v8;
    id v16 = [v8 query];
    id v17 = +[NSURL bu_dictionaryForQueryString:v16 unescapedValues:0];

    objc_opt_class();
    id v18 = [v17 objectForKeyedSubscript:@"widgetFamily"];
    uint64_t v19 = BUDynamicCast();
    Swift::String v20 = (void *)v19;
    if (v19) {
      id v21 = (__CFString *)v19;
    }
    else {
      id v21 = &stru_100A70340;
    }
    v48 = v21;

    objc_opt_class();
    id v22 = [v17 objectForKeyedSubscript:@"widgetKind"];
    uint64_t v23 = BUDynamicCast();
    id v24 = (void *)v23;
    if (v23) {
      NSString v25 = (__CFString *)v23;
    }
    else {
      NSString v25 = &stru_100A70340;
    }
    id v26 = v25;

    objc_opt_class();
    __int16 v27 = [v17 objectForKeyedSubscript:@"hasAssets"];
    id v28 = BUDynamicCast();
    id v29 = [v28 BOOLValue];

    objc_opt_class();
    id v30 = [v17 objectForKeyedSubscript:@"isStreakExposed"];
    id v31 = BUDynamicCast();
    id v32 = [v31 BOOLValue];

    id v33 = [objc_alloc((Class)BAWidgetData) initWithWidgetFamily:v48 displayMode:v26 isContentExposed:v29 isStreakExposed:v32];
    objc_initWeak(&location, val);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1001F5EE8;
    v55[3] = &unk_100A47A50;
    objc_copyWeak(&v57, &location);
    id v34 = v33;
    id v56 = v34;
    [val setEvaluateAfterSessionStart:v55];

    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);

    id v8 = v47;
  }
  id v35 = [v9 objectForKeyedSubscript:@"BKApplicationOpenURLOptionsOpenAfterImportKey"];
  id v36 = v35;
  if (v35) {
    uint64_t v37 = (uint64_t)[v35 BOOLValue];
  }
  else {
    uint64_t v37 = 1;
  }
  id v49 = v11;
  id v38 = [v9 objectForKeyedSubscript:@"BKApplicationImportInPlaceKey"];
  id v39 = v38;
  if (v38) {
    unsigned __int8 v40 = [v38 BOOLValue];
  }
  else {
    unsigned __int8 v40 = 0;
  }
  id v41 = v8;
  id v42 = [v9 objectForKeyedSubscript:@"BKApplicationShowLibraryAllCollectionKey"];
  id v43 = v42;
  if (v42) {
    unsigned __int8 v44 = [v42 BOOLValue];
  }
  else {
    unsigned __int8 v44 = 0;
  }
  id v45 = [(BKAppDelegate *)v53 sceneManager];
  BYTE2(v46) = 1;
  BYTE1(v46) = v44;
  LOBYTE(v46) = v40;
  [v45 handleApplicationURL:v41 sourceApplication:v51 annotation:v50 likelyUserInitiated:0 canImport:1 openAfterImport:v37 importInPlace:v46 showLibraryAllCollection:v52 switchToLibrary:0 transaction:0 completion:];
}

- (void)_updateEnableSync
{
  +[BCSyncUserDefaults syncDefaultsWithTCC];
  id v3 = [(BKAppDelegate *)self liverpoolStatusMonitor];
  id v4 = [v3 isCloudKitEnabled];

  if (v4)
  {
    id v5 = +[BCSyncUserDefaults isCollectionSyncOptedIn];
    id v6 = +[BCSyncUserDefaults isReadingNowSyncOptedIn];
  }
  else
  {
    id v5 = 0;
    id v6 = 0;
  }
  dispatch_queue_t v7 = +[BCCloudKitController sharedInstance];
  [v7 setEnableCloudSync:v5 serviceMode:0];

  id v8 = +[BCCloudAssetManager sharedManager];
  [v8 setEnableCloudSync:v5 enableReadingNowSync:v6];

  id v9 = +[BCReadingStatisticsSyncManager sharedInstance];
  [v9 setEnableCloudSync:v5];

  id v10 = +[BCCloudCollectionsManager sharedManager];
  [v10 setEnableCloudSync:v5];

  id v11 = +[BDSCloudGlobalMetadataManager sharedManager];
  [v11 setEnableCloudSync:v5];

  id v12 = +[BDSSecureManager sharedManager];
  [v12 setEnableCloudSync:v5];

  id v13 = [(BKAppDelegate *)self libraryManager];
  id v14 = [v13 assetDetailsManager];
  [v14 setEnableReadingNowSync:v6];

  id v16 = [(BKAppDelegate *)self serviceCenter];
  id v15 = [v16 readingActivityService];
  [v15 setEnableCloudSync:v4];
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  id v5 = +[BKUserActivityManager sharedInstance];
  unsigned __int8 v6 = [v5 willContinueActivityWithType:v4 sceneController:0];

  return v6;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5 = a4;
  unsigned __int8 v6 = +[BKUserActivityManager sharedInstance];
  unsigned __int8 v7 = [v6 continueActivity:v5 sceneController:0];

  return v7;
}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BooksSiriLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling Siri Intent: %@", (uint8_t *)&buf, 0xCu);
  }

  if (qword_100B4A660 != -1) {
    dispatch_once(&qword_100B4A660, &stru_100A4B880);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000715C;
  id v31 = sub_10000727C;
  id v32 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001F6B1C;
  v25[3] = &unk_100A4B8F8;
  p_long long buf = &buf;
  v25[4] = self;
  id v12 = v10;
  id v26 = v12;
  id v13 = objc_retainBlock(v25);
  objc_opt_class();
  id v14 = BUDynamicCast();
  id v15 = [v14 mediaItems];
  id v16 = [v15 lastObject];

  id v17 = [(BKAppDelegate *)self appLaunchCoordinator];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001F70E8;
  v20[3] = &unk_100A4B948;
  id v18 = v16;
  id v21 = v18;
  id v24 = &buf;
  uint64_t v19 = v13;
  id v22 = self;
  id v23 = v19;
  [v17 appLaunchCoordinatorPerformWhenLaunched:@"tryToShowAudiobook" block:v20];

  _Block_object_dispose(&buf, 8);
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
}

- (void)performActionForShortcutItem:(id)a3 sceneController:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BCSceneLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v9 scene];
    id v13 = [v12 session];
    id v14 = [v13 persistentIdentifier];
    *(_DWORD *)long long buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    NSString v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Performing shortcut: shortcutItem=%@, withSceneID=%@", buf, 0x16u);
  }
  kdebug_trace();
  id v15 = [(BKAppDelegate *)self primaryAnalyticsController];
  [v15 setLaunchedFromShortcutItem];

  id v16 = [(BKAppDelegate *)self appLaunchCoordinator];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001F76D0;
  v19[3] = &unk_100A45BB0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v10;
  id v17 = v10;
  id v18 = v8;
  [v16 appLaunchCoordinatorOnConditionMask:6 blockID:@"performActionForShortcutItem" performBlock:v19];
}

- (void)_reloadLibraryForLaunch
{
  id v3 = [(BKAppDelegate *)self libraryManager];
  [v3 initializeMostRecentPurchaseDateCacheIfNeeded];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001F7F88;
  v5[3] = &unk_100A43DD8;
  void v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 reloadWithCompletion:v5];
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [(BKAppDelegate *)self appAccountActionHandler];
  unsigned int v8 = [v7 canPerformAction:a3 withSender:v6];

  if (v8)
  {
    uint64_t v9 = [(BKAppDelegate *)self appAccountActionHandler];
  }
  else
  {
    id v10 = [(BKAppDelegate *)self appGlobalActionHandler];
    unsigned int v11 = [v10 canPerformAction:a3 withSender:v6];

    if (v11)
    {
      uint64_t v9 = [(BKAppDelegate *)self appGlobalActionHandler];
    }
    else
    {
      id v12 = [(BKAppDelegate *)self appInternalActionHandler];
      unsigned int v13 = [v12 canPerformAction:a3 withSender:v6];

      if (v13)
      {
        uint64_t v9 = [(BKAppDelegate *)self appInternalActionHandler];
      }
      else
      {
        id v14 = [(BKAppDelegate *)self audiobookController];
        unsigned int v15 = [v14 canPerformAction:a3 withSender:v6];

        if (v15)
        {
          uint64_t v9 = [(BKAppDelegate *)self audiobookController];
        }
        else
        {
          v18.receiver = self;
          v18.super_class = (Class)BKAppDelegate;
          uint64_t v9 = [(BKAppDelegate *)&v18 targetForAction:a3 withSender:v6];
        }
      }
    }
  }
  id v16 = (void *)v9;

  return v16;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v8 = a3;
  id v4 = [v8 system];
  id v5 = +[UIMenuSystem mainSystem];

  if (v4 == v5)
  {
    id v6 = [(BKAppDelegate *)self menuController];
    [v6 buildWithBuilder:v8];

    if (+[JSADevice isInternalBuild])
    {
      unsigned __int8 v7 = [(BKAppDelegate *)self menuController];
      [v7 buildInternalWithBuilder:v8];
    }
  }
}

- (void)_showWelcomeScreenIfNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001F91B0;
  v13[3] = &unk_100A47E40;
  objc_copyWeak(&v16, &location);
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  id v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001F9350;
      block[3] = &unk_100A442B8;
      id v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_reloadUbiquityDataSources
{
  id v3 = +[BKLibraryManager defaultManager];
  id v4 = [(BKAppDelegate *)self ubiquityiOSDataSource];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001F9414;
  v5[3] = &unk_100A43D60;
  void v5[4] = self;
  [v3 reloadDataSource:v4 completion:v5];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  +[IMSleepManager didEnterBackground];
  id v4 = +[BKUserActivityManager sharedInstance];
  [v4 didEnterBackground];

  +[JSAApplication didEnterBackground];
  id v5 = +[BKLastOpenBookManager sharedInstance];
  [v5 saveCurrentBookState];

  [(BKAppDelegate *)self setAnalyticsApplicationState:0];
  id v6 = [(BKAppDelegate *)self sceneManager];
  [v6 analyticsVisibilityDidDisappear];

  id v7 = [(BKAppDelegate *)self finishedAssetManager];
  [(BKAppDelegate *)self finishedAssetRemovalThreshold];
  [v7 removeFinishedDownloadsWithThreshhold:];

  id v8 = +[BCBackgroundTaskAssertion sharedAssertion];
  [v8 claimAssertionForIdentifier:@"kBackgroundAppIdentifier" description:@"Backgrounding in progress"];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001F95C0;
  v9[3] = &unk_100A43DD8;
  void v9[4] = self;
  id v10 = @"kBackgroundAppIdentifier";
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  +[BKApplicationShortcutController performUpdate];
}

- (void)_applicationWillResignActive:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:@"BKGenerateOfflineCache"];

  [(BKAppDelegate *)self setAnalyticsApplicationState:1];
  id v5 = [(BKAppDelegate *)self sceneManager];
  [v5 analyticsVisibilityWillDisappear];

  +[JSAApplication willResignActive];

  [(BKAppDelegate *)self flushJetMetricsWithCompletionHandler:&stru_100A4BAD0];
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate now];
  [(BKAppDelegate *)self setAnalyticsTimeoutStart:v5];

  id v6 = [(BKAppDelegate *)self appLaunchCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F9900;
  v8[3] = &unk_100A447C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 appLaunchCoordinatorOnConditionMask:1 blockID:@"applicationWillTerminate" performBlock:v8];
}

- (void)_applicationWillTerminate:(id)a3
{
  [(BKAppDelegate *)self _analyticsForceEndSessionOnViewControllers];
  +[JSAApplication willTerminate];
  [(BKAppDelegate *)self flushJetMetricsWithCompletionHandler:&stru_100A4BAF0];
  [(BKAppDelegate *)self saveStateClosing:1];
  [(BKAppDelegate *)self _cleanup];
  id v4 = +[NSDate now];
  id v5 = [(BKAppDelegate *)self analyticsTimeoutStart];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (4.0 - v7 >= 0.0) {
    double v8 = 4.0 - v7;
  }
  else {
    double v8 = 0.0;
  }
  id v9 = [(BKAppDelegate *)self sceneManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001F9B30;
  v11[3] = &unk_100A4BB10;
  *(double *)&v11[4] = v8;
  [v9 enumerateSceneController:v11 includeHidden:1];

  id v10 = +[BAAppManager sharedManager];
  [v10 appSessionDidTerminate];
}

- (void)clearReadingGoals:(id)a3
{
  id v4 = [(BKAppDelegate *)self serviceCenter];
  id v3 = [v4 readingActivityService];
  [v3 clearData];
}

- (void)resetOnlineContentAccess:(id)a3
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:BEDocumentExternalLoadApprovalCacheDefaultsClearKey];
}

- (void)resetAnalyticsIdentifier:(id)a3
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:kBAResetAnalyticsUserID];
}

- (BOOL)isSyncingEnabledForIsNewManager:(id)a3
{
  return +[BCSyncUserDefaults isAnnotationSyncOptedIn];
}

- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
}

- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = [(BKAppDelegate *)self serviceCenter];
  id v10 = [v11 readingActivityService];
  [v10 willMarkAsset:v9 finished:v5 finishedDate:v8];
}

- (BOOL)isShowPurchasesEnabled
{
  return +[BKLibraryDataSourceJalisco isShowPurchasesEnabled];
}

- (BOOL)isStoreAllowed
{
  id v2 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v3 = [v2 isBookStoreAllowed];

  return v3;
}

- (void)initialDataSourceFetchInitiated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F9F04;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didMigrateBooksCollection:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F9FB4;
  v4[3] = &unk_100A43DD8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)libraryDidReload:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FA1C8;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_iCloudStatusChanged
{
  uint64_t state64 = 0;
  notify_get_state(self->_iCloudRestoreToken, &state64);
  BOOL v3 = state64 - 1 < 2;
  if (self->_restoringFromICloud != v3) {
    self->_restoringFromICloud = v3;
  }
}

- (void)_beginObservingICloudRestoreStatus
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001FA338;
  handler[3] = &unk_100A4BB38;
  handler[4] = self;
  notify_register_dispatch((const char *)[kMBManagerRestoreStateChangedNotification UTF8String], &self->_iCloudRestoreToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  [(BKAppDelegate *)self _iCloudStatusChanged];
}

- (void)_endObservingICloudRestoreStatus
{
  self->_iCloudRestoreToken = -1;
}

- (BKReachability)networkReachability
{
  networkReachability = self->_networkReachability;
  if (!networkReachability)
  {
    id v4 = +[BKReachability reachabilityForInternetConnection];
    id v5 = self->_networkReachability;
    self->_networkReachability = v4;

    networkReachability = self->_networkReachability;
  }

  return networkReachability;
}

- (BOOL)isConnectedToInternet
{
  id v2 = [(BKAppDelegate *)self networkReachability];
  if ([v2 currentReachabilityStatus]) {
    unsigned int v3 = [v2 connectionRequired] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)_startObservingNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    id v4 = DarwinNotifyCenter;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1001FA6DC, @"com.apple.sync.books.began", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)sub_1001FA750, @"com.apple.sync.books.finished", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)sub_1001FA7C4, @"MCManagedBooksChanged", 0, CFNotificationSuspensionBehaviorDrop);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"storeChangedNotification:" name:kAEStoreEnabledChangedNotification object:0];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"userDefaultsChanged:" name:NSUserDefaultsDidChangeNotification object:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FA838;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(BKAppDelegate *)self _beginObservingICloudRestoreStatus];
  int out_token = -1;
  double v7 = (const char *)[@"com.apple.tcc.access.changed" UTF8String];
  workloopUserInitiatedQueue = self->_workloopUserInitiatedQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001FA8BC;
  handler[3] = &unk_100A4BB38;
  handler[4] = self;
  if (notify_register_dispatch(v7, &out_token, workloopUserInitiatedQueue, handler)) {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v9 = out_token;
  }
  [(BKAppDelegate *)self setTccNotifyToken:v9];
  if (+[NSThread isMainThread])
  {
    id v10 = +[BKAudiobookPlayerMuxingObserver sharedInstance];
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001FA958;
    v12[3] = &unk_100A442B8;
    unsigned int v13 = &stru_100A4BB58;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  id v11 = [(BKAppDelegate *)self networkMonitor];
  [v11 start];
}

- (void)_endObservingNotifications
{
  if ([(BKAppDelegate *)self tccNotifyToken] != -1) {
    notify_cancel([(BKAppDelegate *)self tccNotifyToken]);
  }
  [(BKAppDelegate *)self _endObservingICloudRestoreStatus];
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(BKAppDelegate *)self networkReachability];
  [v4 stopNotifier];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    double v6 = DarwinNotifyCenter;
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.sync.books.began", 0);
    CFNotificationCenterRemoveObserver(v6, self, @"com.apple.sync.books.finished", 0);
    CFNotificationCenterRemoveObserver(v6, self, @"MCManagedBooksChanged", 0);
  }
  double v7 = +[BUAccountsProvider sharedProvider];
  [v7 removeObserver:self accountTypes:1];

  id v8 = [(BKAppDelegate *)self networkMonitor];
  [v8 stop];
}

- (void)storeChangedNotification:(id)a3
{
  id v3 = [(BKAppDelegate *)self storeController];
  [v3 refreshUpdateCountAsync];
}

- (void)showConfigurationErrorAndQuit
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Configuration Error" value:&stru_100A70340 table:0];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"There is a problem with the configuration of your %@.\nPlease restore with iTunes or redownload Apple Books." value:&stru_100A70340 table:0];
  double v6 = +[UIDevice currentDevice];
  double v7 = [v6 localizedModel];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);
  id v15 = +[UIAlertController alertControllerWithTitle:v3 message:v8 preferredStyle:1];

  uint64_t v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"Quit" value:&stru_100A70340 table:0];
  id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&stru_100A4BB98];
  [v15 addAction:v11];

  id v12 = [(BKAppDelegate *)self sceneManager];
  unsigned int v13 = [v12 currentSceneController];
  [v13 presentViewController:v15 animated:1 completion:0];
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4
{
  id v5 = a4;
  double v6 = [(BKAppDelegate *)self appLaunchCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001FAD74;
  v8[3] = &unk_100A44268;
  id v9 = v5;
  id v7 = v5;
  [v6 appLaunchCoordinatorOnConditionMask:1 blockID:@"handleRemoteNotification" performBlock:v8];
}

- (void)userDefaultsChanged:(id)a3
{
  workloopUserInitiatedQueue = self->_workloopUserInitiatedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FAEFC;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async(workloopUserInitiatedQueue, block);
}

- (void)networkReachabilityChanged:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 currentReachabilityStatus]
    && ([v4 connectionRequired] & 1) == 0)
  {
    id v5 = sub_100045ED0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = [(BKAppDelegate *)self liverpoolStatusMonitor];
      unsigned int v7 = [v6 isCloudKitEnabled];
      id v8 = "NO";
      if (v7) {
        id v8 = "YES";
      }
      int v11 = 136315138;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Network now reachable.  Is user opted in: %s", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [(BKAppDelegate *)self ubiquityStatusMonitor];
    unsigned int v10 = [v9 isICloudDriveEnabled];

    if (v10) {
      [(BKAppDelegate *)self _reloadUbiquityDataSources];
    }
  }
}

- (void)importMigratedBooks
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FB100;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  if (qword_100B4A678 != -1) {
    dispatch_once(&qword_100B4A678, block);
  }
}

- (BOOL)annotationProvider:(id)a3 acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  int v11 = +[BKLibraryManager defaultManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001FB300;
  v16[3] = &unk_100A4BBE8;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v20 = &v21;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v11 performBackgroundReadOnlyBlockAndWait:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

- (BOOL)libraryAssetStatusController:(id)a3 isAccountPrimaryAndSignedIn:(id)a4
{
  return 1;
}

- (void)libraryAssetStatusController:(id)a3 makeAccountPrimaryAndSignedIn:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
    id v5 = v6;
  }
}

- (void)cloudStorageUpgradeSheetWasDismissed
{
  id v3 = [(BKAppDelegate *)self ubiquityStatusMonitor];
  unsigned int v4 = [v3 isICloudDriveEnabled];

  if (v4)
  {
    [(BKAppDelegate *)self _reloadUbiquityDataSources];
  }
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BKAppDelegate: ubiquityStatusChangedToAvailableWithNewIdentity:", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001FB67C;
  v6[3] = &unk_100A43D60;
  void v6[4] = self;
  [(BKAppDelegate *)self _dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:v6];
}

- (void)saveStateClosing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKAppDelegate *)self sceneManager];
  [v5 saveStateClosing:v3];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  UIBackgroundTaskIdentifier v25 = UIBackgroundTaskInvalid;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001FBB80;
  v21[3] = &unk_100A44688;
  v21[4] = &v22;
  unsigned int v7 = objc_retainBlock(v21);
  id v8 = +[UIApplication sharedApplication];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001FBBFC;
  v19[3] = &unk_100A442B8;
  id v9 = v7;
  id v20 = v9;
  id v10 = [v8 beginBackgroundTaskWithName:@"BKAppDelegate SaveState" expirationHandler:v19];
  v23[3] = (uint64_t)v10;

  int v11 = [(BKAppDelegate *)self libraryManager];
  if (v11)
  {
    id v12 = [(BKAppDelegate *)self sharedAnnotationProvider];
    id v13 = [(BKAppDelegate *)self workloopUtilityQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FBC0C;
    block[3] = &unk_100A45338;
    id v16 = v11;
    id v17 = v12;
    id v18 = v9;
    id v14 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = sub_100045ED0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1007F029C();
    }
  }

  _Block_object_dispose(&v22, 8);
}

- (void)seriesCoversForSeriesIdsChanged:(id)a3
{
  id v3 = a3;
  id v4 = +[BCCacheManager defaultCacheManager];
  [v4 incrementVersionForIdentifiers:v3];
}

+ (id)currentSceneController
{
  id v2 = +[BKAppDelegate sceneManager];
  id v3 = [v2 currentSceneController];

  return v3;
}

+ (id)anySceneController
{
  id v2 = +[BKAppDelegate sceneManager];
  id v3 = [v2 anySceneController];

  return v3;
}

+ (id)sceneControllerForViewController:(id)a3
{
  id v3 = a3;
  id v4 = +[BKAppDelegate sceneManager];
  id v5 = [v4 sceneControllerForViewController:v3];

  return v5;
}

- (void)clientDetectedStoreChangeAndAccountChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100045ED0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKAppDelegate clientDetectedStoreChangeAndAccountChange:%@", buf, 0xCu);
  }

  id v6 = +[BKLibraryManager defaultManager];
  [v6 performNamed:@"resetJaliscoStatus" workerQueueBlock:&stru_100A4BC28];

  unsigned int v7 = _os_activity_create((void *)&_mh_execute_header, "BKAppAccountSignOut", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001FBF64;
  v9[3] = &unk_100A43DD8;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  os_activity_apply(v7, v9);
}

- (void)clientDetectedStoreChange:(id)a3
{
  id v3 = a3;
  id v4 = sub_100045ED0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKAppDelegate clientDetectedStoreChange:%@", buf, 0xCu);
  }

  id v5 = +[BKLibraryManager defaultManager];
  [v5 performNamed:@"resetJaliscoStatus" workerQueueBlock:&stru_100A4BC68];

  id v6 = _os_activity_create((void *)&_mh_execute_header, "BKAppAccountSignIn", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FC468;
  block[3] = &unk_100A43D60;
  id v9 = v3;
  id v7 = v3;
  os_activity_apply(v6, block);
}

- (void)clientDetectedPredicateChange:(id)a3
{
  id v3 = a3;
  id v4 = +[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy];
  [v4 clientDetectedPredicateChange:v3];
}

- (void)clientDetectedPurchaseServerClientExpired:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FC668;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)clientRequestITunesAuthentication:(id)a3 withCompletion:(id)a4
{
  id v4 = a4;
  id v5 = +[BKAuthenticationAlertRequest sharedRequester];
  [v5 requestAuthenticationPolitely:1 completion:v4];
}

- (void)_logIfError:(id)a3 operation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = sub_100045ED0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007F0304((uint64_t)v6, (uint64_t)v5, v7);
    }
  }
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.iBooks.BKAppDelegate.CloudDataDeletion", v5);

  dispatch_group_t v7 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10000715C;
  void v31[4] = sub_10000727C;
  id v32 = 0;
  id v8 = [(BKAppDelegate *)self _engagementManagerDirectory];
  +[BKEngagementManager destroyPersistentStorageInDirectory:v8];

  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  v33[4] = objc_opt_class();
  void v33[5] = objc_opt_class();
  uint64_t v9 = +[NSArray arrayWithObjects:v33 count:6];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001FCC54;
  v26[3] = &unk_100A4BD00;
  id v10 = v7;
  __int16 v27 = v10;
  id v11 = v6;
  id v28 = v11;
  uint64_t v29 = self;
  id v30 = v31;
  [(id)v9 enumerateObjectsUsingBlock:v26];

  id v12 = +[NSMutableArray array];
  id v13 = [(BKAppDelegate *)self serviceCenter];
  id v14 = [(BKAppDelegate *)self serviceCenter];
  LOBYTE(v9) = v14 == 0;

  if ((v9 & 1) == 0) {
    [v12 addObject:v13];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001FCEA0;
  v21[3] = &unk_100A4BD78;
  id v15 = v10;
  uint64_t v22 = v15;
  id v16 = v11;
  uint64_t v23 = v16;
  uint64_t v24 = self;
  UIBackgroundTaskIdentifier v25 = v31;
  [v12 enumerateObjectsUsingBlock:v21];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FD100;
  block[3] = &unk_100A4BDA0;
  id v19 = v4;
  id v20 = v31;
  id v17 = v4;
  dispatch_group_notify(v15, v16, block);

  _Block_object_dispose(v31, 8);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  uint64_t v19 = [(BKAppDelegate *)self currentLocalAccountIdentifier];
  dispatch_group_t v7 = +[BUAccountsProvider sharedProvider];
  id v8 = [v7 localStoreAccount];
  uint64_t v9 = [v8 identifier];

  unsigned int v10 = v19 | v9;
  if (v19 | v9) {
    unsigned int v10 = [(id)v19 isEqual:v9] ^ 1;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0x64) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  if (a4 == 100 || a4 == 102)
  {
    id v12 = [(BKAppDelegate *)self libraryManager];
    [v12 updateMostRecentPurchaseDateCacheFromLibrary];
    goto LABEL_11;
  }
  if (a4 == 101)
  {
    id v12 = [(BKAppDelegate *)self libraryManager];
    [v12 clearMostRecentPurchaseDateCache];
LABEL_11:
  }
  if (v11)
  {
    id v13 = [(BKAppDelegate *)self sceneManager];
    id v14 = [v13 welcomeScreenManager];

    if (!v14)
    {
      if (a4)
      {
        id v15 = objc_alloc_init(BKWelcomeGDPRItem);
        [(BKAppDelegate *)self _showWelcomeScreenIfNeeded:v15 completion:&stru_100A4BDC0];
      }
      [(BKAppDelegate *)self setCurrentLocalAccountIdentifier:v9];
    }
  }
  id v16 = +[BAEventReporter sharedReporter];
  id v17 = [(BKAppDelegate *)self primaryAnalyticsController];
  id v18 = [v17 applicationTracker];
  [v16 emitAccountDidChangeEventWithTracker:v18 type:a3 reason:a4];
}

- (id)analyticsTrackerForStoreServices:(id)a3
{
  id v3 = [(BKAppDelegate *)self primaryAnalyticsController];
  id v4 = [v3 applicationTracker];

  return v4;
}

- (id)_analyticsSessionHost
{
  objc_opt_class();
  id v3 = [(BKAppDelegate *)self sceneManager];
  id v4 = [v3 primarySceneController];
  id v5 = BUDynamicCast();
  dispatch_queue_t v6 = [v5 analyticsSessionHost];

  return v6;
}

- (id)keyWindowAnalyticsTracker
{
  objc_opt_class();
  id v3 = [(BKAppDelegate *)self sceneManager];
  id v4 = [v3 currentSceneController];
  id v5 = BUDynamicCast();

  dispatch_queue_t v6 = [(BKAppDelegate *)self sceneManager];
  dispatch_group_t v7 = [v6 primarySceneController];

  if (v5 == v7)
  {
    id v8 = [v5 rootBarCoordinator];
    [v8 hostingViewController];
  }
  else
  {
    id v8 = [v5 bk_window];
    [v8 rootViewController];
  uint64_t v9 = };

  unsigned int v10 = [v9 ba_deepestVisibleChildViewControllerIncludePresented:1];
  int v11 = [v10 ba_effectiveAnalyticsTracker];

  return v11;
}

- (void)listeningSessionWillEnd
{
  id v2 = [(BKAppDelegate *)self _analyticsSessionHost];
  [v2 listeningSessionWillEnd];
}

- (void)readSessionDidEnd:(id)a3 readTime:(double)a4
{
  id v6 = a3;
  id v7 = [(BKAppDelegate *)self _analyticsSessionHost];
  [v7 readSessionDidEnd:v6 readTime:a4];
}

- (void)playSessionDidEnd:(id)a3 playTime:(double)a4
{
  id v6 = a3;
  id v7 = [(BKAppDelegate *)self _analyticsSessionHost];
  [v7 playSessionDidEnd:v6 playTime:a4];
}

- (id)contentPrivateIDForContentID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppDelegate *)self _analyticsSessionHost];
  id v6 = [v5 contentPrivateIDForContentID:v4];

  return v6;
}

- (id)contentUserIDForContentID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppDelegate *)self _analyticsSessionHost];
  id v6 = [v5 contentUserIDForContentID:v4];

  return v6;
}

- (void)_analyticsForceEndSessionOnViewControllers
{
  id v2 = [(BKAppDelegate *)self sceneManager];
  [v2 analyticsForceEndSession];
}

- (unint64_t)bl_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 beginBackgroundTaskWithName:v6 expirationHandler:v5];

  return (unint64_t)v8;
}

- (void)bl_endBackgroundTask:(unint64_t)a3
{
  id v4 = +[UIApplication sharedApplication];
  [v4 endBackgroundTask:a3];
}

- (void)setUbiquityOptInController:(id)a3
{
}

- (BKLibraryAssetModificationDateManager)libraryAssetModificationDateManager
{
  return self->_libraryAssetModificationDateManager;
}

- (void)setLibraryAssetModificationDateManager:(id)a3
{
}

- (BKLibraryAssetPostProcessor)libraryAssetPostProcessor
{
  return self->_libraryAssetPostProcessor;
}

- (void)setLibraryAssetPostProcessor:(id)a3
{
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (BUNetworkMonitoring)networkMonitor
{
  return self->_networkMonitor;
}

- (BOOL)suppressOpenLastBook
{
  return self->_suppressOpenLastBook;
}

- (void)setSuppressOpenLastBook:(BOOL)a3
{
  self->_suppressOpenLastBook = a3;
}

- (void)setAppLaunchCoordinator:(id)a3
{
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)setNetworkReachability:(id)a3
{
}

- (BKAppLifecycleObserver)appLifecycleObserver
{
  return self->_appLifecycleObserver;
}

- (BKAirTrafficController)airTrafficController
{
  return self->_airTrafficController;
}

- (BKLibraryOperationObserver)libraryOperationObserver
{
  return self->_libraryOperationObserver;
}

- (void)setLibraryOperationObserver:(id)a3
{
}

- (BKAppImportCoordinator)importCoordinator
{
  return self->_importCoordinator;
}

- (void)setImportCoordinator:(id)a3
{
}

- (BKAppAccountActionHandler)appAccountActionHandler
{
  return self->_appAccountActionHandler;
}

- (BKAppGlobalActionHandler)appGlobalActionHandler
{
  return self->_appGlobalActionHandler;
}

- (BKAppInternalActionHandler)appInternalActionHandler
{
  return self->_appInternalActionHandler;
}

- (BKAudiobookController)audiobookController
{
  return self->_audiobookController;
}

- (void)setUntetheredPlistDataSource:(id)a3
{
}

- (BKLibraryDataSourceUbiquityiOS)ubiquityiOSDataSource
{
  return self->_ubiquityiOSDataSource;
}

- (void)setUbiquityiOSDataSource:(id)a3
{
}

- (BOOL)establishedRecordSalt
{
  return self->_establishedRecordSalt;
}

- (void)setEstablishedRecordSalt:(BOOL)a3
{
  self->_establishedRecordSalt = a3;
}

- (int)tccNotifyToken
{
  return self->_tccNotifyToken;
}

- (void)setTccNotifyToken:(int)a3
{
  self->_tccNotifyToken = a3;
}

- (int)iCloudRestoreToken
{
  return self->_iCloudRestoreToken;
}

- (void)setICloudRestoreToken:(int)a3
{
  self->_iCloudRestoreToken = a3;
}

- (BOOL)isRestoringFromiCloud
{
  return self->_restoringFromICloud;
}

- (void)setRestoringFromICloud:(BOOL)a3
{
  self->_restoringFromICloud = a3;
}

- (void)setCoalescedUpdateEnableSync:(id)a3
{
}

- (void)setICloudIdentityTokenTracker:(id)a3
{
}

- (BKBookletMigrationManager)bookletMigrationManager
{
  return self->_bookletMigrationManager;
}

- (BKFinishedAssetManager)finishedAssetManager
{
  return (BKFinishedAssetManager *)objc_getProperty(self, a2, 280, 1);
}

- (void)setFinishedAssetManager:(id)a3
{
}

- (BUAssertion)analyticsSessionAssertion
{
  return self->_analyticsSessionAssertion;
}

- (void)setAnalyticsSessionAssertion:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (OS_dispatch_queue)workloopUserInteractiveQueue
{
  return self->_workloopUserInteractiveQueue;
}

- (void)setWorkloopUserInteractiveQueue:(id)a3
{
}

- (void)setWorkloopUserInitiatedQueue:(id)a3
{
}

- (void)setWorkloopUtilityQueue:(id)a3
{
}

- (void)setWorkloopBackgroundQueue:(id)a3
{
}

- (void)setPreLaunchQueue:(id)a3
{
}

- (void)setLibrarySetupQueue:(id)a3
{
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (unint64_t)lastRequestedReloadGeneration
{
  return self->_lastRequestedReloadGeneration;
}

- (void)setLastRequestedReloadGeneration:(unint64_t)a3
{
  self->_lastRequestedReloadGeneration = a3;
}

- (BOOL)userHasCancelledAuthorizationPrompt
{
  return self->_userHasCancelledAuthorizationPrompt;
}

- (void)setUserHasCancelledAuthorizationPrompt:(BOOL)a3
{
  self->_userHasCancelledAuthorizationPrompt = a3;
}

- (NSDate)analyticsTimeoutStart
{
  return self->_analyticsTimeoutStart;
}

- (void)setAnalyticsTimeoutStart:(id)a3
{
}

- (NSString)currentLocalAccountIdentifier
{
  return self->_currentLocalAccountIdentifier;
}

- (void)setCurrentLocalAccountIdentifier:(id)a3
{
}

- (BUOSStateHandler)syncUserDefaultsStateHandler
{
  return self->_syncUserDefaultsStateHandler;
}

- (BUOSStateHandler)ubiquityStatusMonitorStateHandler
{
  return self->_ubiquityStatusMonitorStateHandler;
}

- (BUOSStateHandler)bcSyncUserDefaultsStateHandler
{
  return self->_bcSyncUserDefaultsStateHandler;
}

- (void)setCoalescingJaliscoBlock:(id)a3
{
}

- (double)finishedAssetRemovalThreshold
{
  return self->_finishedAssetRemovalThreshold;
}

- (void)setFinishedAssetRemovalThreshold:(double)a3
{
  self->_finishedAssetRemovalThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineCacheLoadingController, 0);
  objc_storeStrong((id *)&self->_coalescingJaliscoBlock, 0);
  objc_storeStrong((id *)&self->_bcSyncUserDefaultsStateHandler, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitorStateHandler, 0);
  objc_storeStrong((id *)&self->_syncUserDefaultsStateHandler, 0);
  objc_storeStrong((id *)&self->_currentLocalAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsTimeoutStart, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_librarySetupQueue, 0);
  objc_storeStrong((id *)&self->_preLaunchQueue, 0);
  objc_storeStrong((id *)&self->_workloopBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_workloopUtilityQueue, 0);
  objc_storeStrong((id *)&self->_workloopUserInitiatedQueue, 0);
  objc_storeStrong((id *)&self->_workloopUserInteractiveQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, 0);
  objc_storeStrong((id *)&self->_finishedAssetManager, 0);
  objc_storeStrong((id *)&self->_bookletMigrationManager, 0);
  objc_storeStrong((id *)&self->_iCloudIdentityTokenTracker, 0);
  objc_storeStrong((id *)&self->_coalescedUpdateEnableSync, 0);
  objc_storeStrong((id *)&self->_downloadProgressCenter, 0);
  objc_storeStrong((id *)&self->_ubiquityiOSDataSource, 0);
  objc_storeStrong((id *)&self->_untetheredPlistDataSource, 0);
  objc_storeStrong((id *)&self->_audiobookController, 0);
  objc_storeStrong((id *)&self->_appInternalActionHandler, 0);
  objc_storeStrong((id *)&self->_appGlobalActionHandler, 0);
  objc_storeStrong((id *)&self->_appAccountActionHandler, 0);
  objc_storeStrong((id *)&self->_importCoordinator, 0);
  objc_storeStrong((id *)&self->_libraryOperationObserver, 0);
  objc_storeStrong((id *)&self->_airTrafficController, 0);
  objc_storeStrong((id *)&self->_appLifecycleObserver, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_storeStrong((id *)&self->_libraryItemStateProvider, 0);
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_appLaunchCoordinator, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquitousDocumentsController, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_libraryAssetPostProcessor, 0);
  objc_storeStrong((id *)&self->_libraryAssetModificationDateManager, 0);
  objc_storeStrong((id *)&self->_libraryAssetIsNewManager, 0);
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_coverImageHelper, 0);
  objc_storeStrong((id *)&self->_assetMetadataCache, 0);

  objc_storeStrong((id *)&self->_ubiquityOptInController, 0);
}

- (void)appGlobalActionHandler:(id)a3 open:(id)a4
{
  uint64_t v6 = sub_1007F29D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2990();
  unsigned int v10 = self;
  id v11 = a3;
  id v12 = self;
  id v13 = [v10 sharedApplication];
  sub_1007F2960(v14);
  id v16 = v15;
  sub_100210224((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_10026319C(&qword_100B251D0, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = sub_1007FDA50().super.isa;
  swift_bridgeObjectRelease();
  [v13 openURL:v16 options:isa completionHandler:0];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)flushJetMetricsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100B2E040;
  void v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  void v12[4] = &unk_100B2C0F0;
  void v12[5] = v11;
  id v13 = self;
  sub_1006EB59C((uint64_t)v7, (uint64_t)&unk_100B33060, (uint64_t)v12);
  swift_release();
}

@end