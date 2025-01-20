@interface WeatherService
+ (id)sharedService;
- (NSArray)clients;
- (NSMapTable)clientDictionary;
- (WFQueryDispatcher)queryDispatcher;
- (WFTemperatureUnitProvider)temperatureUnitProvider;
- (WFWeatherStoreService)internalService;
- (WeatherService)init;
- (WeatherService)initWithStore:(id)a3;
- (id)clientForPid:(int)a3;
- (void)addClient:(id)a3;
- (void)addClient:(id)a3 forPid:(int)a4;
- (void)airQualityForLocation:(id)a3 locale:(id)a4 options:(id)a5 taskIdentifier:(id)a6;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5;
- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 taskIdentifier:(id)a6;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7 requestOptions:(id)a8;
- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 options:(id)a6 taskIdentifier:(id)a7;
- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5;
- (void)invalidateCache:(id)a3;
- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4;
- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4;
- (void)locationForString:(id)a3 taskIdentifier:(id)a4;
- (void)performMigrationWithCompletion:(id)a3;
- (void)queryDispatcherDidReceiveResponse:(id)a3 identifier:(id)a4;
- (void)reachabilityConfigurationForIdentifier:(id)a3;
- (void)removeClient:(id)a3;
- (void)replaceTemperatureUnitWith:(int)a3 identifier:(id)a4;
- (void)setClientDictionary:(id)a3;
- (void)setInternalService:(id)a3;
- (void)setQueryDispatcher:(id)a3;
- (void)setTemperatureUnitProvider:(id)a3;
- (void)temperatureUnitWithIdentifier:(id)a3;
@end

@implementation WeatherService

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedService_service;
  return v2;
}

uint64_t __31__WeatherService_sharedService__block_invoke()
{
  sharedService_service = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (WeatherService)init
{
  v3 = objc_alloc_init(WFWeatherStoreService);
  v4 = [(WeatherService *)self initWithStore:v3];

  return v4;
}

- (WeatherService)initWithStore:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WeatherService;
  v5 = [(WeatherService *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(WeatherService *)v5 setInternalService:v4];
    v7 = objc_alloc_init(WFQueryDispatcher);
    [(WeatherService *)v6 setQueryDispatcher:v7];

    v8 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    [(WeatherService *)v6 setClientDictionary:v8];

    v9 = objc_opt_new();
    [(WeatherService *)v6 setTemperatureUnitProvider:v9];

    dispatch_queue_t v10 = dispatch_queue_create("WeatherServiceQueue", MEMORY[0x263EF83A8]);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = v6;
  }

  return v6;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WeatherService *)self clientDictionary];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__WeatherService_addClient___block_invoke;
    v7[3] = &unk_264431510;
    v7[4] = self;
    id v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [v9 taskIdentifier:v7];
  }
}

void __28__WeatherService_addClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WFLogForCategory(4uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __28__WeatherService_addClient___block_invoke_cold_2(v3, v4);
    }

    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__WeatherService_addClient___block_invoke_6;
    block[3] = &unk_2644314E8;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = v3;
    dispatch_barrier_sync(v6, block);

    id v4 = v8;
  }
  else if (v5)
  {
    __28__WeatherService_addClient___block_invoke_cold_1(v4);
  }
}

void __28__WeatherService_addClient___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 48), "pid"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObject:v2 forKey:v3];
}

- (void)addClient:(id)a3 forPid:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(WeatherService *)self clientDictionary];
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__WeatherService_addClient_forPid___block_invoke;
    block[3] = &unk_264431538;
    int v13 = a4;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    dispatch_barrier_sync(clientQueue, block);
  }
}

void __35__WeatherService_addClient_forPid___block_invoke(uint64_t a1)
{
  uint64_t v2 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__WeatherService_addClient_forPid___block_invoke_cold_1(a1, v2);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v3 setObject:v4 forKey:v5];
}

