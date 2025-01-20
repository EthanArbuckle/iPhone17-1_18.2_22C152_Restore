@interface RTVisitLabeler
- (BOOL)collectingWiFiScans;
- (BOOL)labelVisit:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)registeredForWifiScan;
- (NSMutableArray)accessPoints;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTLocationManager)locationManager;
- (RTPlaceInferenceManager)placeInferenceManager;
- (RTTimer)wifiScanDelayTimer;
- (RTTimer)wifiScanTimer;
- (RTTimerManager)timerManager;
- (RTVisitLabeler)init;
- (RTVisitLabeler)initWithDefaultsManager:(id)a3 placeInferenceManager:(id)a4 locationManager:(id)a5 wifiManager:(id)a6;
- (RTWiFiManager)wifiManager;
- (unint64_t)wifiScanTimerFireCount;
- (void)_collectWiFiScansAndLabelVisit:(id)a3 clientIdentifier:(id)a4 maxRetries:(unint64_t)a5 handler:(id)a6;
- (void)_findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)_labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)_labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)_processVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)labelVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)onWiFiScanNotification:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setCollectingWiFiScans:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredForWifiScan:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setWifiScanDelayTimer:(id)a3;
- (void)setWifiScanTimer:(id)a3;
- (void)setWifiScanTimerFireCount:(unint64_t)a3;
@end

@implementation RTVisitLabeler

- (RTVisitLabeler)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_placeInferenceManager_locationManager_wifiManager_);
}

- (RTVisitLabeler)initWithDefaultsManager:(id)a3 placeInferenceManager:(id)a4 locationManager:(id)a5 wifiManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: defaultsManager";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_16;
  }
  if (!v13)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: wifiManager";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v32.receiver = self;
  v32.super_class = (Class)RTVisitLabeler;
  v16 = [(RTVisitLabeler *)&v32 init];
  if (v16)
  {
    v31 = v16;
    v17 = v16;
    attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (const char *)[(RTVisitLabeler *)v17 UTF8String];
    }
    else
    {
      id v28 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v17];
      v18 = (const char *)[v28 UTF8String];
    }
    dispatch_queue_t v29 = dispatch_queue_create(v18, attr);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v17->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_placeInferenceManager, a4);
    objc_storeStrong((id *)&v17->_wifiManager, a6);
    objc_storeStrong((id *)&v17->_locationManager, a5);
    uint64_t v24 = objc_opt_new();
    timerManager = v17->_timerManager;
    v17->_timerManager = (RTTimerManager *)v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accessPoints = v17->_accessPoints;
    v17->_accessPoints = v26;

    *(_WORD *)&v17->_registeredForWifiScan = 0;
    v16 = v31;
  }
  self = v16;
  v21 = self;
LABEL_18:

  return v21;
}

