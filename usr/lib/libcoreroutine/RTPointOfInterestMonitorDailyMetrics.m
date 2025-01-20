@interface RTPointOfInterestMonitorDailyMetrics
- (BOOL)shouldSubmit;
- (NSMutableDictionary)metrics;
- (RTDefaultsManager)defaultsManager;
- (RTPointOfInterestMonitorDailyMetrics)init;
- (RTPointOfInterestMonitorDailyMetrics)initWithDefaultsManager:(id)a3;
- (id)description;
- (void)create;
- (void)increaseCountForKey:(id)a3;
- (void)reset;
- (void)submit;
@end

@implementation RTPointOfInterestMonitorDailyMetrics

- (RTPointOfInterestMonitorDailyMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTPointOfInterestMonitorDailyMetrics)initWithDefaultsManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTPointOfInterestMonitorDailyMetrics;
    v6 = [(RTPointOfInterestMonitorDailyMetrics *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
      uint64_t v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableDictionary *)v8;
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
  v3 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v3 removeAllObjects];

  v4 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  [v4 setObject:&unk_1F344F7A8 forKey:@"InstantPOIMetricsArrivalEventCount"];

  id v5 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  [v5 setObject:&unk_1F344F7A8 forKey:@"InstantPOIMetricsBuildingFenceSetupCount"];

  v6 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  [v6 setObject:&unk_1F344F7A8 forKey:@"InstantPOIMetricsHighAccuracyLocationRequestCount"];

  v7 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  [v7 setObject:&unk_1F344F7A8 forKey:@"InstantPOIMetricsBluePOIQueryCount"];

  id v8 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  [v8 setObject:&unk_1F344F7A8 forKey:@"InstantPOIMetricsVisitCount"];
}

- (void)create
{
  v3 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v4 = [v3 objectForKey:@"InstantPOIMetricsArrivalEventCount"];
  uint64_t v5 = [v4 unsignedIntValue];

  v6 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v7 = [v6 objectForKey:@"InstantPOIMetricsBuildingFenceSetupCount"];
  uint64_t v8 = [v7 unsignedIntValue];

  v9 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v10 = [v9 objectForKey:@"InstantPOIMetricsHighAccuracyLocationRequestCount"];
  uint64_t v11 = [v10 unsignedIntValue];

  v12 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  objc_super v13 = [v12 objectForKey:@"InstantPOIMetricsBluePOIQueryCount"];
  uint64_t v14 = [v13 unsignedIntValue];

  v15 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v16 = [v15 objectForKey:@"InstantPOIMetricsVisitCount"];
  uint64_t v17 = [v16 unsignedIntValue];

  v18 = [NSNumber numberWithUnsignedInteger:v5];
  v19 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v19 setObject:v18 forKeyedSubscript:@"arrivalEventCount"];

  v20 = [NSNumber numberWithUnsignedInteger:v8];
  v21 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v21 setObject:v20 forKeyedSubscript:@"buildingFenceSetupCount"];

  v22 = [NSNumber numberWithUnsignedInteger:v11];
  v23 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v23 setObject:v22 forKeyedSubscript:@"highAccuracyLocationRequestCount"];

  v24 = [NSNumber numberWithUnsignedInteger:v14];
  v25 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v25 setObject:v24 forKeyedSubscript:@"bluePOIQueryCount"];

  id v27 = [NSNumber numberWithUnsignedInteger:v17];
  v26 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  [v26 setObject:v27 forKeyedSubscript:@"visitCount"];
}

- (BOOL)shouldSubmit
{
  uint64_t v2 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v3 = [v2 objectForKey:@"InstantPOILastDailyMetricsSubmissonAttemptDate"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-90000.0];
    char v5 = [v3 isAfterDate:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)submit
{
  if ([(RTPointOfInterestMonitorDailyMetrics *)self shouldSubmit])
  {
    [(RTPointOfInterestMonitorDailyMetrics *)self create];
    id v3 = [NSString alloc];
    v4 = (void *)[v3 initWithCString:RTAnalyticsEventPointOfInterestMonitorDaily encoding:1];
    char v5 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
    log_analytics_submission(v4, v5);

    v6 = [NSString stringWithFormat:@"com.apple.%@", v4];
    v7 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
    AnalyticsSendEvent();
  }
  [(RTPointOfInterestMonitorDailyMetrics *)self reset];
  id v9 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setObject:v8 forKey:@"InstantPOILastDailyMetricsSubmissonAttemptDate"];
}

- (void)increaseCountForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v6 unsignedIntValue];

  id v9 = [(RTPointOfInterestMonitorDailyMetrics *)self defaultsManager];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v9 setObject:v8 forKey:v4];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  char v5 = [v3 stringWithFormat:@"RTPointOfInterestMonitorDailyMetrics, %lu, ", [v4 count]];

  v6 = [(RTPointOfInterestMonitorDailyMetrics *)self metrics];
  uint64_t v7 = [v6 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__RTPointOfInterestMonitorDailyMetrics_description__block_invoke;
  v12[3] = &unk_1E6B90A68;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __51__RTPointOfInterestMonitorDailyMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 metrics];
  id v8 = [v5 valueForKey:v4];

  v6 = *(void **)(a1 + 40);
  uint64_t v7 = [NSString stringWithFormat:@"%@, %@, ", v4, v8];

  [v6 appendString:v7];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end