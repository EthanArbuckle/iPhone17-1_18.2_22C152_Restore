@interface WAForecastModelController
- (BOOL)fetchForecastForCities:(id)a3 completion:(id)a4;
- (BOOL)fetchForecastForCity:(id)a3 completion:(id)a4;
- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 completion:(id)a5;
- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6;
- (BOOL)isCityBeingUpdated:(id)a3;
- (BOOL)isPriorityCity:(id)a3;
- (BOOL)isPriorityCityBeingUpdated:(id)a3;
- (BOOL)isPriorityForecastOperationsEnabled;
- (NSMutableDictionary)completionHandlersForCity;
- (NSMutableDictionary)priorityCompletionHandlersForCity;
- (NSMutableSet)priorityUpdatingCities;
- (NSMutableSet)updatingCities;
- (NSOperationQueue)forecastOperationQueue;
- (NSOperationQueue)priorityForecastOperationQueue;
- (NSString)trackingParameter;
- (OS_dispatch_queue)completionHandlerQueue;
- (OS_dispatch_queue)incomingRequestQueue;
- (WAForecastModelController)init;
- (WALocationPrivacySampler)locationGeocodingSampler;
- (WFServiceConnection)connection;
- (WFWeatherStoreService)store;
- (ct_green_tea_logger_s)greenTeaLogger;
- (id)_commaSeparatedNamesForUpdatingCities:(id)a3;
- (id)_commaSeparatedPriorityUpdatingCitiesNames;
- (id)_commaSeparatedUpdatingCitiesNames;
- (id)_queue_executeFetchForCity:(id)a3 completion:(id)a4;
- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6;
- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6 completionHandlersForCity:(id)a7 updatingCities:(id)a8;
- (void)_handleForecastOperationCompletion:(id)a3;
- (void)cancelAllFetchRequests;
- (void)dealloc;
- (void)setCompletionHandlerQueue:(id)a3;
- (void)setCompletionHandlersForCity:(id)a3;
- (void)setConnection:(id)a3;
- (void)setForecastOperationQueue:(id)a3;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
- (void)setIncomingRequestQueue:(id)a3;
- (void)setLocationGeocodingSampler:(id)a3;
- (void)setPriorityCompletionHandlersForCity:(id)a3;
- (void)setPriorityForecastOperationQueue:(id)a3;
- (void)setPriorityUpdatingCities:(id)a3;
- (void)setTrackingParameter:(id)a3;
- (void)setUpdatingCities:(id)a3;
@end

@implementation WAForecastModelController

