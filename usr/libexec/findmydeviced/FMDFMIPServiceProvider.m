@interface FMDFMIPServiceProvider
- (BKSApplicationStateMonitor)pendingDeviceIdentityMonitor;
- (BOOL)_canSendDeviceIdentityNow;
- (BOOL)isMonitoringPendingDeviceIdentity;
- (BOOL)validateParamsForUCRTHealing:(id)a3;
- (BOOL)waitingForBuddy;
- (BOOL)willMakeProviderActive;
- (FMAlert)pendingLocateAlert;
- (FMAlert)pendingSecureMessage;
- (FMDDetachNotificationManager)detachNotificationManager;
- (FMDFMIPNanoIDSListener)idsListener;
- (FMDFMIPServiceProvider)init;
- (FMDMagSafeSetupLauncher)magSafeSetupLauncher;
- (FMDNanoMigrator)nanoMigrator;
- (FMDUnregisterTokenStore)unregisterTokenStore;
- (NSString)deviceIdentityPendingXpcTransactionName;
- (NSTimer)buddyWaitTimer;
- (OS_dispatch_queue)authTokenHealingQueue;
- (OS_dispatch_queue)device_unlock_actions_queue;
- (OS_dispatch_queue)identity_wait_queue;
- (id)_unregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4;
- (id)accountStore;
- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4;
- (id)serviceName;
- (int)lockStateNotifyToken;
- (unint64_t)fmipState;
- (unsigned)essentialServerInfoMissingError;
- (void)_activeWatchDidChange;
- (void)_buddyCompletionCheckTimerFired:(id)a3;
- (void)_checkForBuddyCompletionAndReinitialize:(BOOL)a3 withBuddyStatus:(BOOL)a4;
- (void)_deviceDidPair:(id)a3;
- (void)_deviceDidUnpair:(id)a3;
- (void)_enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5;
- (void)_enqueueIdentityOperation:(id)a3;
- (void)_fmipStateChangeLocalNotification:(id)a3;
- (void)_sendDeviceIdentityNowWithIdentityInfo:(id)a3;
- (void)_serialQueue_checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3;
- (void)_serialQueue_sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3;
- (void)_showMarkAsMissingErrorForResponseError:(int64_t)a3;
- (void)_showPairedDeviceDisableFMIPErrorForResponseError:(int64_t)a3;
- (void)_showPendingHomescreenAlertNow;
- (void)_showUnregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4;
- (void)_updateToHomescreenAlerts;
- (void)accountRemoveRequestedWithCompletion:(id)a3;
- (void)attemptUCRTHealing:(id)a3 completion:(id)a4;
- (void)buddyDidComplete:(id)a3;
- (void)checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3;
- (void)checkShutdownSoonRegistration;
- (void)deregisterCommonNotifications;
- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4;
- (void)didMakeProviderActive;
- (void)didReceiveAuthFailureForRequest:(id)a3;
- (void)disableFMIPForPairedDeviceWithUDID:(id)a3 account:(id)a4 andCompletion:(id)a5;
- (void)disableLocationDisplayWithCompletion:(id)a3;
- (void)enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5;
- (void)ephemeralTokenForUserWithCompletion:(id)a3;
- (void)locationServiceAuthorizationChanged:(id)a3;
- (void)markPairedDeviceWithUdid:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5;
- (void)monitorAndSendDeviceIdentityLaterWithIdentityInfo:(id)a3;
- (void)registerCommonNotifications;
- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4;
- (void)registerDidSucceed;
- (void)sendDeviceIdentity:(int64_t)a3;
- (void)sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3;
- (void)sendDeviceIdentityWithIdentityInfo:(id)a3;
- (void)setAuthTokenHealingQueue:(id)a3;
- (void)setBuddyWaitTimer:(id)a3;
- (void)setCompletionHandlerForRepairDeviceRequest:(id)a3 thisDevice:(id)a4 completion:(id)a5;
- (void)setDetachNotificationManager:(id)a3;
- (void)setDeviceIdentityPendingXpcTransactionName:(id)a3;
- (void)setDevice_unlock_actions_queue:(id)a3;
- (void)setIdentity_wait_queue:(id)a3;
- (void)setIdsListener:(id)a3;
- (void)setIsMonitoringPendingDeviceIdentity:(BOOL)a3;
- (void)setLockStateNotifyToken:(int)a3;
- (void)setMagSafeSetupLauncher:(id)a3;
- (void)setNanoMigrator:(id)a3;
- (void)setPendingDeviceIdentityMonitor:(id)a3;
- (void)setPendingLocateAlert:(id)a3;
- (void)setPendingSecureMessage:(id)a3;
- (void)setUnregisterTokenStore:(id)a3;
- (void)setWaitingForBuddy:(BOOL)a3;
- (void)start;
- (void)stopMonitoringPendingDeviceIdentity;
- (void)syncFMIPStateToWatch;
- (void)synchronizeLocalActivationLockState;
- (void)systemShutdownSoon:(id)a3;
- (void)tryToFetchAuthToken;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)willMakeProviderInactive;
@end

@implementation FMDFMIPServiceProvider

- (unint64_t)fmipState
{
  v2 = [(FMDServiceProvider *)self account];
  v3 = [v2 dsid];

  if (v3 && (unint64_t v4 = (unint64_t)[v2 unregisterState], v4 <= 5)) {
    unint64_t v5 = qword_10026A438[v4];
  }
  else {
    unint64_t v5 = 3;
  }

  return v5;
}

- (FMDFMIPServiceProvider)init
{
  v26.receiver = self;
  v26.super_class = (Class)FMDFMIPServiceProvider;
  v2 = [(FMDServiceProvider *)&v26 init];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [(FMDFMIPServiceProvider *)v2 fm_logID];
    unint64_t v5 = +[NSString stringWithFormat:@"com.apple.icloud.findmydeviced.identityWaitQueue-%@", v4];

    id v6 = v5;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 cStringUsingEncoding:4], 0);
    [(FMDFMIPServiceProvider *)v3 setIdentity_wait_queue:v7];

    v8 = [(FMDFMIPServiceProvider *)v3 fm_logID];
    v9 = +[NSString stringWithFormat:@"com.apple.icloud.findmydeviced.deviceUnlockActionsQueue-%@", v8];

    id v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 cStringUsingEncoding:4], 0);
    [(FMDFMIPServiceProvider *)v3 setDevice_unlock_actions_queue:v11];

    [(FMDFMIPServiceProvider *)v3 setLockStateNotifyToken:0xFFFFFFFFLL];
    dispatch_queue_t v12 = dispatch_queue_create("fmipServiceProvider-tokenHealingQueue", 0);
    [(FMDFMIPServiceProvider *)v3 setAuthTokenHealingQueue:v12];

    +[FMDServiceProvider setActiveServiceProvider:v3];
    objc_initWeak(&location, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004B914;
    block[3] = &unk_1002D93C8;
    objc_copyWeak(&v24, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10023EC34(v13);
    }

    id v14 = [objc_alloc((Class)FMNanoIDSManager) initWithServiceId:@"com.apple.private.alloy.findmydeviced.watch" minimumVersion:2];
    v15 = [[FMDFMIPNanoIDSListener alloc] initWithManager:v14];
    [(FMDFMIPServiceProvider *)v3 setIdsListener:v15];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v3 selector:"checkShutdownSoonRegistration" name:@"FMDFMIPLowBatteryLocateStateDidChangeLocalNotification" object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v3 selector:"_fmipStateChangeLocalNotification:" name:@"FMIPStateChangeLocalNotification" object:0];

    v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Findmy MagSafe enabled", buf, 2u);
    }

    v19 = objc_alloc_init(FMDMagSafeSetupLauncher);
    magSafeSetupLauncher = v3->_magSafeSetupLauncher;
    v3->_magSafeSetupLauncher = v19;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)accountStore
{
  if (qword_10031E860 != -1) {
    dispatch_once(&qword_10031E860, &stru_1002DB1E0);
  }
  v2 = (void *)qword_10031E858;

  return v2;
}

