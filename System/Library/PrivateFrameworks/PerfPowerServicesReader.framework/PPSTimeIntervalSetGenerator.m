@interface PPSTimeIntervalSetGenerator
- (NSDateInterval)timelineBoundaries;
- (PPSTimeIntervalSetGenerator)initWithDispatcher:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5;
- (PPSTimeIntervalSetGenerator)initWithFilepath:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5;
- (id)fetchTimeSeriesForBatteryShutdown;
- (id)fetchTimeSeriesForBootTime;
- (id)intervalSetForTimeSeries:(id)a3 withIntervalStartCheckBlock:(id)a4 intervalEndCheckBlock:(id)a5 payloadBlock:(id)a6 coalescePolicy:(id)a7;
- (id)intervalSetMapForTimeSeries:(id)a3 withGroupingDimensions:(id)a4 withIntervalStartCheckBlock:(id)a5 intervalEndCheckBlock:(id)a6 payloadBlock:(id)a7 coalescePolicy:(id)a8;
- (id)systemHaltTimeSeries;
- (id)systemSleepTimeSeries;
@end

@implementation PPSTimeIntervalSetGenerator

- (PPSTimeIntervalSetGenerator)initWithFilepath:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSTimeIntervalSetGenerator;
  v9 = [(PPSTimeIntervalSetGenerator *)&v14 init];
  v10 = v9;
  if (v8 && v9)
  {
    v11 = [[PPSRequestDispatcher alloc] initWithFilepath:v8];
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v11;

    v10->_settings = a4;
    v10->_directionality = a5;
  }

  return v10;
}

- (PPSTimeIntervalSetGenerator)initWithDispatcher:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPSTimeIntervalSetGenerator;
  v10 = [(PPSTimeIntervalSetGenerator *)&v13 init];
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_dispatcher, a3);
    v11->_settings = a4;
    v11->_directionality = a5;
  }

  return v11;
}

