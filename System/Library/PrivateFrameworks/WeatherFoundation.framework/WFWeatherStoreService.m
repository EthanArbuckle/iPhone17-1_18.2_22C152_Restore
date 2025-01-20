@interface WFWeatherStoreService
- (BOOL)_cacheParsedForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 date:(id)a6 requestIdentifier:(id)a7;
- (BOOL)_handleDataTaskCompletionWithData:(id)a3 httpResponse:(id)a4 apiVersion:(id)a5 identifier:(id)a6 requestURL:(id)a7 dataTask:(id)a8 dataTaskError:(id)a9 startDate:(id)a10;
- (BOOL)_isConnectivityAvailableForWeatherHost:(id *)a3;
- (NSMutableDictionary)URLToCallbackMap;
- (NSMutableDictionary)URLToTaskMap;
- (NSMutableDictionary)UUIDToCallbackMap;
- (NSMutableDictionary)UUIDToURLMap;
- (OS_dispatch_queue)incomingRequestQueue;
- (OS_dispatch_queue)mapQueue;
- (OS_dispatch_queue)parseQueue;
- (WFNetworkRetryManager)retryManager;
- (WFWeatherStoreCache)cache;
- (WFWeatherStoreService)init;
- (WFWeatherStoreService)initWithConfiguration:(id)a3;
- (WFWeatherStoreService)initWithConfiguration:(id)a3 error:(id *)a4;
- (WFWeatherStoreServiceConfiguration)configuration;
- (id)_cachedAirQualityConditionsForLocation:(id)a3 date:(id)a4;
- (id)_cachedChangeForecastForLocation:(id)a3 date:(id)a4;
- (id)_cachedCurrentObservationsForLocation:(id)a3 date:(id)a4;
- (id)_cachedDailyForecastedConditionsForLocation:(id)a3 date:(id)a4;
- (id)_cachedDailyPollenForecastedConditionsForLocation:(id)a3 date:(id)a4;
- (id)_cachedData:(unint64_t)a3 forLocation:(id)a4 date:(id)a5;
- (id)_cachedHistoricalObservationsForLast24hForLocation:(id)a3 date:(id)a4;
- (id)_cachedHourlyForecastedConditionsForLocation:(id)a3 date:(id)a4;
- (id)_cachedNextHourPrecipitationForLocation:(id)a3 date:(id)a4;
- (id)_cachedSevereWeatherEventsForLocation:(id)a3 date:(id)a4;
- (id)_currentScaleCategoryForScale:(id)a3 index:(unint64_t)a4;
- (id)_taskForURL:(id)a3;
- (id)apiVersionForSettings:(id)a3;
- (id)forecastRequestStartingCallback;
- (id)languageForLocale:(id)a3;
- (id)locationGeocodeForCoordinateRequestStartingCallback;
- (os_unfair_lock_s)retryLock;
- (void)_addCallback:(id)a3 requestIdentifier:(id)a4 forURL:(id)a5;
- (void)_cacheObject:(id)a3 type:(unint64_t)a4 date:(id)a5 forLocation:(id)a6;
- (void)_cancelWithRequestIdentifier:(id)a3;
- (void)_cleanupCallbacksAndTasksForURL:(id)a3;
- (void)_enumerateForecastTypesIn:(unint64_t)a3 usingBlock:(id)a4;
- (void)_executeCallbacksForURL:(id)a3 responseData:(id)a4 error:(id)a5;
- (void)_forecastConditionsForTWCAQIAndTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8;
- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8;
- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 locale:(id)a6 date:(id)a7 requestIdentifier:(id)a8 requestOptions:(id)a9 completionHandler:(id)a10;
- (void)_setTask:(id)a3 requestIdentifier:(id)a4 callback:(id)a5 forURL:(id)a6;
- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forLocation:(id)a5 forecastTypes:(unint64_t)a6 configuration:(id)a7 units:(int)a8 locale:(id)a9 date:(id)a10 apiVersion:(id)a11 completionHandler:(id)a12;
- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forScaleNamed:(id)a5 language:(id)a6 configuration:(id)a7 apiVersion:(id)a8 completionHandler:(id)a9;
- (void)airQualityForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)completeErroneousForecastRequestWithHandler:(id)a3 requestIdentifier:(id)a4 error:(id)a5;
- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 requestIdentifier:(id)a6 completionHandler:(id)a7;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8;
- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 requestOptions:(id)a8 completionHandler:(id)a9;
- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 requestIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6;
- (void)invalidateCacheWithIdentifier:(id)a3;
- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4;
- (void)requestSuccessForAPIVersion:(id)a3;
- (void)setCache:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setForecastRequestStartingCallback:(id)a3;
- (void)setIncomingRequestQueue:(id)a3;
- (void)setLocationGeocodeForCoordinateRequestStartingCallback:(id)a3;
- (void)setMapQueue:(id)a3;
- (void)setParseQueue:(id)a3;
- (void)setRetryLock:(os_unfair_lock_s)a3;
- (void)setRetryManager:(id)a3;
- (void)setURLToCallbackMap:(id)a3;
- (void)setURLToTaskMap:(id)a3;
- (void)setUUIDToCallbackMap:(id)a3;
- (void)setUUIDToURLMap:(id)a3;
@end

@implementation WFWeatherStoreService

- (WFWeatherStoreService)init
{
  return [(WFWeatherStoreService *)self initWithConfiguration:0];
}

- (WFWeatherStoreService)initWithConfiguration:(id)a3
{
  return [(WFWeatherStoreService *)self initWithConfiguration:a3 error:0];
}

- (WFWeatherStoreService)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6
    || (+[WFWeatherStoreServiceConfiguration defaultConfiguration], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v6 isValid])
    {
      v26.receiver = self;
      v26.super_class = (Class)WFWeatherStoreService;
      v7 = [(WFWeatherStoreService *)&v26 init];
      self = v7;
      if (v7)
      {
        [(WFWeatherStoreService *)v7 setConfiguration:v6];
        v8 = [(WFWeatherStoreService *)self configuration];
        v9 = (void *)[v8 cacheClass];

        v10 = [v6 cacheURL];
        id v25 = 0;
        v11 = [v9 createCacheIfNecessary:v10 error:&v25];
        id v12 = v25;
        [(WFWeatherStoreService *)self setCache:v11];

        if (v12)
        {
          v13 = WFLogForCategory(2uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[WFWeatherStoreService initWithConfiguration:error:]();
          }

          if (a4) {
            *a4 = v12;
          }

LABEL_15:
          v15 = 0;
          goto LABEL_18;
        }
        dispatch_queue_t v16 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.incomingRequestQueue", 0);
        [(WFWeatherStoreService *)self setIncomingRequestQueue:v16];

        dispatch_queue_t v17 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.parseQueue", MEMORY[0x263EF83A8]);
        [(WFWeatherStoreService *)self setParseQueue:v17];

        dispatch_queue_t v18 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.mapQueue", 0);
        [(WFWeatherStoreService *)self setMapQueue:v18];

        v19 = objc_opt_new();
        [(WFWeatherStoreService *)self setURLToTaskMap:v19];

        v20 = objc_opt_new();
        [(WFWeatherStoreService *)self setURLToCallbackMap:v20];

        v21 = objc_opt_new();
        [(WFWeatherStoreService *)self setUUIDToURLMap:v21];

        v22 = objc_opt_new();
        [(WFWeatherStoreService *)self setUUIDToCallbackMap:v22];

        v23 = objc_opt_new();
        [(WFWeatherStoreService *)self setRetryManager:v23];

        [(WFWeatherStoreService *)self setRetryLock:0];
      }
      self = self;
      v15 = self;
      goto LABEL_18;
    }
  }
  v14 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherStoreService initWithConfiguration:error:]((uint64_t)self, v14);
  }

  if (!a4) {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 7);
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v15;
}

- (void)invalidateCacheWithIdentifier:(id)a3
{
  id v3 = [(WFWeatherStoreService *)self cache];
  [v3 removeAllObjects];
}

- (void)dealloc
{
  id v3 = [(WFWeatherStoreService *)self configuration];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)WFWeatherStoreService;
  [(WFWeatherStoreService *)&v4 dealloc];
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"requestIdentifier is mandatory." userInfo:0];
    objc_exception_throw(v6);
  }
  id v7 = v4;
  v5 = [v4 UUID];
  [(WFWeatherStoreService *)self _cancelWithRequestIdentifier:v5];
}

- (void)completeErroneousForecastRequestWithHandler:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  v13 = (void (**)(id, WFForecastResponse *))a3;
  id v7 = a4;
  id v8 = a5;
  if (!v13 || !v7)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v12);
  }
  v9 = [(WFResponse *)[WFForecastResponse alloc] initWithIdentifier:v7 error:v8];
  v10 = [(WFResponse *)v9 error];

  if (!v10)
  {
    v11 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 0);
    [(WFResponse *)v9 setError:v11];
  }
  v13[2](v13, v9);
}

- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 requestIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v43 = a7;
  id v17 = a8;
  if (!v16 || (dispatch_queue_t v18 = v17) == 0)
  {
    id v40 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v40);
  }
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke;
  v49[3] = &unk_264431D98;
  id v19 = v16;
  id v50 = v19;
  id v20 = v15;
  id v51 = v20;
  id v21 = v13;
  id v52 = v21;
  id v22 = v18;
  id v53 = v22;
  v23 = (uint64_t (**)(void, void, void, void, void, void))MEMORY[0x21D4B3DE0](v49);
  if (v21)
  {
    v24 = [v21 geoLocation];
    [v24 coordinate];
    BOOL v25 = CLLocationCoordinate2DIsValid(v61);

    if (v25) {
      goto LABEL_24;
    }
  }
  objc_super v26 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherStoreService forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:]();
  }

  v27 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 4);
  char v28 = ((uint64_t (**)(void, void, void, void, void, void *))v23)[2](v23, 0, 0, 0, 0, v27);

  if ((v28 & 1) == 0)
  {
LABEL_24:
    if (v20) {
      goto LABEL_12;
    }
    v29 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreService forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:]((uint64_t)v19, v29);
    }

    v30 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 2);
    char v31 = ((uint64_t (**)(void, void, void, void, void, void *))v23)[2](v23, 0, 0, 0, 0, v30);

    if ((v31 & 1) == 0)
    {
LABEL_12:
      uint64_t v32 = WFForecastTypeForDate(v20);
      if (v32
        || (objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 6),
            v33 = objc_claimAutoreleasedReturnValue(),
            char v34 = ((uint64_t (**)(void, void, void, void, void, void *))v23)[2](v23, 0, 0, 0, 0, v33), v33, (v34 & 1) == 0))
      {
        id v41 = v14;
        uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
        v35 = WFCacheKeyForForecastType(v32, v21, v20);
        id v47 = 0;
        WFCacheDetailsForForecastType(v32, &v48, (uint64_t *)&v47);
        id v36 = v47;
        v37 = WFLogForCategory(2uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          id v55 = v19;
          __int16 v56 = 2114;
          id v57 = v36;
          __int16 v58 = 2114;
          v59 = v35;
          _os_log_debug_impl(&dword_21C988000, v37, OS_LOG_TYPE_DEBUG, "(%{public}@) Check Cache Domain %{public}@ for Key %{public}@", buf, 0x20u);
        }

        v38 = [(WFWeatherStoreService *)self cache];
        v39 = [v38 cachedObjectWithinDomain:v36 forKey:v35 staleness:v48];
        if (!v39
          || (((uint64_t (**)(void, void *, uint64_t, uint64_t, void, void))v23)[2](v23, v39, v32, 1, 0, 0) & 1) == 0)
        {
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke_119;
          v44[3] = &unk_264431DC0;
          uint64_t v46 = v32;
          v45 = v23;
          [(WFWeatherStoreService *)self _forecastConditionsForTypes:v32 location:v21 locale:v41 date:v20 requestIdentifier:v19 completionHandler:v44];
        }
        id v14 = v41;
      }
    }
  }
}

BOOL __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(WFResponse *)[WFForecastResponse alloc] initWithIdentifier:*(void *)(a1 + 32) error:v12];

  if (!v11)
  {
    BOOL v16 = 1;
    goto LABEL_11;
  }
  if ((a3 & 0xC) == 0)
  {
    if ((a3 & 0xC2) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v11;
        goto LABEL_10;
      }
    }
LABEL_9:
    id v15 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "wf_weatherConditionsClosestToDate:", v11);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [(WFForecastResponse *)v14 forecast];

LABEL_10:
  BOOL v16 = v15 != 0;
  [v15 setLocation:*(void *)(a1 + 48)];
  [(WFForecastResponse *)v14 setForecast:v15];

LABEL_11:
  [(WFForecastResponse *)v14 setForecastType:a3];
  [(WFForecastResponse *)v14 setRawAPIData:v13];

  [(WFForecastResponse *)v14 setResponseWasFromCache:a4];
  if (v16) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  return v16;
}

void __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if ((v6 & 0xC2) != 0)
  {
    uint64_t v7 = [v10 currentConditions];
  }
  else if ((v6 & 4) != 0)
  {
    uint64_t v7 = [v10 hourlyForecasts];
  }
  else
  {
    if ((v6 & 8) == 0)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);

      id v8 = 0;
      id v5 = (id)v9;
      goto LABEL_11;
    }
    uint64_t v7 = [v10 dailyForecasts];
  }
  id v8 = (void *)v7;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12 || (id v14 = v13) == 0)
  {
    id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v27);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke;
  v30[3] = &unk_264431DE8;
  id v15 = v12;
  id v31 = v15;
  id v16 = v10;
  id v32 = v16;
  id v17 = v14;
  id v33 = v17;
  dispatch_queue_t v18 = (void (**)(void, void, void, void))MEMORY[0x21D4B3DE0](v30);
  if (!v16
    || ([v16 geoLocation],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v19 coordinate],
        BOOL v20 = CLLocationCoordinate2DIsValid(v34),
        v19,
        !v20))
  {
    id v21 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:]();
    }

    id v22 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 4);
    ((void (**)(void, void, void, void *))v18)[2](v18, 0, 0, v22);
  }
  v23 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:]();
  }

  v24 = [MEMORY[0x263EFF910] date];
  BOOL v25 = [(WFWeatherStoreService *)self _cachedHourlyForecastedConditionsForLocation:v16 date:v24];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 count])
  {
    objc_super v26 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:]();
    }

    ((void (**)(void, void *, uint64_t, void))v18)[2](v18, v25, 1, 0);
  }
  else
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_126;
    v28[3] = &unk_264431E10;
    v29 = v18;
    [(WFWeatherStoreService *)self _forecastConditionsForTypes:4 location:v16 locale:v11 date:v24 requestIdentifier:v15 completionHandler:v28];
  }
}

void __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  id v8 = [(WFResponse *)[WFAggregateForecastResponse alloc] initWithIdentifier:a1[4] error:v7];

  [v9 makeObjectsPerformSelector:sel_setLocation_ withObject:a1[5]];
  [(WFAggregateForecastResponse *)v8 setForecasts:v9];
  [(WFAggregateForecastResponse *)v8 setResponseWasFromCache:a3];
  (*(void (**)(void))(a1[6] + 16))();
}

void __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 hourlyForecasts];
  (*(void (**)(uint64_t, id, void, id))(v4 + 16))(v4, v6, 0, v5);
}

- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12 || (id v14 = v13) == 0)
  {
    id v26 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v26);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke;
  v29[3] = &unk_264431DE8;
  id v15 = v12;
  id v30 = v15;
  id v16 = v10;
  id v31 = v16;
  id v17 = v14;
  id v32 = v17;
  dispatch_queue_t v18 = (void (**)(void, void, void, void))MEMORY[0x21D4B3DE0](v29);
  if (v16
    && ([v16 geoLocation],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v19 coordinate],
        BOOL v20 = CLLocationCoordinate2DIsValid(v33),
        v19,
        v20))
  {
    id v21 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:]();
    }

    id v22 = [MEMORY[0x263EFF910] date];
    v23 = [(WFWeatherStoreService *)self _cachedDailyForecastedConditionsForLocation:v16 date:v22];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 count])
    {
      v24 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:]();
      }

      ((void (**)(void, void *, uint64_t, void))v18)[2](v18, v23, 1, 0);
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_127;
      v27[3] = &unk_264431E10;
      char v28 = v18;
      [(WFWeatherStoreService *)self _forecastConditionsForTypes:8 location:v16 locale:v11 date:v22 requestIdentifier:v15 completionHandler:v27];
    }
  }
  else
  {
    BOOL v25 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:]();
    }

    id v22 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 4);
    ((void (**)(void, void, void, void *))v18)[2](v18, 0, 0, v22);
  }
}

void __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  id v8 = [(WFResponse *)[WFAggregateForecastResponse alloc] initWithIdentifier:a1[4] error:v7];

  [v9 makeObjectsPerformSelector:sel_setLocation_ withObject:a1[5]];
  [(WFAggregateForecastResponse *)v8 setForecasts:v9];
  [(WFAggregateForecastResponse *)v8 setResponseWasFromCache:a3];
  (*(void (**)(void))(a1[6] + 16))();
}

void __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 dailyForecasts];
  (*(void (**)(uint64_t, id, void, id))(v4 + 16))(v4, v6, 0, v5);
}

