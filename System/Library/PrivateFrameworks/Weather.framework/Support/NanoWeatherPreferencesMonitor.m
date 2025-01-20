@interface NanoWeatherPreferencesMonitor
- (BOOL)_nanoCityListNeedsUpdatingFrom:(id)a3;
- (BOOL)_nanoCityNeedsUpdateDueToLocationInfoFrom:(id)a3;
- (BOOL)_nanoCityNeedsUpdateDueToLocationInfoFrom:(id)a3 differentFrom:(id)a4;
- (BOOL)fullUpdateDone;
- (BOOL)monitoringDeferred;
- (BOOL)monitoringStarted;
- (BOOL)syncCoordinatorWaitingForCompletion;
- (BOOL)ubiquitousDefaultsSynced;
- (NSArray)companionCityList;
- (NSLock)xactionRefCountLock;
- (NSOperationQueue)utilityQueue;
- (NSString)deviceLangID;
- (NanoWeatherPreferences)watchPreferences;
- (NanoWeatherPreferencesMonitor)init;
- (OS_os_transaction)transaction;
- (PSYSyncCoordinator)syncCoordinator;
- (WeatherPreferences)companionWeatherPrefs;
- (id)_defaultCities;
- (id)_deviceLangID;
- (id)_getNanoCityFromList:(id)a3 forMatchingCompanionCity:(id)a4;
- (int)authorizationStatus;
- (int64_t)xpcXactionCount;
- (unint64_t)delayPrefsSyncRequestCount;
- (void)_addOperationWithQOS:(int64_t)a3 usingBlock:(id)a4;
- (void)_beginDelayingNanoPreferencesSync;
- (void)_beginXPCTransaction;
- (void)_checkForInitialState;
- (void)_cleanupSharedManagers;
- (void)_clearXPCTransaction;
- (void)_completeMonitoringStartup;
- (void)_doFullUpdateOfNanoPrefs:(BOOL)a3;
- (void)_endDelayingNanoPreferencesSync;
- (void)_endXPCTransactionIfOK;
- (void)_loadCompanionCityListOnCompletion:(id)a3;
- (void)_notifyToRestartMonitoring;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_updateCityList;
- (void)dealloc;
- (void)performBlockAsXPCXaction:(id)a3;
- (void)performBlockOnOperationQueue:(id)a3;
- (void)run;
- (void)setAuthorizationStatus:(int)a3;
- (void)setCompanionCityList:(id)a3;
- (void)setDelayPrefsSyncRequestCount:(unint64_t)a3;
- (void)setDeviceLangID:(id)a3;
- (void)setFullUpdateDone:(BOOL)a3;
- (void)setMonitoringDeferred:(BOOL)a3;
- (void)setMonitoringStarted:(BOOL)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)setSyncCoordinatorWaitingForCompletion:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setUbiquitousDefaultsSynced:(BOOL)a3;
- (void)setUtilityQueue:(id)a3;
- (void)setWatchPreferences:(id)a3;
- (void)setXactionRefCountLock:(id)a3;
- (void)setXpcXactionCount:(int64_t)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)terminate;
- (void)ubiquitousDefaultsDidChange:(id)a3;
- (void)weatherAppInstallationStateDidChange:(unint64_t)a3;
- (void)weatherPrefsDidGetUpdated:(id)a3;
@end

@implementation NanoWeatherPreferencesMonitor

- (NanoWeatherPreferencesMonitor)init
{
  self->_companionCityListLock._os_unfair_lock_opaque = 0;
  self->_authorizationStatus = 0;
  self->_delayPrefsSyncRequestCount = 0;
  self->_monitoringStarted = 0;
  v3 = (NSLock *)objc_alloc_init((Class)NSLock);
  xactionRefCountLock = self->_xactionRefCountLock;
  self->_xactionRefCountLock = v3;

  *(_WORD *)&self->_syncCoordinatorWaitingForCompletion = 0;
  v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  utilityQueue = self->_utilityQueue;
  self->_utilityQueue = v5;

  [(NSOperationQueue *)self->_utilityQueue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)self->_utilityQueue setQualityOfService:17];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100002D0C, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)sub_100002E70, NRPairedDeviceRegistryPairedDeviceDidChangeVersionDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoweatherprefssync"];
  syncCoordinator = self->_syncCoordinator;
  self->_syncCoordinator = v9;

  [(PSYSyncCoordinator *)self->_syncCoordinator setDelegate:self];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10000C580);
  return self;
}

- (void)run
{
}

- (void)terminate
{
  v3 = sub_100002174(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminating.", v4, 2u);
  }

  [(NanoWeatherPreferencesMonitor *)self _clearXPCTransaction];
  [(NanoWeatherPreferencesMonitor *)self _stopMonitoring];
}

