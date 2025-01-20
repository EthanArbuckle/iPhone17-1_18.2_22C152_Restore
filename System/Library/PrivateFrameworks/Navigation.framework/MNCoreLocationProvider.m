@interface MNCoreLocationProvider
- (BOOL)coarseModeEnabled;
- (BOOL)isAuthorized;
- (BOOL)isTracePlayer;
- (CLLocationManager)_clLocationManager;
- (MNCoreLocationProvider)init;
- (MNCoreLocationProvider)initWithEffectiveBundle:(id)a3;
- (MNCoreLocationProvider)initWithEffectiveBundleIdentifier:(id)a3;
- (MNLocationProviderDelegate)delegate;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)expectedGpsUpdateInterval;
- (double)timeScale;
- (int)headingOrientation;
- (unint64_t)traceVersion;
- (void)_createCLLocationManager;
- (void)_resetForNewEffectiveBundle;
- (void)_sharedInit;
- (void)_updateAuthorizationStatus;
- (void)_updateCoarseModeEnabled;
- (void)_updateForCLParameters:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)requestLocation;
- (void)resetForActiveTileGroupChanged;
- (void)setCLParameters:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setEffectiveBundle:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setMatchInfoEnabled:(BOOL)a3;
- (void)startMonitoringForRegion:(id)a3;
- (void)startUpdatingHeading;
- (void)startUpdatingLocation;
- (void)startUpdatingVehicleHeading;
- (void)startUpdatingVehicleSpeed;
- (void)stopMonitoringForRegion:(id)a3;
- (void)stopUpdatingHeading;
- (void)stopUpdatingLocation;
- (void)stopUpdatingVehicleHeading;
- (void)stopUpdatingVehicleSpeed;
@end

@implementation MNCoreLocationProvider

- (BOOL)coarseModeEnabled
{
  return self->_coarseModeEnabled;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    v19 = self;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "%p MNCoreLocationProvider locationManager:didUpdateLocations", (uint8_t *)&v18, 0xCu);
  }

  v7 = MNGetMNLocationProviderLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DidUpdateLocations", "", (uint8_t *)&v18, 2u);
  }

  v11 = [v5 lastObject];

  v12 = [[MNLocation alloc] initWithCLLocation:v11];
  [(CLLocation *)v12 _navigation_setGtLog:1];
  v13 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(MNLocation *)v12 uuid];
    int v18 = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "[MN] [%@] - Received - from MNCoreLocationProvider", (uint8_t *)&v18, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained locationProvider:self didUpdateLocation:v12];

  v16 = v10;
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v17, OS_SIGNPOST_INTERVAL_END, v8, "DidUpdateLocations", "", (uint8_t *)&v18, 2u);
  }
}

- (MNCoreLocationProvider)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MNCoreLocationProvider;
  v2 = [(MNCoreLocationProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MNCoreLocationProvider *)v2 _sharedInit];
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v8 = v3;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider init]", buf, 0xCu);
    }
  }
  return v3;
}

- (MNCoreLocationProvider)initWithEffectiveBundle:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNCoreLocationProvider;
  objc_super v6 = [(MNCoreLocationProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(MNCoreLocationProvider *)v6 _sharedInit];
    objc_storeStrong((id *)&v7->_effectiveBundle, a3);
    os_signpost_id_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider initWithEffectiveBundle:] - %@", buf, 0x16u);
    }
  }
  return v7;
}

- (MNCoreLocationProvider)initWithEffectiveBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNCoreLocationProvider;
  id v5 = [(MNCoreLocationProvider *)&v11 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(MNCoreLocationProvider *)v5 _sharedInit];
    uint64_t v7 = [v4 copy];
    effectiveBundleIdentifier = v6->_effectiveBundleIdentifier;
    v6->_effectiveBundleIdentifier = (NSString *)v7;

    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v13 = v6;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider initWithEffectiveBundleIdentifier:] - %@", buf, 0x16u);
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"dealloc should be called on the main thread"];
    os_signpost_id_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = (MNCoreLocationProvider *)"-[MNCoreLocationProvider dealloc]";
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNCoreLocationProvider.m";
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = 91;
      *(_WORD *)&v16[4] = 2080;
      *(void *)&v16[6] = "[NSThread isMainThread]";
      __int16 v17 = 2112;
      int v18 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CLLocationManager *)self->_clLocationManager stopUpdatingLocation];
  [(CLLocationManager *)self->_clLocationManager stopUpdatingHeading];
  [(CLLocationManager *)self->_clLocationManager setDelegate:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__MNCoreLocationProvider_dealloc__block_invoke;
  v10[3] = &unk_1E60F6B98;
  v10[4] = self;
  MNRunSynchronouslyOnMainThread(v10);
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
    id v6 = objc_loadWeakRetained((id *)&self->_debug_deinitRunLoop);
    *(_DWORD *)buf = 134218496;
    v12 = self;
    __int16 v13 = 2048;
    __int16 v14 = WeakRetained;
    __int16 v15 = 2048;
    *(void *)uint64_t v16 = v6;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "%p CL manager created on %p, dealloced on %p", buf, 0x20u);
  }
  v9.receiver = self;
  v9.super_class = (Class)MNCoreLocationProvider;
  [(MNCoreLocationProvider *)&v9 dealloc];
}