- (WAForecastModelController)init
{
  v25.receiver = self;
  v25.super_class = (Class)WAForecastModelController;
  v2 = [(WAForecastModelController *)&v25 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(WAForecastModelController *)v2 setForecastOperationQueue:v3];

    v4 = [(WAForecastModelController *)v2 forecastOperationQueue];
    [v4 setMaxConcurrentOperationCount:1];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.weather.forecastModelController.incomingRequestQueue", 0);
    [(WAForecastModelController *)v2 setIncomingRequestQueue:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.weather.forecastModelController.completionHandlerQueue", MEMORY[0x263EF83A8]);
    [(WAForecastModelController *)v2 setCompletionHandlerQueue:v6];

    v7 = objc_opt_new();
    [(WAForecastModelController *)v2 setUpdatingCities:v7];

    v8 = objc_opt_new();
    [(WAForecastModelController *)v2 setCompletionHandlersForCity:v8];

    if ([(WAForecastModelController *)v2 isPriorityForecastOperationsEnabled])
    {
      v9 = objc_opt_new();
      [(WAForecastModelController *)v2 setPriorityForecastOperationQueue:v9];

      v10 = [(WAForecastModelController *)v2 priorityForecastOperationQueue];
      [v10 setMaxConcurrentOperationCount:1];

      v11 = objc_opt_new();
      [(WAForecastModelController *)v2 setPriorityUpdatingCities:v11];

      v12 = objc_opt_new();
      [(WAForecastModelController *)v2 setPriorityCompletionHandlersForCity:v12];
    }
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v13 = objc_opt_new();
    v14 = +[WeatherInternalPreferences sharedInternalPreferences];
    int v15 = [v14 isInternalInstall];

    if (v15) {
      objc_storeStrong((id *)&v2->_store, v13);
    }
    objc_initWeak(&location, v2);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __33__WAForecastModelController_init__block_invoke;
    v22[3] = &unk_2647E01E0;
    objc_copyWeak(&v23, &location);
    [v13 setForecastRequestStartingCallback:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __33__WAForecastModelController_init__block_invoke_12;
    v20[3] = &unk_2647E0208;
    objc_copyWeak(&v21, &location);
    [v13 setLocationGeocodeForCoordinateRequestStartingCallback:v20];
    v16 = (void *)[objc_alloc(MEMORY[0x263F85FA8]) initWithStore:v13];
    v17 = objc_opt_new();
    [v17 setServiceProxy:v16];
    [v16 addClient:v17];
    connection = v2->_connection;
    v2->_connection = (WFServiceConnection *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__WAForecastModelController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [WeakRetained incomingRequestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__WAForecastModelController_init__block_invoke_2;
  block[3] = &unk_2647E1638;
  id v13 = WeakRetained;
  id v14 = v6;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  id v11 = WeakRetained;
  dispatch_async(v8, block);
}

void __33__WAForecastModelController_init__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) updatingCities];
  v3 = (void *)[v2 copy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412290;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isLocalWeatherCity", v16, (void)v17))
        {
          id v11 = *(void **)(a1 + 40);
          v12 = [v10 wfLocation];
          LODWORD(v11) = [v11 isEqual:v12];

          if (v11)
          {
            [*(id *)(a1 + 32) greenTeaLogger];
            id v13 = getCTGreenTeaOsLogHandle();
            id v14 = v13;
            if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = *(void *)(a1 + 48);
              *(_DWORD *)buf = v16;
              uint64_t v22 = v15;
              _os_log_impl(&dword_226D1D000, v14, OS_LOG_TYPE_INFO, "Transmitting current location to %@ for local weather forecast.", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }
}

void __33__WAForecastModelController_init__block_invoke_12(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v6 = [WeakRetained incomingRequestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__WAForecastModelController_init__block_invoke_2_13;
  block[3] = &unk_2647E1660;
  id v9 = WeakRetained;
  double v10 = a2;
  double v11 = a3;
  id v7 = WeakRetained;
  dispatch_async(v6, block);
}

void __33__WAForecastModelController_init__block_invoke_2_13(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) updatingCities];
  v3 = (void *)[v2 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 isLocalWeatherCity])
        {
          double v10 = [v9 wfLocation];
          double v11 = [v10 geoLocation];
          [v11 coordinate];
          BOOL v14 = CLLocationCoordinate2DEqualToCoordinates(v12, v13, *(double *)(a1 + 40), *(double *)(a1 + 48));

          if (v14)
          {
            [*(id *)(a1 + 32) greenTeaLogger];
            uint64_t v15 = getCTGreenTeaOsLogHandle();
            long long v16 = v15;
            if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v17 = 0;
              _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", v17, 2u);
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  [(WAForecastModelController *)self greenTeaLogger];
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WAForecastModelController;
  [(WAForecastModelController *)&v3 dealloc];
}

- (void)setLocationGeocodingSampler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WAForecastModelController *)self incomingRequestQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WAForecastModelController_setLocationGeocodingSampler___block_invoke;
  v7[3] = &unk_2647E02F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __57__WAForecastModelController_setLocationGeocodingSampler___block_invoke(uint64_t a1)
{
}

- (BOOL)isCityBeingUpdated:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(WAForecastModelController *)self isPriorityCity:v4])
    {
      BOOL v5 = [(WAForecastModelController *)self isPriorityCityBeingUpdated:v4];
    }
    else
    {
      uint64_t v11 = 0;
      double v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v6 = [(WAForecastModelController *)self incomingRequestQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__WAForecastModelController_isCityBeingUpdated___block_invoke;
      block[3] = &unk_2647E1688;
      double v10 = &v11;
      void block[4] = self;
      id v9 = v4;
      dispatch_sync(v6, block);

      BOOL v5 = *((unsigned char *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __48__WAForecastModelController_isCityBeingUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updatingCities];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (BOOL)isPriorityCityBeingUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = [(WAForecastModelController *)self incomingRequestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WAForecastModelController_isPriorityCityBeingUpdated___block_invoke;
  block[3] = &unk_2647E1688;
  id v9 = v4;
  double v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__WAForecastModelController_isPriorityCityBeingUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) priorityUpdatingCities];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (BOOL)fetchForecastForCity:(id)a3 completion:(id)a4
{
  return [(WAForecastModelController *)self fetchForecastForCity:a3 withUnits:0 completion:a4];
}

- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 completion:(id)a5
{
  return [(WAForecastModelController *)self fetchForecastForCity:a3 withUnits:*(void *)&a4 requestOptions:0 completion:a5];
}

- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = (void (**)(id, void, void *))a6;
  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = [v10 locationID];

  if (!v13)
  {
    long long v16 = WAErrorWithCode(4, 0, v10, 0);
    v12[2](v12, 0, v16);

LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  char v14 = [(WAForecastModelController *)self incomingRequestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__WAForecastModelController_fetchForecastForCity_withUnits_requestOptions_completion___block_invoke;
  block[3] = &unk_2647E16B0;
  void block[4] = self;
  id v19 = v10;
  int v22 = a4;
  id v20 = v11;
  long long v21 = v12;
  dispatch_async(v14, block);

  BOOL v15 = 1;
LABEL_6:

  return v15;
}

void __86__WAForecastModelController_fetchForecastForCity_withUnits_requestOptions_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_executeFetchForCity:withUnits:requestOptions:completion:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v2 = [*(id *)(a1 + 32) isPriorityCity:*(void *)(a1 + 40)];
  objc_super v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 priorityForecastOperationQueue];
  }
  else {
  id v4 = [v3 forecastOperationQueue];
  }
  [v4 addOperation:v5];
}

- (BOOL)fetchForecastForCities:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7 && [v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          char v14 = [v13 locationID];

          if (v14)
          {
            BOOL v15 = WALogForCategory(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v13;
              _os_log_impl(&dword_226D1D000, v15, OS_LOG_TYPE_DEFAULT, "Creating forecastOperation for city : %@", buf, 0xCu);
            }

            long long v16 = [(WAForecastModelController *)self incomingRequestQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke;
            block[3] = &unk_2647E0348;
            void block[4] = self;
            void block[5] = v13;
            id v22 = v7;
            dispatch_async(v16, block);
          }
          else
          {
            long long v17 = WAErrorWithCode(4, 0, v13, 0);
            (*((void (**)(id, void *, void, void *))v7 + 2))(v7, v13, 0, v17);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
    }

    BOOL v18 = 1;
    id v6 = v20;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke_2;
  double v12 = &unk_2647E16D8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v4;
  id v5 = objc_msgSend(v2, "_queue_executeFetchForCity:completion:", v3, &v9);
  int v6 = objc_msgSend(*(id *)(a1 + 32), "isPriorityCity:", *(void *)(a1 + 40), v9, v10, v11, v12);
  id v7 = *(void **)(a1 + 32);
  if (v6) {
    [v7 priorityForecastOperationQueue];
  }
  else {
  id v8 = [v7 forecastOperationQueue];
  }
  [v8 addOperation:v5];
}

uint64_t __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (id)_queue_executeFetchForCity:(id)a3 completion:(id)a4
{
  return [(WAForecastModelController *)self _queue_executeFetchForCity:a3 withUnits:0 requestOptions:0 completion:a4];
}

- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  if ([(WAForecastModelController *)self isPriorityCity:v12])
  {
    uint64_t v13 = [(WAForecastModelController *)self priorityCompletionHandlersForCity];
    [(WAForecastModelController *)self priorityUpdatingCities];
  }
  else
  {
    uint64_t v13 = [(WAForecastModelController *)self completionHandlersForCity];
    [(WAForecastModelController *)self updatingCities];
  id v14 = };
  BOOL v15 = [(WAForecastModelController *)self _queue_executeFetchForCity:v12 withUnits:v7 requestOptions:v11 completion:v10 completionHandlersForCity:v13 updatingCities:v14];

  return v15;
}

- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6 completionHandlersForCity:(id)a7 updatingCities:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v36 = a5;
  id v15 = a6;
  id v16 = a7;
  id v37 = a8;
  long long v17 = [v14 locationID];
  BOOL v18 = [v16 objectForKeyedSubscript:v17];

  if (v18)
  {
    id v19 = WALogForCategory(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v14 name];
      long long v21 = [(WAForecastModelController *)self _commaSeparatedNamesForUpdatingCities:v37];
      *(_DWORD *)buf = 138412546;
      v44 = v20;
      __int16 v45 = 2112;
      v46 = v21;
      _os_log_impl(&dword_226D1D000, v19, OS_LOG_TYPE_DEFAULT, "Multiplexing forecast request for %@ as one is already in-flight. Currently updating cities: %@", buf, 0x16u);
    }
    if (v15)
    {
      id v22 = (void *)[v15 copy];
      [v18 addObject:v22];
    }
    long long v23 = 0;
  }
  else
  {
    long long v24 = (void *)MEMORY[0x263EFF9C0];
    long long v25 = (void *)[v15 copy];
    BOOL v18 = [v24 setWithObject:v25];

    long long v26 = [v14 locationID];
    [v16 setObject:v18 forKeyedSubscript:v26];

    v27 = [(WAForecastModelController *)self locationGeocodingSampler];
    uint64_t v28 = [v27 canRecordLocationForCity:v14];

    v29 = [WAForecastOperation alloc];
    uint64_t v30 = [(WAForecastModelController *)self connection];
    long long v23 = [(WAForecastOperation *)v29 initWithCity:v14 withUnits:v12 requestOptions:v36 canGeocode:v28 onConnection:v30];

    v31 = [(WAForecastModelController *)self trackingParameter];
    [(WAForecastOperation *)v23 setTrackingParameter:v31];

    objc_initWeak(&location, v23);
    objc_initWeak(&from, self);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __133__WAForecastModelController__queue_executeFetchForCity_withUnits_requestOptions_completion_completionHandlersForCity_updatingCities___block_invoke;
    v38[3] = &unk_2647E1700;
    objc_copyWeak(&v39, &from);
    objc_copyWeak(&v40, &location);
    [(WAForecastOperation *)v23 setCompletionBlock:v38];
    v32 = WALogForCategory(1);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v14 name];
      v34 = [(WAForecastModelController *)self _commaSeparatedNamesForUpdatingCities:v37];
      *(_DWORD *)buf = 138412546;
      v44 = v33;
      __int16 v45 = 2112;
      v46 = v34;
      _os_log_impl(&dword_226D1D000, v32, OS_LOG_TYPE_DEFAULT, "Built forecast request for %@. Currently updating cities: %@", buf, 0x16u);
    }
    [v37 addObject:v14];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v23;
}