- (void)dealloc
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002FBC;
  v5[3] = &unk_10000C5A8;
  v5[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v5];
  [(NSOperationQueue *)self->_utilityQueue addOperation:v3];
  [(NSOperationQueue *)self->_utilityQueue waitUntilAllOperationsAreFinished];

  v4.receiver = self;
  v4.super_class = (Class)NanoWeatherPreferencesMonitor;
  [(NanoWeatherPreferencesMonitor *)&v4 dealloc];
}

- (void)_startMonitoring
{
  [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003088;
  v4[3] = &unk_10000C5A8;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  [(NanoWeatherPreferencesMonitor *)self _loadCompanionCityListOnCompletion:v3];
}

- (void)_completeMonitoringStartup
{
  [(NanoWeatherPreferencesMonitor *)self _checkForInitialState];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100003B6C, @"com.apple.nanoweatherprefsd.PreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_super v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"weatherPrefsDidGetUpdated:" name:kWeatherPrefGroupPrefsDidUpdate object:0 suspensionBehavior:2];

  utilityQueue = self->_utilityQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003C98;
  v6[3] = &unk_10000C5A8;
  v6[4] = self;
  [(NSOperationQueue *)utilityQueue addOperationWithBlock:v6];
  self->_monitoringStarted = 1;
}

- (id)_deviceLangID
{
  v2 = (void *)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, @"mobile", kCFPreferencesAnyHost);
  return v2;
}

- (void)_stopMonitoring
{
  if (self->_monitoringStarted)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 removeObserver:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
    self->_monitoringStarted = 0;
    id v5 = +[NanoWeatherAppWorkSpaceObserver sharedWorkspaceObserver];
    [v5 stopObservingAppInstallation];
  }
}

- (id)_defaultCities
{
  v2 = [(NanoWeatherPreferencesMonitor *)self _deviceLangID];
  v3 = +[ALCityManagerLoc sharedManager];
  [v3 setLocaleForCityNames:v2];

  objc_super v4 = +[ALCityManagerLoc sharedManager];
  id v5 = [v4 defaultCitiesForLocaleCode:v2];

  if ([v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "name", (void)v16);
          v13 = +[ALCityManagerLoc sharedManager];
          v14 = +[NSArray arrayWithObject:v11];
          [v13 localizeCities:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)_addOperationWithQOS:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = +[NSBlockOperation blockOperationWithBlock:a4];
  [v6 setQualityOfService:a3];
  [(NSOperationQueue *)self->_utilityQueue addOperation:v6];
}

- (void)performBlockAsXPCXaction:(id)a3
{
  objc_super v4 = (uint64_t (**)(void))a3;
  [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
  char v5 = v4[2](v4);

  if ((v5 & 1) == 0)
  {
    [(NanoWeatherPreferencesMonitor *)self _endXPCTransactionIfOK];
  }
}

- (void)performBlockOnOperationQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000041D4;
  v6[3] = &unk_10000C5D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NanoWeatherPreferencesMonitor *)self _addOperationWithQOS:25 usingBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)weatherAppInstallationStateDidChange:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    id v5 = sub_100002174(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Weather reinstalled. Synchronize prefs.", v7, 2u);
    }

    id v6 = +[WeatherPreferences sharedPreferences];
    [v6 forceSyncCloudPreferences];
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000043D0;
  v9[3] = &unk_10000C5F8;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(NanoWeatherPreferencesMonitor *)self _addOperationWithQOS:25 usingBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4 = a3;
  [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004548;
  v5[3] = &unk_10000C5F8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(NanoWeatherPreferencesMonitor *)self _addOperationWithQOS:25 usingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)weatherPrefsDidGetUpdated:(id)a3
{
  id v4 = a3;
  id v5 = +[NSProcessInfo processInfo];
  id v6 = [v5 processName];
  id v7 = [v4 object];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
    id v8 = sub_100002174(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone prefs updated.", buf, 2u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004714;
    v10[3] = &unk_10000C5A8;
    v10[4] = self;
    uint64_t v9 = objc_retainBlock(v10);
    [(NanoWeatherPreferencesMonitor *)self _loadCompanionCityListOnCompletion:v9];
  }
}

- (void)ubiquitousDefaultsDidChange:(id)a3
{
  [(NanoWeatherPreferencesMonitor *)self _beginXPCTransaction];
  id v4 = sub_100002174(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ubiquitous defaults changed; update watch city list if necessary.",
      buf,
      2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004928;
  v6[3] = &unk_10000C5A8;
  void v6[4] = self;
  id v5 = objc_retainBlock(v6);
  [(NanoWeatherPreferencesMonitor *)self _loadCompanionCityListOnCompletion:v5];
}

- (void)_beginXPCTransaction
{
  uint64_t v3 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v3 lock];

  int64_t xpcXactionCount = self->_xpcXactionCount;
  self->_int64_t xpcXactionCount = xpcXactionCount + 1;
  if (!xpcXactionCount)
  {
    id v5 = (void *)os_transaction_create();
    [(NanoWeatherPreferencesMonitor *)self setTransaction:v5];
  }
  id v6 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v6 unlock];
}

