@interface COSGlobalAlertPresentationCoordinator
+ (id)sharedInstance;
- (BOOL)appDelegateNotificationsRegistered;
- (BOOL)isPresented;
- (BOOL)isPresenting;
- (BOOL)isRegisteredForNotificationsRelevantToLiveActivities;
- (BOOL)nanoRegistryNotificationsRegistered;
- (BOOL)nanoRegistrySaysDeviceDisconnected;
- (BOOL)pairedSyncSaysSyncActive;
- (BOOL)pairedSyncSaysSyncNeeded;
- (BOOL)pendingSyncProgressForce;
- (BOOL)recordedSyncBeganMetric;
- (COSGlobalAlertPresentationCoordinator)init;
- (NSArray)alertTypeStrings;
- (NSHashTable)observers;
- (NSUUID)activeDeviceID;
- (PSYInitialSyncStateObserver)pairedSyncISSObserver;
- (PSYSyncSessionObserver)progressObserver;
- (double)lastDisplayedSyncProgress;
- (double)pairedSyncProgress;
- (id)stringForAlertType:(unint64_t)a3;
- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (int64_t)activeGlobalAlerts;
- (int64_t)getHighestPriorityGlobalAlert;
- (os_unfair_lock_s)observersLock;
- (unint64_t)alertType;
- (unint64_t)nanoRegistryStatus;
- (unint64_t)readNotifyToken:(int)a3;
- (unint64_t)sessionType;
- (void)_dismissModalAlert:(unint64_t)a3;
- (void)_enumerateAlertPresenterObservers:(id)a3 withCompletion:(id)a4;
- (void)_initialSyncStateObserverClientCanRetryFailedRequests;
- (void)_presentModalAlert:(unint64_t)a3;
- (void)_recordInitialSyncBeganMetricIfNecessary;
- (void)addAlertPresenterObserver:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)reRegisterForNanoRegistryAndPairSyncNotifications;
- (void)registerAppDelegateNotifications;
- (void)registerNanoRegistryNotifications;
- (void)registerPairedSyncNotifications;
- (void)removeAlertPresenterObserver:(id)a3;
- (void)setActiveDeviceID:(id)a3;
- (void)setActiveGlobalAlerts:(int64_t)a3;
- (void)setAlertType:(unint64_t)a3;
- (void)setAlertTypeStrings:(id)a3;
- (void)setAppDelegateNotificationsRegistered:(BOOL)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setLastDisplayedSyncProgress:(double)a3;
- (void)setNanoRegistryNotificationsRegistered:(BOOL)a3;
- (void)setNanoRegistrySaysDeviceDisconnected:(BOOL)a3;
- (void)setNanoRegistryStatus:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setObserversLock:(os_unfair_lock_s)a3;
- (void)setPairedSyncISSObserver:(id)a3;
- (void)setPairedSyncProgress:(double)a3;
- (void)setPairedSyncSaysSyncActive:(BOOL)a3;
- (void)setPairedSyncSaysSyncNeeded:(BOOL)a3;
- (void)setPendingSyncProgressForce:(BOOL)a3;
- (void)setProgressObserver:(id)a3;
- (void)setRecordedSyncBeganMetric:(BOOL)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)supportsMigrationSync;
- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4;
- (void)unregisterAppDelegateNotifications;
- (void)unregisterNanoRegistryNotifications;
- (void)unregisterPairedSyncNotifications;
- (void)update;
- (void)updateActiveDeviceChange;
- (void)updateAlerts;
- (void)updateSyncProgress:(BOOL)a3;
@end

@implementation COSGlobalAlertPresentationCoordinator

- (void)reRegisterForNanoRegistryAndPairSyncNotifications
{
  [(COSGlobalAlertPresentationCoordinator *)self unregisterNanoRegistryNotifications];
  [(COSGlobalAlertPresentationCoordinator *)self unregisterPairedSyncNotifications];
  [(COSGlobalAlertPresentationCoordinator *)self registerPairedSyncNotifications];

  [(COSGlobalAlertPresentationCoordinator *)self registerNanoRegistryNotifications];
}

