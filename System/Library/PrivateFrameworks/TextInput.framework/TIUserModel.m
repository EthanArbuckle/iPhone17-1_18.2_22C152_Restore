@interface TIUserModel
- (BOOL)explicitTearDown;
- (BOOL)persistForDate:(id)a3;
- (BOOL)userModelRateLimitingDisabled;
- (NSArray)contexts;
- (NSArray)weeklyMetricKeys;
- (NSDate)fromDate;
- (NSDate)loadedDate;
- (NSDictionary)cachedSettingsDictionary;
- (NSString)inputMode;
- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4;
- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 weeklyMetricKeys:(id)a5 fromDate:(id)a6 explicitTearDown:(BOOL)a7;
- (TIUserModelConfigurationDelegate)configurationDelegate;
- (id)populateSettingsDictionary;
- (id)valuesFromContext:(id)a3;
- (int)valueForDurableKey:(id)a3;
- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6;
- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6;
- (void)addToDurableCounter:(int)a3 forKey:(id)a4;
- (void)configureDurableCounterForName:(id)a3;
- (void)configureDurableCounters;
- (void)dealloc;
- (void)doLoad;
- (void)loadIfNecessary;
- (void)loadSettings;
- (void)resetDurableCounterForKey:(id)a3;
- (void)setConfigurationDelegate:(id)a3;
- (void)setLoadedDate:(id)a3;
- (void)setUserModelRateLimitingDisabled:(BOOL)a3;
- (void)setWeeklyMetricKeys:(id)a3;
- (void)tearDown;
@end

@implementation TIUserModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_weeklyMetricKeys, 0);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong((id *)&self->_userModelValuesCollection, 0);
  objc_storeStrong((id *)&self->_durableCounters, 0);
  objc_storeStrong((id *)&self->_userModelStore, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setUserModelRateLimitingDisabled:(BOOL)a3
{
  self->_userModelRateLimitingDisabled = a3;
}

- (BOOL)userModelRateLimitingDisabled
{
  return self->_userModelRateLimitingDisabled;
}

- (void)setLoadedDate:(id)a3
{
}

- (NSDate)loadedDate
{
  return self->_loadedDate;
}

- (BOOL)explicitTearDown
{
  return self->_explicitTearDown;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setWeeklyMetricKeys:(id)a3
{
}

- (NSArray)weeklyMetricKeys
{
  return self->_weeklyMetricKeys;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setConfigurationDelegate:(id)a3
{
}

- (TIUserModelConfigurationDelegate)configurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);

  return (TIUserModelConfigurationDelegate *)WeakRetained;
}

- (int)valueForDurableKey:(id)a3
{
  id v4 = a3;
  [(TIUserModel *)self loadIfNecessary];
  v5 = [(NSMutableDictionary *)self->_durableCounters objectForKey:v4];

  v6 = [v5 count];
  int v7 = [v6 intValue];

  return v7;
}

- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  [(TIUserModel *)self loadIfNecessary];
  id v12 = [(TIUserModel *)self valuesFromContext:v10];

  [v12 addDouble:v11 toCounterWithKey:v6 andCandidateLength:a3];
}

- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a4;
  [(TIUserModel *)self loadIfNecessary];
  id v12 = [(TIUserModel *)self valuesFromContext:v10];

  [v12 addInteger:v8 toCounterWithKey:v11 andCandidateLength:v6];
}

- (void)resetDurableCounterForKey:(id)a3
{
  id v4 = a3;
  [(TIUserModel *)self loadIfNecessary];
  id v5 = [(NSMutableDictionary *)self->_durableCounters objectForKey:v4];

  [v5 reset];
}

- (void)addToDurableCounter:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(TIUserModel *)self loadIfNecessary];
  id v7 = [(NSMutableDictionary *)self->_durableCounters objectForKey:v6];

  [v7 add:v4];
}

