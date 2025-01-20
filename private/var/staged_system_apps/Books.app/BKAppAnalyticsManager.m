@interface BKAppAnalyticsManager
+ (id)resolver;
- (BAAnalyticsController)analyticsController;
- (BKAppAnalyticsManager)init;
- (BKAppAnalyticsManagerDelegate)delegate;
- (BKPersonalizationEventProcessor)personalizationEventProcessor;
- (BOOL)analyticsSessionDataIsMainWindow;
- (BOOL)analyticsSessionDataIsParallel;
- (BOOL)analyticsSessionDataIsPriceDropNotificationEnabled;
- (BOOL)didStartFirstSession;
- (BOOL)isColdLaunched;
- (BOOL)isSessionActive;
- (BUAssertion)analyticsSessionAssertion;
- (NSArray)additionalEventProcessors;
- (NSMutableSet)analyticsAccumulatedListenIDs;
- (NSMutableSet)analyticsAccumulatedReadIDs;
- (double)analyticsAccumulatedListenTime;
- (double)analyticsAccumulatedReadTime;
- (id)analyticsControllerConfigurationForKey:(id)a3;
- (id)analyticsSessionDataForKey:(id)a3;
- (id)applicationDidBecomeActiveObserver;
- (id)deviceOrentationDidChangeObserver;
- (id)evaluateAfterSessionStart;
- (id)mainLibrary;
- (id)sceneManager;
- (os_unfair_lock_s)analyticsLock;
- (unint64_t)analyticsBackgroundTaskIdentifier;
- (void)_mq_analyticsEndSession;
- (void)analyticsController:(id)a3 resetSessionWithCompletion:(id)a4;
- (void)analyticsControllerDidEndSession:(id)a3;
- (void)analyticsControllerDidStartSession:(id)a3;
- (void)analyticsControllerWillEndSession:(id)a3;
- (void)analyticsControllerWillStartSession:(id)a3;
- (void)analyticsEndSession;
- (void)analyticsSetReferralURL:(id)a3 app:(id)a4;
- (void)analyticsSetupTracking;
- (void)analyticsStartSession;
- (void)appWillTerminate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnalyticsAccumulatedListenTime:(double)a3;
- (void)setAnalyticsAccumulatedReadTime:(double)a3;
- (void)setAnalyticsBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setAnalyticsController:(id)a3;
- (void)setAnalyticsLock:(os_unfair_lock_s)a3;
- (void)setAnalyticsSessionAssertion:(id)a3;
- (void)setApplicationDidBecomeActiveObserver:(id)a3;
- (void)setColdLaunched:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceOrentationDidChangeObserver:(id)a3;
- (void)setDidStartFirstSession:(BOOL)a3;
- (void)setEvaluateAfterSessionStart:(id)a3;
- (void)setIsSessionActive:(BOOL)a3;
- (void)setPersonalizationEventProcessor:(id)a3;
- (void)setupSessionChangeNotifications;
- (void)startInitialAppStateQueryWithSessionStartTime:(id)a3 analyticsController:(id)a4 libraryAssetProvider:(id)a5 analyticsSessionAssertion:(id)a6;
- (void)terminateSession;
- (void)updateTreatmentData;
- (void)windowOcclusionStateDidChange:(id)a3;
@end

@implementation BKAppAnalyticsManager

