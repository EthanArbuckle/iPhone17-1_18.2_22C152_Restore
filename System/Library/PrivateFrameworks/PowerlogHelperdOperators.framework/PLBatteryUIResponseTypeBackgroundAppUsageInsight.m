@interface PLBatteryUIResponseTypeBackgroundAppUsageInsight
- (BOOL)shouldShowInsightThroughOverrides;
- (BOOL)suggest;
- (NSDate)end;
- (NSDate)monotonicNow;
- (NSDate)start;
- (NSDictionary)nodeIDsToNodeNames;
- (NSMutableArray)appsForBackgroundActivityInsight;
- (NSMutableArray)buckets;
- (PLBatteryUIResponderService)responderService;
- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4;
- (_PLTimeIntervalRange)generateRangeFromConfiguration:(id)a3;
- (_PLTimeIntervalRange)getDataRange:(id)a3;
- (double)averageBackgroundDrainThreshold;
- (double)bucketSize;
- (double)dailyBackgroundDrainThreshold;
- (double)getNonAppRuntimesWith:(id)a3 identificationKey:(id)a4 andRange:(_PLTimeIntervalRange)a5 withNow:(id)a6;
- (double)locationEnergyDrainThreshold;
- (id)appsForBackgroundActivityInsightFromApps:(id)a3 withThresholdAboveAverageBackgroundDrainPercentage:(unint64_t)a4 locationEnergyThreshold:(double)a5 inNDays:(unint64_t)a6;
- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4;
- (id)buildEnergyEntriesWithRootNodes:(id)a3 andQualificationNodes:(id)a4 andRange:(_PLTimeIntervalRange)a5;
- (id)dependencies;
- (id)getAppRuntimesInRange:(_PLTimeIntervalRange)a3;
- (id)getAppUsageEventsInRange:(_PLTimeIntervalRange)a3;
- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5;
- (id)getNodeIDToNodeNameMap;
- (id)getQualificationNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4;
- (id)getRootNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4;
- (id)mockAppForBackgroundActivityInsight;
- (id)perAppUsageForBatteryBreakdown:(id)a3 withStart:(unint64_t)a4 withEnd:(unint64_t)a5 withThresholdAboveDailyBackgroundDrainPercentage:(unint64_t)a6;
- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5;
- (id)processAppUsageEventsEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5;
- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4;
- (id)processRootNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4;
- (id)result;
- (int)computeNumberOfBuckets;
- (int64_t)daysToTrackActivityForBatteryBreakdown:(int64_t)a3;
- (void)applyTransformationsForBuckets:(id)a3;
- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3;
- (void)configure:(id)a3;
- (void)enumerateBucketsUsingBlock:(id)a3;
- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3;
- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3;
- (void)run;
- (void)setAppsForBackgroundActivityInsight:(id)a3;
- (void)setBucketSize:(double)a3;
- (void)setBuckets:(id)a3;
- (void)setEnd:(id)a3;
- (void)setMonotonicNow:(id)a3;
- (void)setNodeIDsToNodeNames:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setStart:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeBackgroundAppUsageInsight

- (id)dependencies
{
  return &unk_1F4013348;
}

- (void)configure:(id)a3
{
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self generateRangeFromConfiguration:a3];
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight buildBucketsForRange:](self, "buildBucketsForRange:");
  v4 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self buckets];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v7 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self buckets];
    [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self applyTransformationsForBuckets:v7];
  }
  else
  {
    v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight configure:]();
    }
  }
}

- (void)run
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "---------- App Background Usage Insight: Tracking %u days of activity -------------------", v1, 8u);
}