- (id)serviceName
{
  return @"FMIP";
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDServiceProvider *)&v12 start];
  [(FMDFMIPServiceProvider *)self syncFMIPStateToWatch];
  v3 = objc_alloc_init(FMDUnregisterTokenStore);
  [(FMDFMIPServiceProvider *)self setUnregisterTokenStore:v3];
  unint64_t v4 = +[FMDCompanionRegistryFactory companionRegistryWithDelegate:0];
  unint64_t v5 = [(FMDFMIPServiceProvider *)self unregisterTokenStore];
  id v6 = [v4 allAccessories];
  [v5 expungeUnregisterTokens:v6];

  dispatch_queue_t v7 = [FMDNanoMigrator alloc];
  v8 = [(FMDFMIPServiceProvider *)self unregisterTokenStore];
  v9 = [(FMDServiceProvider *)self serverInteractionController];
  id v10 = [(FMDNanoMigrator *)v7 initWithCompanionRegistry:v4 unregisterTokenStore:v8 serverInteractionController:v9];
  [(FMDFMIPServiceProvider *)self setNanoMigrator:v10];

  dispatch_queue_t v11 = [(FMDFMIPServiceProvider *)self nanoMigrator];
  [v11 unregisterAccessoriesIfNeeded];

  [(FMDServiceProvider *)self startLocationMonitoringIfNeeded];
}

- (BOOL)willMakeProviderActive
{
  v3 = +[FMDSystemConfig sharedInstance];
  id v4 = [v3 isBuddyDone];

  unint64_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Buddy status: %d", (uint8_t *)v7, 8u);
  }

  [(FMDFMIPServiceProvider *)self _checkForBuddyCompletionAndReinitialize:0 withBuddyStatus:v4];
  return (char)v4;
}

- (void)didMakeProviderActive
{
  v22.receiver = self;
  v22.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDDeviceActionsServiceProvider *)&v22 didMakeProviderActive];
  v3 = [(FMDServiceProvider *)self account];
  unint64_t v4 = (unint64_t)[v3 unregisterState];

  if (v4 <= 4 && ((1 << v4) & 0x1A) != 0)
  {
    unint64_t v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found an fmip account that was previously unregistering in the last run of findmydeviced. That unregister may or may not have failed & error may or may not have been shown to the user. Showing error to user & turning FMIP back on", v21, 2u);
    }

    id v6 = [(FMDServiceProvider *)self account];
    +[RegisterAction deleteRegisterDigestForAccount:v6];

    dispatch_queue_t v7 = [(FMDServiceProvider *)self account];
    [v7 setUnregisterState:0];

    v8 = [(FMDFMIPServiceProvider *)self accountStore];
    v9 = [(FMDServiceProvider *)self account];
    [v8 saveAccount:v9];

    id v10 = [(FMDServiceProvider *)self account];
    id v11 = [v10 fmipDisableContext];
    if ((unint64_t)v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (uint64_t)v11;
    }
    [(FMDFMIPServiceProvider *)self _showUnregisterDeviceErrorForResponseError:2 inContext:v12];
  }
  v13 = [(FMDFMIPServiceProvider *)self unregisterTokenStore];
  [v13 clearUnregisterTokens];

  [(FMDFMIPServiceProvider *)self registerCommonNotifications];
  [(FMDFMIPServiceProvider *)self synchronizeLocalActivationLockState];
  id v14 = objc_alloc_init(FMDDetachNotificationManager);
  [(FMDFMIPServiceProvider *)self setDetachNotificationManager:v14];

  v15 = [(FMDServiceProvider *)self accessoryRegistry];
  v16 = [(FMDFMIPServiceProvider *)self detachNotificationManager];
  [v15 registerDelegate:v16];

  v17 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
  v18 = [(FMDFMIPServiceProvider *)self detachNotificationManager];
  [v18 setSupportedAccessoryRegistry:v17];

  v19 = [(FMDServiceProvider *)self accessoryLocationStore];
  v20 = [(FMDFMIPServiceProvider *)self detachNotificationManager];
  [v20 setLocationStore:v19];
}

- (void)willMakeProviderInactive
{
  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDDeviceActionsServiceProvider *)&v6 willMakeProviderInactive];
  [(FMDFMIPServiceProvider *)self deregisterCommonNotifications];
  [(FMDFMIPServiceProvider *)self stopMonitoringPendingDeviceIdentity];
  v3 = [(FMDFMIPServiceProvider *)self deviceIdentityPendingXpcTransactionName];

  if (v3)
  {
    unint64_t v4 = +[FMXPCTransactionManager sharedInstance];
    unint64_t v5 = [(FMDFMIPServiceProvider *)self deviceIdentityPendingXpcTransactionName];
    [v4 endTransaction:v5];

    [(FMDFMIPServiceProvider *)self setDeviceIdentityPendingXpcTransactionName:0];
  }
}

- (void)registerCommonNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"systemShutdownSoon:" name:@"FMDSystemShutdownSoonNotification" object:0];

  unint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"locationServiceAuthorizationChanged:" name:@"FMDLocationServiceAuthorizationChangedNotification" object:0];

  unint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_deviceDidPair:" name:@"nano.devicedidpair" object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_deviceDidUnpair:" name:@"nano.devicedidunpair" object:0];

  dispatch_queue_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_activeWatchDidChange" name:@"nano.watchdidbecomeactive" object:0];

  v8.receiver = self;
  v8.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDDeviceActionsServiceProvider *)&v8 registerCommonNotifications];
}

- (void)deregisterCommonNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"FMDSystemShutdownSoonNotification" object:0];

  unint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"FMDLocationServiceAuthorizationChangedNotification" object:0];

  unint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"nano.devicedidpair" object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"nano.devicedidunpair" object:0];

  dispatch_queue_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"nano.watchdidbecomeactive" object:0];

  v8.receiver = self;
  v8.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDDeviceActionsServiceProvider *)&v8 deregisterCommonNotifications];
}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5 = a3;
  objc_super v6 = (__CFString *)a4;
  if ([v5 isEqualToString:@"appleid"])
  {

    objc_super v6 = @"prefs:root=APPLE_ACCOUNT";
    dispatch_queue_t v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
    v19[0] = @"url";
    v19[1] = @"sensitive";
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    objc_super v8 = v20;
    v9 = v19;
LABEL_10:
    id v11 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:2];

    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"settings"])
  {

    objc_super v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
    dispatch_queue_t v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
    v17[0] = @"url";
    v17[1] = @"sensitive";
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    objc_super v8 = v18;
    v9 = v17;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"fmip-settings"])
  {

    objc_super v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR";
    dispatch_queue_t v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR"];
    v15[0] = @"url";
    v15[1] = @"sensitive";
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    objc_super v8 = v16;
    v9 = v15;
    goto LABEL_10;
  }
  unsigned int v10 = [v5 isEqualToString:@"open-url"];
  id v11 = 0;
  if (v6 && v10)
  {
    dispatch_queue_t v7 = +[NSURL URLWithString:v6];
    v13[0] = @"url";
    v13[1] = @"sensitive";
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    objc_super v8 = v14;
    v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)accountRemoveRequestedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDServiceProvider *)self account];
  id v6 = [v5 unregisterState];

  if (v6 == (id)1)
  {
    dispatch_queue_t v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending unregister because account state changed to UnregisterPending", buf, 2u);
    }

    [(FMDServiceProvider *)self makeProviderInactive];
    objc_super v8 = [(FMDServiceProvider *)self account];
    +[RegisterAction deleteRegisterDigestForAccount:v8];

    v9 = [(FMDDeviceActionsServiceProvider *)self locationTracker];
    [v9 deleteLocationTrackingInfoAndStopTracking];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004C57C;
    v12[3] = &unk_1002DB208;
    v12[4] = self;
    id v13 = v4;
    [(FMDFMIPServiceProvider *)self unregisterDeviceWithCompletion:v12];
  }
  else
  {
    unsigned int v10 = +[FMDMagSafeDataStore sharedInstance];
    [v10 clearDataStore];

    v11.receiver = self;
    v11.super_class = (Class)FMDFMIPServiceProvider;
    [(FMDDeviceActionsServiceProvider *)&v11 accountRemoveRequestedWithCompletion:v4];
  }
}

