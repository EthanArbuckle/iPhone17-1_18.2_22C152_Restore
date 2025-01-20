@interface RTVisitPipelineModuleStats
- (RTVisitPipelineModuleStats)init;
- (double)cumulativeLocationIntervalForDirection:(id)a3;
- (double)cumulativeMaxLocationOutageIntervalForDirection:(id)a3;
- (double)cumulativeProcessingDuration;
- (double)lastLocationIntervalForDirection:(id)a3;
- (double)lastMaxLocationOutageIntervalForDirection:(id)a3;
- (double)lastProcessingDuration;
- (double)maxLocationIntervalForDirection:(id)a3;
- (double)maxLocationOutageIntervalForDirection:(id)a3;
- (double)maxProcessingDuration;
- (id)description;
- (unint64_t)cumulativeLocationCountForDirection:(id)a3;
- (unint64_t)cumulativeVisitCountForDirection:(id)a3;
- (unint64_t)lastLocationCount;
- (unint64_t)lastLocationCountForDirection:(id)a3;
- (unint64_t)lastVisitCountForDirection:(id)a3;
- (unint64_t)maxLocationCountForDirection:(id)a3;
- (unint64_t)maxVisitCountForDirection:(id)a3;
- (void)setLocationCountForVisitCluster:(id)a3 direction:(id)a4;
- (void)setLocationIntervalForVisitCluster:(id)a3 direction:(id)a4;
- (void)setMaxLocationOutageIntervalForVisitCluster:(id)a3 direction:(id)a4;
- (void)setVisitCountForVisitCluster:(id)a3 direction:(id)a4;
- (void)startIterationWithVisitClusters:(id)a3;
- (void)stopIterationWithVisitClusters:(id)a3;
@end

@implementation RTVisitPipelineModuleStats

- (RTVisitPipelineModuleStats)init
{
  v22.receiver = self;
  v22.super_class = (Class)RTVisitPipelineModuleStats;
  v2 = [(RTVisitPipelineModuleStats *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    iterationDurations = v2->_iterationDurations;
    v2->_iterationDurations = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    iterationLocationIntervals = v2->_iterationLocationIntervals;
    v2->_iterationLocationIntervals = (NSMutableDictionary *)v5;

    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationLocationIntervals setObject:v7 forKeyedSubscript:@"in"];

    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationLocationIntervals setObject:v8 forKeyedSubscript:@"out"];

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    iterationLocationCounts = v2->_iterationLocationCounts;
    v2->_iterationLocationCounts = (NSMutableDictionary *)v9;

    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationLocationCounts setObject:v11 forKeyedSubscript:@"in"];

    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationLocationCounts setObject:v12 forKeyedSubscript:@"out"];

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    iterationMaxLocationOutageIntervals = v2->_iterationMaxLocationOutageIntervals;
    v2->_iterationMaxLocationOutageIntervals = (NSMutableDictionary *)v13;

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationMaxLocationOutageIntervals setObject:v15 forKeyedSubscript:@"in"];

    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationMaxLocationOutageIntervals setObject:v16 forKeyedSubscript:@"out"];

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    iterationVistCount = v2->_iterationVistCount;
    v2->_iterationVistCount = (NSMutableDictionary *)v17;

    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationVistCount setObject:v19 forKeyedSubscript:@"in"];

    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v2->_iterationVistCount setObject:v20 forKeyedSubscript:@"out"];
  }
  return v2;
}