- (BOOL)labelVisit:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__10;
  v49 = __Block_byref_object_dispose__10;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10;
  v43 = __Block_byref_object_dispose__10;
  id v44 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __52__RTVisitLabeler_labelVisit_clientIdentifier_error___block_invoke;
  v35[3] = &unk_1E6B91B58;
  v37 = &v45;
  v38 = &v39;
  v10 = v9;
  v36 = v10;
  [(RTVisitLabeler *)self labelVisit:v7 clientIdentifier:v8 handler:v35];
  id v11 = v10;
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_6;
  }
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  v17 = objc_opt_new();
  v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_8];
  v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  v20 = [v19 filteredArrayUsingPredicate:v18];
  v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v51 count:1];
  v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_6:
    id v26 = 0;
    char v27 = 1;
  }

  id v28 = v26;
  if ((v27 & 1) == 0) {
    objc_storeStrong(v40 + 5, v26);
  }
  if (v40[5]
    || ([(id)v46[5] placeInference],
        v30 = objc_claimAutoreleasedReturnValue(),
        BOOL v31 = v30 == 0,
        v30,
        v31))
  {
    BOOL v29 = 0;
    if (a5) {
      *a5 = v40[5];
    }
  }
  else
  {
    objc_super v32 = [(id)v46[5] placeInference];
    [v7 setPlaceInference:v32];

    BOOL v29 = 1;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __52__RTVisitLabeler_labelVisit_clientIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 placeInference];
    dispatch_semaphore_t v9 = @"YES";
    int v16 = 138412802;
    if (!v8) {
      dispatch_semaphore_t v9 = @"NO";
    }
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "labeled visit, %@, %@, error, %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)labelVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, void *))a5;
  switch([v9 source])
  {
    case 0:
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        BOOL v29 = v22;
        __int16 v30 = 2048;
        uint64_t v31 = [v9 source];
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, unsupported visit source, %lu", buf, 0x16u);
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      id v15 = [NSString stringWithFormat:@"unsupported visit source. %@", *MEMORY[0x1E4F28568]];
      v25 = v15;
      int v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = &v25;
      __int16 v18 = &v24;
      goto LABEL_10;
    case 1:
      [(RTVisitLabeler *)self labelConstantMonitorVisit:v9 clientIdentifier:v10 handler:v11];
      break;
    case 2:
      [(RTVisitLabeler *)self labelEventMonitorVisit:v9 clientIdentifier:v10 handler:v11];
      break;
    case 3:
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        BOOL v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = [v9 source];
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, unsupported visit source, %lu", buf, 0x16u);
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      id v15 = [NSString stringWithFormat:@"unsupported visit source."];
      char v27 = v15;
      int v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = &v27;
      __int16 v18 = &v26;
LABEL_10:
      __int16 v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
      id v21 = [v13 errorWithDomain:v14 code:1 userInfo:v20];

      v11[2](v11, v9, v21);
      break;
    default:
      break;
  }
}

- (void)labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTVisitLabeler *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__RTVisitLabeler_labelConstantMonitorVisit_clientIdentifier_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __69__RTVisitLabeler_labelConstantMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _labelConstantMonitorVisit:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v39 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v9 = a4;
  id v10 = [v8 alloc];
  id v11 = [v7 location];
  [v11 latitude];
  CLLocationDegrees v13 = v12;
  id v14 = [v7 location];
  [v14 longitude];
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v13, v15);
  id v17 = [v7 location];
  [v17 altitude];
  double v19 = v18;
  __int16 v20 = [v7 location];
  [v20 horizontalUncertainty];
  double v22 = v21;
  v23 = [v7 location];
  [v23 verticalUncertainty];
  double v25 = v24;
  uint64_t v26 = [v7 location];
  char v27 = [v26 date];
  id v28 = [v10 initWithCoordinate:v27 altitude:v16.latitude horizontalAccuracy:v16.longitude verticalAccuracy:v19 timestamp:v22];

  id v29 = objc_alloc(MEMORY[0x1E4F5CE78]);
  v49[0] = v28;
  __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  uint64_t v31 = (void *)[v29 initWithFidelityPolicy:0 locations:v30 accessPoints:MEMORY[0x1E4F1CBF0] clientIdentifier:v9];

  uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v44 = v33;
    __int16 v45 = 2112;
    id v46 = v7;
    __int16 v47 = 2048;
    uint64_t v48 = 0;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@ , visit, %@, fidelity policy, %lu", buf, 0x20u);
  }
  v34 = [(RTVisitLabeler *)self placeInferenceManager];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __70__RTVisitLabeler__labelConstantMonitorVisit_clientIdentifier_handler___block_invoke;
  v40[3] = &unk_1E6B914B8;
  id v41 = v7;
  id v42 = v39;
  id v35 = v39;
  id v36 = v7;
  [v34 fetchPlaceInferencesForOptions:v31 handler:v40];
}

