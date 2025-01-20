@interface CLMicroLocationLoiBridge
- (CLLocationManager)clLocationManager;
- (CLMicroLocationLoiBridge)initWithQueue:(id)a3;
- (CLMicroLocationLoiClient)microLocationLoiClient;
- (CLMonitor)regionMonitor;
- (CLMonitorConfiguration)regionMonitorConfiguration;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (ULTimer)fetchPlaceInferenceTimer;
- (id)generateLocationManagerNotAvailableError;
- (id)generateRegionMonitorNotAvailableError;
- (id)retrieveAllActiveGeofences;
- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3;
- (void)dealloc;
- (void)fetchLocationOfInterestAtLocation:(id)a3;
- (void)fetchPlaceInferenceAtCurrentLocationWithPolicy:(unint64_t)a3;
- (void)fetchRelatedLoisForLoi:(id)a3;
- (void)generateGeofenceUpdateToClient:(id)a3;
- (void)getAllActiveGeofences;
- (void)getCurrentLocation;
- (void)invalidateFetchPlaceInferenceTimer;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4;
- (void)removeGeofenceWithRegionId:(id)a3;
- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4;
- (void)requestBootstrapWithLastGeofenceStates;
- (void)setClLocationManager:(id)a3;
- (void)setFetchPlaceInferenceTimer:(id)a3;
- (void)setGeofenceAtLocation:(id)a3;
- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3;
- (void)setQueue:(id)a3;
- (void)setRegionMonitor:(id)a3;
- (void)setRegionMonitorConfiguration:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setupFetchPlaceInferenceTimer;
- (void)setupRegionMonitoring;
- (void)startLeechingLocationUpdates;
- (void)startVisitMonitoring;
- (void)stopLeechingLocationUpdates;
@end