- (void)_clearXPCTransaction
{
  uint64_t v3 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v3 lock];

  self->_int64_t xpcXactionCount = 0;
  [(NanoWeatherPreferencesMonitor *)self setTransaction:0];
  id v4 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v4 unlock];
}

- (void)_endXPCTransactionIfOK
{
  uint64_t v3 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v3 lock];

  int64_t xpcXactionCount = self->_xpcXactionCount;
  int64_t v5 = xpcXactionCount - 1;
  if (xpcXactionCount == 1)
  {
    [(NanoWeatherPreferencesMonitor *)self setTransaction:0];
    int64_t v5 = 0;
  }
  else if (xpcXactionCount < 2)
  {
    goto LABEL_5;
  }
  self->_int64_t xpcXactionCount = v5;
LABEL_5:
  id v6 = [(NanoWeatherPreferencesMonitor *)self xactionRefCountLock];
  [v6 unlock];
}

- (void)_cleanupSharedManagers
{
  id v2 = +[WeatherPreferences sharedPreferences];
  [v2 setSyncDelegate:0];
}

- (void)_notifyToRestartMonitoring
{
}

- (void)_beginDelayingNanoPreferencesSync
{
}

- (void)_endDelayingNanoPreferencesSync
{
  unint64_t v2 = self->_delayPrefsSyncRequestCount - 1;
  self->_delayPrefsSyncRequestCount = v2;
  if (!v2)
  {
    id v3 = [(NanoWeatherPreferencesMonitor *)self watchPreferences];
    [v3 syncPreferencesToNano];
  }
}

- (void)_updateCityList
{
  p_companionCityListLock = &self->_companionCityListLock;
  os_unfair_lock_lock(&self->_companionCityListLock);
  id v4 = [(NanoWeatherPreferencesMonitor *)self companionCityList];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_companionCityListLock);
  id v6 = [(NanoWeatherPreferencesMonitor *)self watchPreferences];
  if ([(NanoWeatherPreferencesMonitor *)self _nanoCityListNeedsUpdatingFrom:v5])
  {
    id v7 = sub_100002174(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromSelector("name");
      uint64_t v9 = [v5 valueForKeyPath:v8];
      id v10 = [v9 componentsJoinedByString:@", "];
      id v11 = [v6 cityList];
      id v12 = [v11 valueForKeyPath:@"Name"];
      v13 = [v12 componentsJoinedByString:@", "];
      int v16 = 138412546;
      long long v17 = v10;
      __int16 v18 = 2112;
      long long v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Determined watch needs updated city list. Phone list? %@; Watch list? %@.",
        (uint8_t *)&v16,
        0x16u);
    }
    v14 = [(NanoWeatherPreferencesMonitor *)self companionWeatherPrefs];
    v15 = [v14 lastUpdated];

    [v6 setCityListFromCityObjs:v5 lastUpdated:v15];
  }
}

- (BOOL)_nanoCityListNeedsUpdatingFrom:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = [(NanoWeatherPreferencesMonitor *)self watchPreferences];
  id v6 = [v5 cityObjectsListFromNanoPreferences];

  id v7 = [v4 count];
  if (v7 == [v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004FF4;
    v10[3] = &unk_10000C648;
    id v11 = v6;
    id v12 = &v13;
    [v4 enumerateObjectsUsingBlock:v10];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v8 = 1;
    *((unsigned char *)v14 + 24) = 1;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_getNanoCityFromList:(id)a3 forMatchingCompanionCity:(id)a4
{
  id v5 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000051B0;
  v11[3] = &unk_10000C670;
  id v12 = a4;
  id v6 = v12;
  id v7 = objc_retainBlock(v11);
  id v8 = [v5 indexOfObjectPassingTest:v7];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v5 objectAtIndexedSubscript:v8];
  }

  return v9;
}

- (BOOL)_nanoCityNeedsUpdateDueToLocationInfoFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(NanoWeatherPreferencesMonitor *)self watchPreferences];
  id v6 = [v5 cityList];
  id v7 = [(NanoWeatherPreferencesMonitor *)self _getNanoCityFromList:v6 forMatchingCompanionCity:v4];

  LOBYTE(self) = [(NanoWeatherPreferencesMonitor *)self _nanoCityNeedsUpdateDueToLocationInfoFrom:v4 differentFrom:v7];
  return (char)self;
}