void __133__WAForecastModelController__queue_executeFetchForCity_withUnits_requestOptions_completion_completionHandlersForCity_updatingCities___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleForecastOperationCompletion:v2];
}

- (void)cancelAllFetchRequests
{
  uint64_t v3 = [MEMORY[0x263F85F60] sharedInstance];
  id v4 = [v3 settings];
  char v5 = [v4 disableForecastRequestCancelation];

  if ((v5 & 1) == 0)
  {
    int v6 = [(WAForecastModelController *)self incomingRequestQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke;
    block[3] = &unk_2647E02D0;
    void block[4] = self;
    dispatch_sync(v6, block);
  }
}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [*(id *)(a1 + 32) forecastOperationQueue];
  uint64_t v3 = [v2 operations];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = WALogForCategory(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v8 city];
          *(_DWORD *)buf = 138412290;
          long long v21 = v10;
          _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling forecast request for %@", buf, 0xCu);
        }
        [v8 setCompletionBlock:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  id v11 = [*(id *)(a1 + 32) completionHandlersForCity];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_22;
  v15[3] = &unk_2647E1750;
  v15[4] = *(void *)(a1 + 32);
  [v11 enumerateKeysAndObjectsUsingBlock:v15];

  uint64_t v12 = [*(id *)(a1 + 32) completionHandlersForCity];
  [v12 removeAllObjects];

  uint64_t v13 = [*(id *)(a1 + 32) forecastOperationQueue];
  [v13 cancelAllOperations];

  id v14 = [*(id *)(a1 + 32) updatingCities];
  [v14 removeAllObjects];
}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  long long v19 = @"city";
  v20[0] = a2;
  uint64_t v6 = NSDictionary;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v10 = [v5 errorWithDomain:@"com.apple.weather.forecastModelController.errorDomain" code:3072 userInfo:v9];

  id v11 = [v7 allObjects];

  size_t v12 = [v11 count];
  uint64_t v13 = [*(id *)(a1 + 32) completionHandlerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_2;
  block[3] = &unk_2647E1728;
  id v17 = v11;
  id v18 = v10;
  id v14 = v10;
  id v15 = v11;
  dispatch_apply(v12, v13, block);
}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  (*((void (**)(id, void, void))v3 + 2))(v3, 0, *(void *)(a1 + 40));
}

