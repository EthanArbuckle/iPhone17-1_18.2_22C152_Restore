@interface TIUserModelValues
- (NSDictionary)durableCounters;
- (NSDictionary)settingsDictionary;
- (NSString)inputMode;
- (TIAnalyticsMetricsContext)context;
- (TIUserModelDataStoring)userModelDataStore;
- (TIUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7;
- (id)aggregatedCountFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5;
- (id)countsFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5;
- (id)getTransientCounterForKey:(id)a3;
- (id)settingValueFromName:(id)a3;
- (int)indexFromCandidateLength:(int)a3 forCounter:(id)a4;
- (void)addDouble:(double)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5;
- (void)addEntry:(id)a3 toCounter:(id)a4 forDaysPrior:(int)a5;
- (void)addInteger:(int)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5;
- (void)addToTransientCounterFromDatabaseEntry:(id)a3 withWeeklyMetricKeys:(id)a4 fromLoadedDate:(id)a5;
- (void)extendCountersForWeeklyMetricKeys:(id)a3;
- (void)loadTransientCounter:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5;
- (void)persistForDate:(id)a3;
@end

@implementation TIUserModelValues

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong((id *)&self->_transientCounters, 0);
  objc_storeStrong((id *)&self->_durableCounters, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userModelStore, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (NSDictionary)settingsDictionary
{
  return self->_settingsDictionary;
}

- (NSDictionary)durableCounters
{
  return self->_durableCounters;
}

- (TIUserModelDataStoring)userModelDataStore
{
  return self->_userModelStore;
}

- (TIAnalyticsMetricsContext)context
{
  return self->_context;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (id)settingValueFromName:(id)a3
{
  v3 = [(NSDictionary *)self->_settingsDictionary objectForKey:a3];
  if (!v3)
  {
    v3 = [NSNumber numberWithBool:0];
  }

  return v3;
}

- (id)aggregatedCountFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = [(TIUserModelValues *)self getTransientCounterForKey:a3];
  [(TIUserModelValues *)self loadTransientCounter:v9 forNumberOfDays:v5 fromLoadedDate:v8];

  v10 = [v9 aggregatedCountForNumberOfDays:v5];

  return v10;
}

- (id)countsFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = [(TIUserModelValues *)self getTransientCounterForKey:a3];
  [(TIUserModelValues *)self loadTransientCounter:v9 forNumberOfDays:v5 fromLoadedDate:v8];

  v10 = [v9 countsForNumberOfDays:v5];

  return v10;
}

- (void)addEntry:(id)a3 toCounter:(id)a4 forDaysPrior:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 secondaryValue];
  unsigned int v10 = [v9 intValue];

  int v11 = [v7 bucketCount];
  if ((int)v10 >= v11) {
    uint64_t v12 = (v11 - 1);
  }
  else {
    uint64_t v12 = v10;
  }
  id v15 = [v8 value];
  uint64_t v13 = [v15 intValue];
  v14 = [v8 realValue];

  [v14 doubleValue];
  objc_msgSend(v7, "updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:", v13, v12, v5);
}

- (void)addToTransientCounterFromDatabaseEntry:(id)a3 withWeeklyMetricKeys:(id)a4 fromLoadedDate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [v8 key];
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend((id)kUserModelDatabasePrefix, "length"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v10 = [v8 timestamp];
  [v7 timeIntervalSinceDate:v10];
  double v12 = v11;

  uint64_t v13 = [(TIUserModelValues *)self getTransientCounterForKey:v14];
  [(TIUserModelValues *)self addEntry:v8 toCounter:v13 forDaysPrior:(int)(v12 / 86400.0)];
}

- (int)indexFromCandidateLength:(int)a3 forCounter:(id)a4
{
  int v5 = [a4 bucketCount];
  if (v5 >= a3) {
    int v6 = a3;
  }
  else {
    int v6 = v5;
  }
  if (v6 <= 1) {
    int v6 = 1;
  }
  return v6 - 1;
}

- (void)addDouble:(double)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = [(TIUserModelValues *)self getTransientCounterForKey:a4];
  objc_msgSend(v8, "updateWithDouble:forIndex:", -[TIUserModelValues indexFromCandidateLength:forCounter:](self, "indexFromCandidateLength:forCounter:", v5, v8), a3);
}