- (void)removeClient:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(WeatherService *)self clientDictionary];
    id v6 = [v5 dictionaryRepresentation];

    v7 = [v6 allKeysForObject:v4];

    if ([v7 count])
    {
      objc_initWeak(&location, self);
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __31__WeatherService_removeClient___block_invoke;
      block[3] = &unk_264431560;
      id v10 = v7;
      objc_copyWeak(&v11, &location);
      dispatch_barrier_async(clientQueue, block);
      objc_destroyWeak(&v11);

      objc_destroyWeak(&location);
    }
  }
}

void __31__WeatherService_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    id v6 = (id *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = WFLogForCategory(4uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v8;
          _os_log_debug_impl(&dword_21C988000, v9, OS_LOG_TYPE_DEBUG, "WF Client Removed: %@", buf, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained(v6);
        id v11 = [WeakRetained clientDictionary];
        [v11 removeObjectForKey:v8];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }
}

- (NSArray)clients
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v3 = [(WeatherService *)self clientDictionary];
  uint64_t v4 = [v3 dictionaryRepresentation];

  clientQueue = self->_clientQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__WeatherService_clients__block_invoke;
  v9[3] = &unk_2644307A0;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(clientQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (NSArray *)v7;
}

uint64_t __25__WeatherService_clients__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) allValues];
  return MEMORY[0x270F9A758]();
}

- (id)clientForPid:(int)a3
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v5 = [(WeatherService *)self clientDictionary];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WeatherService_clientForPid___block_invoke;
  block[3] = &unk_264431588;
  id v11 = v5;
  uint64_t v12 = &v14;
  int v13 = a3;
  id v7 = v5;
  dispatch_sync(clientQueue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __31__WeatherService_clientForPid___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)performMigrationWithCompletion:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    id v5 = a3;
    objc_msgSend(v4, "wf_errorWithCode:", 15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 options:(id)a6 taskIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  v18 = [(WeatherService *)self internalService];
  id v19 = [v12 UUID];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__WeatherService_forecastForLocation_locale_onDate_options_taskIdentifier___block_invoke;
  v21[3] = &unk_2644315B0;
  v21[4] = self;
  id v22 = v12;
  id v20 = v12;
  [v18 forecastForLocation:v16 locale:v15 onDate:v14 requestIdentifier:v19 options:v13 completionHandler:v21];
}

uint64_t __75__WeatherService_forecastForLocation_locale_onDate_options_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v12 = [(WeatherService *)self internalService];
  id v13 = [v8 UUID];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__WeatherService_hourlyForecastForLocation_locale_taskIdentifier___block_invoke;
  v15[3] = &unk_2644315B0;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v12 hourlyForecastForLocation:v10 locale:v9 requestIdentifier:v13 completionHandler:v15];
}

uint64_t __66__WeatherService_hourlyForecastForLocation_locale_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v12 = [(WeatherService *)self internalService];
  id v13 = [v8 UUID];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__WeatherService_dailyForecastForLocation_locale_taskIdentifier___block_invoke;
  v15[3] = &unk_2644315B0;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v12 dailyForecastForLocation:v10 locale:v9 requestIdentifier:v13 completionHandler:v15];
}

uint64_t __65__WeatherService_dailyForecastForLocation_locale_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 taskIdentifier:(id)a6
{
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7
{
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7 requestOptions:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a4;
  v18 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v19 = [(WeatherService *)self internalService];
  id v20 = [v14 UUID];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __86__WeatherService_forecast_forLocation_withUnits_locale_taskIdentifier_requestOptions___block_invoke;
  v22[3] = &unk_2644315B0;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v19 forecast:a3 forLocation:v17 withUnits:v10 locale:v16 requestIdentifier:v20 requestOptions:v15 completionHandler:v22];
}

