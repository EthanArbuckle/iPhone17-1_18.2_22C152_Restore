@interface PLBatteryUIResponseTypeUsageTimes_iOS
- (BOOL)energyEntryValidForAdjustment:(id)a3;
- (BOOL)gatherDependencies;
- (NSArray)aggregateEntries;
- (NSDate)end;
- (NSDate)start;
- (NSDictionary)resultDictionary;
- (NSMutableArray)batteryBreakdown_buckets;
- (NSMutableArray)batteryBreakdown_lastDay;
- (PLBatteryUIResponderService)responderService;
- (_PLTimeIntervalRange)getDataRange:(id)a3;
- (double)bucketSize;
- (double)range;
- (id)dependencies;
- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4;
- (id)result;
- (int)adjustScreenOffTimeWithGraphValue:(double)a3 screenOnTime:(double)a4 andEnergyEntries:(id)a5;
- (int)adjustScreenOnTimeWithGraphValue:(double)a3 andEnergyEntries:(id)a4;
- (void)configure:(id)a3;
- (void)gatherDependencies;
- (void)run;
- (void)setAggregateEntries:(id)a3;
- (void)setBatteryBreakdown_buckets:(id)a3;
- (void)setBatteryBreakdown_lastDay:(id)a3;
- (void)setBucketSize:(double)a3;
- (void)setEnd:(id)a3;
- (void)setRange:(double)a3;
- (void)setResponderService:(id)a3;
- (void)setResultDictionary:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PLBatteryUIResponseTypeUsageTimes_iOS

- (id)dependencies
{
  return &unk_1F4013150;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"end"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setStart:v11];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setEnd:v12];

  v13 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self end];
  v14 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self start];
  [v13 timeIntervalSinceDate:v14];
  -[PLBatteryUIResponseTypeUsageTimes_iOS setRange:](self, "setRange:");

  v15 = [v4 objectForKeyedSubscript:@"bucket"];

  [v15 doubleValue];
  -[PLBatteryUIResponseTypeUsageTimes_iOS setBucketSize:](self, "setBucketSize:");

  v16 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self start];
  v17 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self end];
  [v16 timeIntervalSince1970];
  double v19 = v18;
  [v17 timeIntervalSince1970];
  double v21 = v20 - v19;

  v22 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v23 = [v22 convertFromMonotonicToSystem];
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self getDataRange:v23];
  double v25 = v24;
  double v27 = v26;

  double v28 = v19 + -1800.0;
  double v29 = v19 + -1800.0 + v21;
  if (v19 + -1800.0 >= v25 || v29 <= v25)
  {
    double v30 = v25 + v27;
    if (v25 >= v28 || v30 <= v28)
    {
      double v31 = 0.0;
      if (v28 != v25 || v21 <= 0.0)
      {
        double v33 = 0.0;
        goto LABEL_15;
      }
      BOOL v32 = v27 <= 0.0;
      double v33 = 0.0;
      if (v32) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    double v30 = v25 + v27;
  }
  if (v28 >= v25) {
    double v31 = v28;
  }
  else {
    double v31 = v25;
  }
  if (v29 >= v30) {
    double v29 = v30;
  }
  double v33 = v29 - v31;
LABEL_15:
  id v37 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self responderService];
  v34 = [v37 storage];
  v35 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  v36 = objc_msgSend(v34, "entriesForKey:inTimeRange:withFilters:", v35, 0, v31, v33);
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setAggregateEntries:v36];
}

- (void)run
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Usage Times: failed to gather dependencies. Times will not be adjusted.", v1, 2u);
}

- (id)result
{
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setAggregateEntries:0];
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setBatteryBreakdown_lastDay:0];
  [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setBatteryBreakdown_buckets:0];
  return [(PLBatteryUIResponseTypeUsageTimes_iOS *)self resultDictionary];
}

- (BOOL)gatherDependencies
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self batteryBreakdown_lastDay];

  if (!v3)
  {
    id v4 = PLBatteryUsageUIKeyFromConfiguration();
    v5 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self responderService];
    double v6 = [v5 responseCache];
    double v7 = [v6 objectForKeyedSubscript:&unk_1F400C4D8];
    v8 = [v7 objectForKeyedSubscript:v4];
    double v9 = [v8 objectForKeyedSubscript:@"result"];
    double v10 = [v9 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];

    if (!v10)
    {
      double v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUIResponseTypeUsageTimes_iOS gatherDependencies]();
      }

      goto LABEL_16;
    }
    [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setBatteryBreakdown_lastDay:v10];
  }
  v11 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self batteryBreakdown_buckets];

  if (!v11)
  {
    v29[0] = @"end";
    v12 = (void *)MEMORY[0x1E4F28ED0];
    v13 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self end];
    v14 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self start];
    [v13 timeIntervalSinceDate:v14];
    v15 = objc_msgSend(v12, "numberWithDouble:");
    v29[1] = @"bucket";
    v30[0] = v15;
    v16 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryUIResponseTypeUsageTimes_iOS *)self bucketSize];
    v17 = objc_msgSend(v16, "numberWithDouble:");
    v30[1] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    id v4 = PLBatteryUsageUIKeyFromConfiguration();

    double v19 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self responderService];
    double v20 = [v19 responseCache];
    double v21 = [v20 objectForKeyedSubscript:&unk_1F400C4D8];
    v22 = [v21 objectForKeyedSubscript:v4];
    v23 = [v22 objectForKeyedSubscript:@"result"];
    double v24 = [v23 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];

    if (v24)
    {
      [(PLBatteryUIResponseTypeUsageTimes_iOS *)self setBatteryBreakdown_buckets:v24];

      goto LABEL_7;
    }
    double v27 = PLLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(PLBatteryUIResponseTypeUsageTimes_iOS *)self gatherDependencies];
    }