@implementation CLMicroLocationLoiBridge

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void, void))(*(void *)v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void __63__CLMicroLocationLoiBridge_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void))(*(void *)v2 + 32))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (CLMicroLocationLoiClient)microLocationLoiClient
{
  return self->_microlocationLoiClient;
}

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [CLMicroLocationLoi alloc];
  v8 = [v5 identifier];
  v9 = -[CLMicroLocationLoi initWithIdentifier:andType:](v7, "initWithIdentifier:andType:", v8, [v5 type]);

  v10 = [a1[4] queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_3;
  v13[3] = &unk_2653F9E30;
  objc_copyWeak(&v17, a1 + 6);
  v14 = v9;
  id v15 = a1[5];
  id v16 = v6;
  id v11 = v6;
  v12 = v9;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v17);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(CLMicroLocationLoiBridge *)self queue];
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  v7 = (id)logObject_MicroLocation_Default;
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  v9 = (double *)MEMORY[0x263F00B40];
  if (v8)
  {
    v10 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    [v10 desiredAccuracy];
    if (v11 == *v9) {
      v12 = "YES";
    }
    else {
      v12 = "NO";
    }
    v13 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    [v13 desiredAccuracy];
    if (v14 == *MEMORY[0x263F00B38]) {
      id v15 = "YES";
    }
    else {
      id v15 = "NO";
    }
    id buf = (id)68289538;
    __int16 v38 = 2082;
    v39 = "";
    __int16 v40 = 2082;
    v41 = v12;
    __int16 v42 = 2082;
    v43 = v15;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Got Location Update\", \"Waiting on location: \":%{public, location:escape_only}s, \"Leeching location: \":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
  }
  if (v5 && [v5 count])
  {
    id v16 = 0;
    id v17 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v35 = *MEMORY[0x263F08320];
    v36 = @"Failed to get current Location";
    v19 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v16 = (void *)[v18 initWithDomain:*MEMORY[0x263F00B00] code:5 userInfo:v19];

    id v17 = 0;
  }
  v20 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v20 desiredAccuracy];
  if (v21 != *v9) {
    goto LABEL_18;
  }
  [v17 horizontalAccuracy];
  BOOL v23 = v22 > ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();

  if (v23)
  {

    id v24 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v33 = *MEMORY[0x263F08320];
    v34 = @"Failed to get current Location";
    v20 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v25 = [v24 initWithDomain:*MEMORY[0x263F00B00] code:5 userInfo:v20];

    id v17 = 0;
    id v16 = (void *)v25;
LABEL_18:
  }
  objc_initWeak(&buf, self);
  v26 = [(CLMicroLocationLoiBridge *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CLMicroLocationLoiBridge_locationManager_didUpdateLocations___block_invoke;
  block[3] = &unk_2653F9E08;
  objc_copyWeak(&v32, &buf);
  id v30 = v17;
  id v31 = v16;
  id v27 = v16;
  id v28 = v17;
  dispatch_async(v26, block);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&buf);
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)fetchLocationOfInterestAtLocation:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CLMicroLocationLoiBridge *)self routineManager];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Routine Monitor is not active";
    BOOL v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v9 = (void *)[v7 initWithDomain:*MEMORY[0x263F00B00] code:1 userInfo:v8];

    v10 = [(CLMicroLocationLoiBridge *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke;
    block[3] = &unk_2653F9E08;
    objc_copyWeak(&v20, &location);
    id v18 = v4;
    id v19 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v20);
  }
  v12 = [(CLMicroLocationLoiBridge *)self routineManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_2;
  v14[3] = &unk_2653F9E58;
  v14[4] = self;
  objc_copyWeak(&v16, &location);
  id v13 = v4;
  id v15 = v13;
  [v12 fetchLocationOfInterestAtLocation:v13 withHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (CLMicroLocationLoiBridge)initWithQueue:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLMicroLocationLoiBridge;
  id v5 = [(CLMicroLocationLoiBridge *)&v23 init];
  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    BOOL v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, Init", v22, 2u);
    }
    [(CLMicroLocationLoiBridge *)v5 setQueue:v4];
    [(CLMicroLocationLoiBridge *)v5 setFetchPlaceInferenceTimer:0];
    id v7 = objc_alloc_init(MEMORY[0x263F37F08]);
    [(CLMicroLocationLoiBridge *)v5 setRoutineManager:v7];

    id v8 = objc_alloc(MEMORY[0x263F00A60]);
    v9 = [NSString stringWithUTF8String:"/System/Library/LocationBundles/Milod.bundle"];
    v10 = [(CLMicroLocationLoiBridge *)v5 queue];
    id v11 = (void *)[v8 initWithEffectiveBundlePath:v9 delegate:v5 onQueue:v10];
    [(CLMicroLocationLoiBridge *)v5 setClLocationManager:v11];

    v12 = [(CLMicroLocationLoiBridge *)v5 clLocationManager];

    if (!v12)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
      }
      id v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", v22, 2u);
      }
    }
    double v14 = [(CLMicroLocationLoiBridge *)v5 clLocationManager];
    [v14 setDesiredAccuracy:*MEMORY[0x263F00B40]];

    id v15 = +[ULDefaultsSingleton shared];
    id v16 = [v15 defaultsDictionary];

    id v17 = [NSString stringWithUTF8String:"ULEnabled"];
    id v18 = [v16 objectForKey:v17];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v19 = [v18 BOOLValue];
    }
    else {
      int v19 = [MEMORY[0x263EFFA88] BOOLValue];
    }
    int v20 = v19;

    if (v20) {
      [(CLMicroLocationLoiBridge *)v5 startVisitMonitoring];
    }
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v3 stopMonitoringVisits];

  v4.receiver = self;
  v4.super_class = (Class)CLMicroLocationLoiBridge;
  [(CLMicroLocationLoiBridge *)&v4 dealloc];
}

- (void)setupRegionMonitoring
{
  v3 = [(CLMicroLocationLoiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(CLMicroLocationLoiBridge *)self regionMonitorConfiguration];

  if (!v4)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    id v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, setupRegionMonitoring", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke;
    v20[3] = &unk_2653F9D40;
    objc_copyWeak(&v21, buf);
    BOOL v6 = (void *)MEMORY[0x25A2A6A70](v20);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke_2;
    id v18 = &unk_2653F9D68;
    objc_copyWeak(&v19, buf);
    id v7 = (void *)MEMORY[0x25A2A6A70](&v15);
    id v8 = objc_alloc(MEMORY[0x263F00A90]);
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "ULRegionMonitor", v15, v16, v17, v18);
    v10 = [NSString stringWithUTF8String:"/var/mobile/Library/com.apple.milod/"];
    id v11 = [(CLMicroLocationLoiBridge *)self queue];
    v12 = (void *)[v8 initWithName:v9 path:v10 onQueue:v11 eventHandler:v7 useMonitorQueueForVendingMonitor:1 vendingHandler:v6];
    [(CLMicroLocationLoiBridge *)self setRegionMonitorConfiguration:v12];

    id v13 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    double v14 = [(CLMicroLocationLoiBridge *)self regionMonitorConfiguration];
    [v13 requestMonitorWithConfiguration:v14 completion:v6];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
}