void __70__RTVisitLabeler__labelConstantMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v4 count];
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v7;
    __int16 v32 = 2048;
    uint64_t v33 = v8;
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "label visit, %@, %lu possible placeInferences to choose from, error, %@", buf, 0x20u);
  }

  if (!v5 && [v4 count])
  {
    id v23 = v4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v26;
      double v14 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v9);
          }
          CLLocationCoordinate2D v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v31 = v12 + i + 1;
            __int16 v32 = 2112;
            uint64_t v33 = (uint64_t)v16;
            _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "placeInference candidate %lu, %@", buf, 0x16u);
          }

          [v16 confidence];
          if (v18 > v14)
          {
            [*(id *)(a1 + 32) setPlaceInference:v16];
            [v16 confidence];
            double v14 = v19;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        v12 += i;
      }
      while (v11);
    }

    __int16 v20 = [*(id *)(a1 + 32) placeInference];

    id v5 = 0;
    id v4 = v23;
    if (v20)
    {
      double v21 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v22;
        _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "selected placeInference for visit, %@", buf, 0xCu);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTVisitLabeler *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__RTVisitLabeler_labelEventMonitorVisit_clientIdentifier_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __66__RTVisitLabeler_labelEventMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _labelEventMonitorVisit:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, id, void))a5;
  [(RTVisitLabeler *)self setWifiScanTimerFireCount:0];
  id v12 = NSStringFromSelector(a2);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__10;
  v33[4] = __Block_byref_object_dispose__10;
  __int16 v34 = [[RTPowerAssertion alloc] initWithIdentifier:v12 timeout:21.0];
  if ([(RTVisitLabeler *)self collectingWiFiScans])
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v36 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, already collecting wifi scans", buf, 0xCu);
    }
    v11[2](v11, v9, 0);
  }
  else
  {
    [(RTVisitLabeler *)self setCollectingWiFiScans:1];
    CLLocationDegrees v15 = [(RTVisitLabeler *)self timerManager];
    id v16 = [(RTVisitLabeler *)self queue];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    long long v25 = __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke;
    long long v26 = &unk_1E6B91BA8;
    SEL v32 = a2;
    long long v27 = self;
    id v28 = v9;
    id v29 = v10;
    uint64_t v31 = v33;
    __int16 v30 = v11;
    id v17 = [v15 timerWithIdentifier:@"com.apple.routined.visit.wifiscan.delaytimer" queue:v16 handler:&v23];
    -[RTVisitLabeler setWifiScanDelayTimer:](self, "setWifiScanDelayTimer:", v17, v23, v24, v25, v26, v27);

    id v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = [(RTVisitLabeler *)self wifiScanDelayTimer];
      *(_DWORD *)buf = 138412546;
      id v36 = v19;
      __int16 v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, wifiScanDelayTimer start, %@", buf, 0x16u);
    }
    double v21 = [(RTVisitLabeler *)self wifiScanDelayTimer];
    [v21 fireAfterDelay:10.0];

    uint64_t v22 = [(RTVisitLabeler *)self wifiScanDelayTimer];
    [v22 resume];
  }
  _Block_object_dispose(v33, 8);
}

void __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v4 = [*(id *)(a1 + 32) wifiScanDelayTimer];
    *(_DWORD *)buf = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, wifiScanDelayTimer expiry, %@", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) wifiScanDelayTimer];
  [v5 invalidate];

  [*(id *)(a1 + 32) setWifiScanDelayTimer:0];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke_26;
  v12[3] = &unk_1E6B91B80;
  uint64_t v9 = *(void *)(a1 + 72);
  v12[4] = v6;
  uint64_t v14 = v9;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v11;
  long long v13 = v11;
  [v6 _collectWiFiScansAndLabelVisit:v7 clientIdentifier:v8 maxRetries:1 handler:v12];
}

void __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  [*(id *)(a1 + 32) setCollectingWiFiScans:0];
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    long long v11 = [v5 placeInference];
    id v12 = @"YES";
    int v13 = 138413058;
    uint64_t v14 = v10;
    if (!v11) {
      id v12 = @"NO";
    }
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, label visit, %@, returned visit, %@, error, %@", (uint8_t *)&v13, 0x2Au);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

