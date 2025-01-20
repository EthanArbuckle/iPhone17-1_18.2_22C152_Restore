@interface WLKLocationManager
+ (id)defaultLocationManager;
+ (void)locationServicesEnabled:(id)a3;
- (BOOL)_isIgnorableLocationError:(id)a3;
- (BOOL)_isLastKnownLocation:(id)a3 freshForMaxAge:(double)a4 fromNewTimestamp:(double)a5;
- (BOOL)_isLastKnownLocation:(id)a3 significantlyOlderThanNewLocation:(id)a4;
- (BOOL)_isLastKnownLocationFresh:(id)a3;
- (BOOL)_locationServicesEnabled;
- (BOOL)_shouldLastKnownLocation:(id)a3 beUpdatedTo:(id)a4;
- (BOOL)isAuthorizationApproved;
- (BOOL)isAuthorizationDenied;
- (CLLocationManager)clLocationManager;
- (NSDictionary)lastKnownLocation;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)clQueue;
- (WLKLocationManager)init;
- (double)_getDistanceOfLastKnownLocationDictionary:(id)a3 fromLocation:(id)a4;
- (id)_cachedDictionary:(BOOL)a3;
- (id)_connection;
- (id)_copyLastKnownLocation;
- (id)_createLocationObjFromLocationDictionary:(id)a3;
- (id)_dictionaryForCLLocation:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_locationQueryParameters;
- (id)locationUpdateBlock;
- (int)didChangeNotificationToken;
- (int64_t)_statusForCLAuthorizationStatus:(int)a3;
- (int64_t)authorizationStatus;
- (void)_deleteLastKnownLocation;
- (void)_locationAuthorizationStatus:(id)a3;
- (void)_networkReachbilityDidChange:(id)a3;
- (void)_requestActiveLocationChangeUpdates;
- (void)_requestCLLocationUpdates:(id)a3;
- (void)_requestRecentCLLocation:(id)a3;
- (void)_setLastKnownLocation:(id)a3;
- (void)_updateLocationIfNeeded;
- (void)dealloc;
- (void)fetchAuthorizationStatus:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)requestAuthorization;
- (void)requestAuthorizationWithForcedPrompt:(BOOL)a3;
- (void)setClLocationManager:(id)a3;
- (void)setClQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDidChangeNotificationToken:(int)a3;
- (void)setLocationUpdateBlock:(id)a3;
@end

@implementation WLKLocationManager

void __51__WLKLocationManager__networkReachbilityDidChange___block_invoke(uint64_t a1)
{
  v2 = +[WLKReachabilityMonitor sharedInstance];
  int v3 = [v2 isNetworkReachable];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 _updateLocationIfNeeded];
  }
}

- (void)_networkReachbilityDidChange:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[WLKLocationManager _networkReachbilityDidChange:]();
  }
  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WLKLocationManager__networkReachbilityDidChange___block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_async(clQueue, block);
}

+ (id)defaultLocationManager
{
  if (defaultLocationManager___once != -1) {
    dispatch_once(&defaultLocationManager___once, &__block_literal_global_24);
  }
  v2 = (void *)defaultLocationManager___defaultLocationManager;

  return v2;
}

- (id)_locationQueryParameters
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(WLKLocationManager *)self lastKnownLocation];
  if ([(WLKLocationManager *)self isAuthorizationDenied])
  {
    id v4 = &unk_1F13D9A08;
  }
  else if (v3)
  {
    v13 = @"latlong";
    v5 = NSString;
    v6 = [v3 objectForKeyedSubscript:@"reducedPrecisionLatitudeString"];
    v7 = [v3 objectForKeyedSubscript:@"reducedPrecisionLongitudeString"];
    v8 = [v5 stringWithFormat:@"%@,%@", v6, v7];
    v14[0] = v8;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v4 = 0;
  }
  v9 = WLKSystemLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Loc query params: %@", buf, 0xCu);
  }

  return v4;
}

- (NSDictionary)lastKnownLocation
{
  id v2 = [(WLKLocationManager *)self _copyLastKnownLocation];

  return (NSDictionary *)v2;
}

