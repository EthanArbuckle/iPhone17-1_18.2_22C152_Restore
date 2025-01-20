@interface RTDeviceMetricManager
+ (id)getDateIntervalFromDictionary:(id)a3;
+ (id)getDictionaryFromDateInterval:(id)a3;
+ (id)getMetricsDictionaryForMetricType:(id)a3 intervals:(id)a4 bins:(id)a5;
+ (id)getReachabilityDefaultStringForTopN:(unint64_t)a3 reachability:(unint64_t)a4;
+ (id)getStringForMetricType:(id)a3 topN:(int64_t)a4;
- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateInterval:(id)a5;
- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateIntervals:(id)a5;
- (BOOL)_submitDeviceMetricsWithError:(id *)a3;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceMetricManager)initWithDefaultsManager:(id)a3 motionActivityManager:(id)a4 reachabilityManager:(id)a5;
- (RTDuetKnowledgeStore)duetKnowledgeStore;
- (RTMotionActivityManager)motionActivityManager;
- (RTReachabilityManager)reachabilityManager;
- (id)_flippedDateIntervalsFromIntervals:(id)a3 originalDateInterval:(id)a4 error:(id *)a5;
- (id)_getDeviceMetricsWithError:(id *)a3;
- (id)_getFromHeapDateIntervalsForReachability:(unint64_t)a3;
- (id)_getLongestIntervalWithStreamType:(int64_t)a3 topN:(unint64_t)a4 dateInterval:(id)a5 flipDateIntervals:(BOOL)a6 error:(id *)a7;
- (id)_getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)getLongestDeviceChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)getLongestDeviceLockedIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)getLongestDeviceNotChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)getLongestWiFiConnectionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_onReachabilityChanged:(id)a3;
- (void)_setup;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onReachabilityChanged:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDuetKnowledgeStore:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setReachabilityManager:(id)a3;
- (void)setup;
@end

@implementation RTDeviceMetricManager

- (RTDeviceMetricManager)initWithDefaultsManager:(id)a3 motionActivityManager:(id)a4 reachabilityManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTDeviceMetricManager;
  v12 = [(RTNotifier *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_defaultsManager, a3);
    v14 = objc_alloc_init(RTDuetKnowledgeStore);
    duetKnowledgeStore = v13->_duetKnowledgeStore;
    v13->_duetKnowledgeStore = v14;

    objc_storeStrong((id *)&v13->_motionActivityManager, a4);
    objc_storeStrong((id *)&v13->_reachabilityManager, a5);
    [(RTDeviceMetricManager *)v13 setup];
  }

  return v13;
}

- (void)setup
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__RTDeviceMetricManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__RTDeviceMetricManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  reachabilityManager = self->_reachabilityManager;
  v4 = +[RTNotification notificationName];
  [(RTNotifier *)reachabilityManager addObserver:self selector:sel_onReachabilityChanged_ name:v4];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

- (void)onReachabilityChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTDeviceMetricManager_onReachabilityChanged___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__RTDeviceMetricManager_onReachabilityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onReachabilityChanged:*(void *)(a1 + 40)];
}

- (void)_onReachabilityChanged:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v5 name];
    int v31 = 138412802;
    v32 = v8;
    __int16 v33 = 2112;
    v34 = v9;
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, received reachability notification, %@", (uint8_t *)&v31, 0x20u);
  }
  id v11 = [v5 name];
  v12 = +[RTNotification notificationName];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    id v14 = v5;
    v15 = [(RTDeviceMetricManager *)self defaultsManager];
    v16 = [v15 objectForKey:@"RTDefaultsDeviceMetricCurrentReachability"];

    objc_super v17 = [(RTDeviceMetricManager *)self defaultsManager];
    v18 = [v17 objectForKey:@"RTDefaultsDeviceMetricCurrentReachabilityStartDate"];

    v19 = [MEMORY[0x1E4F1C9C8] date];
    if (v16 && v18 && [v18 compare:v19] == -1)
    {
      int v20 = [v16 unsignedIntValue];
      if ([v14 reachability] == v20)
      {
LABEL_10:
        v26 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          v29 = NSStringFromSelector(a2);
          v30 = +[RTReachabilityManager reachabilityToString:](RTReachabilityManager, "reachabilityToString:", [v14 reachability]);
          int v31 = 138412802;
          v32 = v28;
          __int16 v33 = 2112;
          v34 = v29;
          __int16 v35 = 2112;
          v36 = v30;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, reachability state, %@", (uint8_t *)&v31, 0x20u);
        }
        goto LABEL_13;
      }
      uint64_t v21 = [v16 unsignedIntValue];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v18 endDate:v19];
      [(RTDeviceMetricManager *)self _addToHeapForReachability:v21 endDate:v19 dateInterval:v22];
    }
    v23 = [(RTDeviceMetricManager *)self defaultsManager];
    v24 = [NSNumber numberWithUnsignedInteger:[v14 reachability]];
    [v23 setObject:v24 forKey:@"RTDefaultsDeviceMetricCurrentReachability"];

    v25 = [(RTDeviceMetricManager *)self defaultsManager];
    [v25 setObject:v19 forKey:@"RTDefaultsDeviceMetricCurrentReachabilityStartDate"];

    goto LABEL_10;
  }
