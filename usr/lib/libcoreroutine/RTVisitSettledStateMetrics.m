@interface RTVisitSettledStateMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binsForDuration;
+ (id)createVisitSettledStateMetricsForSettledStateTransitionStore:(id)a3 startDate:(id)a4 endDate:(id)a5 isVisit:(BOOL)a6;
+ (id)supportedMetricKeys;
+ (unint64_t)boundedIntegerMetricForCountOfSettledStateTransitions:(unint64_t)a3;
+ (unint64_t)boundedIntegerMetricForPercentageOfTimeSettled:(unint64_t)a3;
+ (unint64_t)boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:(double)a3 overDuration:(double)a4;
+ (unint64_t)bucketForDuration:(double)a3;
+ (void)submitVisitSettledStateMetricsForStartDate:(id)a3 endDate:(id)a4 isVisit:(BOOL)a5 settledStateTransitionStore:(id)a6;
- (RTVisitSettledStateMetrics)init;
- (RTVisitSettledStateMetrics)initWithCountOfSettledStateTransitions:(unint64_t)a3 duration:(double)a4 isVisit:(BOOL)a5 timeSettled:(double)a6;
@end

@implementation RTVisitSettledStateMetrics

- (RTVisitSettledStateMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCountOfSettledStateTransitions_duration_isVisit_timeSettled_);
}

+ (id)createVisitSettledStateMetricsForSettledStateTransitionStore:(id)a3 startDate:(id)a4 endDate:(id)a5 isVisit:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 39;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: settledStateTransitionStore (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v11)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 40;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v12)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 41;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }
  }
  v16 = [RTStoredSettledStateTransitionEnumerationOptions alloc];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v12];
  v18 = [(RTStoredSettledStateTransitionEnumerationOptions *)v16 initWithAscending:1 dateInterval:v17 limit:0 batchSize:1];

  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__142;
  v43 = __Block_byref_object_dispose__142;
  id v19 = v11;
  id v44 = v19;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__142;
  v31 = __Block_byref_object_dispose__142;
  id v32 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __117__RTVisitSettledStateMetrics_createVisitSettledStateMetricsForSettledStateTransitionStore_startDate_endDate_isVisit___block_invoke;
  v26[3] = &unk_1E6B9B8A0;
  v26[4] = &v33;
  v26[5] = buf;
  v26[6] = &v37;
  v26[7] = &v27;
  v26[8] = a2;
  [v10 enumerateStoredSettledStateTransitionsWithOptions:v18 enumerationBlock:v26];
  if ([(id)v28[5] transitionToType] == 2)
  {
    v20 = [(id)v28[5] date];
    [v12 timeIntervalSinceDate:v20];
    v38[3] = v21 + v38[3];
  }
  v22 = [RTVisitSettledStateMetrics alloc];
  uint64_t v23 = v34[3];
  [v12 timeIntervalSinceDate:v19];
  v24 = -[RTVisitSettledStateMetrics initWithCountOfSettledStateTransitions:duration:isVisit:timeSettled:](v22, "initWithCountOfSettledStateTransitions:duration:isVisit:timeSettled:", v23, v6);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v37, 8);

  return v24;
}

void __117__RTVisitSettledStateMetrics_createVisitSettledStateMetricsForSettledStateTransitionStore_startDate_endDate_isVisit___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v7 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v14, "transitionToType", (void)v27) == 2)
        {
          uint64_t v15 = [v14 date];
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
          v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;
        }
        else
        {
          if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
            continue;
          }
          if ([v14 transitionFromType] == 2)
          {
            v18 = [v14 date];
            [v18 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
            *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 48)
                                                                                                + 8)
                                                                                    + 24);
          }
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          v17 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = 0;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v11);
  }

  double v21 = [v9 lastObject];

  if (v21)
  {
    uint64_t v22 = [v9 lastObject];
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  if (v8)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v32 = v26;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, RTSettledStateTransitions enumeration eror: %@", buf, 0x16u);
    }
    *a4 = 1;
  }
}