- (void)applicationDidBecomeActive:(id)a3
{
  v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: applicationDidBecomeActive:", v5, 2u);
  }

  [(COSGlobalAlertPresentationCoordinator *)self reRegisterForNanoRegistryAndPairSyncNotifications];
}

- (void)registerAppDelegateNotifications
{
  if (!self->_appDelegateNotificationsRegistered)
  {
    self->_appDelegateNotificationsRegistered = 1;
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
}

- (COSGlobalAlertPresentationCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSGlobalAlertPresentationCoordinator;
  v2 = [(COSGlobalAlertPresentationCoordinator *)&v10 init];
  if (v2)
  {
    v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: Created %p", buf, 0xCu);
    }

    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v4;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    alertTypeStrings = v2->_alertTypeStrings;
    v2->_alertTypeStrings = (NSArray *)&off_10025BD40;

    v2->_alertType = -1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015F94;
    block[3] = &unk_1002438A0;
    v9 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

- (void)updateActiveDeviceChange
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v4 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  v6 = [v5 firstObject];

  v7 = [v6 valueForProperty:NRDevicePropertyIsArchived];
  LODWORD(v5) = [v7 BOOLValue];

  if (v5)
  {

    v6 = 0;
  }
  if ([v3 compatibilityState] != 3
    && [v3 compatibilityState] != 4
    && [v3 compatibilityState] != 5)
  {

    v6 = 0;
  }
  v8 = [v6 valueForProperty:NRDevicePropertyPairingID];
  if (v8 != self->_activeDeviceID)
  {
    v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      activeDeviceID = self->_activeDeviceID;
      int v11 = 138543618;
      v12 = activeDeviceID;
      __int16 v13 = 2114;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: Paired device changed from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)&self->_activeDeviceID, v8);
    self->_lastDisplayedSyncProgress = 0.0;
    self->_pairedSyncProgress = 0.0;
    self->_pairedSyncSaysSyncActive = 0;
    self->_pairedSyncSaysSyncNeeded = 0;
  }
}

- (void)unregisterNanoRegistryNotifications
{
  if (self->_nanoRegistryNotificationsRegistered)
  {
    self->_nanoRegistryNotificationsRegistered = 0;
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:NRPairedDeviceRegistryStatusDidChange object:0];

    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
  }
}

- (void)addAlertPresenterObserver:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v16 = 134218242;
    NSUInteger v17 = (NSUInteger)v4;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: adding observer %p %@", (uint8_t *)&v16, 0x16u);
  }
  os_unfair_lock_lock(&self->_observersLock);
  [(NSHashTable *)self->_observers addObject:v4];
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v9 = [(NSHashTable *)self->_observers count];
    int v16 = 134217984;
    NSUInteger v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: observers count %ld", (uint8_t *)&v16, 0xCu);
  }

  os_unfair_lock_unlock(&self->_observersLock);
  int64_t v10 = [(COSGlobalAlertPresentationCoordinator *)self getHighestPriorityGlobalAlert];
  if (v10 != -1)
  {
    int64_t v11 = v10;
    if (self->_isPresenting || self->_isPresented) && (objc_opt_respondsToSelector())
    {
      v12 = pbb_bridge_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = [(COSGlobalAlertPresentationCoordinator *)self stringForAlertType:v11];
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        int v16 = 138412802;
        NSUInteger v17 = (NSUInteger)v13;
        __int16 v18 = 2048;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: New observer- requesting display of VC %@ to %p %@", (uint8_t *)&v16, 0x20u);
      }
      [v4 globalAlertPresentationCoordinator:self presentAlert:v11 withCompletion:&stru_100246948];
    }
  }
}