LABEL_13:
}

- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateInterval:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      v16 = "-[RTDeviceMetricManager _addToHeapForReachability:endDate:dateInterval:]";
      __int16 v17 = 1024;
      int v18 = 136;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
  id v11 = objc_opt_new();
  v12 = [(RTDeviceMetricManager *)self _getFromHeapDateIntervalsForReachability:a3];
  [v11 addObjectsFromArray:v12];

  [v11 addObject:v9];
  BOOL v13 = [(RTDeviceMetricManager *)self _addToHeapForReachability:a3 endDate:v8 dateIntervals:v11];

  return v13;
}

- (id)_getFromHeapDateIntervalsForReachability:(unint64_t)a3
{
  id v5 = objc_opt_class();
  id v6 = [(RTDeviceMetricManager *)self defaultsManager];
  v7 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:1 reachability:a3];
  id v8 = [v6 objectForKey:v7];
  id v9 = [v5 getDateIntervalFromDictionary:v8];

  id v10 = objc_opt_class();
  id v11 = [(RTDeviceMetricManager *)self defaultsManager];
  v12 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:2 reachability:a3];
  BOOL v13 = [v11 objectForKey:v12];
  id v14 = [v10 getDateIntervalFromDictionary:v13];

  int v15 = objc_opt_class();
  v16 = [(RTDeviceMetricManager *)self defaultsManager];
  __int16 v17 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:3 reachability:a3];
  int v18 = [v16 objectForKey:v17];
  uint64_t v19 = [v15 getDateIntervalFromDictionary:v18];

  int v20 = objc_opt_new();
  uint64_t v21 = v20;
  if (v9) {
    [v20 addObject:v9];
  }
  if (v14) {
    [v21 addObject:v14];
  }
  if (v19) {
    [v21 addObject:v19];
  }

  return v21;
}

- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateIntervals:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[RTDeviceMetricManager _addToHeapForReachability:endDate:dateIntervals:]";
      __int16 v41 = 1024;
      int v42 = 177;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateIntervals (in %s:%d)", buf, 0x12u);
    }
  }
  id v11 = [v8 dateByAddingTimeInterval:-86400.0];
  v12 = (void *)MEMORY[0x1E4F28F60];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __73__RTDeviceMetricManager__addToHeapForReachability_endDate_dateIntervals___block_invoke;
  v35[3] = &unk_1E6B95EB8;
  id v13 = v11;
  id v36 = v13;
  id v34 = v8;
  id v37 = v34;
  id v14 = [v12 predicateWithBlock:v35];
  int v15 = [v9 filteredArrayUsingPredicate:v14];

  v16 = (void *)MEMORY[0x1E4F29008];
  __int16 v17 = [NSString stringWithFormat:@"self.%@", @"duration"];
  int v18 = [v16 sortDescriptorWithKey:v17 ascending:0];
  v38 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  int v20 = [v15 sortedArrayUsingDescriptors:v19];

  if ([v20 count])
  {
    uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v21 = 0;
  }
  if ((unint64_t)[v20 count] < 2)
  {
    v22 = 0;
  }
  else
  {
    v22 = [v20 objectAtIndexedSubscript:1];
  }
  if ((unint64_t)[v20 count] < 3)
  {
    v23 = 0;
  }
  else
  {
    v23 = [v20 objectAtIndexedSubscript:2];
  }
  v24 = [(RTDeviceMetricManager *)self defaultsManager];
  v25 = [(id)objc_opt_class() getDictionaryFromDateInterval:v21];
  v26 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:1 reachability:a3];
  [v24 setObject:v25 forKey:v26];

  v27 = [(RTDeviceMetricManager *)self defaultsManager];
  v28 = [(id)objc_opt_class() getDictionaryFromDateInterval:v22];
  v29 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:2 reachability:a3];
  [v27 setObject:v28 forKey:v29];

  v30 = [(RTDeviceMetricManager *)self defaultsManager];
  int v31 = [(id)objc_opt_class() getDictionaryFromDateInterval:v23];
  v32 = [(id)objc_opt_class() getReachabilityDefaultStringForTopN:3 reachability:a3];
  [v30 setObject:v31 forKey:v32];

  return 1;
}