- (void)_handleForecastOperationCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 city];
  if (!v6)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WAForecastModelController.m", 312, @"Invalid parameter not satisfying: %@", @"city" object file lineNumber description];
  }
  id v7 = [v5 error];
  id v8 = [v5 forecastModel];

  uint64_t v9 = WALogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v21 = "-[WAForecastModelController _handleForecastOperationCompletion:]";
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    long long v25 = v8;
    _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "%s, completed forecast city=%@, forecastModel=%@", buf, 0x20u);
  }

  id v10 = [(WAForecastModelController *)self incomingRequestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke;
  block[3] = &unk_2647E1178;
  id v16 = v7;
  id v17 = v6;
  id v18 = self;
  id v19 = v8;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke(id *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = (uint64_t *)(a1 + 4);
  id v3 = a1[4];
  uint64_t v4 = WALogForCategory(0);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_cold_1((uint64_t)a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [a1[5] name];
    *(_DWORD *)buf = 138412290;
    v48 = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Completed forecast request for %@", buf, 0xCu);
  }
  int v7 = [a1[6] isPriorityCity:a1[5]];
  id v8 = a1[6];
  if (v7)
  {
    uint64_t v9 = [v8 priorityUpdatingCities];
    [v9 removeObject:a1[5]];

    id v10 = WALogForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [a1[6] _commaSeparatedPriorityUpdatingCitiesNames];
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "Remaining priority updating cities: %@", buf, 0xCu);
    }
    id v12 = [a1[6] priorityCompletionHandlersForCity];
    id v13 = [a1[5] locationID];
    id v14 = [v12 objectForKey:v13];
    id v15 = [v14 allObjects];

    size_t v16 = [v15 count];
    id v17 = [a1[6] completionHandlerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_34;
    block[3] = &unk_2647E1778;
    id v18 = &v44;
    id v19 = v15;
    id v44 = v19;
    id v20 = &v45;
    id v45 = a1[7];
    long long v21 = &v46;
    id v46 = a1[4];
    dispatch_apply(v16, v17, block);

    __int16 v22 = [a1[5] locationID];

    if (v22)
    {
      uint64_t v23 = [a1[6] priorityCompletionHandlersForCity];
LABEL_15:
      v34 = (void *)v23;
      v35 = [a1[5] locationID];
      [v34 removeObjectForKey:v35];
    }
  }
  else
  {
    __int16 v24 = [v8 updatingCities];
    [v24 removeObject:a1[5]];

    long long v25 = WALogForCategory(1);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [a1[6] _commaSeparatedUpdatingCitiesNames];
      *(_DWORD *)buf = 138412290;
      v48 = v26;
      _os_log_impl(&dword_226D1D000, v25, OS_LOG_TYPE_DEFAULT, "Remaining updating cities: %@", buf, 0xCu);
    }
    v27 = [a1[6] completionHandlersForCity];
    uint64_t v28 = [a1[5] locationID];
    v29 = [v27 objectForKey:v28];
    uint64_t v30 = [v29 allObjects];

    size_t v31 = [v30 count];
    v32 = [a1[6] completionHandlerQueue];
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_35;
    id v39 = &unk_2647E1778;
    id v18 = &v40;
    id v19 = v30;
    id v40 = v19;
    id v20 = &v41;
    id v41 = a1[7];
    long long v21 = &v42;
    id v42 = a1[4];
    dispatch_apply(v31, v32, &v36);

    v33 = objc_msgSend(a1[5], "locationID", v36, v37, v38, v39);

    if (v33)
    {
      uint64_t v23 = [a1[6] completionHandlersForCity];
      goto LABEL_15;
    }
  }
}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_34(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_35(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_commaSeparatedUpdatingCitiesNames
{
  id v3 = [(WAForecastModelController *)self updatingCities];
  uint64_t v4 = [(WAForecastModelController *)self _commaSeparatedNamesForUpdatingCities:v3];

  return v4;
}

- (id)_commaSeparatedPriorityUpdatingCitiesNames
{
  id v3 = [(WAForecastModelController *)self priorityUpdatingCities];
  uint64_t v4 = [(WAForecastModelController *)self _commaSeparatedNamesForUpdatingCities:v3];

  return v4;
}

- (id)_commaSeparatedNamesForUpdatingCities:(id)a3
{
  if (a3)
  {
    id v3 = [a3 allObjects];
    uint64_t v4 = [v3 valueForKey:@"name"];
    id v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    id v5 = @"<None>";
  }
  return v5;
}

- (BOOL)isPriorityCity:(id)a3
{
  id v4 = a3;
  if ([(WAForecastModelController *)self isPriorityForecastOperationsEnabled])
  {
    if ([v4 isLocalWeatherCity]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 isTransient];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isPriorityForecastOperationsEnabled
{
  if (isPriorityForecastOperationsEnabled_onceToken != -1) {
    dispatch_once(&isPriorityForecastOperationsEnabled_onceToken, &__block_literal_global_20);
  }
  return isPriorityForecastOperationsEnabled_sIsPriorityForecastOperationsEnabled;
}

void __64__WAForecastModelController_isPriorityForecastOperationsEnabled__block_invoke()
{
  id v1 = [MEMORY[0x263F85F60] sharedInstance];
  v0 = [v1 settings];
  isPriorityForecastOperationsEnabled_sIsPriorityForecastOperationsEnabled = [v0 disablePriorityForecastRequestQueue] ^ 1;
}

- (WALocationPrivacySampler)locationGeocodingSampler
{
  return self->_locationGeocodingSampler;
}

- (NSOperationQueue)forecastOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setForecastOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)incomingRequestQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIncomingRequestQueue:(id)a3
{
}

- (OS_dispatch_queue)completionHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletionHandlerQueue:(id)a3
{
}

- (NSMutableSet)updatingCities
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdatingCities:(id)a3
{
}

- (NSMutableDictionary)completionHandlersForCity
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletionHandlersForCity:(id)a3
{
}

- (WFServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (NSOperationQueue)priorityForecastOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPriorityForecastOperationQueue:(id)a3
{
}

- (NSMutableSet)priorityUpdatingCities
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPriorityUpdatingCities:(id)a3
{
}

- (NSMutableDictionary)priorityCompletionHandlersForCity
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPriorityCompletionHandlersForCity:(id)a3
{
}

- (NSString)trackingParameter
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrackingParameter:(id)a3
{
}

- (WFWeatherStoreService)store
{
  return (WFWeatherStoreService *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_priorityCompletionHandlersForCity, 0);
  objc_storeStrong((id *)&self->_priorityUpdatingCities, 0);
  objc_storeStrong((id *)&self->_priorityForecastOperationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_completionHandlersForCity, 0);
  objc_storeStrong((id *)&self->_updatingCities, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequestQueue, 0);
  objc_storeStrong((id *)&self->_forecastOperationQueue, 0);
  objc_storeStrong((id *)&self->_locationGeocodingSampler, 0);
}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v5 = [*(id *)(a1 + 40) name];
  uint64_t v6 = *a2;
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_226D1D000, a3, OS_LOG_TYPE_ERROR, "Failed to complete forecast request for %@: %@", (uint8_t *)&v7, 0x16u);
}

@end