- (BOOL)isAuthorizationDenied
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  clQueue = self->_clQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__WLKLocationManager_isAuthorizationDenied__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(clQueue, v5);
  BOOL v3 = (*((_DWORD *)v7 + 6) - 1) < 2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_copyLastKnownLocation
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSDictionary *)v2->_lastKnownLocation copy];
  objc_sync_exit(v2);

  return v3;
}

void __44__WLKLocationManager__setLastKnownLocation___block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Notifying of location change", v2, 2u);
  }

  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"WLKLocationManagerLocationDidChangeNotification" object:0];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clQueue);
  uint64_t v5 = [v4 authorizationStatus];
  if ([(WLKLocationManager *)self isAuthorizationApproved])
  {
    if (!self->_lastKnownLocation)
    {
      int64_t v6 = [(WLKLocationManager *)self _statusForCLAuthorizationStatus:v5];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_initWeak(location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_56;
      v11[3] = &unk_1E620AF68;
      v11[4] = self;
      objc_copyWeak(&v12, location);
      [(WLKLocationManager *)self _requestCLLocationUpdates:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
  }
  else
  {
    v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v5;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Authorization status is not approved with status: %d", (uint8_t *)location, 8u);
    }

    if ((v5 & 0xFFFFFFFD) == 0)
    {
      uint64_t v8 = WLKSystemLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Deleting last known location and sending authorization did change notification", (uint8_t *)location, 2u);
      }

      [(WLKLocationManager *)self _setLastKnownLocation:0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_57;
      v9[3] = &unk_1E620AF90;
      v9[4] = self;
      int v10 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

- (void)_updateLocationIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WLKLocationManager *)self isAuthorizationApproved])
  {
    BOOL v3 = [(WLKLocationManager *)self _copyLastKnownLocation];
    if (v3 && [(WLKLocationManager *)self _isLastKnownLocationFresh:v3])
    {
      id v4 = WLKSystemLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "-[WLKLocationManager _updateLocationIfNeeded]";
        _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: not updating lkl, using cached", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      uint64_t v5 = WLKSystemLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "-[WLKLocationManager _updateLocationIfNeeded]";
        _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: requesting recent location", (uint8_t *)&v6, 0xCu);
      }

      [(WLKLocationManager *)self _requestActiveLocationChangeUpdates];
    }
  }
  else
  {
    BOOL v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _updateLocationIfNeeded: location not authorized", (uint8_t *)&v6, 2u);
    }
  }
}

- (BOOL)isAuthorizationApproved
{
  return [(CLLocationManager *)self->_clLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse;
}

- (void)_setLastKnownLocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (NSDictionary *)a3;
  uint64_t v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[WLKLocationManager _setLastKnownLocation:]";
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s", (uint8_t *)&v11, 0xCu);
  }

  int v6 = self;
  objc_sync_enter(v6);
  lastKnownLocation = v6->_lastKnownLocation;
  v6->_lastKnownLocation = v4;

  objc_sync_exit(v6);
  uint64_t v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Wrote location", (uint8_t *)&v11, 2u);
  }

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_45_0);
  int didChangeNotificationToken = v6->_didChangeNotificationToken;
  pid_t v10 = getpid();
  notify_set_state(didChangeNotificationToken, v10);
  notify_post("com.apple.WatchListKit.WLKLocationManagerLocationDidChangeNotification");
}

- (int64_t)authorizationStatus
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = -1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__WLKLocationManager_authorizationStatus__block_invoke;
  v8[3] = &unk_1E620AE78;
  pid_t v10 = &v11;
  id v4 = v3;
  int v9 = v4;
  [(WLKLocationManager *)self _locationAuthorizationStatus:v8];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_57(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) _statusForCLAuthorizationStatus:*(unsigned int *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  dispatch_time_t v5 = @"status";
  dispatch_semaphore_t v3 = [NSNumber numberWithInteger:v1];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"WLKLocationManagerAuthorizationStatusDidChangeNotification" object:0 userInfo:v4];
}