void __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      objc_super v4 = WeakRetained;
      id v5 = [WeakRetained queue];
      dispatch_assert_queue_V2(v5);

      [v4 setRegionMonitor:v6];
      [v4 requestBootstrapWithLastGeofenceStates];
    }
  }
}

void __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained queue];
    dispatch_assert_queue_V2(v8);

    [v7 regionMonitor:v9 didGenerateEvent:v5];
  }
}

- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3
{
  self->_microlocationLoiClient = a3;
}

- (void)requestBootstrapWithLastGeofenceStates
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, Bootstrapping", (uint8_t *)buf, 2u);
  }
  objc_super v4 = [(CLMicroLocationLoiBridge *)self regionMonitor];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    int v20 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted bootstraping when region monitor was not available", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_initWeak(buf, self);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = [(CLMicroLocationLoiBridge *)self regionMonitor];
    id v7 = [v6 monitoredIdentifiers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v12 = [(CLMicroLocationLoiBridge *)self regionMonitor];
          id v13 = [(id)v12 monitoringRecordForIdentifier:v11];

          double v14 = [v13 lastEvent];
          LOBYTE(v12) = v14 == 0;

          if ((v12 & 1) == 0)
          {
            uint64_t v15 = [(CLMicroLocationLoiBridge *)self queue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __66__CLMicroLocationLoiBridge_requestBootstrapWithLastGeofenceStates__block_invoke;
            block[3] = &unk_2653F9CD0;
            objc_copyWeak(&v24, buf);
            id v23 = v13;
            dispatch_async(v15, block);

            objc_destroyWeak(&v24);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }

    uint64_t v16 = [(CLMicroLocationLoiBridge *)self regionMonitor];
    id v17 = [v16 monitoredIdentifiers];
    BOOL v18 = [v17 count] == 0;

    if (v18)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
      }
      id v19 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v21 = 0;
        _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, No Geofences to bootstrap", v21, 2u);
      }
    }
    objc_destroyWeak(buf);
  }
}

void __66__CLMicroLocationLoiBridge_requestBootstrapWithLastGeofenceStates__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    v3 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_super v4 = [*(id *)(a1 + 32) lastEvent];
      id v5 = [v4 identifier];
      uint64_t v6 = [v5 UTF8String];
      id v7 = [*(id *)(a1 + 32) lastEvent];
      v9[0] = 68289539;
      v9[1] = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      __int16 v12 = 2081;
      uint64_t v13 = v6;
      __int16 v14 = 1025;
      int v15 = [v7 state];
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, generating bootstrap geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v9, 0x22u);
    }
    uint64_t v8 = [*(id *)(a1 + 32) lastEvent];
    [WeakRetained generateGeofenceUpdateToClient:v8];
  }
}

- (id)generateLocationManagerNotAvailableError
{
  v9[1] = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted LOI request when location manager was not available", v7, 2u);
  }
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = @"Location Manager not available";
  objc_super v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v5 = (void *)[v3 initWithDomain:*MEMORY[0x263F00B00] code:2 userInfo:v4];

  return v5;
}

- (id)generateRegionMonitorNotAvailableError
{
  v9[1] = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted geofence request when region monitor was not available", v7, 2u);
  }
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = @"Routine Monitor is not active";
  objc_super v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v5 = (void *)[v3 initWithDomain:*MEMORY[0x263F00B00] code:3 userInfo:v4];

  return v5;
}

- (void)generateGeofenceUpdateToClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CLMicroLocationLoiBridge *)self convertMonitoringEventToGeofenceState:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = [(CLMicroLocationLoiBridge *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__CLMicroLocationLoiBridge_generateGeofenceUpdateToClient___block_invoke;
  v8[3] = &unk_2653F9D90;
  objc_copyWeak(v10, &location);
  id v9 = v4;
  v10[1] = v5;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __59__CLMicroLocationLoiBridge_generateGeofenceUpdateToClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained microLocationLoiClient];
    id v4 = [*(id *)(a1 + 32) identifier];
    (*(void (**)(uint64_t, void *, void))(*(void *)v3 + 64))(v3, v4, *(void *)(a1 + 48));

    id WeakRetained = v5;
  }
}

- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3
{
  uint64_t v3 = [a3 state];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(CLMicroLocationLoiBridge *)self queue];
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  id v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 identifier];
    v9[0] = 68289539;
    v9[1] = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2081;
    uint64_t v13 = [v8 UTF8String];
    __int16 v14 = 1025;
    int v15 = [v5 state];
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, got geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v9, 0x22u);
  }
  [(CLMicroLocationLoiBridge *)self generateGeofenceUpdateToClient:v5];
}

- (void)startVisitMonitoring
{
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v4 _startLeechingVisits];
}

- (void)setupFetchPlaceInferenceTimer
{
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __57__CLMicroLocationLoiBridge_setupFetchPlaceInferenceTimer__block_invoke;
  id v7 = &unk_2653F9DB8;
  objc_copyWeak(&v8, &location);
  uint64_t v3 = +[ULTimerFactory timerOnPrimaryQueueWithInterval:0 repeats:&v4 block:5.0];
  -[CLMicroLocationLoiBridge setFetchPlaceInferenceTimer:](self, "setFetchPlaceInferenceTimer:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__CLMicroLocationLoiBridge_setupFetchPlaceInferenceTimer__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    uint64_t v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen\"}", buf, 0x12u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    uint64_t v3 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)id buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen", "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen\"}", buf, 0x12u);
    }
    [WeakRetained invalidateFetchPlaceInferenceTimer];
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v8 = *MEMORY[0x263F08320];
    id v9 = @"Request to fetch place inference timed out";
    uint64_t v5 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    uint64_t v6 = (void *)[v4 initWithDomain:*MEMORY[0x263F00B00] code:0 userInfo:v5];

    uint64_t v7 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void *))(*(void *)v7 + 8))(v7, 0, v6);
  }
}

- (void)invalidateFetchPlaceInferenceTimer
{
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self fetchPlaceInferenceTimer];
  [v3 invalidate];

  [(CLMicroLocationLoiBridge *)self setFetchPlaceInferenceTimer:0];
}

