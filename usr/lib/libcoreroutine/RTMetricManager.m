@interface RTMetricManager
+ (double)doubleWithSignificantDigits:(double)a3 digits:(int)a4;
+ (id)metricForType:(unint64_t)a3;
+ (id)productionMetrics;
+ (int)doubleToInt:(double)a3 shifts:(int)a4;
+ (int)intWithSignificantDigits:(int)a3 digits:(int)a4;
+ (int)roundTimeInterval:(double)a3 byIntervalUnit:(unint64_t)a4;
- (AWDServerConnection)awdServerConnection;
- (BOOL)_routineConfiguredForMetric:(id)a3;
- (BOOL)setupWithConfiguredClasses:(id)a3 platform:(id)a4 error:(id *)a5;
- (NSArray)configuredMetricClasses;
- (RTManagedConfiguration)managedConfigurationManager;
- (RTMetricManager)init;
- (RTMetricManager)initWithAWDServerConnection:(id)a3 configuredClasses:(id)a4 managedConfigurationManager:(id)a5 platform:(id)a6 xpcActivityManager:(id)a7;
- (RTMetricManager)initWithPlatform:(id)a3 xpcActivityManager:(id)a4;
- (RTPlatform)platform;
- (RTXPCActivityManager)xpcActivityManager;
- (id)createMetricForType:(unint64_t)a3;
- (void)_fetchDiagnosticsEnabled:(id)a3;
- (void)_registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4;
- (void)_releaseMetricPlaceholderForMetric:(id)a3 withHandler:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)_submitMetric:(id)a3 withHandler:(id)a4;
- (void)fetchDiagnosticsEnabled:(id)a3;
- (void)registerForXPCActivities:(id)a3;
- (void)registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4;
- (void)setAwdServerConnection:(id)a3;
- (void)setConfiguredMetricClasses:(id)a3;
- (void)setManagedConfigurationManager:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)submitMetric:(id)a3;
- (void)submitMetric:(id)a3 withHandler:(id)a4;
@end

@implementation RTMetricManager

- (RTMetricManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_xpcActivityManager_);
}

- (RTMetricManager)initWithPlatform:(id)a3 xpcActivityManager:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FB7060];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithComponentId:44 andBlockOnConfiguration:1];
  v10 = +[RTMetricManager productionMetrics];
  v11 = objc_opt_new();
  v12 = [(RTMetricManager *)self initWithAWDServerConnection:v9 configuredClasses:v10 managedConfigurationManager:v11 platform:v8 xpcActivityManager:v7];

  return v12;
}

- (RTMetricManager)initWithAWDServerConnection:(id)a3 configuredClasses:(id)a4 managedConfigurationManager:(id)a5 platform:(id)a6 xpcActivityManager:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = v17;
  if (!v14)
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: configuredClasses";
LABEL_22:
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_23;
  }
  if (!v15)
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: managedConfigurationManager";
    goto LABEL_22;
  }
  if (!v16)
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: platform";
    goto LABEL_22;
  }
  if (!v17)
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_22;
    }
LABEL_23:

    v27 = 0;
    goto LABEL_24;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTMetricManager;
  v19 = [(RTNotifier *)&v34 init];
  if (v19)
  {
    id v32 = v13;
    uint64_t v20 = [v14 copy];
    configuredMetricClasses = v19->_configuredMetricClasses;
    v19->_configuredMetricClasses = (NSArray *)v20;

    v22 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = [v14 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v36 = v31;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "Configured metric manager with %lu classes, %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v19->_managedConfigurationManager, a5);
    objc_storeStrong((id *)&v19->_awdServerConnection, a3);
    objc_storeStrong((id *)&v19->_platform, a6);
    objc_storeStrong((id *)&v19->_xpcActivityManager, a7);
    v23 = [(RTMetricManager *)v19 configuredMetricClasses];
    platform = v19->_platform;
    id v33 = 0;
    [(RTMetricManager *)v19 setupWithConfiguredClasses:v23 platform:platform error:&v33];
    id v25 = v33;

    id v13 = v32;
    if (v25)
    {
      v26 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v25;
        _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "error configuring metric manager, %@", buf, 0xCu);
      }
    }
    [(RTMetricManager *)v19 registerForXPCActivities:v19->_xpcActivityManager];
  }
  self = v19;
  v27 = self;