BOOL __73__RTDeviceMetricManager__addToHeapForReachability_endDate_dateIntervals___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 endDate];
  uint64_t v6 = [v4 compare:v5];
  if (v6 != -1)
  {
    v7 = *(void **)(a1 + 32);
    id v4 = [v3 endDate];
    if ([v7 compare:v4])
    {
      BOOL v8 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  id v9 = [v3 endDate];
  if ([v9 compare:*(void *)(a1 + 40)])
  {
    id v10 = [v3 endDate];
    BOOL v8 = [v10 compare:*(void *)(a1 + 40)] == -1;
  }
  else
  {
    BOOL v8 = 1;
  }

  if (v6 != -1) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

+ (id)getDateIntervalFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [NSString stringWithFormat:@"%@", @"startDate"];
  id v5 = [NSString stringWithFormat:@"%@", @"endDate"];
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:v4];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = (void *)v6;
  BOOL v8 = [v3 objectForKeyedSubscript:v5];
  if (v8)
  {
    id v9 = [v3 objectForKeyedSubscript:v4];
    id v10 = [v3 objectForKeyedSubscript:v5];
    uint64_t v11 = [v9 compare:v10];

    if (v11 != -1)
    {
LABEL_5:
      BOOL v8 = 0;
      goto LABEL_8;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
    v7 = [v3 objectForKeyedSubscript:v4];
    id v13 = [v3 objectForKeyedSubscript:v5];
    BOOL v8 = (void *)[v12 initWithStartDate:v7 endDate:v13];
  }
LABEL_8:

  return v8;
}

+ (id)getDictionaryFromDateInterval:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = NSString;
    id v4 = a3;
    id v5 = [v3 stringWithFormat:@"%@", @"startDate"];
    v11[0] = v5;
    uint64_t v6 = [v4 startDate];
    v12[0] = v6;
    v7 = [NSString stringWithFormat:@"%@", @"endDate"];
    v11[1] = v7;
    BOOL v8 = [v4 endDate];

    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)getReachabilityDefaultStringForTopN:(unint64_t)a3 reachability:(unint64_t)a4
{
  id v5 = NSString;
  uint64_t v6 = +[RTReachabilityManager reachabilityToString:a4];
  v7 = [v5 stringWithFormat:@"RTDefaultsDeviceMetricTop%lu%@", a3, v6];

  return v7;
}

- (id)getLongestDeviceChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    id v23 = [MEMORY[0x1E4F1C978] array];
    id v9 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__RTDeviceMetricManager_getLongestDeviceChargingIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E6B95EE0;
    int v15 = &v18;
    block[4] = self;
    unint64_t v17 = a3;
    id v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

void __86__RTDeviceMetricManager_getLongestDeviceChargingIntervalsWithTopN_dateInterval_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getLongestIntervalWithStreamType:0 topN:v4 dateInterval:v3 flipDateIntervals:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getLongestDeviceNotChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    id v23 = [MEMORY[0x1E4F1C978] array];
    id v9 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__RTDeviceMetricManager_getLongestDeviceNotChargingIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E6B95EE0;
    int v15 = &v18;
    block[4] = self;
    unint64_t v17 = a3;
    id v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

void __89__RTDeviceMetricManager_getLongestDeviceNotChargingIntervalsWithTopN_dateInterval_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getLongestIntervalWithStreamType:0 topN:v4 dateInterval:v3 flipDateIntervals:1 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getLongestDeviceLockedIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    id v23 = [MEMORY[0x1E4F1C978] array];
    id v9 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__RTDeviceMetricManager_getLongestDeviceLockedIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E6B95EE0;
    int v15 = &v18;
    block[4] = self;
    unint64_t v17 = a3;
    id v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

void __84__RTDeviceMetricManager_getLongestDeviceLockedIntervalsWithTopN_dateInterval_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getLongestIntervalWithStreamType:1 topN:v4 dateInterval:v3 flipDateIntervals:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getLongestWiFiConnectionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    id v23 = [MEMORY[0x1E4F1C978] array];
    id v9 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__RTDeviceMetricManager_getLongestWiFiConnectionIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E6B95EE0;
    int v15 = &v18;
    block[4] = self;
    unint64_t v17 = a3;
    id v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

