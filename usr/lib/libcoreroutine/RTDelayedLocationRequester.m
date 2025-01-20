@interface RTDelayedLocationRequester
- (NSDate)activeStartDate;
- (NSDate)fireDate;
- (OS_dispatch_queue)queue;
- (RTDelayedLocationRequester)init;
- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 maxHorizontalAccuracy:(double)a4 queue:(id)a5;
- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 timerManager:(id)a4 maxHorizontalAccuracy:(double)a5 queue:(id)a6;
- (RTDelayedLocationRequesterDelegate)delegate;
- (RTLocationManager)locationManager;
- (RTTimer)activeTimer;
- (RTTimer)delayTimer;
- (RTTimerManager)timerManager;
- (double)maxHorizontalAccuracy;
- (void)_onLocation:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startUpdatingLocation;
- (void)_stopUpdatingLocation;
- (void)_updateDelayTimer;
- (void)_updateFireDate:(id)a3 handler:(id)a4;
- (void)onLocationNotification:(id)a3;
- (void)setActiveStartDate:(id)a3;
- (void)setActiveTimer:(id)a3;
- (void)setDelayTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFireDate:(id)a3;
- (void)shutdown;
- (void)shutdownWithHandler:(id)a3;
- (void)updateFireDate:(id)a3;
- (void)updateFireDate:(id)a3 handler:(id)a4;
@end

@implementation RTDelayedLocationRequester

- (RTDelayedLocationRequester)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_timerManager_maxHorizontalAccuracy_queue_);
}

- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 maxHorizontalAccuracy:(double)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [(RTDelayedLocationRequester *)self initWithLocationManager:v9 timerManager:v10 maxHorizontalAccuracy:v8 queue:a4];

  return v11;
}

- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 timerManager:(id)a4 maxHorizontalAccuracy:(double)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: locationManager";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v12)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_13;
  }
  if (!v13)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: queue";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTDelayedLocationRequester;
  v15 = [(RTDelayedLocationRequester *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_locationManager, a3);
    objc_storeStrong((id *)&v16->_timerManager, a4);
    v16->_maxHorizontalAccuracy = a5;
    objc_storeStrong((id *)&v16->_queue, a6);
  }
  self = v16;
  v17 = self;
LABEL_15:

  return v17;
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, %@", (uint8_t *)&v12, 0x16u);
  }
  [(RTTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  [(RTTimer *)self->_activeTimer invalidate];
  activeTimer = self->_activeTimer;
  self->_activeTimer = 0;

  [(RTNotifier *)self->_locationManager removeObserver:self];
  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)shutdownWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__162;
  v20[4] = __Block_byref_object_dispose__162;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  id v21 = (id)os_transaction_create();

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v23 = v15;
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  int v12 = [(RTDelayedLocationRequester *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E6B9C950;
  block[4] = self;
  id v18 = v5;
  v19 = v20;
  id v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

void __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B9C928;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _shutdownWithHandler:v5];
}

void __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)shutdown
{
}

- (void)_onLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    [v4 horizontalUncertainty];
    double v6 = v5;
    [(RTDelayedLocationRequester *)self maxHorizontalAccuracy];
    id v4 = v11;
    if (v6 <= v7)
    {
      id v8 = [(RTDelayedLocationRequester *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = [(RTDelayedLocationRequester *)self delegate];
        [v10 onLocation:v11 error:0];
      }
      [(RTDelayedLocationRequester *)self _stopUpdatingLocation];
      id v4 = v11;
    }
  }
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  double v5 = [(RTDelayedLocationRequester *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTDelayedLocationRequester_onLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__RTDelayedLocationRequester_onLocationNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F5CE00]);
    id v6 = [*(id *)(a1 + 32) locations];
    double v7 = [v6 lastObject];
    id v10 = (id)[v5 initWithCLLocation:v7];

    [*(id *)(a1 + 40) _onLocation:v10];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412802;
      int v12 = v9;
      __int16 v13 = 2080;
      __int16 v14 = "-[RTDelayedLocationRequester onLocationNotification:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 139;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)_startUpdatingLocation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  [(RTDelayedLocationRequester *)self setActiveStartDate:v4];

  id v5 = [(RTDelayedLocationRequester *)self locationManager];
  id v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onLocationNotification_ name:v6];

  double v7 = [(RTDelayedLocationRequester *)self activeTimer];

  if (v7)
  {
    id v8 = [(RTDelayedLocationRequester *)self activeTimer];
    [v8 invalidate];

    [(RTDelayedLocationRequester *)self setActiveTimer:0];
  }
  char v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:15.0];
  objc_initWeak(&location, self);
  id v11 = [(RTDelayedLocationRequester *)self timerManager];
  int v12 = [(RTDelayedLocationRequester *)self queue];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __52__RTDelayedLocationRequester__startUpdatingLocation__block_invoke;
  v25 = &unk_1E6B9A160;
  id v13 = v9;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  objc_copyWeak(&v28, &location);
  __int16 v15 = [v11 timerWithIdentifier:@"RTDelayedLocationRequesterActiveTimer" queue:v12 handler:&v22];
  -[RTDelayedLocationRequester setActiveTimer:](self, "setActiveTimer:", v15, v22, v23, v24, v25);

  int v16 = [(RTDelayedLocationRequester *)self activeTimer];
  [v16 fireAfterDelay:15.0];

  uint64_t v17 = [(RTDelayedLocationRequester *)self activeTimer];
  [v17 resume];

  id v18 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [(RTDelayedLocationRequester *)self fireDate];
    id v21 = [v20 stringFromDate];
    *(_DWORD *)buf = 138413058;
    id v31 = v19;
    __int16 v32 = 2112;
    v33 = @"RTDelayedLocationRequesterActiveTimer";
    __int16 v34 = 2112;
    v35 = v21;
    __int16 v36 = 2048;
    uint64_t v37 = 0x402E000000000000;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, fireDate, %@, interval, %.2f", buf, 0x2Au);
  }
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
}