LABEL_24:

  return v27;
}

+ (id)productionMetrics
{
  v4[20] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:20];

  return v2;
}

- (void)fetchDiagnosticsEnabled:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__RTMetricManager_fetchDiagnosticsEnabled___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTMetricManager fetchDiagnosticsEnabled:]";
      __int16 v11 = 1024;
      int v12 = 123;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __43__RTMetricManager_fetchDiagnosticsEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDiagnosticsEnabled:*(void *)(a1 + 40)];
}

- (void)_fetchDiagnosticsEnabled:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v5 = [(RTMetricManager *)self managedConfigurationManager];
    v4[2](v4, [v5 effectiveBoolValueForSetting:@"RTFeatureDiagnosticsSubmissionAllowed"]);
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[RTMetricManager _fetchDiagnosticsEnabled:]";
      __int16 v8 = 1024;
      int v9 = 136;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (BOOL)setupWithConfiguredClasses:(id)a3 platform:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = objc_opt_new();
  int v10 = [v8 internalInstall];

  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__RTMetricManager_setupWithConfiguredClasses_platform_error___block_invoke;
    v14[3] = &unk_1E6B90B78;
    id v15 = v9;
    [v7 enumerateObjectsUsingBlock:v14];
  }
  __int16 v11 = _RTSafeArray();
  int v12 = _RTMultiErrorCreate();

  if (a5) {
    *a5 = v12;
  }

  return v12 == 0;
}

void __61__RTMetricManager_setupWithConfiguredClasses_platform_error___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (([(objc_class *)v3 conformsToProtocol:&unk_1F34BFDD8] & 1) == 0)
  {
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v4 = NSString;
    v5 = NSStringFromClass(v3);
    int v6 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    id v7 = [v4 stringWithFormat:@"Class %@ does not conform to %@", v5, v6];
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTMetricManagerErrorDomain" code:11 userInfo:v8];
    [*(id *)(a1 + 32) addObject:v9];
  }
}

- (void)registerForXPCActivities:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    int v6 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:1 priority:1 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:86400.0 powerNap:60.0];
    [(RTXPCActivityCriteria *)v6 setCpuIntensive:1];
    objc_initWeak(location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__RTMetricManager_registerForXPCActivities___block_invoke;
    v7[3] = &unk_1E6B928D0;
    v8[1] = (id)a2;
    objc_copyWeak(v8, location);
    [v5 registerActivityWithIdentifier:@"com.apple.routined.metrics.daily" criteria:v6 handler:v7];
    objc_destroyWeak(v8);
    objc_destroyWeak(location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    int v6 = (RTXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", (uint8_t *)location, 2u);
    }
  }
}

void __44__RTMetricManager_registerForXPCActivities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v10 = WeakRetained;
    if (WeakRetained)
    {
      __int16 v11 = [WeakRetained queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__RTMetricManager_registerForXPCActivities___block_invoke_87;
      v15[3] = &unk_1E6B90CE0;
      v15[4] = v10;
      id v16 = v5;
      dispatch_async(v11, v15);
    }
    else
    {
      int v12 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "self was nil during daily metric activity, returning", buf, 2u);
      }

      if (v5)
      {
        uint64_t v17 = *MEMORY[0x1E4F28568];
        v18 = @"self was nil during daily metric activity";
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTMetricManagerErrorDomain" code:0 userInfo:v13];
        v5[2](v5, v14);
      }
    }
  }
}

uint64_t __44__RTMetricManager_registerForXPCActivities___block_invoke_87(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"RTMetricManagerDailyMetricNotification" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(RTMetricManager *)self awdServerConnection];

  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "Flushing remaining metrics to AWD.", buf, 2u);
    }

    id v8 = [(RTMetricManager *)self awdServerConnection];
    int v9 = dispatch_get_global_queue(2, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__RTMetricManager__shutdownWithHandler___block_invoke;
    v15[3] = &unk_1E6B90E70;
    uint64_t v10 = v6;
    id v16 = v10;
    [v8 flushToQueue:v9 block:v15];

    __int16 v11 = v10;
    int v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v11, v13))
    {
      id v14 = [MEMORY[0x1E4F1C9C8] now];
      [v14 timeIntervalSinceDate:v12];
    }
  }
  if (v4) {
    v4[2](v4, 0);
  }
}