- (void)_collectWiFiScansAndLabelVisit:(id)a3 clientIdentifier:(id)a4 maxRetries:(unint64_t)a5 handler:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(RTVisitLabeler *)self wifiScanTimer];

    if (v14)
    {
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v35 = "-[RTVisitLabeler _collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:]";
        __int16 v36 = 1024;
        int v37 = 271;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Wifi scan timer already started - should not happen. (in %s:%d)", buf, 0x12u);
      }
    }
    objc_initWeak(&location, self);
    id v16 = [(RTVisitLabeler *)self timerManager];
    __int16 v17 = [(RTVisitLabeler *)self queue];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    long long v26 = __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke;
    long long v27 = &unk_1E6B91BF8;
    v32[1] = (id)a2;
    id v28 = self;
    objc_copyWeak(v32, &location);
    id v29 = v11;
    id v30 = v12;
    v32[2] = (id)a5;
    id v31 = v13;
    id v18 = [v16 timerWithIdentifier:@"com.apple.routined.visit.wifiscan.timer" queue:v17 handler:&v24];
    -[RTVisitLabeler setWifiScanTimer:](self, "setWifiScanTimer:", v18, v24, v25, v26, v27, v28);

    [(RTVisitLabeler *)self setRegisteredForWifiScan:1];
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v35 = v20;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, request wifi scan", buf, 0xCu);
    }
    uint64_t v21 = [(RTVisitLabeler *)self wifiManager];
    [v21 scheduleActiveScan];

    uint64_t v22 = [(RTVisitLabeler *)self wifiScanTimer];
    [v22 fireAfterDelay:5.0];

    uint64_t v23 = [(RTVisitLabeler *)self wifiScanTimer];
    [v23 resume];

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }
}

void __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, wifi scan timer expiry", (uint8_t *)&buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) wifiManager];
  [v4 cancelScan];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = [WeakRetained wifiScanTimer];
  [v6 invalidate];

  [WeakRetained setWifiScanTimer:0];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__10;
  uint64_t v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__10;
  v17[4] = __Block_byref_object_dispose__10;
  id v18 = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke_27;
  v10[3] = &unk_1E6B91BD0;
  uint64_t v9 = *(void *)(a1 + 80);
  v10[4] = *(void *)(a1 + 32);
  p_long long buf = &buf;
  __int16 v15 = v17;
  uint64_t v16 = v9;
  id v13 = *(id *)(a1 + 56);
  v10[5] = WeakRetained;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [WeakRetained _processVisit:v7 clientIdentifier:v8 handler:v10];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&buf, 8);
}

void __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 placeInference];
    if (v9) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    uint64_t v11 = [*(id *)(a1 + 32) wifiScanTimerFireCount];
    int v15 = 138413058;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "label visit, %@, returned visit, %@, error, %@, wifi scan timer fire count, %lu", (uint8_t *)&v15, 0x2Au);
  }
  id v12 = [*(id *)(a1 + 32) accessPoints];
  [v12 removeAllObjects];

  id v13 = [v6 placeInference];
  if (v13)
  {

LABEL_12:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
    [*(id *)(a1 + 32) setRegisteredForWifiScan:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  if ((unint64_t)[*(id *)(a1 + 32) wifiScanTimerFireCount] >= *(void *)(a1 + 88)) {
    goto LABEL_12;
  }
  if ((unint64_t)[*(id *)(a1 + 32) wifiScanTimerFireCount] < *(void *)(a1 + 88))
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) placeInference];

    if (!v14)
    {
      [*(id *)(a1 + 32) setWifiScanTimerFireCount: *(id *)(a1 + 32) wifiScanTimerFireCount] + 1);
      [*(id *)(a1 + 40) _collectWiFiScansAndLabelVisit:*(void *)(a1 + 48) clientIdentifier:*(void *)(a1 + 56) maxRetries:*(void *)(a1 + 88) handler:*(void *)(a1 + 64)];
    }
  }
LABEL_13:
}