- (void)fetchPlaceInferenceAtCurrentLocationWithPolicy:(unint64_t)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = [(CLMicroLocationLoiBridge *)self clLocationManager];

  if (!v5)
  {
    uint64_t v6 = [(CLMicroLocationLoiBridge *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke;
    block[3] = &unk_2653F9DB8;
    objc_copyWeak(&v11, &location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v11);
  }
  [(CLMicroLocationLoiBridge *)self setupFetchPlaceInferenceTimer];
  uint64_t v7 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke_2;
  v8[3] = &unk_2653F9DE0;
  objc_copyWeak(&v9, &location);
  [v7 _fetchPlaceInferencesWithFidelityPolicy:a3 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    uint64_t v3 = [v4 generateLocationManagerNotAvailableError];
    (*(void (**)(uint64_t, void, void *))(*(void *)v2 + 8))(v2, 0, v3);

    id WeakRetained = v4;
  }
}

void __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    dispatch_assert_queue_V2(v9);

    [v8 invalidateFetchPlaceInferenceTimer];
    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
      }
      __int16 v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289283;
        __int16 v25 = 2082;
        long long v26 = "";
        __int16 v27 = 2113;
        id v28 = v6;
        _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, failed to request place inference, we will start leeching and wait for next location update\", \"Error Reason\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      BOOL v18 = v8;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v11);
            }
            int v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
            }
            uint64_t v16 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t buf = 68289283;
              __int16 v25 = 2082;
              long long v26 = "";
              __int16 v27 = 2113;
              id v28 = v15;
              _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, received Place Inference\", \"PI\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      id v6 = 0;
      uint64_t v8 = v18;
    }
    uint64_t v17 = [v8 microLocationLoiClient];
    (*(void (**)(uint64_t, id, id))(*(void *)v17 + 8))(v17, v5, v6);
  }
}

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void, void))(*(void *)v2 + 16))(v2, 0, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)fetchRelatedLoisForLoi:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CLMicroLocationLoiBridge *)self routineManager];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Routine Monitor is not active";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v9 = (void *)[v7 initWithDomain:*MEMORY[0x263F00B00] code:1 userInfo:v8];

    __int16 v10 = [(CLMicroLocationLoiBridge *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke;
    block[3] = &unk_2653F9CD0;
    objc_copyWeak(&v17, &location);
    id v16 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v17);
  }
  uint64_t v12 = [(CLMicroLocationLoiBridge *)self routineManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_2;
  v13[3] = &unk_2653F9DE0;
  objc_copyWeak(&v14, &location);
  [v12 fetchDedupedLocationOfInterestIdentifiersWithIdentifier:v4 handler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void))(*(void *)v2 + 24))(v2, 0, *(void *)(a1 + 32));
  }
}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v10 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_3;
    block[3] = &unk_2653F9E08;
    objc_copyWeak(&v14, v7);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }
}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = [v3 componentsJoinedByString:@","];
    }
    else
    {
      id v4 = &stru_2704E2F50;
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    id v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) count];
      v8[0] = 68289538;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2050;
      uint64_t v12 = v6;
      __int16 v13 = 2082;
      uint64_t v14 = [(__CFString *)v4 UTF8String];
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"LOI Bridge, received LOI Ids from CLRoutineMonitor\", \"LOI ID Count\":%{public}ld, \"LOI List\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x26u);
    }

    uint64_t v7 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void))(*(void *)v7 + 24))(v7, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (id)retrieveAllActiveGeofences
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(CLMonitor *)self->_regionMonitor monitoredIdentifiers];
  id v5 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v7 = 68289282;
    long long v24 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        __int16 v11 = -[CLMonitor monitoringRecordForIdentifier:](self->_regionMonitor, "monitoringRecordForIdentifier:", v10, v24);
        uint64_t v12 = v11;
        if (v11)
        {
          __int16 v13 = [v11 condition];
          uint64_t v14 = objc_alloc_init(CLMicroLocationGeofence);
          [(CLMicroLocationGeofence *)v14 setRegionId:v10];
          id v15 = objc_alloc(MEMORY[0x263F00A50]);
          [v13 center];
          double v17 = v16;
          [v13 center];
          BOOL v18 = objc_msgSend(v15, "initWithLatitude:longitude:", v17);
          [(CLMicroLocationGeofence *)v14 setRegionCenterLocation:v18];

          [v3 addObject:v14];
        }
        else
        {
          if (onceToken_MicroLocation_Default != -1) {
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
          }
          uint64_t v19 = (id)logObject_MicroLocation_Default;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = [v10 UTF8String];
            *(_DWORD *)uint64_t buf = v24;
            int v30 = 0;
            __int16 v31 = 2082;
            id v32 = "";
            __int16 v33 = 2082;
            uint64_t v34 = v20;
            _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }

          if (onceToken_MicroLocation_Default != -1) {
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
          }
          __int16 v13 = (id)logObject_MicroLocation_Default;
          if (os_signpost_enabled(v13))
          {
            uint64_t v21 = [v10 UTF8String];
            *(_DWORD *)uint64_t buf = v24;
            int v30 = 0;
            __int16 v31 = 2082;
            id v32 = "";
            __int16 v33 = 2082;
            uint64_t v34 = v21;
            _os_signpost_emit_with_name_impl(&dword_25631F000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LoiBridge, was unable to retrieve monitor record for valid region identifier", "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }

        ++v9;
      }
      while (v6 != v9);
      id v4 = v5;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v6);
  }

  long long v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v22;
}