- (BOOL)persistForDate:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_loadedDate)
  {
    id v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Persisting user model.", "-[TIUserModel persistForDate:]");
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_18D240000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    [v4 timeIntervalSince1970];
    if (v4)
    {
      if (v7 - self->_timeOfLastPersist < 600.0 && !self->_userModelRateLimitingDisabled)
      {
        uint64_t v8 = IXADefaultLogFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s User model persistence not required due to rate limiting.", "-[TIUserModel persistForDate:]");
          *(_DWORD *)buf = 138412290;
          v41 = v9;
          _os_log_impl(&dword_18D240000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
        BOOL v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      id v4 = [MEMORY[0x1E4F1C9C8] now];
    }
    [v4 timeIntervalSince1970];
    self->_timeOfLastPersist = v11;
    [(TIUserModel *)self trackPowerLogIfNecessary];
    id v12 = IXADefaultLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s Persisting transient counters.", "-[TIUserModel persistForDate:]");
      *(_DWORD *)buf = 138412290;
      v41 = v13;
      _os_log_impl(&dword_18D240000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = self->_userModelValuesCollection;
    uint64_t v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [(NSMutableDictionary *)self->_userModelValuesCollection objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          [v19 persistForDate:v4];
        }
        uint64_t v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v16);
    }

    v20 = IXADefaultLogFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s Persisting durable counters.", "-[TIUserModel persistForDate:]");
      *(_DWORD *)buf = 138412290;
      v41 = v21;
      _os_log_impl(&dword_18D240000, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v22 = self->_durableCounters;
    uint64_t v23 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [(NSMutableDictionary *)self->_durableCounters objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          [v27 doPersist:self->_userModelStore forDate:v4];
        }
        uint64_t v24 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    uint64_t v8 = IXADefaultLogFacility();
    BOOL v10 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s User model persisted.", "-[TIUserModel persistForDate:]");
      *(_DWORD *)buf = 138412290;
      v41 = v28;
      _os_log_impl(&dword_18D240000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    goto LABEL_32;
  }
  BOOL v10 = 1;
LABEL_33:

  return v10;
}

- (NSDictionary)cachedSettingsDictionary
{
  [(TIUserModel *)self loadIfNecessary];
  settingsDictionary = self->_settingsDictionary;

  return settingsDictionary;
}

- (void)loadSettings
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11126;
  BOOL v10 = __Block_byref_object_dispose__11127;
  id v11 = 0;
  if (pthread_main_np())
  {
    uint64_t v3 = [(TIUserModel *)self populateSettingsDictionary];
    id v4 = (void *)v7[5];
    v7[5] = v3;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __27__TIUserModel_loadSettings__block_invoke;
    v5[3] = &unk_1E555A588;
    v5[4] = self;
    v5[5] = &v6;
    TIDispatchSync(MEMORY[0x1E4F14428], v5);
  }
  objc_storeStrong((id *)&self->_settingsDictionary, (id)v7[5]);
  _Block_object_dispose(&v6, 8);
}

uint64_t __27__TIUserModel_loadSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) populateSettingsDictionary];

  return MEMORY[0x1F41817F8]();
}

- (id)populateSettingsDictionary
{
  v2 = [(TIUserModel *)self configurationDelegate];
  uint64_t v3 = [v2 settingsDictionary];

  return v3;
}