- (void)airQualityForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12 || !v13 || !v14 || (id v17 = v16) == 0)
  {
    id v30 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v30);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke;
  v33[3] = &unk_264431E38;
  id v18 = v14;
  id v34 = v18;
  id v19 = v12;
  id v35 = v19;
  id v20 = v17;
  id v36 = v20;
  id v21 = (void (**)(void, void, void, void))MEMORY[0x21D4B3DE0](v33);
  id v22 = [v19 geoLocation];
  [v22 coordinate];
  BOOL v23 = CLLocationCoordinate2DIsValid(v37);

  v24 = WFLogForCategory(2uLL);
  BOOL v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:]();
    }

    id v26 = [MEMORY[0x263EFF910] date];
    id v27 = [(WFWeatherStoreService *)self _cachedAirQualityConditionsForLocation:v19 date:v26];
    char v28 = v27;
    if (v27 && ([v27 isExpired] & 1) == 0)
    {
      v29 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:]();
      }

      ((void (**)(void, void *, uint64_t, void))v21)[2](v21, v28, 1, 0);
    }
    else
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke_130;
      v31[3] = &unk_264431E10;
      id v32 = v21;
      [(WFWeatherStoreService *)self _forecastConditionsForTypes:1 location:v19 locale:v13 date:v26 requestIdentifier:v18 completionHandler:v31];
    }
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:]();
    }

    id v26 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 4);
    ((void (**)(void, void, void, void *))v21)[2](v21, 0, 0, v26);
  }
}

void __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  id v8 = [(WFResponse *)[WFAirQualityResponse alloc] initWithIdentifier:a1[4] error:v7];

  [v9 setLocation:a1[5]];
  [(WFAirQualityResponse *)v8 setAirQualityConditions:v9];
  [(WFAirQualityResponse *)v8 setResponseWasFromCache:a3];
  (*(void (**)(void))(a1[6] + 16))();
}

void __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 airQualityObservations];
  (*(void (**)(uint64_t, id, void, id))(v4 + 16))(v4, v6, 0, v5);
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 requestIdentifier:(id)a6 completionHandler:(id)a7
{
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 requestOptions:(id)a8 completionHandler:(id)a9
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v35 = a6;
  id v16 = a7;
  id v36 = a8;
  id v17 = a9;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke;
  v44[3] = &unk_264431E60;
  id v18 = v16;
  id v45 = v18;
  id v19 = v15;
  id v46 = v19;
  id v20 = v17;
  id v47 = v20;
  uint64_t v21 = MEMORY[0x21D4B3DE0](v44);
  if (!v18 || !v20)
  {
    id v33 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v33);
  }
  id v22 = (void (**)(void, void, void, void))v21;
  if (v19
    && ([v19 geoLocation],
        BOOL v23 = objc_claimAutoreleasedReturnValue(),
        [v23 coordinate],
        BOOL v24 = CLLocationCoordinate2DIsValid(v51),
        v23,
        v24))
  {
    unsigned int v34 = a5;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v49) = 1;
    BOOL v25 = [MEMORY[0x263EFF910] date];
    id v26 = objc_opt_new();
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_134;
    v39[3] = &unk_264431E88;
    v39[4] = self;
    id v27 = v19;
    id v40 = v27;
    id v28 = v25;
    id v41 = v28;
    id v29 = v26;
    id v42 = v29;
    id v43 = buf;
    [(WFWeatherStoreService *)self _enumerateForecastTypesIn:a3 usingBlock:v39];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      ((void (**)(void, id, uint64_t, void))v22)[2](v22, v29, 1, 0);
    }
    else
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_2;
      v37[3] = &unk_264431E10;
      v38 = v22;
      [(WFWeatherStoreService *)self _forecastConditionsForTypes:a3 location:v27 units:v34 locale:v35 date:v28 requestIdentifier:v18 requestOptions:v36 completionHandler:v37];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v30 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v32 = [v19 geoLocation];
      *(_DWORD *)buf = 138543875;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2113;
      v49 = v32;
      _os_log_error_impl(&dword_21C988000, v30, OS_LOG_TYPE_ERROR, "(%{public}@) Invalid location given for %lu Forecast request: %{private}@", buf, 0x20u);
    }
    id v31 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 4);
    ((void (**)(void, void, void, void *))v22)[2](v22, 0, 0, v31);
  }
}

void __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v18 = [(WFResponse *)[WFAggregateCommonResponse alloc] initWithIdentifier:a1[4] error:v7];

  id v9 = [v8 airQualityObservations];
  [v9 setLocation:a1[5]];
  [(WFAggregateCommonResponse *)v18 setAirQualityObservations:v9];

  id v10 = [v8 currentConditions];
  [v10 setLocation:a1[5]];
  [(WFAggregateCommonResponse *)v18 setCurrentObservations:v10];

  id v11 = [v8 lastTwentyFourHoursOfObservations];
  [v11 makeObjectsPerformSelector:sel_setLocation_ withObject:a1[5]];
  [(WFAggregateCommonResponse *)v18 setLastTwentyFourHoursOfObservations:v11];

  id v12 = [v8 hourlyForecasts];
  [v12 makeObjectsPerformSelector:sel_setLocation_ withObject:a1[5]];
  [(WFAggregateCommonResponse *)v18 setHourlyForecastedConditions:v12];

  id v13 = [v8 dailyForecasts];
  [v13 makeObjectsPerformSelector:sel_setLocation_ withObject:a1[5]];
  [(WFAggregateCommonResponse *)v18 setDailyForecastedConditions:v13];

  id v14 = [v8 pollenForecasts];
  [(WFAggregateCommonResponse *)v18 setDailyPollenForecastedConditions:v14];

  id v15 = [v8 changeForecasts];
  [(WFAggregateCommonResponse *)v18 setChangeForecasts:v15];

  id v16 = [v8 severeWeatherEvents];
  [(WFAggregateCommonResponse *)v18 setSevereWeatherEvents:v16];

  id v17 = [v8 nextHourPrecipitation];

  [(WFAggregateCommonResponse *)v18 setNextHourPrecipitation:v17];
  [(WFAggregateCommonResponse *)v18 setResponseWasFromCache:a3];
  (*(void (**)(void))(a1[6] + 16))();
}

void __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_134(uint64_t a1, uint64_t a2)
{
  if (a2 <= 31)
  {
    switch(a2)
    {
      case 1:
        uint64_t v3 = [*(id *)(a1 + 32) _cachedAirQualityConditionsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
        uint64_t v4 = v3;
        if (!v3) {
          goto LABEL_26;
        }
        uint64_t v7 = v3;
        uint64_t v3 = [(id)v3 isExpired];
        uint64_t v4 = v7;
        if (v3) {
          goto LABEL_26;
        }
        uint64_t v3 = [*(id *)(a1 + 56) setAirQualityObservations:v7];
        goto LABEL_25;
      case 2:
        uint64_t v3 = [*(id *)(a1 + 32) _cachedCurrentObservationsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
        uint64_t v4 = v3;
        if (!v3) {
          goto LABEL_26;
        }
        uint64_t v7 = v3;
        uint64_t v3 = [*(id *)(a1 + 56) setCurrentConditions:v3];
        goto LABEL_25;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_38;
      case 4:
        uint64_t v3 = [*(id *)(a1 + 32) _cachedHourlyForecastedConditionsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
        uint64_t v4 = v3;
        if (!v3) {
          goto LABEL_26;
        }
        uint64_t v7 = v3;
        uint64_t v3 = [*(id *)(a1 + 56) setHourlyForecasts:v3];
        goto LABEL_25;
      case 8:
        uint64_t v3 = [*(id *)(a1 + 32) _cachedDailyForecastedConditionsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
        uint64_t v4 = v3;
        if (!v3) {
          goto LABEL_26;
        }
        uint64_t v7 = v3;
        uint64_t v3 = [*(id *)(a1 + 56) setDailyForecasts:v3];
        goto LABEL_25;
      default:
        if (a2 != 16) {
          goto LABEL_38;
        }
        uint64_t v3 = [*(id *)(a1 + 32) _cachedDailyPollenForecastedConditionsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
        uint64_t v4 = v3;
        if (!v3) {
          goto LABEL_26;
        }
        uint64_t v7 = v3;
        uint64_t v3 = [*(id *)(a1 + 56) setPollenForecasts:v3];
        break;
    }
    goto LABEL_25;
  }
  if (a2 > 1023)
  {
    if (a2 == 1024)
    {
      id v5 = [*(id *)(a1 + 32) _cachedSevereWeatherEventsForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
      if (v5) {
        [*(id *)(a1 + 56) setSevereWeatherEvents:v5];
      }
      else {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    else if (a2 != 2048)
    {
      goto LABEL_38;
    }
    id v6 = [*(id *)(a1 + 32) _cachedNextHourPrecipitationForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
    if (v6) {
      [*(id *)(a1 + 56) setNextHourPrecipitation:v6];
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }

    goto LABEL_38;
  }
  if (a2 == 32)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _cachedHistoricalObservationsForLast24hForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v7 = v3;
      uint64_t v3 = [*(id *)(a1 + 56) setLastTwentyFourHoursOfObservations:v3];
      goto LABEL_25;
    }
LABEL_26:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_27;
  }
  if (a2 != 512)
  {
LABEL_38:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) _cachedChangeForecastForLocation:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_26;
  }
  uint64_t v7 = v3;
  uint64_t v3 = [*(id *)(a1 + 56) setChangeForecasts:v3];
LABEL_25:
  uint64_t v4 = v7;
LABEL_27:
  MEMORY[0x270F9A758](v3, v4);
}

uint64_t __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_cachedAirQualityConditionsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:1 forLocation:a3 date:a4];
}

- (id)_cachedCurrentObservationsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:2 forLocation:a3 date:a4];
}

- (id)_cachedHourlyForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:4 forLocation:a3 date:a4];
}