void __86__RTDeviceMetricManager_getLongestWiFiConnectionIntervalsWithTopN_dateInterval_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getLongestIntervalWithStreamType:3 topN:v4 dateInterval:v3 flipDateIntervals:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    id v23 = [MEMORY[0x1E4F1C978] array];
    id v9 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__RTDeviceMetricManager_getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E6B95EE0;
    int v15 = &v18;
    block[4] = self;
    unint64_t v17 = a3;
    id v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

void __88__RTDeviceMetricManager_getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getLongestStationaryMotionIntervalsWithTopN:v4 dateInterval:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v81 = a4;
  if (v81)
  {
    unint64_t v76 = a3;
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__63;
    v99 = __Block_byref_object_dispose__63;
    id v100 = 0;
    v75 = [MEMORY[0x1E4F1C978] array];
    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__63;
    v93 = __Block_byref_object_dispose__63;
    id v94 = [MEMORY[0x1E4F1C978] array];
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [(RTDeviceMetricManager *)self motionActivityManager];
    id v9 = [v81 startDate];
    id v10 = [v81 endDate];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __89__RTDeviceMetricManager__getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke;
    v85[3] = &unk_1E6B905F0;
    v87 = &v89;
    v88 = &v95;
    uint64_t v11 = v7;
    v86 = v11;
    [v8 fetchMotionActivitiesFromStartDate:v9 endDate:v10 handler:v85];

    dsema = v11;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v13))
    {
      id v14 = [MEMORY[0x1E4F1C9C8] now];
      [v14 timeIntervalSinceDate:v12];
      double v16 = v15;
      unint64_t v17 = objc_opt_new();
      uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_47];
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
      uint64_t v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      id v23 = (void *)MEMORY[0x1E4F28C58];
      v115[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v115 count:1];
      id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

      if (v25)
      {
        id v25 = v25;
      }
    }
    else
    {
      id v25 = 0;
    }

    id v28 = v25;
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v73 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v33 = [v81 startDate:v28];
      id v34 = [v81 endDate];
      uint64_t v35 = [(id)v90[5] count];
      *(_DWORD *)buf = 138413826;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v103 = 2112;
      id v104 = v32;
      __int16 v105 = 2112;
      v106 = @"Motion Activity";
      __int16 v107 = 2048;
      unint64_t v108 = v76;
      __int16 v109 = 2112;
      v110 = v33;
      __int16 v111 = 2112;
      v112 = v34;
      __int16 v113 = 2048;
      uint64_t v114 = v35;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, StreamType, %@, topN, %lu, startDate, %@, endDate, %@, fetchedMotionActivities count, %lu", buf, 0x48u);
    }
    id v36 = [v81 endDate];
    v83 = [v36 dateByAddingTimeInterval:-86400.0];

    v82 = objc_opt_new();
    for (uint64_t i = 1; ; ++i)
    {
      if (i - 1 >= objc_msgSend((id)v90[5], "count", v73) - 1)
      {
        if ([(id)v90[5] count])
        {
          v52 = [(id)v90[5] lastObject];
          BOOL v53 = [v52 type] == 1;

          if (v53)
          {
            v54 = NSNumber;
            v55 = [v81 endDate];
            v56 = [(id)v90[5] lastObject];
            v57 = [v56 startDate];
            [v55 timeIntervalSinceDate:v57];
            v58 = [v54 numberWithDouble:x0];
            [v82 addObject:v58];
          }
        }
        v59 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
        v101 = v59;
        v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
        [v82 sortUsingDescriptors:v60];

        unint64_t v61 = [v82 count];
        if (v61 >= v76) {
          unint64_t v62 = v76;
        }
        else {
          unint64_t v62 = v61;
        }
        [v82 subarrayWithRange:0, v62];
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(&v89, 8);
        v63 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          id v65 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v67 = [(__CFString *)v27 count];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v65;
          __int16 v103 = 2112;
          id v104 = v66;
          __int16 v105 = 2048;
          v106 = (__CFString *)v67;
          _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%@, %@, output intervals count, %lu, ", buf, 0x20u);
        }
        v68 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v69 = (objc_class *)objc_opt_class();
          NSStringFromClass(v69);
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          v71 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v70;
          __int16 v103 = 2112;
          id v104 = v71;
          __int16 v105 = 2112;
          v106 = v27;
          _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, output intervals, %@, ", buf, 0x20u);
        }
        if (a5) {
          *a5 = (id) v96[5];
        }
        _Block_object_dispose(&v95, 8);

        goto LABEL_39;
      }
      v38 = (void *)MEMORY[0x1E016D870]();
      v39 = [(id)v90[5] objectAtIndexedSubscript:i];
      v40 = [v39 startDate];
      uint64_t v41 = [v83 compare:v40];
      if (v41 == -1
        || ([(id)v90[5] objectAtIndexedSubscript:i],
            v84 = objc_claimAutoreleasedReturnValue(),
            [v84 startDate],
            uint64_t v5 = objc_claimAutoreleasedReturnValue(),
            ![v83 compare:v5]))
      {
        uint64_t v43 = [(id)v90[5] objectAtIndexedSubscript:i - 1];
        uint64_t v44 = [v43 type];
        BOOL v45 = v41 == -1;
        BOOL v42 = v44 == 1;

        if (v45)
        {

          if (v44 != 1) {
            goto LABEL_25;
          }
LABEL_24:
          v46 = NSNumber;
          v47 = [(id)v90[5] objectAtIndexedSubscript:i];
          v48 = [v47 startDate];
          v49 = [(id)v90[5] objectAtIndexedSubscript:i - 1];
          v50 = [v49 startDate];
          [v48 timeIntervalSinceDate:v50];
          v51 = [v46 numberWithDouble:x0];
          [v82 addObject:v51];

          goto LABEL_25;
        }
      }
      else
      {
        BOOL v42 = 0;
      }

      if (v42) {
        goto LABEL_24;
      }
