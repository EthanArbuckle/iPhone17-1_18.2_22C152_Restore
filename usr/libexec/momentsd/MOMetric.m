@interface MOMetric
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binForNumber:(id)a3 bins:(id)a4;
+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5;
+ (id)metricName;
+ (id)metricNameFromEvent:(id)a3;
+ (id)supportedMetricKeys;
- (BOOL)loggingEnabled;
- (BOOL)setAllMetrics:(id)a3 error:(id *)a4;
- (BOOL)submitMetricsWithError:(id *)a3;
- (BOOL)submitMetricsWithError:(id *)a3 forEvent:(id)a4;
- (BOOL)submitted;
- (MOMetric)init;
- (MOMetric)initWithLoggingEnabled:(BOOL)a3;
- (NSMutableDictionary)metrics;
- (NSString)description;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation MOMetric

- (MOMetric)initWithLoggingEnabled:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MOMetric;
  v4 = [(MOMetric *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_loggingEnabled = a3;
    uint64_t v6 = +[NSMutableDictionary dictionary];
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v6;

    v5->_submitted = 0;
  }
  return v5;
}

- (MOMetric)init
{
  return [(MOMetric *)self initWithLoggingEnabled:1];
}

+ (id)metricNameFromEvent:(id)a3
{
  var0 = a3.var0;
  if (a3.var0)
  {
    id v3 = [objc_alloc((Class)NSString) initWithCString:_mo_analytics_get_event((uint64_t)&var0) encoding:1];
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MOMetric metricNameFromEvent:](a2);
    }

    id v3 = 0;
  }

  return v3;
}

+ (id)metricName
{
  id v6 = [(id)objc_opt_class() event];
  if (v6)
  {
    id v3 = [objc_alloc((Class)NSString) initWithCString:_mo_analytics_get_event((uint64_t)&v6) encoding:1];
  }
  else
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MOMetric metricNameFromEvent:](a2);
    }

    id v3 = 0;
  }

  return v3;
}

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = v8;
  if (!v7)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[MOMetric binForNumber:bins:]();
    }

    v26 = +[NSAssertionHandler currentHandler];
    v27 = v26;
    CFStringRef v28 = @"Invalid parameter not satisfying: number != nil";
    SEL v29 = a2;
    id v30 = a1;
    uint64_t v31 = 86;
    goto LABEL_16;
  }
  if (![v8 count])
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[MOMetric binForNumber:bins:]();
    }

    v26 = +[NSAssertionHandler currentHandler];
    v27 = v26;
    CFStringRef v28 = @"Invalid parameter not satisfying: bins.count > 0";
    SEL v29 = a2;
    id v30 = a1;
    uint64_t v31 = 87;
LABEL_16:
    [v26 handleFailureInMethod:v29 object:v30 file:@"MOMetric.m" lineNumber:v31 description:v28];

    v33 = 0;
    goto LABEL_22;
  }
  v10 = (char *)[v9 count];
  v11 = v10 - 1;
  if (v10 == (char *)1)
  {
    unint64_t v24 = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = (char *)((unint64_t)&v12[(void)v11] >> 1);
      v14 = [v9 objectAtIndexedSubscript:v13];
      [v14 doubleValue];
      double v16 = v15;
      [v7 doubleValue];
      double v18 = v17;

      if (v16 >= v18)
      {
        v19 = [v9 objectAtIndexedSubscript:(unint64_t)&v12[(void)v11] >> 1];
        [v19 doubleValue];
        double v21 = v20;
        [v7 doubleValue];
        double v23 = v22;

        if (v21 <= v23) {
          break;
        }
      }
      else
      {
        v12 = v13 + 1;
        v13 = v11;
      }
      v11 = v13;
    }
    while (v12 < v13);
    unint64_t v24 = (unint64_t)&v12[(void)v11] >> 1;
  }
  [v7 doubleValue];
  double v35 = v34;
  v36 = [v9 objectAtIndexedSubscript:v24];
  [v36 doubleValue];
  double v38 = v37;

  if (v35 >= v38) {
    unint64_t v39 = v24 + 1;
  }
  else {
    unint64_t v39 = v24;
  }
  v33 = +[NSNumber numberWithUnsignedInteger:v39];
LABEL_22:

  return v33;
}

+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    double v20 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[MOMetric binsFromStart:toEnd:gap:]();
    }

    double v21 = +[NSAssertionHandler currentHandler];
    double v22 = v21;
    CFStringRef v23 = @"Invalid parameter not satisfying: start != nil";
    SEL v24 = a2;
    id v25 = a1;
    uint64_t v26 = 115;
    goto LABEL_16;
  }
  if (!v10)
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[MOMetric binsFromStart:toEnd:gap:]();
    }

    double v21 = +[NSAssertionHandler currentHandler];
    double v22 = v21;
    CFStringRef v23 = @"Invalid parameter not satisfying: end != nil";
    SEL v24 = a2;
    id v25 = a1;
    uint64_t v26 = 116;
    goto LABEL_16;
  }
  if (!v11)
  {
    CFStringRef v28 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[MOMetric binsFromStart:toEnd:gap:]();
    }

    double v21 = +[NSAssertionHandler currentHandler];
    double v22 = v21;
    CFStringRef v23 = @"Invalid parameter not satisfying: gap != nil";
    SEL v24 = a2;
    id v25 = a1;
    uint64_t v26 = 117;