- (void)checkShutdownSoonRegistration
{
  v3 = [(FMDServiceProvider *)self account];
  if ([v3 lowBatteryLocateEnabled])
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004C79C;
    v9[3] = &unk_1002D9238;
    objc_copyWeak(&v11, &location);
    unsigned int v10 = @"com.apple.DuetHeuristic-BM.shutdowsoon";
    id v4 = objc_retainBlock(v9);
    id v5 = +[FMXPCNotificationsUtil sharedInstance];
    unsigned __int8 v6 = [v5 isHandlerRegisteredForDarwinNotification:@"com.apple.DuetHeuristic-BM.shutdowsoon"];

    if ((v6 & 1) == 0)
    {
      dispatch_queue_t v7 = +[FMXPCNotificationsUtil sharedInstance];
      [v7 registerHandler:v4 forDarwinNotification:@"com.apple.DuetHeuristic-BM.shutdowsoon"];
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v8 = +[FMXPCNotificationsUtil sharedInstance];
    [v8 deregisterHandlerForDarwinNotification:@"com.apple.DuetHeuristic-BM.shutdowsoon"];
  }
  [(FMDFMIPServiceProvider *)self syncFMIPStateToWatch];
}

- (void)tryToFetchAuthToken
{
  v3 = [(FMDFMIPServiceProvider *)self authTokenHealingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CAB4;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (unsigned)essentialServerInfoMissingError
{
  v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1196379972;
  v3 = [(FMDFMIPServiceProvider *)self authTokenHealingQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004CC34;
  v5[3] = &unk_1002D9210;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)sendDeviceIdentity:(int64_t)a3
{
  id v4 = [[FMDIdentityInfo alloc] initWithVersion:a3];
  [(FMDFMIPServiceProvider *)self sendDeviceIdentityWithIdentityInfo:v4];
}

- (void)sendDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4 = a3;
  if ([(FMDFMIPServiceProvider *)self isMonitoringPendingDeviceIdentity])
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Already waiting to send deviceIdentity", v6, 2u);
    }
  }
  else
  {
    [(FMDFMIPServiceProvider *)self sendDeviceIdentityIfEligibleWithIdentityInfo:v4];
  }
}

- (void)_sendDeviceIdentityNowWithIdentityInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMDFMIPServiceProvider *)self essentialServerInfoMissingError];
  if (v5 != 1196379972)
  {
    uint64_t v9 = v5;
    unsigned int v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[NSString stringWithFourCC:v9];
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not sending device identity to server since some essential server info is missing - '%@'", buf, 0xCu);
    }
    [(FMDFMIPServiceProvider *)self tryToFetchAuthToken];
    uint64_t v8 = [(FMDFMIPServiceProvider *)self accountStore];
    uint64_t v12 = [(FMDServiceProvider *)self account];
    [(FMDRequestIdentityV5 *)v8 saveAccount:v12];

    goto LABEL_7;
  }
  +[FMPreferencesUtil removeKey:@"identityVersion" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil synchronizeDomain:kFMDNotBackedUpPrefDomain];
  unint64_t v6 = (unint64_t)[v4 version];
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    unint64_t v7 = v6;
    uint64_t v8 = [[FMDRequestIdentityV5 alloc] initWithProvider:self identityInfo:v4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10004CF6C;
    v13[3] = &unk_1002DB230;
    v13[4] = self;
    v13[5] = v7;
    [(FMDRequest *)v8 setCompletionHandler:v13];
    [(FMDServiceProvider *)self enqueueRequest:v8];
LABEL_7:
  }
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(FMDServiceProvider *)self account];
  id v8 = [v7 unregisterState];

  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)FMDFMIPServiceProvider;
    [(FMDServiceProvider *)&v9 registerDeviceWithCause:v6 force:v4];
  }
}

- (void)registerDidSucceed
{
  v4.receiver = self;
  v4.super_class = (Class)FMDFMIPServiceProvider;
  [(FMDServiceProvider *)&v4 registerDidSucceed];
  v3 = [(FMDServiceProvider *)self account];
  [v3 setLastLoggedInDsid:0];
}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FMDDisableLocationDisplayRequest alloc];
  id v6 = [(FMDServiceProvider *)self account];
  unint64_t v7 = [(FMDDisableLocationDisplayRequest *)v5 initWithAccount:v6];

  id v8 = +[ServerDeviceInfo sharedInstance];
  objc_super v9 = [(FMDServiceProvider *)self account];
  unsigned int v10 = [v8 deviceInfoForAccount:v9];

  id v11 = [FMDActingRequestDecorator alloc];
  v19[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_10004D640;
  v20[3] = &unk_1002D9458;
  id v21 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_10004D648;
  v19[3] = &unk_1002D9458;
  id v12 = v10;
  id v13 = [(FMDActingRequestDecorator *)v11 initWithDeviceContextGenerator:&stru_1002DB250 deviceInfoGenerator:v20 serverContextGenerator:0 requestHeaderGenerator:v19];
  [(FMDRequest *)v7 setDecorator:v13];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10004D6D0;
  v17[3] = &unk_1002D9180;
  id v18 = v4;
  id v14 = v4;
  [(FMDRequest *)v7 setCompletionHandler:v17];
  v15 = sub_100059C08();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(FMDDisableLocationDisplayRequest *)v7 fm_logID];
    *(_DWORD *)buf = 138412290;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: sending request to disable locations.", buf, 0xCu);
  }
  [(FMDServiceProvider *)self enqueueRequest:v7];
}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = [v6 repairDeviceMode];
  if (v7 == (id)2)
  {
    id v8 = sub_100059AD8();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v18 = 0;
    objc_super v9 = "deviceEligibleForRepairWithContext for trade in mode";
    unsigned int v10 = (uint8_t *)&v18;
  }
  else if (v7 == (id)1)
  {
    id v8 = sub_100059AD8();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v19 = 0;
    objc_super v9 = "deviceEligibleForRepairWithContext for repairMode";
    unsigned int v10 = (uint8_t *)&v19;
  }
  else
  {
    id v8 = sub_100059AD8();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v17 = 0;
    objc_super v9 = "deviceEligibleForRepairWithContext for unknown";
    unsigned int v10 = (uint8_t *)&v17;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
LABEL_10:

  id v11 = objc_opt_new();
  id v12 = [v6 searchIdentifiers];

  uint64_t v13 = FMDRepairDeviceThisDeviceIdentifier;
  unsigned int v14 = [v12 containsObject:FMDRepairDeviceThisDeviceIdentifier];

  if (v14)
  {
    id v15 = [objc_alloc((Class)FMDRepairDevice) initWithClientIdentifier:v13 isThisDevice:1];
    [v11 addObject:v15];
  }
  id v16 = [objc_alloc((Class)FMDRepairDeviceResult) initWithEligibleDevices:v11 devicesInRepairMode:&__NSArray0__struct];
  v5[2](v5, v16, 0);
}

- (BOOL)validateParamsForUCRTHealing:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:kFMDOptionsActivationLockUsername];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = kFMDOptionsActivationLockPET;
    id v6 = [v3 objectForKeyedSubscript:kFMDOptionsActivationLockPET];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      id v8 = [v3 objectForKeyedSubscript:v5];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)attemptUCRTHealing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(FMDFMIPServiceProvider *)self validateParamsForUCRTHealing:v6])
  {
    int v8 = MAEUCRTUpgradeRequired();
    id v9 = 0;
    unsigned int v10 = sub_100059A40();
    id v11 = v10;
    if ((v8 & 1) == 0 && v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10023EC78();
      }

LABEL_20:
      v7[2](v7, 0, v9);
      goto LABEL_21;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = "false";
      if (v8) {
        id v16 = "true";
      }
      *(_DWORD *)buf = 136315138;
      objc_super v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UCRT Upgrade required %s", buf, 0xCu);
    }

    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v17 = MAEReissueUCRTWithError();
    id v18 = v9;

    __int16 v19 = sub_100059A40();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = "false";
      if (v17) {
        v20 = "true";
      }
      *(_DWORD *)buf = 136315394;
      objc_super v22 = v20;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Is UCRT Success: %s,: Error: %@", buf, 0x16u);
    }

    v7[2](v7, v17, v18);
    id v9 = v18;
  }
  else
  {
    id v9 = +[NSString stringWithFormat:@"Username or password is not correct types"];
    id v12 = sub_100059A40();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    uint64_t v13 = kFMDErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    id v26 = v9;
    unsigned int v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v15 = +[NSError errorWithDomain:v13 code:7 userInfo:v14];

    v7[2](v7, 0, v15);
  }
LABEL_21:
}

