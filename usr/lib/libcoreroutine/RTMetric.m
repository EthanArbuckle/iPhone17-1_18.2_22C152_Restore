@interface RTMetric
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binForNumber:(id)a3 bins:(id)a4;
+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5;
+ (id)metricName;
+ (id)supportedMetricKeys;
- (BOOL)loggingEnabled;
- (BOOL)setAllMetrics:(id)a3 error:(id *)a4;
- (BOOL)submitMetricsWithError:(id *)a3;
- (BOOL)submitted;
- (NSMutableDictionary)metrics;
- (NSString)description;
- (RTMetric)init;
- (RTMetric)initWithLoggingEnabled:(BOOL)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation RTMetric

- (RTMetric)initWithLoggingEnabled:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RTMetric;
  v4 = [(RTMetric *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_loggingEnabled = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v6;

    v5->_submitted = 0;
  }
  return v5;
}

- (RTMetric)init
{
  return [(RTMetric *)self initWithLoggingEnabled:1];
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

+ (id)supportedMetricKeys
{
  return 0;
}

+ (id)metricName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() event];
  if (v3)
  {
    v4 = (void *)[[NSString alloc] initWithCString:v3 encoding:1];
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@, cannot get metric name for a nil eventName", (uint8_t *)&v8, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v25 = 0;
      goto LABEL_19;
    }
    __int16 v34 = 0;
    v23 = "Invalid parameter not satisfying: number";
    v24 = (uint8_t *)&v34;
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_13;
  }
  if (![v6 count])
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v33 = 0;
    v23 = "Invalid parameter not satisfying: bins.count > 0";
    v24 = (uint8_t *)&v33;
    goto LABEL_23;
  }
  uint64_t v8 = [v7 count];
  unint64_t v9 = v8 - 1;
  if (v8 == 1)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v10 = 0;
    do
    {
      unint64_t v11 = (v10 + v9) >> 1;
      v12 = [v7 objectAtIndexedSubscript:v11];
      [v12 doubleValue];
      double v14 = v13;
      [v5 doubleValue];
      double v16 = v15;

      if (v14 >= v16)
      {
        v17 = [v7 objectAtIndexedSubscript:(v10 + v9) >> 1];
        [v17 doubleValue];
        double v19 = v18;
        [v5 doubleValue];
        double v21 = v20;

        unint64_t v9 = (v10 + v9) >> 1;
        if (v19 <= v21) {
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v10 = v11 + 1;
      }
    }
    while (v10 < v9);
    unint64_t v11 = (v9 + v10) >> 1;
  }
LABEL_15:
  [v5 doubleValue];
  double v27 = v26;
  v28 = [v7 objectAtIndexedSubscript:v11];
  [v28 doubleValue];
  double v30 = v29;

  if (v27 >= v30) {
    unint64_t v31 = v11 + 1;
  }
  else {
    unint64_t v31 = v11;
  }
  v25 = [NSNumber numberWithUnsignedInteger:v31];
LABEL_19:

  return v25;
}

+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = v9;
  if (!v7)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    __int16 v24 = 0;
    double v19 = "Invalid parameter not satisfying: start";
    double v20 = (uint8_t *)&v24;
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_14;
  }
  if (!v8)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    __int16 v23 = 0;
    double v19 = "Invalid parameter not satisfying: end";
    double v20 = (uint8_t *)&v23;
    goto LABEL_13;
  }
  if (!v9)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = 0;
      double v19 = "Invalid parameter not satisfying: gap";
      double v20 = (uint8_t *)&v22;
      goto LABEL_13;
    }
LABEL_14:

    unint64_t v11 = 0;
    goto LABEL_15;
  }
  unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  [v7 doubleValue];
  double v13 = v12;
  [v8 doubleValue];
  if (v13 <= v14)
  {
    do
    {
      double v15 = [NSNumber numberWithDouble:v13];
      [v11 addObject:v15];

      [v10 doubleValue];
      double v13 = v13 + v16;
      [v8 doubleValue];
    }
    while (v13 <= v17);
  }