- (void)startInitialAppStateQueryWithSessionStartTime:(id)a3 analyticsController:(id)a4 libraryAssetProvider:(id)a5 analyticsSessionAssertion:(id)a6
{
  uint64_t v10 = sub_1007F2BA0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2B50();
  id v14 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = self;
  sub_10001F770((uint64_t)v13, v14, (uint64_t)a5, (uint64_t)a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (BOOL)analyticsSessionDataIsParallel
{
  return 0;
}

- (BKAppAnalyticsManager)init
{
  kdebug_trace();
  v15.receiver = self;
  v15.super_class = (Class)BKAppAnalyticsManager;
  v3 = [(BKAppAnalyticsManager *)&v15 init];
  v4 = v3;
  if (v3)
  {
    v3->_analyticsLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = +[NSMutableSet set];
    analyticsAccumulatedReadIDs = v4->_analyticsAccumulatedReadIDs;
    v4->_analyticsAccumulatedReadIDs = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableSet set];
    analyticsAccumulatedListenIDs = v4->_analyticsAccumulatedListenIDs;
    v4->_analyticsAccumulatedListenIDs = (NSMutableSet *)v7;

    v4->_analyticsBackgroundTaskIdentifier = UIBackgroundTaskInvalid;
    v9 = +[NSUserDefaults standardUserDefaults];
    [v9 addObserver:v4 forKeyPath:kBAResetAnalyticsUserID options:1 context:off_100B1E040];

    uint64_t v10 = [(id)objc_opt_class() resolver];
    uint64_t v11 = [v10 resolveClass:objc_opt_class()];

    uint64_t v12 = [[BKPersonalizationEventProcessor alloc] initWithDonor:v11];
    personalizationEventProcessor = v4->_personalizationEventProcessor;
    v4->_personalizationEventProcessor = v12;

    v4->_coldLaunched = 1;
  }
  kdebug_trace();
  return v4;
}

- (id)analyticsSessionDataForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:BASessionDataKeyJSVersion])
  {
    uint64_t v5 = +[JSABridge sharedInstance];
    v6 = [v5 environment];
    uint64_t v7 = [v6 appVersion];

LABEL_13:
    goto LABEL_14;
  }
  if ([v4 isEqualToString:BASessionDataKeyStoreFrontID])
  {
    uint64_t v5 = +[BUAccountsProvider sharedProvider];
    uint64_t v8 = [v5 currentStorefront];
LABEL_12:
    uint64_t v7 = (void *)v8;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:BASessionDataKeyiCloudLoggedIn])
  {
    uint64_t v5 = +[BUAccountsProvider sharedProvider];
    id v9 = [v5 isUserSignedInToiCloud];
LABEL_11:
    uint64_t v8 = +[NSNumber numberWithBool:v9];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:BASessionDataKeyiTunesLoggedIn])
  {
    uint64_t v5 = +[BUAccountsProvider sharedProvider];
    id v9 = [v5 isUserSignedInToiTunes];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:BASessionDataKeyiCloudDriveOptIn])
  {
    uint64_t v5 = +[BUAccountsProvider sharedProvider];
    id v9 = [v5 isGlobalICloudDriveSyncOptedIn];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:BASessionDataKeyLaunchType])
  {
    if ([(BKAppAnalyticsManager *)self isColdLaunched]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    uint64_t v12 = +[NSNumber numberWithInteger:v11];
    goto LABEL_24;
  }
  if ([v4 isEqualToString:BASessionDataKeyHasWidgets])
  {
    uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[BKWidgetService hasWidgetConfigurations]);
LABEL_24:
    uint64_t v7 = (void *)v12;
    goto LABEL_14;
  }
  uint64_t v7 = 0;
LABEL_14:

  return v7;
}

- (BOOL)isColdLaunched
{
  return self->_coldLaunched;
}

- (BOOL)analyticsSessionDataIsMainWindow
{
  v3 = [(BKAppAnalyticsManager *)self delegate];
  id v4 = [v3 analyticsManagerSceneController:self];

  if (v4) {
    BOOL v5 = [v4 sceneType] == (id)1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BKAppAnalyticsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAppAnalyticsManagerDelegate *)WeakRetained;
}

- (void)setupSessionChangeNotifications
{
  v3 = [(BKAppAnalyticsManager *)self analyticsController];
  id v4 = [v3 applicationTracker];

  BOOL v5 = [(BKAppAnalyticsManager *)self analyticsController];
  v6 = [v5 applicationTracker];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FBB0;
  v8[3] = &unk_100A46370;
  id v9 = v4;
  id v7 = v4;
  [v6 onSessionChangeWithBlock:v8];
}

