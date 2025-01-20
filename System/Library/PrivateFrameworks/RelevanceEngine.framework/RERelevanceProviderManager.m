@interface RERelevanceProviderManager
+ (BOOL)_requiresLocationServices;
+ (BOOL)_supportsHistoricProviders;
+ (BOOL)_wantsDelayedUpdate;
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_dependencyClasses;
+ (id)_features;
+ (id)providerManagerClasses;
+ (void)setProviderManagerClassesLoadingBlock:(id)a3;
- (BOOL)_dataSourcesOpened;
- (BOOL)_isHistoricProvider:(id)a3;
- (BOOL)_isValidProvider:(id)a3;
- (BOOL)containsProvider:(id)a3;
- (BOOL)dataSourcesOpened;
- (BOOL)isEqual:(id)a3;
- (NSArray)allProviders;
- (NSArray)allRelevanceProviders;
- (NSArray)effectiveFeatures;
- (REFeatureSet)supportedFeatures;
- (RERelevanceProviderEnvironment)environment;
- (RERelevanceProviderManager)initWithQueue:(id)a3;
- (float)_relevanceForHistoricProvider:(id)a3;
- (float)_relevanceForProvider:(id)a3;
- (id)_engineLocationManager;
- (id)_manager_queue;
- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5;
- (id)relevanceForProvider:(id)a3 context:(id)a4;
- (unint64_t)scheduledUpdatesCount;
- (void)_accessQueue_appendCompletionHandlerForScheduledUpdate:(id)a3;
- (void)_accessQueue_performImmediateUpdate:(id)a3;
- (void)_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded;
- (void)_accessQueue_performUpdate:(id)a3;
- (void)_accessQueue_resetTimer;
- (void)_accessQueue_scheduleUpdate:(id)a3;
- (void)_enumerateProviders:(id)a3;
- (void)_handleSignificantTimeChange;
- (void)_loadLoggingHeader;
- (void)_prepareForUpdateWithCompletion:(id)a3;
- (void)_relevanceQueue_openDataStores;
- (void)_removeAllPendingUpdates;
- (void)_scheduleUpdate:(id)a3;
- (void)addProvider:(id)a3 completion:(id)a4;
- (void)beginActivity:(id)a3;
- (void)beginFetchingData;
- (void)dealloc;
- (void)endActivity:(id)a3;
- (void)enumerateInflectionFeatureValues:(id)a3;
- (void)finishFetchingData;
- (void)isProviderHistoric:(id)a3 completion:(id)a4;
- (void)pauseWithCompletion:(id)a3;
- (void)relevanceForHistoricProvider:(id)a3 completion:(id)a4;
- (void)relevanceForProvider:(id)a3 completion:(id)a4;
- (void)removeProvider:(id)a3 completion:(id)a4;
- (void)resumeWithCompletion:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setSupportedFeatures:(id)a3;
@end

@implementation RERelevanceProviderManager

uint64_t __46__RERelevanceProviderManager__scheduleUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_scheduleUpdate:", *(void *)(a1 + 40));
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)setSupportedFeatures:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v4 = (REFeatureSet *)a3;
  v5 = self->_supportedFeatures;
  if (v5 == v4)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(REFeatureSet *)v5 isEqual:v4];

    if (!v7)
    {
      v8 = (REFeatureSet *)[(REFeatureSet *)v4 copy];
      supportedFeatures = self->_supportedFeatures;
      self->_supportedFeatures = v8;

      if (self->_supportedFeatures)
      {
        v10 = [MEMORY[0x263EFF980] array];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v11 = [(id)objc_opt_class() _features];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              if ([(REFeatureSet *)self->_supportedFeatures containsFeature:v16]) {
                [v10 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v13);
        }

        v17 = (NSArray *)[v10 copy];
        effectiveFeatures = self->_effectiveFeatures;
        self->_effectiveFeatures = v17;
      }
      else
      {
        v19 = [(id)objc_opt_class() _features];
        v20 = self->_effectiveFeatures;
        self->_effectiveFeatures = v19;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      v22 = [WeakRetained relevanceEngine];
      v23 = [v22 inflectionFeatureValues];

      v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_effectiveFeatures, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v25 = self->_effectiveFeatures;
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v35 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v34 + 1) + 8 * j);
            v31 = objc_msgSend(v23, "objectForKeyedSubscript:", v30, (void)v34);
            if (v31) {
              [v24 setObject:v31 forKeyedSubscript:v30];
            }
          }
          uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v27);
      }

      v32 = (NSDictionary *)[v24 copy];
      inflectionValues = self->_inflectionValues;
      self->_inflectionValues = v32;
    }
  }
}

