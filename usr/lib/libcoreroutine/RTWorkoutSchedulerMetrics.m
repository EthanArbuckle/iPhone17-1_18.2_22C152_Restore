@interface RTWorkoutSchedulerMetrics
+ (id)metricsTaskTypeToString:(unint64_t)a3;
- (NSMutableDictionary)metricsDictionary;
- (RTDefaultsManager)defaultsManager;
- (RTManagedConfiguration)managedConfiguration;
- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3;
- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3 managedConfiguration:(id)a4;
- (id)supportedTaskKeys;
- (unint64_t)memoryFootprintDeferredSchedulerDailyCount;
- (unsigned)isDeviceEligible;
- (void)collectDailyMetrics;
- (void)createTaskMetricsDictionary:(id)a3;
- (void)dealloc;
- (void)incrementMetricDefaultForKey:(id)a3;
- (void)onDailyMetricNotification:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setIsDeviceEligible:(unsigned __int8)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMemoryFootprintDeferredSchedulerDailyCount:(unint64_t)a3;
- (void)setMetricsDictionary:(id)a3;
- (void)setup;
- (void)startCollectMetricsTaskType:(unint64_t)a3 totalNAtStart:(int64_t)a4;
- (void)stopCollectMetricsTaskType:(unint64_t)a3;
- (void)submitDailyMetricsToCoreAnalytics:(id)a3;
- (void)submitTaskMetricsToCoreAnalytics:(id)a3;
@end

@implementation RTWorkoutSchedulerMetrics

+ (id)metricsTaskTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"RTWorkoutSchedulerMetricsTaskTypeUnknown";
  }
  else {
    return off_1E6B98AA8[a3 - 1];
  }
}

- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(RTWorkoutSchedulerMetrics *)self initWithDefaultsManager:v4 managedConfiguration:v5];

  return v6;
}

- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3 managedConfiguration:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTWorkoutSchedulerMetrics;
    v7 = [(RTWorkoutSchedulerMetrics *)&v14 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_defaultsManager, a3);
      uint64_t v9 = objc_opt_new();
      managedConfiguration = v8->_managedConfiguration;
      v8->_managedConfiguration = (RTManagedConfiguration *)v9;

      [(RTWorkoutSchedulerMetrics *)v8 setup];
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setup
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_onDailyMetricNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  id v4 = (id)objc_opt_new();
  [(RTWorkoutSchedulerMetrics *)self setMetricsDictionary:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"RTMetricManagerDailyMetricNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)RTWorkoutSchedulerMetrics;
  [(RTWorkoutSchedulerMetrics *)&v4 dealloc];
}

- (void)incrementMetricDefaultForKey:(id)a3
{
  id v4 = a3;
  v5 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v9 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
  v8 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v9 setObject:v8 forKey:v4];
}

- (void)onDailyMetricNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v14 = [v4 name];
      int v15 = 138412802;
      v16 = v14;
      __int16 v17 = 2080;
      v18 = "-[RTWorkoutSchedulerMetrics onDailyMetricNotification:]";
      __int16 v19 = 1024;
      int v20 = 111;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  v8 = [v4 name];
  char v9 = [v8 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v9 & 1) == 0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v4 name];
      int v15 = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
  v10 = [(RTWorkoutSchedulerMetrics *)self managedConfiguration];
  char v11 = [v10 isHealthDataSubmissionAllowed];

  if ((v11 & 1) == 0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v15, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  [(RTWorkoutSchedulerMetrics *)self collectDailyMetrics];
LABEL_13:
}

- (id)supportedTaskKeys
{
  return &unk_1F34530C0;
}