- (id)result
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self appsForBackgroundActivityInsight];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    uint64_t v5 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self appsForBackgroundActivityInsight];
    [v5 sortUsingComparator:&__block_literal_global_17];
  }
  if ([(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self suggest])
  {
    v9[0] = @"PLBatteryUISuggestionTypeKey";
    v9[1] = @"PLBatteryUIInsightBackgroundAppUsageAppKey";
    v10[0] = &unk_1F400CD18;
    v6 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self appsForBackgroundActivityInsight];
    v10[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

uint64_t __58__PLBatteryUIResponseTypeBackgroundAppUsageInsight_result__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  v6 = [a2 valueForKey:@"PLBatteryUIInsightAverageDrainKey"];
  [v6 doubleValue];
  id v7 = objc_msgSend(v4, "numberWithDouble:");

  v8 = (void *)MEMORY[0x1E4F28ED0];
  v9 = [v5 valueForKey:@"PLBatteryUIInsightAverageDrainKey"];

  [v9 doubleValue];
  v10 = objc_msgSend(v8, "numberWithDouble:");

  uint64_t v11 = -[v7 compare:v10];
  return v11;
}

- (id)perAppUsageForBatteryBreakdown:(id)a3 withStart:(unint64_t)a4 withEnd:(unint64_t)a5 withThresholdAboveDailyBackgroundDrainPercentage:(unint64_t)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v70 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v66 = a5;
  if (a4 < a5)
  {
    double v10 = (double)a6;
    *(void *)&long long v9 = 67109120;
    long long v65 = v9;
    while (1)
    {
      uint64_t v11 = objc_msgSend(v67, "objectAtIndexedSubscript:", a4, v65);
      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v65;
        LODWORD(v79) = a4;
        _os_log_debug_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEBUG, "---------- App Background Usage Insight: Bucket %d -------------------", buf, 8u);
      }
      unint64_t v69 = a4;

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v68 = v11;
      id obj = [v11 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
      uint64_t v13 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
      v14 = v70;
      if (v13) {
        break;
      }
LABEL_25:

      a4 = v69 + 1;
      if (v69 + 1 == v66) {
        goto LABEL_26;
      }
    }
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v75;
    uint64_t v71 = *(void *)v75;
LABEL_7:
    uint64_t v17 = 0;
    uint64_t v72 = v15;
    while (1)
    {
      if (*(void *)v75 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v74 + 1) + 8 * v17);
      v19 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 > 0.0) {
        goto LABEL_23;
      }
      v22 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      v23 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      v24 = [v14 objectForKeyedSubscript:v23];
      v25 = [v24 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyKey"];
      [v25 doubleValue];
      double v27 = v26;

      v28 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
      [v28 doubleValue];
      double v30 = v29;

      double v31 = v27 + v30;
      v32 = [MEMORY[0x1E4F1CA60] dictionary];
      v33 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppNameKey"];
      [v32 setObject:v33 forKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];

      [v32 setObject:v22 forKeyedSubscript:@"PLBatteryUIInsightBundleIDKey"];
      v34 = [MEMORY[0x1E4F28ED0] numberWithDouble:v31];
      [v32 setObject:v34 forKeyedSubscript:@"PLBatteryUISuggestionEnergyKey"];

      v35 = [&unk_1F4013360 objectAtIndexedSubscript:48];
      v36 = [v18 objectForKeyedSubscript:v35];
      [v36 doubleValue];
      double v38 = v37;

      v39 = [&unk_1F4013378 objectAtIndexedSubscript:12];
      v40 = [v18 objectForKeyedSubscript:v39];
      [v40 doubleValue];
      double v42 = v38 + v41;

      v43 = [&unk_1F4013390 objectAtIndexedSubscript:13];
      v44 = [v18 objectForKeyedSubscript:v43];
      [v44 doubleValue];
      double v46 = v42 + v45;

      v47 = (void *)MEMORY[0x1E4F28ED0];
      v48 = [v32 objectForKeyedSubscript:@"kLocationEnergy"];
      [v48 doubleValue];
      v50 = [v47 numberWithDouble:v46 + v49];
      [v32 setObject:v50 forKeyedSubscript:@"kLocationEnergy"];

      +[PLUtilities defaultBatteryEnergyCapacity];
      double v52 = v30 * 100.0 / v51;
      uint64_t v53 = MEMORY[0x1E4F1CC28];
      if (v52 <= v10) {
        goto LABEL_14;
      }
      v54 = [v32 objectForKey:@"PLBatteryUIInsightDailyDrainBoolKey"];

      if (!v54) {
        break;
      }
LABEL_15:
      v55 = [v18 objectForKeyedSubscript:@"kHasUsageEvent"];
      if ([v55 BOOLValue])
      {

        uint64_t v56 = MEMORY[0x1E4F1CC38];
      }
      else
      {
        v57 = [v14 objectForKeyedSubscript:v22];
        v58 = [v57 objectForKeyedSubscript:@"kHasUsageEvent"];
        int v59 = [v58 BOOLValue];

        BOOL v60 = v59 == 0;
        v14 = v70;
        if (v60) {
          uint64_t v56 = MEMORY[0x1E4F1CC28];
        }
        else {
          uint64_t v56 = MEMORY[0x1E4F1CC38];
        }
      }
      uint64_t v16 = v71;
      [v32 setObject:v56 forKeyedSubscript:@"kHasUsageEvent"];
      v61 = [v18 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      [v14 setObject:v32 forKeyedSubscript:v61];

      v62 = PLLogCommon();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        v63 = [v32 objectForKeyedSubscript:@"kHasUsageEvent"];
        *(_DWORD *)buf = 138413314;
        v79 = v22;
        __int16 v80 = 2048;
        double v81 = v31;
        __int16 v82 = 2048;
        double v83 = v52;
        __int16 v84 = 2048;
        double v85 = v46;
        __int16 v86 = 2112;
        v87 = v63;
        _os_log_debug_impl(&dword_1E4220000, v62, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has %f energy used per bucket(%f%%) and %f mwh location energy, has usage event in bucket: %@", buf, 0x34u);
      }
      uint64_t v15 = v72;
LABEL_23:
      if (v15 == ++v17)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (!v15) {
          goto LABEL_25;
        }
        goto LABEL_7;
      }
    }
    uint64_t v53 = MEMORY[0x1E4F1CC38];
LABEL_14:
    [v32 setObject:v53 forKeyedSubscript:@"PLBatteryUIInsightDailyDrainBoolKey"];
    goto LABEL_15;
  }
LABEL_26:

  return v70;
}

- (id)appsForBackgroundActivityInsightFromApps:(id)a3 withThresholdAboveAverageBackgroundDrainPercentage:(unint64_t)a4 locationEnergyThreshold:(double)a5 inNDays:(unint64_t)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v49 = [MEMORY[0x1E4F1CA48] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v51;
    double v15 = (double)a4;
    *(void *)&long long v12 = 138412290;
    long long v48 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        v18 = objc_msgSend(v10, "objectForKey:", v17, v48);
        uint64_t v19 = [v18 objectForKey:@"PLBatteryUISuggestionEnergyKey"];
        if (!v19) {
          goto LABEL_18;
        }
        double v20 = (void *)v19;
        double v21 = [v10 objectForKey:v17];
        v22 = [v21 objectForKey:@"kLocationEnergy"];

        if (v22)
        {
          v23 = [v10 objectForKeyedSubscript:v17];
          v24 = [v23 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyKey"];
          [v24 doubleValue];
          double v26 = v25;

          +[PLUtilities defaultBatteryEnergyCapacity];
          double v28 = round(v26 * 100.0 / v27 / (double)a6);
          double v29 = [v10 objectForKeyedSubscript:v17];
          double v30 = [v29 objectForKeyedSubscript:@"kLocationEnergy"];
          [v30 doubleValue];
          double v32 = v31 * 100.0;
          +[PLUtilities defaultBatteryEnergyCapacity];
          double v34 = v32 / v33;

          v35 = [v10 objectForKeyedSubscript:v17];
          v36 = [v35 objectForKeyedSubscript:@"PLBatteryUIInsightDailyDrainBoolKey"];
          int v37 = [v36 isEqual:MEMORY[0x1E4F1CC38]];

          double v38 = [v10 objectForKeyedSubscript:v17];
          v39 = [v38 objectForKeyedSubscript:@"kHasUsageEvent"];
          int v40 = [v39 BOOLValue];

          double v41 = PLLogCommon();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413314;
            uint64_t v55 = v17;
            __int16 v56 = 2048;
            double v57 = v26;
            __int16 v58 = 1024;
            int v59 = (int)v28;
            __int16 v60 = 2048;
            double v61 = v34;
            __int16 v62 = 1024;
            int v63 = v40;
            _os_log_debug_impl(&dword_1E4220000, v41, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has %f mwh total average energy used (estimated %u%%) and %f%% location energy used, has usage events: %d", buf, 0x2Cu);
          }

          int v42 = v37 ^ 1;
          if (v28 < v15) {
            int v42 = 1;
          }
          if (v34 < a5) {
            int v42 = 1;
          }
          if (((v42 | v40) & 1) == 0)
          {
            v43 = PLLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v48;
              uint64_t v55 = v17;
              _os_log_debug_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has met the criteria!", buf, 0xCu);
            }

            v18 = [MEMORY[0x1E4F1CA60] dictionary];
            v44 = [v10 objectForKeyedSubscript:v17];
            double v45 = [v44 objectForKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];
            [v18 setObject:v45 forKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];

            [v18 setObject:v17 forKeyedSubscript:@"PLBatteryUIInsightBundleIDKey"];
            double v46 = [MEMORY[0x1E4F28ED0] numberWithDouble:v28];
            [v18 setObject:v46 forKeyedSubscript:@"PLBatteryUIInsightAverageDrainKey"];

            [v49 addObject:v18];
LABEL_18:

            continue;
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v13);
  }

  return v49;
}