- (void)registerPairedSyncNotifications
{
  if (!self->_pairedSyncISSObserver)
  {
    v3 = (PSYInitialSyncStateObserver *)[objc_alloc((Class)PSYInitialSyncStateObserver) initWithDelegate:self];
    pairedSyncISSObserver = self->_pairedSyncISSObserver;
    self->_pairedSyncISSObserver = v3;

    [(COSGlobalAlertPresentationCoordinator *)self _initialSyncStateObserverClientCanRetryFailedRequests];
  }
  if (!self->_progressObserver)
  {
    id v5 = (PSYSyncSessionObserver *)objc_alloc_init((Class)PSYSyncSessionObserver);
    progressObserver = self->_progressObserver;
    self->_progressObserver = v5;

    [(PSYSyncSessionObserver *)self->_progressObserver setDelegate:self];
    objc_initWeak(&location, self);
    v7 = self->_progressObserver;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000B058;
    v8[3] = &unk_100246928;
    objc_copyWeak(&v9, &location);
    [(PSYSyncSessionObserver *)v7 startObservingSyncSessionsWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_initialSyncStateObserverClientCanRetryFailedRequests
{
  v3 = sub_10000DCF4();
  id v4 = v3;
  if (v3)
  {
    pairedSyncISSObserver = self->_pairedSyncISSObserver;
    v6 = [v3 valueForProperty:NRDevicePropertyPairingID];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000CE214;
    v7[3] = &unk_100243878;
    v7[4] = self;
    [(PSYInitialSyncStateObserver *)pairedSyncISSObserver requestInitialNonMigrationSyncStateForPairingIdentifier:v6 completion:v7];
  }
  else
  {
    [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncNeeded:0];
  }
}

- (void)setPairedSyncSaysSyncNeeded:(BOOL)a3
{
  if (self->_pairedSyncSaysSyncNeeded != a3)
  {
    BOOL v3 = a3;
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: setPairedSyncSaysSyncNeeded: %@", (uint8_t *)&v7, 0xCu);
    }

    self->_pairedSyncSaysSyncNeeded = v3;
    if (!v3)
    {
      if ([(COSGlobalAlertPresentationCoordinator *)self recordedSyncBeganMetric]) {
        [(COSGlobalAlertPresentationCoordinator *)self setRecordedSyncBeganMetric:0];
      }
    }
    [(COSGlobalAlertPresentationCoordinator *)self update];
  }
}

- (void)registerNanoRegistryNotifications
{
  if (!self->_nanoRegistryNotificationsRegistered)
  {
    self->_nanoRegistryNotificationsRegistered = 1;
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    -[COSGlobalAlertPresentationCoordinator setNanoRegistryStatus:](self, "setNanoRegistryStatus:", [v4 status]);

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"update" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    CFStringRef v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"update" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    int v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"update" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    CFStringRef v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"update" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"update" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
  }
}

- (void)setNanoRegistryStatus:(unint64_t)a3
{
  if (self->_nanoRegistryStatus != a3)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: setNanoRegistryStatus: %ld", (uint8_t *)&v6, 0xCu);
    }

    self->_nanoRegistryStatus = a3;
    [(COSGlobalAlertPresentationCoordinator *)self update];
  }
}

- (void)update
{
  [(COSGlobalAlertPresentationCoordinator *)self updateActiveDeviceChange];
  [(COSGlobalAlertPresentationCoordinator *)self updateAlerts];
  int64_t v3 = [(COSGlobalAlertPresentationCoordinator *)self getHighestPriorityGlobalAlert];
  unint64_t v4 = v3;
  unint64_t alertType = self->_alertType;
  if (v3 != -1 && alertType == v3) {
    goto LABEL_17;
  }
  if (self->_isPresented && !self->_isPresenting)
  {
    int v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = [(COSGlobalAlertPresentationCoordinator *)self stringForAlertType:alertType];
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: Dismissing VC %@", buf, 0xCu);
    }
    self->_isPresenting = 1;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000CF07C;
    v13[3] = &unk_100246998;
    v13[4] = self;
    v13[5] = v4;
    v13[6] = alertType;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CF1CC;
    v12[3] = &unk_1002437D0;
    v12[4] = self;
    v12[5] = alertType;
    [(COSGlobalAlertPresentationCoordinator *)self _enumerateAlertPresenterObservers:v13 withCompletion:v12];
  }
  if (v4 != -1)
  {
LABEL_17:
    if (!self->_isPresented && !self->_isPresenting)
    {
      CFStringRef v8 = pbb_bridge_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(COSGlobalAlertPresentationCoordinator *)self stringForAlertType:v4];
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: Displaying VC %@", buf, 0xCu);
      }
      self->_isPresenting = 1;
      self->_unint64_t alertType = v4;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000CF2A4;
      v11[3] = &unk_1002469C0;
      v11[4] = self;
      v11[5] = v4;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000CF3F0;
      v10[3] = &unk_1002437D0;
      v10[4] = self;
      v10[5] = v4;
      [(COSGlobalAlertPresentationCoordinator *)self _enumerateAlertPresenterObservers:v11 withCompletion:v10];
      if (!self->_alertType) {
        [(COSGlobalAlertPresentationCoordinator *)self updateSyncProgress:1];
      }
    }
  }
}