- (void)getAllActiveGeofences
{
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self regionMonitor];

  if (v3)
  {
    uint64_t v3 = [(CLMicroLocationLoiBridge *)self retrieveAllActiveGeofences];
    id v4 = 0;
  }
  else
  {
    id v4 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
  }
  objc_initWeak(&location, self);
  id v5 = [(CLMicroLocationLoiBridge *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __49__CLMicroLocationLoiBridge_getAllActiveGeofences__block_invoke;
  v8[3] = &unk_2653F9E08;
  objc_copyWeak(&v11, &location);
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__CLMicroLocationLoiBridge_getAllActiveGeofences__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void))(*(void *)v2 + 48))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:a3 longitude:a4];
  if (self->_regionMonitor)
  {
    [(CLMicroLocationLoiBridge *)self retrieveAllActiveGeofences];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v28;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
          id v10 = objc_alloc(MEMORY[0x263F00A50]);
          id v11 = [v9 regionCenterLocation];
          [v11 coordinate];
          double v13 = v12;
          uint64_t v14 = [v9 regionCenterLocation];
          [v14 coordinate];
          id v15 = objc_msgSend(v10, "initWithLatitude:longitude:", v13);
          [v5 distanceFromLocation:v15];
          double v17 = v16;

          double v18 = ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();
          if (v17 <= v18 + v18)
          {
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
            }
            long long v22 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v9 regionId];
              uint64_t v24 = [v23 UTF8String];
              *(_DWORD *)uint64_t buf = 68289539;
              int v32 = 0;
              __int16 v33 = 2082;
              uint64_t v34 = "";
              __int16 v35 = 2081;
              uint64_t v36 = v24;
              __int16 v37 = 2049;
              double v38 = v17;
              _os_log_impl(&dword_25631F000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, removing geofence because it overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
            regionMonitor = self->_regionMonitor;
            uint64_t v19 = [v9 regionId];
            [(CLMonitor *)regionMonitor removeConditionFromMonitoringWithIdentifier:v19];
          }
          else
          {
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
            }
            uint64_t v19 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = [v9 regionId];
              uint64_t v21 = [v20 UTF8String];
              *(_DWORD *)uint64_t buf = 68289539;
              int v32 = 0;
              __int16 v33 = 2082;
              uint64_t v34 = "";
              __int16 v35 = 2081;
              uint64_t v36 = v21;
              __int16 v37 = 2049;
              double v38 = v17;
              _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#LOI Bridge, geofence does not overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v6);
    }
  }
}

- (void)getCurrentLocation
{
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self clLocationManager];

  if (!v3)
  {
    objc_initWeak(location, self);
    id v4 = [(CLMicroLocationLoiBridge *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CLMicroLocationLoiBridge_getCurrentLocation__block_invoke;
    block[3] = &unk_2653F9DB8;
    objc_copyWeak(&v14, location);
    dispatch_async(v4, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  id v5 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v5 desiredAccuracy];
  double v7 = v6;
  double v8 = *MEMORY[0x263F00B38];

  if (v7 == v8) {
    [(CLMicroLocationLoiBridge *)self stopLeechingLocationUpdates];
  }
  double v9 = *MEMORY[0x263F00B40];
  id v10 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v10 setDesiredAccuracy:v9];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  id v11 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, requesting Location", (uint8_t *)location, 2u);
  }
  double v12 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v12 requestLocation];
}

void __46__CLMicroLocationLoiBridge_getCurrentLocation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    uint64_t v3 = [v4 generateLocationManagerNotAvailableError];
    (*(void (**)(uint64_t, void, void *))(*(void *)v2 + 32))(v2, 0, v3);

    id WeakRetained = v4;
  }
}

- (void)setGeofenceAtLocation:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08C38] UUID];
  double v6 = [v5 UUIDString];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  double v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    [v4 coordinate];
    double v9 = v8;
    [v4 coordinate];
    id buf = (id)68289539;
    __int16 v32 = 2082;
    __int16 v33 = "";
    __int16 v34 = 2049;
    double v35 = v9;
    __int16 v36 = 2049;
    uint64_t v37 = v10;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, requested geofence at location\", \"latitude\":\"%{private}7f\", \"longitude\":\"%{private}7f\"}", (uint8_t *)&buf, 0x26u);
  }

  id v11 = [(CLMicroLocationLoiBridge *)self regionMonitor];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    id v23 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
    id v20 = 0;
    long long v22 = 0;
  }
  else
  {
    double v13 = ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    id v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      id buf = (id)68289283;
      __int16 v32 = 2082;
      __int16 v33 = "";
      __int16 v34 = 2049;
      double v35 = v13;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, setting geofence for custom LOI\", \"Custom LOI Geofence radius\":\"%{private}7f\"}", (uint8_t *)&buf, 0x1Cu);
    }
    id v15 = objc_alloc(MEMORY[0x263F00A20]);
    [v4 coordinate];
    double v16 = objc_msgSend(v15, "initWithCenter:radius:");
    double v17 = [(CLMicroLocationLoiBridge *)self regionMonitor];
    [v17 addConditionForMonitoring:v16 identifier:v6];

    double v18 = (char *)[v6 UTF8String];
    size_t v19 = strlen(v18);
    id v20 = (void *)boost::uuids::string_generator::operator()<char const*>((boost::uuids::string_generator *)&buf, (unsigned __int8 *)v18, (unsigned __int8 *)&v18[v19]);
    long long v22 = v21;

    id v23 = 0;
  }
  objc_initWeak(&buf, self);
  uint64_t v24 = [(CLMicroLocationLoiBridge *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CLMicroLocationLoiBridge_setGeofenceAtLocation___block_invoke;
  block[3] = &unk_2653F9E80;
  objc_copyWeak(v30, &buf);
  v30[1] = v20;
  v30[2] = v22;
  id v28 = v4;
  id v29 = v23;
  id v25 = v23;
  id v26 = v4;
  dispatch_async(v24, block);

  objc_destroyWeak(v30);
  objc_destroyWeak(&buf);
}

void __50__CLMicroLocationLoiBridge_setGeofenceAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void, void, void))(*(void *)v2 + 56))(v2, *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
  }
}