- (void)analyticsControllerDidStartSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = BALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "analyticsControllerDidStartSession: start", (uint8_t *)buf, 2u);
  }

  [(BKAppAnalyticsManager *)self setDidStartFirstSession:1];
  [(BKAppAnalyticsManager *)self setIsSessionActive:1];
  v6 = [(BKAppAnalyticsManager *)self analyticsController];
  id v7 = [v6 applicationTracker];

  [v7 popOrientationData];
  if ([v7 optedIn]) {
    [v7 pushOrientationDataFromFile:@"/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m" line:325];
  }
  [v7 submitAppSessionStartEvent];
  [v7 timeAppSessionEndEvent];
  objc_initWeak(buf, self);
  uint64_t v8 = [(BKAppAnalyticsManager *)self analyticsController];
  id v9 = [v8 sessionStartTime];

  uint64_t v10 = [(BKAppAnalyticsManager *)self delegate];
  uint64_t v11 = [v10 appLaunchCoordinator:self];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100019C7C;
  v22[3] = &unk_100A46398;
  objc_copyWeak(&v24, buf);
  id v12 = v9;
  id v23 = v12;
  [v11 appLaunchCoordinatorOnConditionMask:4097 blockID:@"analyticsControllerDidStartSession" performBlock:v22];
  v13 = +[NSNotificationCenter defaultCenter];
  id v14 = +[NSOperationQueue mainQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000FE6C;
  v20[3] = &unk_100A45610;
  objc_copyWeak(&v21, buf);
  objc_super v15 = [v13 addObserverForName:UIDeviceOrientationDidChangeNotification object:0 queue:v14 usingBlock:v20];
  [(BKAppAnalyticsManager *)self setDeviceOrentationDidChangeObserver:v15];

  uint64_t v16 = [(BKAppAnalyticsManager *)self evaluateAfterSessionStart];
  id evaluateAfterSessionStart = self->_evaluateAfterSessionStart;
  self->_id evaluateAfterSessionStart = 0;

  id v18 = objc_retainBlock(v16);
  v19 = v18;
  if (v18) {
    (*((void (**)(id))v18 + 2))(v18);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(buf);
}

- (id)analyticsControllerConfigurationForKey:(id)a3
{
  v22[0] = kBAJitterTimestampEnabled;
  v22[1] = kBAJitterTimestampLowerBound;
  v23[0] = BRCBooksDefaultsKeyAnalyticsJitterTimestampEnabled2;
  v23[1] = BRCBooksDefaultsKeyAnalyticsJitterTimestampLowerBound;
  v22[2] = kBAJitterTimestampUpperBound;
  v23[2] = BRCBooksDefaultsKeyAnalyticsJitterTimestampUpperBound;
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  BOOL v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    v6 = +[BCRCDataContainer defaultContainer];
    unsigned __int8 v7 = [v6 configurationLoaded];

    if (v7)
    {
      uint64_t v8 = +[BCRCDataContainer defaultContainer];
      id v9 = [v8 configs];
      id v10 = [v9 count];

      if (v10)
      {
        uint64_t v11 = +[BCRCDataContainer defaultContainer];
        id v12 = [v11 configs];
        v13 = [v12 valueForKeyPath:v5];

        if (v13) {
          goto LABEL_13;
        }
        id v14 = BALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1007E9CA0((uint64_t)v5, v14, v15, v16, v17, v18, v19, v20);
        }
      }
      else
      {
        id v14 = BALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1007E9C6C();
        }
      }
    }
    else
    {
      id v14 = BALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007E9D0C();
      }
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)analyticsSetupTracking
{
  id v3 = objc_alloc_init((Class)BAAnalyticsController);
  [(BKAppAnalyticsManager *)self setAnalyticsController:v3];

  id v4 = [(BKAppAnalyticsManager *)self analyticsController];
  [v4 setDelegate:self];

  BOOL v5 = [(BKAppAnalyticsManager *)self analyticsController];
  [v5 setConfigurationProvider:self];

  v6 = [(BKAppAnalyticsManager *)self analyticsController];
  [v6 start];

  [(BKAppAnalyticsManager *)self updateTreatmentData];
  unsigned __int8 v7 = +[BRCConfigurationManager sharedInstance];
  uint64_t v8 = [(BKAppAnalyticsManager *)self analyticsController];
  [v8 setUserConfiguration:v7];

  [(BKAppAnalyticsManager *)self setupSessionChangeNotifications];
  [(BKAppAnalyticsManager *)self setupWindowNotification];
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"onTreatmentDataChange:" name:@"kBABookTreatmentDataDidChange" object:0];

  id v10 = dispatch_get_global_queue(25, 0);
  dispatch_async(v10, &stru_100A46348);

  uint64_t v11 = [(BKAppAnalyticsManager *)self delegate];
  id v12 = [v11 appLaunchCoordinator:self];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078AB4;
  v15[3] = &unk_100A44268;
  v15[4] = self;
  [v12 appLaunchCoordinatorOnConditionMask:1024 blockID:@"analyticsSetupTracking" performBlock:v15];
  v13 = +[TUIDragController sharedInstance];
  id v14 = +[BKDragAndDropMonitor sharedInstance];
  [v13 addObserver:v14];
}

