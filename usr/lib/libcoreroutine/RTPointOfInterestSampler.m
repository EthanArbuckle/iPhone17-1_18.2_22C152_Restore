@interface RTPointOfInterestSampler
- (BOOL)registeredForWifiScan;
- (BOOL)running;
- (BOOL)shouldRun;
- (NSMutableArray)accessPoints;
- (NSMutableDictionary)requesters;
- (RTDefaultsManager)defaultsManager;
- (RTLocationManager)locationManager;
- (RTPlaceInferenceManager)placeInferenceManager;
- (RTPointOfInterestSampler)init;
- (RTPointOfInterestSampler)initWithDefaultsManager:(id)a3 locationManager:(id)a4 placeInferenceManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7;
- (RTTimer)samplingTimer;
- (RTTimer)wifiScanTimer;
- (RTTimerManager)timerManager;
- (RTWiFiManager)wifiManager;
- (double)samplingInterval;
- (void)_addRequester:(id)a3 samplingInterval:(double)a4;
- (void)_removeRequester:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startSampling;
- (void)_updateSamplingInterval;
- (void)onWiFiScanNotification:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setRegisteredForWifiScan:(BOOL)a3;
- (void)setRequesters:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSamplingInterval:(double)a3;
- (void)setSamplingTimer:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setWifiScanTimer:(id)a3;
- (void)startSamplingPointOfInterestFromRequester:(id)a3 samplingInterval:(double)a4;
- (void)stopSamplingPointOfInterestFromRequester:(id)a3;
@end

@implementation RTPointOfInterestSampler

- (RTPointOfInterestSampler)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_locationManager_placeInferenceManager_timerManager_wifiManager_);
}

- (RTPointOfInterestSampler)initWithDefaultsManager:(id)a3 locationManager:(id)a4 placeInferenceManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v27 = v17;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v27 = v17;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v27 = v17;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v27 = v17;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_17;
    }
LABEL_18:

    v26 = 0;
    goto LABEL_19;
  }
  id v32 = v17;
  if (v17)
  {
    v33.receiver = self;
    v33.super_class = (Class)RTPointOfInterestSampler;
    v18 = [(RTNotifier *)&v33 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      objc_storeStrong((id *)&v19->_locationManager, a4);
      objc_storeStrong((id *)&v19->_placeInferenceManager, a5);
      objc_storeStrong((id *)&v19->_timerManager, a6);
      objc_storeStrong((id *)&v19->_wifiManager, a7);
      uint64_t v20 = objc_opt_new();
      requesters = v19->_requesters;
      v19->_requesters = (NSMutableDictionary *)v20;

      v19->_samplingInterval = 1.79769313e308;
      samplingTimer = v19->_samplingTimer;
      v19->_samplingTimer = 0;

      wifiScanTimer = v19->_wifiScanTimer;
      v19->_wifiScanTimer = 0;

      v19->_registeredForWifiScan = 0;
      uint64_t v24 = objc_opt_new();
      accessPoints = v19->_accessPoints;
      v19->_accessPoints = (NSMutableArray *)v24;

      v19->_running = 0;
      v19->_shouldRun = 0;
    }
    self = v19;
    v26 = self;
  }
  else
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    v26 = 0;
  }
  v27 = v32;
LABEL_19:

  return v26;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v7 = a3;
  [(RTPointOfInterestSampler *)self setRegisteredForWifiScan:0];
  [(RTPointOfInterestSampler *)self setRunning:0];
  [(RTPointOfInterestSampler *)self setShouldRun:0];
  v4 = [(RTPointOfInterestSampler *)self wifiScanTimer];
  [v4 invalidate];

  [(RTPointOfInterestSampler *)self setWifiScanTimer:0];
  v5 = [(RTPointOfInterestSampler *)self samplingTimer];
  [v5 invalidate];

  [(RTPointOfInterestSampler *)self setSamplingTimer:0];
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v6 = v7;
  }
}

- (void)startSamplingPointOfInterestFromRequester:(id)a3 samplingInterval:(double)a4
{
  id v6 = a3;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTPointOfInterestSampler_startSamplingPointOfInterestFromRequester_samplingInterval___block_invoke;
  block[3] = &unk_1E6B91220;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __87__RTPointOfInterestSampler_startSamplingPointOfInterestFromRequester_samplingInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRequester:*(void *)(a1 + 40) samplingInterval:*(double *)(a1 + 48)];
}