- (void)updateAlerts
{
  self->_nanoRegistrySaysDeviceDisconnected = +[NRConnectivitySubscriber getDropoutCounter:0];
  if ((self->_pairedSyncSaysSyncNeeded || self->_pairedSyncSaysSyncActive) && (PBisInMigrationSync() & 1) == 0) {
    [(COSGlobalAlertPresentationCoordinator *)self _presentModalAlert:0];
  }
  else {
    [(COSGlobalAlertPresentationCoordinator *)self _dismissModalAlert:0];
  }
  unint64_t nanoRegistryStatus = self->_nanoRegistryStatus;
  if (!nanoRegistryStatus || nanoRegistryStatus == 2)
  {
    [(COSGlobalAlertPresentationCoordinator *)self _dismissModalAlert:1];
  }
  else if (nanoRegistryStatus == 5)
  {
    [(COSGlobalAlertPresentationCoordinator *)self _presentModalAlert:1];
  }
}

- (void)unregisterPairedSyncNotifications
{
  [(PSYInitialSyncStateObserver *)self->_pairedSyncISSObserver setDelegate:0];
  pairedSyncISSObserver = self->_pairedSyncISSObserver;
  self->_pairedSyncISSObserver = 0;

  progressObserver = self->_progressObserver;
  self->_progressObserver = 0;
}

- (int64_t)getHighestPriorityGlobalAlert
{
  if ((self->_activeGlobalAlerts & 2) != 0) {
    return 1;
  }
  else {
    return (self->_activeGlobalAlerts & 1) - 1;
  }
}

- (void)_dismissModalAlert:(unint64_t)a3
{
  int64_t activeGlobalAlerts = self->_activeGlobalAlerts;
  int64_t v5 = activeGlobalAlerts & ~(1 << a3);
  if (activeGlobalAlerts != v5)
  {
    self->_int64_t activeGlobalAlerts = v5;
    unint64_t v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = self->_activeGlobalAlerts;
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: _dismissModalAlert:%ld = %x", (uint8_t *)&v9, 0x12u);
    }
  }
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015F5C;
  block[3] = &unk_1002436E0;
  void block[4] = a1;
  if (qword_10029B208 != -1) {
    dispatch_once(&qword_10029B208, block);
  }
  v2 = (void *)qword_10029B200;

  return v2;
}

- (void)dealloc
{
  [(COSGlobalAlertPresentationCoordinator *)self unregisterAppDelegateNotifications];
  [(COSGlobalAlertPresentationCoordinator *)self unregisterNanoRegistryNotifications];
  [(COSGlobalAlertPresentationCoordinator *)self unregisterPairedSyncNotifications];
  v3.receiver = self;
  v3.super_class = (Class)COSGlobalAlertPresentationCoordinator;
  [(COSGlobalAlertPresentationCoordinator *)&v3 dealloc];
}

- (void)unregisterAppDelegateNotifications
{
  if (self->_appDelegateNotificationsRegistered)
  {
    self->_appDelegateNotificationsRegistered = 0;
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

    unint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  }
}