LABEL_25:
    }
  }
  uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"dateInterval");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = [MEMORY[0x1E4F1C978] array];
LABEL_39:

  return v27;
}

void __89__RTDeviceMetricManager__getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLongestIntervalWithStreamType:(int64_t)a3 topN:(unint64_t)a4 dateInterval:(id)a5 flipDateIntervals:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v65 = a5;
  if (v65)
  {
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__63;
    uint64_t v89 = __Block_byref_object_dispose__63;
    id v90 = 0;
    id v69 = (id)objc_opt_new();
    context = (void *)MEMORY[0x1E016D870]();
    id v10 = [RTDuetKnowledgeStream alloc];
    id v11 = [(RTDeviceMetricManager *)self duetKnowledgeStore];
    v63 = [(RTDuetKnowledgeStream *)v10 initWithDuetKnowledgeStore:v11 streamType:a3];

    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__63;
    v83 = __Block_byref_object_dispose__63;
    id v84 = [MEMORY[0x1E4F1C978] array];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke;
    v78[3] = &unk_1E6B95F08;
    v78[4] = &v85;
    v78[5] = &v79;
    [(RTDuetKnowledgeStream *)v63 enumerateEventsWithinDateInterval:v65 usingBlock:v78];
    if (v7)
    {
      uint64_t v12 = v80[5];
      dispatch_time_t v13 = (id *)(v86 + 5);
      id obj = (id)v86[5];
      uint64_t v14 = [(RTDeviceMetricManager *)self _flippedDateIntervalsFromIntervals:v12 originalDateInterval:v65 error:&obj];
      objc_storeStrong(v13, obj);
      double v15 = (void *)v80[5];
      v80[5] = v14;
    }
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unint64_t v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = +[RTDuetKnowledgeStream streamTypeToString:a3];
      uint64_t v21 = [v65 startDate];
      v22 = [v65 endDate];
      uint64_t v23 = [(id)v80[5] count];
      *(_DWORD *)buf = 138413826;
      id v94 = v18;
      __int16 v95 = 2112;
      id v96 = v19;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)v20;
      __int16 v99 = 2048;
      unint64_t v100 = a4;
      __int16 v101 = 2112;
      v102 = v21;
      __int16 v103 = 2112;
      id v104 = v22;
      __int16 v105 = 2048;
      uint64_t v106 = v23;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, %@, StreamType, %@, topN, %lu, startDate, %@, endDate, %@, fetchedDateIntervals count, %lu", buf, 0x48u);
    }
    v24 = [v65 endDate];
    id v25 = [v24 dateByAddingTimeInterval:-86400.0];

    uint64_t v26 = (void *)v80[5];
    v27 = (void *)MEMORY[0x1E4F28F60];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke_73;
    v74[3] = &unk_1E6B95EB8;
    id v60 = v25;
    id v75 = v60;
    id v76 = v65;
    id v28 = [v27 predicateWithBlock:v74];
    uint64_t v29 = [v26 filteredArrayUsingPredicate:v28];
    v30 = (void *)v80[5];
    v80[5] = v29;

    id v31 = (void *)MEMORY[0x1E4F29008];
    id v32 = [NSString stringWithFormat:@"self.%@", @"duration"];
    unint64_t v62 = [v31 sortDescriptorWithKey:v32 ascending:0];

    __int16 v33 = (void *)v80[5];
    v92 = v62;
    id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    uint64_t v35 = [v33 sortedArrayUsingDescriptors:v34];
    id v36 = (void *)v80[5];
    v80[5] = v35;

    id v37 = (void *)v80[5];
    unint64_t v38 = [v37 count];
    if (v38 >= a4) {
      unint64_t v39 = a4;
    }
    else {
      unint64_t v39 = v38;
    }
    v40 = [v37 subarrayWithRange:0, v39];
    uint64_t v41 = (void *)v80[5];
    v80[5] = 0;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v68 = v40;
    uint64_t v42 = [v68 countByEnumeratingWithState:&v70 objects:v91 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v71 != v43) {
            objc_enumerationMutation(v68);
          }
          BOOL v45 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v46 = (void *)MEMORY[0x1E016D870]();
          v47 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v50 = (objc_class *)objc_opt_class();
            NSStringFromClass(v50);
            id v51 = (id)objc_claimAutoreleasedReturnValue();
            v52 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v94 = v51;
            __int16 v95 = 2112;
            id v96 = v52;
            __int16 v97 = 2112;
            uint64_t v98 = (uint64_t)v45;
            _os_log_debug_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_DEBUG, "%@, %@, interval, %@, ", buf, 0x20u);
          }
          v48 = NSNumber;
          [v45 duration];
          v49 = [v48 numberWithDouble:x0];
          [v69 addObject:v49];
        }
        uint64_t v42 = [v68 countByEnumeratingWithState:&v70 objects:v91 count:16];
      }
      while (v42);
    }

    BOOL v53 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v57 = [v69 count];
      *(_DWORD *)buf = 138412802;
      id v94 = v55;
      __int16 v95 = 2112;
      id v96 = v56;
      __int16 v97 = 2048;
      uint64_t v98 = v57;
      _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, %@, output intervals count, %lu, ", buf, 0x20u);
    }
    _Block_object_dispose(&v79, 8);

    if (a7) {
      *a7 = (id) v86[5];
    }
    _Block_object_dispose(&v85, 8);
  }
  else
  {
    v58 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v69 = [MEMORY[0x1E4F1C978] array];
  }

  return v69;
}

