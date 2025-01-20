@interface TIFeatureUsageMetricsCache
- (TIFeatureUsageMetricsCache)initWithInputMode:(id)a3 metricDescriptorRegistry:(id)a4;
- (id)defaultMetricsFromContext:(id)a3;
- (id)featureUsageMetricFromName:(id)a3 forContext:(id)a4;
- (id)metricsFromUserModel:(id)a3 withContext:(id)a4;
- (id)startOfDay;
- (void)loadMetricsFromUserModelDataStore:(id)a3 withContext:(id)a4;
- (void)setTestingTimestamp:(id)a3;
@end

@implementation TIFeatureUsageMetricsCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetrics, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_queryEndDate, 0);
  objc_storeStrong((id *)&self->_testingTimestamp, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setTestingTimestamp:(id)a3
{
}

- (id)startOfDay
{
  testingTimestamp = self->_testingTimestamp;
  if (testingTimestamp)
  {
    v3 = testingTimestamp;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
  }
  v4 = v3;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  v7 = [v5 startOfDayForDate:v4];

  return v7;
}

- (id)defaultMetricsFromContext:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceIdiom] == 1
    && [v4 keyboardType] == 3
    && ([(NSDictionary *)self->_defaultMetrics objectForKey:kFeatureFloatingKeyboardUsage],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x1E4FAEFC8]],
        v5,
        v6))
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_defaultMetrics];
    [(NSDictionary *)v7 setObject:*MEMORY[0x1E4FAEFB0] forKey:kFeatureFloatingKeyboardUsage];
  }
  else
  {
    v7 = self->_defaultMetrics;
  }

  return v7;
}

- (id)metricsFromUserModel:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 valueForMetricWithName:kCalcKeyboardFeatureUsage withContext:v5];
  [v7 setValue:v8 forKey:kFeatureKeyboardUsage];

  v9 = [v6 valueForMetricWithName:kCalcContinuousPathUsage withContext:v5];
  [v7 setValue:v9 forKey:kFeatureContinuousPathUsage];

  v10 = [v6 valueForMetricWithName:kCalcAutocorrectionUsage withContext:v5];
  [v7 setValue:v10 forKey:kFeatureAutocorrectionUsage];

  v11 = [v6 valueForMetricWithName:kCalcCandidateBarUsage withContext:v5];
  [v7 setValue:v11 forKey:kFeatureCandidateBarUsage];

  v12 = [v6 valueForMetricWithName:kCalcMultilingualUsage withContext:v5];
  [v7 setValue:v12 forKey:kFeatureMultilingualUsage];

  v13 = [v6 valueForMetricWithName:kFeatureFloatingKeyboardUsage withContext:v5];
  [v7 setValue:v13 forKey:kFeatureFloatingKeyboardUsage];

  v14 = [v6 valueForMetricWithName:kFeatureStringTypingSpeed withContext:v5];

  [v7 setValue:v14 forKey:kFeatureStringTypingSpeed];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

  return v15;
}

- (void)loadMetricsFromUserModelDataStore:(id)a3 withContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (NSMutableDictionary *)objc_opt_new();
  cachedMetrics = self->_cachedMetrics;
  self->_cachedMetrics = v8;

  v10 = +[TIKBUserModel userModelWithInputMode:self->_inputMode userModelDataStore:v6 metricDescriptorRegistry:self->_metricDescriptorRegistry fromDate:self->_queryEndDate];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = objc_msgSend(v10, "contexts", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v17 = [(TIFeatureUsageMetricsCache *)self metricsFromUserModel:v10 withContext:v16];
        [(NSMutableDictionary *)self->_cachedMetrics setObject:v17 forKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v18 = -[TIKBAnalyticsMetricsContext initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:]([TIKBAnalyticsMetricsContext alloc], "initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:", @"__fake", @"__fake", @"__fake", 0, [v7 userInterfaceIdiom]);
  v19 = [(TIFeatureUsageMetricsCache *)self metricsFromUserModel:v10 withContext:v18];
  defaultMetrics = self->_defaultMetrics;
  self->_defaultMetrics = v19;
}

- (id)featureUsageMetricFromName:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TIFeatureUsageMetricsCache *)self startOfDay];
  if (([v8 isEqual:self->_queryEndDate] & 1) == 0)
  {
    cachedMetrics = self->_cachedMetrics;
    self->_cachedMetrics = 0;

    defaultMetrics = self->_defaultMetrics;
    self->_defaultMetrics = 0;

    self->_sufficientData = 1;
    objc_storeStrong((id *)&self->_queryEndDate, v8);
  }
  if (!self->_sufficientData) {
    goto LABEL_14;
  }
  v11 = self->_cachedMetrics;
  if (!v11)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
    char v13 = [v12 BOOLForKey:@"ignoreLastMigrationDate"];
    uint64_t v14 = [MEMORY[0x1E4FAE4F0] sharedUserModelDataStore];
    v15 = [v14 transientLastMigrationDate];
    uint64_t v16 = [(NSDate *)self->_queryEndDate dateByAddingTimeInterval:-((double)(unint64_t)*MEMORY[0x1E4FAEF78] * (double)(int)*MEMORY[0x1E4FAEFE8])];
    v17 = v16;
    if (v13)
    {
      self->_sufficientData = 1;
    }
    else
    {
      uint64_t v18 = [v16 compare:v15];
      self->_sufficientData = v18 != -1;
      if (v18 == -1) {
        goto LABEL_9;
      }
    }
    [(TIFeatureUsageMetricsCache *)self loadMetricsFromUserModelDataStore:v14 withContext:v7];
LABEL_9:

    if (self->_sufficientData)
    {
      v11 = self->_cachedMetrics;
      goto LABEL_11;
    }
LABEL_14:
    if ((id)kFeatureStringTypingSpeed == v6) {
      long long v21 = (void *)kFeatureStringTypingSpeedInsufficientData;
    }
    else {
      long long v21 = (void *)*MEMORY[0x1E4FAEFB8];
    }
    id v20 = v21;
    goto LABEL_18;
  }
LABEL_11:
  v19 = [(NSMutableDictionary *)v11 objectForKey:v7];
  if (!v19)
  {
    v19 = [(TIFeatureUsageMetricsCache *)self defaultMetricsFromContext:v7];
    [(NSMutableDictionary *)self->_cachedMetrics setObject:v19 forKey:v7];
  }
  id v20 = [v19 objectForKey:v6];

LABEL_18:

  return v20;
}

- (TIFeatureUsageMetricsCache)initWithInputMode:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TIFeatureUsageMetricsCache;
  v9 = [(TIFeatureUsageMetricsCache *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputMode, a3);
    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    testingTimestamp = v10->_testingTimestamp;
    v10->_testingTimestamp = 0;

    queryEndDate = v10->_queryEndDate;
    v10->_queryEndDate = 0;

    cachedMetrics = v10->_cachedMetrics;
    v10->_cachedMetrics = 0;

    defaultMetrics = v10->_defaultMetrics;
    v10->_defaultMetrics = 0;

    v10->_sufficientData = 1;
  }

  return v10;
}

@end