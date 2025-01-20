@interface EPMigrationAutoTrigger
+ (id)newService:(id)a3;
+ (unint64_t)failureTypeWithError:(id)a3;
- (AbstractTimer)nanoRegistryAdvertisingRequestTimer;
- (BOOL)_hasMigrationConsent:(id)a3;
- (BOOL)aWatchWasDiscovered;
- (BOOL)didntHaveTheKey;
- (BOOL)flagsUpdatedForceMigration;
- (BOOL)flagsUpdatedForceMigrationMessage;
- (BOOL)hadAccounts;
- (BOOL)hasMessageTimeIntervalExpired:(double)a3 forCloudIdentifier:(id)a4;
- (BOOL)hasSwitchAssertion;
- (BOOL)isDate:(id)a3 agedMoreThan:(double)a4;
- (BOOL)isUIUnlocked;
- (BOOL)needsSync;
- (BOOL)shortTermFailureLockoutContainsBluetoothIdentifier:(id)a3;
- (BOOL)shouldClearAdvertisingIntervalTimeouts;
- (BOOL)syncStateKnown;
- (BOOL)syncStatePending;
- (BOOL)wasUIUnlocked;
- (BOOL)wasUnlocked;
- (EPDiscoverer)discoverer;
- (EPKey)key;
- (EPKeymaster)keymaster;
- (EPMigrationAutoTrigger)initWithServiceRegistry:(id)a3;
- (EPPhoneMigrator)migrator;
- (EPServiceRegistry)serviceRegistry;
- (NROSTransaction)transaction;
- (NRPreferences)prefs;
- (NRRegistry)registry;
- (NSDate)lastMessageSendDate;
- (NSDate)lastMigrationScanDate;
- (NSDate)shortTermFailureLockoutCreationDate;
- (NSMutableSet)bluetoothIdentifierShortTermFailureLockout;
- (NSUUID)currentDeviceForSyncState;
- (NSUUID)lastActiveDevice;
- (NSUUID)migrationSoftErrorDeviceID;
- (OS_dispatch_source)currentTimer;
- (OS_dispatch_source)migrationSoftErrorAlertDelayTimer;
- (PSYInitialSyncStateObserver)syncObserver;
- (id)_cloudIdentifierForDevice:(id)a3;
- (id)cloud;
- (id)shortTermFailureLockoutFilterBluetoothIdentifiers:(id)a3;
- (int)keybagNotifyToken;
- (int)uiUnlockNotifyToken;
- (void)addBluetoothIdentifierToShortTermFailureLockout:(id)a3;
- (void)assertionFactoryDidBecomeIdle:(id)a3;
- (void)calculateNextMessageSendIntervalWithCompletion:(id)a3;
- (void)cancelMigrationSoftErrorAlertDelayTimerWithDeviceID:(id)a3;
- (void)cancelTimer;
- (void)checkAssertionFactoryForAssertion;
- (void)checkIfShouldRetryMigrationWhenIDSDevicesChange;
- (void)dealloc;
- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3;
- (void)isDevice:(id)a3 readyToMigrate:(id)a4;
- (void)nanoRegistryAdvertisingRequestTimeout;
- (void)queryDeviceSyncStatusIfNeeded;
- (void)registerForNotifications;
- (void)resetAllMessageSendTimersWithCompletion:(id)a3;
- (void)sendMessageToAvailableWatchesWithInterval:(double)a3 completion:(id)a4;
- (void)sendMessageToWatchWithRawCloudIdentifiers:(id)a3;
- (void)setAWatchWasDiscovered:(BOOL)a3;
- (void)setBluetoothIdentifierShortTermFailureLockout:(id)a3;
- (void)setCurrentDeviceForSyncState:(id)a3;
- (void)setCurrentTimer:(id)a3;
- (void)setDidntHaveTheKey:(BOOL)a3;
- (void)setDiscoverer:(id)a3;
- (void)setFlagsUpdatedForceMigration:(BOOL)a3;
- (void)setFlagsUpdatedForceMigrationMessage:(BOOL)a3;
- (void)setHadAccounts:(BOOL)a3;
- (void)setHasSwitchAssertion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeybagNotifyToken:(int)a3;
- (void)setLastActiveDevice:(id)a3;
- (void)setLastMessageSendDate:(id)a3;
- (void)setLastMessageSendDate:(id)a3 forRawCloudIdentifiers:(id)a4;
- (void)setLastMigrationScanDate:(id)a3;
- (void)setMigrationSoftErrorAlertDelayTimer:(double)a3 deviceID:(id)a4 withBlock:(id)a5;
- (void)setMigrationSoftErrorAlertDelayTimer:(id)a3;
- (void)setMigrationSoftErrorDeviceID:(id)a3;
- (void)setNanoRegistryAdvertisingRequestTimer:(id)a3;
- (void)setNeedsSync:(BOOL)a3;
- (void)setPrefs:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setShortTermFailureLockoutCreationDate:(id)a3;
- (void)setShouldClearAdvertisingIntervalTimeouts:(BOOL)a3;
- (void)setSyncObserver:(id)a3;
- (void)setSyncStateKnown:(BOOL)a3;
- (void)setSyncStatePending:(BOOL)a3;
- (void)setTimerDuration:(double)a3 withBlock:(id)a4;
- (void)setTransaction:(id)a3;
- (void)setUiUnlockNotifyToken:(int)a3;
- (void)setWasUIUnlocked:(BOOL)a3;
- (void)setWasUnlocked:(BOOL)a3;
- (void)startMigrationAfterTimeout:(double)a3;
- (void)startMigrationOnMRUIfWatchWasFoundWithCompletion:(id)a3;
- (void)startWatchScanWithCompletion:(id)a3;
- (void)unregisterForNotifications;
- (void)update;
@end