- (void)_scheduleUpdate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__RERelevanceProviderManager__scheduleUpdate___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)setEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_environment, a3);
  if (a3)
  {
    id v5 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
    [(RERelevanceProviderManager *)self _scheduleUpdate:v5];
  }
}

+ (id)_dependencyClasses
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (RERelevanceProviderManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RERelevanceProviderManager;
  id v6 = [(RERelevanceProviderManager *)&v27 init];
  BOOL v7 = v6;
  if (v6)
  {
    [(RERelevanceProviderManager *)v6 _loadLoggingHeader];
    uint64_t v8 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    providers = v7->_providers;
    v7->_providers = (NSHashTable *)v8;

    v7->_dataStoresOpened = 0;
    objc_storeStrong((id *)&v7->_accessQueue, a3);
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 stringWithFormat:@"com.apple.RelevanceEngine.%@", v12];

    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v15 = v13;
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], v14);
    relevanceQueue = v7->_relevanceQueue;
    v7->_relevanceQueue = (OS_dispatch_queue *)v16;

    v18 = objc_opt_class();
    v7->_implementsPrepareForUpdate = RESubclassOverridesMethod(v7, v18, (uint64_t)sel__prepareForUpdate);
    int v19 = [(id)objc_opt_class() _wantsSeperateRelevanceQueue];
    v7->_hasSeperateRelevanceQueue = v19;
    if (v19)
    {
      if (initWithQueue__onceToken != -1) {
        dispatch_once(&initWithQueue__onceToken, &__block_literal_global_87);
      }
      v20 = v7->_relevanceQueue;
      v21 = [(id)initWithQueue__QueuePool nextAvailableQueue];
      dispatch_set_target_queue(v20, v21);
    }
    else
    {
      dispatch_set_target_queue((dispatch_object_t)v7->_relevanceQueue, (dispatch_queue_t)v7->_accessQueue);
    }
    [(RERelevanceProviderManager *)v7 setSupportedFeatures:0];
    v22 = [[REPriorityQueue alloc] initWithComparator:&__block_literal_global_95];
    scheduledUpdates = v7->_scheduledUpdates;
    v7->_scheduledUpdates = v22;

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    v25 = RESignificantTimeChangeNotification();
    [v24 addObserver:v7 selector:sel__handleSignificantTimeChange name:v25 object:0];
  }
  return v7;
}

- (void)_loadLoggingHeader
{
  v3 = (objc_class *)[(id)objc_opt_class() _relevanceProviderClass];
  id v4 = NSStringFromClass(v3);
  id v9 = (id)[v4 mutableCopy];

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"NTK", &stru_26CFA57D0, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"RelevanceProvider", &stru_26CFA57D0, 1, 0, objc_msgSend(v9, "length"));
  id v5 = NSString;
  id v6 = [v9 lowercaseString];
  BOOL v7 = [v5 stringWithFormat:@"[PM: %@]", v6];
  loggingHeader = self->_loggingHeader;
  self->_loggingHeader = v7;
}

- (NSArray)allProviders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  providers = self->_providers;
  return [(NSHashTable *)providers allObjects];
}

