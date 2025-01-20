@interface RTHintManager
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (RTBatteryManager)batteryManager;
- (RTBluetoothManager)bluetoothManager;
- (RTCameraManager)cameraManager;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTHintManager)init;
- (RTHintManager)initWithBatteryManager:(id)a3 bluetoothManager:(id)a4 cameraManager:(id)a5 hintStore:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 navigationManager:(id)a10 reachabilityManager:(id)a11 walletManager:(id)a12;
- (RTHintStore)hintStore;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMetricManager)metricManager;
- (RTNavigationManager)navigationManager;
- (RTPersistenceManager)persistenceManager;
- (RTReachabilityManager)reachabilityManager;
- (RTWalletManager)walletManager;
- (void)_onBatteryNotification:(id)a3;
- (void)_onBluetoothNotification:(id)a3;
- (void)_onCameraNotification:(id)a3;
- (void)_onLearnedLocationNotification:(id)a3;
- (void)_onNavigationNotification:(id)a3;
- (void)_onReachabilityChange:(id)a3;
- (void)_onWalletNotification:(id)a3;
- (void)_registerForNotifications;
- (void)_shutdownWithHandler:(id)a3;
- (void)_storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5;
- (void)_storeHints:(id)a3 handler:(id)a4;
- (void)_submitHintFromSource:(int64_t)a3;
- (void)_submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5;
- (void)_unregisterForNotifications;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)onBatteryNotification:(id)a3;
- (void)onBluetoothNotification:(id)a3;
- (void)onCameraNotification:(id)a3;
- (void)onLearnedLocationNotification:(id)a3;
- (void)onNavigationNotification:(id)a3;
- (void)onReachabilityChange:(id)a3;
- (void)onWalletNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setBatteryManager:(id)a3;
- (void)setBluetoothManager:(id)a3;
- (void)setCameraManager:(id)a3;
- (void)setHintStore:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setNavigationManager:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setReachabilityManager:(id)a3;
- (void)setWalletManager:(id)a3;
- (void)storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5;
- (void)storeHints:(id)a3 handler:(id)a4;
- (void)submitHintFromSource:(int64_t)a3 location:(id)a4;
- (void)submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5;
@end

@implementation RTHintManager

- (void)onCameraNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__RTHintManager_onCameraNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)vendedClasses
{
  v2 = (void *)vendedClasses_vendedClasses_5;
  if (!vendedClasses_vendedClasses_5)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), 0];
    id v4 = (void *)vendedClasses_vendedClasses_5;
    vendedClasses_vendedClasses_5 = v3;

    v2 = (void *)vendedClasses_vendedClasses_5;
  }

  return v2;
}

uint64_t __38__RTHintManager_onCameraNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCameraNotification:*(void *)(a1 + 40)];
}

uint64_t __39__RTHintManager__submitHintFromSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitHintFromSource:*(void *)(a1 + 48) location:*(void *)(a1 + 40) handler:0];
}

void __37__RTHintManager__storeHints_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityHint);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "store %lu hints, error, %@", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__RTHintManager__storeHints_handler___block_invoke_75;
  v8[3] = &unk_1E6B9B3C0;
  id v9 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__RTHintManager__submitHintFromSource_location_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "An error, %@, has occurred while storing hint, %@", buf, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RTHintManager__submitHintFromSource_location_handler___block_invoke_86;
    block[3] = &unk_1E6B90BF0;
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    dispatch_async(v7, block);

    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
  }
}

void __56__RTHintManager__submitHintFromSource_location_handler___block_invoke_86(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [RTHintManagerNotificationDidUpdate alloc];
  v6[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v5 = [(RTHintManagerNotificationDidUpdate *)v3 initWithHints:v4];
  [v2 postNotification:v5];
}

- (void)_submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F5CDF0]);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    int8x16_t v12 = (void *)[v10 initWithLocation:v8 source:a3 date:v11];

    v24 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__RTHintManager__submitHintFromSource_location_handler___block_invoke;
    v20[3] = &unk_1E6B923C0;
    v21 = v12;
    v22 = self;
    id v23 = v9;
    id v14 = v12;
    [(RTHintManager *)self _storeHints:v13 handler:v20];

    __int16 v15 = v21;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityHint);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [MEMORY[0x1E4F5CDF0] hintSourceToString:a3];
    *(_DWORD *)buf = 138412290;
    v28 = v17;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "could not get location, dropping hint, source, %@", buf, 0xCu);
  }
  if (v9)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26 = @"No location, dropping hint";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    __int16 v15 = [v18 errorWithDomain:v19 code:7 userInfo:v14];
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_storeHints:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  hintStore = self->_hintStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__RTHintManager__storeHints_handler___block_invoke;
  v11[3] = &unk_1E6B92690;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(RTHintStore *)hintStore storeHints:v10 handler:v11];
}