- (void)_processVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v52 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v50 = a4;
  id v10 = [v9 alloc];
  uint64_t v11 = [v8 location];
  [v11 latitude];
  CLLocationDegrees v13 = v12;
  uint64_t v14 = [v8 location];
  [v14 longitude];
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v13, v15);
  __int16 v17 = [v8 location];
  [v17 altitude];
  double v19 = v18;
  id v20 = [v8 location];
  [v20 horizontalUncertainty];
  double v22 = v21;
  uint64_t v23 = [v8 location];
  [v23 verticalUncertainty];
  double v25 = v24;
  long long v26 = [v8 location];
  long long v27 = [v26 date];
  id v28 = [v10 initWithCoordinate:v27 altitude:v16.latitude horizontalAccuracy:v16.longitude verticalAccuracy:v19 timestamp:v22];

  id v29 = self;
  id v30 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v28 coordinate];
  double v32 = v31;
  [v28 coordinate];
  double v34 = v33;
  [v28 horizontalAccuracy];
  double v36 = v35;
  int v37 = [v28 timestamp];
  uint64_t v38 = (void *)[v30 initWithLatitude:v37 longitude:v32 horizontalUncertainty:v34 date:v36];

  uint64_t v39 = (void *)[(NSMutableArray *)self->_accessPoints copy];
  id v40 = objc_alloc(MEMORY[0x1E4F5CE78]);
  v68[0] = v28;
  id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
  LOBYTE(v49) = 1;
  id v42 = (void *)[v40 initWithFidelityPolicy:32 locations:v41 accessPoints:v39 distance:0 location:0 startDate:0 endDate:0.0 limit:-1 useBackground:v49 clientIdentifier:v50];

  v43 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    id v44 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138413314;
    v59 = v44;
    __int16 v60 = 2112;
    v61 = v28;
    __int16 v62 = 2048;
    uint64_t v63 = [v39 count];
    __int16 v64 = 2048;
    uint64_t v65 = 32;
    __int16 v66 = 2048;
    uint64_t v67 = [(RTVisitLabeler *)v29 wifiScanTimerFireCount];
    _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, location, %@, access point count, %lu, fidelity policy, %lu, _wifiScanTimerFireCount, %lu", buf, 0x34u);
  }
  __int16 v45 = [(RTVisitLabeler *)v29 placeInferenceManager];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke;
  v53[3] = &unk_1E6B91690;
  v53[4] = v29;
  id v54 = v8;
  id v55 = v38;
  id v56 = v52;
  SEL v57 = a2;
  id v46 = v52;
  id v47 = v38;
  id v48 = v8;
  [v45 fetchPlaceInferencesForOptions:v42 handler:v53];
}

void __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke_2;
  v10[3] = &unk_1E6B916E0;
  id v11 = v6;
  id v12 = v5;
  uint64_t v16 = *(void *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) count])
  {
    uint64_t v2 = 0;
    goto LABEL_3;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = *(id *)(v1 + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (!v15)
  {
    uint64_t v2 = 0;
    goto LABEL_29;
  }
  uint64_t v16 = v15;
  double v33 = 0;
  uint64_t v34 = 0;
  double v32 = 0;
  uint64_t v17 = *(void *)v36;
  double v18 = -1.0;
  double v19 = -1.0;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v36 != v17) {
        objc_enumerationMutation(v14);
      }
      double v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      double v22 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(v1 + 72));
        id v23 = v14;
        v25 = uint64_t v24 = v1;
        *(_DWORD *)long long buf = 138412802;
        id v40 = v25;
        __int16 v41 = 2048;
        uint64_t v42 = v34 + i + 1;
        __int16 v43 = 2112;
        id v44 = v21;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, placeInference candidate %lu, %@", buf, 0x20u);

        uint64_t v1 = v24;
        id v14 = v23;
      }

      if ([v21 placeType] == 2)
      {
        [v21 confidence];
        if (v26 > v19)
        {
          id v27 = v21;

          [v27 confidence];
          double v19 = v28;
          double v33 = v27;
        }
      }
      else if ([v21 placeType] == 3)
      {
        [v21 confidence];
        if (v29 > v18)
        {
          id v30 = v21;

          [v30 confidence];
          double v18 = v31;
          double v32 = v30;
        }
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
    v34 += i;
  }
  while (v16);

  if (v32)
  {
    id v14 = v32;

    uint64_t v2 = v14;
LABEL_29:

    goto LABEL_3;
  }
  uint64_t v2 = v33;