- (id)_cachedDailyForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:8 forLocation:a3 date:a4];
}

- (id)_cachedDailyPollenForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:16 forLocation:a3 date:a4];
}

- (id)_cachedHistoricalObservationsForLast24hForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:32 forLocation:a3 date:a4];
}

- (id)_cachedChangeForecastForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:512 forLocation:a3 date:a4];
}

- (id)_cachedSevereWeatherEventsForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:1024 forLocation:a3 date:a4];
}

- (id)_cachedNextHourPrecipitationForLocation:(id)a3 date:(id)a4
{
  return [(WFWeatherStoreService *)self _cachedData:2048 forLocation:a3 date:a4];
}

- (id)_cachedData:(unint64_t)a3 forLocation:(id)a4 date:(id)a5
{
  id v15 = 0;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  id v8 = a5;
  id v9 = a4;
  WFCacheDetailsForForecastType(a3, &v16, (uint64_t *)&v15);
  id v10 = v15;
  id v11 = [(WFWeatherStoreService *)self cache];
  id v12 = WFCacheKeyForForecastType(a3, v9, v8);

  id v13 = [v11 cachedObjectWithinDomain:v10 forKey:v12 staleness:v16];

  return v13;
}

- (BOOL)_isConnectivityAvailableForWeatherHost:(id *)a3
{
  uint64_t v4 = [(WFWeatherStoreService *)self configuration];
  char v5 = [v4 isServiceAvailable];

  if (a3 && (v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
}

- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 locale:(id)a6 date:(id)a7 requestIdentifier:(id)a8 requestOptions:(id)a9 completionHandler:(id)a10
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v38 = a4;
  id v36 = a6;
  id v15 = a7;
  id v37 = a8;
  id v16 = a9;
  id v17 = a10;
  unint64_t v35 = a3;
  if (!a3 || !v38 || !v15 || !v37 || (id v18 = v17) == 0)
  {
    id v30 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"completionHandler / requestIdentifier are mandatory." userInfo:0];
    objc_exception_throw(v30);
  }
  id v19 = [(WFWeatherStoreService *)self configuration];
  id v20 = [v19 settingsManager];
  uint64_t v21 = [(WFWeatherStoreService *)self apiVersionForSettings:v20];

  if [@"twc_v2" isEqualToString:v21] && a3 != 1 && (a3)
  {
    id v22 = self;
    BOOL v23 = v36;
    [(WFWeatherStoreService *)v22 _forecastConditionsForTWCAQIAndTypes:a3 location:v38 locale:v36 date:v15 requestIdentifier:v37 completionHandler:v18];
    BOOL v24 = 0;
  }
  else
  {
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke;
    v50[3] = &unk_264431EB0;
    v50[4] = self;
    id v33 = v18;
    id v51 = v33;
    BOOL v25 = (void *)MEMORY[0x21D4B3DE0](v50);
    id v49 = 0;
    id v26 = [v19 forecastRequestForTypes:v35 location:v38 units:a5 date:v15 apiVersion:v21 error:&v49 requestOptions:v16];
    id v27 = v49;
    BOOL v24 = v27;
    if (v26)
    {
      id v31 = v27;
      id v32 = v16;
      id v28 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        id v53 = v37;
        __int16 v54 = 2112;
        id v55 = v26;
        __int16 v56 = 2112;
        id v57 = v38;
        _os_log_debug_impl(&dword_21C988000, v28, OS_LOG_TYPE_DEBUG, "(%{public}@) Built forecast request '%@' for location %@", buf, 0x20u);
      }

      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137;
      v39[3] = &unk_264431F00;
      v39[4] = self;
      id v46 = v25;
      unint64_t v48 = v35;
      id v40 = v38;
      id v41 = v15;
      id v42 = v37;
      id v43 = v19;
      id v44 = v21;
      id v45 = v26;
      id v47 = v33;
      [(WFWeatherStoreService *)self _submitRequest:v45 withIdentifier:v42 forLocation:v40 forecastTypes:v35 configuration:v43 units:a5 locale:v36 date:v41 apiVersion:v44 completionHandler:v39];

      id v16 = v32;
      BOOL v24 = v31;
    }
    else
    {
      if (!v27)
      {
        BOOL v24 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
      }
      id v29 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:]((uint64_t)v37);
      }

      (*((void (**)(id, void, void *))v33 + 2))(v33, 0, v24);
    }

    BOOL v23 = v36;
  }
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = *(void **)(a1 + 32);
  id v14 = a7;
  id v15 = a2;
  [v13 _cacheParsedForecastData:v15 types:a3 location:a4 date:a5 requestIdentifier:a6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 airQualityObservations];
    id v8 = [v7 airQualityScale];

    if (!v8)
    {
      uint64_t v21 = [v5 airQualityObservations];
      int v22 = [v21 temporarilyUnavailable];

      if (v22)
      {
        BOOL v23 = WFLogForCategory(2uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_1(a1);
        }
      }
      else
      {
        unint64_t v35 = [*(id *)(a1 + 80) URL];
        BOOL v23 = [v35 query];

        id v36 = [*(id *)(a1 + 40) countryAbbreviation];
        id v37 = WFLogForCategory(2uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = *(void *)(a1 + 56);
          id v40 = [v6 description];
          *(_DWORD *)buf = 138544130;
          uint64_t v54 = v39;
          __int16 v55 = 2114;
          __int16 v56 = v23;
          __int16 v57 = 2114;
          uint64_t v58 = v36;
          __int16 v59 = 2114;
          uint64_t v60 = v40;
          _os_log_error_impl(&dword_21C988000, v37, OS_LOG_TYPE_ERROR, "(%{public}@) WDS did not send an airQualityScale in its response. urlQuery=%{public}@, countryCode=%{public}@, error=%{public}@", buf, 0x2Au);
        }
      }

      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      goto LABEL_27;
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x263EFF960] currentLocale];
    id v11 = [v9 languageForLocale:v10];

    id v12 = [NSString stringWithFormat:@"%@-%@", v8, v11];
    id v13 = +[WFAQIScaleCacheManager sharedManager];
    id v14 = [v13 cachedScaleFromIdentifier:v12];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = WFLogForCategory(7uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_4((uint64_t)v12);
        }

        id v16 = [v5 airQualityObservations];
        [v16 setScale:v14];

        id v17 = *(void **)(a1 + 32);
        id v18 = [v5 airQualityObservations];
        id v19 = objc_msgSend(v17, "_currentScaleCategoryForScale:index:", v14, objc_msgSend(v18, "currentCategoryIndex"));
        id v20 = [v5 airQualityObservations];
        [v20 setCurrentScaleCategory:v19];

        (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      BOOL v24 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_5();
      }
    }
    BOOL v25 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_3();
    }

    id v26 = *(void **)(a1 + 64);
    id v52 = v6;
    id v14 = [v26 aqiScaleRequestForScaleNamed:v8 language:v11 error:&v52];
    id v27 = v52;

    if (v14)
    {
      id v42 = v27;
      id v28 = *(void **)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 56);
      uint64_t v41 = *(void *)(a1 + 64);
      uint64_t v30 = *(void *)(a1 + 72);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_144;
      v43[3] = &unk_264431ED8;
      id v44 = v12;
      id v31 = v5;
      uint64_t v32 = *(void *)(a1 + 32);
      id v45 = v31;
      uint64_t v46 = v32;
      id v47 = *(id *)(a1 + 56);
      id v33 = *(id *)(a1 + 88);
      uint64_t v34 = *(void *)(a1 + 104);
      id v50 = v33;
      uint64_t v51 = v34;
      id v48 = *(id *)(a1 + 40);
      id v49 = *(id *)(a1 + 48);
      [v28 _submitRequest:v14 withIdentifier:v29 forScaleNamed:v8 language:v11 configuration:v41 apiVersion:v30 completionHandler:v43];

      id v6 = v42;
    }
    else
    {
      id v38 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_2(a1);
      }

      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      id v6 = v27;
    }
    goto LABEL_26;
  }
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
LABEL_28:
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = +[WFAQIScaleCacheManager sharedManager];
    [v7 updateCacheWithScale:v5 identifier:*(void *)(a1 + 32)];

    id v8 = [*(id *)(a1 + 40) airQualityObservations];
    [v8 setScale:v5];

    id v9 = *(void **)(a1 + 48);
    id v10 = [*(id *)(a1 + 40) airQualityObservations];
    id v11 = objc_msgSend(v9, "_currentScaleCategoryForScale:index:", v5, objc_msgSend(v10, "currentCategoryIndex"));
    id v12 = [*(id *)(a1 + 40) airQualityObservations];
    [v12 setCurrentScaleCategory:v11];
  }
  else
  {
    id v13 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_144_cold_1(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (id)languageForLocale:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", a3);
  uint64_t v4 = [v3 preferredLocalizations];
  id v5 = [v4 objectAtIndex:0];

  id v6 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v6;
}

- (void)_forecastConditionsForTWCAQIAndTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v32 = a5;
  id v14 = a6;
  id v35 = a7;
  id v31 = a8;
  id v15 = [(WFWeatherStoreService *)self configuration];
  id v16 = [v15 settingsManager];
  id v17 = [(WFWeatherStoreService *)self apiVersionForSettings:v16];

  group = dispatch_group_create();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__2;
  v66[4] = __Block_byref_object_dispose__2;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__2;
  v64[4] = __Block_byref_object_dispose__2;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__2;
  v62[4] = __Block_byref_object_dispose__2;
  id v63 = 0;
  uint64_t v56 = 0;
  __int16 v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  __int16 v59 = __Block_byref_object_copy__2;
  uint64_t v60 = __Block_byref_object_dispose__2;
  id v61 = 0;
  id v55 = 0;
  id v18 = [v15 forecastRequestForTypes:a3 & 0xFFFFFFFFFFFFFFFELL location:v13 date:v14 apiVersion:v17 error:&v55];
  id v19 = v55;
  uint64_t v30 = v19;
  if (v18)
  {
    dispatch_group_enter(group);
    id v20 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      id v69 = v35;
      __int16 v70 = 2112;
      v71 = v18;
      __int16 v72 = 2112;
      id v73 = v13;
      _os_log_debug_impl(&dword_21C988000, v20, OS_LOG_TYPE_DEBUG, "(%{public}@) Built forecast request '%@' for location %@", buf, 0x20u);
    }

    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke;
    v51[3] = &unk_264431F28;
    id v53 = v66;
    uint64_t v54 = v62;
    uint64_t v21 = group;
    id v52 = v21;
    [(WFWeatherStoreService *)self _submitRequest:v18 withIdentifier:v35 forLocation:v13 forecastTypes:a3 configuration:v15 units:0 locale:v32 date:v14 apiVersion:v17 completionHandler:v51];

    id v50 = 0;
    int v22 = [v15 forecastRequestForTypes:1 location:v13 date:v14 apiVersion:v17 error:&v50];
    id v23 = v50;
    id v29 = v50;
    if (v22)
    {
      dispatch_group_enter(v21);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_153;
      v45[3] = &unk_264431F50;
      id v48 = v64;
      uint64_t v46 = v13;
      id v49 = &v56;
      id v47 = v21;
      [(WFWeatherStoreService *)self _submitRequest:v22 withIdentifier:v35 forLocation:v46 forecastTypes:1 configuration:v15 units:0 locale:v32 date:v14 apiVersion:v17 completionHandler:v45];

      BOOL v24 = v46;
    }
    else
    {
      objc_storeStrong(v57 + 5, v23);
      if (!v57[5])
      {
        uint64_t v26 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
        id v27 = v57[5];
        v57[5] = (id)v26;
      }
      BOOL v24 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreService _forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:]();
      }
    }

    id v28 = [(WFWeatherStoreService *)self parseQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_154;
    block[3] = &unk_264431F78;
    uint64_t v41 = v66;
    id v42 = v64;
    block[4] = self;
    unint64_t v44 = a3;
    id v37 = v13;
    id v38 = v14;
    id v39 = v35;
    id v40 = v31;
    id v43 = v62;
    dispatch_group_notify(v21, v28, block);
  }
  else
  {
    if (!v19)
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
    }
    BOOL v25 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:]((uint64_t)v35);
    }

    (*((void (**)(id, void, void *))v31 + 2))(v31, 0, v30);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
}