uint64_t __86__WeatherService_forecast_forLocation_withUnits_locale_taskIdentifier_requestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)airQualityForLocation:(id)a3 locale:(id)a4 options:(id)a5 taskIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v15 = [(WeatherService *)self internalService];
  id v16 = [v10 UUID];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__WeatherService_airQualityForLocation_locale_options_taskIdentifier___block_invoke;
  v18[3] = &unk_2644315B0;
  v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [v15 airQualityForLocation:v13 locale:v12 requestIdentifier:v16 options:v11 completionHandler:v18];
}

uint64_t __70__WeatherService_airQualityForLocation_locale_options_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)reachabilityConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v6 = [WFReachabilityConfigurationResponse alloc];
  id v7 = [v4 UUID];
  id v8 = [(WFResponse *)v6 initWithIdentifier:v7];

  id v9 = [(WeatherService *)self internalService];
  id v10 = [v9 configuration];
  id v11 = [v10 serviceConnectivityEvaluationURL];

  [(WFReachabilityConfigurationResponse *)v8 setReachabilityHostURL:v11];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WeatherService_reachabilityConfigurationForIdentifier___block_invoke;
  block[3] = &unk_2644314E8;
  void block[4] = self;
  id v16 = v8;
  id v17 = v4;
  id v13 = v4;
  id v14 = v8;
  dispatch_async(clientQueue, block);
}

uint64_t __57__WeatherService_reachabilityConfigurationForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v6 = [(WeatherService *)self queryDispatcher];
  [v6 cancelTaskWithIdentifier:v4];

  id v7 = [(WeatherService *)self internalService];
  [v7 cancelTaskWithIdentifier:v4];
}

- (void)invalidateCache:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherService *)self queryDispatcher];
  [v5 invalidateCacheWithIdentifier:v4];

  id v6 = [(WeatherService *)self internalService];
  [v6 invalidateCacheWithIdentifier:v4];
}

- (void)locationForString:(id)a3 taskIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v9 = [(WeatherService *)self queryDispatcher];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__WeatherService_locationForString_taskIdentifier___block_invoke;
  v11[3] = &unk_2644315D8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 locationForString:v7 taskIdentifier:v10 results:v11];
}

uint64_t __51__WeatherService_locationForString_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  id v8 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v9 = [(WeatherService *)self internalService];
  id v10 = [v9 locationGeocodeForCoordinateRequestStartingCallback];

  if (v10)
  {
    id v11 = [(WeatherService *)self internalService];
    id v12 = [v11 locationGeocodeForCoordinateRequestStartingCallback];
    v12[2](latitude, longitude);
  }
  id v13 = [(WeatherService *)self queryDispatcher];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__WeatherService_locationForCoordinate_taskIdentifier___block_invoke;
  v15[3] = &unk_2644315D8;
  v15[4] = self;
  id v16 = v7;
  id v14 = v7;
  objc_msgSend(v13, "locationForCoordinate:taskIdentifier:results:", v14, v15, latitude, longitude);
}

uint64_t __55__WeatherService_locationForCoordinate_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v9 = [(WeatherService *)self queryDispatcher];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__WeatherService_locationForSearchCompletion_taskIdentifier___block_invoke;
  v11[3] = &unk_2644315D8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 locationForSearchCompletion:v7 taskIdentifier:v10 results:v11];
}

uint64_t __61__WeatherService_locationForSearchCompletion_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) queryDispatcherDidReceiveResponse:a2 identifier:*(void *)(a1 + 40)];
}

- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }
}

- (void)temperatureUnitWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  id v6 = [(WeatherService *)self temperatureUnitProvider];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WeatherService_temperatureUnitWithIdentifier___block_invoke;
  v8[3] = &unk_264431600;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 fetchTemperatureUnitWithCompletionHandler:v8];
}