- (id)description
{
  v45 = NSString;
  unint64_t v44 = [(RTVisitPipelineModuleStats *)self lastLocationCountForDirection:@"in"];
  unint64_t v43 = [(RTVisitPipelineModuleStats *)self lastLocationCountForDirection:@"out"];
  unint64_t v42 = [(RTVisitPipelineModuleStats *)self cumulativeLocationCountForDirection:@"in"];
  unint64_t v3 = [(RTVisitPipelineModuleStats *)self cumulativeLocationCountForDirection:@"out"];
  unint64_t v4 = [(RTVisitPipelineModuleStats *)self maxLocationCountForDirection:@"in"];
  unint64_t v5 = [(RTVisitPipelineModuleStats *)self maxLocationCountForDirection:@"out"];
  [(RTVisitPipelineModuleStats *)self lastLocationIntervalForDirection:@"in"];
  uint64_t v41 = v6;
  [(RTVisitPipelineModuleStats *)self lastLocationIntervalForDirection:@"out"];
  uint64_t v40 = v7;
  [(RTVisitPipelineModuleStats *)self cumulativeLocationIntervalForDirection:@"in"];
  uint64_t v39 = v8;
  [(RTVisitPipelineModuleStats *)self cumulativeLocationIntervalForDirection:@"out"];
  uint64_t v38 = v9;
  [(RTVisitPipelineModuleStats *)self maxLocationIntervalForDirection:@"in"];
  uint64_t v37 = v10;
  [(RTVisitPipelineModuleStats *)self maxLocationIntervalForDirection:@"out"];
  uint64_t v36 = v11;
  [(RTVisitPipelineModuleStats *)self lastMaxLocationOutageIntervalForDirection:@"in"];
  uint64_t v13 = v12;
  [(RTVisitPipelineModuleStats *)self lastMaxLocationOutageIntervalForDirection:@"out"];
  uint64_t v15 = v14;
  [(RTVisitPipelineModuleStats *)self cumulativeMaxLocationOutageIntervalForDirection:@"in"];
  uint64_t v17 = v16;
  [(RTVisitPipelineModuleStats *)self cumulativeMaxLocationOutageIntervalForDirection:@"out"];
  uint64_t v19 = v18;
  [(RTVisitPipelineModuleStats *)self maxLocationOutageIntervalForDirection:@"in"];
  uint64_t v21 = v20;
  [(RTVisitPipelineModuleStats *)self maxLocationOutageIntervalForDirection:@"out"];
  uint64_t v23 = v22;
  unint64_t v24 = [(RTVisitPipelineModuleStats *)self lastVisitCountForDirection:@"in"];
  unint64_t v25 = [(RTVisitPipelineModuleStats *)self lastVisitCountForDirection:@"out"];
  unint64_t v26 = [(RTVisitPipelineModuleStats *)self cumulativeVisitCountForDirection:@"in"];
  unint64_t v27 = [(RTVisitPipelineModuleStats *)self cumulativeVisitCountForDirection:@"out"];
  unint64_t v28 = [(RTVisitPipelineModuleStats *)self maxVisitCountForDirection:@"in"];
  unint64_t v29 = [(RTVisitPipelineModuleStats *)self maxVisitCountForDirection:@"out"];
  [(RTVisitPipelineModuleStats *)self lastProcessingDuration];
  uint64_t v31 = v30;
  [(RTVisitPipelineModuleStats *)self cumulativeProcessingDuration];
  uint64_t v33 = v32;
  [(RTVisitPipelineModuleStats *)self maxProcessingDuration];
  return (id)objc_msgSend(v45, "stringWithFormat:", @"lastLocationCount(in/out), %lu/%lu, cumulativeLocationCount(in/out), %lu/%lu, maxLocationsCount(in/out), %lu/%lu, lastLocationInterval(in/out), %.2f/%.2f, cumulativeLocationInterval(in/out), %.2f/%.2f, maxLocationInterval(in/out), %.2f/%.2f, lastMaxLocationOutageInterval(in/out), %.2f/%.2f, maxLocationOutageInterval(in/out), %.2f/%.2f, maxLocationOutageInterval(in/out), %.2f/%.2f, lastVisitCount(in/out), %lu/%lu, cumulativeVisitCount(in/out), %lu/%lu, maxVisitCount(in/out), %lu/%lu, lastProcessingDuration, %.2f, cumulativeProcessingDuration, %.2f, maxProcessingDuration, %.2f", v44, v43, v42, v3, v4, v5, v41, v40, v39, v38, v37, v36, v13, v15, v17, v19,
               v21,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v31,
               v33,
               v34);
}

- (void)setLocationCountForVisitCluster:(id)a3 direction:(id)a4
{
  id v18 = a4;
  uint64_t v6 = [a3 valueForKeyPath:@"@sum.points.locations.@count"];
  uint64_t v7 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:v18];
  [v7 setObject:v6 forKeyedSubscript:@"last"];

  uint64_t v8 = NSNumber;
  uint64_t v9 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:v18];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"cumulative"];
  uint64_t v11 = [v8 numberWithUnsignedInteger:[v6 unsignedIntegerValue] + [v10 unsignedIntegerValue]];
  uint64_t v12 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:v18];
  [v12 setObject:v11 forKeyedSubscript:@"cumulative"];

  unint64_t v13 = [v6 unsignedIntegerValue];
  uint64_t v14 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:v18];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"max"];
  unint64_t v16 = [v15 unsignedIntegerValue];

  if (v13 > v16)
  {
    uint64_t v17 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:v18];
    [v17 setObject:v6 forKeyedSubscript:@"max"];
  }
}

