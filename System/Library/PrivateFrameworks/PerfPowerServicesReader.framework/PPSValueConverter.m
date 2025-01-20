@interface PPSValueConverter
- (BOOL)_allowConversionFromMetric:(id)a3 toMetric:(id)a4;
- (BOOL)_isInitialized;
- (BOOL)_shouldConvertAtTimestamp:(double)a3;
- (BOOL)_shouldConvertEvent:(id)a3;
- (NSArray)metrics;
- (NSMutableDictionary)timeline;
- (PPSValueConverter)initWithFilepath:(id)a3 andMetrics:(id)a4;
- (id)_category;
- (id)_convertEvent:(id)a3;
- (id)_convertValue:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5;
- (id)_latestHistory;
- (id)_latestInterval;
- (id)_latestMetricForMetricName:(id)a3;
- (id)_sourceMetricForMetricName:(id)a3;
- (id)_subsystem;
- (id)convertEventIfNecessary:(id)a3;
- (id)convertValueIfNeccesary:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5;
- (void)_performGeneration;
- (void)setMetrics:(id)a3;
- (void)setTimeline:(id)a3;
@end

@implementation PPSValueConverter

- (PPSValueConverter)initWithFilepath:(id)a3 andMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSValueConverter;
  v8 = [(PPSValueConverter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    filepath = v8->_filepath;
    v8->_filepath = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_metrics, a4);
  }

  return v8;
}

- (id)convertEventIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(PPSValueConverter *)self _isInitialized]) {
    [(PPSValueConverter *)self _performGeneration];
  }
  if ([(PPSValueConverter *)self _shouldConvertEvent:v4])
  {
    id v5 = [(PPSValueConverter *)self _convertEvent:v4];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)convertValueIfNeccesary:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![(PPSValueConverter *)self _isInitialized]) {
    [(PPSValueConverter *)self _performGeneration];
  }
  if ([(PPSValueConverter *)self _shouldConvertAtTimestamp:a4])
  {
    id v10 = [(PPSValueConverter *)self _convertValue:v8 atTimestamp:v9 usingMetric:a4];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (id)_subsystem
{
  v2 = [(NSArray *)self->_metrics firstObject];
  v3 = [v2 subsystem];

  return v3;
}

- (id)_category
{
  v2 = [(NSArray *)self->_metrics firstObject];
  v3 = [v2 category];

  return v3;
}

- (BOOL)_isInitialized
{
  return self->_timeline != 0;
}

- (id)_latestHistory
{
  timeline = self->_timeline;
  v3 = [(NSArray *)self->_sortedTimelineIntervals lastObject];
  id v4 = [(NSMutableDictionary *)timeline objectForKeyedSubscript:v3];

  return v4;
}

- (id)_latestInterval
{
  return [(NSArray *)self->_sortedTimelineIntervals lastObject];
}

- (id)_latestMetricForMetricName:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSValueConverter *)self _latestHistory];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_sourceMetricForMetricName:(id)a3
{
  v3 = [(NSDictionary *)self->_selectedHistory objectForKeyedSubscript:a3];
  return v3;
}

- (BOOL)_allowConversionFromMetric:(id)a3 toMetric:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 version];
  double v8 = v7;
  [v6 version];
  if (v8 != v9)
  {
    id v10 = [v5 unit];
    v11 = [v6 unit];
    if ([v10 isEqual:v11])
    {
    }
    else
    {
      objc_super v12 = [v5 unit];
      v13 = [v12 unit];
      v14 = [v6 unit];
      v15 = [v14 unit];
      int v16 = [v13 isEqual:v15];

      if (!v16)
      {
        BOOL v17 = 1;
        goto LABEL_6;
      }
    }
  }
  BOOL v17 = 0;
LABEL_6:

  return v17;
}