@implementation EPMigrationAutoTrigger

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (EPPhoneMigrator)migrator
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (EPPhoneMigrator *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (NRRegistry)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (NRRegistry *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)cloud
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (EPKeymaster)keymaster
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (EPKeymaster *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (EPMigrationAutoTrigger)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a3);
  v6 = [(EPMigrationAutoTrigger *)self init];
  if (v6)
  {
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: Init", (uint8_t *)buf, 2u);
      }
    }
    v10 = [[NRPreferences alloc] initWithDomain:@"com.apple.nanoregistryd"];
    prefs = v6->_prefs;
    v6->_prefs = v10;

    *(void *)&v6->_uiUnlockNotifyToken = -1;
    uint64_t v12 = +[NSMutableSet set];
    bluetoothIdentifierShortTermFailureLockout = v6->_bluetoothIdentifierShortTermFailureLockout;
    v6->_bluetoothIdentifierShortTermFailureLockout = (NSMutableSet *)v12;

    objc_initWeak(buf, v6);
    v14 = [(EPMigrationAutoTrigger *)v6 registry];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100074408;
    v23[3] = &unk_100167FA0;
    objc_copyWeak(&v25, buf);
    v15 = v6;
    v24 = v15;
    id v16 = [v14 addDiffObserverWithWriteBlock:v23];

    v17 = (PSYInitialSyncStateObserver *)[objc_alloc((Class)PSYInitialSyncStateObserver) initWithDelegate:v15];
    syncObserver = v15->_syncObserver;
    v15->_syncObserver = v17;

    [(EPMigrationAutoTrigger *)v15 queryDeviceSyncStatusIfNeeded];
    v19 = +[NRQueue registryDaemonQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000748FC;
    v21[3] = &unk_1001655F8;
    v22 = v15;
    [v19 dispatchAsync:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);
  }

  return v6;
}

- (void)checkAssertionFactoryForAssertion
{
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[EPMigrationAutoTrigger checkAssertionFactoryForAssertion]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: %s", (uint8_t *)&v8, 0xCu);
    }
  }
  v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v7 = [v6 assertions];
  self->_hasSwitchAssertion = [v7 count] != 0;
}

- (void)assertionFactoryDidBecomeIdle:(id)a3
{
  BOOL v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[EPMigrationAutoTrigger assertionFactoryDidBecomeIdle:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: %s", (uint8_t *)&v7, 0xCu);
    }
  }
  self->_hasSwitchAssertion = 0;
  [(EPMigrationAutoTrigger *)self update];
}

- (void)queryDeviceSyncStatusIfNeeded
{
  uint64_t v3 = [(EPMigrationAutoTrigger *)self registry];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100074BBC;
  v4[3] = &unk_1001658B8;
  v4[4] = self;
  [v3 grabRegistryWithReadBlock:v4];
}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  BOOL v4 = +[NRQueue registryDaemonQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100075160;
  v5[3] = &unk_1001655F8;
  v5[4] = self;
  [v4 dispatchAsync:v5];
}

- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[NRQueue registryDaemonQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000752B4;
  v8[3] = &unk_100165530;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 dispatchAsync:v8];
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[NRQueue registryDaemonQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100075424;
  v8[3] = &unk_100165530;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 dispatchAsync:v8];
}

