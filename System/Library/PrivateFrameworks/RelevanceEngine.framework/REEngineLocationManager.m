@interface REEngineLocationManager
- (BOOL)_wantsLocation;
- (BOOL)monitoringLocation;
- (CLLocation)currentLocation;
- (CLLocation)location;
- (REEngineLocationManager)initWithRelevanceEngine:(id)a3 locationManager:(id)a4;
- (RELocationManager)locationManager;
- (id)_currentLocationManager;
- (void)_beginMonitoringLocationForManager:(id)a3;
- (void)_beginTraining;
- (void)_endTraining;
- (void)_handleLocationUpdate:(id)a3;
- (void)_stopMonitoringLocationForManager:(id)a3;
- (void)_updateLocationStatus;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation REEngineLocationManager

- (REEngineLocationManager)initWithRelevanceEngine:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)REEngineLocationManager;
  v8 = [(RERelevanceEngineSubsystem *)&v18 initWithRelevanceEngine:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a4);
    if (_fetchedInternalBuildOnceToken_4 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_4, &__block_literal_global_47);
    }
    if (_isInternalDevice_4)
    {
      uint64_t v10 = +[RELocationManager simulatedLocationManager];
      simulatedLocationManager = v9->_simulatedLocationManager;
      v9->_simulatedLocationManager = (RELocationManager *)v10;

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v9 selector:sel__beginTraining name:@"RETrainingSimulationCoordinatorDidBeginTraining" object:0];

      v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:v9 selector:sel__endTraining name:@"RETrainingSimulationCoordinatorDidEndTraining" object:0];
    }
    uint64_t v14 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (REObserverStore *)v14;

    v16 = [v6 logger];
    [v16 addLoggable:v9];
  }
  return v9;
}

uint64_t __67__REEngineLocationManager_initWithRelevanceEngine_locationManager___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_4 = result;
  return result;
}

- (void)dealloc
{
  v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  v4 = [v3 logger];
  [v4 removeLoggable:self];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"RETrainingSimulationCoordinatorDidBeginTraining" object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:@"RETrainingSimulationCoordinatorDidEndTraining" object:0];

  v7.receiver = self;
  v7.super_class = (Class)REEngineLocationManager;
  [(RERelevanceEngineSubsystem *)&v7 dealloc];
}

- (void)addObserver:(id)a3
{
  [(REObserverStore *)self->_observers addObserver:a3];
  [(REEngineLocationManager *)self _updateLocationStatus];
}

- (void)removeObserver:(id)a3
{
  [(REObserverStore *)self->_observers removeObserver:a3];
  [(REEngineLocationManager *)self _updateLocationStatus];
}

- (CLLocation)currentLocation
{
  v2 = [(REEngineLocationManager *)self location];
  v3 = (void *)[v2 copy];

  return (CLLocation *)v3;
}

- (void)_updateLocationStatus
{
  v3 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__REEngineLocationManager__updateLocationStatus__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__REEngineLocationManager__updateLocationStatus__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _wantsLocation];
  uint64_t v3 = [*(id *)(a1 + 32) _currentLocationManager];
  v4 = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    if (v4[64]) {
      goto LABEL_7;
    }
    uint64_t v7 = v3;
    v4 = (unsigned char *)[v4 _beginMonitoringLocationForManager:v3];
    char v5 = 1;
  }
  else
  {
    if (!v4[64]) {
      goto LABEL_7;
    }
    uint64_t v7 = v3;
    v4 = (unsigned char *)[v4 _stopMonitoringLocationForManager:v3];
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = v5;
  uint64_t v3 = v7;
LABEL_7:
  return MEMORY[0x270F9A758](v4, v3);
}

- (BOOL)_wantsLocation
{
  BOOL v3 = [(RERelevanceEngineSubsystem *)self isRunning];
  if (v3) {
    LOBYTE(v3) = [(REObserverStore *)self->_observers count] != 0;
  }
  return v3;
}

- (void)_handleLocationUpdate:(id)a3
{
  v4 = (void *)[a3 copy];
  char v5 = [(RERelevanceEngineSubsystem *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__REEngineLocationManager__handleLocationUpdate___block_invoke;
  v7[3] = &unk_2644BC688;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__REEngineLocationManager__handleLocationUpdate___block_invoke(uint64_t a1)
{
  id v7 = *(id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) location];
  if (v7 == v2)
  {
  }
  else
  {
    char v3 = [v7 isEqual:v2];

    if ((v3 & 1) == 0)
    {
      [*(id *)(a1 + 40) setLocation:*(void *)(a1 + 32)];
      uint64_t v4 = *(void *)(a1 + 40);
      char v5 = *(void **)(v4 + 56);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__REEngineLocationManager__handleLocationUpdate___block_invoke_2;
      v8[3] = &unk_2644BF4A8;
      v8[4] = v4;
      [v5 enumerateObserversWithBlock:v8];
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 postNotificationName:@"RESignificantLocationUpdateNotification" object:0];
    }
  }
}

uint64_t __49__REEngineLocationManager__handleLocationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 locationManagerDidUpdateLocation:*(void *)(a1 + 32)];
}

- (void)_beginTraining
{
  char v3 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__REEngineLocationManager__beginTraining__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__REEngineLocationManager__beginTraining__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 64))
  {
    [(id)result _stopMonitoringLocationForManager:*(void *)(result + 40)];
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[6];
    return [v3 _beginMonitoringLocationForManager:v4];
  }
  return result;
}

- (void)_endTraining
{
  char v3 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__REEngineLocationManager__endTraining__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__REEngineLocationManager__endTraining__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 64))
  {
    [(id)result _stopMonitoringLocationForManager:*(void *)(result + 48)];
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[5];
    return [v3 _beginMonitoringLocationForManager:v4];
  }
  return result;
}

- (id)_currentLocationManager
{
  int IsCurrentlyActive = RETrainingSimulationIsCurrentlyActive();
  uint64_t v4 = &OBJC_IVAR___REEngineLocationManager__locationManager;
  if (IsCurrentlyActive) {
    uint64_t v4 = &OBJC_IVAR___REEngineLocationManager__simulatedLocationManager;
  }
  char v5 = *(Class *)((char *)&self->super.super.isa + *v4);
  return v5;
}

- (void)_beginMonitoringLocationForManager:(id)a3
{
  id v4 = a3;
  char v5 = [v4 currentLocation];
  id v6 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke;
  block[3] = &unk_2644BC688;
  block[4] = self;
  id v7 = v5;
  id v12 = v7;
  dispatch_async(v6, block);

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2;
  v8[3] = &unk_2644BF4D0;
  objc_copyWeak(&v9, &location);
  [v4 startLocationUpdatesWithHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLocationUpdate:*(void *)(a1 + 40)];
}

void __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = RELogForDomain(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLocationUpdate:v5];
}

- (void)_stopMonitoringLocationForManager:(id)a3
{
  [a3 stopLocationUpdates];
  id v4 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__REEngineLocationManager__stopMonitoringLocationForManager___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __61__REEngineLocationManager__stopMonitoringLocationForManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocation:0];
}

- (BOOL)monitoringLocation
{
  return self->_monitoringLocation;
}

- (RELocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setCurrentLocation:(id)a3
{
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_simulatedLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to get location: %@", (uint8_t *)&v2, 0xCu);
}

@end