LABEL_16:
    BOOL v25 = 0;
    goto LABEL_17;
  }
LABEL_7:
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeUsageTimes_iOS gatherDependencies]();
  }
  BOOL v25 = 1;
LABEL_17:

  return v25;
}

- (int)adjustScreenOnTimeWithGraphValue:(double)a3 andEnergyEntries:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([(PLBatteryUIResponseTypeUsageTimes_iOS *)self energyEntryValidForAdjustment:v12])
          {
            v13 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            [v13 doubleValue];
            double v15 = v14;
            v16 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppCallOffScreenTimeKey"];
            [v16 doubleValue];
            double v18 = v15 - v17;

            double v19 = v18 / 60.0;
            if (v18 < 0.0) {
              double v19 = 0.0;
            }
            double v10 = v10 + floor(v19) * 60.0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
    }

    int v20 = (int)v10;
    id v5 = v22;
  }
  else
  {
    int v20 = 0;
  }

  return v20;
}

- (int)adjustScreenOffTimeWithGraphValue:(double)a3 screenOnTime:(double)a4 andEnergyEntries:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([v8 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v8;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    double v11 = 0.0;
    double v12 = 0.0;
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([(PLBatteryUIResponseTypeUsageTimes_iOS *)self energyEntryValidForAdjustment:v16])
          {
            double v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
            [v17 doubleValue];
            double v19 = v18;
            int v20 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppCallOffScreenTimeKey"];
            [v20 doubleValue];
            double v22 = v19 + v21;

            double v12 = v12 + floor(v22 / 60.0) * 60.0;
            if (v22 > v11) {
              double v11 = v22;
            }
          }
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    if (v12 >= a3) {
      double v23 = a3;
    }
    else {
      double v23 = v12;
    }
    double v24 = v11 - a4;
    if (v11 - a4 < 0.0) {
      double v24 = 0.0;
    }
    if (v23 < v24) {
      double v23 = v24;
    }
    int v25 = (int)v23;
    id v8 = v27;
  }
  else
  {
    int v25 = 0;
  }

  return v25;
}

- (BOOL)energyEntryValidForAdjustment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
  int v5 = [v4 intValue];

  id v6 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  int v7 = (int)((double)(int)[v6 intValue] + 0.5);

  id v8 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
  [v11 doubleValue];
  double v13 = v12;

  uint64_t v14 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

  double v15 = v10 + v13;
  if (v7 <= 0 && v15 < 60.0)
  {
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  BOOL v17 = 0;
  if (v5 != 5 && v5 != 2)
  {
    if (v5 != 1 || (objc_msgSend(v14, "isEqualToString:", @"PowerOutAccessories", v15) & 1) == 0)
    {
      BOOL v17 = 1;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_11:

  return v17;
}

- (_PLTimeIntervalRange)getDataRange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F92D20];
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  id v37 = [MEMORY[0x1E4F92968] entryKeyForType:v5 andName:*MEMORY[0x1E4F92B48]];
  int v7 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self responderService];
  id v8 = [v7 storage];
  double v9 = [v8 firstEntryForKey:v6];

  if (v9)
  {
    id v10 = [v9 entryDate];
    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:].cold.4();
    }
  }
  else
  {
    double v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeUsageTimes_iOS getDataRange:]();
    }

    id v10 = v4;
  }
  double v13 = [(PLBatteryUIResponseTypeUsageTimes_iOS *)self responderService];
  uint64_t v14 = [v13 storage];
  double v15 = [v14 firstEntryForKey:v37];

  if (v15)
  {
    id v16 = [v15 entryDate];
    BOOL v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }
  }
  else
  {
    double v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }

    id v16 = v4;
  }
  double v19 = [v16 laterDate:v10];
  id v20 = v4;
  [v19 timeIntervalSince1970];
  double v22 = v21;
  [v20 timeIntervalSince1970];
  double v24 = v23;

  double v25 = v24 - v22;
  long long v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = NSString;
    v36 = v15;
    long long v28 = v9;
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
    id v29 = v10;
    v31 = long long v30 = v6;
    BOOL v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v25];
    uint64_t v33 = [v27 stringWithFormat:@"Start: %@, End %@", v31, v32];

    double v9 = v28;
    double v15 = v36;

    id v6 = v30;
    id v10 = v29;
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);
  }
  double v34 = v22;
  double v35 = v25;
  result.length = v35;
  result.location = v34;
  return result;
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = location + length;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (void)v21);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          id v16 = v15;
          [v15 timeIntervalSince1970];
          double v18 = v17;

          if (location <= v18 && v18 < v12) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (double)range
{
  return self->_range;
}

- (void)setRange:(double)a3
{
  self->_range = a3;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)aggregateEntries
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAggregateEntries:(id)a3
{
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResultDictionary:(id)a3
{
}

- (NSMutableArray)batteryBreakdown_buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryBreakdown_buckets:(id)a3
{
}

- (NSMutableArray)batteryBreakdown_lastDay
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatteryBreakdown_lastDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_lastDay, 0);
  objc_storeStrong((id *)&self->_batteryBreakdown_buckets, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_aggregateEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)gatherDependencies
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Usage Times: Successfully retrieved Battery Breakdown from cache", v2, v3, v4, v5, v6);
}

- (void)getDataRange:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No first usage time entry!", v2, v3, v4, v5, v6);
}

@end