- (void)addBluetoothIdentifierToShortTermFailureLockout:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_shortTermFailureLockoutCreationDate)
  {
    id v5 = +[NSDate date];
    shortTermFailureLockoutCreationDate = self->_shortTermFailureLockoutCreationDate;
    self->_shortTermFailureLockoutCreationDate = v5;

    id v4 = v7;
  }
  [(NSMutableSet *)self->_bluetoothIdentifierShortTermFailureLockout addObject:v4];
}

- (BOOL)shortTermFailureLockoutContainsBluetoothIdentifier:(id)a3
{
  id v4 = a3;
  [(NSDate *)self->_shortTermFailureLockoutCreationDate timeIntervalSinceNow];
  if (v5 > 300.0
    || ([(NSDate *)self->_shortTermFailureLockoutCreationDate timeIntervalSinceNow], v6 < -300.0))
  {
    shortTermFailureLockoutCreationDate = self->_shortTermFailureLockoutCreationDate;
    self->_shortTermFailureLockoutCreationDate = 0;

    [(NSMutableSet *)self->_bluetoothIdentifierShortTermFailureLockout removeAllObjects];
  }
  unsigned __int8 v8 = [(NSMutableSet *)self->_bluetoothIdentifierShortTermFailureLockout containsObject:v4];

  return v8;
}

- (id)shortTermFailureLockoutFilterBluetoothIdentifiers:(id)a3
{
  id v4 = a3;
  [(NSDate *)self->_shortTermFailureLockoutCreationDate timeIntervalSinceNow];
  if (v5 > 300.0
    || ([(NSDate *)self->_shortTermFailureLockoutCreationDate timeIntervalSinceNow], v6 < -300.0))
  {
    shortTermFailureLockoutCreationDate = self->_shortTermFailureLockoutCreationDate;
    self->_shortTermFailureLockoutCreationDate = 0;

    [(NSMutableSet *)self->_bluetoothIdentifierShortTermFailureLockout removeAllObjects];
  }
  id v8 = [v4 mutableCopy];
  [v8 minusSet:self->_bluetoothIdentifierShortTermFailureLockout];

  return v8;
}

- (BOOL)_hasMigrationConsent:(id)a3
{
  id v4 = a3;
  double v5 = [(EPMigrationAutoTrigger *)self registry];
  double v6 = [v5 collection];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v7 objectForKeyedSubscript:NRDevicePropertyMigrationConsent];
  id v9 = [v8 value];

  v10 = [v7 objectForKeyedSubscript:NRDevicePropertyMigrationConsentDate];
  v11 = [v10 value];

  if ([v9 BOOLValue]) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    BOOL v13 = 0;
  }
  else
  {
    [v11 timeIntervalSinceNow];
    BOOL v13 = v14 >= -86400.0 && v14 <= 0.0;
  }

  return v13;
}

- (void)registerForNotifications
{
  p_uiUnlockNotifyToken = &self->_uiUnlockNotifyToken;
  if (self->_uiUnlockNotifyToken == -1)
  {
    id v4 = +[NRQueue registryDaemonQueue];
    double v5 = [v4 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000759BC;
    handler[3] = &unk_100165958;
    handler[4] = self;
    uint32_t v6 = notify_register_dispatch("com.apple.springboard.lockstate", p_uiUnlockNotifyToken, v5, handler);

    if (v6)
    {
      id v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (v8)
      {
        id v9 = nr_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000F9B98();
        }
      }
    }
  }
  if (self->_keybagNotifyToken == -1)
  {
    v10 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v11 = +[NRQueue registryDaemonQueue];
    BOOL v12 = [v11 queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100075A58;
    v17[3] = &unk_100165958;
    v17[4] = self;
    uint32_t v13 = notify_register_dispatch(v10, &self->_keybagNotifyToken, v12, v17);

    if (v13)
    {
      double v14 = nr_daemon_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        id v16 = nr_daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000F9B30();
        }
      }
    }
  }
}

- (void)unregisterForNotifications
{
  int uiUnlockNotifyToken = self->_uiUnlockNotifyToken;
  if (uiUnlockNotifyToken != -1)
  {
    notify_cancel(uiUnlockNotifyToken);
    self->_int uiUnlockNotifyToken = -1;
  }
  int keybagNotifyToken = self->_keybagNotifyToken;
  if (keybagNotifyToken != -1)
  {
    notify_cancel(keybagNotifyToken);
    self->_int keybagNotifyToken = -1;
  }
}

- (BOOL)isUIUnlocked
{
  uint64_t state64 = 0;
  int uiUnlockNotifyToken = self->_uiUnlockNotifyToken;
  if (uiUnlockNotifyToken != -1)
  {
    if (notify_get_state(uiUnlockNotifyToken, &state64))
    {
      uint64_t v3 = nr_daemon_log();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (v4)
      {
        double v5 = nr_daemon_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1000F9C00();
        }
      }
    }
  }
  return state64 == 0;
}