void __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    *a4 = 1;
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v10 = v7;
  }
  else
  {
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = v13;
  }
  id v11 = v10;
  uint64_t v12 = *v9;
  *uint64_t v9 = v11;
}

BOOL __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 endDate];
  uint64_t v6 = [v4 compare:v5];
  if (v6 != -1)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 endDate];
    if ([v7 compare:v4])
    {
      BOOL v8 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  uint64_t v9 = [v3 endDate];
  id v10 = [*(id *)(a1 + 40) endDate];
  if ([v9 compare:v10])
  {
    id v11 = [v3 endDate];
    uint64_t v12 = [*(id *)(a1 + 40) endDate];
    BOOL v8 = [v11 compare:v12] == -1;
  }
  else
  {
    BOOL v8 = 1;
  }

  if (v6 != -1) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (id)_flippedDateIntervalsFromIntervals:(id)a3 originalDateInterval:(id)a4 error:(id *)a5
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateIntervals", buf, 2u);
    }

    if (!a5) {
      goto LABEL_22;
    }
    v48 = @"dateIntervals";
    goto LABEL_21;
  }
  if (!v8)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: originalDateInterval", buf, 2u);
    }

    if (!a5) {
      goto LABEL_22;
    }
    v48 = @"originalDateInterval";
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    id v10 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_23;
  }
  id v10 = objc_opt_new();
  if ([v7 count])
  {
    id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v53[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
    v53[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    id v14 = (id)[v7 sortedArrayUsingDescriptors:v13];

    double v15 = [v9 startDate];
    double v16 = [v7 firstObject];
    unint64_t v17 = [v16 startDate];
    uint64_t v18 = [v15 compare:v17];

    if (v18 == -1)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v20 = [v9 startDate];
      uint64_t v21 = [v7 firstObject];
      v22 = [v21 startDate];
      uint64_t v23 = (void *)[v19 initWithStartDate:v20 endDate:v22];
      [v10 addObject:v23];
    }
    id v51 = v9;
    if ([v7 count] >= 2)
    {
      uint64_t v24 = 0;
      do
      {
        id v25 = (void *)MEMORY[0x1E016D870]();
        uint64_t v26 = [v7 objectAtIndexedSubscript:v24];
        v27 = [v26 endDate];
        uint64_t v28 = v24 + 1;
        uint64_t v29 = [v7 objectAtIndexedSubscript:v24 + 1];
        v30 = [v29 startDate];
        uint64_t v31 = [v27 compare:v30];

        if (v31 == -1)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
          __int16 v33 = [v7 objectAtIndexedSubscript:v24];
          id v34 = [v33 endDate];
          uint64_t v35 = [v7 objectAtIndexedSubscript:v28];
          id v36 = [v35 startDate];
          id v37 = (void *)[v32 initWithStartDate:v34 endDate:v36];
          [v10 addObject:v37];
        }
        uint64_t v24 = v28;
      }
      while (v28 < [v7 count] - 1);
    }
    unint64_t v38 = [v7 lastObject];
    unint64_t v39 = [v38 endDate];
    uint64_t v9 = v51;
    v40 = [v51 endDate];
    uint64_t v41 = [v39 compare:v40];

    if (v41 == -1)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v43 = [v7 lastObject];
      uint64_t v44 = [v43 endDate];
      BOOL v45 = [v51 endDate];
      v46 = (void *)[v42 initWithStartDate:v44 endDate:v45];
      [v10 addObject:v46];
    }
  }
