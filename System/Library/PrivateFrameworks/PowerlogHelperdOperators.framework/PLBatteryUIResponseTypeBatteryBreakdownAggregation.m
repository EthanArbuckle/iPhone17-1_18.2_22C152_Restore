@interface PLBatteryUIResponseTypeBatteryBreakdownAggregation
- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4;
- (BOOL)isForegroundOnlyBucket:(signed __int16)a3;
- (BOOL)shouldShowBreakdown:(id)a3;
- (NSMutableDictionary)backgroundAudioBreakdown;
- (NSMutableDictionary)backgroundAudioPluggedInBreakdown;
- (NSMutableDictionary)backgroundLocationAudioBreakdown;
- (NSMutableDictionary)backgroundLocationAudioPluggedInBreakdown;
- (NSMutableDictionary)backgroundLocationBreakdown;
- (NSMutableDictionary)backgroundLocationPluggedInBreakdown;
- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4;
- (void)addFgEnergyForMetrics:(id)a3 qualificationID:(id)a4 rootNodeQualificationEnergy:(id)a5 energyEntry:(id)a6;
- (void)addRNEForMetrics:(id)a3 rootNodeEnergy:(id)a4 energyEntry:(id)a5;
- (void)bgLocationAudioTimeApps:(id)a3;
- (void)bgLocationAudioTimeRuntimes:(id)a3 bundleID:(id)a4;
- (void)filterEnergyEntries:(id)a3;
- (void)initBackgroundLocationAudioTime;
- (void)populateBackgroundLocationAudioTime:(id)a3 bundleID:(id)a4;
- (void)populateEnergyBucketKeysWithEntries:(id)a3;
- (void)setBackgroundAudioBreakdown:(id)a3;
- (void)setBackgroundAudioPluggedInBreakdown:(id)a3;
- (void)setBackgroundLocationAudioBreakdown:(id)a3;
- (void)setBackgroundLocationAudioPluggedInBreakdown:(id)a3;
- (void)setBackgroundLocationBreakdown:(id)a3;
- (void)setBackgroundLocationPluggedInBreakdown:(id)a3;
@end

@implementation PLBatteryUIResponseTypeBatteryBreakdownAggregation

- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4
{
  if (a4.location == 0.0 && a4.length == 0.0)
  {
    double location = result.location;
    goto LABEL_21;
  }
  double v5 = result.location + result.length;
  if (result.location < a4.location)
  {
    BOOL v6 = v5 == a4.location;
    BOOL v7 = v5 < a4.location;
  }
  else
  {
    BOOL v6 = 1;
    BOOL v7 = 0;
  }
  if (!v7 && !v6)
  {
    double v8 = a4.location + a4.length;
LABEL_14:
    if (result.location >= a4.location) {
      double location = a4.location;
    }
    else {
      double location = result.location;
    }
    if (v5 >= v8) {
      double v9 = v5;
    }
    else {
      double v9 = v8;
    }
    result.length = v9 - location;
    goto LABEL_21;
  }
  double v8 = a4.location + a4.length;
  if (a4.location < result.location && v8 > result.location) {
    goto LABEL_14;
  }
  double location = 0.0;
  if (result.location != a4.location || result.length <= 0.0)
  {
    result.length = 0.0;
    goto LABEL_21;
  }
  result.length = 0.0;
  if (a4.length > 0.0) {
    goto LABEL_14;
  }
LABEL_21:
  double v10 = location;
  result.double location = v10;
  return result;
}

- (void)populateEnergyBucketKeysWithEntries:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v32 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v29 = v3;
  id obj = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v33 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v4;
        double v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        __int16 v6 = 1;
        do
        {
          BOOL v7 = NSString;
          double v8 = [MEMORY[0x1E4F28ED0] numberWithShort:v6];
          double v9 = [v7 stringWithFormat:@"%@", v8];

          double v10 = [NSString stringWithFormat:@"%@%@", @"fg", v9];
          v11 = [NSString stringWithFormat:@"%@%@", @"bg", v9];
          v12 = [v5 objectForKeyedSubscript:v9];
          uint64_t v13 = [v12 intValue];

          v14 = [v5 objectForKeyedSubscript:v10];
          int v15 = [v14 intValue];

          if ([(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self isForegroundOnlyBucket:v6])
          {
            int v15 = v13;
            if ((int)v13 >= 1)
            {
              v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v13];
              [v5 setObject:v16 forKeyedSubscript:v10];

              int v15 = v13;
            }
          }
          uint64_t v17 = (v13 - v15);
          if ((int)v17 >= 1)
          {
            v18 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
            [v18 doubleValue];
            double v20 = v19;

            v21 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            [v21 doubleValue];
            double v23 = v22;

            double v24 = v20 + v23;
            if (v20 + v23 <= 0.0
              || ((double v24 = v20 / v24 * (double)(int)v13, (int)v17 >= (int)v24)
                ? (uint64_t v17 = (int)v24)
                : (uint64_t v17 = v17),
                  (int)v17 >= 1))
            {
              v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v17, v24);
              [v5 setObject:v25 forKeyedSubscript:v11];

              int v15 = v13 - v17;
              v26 = [MEMORY[0x1E4F28ED0] numberWithInt:(v13 - v17)];
              [v5 setObject:v26 forKeyedSubscript:v10];
            }
          }
          v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v35 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            *(_DWORD *)buf = 138413314;
            v42 = v35;
            __int16 v43 = 2112;
            v44 = v9;
            __int16 v45 = 1024;
            int v46 = v13;
            __int16 v47 = 1024;
            int v48 = v15;
            __int16 v49 = 1024;
            int v50 = v17;
            _os_log_debug_impl(&dword_1E4220000, v27, OS_LOG_TYPE_DEBUG, "%@: %@ total:%d fg:%d bg:%d", buf, 0x28u);
          }
          unsigned int v28 = (unsigned __int16)v6++;
        }
        while (v28 < 0x11);
        [v32 addObject:v5];
        uint64_t v4 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v33);
  }

  [v29 setObject:v32 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  return 0;
}