- (void)enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 repairDeviceMode];
  if (v11 == (id)2)
  {
    id v12 = sub_100059AD8();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "enableRepairWithContext for trade in mode";
  }
  else if (v11 == (id)1)
  {
    id v12 = sub_100059AD8();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "enableRepairWithContext for repairMode";
  }
  else
  {
    id v12 = sub_100059AD8();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "deviceEligibleForRepairWithContext for unknown";
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_10:

  unsigned int v14 = [v8 ephemeralToken];

  if (v14)
  {
    id v15 = sub_100059AD8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got ephemeral token for repair device.", buf, 2u);
    }

    [(FMDFMIPServiceProvider *)self _enableRepairWithContext:v8 callingClient:v9 completion:v10];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_10004E1C0;
    v16[3] = &unk_1002DB278;
    id v20 = v10;
    id v17 = v8;
    id v18 = self;
    id v19 = v9;
    [(FMDFMIPServiceProvider *)self ephemeralTokenForUserWithCompletion:v16];
  }
}

- (void)_enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v44 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = objc_alloc_init((Class)FMDRepairDevice);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v11 = [v8 selectedDevices];
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v12)
  {
    id v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v50;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v50 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
      v14 |= [v17 isThisDevice];
      if ([v17 isThisDevice]) {
        break;
      }
      if (v13 == (id)++v16)
      {
        id v13 = [v11 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v13) {
          goto LABEL_3;
        }

        if ((v14 & 1) == 0) {
          goto LABEL_17;
        }
LABEL_12:
        id v19 = +[ServerDeviceInfo sharedInstance];
        id v20 = [(FMDServiceProvider *)self account];
        id v21 = [v19 deviceInfoForAccount:v20];

        objc_super v22 = [FMDActingRequestDecorator alloc];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10004E7F0;
        v47[3] = &unk_1002D9458;
        id v23 = v21;
        id v48 = v23;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10004E7F8;
        v46[3] = &unk_1002D9458;
        v46[4] = self;
        id v24 = [(FMDActingRequestDecorator *)v22 initWithDeviceContextGenerator:&stru_1002DB298 deviceInfoGenerator:v47 serverContextGenerator:0 requestHeaderGenerator:v46];
        NSErrorUserInfoKey v25 = [(FMDServiceProvider *)self account];
        id v26 = [v25 dsid];

        if (v26)
        {
          v27 = [FMDRepairDeviceRequest alloc];
          v28 = [(FMDServiceProvider *)self account];
          [v8 ephemeralToken];
          v29 = v26;
          v31 = v30 = v24;
          id v32 = [v8 repairDeviceMode];
          v33 = v27;
          v43 = v29;
          v34 = v44;
          v35 = [(FMDRepairDeviceRequest *)v33 initWithDeviceIdentifier:v28 ephemeralToken:v31 dsid:v29 callingClient:v44 mode:v32];

          id v24 = v30;
          [(FMDRequest *)v35 setDecorator:v30];
          [(FMDFMIPServiceProvider *)self setCompletionHandlerForRepairDeviceRequest:v35 thisDevice:v10 completion:v9];
          v36 = sub_100059AD8();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Sending request to repair device.", buf, 2u);
          }

          [(FMDServiceProvider *)self enqueueRequest:v35];
          id v26 = v43;
        }
        else
        {
          v35 = +[NSString stringWithFormat:@"dsid is nil"];
          uint64_t v40 = kFMDErrorDomain;
          NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
          v54 = v35;
          v41 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v42 = +[NSError errorWithDomain:v40 code:5 userInfo:v41];
          v9[2](v9, 0, v42);

          v34 = v44;
        }

        v38 = v48;
        goto LABEL_20;
      }
    }
    id v18 = v17;

    id v10 = v18;
    if ((v14 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }

LABEL_17:
  id v23 = +[NSString stringWithFormat:@"Request is not for the current device"];
  uint64_t v37 = kFMDErrorDomain;
  NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
  id v56 = v23;
  v38 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v39 = +[NSError errorWithDomain:v37 code:0 userInfo:v38];
  v9[2](v9, 0, v39);

  v34 = v44;
LABEL_20:
}

- (void)setCompletionHandlerForRepairDeviceRequest:(id)a3 thisDevice:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004E940;
  v9[3] = &unk_1002DB2C0;
  id v10 = a4;
  id v11 = a5;
  id v7 = v10;
  id v8 = v11;
  [a3 setCompletionHandler:v9];
}

- (void)ephemeralTokenForUserWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FMSystemInfo sharedInstance];
  unsigned __int8 v6 = [v5 isInternalBuild];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    if (v7)
    {
      id v8 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
      id v9 = v8;
      if (v8)
      {
        [v8 setIsUsernameEditable:0];
        [v9 setShouldPromptForPasswordOnly:1];
        id v10 = [(FMDServiceProvider *)self account];
        id v11 = [v10 username];
        [v9 setUsername:v11];

        [v9 setDefaultButtonString:@"Default Button Text"];
        [v9 setIsEphemeral:1];
        [v9 setAuthenticationType:2];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        void v20[2] = sub_10004F030;
        v20[3] = &unk_1002DB2E8;
        id v21 = v4;
        [v7 authenticateWithContext:v9 completion:v20];
        id v12 = v21;
      }
      else
      {
        id v18 = sub_100004238();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authContext", buf, 2u);
        }

        id v19 = objc_alloc((Class)NSError);
        id v12 = [v19 initWithDomain:kFMDErrorDomain code:5 userInfo:0];
        (*((void (**)(id, void, id))v4 + 2))(v4, 0, v12);
      }
    }
    else
    {
      uint64_t v16 = sub_100004238();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authController", buf, 2u);
      }

      id v17 = objc_alloc((Class)NSError);
      id v9 = [v17 initWithDomain:kFMDErrorDomain code:5 userInfo:0];
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
    }
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"Cannot find an ephemeral token, please provide one"];
    uint64_t v13 = kFMDErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    id v24 = v7;
    int v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v15 = +[NSError errorWithDomain:v13 code:4 userInfo:v14];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v15);

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)disableFMIPForPairedDeviceWithUDID:(id)a3 account:(id)a4 andCompletion:(id)a5
{
  v38 = self;
  id v7 = a3;
  id v40 = a4;
  id v39 = a5;
  id v8 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
  id v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    uint64_t v15 = NRDevicePropertyIsPaired;
    uint64_t v16 = NRDevicePropertyUDID;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(v11);
      }
      id v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
      id v19 = [v18 valueForProperty:v15, v38];
      unsigned int v20 = [v19 BOOLValue];

      if (v7)
      {
        if (v20)
        {
          id v21 = [v18 valueForProperty:v16];
          unsigned __int8 v22 = [v7 isEqualToString:v21];

          if (v22) {
            break;
          }
        }
      }
      if (v13 == (id)++v17)
      {
        id v13 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v23 = v18;

    if (!v23) {
      goto LABEL_15;
    }
    id v24 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
    NSErrorUserInfoKey v25 = [v23 valueForProperty:v16];
    [(FMDFMIPUnregisterDeviceInfo *)v24 setUdid:v25];

    id v26 = [v23 valueForProperty:NRDevicePropertySerialNumber];
    [(FMDFMIPUnregisterDeviceInfo *)v24 setSerialNumber:v26];

    v27 = [v23 valueForProperty:NRDevicePropertyProductType];
    [(FMDFMIPUnregisterDeviceInfo *)v24 setProductType:v27];

    v28 = [v23 valueForProperty:NRDevicePropertyPairingID];
    v29 = [v28 UUIDString];
    [(FMDFMIPUnregisterDeviceInfo *)v24 setPairingId:v29];

    v30 = +[FMPreferencesUtil stringForKey:@"productVersionOverride" inDomain:kFMDNotBackedUpPrefDomain];
    id v32 = v39;
    v31 = v40;
    if (v30)
    {
      [(FMDFMIPUnregisterDeviceInfo *)v24 setProductVersion:v30];
    }
    else
    {
      v35 = [v23 valueForProperty:NRDevicePropertySystemVersion];
      [(FMDFMIPUnregisterDeviceInfo *)v24 setProductVersion:v35];
    }
    v36 = [v23 valueForProperty:NRDevicePropertySystemBuildVersion];
    [(FMDFMIPUnregisterDeviceInfo *)v24 setBuildVersion:v36];

    [(FMDFMIPUnregisterDeviceInfo *)v24 setDisableContext:5];
    uint64_t v37 = [[FMDRequestFMIPUnregister alloc] initWithAccount:v40 device:v24 otherDevices:0];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10004F5F0;
    v41[3] = &unk_1002DB310;
    id v42 = v7;
    v43 = v38;
    id v44 = v39;
    [(FMDRequest *)v37 setCompletionHandler:v41];
    [(FMDServiceProvider *)v38 enqueueRequest:v37 account:v40];

    goto LABEL_21;
  }