LABEL_16:
    [v21 handleFailureInMethod:v24 object:v25 file:@"MOMetric.m" lineNumber:v26 description:v23];

    v13 = 0;
    goto LABEL_17;
  }
  v13 = +[NSMutableArray array];
  [v9 doubleValue];
  double v15 = v14;
  [v10 doubleValue];
  if (v15 <= v16)
  {
    do
    {
      double v17 = +[NSNumber numberWithDouble:v15];
      [v13 addObject:v17];

      [v12 doubleValue];
      double v15 = v15 + v18;
      [v10 doubleValue];
    }
    while (v15 <= v19);
  }
LABEL_17:

  return v13;
}

- (BOOL)submitMetricsWithError:(id *)a3 forEvent:(id)a4
{
  var0 = a4.var0;
  if (a3)
  {
    id v7 = [(id)objc_opt_class() metricNameFromEvent:a4.var0];
    if (v7)
    {
      if (self->_submitted)
      {
        id v8 = +[NSString stringWithFormat:@"metric, %@, has already been submitted", v7];
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        id v46 = v8;
        id v9 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v10 = +[NSError errorWithDomain:@"MOErrorDomain" code:0 userInfo:v9];

        id v11 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[MOMetric submitMetricsWithError:forEvent:]();
        }

        id v12 = v10;
        *a3 = v12;

        unsigned __int8 v13 = 0;
      }
      else
      {
        double v18 = [(NSMutableDictionary *)self->_metrics allKeys];
        id v8 = +[NSSet setWithArray:v18];

        double v19 = [(id)objc_opt_class() supportedMetricKeys];
        double v20 = +[NSSet setWithSet:v19];

        unsigned __int8 v13 = [v8 isEqualToSet:v20];
        if (v13)
        {
          if (self->_loggingEnabled)
          {
            double v21 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              double v22 = NSStringFromSelector(a2);
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              double v38 = v22;
              __int16 v39 = 2112;
              v40 = v7;
              __int16 v41 = 2112;
              v42 = metrics;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "MO_LOG_INFO: %@, submitting, %@, metrics, %@", buf, 0x20u);
            }
          }
          id v24 = [objc_alloc((Class)NSString) initWithCString:_mo_analytics_get_event((uint64_t)&var0) encoding:1];
          id v25 = +[NSString stringWithFormat:@"com.apple.Moments.%@", v24];
          AnalyticsSendEvent();

          self->_submitted = 1;
        }
        else
        {
          uint64_t v26 = +[NSMutableSet setWithSet:v8];
          [v26 minusSet:v20];
          double v35 = v20;
          v27 = +[NSMutableSet setWithSet:v20];
          [v27 minusSet:v8];
          double v34 = v26;
          CFStringRef v28 = +[NSString stringWithFormat:@"metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@", v7, v26, v27];
          NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
          v44 = v28;
          SEL v29 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v30 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v29];

          uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[MOMetric submitMetricsWithError:forEvent:]();
          }

          id v32 = v30;
          *a3 = v32;

          double v20 = v35;
        }
      }
    }
    else
    {
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      CFStringRef v48 = @"metricName cannot be nil";
      double v15 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      double v16 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v15];

      double v17 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MOMetric submitMetricsWithError:forEvent:]();
      }

      id v8 = v16;
      unsigned __int8 v13 = 0;
      *a3 = v8;
    }
  }
  else
  {
    double v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOMetric submitMetricsWithError:forEvent:]();
    }

    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOMetric.m" lineNumber:131 description:@"Invalid parameter not satisfying: outError"];
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  if (a3)
  {
    id v36 = [(id)objc_opt_class() event];
    id v6 = [(id)objc_opt_class() metricName];
    if (v6)
    {
      if (self->_submitted)
      {
        id v7 = +[NSString stringWithFormat:@"metric, %@, has already been submitted", v6];
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        id v46 = v7;
        id v8 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v9 = +[NSError errorWithDomain:@"MOErrorDomain" code:0 userInfo:v8];

        id v10 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[MOMetric submitMetricsWithError:forEvent:]();
        }

        id v11 = v9;
        *a3 = v11;

        unsigned __int8 v12 = 0;
      }
      else
      {
        double v18 = [(NSMutableDictionary *)self->_metrics allKeys];
        id v7 = +[NSSet setWithArray:v18];

        double v19 = [(id)objc_opt_class() supportedMetricKeys];
        double v20 = +[NSSet setWithSet:v19];

        unsigned __int8 v12 = [v7 isEqualToSet:v20];
        if (v12)
        {
          if (self->_loggingEnabled)
          {
            double v21 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              double v22 = NSStringFromSelector(a2);
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              double v38 = v22;
              __int16 v39 = 2112;
              v40 = v6;
              __int16 v41 = 2112;
              v42 = metrics;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "MO_LOG_INFO: %@, submitting, %@, metrics, %@", buf, 0x20u);
            }
          }
          id v24 = [objc_alloc((Class)NSString) initWithCString:_mo_analytics_get_event((uint64_t)&v36) encoding:1];
          id v25 = +[NSString stringWithFormat:@"com.apple.Moments.%@", v24];
          AnalyticsSendEvent();

          self->_submitted = 1;
        }
        else
        {
          uint64_t v26 = +[NSMutableSet setWithSet:v7];
          [v26 minusSet:v20];
          double v35 = v20;
          v27 = +[NSMutableSet setWithSet:v20];
          [v27 minusSet:v7];
          double v34 = v26;
          CFStringRef v28 = +[NSString stringWithFormat:@"metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@", v6, v26, v27];
          NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
          v44 = v28;
          SEL v29 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v30 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v29];

          uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[MOMetric submitMetricsWithError:forEvent:]();
          }

          id v32 = v30;
          *a3 = v32;

          double v20 = v35;
        }
      }
    }
    else
    {
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      CFStringRef v48 = @"metricName cannot be nil";
      double v15 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      double v16 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v15];

      double v17 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MOMetric submitMetricsWithError:forEvent:]();
      }

      id v7 = v16;
      unsigned __int8 v12 = 0;
      *a3 = v7;
    }
  }
  else
  {
    unsigned __int8 v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOMetric submitMetricsWithError:forEvent:]();
    }

    double v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MOMetric.m" lineNumber:195 description:@"Invalid parameter not satisfying: outError"];

    return 0;
  }
  return v12;
}

