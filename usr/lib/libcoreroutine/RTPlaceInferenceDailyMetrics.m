@interface RTPlaceInferenceDailyMetrics
- (BOOL)shouldSubmit;
- (NSMutableDictionary)metrics;
- (RTDefaultsManager)defaultsManager;
- (RTPlaceInferenceDailyMetrics)init;
- (RTPlaceInferenceDailyMetrics)initWithDefaultsManager:(id)a3;
- (id)description;
- (id)getClientKeyForDailyMetrics:(int)a3;
- (id)getClientKeyForDefaultManager:(int)a3;
- (void)create;
- (void)increaseCountForClientMappingIndex:(int)a3;
- (void)reset;
- (void)submit;
@end

@implementation RTPlaceInferenceDailyMetrics

- (void)increaseCountForClientMappingIndex:(int)a3
{
  id v9 = [(RTPlaceInferenceDailyMetrics *)self getClientKeyForDefaultManager:*(void *)&a3];
  v4 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
  v5 = [v4 objectForKey:v9];
  uint64_t v6 = [v5 unsignedIntValue];

  v7 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
  v8 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  [v7 setObject:v8 forKey:v9];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (id)getClientKeyForDefaultManager:(int)a3
{
  return [@"PlaceInferenceMetricsClientQueryCount" stringByAppendingFormat:@"%d", *(void *)&a3];
}

- (RTPlaceInferenceDailyMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTPlaceInferenceDailyMetrics)initWithDefaultsManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTPlaceInferenceDailyMetrics;
    uint64_t v6 = [(RTPlaceInferenceDailyMetrics *)&v13 init];
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
  v3 = [(RTPlaceInferenceDailyMetrics *)self metrics];
  [v3 removeAllObjects];

  uint64_t v4 = 0;
  do
  {
    id v5 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
    uint64_t v6 = [(RTPlaceInferenceDailyMetrics *)self getClientKeyForDefaultManager:v4];
    [v5 setObject:&unk_1F3451998 forKey:v6];

    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 20);
}

- (void)create
{
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
    id v5 = [(RTPlaceInferenceDailyMetrics *)self getClientKeyForDefaultManager:v3];
    uint64_t v6 = [v4 objectForKey:v5];
    uint64_t v7 = [v6 unsignedIntValue];

    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
    id v9 = [(RTPlaceInferenceDailyMetrics *)self metrics];
    v10 = [(RTPlaceInferenceDailyMetrics *)self getClientKeyForDailyMetrics:v3];
    [v9 setObject:v8 forKeyedSubscript:v10];

    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 20);
}

- (BOOL)shouldSubmit
{
  uint64_t v2 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
  uint64_t v3 = [v2 objectForKey:@"PlaceInferenceLastDailyMetricsSubmissionAttemptDate"];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-90000.0];
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
  if ([(RTPlaceInferenceDailyMetrics *)self shouldSubmit])
  {
    [(RTPlaceInferenceDailyMetrics *)self create];
    id v3 = [NSString alloc];
    uint64_t v4 = (void *)[v3 initWithCString:RTAnalyticsEventPlaceInferenceQueryDaily encoding:1];
    char v5 = [(RTPlaceInferenceDailyMetrics *)self metrics];
    log_analytics_submission(v4, v5);

    uint64_t v6 = [NSString stringWithFormat:@"com.apple.%@", v4];
    uint64_t v7 = [(RTPlaceInferenceDailyMetrics *)self metrics];
    AnalyticsSendEvent();
  }
  [(RTPlaceInferenceDailyMetrics *)self reset];
  id v9 = [(RTPlaceInferenceDailyMetrics *)self defaultsManager];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setObject:v8 forKey:@"PlaceInferenceLastDailyMetricsSubmissionAttemptDate"];
}

- (id)getClientKeyForDailyMetrics:(int)a3
{
  return (id)[@"clientQueryCount" stringByAppendingFormat:@"%d", *(void *)&a3];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(RTPlaceInferenceDailyMetrics *)self metrics];
  char v5 = [v3 stringWithFormat:@"RTPlaceInferenceDailyMetrics count, %lu", [v4 count]];

  uint64_t v6 = [(RTPlaceInferenceDailyMetrics *)self metrics];
  uint64_t v7 = [v6 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__RTPlaceInferenceDailyMetrics_description__block_invoke;
  v12[3] = &unk_1E6B90A68;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __43__RTPlaceInferenceDailyMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 metrics];
  id v8 = [v5 valueForKey:v4];

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [NSString stringWithFormat:@"%@, %@, ", v4, v8];

  [v6 appendString:v7];
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