- (void)dealloc
{
  [(EPMigrationAutoTrigger *)self unregisterForNotifications];
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_100167FE8);
  v3.receiver = self;
  v3.super_class = (Class)EPMigrationAutoTrigger;
  [(EPMigrationAutoTrigger *)&v3 dealloc];
}

- (BOOL)isDate:(id)a3 agedMoreThan:(double)a4
{
  id v5 = a3;
  uint32_t v6 = v5;
  if (v5 && ([v5 timeIntervalSinceNow], -v7 <= a4))
  {
    [v6 timeIntervalSinceNow];
    BOOL v8 = v9 > 0.0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)nanoRegistryAdvertisingRequestTimeout
{
  objc_super v3 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075D40;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)update
{
  BOOL v3 = [(EPMigrationAutoTrigger *)self isUIUnlocked];
  BOOL v4 = v3;
  BOOL v5 = v3 && !self->_wasUIUnlocked;
  self->_wasUIUnlocked = v3;
  CFStringRef v29 = @"ExtendedDeviceLockState";
  v30 = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  unsigned int v6 = MKBGetDeviceLockState();
  if (v6 > 7 || ((1 << v6) & 0xC1) == 0)
  {
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = !self->_wasUnlocked;
    BOOL v9 = 1;
  }
  self->_wasUnlocked = v9;
  v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  unsigned int v11 = [v10 hasAccounts];
  char v12 = v11;
  if (v11) {
    BOOL v13 = !self->_hadAccounts;
  }
  else {
    BOOL v13 = 0;
  }
  if (MKBDeviceUnlockedSinceBoot() && self->_shouldClearAdvertisingIntervalTimeouts)
  {
    BOOL v19 = v5;
    double v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: clearing advertising interval timeouts", buf, 2u);
      }
    }
    self->_shouldClearAdvertisingIntervalTimeouts = 0;
    [(EPMigrationAutoTrigger *)self resetAllMessageSendTimersWithCompletion:0];
    BOOL v5 = v19;
  }
  BOOL v17 = v6 == 3;
  v18 = [(EPMigrationAutoTrigger *)self migrator];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100076094;
  v20[3] = &unk_100168088;
  v20[4] = self;
  BOOL v21 = v9;
  BOOL v22 = v17;
  BOOL v23 = v4;
  char v24 = v12;
  BOOL v25 = v13;
  BOOL v26 = v5;
  BOOL v27 = v8;
  [v18 getNonAltAccountMigratableDeviceIDsWithBlock:v20];
}

- (void)setShouldClearAdvertisingIntervalTimeouts:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    double v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = "NO";
      if (v3) {
        BOOL v8 = "YES";
      }
      int v9 = 136315138;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: setShouldClearAdvertisingIntervalTimeouts:%s", (uint8_t *)&v9, 0xCu);
    }
  }
  self->_shouldClearAdvertisingIntervalTimeouts = v3;
  [(EPMigrationAutoTrigger *)self update];
}

- (void)checkIfShouldRetryMigrationWhenIDSDevicesChange
{
  self->_flagsUpdatedForceMigration = 1;
  [(EPMigrationAutoTrigger *)self update];
}

- (void)setTimerDuration:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    BOOL v8 = self->_currentTimer;
    self->_currentTimer = 0;
  }
  if (v6)
  {
    int v9 = +[EPFactory queue];
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100076EFC;
    v14[3] = &unk_100166210;
    v14[4] = self;
    id v15 = v6;
    dispatch_source_set_event_handler(v10, v14);
    dispatch_resume(v10);
    char v12 = self->_currentTimer;
    self->_currentTimer = (OS_dispatch_source *)v10;
    BOOL v13 = v10;
  }
}

- (void)cancelTimer
{
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    BOOL v4 = self->_currentTimer;
    self->_currentTimer = 0;
  }
}