LABEL_23:

  return v10;
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTDeviceMetricManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__RTDeviceMetricManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  char v7 = [v6 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v5 name];
      int v16 = 138412802;
      unint64_t v17 = v14;
      __int16 v18 = 2080;
      id v19 = "-[RTDeviceMetricManager _onDailyMetricsNotification:]";
      __int16 v20 = 1024;
      int v21 = 565;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);
    }
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    int v16 = 138412546;
    unint64_t v17 = v10;
    __int16 v18 = 2112;
    id v19 = (const char *)v5;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v16, 0x16u);
  }
  id v11 = [v5 name];
  char v12 = [v11 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v12)
  {
    [(RTDeviceMetricManager *)self _submitDeviceMetricsWithError:0];
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v15 = [v5 name];
      int v16 = 138412290;
      unint64_t v17 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)_submitDeviceMetricsWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v5 = [(RTDeviceMetricManager *)self _getDeviceMetricsWithError:&v16];
  id v6 = v16;
  char v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v5 count];
    *(_DWORD *)buf = 138412802;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics of length, %lu", buf, 0x20u);
  }
  id v12 = [NSString alloc];
  id v13 = (void *)[v12 initWithCString:RTAnalyticsEventInactivityDeviceMetrics encoding:1];
  log_analytics_submission(v13, v5);
  id v14 = [NSString stringWithFormat:@"com.apple.%@", v13];
  AnalyticsSendEvent();

  if (a3) {
    *a3 = v6;
  }

  return v6 == 0;
}