void __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 airQualityObservations];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLocation:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_154(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v2)
  {
    [v2 setAirQualityObservations:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) {
      [*(id *)(a1 + 32) _cacheParsedForecastData:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) types:*(void *)(a1 + 96) location:*(void *)(a1 + 40) date:*(void *)(a1 + 48) requestIdentifier:*(void *)(a1 + 56)];
    }
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

- (id)_currentScaleCategoryForScale:(id)a3 index:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4
    && ([v5 categories],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 >= a4))
  {
    id v11 = [v6 categories];
    id v10 = [v11 objectAtIndexedSubscript:a4 - 1];
  }
  else
  {
    uint64_t v9 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreService _currentScaleCategoryForScale:index:](v9);
    }

    id v10 = 0;
  }

  return v10;
}

- (void)_cacheObject:(id)a3 type:(unint64_t)a4 date:(id)a5 forLocation:(id)a6
{
  id v10 = a3;
  id v11 = WFCacheKeyForForecastType(a4, a6, a5);
  id v14 = 0;
  WFCacheDetailsForForecastType(a4, 0, (uint64_t *)&v14);
  id v12 = v14;
  id v13 = [(WFWeatherStoreService *)self cache];
  [v13 cache:v10 withinDomain:v12 forKey:v11];
}

- (BOOL)_cacheParsedForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 date:(id)a6 requestIdentifier:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v18 = v16 || v14 == 0 || a4 == 0;
  BOOL v19 = !v18;
  if (v18)
  {
    id v20 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v15;
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_error_impl(&dword_21C988000, v20, OS_LOG_TYPE_ERROR, "(%@) Failed to cache result.  Forecast Type: %lu / Date: %@", buf, 0x20u);
    }
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __88__WFWeatherStoreService__cacheParsedForecastData_types_location_date_requestIdentifier___block_invoke;
    v22[3] = &unk_264431FA0;
    id v23 = v12;
    BOOL v24 = self;
    id v25 = v14;
    id v26 = v13;
    [(WFWeatherStoreService *)self _enumerateForecastTypesIn:a4 usingBlock:v22];

    id v20 = v23;
  }

  return v19;
}

uint64_t __88__WFWeatherStoreService__cacheParsedForecastData_types_location_date_requestIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForForecastType:a2];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [*(id *)(a1 + 40) _cacheObject:v4 type:a2 date:*(void *)(a1 + 48) forLocation:*(void *)(a1 + 56)];
    uint64_t v5 = v7;
  }
  return MEMORY[0x270F9A758](v4, v5);
}

- (void)_enumerateForecastTypesIn:(unint64_t)a3 usingBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = WFForecastTypes();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__WFWeatherStoreService__enumerateForecastTypesIn_usingBlock___block_invoke;
  v8[3] = &unk_264431FC8;
  id v9 = v5;
  unint64_t v10 = a3;
  id v7 = v5;
  [v6 enumerateIndexesUsingBlock:v8];
}