- (void)doLoad
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = IXADefaultLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading user model.", "-[TIUserModel doLoad]");
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_log_impl(&dword_18D240000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading settings.", "-[TIUserModel doLoad]");
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl(&dword_18D240000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  [(TIUserModel *)self loadSettings];
  double v7 = IXADefaultLogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading durable counters.", "-[TIUserModel doLoad]");
    *(_DWORD *)buf = 138412290;
    v46 = v8;
    _os_log_impl(&dword_18D240000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  [(TIUserModel *)self configureDurableCounters];
  v9 = IXADefaultLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading transient counters", "-[TIUserModel doLoad]");
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl(&dword_18D240000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  fromDate = self->_fromDate;
  if (fromDate)
  {
    id v12 = fromDate;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] now];
  }
  v13 = v12;
  v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v15 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v14 setTimeZone:v15];

  long long v34 = v14;
  long long v33 = [v14 startOfDayForDate:v13];
  long long v32 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeInterval:sinceDate:", (double)(unint64_t)kFeatureUsageQueryTimeFrame * -86400.0);
  long long v37 = v13;
  [(TIUserModelDataStoring *)self->_userModelStore getDailyAndWeeklyValuesForKeyPrefix:kUserModelDatabasePrefix forInputMode:self->_inputMode weeklyKeySuffixes:self->_weeklyMetricKeys endDate:v13];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    long long v35 = self;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = [v20 properties];
        id v39 = 0;
        uint64_t v24 = [v21 unarchivedObjectOfClass:v22 fromData:v23 error:&v39];
        id v25 = v39;

        if (v25)
        {
          v26 = IXADefaultLogFacility();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = NSString;
            long long v36 = [v25 userInfo];
            v28 = [v36 objectForKey:@"message"];
            v29 = [v27 stringWithFormat:@"%s   %@", "-[TIUserModel doLoad]", v28];
            *(_DWORD *)buf = 138412290;
            v46 = v29;
            _os_log_error_impl(&dword_18D240000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            self = v35;
          }
        }
        else
        {
          v26 = [(TIUserModel *)self valuesFromContext:v24];
          [v26 addToTransientCounterFromDatabaseEntry:v20 withWeeklyMetricKeys:self->_weeklyMetricKeys fromLoadedDate:v37];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v17);
  }
  [(TIUserModelDataStoring *)self->_userModelStore purgeDataForKeyPrefix:kUserModelDatabasePrefix forInputMode:self->_inputMode beforeDate:v32];
  objc_storeStrong((id *)&self->_loadedDate, v37);
  long long v30 = IXADefaultLogFacility();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    long long v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s User model loaded.", "-[TIUserModel doLoad]");
    *(_DWORD *)buf = 138412290;
    v46 = v31;
    _os_log_impl(&dword_18D240000, v30, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

- (void)loadIfNecessary
{
  if (!self->_loadedDate) {
    [(TIUserModel *)self doLoad];
  }
}

- (id)valuesFromContext:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_userModelValuesCollection objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    double v7 = [(TIUserModel *)self configurationDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(TIUserModel *)self configurationDelegate];
      BOOL v10 = (objc_class *)[v9 userModelValuesClass];

      if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()]) {
        uint64_t v6 = v10;
      }
    }
    id v5 = (void *)[[v6 alloc] initWithInputMode:self->_inputMode context:v4 userModelDataStore:self->_userModelStore durableCounters:self->_durableCounters settingsDictionary:self->_settingsDictionary];
    [v5 extendCountersForWeeklyMetricKeys:self->_weeklyMetricKeys];
    [(NSMutableDictionary *)self->_userModelValuesCollection setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)configureDurableCounters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIUserModel *)self configurationDelegate];
  id v4 = [v3 durableCounterKeys];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TIUserModel configureDurableCounterForName:](self, "configureDurableCounterForName:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)configureDurableCounterForName:(id)a3
{
  id v4 = (void *)kUserModelDatabasePrefix;
  id v5 = a3;
  id v13 = [v4 stringByAppendingString:v5];
  uint64_t v6 = -[TIUserModelDataStoring getDurableValueForKey:](self->_userModelStore, "getDurableValueForKey:");
  uint64_t v7 = [TIUserModelCounter alloc];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v6 value];
    long long v10 = [v6 creationDate];
    long long v11 = [v6 lastUpdateDate];
    long long v12 = [(TIUserModelCounter *)v8 initWithName:v5 initialCount:v9 creationDate:v10 lastUpdateDate:v11];
  }
  else
  {
    long long v12 = [(TIUserModelCounter *)v7 initWithName:v5];
  }
  [(NSMutableDictionary *)self->_durableCounters setObject:v12 forKey:v5];
}

- (NSArray)contexts
{
  [(TIUserModel *)self loadIfNecessary];
  userModelValuesCollection = self->_userModelValuesCollection;

  return (NSArray *)[(NSMutableDictionary *)userModelValuesCollection allKeys];
}

- (void)tearDown
{
  if (self->_explicitTearDown) {
    [(TIUserModel *)self persistForDate:0];
  }
}

- (void)dealloc
{
  if (!self->_explicitTearDown) {
    [(TIUserModel *)self persistForDate:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)TIUserModel;
  [(TIUserModel *)&v3 dealloc];
}

- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 weeklyMetricKeys:(id)a5 fromDate:(id)a6 explicitTearDown:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TIUserModel;
  uint64_t v17 = [(TIUserModel *)&v28 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputMode, a3);
    objc_storeStrong((id *)&v18->_userModelStore, a4);
    uint64_t v19 = [v15 copy];
    weeklyMetricKeys = v18->_weeklyMetricKeys;
    v18->_weeklyMetricKeys = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_fromDate, a6);
    v18->_explicitTearDown = a7;
    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    durableCounters = v18->_durableCounters;
    v18->_durableCounters = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    userModelValuesCollection = v18->_userModelValuesCollection;
    v18->_userModelValuesCollection = (NSMutableDictionary *)v23;

    loadedDate = v18->_loadedDate;
    v18->_loadedDate = 0;

    v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
    v18->_userModelRateLimitingDisabled = [v26 BOOLForKey:@"userModelRateLimitingDisabled"];
  }
  return v18;
}

- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4
{
  return [(TIUserModel *)self initWithInputMode:a3 userModelDataStore:a4 weeklyMetricKeys:0 fromDate:0 explicitTearDown:0];
}

@end