- (void)stopSamplingPointOfInterestFromRequester:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__RTPointOfInterestSampler_stopSamplingPointOfInterestFromRequester___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__RTPointOfInterestSampler_stopSamplingPointOfInterestFromRequester___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRequester:*(void *)(a1 + 40)];
}

- (void)_addRequester:(id)a3 samplingInterval:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 <= 0.0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingInterval > 0", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = NSStringFromSelector(a2);
      int v13 = 138412802;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2048;
      double v18 = a4;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, add requester, %@, sampling interval, %.1f", (uint8_t *)&v13, 0x20u);
    }
    id v10 = [(RTPointOfInterestSampler *)self requesters];
    double v11 = [NSNumber numberWithDouble:a4];
    [v10 setObject:v11 forKey:v7];

    [(RTPointOfInterestSampler *)self _updateSamplingInterval];
  }
}

- (void)_removeRequester:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(RTPointOfInterestSampler *)self requesters];
  id v7 = [v6 objectForKey:v5];

  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = NSStringFromSelector(a2);
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, remove requester, %@", (uint8_t *)&v13, 0x16u);
    }
    double v11 = [(RTPointOfInterestSampler *)self requesters];
    [v11 removeObjectForKey:v5];

    [(RTPointOfInterestSampler *)self _updateSamplingInterval];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, requester not found, %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_updateSamplingInterval
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(RTPointOfInterestSampler *)self requesters];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    double v7 = 1.79769313e308;
    uint64_t v20 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(double *)(*((void *)&v22 + 1) + 8 * i);
        id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          __int16 v15 = NSStringFromSelector(a2);
          id v16 = [(RTPointOfInterestSampler *)self requesters];
          uint64_t v17 = [v16 objectForKey:*(void *)&v9];
          *(_DWORD *)buf = 138413058;
          v27 = v15;
          __int16 v28 = 2112;
          double v29 = v9;
          __int16 v30 = 2112;
          v31 = v17;
          __int16 v32 = 2048;
          double v33 = v7;
          _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, requester, %@, interval, %@, interval min, %.1f", buf, 0x2Au);

          v3 = v20;
        }

        double v11 = [(RTPointOfInterestSampler *)self requesters];
        v12 = [v11 objectForKey:*(void *)&v9];
        [v12 doubleValue];
        double v14 = v13;

        if (v14 < v7) {
          double v7 = v14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  double v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    __int16 v28 = 2048;
    double v29 = v7;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, updated interval, %.1f", buf, 0x16u);
  }
  [(RTPointOfInterestSampler *)self setSamplingInterval:v7];
}