LABEL_11:

LABEL_15:
  v33 = sub_100004238();
  id v32 = v39;
  v31 = v40;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10023EDB0();
  }

  if (v39)
  {
    uint64_t v34 = kFMDErrorDomain;
    NSErrorUserInfoKey v49 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v50 = @"No paired device with this UDID";
    id v23 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v24 = +[NSError errorWithDomain:v34 code:1 userInfo:v23];
    (*((void (**)(id, FMDFMIPUnregisterDeviceInfo *))v39 + 2))(v39, v24);
LABEL_21:
  }
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v50 = a3;
  id v4 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
  uint64_t v5 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v6 = [v5 deviceUDID];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setUdid:v6];

  id v7 = +[FMDSystemConfig sharedInstance];
  id v8 = [v7 internationalMobileEquipmentIdentity];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setImei:v8];

  id v9 = +[FMDSystemConfig sharedInstance];
  id v10 = [v9 internationalMobileEquipmentIdentityTwo];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setImei2:v10];

  id v11 = +[FMDSystemConfig sharedInstance];
  id v12 = [v11 mobileEquipmentIdentifier];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setMeid:v12];

  id v13 = +[FMDSystemConfig sharedInstance];
  uint64_t v14 = [v13 serialNumber];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setSerialNumber:v14];

  uint64_t v15 = +[FMDSystemConfig sharedInstance];
  uint64_t v16 = [v15 productType];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setProductType:v16];

  uint64_t v17 = +[FMDSystemConfig sharedInstance];
  id v18 = [v17 productVersion];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setProductVersion:v18];

  id v19 = +[FMDSystemConfig sharedInstance];
  unsigned int v20 = [v19 buildVersion];
  [(FMDFMIPUnregisterDeviceInfo *)v4 setBuildVersion:v20];

  id v21 = [(FMDServiceProvider *)self account];
  long long v51 = v4;
  -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v4, "setDisableContext:", [v21 fmipDisableContext]);

  unsigned __int8 v22 = +[NSMutableArray array];
  id v23 = +[FMDCompanionRegistryFactory companionRegistryWithDelegate:0];
  id v24 = [v23 allAccessories];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v57;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v57 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v31 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
        id v32 = [v30 udid];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setUdid:v32];

        v33 = [v30 serialNumber];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setSerialNumber:v33];

        uint64_t v34 = [v30 productType];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setProductType:v34];

        v35 = [v30 productVersion];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setProductVersion:v35];

        v36 = [v30 buildVersion];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setBuildVersion:v36];

        -[FMDFMIPUnregisterDeviceInfo setPaired:](v31, "setPaired:", [v30 paired]);
        -[FMDFMIPUnregisterDeviceInfo setMigrationConfirmed:](v31, "setMigrationConfirmed:", [v30 migrationPossible]);
        uint64_t v37 = [(FMDServiceProvider *)self account];
        -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v31, "setDisableContext:", [v37 fmipDisableContext]);

        v38 = [v30 pairingId];
        id v39 = [v38 UUIDString];
        [(FMDFMIPUnregisterDeviceInfo *)v31 setPairingId:v39];

        [v22 addObject:v31];
      }
      id v27 = [v25 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v27);
  }

  id v40 = [(FMDServiceProvider *)self account];
  v41 = [FMDRequestFMIPUnregister alloc];
  id v42 = [(FMDServiceProvider *)self account];
  v43 = [(FMDRequestFMIPUnregister *)v41 initWithAccount:v42 device:v51 otherDevices:v22];

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000502E4;
  v52[3] = &unk_1002DB310;
  id v44 = v40;
  id v53 = v44;
  v54 = self;
  id v45 = v50;
  id v55 = v45;
  [(FMDRequest *)v43 setCompletionHandler:v52];
  id v46 = [v44 unregisterState];
  [v44 setUnregisterState:4];
  long long v47 = [(FMDFMIPServiceProvider *)self accountStore];
  [v47 saveAccount:v44];

  if (![(FMDServiceProvider *)self enqueueRequest:v43])
  {
    [v44 setUnregisterState:v46];
    long long v48 = [(FMDFMIPServiceProvider *)self accountStore];
    [v48 saveAccount:v44];

    if (v45)
    {
      NSErrorUserInfoKey v49 = +[NSError errorWithDomain:@"com.apple.icloud.findmydeviced.fmipunregister" code:2 userInfo:0];
      (*((void (**)(id, void *))v45 + 2))(v45, v49);
    }
  }
}

- (void)markPairedDeviceWithUdid:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v40 = a4;
  id v39 = a5;
  id v8 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
  id v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    uint64_t v15 = NRDevicePropertyIsPaired;
    uint64_t v16 = NRDevicePropertyUDID;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v11);
      }
      id v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
      id v19 = [v18 valueForProperty:v15];
      unsigned int v20 = [v19 BOOLValue];

      if (v7)
      {
        if (v20)
        {
          id v21 = [v18 valueForProperty:v16];
          unsigned __int8 v22 = [v7 isEqualToString:v21];

          if (v22) {
            break;
          }
        }
      }
      if (v13 == (id)++v17)
      {
        id v13 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v23 = v18;

    if (!v23) {
      goto LABEL_15;
    }
    id v24 = objc_alloc_init(FMDFMIPMissingDeviceInfo);
    id v25 = [v23 valueForProperty:v16];
    [(FMDFMIPMissingDeviceInfo *)v24 setUdid:v25];

    id v26 = [v23 valueForProperty:NRDevicePropertySerialNumber];
    [(FMDFMIPMissingDeviceInfo *)v24 setSerialNumber:v26];

    id v27 = [v23 valueForProperty:NRDevicePropertyProductType];
    [(FMDFMIPMissingDeviceInfo *)v24 setProductType:v27];

    uint64_t v28 = +[FMPreferencesUtil stringForKey:@"productVersionOverride" inDomain:kFMDNotBackedUpPrefDomain];
    v29 = v40;
    if (v28)
    {
      [(FMDFMIPMissingDeviceInfo *)v24 setProductVersion:v28];
    }
    else
    {
      v33 = [v23 valueForProperty:NRDevicePropertySystemVersion];
      [(FMDFMIPMissingDeviceInfo *)v24 setProductVersion:v33];
    }
    uint64_t v34 = [v23 valueForProperty:NRDevicePropertySystemBuildVersion];
    [(FMDFMIPMissingDeviceInfo *)v24 setBuildVersion:v34];

    v35 = [FMDRequestMissingDevice alloc];
    v36 = [(FMDServiceProvider *)self account];
    uint64_t v37 = [(FMDRequestMissingDevice *)v35 initWithAccount:v36 token:v40 andMissingDeviceInfo:v24];

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100051238;
    v41[3] = &unk_1002DB360;
    void v41[4] = self;
    v31 = v39;
    id v42 = v39;
    [(FMDRequest *)v37 setCompletionHandler:v41];
    [(FMDServiceProvider *)self enqueueRequest:v37];

    goto LABEL_21;
  }
LABEL_11:

LABEL_15:
  v30 = sub_100004238();
  v31 = v39;
  v29 = v40;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_10023EDB0();
  }

  if (v39)
  {
    uint64_t v32 = kFMDErrorDomain;
    NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v48 = @"No paired device with this UDID";
    id v23 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v24 = +[NSError errorWithDomain:v32 code:1 userInfo:v23];
    (*((void (**)(id, FMDFMIPMissingDeviceInfo *))v39 + 2))(v39, v24);
LABEL_21:
  }
}