- (id)_getDeviceMetricsWithError:(id *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  char v7 = [v5 dateByAddingTimeInterval:-2419200.0];
  id v8 = (void *)[v6 initWithStartDate:v7 endDate:v5];

  uint64_t v9 = objc_opt_new();
  id v10 = 0;
  char v11 = 1;
  while (1)
  {
    if ((v11 & 1) == 0)
    {
LABEL_28:
      if (!a3) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    id v12 = (void *)MEMORY[0x1E016D870]();
    id v73 = v10;
    id v13 = [(RTDeviceMetricManager *)self _getLongestIntervalWithStreamType:1 topN:3 dateInterval:v8 flipDateIntervals:0 error:&v73];
    id v14 = v73;

    if (v14) {
      break;
    }
    id v72 = 0;
    unint64_t v61 = [(RTDeviceMetricManager *)self _getLongestIntervalWithStreamType:0 topN:3 dateInterval:v8 flipDateIntervals:0 error:&v72];
    id v15 = v72;
    if (v15)
    {
      id v10 = v15;
      int v16 = 2;
    }
    else
    {
      id v71 = 0;
      id v60 = [(RTDeviceMetricManager *)self _getLongestIntervalWithStreamType:0 topN:3 dateInterval:v8 flipDateIntervals:1 error:&v71];
      id v17 = v71;
      if (v17)
      {
        id v10 = v17;
        int v16 = 2;
      }
      else
      {
        id v70 = 0;
        uint64_t v59 = [(RTDeviceMetricManager *)self _getLongestIntervalWithStreamType:3 topN:3 dateInterval:v8 flipDateIntervals:0 error:&v70];
        id v10 = v70;
        if (v10)
        {
          int v16 = 2;
          __int16 v18 = (void *)v59;
        }
        else
        {
          v52 = v13;
          BOOL v53 = v12;
          id v55 = v8;
          id v56 = v9;
          uint64_t v57 = a3;
          v58 = v5;
          __int16 v19 = [(RTDeviceMetricManager *)self _getFromHeapDateIntervalsForReachability:0];
          __int16 v20 = objc_opt_new();
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v67 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                v27 = (void *)MEMORY[0x1E016D870]();
                uint64_t v28 = NSNumber;
                [v26 duration];
                uint64_t v29 = [v28 numberWithDouble:];
                [v20 addObject:v29];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v66 objects:v75 count:16];
            }
            while (v23);
          }
          id v51 = v21;

          v54 = self;
          v30 = [(RTDeviceMetricManager *)self _getFromHeapDateIntervalsForReachability:2];
          uint64_t v31 = objc_opt_new();
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v32 = v30;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v63 != v35) {
                  objc_enumerationMutation(v32);
                }
                id v37 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                unint64_t v38 = (void *)MEMORY[0x1E016D870]();
                unint64_t v39 = NSNumber;
                [v37 duration];
                v40 = [v39 numberWithDouble:];
                [v31 addObject:v40];
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v62 objects:v74 count:16];
            }
            while (v34);
          }

          uint64_t v41 = +[RTMetric binsFromStart:&unk_1F3450FA8 toEnd:&unk_1F3453888 gap:&unk_1F3453898];
          v50 = +[RTMetric binsFromStart:&unk_1F3450FA8 toEnd:&unk_1F34538A8 gap:&unk_1F3453898];
          self = v54;
          id v13 = v52;
          id v42 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"lock" intervals:v52 bins:v41];
          [v56 addEntriesFromDictionary:v42];

          uint64_t v43 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"on_charge" intervals:v61 bins:v41];
          [v56 addEntriesFromDictionary:v43];

          uint64_t v44 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"not_on_charge" intervals:v60 bins:v41];
          [v56 addEntriesFromDictionary:v44];

          BOOL v45 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"wifi_connectivity" intervals:v59 bins:v41];
          [v56 addEntriesFromDictionary:v45];

          v46 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"static_motion" intervals:MEMORY[0x1E4F1CBF0] bins:v50];
          [v56 addEntriesFromDictionary:v46];

          v47 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"no_connectivity" intervals:v20 bins:v41];
          [v56 addEntriesFromDictionary:v47];

          v48 = [(id)objc_opt_class() getMetricsDictionaryForMetricType:@"cell_connectivity" intervals:v31 bins:v41];
          uint64_t v9 = v56;
          [v56 addEntriesFromDictionary:v48];

          id v5 = v58;
          __int16 v18 = (void *)v59;
          int v16 = 0;
          a3 = v57;
          id v8 = v55;
          id v12 = v53;
          id v10 = 0;
        }
      }
    }

    char v11 = 0;
    if (v16) {
      goto LABEL_28;
    }
  }

  id v10 = v14;
  if (a3) {
LABEL_29:
  }
    *a3 = v10;
LABEL_30:

  return v9;
}

+ (id)getStringForMetricType:(id)a3 topN:(int64_t)a4
{
  return (id)[NSString stringWithFormat:@"longest_interval_%lu_device_%@", a4, a3];
}

+ (id)getMetricsDictionaryForMetricType:(id)a3 intervals:(id)a4 bins:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      id v10 = [MEMORY[0x1E4F1CA60] dictionary];
      goto LABEL_13;
    }
    __int16 v21 = 0;
    id v17 = "Invalid parameter not satisfying: deviceMetricType";
    __int16 v18 = (uint8_t *)&v21;
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_12;
  }
  if (!v8)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v20 = 0;
    id v17 = "Invalid parameter not satisfying: intervals";
    __int16 v18 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  id v10 = objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v12 = (void *)MEMORY[0x1E016D870]();
    if ([v8 count] >= (unint64_t)(i + 1))
    {
      id v13 = [v8 objectAtIndexedSubscript:i];
      id v14 = +[RTMetric binForNumber:v13 bins:v9];
      id v15 = [(id)objc_opt_class() getStringForMetricType:v7 topN:i + 1];
      [v10 setObject:v14 forKeyedSubscript:v15];
    }
    else
    {
      id v13 = +[RTMetric binForNumber:&unk_1F3450FC0 bins:v9];
      id v14 = [(id)objc_opt_class() getStringForMetricType:v7 topN:i + 1];
      [v10 setObject:v13 forKeyedSubscript:v14];
    }
  }
LABEL_13:

  return v10;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDuetKnowledgeStore)duetKnowledgeStore
{
  return self->_duetKnowledgeStore;
}

- (void)setDuetKnowledgeStore:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_duetKnowledgeStore, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end