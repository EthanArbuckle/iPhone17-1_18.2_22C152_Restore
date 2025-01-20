@interface TIAdhocEventDispatcher
+ (id)sharedInstance;
- (NSMutableDictionary)eventSpecMap;
- (id)initFromConfig:(id)a3;
- (id)loadEventSpecMapFromConfig:(id)a3;
- (id)replacePeriodsInString:(id)a3;
- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4;
- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)setEventSpecMap:(id)a3;
@end

@implementation TIAdhocEventDispatcher

- (void).cxx_destruct
{
}

- (void)setEventSpecMap:(id)a3
{
}

- (NSMutableDictionary)eventSpecMap
{
  return self->_eventSpecMap;
}

- (id)replacePeriodsInString:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
}

- (id)loadEventSpecMapFromConfig:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [v4 allKeys];
  uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v6;
        uint64_t v7 = *(void *)(*((void *)&v37 + 1) + 8 * v6);
        v8 = objc_opt_new();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v27 = v7;
        v9 = [v4 objectForKey:v7];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [(TIAdhocEventDispatcher *)self replacePeriodsInString:*(void *)(*((void *)&v33 + 1) + 8 * i)];
              v15 = +[TIAnalyticsFieldSpec integerFieldSpecWithName:v14];
              [v8 addObject:v15];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v11);
        }

        v16 = +[TIAnalyticsEventSpec eventSpecWithName:v27 inputModeRequired:0 fieldSpecs:v8];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v17 = v8;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = [*(id *)(*((void *)&v29 + 1) + 8 * j) name];
              [v5 setObject:v16 forKey:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v19);
        }

        uint64_t v6 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v26);
  }

  return v5;
}

- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4 withCompletionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(TIAdhocEventDispatcher *)self replacePeriodsInString:v8];
  uint64_t v11 = [(TIAdhocEventDispatcher *)self eventSpecMap];
  uint64_t v12 = [v11 objectForKey:v10];

  v13 = IXADefaultLogFacility();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
    {
      uint64_t v20 = NSString;
      v21 = [v12 name];
      v22 = [v20 stringWithFormat:@"%s Dispatching adhoc event: %@ %@", "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]", v21, v8];
      *(_DWORD *)buf = 138412290;
      long long v30 = v22;
      _os_log_debug_impl(&dword_18D240000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    uint64_t v27 = v10;
    v15 = [NSNumber numberWithInteger:a4];
    uint64_t v28 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    id v17 = +[TIAnalyticsService sharedInstance];
    [v17 registerEventSpec:v12];

    uint64_t v18 = +[TIAnalyticsService sharedInstance];
    uint64_t v19 = [v12 name];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__TIAdhocEventDispatcher_dispatchEventForStatisticWithName_andValue_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E555A730;
    id v25 = v12;
    id v26 = v9;
    [v18 dispatchEventWithName:v19 payload:v16 testingParameters:0 allowSparsePayload:1 withCompletionHandler:v24];
  }
  else
  {
    if (v14)
    {
      v23 = [NSString stringWithFormat:@"%s Adhoc event not registered for statistic: %@", "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]", v8];
      *(_DWORD *)buf = 138412290;
      long long v30 = v23;
      _os_log_debug_impl(&dword_18D240000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __91__TIAdhocEventDispatcher_dispatchEventForStatisticWithName_andValue_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  v5 = IXADefaultLogFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = NSString;
    id v8 = [*(id *)(a1 + 32) name];
    id v9 = [v7 stringWithFormat:@"%s Adhoc event dispatch failed: %@", "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]_block_invoke", v8];
    *(_DWORD *)buf = 138412290;
    v13 = v9;
  }
  else
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v11 = NSString;
    id v8 = [*(id *)(a1 + 32) name];
    id v9 = [v11 stringWithFormat:@"%s Adhoc event dispatched: %@", "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]_block_invoke", v8];
    *(_DWORD *)buf = 138412290;
    v13 = v9;
  }
  _os_log_debug_impl(&dword_18D240000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

LABEL_5:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, 1, v3);
  }
}

- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4
{
}

- (id)initFromConfig:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIAdhocEventDispatcher;
  v5 = [(TIAdhocEventDispatcher *)&v10 init];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(TIAdhocEventDispatcher *)v5 loadEventSpecMapFromConfig:v4];
    eventSpecMap = v6->_eventSpecMap;
    v6->_eventSpecMap = (NSMutableDictionary *)v7;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12918 != -1) {
    dispatch_once(&sharedInstance_onceToken_12918, &__block_literal_global_12919);
  }
  v2 = (void *)sharedInstance_instance_12920;

  return v2;
}

void __40__TIAdhocEventDispatcher_sharedInstance__block_invoke()
{
  v0 = [TIAdhocEventDispatcher alloc];
  adhocEventConfig();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(TIAdhocEventDispatcher *)v0 initFromConfig:v3];
  v2 = (void *)sharedInstance_instance_12920;
  sharedInstance_instance_12920 = v1;
}

@end