- (void)removeGeofenceWithRegionId:(id)a3
{
  id v4 = a3;
  id v5 = [(CLMicroLocationLoiBridge *)self regionMonitor];

  if (v5)
  {
    double v6 = [(CLMicroLocationLoiBridge *)self regionMonitor];
    [v6 removeConditionFromMonitoringWithIdentifier:v4];

    double v7 = 0;
  }
  else
  {
    double v7 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
  }
  objc_initWeak(&location, self);
  double v8 = [(CLMicroLocationLoiBridge *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CLMicroLocationLoiBridge_removeGeofenceWithRegionId___block_invoke;
  v11[3] = &unk_2653F9E08;
  objc_copyWeak(&v14, &location);
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__CLMicroLocationLoiBridge_removeGeofenceWithRegionId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained microLocationLoiClient];
    (*(void (**)(uint64_t, void, void))(*(void *)v2 + 72))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)startLeechingLocationUpdates
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v3 desiredAccuracy];
  double v5 = v4;
  double v6 = *MEMORY[0x263F00B38];

  if (v5 != v6)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    double v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289026;
      v10[1] = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Starting to leech location updates\"}", (uint8_t *)v10, 0x12u);
    }
    double v8 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    [v8 setDesiredAccuracy:v6];

    id v9 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    [v9 startUpdatingLocation];
  }
}

- (void)stopLeechingLocationUpdates
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CLMicroLocationLoiBridge *)self clLocationManager];
  [v3 desiredAccuracy];
  double v5 = v4;
  double v6 = *MEMORY[0x263F00B38];

  if (v5 == v6)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    double v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289026;
      v9[1] = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Stopping leech location updates\"}", (uint8_t *)v9, 0x12u);
    }
    double v8 = [(CLMicroLocationLoiBridge *)self clLocationManager];
    [v8 stopUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [(CLMicroLocationLoiBridge *)self queue];
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    double v7 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v5 hasDepartureDate];
      id v9 = "Entry";
      id buf = (id)68289282;
      __int16 v16 = 2082;
      double v17 = "";
      if (v8) {
        id v9 = "Exit";
      }
      __int16 v18 = 2082;
      size_t v19 = v9;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Got Visit Notification\", \"Visit:\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }

    objc_initWeak(&buf, self);
    __int16 v10 = [(CLMicroLocationLoiBridge *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__CLMicroLocationLoiBridge_locationManager_didVisit___block_invoke;
    v12[3] = &unk_2653F9CD0;
    objc_copyWeak(&v14, &buf);
    id v13 = v5;
    dispatch_async(v10, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&buf);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    }
    __int16 v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "LOI Bridge, Received nil visit notification", (uint8_t *)&buf, 2u);
    }
  }
}

void __53__CLMicroLocationLoiBridge_locationManager_didVisit___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = (void (***)(void, void))[WeakRetained microLocationLoiClient];
    (**v2)(v2, *(void *)(a1 + 32));
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  }
  double v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, didFailWithError\", \"error:\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
}

- (void)setQueue:(id)a3
{
}

- (void)setClLocationManager:(id)a3
{
}

- (void)setRoutineManager:(id)a3
{
}

- (CLMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (void)setRegionMonitor:(id)a3
{
}

- (CLMonitorConfiguration)regionMonitorConfiguration
{
  return self->_regionMonitorConfiguration;
}

- (void)setRegionMonitorConfiguration:(id)a3
{
}

- (ULTimer)fetchPlaceInferenceTimer
{
  return self->_fetchPlaceInferenceTimer;
}

- (void)setFetchPlaceInferenceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_regionMonitorConfiguration, 0);
  objc_storeStrong((id *)&self->_fetchPlaceInferenceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end