uint64_t __62__WFWeatherStoreService__enumerateForecastTypesIn_usingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if ((a2 & ~*(void *)(result + 40)) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forLocation:(id)a5 forecastTypes:(unint64_t)a6 configuration:(id)a7 units:(int)a8 locale:(id)a9 date:(id)a10 apiVersion:(id)a11 completionHandler:(id)a12
{
  id v16 = a3;
  id v32 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = [v16 URL];
  queue = [(WFWeatherStoreService *)self incomingRequestQueue];
  BOOL v24 = [(WFWeatherStoreService *)self parseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke;
  block[3] = &unk_264432040;
  block[4] = self;
  id v40 = v32;
  id v41 = v23;
  id v42 = v18;
  id v43 = v16;
  id v44 = v21;
  id v45 = v24;
  id v49 = v22;
  unint64_t v50 = a6;
  id v46 = v17;
  id v47 = v19;
  int v51 = a8;
  id v48 = v20;
  id v37 = v20;
  id v35 = v19;
  id v33 = v17;
  id v25 = v24;
  id v26 = v21;
  id v27 = v16;
  id v28 = v18;
  id v29 = v23;
  id v30 = v32;
  id v31 = v22;
  dispatch_async(queue, block);
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = [[WFWeatherStoreCallbackWrapper alloc] initWithForecastRetrievalBlock:*(void *)(a1 + 112)];
  uint64_t v3 = *(void **)(a1 + 32);
  id v52 = 0;
  char v4 = [v3 _isConnectivityAvailableForWeatherHost:&v52];
  id v5 = v52;
  if (v4)
  {
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x3032000000;
    id v45 = __Block_byref_object_copy__2;
    id v46 = __Block_byref_object_dispose__2;
    id v47 = [*(id *)(a1 + 32) _taskForURL:*(void *)(a1 + 48)];
    if (v43[5])
    {
      uint64_t v6 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 120);
        id v9 = [(id)v43[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v7;
        __int16 v55 = 2048;
        uint64_t v56 = v8;
        __int16 v57 = 2114;
        uint64_t v58 = v9;
        _os_log_impl(&dword_21C988000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %lu request will multiplex to %{public}@.", buf, 0x20u);
      }
      [*(id *)(a1 + 32) _addCallback:v2 requestIdentifier:*(void *)(a1 + 40) forURL:*(void *)(a1 + 48)];
    }
    else
    {
      id v11 = [MEMORY[0x263EFF910] date];
      id v12 = [*(id *)(a1 + 56) session];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_158;
      v29[3] = &unk_264432018;
      void v29[4] = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 64);
      id v30 = *(id *)(a1 + 72);
      id v31 = *(id *)(a1 + 40);
      id v32 = *(id *)(a1 + 48);
      id v39 = &v42;
      id v14 = v11;
      id v33 = v14;
      id v34 = *(id *)(a1 + 80);
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 120);
      id v35 = v15;
      uint64_t v40 = v16;
      id v36 = *(id *)(a1 + 88);
      int v41 = *(_DWORD *)(a1 + 128);
      id v37 = *(id *)(a1 + 96);
      id v38 = *(id *)(a1 + 104);
      uint64_t v17 = [v12 dataTaskWithRequest:v13 completionHandler:v29];
      id v18 = (void *)v43[5];
      v43[5] = v17;

      [*(id *)(a1 + 32) _setTask:v43[5] requestIdentifier:*(void *)(a1 + 40) callback:v2 forURL:*(void *)(a1 + 48)];
      id v19 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(a1 + 120);
        id v28 = [(id)v43[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v26;
        __int16 v55 = 2048;
        uint64_t v56 = v27;
        __int16 v57 = 2114;
        uint64_t v58 = v28;
        _os_log_debug_impl(&dword_21C988000, v19, OS_LOG_TYPE_DEBUG, "(%{public}@) %lu request is starting for %{public}@", buf, 0x20u);
      }
      id v20 = [*(id *)(a1 + 32) forecastRequestStartingCallback];

      if (v20)
      {
        id v21 = [*(id *)(a1 + 32) forecastRequestStartingCallback];
        v21[2](v21, *(void *)(a1 + 48), *(void *)(a1 + 88));
      }
      [(id)v43[5] resume];
      id v22 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v24 = *(void *)(a1 + 120);
        id v25 = [(id)v43[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v23;
        __int16 v55 = 2048;
        uint64_t v56 = v24;
        __int16 v57 = 2114;
        uint64_t v58 = v25;
        _os_log_impl(&dword_21C988000, v22, OS_LOG_TYPE_DEFAULT, "(%{public}@) %lu request has resumed for %{public}@.", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    unint64_t v10 = [*(id *)(a1 + 32) mapQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2;
    block[3] = &unk_2644314E8;
    id v49 = *(id *)(a1 + 40);
    unint64_t v50 = v2;
    id v51 = v5;
    dispatch_async(v10, block);
  }
}

uint64_t __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WFLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 40) executeCallbackwithResponse:0 error:*(void *)(a1 + 48)];
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_158(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _handleDataTaskCompletionWithData:v7 httpResponse:a3 apiVersion:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) requestURL:*(void *)(a1 + 56) dataTask:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) dataTaskError:v8 startDate:*(void *)(a1 + 64)])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_159;
    block[3] = &unk_264431FF0;
    id v9 = *(NSObject **)(a1 + 72);
    id v10 = *(id *)(a1 + 80);
    uint64_t v11 = *(void *)(a1 + 120);
    id v16 = v10;
    uint64_t v25 = v11;
    id v17 = v7;
    id v18 = *(id *)(a1 + 88);
    int v26 = *(_DWORD *)(a1 + 128);
    id v19 = *(id *)(a1 + 96);
    id v20 = *(id *)(a1 + 104);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    id v23 = v12;
    uint64_t v24 = v13;
    dispatch_async(v9, block);
  }
  else
  {
    id v14 = WFLogForCategory(8uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_158_cold_1();
    }

    [*(id *)(a1 + 32) _executeCallbacksForURL:*(void *)(a1 + 56) responseData:0 error:v8];
  }
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_159(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 112);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  id v17 = 0;
  id v10 = [v3 parseForecast:v2 data:v4 location:v5 units:v6 locale:v7 date:v8 apiVersion:v9 error:&v17];
  id v11 = v17;
  if (v11)
  {
    id v12 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 80);
      uint64_t v15 = *(void *)(a1 + 88);
      id v16 = (void *)[[NSString alloc] initWithData:*(void *)(a1 + 40) encoding:4];
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_error_impl(&dword_21C988000, v12, OS_LOG_TYPE_ERROR, "(%{public}@) Observed error while parsing forecast data: %{public}@\n%@\n%@", buf, 0x2Au);
    }
  }
  uint64_t v13 = [[WFWeatherStoreResponseDataWrapper alloc] initWithForecastData:v10];
  [*(id *)(a1 + 96) _executeCallbacksForURL:*(void *)(a1 + 88) responseData:v13 error:v11];
}

- (BOOL)_handleDataTaskCompletionWithData:(id)a3 httpResponse:(id)a4 apiVersion:(id)a5 identifier:(id)a6 requestURL:(id)a7 dataTask:(id)a8 dataTaskError:(id)a9 startDate:(id)a10
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v53 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v16 && [v17 statusCode] == 200)
  {
    uint64_t v23 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v16 length];
      [v20 description];
      id v51 = v22;
      v26 = id v25 = v20;
      *(_DWORD *)buf = 138543874;
      id v57 = v53;
      __int16 v58 = 2048;
      uint64_t v59 = v24;
      __int16 v60 = 2114;
      id v61 = v26;
      _os_log_impl(&dword_21C988000, v23, OS_LOG_TYPE_INFO, "(%{public}@) Received data (%lu bytes) from %{public}@.", buf, 0x20u);

      id v20 = v25;
      id v22 = v51;
    }

    [(WFWeatherStoreService *)self requestSuccessForAPIVersion:v18];
    BOOL v27 = 1;
    goto LABEL_22;
  }
  [(WFWeatherStoreService *)self requestFailureForAPIVersion:v18 error:v21];
  id v28 = [v21 domain];
  id v52 = v20;
  if ([v28 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v29 = [v21 code];

    if (v29 == -999)
    {
      id v30 = (void *)MEMORY[0x263F087E8];
      id v31 = &unk_26CD65348;
      uint64_t v32 = 13;
      id v33 = v21;
      goto LABEL_14;
    }
  }
  else
  {
  }
  if ([v17 statusCode] == 200)
  {
    if (!v16)
    {
      uint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 9);
      goto LABEL_18;
    }
    id v30 = (void *)MEMORY[0x263F087E8];
    if (!v21)
    {
      uint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 17, 0);
      goto LABEL_18;
    }
    uint64_t v32 = 5;
    id v33 = v21;
    id v31 = 0;
LABEL_14:
    uint64_t v34 = objc_msgSend(v30, "wf_errorWithCode:encapsulatedError:userInfo:", v32, v33, v31);
LABEL_18:
    uint64_t v44 = (void *)v34;
    goto LABEL_19;
  }
  id v35 = (void *)MEMORY[0x263F087E8];
  uint64_t v54 = @"statusCode";
  id v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "statusCode"));
  __int16 v55 = v36;
  [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  id v37 = v18;
  id v38 = self;
  id v39 = v17;
  id v40 = v16;
  id v41 = v22;
  id v43 = v42 = v19;
  uint64_t v44 = objc_msgSend(v35, "wf_errorWithCode:userInfo:", 8, v43);

  id v19 = v42;
  id v22 = v41;
  id v16 = v40;
  id v17 = v39;
  self = v38;
  id v18 = v37;

LABEL_19:
  id v45 = v19;
  [(WFWeatherStoreService *)self _executeCallbacksForURL:v19 responseData:0 error:v44];
  id v46 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    unint64_t v50 = [v52 description];
    *(_DWORD *)buf = 138543874;
    id v57 = v53;
    __int16 v58 = 2114;
    uint64_t v59 = (uint64_t)v50;
    __int16 v60 = 2112;
    id v61 = v44;
    _os_log_error_impl(&dword_21C988000, v46, OS_LOG_TYPE_ERROR, "(%{public}@) Error received from %{public}@: %@", buf, 0x20u);
  }
  id v47 = [[WFNetworkEvent alloc] initWithEventType:WFNetworkEventTypeFromAPIVersion(v18) startDate:v22 error:v21];
  id v48 = +[WFNetworkBehaviorMonitor sharedInstance];
  [v48 logNetworkEvent:v47];

  BOOL v27 = 0;
  id v19 = v45;
  id v20 = v52;