LABEL_3:
  id v3 = objc_alloc(MEMORY[0x1E4F5CFC8]);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [*(id *)(v1 + 48) type];
  uint64_t v6 = *(void *)(v1 + 56);
  id v7 = [*(id *)(v1 + 48) entry];
  id v8 = [*(id *)(v1 + 48) exit];
  uint64_t v9 = [*(id *)(v1 + 48) dataPointCount];
  [*(id *)(v1 + 48) confidence];
  id v10 = [v3 initWithDate:v4 type:v5 location:v6 entry:v7 exit:v8 dataPointCount:v9 confidence:v2];

  if (v2)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = NSStringFromSelector(*(SEL *)(v1 + 72));
      *(_DWORD *)long long buf = 138412546;
      id v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, selected placeInference for visit, %@", buf, 0x16u);
    }
  }
  uint64_t v13 = *(void *)(v1 + 64);
  if (v13) {
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v10, *(void *)(v1 + 32));
  }
}

- (void)onWiFiScanNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTVisitLabeler *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__RTVisitLabeler_onWiFiScanNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__RTVisitLabeler_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) scanResults];
    uint64_t v2 = [*(id *)(a1 + 40) accessPoints];
    [v2 addObjectsFromArray:v3];
  }
}

- (void)setRegisteredForWifiScan:(BOOL)a3
{
  if (self->_registeredForWifiScan != a3)
  {
    BOOL v3 = a3;
    self->_registeredForWifiScan = a3;
    id v6 = [(RTVisitLabeler *)self wifiManager];
    +[RTNotification notificationName];
    if (v3) {
      uint64_t v5 = {;
    }
      [v6 addObserver:self selector:sel_onWiFiScanNotification_ name:v5];
    }
    else {
      uint64_t v5 = {;
    }
      [v6 removeObserver:self fromNotification:v5];
    }
  }
}

- (void)_findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  id v11 = a3;
  if ([(RTVisitLabeler *)self collectingWiFiScans])
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      double v18 = v13;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, already collecting wifi scans", buf, 0xCu);
    }
    v10[2](v10, v11, 0);
  }
  else
  {
    [(RTVisitLabeler *)self setCollectingWiFiScans:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__RTVisitLabeler__findPointOfInterestForVisit_clientIdentifier_handler___block_invoke;
    v14[3] = &unk_1E6B91C20;
    v14[4] = self;
    SEL v16 = a2;
    uint64_t v15 = v10;
    [(RTVisitLabeler *)self _collectWiFiScansAndLabelVisit:v11 clientIdentifier:v9 maxRetries:0 handler:v14];
  }
}

void __72__RTVisitLabeler__findPointOfInterestForVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setCollectingWiFiScans:0];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = 138412802;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, labeled visit, %@, error, %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTVisitLabeler *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__RTVisitLabeler_findPointOfInterestForVisit_clientIdentifier_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __71__RTVisitLabeler_findPointOfInterestForVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPointOfInterestForVisit:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
}

- (unint64_t)wifiScanTimerFireCount
{
  return self->_wifiScanTimerFireCount;
}

- (void)setWifiScanTimerFireCount:(unint64_t)a3
{
  self->_wifiScanTimerFireCount = a3;
}

- (BOOL)registeredForWifiScan
{
  return self->_registeredForWifiScan;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTTimer)wifiScanDelayTimer
{
  return self->_wifiScanDelayTimer;
}

- (void)setWifiScanDelayTimer:(id)a3
{
}

- (BOOL)collectingWiFiScans
{
  return self->_collectingWiFiScans;
}

- (void)setCollectingWiFiScans:(BOOL)a3
{
  self->_collectingWiFiScans = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScanDelayTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end