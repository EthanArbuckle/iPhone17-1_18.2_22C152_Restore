@interface RTSettledStateMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binsForDistanceTraveled;
+ (id)binsForDuration;
+ (id)createSettledStateMetricsForNewSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5;
+ (id)supportedMetricKeys;
+ (unint64_t)bucketForDistanceTraveled:(double)a3;
+ (unint64_t)bucketForDurationLength:(double)a3;
+ (void)submitSettledStateMetricsForSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5;
- (BOOL)isSettledState;
- (RTSettledStateMetrics)init;
- (RTSettledStateMetrics)initWithCurrentSettledStateTransition:(id)a3 nextSettledStateTransition:(id)a4 distanceTraveled:(unint64_t)a5;
- (double)distancetraveledAfterEnteringState;
- (double)duration;
- (void)setDistancetraveledAfterEnteringState:(double)a3;
- (void)setDuration:(double)a3;
- (void)setIsSettledState:(BOOL)a3;
@end

@implementation RTSettledStateMetrics

- (RTSettledStateMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCurrentSettledStateTransition_nextSettledStateTransition_distanceTraveled_);
}

- (RTSettledStateMetrics)initWithCurrentSettledStateTransition:(id)a3 nextSettledStateTransition:(id)a4 distanceTraveled:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RTSettledStateMetrics;
  v10 = [(RTMetric *)&v22 init];
  if (v10)
  {
    v11 = NSNumber;
    v12 = objc_opt_class();
    v13 = [v9 date];
    v14 = [v8 date];
    [v13 timeIntervalSinceDate:v14];
    v15 = [v11 numberWithUnsignedInteger:[v12 bucketForDurationLength]];
    v16 = [(RTMetric *)v10 metrics];
    [v16 setObject:v15 forKeyedSubscript:@"DurationLength"];

    v17 = [NSNumber numberWithInt:objc_msgSend(v8, "transitionToType") == 2];
    v18 = [(RTMetric *)v10 metrics];
    [v18 setObject:v17 forKeyedSubscript:@"IsSettledState"];

    v19 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() bucketForDistanceTraveled:a5]];
    v20 = [(RTMetric *)v10 metrics];
    [v20 setObject:v19 forKeyedSubscript:@"DistanceTraveledAfterEnteringState"];
  }
  return v10;
}

+ (id)supportedMetricKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"DurationLength", @"IsSettledState", @"DistanceTraveledAfterEnteringState", 0];
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventSettledStateMetrics;
}

+ (id)binsForDistanceTraveled
{
  uint64_t v2 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
  if (!binsForDistanceTraveled_binsForDistanceTraveled)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F34529E8];
    v4 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
    binsForDistanceTraveled_binsForDistanceTraveled = v3;

    uint64_t v2 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
  }

  return v2;
}

+ (unint64_t)bucketForDistanceTraveled:(double)a3
{
  v4 = [NSNumber numberWithDouble:a3];
  v5 = +[RTSettledStateMetrics binsForDistanceTraveled];
  v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (id)binsForDuration
{
  uint64_t v2 = (void *)binsForDuration_binsForDuration;
  if (!binsForDuration_binsForDuration)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3452A00];
    v4 = (void *)binsForDuration_binsForDuration;
    binsForDuration_binsForDuration = v3;

    uint64_t v5 = 23;
    uint64_t v6 = 3600;
    do
    {
      unint64_t v7 = (void *)binsForDuration_binsForDuration;
      id v8 = [NSNumber numberWithLong:v6];
      [v7 addObject:v8];

      v6 += 3600;
      --v5;
    }
    while (v5);
    uint64_t v9 = 4;
    uint64_t v10 = 86400;
    do
    {
      v11 = (void *)binsForDuration_binsForDuration;
      v12 = [NSNumber numberWithLong:v10];
      [v11 addObject:v12];

      v10 += 86400;
      --v9;
    }
    while (v9);
    uint64_t v2 = (void *)binsForDuration_binsForDuration;
  }

  return v2;
}