- (void)_accessQueue_scheduleUpdate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(RERelevanceProviderManager *)self _accessQueue_performImmediateUpdate:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v5;
      if ([(REPriorityQueue *)self->_scheduledUpdates containsObject:v4]) {
        [(RERelevanceProviderManager *)self _accessQueue_appendCompletionHandlerForScheduledUpdate:v4];
      }
      else {
        [(REPriorityQueue *)self->_scheduledUpdates insertObject:v4];
      }
      [(RERelevanceProviderManager *)self _accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded];
    }
  }
}

- (void)_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];
  if (v4)
  {
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      id v6 = objc_msgSend(v4, "updateDate", v16);
      BOOL v7 = [v6 compare:v3] == 1;

      if (v7) {
        break;
      }
      uint64_t v8 = RELogForDomain(3);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = self->_loggingHeader;
        *(_DWORD *)buf = v16;
        v20 = loggingHeader;
        _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "%@ performing scheduled update", buf, 0xCu);
      }

      [(RERelevanceProviderManager *)self _accessQueue_performUpdate:v4];
      [(REPriorityQueue *)self->_scheduledUpdates removeMinimumObject];
      uint64_t v10 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];

      id v4 = (void *)v10;
    }
    while (v10);
  }
  if ([(REPriorityQueue *)self->_scheduledUpdates count])
  {
    v11 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];
    uint64_t v12 = [v11 updateDate];

    objc_initWeak((id *)buf, self);
    accessQueue = self->_accessQueue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__RERelevanceProviderManager__accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded__block_invoke;
    v17[3] = &unk_2644BC700;
    objc_copyWeak(&v18, (id *)buf);
    uint64_t v14 = +[REUpNextTimer timerWithFireDate:v12 queue:accessQueue block:v17];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(RERelevanceProviderManager *)self _accessQueue_resetTimer];
  }
}

- (void)_accessQueue_resetTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(REUpNextTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void)_accessQueue_performImmediateUpdate:(id)a3
{
  accessQueue = self->_accessQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  [(RERelevanceProviderManager *)self _accessQueue_performUpdate:v5];

  [(RERelevanceProviderManager *)self _accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded];
}

- (void)_accessQueue_performUpdate:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int v4 = [v8 allProviders];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (v4)
  {
    id v6 = [v8 completion];
    [WeakRetained scheduleUpdateForRelevanceProviderManager:self completion:v6];
  }
  else
  {
    id v6 = [v8 provider];
    BOOL v7 = [v8 completion];
    [WeakRetained scheduleUpdateForRelevanceProvider:v6 completion:v7];
  }
}

- (void)_prepareForUpdateWithCompletion:(id)a3
{
  int v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_implementsPrepareForUpdate)
  {
    relevanceQueue = self->_relevanceQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__RERelevanceProviderManager__prepareForUpdateWithCompletion___block_invoke;
    v7[3] = &unk_2644BC5E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(relevanceQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
}

+ (BOOL)_wantsDelayedUpdate
{
  return 0;
}

void __52__RERelevanceProviderManager_providerManagerClasses__block_invoke()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:17];
  v1 = (void *)providerManagerClasses__providerManagersClasses;
  providerManagerClasses__providerManagersClasses = v0;

  if (REProviderManagerLoadingBlock)
  {
    id v9 = (void *)providerManagerClasses__providerManagersClasses;
    uint64_t v10 = (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(REProviderManagerLoadingBlock + 16))(REProviderManagerLoadingBlock, v2, v3, v4, v5, v6, v7, v8, v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];
    uint64_t v12 = (void *)providerManagerClasses__providerManagersClasses;
    providerManagerClasses__providerManagersClasses = v11;
  }
}

uint64_t __44__RERelevanceProviderManager_initWithQueue___block_invoke()
{
  initWithQueue__QueuePool = [[REDispatchQueuePool alloc] initWithQueueCount:2 prefix:@"com.apple.RelevanceEngine.ProviderManager"];
  return MEMORY[0x270F9A758]();
}