- (void)addRNEForMetrics:(id)a3 rootNodeEnergy:(id)a4 energyEntry:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  uint64_t v9 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getEnergyMetricBucketForRootNodeID:a3];
  double v10 = NSString;
  v11 = [MEMORY[0x1E4F28ED0] numberWithShort:v9];
  v12 = [v10 stringWithFormat:@"%@", v11];

  if (v12)
  {
    int v13 = [v18 intValue];
    if (v13 >= 1)
    {
      int v14 = v13;
      int v15 = (void *)MEMORY[0x1E4F28ED0];
      v16 = [v8 objectForKeyedSubscript:v12];
      uint64_t v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue") + v14);
      [v8 setObject:v17 forKeyedSubscript:v12];
    }
  }
}

- (void)addFgEnergyForMetrics:(id)a3 qualificationID:(id)a4 rootNodeQualificationEnergy:(id)a5 energyEntry:(id)a6
{
  id v22 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([a4 intValue] == 2)
  {
    uint64_t v12 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getEnergyMetricBucketForRootNodeID:v22];
    int v13 = NSString;
    int v14 = [MEMORY[0x1E4F28ED0] numberWithShort:v12];
    int v15 = [v13 stringWithFormat:@"%@", v14];

    if (v15)
    {
      v16 = [NSString stringWithFormat:@"%@%@", @"fg", v15];
      int v17 = [v10 intValue];
      if (v17 >= 1)
      {
        int v18 = v17;
        double v19 = (void *)MEMORY[0x1E4F28ED0];
        double v20 = [v11 objectForKeyedSubscript:v16];
        v21 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + v18);
        [v11 setObject:v21 forKeyedSubscript:v16];
      }
    }
  }
}

- (void)initBackgroundLocationAudioTime
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundLocationBreakdown:v3];

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundLocationPluggedInBreakdown:v4];

  double v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundAudioBreakdown:v5];

  __int16 v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundAudioPluggedInBreakdown:v6];

  BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundLocationAudioBreakdown:v7];

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self setBackgroundLocationAudioPluggedInBreakdown:v8];
}

- (void)populateBackgroundLocationAudioTime:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"BackgroundLocationTime"];
  uint64_t v9 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationBreakdown];
  [v9 setObject:v8 forKeyedSubscript:v6];

  id v10 = [v7 objectForKeyedSubscript:@"BackgroundLocationPluggedInTime"];
  id v11 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationPluggedInBreakdown];
  [v11 setObject:v10 forKeyedSubscript:v6];

  uint64_t v12 = [v7 objectForKeyedSubscript:@"BackgroundAudioPlayingTime"];
  int v13 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioBreakdown];
  [v13 setObject:v12 forKeyedSubscript:v6];

  int v14 = [v7 objectForKeyedSubscript:@"BackgroundAudioPlayingTimePluggedIn"];
  int v15 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioPluggedInBreakdown];
  [v15 setObject:v14 forKeyedSubscript:v6];

  v16 = [v7 objectForKeyedSubscript:@"BackgroundLocationAudioTime"];
  int v17 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioBreakdown];
  [v17 setObject:v16 forKeyedSubscript:v6];

  id v19 = [v7 objectForKeyedSubscript:@"BackgroundLocationAudioPluggedInTime"];

  int v18 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioPluggedInBreakdown];
  [v18 setObject:v19 forKeyedSubscript:v6];
}