intptr_t __40__RTMetricManager__shutdownWithHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTMetricManager_registerQueriableMetric_withHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __55__RTMetricManager_registerQueriableMetric_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerQueriableMetric:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 40)];
}

- (void)_registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, unint64_t, void *, void))a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v37 = "-[RTMetricManager _registerQueriableMetric:withHandler:]";
      __int16 v38 = 1024;
      int v39 = 257;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v8 = +[RTMetricManager metricForType:a3];
  uint64_t v9 = [v8 metricId];
  id v10 = [(RTMetricManager *)self awdServerConnection];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35 = @"Failed metric submission because routined didn't have a connection to awdd.";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v18 = [v16 errorWithDomain:@"RTMetricManagerErrorDomain" code:3 userInfo:v17];
    v6[2](v6, a3, v18, 0);

    v19 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v37 = (const char *)@"Failed metric submission because routined didn't have a connection to awdd.";
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    int v12 = [(RTMetricManager *)self awdServerConnection];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke;
    v27 = &unk_1E6B92D78;
    objc_copyWeak(v29, &location);
    int v30 = v9;
    dispatch_time_t v13 = v6;
    id v28 = v13;
    v29[1] = (id)a3;
    int v14 = [v12 registerQueriableMetric:v9 callback:&v24];

    if (v14)
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v9;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Queriable Metric (%u) is registered.", buf, 8u);
      }
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"AWD registerQueriableMetric failure (%d)", v9, v24, v25, v26, v27];
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      id v33 = v15;
      __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v22 = [v20 errorWithDomain:@"RTMetricManagerErrorDomain" code:9 userInfo:v21];
      v13[2](v13, a3, v22, 0);

      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v37 = (const char *)v15;
        _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }
}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke(uint64_t a1, int a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2;
    v11[3] = &unk_1E6B92D50;
    int v8 = *(_DWORD *)(a1 + 56);
    int v14 = a2;
    int v15 = v8;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(void **)(a1 + 48);
    id v12 = v9;
    v13[1] = v10;
    objc_copyWeak(v13, v4);
    dispatch_async(v7, v11);

    objc_destroyWeak(v13);
  }
}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2(int32x2_t *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    __int32 v3 = a1[7].i32[0];
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Registered Metric (%u) is triggered.", buf, 8u);
  }

  uint64_t v4 = a1[7].u32[1];
  if (a1[7].i32[0] == v4)
  {
    int32x2_t v5 = a1[6];
    int32x2_t v6 = a1[4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_93;
    v14[3] = &unk_1E6B92D28;
    objc_copyWeak(v15, (id *)&a1[5]);
    v15[2] = (id)vrev64_s32(a1[7]);
    v15[1] = (id)a1[6];
    (*(void (**)(int32x2_t, int32x2_t, void, void *))(*(void *)&v6 + 16))(v6, v5, 0, v14);
    objc_destroyWeak(v15);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"triggered metricId (%d) is not what we registered (%d)", a1[7].u32[0], v4];
    int32x2_t v8 = a1[4];
    int32x2_t v9 = a1[6];
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = v7;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v12 = [v10 errorWithDomain:@"RTMetricManagerErrorDomain" code:8 userInfo:v11];
    (*(void (**)(int32x2_t, int32x2_t, void *, void))(*(void *)&v8 + 16))(v8, v9, v12, 0);

    dispatch_time_t v13 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v11 = [WeakRetained queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2_94;
  v16[3] = &unk_1E6B92D00;
  v16[4] = WeakRetained;
  id v17 = v8;
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v9;
  uint64_t v20 = v12;
  id v18 = v7;
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v11, v16);
}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2_94(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (*(void *)(a1 + 40))
    {
      __int32 v3 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v15 = *(_DWORD *)(a1 + 76);
        id v16 = [*(id *)(a1 + 40) localizedDescription];
        *(_DWORD *)buf = 67109378;
        LODWORD(v18[0]) = v15;
        WORD2(v18[0]) = 2112;
        *(void *)((char *)v18 + 6) = v16;
        _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "A queriable metric is not submitted. %u (%@)", buf, 0x12u);
      }
      uint64_t v4 = *(void **)(a1 + 32);
      int32x2_t v5 = +[RTMetricManager metricForType:*(void *)(a1 + 64)];
      [v4 _releaseMetricPlaceholderForMetric:v5 withHandler:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      [v2 _submitMetric:v13 withHandler:v14];
    }
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"RTMetricManager swelf is nil metricId (%d)", *(unsigned int *)(a1 + 72)];
    id v7 = (void *)v6;
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = v6;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      BOOL v11 = [v9 errorWithDomain:@"RTMetricManagerErrorDomain" code:9 userInfo:v10];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
    }
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18[0] = v7;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (void)_releaseMetricPlaceholderForMetric:(id)a3 withHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(RTMetricManager *)self awdServerConnection];

  if (v8)
  {
    uint64_t v9 = [v6 metricId];
    id v10 = [(RTMetricManager *)self awdServerConnection];
    BOOL v11 = (void *)[v10 newMetricContainerWithIdentifier:v9];

    if (!v11)
    {
      [NSString stringWithFormat:@"Failed metric submission because AWD was not configured to accept the metric id %u.", v9];
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v18;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (v7)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        int v30 = v18;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v22 = [v20 errorWithDomain:@"RTMetricManagerErrorDomain" code:4 userInfo:v21];
        v7[2](v7, v22);
      }
      BOOL v11 = 0;
      goto LABEL_22;
    }
    [v11 setMetric:v6];
    uint64_t v12 = [(RTMetricManager *)self awdServerConnection];
    char v13 = [v12 submitMetric:v11];

    if (v13)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = v9;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "AWD placeholder is released %u, success!", buf, 8u);
      }

      if (v7) {
        v7[2](v7, 0);
      }
      goto LABEL_22;
    }
    id v17 = [NSString stringWithFormat:@"AWD placeholder may be not released %u, failed!", v9];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (v7)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v28 = v17;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v26 = [v24 errorWithDomain:@"RTMetricManagerErrorDomain" code:6 userInfo:v25];
      v7[2](v7, v26);
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  int v15 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = @"Failed metric submission because routined didn't have a connection to awdd.";
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  if (v7)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v32 = @"Failed metric submission because routined didn't have a connection to awdd.";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v17 = [v16 errorWithDomain:@"RTMetricManagerErrorDomain" code:3 userInfo:v11];
    v7[2](v7, v17);
    goto LABEL_21;
  }