- (void)cancelMigrationSoftErrorAlertDelayTimerWithDeviceID:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    double v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v4 UUIDString];
      int v15 = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: cancelMigrationSoftErrorAlertDelayTimerWithDeviceID for %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (!v4 || [v4 isEqual:self->_migrationSoftErrorDeviceID])
  {
    migrationSoftErrorAlertDelayTimer = self->_migrationSoftErrorAlertDelayTimer;
    if (migrationSoftErrorAlertDelayTimer)
    {
      dispatch_source_cancel(migrationSoftErrorAlertDelayTimer);
      migrationSoftErrorDeviceID = self->_migrationSoftErrorDeviceID;
      self->_migrationSoftErrorDeviceID = 0;
    }
    dispatch_time_t v11 = +[NRRepeatingAlertEngine sharedInstance];
    [v11 resetStateForAlertWithName:@"MigrationFailed"];

    char v12 = +[NRRepeatingAlertEngine sharedInstance];
    [v12 setEnabled:0 withName:@"MigrationFailed"];

    if (!v4)
    {
      BOOL v13 = +[NRRepeatingAlertEngine sharedInstance];
      [v13 resetStateForAlertWithName:@"MigrationFailedPermanentlyForThisWatch"];

      double v14 = +[NRRepeatingAlertEngine sharedInstance];
      [v14 setEnabled:0 withName:@"MigrationFailedPermanentlyForThisWatch"];
    }
  }
}

- (void)setMigrationSoftErrorAlertDelayTimer:(double)a3 deviceID:(id)a4 withBlock:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(EPMigrationAutoTrigger *)self cancelMigrationSoftErrorAlertDelayTimerWithDeviceID:0];
  dispatch_time_t v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    BOOL v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [v9 UUIDString];
      *(_DWORD *)buf = 134218242;
      double v30 = a3;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: Setting migration soft error alert delay timer timeout to %1.1f for device %@", buf, 0x16u);
    }
  }
  if (v10)
  {
    int v15 = +[NRQueue registryDaemonQueue];
    id v16 = [v15 queue];
    BOOL v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v16);

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000773FC;
    handler[3] = &unk_100166838;
    handler[4] = self;
    id v19 = v9;
    id v27 = v19;
    id v20 = v10;
    id v28 = v20;
    dispatch_source_set_event_handler(v17, handler);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100077500;
    v23[3] = &unk_100166838;
    void v23[4] = self;
    id v24 = v19;
    id v25 = v20;
    dispatch_source_set_cancel_handler(v17, v23);
    migrationSoftErrorAlertDelayTimer = self->_migrationSoftErrorAlertDelayTimer;
    self->_migrationSoftErrorAlertDelayTimer = (OS_dispatch_source *)v17;
    BOOL v22 = v17;

    objc_storeStrong((id *)&self->_migrationSoftErrorDeviceID, a4);
    dispatch_resume(v22);
  }
}

- (void)startWatchScanWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_discoverer)
  {
    id v5 = +[NRQueue registryDaemonQueue];
    [v5 dispatchAsync:v4];
  }
  else
  {
    BOOL v6 = +[NSMutableArray array];
    double v7 = [(EPMigrationAutoTrigger *)self migrator];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100077708;
    v8[3] = &unk_1001680B0;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v4;
    id v5 = v6;
    [v7 getNonAltAccountMigratableDeviceIDsWithBlock:v8];
  }
}

- (void)sendMessageToAvailableWatchesWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = [(EPMigrationAutoTrigger *)self migrator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100077B9C;
  v9[3] = &unk_100168100;
  double v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getNonAltAccountMigratableDeviceIDsWithBlock:v9];
}

- (id)_cloudIdentifierForDevice:(id)a3
{
  uint64_t v4 = _NRDevicePropertyMigrationIDSCloudIdentifier;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  double v7 = [v6 value];

  id v8 = [(EPMigrationAutoTrigger *)self registry];
  id v9 = [v8 secureProperties];
  id v10 = [v9 objectForKeyedSubscript:v7];

  double v11 = [v5 objectForKeyedSubscript:NRDevicePropertyPairingID];
  BOOL v12 = [v11 value];

  BOOL v13 = [v5 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];

  double v14 = [v13 value];

  int v15 = sub_1000A3CF0();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    BOOL v17 = sub_1000A3CF0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v18 = [v12 UUIDString];
      id v19 = [v14 UUIDString];
      int v21 = 138412802;
      BOOL v22 = v18;
      __int16 v23 = 2112;
      id v24 = v19;
      __int16 v25 = 2112;
      BOOL v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "cloudIdentifierForDevice(pairingID=%@) btID=%@ IDSID=%@", (uint8_t *)&v21, 0x20u);
    }
  }

  return v10;
}

- (void)setLastMessageSendDate:(id)a3 forRawCloudIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000A3CF0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = sub_1000A3CF0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setLastMessageSendDate: %@ for %@", buf, 0x16u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = +[NSString stringWithFormat:@"%@.%@", @"lastAdvertisingNotificationDate", *(void *)(*((void *)&v18 + 1) + 8 * (void)v14)];
        if (v6)
        {
          [v6 timeIntervalSinceReferenceDate];
          BOOL v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [(NRPreferences *)self->_prefs setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          [(NRPreferences *)self->_prefs setObject:0 forKeyedSubscript:v15];
        }

        double v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(NRPreferences *)self->_prefs synchronize];
}