- (void)bgLocationAudioTimeRuntimes:(id)a3 bundleID:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationBreakdown];
  id v10 = [v9 objectForKeyedSubscript:v7];
  [v10 doubleValue];
  id v11 = objc_msgSend(v6, "numberWithDouble:");
  [v8 setObject:v11 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationRuntimeKey"];

  uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
  int v13 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationPluggedInBreakdown];
  int v14 = [v13 objectForKeyedSubscript:v7];
  [v14 doubleValue];
  int v15 = objc_msgSend(v12, "numberWithDouble:");
  [v8 setObject:v15 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"];

  v16 = (void *)MEMORY[0x1E4F28ED0];
  int v17 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioBreakdown];
  int v18 = [v17 objectForKeyedSubscript:v7];
  [v18 doubleValue];
  id v19 = objc_msgSend(v16, "numberWithDouble:");
  [v8 setObject:v19 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioRuntimeKey"];

  double v20 = (void *)MEMORY[0x1E4F28ED0];
  v21 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioPluggedInBreakdown];
  id v22 = [v21 objectForKeyedSubscript:v7];
  [v22 doubleValue];
  double v23 = objc_msgSend(v20, "numberWithDouble:");
  [v8 setObject:v23 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"];

  double v24 = (void *)MEMORY[0x1E4F28ED0];
  v25 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioBreakdown];
  v26 = [v25 objectForKeyedSubscript:v7];
  [v26 doubleValue];
  v27 = objc_msgSend(v24, "numberWithDouble:");
  [v8 setObject:v27 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioRuntimeKey"];

  unsigned int v28 = (void *)MEMORY[0x1E4F28ED0];
  id v31 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioPluggedInBreakdown];
  v29 = [v31 objectForKeyedSubscript:v7];

  [v29 doubleValue];
  v30 = objc_msgSend(v28, "numberWithDouble:");
  [v8 setObject:v30 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"];
}

- (void)bgLocationAudioTimeApps:(id)a3
{
  id v4 = a3;
  id v29 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  double v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationBreakdown];
  id v7 = [v6 objectForKeyedSubscript:v29];
  [v7 doubleValue];
  id v8 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationRuntimeKey"];

  uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationPluggedInBreakdown];
  id v11 = [v10 objectForKeyedSubscript:v29];
  [v11 doubleValue];
  uint64_t v12 = objc_msgSend(v9, "numberWithDouble:");
  [v4 setObject:v12 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"];

  int v13 = (void *)MEMORY[0x1E4F28ED0];
  int v14 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioBreakdown];
  int v15 = [v14 objectForKeyedSubscript:v29];
  [v15 doubleValue];
  v16 = objc_msgSend(v13, "numberWithDouble:");
  [v4 setObject:v16 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioRuntimeKey"];

  int v17 = (void *)MEMORY[0x1E4F28ED0];
  int v18 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundAudioPluggedInBreakdown];
  id v19 = [v18 objectForKeyedSubscript:v29];
  [v19 doubleValue];
  double v20 = objc_msgSend(v17, "numberWithDouble:");
  [v4 setObject:v20 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"];

  v21 = (void *)MEMORY[0x1E4F28ED0];
  id v22 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioBreakdown];
  double v23 = [v22 objectForKeyedSubscript:v29];
  [v23 doubleValue];
  double v24 = objc_msgSend(v21, "numberWithDouble:");
  [v4 setObject:v24 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioRuntimeKey"];

  v25 = (void *)MEMORY[0x1E4F28ED0];
  v26 = [(PLBatteryUIResponseTypeBatteryBreakdownAggregation *)self backgroundLocationAudioPluggedInBreakdown];
  v27 = [v26 objectForKeyedSubscript:v29];
  [v27 doubleValue];
  unsigned int v28 = objc_msgSend(v25, "numberWithDouble:");
  [v4 setObject:v28 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"];
}

- (BOOL)isForegroundOnlyBucket:(signed __int16)a3
{
  return (a3 < 9) & (0x10Au >> a3);
}

- (void)filterEnergyEntries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"PLBatteryUIAppArrayKey", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        int v12 = [v11 intValue];

        if ((v12 & 0xFFFFFFFB) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (BOOL)shouldShowBreakdown:(id)a3
{
  return 1;
}

- (NSMutableDictionary)backgroundLocationBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBackgroundLocationBreakdown:(id)a3
{
}

- (NSMutableDictionary)backgroundLocationPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBackgroundLocationPluggedInBreakdown:(id)a3
{
}

- (NSMutableDictionary)backgroundAudioBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBackgroundAudioBreakdown:(id)a3
{
}

- (NSMutableDictionary)backgroundAudioPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBackgroundAudioPluggedInBreakdown:(id)a3
{
}

- (NSMutableDictionary)backgroundLocationAudioBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBackgroundLocationAudioBreakdown:(id)a3
{
}

- (NSMutableDictionary)backgroundLocationAudioPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBackgroundLocationAudioPluggedInBreakdown:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLocationAudioPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationAudioBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundAudioPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundAudioBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationBreakdown, 0);
}

@end