- (void)_onCameraNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([v4 powerState] == 1)
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilityHint);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "received camera notification.", (uint8_t *)&v10, 2u);
      }

      [(RTHintManager *)self _submitHintFromSource:5];
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      id v11 = v4;
      __int16 v12 = 2080;
      id v13 = "-[RTHintManager _onCameraNotification:]";
      __int16 v14 = 1024;
      int v15 = 533;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)_submitHintFromSource:(int64_t)a3
{
  uint64_t v5 = [(RTHintManager *)self locationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __39__RTHintManager__submitHintFromSource___block_invoke;
  v6[3] = &unk_1E6B97398;
  v6[4] = self;
  v6[5] = a3;
  [v5 fetchCurrentLocationWithHandler:v6];
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

void __39__RTHintManager__submitHintFromSource___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F5CE00];
    id v4 = a2;
    uint64_t v5 = (void *)[[v3 alloc] initWithCLLocation:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__RTHintManager__submitHintFromSource___block_invoke_2;
  block[3] = &unk_1E6B91220;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v8;
  void block[4] = v7;
  id v9 = v5;
  dispatch_async(v6, block);
}

void __37__RTHintManager__storeHints_handler___block_invoke_75(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityHint);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 134218498;
    uint64_t v9 = a3 + 1;
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "hint %lu, %@, error, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (RTHintManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager_);
}

- (RTHintManager)initWithBatteryManager:(id)a3 bluetoothManager:(id)a4 cameraManager:(id)a5 hintStore:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 navigationManager:(id)a10 reachabilityManager:(id)a11 walletManager:(id)a12
{
  id v17 = a3;
  id v39 = a4;
  id v18 = a4;
  id v40 = a5;
  id v44 = a5;
  id v41 = a6;
  id v19 = a6;
  id v42 = a7;
  id v20 = a7;
  id v43 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v45 = v25;
  id v46 = v17;
  if (!v17)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: batteryManager", (uint8_t *)&location, 2u);
    }

    v32 = 0;
    id v17 = 0;
    v26 = v44;
    goto LABEL_36;
  }
  if (!v18)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = v44;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: bluetoothManager";
LABEL_33:
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&location, 2u);
    goto LABEL_34;
  }
  v26 = v44;
  if (!v44)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: cameraManager";
    goto LABEL_33;
  }
  if (!v19)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: hintStore";
    goto LABEL_33;
  }
  if (!v20)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_33;
  }
  if (!v21)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_33;
  }
  if (!v22)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_33;
  }
  if (!v23)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_33;
  }
  if (!v24)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      v35 = "Invalid parameter not satisfying: reachabilityManager";
      goto LABEL_33;
    }
LABEL_34:

    v32 = 0;
LABEL_35:
    id v17 = v46;
    goto LABEL_36;
  }
  if (v25)
  {
    v53.receiver = self;
    v53.super_class = (Class)RTHintManager;
    v27 = [(RTNotifier *)&v53 init];
    if (v27)
    {
      objc_initWeak(&location, v27);
      uint64_t v28 = objc_opt_new();
      notificationHelper = v27->_notificationHelper;
      v27->_notificationHelper = (RTDarwinNotificationHelper *)v28;

      v30 = v27->_notificationHelper;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke;
      v50[3] = &unk_1E6B91900;
      objc_copyWeak(&v51, &location);
      [(RTDarwinNotificationHelper *)v30 addObserverForNotificationName:@"HKHealthDaemonActiveWorkoutServersDidUpdateNotification" handler:v50];
      objc_storeStrong((id *)&v27->_batteryManager, a3);
      objc_storeStrong((id *)&v27->_bluetoothManager, v39);
      objc_storeStrong((id *)&v27->_cameraManager, v40);
      objc_storeStrong((id *)&v27->_hintStore, v41);
      objc_storeStrong((id *)&v27->_learnedLocationManager, v42);
      objc_storeStrong((id *)&v27->_locationManager, v43);
      objc_storeStrong((id *)&v27->_metricManager, a9);
      objc_storeStrong((id *)&v27->_navigationManager, a10);
      objc_storeStrong((id *)&v27->_reachabilityManager, a11);
      objc_storeStrong((id *)&v27->_walletManager, a12);
      v31 = [(RTNotifier *)v27 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_3;
      block[3] = &unk_1E6B90E70;
      v49 = v27;
      dispatch_async(v31, block);

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
    v32 = v27;
    self = v32;
    goto LABEL_35;
  }
  v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: walletManager", (uint8_t *)&location, 2u);
  }

  v32 = 0;
LABEL_36:

  return v32;
}