- (void)setLocationIntervalForVisitCluster:(id)a3 direction:(id)a4
{
  uint64_t v36 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v38 = a4;
  id obj = v5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v40 = *(void *)v42;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v11 = [v10 points:v36];
        uint64_t v12 = [v11 locations];
        unint64_t v13 = [v12 lastObject];
        uint64_t v14 = [v13 date];
        uint64_t v15 = [v10 points];
        unint64_t v16 = [v15 locations];
        uint64_t v17 = [v16 firstObject];
        id v18 = [v17 date];
        [v14 timeIntervalSinceDate:v18];
        double v8 = v8 + v19;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0.0;
  }
  uint64_t v20 = [NSNumber numberWithDouble:v8, v36];
  uint64_t v21 = [*(id *)(v37 + 24) objectForKeyedSubscript:v38];
  [v21 setObject:v20 forKeyedSubscript:@"last"];

  [v20 doubleValue];
  double v23 = v22;
  unint64_t v24 = [*(id *)(v37 + 32) objectForKeyedSubscript:v38];
  unint64_t v25 = [v24 objectForKeyedSubscript:@"max"];
  [v25 doubleValue];
  double v27 = v26;

  if (v23 > v27)
  {
    unint64_t v28 = [*(id *)(v37 + 32) objectForKeyedSubscript:v38];
    [v28 setObject:v20 forKeyedSubscript:@"max"];
  }
  [v20 doubleValue];
  double v30 = v29;
  uint64_t v31 = [*(id *)(v37 + 24) objectForKeyedSubscript:v38];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"max"];
  [v32 doubleValue];
  double v34 = v33;

  if (v30 > v34)
  {
    v35 = [*(id *)(v37 + 24) objectForKeyedSubscript:v38];
    [v35 setObject:v20 forKeyedSubscript:@"max"];
  }
}

- (void)setMaxLocationOutageIntervalForVisitCluster:(id)a3 direction:(id)a4
{
  long long v41 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v43 = a4;
  id obj = v5;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v45 = *(void *)v51;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v11 = [v10 points:v41];
        uint64_t v12 = [v11 locations];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          id v15 = 0;
          uint64_t v16 = *(void *)v47;
          do
          {
            uint64_t v17 = 0;
            id v18 = v15;
            do
            {
              if (*(void *)v47 != v16) {
                objc_enumerationMutation(v12);
              }
              double v19 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
              if (v18)
              {
                uint64_t v20 = [*(id *)(*((void *)&v46 + 1) + 8 * v17) date];
                uint64_t v21 = [v18 date];
                [v20 timeIntervalSinceDate:v21];
                double v23 = v22;

                if (v23 > v8) {
                  double v8 = v23;
                }
              }
              id v15 = v19;

              ++v17;
              id v18 = v15;
            }
            while (v14 != v17);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v14);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0.0;
  }
  unint64_t v24 = [NSNumber numberWithDouble:v8, v41];
  unint64_t v25 = [*(id *)(v42 + 32) objectForKeyedSubscript:v43];
  [v25 setObject:v24 forKeyedSubscript:@"last"];

  double v26 = NSNumber;
  double v27 = [*(id *)(v42 + 32) objectForKeyedSubscript:v43];
  unint64_t v28 = [v27 objectForKeyedSubscript:@"cumulative"];
  [v28 doubleValue];
  double v30 = v29;
  [v24 doubleValue];
  uint64_t v32 = [v26 numberWithDouble:v30 + v31];
  double v33 = [*(id *)(v42 + 32) objectForKeyedSubscript:v43];
  [v33 setObject:v32 forKeyedSubscript:@"cumulative"];

  [v24 doubleValue];
  double v35 = v34;
  uint64_t v36 = [*(id *)(v42 + 32) objectForKeyedSubscript:v43];
  uint64_t v37 = [v36 objectForKeyedSubscript:@"max"];
  [v37 doubleValue];
  double v39 = v38;

  if (v35 > v39)
  {
    uint64_t v40 = [*(id *)(v42 + 32) objectForKeyedSubscript:v43];
    [v40 setObject:v24 forKeyedSubscript:@"max"];
  }
}

- (void)setVisitCountForVisitCluster:(id)a3 direction:(id)a4
{
  id v18 = a4;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:[a3 count]];
  uint64_t v7 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:v18];
  [v7 setObject:v6 forKeyedSubscript:@"last"];

  double v8 = NSNumber;
  uint64_t v9 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:v18];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"cumulative"];
  uint64_t v11 = [v8 numberWithUnsignedInteger:[v6 unsignedIntegerValue] + [v10 unsignedIntegerValue]];
  uint64_t v12 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:v18];
  [v12 setObject:v11 forKeyedSubscript:@"cumulative"];

  unint64_t v13 = [v6 unsignedIntegerValue];
  uint64_t v14 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:v18];
  id v15 = [v14 objectForKeyedSubscript:@"max"];
  unint64_t v16 = [v15 unsignedIntegerValue];

  if (v13 > v16)
  {
    uint64_t v17 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:v18];
    [v17 setObject:v6 forKeyedSubscript:@"max"];
  }
}