- (BOOL)setAllMetrics:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if (v7)
    {
      id v9 = [(id)objc_opt_class() metricName];
      if (v9)
      {
        id v10 = [v8 allKeys];
        id v11 = +[NSSet setWithArray:v10];

        unsigned __int8 v12 = [(id)objc_opt_class() supportedMetricKeys];
        unsigned __int8 v13 = [v11 isSubsetOfSet:v12];
        if (v13)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = __32__MOMetric_setAllMetrics_error___block_invoke;
          v29[3] = &unk_1002CB8E8;
          v29[4] = self;
          [v8 enumerateKeysAndObjectsUsingBlock:v29];
        }
        else
        {
          double v21 = +[NSMutableSet setWithSet:v11];
          [v21 minusSet:v12];
          CFStringRef v28 = v21;
          +[NSString stringWithFormat:@"metric keys contains keys that metric, %@, does not support.  Extra keys, %@", v9, v21];
          v31 = NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
          v27 = (void *)v31;
          double v22 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          CFStringRef v23 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v22];

          id v24 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[MOMetric submitMetricsWithError:forEvent:]();
          }

          id v25 = v23;
          *a4 = v25;
        }
      }
      else
      {
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        CFStringRef v33 = @"cannot set all metrics when metricName is nil";
        double v18 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        double v19 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v18];

        double v20 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[MOMetric submitMetricsWithError:forEvent:]();
        }

        id v11 = v19;
        unsigned __int8 v13 = 0;
        *a4 = v11;
      }
    }
    else
    {
      double v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MOMetric setAllMetrics:error:]();
      }

      double v17 = +[NSAssertionHandler currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"MOMetric.m" lineNumber:263 description:@"Invalid parameter not satisfying: metrics"];

      _MOErrorInvalidParameterCreate(@"metrics");
      unsigned __int8 v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOMetric submitMetricsWithError:forEvent:]();
    }

    double v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MOMetric.m" lineNumber:262 description:@"Invalid parameter not satisfying: outError"];

    unsigned __int8 v13 = 0;
  }

  return v13;
}

id __32__MOMetric_setAllMetrics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKeyedSubscript:a2];
}

- (NSString)description
{
  id v3 = [(id)objc_opt_class() metricName];
  v4 = [(MOMetric *)self metrics];
  v5 = +[NSString stringWithFormat:@"name, %@, metrics, %@", v3, v4];

  return (NSString *)v5;
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

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

+ (id)supportedMetricKeys
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  v2 = objc_opt_new();

  return v2;
}

+ (void)metricNameFromEvent:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "%@, cannot get metric name for a nil eventName", v4, v5, v6, v7, 2u);
}

+ (void)binForNumber:bins:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: number != nil", v2, v3, v4, v5, v6);
}

+ (void)binForNumber:bins:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bins.count > 0", v2, v3, v4, v5, v6);
}

+ (void)binsFromStart:toEnd:gap:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: start != nil", v2, v3, v4, v5, v6);
}

+ (void)binsFromStart:toEnd:gap:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: end != nil", v2, v3, v4, v5, v6);
}

+ (void)binsFromStart:toEnd:gap:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: gap != nil", v2, v3, v4, v5, v6);
}

- (void)submitMetricsWithError:forEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: outError", v2, v3, v4, v5, v6);
}

- (void)submitMetricsWithError:forEvent:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v2, v3, "%@, error, %@", v4, v5, v6, v7, v8);
}

- (void)setAllMetrics:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: metrics", v2, v3, v4, v5, v6);
}

@end