- (BOOL)isRegisteredForNotificationsRelevantToLiveActivities
{
  return self->_nanoRegistryNotificationsRegistered && self->_pairedSyncISSObserver && self->_progressObserver != 0;
}

- (void)applicationWillResignActive:(id)a3
{
  unint64_t v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: applicationWillResignActive:", v5, 2u);
  }

  [(COSGlobalAlertPresentationCoordinator *)self unregisterNanoRegistryNotifications];
  [(COSGlobalAlertPresentationCoordinator *)self unregisterPairedSyncNotifications];
}

- (void)applicationDidEnterBackground:(id)a3
{
  unint64_t v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: applicationDidEnterBackground:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CE158;
  v6[3] = &unk_100245298;
  v6[4] = self;
  objc_copyWeak(&v7, buf);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  int v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v8 = [v6 deviceForPairingID:v5];

  id v7 = [v8 valueForProperty:NRDevicePropertyIsActive];
  if ([v7 BOOLValue]) {
    [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
  }
  [(COSGlobalAlertPresentationCoordinator *)self _initialSyncStateObserverClientCanRetryFailedRequests];
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5 = a4;
  int v6 = [v5 updatedSession];
  id v7 = [v6 syncSessionType];

  if (v7 != (id)1)
  {
    id v8 = [v5 updatedSession];
    [v8 sessionProgress];
    -[COSGlobalAlertPresentationCoordinator setPairedSyncProgress:](self, "setPairedSyncProgress:");

    int v9 = [v5 updatedSession];
    if (v9)
    {
      unint64_t v10 = [v5 updatedSession];
      if ([v10 syncSessionState] == (id)1)
      {
        __int16 v11 = [v5 updatedSession];
        if ([v11 syncSessionType])
        {
          [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
        }
        else
        {
          int v12 = +[NRPairedDeviceRegistry sharedInstance];
          -[COSGlobalAlertPresentationCoordinator setPairedSyncSaysSyncActive:](self, "setPairedSyncSaysSyncActive:", [v12 compatibilityState] == 4);
        }
      }
      else
      {
        [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
      }
    }
    else
    {
      [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
    }

    __int16 v13 = [v5 updatedSession];
    -[COSGlobalAlertPresentationCoordinator setSessionType:](self, "setSessionType:", [v13 syncSessionType]);

    if ([(COSGlobalAlertPresentationCoordinator *)self pairedSyncSaysSyncActive])
    {
      v14 = [v5 updatedSession];
      if ([v14 syncSessionType])
      {
      }
      else
      {
        unsigned __int8 v15 = [(COSGlobalAlertPresentationCoordinator *)self recordedSyncBeganMetric];

        if ((v15 & 1) == 0)
        {
          int v16 = pbb_bridge_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136315138;
            __int16 v18 = "-[COSGlobalAlertPresentationCoordinator syncSessionObserver:didReceiveUpdate:]";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s - initial sync is active and we have not recorded a metric, checking to see if we need to", (uint8_t *)&v17, 0xCu);
          }

          [(COSGlobalAlertPresentationCoordinator *)self _recordInitialSyncBeganMetricIfNecessary];
        }
      }
    }
  }
}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
  id v5 = a4;
  if ([v5 syncSessionType] != (id)1)
  {
    int v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "-[COSGlobalAlertPresentationCoordinator syncSessionObserver:receivedSyncSession:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: (%s)", (uint8_t *)&v8, 0xCu);
    }

    [v5 sessionProgress];
    -[COSGlobalAlertPresentationCoordinator setPairedSyncProgress:](self, "setPairedSyncProgress:");
    if (v5 && [v5 syncSessionState] == (id)1 && objc_msgSend(v5, "syncSessionType") != (id)1)
    {
      id v7 = +[NRPairedDeviceRegistry sharedInstance];
      -[COSGlobalAlertPresentationCoordinator setPairedSyncSaysSyncActive:](self, "setPairedSyncSaysSyncActive:", [v7 compatibilityState] == 4);
    }
    else
    {
      [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
    }
  }
}

- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4
{
  if (objc_msgSend(a4, "syncSessionType", a3) != (id)1)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[COSGlobalAlertPresentationCoordinator syncSessionObserver:didInvalidateSyncSession:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: (%s)", (uint8_t *)&v6, 0xCu);
    }

    [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncProgress:100.0];
    [(COSGlobalAlertPresentationCoordinator *)self setPairedSyncSaysSyncActive:0];
  }
}