- (void)resetAllMessageSendTimersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(EPMigrationAutoTrigger *)self migrator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000784E4;
  v7[3] = &unk_100168128;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getNonAltAccountMigratableDeviceIDsWithBlock:v7];
}

- (void)calculateNextMessageSendIntervalWithCompletion:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0xBFF0000000000000;
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  id v8 = [(EPMigrationAutoTrigger *)self migrator];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000788C8;
  v10[3] = &unk_100168178;
  uint64_t v13 = v7;
  v10[4] = self;
  id v12 = v14;
  id v9 = v4;
  id v11 = v9;
  [v8 getNonAltAccountMigratableDeviceIDsWithBlock:v10];

  _Block_object_dispose(v14, 8);
}

- (BOOL)hasMessageTimeIntervalExpired:(double)a3 forCloudIdentifier:(id)a4
{
  id v5 = +[NSString stringWithFormat:@"%@.%@", a3, @"lastAdvertisingNotificationDate", a4];
  uint64_t v6 = [(NRPreferences *)self->_prefs objectForKeyedSubscript:v5];
  uint64_t v7 = +[NSDate date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  BOOL v12 = 1;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v11 = v9 - v10;
      if (v11 < 86400.0 && v11 > 0.0) {
        BOOL v12 = 0;
      }
    }
  }

  return v12;
}

- (void)sendMessageToWatchWithRawCloudIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [(EPMigrationAutoTrigger *)self cloud];
  uint64_t v7 = [v6 deviceUniqueIdentifiers];

  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if ([v4 containsObject:v11]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      double v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending migration advertising request to devices: %@", buf, 0xCu);
      }
    }
    objc_initWeak((id *)buf, self);
    int v15 = [(EPMigrationAutoTrigger *)self cloud];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10007915C;
    v34[3] = &unk_100165980;
    v34[4] = self;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100079174;
    v31[3] = &unk_1001681A0;
    objc_copyWeak(&v33, (id *)buf);
    v31[4] = self;
    id v32 = v5;
    [v15 sendMigrationRequestToDestinations:v32 shouldCancel:0 withSentBlock:v34 withResponseBlock:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  else if ([v4 count])
  {
    BOOL v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      long long v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000F9D88();
      }
    }
    long long v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      long long v21 = nr_daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000F9CD4(self, v21);
      }
    }
    BOOL v22 = nr_daemon_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      id v24 = nr_daemon_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000F9C68((uint64_t)v4, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
}

+ (unint64_t)failureTypeWithError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing"])
    {
      id v6 = [v4 code];

      if (v6 == (id)9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v8 = [v4 domain];
    if ([v8 isEqualToString:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing"])
    {
      id v9 = [v4 code];

      if (v9 == (id)10)
      {
LABEL_9:
        unint64_t v7 = 1;
        goto LABEL_20;
      }
    }
    else
    {
    }
    double v10 = [v4 domain];
    if ([v10 isEqualToString:CBATTErrorDomain])
    {
      id v11 = [v4 code];

      if (v11 != (id)3)
      {
        unint64_t v7 = 2;
        goto LABEL_20;
      }
    }
    else
    {
    }
    BOOL v12 = [v4 domain];
    unsigned __int8 v13 = [v12 isEqualToString:@"com.apple.nanoregistry.saga.EPSagaTransactionPairIDSDevice"];

    if (v13)
    {
      unint64_t v7 = 3;
    }
    else
    {
      double v14 = [v4 domain];
      unsigned int v15 = [v14 isEqualToString:@"com.apple.nanoregistry.EPMigrationAutoTrigger"];

      if (v15) {
        unint64_t v7 = 4;
      }
      else {
        unint64_t v7 = 2;
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
LABEL_20:

  return v7;
}

- (void)startMigrationOnMRUIfWatchWasFoundWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(EPDiscoverer *)self->_discoverer displayableDevices];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) uuid];
        [v5 addObject:v11];

        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  BOOL v12 = [(EPMigrationAutoTrigger *)self migrator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079554;
  v15[3] = &unk_1001680B0;
  id v16 = v5;
  BOOL v17 = self;
  id v18 = v4;
  id v13 = v4;
  id v14 = v5;
  [v12 getNonAltAccountMigratableDeviceIDsWithBlock:v15];
}

- (void)startMigrationAfterTimeout:(double)a3
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007A428;
  v5[3] = &unk_1001654B8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(EPMigrationAutoTrigger *)self setTimerDuration:v5 withBlock:a3];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4
{
  if (!self->_aWatchWasDiscovered)
  {
    self->_aWatchWasDiscovered = 1;
    id v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPMigrationAutoTrigger: A watch was discovered", v9, 2u);
      }
    }
    [(EPMigrationAutoTrigger *)self startMigrationOnMRUIfWatchWasFoundWithCompletion:0];
    discoverer = self->_discoverer;
    self->_discoverer = 0;
  }
}