LABEL_22:

  return v27;
}

- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forScaleNamed:(id)a5 language:(id)a6 configuration:(id)a7 apiVersion:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = [v14 URL];
  id v21 = [(WFWeatherStoreService *)self incomingRequestQueue];
  id v22 = [(WFWeatherStoreService *)self parseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke;
  block[3] = &unk_264432090;
  id v38 = v16;
  id v39 = v19;
  void block[4] = self;
  id v32 = v15;
  id v33 = v20;
  id v34 = v17;
  id v35 = v14;
  id v36 = v18;
  id v37 = v22;
  id v23 = v16;
  id v24 = v22;
  id v25 = v18;
  id v26 = v14;
  id v27 = v17;
  id v28 = v20;
  id v29 = v15;
  id v30 = v19;
  dispatch_async(v21, block);
}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v2 = [[WFWeatherStoreCallbackWrapper alloc] initWithAQIScaleRetrievalBlock:*(void *)(a1 + 96)];
  uint64_t v3 = *(void **)(a1 + 32);
  id v44 = 0;
  char v4 = [v3 _isConnectivityAvailableForWeatherHost:&v44];
  id v5 = v44;
  if (v4)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__2;
    id v38 = __Block_byref_object_dispose__2;
    id v39 = [*(id *)(a1 + 32) _taskForURL:*(void *)(a1 + 48)];
    if (v35[5])
    {
      uint64_t v6 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 88);
        uint64_t v9 = [(id)v35[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v7;
        __int16 v47 = 2114;
        uint64_t v48 = v8;
        __int16 v49 = 2114;
        unint64_t v50 = v9;
        _os_log_impl(&dword_21C988000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) (%{public}@) scale request will multiplex to %{public}@.", buf, 0x20u);
      }
      [*(id *)(a1 + 32) _addCallback:v2 requestIdentifier:*(void *)(a1 + 40) forURL:*(void *)(a1 + 48)];
    }
    else
    {
      id v11 = [MEMORY[0x263EFF910] date];
      id v12 = [*(id *)(a1 + 56) session];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_176;
      v25[3] = &unk_264432068;
      v25[4] = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 64);
      id v26 = *(id *)(a1 + 72);
      id v27 = *(id *)(a1 + 40);
      id v28 = *(id *)(a1 + 48);
      id v33 = &v34;
      id v14 = v11;
      id v29 = v14;
      id v30 = *(id *)(a1 + 80);
      id v31 = *(id *)(a1 + 56);
      id v32 = *(id *)(a1 + 88);
      uint64_t v15 = [v12 dataTaskWithRequest:v13 completionHandler:v25];
      id v16 = (void *)v35[5];
      v35[5] = v15;

      [*(id *)(a1 + 32) _setTask:v35[5] requestIdentifier:*(void *)(a1 + 40) callback:v2 forURL:*(void *)(a1 + 48)];
      id v17 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = *(void *)(a1 + 88);
        id v24 = [(id)v35[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v22;
        __int16 v47 = 2114;
        uint64_t v48 = v23;
        __int16 v49 = 2114;
        unint64_t v50 = v24;
        _os_log_debug_impl(&dword_21C988000, v17, OS_LOG_TYPE_DEBUG, "(%{public}@) (%{public}@) scale is starting for %{public}@", buf, 0x20u);
      }
      [(id)v35[5] resume];
      id v18 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 88);
        id v21 = [(id)v35[5] description];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v19;
        __int16 v47 = 2114;
        uint64_t v48 = v20;
        __int16 v49 = 2114;
        unint64_t v50 = v21;
        _os_log_impl(&dword_21C988000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@)  (%{public}@) scale request has resumed for %{public}@.", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) mapQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_2;
    block[3] = &unk_2644314E8;
    id v41 = *(id *)(a1 + 40);
    id v42 = v2;
    id v43 = v5;
    dispatch_async(v10, block);
  }
}

uint64_t __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WFLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 40) executeCallbackwithResponse:0 error:*(void *)(a1 + 48)];
}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_176(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _handleDataTaskCompletionWithData:v7 httpResponse:a3 apiVersion:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) requestURL:*(void *)(a1 + 56) dataTask:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) dataTaskError:v8 startDate:*(void *)(a1 + 64)])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_177;
    block[3] = &unk_2644306D8;
    uint64_t v9 = *(NSObject **)(a1 + 72);
    id v14 = *(id *)(a1 + 80);
    id v15 = *(id *)(a1 + 88);
    id v16 = v7;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    id v19 = v10;
    uint64_t v20 = v11;
    dispatch_async(v9, block);
  }
  else
  {
    id v12 = WFLogForCategory(8uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_158_cold_1();
    }

    [*(id *)(a1 + 32) _executeCallbacksForURL:*(void *)(a1 + 56) responseData:0 error:v8];
  }
}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_177(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v13 = 0;
  uint64_t v6 = [v2 parseAQIScaleNamed:v3 data:v4 apiVersion:v5 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      id v12 = (void *)[[NSString alloc] initWithData:*(void *)(a1 + 48) encoding:4];
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_error_impl(&dword_21C988000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Observed error while parsing AQI Scale: %{public}@\n%@\n%@", buf, 0x2Au);
    }
  }
  uint64_t v9 = [[WFWeatherStoreResponseDataWrapper alloc] initWithAQIScale:v6];
  [*(id *)(a1 + 80) _executeCallbacksForURL:*(void *)(a1 + 72) responseData:v9 error:v7];
}

- (id)apiVersionForSettings:(id)a3
{
  p_retryLock = &self->_retryLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(WFWeatherStoreService *)self retryManager];
  id v7 = [v5 settings];

  uint64_t v8 = [v6 apiVersionForSettings:v7];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = @"wds_v1";
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  uint64_t v11 = v10;

  os_unfair_lock_unlock(p_retryLock);
  return v11;
}

- (void)requestSuccessForAPIVersion:(id)a3
{
  p_retryLock = &self->_retryLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(WFWeatherStoreService *)self retryManager];
  [v6 requestSuccessForAPIVersion:v5];

  os_unfair_lock_unlock(p_retryLock);
}

- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4
{
  p_retryLock = &self->_retryLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(WFWeatherStoreService *)self retryManager];
  [v9 requestFailureForAPIVersion:v8 error:v7];

  os_unfair_lock_unlock(p_retryLock);
}

- (void)_cancelWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWeatherStoreService *)self incomingRequestQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke;
  v7[3] = &unk_264431680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke_2;
  v4[3] = &unk_264431680;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_sync(v2, v4);
}

void __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke_2(uint64_t a1)
{
  id v15 = [*(id *)(a1 + 32) URLToCallbackMap];
  uint64_t v2 = [*(id *)(a1 + 32) URLToTaskMap];
  uint64_t v3 = [*(id *)(a1 + 32) UUIDToCallbackMap];
  id v4 = [*(id *)(a1 + 32) UUIDToURLMap];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = [v15 objectForKeyedSubscript:v5];
  id v7 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 requestType];
    if (v9 == 1)
    {
      uint64_t v10 = [v8 aqiScaleRetrievalCompletionBlock];
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      id v12 = &unk_26CD65398;
    }
    else
    {
      if (v9)
      {
LABEL_8:
        [v3 removeObjectForKey:*(void *)(a1 + 40)];
        [v6 removeObject:v8];
        goto LABEL_9;
      }
      uint64_t v10 = [v8 forecastRetrievalCompletionBlock];
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      id v12 = &unk_26CD65370;
    }
    id v13 = objc_msgSend(v11, "wf_errorWithCode:userInfo:", 13, v12);
    ((void (**)(void, void, void *))v10)[2](v10, 0, v13);

    goto LABEL_8;
  }
LABEL_9:
  if (![v6 count])
  {
    [v15 removeObjectForKey:v5];
    id v14 = [v2 objectForKeyedSubscript:v5];
    [v14 cancel];
    [v2 removeObjectForKey:v5];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
LABEL_12:
}