- (void)_showUnregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4
{
  id v16 = objc_alloc_init((Class)FMAlert);
  [v16 setCategory:1];
  unsigned __int8 v6 = [LocalizedUnregisterErrorKey alloc];
  id v7 = +[FMDSystemConfig sharedInstance];
  id v8 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:](v6, "initWithUnregisterError:context:deviceClass:", a3, a4, [v7 deviceClass]);

  id v9 = [(LocalizedUnregisterErrorKey *)v8 titleKey];
  id v10 = [(LocalizedUnregisterErrorKey *)v8 textKey];
  id v11 = [(LocalizedUnregisterErrorKey *)v8 okButtonKey];
  id v12 = sub_10002F1A8(v9);
  [v16 setMsgTitle:v12];

  id v13 = sub_10002F1A8(v10);
  [v16 setMsgText:v13];

  uint64_t v14 = sub_10002F1A8(v11);
  [v16 setDefaultButtonTitle:v14];

  [v16 setShowMsgInLockScreen:1];
  [v16 setDismissMsgOnUnlock:0];
  [v16 setDismissMsgOnLock:1];
  uint64_t v15 = +[FMAlertManager sharedInstance];
  [v15 activateAlert:v16];
}

- (void)_showMarkAsMissingErrorForResponseError:(int64_t)a3
{
  id v12 = objc_alloc_init((Class)FMAlert);
  [v12 setCategory:1];
  id v4 = [[LocalizedUnregisterErrorKey alloc] initWithUnregisterError:a3 context:6 deviceClass:8];
  uint64_t v5 = [(LocalizedUnregisterErrorKey *)v4 titleKey];
  unsigned __int8 v6 = [(LocalizedUnregisterErrorKey *)v4 textKey];
  id v7 = [(LocalizedUnregisterErrorKey *)v4 okButtonKey];
  id v8 = sub_10002F1A8(v5);
  [v12 setMsgTitle:v8];

  id v9 = sub_10002F1A8(v6);
  [v12 setMsgText:v9];

  id v10 = sub_10002F1A8(v7);
  [v12 setDefaultButtonTitle:v10];

  [v12 setShowMsgInLockScreen:1];
  [v12 setDismissMsgOnUnlock:0];
  [v12 setDismissMsgOnLock:1];
  id v11 = +[FMAlertManager sharedInstance];
  [v11 activateAlert:v12];
}

- (void)_showPairedDeviceDisableFMIPErrorForResponseError:(int64_t)a3
{
  id v12 = objc_alloc_init((Class)FMAlert);
  [v12 setCategory:1];
  id v4 = [[LocalizedUnregisterErrorKey alloc] initWithUnregisterError:a3 context:5 deviceClass:8];
  uint64_t v5 = [(LocalizedUnregisterErrorKey *)v4 titleKey];
  unsigned __int8 v6 = [(LocalizedUnregisterErrorKey *)v4 textKey];
  id v7 = [(LocalizedUnregisterErrorKey *)v4 okButtonKey];
  id v8 = sub_10002F1A8(v5);
  [v12 setMsgTitle:v8];

  id v9 = sub_10002F1A8(v6);
  [v12 setMsgText:v9];

  id v10 = sub_10002F1A8(v7);
  [v12 setDefaultButtonTitle:v10];

  [v12 setShowMsgInLockScreen:1];
  [v12 setDismissMsgOnUnlock:0];
  [v12 setDismissMsgOnLock:1];
  id v11 = +[FMAlertManager sharedInstance];
  [v11 activateAlert:v12];
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPServiceProvider;
  id v3 = a3;
  [(FMDServiceProvider *)&v6 didReceiveAuthFailureForRequest:v3];
  unsigned int v4 = [v3 showAuthFailedMessage:v6.receiver super_class:v6.super_class];

  if (v4)
  {
    uint64_t v5 = +[FMDAppleAccountManager sharedInstance];
    [v5 fixFMIPAuthTokenShouldForce:0];
  }
}

- (void)setPendingSecureMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSecureMessage, a3);

  [(FMDFMIPServiceProvider *)self _updateToHomescreenAlerts];
}

- (void)setPendingLocateAlert:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLocateAlert, a3);

  [(FMDFMIPServiceProvider *)self _updateToHomescreenAlerts];
}

- (void)_updateToHomescreenAlerts
{
  objc_initWeak(&location, self);
  id v3 = [(FMDFMIPServiceProvider *)self device_unlock_actions_queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051CF4;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_showPendingHomescreenAlertNow
{
  objc_initWeak(&location, self);
  id v3 = [(FMDFMIPServiceProvider *)self device_unlock_actions_queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051EF4;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_checkForBuddyCompletionAndReinitialize:(BOOL)a3 withBuddyStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Buddy complete? : %d", buf, 8u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005212C;
  v8[3] = &unk_1002DB3B0;
  BOOL v9 = v4;
  v8[4] = self;
  BOOL v10 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)syncFMIPStateToWatch
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for changes in FMIP State to sync to the Watch...", buf, 2u);
  }

  BOOL v4 = +[FMDSystemConfig sharedInstance];
  id v5 = [v4 allowsActivationLock];

  objc_super v6 = [(FMDServiceProvider *)self account];
  uint64_t v7 = [v6 dsid];

  unint64_t v8 = [(FMDFMIPServiceProvider *)self fmipState];
  BOOL v9 = [(FMDServiceProvider *)self account];
  BOOL v10 = [v9 accountAddTime];
  [v10 timeIntervalSinceReferenceDate];
  uint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  BOOL v12 = [(FMDServiceProvider *)self account];
  unsigned int v13 = [v12 lowBatteryLocateEnabled];

  uint64_t v14 = &__kCFBooleanFalse;
  v61 = (void *)v11;
  if (v8 > 2)
  {
    uint64_t v15 = (void *)v7;
    CFStringRef v86 = @"Enabled";
    v87 = &__kCFBooleanFalse;
    id v16 = &v87;
    uint64_t v17 = &v86;
    uint64_t v18 = 1;
  }
  else
  {
    v88[0] = @"Enabled";
    v88[1] = @"AccountId";
    v89[0] = &__kCFBooleanTrue;
    v89[1] = v7;
    uint64_t v15 = (void *)v7;
    v88[2] = @"AccountAddTime";
    v88[3] = @"LowBatteryLocateEnabled";
    if (v13) {
      uint64_t v14 = &__kCFBooleanTrue;
    }
    v89[2] = v11;
    v89[3] = v14;
    id v16 = (void **)v89;
    uint64_t v17 = (const __CFString **)v88;
    uint64_t v18 = 4;
  }
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:v18];
  unsigned int v20 = +[NSMutableSet set];
  +[FMPreferencesUtil synchronizeDomain:kFMDWatchNotBackedUpPrefDomain];
  id v21 = +[FMPreferencesUtil objectForKey:@"FMIPInfo" inDomain:kFMDWatchNotBackedUpPrefDomain];
  v64 = +[FMPreferencesUtil objectForKey:@"ActivationLockAllowed" inDomain:kFMDWatchNotBackedUpPrefDomain];
  v60 = v21;
  if (([v21 isEqual:v19] & 1) == 0) {
    [v20 addObject:@"FMIPInfo"];
  }
  if (v5 != [v64 BOOLValue]) {
    [v20 addObject:@"ActivationLockAllowed"];
  }
  v69 = (void *)v19;
  v62 = v15;
  v63 = v20;
  if ([v20 count])
  {
    unsigned __int8 v22 = +[NSDate date];
    [v22 timeIntervalSinceReferenceDate];
    id v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    id v24 = sub_100004238();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v69 objectForKeyedSubscript:@"Enabled"];
      unsigned int v26 = [v25 BOOLValue];
      *(_DWORD *)buf = 134218754;
      CFStringRef v79 = (const __CFString *)v26;
      __int16 v80 = 2112;
      uint64_t v81 = (uint64_t)v15;
      __int16 v82 = 2048;
      uint64_t v83 = v5;
      __int16 v84 = 2112;
      v85 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating watch with fmipEnabled:%ld, fmipAccount:%@, activationLockAllowed:%ld, lastUpdated:%@...", buf, 0x2Au);
    }
    [v63 addObject:@"LastUpdated"];
    +[FMPreferencesUtil setObject:v23 forKey:@"LastUpdated" inDomain:kFMDWatchNotBackedUpPrefDomain];
    +[FMPreferencesUtil setObject:v69 forKey:@"FMIPInfo" inDomain:kFMDWatchNotBackedUpPrefDomain];
    +[FMPreferencesUtil setBool:v5 forKey:@"ActivationLockAllowed" inDomain:kFMDWatchNotBackedUpPrefDomain];
    id v27 = objc_alloc_init((Class)NPSManager);
    [v27 synchronizeUserDefaultsDomain:kFMDWatchNotBackedUpPrefDomain keys:v63];
  }
  else
  {
    id v23 = sub_100004238();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No changes in FMIP state. Nothing to be synced to the Watch", buf, 2u);
    }
  }

  uint64_t v28 = +[NRPairedDeviceRegistry sharedInstance];
  v29 = [v28 getPairedDevices];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v73;
    uint64_t v71 = NRDevicePropertyIsPaired;
    uint64_t v70 = NRDevicePropertySystemVersion;
    uint64_t v65 = NRDevicePropertyLocalPairingDataStorePath;
    uint64_t v66 = NRDevicePropertyPairingID;
    uint64_t v67 = *(void *)v73;
    id v68 = v30;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v73 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v36 = [v35 valueForProperty:v71];
        unsigned int v37 = [v36 BOOLValue];

        if (v37)
        {
          v38 = [v35 valueForProperty:v70];
          unsigned int v39 = NRRawVersionFromString();

          id v40 = sub_100004238();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            CFStringRef v79 = (const __CFString *)HIWORD(v39);
            __int16 v80 = 2048;
            uint64_t v81 = 3;
            _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Comparing paired version %ld to %ld", buf, 0x16u);
          }

          if (HIWORD(v39) <= 2u)
          {
            v41 = @"ShowFMWUpgradeAlert";
            if (@"ShowFMWUpgradeAlert")
            {
              id v42 = v41;
              long long v43 = [v35 valueForProperty:v66];
              long long v44 = sub_100004238();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v79 = v43;
                __int16 v80 = 2112;
                uint64_t v81 = @"ShowFMWUpgradeAlert";
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Found old paired device with pairing ID %@. Checking if upgrade alert state needs to be synced for %@...", buf, 0x16u);
              }

              long long v45 = [v35 valueForProperty:v65];
              id v46 = objc_alloc((Class)NPSDomainAccessor);
              id v47 = [v46 initWithDomain:kFMDWatchNotBackedUpPrefDomain pairingID:v43 pairingDataStore:v45];
              id v48 = [v47 synchronize];
              unsigned int v49 = [v47 BOOLForKey:v42];
              id v50 = [v69 objectForKeyedSubscript:@"Enabled"];
              id v51 = [v50 BOOLValue];

              long long v52 = sub_100004238();
              BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
              if (v49 == v51)
              {
                if (v53)
                {
                  CFStringRef v59 = @"Don't Show";
                  if (v51) {
                    CFStringRef v59 = @"Show";
                  }
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v79 = v59;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Upgrade alert state is already in sync : '%@'", buf, 0xCu);
                }
              }
              else
              {
                if (v53)
                {
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v54 = @"Don't Show";
                  if (v51) {
                    CFStringRef v54 = @"Show";
                  }
                  CFStringRef v79 = @"ShowFMWUpgradeAlert";
                  __int16 v80 = 2112;
                  uint64_t v81 = (uint64_t)v54;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Syncing %@ upgrade alert state : '%@'", buf, 0x16u);
                }

                [v47 setBool:v51 forKey:v42];
                id v55 = [v47 synchronize];
                long long v52 = objc_opt_new();
                uint64_t v56 = kFMDWatchNotBackedUpPrefDomain;
                v76 = v42;
                long long v57 = +[NSArray arrayWithObjects:&v76 count:1];
                long long v58 = +[NSSet setWithArray:v57];
                [v52 synchronizeNanoDomain:v56 keys:v58];
              }
              id v30 = v68;

              uint64_t v33 = v67;
            }
          }
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v32);
  }
}