void __33__MNCoreLocationProvider_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 96), v4);
}

- (void)setDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218498;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider setDelegate:] - %@ %p", (uint8_t *)&v6, 0x20u);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)_sharedInit
{
  double v2 = *MEMORY[0x1E4F1E6E0];
  self->_distanceFilter = *(double *)MEMORY[0x1E4F1E6C0];
  self->_desiredAccuracy = v2;
  self->_matchInfoEnabled = 1;
  self->_authorizationStatus = 0;
  self->_coarseModeEnabled = 0;
}

- (void)setCLParameters:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->_clLocationManager) {
    [(MNCoreLocationProvider *)self _updateForCLParameters:v5];
  }
  else {
    objc_storeStrong((id *)&self->_clParameters, a3);
  }
}

- (void)_createCLLocationManager
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v14 = [NSString stringWithFormat:@"Should be main thread"];
    __int16 v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = (MNCoreLocationProvider *)"-[MNCoreLocationProvider _createCLLocationManager]";
      __int16 v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNCoreLocationProvider.m";
      __int16 v27 = 1024;
      *(_DWORD *)v28 = 134;
      *(_WORD *)&v28[4] = 2080;
      *(void *)&v28[6] = "[NSThread isMainThread]";
      *(_WORD *)&v28[14] = 2112;
      *(void *)&v28[16] = v14;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  if (!self->_clLocationManager)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      effectiveBundle = self->_effectiveBundle;
      effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
      *(_DWORD *)buf = 134218499;
      v24 = self;
      __int16 v25 = 2113;
      v26 = (const char *)effectiveBundle;
      __int16 v27 = 2113;
      *(void *)v28 = effectiveBundleIdentifier;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p Creating with effective bundle: %{private}@ | identifier: %{private}@", buf, 0x20u);
    }

    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__MNCoreLocationProvider__createCLLocationManager__block_invoke;
    v16[3] = &unk_1E60F6488;
    v16[4] = self;
    v16[5] = &v17;
    MNRunSynchronouslyOnMainThread(v16);
    id v6 = (void *)v18[5];
    if (!v6)
    {
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v24 = self;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "%p CLLocationManager failed to init!", buf, 0xCu);
      }

      id v6 = (void *)v18[5];
    }
    [v6 setDistanceFilter:self->_distanceFilter];
    [(id)v18[5] setDesiredAccuracy:self->_desiredAccuracy];
    [(id)v18[5] setMatchInfoEnabled:self->_matchInfoEnabled];
    objc_storeStrong((id *)&self->_clLocationManager, (id)v18[5]);
    [(MNCoreLocationProvider *)self _updateForCLParameters:self->_clParameters];
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
      clLocationManager = self->_clLocationManager;
      [(id)v18[5] distanceFilter];
      uint64_t v12 = v11;
      [(id)v18[5] desiredAccuracy];
      *(_DWORD *)buf = 134219011;
      v24 = self;
      __int16 v25 = 2048;
      v26 = WeakRetained;
      __int16 v27 = 2113;
      *(void *)v28 = clLocationManager;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v12;
      *(_WORD *)&v28[18] = 2048;
      *(void *)&v28[20] = v13;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "%p CLLocationManager created on %p | %{private}@ | distanceFilter: %g | desiredAccuracy: %g", buf, 0x34u);
    }
    _Block_object_dispose(&v17, 8);
  }
}

