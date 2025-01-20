@interface RTDailyTrainingSessionCounter
- (BOOL)shouldSubmitMetrics;
- (NSMutableArray)metrics;
- (RTDailyTrainingSessionCounter)init;
- (RTDailyTrainingSessionCounter)initWithDefaultsManager:(id)a3;
- (RTDefaultsManager)defaultsManager;
- (id)compoundKeyForMode:(unint64_t)a3 reason:(unint64_t)a4;
- (id)description;
- (id)modeAndReasonFromCompoundKey:(id)a3;
- (void)createMetrics;
- (void)increaseCountForMode:(unint64_t)a3 reason:(unint64_t)a4;
- (void)reset;
- (void)submitMetrics;
@end

@implementation RTDailyTrainingSessionCounter

- (RTDailyTrainingSessionCounter)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTDailyTrainingSessionCounter)initWithDefaultsManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTDailyTrainingSessionCounter;
    v6 = [(RTDailyTrainingSessionCounter *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
      uint64_t v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableArray *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)reset
{
  v3 = [(RTDailyTrainingSessionCounter *)self metrics];
  [v3 removeAllObjects];

  id v9 = (id)objc_opt_new();
  v4 = [(RTDailyTrainingSessionCounter *)self compoundKeyForMode:1 reason:1];
  [v9 setObject:&unk_1F34528B0 forKey:v4];

  id v5 = [(RTDailyTrainingSessionCounter *)self compoundKeyForMode:1 reason:2];
  [v9 setObject:&unk_1F34528B0 forKey:v5];

  v6 = [(RTDailyTrainingSessionCounter *)self compoundKeyForMode:2 reason:1];
  [v9 setObject:&unk_1F34528B0 forKey:v6];

  v7 = [(RTDailyTrainingSessionCounter *)self compoundKeyForMode:2 reason:2];
  [v9 setObject:&unk_1F34528B0 forKey:v7];

  uint64_t v8 = [(RTDailyTrainingSessionCounter *)self defaultsManager];
  [v8 setObject:v9 forKey:@"TrainDailyMetricsTrainingSessionCount"];
}

- (void)createMetrics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(RTDailyTrainingSessionCounter *)self defaultsManager];
  v4 = [v3 objectForKey:@"TrainDailyMetricsTrainingSessionCount"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = -[RTDailyTrainingSessionCounter modeAndReasonFromCompoundKey:](self, "modeAndReasonFromCompoundKey:", v10, (void)v17);
        v12 = [v5 objectForKey:v10];
        objc_super v13 = objc_opt_new();
        v14 = [v11 firstObject];
        [v13 setObject:v14 forKey:@"trainingMode"];

        v15 = [v11 secondObject];
        [v13 setObject:v15 forKey:@"trainingReason"];

        [v13 setObject:v12 forKey:@"traningSessionCount"];
        v16 = [(RTDailyTrainingSessionCounter *)self metrics];
        [v16 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (BOOL)shouldSubmitMetrics
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(RTDailyTrainingSessionCounter *)self defaultsManager];
  v4 = [v3 objectForKey:@"LearnedLocationEngineTrainDailyMetricsSubmissonAttemptDate"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-90000.0];
    int v6 = [v4 isAfterDate:v5];
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    if (v6) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    v12 = objc_opt_new();
    objc_super v13 = [v12 stringFromDate];
    v14 = [v4 stringFromDate];
    int v16 = 138413314;
    long long v17 = v9;
    __int16 v18 = 2112;
    long long v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, shouldSubmit, %@, current date, %@, last attempt date, %@", (uint8_t *)&v16, 0x34u);
  }
  return v6;
}

- (void)submitMetrics
{
  v3 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(RTDailyTrainingSessionCounter *)self shouldSubmitMetrics])
  {
    [(RTDailyTrainingSessionCounter *)v3 createMetrics];
    v4 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      int v6 = NSStringFromClass(v5);
      uint64_t v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(RTDailyTrainingSessionCounter *)v3 metrics];
      *(_DWORD *)buf = 138412802;
      v27 = v6;
      __int16 v28 = 2112;
      v29 = v7;
      __int16 v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics, %@", buf, 0x20u);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v20 = v3;
    id v9 = [(RTDailyTrainingSessionCounter *)v3 metrics];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          id v15 = [NSString alloc];
          int v16 = (void *)[v15 initWithCString:RTAnalyticsEventVisitTrainingDaily encoding:1];
          log_analytics_submission(v16, v14);
          long long v17 = [NSString stringWithFormat:@"com.apple.%@", v16];
          AnalyticsSendEvent();

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    v3 = v20;
  }
  [(RTDailyTrainingSessionCounter *)v3 reset];
  __int16 v18 = [(RTDailyTrainingSessionCounter *)v3 defaultsManager];
  long long v19 = [MEMORY[0x1E4F1C9C8] now];
  [v18 setObject:v19 forKey:@"LearnedLocationEngineTrainDailyMetricsSubmissonAttemptDate"];
}

- (void)increaseCountForMode:(unint64_t)a3 reason:(unint64_t)a4
{
  uint64_t v7 = [(RTDailyTrainingSessionCounter *)self defaultsManager];
  id v15 = [v7 objectForKey:@"TrainDailyMetricsTrainingSessionCount"];

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
  id v9 = [(RTDailyTrainingSessionCounter *)self compoundKeyForMode:a3 reason:a4];
  uint64_t v10 = [v8 objectForKey:v9];

  if (!v10) {
    [v8 setObject:&unk_1F34528B0 forKey:v9];
  }
  uint64_t v11 = [v8 objectForKey:v9];
  uint64_t v12 = [v11 unsignedIntValue];

  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12 + 1];
  [v8 setObject:v13 forKey:v9];

  v14 = [(RTDailyTrainingSessionCounter *)self defaultsManager];
  [v14 setObject:v8 forKey:@"TrainDailyMetricsTrainingSessionCount"];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(RTDailyTrainingSessionCounter *)self metrics];
  id v5 = [v3 stringWithFormat:@"RTLearnedLocationEngineTrainDailyMetrics, %lu\n\n", [v4 count]];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(RTDailyTrainingSessionCounter *)self metrics];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allKeys];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__RTDailyTrainingSessionCounter_description__block_invoke;
        v14[3] = &unk_1E6B90A68;
        v14[4] = self;
        id v11 = v5;
        id v15 = v11;
        [v10 enumerateObjectsUsingBlock:v14];

        [v11 appendString:@"\n\n"];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

void __44__RTDailyTrainingSessionCounter_description__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 metrics];
  id v8 = [v5 valueForKey:v4];

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [NSString stringWithFormat:@"%@, %@, ", v4, v8];

  [v6 appendString:v7];
}

- (id)compoundKeyForMode:(unint64_t)a3 reason:(unint64_t)a4
{
  return (id)[NSString stringWithFormat:@"%lu-%lu", a3, a4];
}

- (id)modeAndReasonFromCompoundKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"-"];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = (int)[v6 intValue];

  id v8 = [v5 lastObject];
  uint64_t v9 = (int)[v8 intValue];

  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromSelector(a2);
    int v17 = 138413058;
    long long v18 = v11;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, compound key, %@, mode, %lu, reason, %lu", (uint8_t *)&v17, 0x2Au);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F5CE58]);
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v7];
  v14 = [NSNumber numberWithUnsignedInteger:v9];
  id v15 = (void *)[v12 initWithFirstObject:v13 secondObject:v14];

  return v15;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end