- (void)addInteger:(int)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = [(TIUserModelValues *)self getTransientCounterForKey:a4];
  objc_msgSend(v8, "updateWithInteger:forIndex:", v6, -[TIUserModelValues indexFromCandidateLength:forCounter:](self, "indexFromCandidateLength:forCounter:", v5, v8));
}

- (id)getTransientCounterForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_transientCounters objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [[TIUserModelIndexedCounter alloc] initWithName:v4];
    [(NSMutableDictionary *)self->_transientCounters setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)loadTransientCounter:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v45 = a5;
  v46 = v7;
  int v8 = [v7 days];
  if (v8 < (int)v6)
  {
    int v9 = v8;
    unsigned int v10 = IXADefaultLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v35 = NSString;
      v36 = [v7 name];
      v37 = [v35 stringWithFormat:@"%s Loading additional data for transient counter %@.", "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v36];
      *(_DWORD *)buf = 138412290;
      v56 = v37;
      _os_log_debug_impl(&dword_18D240000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    [v7 extendToNumberOfDays:v6];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v45 sinceDate:(double)(int)v6 * -86400.0];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v45 sinceDate:(double)v9 * -86400.0];
    uint64_t v13 = (void *)kUserModelDatabasePrefix;
    id v14 = [v7 name];
    uint64_t v15 = [v13 stringByAppendingString:v14];

    v16 = self;
    v41 = (void *)v15;
    v42 = (void *)v12;
    v43 = (void *)v11;
    [(TIUserModelDataStoring *)self->_userModelStore getAllValuesForKey:v15 forInputMode:self->_inputMode fromDate:v11 toDate:v12];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v23 = objc_opt_class();
          v24 = [v21 properties];
          id v49 = 0;
          v25 = [v22 unarchivedObjectOfClass:v23 fromData:v24 error:&v49];
          id v26 = v49;

          if (v26)
          {
            v27 = IXADefaultLogFacility();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v31 = NSString;
              v44 = [v26 userInfo];
              v32 = [v44 objectForKey:@"message"];
              v33 = [v31 stringWithFormat:@"%s   %@", "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v32];
              *(_DWORD *)buf = 138412290;
              v56 = v33;
              _os_log_error_impl(&dword_18D240000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              v16 = self;
            }
          }
          else if ([v25 isEqual:v16->_context])
          {
            v28 = [v21 timestamp];
            [v45 timeIntervalSinceDate:v28];
            double v30 = v29;

            v16 = self;
            [(TIUserModelValues *)self addEntry:v21 toCounter:v46 forDaysPrior:(int)(v30 / 86400.0)];
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v18);
    }
    v34 = IXADefaultLogFacility();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v38 = NSString;
      v39 = [v46 name];
      v40 = [v38 stringWithFormat:@"%s Additional data loaded for transient counter %@.", "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v39];
      *(_DWORD *)buf = 138412290;
      v56 = v40;
      _os_log_debug_impl(&dword_18D240000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)persistForDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  transientCounters = self->_transientCounters;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__TIUserModelValues_persistForDate___block_invoke;
  v9[3] = &unk_1E555A270;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableDictionary *)transientCounters enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = IXADefaultLogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Persisting user model transient counters.", "-[TIUserModelValues persistForDate:]");
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_18D240000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

uint64_t __36__TIUserModelValues_persistForDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 doPersist:*(void *)(*(void *)(a1 + 32) + 16) forDate:*(void *)(a1 + 40) forContext:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)extendCountersForWeeklyMetricKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [(TIUserModelValues *)self getTransientCounterForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 extendToNumberOfDays:kFeatureUsageQueryTimeFrame];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (TIUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TIUserModelValues;
  uint64_t v17 = [(TIUserModelValues *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputMode, a3);
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v18->_userModelStore, a5);
    objc_storeStrong((id *)&v18->_durableCounters, a6);
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    transientCounters = v18->_transientCounters;
    v18->_transientCounters = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v18->_settingsDictionary, a7);
  }

  return v18;
}

@end