LABEL_15:

  return v11;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v6 = [(id)objc_opt_class() event];
    id v7 = [(id)objc_opt_class() metricName];
    if (v7)
    {
      if (self->_submitted)
      {
        id v8 = [NSString stringWithFormat:@"metric, %@, has already been submitted", v7];
        id v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = *MEMORY[0x1E4F5CFE8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v55 = v8;
        unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        double v12 = [v9 errorWithDomain:v10 code:0 userInfo:v11];

        double v13 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v41 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v47 = v41;
          __int16 v48 = 2112;
          v49 = v12;
          _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        double v14 = v12;
        *a3 = v14;

        char v15 = 0;
      }
      else
      {
        double v21 = (void *)MEMORY[0x1E4F1CAD0];
        __int16 v22 = [(NSMutableDictionary *)self->_metrics allKeys];
        id v8 = [v21 setWithArray:v22];

        __int16 v23 = (void *)MEMORY[0x1E4F1CAD0];
        __int16 v24 = [(id)objc_opt_class() supportedMetricKeys];
        v25 = [v23 setWithSet:v24];

        char v15 = [v8 isEqualToSet:v25];
        if (v15)
        {
          if (self->_loggingEnabled)
          {
            double v26 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              double v27 = NSStringFromSelector(a2);
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              v47 = v27;
              __int16 v48 = 2112;
              v49 = v7;
              __int16 v50 = 2112;
              v51 = metrics;
              _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, submitting, %@, metrics, %@", buf, 0x20u);
            }
          }
          double v29 = (void *)[[NSString alloc] initWithCString:v6 encoding:1];
          double v30 = [NSString stringWithFormat:@"com.apple.%@", v29];
          AnalyticsSendEvent();

          self->_submitted = 1;
        }
        else
        {
          unint64_t v31 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
          [v31 minusSet:v25];
          v32 = [MEMORY[0x1E4F1CA80] setWithSet:v25];
          [v32 minusSet:v8];
          v45 = v31;
          uint64_t v33 = [NSString stringWithFormat:@"metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@", v7, v31, v32];
          __int16 v34 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v35 = *MEMORY[0x1E4F5CFE8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          uint64_t v53 = v33;
          v44 = (void *)v33;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          v37 = [v34 errorWithDomain:v35 code:7 userInfo:v36];

          v38 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v43 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v47 = v43;
            __int16 v48 = 2112;
            v49 = v37;
            _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          v39 = v37;
          *a3 = v39;
        }
      }
    }
    else
    {
      double v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57[0] = @"metricName cannot be nil";
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      double v19 = [v16 errorWithDomain:v17 code:7 userInfo:v18];

      double v20 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v42 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v47 = v42;
        __int16 v48 = 2112;
        v49 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v8 = v19;
      char v15 = 0;
      *a3 = v8;
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)setAllMetrics:(id)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if (v7)
    {
      id v9 = [(id)objc_opt_class() metricName];
      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
        unint64_t v11 = [v8 allKeys];
        id v12 = [v10 setWithArray:v11];

        double v13 = [(id)objc_opt_class() supportedMetricKeys];
        char v14 = [v12 isSubsetOfSet:v13];
        if (v14)
        {
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __32__RTMetric_setAllMetrics_error___block_invoke;
          v35[3] = &unk_1E6B91888;
          v35[4] = self;
          [v8 enumerateKeysAndObjectsUsingBlock:v35];
        }
        else
        {
          __int16 v22 = [MEMORY[0x1E4F1CA80] setWithSet:v12];
          [v22 minusSet:v13];
          __int16 v34 = v22;
          uint64_t v23 = [NSString stringWithFormat:@"metric keys contains keys that metric, %@, does not support.  Extra keys, %@", v9, v22];
          __int16 v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v25 = *MEMORY[0x1E4F5CFE8];
          uint64_t v36 = *MEMORY[0x1E4F28568];
          uint64_t v37 = v23;
          uint64_t v33 = (void *)v23;
          double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          double v27 = [v24 errorWithDomain:v25 code:7 userInfo:v26];

          v28 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v32 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v39 = v32;
            __int16 v40 = 2112;
            v41 = v27;
            _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          id v29 = v27;
          *a4 = v29;
        }
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F5CFE8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v43[0] = @"cannot set all metrics when metricName is nil";
        double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
        double v20 = [v17 errorWithDomain:v18 code:7 userInfo:v19];

        double v21 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          unint64_t v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v39 = v31;
          __int16 v40 = 2112;
          v41 = v20;
          _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        id v12 = v20;
        char v14 = 0;
        *a4 = v12;
      }
    }
    else
    {
      double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"metrics");
      char v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    char v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    char v14 = 0;
  }

  return v14;
}

uint64_t __32__RTMetric_setAllMetrics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKeyedSubscript:a2];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = [(id)objc_opt_class() metricName];
  id v5 = [(RTMetric *)self metrics];
  uint64_t v6 = [v3 stringWithFormat:@"name, %@, metrics, %@", v4, v5];

  return (NSString *)v6;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (void).cxx_destruct
{
}

@end