- (void)isDevice:(id)a3 readyToMigrate:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    double v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 UUIDString];
      *(_DWORD *)buf = 136315394;
      long long v38 = "-[EPMigrationAutoTrigger isDevice:readyToMigrate:]";
      __int16 v39 = 2114;
      CFStringRef v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  unsigned int v13 = [v12 idle];
  id v14 = [v12 currentTransactionPairingId];
  unsigned int v15 = nr_daemon_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    BOOL v17 = nr_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v18 = @"NO";
      long long v38 = "-[EPMigrationAutoTrigger isDevice:readyToMigrate:]";
      *(_DWORD *)buf = 136315650;
      if (v13) {
        CFStringRef v18 = @"YES";
      }
      __int16 v39 = 2114;
      CFStringRef v40 = v18;
      __int16 v41 = 2112;
      v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Is coordinator idle (%{public}@); Current Transaction Pairing Id (%@)",
        buf,
        0x20u);
    }
  }
  if (v14) {
    char v19 = v13;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0
    && [v12 isCurrentRunningTransactionOfType:@"migration"]
    && [v6 isEqual:v14])
  {
    long long v20 = nr_daemon_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      long long v22 = nr_daemon_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v23 = [v6 UUIDString];
        *(_DWORD *)buf = 136315394;
        long long v38 = "-[EPMigrationAutoTrigger isDevice:readyToMigrate:]";
        __int16 v39 = 2114;
        CFStringRef v40 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ NO- NanoRegistry has queued or running transactions for migrating this device. Not starting a new one.", buf, 0x16u);
      }
    }
    v7[2](v7, 5);
    goto LABEL_36;
  }
  if (v13)
  {
LABEL_30:
    uint64_t v28 = [(EPMigrationAutoTrigger *)self registry];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10007AAD0;
    v33[3] = &unk_100167398;
    id v34 = v6;
    long long v35 = self;
    long long v36 = v7;
    [v28 grabRegistryWithReadBlock:v33];

    goto LABEL_36;
  }
  if ([v12 isCurrentRunningTransactionOfType:@"reunionSync"])
  {
    if ([v12 isCurrentRunningTransactionOfType:@"reunionSync"])
    {
      id v24 = nr_daemon_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        uint64_t v26 = nr_daemon_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [v6 UUIDString];
          *(_DWORD *)buf = 136315650;
          long long v38 = "-[EPMigrationAutoTrigger isDevice:readyToMigrate:]";
          __int16 v39 = 2114;
          CFStringRef v40 = v27;
          __int16 v41 = 2114;
          v42 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ Current running transaction is of type reunion sync for %{public}@. Canceling it.", buf, 0x20u);
        }
      }
      [v12 cancelWithOperationType:@"reunionSync" error:0];
    }
    goto LABEL_30;
  }
  uint64_t v29 = nr_daemon_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    __int16 v31 = nr_daemon_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v6 UUIDString];
      *(_DWORD *)buf = 136315394;
      long long v38 = "-[EPMigrationAutoTrigger isDevice:readyToMigrate:]";
      __int16 v39 = 2114;
      CFStringRef v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ NO- NanoRegistry has queued or running transactions.", buf, 0x16u);
    }
  }
  v7[2](v7, 3);
LABEL_36:
}

- (NROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)wasUIUnlocked
{
  return self->_wasUIUnlocked;
}

- (void)setWasUIUnlocked:(BOOL)a3
{
  self->_wasUIUnlocked = a3;
}

- (BOOL)hadAccounts
{
  return self->_hadAccounts;
}

- (void)setHadAccounts:(BOOL)a3
{
  self->_hadAccounts = a3;
}

- (BOOL)wasUnlocked
{
  return self->_wasUnlocked;
}

- (void)setWasUnlocked:(BOOL)a3
{
  self->_wasUnlocked = a3;
}

- (BOOL)didntHaveTheKey
{
  return self->_didntHaveTheKey;
}

- (void)setDidntHaveTheKey:(BOOL)a3
{
  self->_didntHaveTheKey = a3;
}

- (BOOL)aWatchWasDiscovered
{
  return self->_aWatchWasDiscovered;
}

- (void)setAWatchWasDiscovered:(BOOL)a3
{
  self->_aWatchWasDiscovered = a3;
}