- (BAAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)updateTreatmentData
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(0, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006D874;
  v3[3] = &unk_100A43F68;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setIsSessionActive:(BOOL)a3
{
  self->_isSessionActive = a3;
}

- (void)setDidStartFirstSession:(BOOL)a3
{
  self->_didStartFirstSession = a3;
}

- (void)setDeviceOrentationDidChangeObserver:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setAnalyticsSessionAssertion:(id)a3
{
}

- (void)setAnalyticsController:(id)a3
{
}

- (BKPersonalizationEventProcessor)personalizationEventProcessor
{
  return self->_personalizationEventProcessor;
}

- (id)mainLibrary
{
  id v3 = [(BKAppAnalyticsManager *)self delegate];
  id v4 = [v3 analyticsManagerLibrary:self];

  return v4;
}

- (id)evaluateAfterSessionStart
{
  return self->_evaluateAfterSessionStart;
}

- (BOOL)didStartFirstSession
{
  return self->_didStartFirstSession;
}

- (void)analyticsStartSession
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = kBAResetAnalyticsUserID;
  unsigned int v5 = [v3 BOOLForKey:kBAResetAnalyticsUserID];

  if (v5)
  {
    v6 = [(BKAppAnalyticsManager *)self delegate];
    [v6 analyticsManagerForceEndSession:self];

    unsigned __int8 v7 = [(BKAppAnalyticsManager *)self analyticsController];
    unsigned int v8 = [v7 waitForSessionEnd:0.001];

    if (v8)
    {
      id v9 = [(BKAppAnalyticsManager *)self analyticsController];
      [v9 resetPrivateData:0];

      id v10 = +[NSUserDefaults standardUserDefaults];
      [v10 setBool:0 forKey:v4];
    }
    else
    {
      uint64_t v11 = BALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1007E9BEC(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  uint64_t v19 = [(BKAppAnalyticsManager *)self analyticsController];
  id v20 = [v19 newSessionAssertion];
  [(BKAppAnalyticsManager *)self setAnalyticsSessionAssertion:v20];

  id v21 = +[BCRCDataContainer defaultContainer];
  [v21 deployStagedDataIfNeeded];
}

- (BUAssertion)analyticsSessionAssertion
{
  return self->_analyticsSessionAssertion;
}

- (void)analyticsControllerWillStartSession:(id)a3
{
  uint64_t v4 = BALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "analyticsControllerWillStartSession: start", v8, 2u);
  }

  if (![(BKAppAnalyticsManager *)self didStartFirstSession])
  {
    unsigned int v5 = +[BCRCDataContainer defaultContainer];
    unsigned __int8 v6 = [v5 waitForConfiguration:1.0];

    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = BALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1007E9D40();
      }
    }
  }
}

- (NSArray)additionalEventProcessors
{
  v2 = [(BKAppAnalyticsManager *)self personalizationEventProcessor];
  unsigned int v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

+ (id)resolver
{
  v2 = +[BKAppDelegate delegate];
  id v3 = [v2 containerHost];
  uint64_t v4 = [v3 bridgedResolver];

  return v4;
}

- (void)dealloc
{
  id v3 = +[BAEventReporter sharedReporter];
  uint64_t v4 = +[JSAStore sharedInstance];
  [v4 removeObserver:v3];

  unsigned int v5 = +[JSAAccountController sharedController];
  [v5 removeObserver:v3];

  unsigned __int8 v6 = +[TUIDragController sharedInstance];
  unsigned __int8 v7 = +[BKDragAndDropMonitor sharedInstance];
  [v6 removeObserver:v7];

  unsigned int v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];
  [v8 removeObserver:self->_applicationDidBecomeActiveObserver name:UIApplicationDidBecomeActiveNotification object:0];
  id v9 = +[NSUserDefaults standardUserDefaults];
  [v9 removeObserver:self forKeyPath:kBAResetAnalyticsUserID];

  v10.receiver = self;
  v10.super_class = (Class)BKAppAnalyticsManager;
  [(BKAppAnalyticsManager *)&v10 dealloc];
}

- (id)sceneManager
{
  id v3 = [(BKAppAnalyticsManager *)self delegate];
  uint64_t v4 = [v3 analyticsManagerSceneManager:self];

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B1E040 == a6)
  {
    id v11 = a5;
    objc_opt_class();
    uint64_t v12 = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    BUDynamicCast();
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if ([v14 BOOLValue])
    {
      uint64_t v13 = [(BKAppAnalyticsManager *)self delegate];
      [v13 analyticsManagerForceEndSession:self];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKAppAnalyticsManager;
    id v10 = a5;
    [(BKAppAnalyticsManager *)&v15 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)windowOcclusionStateDidChange:(id)a3
{
  id v3 = [(BKAppAnalyticsManager *)self analyticsController];
  [v3 refreshSessionDataIfActive];
}

- (void)appWillTerminate
{
}

- (void)terminateSession
{
}

- (void)analyticsEndSession
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DC7A4;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)analyticsSetReferralURL:(id)a3 app:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppAnalyticsManager *)self analyticsController];
  [v8 setReferralURL:v7 app:v6];
}