+ (id)providerManagerClasses
{
  if (providerManagerClasses_onceToken != -1) {
    dispatch_once(&providerManagerClasses_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)providerManagerClasses__providerManagersClasses;
  return v2;
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 1;
}

+ (void)setProviderManagerClassesLoadingBlock:(id)a3
{
  REProviderManagerLoadingBlock = [a3 copy];
  MEMORY[0x270F9A758]();
}

uint64_t __44__RERelevanceProviderManager_initWithQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return REScheduledUpdateSortedByDate(a2, a3);
}

- (void)dealloc
{
  if (self->_dataStoresOpened) {
    [(RERelevanceProviderManager *)self pause];
  }
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = RESignificantTimeChangeNotification();
  [v3 removeObserver:self name:v4 object:0];

  v5.receiver = self;
  v5.super_class = (Class)RERelevanceProviderManager;
  [(RERelevanceProviderManager *)&v5 dealloc];
}

+ (BOOL)_requiresLocationServices
{
  return 0;
}

- (float)_relevanceForProvider:(id)a3
{
  return 0.0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  -[RERelevanceProviderManager _relevanceForProvider:](self, "_relevanceForProvider:", a3, a4);
  double v5 = v4;
  return +[REFeatureValue featureValueWithDouble:v5];
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  return [(RERelevanceProviderManager *)self _valueForProvider:a3 feature:a5];
}

- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    uint64_t v28 = (void *)*MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v18 = [(RERelevanceProviderManager *)self _valueForProvider:v8 context:v9 feature:v17];
        if (!v18)
        {
          uint64_t v19 = (objc_class *)objc_opt_class();
          uint64_t v20 = NSStringFromClass(v19);
          RERaiseInternalException(v28, @"%@ Unable to get feature value for relevance provider %@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          uint64_t v18 = +[REFeatureValue nullValueForFeature:v17];
        }
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (BOOL)_supportsHistoricProviders
{
  return 0;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return 0;
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  return 0.0;
}

- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4
{
  -[RERelevanceProviderManager _relevanceForHistoricProvider:](self, "_relevanceForHistoricProvider:", a3, a4);
  double v5 = v4;
  return +[REFeatureValue featureValueWithDouble:v5];
}

- (NSArray)effectiveFeatures
{
  return self->_effectiveFeatures;
}

- (void)addProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (![(RERelevanceProviderManager *)self _isValidProvider:v6]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Provider %@ is not support by provider manager %@", v6, self format];
  }
  [(NSHashTable *)self->_providers addObject:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__RERelevanceProviderManager_addProvider_completion___block_invoke;
  v12[3] = &unk_2644BC570;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = (void (**)(void))MEMORY[0x223C31700](v12);
  uint64_t v11 = v10;
  if (self->_hasSeperateRelevanceQueue) {
    dispatch_async((dispatch_queue_t)self->_relevanceQueue, v10);
  }
  else {
    v10[2](v10);
  }
}

void __53__RERelevanceProviderManager_addProvider_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addedProvider:*(void *)(a1 + 40)];
  uint64_t v2 = RELogForDomain(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__RERelevanceProviderManager_addProvider_completion___block_invoke_cold_1();
  }

  uint64_t v3 = +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:*(void *)(a1 + 40)];
  [v3 setCompletion:*(void *)(a1 + 48)];
  float v4 = *(unsigned char **)(a1 + 32);
  if (v4[57]) {
    [v4 _scheduleUpdate:v3];
  }
  else {
    objc_msgSend(v4, "_accessQueue_scheduleUpdate:", v3);
  }
}

- (void)removeProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (![(NSHashTable *)self->_providers containsObject:v6]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"No provider %@ was found by provider manager %@", v6, self format];
  }
  [(NSHashTable *)self->_providers removeObject:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__RERelevanceProviderManager_removeProvider_completion___block_invoke;
  v12[3] = &unk_2644BC570;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = (void (**)(void))MEMORY[0x223C31700](v12);
  uint64_t v11 = v10;
  if (self->_hasSeperateRelevanceQueue) {
    dispatch_async((dispatch_queue_t)self->_relevanceQueue, v10);
  }
  else {
    v10[2](v10);
  }
}