void __52__RTDelayedLocationRequester__startUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    uint64_t v5 = v4;
    [v2 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v8 = 138412802;
    char v9 = @"RTDelayedLocationRequesterActiveTimer";
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@ expiry, %.2f since created, %.2f since fireDate", (uint8_t *)&v8, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _onActiveTimerExpiry];
}

- (void)_stopUpdatingLocation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    double v7 = [(RTDelayedLocationRequester *)self activeStartDate];
    [v6 timeIntervalSinceDate:v7];
    int v13 = 138412546;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, duration, %.2f", (uint8_t *)&v13, 0x16u);
  }
  [(RTDelayedLocationRequester *)self setActiveStartDate:0];
  char v9 = [(RTDelayedLocationRequester *)self locationManager];
  __int16 v10 = +[RTNotification notificationName];
  [v9 removeObserver:self fromNotification:v10];

  uint64_t v11 = [(RTDelayedLocationRequester *)self activeTimer];

  if (v11)
  {
    __int16 v12 = [(RTDelayedLocationRequester *)self activeTimer];
    [v12 invalidate];

    [(RTDelayedLocationRequester *)self setActiveTimer:0];
  }
  [(RTDelayedLocationRequester *)self _updateDelayTimer];
}

- (void)_updateDelayTimer
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(RTDelayedLocationRequester *)self delayTimer];

  if (v4)
  {
    uint64_t v5 = [(RTDelayedLocationRequester *)self delayTimer];
    [v5 invalidate];

    [(RTDelayedLocationRequester *)self setDelayTimer:0];
  }
  uint64_t v6 = [(RTDelayedLocationRequester *)self fireDate];

  if (v6)
  {
    double v7 = [(RTDelayedLocationRequester *)self fireDate];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    char v9 = [v7 isBeforeDate:v8];

    if ((v9 & 1) == 0)
    {
      __int16 v10 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v11 = [(RTDelayedLocationRequester *)self fireDate];
      [v11 timeIntervalSinceNow];
      double v13 = v12;

      objc_initWeak(&location, self);
      uint64_t v14 = [(RTDelayedLocationRequester *)self timerManager];
      __int16 v15 = [(RTDelayedLocationRequester *)self queue];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      id v26 = __47__RTDelayedLocationRequester__updateDelayTimer__block_invoke;
      id v27 = &unk_1E6B9A160;
      id v16 = v10;
      id v28 = v16;
      v29 = self;
      objc_copyWeak(&v30, &location);
      uint64_t v17 = [v14 timerWithIdentifier:@"RTDelayedLocationRequesterDelayTimer" queue:v15 handler:&v24];
      -[RTDelayedLocationRequester setDelayTimer:](self, "setDelayTimer:", v17, v24, v25, v26, v27);

      id v18 = [(RTDelayedLocationRequester *)self delayTimer];
      [v18 fireAfterDelay:v13];

      id v19 = [(RTDelayedLocationRequester *)self delayTimer];
      [v19 resume];

      v20 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [(RTDelayedLocationRequester *)self fireDate];
        uint64_t v23 = [v22 stringFromDate];
        *(_DWORD *)buf = 138413058;
        id v33 = v21;
        __int16 v34 = 2112;
        v35 = @"RTDelayedLocationRequesterDelayTimer";
        __int16 v36 = 2112;
        uint64_t v37 = v23;
        __int16 v38 = 2048;
        double v39 = v13;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, fireDate, %@, interval, %.2f", buf, 0x2Au);
      }
      objc_destroyWeak(&v30);

      objc_destroyWeak(&location);
    }
  }
}

void __47__RTDelayedLocationRequester__updateDelayTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    uint64_t v5 = v4;
    uint64_t v6 = [*(id *)(a1 + 40) fireDate];
    [v2 timeIntervalSinceDate:v6];
    int v9 = 138412802;
    __int16 v10 = @"RTDelayedLocationRequesterDelayTimer";
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@ expiry, %.2f since created, %.2f since fireDate", (uint8_t *)&v9, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _onDelayTimerExpiry];
}

- (void)updateFireDate:(id)a3
{
}

- (void)_updateFireDate:(id)a3 handler:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(RTDelayedLocationRequester *)self fireDate];
  char v8 = [v7 isEqualToDate:v9];

  if ((v8 & 1) == 0)
  {
    [(RTDelayedLocationRequester *)self setFireDate:v9];
    [(RTDelayedLocationRequester *)self _updateDelayTimer];
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)updateFireDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(RTDelayedLocationRequester *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTDelayedLocationRequester_updateFireDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __53__RTDelayedLocationRequester_updateFireDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFireDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (RTDelayedLocationRequesterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
}

- (RTTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (NSDate)activeStartDate
{
  return self->_activeStartDate;
}

- (void)setActiveStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStartDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end