void __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_2;
    block[3] = &unk_1E6B90E70;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitHintFromSource:6];
}

uint64_t __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForNotifications];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTHintManager *)self _unregisterForNotifications];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)_registerForNotifications
{
  id v3 = [(RTHintManager *)self bluetoothManager];
  id v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onBluetoothNotification_ name:v4];

  id v5 = [(RTHintManager *)self bluetoothManager];
  id v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onBluetoothNotification_ name:v6];

  uint64_t v7 = [(RTHintManager *)self batteryManager];
  int v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onBatteryNotification_ name:v8];

  uint64_t v9 = [(RTHintManager *)self navigationManager];
  __int16 v10 = +[RTNotification notificationName];
  [v9 addObserver:self selector:sel_onNavigationNotification_ name:v10];

  id v11 = [(RTHintManager *)self reachabilityManager];
  __int16 v12 = +[RTNotification notificationName];
  [v11 addObserver:self selector:sel_onReachabilityChange_ name:v12];

  uint64_t v13 = [(RTHintManager *)self cameraManager];
  uint64_t v14 = +[RTNotification notificationName];
  [v13 addObserver:self selector:sel_onCameraNotification_ name:v14];

  int v15 = [(RTHintManager *)self walletManager];
  uint64_t v16 = +[RTNotification notificationName];
  [v15 addObserver:self selector:sel_onWalletNotification_ name:v16];

  id v17 = [(RTHintManager *)self walletManager];
  id v18 = +[RTNotification notificationName];
  [v17 addObserver:self selector:sel_onWalletNotification_ name:v18];

  id v20 = [(RTHintManager *)self learnedLocationManager];
  id v19 = +[RTNotification notificationName];
  [v20 addObserver:self selector:sel_onLearnedLocationNotification_ name:v19];
}

- (void)_unregisterForNotifications
{
  id v3 = [(RTHintManager *)self bluetoothManager];
  [v3 removeObserver:self];

  id v4 = [(RTHintManager *)self batteryManager];
  [v4 removeObserver:self];

  id v5 = [(RTHintManager *)self navigationManager];
  [v5 removeObserver:self];

  id v6 = [(RTHintManager *)self reachabilityManager];
  [v6 removeObserver:self];

  uint64_t v7 = [(RTHintManager *)self cameraManager];
  [v7 removeObserver:self];

  int v8 = [(RTHintManager *)self walletManager];
  [v8 removeObserver:self];

  uint64_t v9 = [(RTHintManager *)self learnedLocationManager];
  [v9 removeObserver:self];

  id v10 = [(RTHintManager *)self notificationHelper];
  [v10 removeObserverForNotificationName:@"HKHealthDaemonActiveWorkoutServersDidUpdateNotification"];
}

- (void)storeHints:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RTHintManager_storeHints_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __36__RTHintManager_storeHints_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeHints:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)submitHintFromSource:(int64_t)a3 location:(id)a4
{
  id v6 = a4;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTHintManager_submitHintFromSource_location___block_invoke;
  block[3] = &unk_1E6B91220;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __47__RTHintManager_submitHintFromSource_location___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitHintFromSource:*(void *)(a1 + 48) location:*(void *)(a1 + 40) handler:0];
}

