@interface TACoreAnalyticMetricManager
+ (id)computeMetricsInterVisit:(id)a3;
+ (id)computeMetricsVisit:(id)a3 withFilterVisitsSettings:(id)a4;
@end

@implementation TACoreAnalyticMetricManager

+ (id)computeMetricsInterVisit:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v28 = v3;
  v5 = [v3 visitState];
  v6 = [v5 interVisitMetricSnapshotBuffer];
  v7 = [v6 bufferCopy];
  v8 = [v7 reverseObjectEnumerator];

  id obj = v8;
  uint64_t v31 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v39;
    char v33 = 1;
LABEL_3:
    uint64_t v9 = 0;
LABEL_4:
    if (*(void *)v39 != v30) {
      objc_enumerationMutation(obj);
    }
    v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
    if ([v10 isClosed])
    {
      uint64_t v32 = v9;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v11 = [v10 accumulatedDeviceMetrics];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v12) {
        goto LABEL_20;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v17 = [v10 accumulatedDeviceMetrics];
          v18 = [v17 objectForKey:v16];

          v19 = [v4 objectForKey:v16];
          if (v19)
          {
            v20 = v19;
            v21 = [(TAMetricsInterVisit *)v19 totalInterVisitMetric];
            [v21 accumulate:v18];

LABEL_14:
            goto LABEL_18;
          }
          if (v33)
          {
            [v18 duration];
            if (v22 > 0.0)
            {
              v20 = objc_alloc_init(TAMetricsInterVisit);
              v23 = [(TAMetricsInterVisit *)v20 currentInterVisitMetric];
              [v23 accumulate:v18];

              v24 = [(TAMetricsInterVisit *)v20 totalInterVisitMetric];
              [v24 accumulate:v18];

              [v4 setObject:v20 forKey:v16];
              goto LABEL_14;
            }
          }
LABEL_18:
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (!v13)
        {
LABEL_20:

          char v33 = 0;
          uint64_t v9 = v32 + 1;
          if (v32 + 1 == v31)
          {
            char v33 = 0;
            uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
            if (!v31) {
              goto LABEL_22;
            }
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
    }
    v26 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      +[TACoreAnalyticMetricManager computeMetricsInterVisit:](v26);
    }
    id v25 = [MEMORY[0x263EFF9A0] dictionary];
  }
  else
  {
LABEL_22:

    id v25 = v4;
  }

  return v25;
}

+ (id)computeMetricsVisit:(id)a3 withFilterVisitsSettings:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = v5;
  uint64_t v9 = [v5 visitState];
  v10 = [v9 visitSnapshotBuffer];
  v11 = [v10 lastObject];

  if ([v11 isClosed])
  {
    v27 = v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v11;
    id obj = [v11 latestUtAdvertisements];
    uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v17 = [TAMetricsVisit alloc];
          v18 = [v8 visitState];
          v19 = [v18 visitSnapshotBuffer];
          v20 = [v19 bufferCopy];
          v21 = [(TAMetricsVisit *)v17 initWithSnapshotHistory:v20 andAddress:v16 andVisitFilterSettings:v6];

          if (v21) {
            [v27 setObject:v21 forKey:v16];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    v7 = v27;
    id v22 = v27;
    v11 = v25;
  }
  else
  {
    v23 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      +[TACoreAnalyticMetricManager computeMetricsVisit:withFilterVisitsSettings:](v23);
    }
    id v22 = [MEMORY[0x263EFF9A0] dictionary];
  }

  return v22;
}

+ (void)computeMetricsInterVisit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "#TACoreAnalyticMetricManager computing metrics for inter-visit type but seeing open inter-visit snapshot. Something is wrong.", v1, 2u);
}

+ (void)computeMetricsVisit:(os_log_t)log withFilterVisitsSettings:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "#TACoreAnalyticMetricManager computing metrics for visit type but seeing open visit snapshot. Something is wrong.", v1, 2u);
}

@end