- (void)startIterationWithVisitClusters:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_startDate)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[RTVisitPipelineModuleStats startIterationWithVisitClusters:]";
      __int16 v10 = 1024;
      int v11 = 163;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "iteration already started (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  startDate = self->_startDate;
  self->_startDate = v6;

  [(RTVisitPipelineModuleStats *)self setLocationCountForVisitCluster:v4 direction:@"in"];
  [(RTVisitPipelineModuleStats *)self setLocationIntervalForVisitCluster:v4 direction:@"in"];
  [(RTVisitPipelineModuleStats *)self setMaxLocationOutageIntervalForVisitCluster:v4 direction:@"in"];
  [(RTVisitPipelineModuleStats *)self setVisitCountForVisitCluster:v4 direction:@"in"];
}

- (void)stopIterationWithVisitClusters:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_startDate)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      id v18 = "-[RTVisitPipelineModuleStats stopIterationWithVisitClusters:]";
      __int16 v19 = 1024;
      int v20 = 180;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "iteration not started (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }
  }
  uint64_t v6 = NSNumber;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:self->_startDate];
  int v8 = [v6 numberWithDouble:];

  [(NSMutableDictionary *)self->_iterationDurations setObject:v8 forKeyedSubscript:@"last"];
  uint64_t v9 = [(NSMutableDictionary *)self->_iterationDurations objectForKeyedSubscript:@"max"];

  if (v8 > v9) {
    [(NSMutableDictionary *)self->_iterationDurations setObject:v8 forKeyedSubscript:@"max"];
  }
  __int16 v10 = NSNumber;
  int v11 = [(NSMutableDictionary *)self->_iterationDurations objectForKeyedSubscript:@"cumulative"];
  [v11 doubleValue];
  double v13 = v12;
  [v8 doubleValue];
  id v15 = [v10 numberWithDouble:v13 + v14];
  [(NSMutableDictionary *)self->_iterationDurations setObject:v15 forKeyedSubscript:@"cumulative"];

  startDate = self->_startDate;
  self->_startDate = 0;

  [(RTVisitPipelineModuleStats *)self setLocationCountForVisitCluster:v4 direction:@"out"];
  [(RTVisitPipelineModuleStats *)self setLocationIntervalForVisitCluster:v4 direction:@"out"];
  [(RTVisitPipelineModuleStats *)self setMaxLocationOutageIntervalForVisitCluster:v4 direction:@"out"];
  [(RTVisitPipelineModuleStats *)self setVisitCountForVisitCluster:v4 direction:@"out"];
}

- (double)lastProcessingDuration
{
  v2 = [(NSMutableDictionary *)self->_iterationDurations objectForKeyedSubscript:@"last"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)cumulativeProcessingDuration
{
  v2 = [(NSMutableDictionary *)self->_iterationDurations objectForKeyedSubscript:@"cumulative"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)maxProcessingDuration
{
  v2 = [(NSMutableDictionary *)self->_iterationDurations objectForKeyedSubscript:@"max"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)lastLocationCount
{
  return [(RTVisitPipelineModuleStats *)self lastLocationCountForDirection:@"out"];
}

- (unint64_t)lastLocationCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"last"];
  [v4 doubleValue];
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (unint64_t)cumulativeLocationCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"cumulative"];
  [v4 doubleValue];
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (unint64_t)maxLocationCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationCounts objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"max"];
  [v4 doubleValue];
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (double)lastLocationIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"last"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)cumulativeLocationIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"cumulative"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maxLocationIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationLocationIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"max"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)lastMaxLocationOutageIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationMaxLocationOutageIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"last"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)cumulativeMaxLocationOutageIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationMaxLocationOutageIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"cumulative"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maxLocationOutageIntervalForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationMaxLocationOutageIntervals objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"max"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (unint64_t)lastVisitCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"last"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (unint64_t)cumulativeVisitCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"cumulative"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (unint64_t)maxVisitCountForDirection:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_iterationVistCount objectForKeyedSubscript:a3];
  double v4 = [v3 objectForKeyedSubscript:@"max"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_iterationVistCount, 0);
  objc_storeStrong((id *)&self->_iterationMaxLocationOutageIntervals, 0);
  objc_storeStrong((id *)&self->_iterationLocationIntervals, 0);
  objc_storeStrong((id *)&self->_iterationLocationCounts, 0);

  objc_storeStrong((id *)&self->_iterationDurations, 0);
}

@end