- (void)collectDailyMetrics
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];
  [v3 setObject:v4 forKeyedSubscript:@"isDeviceEligible"];

  v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];
  LOBYTE(v4) = [v5 BOOLValue];

  if (v4)
  {
    char v6 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount"];
    [v3 setObject:v6 forKeyedSubscript:@"memoryFootprintDeferralDailyCount"];

    uint64_t v7 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount"];
    [v3 setObject:v7 forKeyedSubscript:@"backoffTimerDeferralDailyCount"];

    [(RTWorkoutSchedulerMetrics *)self supportedTaskKeys];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v13 = +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", +[RTWorkoutSchedulerMetricsTask taskTypeForDefaultsKey:v12]);
          [v3 setObject:v13 forKeyedSubscript:@"taskType"];

          objc_super v14 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];
          [v3 setObject:v14 forKeyedSubscript:@"isDeviceEligible"];

          int v15 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:v12];

          if (v15)
          {
            v16 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:v12];
            [v3 setObject:v16 forKeyedSubscript:@"taskRunDailyCount"];
          }
          else
          {
            [v3 setObject:&unk_1F3451530 forKeyedSubscript:@"taskRunDailyCount"];
          }
          [(RTWorkoutSchedulerMetrics *)self submitDailyMetricsToCoreAnalytics:v3];
          [(RTDefaultsManager *)self->_defaultsManager setObject:&unk_1F3451530 forKey:v12];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    __int16 v17 = objc_opt_new();
    [(RTWorkoutSchedulerMetrics *)self setMetricsDictionary:v17];

    v18 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
    [v18 setObject:&unk_1F3451530 forKey:@"RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount"];

    __int16 v19 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
    [v19 setObject:&unk_1F3451530 forKey:@"RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount"];
  }
  else
  {
    [(RTWorkoutSchedulerMetrics *)self submitDailyMetricsToCoreAnalytics:v3];
  }
}

- (void)startCollectMetricsTaskType:(unint64_t)a3 totalNAtStart:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(RTWorkoutSchedulerMetrics *)self managedConfiguration];
  char v9 = [v8 isHealthDataSubmissionAllowed];

  if (v9)
  {
    uint64_t v10 = +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:a3];
    char v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      objc_super v14 = NSStringFromSelector(a2);
      int v24 = 138412802;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v24, 0x20u);
    }
    int v15 = [(RTWorkoutSchedulerMetrics *)self metricsDictionary];
    v16 = [v15 objectForKey:v10];

    if (!v16)
    {
      __int16 v17 = [RTWorkoutSchedulerMetricsTask alloc];
      v18 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
      v16 = [(RTWorkoutSchedulerMetricsTask *)v17 initWithTaskType:a3 defaultsManager:v18];
    }
    __int16 v19 = [MEMORY[0x1E4F1C9C8] now];
    [(RTWorkoutSchedulerMetricsTask *)v16 setTaskStart:v19];

    +[RTRuntime footprint];
    [(RTWorkoutSchedulerMetricsTask *)v16 setMemoryFootprintAtStart:(unint64_t)v20];
    long long v21 = [(RTWorkoutSchedulerMetrics *)self defaultsManager];
    long long v22 = [v21 objectForKey:@"RTDefaultsWorkoutSchedulerTopNWorkoutsKey"];
    -[RTWorkoutSchedulerMetricsTask setCurrentNAtStart:](v16, "setCurrentNAtStart:", [v22 unsignedIntegerValue]);

    [(RTWorkoutSchedulerMetricsTask *)v16 setTotalNAtStart:a4];
    long long v23 = [(RTWorkoutSchedulerMetrics *)self metricsDictionary];
    [v23 setObject:v16 forKey:v10];
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v24, 2u);
    }
  }
}

