@interface NPKOneShotLocationFetcher
- (CLInUseAssertion)inUseAssertion;
- (CLLocationManager)locationManager;
- (NPKOneShotLocationFetcher)init;
- (OS_dispatch_queue)locationManagerQueue;
- (OS_dispatch_source)locationFixTimeout;
- (id)completionHandler;
- (void)_finishLocationFixWithLocation:(id)a3;
- (void)dealloc;
- (void)fetchLocationWithCompletion:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setInUseAssertion:(id)a3;
- (void)setLocationFixTimeout:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationManagerQueue:(id)a3;
@end

@implementation NPKOneShotLocationFetcher

- (NPKOneShotLocationFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPKOneShotLocationFetcher;
  v2 = [(NPKOneShotLocationFetcher *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanopassbook.locationfetch", 0);
    locationManagerQueue = v2->_locationManagerQueue;
    v2->_locationManagerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = self->_locationManager;
  v4 = self->_inUseAssertion;
  [(CLLocationManager *)v3 setDelegate:0];
  locationManagerQueue = self->_locationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NPKOneShotLocationFetcher_dealloc__block_invoke;
  block[3] = &unk_2644D2E08;
  v10 = v3;
  v11 = v4;
  objc_super v6 = v4;
  v7 = v3;
  dispatch_async(locationManagerQueue, block);

  v8.receiver = self;
  v8.super_class = (Class)NPKOneShotLocationFetcher;
  [(NPKOneShotLocationFetcher *)&v8 dealloc];
}

uint64_t __36__NPKOneShotLocationFetcher_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopUpdatingLocation];
  v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

- (void)fetchLocationWithCompletion:(id)a3
{
  [(NPKOneShotLocationFetcher *)self setCompletionHandler:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke;
  v6[3] = &unk_2644D4590;
  v6[4] = self;
  v4 = v6;
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___CanDetermineDeviceLocation_block_invoke;
  block[3] = &unk_2644D2B10;
  id v8 = v4;
  dispatch_async(v5, block);
}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (a2)
  {
    if (v5)
    {
      objc_super v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Can determine device location.", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_65;
    block[3] = &unk_2644D2910;
    void block[4] = v7;
    dispatch_async(v8, block);
  }
  else
  {
    if (v5)
    {
      v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Returning provisioning device data without location", buf, 2u);
      }
    }
    v10 = [*(id *)(a1 + 32) completionHandler];

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) completionHandler];
      v11[2](v11, 0);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
  }
}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_65(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  dispatch_queue_t v3 = PKPassKitCoreBundle();
  v4 = (void *)[v2 initWithEffectiveBundle:v3 delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 40)];

  BOOL v5 = (void *)MEMORY[0x263F00A48];
  objc_super v6 = PKPassKitCoreBundle();
  uint64_t v7 = (void *)[v5 newAssertionForBundle:v6 withReason:@"NanoPassKit one-shot fetcher requested location"];

  [v4 requestWhenInUseAuthorization];
  id v8 = [v4 location];
  v9 = v8;
  if (v8 && _LocationMeetsAccuracyCriteria(v8))
  {
    v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Immediately retrieved location", (uint8_t *)buf, 2u);
      }
    }
    v13 = [*(id *)(a1 + 32) completionHandler];

    if (v13)
    {
      v14 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, void *))v14)[2](v14, v9);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
    [v7 invalidate];
  }
  else
  {
    v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Start updating location…", (uint8_t *)buf, 2u);
      }
    }
    v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
    dispatch_time_t v19 = dispatch_walltime(0, 10000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(buf, *(id *)(a1 + 32));
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_70;
    handler[3] = &unk_2644D29A8;
    objc_copyWeak(&v21, buf);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(v18);
    [v4 startUpdatingLocation];
    [*(id *)(a1 + 32) setLocationFixTimeout:v18];
    [*(id *)(a1 + 32) setLocationManager:v4];
    [*(id *)(a1 + 32) setInUseAssertion:v7];
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Event handler fired", v7, 2u);
    }
  }
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained completionHandler];

    if (v5)
    {
      objc_super v6 = [WeakRetained completionHandler];
      v6[2](v6, 0);

      [WeakRetained setCompletionHandler:0];
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Location did update", buf, 2u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  v13 = v11;
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v14 = v12;
  v13 = 0;
  uint64_t v15 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (_LocationMeetsAccuracyCriteria(v17))
      {
        id v18 = v17;

        v13 = v18;
      }
    }
    uint64_t v14 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  }
  while (v14);

  if (v13)
  {
    dispatch_time_t v19 = pk_Payment_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      id v21 = pk_Payment_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Found candidate location", buf, 2u);
      }
    }
    -[NPKOneShotLocationFetcher _finishLocationFixWithLocation:](self, "_finishLocationFixWithLocation:", v13, (void)v22);
LABEL_20:
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Location did fail", v8, 2u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  [(NPKOneShotLocationFetcher *)self _finishLocationFixWithLocation:0];
}

- (void)_finishLocationFixWithLocation:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  v4 = [(NPKOneShotLocationFetcher *)self locationManager];
  [v4 stopUpdatingLocation];

  BOOL v5 = [(NPKOneShotLocationFetcher *)self locationManager];
  [v5 setDelegate:0];

  [(NPKOneShotLocationFetcher *)self setLocationManager:0];
  BOOL v6 = [(NPKOneShotLocationFetcher *)self locationFixTimeout];

  if (v6)
  {
    id v7 = [(NPKOneShotLocationFetcher *)self locationFixTimeout];
    dispatch_source_cancel(v7);

    [(NPKOneShotLocationFetcher *)self setLocationFixTimeout:0];
  }
  id v8 = [(NPKOneShotLocationFetcher *)self completionHandler];

  if (v8)
  {
    BOOL v9 = [(NPKOneShotLocationFetcher *)self completionHandler];
    ((void (**)(void, id))v9)[2](v9, v10);

    [(NPKOneShotLocationFetcher *)self setCompletionHandler:0];
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_source)locationFixTimeout
{
  return self->_locationFixTimeout;
}

- (void)setLocationFixTimeout:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setInUseAssertion:(id)a3
{
}

- (OS_dispatch_queue)locationManagerQueue
{
  return self->_locationManagerQueue;
}

- (void)setLocationManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagerQueue, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationFixTimeout, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end