- (int64_t)daysToTrackActivityForBatteryBreakdown:(int64_t)a3
{
  if (a3 >= 14) {
    int64_t v4 = 14;
  }
  else {
    int64_t v4 = a3;
  }
  if (+[PLUtilities inBUIDemoMode])
  {
    id v5 = +[PLUtilities powerlogDefaultForKey:@"BUI_BACKGROUND_ACTIVITY_DAYS"];
    v6 = v5;
    if (v5 && (int)[v5 intValue] >= 1 && (int)objc_msgSend(v6, "intValue") < a3) {
      int64_t v4 = (int)[v6 intValue];
    }
  }
  return v4;
}

- (double)dailyBackgroundDrainThreshold
{
  double v2 = 1.0;
  if (+[PLUtilities inBUIDemoMode])
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_BACKGROUND_ACTIVITY_DAILY_THRESHOLD"];
    int64_t v4 = v3;
    if (v3)
    {
      [v3 doubleValue];
      if (v5 > 0.0)
      {
        [v4 doubleValue];
        double v2 = v6;
      }
    }
  }
  return v2;
}

- (id)mockAppForBackgroundActivityInsight
{
  double v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"Test App" forKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];
  [v3 setObject:@"BackgroundAppUsageTestApp" forKeyedSubscript:@"PLBatteryUIInsightBundleIDKey"];
  [v3 setObject:&unk_1F400CD30 forKeyedSubscript:@"PLBatteryUIInsightAverageDrainKey"];
  [v2 addObject:v3];

  return v2;
}

- (double)averageBackgroundDrainThreshold
{
  double v2 = 5.0;
  if (+[PLUtilities inBUIDemoMode])
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_BACKGROUND_ACTIVITY_AVERAGE_THRESHOLD"];
    int64_t v4 = v3;
    if (v3)
    {
      [v3 doubleValue];
      if (v5 > 0.0)
      {
        [v4 doubleValue];
        double v2 = v6;
      }
    }
  }
  return v2;
}

- (double)locationEnergyDrainThreshold
{
  if (!+[PLUtilities inBUIDemoMode]) {
    return 0.1;
  }
  double v2 = +[PLUtilities powerlogDefaultForKey:@"BUI_BACKGROUND_LOCATION_ENERGY_THRESHOLD"];
  v3 = v2;
  double v4 = 0.1;
  if (v2)
  {
    [v2 doubleValue];
    if (v5 > 0.0)
    {
      [v3 doubleValue];
      double v4 = v6;
    }
  }

  return v4;
}

- (BOOL)shouldShowInsightThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_BACKGROUNDAPPUSAGE_SUGGESTION_SHOW"];
    char v4 = [v3 BOOLValue];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (_PLTimeIntervalRange)generateRangeFromConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"start"];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"end"];
  [v11 doubleValue];
  double v13 = v12;

  uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self setStart:v14];

  double v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13];
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self setEnd:v15];

  uint64_t v16 = [v4 objectForKeyedSubscript:@"bucket"];

  [v16 doubleValue];
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setBucketSize:](self, "setBucketSize:");

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self setMonotonicNow:v17];

  v18 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self start];
  uint64_t v19 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self end];
  [v18 timeIntervalSince1970];
  double v21 = v20;
  [v19 timeIntervalSince1970];
  double v23 = v22 - v21;

  v24 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self monotonicNow];
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getDataRange:v24];
  double v26 = v25;
  double v28 = v27;

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight generateRange:withDataRange:](self, "generateRange:withDataRange:", v21 + -1800.0, v23 + 1800.0, v26, v28);
  result.length = v30;
  result.location = v29;
  return result;
}

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
      double location = result.location;
    }
    else {
      double location = a4.location;
    }
    if (v5 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v5;
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

- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  int v6 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self computeNumberOfBuckets];
  BOOL v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self setBuckets:v7];

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight initializeBucketsWithRange:](self, "initializeBucketsWithRange:", location, length);
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:](self, "prepareBucketsWithRange:", location, length);
}

- (int)computeNumberOfBuckets
{
  BOOL v2 = self;
  v3 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self end];
  id v4 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)v2 start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)v2 bucketSize];
  LODWORD(v2) = llround(v6 / v7);

  return (int)v2;
}

- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  double v6 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getRootNodeEntriesInRange:withTimeInterval:](self, "getRootNodeEntriesInRange:withTimeInterval:", a3.location, a3.length, 86400.0);
  double v7 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getQualificationNodeEntriesInRange:withTimeInterval:](self, "getQualificationNodeEntriesInRange:withTimeInterval:", location, length, 86400.0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke;
  void v10[3] = &unk_1E6E490B0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  double v13 = location;
  double v14 = length;
  id v8 = v7;
  id v9 = v6;
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self enumerateBucketsUsingBlock:v10];
}