LABEL_23:
}

- (void)submitMetric:(id)a3
{
}

- (void)submitMetric:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTMetricManager_submitMetric_withHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __44__RTMetricManager_submitMetric_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitMetric:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)_submitMetric:(id)a3 withHandler:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = [(RTMetricManager *)self awdServerConnection];

  if (!v8)
  {
    uint64_t v14 = @"Failed metric submission because routined didn't have a connection to awdd.";
    uint64_t v30 = 3;
LABEL_18:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = v14;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    id v12 = [v31 errorWithDomain:@"RTMetricManagerErrorDomain" code:v30 userInfo:v32];

    if (v7) {
      v7[2](v7, v12);
    }
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    goto LABEL_23;
  }
  if (!v6)
  {
    uint64_t v14 = @"Failed metric submission because the metric was nil.";
    uint64_t v30 = 1;
    goto LABEL_18;
  }
  if (![(RTMetricManager *)self _routineConfiguredForMetric:v6])
  {
    uint64_t v14 = @"Failed metric submission because the metric was not an AWD metric.";
    uint64_t v30 = 2;
    goto LABEL_18;
  }
  id v9 = [(RTMetricManager *)self managedConfigurationManager];
  char v10 = [v9 effectiveBoolValueForSetting:@"RTFeatureDiagnosticsSubmissionAllowed"];

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = @"Failed metric submission because Diagnostics and Usage is disabled.";
    uint64_t v30 = 5;
    goto LABEL_18;
  }
  id v39 = 0;
  char v11 = [v6 valid:&v39];
  id v12 = v39;
  if (v11)
  {
    id v13 = [(RTMetricManager *)self awdServerConnection];
    uint64_t v14 = (__CFString *)[v13 newMetricContainerWithIdentifier:[v6 metricId]];

    if (v14)
    {
      [(__CFString *)v14 setMetric:v6];
      int v15 = [(RTMetricManager *)self awdServerConnection];
      char v16 = [v15 submitMetric:v14];

      if (v7)
      {
        if ((v16 & 1) == 0)
        {
          id v17 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          id v18 = NSString;
          uint64_t v19 = (objc_class *)objc_opt_class();
          uint64_t v20 = NSStringFromClass(v19);
          uint64_t v21 = [v18 stringWithFormat:@"Submitted metric type %@, failed!", v20];
          v41 = v21;
          id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          uint64_t v23 = [v17 errorWithDomain:@"RTMetricManagerErrorDomain" code:6 userInfo:v22];

          id v12 = (id)v23;
        }
        v7[2](v7, v12);
      }
      uint64_t v24 = (uint64_t)v12;
      if (!v12)
      {
        id v12 = 0;
        goto LABEL_23;
      }
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138412290;
      id v45 = v27;
      id v28 = "Submitted metric type %@, failed!";
      uint64_t v29 = v25;
    }
    else
    {
      uint64_t v34 = NSString;
      uint64_t v35 = (objc_class *)objc_opt_class();
      uint64_t v36 = NSStringFromClass(v35);
      uint64_t v25 = [v34 stringWithFormat:@"Failed metric submission because AWD was not configured to accept the metric type %@.", v36];

      __int16 v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = v25;
      __int16 v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      uint64_t v24 = [v37 errorWithDomain:@"RTMetricManagerErrorDomain" code:4 userInfo:v38];

      if (v7) {
        v7[2](v7, (id)v24);
      }
      uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      id v45 = v25;
      id v28 = "%@";
      uint64_t v29 = v27;
    }
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
LABEL_31:

LABEL_32:
    id v12 = (id)v24;
    goto LABEL_23;
  }
  if (v7) {
    v7[2](v7, v12);
  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v12;
    _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Error during metric validation, %@", buf, 0xCu);
  }