- (BOOL)_nanoCityNeedsUpdateDueToLocationInfoFrom:(id)a3 differentFrom:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:@"CountryAbbreviation"];
  id v8 = [v7 uppercaseString];

  uint64_t v9 = [v6 ISO3166CountryAbbreviation];

  id v10 = [v9 uppercaseString];

  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  int v12 = !v11;
  if (v10) {
    unsigned int v13 = [v8 isEqualToString:v10] ^ 1;
  }
  else {
    unsigned int v13 = 0;
  }
  BOOL v14 = a3 == 0;
  BOOL v15 = a4 != 0;
  if (!a4) {
    BOOL v14 = 1;
  }
  int v16 = v14 | v13 | v12;
  if (v16 == 1)
  {
    long long v17 = sub_100002174(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 67109890;
      v19[1] = v15;
      __int16 v20 = 1024;
      BOOL v21 = a3 != 0;
      __int16 v22 = 2112;
      v23 = v8;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Nano city needs update. Nano City Exists? %d, Companion City Exists? %d. Nano City Country Abbreviation: %@, Companion City Country Abbreviation: %@.", (uint8_t *)v19, 0x22u);
    }
  }
  return v16;
}

- (void)_checkForInitialState
{
  id v3 = [(NanoWeatherPreferencesMonitor *)self watchPreferences];
  id v4 = [v3 cityList];

  if (!v4)
  {
    id v5 = sub_100002174(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NanoWeatherPreferencesMonitor _checkForInitialState nano prefs incomplete so full update.", v6, 2u);
    }

    [(NanoWeatherPreferencesMonitor *)self _doFullUpdateOfNanoPrefs:0];
  }
}

- (void)_doFullUpdateOfNanoPrefs:(BOOL)a3
{
  self->_fullUpdateDone = 1;
}

- (void)_loadCompanionCityListOnCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000055DC;
  v5[3] = &unk_10000C6D8;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  id v4 = objc_retainBlock(v5);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)monitoringStarted
{
  return self->_monitoringStarted;
}

- (void)setMonitoringStarted:(BOOL)a3
{
  self->_monitoringStarted = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (int64_t)xpcXactionCount
{
  return self->_xpcXactionCount;
}

- (void)setXpcXactionCount:(int64_t)a3
{
  self->_int64_t xpcXactionCount = a3;
}

- (WeatherPreferences)companionWeatherPrefs
{
  return self->_companionWeatherPrefs;
}

- (NSArray)companionCityList
{
  return self->_companionCityList;
}

- (void)setCompanionCityList:(id)a3
{
}

- (NanoWeatherPreferences)watchPreferences
{
  return self->_watchPreferences;
}

- (void)setWatchPreferences:(id)a3
{
}

- (BOOL)fullUpdateDone
{
  return self->_fullUpdateDone;
}

- (void)setFullUpdateDone:(BOOL)a3
{
  self->_fullUpdateDone = a3;
}

- (BOOL)ubiquitousDefaultsSynced
{
  return self->_ubiquitousDefaultsSynced;
}

- (void)setUbiquitousDefaultsSynced:(BOOL)a3
{
  self->_ubiquitousDefaultsSynced = a3;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (unint64_t)delayPrefsSyncRequestCount
{
  return self->_delayPrefsSyncRequestCount;
}

- (void)setDelayPrefsSyncRequestCount:(unint64_t)a3
{
  self->_delayPrefsSyncRequestCount = a3;
}

- (NSString)deviceLangID
{
  return self->_deviceLangID;
}

- (void)setDeviceLangID:(id)a3
{
}

- (NSOperationQueue)utilityQueue
{
  return self->_utilityQueue;
}

- (void)setUtilityQueue:(id)a3
{
}

- (NSLock)xactionRefCountLock
{
  return self->_xactionRefCountLock;
}

- (void)setXactionRefCountLock:(id)a3
{
}

- (BOOL)syncCoordinatorWaitingForCompletion
{
  return self->_syncCoordinatorWaitingForCompletion;
}

- (void)setSyncCoordinatorWaitingForCompletion:(BOOL)a3
{
  self->_syncCoordinatorWaitingForCompletion = a3;
}

- (BOOL)monitoringDeferred
{
  return self->_monitoringDeferred;
}

- (void)setMonitoringDeferred:(BOOL)a3
{
  self->_monitoringDeferred = a3;
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_xactionRefCountLock, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_deviceLangID, 0);
  objc_storeStrong((id *)&self->_watchPreferences, 0);
  objc_storeStrong((id *)&self->_companionCityList, 0);
  objc_storeStrong((id *)&self->_companionWeatherPrefs, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end