void __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 32;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "buildEnergyEntriesWithRootNodes:andQualificationNodes:andRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  double v5 = objc_msgSend(*(id *)v3, "buildBucketWithEnergyEntries:andRange:", v4, *(double *)(v3 + 24), *(double *)(v3 + 32));
  double v6 = [*(id *)v3 buckets];
  [v6 setObject:v5 atIndexedSubscript:a2];

  double v7 = [*(id *)v3 buckets];
  id v8 = [v7 objectAtIndexedSubscript:a2];
  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:v8];

  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke_cold_1((id *)v3);
  }
}

- (id)getRootNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length = a3.length;
  double location = a3.location;
  id v8 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B48]];
  id v9 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);

  return v9;
}

- (id)getQualificationNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length = a3.length;
  double location = a3.location;
  id v8 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B20]];
  id v9 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);

  return v9;
}

- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5
{
  double length = a4.length;
  double location = a4.location;
  id v9 = NSString;
  uint64_t v10 = *MEMORY[0x1E4F92BA0];
  id v11 = a3;
  id v12 = [v9 stringWithFormat:@"(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')", v10, v10, @"null", v10, @"unknown"];
  double v13 = NSString;
  uint64_t v14 = *MEMORY[0x1E4F92B30];
  double v15 = [MEMORY[0x1E4F92908] entryKey];
  uint64_t v16 = [v13 stringWithFormat:@"%@ IN (SELECT ID FROM '%@' WHERE %@)", v14, v15, v12];

  objc_msgSend(NSString, "stringWithFormat:", @"SELECT * FROM '%@' WHERE (timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@));",
    v11,
    *(void *)&location,
    location + length,
    *(void *)&a5,
  uint64_t v17 = v16);
  v18 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  uint64_t v19 = [v18 storage];
  double v20 = [v19 entriesForKey:v11 withQuery:v17];

  return v20;
}

- (id)buildEnergyEntriesWithRootNodes:(id)a3 andQualificationNodes:(id)a4 andRange:(_PLTimeIntervalRange)a5
{
  double length = a5.length;
  double location = a5.location;
  id v9 = a4;
  uint64_t v10 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight processRootNodes:inRange:](self, "processRootNodes:inRange:", a3, location, length);
  id v11 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight processQualificationNodes:inRange:](self, "processQualificationNodes:inRange:", v9, location, length);

  id v12 = [v10 arrayByAddingObjectsFromArray:v11];
  double v13 = (void *)[v12 mutableCopy];

  return v13;
}

- (id)processRootNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v82;
    double v12 = location + length;
    uint64_t v79 = *MEMORY[0x1E4F92B58];
    uint64_t v76 = *MEMORY[0x1E4F92B60];
    uint64_t v71 = *MEMORY[0x1E4F92B50];
    uint64_t v70 = *MEMORY[0x1E4F625B0];
    id v72 = v8;
    v73 = v7;
    uint64_t v69 = *(void *)v82;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v82 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v81 + 1) + 8 * v13);
        double v15 = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v16 = [v14 entryDate];
        uint64_t v17 = v16;
        if (v16)
        {
          [v16 timeIntervalSince1970];
          if (location <= v18)
          {
            double v19 = v18;

            if (v12 < v19) {
              goto LABEL_35;
            }
            uint64_t v17 = [v14 objectForKeyedSubscript:v79];
            if (v17)
            {
              double v20 = [v7 objectForKeyedSubscript:v17];

              if (!v20)
              {
                double v21 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
                double v22 = [v21 objectForKeyedSubscript:v17];

                if (!v22)
                {
                  double v7 = v73;
                  goto LABEL_34;
                }
                double v23 = (void *)MEMORY[0x1E4F1CA60];
                v24 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
                double v25 = [v24 objectForKeyedSubscript:v17];
                double v26 = [v23 dictionaryWithObject:v25 forKey:@"PLBatteryUIAppBundleIDKey"];
                double v7 = v73;
                [v73 setObject:v26 forKeyedSubscript:v17];

                id v8 = v72;
              }
              __int16 v80 = [v7 objectForKeyedSubscript:v17];
              double v27 = [v14 objectForKeyedSubscript:v76];
              int v28 = [v27 intValue];
              if ([&unk_1F40133A8 count] <= (unint64_t)v28)
              {
                int v37 = PLLogCommon();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  int v38 = [v27 intValue];
                  uint64_t v39 = [&unk_1F40133C0 count];
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)__int16 v86 = v38;
                  *(_WORD *)&v86[4] = 2048;
                  *(void *)&v86[6] = v39;
                  _os_log_error_impl(&dword_1E4220000, v37, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                }
              }
              else
              {
                uint64_t v29 = objc_msgSend(&unk_1F40133D8, "objectAtIndexedSubscript:", (int)objc_msgSend(v27, "intValue"));
                double v30 = [v14 objectForKeyedSubscript:v71];
                v78 = v27;
                if ([v27 intValue] == 58)
                {
                  double v31 = v29;
                  double v32 = PLLogCommon();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                  {
                    int v60 = [v78 intValue];
                    [v30 doubleValue];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)__int16 v86 = v60;
                    *(_WORD *)&v86[4] = 2048;
                    *(void *)&v86[6] = v61;
                    _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }

                  double v33 = (void *)MEMORY[0x1E4F28ED0];
                  [v30 doubleValue];
                  v35 = objc_msgSend(v33, "numberWithDouble:", fmin(v34, 9000.0));

                  v36 = PLLogCommon();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_41;
                  }
                  goto LABEL_25;
                }
                int v40 = v27;
                double v31 = v29;
                if ([v40 intValue] == 59)
                {
                  double v41 = PLLogCommon();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    int v62 = [v78 intValue];
                    [v30 doubleValue];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)__int16 v86 = v62;
                    *(_WORD *)&v86[4] = 2048;
                    *(void *)&v86[6] = v63;
                    _os_log_debug_impl(&dword_1E4220000, v41, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }

                  int v42 = (void *)MEMORY[0x1E4F28ED0];
                  [v30 doubleValue];
                  v35 = objc_msgSend(v42, "numberWithDouble:", fmin(v43, 5500.0));

                  v36 = PLLogCommon();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
LABEL_41:
                    int v64 = [v78 intValue];
                    [v35 doubleValue];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)__int16 v86 = v64;
                    *(_WORD *)&v86[4] = 2048;
                    *(void *)&v86[6] = v65;
                    _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }
LABEL_25:

                  double v30 = v35;
                }
                v44 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
                double v45 = [v44 objectForKeyedSubscript:v17];

                long long v74 = [NSString stringWithFormat:@"%@.%@", v70, @"aod"];
                long long v75 = v45;
                if (!objc_msgSend(v45, "isEqualToString:")) {
                  goto LABEL_31;
                }
                double v46 = PLLogCommon();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)__int16 v86 = v31;
                  _os_log_impl(&dword_1E4220000, v46, OS_LOG_TYPE_DEFAULT, "found AOD in root node %@", buf, 0xCu);
                }

                if ([v78 intValue] == 56
                  || [v78 intValue] == 57)
                {
LABEL_31:
                  v47 = (void *)MEMORY[0x1E4F28ED0];
                  long long v48 = [v80 objectForKeyedSubscript:v31];
                  [v48 doubleValue];
                  double v50 = v49;
                  [v30 doubleValue];
                  long long v52 = [v47 numberWithDouble:v50 + v51 / 1000.0];
                  [v80 setObject:v52 forKeyedSubscript:v31];

                  long long v53 = (void *)MEMORY[0x1E4F28ED0];
                  v54 = [v80 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                  [v54 doubleValue];
                  double v56 = v55;
                  [v30 doubleValue];
                  __int16 v58 = [v53 numberWithDouble:v56 + v57 / 1000.0];
                  uint64_t v11 = v69;
                  int v37 = v31;
                  [v80 setObject:v58 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

                  id v8 = v72;
                }
                else
                {
                  v54 = PLLogCommon();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    [v30 doubleValue];
                    *(_DWORD *)buf = 138412546;
                    int v37 = v31;
                    *(void *)__int16 v86 = v31;
                    *(_WORD *)&v86[8] = 2048;
                    *(double *)&v86[10] = v59 / 1000.0;
                    _os_log_impl(&dword_1E4220000, v54, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node energy of %f mWh", buf, 0x16u);
                  }
                  else
                  {
                    int v37 = v31;
                  }
                }

                double v7 = v73;
                double v27 = v78;
              }
            }
          }
        }
LABEL_34:

LABEL_35:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v66 = [v8 countByEnumeratingWithState:&v81 objects:v87 count:16];
      uint64_t v10 = v66;
    }
    while (v66);
  }

  id v67 = [v7 allValues];

  return v67;
}

- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v80;
    double v12 = location + length;
    uint64_t v13 = *MEMORY[0x1E4F92B58];
    uint64_t v75 = *MEMORY[0x1E4F92B40];
    uint64_t v71 = *MEMORY[0x1E4F92B38];
    uint64_t v63 = *MEMORY[0x1E4F625B0];
    uint64_t v64 = *MEMORY[0x1E4F92B28];
    id v72 = v7;
    uint64_t v76 = *(void *)v80;
    id v77 = v8;
    uint64_t v65 = *MEMORY[0x1E4F92B58];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v80 != v11) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v79 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v17 = [v15 entryDate];
        double v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSince1970];
          if (location <= v19)
          {
            double v20 = v19;

            if (v12 < v20) {
              goto LABEL_30;
            }
            double v18 = [v15 objectForKeyedSubscript:v13];
            if (v18)
            {
              double v21 = [v7 objectForKeyedSubscript:v18];

              if (v21) {
                goto LABEL_13;
              }
              double v22 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
              double v23 = [v22 objectForKeyedSubscript:v18];

              if (v23)
              {
                v24 = (void *)MEMORY[0x1E4F1CA60];
                double v25 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
                double v26 = [v25 objectForKeyedSubscript:v18];
                double v27 = [v24 dictionaryWithObject:v26 forKey:@"PLBatteryUIAppBundleIDKey"];
                [v7 setObject:v27 forKeyedSubscript:v18];

LABEL_13:
                int v28 = [v7 objectForKeyedSubscript:v18];
                uint64_t v29 = [v15 objectForKeyedSubscript:v75];
                int v30 = [v29 intValue];
                if ([&unk_1F40133F0 count] <= (unint64_t)v30)
                {
                  v54 = PLLogCommon();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    int v55 = [v29 intValue];
                    uint64_t v56 = [&unk_1F4013408 count];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)long long v84 = v55;
                    *(_WORD *)&v84[4] = 2048;
                    *(void *)&v84[6] = v56;
                    _os_log_error_impl(&dword_1E4220000, v54, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                }
                else
                {
                  v78 = v28;
                  uint64_t v31 = v13;
                  uint64_t v32 = objc_msgSend(&unk_1F4013420, "objectAtIndexedSubscript:", (int)objc_msgSend(v29, "intValue"));
                  double v33 = [v15 objectForKeyedSubscript:v71];
                  int v34 = [v33 intValue];
                  long long v74 = v32;
                  if ([&unk_1F4013438 count] <= (unint64_t)v34)
                  {
                    long long v53 = PLLogCommon();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    {
                      int v58 = [v33 intValue];
                      uint64_t v59 = [&unk_1F4013450 count];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)long long v84 = v58;
                      *(_WORD *)&v84[4] = 2048;
                      *(void *)&v84[6] = v59;
                      _os_log_error_impl(&dword_1E4220000, v53, OS_LOG_TYPE_ERROR, "qualificationID=%d out of bounds=%lu", buf, 0x12u);
                    }
                  }
                  else
                  {
                    uint64_t v70 = v33;
                    uint64_t v35 = objc_msgSend(&unk_1F4013468, "objectAtIndexedSubscript:", (int)objc_msgSend(v33, "intValue"));
                    uint64_t v69 = [NSString stringWithFormat:@"%@-%@", v35, v32];
                    v68 = [v15 objectForKeyedSubscript:v64];
                    v36 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self getNodeIDToNodeNameMap];
                    int v37 = [v36 objectForKeyedSubscript:v18];

                    uint64_t v66 = [NSString stringWithFormat:@"%@.%@", v63, @"aod"];
                    id v67 = v37;
                    if (!objc_msgSend(v37, "isEqualToString:")) {
                      goto LABEL_20;
                    }
                    int v38 = PLLogCommon();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)long long v84 = v32;
                      _os_log_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEFAULT, "found AOD in qual for root node %@", buf, 0xCu);
                    }

                    if ([v29 intValue] == 56
                      || [v29 intValue] == 57)
                    {
LABEL_20:
                      uint64_t v39 = (void *)MEMORY[0x1E4F28ED0];
                      int v40 = (void *)v69;
                      double v41 = [v78 objectForKeyedSubscript:v69];
                      [v41 doubleValue];
                      double v43 = v42;
                      [v68 doubleValue];
                      double v45 = [v39 numberWithDouble:v43 + v44 / 1000.0];
                      [v78 setObject:v45 forKeyedSubscript:v69];

                      double v46 = (void *)MEMORY[0x1E4F28ED0];
                      v47 = [v78 objectForKeyedSubscript:v35];
                      [v47 doubleValue];
                      double v49 = v48;
                      [v68 doubleValue];
                      double v51 = [v46 numberWithDouble:v49 + v50 / 1000.0];
                      [v78 setObject:v51 forKeyedSubscript:v35];

                      long long v52 = v68;
                      uint64_t v31 = v65;
                    }
                    else
                    {
                      v47 = PLLogCommon();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v52 = v68;
                        [v68 doubleValue];
                        *(_DWORD *)buf = 138412546;
                        *(void *)long long v84 = v32;
                        *(_WORD *)&v84[8] = 2048;
                        *(double *)&v84[10] = v57 / 1000.0;
                        _os_log_impl(&dword_1E4220000, v47, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node qual energy of %f mWh", buf, 0x16u);
                        uint64_t v31 = v65;
                        int v40 = (void *)v69;
                      }
                      else
                      {
                        uint64_t v31 = v65;
                        int v40 = (void *)v69;
                        long long v52 = v68;
                      }
                    }

                    double v33 = v70;
                    long long v53 = v35;
                  }

                  double v7 = v72;
                  uint64_t v13 = v31;
                  int v28 = v78;
                  v54 = v74;
                }
              }
              uint64_t v11 = v76;
              id v8 = v77;
            }
          }
        }

