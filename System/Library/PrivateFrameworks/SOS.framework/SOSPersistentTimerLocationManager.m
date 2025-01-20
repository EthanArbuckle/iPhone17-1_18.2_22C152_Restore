@interface SOSPersistentTimerLocationManager
+ (SOSPersistentTimerLocationManager)sharedInstance;
- (BOOL)isRequestingLocation;
- (BOOL)isValid;
- (CLAssertion)forceEnableLocationAssertion;
- (CLLocation)lastLocation;
- (SOSPersistentTimerLocationManager)init;
- (SOSPersistentTimerLocationManagerDelegate)delegate;
- (void)_emergencyLocationAssertionTimeOut:(id)a3;
- (void)_requestLocationsTimeout:(id)a3;
- (void)_sosPersistentTimerInitialRequest:(id)a3;
- (void)_sosPersistentTimerLocationManagerTic:(id)a3;
- (void)_startTimer;
- (void)dealloc;
- (void)fireAndStartTimertWithTimeInterval:(double)a3;
- (void)invalidateInitialTimer;
- (void)invalidateRequestLocationsTimer;
- (void)invalidateTimer;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)requestLocation;
- (void)setDelegate:(id)a3;
- (void)setForceEnableLocationAssertion:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setRequestingLocation:(BOOL)a3;
- (void)stopRequestingLocationUpdates;
- (void)warmUpLocationRequest;
@end

@implementation SOSPersistentTimerLocationManager

+ (SOSPersistentTimerLocationManager)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sSOSPersistentTimerLocationManager;

  return (SOSPersistentTimerLocationManager *)v2;
}

uint64_t __51__SOSPersistentTimerLocationManager_sharedInstance__block_invoke()
{
  sharedInstance_sSOSPersistentTimerLocationManager = objc_alloc_init(SOSPersistentTimerLocationManager);

  return MEMORY[0x1F41817F8]();
}

- (SOSPersistentTimerLocationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOSPersistentTimerLocationManager;
  v2 = [(SOSPersistentTimerLocationManager *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1E600]);
    v4 = +[SOSUtilities sosLocationBundle];
    uint64_t v5 = [v3 initWithEffectiveBundle:v4 delegate:v2 onQueue:MEMORY[0x1E4F14428]];
    locationManager = v2->_locationManager;
    v2->_locationManager = (CLLocationManager *)v5;

    [(CLLocationManager *)v2->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E6D8]];
  }
  return v2;
}

- (void)dealloc
{
  [(SOSPersistentTimerLocationManager *)self invalidateTimer];
  [(SOSPersistentTimerLocationManager *)self invalidateInitialTimer];
  [(PCPersistentTimer *)self->_assertionTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SOSPersistentTimerLocationManager;
  [(SOSPersistentTimerLocationManager *)&v3 dealloc];
}

- (void)warmUpLocationRequest
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[SOSPersistentTimerLocationManager warmUpLocationRequest]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - Warming up location request", (uint8_t *)&v5, 0xCu);
  }

  [(SOSPersistentTimerLocationManager *)self invalidateInitialTimer];
  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  [(SOSPersistentTimerLocationManager *)self requestLocation];
}

- (void)requestLocation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[SOSPersistentTimerLocationManager requestLocation]";
    __int16 v9 = 1024;
    BOOL v10 = [(SOSPersistentTimerLocationManager *)self isRequestingLocation];
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - Requesting location; self.isRequestingLocation: %d",
      (uint8_t *)&v7,
      0x12u);
  }

  if (![(SOSPersistentTimerLocationManager *)self isRequestingLocation])
  {
    [(SOSPersistentTimerLocationManager *)self setRequestingLocation:1];
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  }
  [(SOSPersistentTimerLocationManager *)self invalidateRequestLocationsTimer];
  if ([(SOSPersistentTimerLocationManager *)self shouldStopRequestingLocationAfterCallback])
  {
    v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      objc_super v8 = "-[SOSPersistentTimerLocationManager requestLocation]";
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "%s - starting _requestLocationsTimer", (uint8_t *)&v7, 0xCu);
    }

    int v5 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:@"com.apple.sos.locationManager" serviceIdentifier:self target:sel__requestLocationsTimeout_ selector:0 userInfo:35.0];
    requestLocationsTimer = self->_requestLocationsTimer;
    self->_requestLocationsTimer = v5;
  }
}