- (int)uiUnlockNotifyToken
{
  return self->_uiUnlockNotifyToken;
}

- (void)setUiUnlockNotifyToken:(int)a3
{
  self->_int uiUnlockNotifyToken = a3;
}

- (int)keybagNotifyToken
{
  return self->_keybagNotifyToken;
}

- (void)setKeybagNotifyToken:(int)a3
{
  self->_int keybagNotifyToken = a3;
}

- (OS_dispatch_source)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
}

- (EPDiscoverer)discoverer
{
  return self->_discoverer;
}

- (void)setDiscoverer:(id)a3
{
}

- (NSDate)lastMessageSendDate
{
  return self->_lastMessageSendDate;
}

- (void)setLastMessageSendDate:(id)a3
{
}

- (NSDate)lastMigrationScanDate
{
  return self->_lastMigrationScanDate;
}

- (void)setLastMigrationScanDate:(id)a3
{
}

- (BOOL)flagsUpdatedForceMigration
{
  return self->_flagsUpdatedForceMigration;
}

- (void)setFlagsUpdatedForceMigration:(BOOL)a3
{
  self->_flagsUpdatedForceMigration = a3;
}

- (BOOL)flagsUpdatedForceMigrationMessage
{
  return self->_flagsUpdatedForceMigrationMessage;
}

- (void)setFlagsUpdatedForceMigrationMessage:(BOOL)a3
{
  self->_flagsUpdatedForceMigrationMessage = a3;
}

- (NRPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(id)a3
{
}

- (AbstractTimer)nanoRegistryAdvertisingRequestTimer
{
  return self->_nanoRegistryAdvertisingRequestTimer;
}

- (void)setNanoRegistryAdvertisingRequestTimer:(id)a3
{
}

- (BOOL)shouldClearAdvertisingIntervalTimeouts
{
  return self->_shouldClearAdvertisingIntervalTimeouts;
}

- (EPKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)hasSwitchAssertion
{
  return self->_hasSwitchAssertion;
}

- (void)setHasSwitchAssertion:(BOOL)a3
{
  self->_hasSwitchAssertion = a3;
}

- (NSUUID)currentDeviceForSyncState
{
  return self->_currentDeviceForSyncState;
}

- (void)setCurrentDeviceForSyncState:(id)a3
{
}

- (PSYInitialSyncStateObserver)syncObserver
{
  return self->_syncObserver;
}

- (void)setSyncObserver:(id)a3
{
}

- (BOOL)needsSync
{
  return self->_needsSync;
}

- (void)setNeedsSync:(BOOL)a3
{
  self->_needsSync = a3;
}

- (BOOL)syncStateKnown
{
  return self->_syncStateKnown;
}

- (void)setSyncStateKnown:(BOOL)a3
{
  self->_syncStateKnown = a3;
}

- (BOOL)syncStatePending
{
  return self->_syncStatePending;
}

- (void)setSyncStatePending:(BOOL)a3
{
  self->_syncStatePending = a3;
}

- (NSUUID)lastActiveDevice
{
  return self->_lastActiveDevice;
}

- (void)setLastActiveDevice:(id)a3
{
}

- (NSMutableSet)bluetoothIdentifierShortTermFailureLockout
{
  return self->_bluetoothIdentifierShortTermFailureLockout;
}

- (void)setBluetoothIdentifierShortTermFailureLockout:(id)a3
{
}

- (NSDate)shortTermFailureLockoutCreationDate
{
  return self->_shortTermFailureLockoutCreationDate;
}

- (void)setShortTermFailureLockoutCreationDate:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (OS_dispatch_source)migrationSoftErrorAlertDelayTimer
{
  return self->_migrationSoftErrorAlertDelayTimer;
}

- (void)setMigrationSoftErrorAlertDelayTimer:(id)a3
{
}

- (NSUUID)migrationSoftErrorDeviceID
{
  return self->_migrationSoftErrorDeviceID;
}

- (void)setMigrationSoftErrorDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSoftErrorDeviceID, 0);
  objc_storeStrong((id *)&self->_migrationSoftErrorAlertDelayTimer, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_shortTermFailureLockoutCreationDate, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifierShortTermFailureLockout, 0);
  objc_storeStrong((id *)&self->_lastActiveDevice, 0);
  objc_storeStrong((id *)&self->_syncObserver, 0);
  objc_storeStrong((id *)&self->_currentDeviceForSyncState, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_nanoRegistryAdvertisingRequestTimer, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_lastMigrationScanDate, 0);
  objc_storeStrong((id *)&self->_lastMessageSendDate, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end