- (void)submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__RTHintManager_submitHintFromSource_location_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __55__RTHintManager_submitHintFromSource_location_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitHintFromSource:*(void *)(a1 + 56) location:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__RTHintManager_storeHintSignificantRegion_hintSource_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __63__RTHintManager_storeHintSignificantRegion_hintSource_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeHintSignificantRegion:*(void *)(a1 + 40) hintSource:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  learnedLocationManager = self->_learnedLocationManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke;
  v14[3] = &unk_1E6B91978;
  v14[4] = self;
  id v15 = v9;
  SEL v17 = a2;
  int64_t v18 = a4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [(RTLearnedLocationManager *)learnedLocationManager fetchLocationOfInterestForRegion:v13 handler:v14];
}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2;
  block[3] = &unk_1E6B91950;
  uint64_t v8 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  uint64_t v11 = *(void *)(a1 + 64);
  id v18 = v6;
  uint64_t v21 = v11;
  id v19 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, block);
}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 80);
    id v5 = [v2 location];
    id v6 = [v5 location];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_92;
    v22[3] = &unk_1E6B9B3E8;
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    v22[4] = *(void *)(a1 + 48);
    uint64_t v26 = v7;
    uint64_t v27 = v8;
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 64);
    [v3 submitHintFromSource:v4 location:v6 handler:v22];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138413314;
      v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      uint64_t v35 = v12;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, Could not find location of interest matching significant region, %@, to client, %@, fetch error, %@, hintSource, %lld", buf, 0x34u);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v29 = @"No LocationOfIntrest can be found for region.";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v18 = [v15 errorWithDomain:v16 code:0 userInfo:v17];

    id v19 = *(void **)(a1 + 56);
    if (v19)
    {
      id v20 = v19;

      id v18 = v20;
    }
    uint64_t v21 = *(void *)(a1 + 64);
    if (v21) {
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v18);
    }
    +[RTSignificantRegionHintInjectionMetrics submitMetricsWithHintSource:*(void *)(a1 + 80) region:*(void *)(a1 + 40) locationOfInterest:0 hintSubmitted:0 matchingError:v18];
  }
}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2_93;
  block[3] = &unk_1E6B913C8;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  id v10 = v3;
  uint64_t v15 = v5;
  uint64_t v16 = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2_93(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v6 = *(void *)(a1 + 80);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v20 = 138413314;
      uint64_t v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      uint64_t v29 = v9;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, Unable to store significant region hint for source, %lld, location of interest, %@, matching region, %@, store error, %@", (uint8_t *)&v20, 0x34u);
    }
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10)
    {
      id v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (v4)
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v13 = *(void *)(a1 + 80);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      int v20 = 138413570;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, Storing significant region hint for source, %lld, location of interest, %@, matching region, %@, to client, %@, store error, %@", (uint8_t *)&v20, 0x3Eu);
    }
    uint64_t v18 = *(void *)(a1 + 64);
    if (v18)
    {
      id v11 = *(void (**)(void))(v18 + 16);
      goto LABEL_10;
    }
  }
  return +[RTSignificantRegionHintInjectionMetrics submitMetricsWithHintSource:*(void *)(a1 + 80) region:*(void *)(a1 + 48) locationOfInterest:*(void *)(a1 + 40) hintSubmitted:v2 == 0 matchingError:*(void *)(a1 + 32)];
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v11 = a4;
  uint64_t v8 = (void (**)(id, void))a5;
  if ((unint64_t)a3 <= 2 && (id v9 = v11) != 0)
  {
    uint64_t v10 = v9;
    [(RTHintStore *)self->_hintStore purgeHintsPredating:v9 handler:v8];
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

- (void)onBluetoothNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__RTHintManager_onBluetoothNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__RTHintManager_onBluetoothNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBluetoothNotification:*(void *)(a1 + 40)];
}

- (void)_onBluetoothNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v6])
  {

LABEL_4:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [v4 name];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "received bluetooth notification, %@", (uint8_t *)&v13, 0xCu);
    }
    [(RTHintManager *)self _submitHintFromSource:0];
    goto LABEL_10;
  }
  uint64_t v7 = [v4 name];
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2080;
    uint64_t v16 = "-[RTHintManager _onBluetoothNotification:]";
    __int16 v17 = 1024;
    int v18 = 439;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_10:
}

- (void)onBatteryNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__RTHintManager_onBatteryNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__RTHintManager_onBatteryNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBatteryNotification:*(void *)(a1 + 40)];
}