void __50__MNCoreLocationProvider__createCLLocationManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1E600]);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) bundlePath];
    uint64_t v5 = [v3 initWithEffectiveBundlePath:v4 delegate:*(void *)(a1 + 32) onQueue:MEMORY[0x1E4F14428]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else if (*(void *)(v2 + 56))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1E600]);
    uint64_t v9 = [v8 initWithEffectiveBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 56) delegate:*(void *)(a1 + 32) onQueue:MEMORY[0x1E4F14428]];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1E600]);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
  }
  id v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 88), v15);
}

- (CLLocationManager)_clLocationManager
{
  clLocationManager = self->_clLocationManager;
  if (!clLocationManager)
  {
    [(MNCoreLocationProvider *)self _createCLLocationManager];
    clLocationManager = self->_clLocationManager;
  }
  return clLocationManager;
}

- (void)_updateForCLParameters:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_clLocationManager)
  {
    -[CLLocationManager setActivityType:](self->_clLocationManager, "setActivityType:", [v4 activityType]);
    -[CLLocationManager _setFusionInfoEnabled:](self->_clLocationManager, "_setFusionInfoEnabled:", [v5 fusionInfoEnabled]);
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218496;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      int v11 = [v5 activityType];
      __int16 v12 = 1024;
      int v13 = [v5 fusionInfoEnabled];
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setting CL parameters: activityType:%d, fusionInfoEnabled:%d", (uint8_t *)&v8, 0x18u);
    }

    clParameters = self->_clParameters;
    self->_clParameters = 0;
  }
}

- (void)_updateAuthorizationStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider _updateAuthorizationStatus", buf, 0xCu);
  }

  clLocationManager = self->_clLocationManager;
  int v5 = [MEMORY[0x1E4F29060] isMainThread];
  if (clLocationManager)
  {
    if ((v5 & 1) == 0)
    {
      __int16 v10 = [NSString stringWithFormat:@"_updateAuthorizationStatus needs to be called on the main thread"];
      int v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = (MNCoreLocationProvider *)"[NSThread isMainThread]";
        __int16 v15 = 2112;
        *(void *)uint64_t v16 = v10;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }
    }
    self->_int authorizationStatus = [(CLLocationManager *)self->_clLocationManager authorizationStatus];
    [(MNCoreLocationProvider *)self _updateCoarseModeEnabled];
    self->_hasQueriedAuthorization = 1;
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int authorizationStatus = self->_authorizationStatus;
      effectiveBundle = self->_effectiveBundle;
      effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
      *(_DWORD *)buf = 134218755;
      uint64_t v14 = self;
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = authorizationStatus;
      *(_WORD *)&v16[4] = 2113;
      *(void *)&void v16[6] = effectiveBundle;
      __int16 v17 = 2113;
      int v18 = effectiveBundleIdentifier;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p CL authorization status: %d | bundle: %{private}@ | identifier: %{private}@", buf, 0x26u);
    }
  }
  else if (v5)
  {
    [(MNCoreLocationProvider *)self _createCLLocationManager];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MNCoreLocationProvider__updateAuthorizationStatus__block_invoke;
    block[3] = &unk_1E60F6B98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__MNCoreLocationProvider__updateAuthorizationStatus__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createCLLocationManager];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateAuthorizationStatus];
}

- (void)_updateCoarseModeEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_clLocationManager)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int v8 = self;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider _updateCoarseModeEnabled", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = (self->_authorizationStatus - 3) <= 1
      && [(CLLocationManager *)self->_clLocationManager accuracyAuthorization] == CLAccuracyAuthorizationReducedAccuracy;
    if (self->_coarseModeEnabled != v4)
    {
      int v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = @"YES";
        if (!self->_coarseModeEnabled) {
          uint64_t v6 = @"NO";
        }
        int v7 = 134218242;
        int v8 = self;
        __int16 v9 = 2112;
        __int16 v10 = v6;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%p CL Coarse Mode Enabled: %@", (uint8_t *)&v7, 0x16u);
      }

      self->_coarseModeEnabled = v4;
    }
  }
}

- (void)setDistanceFilter:(double)a3
{
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
  -[CLLocationManager setDesiredAccuracy:](self->_clLocationManager, "setDesiredAccuracy:");
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  self->_matchInfoEnabled = a3;
  -[CLLocationManager setMatchInfoEnabled:](self->_clLocationManager, "setMatchInfoEnabled:");
}

