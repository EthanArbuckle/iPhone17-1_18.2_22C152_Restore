@interface TICounterChangeCache
- (TICounterChangeCache)initWithEventDescriptorRegistry:(id)a3 metricDescriptorRegistry:(id)a4;
- (void)addCounterReferencesForMetric:(id)a3;
- (void)addStatisticChanges:(id)a3 withContext:(id)a4;
- (void)close;
- (void)keyboardDidSuspendForDate:(id)a3;
- (void)loadReferencedCounters;
- (void)persistForDate:(id)a3;
- (void)queueCompletionHandler:(id)a3;
@end

@implementation TICounterChangeCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedCounters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);

  objc_storeStrong((id *)&self->_eventDescriptorRegistry, 0);
}

- (void)queueCompletionHandler:(id)a3
{
}

- (void)persistForDate:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 timeIntervalSince1970];
  if (v4)
  {
    v6 = v4;
    if (v5 - self->_timeOfLastPersist < *MEMORY[0x1E4FAEFE0] && !self->_userModelRateLimitingDisabled)
    {
      v38 = v4;
      v7 = IXADefaultLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Counter change cache persistence not required due to rate limiting.", "-[TICounterChangeCache persistForDate:]");
        *(_DWORD *)buf = 138412290;
        v56 = v8;
        _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      goto LABEL_40;
    }
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9C8] now];
  }
  v38 = v6;
  [v6 timeIntervalSince1970];
  self->_timeOfLastPersist = v9;
  v7 = [MEMORY[0x1E4FAE4F0] sharedUserModelDataStore];
  if ([v7 isValid])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obj = [(NSMutableDictionary *)self->_cache allKeys];
    uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v50;
      v39 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
          id v48 = 0;
          v40 = v11;
          v41 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:");
          id v12 = v48;
          v36 = v12;
          uint64_t v37 = v10;
          if (v12)
          {
            id v13 = v12;
            v14 = IXADefaultLogFacility();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v31 = [NSString stringWithFormat:@"%s Error archiving context object: %@", "-[TICounterChangeCache persistForDate:]", v13];
              *(_DWORD *)buf = 138412290;
              v56 = v31;
              _os_log_error_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
            v41 = 0;
          }
          v15 = [(NSMutableDictionary *)self->_cache objectForKey:v40];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v43 = [v15 allKeys];
          uint64_t v16 = [v43 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v45;
            do
            {
              uint64_t v19 = 0;
              uint64_t v42 = v17;
              do
              {
                if (*(void *)v45 != v18) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * v19);
                v21 = [v15 objectForKeyedSubscript:v20];
                if ([v21 intValue])
                {
                  referencedCounters = self->_referencedCounters;
                  if (!referencedCounters)
                  {
                    [(TICounterChangeCache *)self loadReferencedCounters];
                    referencedCounters = self->_referencedCounters;
                  }
                  if ([(NSMutableSet *)referencedCounters containsObject:v20])
                  {
                    v23 = v15;
                    v24 = [(id)*MEMORY[0x1E4FAF000] stringByAppendingString:v20];
                    v25 = [NSNumber numberWithInt:0];
                    v26 = [NSNumber numberWithDouble:0.0];
                    v27 = [v40 inputLanguageAndRegion];
                    [v39 addValue:v21 andSecondaryValue:v25 andRealValue:v26 andProperties:v41 forKey:v24 forInputMode:v27 forDate:v38];

                    v28 = IXADefaultLogFacility();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                    {
                      v29 = [NSString stringWithFormat:@"%s Counter change '%@' was persisted.", "-[TICounterChangeCache persistForDate:]", v20];
                      *(_DWORD *)buf = 138412290;
                      v56 = v29;
                      _os_log_debug_impl(&dword_1E3F0E000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                    v15 = v23;
                    uint64_t v17 = v42;
                  }
                  else
                  {
                    v24 = IXADefaultLogFacility();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      v30 = [NSString stringWithFormat:@"%s Counter change '%@' was ignored because it's not referenced by any event.", "-[TICounterChangeCache persistForDate:]", v20];
                      *(_DWORD *)buf = 138412290;
                      v56 = v30;
                      _os_log_debug_impl(&dword_1E3F0E000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v43 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v17);
          }

          uint64_t v10 = v37 + 1;
          v7 = v39;
        }
        while (v37 + 1 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v35);
    }
  }
  else
  {
    obj = IXADefaultLogFacility();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s Can't persist counter changes because the database is invalid.", "-[TICounterChangeCache persistForDate:]");
      *(_DWORD *)buf = 138412290;
      v56 = v32;
      _os_log_error_impl(&dword_1E3F0E000, obj, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

  [(NSMutableDictionary *)self->_cache removeAllObjects];
LABEL_40:
}

- (void)keyboardDidSuspendForDate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __50__TICounterChangeCache_keyboardDidSuspendForDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistForDate:*(void *)(a1 + 40)];
}

- (void)addStatisticChanges:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithArray:v7 copyItems:1];

  if ([v8 count])
  {
    id v9 = v5;
    id v10 = v8;
    TIDispatchAsync();
  }
}

void __56__TICounterChangeCache_addStatisticChanges_withContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    v2 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "name", (void)v14);
        uint64_t v10 = [v8 value];
        v11 = [v2 objectForKey:v9];
        id v12 = v11;
        if (v11) {
          uint64_t v10 = [v11 intValue] + v10;
        }
        id v13 = [NSNumber numberWithInt:v10];
        [v2 setValue:v13 forKey:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)close
{
}

uint64_t __29__TICounterChangeCache_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistForDate:0];
}

- (void)addCounterReferencesForMetric:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TIMetricDescriptorRegistry *)self->_metricDescriptorRegistry metricDescriptorWithName:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [v6 calculationExpression];

      if (v7)
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        v8 = objc_msgSend(v6, "calculationDependencies", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [(TICounterChangeCache *)self addCounterReferencesForMetric:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v10);
        }
      }
      else
      {
        [(NSMutableSet *)self->_referencedCounters addObject:v4];
      }
    }
  }
}

- (void)loadReferencedCounters
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (NSMutableSet *)objc_opt_new();
  referencedCounters = self->_referencedCounters;
  self->_referencedCounters = v3;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(TIEventDescriptorRegistry *)self->_eventDescriptorRegistry allEventDescriptors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = objc_msgSend(v10, "fieldDescriptors", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [*(id *)(*((void *)&v17 + 1) + 8 * v15) metricName];
              [(TICounterChangeCache *)self addCounterReferencesForMetric:v16];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (TICounterChangeCache)initWithEventDescriptorRegistry:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TICounterChangeCache;
  uint64_t v9 = [(TICounterChangeCache *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventDescriptorRegistry, a3);
    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    uint64_t v11 = objc_opt_new();
    cache = v10->_cache;
    v10->_cache = (NSMutableDictionary *)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.textInput.CounterChangeCache", v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    referencedCounters = v10->_referencedCounters;
    v10->_referencedCounters = 0;

    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
    v10->_userModelRateLimitingDisabled = [v18 BOOLForKey:*MEMORY[0x1E4FAF008]];
  }
  return v10;
}

@end