LABEL_30:
        ++v14;
      }
      while (v10 != v14);
      uint64_t v60 = [v8 countByEnumeratingWithState:&v79 objects:v85 count:16];
      uint64_t v10 = v60;
    }
    while (v60);
  }

  uint64_t v61 = [v7 allValues];

  return v61;
}

- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", a3, @"PLBatteryUIAppArrayKey", a4.location, a4.length);
}

- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  id v6 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getAppRuntimesInRange:](self, "getAppRuntimesInRange:");
  double v7 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getAppUsageEventsInRange:](self, "getAppUsageEventsInRange:", location, length);
  id v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:](v6);
  }

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:](v7);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PLBatteryUIResponseTypeBackgroundAppUsageInsight_prepareBucketsWithRange___block_invoke;
  v12[3] = &unk_1E6E490D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self enumerateBucketsUsingBlock:v12];
}

void __76__PLBatteryUIResponseTypeBackgroundAppUsageInsight_prepareBucketsWithRange___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  id v8 = [*(id *)(a1 + 32) buckets];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a2];
  id v10 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

  id v11 = objc_msgSend(*(id *)(a1 + 32), "processAppTimeEntries:inRange:withAppArray:", *(void *)(a1 + 40), v10, a3, a4);

  objc_msgSend(*(id *)(a1 + 32), "processAppUsageEventsEntries:inRange:withAppArray:", *(void *)(a1 + 48), v11, a3, a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  double v12 = [*(id *)(a1 + 32) buckets];
  id v13 = [v12 objectAtIndexedSubscript:a2];
  [v13 setObject:v14 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (id)getNodeIDToNodeNameMap
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self nodeIDsToNodeNames];

  if (v3)
  {
    id v4 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self nodeIDsToNodeNames];
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')", *MEMORY[0x1E4F92BA0], *MEMORY[0x1E4F92BA0], @"null", *MEMORY[0x1E4F92BA0], @"unknown"];
    id v6 = NSString;
    uint64_t v7 = *MEMORY[0x1E4F92B30];
    id v8 = [MEMORY[0x1E4F92908] entryKey];
    double v25 = (void *)v5;
    uint64_t v9 = [v6 stringWithFormat:@"%@ IN (SELECT ID FROM '%@' WHERE %@)", v7, v8, v5];

    id v10 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
    id v11 = [v10 storage];
    double v12 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D40] andName:*MEMORY[0x1E4F92B98]];
    uint64_t v31 = @"WHERE";
    v32[0] = v9;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v14 = [v11 entriesForKey:v12 withProperties:v13];

    double v15 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          double v22 = [v21 name];
          double v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v21, "entryID"));
          [v15 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self setNodeIDsToNodeNames:v15];
    id v4 = (void *)[v15 copy];
  }
  return v4;
}

- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v65 = a5;
  uint64_t v75 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v74 = [MEMORY[0x1E4F1CA60] dictionary];
  v73 = [MEMORY[0x1E4F1CA60] dictionary];
  id v72 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v89;
    double v14 = location + length;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v89 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        id v17 = [v16 entryDate];
        if (v17)
        {
          uint64_t v18 = v17;
          [v17 timeIntervalSince1970];
          double v20 = v19;

          if (location <= v20 && v20 < v14) {
            [v9 addObject:v16];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v88 objects:v95 count:16];
    }
    while (v12);
  }
  id v67 = v10;

  id v70 = [MEMORY[0x1E4F1CA80] set];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v66 = v9;
  id obj = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v9];
  uint64_t v22 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v69 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v85 != v69) {
          objc_enumerationMutation(obj);
        }
        double v25 = *(void **)(*((void *)&v84 + 1) + 8 * j);
        long long v26 = [v25 objectForKeyedSubscript:@"BundleID"];
        [v70 addObject:v26];
        long long v27 = [v25 objectForKeyedSubscript:@"ScreenOnTime"];
        [v75 setObject:v27 forKeyedSubscript:v26];

        long long v28 = [v25 objectForKeyedSubscript:@"BackgroundTime"];
        [v74 setObject:v28 forKeyedSubscript:v26];

        long long v29 = [v25 objectForKeyedSubscript:@"ScreenOnPluggedInTime"];
        [v73 setObject:v29 forKeyedSubscript:v26];

        int v30 = [v25 objectForKeyedSubscript:@"BackgroundPluggedInTime"];
        [v72 setObject:v30 forKeyedSubscript:v26];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v23);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v31 = v65;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v81 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v80 + 1) + 8 * k);
        int v37 = [v36 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v38 = [v70 containsObject:v37];

        if (v38)
        {
          uint64_t v39 = [v36 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          [v70 removeObject:v39];
        }
        int v40 = [v36 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        double v41 = (void *)MEMORY[0x1E4F28ED0];
        double v42 = [v75 objectForKeyedSubscript:v40];
        [v42 doubleValue];
        double v43 = objc_msgSend(v41, "numberWithDouble:");
        [v36 setObject:v43 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        double v44 = (void *)MEMORY[0x1E4F28ED0];
        double v45 = [v74 objectForKeyedSubscript:v40];
        [v45 doubleValue];
        double v46 = objc_msgSend(v44, "numberWithDouble:");
        [v36 setObject:v46 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        v47 = (void *)MEMORY[0x1E4F28ED0];
        double v48 = [v73 objectForKeyedSubscript:v40];
        [v48 doubleValue];
        double v49 = objc_msgSend(v47, "numberWithDouble:");
        [v36 setObject:v49 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        double v50 = (void *)MEMORY[0x1E4F28ED0];
        double v51 = [v72 objectForKeyedSubscript:v40];
        [v51 doubleValue];
        long long v52 = objc_msgSend(v50, "numberWithDouble:");
        [v36 setObject:v52 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v33);
  }

  long long v53 = (void *)[v31 mutableCopy];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v71 = v70;
  uint64_t v54 = [v71 countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v55; ++m)
      {
        if (*(void *)v77 != v56) {
          objc_enumerationMutation(v71);
        }
        uint64_t v58 = *(void *)(*((void *)&v76 + 1) + 8 * m);
        uint64_t v59 = [MEMORY[0x1E4F1CA60] dictionary];
        [v59 setObject:v58 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        [v59 setObject:&unk_1F400CD30 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        uint64_t v60 = [v75 objectForKeyedSubscript:v58];
        [v59 setObject:v60 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        uint64_t v61 = [v74 objectForKeyedSubscript:v58];
        [v59 setObject:v61 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        int v62 = [v73 objectForKeyedSubscript:v58];
        [v59 setObject:v62 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        uint64_t v63 = [v72 objectForKeyedSubscript:v58];
        [v59 setObject:v63 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];

        [v59 setObject:&unk_1F400CD30 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v53 addObject:v59];
      }
      uint64_t v55 = [v71 countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v55);
  }

  return v53;
}

- (double)getNonAppRuntimesWith:(id)a3 identificationKey:(id)a4 andRange:(_PLTimeIntervalRange)a5 withNow:(id)a6
{
  double length = a5.length;
  double location = a5.location;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v46 = a6;
  double v13 = location + 1800.0;
  id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
  double v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
  uint64_t v16 = [v14 initWithKey:@"timestamp" withValue:v15 withComparisonOperation:5];

  id v17 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  uint64_t v18 = [v17 storage];
  double v45 = (void *)v16;
  v53[0] = v16;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  double v20 = [v18 lastEntryForKey:v11 withComparisons:v19 isSingleton:0];

  if (v20)
  {
    double v21 = [v20 objectForKeyedSubscript:v12];
    int v22 = [v21 BOOLValue];

    if (v22) {
      double v23 = v13;
    }
    else {
      double v23 = -1.0;
    }
  }
  else
  {
    double v23 = -1.0;
  }
  v24 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  double v25 = [v24 storage];
  id v47 = v11;
  long long v26 = objc_msgSend(v25, "entriesForKey:inTimeRange:withFilters:", v11, 0, v13, length);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v27 = [v26 reverseObjectEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    double v31 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v33 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v34 = [v33 objectForKeyedSubscript:v12];
        int v35 = [v34 BOOLValue];

        if (v35)
        {
          if (v23 == -1.0)
          {
            v36 = [v33 entryDate];
            [v36 timeIntervalSince1970];
            double v23 = v37;
          }
        }
        else
        {
          if (v23 != -1.0)
          {
            int v38 = [v33 entryDate];
            [v38 timeIntervalSince1970];
            double v40 = v39 - v23;

            double v31 = v31 + v40;
          }
          double v23 = -1.0;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v29);
  }
  else
  {
    double v31 = 0.0;
  }

  if (v23 == -1.0)
  {
    double v41 = v46;
    double v43 = v47;
  }
  else
  {
    double v41 = v46;
    [v46 timeIntervalSince1970];
    if (v42 >= length + v13) {
      double v42 = length + v13;
    }
    double v31 = v31 + v42 - v23;
    double v43 = v47;
  }

  return v31;
}

- (_PLTimeIntervalRange)getDataRange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F92D20];
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  double v37 = [MEMORY[0x1E4F92968] entryKeyForType:v5 andName:*MEMORY[0x1E4F92B48]];
  uint64_t v7 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  id v8 = [v7 storage];
  uint64_t v9 = [v8 firstEntryForKey:v6];

  if (v9)
  {
    id v10 = [v9 entryDate];
    id v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:].cold.4();
    }
  }
  else
  {
    id v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getDataRange:]();
    }

    id v10 = v4;
  }
  double v13 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  id v14 = [v13 storage];
  double v15 = [v14 firstEntryForKey:v37];

  if (v15)
  {
    id v16 = [v15 entryDate];
    id v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }
  }
  else
  {
    uint64_t v18 = PLLogCommon();
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
    long long v27 = NSString;
    v36 = v15;
    uint64_t v28 = v9;
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
    id v29 = v10;
    v31 = uint64_t v30 = v6;
    uint64_t v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v25];
    uint64_t v33 = [v27 stringWithFormat:@"Start: %@, End %@", v31, v32];

    uint64_t v9 = v28;
    double v15 = v36;

    id v6 = v30;
    id v10 = v29;
    *(_DWORD *)buf = 138412290;
    double v39 = v33;
    _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);
  }
  double v34 = v22;
  double v35 = v25;
  result.double length = v35;
  result.double location = v34;
  return result;
}