- (void)supportsMigrationSync
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "supportsMigrationSync", v3, 2u);
  }
}

- (void)setPairedSyncProgress:(double)a3
{
  if (self->_pairedSyncProgress != a3)
  {
    self->_pairedSyncProgress = a3;
    [(COSGlobalAlertPresentationCoordinator *)self updateSyncProgress:0];
  }
}

- (void)setPairedSyncSaysSyncActive:(BOOL)a3
{
  if (self->_pairedSyncSaysSyncActive != a3)
  {
    BOOL v3 = a3;
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: setPairedSyncSaysSyncActive: %@", (uint8_t *)&v7, 0xCu);
    }

    self->_pairedSyncSaysSyncActive = v3;
    [(COSGlobalAlertPresentationCoordinator *)self update];
  }
}

- (void)_recordInitialSyncBeganMetricIfNecessary
{
  BOOL v3 = [UIApp setupController];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 pairingReportManager];
    CFStringRef v6 = v5;
    if (v5)
    {
      [v5 addPairingTimeEventToPairingReportPlist:69 withValue:&__kCFBooleanTrue withError:0];
      [(COSGlobalAlertPresentationCoordinator *)self setRecordedSyncBeganMetric:1];
    }
  }
  else
  {
    int v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We attempted to record an intial sync metric while out of Setup, will not record anything", v8, 2u);
    }
  }
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  int v7 = a4;
  id v8 = a5;
  int out_token = -1;
  int v9 = (const char *)[a3 UTF8String];
  if (v8) {
    notify_register_dispatch(v9, &out_token, v7, v8);
  }
  else {
    notify_register_check(v9, &out_token);
  }
  int v10 = out_token;

  return v10;
}

- (unint64_t)readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  unint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryStatusKey];

  -[COSGlobalAlertPresentationCoordinator setNanoRegistryStatus:](self, "setNanoRegistryStatus:", [v5 integerValue]);
}

- (void)_presentModalAlert:(unint64_t)a3
{
  int64_t activeGlobalAlerts = self->_activeGlobalAlerts;
  uint64_t v5 = 1 << a3;
  int64_t v6 = activeGlobalAlerts | v5;
  if (activeGlobalAlerts != (activeGlobalAlerts | v5))
  {
    self->_int64_t activeGlobalAlerts = v6;
    int v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      unint64_t v9 = a3;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: _presentModalAlert:%ld = %x", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)removeAlertPresenterObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateAlertPresenterObservers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  unint64_t v9 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v25 = 0;
  id v25 = [v9 count];
  if (v23[3])
  {
    if (v7)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000CEFF4;
      v19[3] = &unk_100246970;
      v21 = &v22;
      id v20 = v7;
      __int16 v10 = objc_retainBlock(v19);
    }
    else
    {
      __int16 v10 = 0;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v15 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          (*((void (**)(id, void, void *))v6 + 2))(v6, *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), v10);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v15 objects:v26 count:16];
      }
      while (v12);
    }
  }
  else if (v7)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
  _Block_object_dispose(&v22, 8);
}

- (id)stringForAlertType:(unint64_t)a3
{
  if (a3 == -1)
  {
    id v5 = @"None";
  }
  else
  {
    id v5 = [(NSArray *)self->_alertTypeStrings objectAtIndexedSubscript:v3];
  }
  return v5;
}