uint64_t __56__RERelevanceProviderManager_removeProvider_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeProvider:*(void *)(a1 + 40)];
  uint64_t v2 = RELogForDomain(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__RERelevanceProviderManager_removeProvider_completion___block_invoke_cold_1();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)containsProvider:(id)a3
{
  uint64_t v3 = self;
  accessQueue = self->_accessQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  LOBYTE(v3) = [(NSHashTable *)v3->_providers containsObject:v5];

  return (char)v3;
}

- (void)relevanceForProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RERelevanceProviderManager_relevanceForProvider_completion___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(relevanceQueue, block);
}

void __62__RERelevanceProviderManager_relevanceForProvider_completion___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  float v4 = [v2 effectiveFeatures];
  id v5 = [v2 _valuesForProvider:v3 context:0 features:v4];

  id v6 = RELogForDomain(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[4] + 80);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_debug_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEBUG, "%@ calculated relevances %@ for relevance provider %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)relevanceForProvider:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  if (self->_hasSeperateRelevanceQueue)
  {
    relevanceQueue = self->_relevanceQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__RERelevanceProviderManager_relevanceForProvider_context___block_invoke;
    v14[3] = &unk_2644BC598;
    uint64_t v17 = &v18;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_sync(relevanceQueue, v14);
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
    int v9 = [(RERelevanceProviderManager *)self effectiveFeatures];
    uint64_t v10 = [(RERelevanceProviderManager *)self _valuesForProvider:v6 context:v7 features:v9];
    __int16 v11 = (void *)v19[5];
    v19[5] = v10;
  }
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __59__RERelevanceProviderManager_relevanceForProvider_context___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = [v2 effectiveFeatures];
  uint64_t v5 = [v2 _valuesForProvider:v3 context:v4 features:v8];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)isProviderHistoric:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__RERelevanceProviderManager_isProviderHistoric_completion___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(relevanceQueue, block);
}

uint64_t __60__RERelevanceProviderManager_isProviderHistoric_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _isHistoricProvider:*(void *)(a1 + 40)];
  uint64_t v3 = RELogForDomain(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = @"current";
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 80);
    if (v2) {
      id v6 = @"historic";
    }
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_debug_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEBUG, "%@ relevance provider %@ is %@", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)relevanceForHistoricProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__RERelevanceProviderManager_relevanceForHistoricProvider_completion___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(relevanceQueue, block);
}

void __70__RERelevanceProviderManager_relevanceForHistoricProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x263EFF980];
  uint64_t v3 = [*(id *)(a1 + 32) effectiveFeatures];
  uint64_t v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "effectiveFeatures", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(a1 + 32) _valueForHistoricProvider:*(void *)(a1 + 40) feature:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v11 = RELogForDomain(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 80);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_debug_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_DEBUG, "%@ calculated historic relevances %@ for relevance provider %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (RERelevanceProviderEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (RERelevanceProviderEnvironment *)WeakRetained;
}

- (id)_engineLocationManager
{
  int v2 = [(RERelevanceProviderManager *)self environment];
  uint64_t v3 = [v2 relevanceEngine];
  uint64_t v4 = [v3 locationManager];

  return v4;
}

- (void)beginActivity:(id)a3
{
  p_environment = &self->_environment;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_environment);
  [WeakRetained beginActivity:v5 forObject:self];
}

- (void)endActivity:(id)a3
{
  p_environment = &self->_environment;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_environment);
  [WeakRetained endActivity:v5 forObject:self];
}