- (void)_requestLocationsTimeout:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SOSPersistentTimerLocationManager _requestLocationsTimeout:]";
    __int16 v8 = 2048;
    uint64_t v9 = 0x4041800000000000;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "%s - Timing out after requesting location for %f seconds", (uint8_t *)&v6, 0x16u);
  }

  [(SOSPersistentTimerLocationManager *)self stopRequestingLocationUpdates];
  if ([(SOSPersistentTimerLocationManager *)self isValid])
  {
    int v5 = [(SOSPersistentTimerLocationManager *)self delegate];
    [v5 sosPersistentTimerLocationManagerTimerFired:self location:self->_lastLocation];
  }
}

- (void)invalidateRequestLocationsTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestLocationsTimer = self->_requestLocationsTimer;
    int v6 = 136315394;
    int v7 = "-[SOSPersistentTimerLocationManager invalidateRequestLocationsTimer]";
    __int16 v8 = 2112;
    uint64_t v9 = requestLocationsTimer;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - _requestLocationsTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  [(PCPersistentTimer *)self->_requestLocationsTimer invalidate];
  int v5 = self->_requestLocationsTimer;
  self->_requestLocationsTimer = 0;
}

- (void)stopRequestingLocationUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[SOSPersistentTimerLocationManager stopRequestingLocationUpdates]";
    __int16 v6 = 1024;
    BOOL v7 = [(SOSPersistentTimerLocationManager *)self isRequestingLocation];
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - self.isRequestingLocation: %d", (uint8_t *)&v4, 0x12u);
  }

  if ([(SOSPersistentTimerLocationManager *)self isRequestingLocation])
  {
    [(SOSPersistentTimerLocationManager *)self setRequestingLocation:0];
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
}

- (void)_startTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(SOSPersistentTimerLocationManager *)self invalidateTimer];
  objc_super v3 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:@"com.apple.sos.locationManager" serviceIdentifier:self target:sel__sosPersistentTimerLocationManagerTic_ selector:0 userInfo:self->_ti];
  locationUpdateTimer = self->_locationUpdateTimer;
  self->_locationUpdateTimer = v3;

  int v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = self->_locationUpdateTimer;
    int v9 = 136315394;
    uint64_t v10 = "-[SOSPersistentTimerLocationManager _startTimer]";
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s - _locationUpdateTimer: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PCPersistentTimer *)self->_locationUpdateTimer setMinimumEarlyFireProportion:1.0];
  BOOL v7 = self->_locationUpdateTimer;
  uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(PCPersistentTimer *)v7 scheduleInRunLoop:v8];
}

- (void)fireAndStartTimertWithTimeInterval:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    lastLocation = self->_lastLocation;
    int v15 = 136315394;
    v16 = "-[SOSPersistentTimerLocationManager fireAndStartTimertWithTimeInterval:]";
    __int16 v17 = 2112;
    v18 = lastLocation;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s - _lastLocation: %@", (uint8_t *)&v15, 0x16u);
  }

  self->_ti = a3;
  [(SOSPersistentTimerLocationManager *)self _startTimer];
  if (self->_lastLocation
    && ([(SOSPersistentTimerLocationManager *)self delegate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 locationIsValidToSend:self->_lastLocation],
        v7,
        v8))
  {
    [(SOSPersistentTimerLocationManager *)self stopRequestingLocationUpdates];
    int v9 = [(SOSPersistentTimerLocationManager *)self delegate];
    [v9 sosPersistentTimerLocationManagerTimerFired:self location:self->_lastLocation];
  }
  else
  {
    if (![(SOSPersistentTimerLocationManager *)self isRequestingLocation]) {
      [(SOSPersistentTimerLocationManager *)self requestLocation];
    }
    [(SOSPersistentTimerLocationManager *)self invalidateInitialTimer];
    uint64_t v10 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:@"com.apple.sos.locationManager.initialRequest" serviceIdentifier:self target:sel__sosPersistentTimerInitialRequest_ selector:0 userInfo:20.0];
    initalRequestTimer = self->_initalRequestTimer;
    self->_initalRequestTimer = v10;

    v12 = sos_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_initalRequestTimer;
      int v15 = 136315394;
      v16 = "-[SOSPersistentTimerLocationManager fireAndStartTimertWithTimeInterval:]";
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "%s - Created _initalRequestTimer: %@", (uint8_t *)&v15, 0x16u);
    }

    [(PCPersistentTimer *)self->_initalRequestTimer setMinimumEarlyFireProportion:1.0];
    v14 = self->_initalRequestTimer;
    int v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(PCPersistentTimer *)v14 scheduleInRunLoop:v9];
  }
}