+ (unint64_t)bucketForDurationLength:(double)a3
{
  v4 = [NSNumber numberWithDouble:a3];
  uint64_t v5 = +[RTSettledStateMetrics binsForDuration];
  uint64_t v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (id)createSettledStateMetricsForNewSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [RTStoredSettledStateTransitionEnumerationOptions alloc];
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];
  v15 = [(RTStoredSettledStateTransitionEnumerationOptions *)v10 initWithAscending:0 dateInterval:v14 limit:&unk_1F344FB50 batchSize:1];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__21;
  v47 = __Block_byref_object_dispose__21;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__21;
  v41 = __Block_byref_object_dispose__21;
  id v42 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke;
  v33[3] = &unk_1E6B92978;
  v35 = &v43;
  id v16 = v7;
  id v34 = v16;
  v36 = &v37;
  [v8 enumerateStoredSettledStateTransitionsWithOptions:v15 enumerationBlock:v33];
  if (v44[5])
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v31 = v44[5];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v31;
    v28 = "Error fetching settledStateTransitions: %@";
    v29 = v17;
    uint32_t v30 = 12;
    goto LABEL_15;
  }
  v20 = (void *)v38[5];
  if (v20)
  {
    uint64_t v21 = [v20 transitionToType];
    if (v21 == [v16 transitionFromType])
    {
      objc_super v22 = [RTLocationStoreMetricOptions alloc];
      id v23 = objc_alloc(MEMORY[0x1E4F28C18]);
      v24 = [(id)v38[5] date];
      v25 = [v16 date];
      v26 = (void *)[v23 initWithStartDate:v24 endDate:v25];
      v17 = [(RTLocationStoreMetricOptions *)v22 initWithDateInterval:v26 uncertaintyThreshold:2500.0];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke_46;
      v32[3] = &unk_1E6B929A0;
      v32[4] = &buf;
      [v9 fetchMetricsWithOptions:v17 handler:v32];
      v27 = [RTSettledStateMetrics alloc];
      v18 = [(RTSettledStateMetrics *)v27 initWithCurrentSettledStateTransition:v38[5] nextSettledStateTransition:v16 distanceTraveled:*(void *)(*((void *)&buf + 1) + 24)];
      _Block_object_dispose(&buf, 8);
      goto LABEL_4;
    }
    v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      v18 = 0;
LABEL_4:

      goto LABEL_5;
    }
    LOWORD(buf) = 0;
    v28 = "latestStoredSettledStateTransition.transitionToType and newSettledStateTransition.transitionFromType are of di"
          "fferent type, something was missed!";
    v29 = v17;
    uint32_t v30 = 2;
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v30);
    goto LABEL_3;
  }
  v18 = 0;
LABEL_5:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v18;
}

void __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v9 = [v7 firstObject];
  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [v7 firstObject];
  v12 = [v11 date];
  v13 = [*(id *)(a1 + 32) date];
  int v14 = [v12 isBeforeDate:v13];

  if (!v14)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [*(id *)(a1 + 32) date];
      v20 = [v7 firstObject];
      uint64_t v21 = [v20 date];
      int v22 = 138412546;
      id v23 = v19;
      __int16 v24 = 2112;
      v25 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "New settledStateTransition: %@ isOnOrBefore a stored settledStateTransition: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
LABEL_3:
    uint64_t v15 = [v7 firstObject];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  *a4 = 1;
}

uint64_t __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t result = [a2 distanceTraveled];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)v4;
  return result;
}

+ (void)submitSettledStateMetricsForSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() createSettledStateMetricsForNewSettledStateTransition:v9 settledStateTransitionStore:v8 locationStore:v7];

  if (v10)
  {
    uint64_t v11 = 0;
    [v10 submitMetricsWithError:&v11];
  }
}

- (double)distancetraveledAfterEnteringState
{
  return self->_distancetraveledAfterEnteringState;
}

- (void)setDistancetraveledAfterEnteringState:(double)a3
{
  self->_distancetraveledAfterEnteringState = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isSettledState
{
  return self->_isSettledState;
}

- (void)setIsSettledState:(BOOL)a3
{
  self->_isSettledState = a3;
}

@end