- (void)setSamplingInterval:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0)
  {
    if (vabdd_f64(self->_samplingInterval, a3) >= 0.1)
    {
      double v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = NSStringFromSelector(a2);
        int v9 = 138412546;
        id v10 = v8;
        __int16 v11 = 2048;
        double v12 = a3;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, updated interval, %.1f", (uint8_t *)&v9, 0x16u);
      }
      self->_samplingInterval = a3;
      if (a3 == 1.79769313e308)
      {
        [(RTPointOfInterestSampler *)self setShouldRun:0];
      }
      else
      {
        [(RTPointOfInterestSampler *)self setShouldRun:1];
        if (![(RTPointOfInterestSampler *)self running]) {
          [(RTPointOfInterestSampler *)self _startSampling];
        }
      }
    }
  }
  else
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingInterval > 0", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_startSampling
{
  if (![(RTPointOfInterestSampler *)self running])
  {
    [(RTPointOfInterestSampler *)self setRunning:1];
    uint64_t v4 = [(RTPointOfInterestSampler *)self locationManager];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke;
    v5[3] = &unk_1E6B97398;
    v5[4] = self;
    v5[5] = a2;
    [v4 fetchCurrentLocationWithHandler:v5];
  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_2;
  v11[3] = &unk_1E6B917F0;
  uint64_t v8 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) running])
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v4 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v34 = v3;
      __int16 v35 = 2112;
      v36 = v4;
      __int16 v37 = 2112;
      uint64_t v38 = v5;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, current location, %@, error, %@", buf, 0x20u);
    }
    id v6 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48))
    {
      double v7 = [v6 timerManager];
      uint64_t v8 = [*(id *)(a1 + 32) queue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_12;
      v32[3] = &unk_1E6B91248;
      uint64_t v9 = *(void *)(a1 + 56);
      v32[4] = *(void *)(a1 + 32);
      v32[5] = v9;
      id v10 = [v7 timerWithIdentifier:@"com.apple.routined.poisampler.sampling.timer" queue:v8 handler:v32];
      [*(id *)(a1 + 32) setSamplingTimer:v10];

      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v13 = [*(id *)(a1 + 32) samplingTimer];
        [*(id *)(a1 + 32) samplingInterval];
        *(_DWORD *)buf = 138412802;
        v34 = v12;
        __int16 v35 = 2112;
        v36 = v13;
        __int16 v37 = 2048;
        uint64_t v38 = v14;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, sampling timer start, timer, %@, interval, %.1f", buf, 0x20u);
      }
      __int16 v15 = [*(id *)(a1 + 32) samplingTimer];
      [*(id *)(a1 + 32) samplingInterval];
      [v15 fireAfterDelay:];

      id v16 = [*(id *)(a1 + 32) samplingTimer];
      [v16 resume];
    }
    else
    {
      uint64_t v17 = [v6 accessPoints];
      [v17 removeAllObjects];

      [*(id *)(a1 + 32) setRegisteredForWifiScan:1];
      double v18 = [*(id *)(a1 + 32) wifiManager];
      [v18 scheduleActiveScan];

      uint64_t v19 = [*(id *)(a1 + 32) timerManager];
      uint64_t v20 = [*(id *)(a1 + 32) queue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_13;
      v29[3] = &unk_1E6B91220;
      uint64_t v21 = *(void *)(a1 + 56);
      long long v22 = *(void **)(a1 + 40);
      v29[4] = *(void *)(a1 + 32);
      uint64_t v31 = v21;
      id v30 = v22;
      long long v23 = [v19 timerWithIdentifier:@"com.apple.routined.poisampler.wifiscan.timer" queue:v20 handler:v29];
      [*(id *)(a1 + 32) setWifiScanTimer:v23];

      long long v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v25 = [*(id *)(a1 + 32) wifiScanTimer];
        v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412802;
        v34 = v25;
        __int16 v35 = 2112;
        v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = 0x4014000000000000;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, wifi scan timer start, timer, %@, interval, %.1f", buf, 0x20u);
      }
      v27 = [*(id *)(a1 + 32) wifiScanTimer];
      [v27 fireAfterDelay:5.0];

      __int16 v28 = [*(id *)(a1 + 32) wifiScanTimer];
      [v28 resume];

      id v16 = v30;
    }
  }
}