- (void)startUpdatingLocation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_effectiveBundle && !self->_effectiveBundleIdentifier)
  {
    BOOL v4 = [NSString stringWithFormat:@"Bundle or bundle identifier must be set to create a CoreLocation provider."];
    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v8 = (MNCoreLocationProvider *)"_effectiveBundle != nil || _effectiveBundleIdentifier != nil";
      __int16 v9 = 2112;
      __int16 v10 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v8 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider startUpdatingLocation", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MNCoreLocationProvider_startUpdatingLocation__block_invoke;
  v6[3] = &unk_1E60F6B98;
  v6[4] = self;
  MNRunAsynchronouslyOnMainThread(v6);
}

uint64_t __47__MNCoreLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    [v2 _createCLLocationManager];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 _updateAuthorizationStatus];
  if (([*(id *)(a1 + 32) isAuthorized] & 1) == 0)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Trying to start Navigation location updates without location authorization", (uint8_t *)&v7, 2u);
    }
  }
  BOOL v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "%p Calling startUpdatingLocation on CLLocationManager", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider stopUpdatingLocation", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MNCoreLocationProvider_stopUpdatingLocation__block_invoke;
  v4[3] = &unk_1E60F6B98;
  v4[4] = self;
  MNRunAsynchronouslyOnMainThread(v4);
}

uint64_t __46__MNCoreLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stopUpdatingLocation];
}

- (void)requestLocation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider requestLocation", (uint8_t *)&v4, 0xCu);
  }

  [(CLLocationManager *)self->_clLocationManager requestLocation];
}

- (void)startUpdatingHeading
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider startUpdatingHeading", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(MNCoreLocationProvider *)self _clLocationManager];
  [v4 startUpdatingHeading];
}

- (void)stopUpdatingHeading
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    int v5 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider stopUpdatingHeading", (uint8_t *)&v4, 0xCu);
  }

  [(CLLocationManager *)self->_clLocationManager stopUpdatingHeading];
}

- (void)startUpdatingVehicleSpeed
{
  [(CLLocationManager *)self->_clLocationManager startUpdatingVehicleSpeed];
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "Starting vehicle speed updates", v3, 2u);
  }
}

- (void)stopUpdatingVehicleSpeed
{
  [(CLLocationManager *)self->_clLocationManager stopUpdatingVehicleSpeed];
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "Stopping vehicle speed updates", v3, 2u);
  }
}

- (void)startUpdatingVehicleHeading
{
  [(CLLocationManager *)self->_clLocationManager startUpdatingVehicleHeading];
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "Starting vehicle heading updates", v3, 2u);
  }
}

- (void)stopUpdatingVehicleHeading
{
  [(CLLocationManager *)self->_clLocationManager stopUpdatingVehicleHeading];
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "Stopping vehicle heading updates", v3, 2u);
  }
}

- (void)resetForActiveTileGroupChanged
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    int v5 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider resetForActiveTileGroupChanged", (uint8_t *)&v4, 0xCu);
  }

  [(MNCoreLocationProvider *)self stopUpdatingLocation];
  [(MNCoreLocationProvider *)self startUpdatingLocation];
}

- (void)_resetForNewEffectiveBundle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  clLocationManager = self->_clLocationManager;
  if (clLocationManager)
  {
    [(CLLocationManager *)clLocationManager desiredAccuracy];
    double v5 = v4;
    [(CLLocationManager *)self->_clLocationManager setDelegate:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__MNCoreLocationProvider__resetForNewEffectiveBundle__block_invoke;
    v9[3] = &unk_1E60F6B98;
    v9[4] = self;
    MNRunSynchronouslyOnMainThread(v9);
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
      id v8 = objc_loadWeakRetained((id *)&self->_debug_deinitRunLoop);
      *(_DWORD *)buf = 134218496;
      uint64_t v11 = self;
      __int16 v12 = 2048;
      id v13 = WeakRetained;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p CL manager created on %p, dealloced on %p", buf, 0x20u);
    }
    [(MNCoreLocationProvider *)self _updateAuthorizationStatus];
    [(MNCoreLocationProvider *)self setDesiredAccuracy:v5];
  }
}

void __53__MNCoreLocationProvider__resetForNewEffectiveBundle__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 40) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 96), v4);
}

- (NSBundle)effectiveBundle
{
  return self->_effectiveBundle;
}