- (void)synchronizeLocalActivationLockState
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052D04;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_enqueueIdentityOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDFMIPServiceProvider *)self fm_logID];
  objc_super v6 = +[NSString stringWithFormat:@"identityOperation-%@", v5];

  uint64_t v7 = +[FMXPCTransactionManager sharedInstance];
  [v7 beginTransaction:v6];

  unint64_t v8 = [(FMDFMIPServiceProvider *)self identity_wait_queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052F00;
  block[3] = &unk_1002D97B0;
  id v12 = v6;
  id v13 = v4;
  id v9 = v6;
  id v10 = v4;
  dispatch_async(v8, block);
}

- (BOOL)_canSendDeviceIdentityNow
{
  if (!+[FMPreferencesUtil BOOLForKey:@"MustBackgroundSettings" inDomain:kFMDNotBackedUpPrefDomain])return 1; {
  id v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  }
  unsigned int v3 = [v2 applicationStateForApplication:@"com.apple.Preferences"];
  [v2 invalidate];
  BOOL v4 = v3 != 8;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10023EED4(v3 != 8, v5);
  }

  return v4;
}

- (void)sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005310C;
  v6[3] = &unk_1002D9238;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(FMDFMIPServiceProvider *)self _enqueueIdentityOperation:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_serialQueue_sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3
{
  id v4 = a3;
  if ([(FMDFMIPServiceProvider *)self isMonitoringPendingDeviceIdentity])
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      objc_super v6 = "Already monitoring for the right time to send a deviceIdentity request.";
      id v7 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v8 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v9 = [v8 allowsActivationLock];

  if ((v9 & 1) == 0)
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v6 = "Not sending a deviceIdentity request because activation lock is not allowed.";
      id v7 = buf;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([(FMDFMIPServiceProvider *)self _canSendDeviceIdentityNow])
  {
    [(FMDFMIPServiceProvider *)self _sendDeviceIdentityNowWithIdentityInfo:v4];
  }
  else
  {
    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot send a deviceIdentity request now. Will wait for the right moment", v11, 2u);
    }

    [(FMDFMIPServiceProvider *)self monitorAndSendDeviceIdentityLaterWithIdentityInfo:v4];
  }
LABEL_11:
}

- (void)monitorAndSendDeviceIdentityLaterWithIdentityInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@"DeviceIdentityPending-%lX", self];
  [(FMDFMIPServiceProvider *)self setDeviceIdentityPendingXpcTransactionName:v5];

  objc_super v6 = +[FMXPCTransactionManager sharedInstance];
  id v7 = [(FMDFMIPServiceProvider *)self deviceIdentityPendingXpcTransactionName];
  [v6 beginTransaction:v7];

  [(FMDFMIPServiceProvider *)self setIsMonitoringPendingDeviceIdentity:1];
  id v8 = objc_alloc((Class)BKSApplicationStateMonitor);
  id v9 = [v8 initWithBundleIDs:&off_1002F2D98 states:BKSApplicationStateAll];
  [(FMDFMIPServiceProvider *)self setPendingDeviceIdentityMonitor:v9];

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100053454;
  v12[3] = &unk_1002DB3D8;
  objc_copyWeak(&v14, &location);
  id v10 = v4;
  id v13 = v10;
  uint64_t v11 = [(FMDFMIPServiceProvider *)self pendingDeviceIdentityMonitor];
  [v11 setHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)stopMonitoringPendingDeviceIdentity
{
  if ([(FMDFMIPServiceProvider *)self isMonitoringPendingDeviceIdentity])
  {
    unsigned int v3 = [(FMDFMIPServiceProvider *)self pendingDeviceIdentityMonitor];

    if (v3)
    {
      id v4 = [(FMDFMIPServiceProvider *)self pendingDeviceIdentityMonitor];
      [v4 invalidate];

      id v5 = [(FMDFMIPServiceProvider *)self pendingDeviceIdentityMonitor];
      [v5 setHandler:0];

      [(FMDFMIPServiceProvider *)self setPendingDeviceIdentityMonitor:0];
    }
    [(FMDFMIPServiceProvider *)self setIsMonitoringPendingDeviceIdentity:0];
  }
}