uint64_t __42__RTPointOfInterestSampler__startSampling__block_invoke_12(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) running];
  if (result)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v5 = [*(id *)(a1 + 32) samplingTimer];
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, sampling timer expiry, timer, %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [*(id *)(a1 + 32) samplingTimer];
    [v6 invalidate];

    [*(id *)(a1 + 32) setSamplingTimer:0];
    [*(id *)(a1 + 32) setRunning:0];
    uint64_t result = [*(id *)(a1 + 32) shouldRun];
    if (result) {
      return [*(id *)(a1 + 32) _startSampling];
    }
  }
  return result;
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_13(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) running])
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v4 = [*(id *)(a1 + 32) wifiScanTimer];
      *(_DWORD *)buf = 138412546;
      double v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v4;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, wifi scan timer expiry, timer, %@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 32) wifiManager];
    [v5 cancelScan];

    id v6 = [*(id *)(a1 + 32) wifiScanTimer];
    [v6 invalidate];

    [*(id *)(a1 + 32) setWifiScanTimer:0];
    [*(id *)(a1 + 32) setRegisteredForWifiScan:0];
    id v7 = objc_alloc(MEMORY[0x1E4F5CE78]);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    __int16 v9 = [*(id *)(a1 + 32) accessPoints];
    id v10 = (void *)[v7 initWithFidelityPolicy:32 locations:v8 accessPoints:v9 clientIdentifier:@"com.apple.CoreRoutine.poisampler"];

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      double v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, run placeInference with options, %@", buf, 0x16u);
    }
    id v13 = [*(id *)(a1 + 32) placeInferenceManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_16;
    v15[3] = &unk_1E6B92C38;
    uint64_t v14 = *(void *)(a1 + 48);
    v15[4] = *(void *)(a1 + 32);
    v15[5] = v14;
    [v13 fetchPlaceInferencesForOptions:v10 handler:v15];
  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_2_17;
  v11[3] = &unk_1E6B917F0;
  uint64_t v8 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_2_17(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) running])
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v4 = [*(id *)(a1 + 40) count];
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = v4;
      __int16 v23 = 2112;
      uint64_t v24 = v5;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, placeInference count, %lu, error, %@", buf, 0x20u);
    }
    id v6 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_18;
    v18[3] = &__block_descriptor_40_e33_v32__0__RTPlaceInference_8Q16_B24l;
    v18[4] = *(void *)(a1 + 56);
    [v6 enumerateObjectsUsingBlock:v18];
    id v7 = [*(id *)(a1 + 32) timerManager];
    uint64_t v8 = [*(id *)(a1 + 32) queue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_20;
    v17[3] = &unk_1E6B91248;
    uint64_t v9 = *(void *)(a1 + 56);
    v17[4] = *(void *)(a1 + 32);
    v17[5] = v9;
    id v10 = [v7 timerWithIdentifier:@"com.apple.routined.poisampler.sampling.timer" queue:v8 handler:v17];
    [*(id *)(a1 + 32) setSamplingTimer:v10];

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
      id v13 = [*(id *)(a1 + 32) samplingTimer];
      [*(id *)(a1 + 32) samplingInterval];
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v13;
      __int16 v23 = 2048;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, sampling timer start, timer, %@, interval, %.1f", buf, 0x20u);
    }
    __int16 v15 = [*(id *)(a1 + 32) samplingTimer];
    [*(id *)(a1 + 32) samplingInterval];
    [v15 fireAfterDelay:];

    uint64_t v16 = [*(id *)(a1 + 32) samplingTimer];
    [v16 resume];
  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, placeInference, %@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __42__RTPointOfInterestSampler__startSampling__block_invoke_20(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) running];
  if (result)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
      id v5 = [*(id *)(a1 + 32) samplingTimer];
      int v7 = 138412546;
      int v8 = v4;
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, sampling timer expiry, timer, %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [*(id *)(a1 + 32) samplingTimer];
    [v6 invalidate];

    [*(id *)(a1 + 32) setSamplingTimer:0];
    [*(id *)(a1 + 32) setRunning:0];
    uint64_t result = [*(id *)(a1 + 32) shouldRun];
    if (result) {
      return [*(id *)(a1 + 32) _startSampling];
    }
  }
  return result;
}

- (void)setRegisteredForWifiScan:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_registeredForWifiScan != a3)
  {
    self->_BOOL registeredForWifiScan = a3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      int v7 = (void *)v6;
      if (self->_registeredForWifiScan) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, registeredForWifiScan, %@", (uint8_t *)&v12, 0x16u);
    }
    BOOL registeredForWifiScan = self->_registeredForWifiScan;
    __int16 v10 = [(RTPointOfInterestSampler *)self wifiManager];
    +[RTNotification notificationName];
    if (registeredForWifiScan) {
      uint64_t v11 = {;
    }
      [v10 addObserver:self selector:sel_onWiFiScanNotification_ name:v11];
    }
    else {
      uint64_t v11 = {;
    }
      [v10 removeObserver:self fromNotification:v11];
    }
  }
}

- (void)onWiFiScanNotification:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTPointOfInterestSampler_onWiFiScanNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  __int16 v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__RTPointOfInterestSampler_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [*(id *)(a1 + 32) scanResults];
    v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v5 = [v2 count];
      uint64_t v6 = [*(id *)(a1 + 40) accessPoints];
      uint64_t v7 = [v6 count];
      int v8 = [*(id *)(a1 + 40) accessPoints];
      uint64_t v9 = [v8 count];
      int v11 = 138413058;
      int v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = [v2 count] + v9;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, received scan result count, %lu, total count, before, %lu, after, %lu", (uint8_t *)&v11, 0x2Au);
    }
    __int16 v10 = [*(id *)(a1 + 40) accessPoints];
    [v10 addObjectsFromArray:v2];
  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (NSMutableDictionary)requesters
{
  return self->_requesters;
}

- (void)setRequesters:(id)a3
{
}

- (RTTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
}

- (BOOL)registeredForWifiScan
{
  return self->_registeredForWifiScan;
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end