- (void)setEvaluateAfterSessionStart:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKAppAnalyticsManager *)self isSessionActive];
  id v7 = (void (**)(void))objc_retainBlock(v4);

  if (v5)
  {
    id evaluateAfterSessionStart = v7;
    if (v7)
    {
      v7[2](v7);
      id evaluateAfterSessionStart = v7;
    }
  }
  else
  {
    id evaluateAfterSessionStart = self->_evaluateAfterSessionStart;
    self->_id evaluateAfterSessionStart = v7;
  }
}

- (void)analyticsControllerWillEndSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "analyticsControllerWillEndSession: start", buf, 2u);
  }

  os_unfair_lock_lock(&self->_analyticsLock);
  *(void *)buf = 0;
  v33 = buf;
  uint64_t v34 = 0x2020000000;
  unint64_t v35 = 0;
  unint64_t v35 = [(BKAppAnalyticsManager *)self analyticsBackgroundTaskIdentifier];
  if (*((void *)v33 + 3) == UIBackgroundTaskInvalid)
  {
    objc_initWeak(&location, self);
    id v6 = +[UIApplication sharedApplication];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000DCD44;
    v29[3] = &unk_100A463C0;
    objc_copyWeak(&v30, &location);
    v29[4] = buf;
    id v7 = [v6 beginBackgroundTaskWithName:@"BKAppAnalyticsManager" expirationHandler:v29];
    *((void *)v33 + 3) = v7;

    [(BKAppAnalyticsManager *)self setAnalyticsBackgroundTaskIdentifier:*((void *)v33 + 3)];
    id v8 = BALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *((void *)v33 + 3);
      *(_DWORD *)v36 = 134217984;
      uint64_t v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background Task: %ld (BKAppAnalyticsManager) created.", v36, 0xCu);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_analyticsLock);
  id v10 = [(BKAppAnalyticsManager *)self analyticsController];
  id v11 = [v10 applicationTracker];

  id v12 = objc_alloc((Class)BASessionReadingData);
  [(BKAppAnalyticsManager *)self analyticsAccumulatedReadTime];
  double v14 = v13;
  objc_super v15 = [(BKAppAnalyticsManager *)self analyticsAccumulatedReadIDs];
  [v15 count];
  id v16 = [v12 initWithTimeSpentReading:(uint64_t)v14 uniqueBooksRead:BARoundIntegerToSignificantFigures()];

  [(BKAppAnalyticsManager *)self setAnalyticsAccumulatedReadTime:0.0];
  uint64_t v17 = [(BKAppAnalyticsManager *)self analyticsAccumulatedReadIDs];
  [v17 removeAllObjects];

  [v11 popSessionReadingData];
  [v11 pushSessionReadingData:v16 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m" line:402];
  id v18 = objc_alloc((Class)BASessionListeningData);
  [(BKAppAnalyticsManager *)self analyticsAccumulatedListenTime];
  double v20 = v19;
  id v21 = [(BKAppAnalyticsManager *)self analyticsAccumulatedListenIDs];
  [v21 count];
  id v22 = [v18 initWithTimeSpentListening:(uint64_t)v20 uniqueAudiobooksListened:BARoundIntegerToSignificantFigures()];

  [(BKAppAnalyticsManager *)self setAnalyticsAccumulatedListenTime:0.0];
  id v23 = [(BKAppAnalyticsManager *)self analyticsAccumulatedListenIDs];
  [v23 removeAllObjects];

  [v11 popSessionListeningData];
  [v11 pushSessionListeningData:v22 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m" line:408];
  id v24 = +[BKAppDelegate delegate];
  v25 = [v24 engagementManager];
  v26 = [v25 analyticsHelper];
  [v26 collectLocalSignalsAnalyticsWithTracker:v11];

  v27 = +[NSNotificationCenter defaultCenter];
  v28 = [(BKAppAnalyticsManager *)self deviceOrentationDidChangeObserver];
  [v27 removeObserver:v28 name:UIDeviceOrientationDidChangeNotification object:0];

  [(BKAppAnalyticsManager *)self setIsSessionActive:0];
  _Block_object_dispose(buf, 8);
}

- (void)analyticsControllerDidEndSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "analyticsControllerDidEndSession: start", (uint8_t *)&v10, 2u);
  }

  [v4 unsetLaunchedFromShortcutItem];
  if ([(BKAppAnalyticsManager *)self isColdLaunched]) {
    [(BKAppAnalyticsManager *)self setColdLaunched:0];
  }
  os_unfair_lock_lock(&self->_analyticsLock);
  unint64_t v6 = [(BKAppAnalyticsManager *)self analyticsBackgroundTaskIdentifier];
  if (v6 != UIBackgroundTaskInvalid)
  {
    unint64_t v7 = v6;
    id v8 = BALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background Task: %ld (BKAppAnalyticsManager) no longer need, ending it with -endBackgroundTask:.", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = +[UIApplication sharedApplication];
    [v9 endBackgroundTask:v7];

    [(BKAppAnalyticsManager *)self setAnalyticsBackgroundTaskIdentifier:UIBackgroundTaskInvalid];
  }
  os_unfair_lock_unlock(&self->_analyticsLock);
}