- (void)stopCollectMetricsTaskType:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v6 = [(RTWorkoutSchedulerMetrics *)self managedConfiguration];
  char v7 = [v6 isHealthDataSubmissionAllowed];

  if (v7)
  {
    uint64_t v8 = +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:a3];
    char v9 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      char v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      int v18 = 138412802;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      long long v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v8;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v18, 0x20u);
    }
    v13 = [(RTWorkoutSchedulerMetrics *)self metricsDictionary];
    objc_super v14 = [v13 objectForKey:v8];

    int v15 = [MEMORY[0x1E4F1C9C8] now];
    [v14 setTaskFinish:v15];

    +[RTRuntime footprint];
    [v14 setMemoryFootprintAtFinish:(unint64_t)v16];
    __int16 v17 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerTopNWorkoutsKey"];
    [v14 setCurrentNAtFinish:[v17 unsignedIntegerValue]];

    [(RTWorkoutSchedulerMetrics *)self createTaskMetricsDictionary:v14];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)createTaskMetricsDictionary:(id)a3
{
  id v32 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = +[RTMetric binsFromStart:&unk_1F3451530 toEnd:&unk_1F3451548 gap:&unk_1F3451560];
  char v6 = +[RTMetric binsFromStart:&unk_1F3451530 toEnd:&unk_1F3451578 gap:&unk_1F3451560];
  char v7 = [NSNumber numberWithUnsignedInteger:[v32 currentNAtStart]];
  uint64_t v8 = +[RTMetric binForNumber:v7 bins:v6];
  [v4 setObject:v8 forKeyedSubscript:@"currentNAtStart"];

  char v9 = [NSNumber numberWithUnsignedInteger:[v32 currentNAtFinish]];
  uint64_t v10 = +[RTMetric binForNumber:v9 bins:v6];
  [v4 setObject:v10 forKeyedSubscript:@"currentNAtFinish"];

  char v11 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerWorldBuildStartTimeKey"];
  uint64_t v12 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"];
  if (v12
    && ([MEMORY[0x1E4F1C9C8] distantPast],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v12 isEqualToDate:v13],
        v13,
        (v14 & 1) == 0))
  {
    [v12 timeIntervalSinceDate:v11];
    double v16 = [NSNumber numberWithDouble:];
    __int16 v17 = +[RTMetric binForNumber:v16 bins:v5];
    [v4 setObject:v17 forKeyedSubscript:@"worldBuildDuration"];

    uint64_t v15 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
  }
  [v4 setObject:v15 forKeyedSubscript:@"worldBuildIsFinished"];
  int v18 = [v32 taskFinish];
  __int16 v19 = [v32 taskStart];
  [v18 timeIntervalSinceDate:v19];
  double v21 = v20;

  __int16 v22 = +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", [v32 taskType]);
  [v4 setObject:v22 forKeyedSubscript:@"taskType"];

  long long v23 = [NSNumber numberWithDouble:v21];
  uint64_t v24 = +[RTMetric binForNumber:v23 bins:v5];
  [v4 setObject:v24 forKeyedSubscript:@"taskDuration"];

  v25 = [NSNumber numberWithUnsignedInteger:[v32 memoryFootprintAtStart]];
  __int16 v26 = +[RTMetric binForNumber:v25 bins:v6];
  [v4 setObject:v26 forKeyedSubscript:@"memoryFootprintAtStart"];

  v27 = [NSNumber numberWithUnsignedInteger:[v32 memoryFootprintAtFinish]];
  __int16 v28 = +[RTMetric binForNumber:v27 bins:v6];
  [v4 setObject:v28 forKeyedSubscript:@"memoryFootprintAtFinish"];

  v29 = [NSNumber numberWithInteger:[v32 totalNAtStart]];
  [v4 setObject:v29 forKeyedSubscript:@"totalNAtStart"];

  uint64_t v30 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];
  [v4 setObject:v30 forKeyedSubscript:@"isDeviceEligible"];

  [v32 setTaskRunDailyCount:[v32 taskRunDailyCount] + 1];
  v31 = [NSNumber numberWithUnsignedInteger:[v32 taskRunDailyCount]];
  [v4 setObject:v31 forKeyedSubscript:@"taskRunDailyCount"];

  [v32 resetTaskState];
  [(RTWorkoutSchedulerMetrics *)self submitTaskMetricsToCoreAnalytics:v4];
}

- (void)submitDailyMetricsToCoreAnalytics:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v7 = (id)[v5 initWithCString:RTAnalyticsEventWorkoutSchedulerDaily encoding:1];
  log_analytics_submission(v7, v4);
  char v6 = [NSString stringWithFormat:@"com.apple.%@", v7];
  AnalyticsSendEvent();
}

- (void)submitTaskMetricsToCoreAnalytics:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v7 = (id)[v5 initWithCString:RTAnalyticsEventWorkoutScheduler encoding:1];
  log_analytics_submission(v7, v4);
  char v6 = [NSString stringWithFormat:@"com.apple.%@", v7];
  AnalyticsSendEvent();
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (NSMutableDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (void)setMetricsDictionary:(id)a3
{
}

- (unsigned)isDeviceEligible
{
  return self->_isDeviceEligible;
}

- (void)setIsDeviceEligible:(unsigned __int8)a3
{
  self->_isDeviceEligible = a3;
}

- (unint64_t)memoryFootprintDeferredSchedulerDailyCount
{
  return self->_memoryFootprintDeferredSchedulerDailyCount;
}

- (void)setMemoryFootprintDeferredSchedulerDailyCount:(unint64_t)a3
{
  self->_memoryFootprintDeferredSchedulerDailyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end