- (id)processAppUsageEventsEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v63 count:16];
  id v43 = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v49;
    double v14 = location + length;
    double v42 = v9;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v17 = [v16 entryDate];
        uint64_t v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSince1970];
          if (location <= v19)
          {
            double v20 = v19;

            if (v14 < v20) {
              continue;
            }
            uint64_t v18 = [v16 objectForKeyedSubscript:@"BundleID"];
            double v21 = [v16 objectForKeyedSubscript:@"NotificationCount"];
            int v22 = [v21 intValue];

            double v23 = [v16 objectForKeyedSubscript:@"HasAudioUsage"];
            int v24 = [v23 BOOLValue];

            double v25 = [v16 objectForKeyedSubscript:@"HasCarPlayUsage"];
            int v26 = [v25 BOOLValue];

            long long v27 = [v16 objectForKeyedSubscript:@"HasWidgetActive"];
            int v28 = [v27 BOOLValue];

            if (v22 > 0) {
              int v29 = 1;
            }
            else {
              int v29 = v24;
            }
            uint64_t v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v54 = v18;
              __int16 v55 = 1024;
              int v56 = v24;
              __int16 v57 = 1024;
              int v58 = v26;
              __int16 v59 = 1024;
              int v60 = v28;
              __int16 v61 = 1024;
              int v62 = v22;
              _os_log_debug_impl(&dword_1E4220000, v30, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: App usage Events for %@: audio: %d, carplay:%d, widgets:%d, notifications:%d", buf, 0x24u);
            }

            if (v18) {
              int v31 = v29 | v26 | v28;
            }
            else {
              int v31 = 0;
            }
            uint64_t v9 = v42;
            if (v31 == 1) {
              [v42 addObject:v18];
            }
            id v10 = v43;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = v41;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v45;
      uint64_t v36 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v32);
          }
          int v38 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          double v39 = [v38 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          if (v39 && [v9 containsObject:v39])
          {
            [v38 setObject:v36 forKeyedSubscript:@"kHasUsageEvent"];
            [v9 removeObject:v39];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v34);
    }

    id v10 = v43;
  }

  return v41;
}

- (id)getAppRuntimesInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v5 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  id v6 = [v5 storage];
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
  id v8 = objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 86400.0, location, length);

  return v8;
}

- (id)getAppUsageEventsInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v5 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
  id v6 = [v5 storage];
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppUsageEvents"];
  id v8 = objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 86400.0, location, length);

  return v8;
}

- (void)enumerateBucketsUsingBlock:(id)a3
{
  uint64_t v18 = (void (**)(id, void, void *, id, double, double))a3;
  int v4 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self computeNumberOfBuckets];
  if (v4 >= 1)
  {
    int v5 = v4;
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      id v8 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self end];
      [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self bucketSize];
      id v10 = [v8 dateByAddingTimeInterval:-(v9 * v7)];

      [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self bucketSize];
      uint64_t v12 = [v10 dateByAddingTimeInterval:-v11];
      id v13 = v10;
      [v12 timeIntervalSince1970];
      double v15 = v14;
      [v13 timeIntervalSince1970];
      double v17 = v16;

      v18[2](v18, v6, v12, v13, v15 + -1800.0, v17 - v15);
      double v7 = v7 + 1.0;
      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

- (void)applyTransformationsForBuckets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
        +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:v9 withResponderService:v10];

        double v11 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
        +[PLBatteryUIResponseTypeUtilities applyDynamicNameTransformation:v9 withResponderService:v11];

        uint64_t v12 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
        +[PLBatteryUIResponseTypeUtilities replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:v9 withResponderService:v12];

        id v13 = [(PLBatteryUIResponseTypeBackgroundAppUsageInsight *)self responderService];
        +[PLBatteryUIResponseTypeUtilities addEntryTypesToEnergyEntriesInBucket:v9 withResponderService:v13];

        +[PLBatteryUIResponseTypeUtilities filterEnergyEntriesByAppTypeFromBucket:v9];
        +[PLBatteryUIResponseTypeUtilities filterEnergyEntriesWithRuntimes:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
}

- (BOOL)suggest
{
  return self->_suggest;
}

- (void)setSuggest:(BOOL)a3
{
  self->_suggest = a3;
}

- (NSMutableArray)appsForBackgroundActivityInsight
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppsForBackgroundActivityInsight:(id)a3
{
}

- (NSDictionary)nodeIDsToNodeNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNodeIDsToNodeNames:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnd:(id)a3
{
}

- (NSDate)monotonicNow
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonotonicNow:(id)a3
{
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSMutableArray)buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBuckets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_monotonicNow, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_nodeIDsToNodeNames, 0);
  objc_storeStrong((id *)&self->_appsForBackgroundActivityInsight, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "App Background Usage Insight: Couldn't prepare buckets", v2, v3, v4, v5, v6);
}

void __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 buckets];
  [v1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v2, v3, "App Background Usage: prepared %d buckets", v4, v5, v6, v7, v8);
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "App Background Usage Insight: gathered %d appUsageEvents entries...", v3, v4, v5, v6, v7);
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "App Background Usage Insight gathered %d app runtime entries...", v3, v4, v5, v6, v7);
}

- (void)getDataRange:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No first usage time entry!", v2, v3, v4, v5, v6);
}

@end