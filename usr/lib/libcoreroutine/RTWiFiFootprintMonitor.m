@interface RTWiFiFootprintMonitor
+ (id)footprintStateToString:(int64_t)a3;
- (NSMutableArray)scanResults;
- (RTPersistentTimer)scanTimer;
- (RTWiFiFootprintMonitor)init;
- (RTWiFiFootprintMonitor)initWithWiFiManager:(id)a3;
- (RTWiFiManager)wifiManager;
- (int64_t)_footprintStateForScanResults:(id)a3;
- (int64_t)footprintState;
- (void)_checkFootprint;
- (void)_handlePowerStatusChanged:(unint64_t)a3;
- (void)_processScanResults:(id)a3;
- (void)_pruneScanResults;
- (void)_shutdownWithHandler:(id)a3;
- (void)_start;
- (void)_stop;
- (void)fetchConstantFootprintStatusForScanResults:(id)a3 withHandler:(id)a4;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onWiFiManagerNotificationPowerStatusChanged:(id)a3;
- (void)onWiFiManagerNotificationScanResults:(id)a3;
- (void)setFootprintState:(int64_t)a3;
- (void)setScanResults:(id)a3;
- (void)setScanTimer:(id)a3;
- (void)setWifiManager:(id)a3;
@end

@implementation RTWiFiFootprintMonitor

- (RTWiFiFootprintMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithWiFiManager_);
}

- (RTWiFiFootprintMonitor)initWithWiFiManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTWiFiFootprintMonitor;
  v6 = [(RTNotifier *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wifiManager, a3);
    v7->_footprintState = -1;
    uint64_t v8 = objc_opt_new();
    scanResults = v7->_scanResults;
    v7->_scanResults = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)_start
{
  wifiManager = self->_wifiManager;
  v4 = +[RTNotification notificationName];
  [(RTNotifier *)wifiManager addObserver:self selector:sel_onWiFiManagerNotificationScanResults_ name:v4];

  id v5 = self->_wifiManager;
  v6 = +[RTNotification notificationName];
  [(RTNotifier *)v5 addObserver:self selector:sel_onWiFiManagerNotificationPowerStatusChanged_ name:v6];

  v7 = +[RTNotification notificationName];
  uint64_t v8 = NSString;
  v9 = [MEMORY[0x1E4F28CB8] defaultsDomain];
  v10 = (objc_class *)objc_opt_class();
  objc_super v11 = NSStringFromClass(v10);
  v12 = [v8 stringWithFormat:@"%@-%@-%@", v9, v11, v7];

  v13 = [RTPersistentTimer alloc];
  v14 = [MEMORY[0x1E4F1C9C8] date];
  v15 = [(RTNotifier *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __32__RTWiFiFootprintMonitor__start__block_invoke;
  v17[3] = &unk_1E6B90E70;
  v17[4] = self;
  v16 = [(RTPersistentTimer *)v13 initWithFireDate:v14 interval:v12 serviceIdentifier:v15 queue:v17 handler:30.0];
  [(RTWiFiFootprintMonitor *)self setScanTimer:v16];
}

uint64_t __32__RTWiFiFootprintMonitor__start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) scheduleScan];
}

- (void)_stop
{
  [(RTNotifier *)self->_wifiManager removeObserver:self];
  [(RTWiFiManager *)self->_wifiManager cancelScan];
  v3 = [(RTWiFiFootprintMonitor *)self scanTimer];
  [v3 invalidate];

  [(RTWiFiFootprintMonitor *)self setScanTimer:0];

  [(RTWiFiFootprintMonitor *)self setFootprintState:-1];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTWiFiFootprintMonitor *)self _stop];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    v4 = v5;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v5] == 1) {
      [(RTWiFiFootprintMonitor *)self _start];
    }
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (![(RTNotifier *)self getNumberOfObservers:v5]) {
      [(RTWiFiFootprintMonitor *)self _stop];
    }
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)onWiFiManagerNotificationScanResults:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__RTWiFiFootprintMonitor_onWiFiManagerNotificationScanResults___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__RTWiFiFootprintMonitor_onWiFiManagerNotificationScanResults___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) scanResults];
  [v1 _processScanResults:v2];
}

- (void)onWiFiManagerNotificationPowerStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTWiFiFootprintMonitor_onWiFiManagerNotificationPowerStatusChanged___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__RTWiFiFootprintMonitor_onWiFiManagerNotificationPowerStatusChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) powerStatus];

  return [v1 _handlePowerStatusChanged:v2];
}

- (void)_handlePowerStatusChanged:(unint64_t)a3
{
}

- (void)setFootprintState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t footprintState = self->_footprintState;
  if (footprintState != a3)
  {
    self->_int64_t footprintState = a3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = +[RTWiFiFootprintMonitor footprintStateToString:footprintState];
      int v7 = +[RTWiFiFootprintMonitor footprintStateToString:self->_footprintState];
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "footprint state changed from, %@, to, %@.", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [[RTWiFiFootprintStateNotification alloc] initWithFootprintState:self->_footprintState];
    [(RTNotifier *)self postNotification:v8];
  }
}

- (void)fetchConstantFootprintStatusForScanResults:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__RTWiFiFootprintMonitor_fetchConstantFootprintStatusForScanResults_withHandler___block_invoke;
    block[3] = &unk_1E6B92118;
    id v11 = v7;
    block[4] = self;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __81__RTWiFiFootprintMonitor_fetchConstantFootprintStatusForScanResults_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) _footprintStateForScanResults:*(void *)(a1 + 40)];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (int64_t)_footprintStateForScanResults:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-125.0];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke;
  v32[3] = &unk_1E6B958D8;
  id v6 = v5;
  id v33 = v6;
  v34 = v35;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v32];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_2;
  v27[3] = &unk_1E6B95928;
  v29 = v31;
  v30 = v35;
  id v7 = v4;
  id v28 = v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v27];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_4;
  v14[3] = &unk_1E6B95978;
  v14[4] = &v19;
  v14[5] = &v15;
  v14[6] = v35;
  v14[7] = &v23;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];
  unint64_t v8 = v20[3];
  unint64_t v9 = v16[3] + v8;
  if (v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v37 = (double)v8 / (double)v9;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "access point results, overall Duty Cycle, %f", buf, 0xCu);
    }

    BOOL v11 = (double)v8 / (double)v9 > 0.4;
  }
  else
  {
    BOOL v11 = 0;
  }
  int64_t v12 = (unint64_t)v24[3] > 1 && v11;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v35, 8);

  return v12;
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__56;
  v14 = __Block_byref_object_dispose__56;
  id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3153600000.0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_24;
  v9[3] = &unk_1E6B958B0;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  id v7 = [(id)v11[5] laterDate:*(void *)(a1 + 32)];
  int v8 = [v7 isEqualToDate:v11[5]];

  if (v8) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    *a4 = 1;
  }
  _Block_object_dispose(&v10, 8);
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_24(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [v11 date];
  id v5 = [v3 laterDate:v4];
  id v6 = [v11 date];
  int v7 = [v5 isEqualToDate:v6];

  if (v7)
  {
    uint64_t v8 = [v11 date];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24))
  {
    *a4 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_3;
    v7[3] = &unk_1E6B95900;
    id v8 = *(id *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v7];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v13 = v3;
  id v5 = [v3 mac];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [NSNumber numberWithInteger:[v13 rssi]];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 atIndexedSubscript:*(void *)(*(void *)(a1[5] + 8) + 24)];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*(void *)(*(void *)(a1[6] + 8) + 24))
    {
      unint64_t v8 = 0;
      do
      {
        long long v9 = [NSNumber numberWithInteger:500];
        [v7 addObject:v9];

        ++v8;
      }
      while (v8 < *(void *)(*(void *)(a1[6] + 8) + 24));
    }
    uint64_t v10 = [NSNumber numberWithInteger:[v13 rssi]];
    [v7 setObject:v10 atIndexedSubscript:*(void *)(*(void *)(a1[5] + 8) + 24)];

    id v11 = (void *)a1[4];
    uint64_t v12 = [v13 mac];
    [v11 setObject:v7 forKeyedSubscript:v12];
  }
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_5;
  v18[3] = &unk_1E6B95950;
  v18[4] = &v31;
  v18[5] = &v27;
  v18[6] = &v23;
  v18[7] = &v19;
  [v6 enumerateObjectsUsingBlock:v18];
  id v7 = v24;
  *(void *)(*(void *)(a1[4] + 8) + 24) += v24[3];
  *(void *)(*(void *)(a1[5] + 8) + 24) += v20[3];
  uint64_t v8 = v7[3];
  if (v8 >= 1)
  {
    uint64_t v9 = v32[3];
    uint64_t v10 = v28[3];
    unint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    double v13 = (double)v9 / (double)v8;
    double v14 = sqrt((double)v10 / (double)v8 - v13 * v13);
    double v15 = (double)v8 / (double)v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = v24[3];
      uint64_t v17 = v20[3];
      *(_DWORD *)buf = 138413570;
      id v36 = v5;
      __int16 v37 = 2048;
      double v38 = v13;
      __int16 v39 = 2048;
      double v40 = v14;
      __int16 v41 = 1024;
      int v42 = v16;
      __int16 v43 = 1024;
      int v44 = v17;
      __int16 v45 = 2048;
      double v46 = v15;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "access point results, mac, %@, exp, %f, std, %f, valid Samples, %d, invalid Samples, %d, settled Feature, %.2f", buf, 0x36u);
    }

    if (v13 >= -75.0 && v15 >= 0.7 && v24[3] >= 3 && v14 < 5.0) {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_5(void *a1, void *a2)
{
  id v5 = a2;
  if ([v5 integerValue] > 499)
  {
    uint64_t v4 = a1[7];
  }
  else
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) += [v5 integerValue];
    uint64_t v3 = [v5 integerValue];
    *(void *)(*(void *)(a1[5] + 8) + 24) += [v5 integerValue] * v3;
    uint64_t v4 = a1[6];
  }
  ++*(void *)(*(void *)(v4 + 8) + 24);
}