- (id)_taskForURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  __int16 v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v5 = [(WFWeatherStoreService *)self mapQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFWeatherStoreService__taskForURL___block_invoke;
  block[3] = &unk_2644320B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __37__WFWeatherStoreService__taskForURL___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) URLToTaskMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setTask:(id)a3 requestIdentifier:(id)a4 callback:(id)a5 forURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(WFWeatherStoreService *)self mapQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WFWeatherStoreService__setTask_requestIdentifier_callback_forURL___block_invoke;
  block[3] = &unk_2644320E0;
  void block[4] = self;
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v23 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __68__WFWeatherStoreService__setTask_requestIdentifier_callback_forURL___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) UUIDToURLMap];
  [v6 setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) UUIDToCallbackMap];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) URLToTaskMap];
  [v3 setObject:*(void *)(a1 + 64) forKeyedSubscript:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) URLToCallbackMap];
  id v5 = [MEMORY[0x263EFF980] arrayWithObject:*(void *)(a1 + 56)];
  [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
}

- (void)_addCallback:(id)a3 requestIdentifier:(id)a4 forURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFWeatherStoreService *)self mapQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__WFWeatherStoreService__addCallback_requestIdentifier_forURL___block_invoke;
  v15[3] = &unk_264432108;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __63__WFWeatherStoreService__addCallback_requestIdentifier_forURL___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) URLToCallbackMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 addObject:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 32) UUIDToURLMap];
  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 56)];
  id v4 = [*(id *)(a1 + 32) UUIDToCallbackMap];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 56)];
}

- (void)_executeCallbacksForURL:(id)a3 responseData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFWeatherStoreService *)self mapQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke;
  v15[3] = &unk_264432108;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) URLToCallbackMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke_2;
  id v7 = &unk_264432130;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v3 enumerateObjectsUsingBlock:&v4];
  objc_msgSend(*(id *)(a1 + 32), "_cleanupCallbacksAndTasksForURL:", *(void *)(a1 + 40), v4, v5, v6, v7);
}

uint64_t __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 executeCallbackwithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_cleanupCallbacksAndTasksForURL:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWeatherStoreService *)self UUIDToURLMap];
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__WFWeatherStoreService__cleanupCallbacksAndTasksForURL___block_invoke;
  v26[3] = &unk_264432158;
  id v7 = v4;
  id v27 = v7;
  id v8 = v6;
  id v28 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v26];
  id v9 = [(WFWeatherStoreService *)self UUIDToCallbackMap];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "removeObjectForKey:", v15, (void)v22);
        [v9 removeObjectForKey:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v33 count:16];
    }
    while (v12);
  }

  id v16 = [(WFWeatherStoreService *)self URLToCallbackMap];
  [v16 removeObjectForKey:v7];
  id v17 = [(WFWeatherStoreService *)self URLToTaskMap];
  id v18 = [v17 objectForKeyedSubscript:v7];
  if (v18)
  {
    uint64_t v19 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v10 componentsJoinedByString:@", "];
      id v21 = [v18 description];
      *(_DWORD *)buf = 138543618;
      id v30 = v20;
      __int16 v31 = 2114;
      id v32 = v21;
      _os_log_impl(&dword_21C988000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished processing %{public}@.", buf, 0x16u);
    }
    [v17 removeObjectForKey:v7];
  }
}

void __57__WFWeatherStoreService__cleanupCallbacksAndTasksForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (WFWeatherStoreServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)forecastRequestStartingCallback
{
  return self->_forecastRequestStartingCallback;
}

- (void)setForecastRequestStartingCallback:(id)a3
{
}

- (id)locationGeocodeForCoordinateRequestStartingCallback
{
  return self->_locationGeocodeForCoordinateRequestStartingCallback;
}

- (void)setLocationGeocodeForCoordinateRequestStartingCallback:(id)a3
{
}

- (OS_dispatch_queue)incomingRequestQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncomingRequestQueue:(id)a3
{
}

- (OS_dispatch_queue)parseQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParseQueue:(id)a3
{
}

- (OS_dispatch_queue)mapQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMapQueue:(id)a3
{
}

- (os_unfair_lock_s)retryLock
{
  return self->_retryLock;
}

- (void)setRetryLock:(os_unfair_lock_s)a3
{
  self->_retryLock = a3;
}

- (NSMutableDictionary)UUIDToCallbackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUUIDToCallbackMap:(id)a3
{
}

- (NSMutableDictionary)UUIDToURLMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUUIDToURLMap:(id)a3
{
}

- (NSMutableDictionary)URLToTaskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setURLToTaskMap:(id)a3
{
}

- (NSMutableDictionary)URLToCallbackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setURLToCallbackMap:(id)a3
{
}

- (WFWeatherStoreCache)cache
{
  return (WFWeatherStoreCache *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCache:(id)a3
{
}

- (WFNetworkRetryManager)retryManager
{
  return self->_retryManager;
}

- (void)setRetryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryManager, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_URLToCallbackMap, 0);
  objc_storeStrong((id *)&self->_URLToTaskMap, 0);
  objc_storeStrong((id *)&self->_UUIDToURLMap, 0);
  objc_storeStrong((id *)&self->_UUIDToCallbackMap, 0);
  objc_storeStrong((id *)&self->_mapQueue, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequestQueue, 0);
  objc_storeStrong(&self->_locationGeocodeForCoordinateRequestStartingCallback, 0);
  objc_storeStrong(&self->_forecastRequestStartingCallback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Store service configuration is invalid - aborting initialization of %@", v5, 0xCu);
}

- (void)initWithConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Error opening WFWeatherStoreCache: %@", v2, v3, v4, v5, v6);
}

- (void)forecastForLocation:(uint64_t)a1 locale:(NSObject *)a2 onDate:requestIdentifier:options:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Invalid date given for Forecast request: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_7();
  id v8 = objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "geoLocation");
  OUTLINED_FUNCTION_5_0(&dword_21C988000, v2, v3, "(%{public}@) Invalid location given for Forecast request: %{private}@", v4, v5, v6, v7, 3u);
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "(%{public}@) Valid array of hourly WFWeatherConditions instances found in cache.", v2, v3, v4, v5, v6);
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "(%{public}@) Check cache for valid array of hourly WFWeatherConditions instances.", v2, v3, v4, v5, v6);
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "geoLocation");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_21C988000, v3, v4, "(%{public}@) Invalid location given for HourlyForecast request: %@", v5, v6, v7, v8, v9);
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "geoLocation");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_21C988000, v3, v4, "(%{public}@) Invalid location given for DailyForecast request: %@", v5, v6, v7, v8, v9);
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "(%{public}@) Valid array of daily WFWeatherConditions instances found in cache.", v2, v3, v4, v5, v6);
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "(%{public}@) Check cache for valid array of daily WFWeatherConditions instances.", v2, v3, v4, v5, v6);
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "expirationDate");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_21C988000, v3, v4, "(%{public}@) Valid WFAirQualityConditions instance found in cache. Expires @ %@", v5, v6, v7, v8, v9);
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "(%{public}@) Check cache for valid WFAirQualityConditions instance.", v2, v3, v4, v5, v6);
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "geoLocation");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_21C988000, v3, v4, "(%{public}@) Invalid location given for AirQuality request: %@", v5, v6, v7, v8, v9);
}

- (void)_forecastConditionsForTypes:(uint64_t)a1 location:units:locale:date:requestIdentifier:requestOptions:completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5(&dword_21C988000, v1, v2, "(%{public}@) Failed to build forecast request: %{public}@", (void)v3, DWORD2(v3));
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5(&dword_21C988000, v1, v2, "(%{public}@) WDS told us that air quality data is temporarily unavailable. Forecast Data=%{public}@", (void)v3, DWORD2(v3));
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5(&dword_21C988000, v1, v2, "(%{public}@) AQI scale request failed: %{public}@", (void)v3, DWORD2(v3));
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "No cached AQI scale with identifier: (%{public}@) in cache ... fetching it from WDS ...", v2, v3, v4, v5, v6);
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_4(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_21C988000, v1, OS_LOG_TYPE_DEBUG, "Applying cached aqi scale found with identifier: (%{public}@), scale: (%{public}@)", (uint8_t *)&v2, 0x16u);
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_137_cold_5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_21C988000, v0, OS_LOG_TYPE_FAULT, "The unarchived scale with identifier: (%{public}@) is not of the correct type", v1, 0xCu);
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_144_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5(&dword_21C988000, v1, v2, "(%{public}@) AQI scale request succeeded but parsing failed for identfier: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_21C988000, v0, v1, "(%{public}@) Failed to build forecast request: %{public}@");
}

- (void)_currentScaleCategoryForScale:(os_log_t)log index:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Unexpected category index", v1, 2u);
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "(%{public}@) No internet connection available; skipping query.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_158_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "(%{public}@) Received an unsuccessful HTTP response; aborting.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end