void __48__WeatherService_temperatureUnitWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [WFTemperatureUnitResponse alloc];
  id v5 = [*(id *)(a1 + 32) UUID];
  id v6 = [(WFResponse *)v4 initWithIdentifier:v5];

  [(WFTemperatureUnitResponse *)v6 setTemperatureUnit:a2];
  [*(id *)(a1 + 40) queryDispatcherDidReceiveResponse:v6 identifier:*(void *)(a1 + 32)];
}

- (void)replaceTemperatureUnitWith:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:]();
  }

  temperatureUnitProvider = self->_temperatureUnitProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WeatherService_replaceTemperatureUnitWith_identifier___block_invoke;
  v10[3] = &unk_264431600;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  [(WFTemperatureUnitProvider *)temperatureUnitProvider replaceUnit:v4 completionHandler:v10];
}

void __56__WeatherService_replaceTemperatureUnitWith_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [WFTemperatureUnitResponse alloc];
  id v5 = [*(id *)(a1 + 32) UUID];
  id v6 = [(WFResponse *)v4 initWithIdentifier:v5];

  [(WFTemperatureUnitResponse *)v6 setTemperatureUnit:a2];
  [*(id *)(a1 + 40) queryDispatcherDidReceiveResponse:v6 identifier:*(void *)(a1 + 32)];
}

- (void)queryDispatcherDidReceiveResponse:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[WeatherService clientForPid:](self, "clientForPid:", [v7 pid]);
  if (!v8)
  {
    id v9 = WFLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WeatherService queryDispatcherDidReceiveResponse:identifier:](v7);
    }
  }
  id v10 = [v6 error];

  id v11 = WFLogForCategory(4uLL);
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WeatherService queryDispatcherDidReceiveResponse:identifier:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[WeatherService queryDispatcherDidReceiveResponse:identifier:](v7);
  }

  [v8 serviceDidReceiveResponse:v6];
}

- (WFTemperatureUnitProvider)temperatureUnitProvider
{
  return self->_temperatureUnitProvider;
}

- (void)setTemperatureUnitProvider:(id)a3
{
}

- (WFWeatherStoreService)internalService
{
  return (WFWeatherStoreService *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalService:(id)a3
{
}

- (WFQueryDispatcher)queryDispatcher
{
  return (WFQueryDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueryDispatcher:(id)a3
{
}

- (NSMapTable)clientDictionary
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDictionary, 0);
  objc_storeStrong((id *)&self->_queryDispatcher, 0);
  objc_storeStrong((id *)&self->_internalService, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_temperatureUnitProvider, 0);
}

void __28__WeatherService_addClient___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Invalid WF Client attempted connection; rejected.",
    v1,
    2u);
}

void __28__WeatherService_addClient___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 pid];
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "WF Client Added: %d", (uint8_t *)v3, 8u);
}

void __35__WeatherService_addClient_forPid___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 48);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "WF Client Added: %d", (uint8_t *)v3, 8u);
}

- (void)forecastForLocation:locale:onDate:options:taskIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  [v1 UUID];
  objc_claimAutoreleasedReturnValue();
  int v2 = (const char *)OUTLINED_FUNCTION_2_1();
  id v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21C988000, v4, v5, "(%@) Executing %@", v6, v7, v8, v9, v10);
}

- (void)queryDispatcherDidReceiveResponse:(void *)a1 identifier:.cold.1(void *a1)
{
  id v1 = [a1 UUID];
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "(%@) Received response.  Forwarding to Client", v4, v5, v6, v7, 2u);
}

- (void)queryDispatcherDidReceiveResponse:identifier:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v5 = *MEMORY[0x263EF8340];
  [v2 UUID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1() error];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_21C988000, v0, OS_LOG_TYPE_ERROR, "(%@) Received response.  Response contained an error: %@", v4, 0x16u);
}

- (void)queryDispatcherDidReceiveResponse:(void *)a1 identifier:.cold.3(void *a1)
{
  id v1 = [a1 UUID];
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "(%@) Unable to dispatch response; Client does not exist!",
    v4,
    v5,
    v6,
    v7,
    2u);
}

@end