LABEL_23:
}

- (BOOL)_routineConfiguredForMetric:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int32x2_t v5 = [(RTMetricManager *)self configuredMetricClasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int32x2_t v5 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Metric manager is not configured for %@", buf, 0xCu);
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (id)createMetricForType:(unint64_t)a3
{
  return +[RTMetricManager metricForType:a3];
}

+ (id)metricForType:(unint64_t)a3
{
  if (a3 > 0x13)
  {
    int32x2_t v5 = 0;
  }
  else
  {
    int32x2_t v5 = [objc_alloc(**((Class **)&unk_1E6B92D98 + a3)) _init:v3];
  }
  return v5;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (NSArray)configuredMetricClasses
{
  return self->_configuredMetricClasses;
}

- (void)setConfiguredMetricClasses:(id)a3
{
}

- (AWDServerConnection)awdServerConnection
{
  return self->_awdServerConnection;
}

- (void)setAwdServerConnection:(id)a3
{
}

- (RTManagedConfiguration)managedConfigurationManager
{
  return self->_managedConfigurationManager;
}

- (void)setManagedConfigurationManager:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_managedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_awdServerConnection, 0);
  objc_storeStrong((id *)&self->_configuredMetricClasses, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

+ (int)roundTimeInterval:(double)a3 byIntervalUnit:(unint64_t)a4
{
  if (a4) {
    return (int)(a3 / (double)(int)a4) * a4;
  }
  else {
    return (int)(a3 * 1000.0);
  }
}

+ (int)doubleToInt:(double)a3 shifts:(int)a4
{
  return (int)(__exp10((double)a4) * a3);
}

+ (int)intWithSignificantDigits:(int)a3 digits:(int)a4
{
  +[RTMetricManager doubleWithSignificantDigits:*(void *)&a4 digits:(double)a3];
  return (int)v4;
}

+ (double)doubleWithSignificantDigits:(double)a3 digits:(int)a4
{
  double result = 0.0;
  if (a3 != 0.0 && a4 >= 1)
  {
    double v8 = -a3;
    if (a3 >= 0.0) {
      double v8 = a3;
    }
    double v9 = log10(v8);
    double v10 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v9)));
    return (double)(uint64_t)round(v10 * a3) / v10;
  }
  return result;
}

@end