- (void)setEffectiveBundle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    clLocationManager = self->_clLocationManager;
    int v8 = 134218499;
    uint64_t v9 = self;
    __int16 v10 = 2113;
    id v11 = v5;
    __int16 v12 = 2113;
    id v13 = clLocationManager;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setEffectiveBundle: %{private}@ | CL: %{private}@", (uint8_t *)&v8, 0x20u);
  }

  if (([v5 isEqual:self->_effectiveBundle] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveBundle, a3);
    [(MNCoreLocationProvider *)self _resetForNewEffectiveBundle];
  }
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clLocationManager = self->_clLocationManager;
    int v9 = 134218499;
    __int16 v10 = self;
    __int16 v11 = 2113;
    id v12 = v4;
    __int16 v13 = 2113;
    uint64_t v14 = clLocationManager;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setEffectiveBundleIdentifier: %{private}@ | CL: %{private}@", (uint8_t *)&v9, 0x20u);
  }

  if (![(NSString *)self->_effectiveBundleIdentifier isEqualToString:v4])
  {
    uint64_t v7 = (NSString *)[v4 copy];
    effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
    self->_effectiveBundleIdentifier = v7;

    if (self->_clLocationManager) {
      [(MNCoreLocationProvider *)self _resetForNewEffectiveBundle];
    }
  }
}

- (BOOL)isAuthorized
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MNCoreLocationProvider_isAuthorized__block_invoke;
  v4[3] = &unk_1E60F6488;
  v4[4] = self;
  void v4[5] = &v5;
  MNRunSynchronouslyOnMainThread(v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__MNCoreLocationProvider_isAuthorized__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 8))
  {
    [(id)result _updateAuthorizationStatus];
    uint64_t result = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(_DWORD *)(result + 40) - 3) < 2;
  return result;
}

- (int)headingOrientation
{
  return [(CLLocationManager *)self->_clLocationManager headingOrientation];
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    char v8 = self;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setHeadingOrientation: %d", (uint8_t *)&v7, 0x12u);
  }

  uint64_t v6 = [(MNCoreLocationProvider *)self _clLocationManager];
  [v6 setHeadingOrientation:v3];
}

- (double)expectedGpsUpdateInterval
{
  [(CLLocationManager *)self->_clLocationManager expectedGpsUpdateInterval];
  return result;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  return 1.0;
}

- (void)startMonitoringForRegion:(id)a3
{
}

- (void)stopMonitoringForRegion:(id)a3
{
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained locationProvider:self didUpdateHeading:v6];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v8 = NSStringFromSelector(a2);
    int v10 = 138477827;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "%{private}@", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained locationProvider:self didReceiveError:v6];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_int authorizationStatus = [a3 authorizationStatus];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int authorizationStatus = self->_authorizationStatus;
    int v8 = 134218240;
    __int16 v9 = self;
    __int16 v10 = 1024;
    int v11 = authorizationStatus;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider locationManagerDidChangeAuthorization: %d", (uint8_t *)&v8, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained locationProviderDidChangeAuthorizationStatus:self];

  LODWORD(WeakRetained) = self->_coarseModeEnabled;
  [(MNCoreLocationProvider *)self _updateCoarseModeEnabled];
  if (self->_coarseModeEnabled != WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 locationProvider:self didChangeCoarseMode:self->_coarseModeEnabled];
  }
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained locationProviderShouldPauseLocationUpdates:self];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 locationProviderDidPauseLocationUpdates:self];
  }
  else
  {
    [v7 startUpdatingLocation];
  }
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained locationProviderDidResumeLocationUpdates:self];
}

- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    [v5 speed];
    uint64_t v8 = v7;
    __int16 v9 = [v5 timestamp];
    int v14 = 134218243;
    uint64_t v15 = v8;
    __int16 v16 = 2113;
    __int16 v17 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle speed: %g | %{private}@", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 speed];
  double v12 = v11;
  __int16 v13 = [v5 timestamp];
  [WeakRetained locationProvider:self didUpdateVehicleSpeed:v13 timestamp:v12];
}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    [v5 trueHeading];
    uint64_t v8 = v7;
    __int16 v9 = [v5 timestamp];
    int v14 = 134218243;
    uint64_t v15 = v8;
    __int16 v16 = 2113;
    __int16 v17 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle heading: %g | %{private}@", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 trueHeading];
  double v12 = v11;
  __int16 v13 = [v5 timestamp];
  [WeakRetained locationProvider:self didUpdateVehicleHeading:v13 timestamp:v12];
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 locationProvider:self didEnterRegion:v8];
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 locationProvider:self didExitRegion:v8];
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 locationProvider:self monitoringDidFailForRegion:v11 withError:v7];
  }
}

- (MNLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNLocationProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debug_deinitRunLoop);
  objc_destroyWeak((id *)&self->_debug_initRunLoop);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clParameters, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end