- (id)intervalSetForTimeSeries:(id)a3 withIntervalStartCheckBlock:(id)a4 intervalEndCheckBlock:(id)a5 payloadBlock:(id)a6 coalescePolicy:(id)a7
{
  v97[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v95 = a4;
  id v90 = a5;
  objc_super v13 = (void (**)(id, void *, void *, void *))a6;
  id v14 = a7;
  v86 = v12;
  v87 = v14;
  v15 = +[PPSPerformanceProfiler sharedInstance];
  [v15 startProfilingForPhase:@"IntervalSetGeneration"];

  v94 = (void *)[v12 copy];
  unint64_t settings = self->_settings;
  v92 = objc_opt_new();
  if (self->_directionality == 3) {
    goto LABEL_13;
  }
  if (settings)
  {
    v16 = [(PPSTimeIntervalSetGenerator *)self systemSleepTimeSeries];
    if (v16) {
      [v94 mergeWithTimeSeries:v16];
    }
    if ([v16 count])
    {
      v17 = [v16 firstObject];
      uint64_t v18 = [v17 groupId];

      v19 = [NSNumber numberWithUnsignedInteger:v18];
      [v92 addObject:v19];
    }
  }
  if ((settings & 6) == 0)
  {
LABEL_13:
    uint64_t v22 = -1;
  }
  else
  {
    v20 = [(PPSTimeIntervalSetGenerator *)self systemHaltTimeSeries];
    if (v20) {
      [v94 mergeWithTimeSeries:v20];
    }
    if ([v20 count])
    {
      v21 = [v20 firstObject];
      uint64_t v22 = [v21 groupId];

      v23 = [NSNumber numberWithUnsignedInteger:v22];
      [v92 addObject:v23];
    }
    else
    {
      uint64_t v22 = -1;
    }
  }
  v24 = [v94 firstObject];
  [v24 monotonicTimestamp];
  double v26 = v25;

  v27 = [v94 lastObject];
  [v27 monotonicTimestamp];
  double v29 = v28;

  v30 = [(PPSTimeIntervalSetGenerator *)self timelineBoundaries];

  if (v30)
  {
    v31 = [(PPSTimeIntervalSetGenerator *)self timelineBoundaries];
    v32 = [v31 startDate];
    [v32 timeIntervalSince1970];
    double v26 = v33;

    v34 = [(PPSTimeIntervalSetGenerator *)self timelineBoundaries];
    [v34 duration];
    double v29 = v26 + v35;
  }
  v36 = [v94 objectEnumerator];
  unint64_t directionality = self->_directionality;
  if (directionality == 1)
  {
    uint64_t v37 = [v94 reverseObjectEnumerator];

    v36 = (void *)v37;
  }
  else
  {
    double v26 = v29;
  }
  v91 = [[PPSTimeIntervalSet alloc] initWithCoalescePolicy:v14];
  uint64_t v84 = v22;
  v96 = @"__directionality";
  v38 = [NSNumber numberWithUnsignedInteger:self->_directionality];
  v97[0] = v38;
  v39 = [NSDictionary dictionaryWithObjects:v97 forKeys:&v96 count:1];
  v40 = (void *)[v39 mutableCopy];

  v93 = 0;
  v41 = 0;
  v42 = 0;
LABEL_22:
  v43 = v42;
  while (1)
  {
    v42 = [v36 nextObject];

    unint64_t v44 = self->_directionality;
    if (!v42) {
      break;
    }
    if (v44 == 3)
    {
      v45 = [v42 metricValueForKey:@"timestampEnd"];
      [v45 doubleValue];
      double v47 = v46;

      v43 = v42;
      if (PPSValidateIntervalStart(v95, v42, v40))
      {
        if (v13)
        {
          v13[2](v13, v42, v42, v40);
          v48 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = 0;
        }

        [v42 monotonicTimestamp];
        v93 = v48;
        PPSAddInterval(v91, v60, v47, v48);
        goto LABEL_22;
      }
    }
    else
    {
      v43 = v42;
      if (v44 < 3)
      {
        uint64_t v49 = [v42 groupId];
        v50 = [NSNumber numberWithUnsignedInteger:v49];
        int v51 = [v92 containsObject:v50];

        if (v51)
        {
          if (v41)
          {
            id v52 = 0;
            if ([v41 groupId] != v49 && ((v49 == v84) & (settings >> 2)) == 0)
            {
              if (v13)
              {
                v13[2](v13, v41, v42, v40);
                v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v53 = 0;
              }

              [v41 monotonicTimestamp];
              double v70 = v69;
              [v42 monotonicTimestamp];
              if (directionality == 1) {
                double v72 = v71;
              }
              else {
                double v72 = v70;
              }
              if (directionality == 1) {
                double v73 = v70;
              }
              else {
                double v73 = v71;
              }
              PPSAddInterval(v91, v72, v73, v53);
              id v52 = 0;
              v93 = v53;
            }
          }
          else
          {
            id v52 = 0;
          }
          goto LABEL_67;
        }
        if (v41)
        {
          v83 = v41;
          id v54 = v90;
          id v55 = v42;
          id v56 = v40;
          v57 = v56;
          v85 = v55;
          if (v90)
          {
            char v58 = (*((uint64_t (**)(id, id, id))v90 + 2))(v54, v55, v56);

            v41 = v83;
            v59 = v85;
            if ((v58 & 1) == 0 && !PPSValidateIntervalStart(v95, v85, v57)) {
              goto LABEL_55;
            }
          }
          else
          {

            v41 = v83;
            v59 = v85;
          }
          [v41 monotonicTimestamp];
          double v62 = v61;
          [v59 monotonicTimestamp];
          double v64 = v63;
          if (v13)
          {
            v13[2](v13, v41, v85, v57);
            v65 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v65 = 0;
          }

          if (directionality == 1) {
            double v66 = v64;
          }
          else {
            double v66 = v62;
          }
          if (directionality == 1) {
            double v67 = v62;
          }
          else {
            double v67 = v64;
          }
          v93 = v65;
          PPSAddInterval(v91, v66, v67, v65);
        }
LABEL_55:
        if (PPSValidateIntervalStart(v95, v42, v40)) {
          v68 = v42;
        }
        else {
          v68 = 0;
        }
        id v52 = v68;
LABEL_67:

        v41 = v52;
        goto LABEL_22;
      }
    }
  }
  if (v44 == 3 || v41 == 0)
  {
    v75 = v93;
  }
  else
  {
    v75 = (NSDictionary *)v13;
    [v41 monotonicTimestamp];
    double v77 = v76;
    if (v13)
    {
      v13[2](v13, v41, 0, v40);
      v75 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }

    if (directionality == 1) {
      double v78 = v26;
    }
    else {
      double v78 = v77;
    }
    if (directionality == 1) {
      double v79 = v77;
    }
    else {
      double v79 = v26;
    }
    PPSAddInterval(v91, v78, v79, v75);
  }
  v80 = +[PPSPerformanceProfiler sharedInstance];
  [v80 endProfilingForPhase:@"IntervalSetGeneration"];

  v81 = v91;
  return v81;
}

- (id)intervalSetMapForTimeSeries:(id)a3 withGroupingDimensions:(id)a4 withIntervalStartCheckBlock:(id)a5 intervalEndCheckBlock:(id)a6 payloadBlock:(id)a7 coalescePolicy:(id)a8
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v43 = a4;
  id v35 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v40 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v13;
  uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (v14)
        {
          if (![v43 count]) {
            goto LABEL_22;
          }
          v45 = objc_opt_new();
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v15 = v43;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v49 != v17) {
                  objc_enumerationMutation(v15);
                }
                v19 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                v20 = NSString;
                v21 = [v14 metricKeysAndValues];
                uint64_t v22 = [v19 groupBy];
                v23 = [v21 objectForKeyedSubscript:v22];
                v24 = [v20 stringWithFormat:@"%@", v23];

                if (v24)
                {
                  double v25 = [v19 groupBy];
                  [v45 setObject:v24 forKeyedSubscript:v25];
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v16);
          }

          double v26 = [v40 objectForKeyedSubscript:v45];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            double v28 = (void *)MEMORY[0x263F08A98];
            v46[0] = MEMORY[0x263EF8330];
            v46[1] = 3221225472;
            v46[2] = __160__PPSTimeIntervalSetGenerator_intervalSetMapForTimeSeries_withGroupingDimensions_withIntervalStartCheckBlock_intervalEndCheckBlock_payloadBlock_coalescePolicy___block_invoke;
            v46[3] = &unk_265443448;
            id v29 = v45;
            id v47 = v29;
            v30 = [v28 predicateWithBlock:v46];
            v31 = [obj filteredTimeSeriesUsingPredicate:v30];
            v32 = [(PPSTimeIntervalSetGenerator *)self intervalSetForTimeSeries:v31 withIntervalStartCheckBlock:v35 intervalEndCheckBlock:v36 payloadBlock:v37 coalescePolicy:v38];
            [v40 setObject:v32 forKeyedSubscript:v29];
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v42);
  }