- (void)_checkFootprint
{
  uint64_t v3 = [(RTWiFiFootprintMonitor *)self scanResults];
  [(RTWiFiFootprintMonitor *)self setFootprintState:[(RTWiFiFootprintMonitor *)self _footprintStateForScanResults:v3]];

  [(RTWiFiFootprintMonitor *)self _pruneScanResults];
}

- (void)_processScanResults:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = [v4 count];
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "process %lu scan results", buf, 0xCu);
  }

  id v6 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__RTWiFiFootprintMonitor__processScanResults___block_invoke;
  v9[3] = &unk_1E6B959A0;
  id v7 = v6;
  id v10 = v7;
  [v4 enumerateObjectsUsingBlock:v9];
  if ([v7 count])
  {
    uint64_t v8 = [(RTWiFiFootprintMonitor *)self scanResults];
    [v8 addObject:v7];
  }
  [(RTWiFiFootprintMonitor *)self _checkFootprint];
}

void __46__RTWiFiFootprintMonitor__processScanResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218242;
    uint64_t v9 = a3 + 1;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%lu, %@", (uint8_t *)&v8, 0x16u);
  }

  if ([v5 rssi] >= -84)
  {
    [v5 age];
    if (v7 < 5.0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

- (void)_pruneScanResults
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-125.0];
  id v4 = objc_opt_new();
  id v5 = [(RTWiFiFootprintMonitor *)self scanResults];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke;
  uint64_t v12 = &unk_1E6B90A68;
  id v13 = v3;
  id v14 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v9];

  int v8 = [(RTWiFiFootprintMonitor *)self scanResults];
  [v8 removeObjectsInArray:v6];
}

void __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  int v8 = __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke_2;
  uint64_t v9 = &unk_1E6B90A68;
  id v10 = *(id *)(a1 + 32);
  id v5 = v4;
  id v11 = v5;
  [v3 enumerateObjectsUsingBlock:&v6];
  [v3 removeObjectsInArray:v5, v6, v7, v8, v9];
  if (![v3 count]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 date];
  id v4 = [v3 earlierDate:*(void *)(a1 + 32)];
  id v5 = [v7 date];
  int v6 = [v4 isEqualToDate:v5];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

+ (id)footprintStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B959C0[a3 + 1];
  }
}

- (int64_t)footprintState
{
  return self->_footprintState;
}

- (RTPersistentTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (NSMutableArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);

  objc_storeStrong((id *)&self->_scanTimer, 0);
}

@end