- (void)enumerateInflectionFeatureValues:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    inflectionValues = self->_inflectionValues;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__RERelevanceProviderManager_enumerateInflectionFeatureValues___block_invoke;
    v7[3] = &unk_2644BC5C0;
    id v8 = v4;
    [(NSDictionary *)inflectionValues enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __63__RERelevanceProviderManager_enumerateInflectionFeatureValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [MEMORY[0x263EFF9D0] null];
        int v13 = [v12 isEqual:v11];

        if (v13)
        {

          id v11 = 0;
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (BOOL)_isValidProvider:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _relevanceProviderClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_dataSourcesOpened
{
  return self->_dataStoresOpened;
}

- (id)_manager_queue
{
  return self->_relevanceQueue;
}

- (void)_enumerateProviders:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RERelevanceProviderManager__enumerateProviders___block_invoke;
  v7[3] = &unk_2644BC5E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __50__RERelevanceProviderManager__enumerateProviders___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)beginFetchingData
{
}

- (void)finishFetchingData
{
}

- (void)resumeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke;
  block[3] = &unk_2644BC610;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async(relevanceQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 56)) {
      [(dispatch_queue_t *)WeakRetained _relevanceQueue_openDataStores];
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke_2;
    v6[3] = &unk_2644BC5E8;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    id v4 = (void (**)(void))MEMORY[0x223C31700](v6);
    uint64_t v5 = v4;
    if (*((unsigned char *)v3 + 57)) {
      dispatch_async(v3[9], v4);
    }
    else {
      v4[2](v4);
    }
  }
}

uint64_t __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)pauseWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke;
  block[3] = &unk_2644BC638;
  objc_copyWeak(&v12, &location);
  dispatch_async(accessQueue, block);
  relevanceQueue = self->_relevanceQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2;
  v8[3] = &unk_2644BC610;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(relevanceQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_resetTimer");
}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && WeakRetained[56])
  {
    [WeakRetained pause];
    v3[56] = 0;
    id v4 = RELogForDomain(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

- (void)_handleSignificantTimeChange
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__RERelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__RERelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
}

- (void)_removeAllPendingUpdates
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RERelevanceProviderManager__removeAllPendingUpdates__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__RERelevanceProviderManager__removeAllPendingUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

uint64_t __62__RERelevanceProviderManager__prepareForUpdateWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareForUpdate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (NSArray)allRelevanceProviders
{
  return [(NSHashTable *)self->_providers allObjects];
}

- (BOOL)dataSourcesOpened
{
  return self->_dataStoresOpened;
}

- (unint64_t)scheduledUpdatesCount
{
  return [(REPriorityQueue *)self->_scheduledUpdates count];
}

- (void)_relevanceQueue_openDataStores
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "%@ opened data sources", (uint8_t *)&v3, 0xCu);
}

void __60__RERelevanceProviderManager__relevanceQueue_openDataStores__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained immediateUpdateForRelevanceProviderManager:*(void *)(a1 + 32) completion:&__block_literal_global_125];
}

- (void)_accessQueue_appendCompletionHandlerForScheduledUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v5 = [v4 completion];

  if (v5)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    scheduledUpdates = self->_scheduledUpdates;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke;
    v7[3] = &unk_2644BC6D8;
    id v9 = v10;
    id v8 = v4;
    [(REPriorityQueue *)scheduledUpdates enumerateObjects:v7];

    _Block_object_dispose(v10, 8);
  }
}

void __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && [v3 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [*(id *)(a1 + 32) completion];

    if (v5)
    {
      id v6 = [v4 completion];
      id v7 = [*(id *)(a1 + 32) completion];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke_2;
      void v10[3] = &unk_2644BC6B0;
      id v11 = v6;
      id v12 = v7;
      id v8 = v7;
      id v9 = v6;
      [v4 setCompletion:v10];
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) completion];
      [v4 setCompletion:v9];
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __88__RERelevanceProviderManager__accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
}

- (REFeatureSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_loggingHeader, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_relevanceQueue, 0);
  objc_storeStrong((id *)&self->_inflectionValues, 0);
  objc_storeStrong((id *)&self->_effectiveFeatures, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_scheduledUpdates, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

+ (Class)_relevanceProviderClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (Class)objc_opt_class();
}

+ (id)_features
{
  return (id)MEMORY[0x263EFFA68];
}

void __53__RERelevanceProviderManager_addProvider_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ added relevance provider %@");
}

void __56__RERelevanceProviderManager_removeProvider_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ removed relevance provider %@");
}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "%@ closed data sources", (uint8_t *)&v3, 0xCu);
}

@end