LABEL_22:

  return v40;
}

uint64_t __160__PPSTimeIntervalSetGenerator_intervalSetMapForTimeSeries_withGroupingDimensions_withIntervalStartCheckBlock_intervalEndCheckBlock_payloadBlock_coalescePolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = objc_msgSend(v3, "metricKeysAndValues", (void)v14);
        v10 = [v9 objectForKeyedSubscript:v8];
        v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        LOBYTE(v8) = [v10 isEqual:v11];

        if ((v8 & 1) == 0)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (id)systemHaltTimeSeries
{
  return 0;
}

- (id)systemSleepTimeSeries
{
  return 0;
}

- (id)fetchTimeSeriesForBootTime
{
  id v3 = PPSCreateSubsystemCategoryPredicate(@"ConfigMetrics", @"DeviceConfig", 0);
  id v4 = [PPSTimeSeriesRequest alloc];
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2707149F8];
  uint64_t v6 = [(PPSTimeSeriesRequest *)v4 initWithMetrics:v5 predicate:v3 timeFilter:0];

  dispatcher = self->_dispatcher;
  uint64_t v10 = 0;
  uint64_t v8 = [(PPSRequestDispatcher *)dispatcher dataForRequest:v6 withError:&v10];

  return v8;
}

- (id)fetchTimeSeriesForBatteryShutdown
{
  id v3 = PPSCreateSubsystemCategoryPredicate(@"BatteryMetrics", @"BatteryShutdown", 0);
  id v4 = [PPSTimeSeriesRequest alloc];
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_270714A10];
  uint64_t v6 = [(PPSTimeSeriesRequest *)v4 initWithMetrics:v5 predicate:v3 timeFilter:0];

  dispatcher = self->_dispatcher;
  uint64_t v10 = 0;
  uint64_t v8 = [(PPSRequestDispatcher *)dispatcher dataForRequest:v6 withError:&v10];

  return v8;
}

- (NSDateInterval)timelineBoundaries
{
  return [(PPSRequestDispatcher *)self->_dispatcher timelineBoundaries];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineBoundaries, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end