void __26__WLKLocationManager_init__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Creating CLLocationManager", (uint8_t *)&v21, 2u);
  }

  if (WLKIsTVApp())
  {
    dispatch_semaphore_t v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - WLK is TVApp", (uint8_t *)&v21, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F1E600]);
    dispatch_time_t v5 = [WeakRetained clQueue];
    int64_t v6 = [v4 _initWithDelegate:WeakRetained onQueue:v5];
    [WeakRetained setClLocationManager:v6];
  }
  else if (WLKIsDaemon())
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1E600]);
    dispatch_time_t v5 = WLKTVAppBundleID();
    int64_t v6 = [WeakRetained clQueue];
    uint64_t v8 = (void *)[v7 initWithEffectiveBundleIdentifier:v5 delegate:WeakRetained onQueue:v6];
    [WeakRetained setClLocationManager:v8];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
    dispatch_time_t v5 = [v14 bundlePath];

    id v15 = objc_alloc(MEMORY[0x1E4F1E600]);
    v16 = [WeakRetained clQueue];
    v17 = (void *)[v15 initWithEffectiveBundlePath:v5 delegate:WeakRetained onQueue:v16];
    [WeakRetained setClLocationManager:v17];

    v18 = [WeakRetained clLocationManager];

    if (v18) {
      goto LABEL_10;
    }
    int64_t v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v19 bundleIdentifier];
      int v21 = 138412290;
      v22 = v20;
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - bundle id:%@ does not have the right entitlement for location data.", (uint8_t *)&v21, 0xCu);
    }
  }

LABEL_10:
  int v9 = [WeakRetained clLocationManager];
  [v9 setDesiredAccuracy:*MEMORY[0x1E4F1E730]];

  pid_t v10 = [WeakRetained clLocationManager];
  [v10 setDistanceFilter:1000.0];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  [v11 removeObjectForKey:@"LastKnownLocation"];
  [WeakRetained _deleteLastKnownLocation];
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = +[WLKReachabilityMonitor sharedInstance];
  [v12 addObserver:WeakRetained selector:sel__networkReachbilityDidChange_ name:@"WLKReachabilityMonitorReachabilityDidChange" object:v13];
}

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WLKIsTVApp())
  {
    id v2 = [WeakRetained clLocationManager];
    uint64_t v3 = [v2 authorizationStatus];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1E600];
    id v2 = WLKTVAppBundleID();
    uint64_t v3 = [v4 authorizationStatusForBundleIdentifier:v2];
  }
  uint64_t v5 = v3;

  uint64_t v6 = [*(id *)(a1 + 32) _statusForCLAuthorizationStatus:v5];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
  }
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (int64_t)_statusForCLAuthorizationStatus:(int)a3
{
  if ((a3 - 2) > 2) {
    return -1;
  }
  else {
    return qword_1BA356F20[a3 - 2];
  }
}

intptr_t __41__WLKLocationManager_authorizationStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_locationAuthorizationStatus:(id)a3
{
  id v4 = a3;
  if ((WLKShouldRunInProcess() & 1) != 0 || WLKIsTVApp())
  {
    objc_initWeak(location, self);
    clQueue = self->_clQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke;
    block[3] = &unk_1E620A488;
    objc_copyWeak(&v18, location);
    block[4] = self;
    id v17 = v4;
    id v6 = v4;
    dispatch_async(clQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v7 = [(WLKLocationManager *)self _connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2;
    v14[3] = &unk_1E620A438;
    id v8 = v4;
    id v15 = v8;
    int v9 = [v7 remoteObjectProxyWithErrorHandler:v14];

    pid_t v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Calling out to daemon for auth status", (uint8_t *)location, 2u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_73;
    v12[3] = &unk_1E620AFB8;
    id v13 = v8;
    id v11 = v8;
    [v9 fetchLocationAuthorizationStatus:v12];
  }
}

- (void)setClLocationManager:(id)a3
{
}

- (OS_dispatch_queue)clQueue
{
  return self->_clQueue;
}

- (void)_deleteLastKnownLocation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  [v3 UTF8String];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKLocationManager - Failed to remove last known location file with error: %s", v4, 0xCu);
}

void __26__WLKLocationManager_init__block_invoke_29(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
  if (state64 != getpid())
  {
    uint64_t v1 = WLKSystemLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v1, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Received didChange notification", buf, 2u);
    }

    id v2 = WLKSystemLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Firing local notification", v4, 2u);
    }

    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"WLKLocationManagerLocationDidChangeNotification" object:0];
  }
}