- (void)updateSyncProgress:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(COSGlobalAlertPresentationCoordinator *)self getHighestPriorityGlobalAlert];
  if (v3) {
    self->_pendingSyncProgressForce = 1;
  }
  if (!v5)
  {
    if (self->_pendingSyncProgressForce)
    {
      double pairedSyncProgress = self->_pairedSyncProgress;
    }
    else
    {
      double pairedSyncProgress = self->_pairedSyncProgress;
      if ((int)(self->_lastDisplayedSyncProgress * 100.0) == (int)(pairedSyncProgress * 100.0)) {
        return;
      }
    }
    self->_pendingSyncProgressForce = 0;
    self->_lastDisplayedSyncProgress = pairedSyncProgress;
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = self->_pairedSyncProgress;
      *(_DWORD *)buf = 134217984;
      double v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "COSGlobalAlertPresentationCoordinator: Sync progress update %1.2f", buf, 0xCu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CF628;
    v9[3] = &unk_1002469E8;
    v9[4] = self;
    [(COSGlobalAlertPresentationCoordinator *)self _enumerateAlertPresenterObservers:v9 withCompletion:&stru_100246A08];
  }
}

- (BOOL)pairedSyncSaysSyncNeeded
{
  return self->_pairedSyncSaysSyncNeeded;
}

- (BOOL)nanoRegistrySaysDeviceDisconnected
{
  return self->_nanoRegistrySaysDeviceDisconnected;
}

- (void)setNanoRegistrySaysDeviceDisconnected:(BOOL)a3
{
  self->_nanoRegistrySaysDeviceDisconnected = a3;
}

- (double)pairedSyncProgress
{
  return self->_pairedSyncProgress;
}

- (BOOL)pairedSyncSaysSyncActive
{
  return self->_pairedSyncSaysSyncActive;
}

- (BOOL)recordedSyncBeganMetric
{
  return self->_recordedSyncBeganMetric;
}

- (void)setRecordedSyncBeganMetric:(BOOL)a3
{
  self->_recordedSyncBeganMetric = a3;
}

- (unint64_t)nanoRegistryStatus
{
  return self->_nanoRegistryStatus;
}

- (double)lastDisplayedSyncProgress
{
  return self->_lastDisplayedSyncProgress;
}

- (void)setLastDisplayedSyncProgress:(double)a3
{
  self->_lastDisplayedSyncProgress = a3;
}

- (int64_t)activeGlobalAlerts
{
  return self->_activeGlobalAlerts;
}

- (void)setActiveGlobalAlerts:(int64_t)a3
{
  self->_int64_t activeGlobalAlerts = a3;
}

- (PSYInitialSyncStateObserver)pairedSyncISSObserver
{
  return self->_pairedSyncISSObserver;
}

- (void)setPairedSyncISSObserver:(id)a3
{
}

- (PSYSyncSessionObserver)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_unint64_t alertType = a3;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSArray)alertTypeStrings
{
  return self->_alertTypeStrings;
}

- (void)setAlertTypeStrings:(id)a3
{
}

- (BOOL)appDelegateNotificationsRegistered
{
  return self->_appDelegateNotificationsRegistered;
}

- (void)setAppDelegateNotificationsRegistered:(BOOL)a3
{
  self->_appDelegateNotificationsRegistered = a3;
}

- (BOOL)nanoRegistryNotificationsRegistered
{
  return self->_nanoRegistryNotificationsRegistered;
}

- (void)setNanoRegistryNotificationsRegistered:(BOOL)a3
{
  self->_nanoRegistryNotificationsRegistered = a3;
}

- (BOOL)pendingSyncProgressForce
{
  return self->_pendingSyncProgressForce;
}

- (void)setPendingSyncProgressForce:(BOOL)a3
{
  self->_pendingSyncProgressForce = a3;
}

- (NSUUID)activeDeviceID
{
  return self->_activeDeviceID;
}

- (void)setActiveDeviceID:(id)a3
{
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceID, 0);
  objc_storeStrong((id *)&self->_alertTypeStrings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressObserver, 0);

  objc_storeStrong((id *)&self->_pairedSyncISSObserver, 0);
}

@end