- (void)checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000536B0;
  v6[3] = &unk_1002D9238;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(FMDFMIPServiceProvider *)self _enqueueIdentityOperation:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_serialQueue_checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FMDFMIPServiceProvider *)self _canSendDeviceIdentityNow];
  if ([(FMDFMIPServiceProvider *)self isMonitoringPendingDeviceIdentity] && v5)
  {
    [(FMDFMIPServiceProvider *)self stopMonitoringPendingDeviceIdentity];
    objc_super v6 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v7 = [v6 allowsActivationLock];

    if (v7)
    {
      [(FMDFMIPServiceProvider *)self _sendDeviceIdentityNowWithIdentityInfo:v4];
    }
    else
    {
      id v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not sending a deviceIdentity request because activation lock is not allowed.", (uint8_t *)&v15, 2u);
      }
    }
    id v13 = +[FMXPCTransactionManager sharedInstance];
    id v14 = [(FMDFMIPServiceProvider *)self deviceIdentityPendingXpcTransactionName];
    [v13 endTransaction:v14];

    [(FMDFMIPServiceProvider *)self setDeviceIdentityPendingXpcTransactionName:0];
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(FMDFMIPServiceProvider *)self isMonitoringPendingDeviceIdentity];
      CFStringRef v10 = @"NO";
      if (v9) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      if (v5) {
        CFStringRef v10 = @"YES";
      }
      int v15 = 138412546;
      CFStringRef v16 = v11;
      __int16 v17 = 2112;
      CFStringRef v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not sending a deviceIdentity request... monitoring:%@, canSend:%@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_buddyCompletionCheckTimerFired:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy completion check timer fired", v7, 2u);
  }

  unsigned int v5 = +[FMDSystemConfig sharedInstance];
  id v6 = [v5 isBuddyDone];

  [(FMDFMIPServiceProvider *)self _checkForBuddyCompletionAndReinitialize:1 withBuddyStatus:v6];
}

- (void)buddyDidComplete:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy completion notification received", v7, 2u);
  }

  unsigned int v5 = +[FMDSystemConfig sharedInstance];
  id v6 = [v5 isBuddyDone];

  [(FMDFMIPServiceProvider *)self _checkForBuddyCompletionAndReinitialize:1 withBuddyStatus:v6];
}

- (void)_fmipStateChangeLocalNotification:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMIPStateChangeLocalNotification received. Will sync state to the watch after %llu seconds", buf, 0xCu);
  }

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  id v6 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053B4C;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_after(v5, v6, block);
}

- (void)systemShutdownSoon:(id)a3
{
  id v4 = [(FMDServiceProvider *)self account];
  unsigned int v5 = [v4 lowBatteryLocateEnabled];

  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_100053D34;
    v15[3] = &unk_1002D9458;
    v15[4] = self;
    id v6 = [[FMDActingRequestDecorator alloc] initWithDeviceContextGenerator:&stru_1002DB3F8 deviceInfoGenerator:v15 serverContextGenerator:0 requestHeaderGenerator:0];
    unsigned __int8 v7 = [QCAction alloc];
    id v8 = [(FMDServiceProvider *)self account];
    uint64_t v9 = [(FMDServiceProvider *)self serverInteractionController];
    CFStringRef v10 = [(QCAction *)v7 initWithAccount:v8 shutdownActivityPending:1 serverInteractionController:v9];

    [(QCAction *)v10 setRequestDecorator:v6];
    CFStringRef v11 = +[ActionManager sharedManager];
    id v12 = [v11 enqueueAction:v10];
  }
  else
  {
    id v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received shutdown soon notification, but ignoring it since low battery locate is disabled", v14, 2u);
    }
  }
}

- (void)locationServiceAuthorizationChanged:(id)a3
{
}

- (void)_deviceDidPair:(id)a3
{
  [(FMDFMIPServiceProvider *)self syncFMIPStateToWatch];

  [(FMDFMIPServiceProvider *)self registerDeviceWithCause:@"deviceDidPair" force:0];
}

- (void)_deviceDidUnpair:(id)a3
{
  [(FMDFMIPServiceProvider *)self registerDeviceWithCause:@"deviceDidUnpair" force:0];
  id v6 = +[FMDCompanionRegistryFactory companionRegistryWithDelegate:0];
  id v4 = [(FMDFMIPServiceProvider *)self unregisterTokenStore];
  unsigned int v5 = [v6 allAccessories];
  [v4 expungeUnregisterTokens:v5];
}

- (void)_activeWatchDidChange
{
}

- (id)_unregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4
{
  if (a4 - 3 < 5) {
    goto LABEL_2;
  }
  if (a4 == 2)
  {
    if ((a3 & 0x200) != 0) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 3;
    }
  }
  else
  {
    if (a4 == 1)
    {
LABEL_2:
      uint64_t v6 = 2 * ((a3 & 0x200) == 0);
      goto LABEL_3;
    }
    uint64_t v6 = 2;
  }
LABEL_3:
  unsigned __int8 v7 = [LocalizedUnregisterErrorKey alloc];
  id v8 = +[FMDSystemConfig sharedInstance];
  uint64_t v9 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:](v7, "initWithUnregisterError:context:deviceClass:", a3, a4, [v8 deviceClass]);

  CFStringRef v10 = [(LocalizedUnregisterErrorKey *)v9 textKey];
  CFStringRef v11 = sub_10002F1A8(v10);
  uint64_t v12 = FMDFMIPManagerUnregisterErrorDomain;
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  __int16 v17 = v11;
  id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v14 = +[NSError errorWithDomain:v12 code:v6 userInfo:v13];

  return v14;
}

- (FMAlert)pendingSecureMessage
{
  return self->_pendingSecureMessage;
}

- (FMAlert)pendingLocateAlert
{
  return self->_pendingLocateAlert;
}

- (FMDDetachNotificationManager)detachNotificationManager
{
  return self->_detachNotificationManager;
}

- (void)setDetachNotificationManager:(id)a3
{
}

- (BOOL)isMonitoringPendingDeviceIdentity
{
  return self->_isMonitoringPendingDeviceIdentity;
}

- (void)setIsMonitoringPendingDeviceIdentity:(BOOL)a3
{
  self->_isMonitoringPendingDeviceIdentity = a3;
}

- (BKSApplicationStateMonitor)pendingDeviceIdentityMonitor
{
  return self->_pendingDeviceIdentityMonitor;
}

- (void)setPendingDeviceIdentityMonitor:(id)a3
{
}

- (NSString)deviceIdentityPendingXpcTransactionName
{
  return self->_deviceIdentityPendingXpcTransactionName;
}

- (void)setDeviceIdentityPendingXpcTransactionName:(id)a3
{
}

- (OS_dispatch_queue)identity_wait_queue
{
  return self->_identity_wait_queue;
}

- (void)setIdentity_wait_queue:(id)a3
{
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (OS_dispatch_queue)device_unlock_actions_queue
{
  return self->_device_unlock_actions_queue;
}

- (void)setDevice_unlock_actions_queue:(id)a3
{
}

- (NSTimer)buddyWaitTimer
{
  return self->_buddyWaitTimer;
}

- (void)setBuddyWaitTimer:(id)a3
{
}

- (BOOL)waitingForBuddy
{
  return self->_waitingForBuddy;
}

- (void)setWaitingForBuddy:(BOOL)a3
{
  self->_waitingForBuddy = a3;
}

- (FMDFMIPNanoIDSListener)idsListener
{
  return self->_idsListener;
}

- (void)setIdsListener:(id)a3
{
}

- (OS_dispatch_queue)authTokenHealingQueue
{
  return self->_authTokenHealingQueue;
}

- (void)setAuthTokenHealingQueue:(id)a3
{
}

- (FMDNanoMigrator)nanoMigrator
{
  return self->_nanoMigrator;
}

- (void)setNanoMigrator:(id)a3
{
}

- (FMDUnregisterTokenStore)unregisterTokenStore
{
  return self->_unregisterTokenStore;
}

- (void)setUnregisterTokenStore:(id)a3
{
}

- (FMDMagSafeSetupLauncher)magSafeSetupLauncher
{
  return self->_magSafeSetupLauncher;
}

- (void)setMagSafeSetupLauncher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magSafeSetupLauncher, 0);
  objc_storeStrong((id *)&self->_unregisterTokenStore, 0);
  objc_storeStrong((id *)&self->_nanoMigrator, 0);
  objc_storeStrong((id *)&self->_authTokenHealingQueue, 0);
  objc_storeStrong((id *)&self->_idsListener, 0);
  objc_storeStrong((id *)&self->_buddyWaitTimer, 0);
  objc_storeStrong((id *)&self->_device_unlock_actions_queue, 0);
  objc_storeStrong((id *)&self->_identity_wait_queue, 0);
  objc_storeStrong((id *)&self->_deviceIdentityPendingXpcTransactionName, 0);
  objc_storeStrong((id *)&self->_pendingDeviceIdentityMonitor, 0);
  objc_storeStrong((id *)&self->_detachNotificationManager, 0);
  objc_storeStrong((id *)&self->_pendingLocateAlert, 0);

  objc_storeStrong((id *)&self->_pendingSecureMessage, 0);
}

@end