- (id)_convertEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 metricKeys];
  id v6 = (void *)[v5 copy];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v4 metrics];
        objc_super v12 = [v11 objectForKeyedSubscript:v10];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 monotonicTimestamp];
          v13 = -[PPSValueConverter _convertValue:atTimestamp:usingMetric:](self, "_convertValue:atTimestamp:usingMetric:", v12, v10);
          v14 = [v4 metrics];
          [v14 setObject:v13 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_convertValue:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [(PPSValueConverter *)self _latestMetricForMetricName:v8];
  uint64_t v10 = [(PPSValueConverter *)self _sourceMetricForMetricName:v8];
  if ([(PPSValueConverter *)self _allowConversionFromMetric:v10 toMetric:v9])
  {
    v11 = [v10 unit];
    objc_super v12 = [v9 unit];
    id v18 = 0;
    PPSConvertValueWithPPSUnit(v7, v11, v12, &v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v18;

    if (v13)
    {
      id v15 = v13;
    }
    else if (v14)
    {
      int v16 = PPSReaderLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PPSValueConverter _convertValue:atTimestamp:usingMetric:]((uint64_t)v8, (uint64_t)v14, v16);
      }
    }
  }
  else
  {
    id v13 = v7;
  }

  return v13;
}

- (void)_performGeneration
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(v2, v3, v4, 5.778e-34);
  _os_log_debug_impl(&dword_258F16000, v6, OS_LOG_TYPE_DEBUG, "Generating metric timeline for '%@::%@'", v5, 0x16u);
}

- (BOOL)_shouldConvertAtTimestamp:(double)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!self->_sortedTimelineIntervals)
  {
    id v5 = PPSReaderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PPSValueConverter _shouldConvertAtTimestamp:](v5);
    }

    os_log_t v6 = [(NSMutableDictionary *)self->_timeline allKeys];
    id v7 = [v6 sortedArrayUsingSelector:sel_compare_];
    sortedTimelineIntervals = self->_sortedTimelineIntervals;
    self->_sortedTimelineIntervals = v7;
  }
  if ((unint64_t)[(NSMutableDictionary *)self->_timeline count] < 2) {
    return 0;
  }
  double v9 = [(NSArray *)self->_sortedTimelineIntervals lastObject];
  uint64_t v10 = [v9 startDate];
  [v10 timeIntervalSince1970];
  BOOL v12 = v11 > a3;

  if (!v12) {
    return 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = self->_sortedTimelineIntervals;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v18 = [(PPSValueConverter *)self _latestInterval];
        BOOL v19 = v17 == v18;

        if (!v19)
        {
          long long v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:a3];
          int v21 = [v17 containsDate:v20];

          if (v21)
          {
            v23 = PPSReaderLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v27 = [v17 startDate];
              [v27 timeIntervalSince1970];
              uint64_t v29 = v28;
              v30 = [v17 endDate];
              [v30 timeIntervalSince1970];
              *(_DWORD *)buf = 134218496;
              uint64_t v37 = v29;
              __int16 v38 = 2048;
              uint64_t v39 = v31;
              __int16 v40 = 2048;
              double v41 = a3;
              _os_log_debug_impl(&dword_258F16000, v23, OS_LOG_TYPE_DEBUG, "Selecting build interval [%f, %f] for timestamp '%f' as active conversion region!", buf, 0x20u);
            }
            v24 = [(NSMutableDictionary *)self->_timeline objectForKeyedSubscript:v17];
            selectedHistory = self->_selectedHistory;
            self->_selectedHistory = v24;

            BOOL v22 = 1;
            goto LABEL_21;
          }
        }
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (BOOL)_shouldConvertEvent:(id)a3
{
  id v4 = a3;
  [v4 monotonicTimestamp];
  LOBYTE(self) = -[PPSValueConverter _shouldConvertAtTimestamp:](self, "_shouldConvertAtTimestamp:");

  return (char)self;
}

- (NSArray)metrics
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
}

- (NSMutableDictionary)timeline
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimeline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_selectedHistory, 0);
  objc_storeStrong((id *)&self->_sortedTimelineIntervals, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)_convertValue:(uint64_t)a1 atTimestamp:(uint64_t)a2 usingMetric:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_258F16000, log, OS_LOG_TYPE_ERROR, "Error while performing value conversion for metric name '%@' = %@", (uint8_t *)&v3, 0x16u);
}

- (void)_shouldConvertAtTimestamp:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "Caching sorted timeline interval keys...", v1, 2u);
}

@end