- (void)invalidateTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    locationUpdateTimer = self->_locationUpdateTimer;
    int v6 = 136315394;
    BOOL v7 = "-[SOSPersistentTimerLocationManager invalidateTimer]";
    __int16 v8 = 2112;
    int v9 = locationUpdateTimer;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - _locationUpdateTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  [(PCPersistentTimer *)self->_locationUpdateTimer invalidate];
  int v5 = self->_locationUpdateTimer;
  self->_locationUpdateTimer = 0;
}

- (void)invalidateInitialTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    initalRequestTimer = self->_initalRequestTimer;
    int v6 = 136315394;
    BOOL v7 = "-[SOSPersistentTimerLocationManager invalidateInitialTimer]";
    __int16 v8 = 2112;
    int v9 = initalRequestTimer;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - _initalRequestTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  [(PCPersistentTimer *)self->_initalRequestTimer invalidate];
  int v5 = self->_initalRequestTimer;
  self->_initalRequestTimer = 0;
}

- (BOOL)isValid
{
  return [(PCPersistentTimer *)self->_locationUpdateTimer isValid];
}

- (void)_sosPersistentTimerInitialRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SOSPersistentTimerLocationManager _sosPersistentTimerInitialRequest:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s - _initalRequestTimer fired: %@", (uint8_t *)&v7, 0x16u);
  }

  int v6 = [(SOSPersistentTimerLocationManager *)self delegate];
  [v6 sosPersistentTimerLocationManagerTimerFired:self location:self->_lastLocation];

  [(SOSPersistentTimerLocationManager *)self invalidateInitialTimer];
}

- (void)_sosPersistentTimerLocationManagerTic:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SOSPersistentTimerLocationManager _sosPersistentTimerLocationManagerTic:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s - timer: %@", (uint8_t *)&v7, 0x16u);
  }

  [(SOSPersistentTimerLocationManager *)self requestLocation];
  [(SOSPersistentTimerLocationManager *)self _startTimer];
  int v6 = [(SOSPersistentTimerLocationManager *)self delegate];
  [v6 sosPersistentTimerLocationManagerTimerFired:self location:self->_lastLocation];
}