- (void)analyticsController:(id)a3 resetSessionWithCompletion:(id)a4
{
  id v5 = a4;
  unint64_t v6 = BALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "resetSessionWithCompletion: start", buf, 2u);
  }

  *(void *)buf = 0;
  double v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DD114;
  block[3] = &unk_100A44058;
  block[4] = self;
  void block[5] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  unint64_t v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DD18C;
  v9[3] = &unk_100A46410;
  id v10 = v5;
  unint64_t v11 = buf;
  v9[4] = self;
  id v8 = v5;
  dispatch_async(v7, v9);

  _Block_object_dispose(buf, 8);
}

- (BOOL)analyticsSessionDataIsPriceDropNotificationEnabled
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[BKPriceTrackingKeys priceTrackingNotificationsEnabled];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DD4CC;
  v6[3] = &unk_100A46438;
  id v8 = &v9;
  id v4 = v2;
  unint64_t v7 = v4;
  +[BCCloudGlobalMetadataManager fetchMetadataBoolForKey:v3 completion:v6];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

- (void)_mq_analyticsEndSession
{
  id v3 = [(BKAppAnalyticsManager *)self analyticsSessionAssertion];
  [v3 invalidate];

  [(BKAppAnalyticsManager *)self setAnalyticsSessionAssertion:0];
}

- (NSMutableSet)analyticsAccumulatedReadIDs
{
  return self->_analyticsAccumulatedReadIDs;
}

- (NSMutableSet)analyticsAccumulatedListenIDs
{
  return self->_analyticsAccumulatedListenIDs;
}

- (double)analyticsAccumulatedReadTime
{
  return self->_analyticsAccumulatedReadTime;
}

- (void)setAnalyticsAccumulatedReadTime:(double)a3
{
  self->_analyticsAccumulatedReadTime = a3;
}

- (double)analyticsAccumulatedListenTime
{
  return self->_analyticsAccumulatedListenTime;
}

- (void)setAnalyticsAccumulatedListenTime:(double)a3
{
  self->_analyticsAccumulatedListenTime = a3;
}

- (unint64_t)analyticsBackgroundTaskIdentifier
{
  return self->_analyticsBackgroundTaskIdentifier;
}

- (void)setAnalyticsBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_analyticsBackgroundTaskIdentifier = a3;
}

- (os_unfair_lock_s)analyticsLock
{
  return self->_analyticsLock;
}

- (void)setAnalyticsLock:(os_unfair_lock_s)a3
{
  self->_analyticsLock = a3;
}

- (void)setColdLaunched:(BOOL)a3
{
  self->_coldLaunched = a3;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (id)applicationDidBecomeActiveObserver
{
  return self->_applicationDidBecomeActiveObserver;
}

- (void)setApplicationDidBecomeActiveObserver:(id)a3
{
}

- (id)deviceOrentationDidChangeObserver
{
  return self->_deviceOrentationDidChangeObserver;
}

- (void)setPersonalizationEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationEventProcessor, 0);
  objc_storeStrong(&self->_deviceOrentationDidChangeObserver, 0);
  objc_storeStrong(&self->_applicationDidBecomeActiveObserver, 0);
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, 0);
  objc_storeStrong(&self->_evaluateAfterSessionStart, 0);
  objc_storeStrong((id *)&self->_analyticsAccumulatedListenIDs, 0);
  objc_storeStrong((id *)&self->_analyticsAccumulatedReadIDs, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end