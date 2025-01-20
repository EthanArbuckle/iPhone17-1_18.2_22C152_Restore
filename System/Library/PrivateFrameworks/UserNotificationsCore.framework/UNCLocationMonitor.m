@interface UNCLocationMonitor
- (BOOL)isBundleIdentifierAuthorizedForRegionMonitoring:(id)a3;
- (UNCLocationMonitor)init;
- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4;
- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4 observable:(id)a5;
- (void)_queue_triggerDidFireForRegion:(id)a3;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)markAsHavingReceivedLocation;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)setMonitoredRegions:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNCLocationMonitor

- (UNCLocationMonitor)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor", v3);

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__UNCLocationMonitor_init__block_invoke;
  block[3] = &unk_265567700;
  v12 = &v13;
  v5 = self;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  dispatch_sync(v6, block);
  v7 = [(UNCLocationMonitor *)v5 initWithQueue:v6 locationManager:v14[5]];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __26__UNCLocationMonitor_init__block_invoke(void *a1)
{
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.bulletinboard"];
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  v3 = [v7 bundlePath];
  uint64_t v4 = [v2 initWithEffectiveBundlePath:v3 delegate:a1[4] onQueue:a1[5]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4
{
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = a4;
  id v9 = a3;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor.observable", v7);

  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor.call-out", v11);

  uint64_t v13 = [[UNCKeyedObservable alloc] initWithQueue:v10 callOutQueue:v12];
  v14 = [(UNCLocationMonitor *)self initWithQueue:v9 locationManager:v8 observable:v13];

  return v14;
}

- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4 observable:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UNCLocationMonitor;
  dispatch_queue_t v12 = [(UNCLocationMonitor *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationManager, a4);
    objc_storeStrong((id *)&v13->_observable, a5);
    objc_storeStrong((id *)&v13->_queue, a3);
  }

  return v13;
}

- (BOOL)isBundleIdentifierAuthorizedForRegionMonitoring:(id)a3
{
  return [MEMORY[0x263F00A60] authorizationStatusForBundleIdentifier:a3] - 3 < 2;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UNCLocationMonitor_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __54__UNCLocationMonitor_addObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) addObserver:a1[5] forKey:a1[6]];
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__UNCLocationMonitor_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __57__UNCLocationMonitor_removeObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) removeObserver:a1[5] forKey:a1[6]];
}

- (void)markAsHavingReceivedLocation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UNCLocationMonitor_markAsHavingReceivedLocation__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__UNCLocationMonitor_markAsHavingReceivedLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) markAsHavingReceivedLocation];
}

- (void)setMonitoredRegions:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_265567F50;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v55[3] = &unk_265568318;
  id v2 = *(void **)(a1 + 32);
  id v56 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "bs_map:", v55);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 8) monitoredRegions];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_3;
  v53[3] = &unk_265568340;
  id v54 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 objectsPassingTest:v53];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        if (([v5 containsObject:v12] & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v68 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v67 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        if (([v7 containsObject:v19] & 1) == 0) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v67 count:16];
    }
    while (v16);
  }

  v20 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 40);
    v22 = v20;
    uint64_t v23 = [v7 count];
    uint64_t v24 = [v13 count];
    uint64_t v25 = [v6 count];
    *(_DWORD *)buf = 138544130;
    uint64_t v60 = v21;
    __int16 v61 = 2048;
    uint64_t v62 = v23;
    __int16 v63 = 2048;
    uint64_t v64 = v24;
    __int16 v65 = 2048;
    uint64_t v66 = v25;
    _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld monitored regions [ stop: %ld start: %ld ]", buf, 0x2Au);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v26 = v13;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*(void *)(a1 + 48) + 8) stopMonitoringForRegion:*(void *)(*((void *)&v41 + 1) + 8 * k)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v28);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = v6;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "startMonitoringForRegion:", *(void *)(*((void *)&v37 + 1) + 8 * m), (void)v37);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v33);
  }

  uint64_t v36 = *(void *)(a1 + 56);
  if (v36) {
    (*(void (**)(void))(v36 + 16))();
  }
}

id __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 copy];
  [v3 setOnBehalfOfBundleId:*(void *)(a1 + 32)];

  return v3;
}

uint64_t __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 onBehalfOfBundleId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_ERROR)) {
    -[UNCLocationMonitor locationManager:didFailWithError:]((uint64_t)v4, v5);
  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [a4 identifier];
    uint64_t v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "Did start monitoring region %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_queue_triggerDidFireForRegion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [v4 onBehalfOfBundleId];
  BOOL v6 = [(UNCLocationMonitor *)self isBundleIdentifierAuthorizedForRegionMonitoring:v5];
  id v7 = (void *)*MEMORY[0x263F1E040];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v9 = v7;
      uint64_t v10 = [v4 identifier];
      uint64_t v11 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v11;
      _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Location trigger fired for region %{public}@", buf, 0xCu);
    }
    observable = self->_observable;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__UNCLocationMonitor__queue_triggerDidFireForRegion___block_invoke;
    v16[3] = &unk_265568368;
    v16[4] = self;
    id v17 = v4;
    [(UNCKeyedObservable *)observable notifyObserversKey:v5 usingBlock:v16];
  }
  else if (v8)
  {
    id v13 = v7;
    id v14 = [v4 identifier];
    uint64_t v15 = objc_msgSend(v14, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v15;
    _os_log_impl(&dword_2608DB000, v13, OS_LOG_TYPE_DEFAULT, "Location trigger fired but ignored for region %{public}@", buf, 0xCu);
  }
}

void __53__UNCLocationMonitor__queue_triggerDidFireForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    uint64_t v5 = [v3 onBehalfOfBundleId];
    [v6 locationMonitor:v4 triggerDidFireForRegion:v3 forBundleIdentifier:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "CLLocationManager failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end