+ (void)submitVisitSettledStateMetricsForStartDate:(id)a3 endDate:(id)a4 isVisit:(BOOL)a5 settledStateTransitionStore:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v6 = +[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:a6 startDate:a3 endDate:a4 isVisit:a5];
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [v6 submitMetricsWithError:&v10];
    id v8 = v10;
    if (v8)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Error submitting RTVisitSettledStateMetrics: %@", buf, 0xCu);
      }
    }
  }
}

+ (unint64_t)boundedIntegerMetricForCountOfSettledStateTransitions:(unint64_t)a3
{
  if (a3 >= 0x12C) {
    return 300;
  }
  else {
    return a3;
  }
}

+ (id)binsForDuration
{
  uint64_t v2 = (void *)_binsForDuration;
  if (!_binsForDuration)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F34533C0];
    v4 = (void *)_binsForDuration;
    _binsForDuration = v3;

    uint64_t v5 = 23;
    uint64_t v6 = 3600;
    do
    {
      id v7 = (void *)_binsForDuration;
      id v8 = [NSNumber numberWithLong:v6];
      [v7 addObject:v8];

      v6 += 3600;
      --v5;
    }
    while (v5);
    uint64_t v9 = 5;
    uint64_t v10 = 86400;
    do
    {
      uint64_t v11 = (void *)_binsForDuration;
      id v12 = [NSNumber numberWithLong:v10];
      [v11 addObject:v12];

      v10 += 86400;
      --v9;
    }
    while (v9);
    uint64_t v2 = (void *)_binsForDuration;
  }

  return v2;
}

+ (unint64_t)bucketForDuration:(double)a3
{
  v4 = [NSNumber numberWithDouble:a3];
  uint64_t v5 = +[RTVisitSettledStateMetrics binsForDuration];
  uint64_t v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (unint64_t)boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:(double)a3 overDuration:(double)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4 <= 0.0)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "+[RTVisitSettledStateMetrics boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:]";
      __int16 v11 = 1024;
      int v12 = 138;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: duration > 0 (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a3 < 0.0)
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "+[RTVisitSettledStateMetrics boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:]";
      __int16 v11 = 1024;
      int v12 = 139;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timeSettled >= 0 (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  return [(id)objc_opt_class() boundedIntegerMetricForPercentageOfTimeSettled:vcvtad_u64_f64(a3 / a4 * 100.0)];
}

+ (unint64_t)boundedIntegerMetricForPercentageOfTimeSettled:(unint64_t)a3
{
  if (a3 % 5 >= 3) {
    return 5 * (a3 / 5) + 5;
  }
  else {
    return 5 * (a3 / 5);
  }
}

- (RTVisitSettledStateMetrics)initWithCountOfSettledStateTransitions:(unint64_t)a3 duration:(double)a4 isVisit:(BOOL)a5 timeSettled:(double)a6
{
  BOOL v7 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RTVisitSettledStateMetrics;
  uint64_t v10 = [(RTMetric *)&v20 init];
  if (v10)
  {
    __int16 v11 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() boundedIntegerMetricForCountOfSettledStateTransitions:a3]];
    int v12 = [(RTMetric *)v10 metrics];
    [v12 setObject:v11 forKeyedSubscript:@"CountOfSettledStateChanges"];

    uint64_t v13 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() bucketForDuration:a4]];
    v14 = [(RTMetric *)v10 metrics];
    [v14 setObject:v13 forKeyedSubscript:@"Duration"];

    uint64_t v15 = [NSNumber numberWithBool:v7];
    uint64_t v16 = [(RTMetric *)v10 metrics];
    [v16 setObject:v15 forKeyedSubscript:@"IsVisit"];

    v17 = [NSNumber numberWithUnsignedInteger:objc_msgSend((id)objc_opt_class(), "boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:", a6, a4)];
    v18 = [(RTMetric *)v10 metrics];
    [v18 setObject:v17 forKeyedSubscript:@"PercentageOfTimeSettled"];
  }
  return v10;
}

+ (id)supportedMetricKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"CountOfSettledStateChanges", @"Duration", @"IsVisit", @"PercentageOfTimeSettled", 0];
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventVisitSettledStateMetrics;
}

@end