uint64_t __44__WLKLocationManager_defaultLocationManager__block_invoke()
{
  defaultLocationManager___defaultLocationManager = objc_alloc_init(WLKLocationManager);

  return MEMORY[0x1F41817F8]();
}

- (WLKLocationManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)WLKLocationManager;
  id v2 = [(WLKLocationManager *)&v15 init];
  if (v2)
  {
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Init", (uint8_t *)buf, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("WLKLocationQueue-CoreLocation", 0);
    uint64_t v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    objc_initWeak(buf, v2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __26__WLKLocationManager_init__block_invoke;
    v12[3] = &unk_1E620A550;
    objc_copyWeak(&v13, buf);
    id v6 = (void *)MEMORY[0x1BA9E94D0](v12);
    dispatch_async(*((dispatch_queue_t *)v2 + 3), v6);
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __26__WLKLocationManager_init__block_invoke_29;
    v10[3] = &unk_1E620AE50;
    id v11 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKLocationManagerLocationDidChangeNotification", (int *)v2 + 2, v7, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  return (WLKLocationManager *)v2;
}

+ (void)locationServicesEnabled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [a1 defaultLocationManager];
    id v6 = [v5 clQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__WLKLocationManager_locationServicesEnabled___block_invoke;
    block[3] = &unk_1E620A390;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

void __46__WLKLocationManager_locationServicesEnabled___block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F1E600] locationServicesEnabled];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WLKLocationManager_locationServicesEnabled___block_invoke_2;
  v3[3] = &unk_1E620AE28;
  id v4 = *(id *)(a1 + 32);
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __46__WLKLocationManager_locationServicesEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)dealloc
{
  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WLKLocationManager_dealloc__block_invoke;
  block[3] = &unk_1E620A708;
  void block[4] = self;
  dispatch_async(clQueue, block);
  int didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken) {
    notify_cancel(didChangeNotificationToken);
  }
  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)WLKLocationManager;
  [(WLKLocationManager *)&v6 dealloc];
}

void __29__WLKLocationManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
  id v3 = v2;

  [v3 stopUpdatingLocation];
  [v3 setDelegate:0];
}

- (void)fetchAuthorizationStatus:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKLocationManager fetchAuthorizationStatus:]();
  }
  char v5 = v4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke;
  block[3] = &unk_1E620AEA0;
  uint64_t v14 = v15;
  id v7 = v5;
  id v13 = v7;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_38;
  v9[3] = &unk_1E620AEF0;
  id v11 = v15;
  id v8 = v7;
  id v10 = v8;
  [(WLKLocationManager *)self _locationAuthorizationStatus:v9];

  _Block_object_dispose(v15, 8);
}

uint64_t __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_cold_1(v3);
    }

    return (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
  }
  return result;
}

void __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_38(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_2;
  block[3] = &unk_1E620AEC8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  uint64_t v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - fetchAuthorizationStatus completed", v4, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
  }
  return result;
}

- (void)requestAuthorization
{
}

- (void)requestAuthorizationWithForcedPrompt:(BOOL)a3
{
  if (!a3
    || [(WLKLocationManager *)self _locationServicesEnabled]
    && [(WLKLocationManager *)self authorizationStatus])
  {
    clQueue = self->_clQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke_2;
    v6[3] = &unk_1E620A708;
    v6[4] = self;
    char v5 = v6;
  }
  else
  {
    clQueue = self->_clQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke;
    block[3] = &unk_1E620A708;
    void block[4] = self;
    char v5 = block;
  }
  dispatch_async(clQueue, v5);
}

uint64_t __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) requestWhenInUseAuthorizationWithPrompt];
}

uint64_t __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) requestWhenInUseAuthorization];
}