- (void)setRequestingLocation:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_requestingLocation != a3)
  {
    self->_BOOL requestingLocation = a3;
    if (a3)
    {
      id v4 = (void *)MEMORY[0x1E4F1E5B0];
      int v5 = +[SOSUtilities sosLocationBundle];
      int v6 = (void *)[v4 newAssertionForBundle:v5 withReason:@"com.apple.sos.locationManager"];
      [(SOSPersistentTimerLocationManager *)self setForceEnableLocationAssertion:v6];
    }
    else
    {
      [(SOSPersistentTimerLocationManager *)self setForceEnableLocationAssertion:0];
    }
    int v7 = sos_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL requestingLocation = self->_requestingLocation;
      int v9 = 136315394;
      id v10 = "-[SOSPersistentTimerLocationManager setRequestingLocation:]";
      __int16 v11 = 1024;
      BOOL v12 = requestingLocation;
      _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "%s - Updated _requestingLocation to %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)setForceEnableLocationAssertion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = (CLAssertion *)a3;
  int v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "%s - forceEnableLocationAssertion", (uint8_t *)&v17, 0xCu);
  }

  p_forceEnableLocationAssertion = &self->_forceEnableLocationAssertion;
  forceEnableLocationAssertion = self->_forceEnableLocationAssertion;
  if (forceEnableLocationAssertion != v5)
  {
    if (forceEnableLocationAssertion)
    {
      [(CLAssertion *)forceEnableLocationAssertion invalidate];
      [(PCPersistentTimer *)self->_assertionTimer invalidate];
      assertionTimer = self->_assertionTimer;
      self->_assertionTimer = 0;
    }
    objc_storeStrong((id *)&self->_forceEnableLocationAssertion, a3);
    if (*p_forceEnableLocationAssertion)
    {
      id v10 = sos_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
        _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "%s - Setting up new location _assertionTimer", (uint8_t *)&v17, 0xCu);
      }

      [(PCPersistentTimer *)self->_assertionTimer invalidate];
      __int16 v11 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:@"com.apple.sos.locationManager" serviceIdentifier:self target:sel__emergencyLocationAssertionTimeOut_ selector:0 userInfo:60.0];
      BOOL v12 = self->_assertionTimer;
      self->_assertionTimer = v11;

      [(PCPersistentTimer *)self->_assertionTimer setMinimumEarlyFireProportion:1.0];
      uint64_t v13 = self->_assertionTimer;
      v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(PCPersistentTimer *)v13 scheduleInRunLoop:v14];
    }
    int v15 = sos_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *p_forceEnableLocationAssertion;
      int v17 = 136315394;
      v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "%s - Created new _forceEnableLocationAssertion: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[SOSPersistentTimerLocationManager locationManager:didUpdateLocations:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "%s - didUpdateLocations: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SOSPersistentTimerLocationManager_locationManager_didUpdateLocations___block_invoke;
  v7[3] = &unk_1E6064E30;
  v7[4] = self;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v7];
}

void __72__SOSPersistentTimerLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  __int16 v8 = sos_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int v15 = "-[SOSPersistentTimerLocationManager locationManager:didUpdateLocations:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "%s - location: %@", (uint8_t *)&v14, 0x16u);
  }

  int v9 = [*(id *)(a1 + 32) delegate];
  int v10 = [v9 locationIsValidToSend:v7];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
    [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 56);
    *(void *)(v11 + 56) = 0;

    if ([*(id *)(a1 + 32) shouldStopRequestingLocationAfterCallback])
    {
      [*(id *)(a1 + 32) stopRequestingLocationUpdates];
      [*(id *)(a1 + 32) invalidateRequestLocationsTimer];
      if ([*(id *)(a1 + 32) isValid])
      {
        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        [v13 sosPersistentTimerLocationManagerTimerFired:*(void *)(a1 + 32) location:*(void *)(*(void *)(a1 + 32) + 88)];

        [*(id *)(a1 + 32) invalidateInitialTimer];
      }
    }
    *a4 = 1;
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] CLLocationManager error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_emergencyLocationAssertionTimeOut:(id)a3
{
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "locationManager _emergencyLocationAssertionTimeOut", v6, 2u);
  }

  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;

  [(SOSPersistentTimerLocationManager *)self stopRequestingLocationUpdates];
  [(SOSPersistentTimerLocationManager *)self setForceEnableLocationAssertion:0];
}

- (BOOL)isRequestingLocation
{
  return self->_requestingLocation;
}

- (SOSPersistentTimerLocationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SOSPersistentTimerLocationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLAssertion)forceEnableLocationAssertion
{
  return self->_forceEnableLocationAssertion;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_forceEnableLocationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_initalRequestTimer, 0);
  objc_storeStrong((id *)&self->_requestLocationsTimer, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locationUpdateStartQueue, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end