- (void)_onBatteryNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v4 name];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "received battery notification, %@", (uint8_t *)&v11, 0xCu);
    }
    [(RTHintManager *)self _submitHintFromSource:3];
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      id v12 = v4;
      __int16 v13 = 2080;
      id v14 = "-[RTHintManager _onBatteryNotification:]";
      __int16 v15 = 1024;
      int v16 = 458;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)onNavigationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTHintManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__RTHintManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNavigationNotification:*(void *)(a1 + 40)];
}

- (void)_onNavigationNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [v4 name];
      int v19 = 138412290;
      id v20 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "received navigation notification, %@", (uint8_t *)&v19, 0xCu);
    }
    int v9 = v4;
    id v10 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [v9 destinationLatitude];
    double v12 = v11;
    [v9 destinationLongitude];
    double v14 = v13;
    __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
    int v16 = (void *)[v10 initWithLatitude:v15 longitude:v12 horizontalUncertainty:v14 date:0.0];

    [(RTHintManager *)self _submitHintFromSource:1 location:v16 handler:0];
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "submitting maps navigation hint", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412802;
      id v20 = v4;
      __int16 v21 = 2080;
      __int16 v22 = "-[RTHintManager _onNavigationNotification:]";
      __int16 v23 = 1024;
      int v24 = 487;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v19, 0x1Cu);
    }
  }
}

- (void)onReachabilityChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__RTHintManager_onReachabilityChange___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__RTHintManager_onReachabilityChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onReachabilityChange:*(void *)(a1 + 40)];
}

- (void)_onReachabilityChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 reachability];
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134217984;
      uint64_t v13 = v8;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Received reachability change, %ld", (uint8_t *)&v12, 0xCu);
    }

    if (v8)
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityHint);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "submitting reachability hint for reachability change.", (uint8_t *)&v12, 2u);
      }

      [(RTHintManager *)self _submitHintFromSource:4];
    }
  }
  else
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      uint64_t v13 = (uint64_t)v4;
      __int16 v14 = 2080;
      __int16 v15 = "-[RTHintManager _onReachabilityChange:]";
      __int16 v16 = 1024;
      int v17 = 511;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)onWalletNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__RTHintManager_onWalletNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__RTHintManager_onWalletNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWalletNotification:*(void *)(a1 + 40)];
}

- (void)_onWalletNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v6])
  {

LABEL_4:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "received wallet notification.", (uint8_t *)&v12, 2u);
    }

    [(RTHintManager *)self _submitHintFromSource:-1];
    goto LABEL_10;
  }
  int v7 = [v4 name];
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_4;
  }
  double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v4;
    __int16 v14 = 2080;
    __int16 v15 = "-[RTHintManager _onWalletNotification:]";
    __int16 v16 = 1024;
    int v17 = 553;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
  }

LABEL_10:
}

- (void)onLearnedLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTHintManager_onLearnedLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__RTHintManager_onLearnedLocationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "received learnedLocation notification.", (uint8_t *)&v10, 2u);
    }

    int v9 = [(RTHintManager *)self hintStore];
    [v9 regenerateLOIHintsWithHandler:&__block_literal_global_106];
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      id v11 = v4;
      __int16 v12 = 2080;
      id v13 = "-[RTHintManager _onLearnedLocationNotification:]";
      __int16 v14 = 1024;
      int v15 = 579;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __48__RTHintManager__onLearnedLocationNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityHint);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_fault_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_FAULT, "Regenerated hints error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Regenerated hints error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    int v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__RTHintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    id v13 = v8;
    __int16 v14 = self;
    id v15 = v9;
    unint64_t v16 = a4;
    dispatch_async(v10, v12);

    id v11 = v13;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __66__RTHintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v17;
    int v10 = &v16;
LABEL_8:
    id v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    __int16 v12 = [v6 errorWithDomain:v7 code:7 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  id v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v15;
    int v10 = &v14;
    goto LABEL_8;
  }
  id v13 = [*(id *)(a1 + 40) hintStore];
  [v13 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (void)setBatteryManager:(id)a3
{
}

- (RTBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
}

- (RTCameraManager)cameraManager
{
  return self->_cameraManager;
}

- (void)setCameraManager:(id)a3
{
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (RTHintStore)hintStore
{
  return self->_hintStore;
}

- (void)setHintStore:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (void)setLocationManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
}

- (RTWalletManager)walletManager
{
  return self->_walletManager;
}

- (void)setWalletManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletManager, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintStore, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_cameraManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);

  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end