uint64_t __43__WLKLocationManager_isAuthorizationDenied__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) authorizationStatus];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_locationServicesEnabled
{
  return [MEMORY[0x1E4F1E600] locationServicesEnabled];
}

- (void)_requestActiveLocationChangeUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[WLKLocationManager _requestActiveLocationChangeUpdates]";
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: starting location updates", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__WLKLocationManager__requestActiveLocationChangeUpdates__block_invoke;
  v4[3] = &unk_1E620AF18;
  objc_copyWeak(&v5, (id *)buf);
  v4[4] = self;
  [(WLKLocationManager *)self _requestCLLocationUpdates:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __57__WLKLocationManager__requestActiveLocationChangeUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v6 = a3;
  uint64_t v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Active location request returned err: %@", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    int v9 = WLKSystemLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 localizedDescription];
      uint64_t v11 = [v10 UTF8String];
      int v12 = 136315394;
      id v13 = "-[WLKLocationManager _requestActiveLocationChangeUpdates]_block_invoke";
      __int16 v14 = 2080;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil new location, error:%s", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    int v9 = [*(id *)(a1 + 32) _dictionaryForCLLocation:v5];
    [WeakRetained _setLastKnownLocation:v9];
  }
}

- (BOOL)_isIgnorableLocationError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v4 = v3;
  if (v3
    && ([v3 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        long long v6 = (void *)*MEMORY[0x1E4F1E6C8],
        v5,
        v5 == v6))
  {
    uint64_t v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v4 code];
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Ignoring location error: %ld", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = [v4 code] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[(NSDictionary *)v4->_lastKnownLocation copy];
  [v3 setObject:v5 forKeyedSubscript:@"LastKnownLocation"];

  objc_sync_exit(v4);

  return v3;
}

- (BOOL)_isLastKnownLocation:(id)a3 freshForMaxAge:(double)a4 fromNewTimestamp:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v7 = [a3 objectForKeyedSubscript:@"secondsSinceEpoch"];
    [v7 doubleValue];
    double v9 = v8;

    double v10 = a5 - v9;
    uint64_t v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = "-[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:]";
      __int16 v16 = 2048;
      double v17 = v10;
      __int16 v18 = 2048;
      double v19 = a4;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: locationAge %f, maxAge %f", (uint8_t *)&v14, 0x20u);
    }

    return v10 < a4;
  }
  else
  {
    id v13 = WLKSystemLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:]";
      _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil lkl", (uint8_t *)&v14, 0xCu);
    }

    return 0;
  }
}

- (BOOL)_isLastKnownLocationFresh:(id)a3
{
  long long v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  long long v6 = [v4 date];
  [v6 timeIntervalSince1970];
  LOBYTE(self) = [(WLKLocationManager *)self _isLastKnownLocation:v5 freshForMaxAge:86400.0 fromNewTimestamp:v7];

  return (char)self;
}

- (BOOL)_shouldLastKnownLocation:(id)a3 beUpdatedTo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(WLKLocationManager *)self _isLastKnownLocation:v6 significantlyOlderThanNewLocation:v7])
  {
    double v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[WLKLocationManager _shouldLastKnownLocation:beUpdatedTo:]";
      double v9 = "WLKLocationManager - %s: new location is after significant time";
LABEL_7:
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    [(WLKLocationManager *)self _getDistanceOfLastKnownLocationDictionary:v6 fromLocation:v7];
    if (v10 <= 1000.0)
    {
      BOOL v11 = 0;
      goto LABEL_10;
    }
    double v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[WLKLocationManager _shouldLastKnownLocation:beUpdatedTo:]";
      double v9 = "WLKLocationManager - %s: new location is significantantly farther";
      goto LABEL_7;
    }
  }

  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_isLastKnownLocation:(id)a3 significantlyOlderThanNewLocation:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = a3;
  id v7 = [a4 timestamp];
  [v7 timeIntervalSince1970];
  LOBYTE(self) = [(WLKLocationManager *)self _isLastKnownLocation:v6 freshForMaxAge:7200.0 fromNewTimestamp:v8];

  return (char)self;
}

- (id)_createLocationObjFromLocationDictionary:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v4 = [v3 objectForKey:@"reducedPrecisionLatitudeString"];
    id v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      double v7 = v6;
      double v8 = [v3 objectForKey:@"reducedPrecisionLongitudeString"];
      double v9 = v8;
      if (v8)
      {
        [v8 doubleValue];
        BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v7 longitude:v10];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)_getDistanceOfLastKnownLocationDictionary:(id)a3 fromLocation:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = WLKSystemLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      double v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      int v13 = "WLKLocationManager - %s: nil newLocation";
LABEL_9:
      _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
LABEL_10:

    double v11 = *MEMORY[0x1E4F1E568];
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v12 = WLKSystemLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      double v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      int v13 = "WLKLocationManager - %s: nil location";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  double v8 = [(WLKLocationManager *)self _createLocationObjFromLocationDictionary:v6];
  double v9 = v8;
  if (v8)
  {
    [v8 distanceFromLocation:v7];
    double v11 = v10;
  }
  else
  {
    int v14 = WLKSystemLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      double v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      _os_log_impl(&dword_1BA2E8000, v14, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil lastKnownLocObj", (uint8_t *)&v16, 0xCu);
    }

    double v11 = *MEMORY[0x1E4F1E568];
  }

LABEL_15:
  return v11;
}

- (void)_requestRecentCLLocation:(id)a3
{
  id v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__WLKLocationManager__requestRecentCLLocation___block_invoke;
  v7[3] = &unk_1E620AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clQueue, v7);
}

void __47__WLKLocationManager__requestRecentCLLocation___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) location];
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Request recent cl location", buf, 2u);
    }

    [v2 horizontalAccuracy];
    if (v4 > 1000.0)
    {
      id v5 = WLKSystemLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Recent cl location accuracy unusable", v11, 2u);
      }

      uint64_t v2 = 0;
    }
    id v6 = [v2 timestamp];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 < -86400.0)
    {
      double v9 = WLKSystemLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Recent cl location is stale", v10, 2u);
      }

      uint64_t v2 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_requestCLLocationUpdates:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(WLKLocationManager *)self setLocationUpdateBlock:v4];
  }
  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Updating location", v6, 2u);
  }

  [(CLLocationManager *)self->_clLocationManager requestLocation];
}

- (id)_dictionaryForCLLocation:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = NSString;
    id v4 = a3;
    id v5 = objc_msgSend(v3, "stringWithFormat:", @"%s%df", "%0.0", 3);
    id v6 = NSString;
    [v4 coordinate];
    double v8 = objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%f", 0, v7);
    double v9 = NSString;
    [v4 coordinate];
    double v11 = objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%f", 0, v10);
    v17[0] = @"reducedPrecisionLatitudeString";
    v17[1] = @"reducedPrecisionLongitudeString";
    v18[0] = v8;
    v18[1] = v11;
    v17[2] = @"secondsSinceEpoch";
    uint64_t v12 = NSNumber;
    int v13 = [v4 timestamp];

    [v13 timeIntervalSince1970];
    int v14 = objc_msgSend(v12, "numberWithDouble:");
    v18[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_cachedDictionary:(BOOL)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  id v4 = +[WLKAppLibrary defaultAppLibrary];
  char v5 = [v4 isTVAppInstalled];

  if (v5)
  {
    if ([(WLKLocationManager *)self isAuthorizationApproved])
    {
LABEL_4:
      id v6 = [(WLKLocationManager *)self _copyLastKnownLocation];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _dictionaryOnDisk: app is not installed", buf, 2u);
    }

    if ([(WLKLocationManager *)self isAuthorizationApproved]) {
      goto LABEL_11;
    }
  }
  double v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _dictionaryOnDisk: location not authorized", v10, 2u);
  }

LABEL_11:
  id v6 = 0;
LABEL_12:

  return v6;
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Notifying of authorization status change", v6, 2u);
  }

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = @"status";
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v8[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 postNotificationName:@"WLKLocationManagerAuthorizationStatusDidChangeNotification" object:0 userInfo:v5];
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || ![*(id *)(a1 + 32) _isIgnorableLocationError:v6])
  {
    double v8 = [WeakRetained _dictionaryForCLLocation:v5];
    [WeakRetained _setLastKnownLocation:v8];
  }
  else
  {
    double v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_56_cold_1();
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a4;
  clQueue = self->_clQueue;
  double v8 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(clQueue);
  clLocationManager = self->_clLocationManager;

  if (clLocationManager == v8)
  {
    int v13 = [(WLKLocationManager *)self locationUpdateBlock];

    if (v13)
    {
      if ([v6 count])
      {
        uint64_t v10 = [(WLKLocationManager *)self locationUpdateBlock];
        int v14 = [v6 lastObject];
        (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v14, 0);

        goto LABEL_12;
      }
      uint64_t v10 = WLKSystemLogObject();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v15 = 0;
      double v11 = "WLKLocationManager - No location in update";
      uint64_t v12 = (uint8_t *)&v15;
    }
    else
    {
      uint64_t v10 = WLKSystemLogObject();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v16 = 0;
      double v11 = "WLKLocationManager - No location update block";
      uint64_t v12 = (uint8_t *)&v16;
    }
    goto LABEL_4;
  }
  uint64_t v10 = WLKSystemLogObject();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    double v11 = "WLKLocationManager - Location manager ref don't match";
    uint64_t v12 = buf;
LABEL_4:
    _os_log_impl(&dword_1BA2E8000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
  }
LABEL_12:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  clQueue = self->_clQueue;
  double v8 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(clQueue);
  clLocationManager = self->_clLocationManager;

  if (clLocationManager == v8)
  {
    uint64_t v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WLKLocationManager locationManager:didFailWithError:]();
    }

    double v11 = [(WLKLocationManager *)self locationUpdateBlock];

    if (v11)
    {
      uint64_t v12 = [(WLKLocationManager *)self locationUpdateBlock];
      ((void (**)(void, void, id))v12)[2](v12, 0, v6);
    }
  }
}

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, -1);
  }
}

uint64_t __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_73(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Daemon callback for auth status %ld", (uint8_t *)&v6, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (id)_connection
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    uint64_t v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    int v6 = v2->_connection;
    uint64_t v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    uint64_t v8 = v2->_connection;
    double v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_79];
    objc_initWeak(&location, v2);
    uint64_t v10 = v2->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    __int16 v15 = __33__WLKLocationManager__connection__block_invoke_80;
    __int16 v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = v2->_connection;
  }
  double v11 = connection;
  objc_sync_exit(v2);

  return v11;
}

void __33__WLKLocationManager__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Connection interrupted.", v1, 2u);
  }
}

void __33__WLKLocationManager__connection__block_invoke_80(uint64_t a1)
{
  uint64_t v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Connection invalidated.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;
  }
}

- (void)setClQueue:(id)a3
{
}

- (id)locationUpdateBlock
{
  return self->_locationUpdateBlock;
}

- (void)setLocationUpdateBlock:(id)a3
{
}

- (int)didChangeNotificationToken
{
  return self->_didChangeNotificationToken;
}

- (void)setDidChangeNotificationToken:(int)a3
{
  self->_int didChangeNotificationToken = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong(&self->_locationUpdateBlock, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);

  objc_storeStrong((id *)&self->_lastKnownLocation, 0);
}

- (void)_networkReachbilityDidChange:.cold.1()
{
}

- (void)fetchAuthorizationStatus:.cold.1()
{
  __assert_rtn("-[WLKLocationManager fetchAuthorizationStatus:]", "WLKLocationManager.m", 188, "completion != nil");
}

void __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BA2E8000, log, OS_LOG_TYPE_ERROR, "WLKLocationManager - fetchAuthorizationStatus timed out.", v1, 2u);
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKLocationManager - Error requesting location update, not updating our location: %@", v2, v3, v4, v5, v6);
}

- (void)locationManager:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKLocationManager - Location update failed %@", v2, v3, v4, v5, v6);
}

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKLocationManager - Unable to communicate with the remote object proxy (%@)", v2, v3, v4, v5, v6);
}

@end