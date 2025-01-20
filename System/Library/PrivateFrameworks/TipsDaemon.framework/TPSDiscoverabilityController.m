@interface TPSDiscoverabilityController
+ (id)contextualInfoMap;
+ (void)removeContextualInfoCache;
- (BOOL)_isConditionMet:(id)a3 hasUpdates:(BOOL *)a4 forIdentifier:(id)a5;
- (BOOL)_updateTriggerConditionForObserverIdentifiers:(id)a3;
- (BOOL)isContentHintDisplayMaxDisplayedCountExceededForIdentifier:(id)a3;
- (BOOL)isContextualInfoExistForIdentifier:(id)a3;
- (BOOL)updateDesiredOutcomeConditionForObserverIdentifers:(id)a3;
- (NSDictionary)contextualInfoMap;
- (OS_dispatch_queue)contextualInfoQueue;
- (TPSDiscoverabilityController)init;
- (TPSDiscoverabilityController)initWithTipStatusController:(id)a3;
- (TPSDiscoverabilityControllerDelegate)delegate;
- (TPSEventsHistoryController)eventsHistoryController;
- (TPSTipStatusController)tipStatusController;
- (id)_matchingIdentifiersForConditionWithType:(unint64_t)a3 forObserverIdentifiers:(id)a4 hasUpdates:(BOOL *)a5;
- (id)contextualInfoForIdentifier:(id)a3;
- (id)contextualInfoIdentifiers;
- (id)discoverabilityTipWithMetadata:(id)a3 contentDictionary:(id)a4 preconditions:(id)a5;
- (id)monitoringEventsForContentID:(id)a3;
- (int64_t)customizationIDForContentID:(id)a3;
- (void)_cleanupContextualInfoMap;
- (void)_reconcileRegisteredEvents;
- (void)_registerWakingCallbackForContextualInfo:(id)a3;
- (void)_removeCacheData;
- (void)_updateCacheData;
- (void)_updateContextualInfoMapCache;
- (void)_updateRegisteredEventIdentifiers;
- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4;
- (void)contextualEligibilityWithTipIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 experimentCampChangesToAll:(BOOL)a6;
- (void)dataProviderManager:(id)a3 didFinishQueryWithResults:(id)a4 type:(int64_t)a5;
- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5;
- (void)markHintIneligibleForIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6;
- (void)markHintIneligibleForIdentifiers:(id)a3 context:(id)a4 reason:(int64_t)a5;
- (void)processEventProviderQueryResults:(id)a3 type:(int64_t)a4;
- (void)queryCurrentEvents;
- (void)removeAllContextualInfos;
- (void)removeContextualInfoForIdentifiers:(id)a3;
- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3;
- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3 updateCache:(BOOL)a4;
- (void)restartTriggerTrackingIfNotDisplayedForIdentifiers:(id)a3;
- (void)setContextualInfoQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)updateContentViewedForIdentifier:(id)a3;
- (void)updateHintDismissedForIdentifier:(id)a3 dismissType:(id)a4 context:(id)a5;
- (void)updateHintWouldHaveBeenDisplayedForIdentifier:(id)a3 context:(id)a4;
- (void)updateIdentifier:(id)a3 withContextualInfo:(id)a4;
@end

@implementation TPSDiscoverabilityController

- (void)setTipStatusController:(id)a3
{
}

+ (void)removeContextualInfoCache
{
  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:0 forKey:@"DiscoverabilityDeliveryInfoMap"];
  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:0 forKey:@"RegisteredDeliveryEventIdentifiers"];

  +[TPSEventsHistoryController removeEventHistoryCache];
}

+ (id)contextualInfoMap
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClasses:v5 forKey:@"DiscoverabilityDeliveryInfoMap"];

  return v6;
}

- (TPSDiscoverabilityController)initWithTipStatusController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v34.receiver = self;
    v34.super_class = (Class)TPSDiscoverabilityController;
    v6 = [(TPSDiscoverabilityController *)&v34 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_tipStatusController, a3);
      uint64_t v8 = [MEMORY[0x1E4FAF468] defaultManager];
      eventsProviderManager = v7->_eventsProviderManager;
      v7->_eventsProviderManager = (TPSEventsProviderManager *)v8;

      [(TPSEventsProviderManager *)v7->_eventsProviderManager setDelegate:v7];
      v10 = [[TPSEventsHistoryController alloc] initWithTipStatusController:v5];
      eventsHistoryController = v7->_eventsHistoryController;
      v7->_eventsHistoryController = v10;

      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("com.apple.tipsd.contextualInfoQueue", v12);
      contextualInfoQueue = v7->_contextualInfoQueue;
      v7->_contextualInfoQueue = (OS_dispatch_queue *)v13;

      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v16 = dispatch_queue_create("com.apple.tipsd.eventRegistrationQueue", v15);
      eventRegistrationQueue = v7->_eventRegistrationQueue;
      v7->_eventRegistrationQueue = (OS_dispatch_queue *)v16;

      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.tipsd.eventHistoryProcessingQueue", v18);
      eventResultsProcessingQueue = v7->_eventResultsProcessingQueue;
      v7->_eventResultsProcessingQueue = (OS_dispatch_queue *)v19;

      uint64_t v21 = +[TPSDiscoverabilityController contextualInfoMap];
      contextualInfoMap = v7->_contextualInfoMap;
      v7->_contextualInfoMap = (NSMutableDictionary *)v21;

      if (v7->_contextualInfoMap)
      {
        [(TPSDiscoverabilityController *)v7 _cleanupContextualInfoMap];
      }
      else
      {
        uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
        v25 = v7->_contextualInfoMap;
        v7->_contextualInfoMap = (NSMutableDictionary *)v24;
      }
      v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      uint64_t v29 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClasses:v28 forKey:@"RegisteredDeliveryEventIdentifiers"];
      registeredEventIdentifiers = v7->_registeredEventIdentifiers;
      v7->_registeredEventIdentifiers = (NSMutableSet *)v29;

      if (v7->_registeredEventIdentifiers)
      {
        [(TPSDiscoverabilityController *)v7 _reconcileRegisteredEvents];
      }
      else
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA80] set];
        v32 = v7->_registeredEventIdentifiers;
        v7->_registeredEventIdentifiers = (NSMutableSet *)v31;
      }
      v7->_overrideHintMaxDisplayedCount = [MEMORY[0x1E4FAF450] discoverabilityOverrideMaxDisplayCount];
    }
    self = v7;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (TPSDiscoverabilityController)init
{
  return 0;
}

- (TPSEventsHistoryController)eventsHistoryController
{
  return self->_eventsHistoryController;
}

- (NSDictionary)contextualInfoMap
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  uint64_t v3 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TPSDiscoverabilityController_contextualInfoMap__block_invoke;
  v6[3] = &unk_1E6E6B148;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __49__TPSDiscoverabilityController_contextualInfoMap__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)contextualInfoIdentifiers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  uint64_t v3 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__TPSDiscoverabilityController_contextualInfoIdentifiers__block_invoke;
  v6[3] = &unk_1E6E6B758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __57__TPSDiscoverabilityController_contextualInfoIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) allKeys];

  return MEMORY[0x1F41817F8]();
}

- (void)updateIdentifier:(id)a3 withContextualInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__TPSDiscoverabilityController_updateIdentifier_withContextualInfo___block_invoke;
  v11[3] = &unk_1E6E6C850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__TPSDiscoverabilityController_updateIdentifier_withContextualInfo___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained[5] setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)removeContextualInfoForIdentifiers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TPSDiscoverabilityController_removeContextualInfoForIdentifiers___block_invoke;
  block[3] = &unk_1E6E6B2D8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__TPSDiscoverabilityController_removeContextualInfoForIdentifiers___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[5] removeObjectsForKeys:*(void *)(a1 + 32)];
}

- (void)removeAllContextualInfos
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__TPSDiscoverabilityController_removeAllContextualInfos__block_invoke;
  v4[3] = &unk_1E6E6C940;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__TPSDiscoverabilityController_removeAllContextualInfos__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[5] removeAllObjects];
}

- (id)contextualInfoForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  dispatch_queue_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v5 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TPSDiscoverabilityController_contextualInfoForIdentifier___block_invoke;
  block[3] = &unk_1E6E6C550;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__TPSDiscoverabilityController_contextualInfoForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)_cleanupContextualInfoMap
{
  uint64_t v3 = [(TPSDiscoverabilityController *)self contextualInfoMap];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__17;
  id v9 = __Block_byref_object_dispose__17;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke;
  v4[3] = &unk_1E6E6CB38;
  void v4[4] = self;
  v4[5] = &v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  if (v6[5])
  {
    -[TPSDiscoverabilityController removeContextualInfoForIdentifiers:](self, "removeContextualInfoForIdentifiers:");
    [(TPSEventsHistoryController *)self->_eventsHistoryController removeObserverIdentifiers:v6[5]];
    [(TPSDiscoverabilityController *)self _updateCacheData];
  }
  _Block_object_dispose(&v5, 8);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 72);
  if (([v4 isPreconditionMatchedForIdentifier:v3] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_4();
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    [*(id *)(a1 + 32) restartTriggerTrackingIfNotDisplayedForIdentifier:v3];
    uint64_t v6 = 15;
    goto LABEL_17;
  }
  if ([v4 isContextualInfoLifetimeExpiredForIdentifier:v3])
  {
    uint64_t v5 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    uint64_t v6 = 18;
LABEL_17:
    id v10 = [v4 lastDisplayContextForIdentifier:v3];
    v11 = *(void **)(a1 + 32);
    v13[0] = v3;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v11 markHintIneligibleForIdentifiers:v12 context:v10 reason:v6];

    goto LABEL_18;
  }
  if ([v4 isHintMaxDurationExcceededForIdentifier:v3])
  {
    id v8 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) updateHintDismissedForIdentifier:v3 dismissType:*MEMORY[0x1E4FAF4D8] context:0];
    uint64_t v6 = 19;
    goto LABEL_17;
  }
  if ([v4 isEligibilityTrackingNeedsRestartForIdentifier:v3])
  {
    id v9 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_3();
    }

    [*(id *)(a1 + 32) restartTriggerTrackingIfNotDisplayedForIdentifier:v3];
    uint64_t v6 = 17;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(TPSDiscoverabilityController *)self restartTriggerTrackingIfNotDisplayedForIdentifier:*(void *)(*((void *)&v9 + 1) + 8 * v8++) updateCache:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(TPSDiscoverabilityController *)self _updateCacheData];
}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3
{
}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3 updateCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(TPSTipStatusController *)self->_tipStatusController isHintDisplayedForIdentifier:v6] & 1) == 0)
  {
    uint64_t v7 = [(TPSTipStatusController *)self->_tipStatusController hintWouldHaveBeenDisplayedDateForIdentifier:v6];
    if (v7)
    {
    }
    else
    {
      uint64_t v8 = [(TPSTipStatusController *)self->_tipStatusController dateForTriggerRestartTrackingForIdentifier:v6];

      if (!v8)
      {
        [(TPSTipStatusController *)self->_tipStatusController updateHintEligibleDateForIdentifier:v6 value:0];
        [(TPSTipStatusController *)self->_tipStatusController removeUserInfoForIdentifier:v6];
        long long v9 = [MEMORY[0x1E4F1C9C8] date];
        long long v10 = [v9 dateByAddingTimeInterval:fabs(-180.0)];

        [(TPSTipStatusController *)self->_tipStatusController updateDateForTriggerRestartTrackingForIdentifier:v6 date:v10];
        long long v11 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v6];
        [v11 restartTriggerTracking];
        long long v12 = [MEMORY[0x1E4FAF480] discoverability];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412546;
          id v14 = v6;
          __int16 v15 = 2112;
          dispatch_queue_t v16 = v10;
          _os_log_impl(&dword_1E4492000, v12, OS_LOG_TYPE_DEFAULT, "Restart trigger tracking for %@ on %@", (uint8_t *)&v13, 0x16u);
        }

        if (v4) {
          [(TPSDiscoverabilityController *)self _updateCacheData];
        }
      }
    }
  }
}

- (void)contextualEligibilityWithTipIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 experimentCampChangesToAll:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v66 = a5;
  long long v12 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4492000, v12, OS_LOG_TYPE_DEFAULT, "process tip delivery json", buf, 2u);
  }

  [(TPSDiscoverabilityController *)self _cleanupContextualInfoMap];
  if (v10)
  {
    int v13 = (void *)MEMORY[0x1E4F1CA80];
    p_tipStatusController = &self->_tipStatusController;
    id v14 = [(TPSTipStatusController *)self->_tipStatusController reenrollPreconditionChangeContent];
    v59 = [v13 setWithSet:v14];

    if (v6)
    {
      __int16 v15 = [(TPSTipStatusController *)*p_tipStatusController reenrollHoldoutContent];
      [v59 unionSet:v15];
    }
    dispatch_queue_t v16 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[TPSDiscoverabilityController contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:]((id *)p_tipStatusController, v16);
    }

    uint64_t v17 = [(TPSTipStatusController *)*p_tipStatusController tipStatusMap];
    [v17 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];

    uint64_t v18 = [v10 count];
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v21 = [(TPSDiscoverabilityController *)self contextualInfoIdentifiers];
      v56 = [v20 setWithArray:v21];

      v62 = [MEMORY[0x1E4F1CA80] setWithCapacity:v19];
      v58 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v57 = v10;
      id obj = v10;
      uint64_t v67 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
      if (!v67)
      {
        char v61 = 0;
        goto LABEL_78;
      }
      char v61 = 0;
      uint64_t v65 = *(void *)v72;
      unint64_t v22 = 0x1E6E6A000uLL;
      id v60 = v11;
      while (1)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v72 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v71 + 1) + 8 * v23);
          v25 = *(void **)(v22 + 2336);
          v26 = objc_msgSend(v11, "objectForKeyedSubscript:", v24, v56);
          uint64_t v27 = [v25 contentDictionaryWithTipDeliveryInfoId:v26 deliveryInfoMap:v66];

          if (v27)
          {
            int v28 = [(TPSTipStatusController *)*p_tipStatusController isTriggerTrackingEligibleForIdentifier:v24];
            int v29 = [(TPSTipStatusController *)*p_tipStatusController isDesiredOutcomeTrackingEligibleForIdentifier:v24];
            if (v28) {
              goto LABEL_20;
            }
          }
          else
          {
            int v28 = 0;
            int v29 = 0;
          }
          if (!v29)
          {
            BOOL v30 = 0;
            BOOL v31 = 0;
            goto LABEL_68;
          }
LABEL_20:
          v32 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v24];
          v33 = [(TPSTipStatusController *)self->_tipStatusController dateForTriggerRestartTrackingForIdentifier:v24];
          v68 = v33;
          if (v32)
          {
            if (![v32 hasChangesFromDictionary:v27])
            {
              if (v33 || [v59 containsObject:v24]) {
                goto LABEL_34;
              }
              goto LABEL_32;
            }
            eventsHistoryController = self->_eventsHistoryController;
            uint64_t v79 = v24;
            char v61 = 1;
            v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
            v36 = eventsHistoryController;
            v33 = v68;
            [(TPSEventsHistoryController *)v36 removeObserverIdentifiers:v35];

            unint64_t v22 = 0x1E6E6A000uLL;
            [(TPSDiscoverabilityController *)self updateIdentifier:v24 withContextualInfo:0];
          }
          v37 = (void *)[objc_alloc(*(Class *)(v22 + 2336)) initWithDictionary:v27];

          if (v37)
          {
            v38 = [v37 displayBundleIDs];
            if ([v38 count])
            {

LABEL_33:
              v32 = v37;
              unint64_t v22 = 0x1E6E6A000uLL;
              v33 = v68;
LABEL_34:
              if (v28)
              {
                v40 = [v32 triggerCondition];

                if (v40)
                {
                  int v28 = 1;
                }
                else
                {
                  v41 = [(TPSTipStatusController *)*p_tipStatusController hintEligibleDateForIdentifier:v24];

                  if (!v41) {
                    [v58 addObject:v24];
                  }
                  int v28 = 0;
                }
                v33 = v68;
              }
              if (v29)
              {
                v42 = [v32 desiredOutcomeCondition];
                int v29 = v42 != 0;
              }
              v43 = *(void **)(v22 + 2336);
              if (v28) {
                v44 = &v70;
              }
              else {
                v44 = 0;
              }
              if (v28) {
                id v70 = 0;
              }
              if (v29) {
                v45 = &v69;
              }
              else {
                v45 = 0;
              }
              if (v29) {
                id v69 = 0;
              }
              [v43 eventsInfoArrayForContextualInfoDictionary:v27 triggerEvents:v44 desiredOutcomeEvents:v45];
              if (v28) {
                id v46 = v70;
              }
              else {
                id v46 = 0;
              }
              v47 = self;
              if (v29) {
                id v48 = v69;
              }
              else {
                id v48 = 0;
              }
              if ([v46 count] || objc_msgSend(v48, "count"))
              {
                if (v33)
                {
                  [(TPSTipStatusController *)*p_tipStatusController updateHintInelgibileForIdentifier:v24 value:0];
                  [(TPSTipStatusController *)*p_tipStatusController updateDateForTriggerRestartTrackingForIdentifier:v24 date:0];
                  v49 = [MEMORY[0x1E4FAF480] discoverability];
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v76 = v24;
                    __int16 v77 = 2112;
                    *(void *)v78 = v68;
                    _os_log_debug_impl(&dword_1E4492000, v49, OS_LOG_TYPE_DEBUG, "Restarted trigger tracking for %@ on %@", buf, 0x16u);
                  }
                }
                [(TPSDiscoverabilityController *)v47 updateIdentifier:v24 withContextualInfo:v32];
                v33 = v68;
                [(TPSEventsHistoryController *)v47->_eventsHistoryController addEventsFromTriggerEvents:v46 desiredOutcomeEvents:v48 contentIdentifier:v24 eventSinceDate:v68];
                [v62 addObject:v24];
                char v61 = 1;
              }
              else
              {
                v51 = [MEMORY[0x1E4FAF480] discoverability];
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v76 = v24;
                  _os_log_impl(&dword_1E4492000, v51, OS_LOG_TYPE_DEFAULT, "Tips %@ eligible for tracking but not events found in delivery info", buf, 0xCu);
                }

                v33 = v68;
              }

              self = v47;
              id v11 = v60;
              unint64_t v22 = 0x1E6E6A000;
              goto LABEL_67;
            }
            uint64_t v39 = [(TPSTipStatusController *)*p_tipStatusController displayTypeForIdentifier:v24];

            if (v39 != 2) {
              goto LABEL_33;
            }

            v32 = 0;
            unint64_t v22 = 0x1E6E6A000;
            v33 = v68;
          }
          else
          {
            v32 = 0;
            unint64_t v22 = 0x1E6E6A000;
          }
LABEL_32:
          [v62 addObject:v24];
LABEL_67:

          BOOL v30 = v29 != 0;
          BOOL v31 = v28 != 0;
LABEL_68:
          v50 = [MEMORY[0x1E4FAF480] discoverability];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v76 = v24;
            __int16 v77 = 1024;
            *(_DWORD *)v78 = v31;
            *(_WORD *)&v78[4] = 1024;
            *(_DWORD *)&v78[6] = v30;
            _os_log_impl(&dword_1E4492000, v50, OS_LOG_TYPE_DEFAULT, "Tips %@ is eligible for trigger tracking: %d, desired outcome tracking: %d", buf, 0x18u);
          }

          ++v23;
        }
        while (v67 != v23);
        uint64_t v52 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
        uint64_t v67 = v52;
        if (!v52)
        {
LABEL_78:

          v53 = v56;
          [v56 minusSet:v62];
          char v54 = v61;
          if ([v56 count])
          {
            v55 = [v56 allObjects];
            [(TPSEventsHistoryController *)self->_eventsHistoryController removeObserverIdentifiers:v55];
            [(TPSDiscoverabilityController *)self removeContextualInfoForIdentifiers:v55];

            char v54 = 1;
          }
          id v10 = v57;
          if (objc_msgSend(v58, "count", v56)) {
            [(TPSDiscoverabilityController *)self _updateTriggerConditionForObserverIdentifiers:v58];
          }
          if (v54) {
            [(TPSDiscoverabilityController *)self _updateCacheData];
          }

          break;
        }
      }
    }
  }
  [(TPSDiscoverabilityController *)self queryCurrentEvents];
}

void __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke_cold_1((uint64_t)v4, v5);
  }
}

- (void)queryCurrentEvents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(TPSEventsHistoryController *)self->_eventsHistoryController contextualEventsBySourceMap];
  id v4 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 allValues];
    BOOL v6 = [v5 description];
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1E4492000, v4, OS_LOG_TYPE_DEFAULT, "Query events: %@", buf, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(eventSinceDate = nil) || (eventSinceDate <= %@)", v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke;
  v10[3] = &unk_1E6E6CB80;
  id v11 = v8;
  long long v12 = self;
  id v9 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
}

void __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  BOOL v6 = [a3 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
  uint64_t v7 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke_cold_1((uint64_t)v5, v6);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "queryEvents:type:", v6, (int)objc_msgSend(v5, "intValue"));
}

- (void)processEventProviderQueryResults:(id)a3 type:(int64_t)a4
{
  eventsHistoryController = self->_eventsHistoryController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke;
  v5[3] = &unk_1E6E6CBD0;
  v5[4] = self;
  [(TPSEventsHistoryController *)eventsHistoryController processEventProviderQueryResults:a3 completionHandler:v5];
}

void __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    [*(id *)(a1 + 32) markHintIneligibleForIdentifiers:v6 context:0 reason:16];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObserverIdentifiers:v6];
    [*(id *)(a1 + 32) removeContextualInfoForIdentifiers:v6];
  }
  if ([v5 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_2;
    v14[3] = &unk_1E6E6CBA8;
    v14[4] = *(void *)(a1 + 32);
    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_3;
    v13[3] = &unk_1E6E6CBA8;
    v13[4] = *(void *)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:v13];
    id v9 = [v5 filteredArrayUsingPredicate:v7];
    char v10 = [*(id *)(a1 + 32) updateDesiredOutcomeConditionForObserverIdentifers:v9];
    id v11 = [v5 filteredArrayUsingPredicate:v8];
    char v12 = [*(id *)(a1 + 32) _updateTriggerConditionForObserverIdentifiers:v11];

    if (v10 & 1) != 0 || (v12) {
      goto LABEL_7;
    }
  }
  if ([v6 count]) {
LABEL_7:
  }
    [*(id *)(a1 + 32) _updateCacheData];
}

uint64_t __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) isDesiredOutcomeTrackingEligibleForIdentifier:a2];
}

uint64_t __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) isTriggerTrackingEligibleForIdentifier:a2];
}

- (void)_updateCacheData
{
  [(TPSDiscoverabilityController *)self _updateContextualInfoMapCache];
  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
  eventsHistoryController = self->_eventsHistoryController;

  [(TPSEventsHistoryController *)eventsHistoryController updateCacheData];
}

- (void)_removeCacheData
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "Remove TPSDiscoverabilityController cache.", v1, 2u);
}

- (void)_updateRegisteredEventIdentifiers
{
  id obj = self;
  objc_sync_enter(obj);
  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:obj->_registeredEventIdentifiers forKey:@"RegisteredDeliveryEventIdentifiers"];
  objc_sync_exit(obj);
}

- (void)_updateContextualInfoMapCache
{
  objc_initWeak(&location, self);
  id v3 = [(TPSDiscoverabilityController *)self contextualInfoQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__TPSDiscoverabilityController__updateContextualInfoMapCache__block_invoke;
  v4[3] = &unk_1E6E6C940;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__TPSDiscoverabilityController__updateContextualInfoMapCache__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:WeakRetained[5] forKey:@"DiscoverabilityDeliveryInfoMap"];
}

- (BOOL)isContextualInfoExistForIdentifier:(id)a3
{
  id v3 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isContentHintDisplayMaxDisplayedCountExceededForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(TPSTipStatusController *)self->_tipStatusController hintDisplayedCountForIdentifier:v4];
  int64_t overrideHintMaxDisplayedCount = self->_overrideHintMaxDisplayedCount;
  if ((unint64_t)(overrideHintMaxDisplayedCount - 1) >= 0x7FFFFFFFFFFFFFFELL)
  {
    uint64_t v7 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v4];
    int64_t overrideHintMaxDisplayedCount = [v7 displayMaxCount];
  }
  BOOL v9 = overrideHintMaxDisplayedCount != 0x7FFFFFFFFFFFFFFFLL && overrideHintMaxDisplayedCount <= v5;

  return v9;
}

- (void)markHintIneligibleForIdentifiers:(id)a3 context:(id)a4 reason:(int64_t)a5
{
}

- (void)markHintIneligibleForIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [MEMORY[0x1E4FAF368] ineligibleReasonStringForReason:a6];
    *(_DWORD *)buf = 138412546;
    id v33 = v10;
    __int16 v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_1E4492000, v13, OS_LOG_TYPE_DEFAULT, "Marking content as ineligible for content identifiers: %@. Ineligible reason: %@", buf, 0x16u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v10;
  uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v16];
        uint64_t v18 = [(TPSTipStatusController *)self->_tipStatusController displayTypeForIdentifier:v16];
        if (!v12)
        {
          id v12 = [(TPSTipStatusController *)self->_tipStatusController lastDisplayContextForIdentifier:v16];
        }
        uint64_t v19 = (void *)MEMORY[0x1E4FAF378];
        v20 = [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:v16];
        id v21 = v11;
        if (!v11)
        {
          uint64_t v24 = [v17 displayBundleID];
          id v21 = v24;
        }
        unint64_t v22 = [v19 eventWithTipID:v16 correlationID:v20 bundleID:v21 context:v12 displayType:v18 reason:a6 date:0];
        [v22 log];

        if (!v11) {
        [(TPSTipStatusController *)self->_tipStatusController updateHintInelgibileForIdentifier:v16 value:a6];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v26);
  }

  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
}

- (id)discoverabilityTipWithMetadata:(id)a3 contentDictionary:(id)a4 preconditions:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4FAF458];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithDictionary:v9 metadata:v10];

  [v11 setPreconditions:v8];

  return v11;
}

- (BOOL)updateDesiredOutcomeConditionForObserverIdentifers:(id)a3
{
  id v3 = self;
  char v7 = 0;
  id v4 = [(TPSDiscoverabilityController *)self _matchingIdentifiersForConditionWithType:1 forObserverIdentifiers:a3 hasUpdates:&v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__TPSDiscoverabilityController_updateDesiredOutcomeConditionForObserverIdentifers___block_invoke;
  v6[3] = &unk_1E6E6CBF8;
  v6[4] = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(v3) = v7;

  return (char)v3;
}

void __83__TPSDiscoverabilityController_updateDesiredOutcomeConditionForObserverIdentifers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v5;
    _os_log_impl(&dword_1E4492000, v7, OS_LOG_TYPE_DEFAULT, "Desired outcome condition met for %@", buf, 0xCu);
  }

  id v8 = [v6 desiredOutcomeCondition];
  id v9 = *(void **)(*(void *)(a1 + 32) + 72);
  id v10 = [v8 matchedDate];
  [v9 addDesiredOutcomePerformedDateForIdentifier:v5 date:v10];

  char v11 = [*(id *)(*(void *)(a1 + 32) + 72) isHintDisplayedForIdentifier:v5];
  id v12 = [*(id *)(*(void *)(a1 + 32) + 72) hintWouldHaveBeenDisplayedDateForIdentifier:v5];

  int v13 = [*(id *)(*(void *)(a1 + 32) + 72) contentViewedDateForIdentifier:v5];

  if ((v11 & 1) != 0 || v12 || v13)
  {
    uint64_t v19 = [v8 eventIdentifiers];
    v20 = [MEMORY[0x1E4F1C9C8] date];
    id v21 = [v20 dateByAddingTimeInterval:--180.0];

    [*(id *)(*(void *)(a1 + 32) + 32) restartTrackingForEventIdentifiers:v19 date:v21];
    [v6 restartDesiredOutcomeTracking];
  }
  else
  {
    if (([*(id *)(*(void *)(a1 + 32) + 72) isHintInelgibileForIdentifier:v5] & 1) == 0)
    {
      id v14 = *(void **)(a1 + 32);
      id v24 = v5;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v14 markHintIneligibleForIdentifiers:v15 context:0 reason:12];
    }
    uint64_t v16 = *(void **)(a1 + 32);
    id v23 = v5;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v16 removeContextualInfoForIdentifiers:v17];

    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 32);
    id v22 = v5;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v18 removeObserverIdentifiers:v19];
  }
}

- (BOOL)_updateTriggerConditionForObserverIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v14 = 0;
  id v4 = [(TPSDiscoverabilityController *)self _matchingIdentifiersForConditionWithType:0 forObserverIdentifiers:a3 hasUpdates:&v14];
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 allValues];
      char v7 = [v6 debugDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_DEFAULT, "Trigger condition met for tips %@", buf, 0xCu);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke;
    v12[3] = &unk_1E6E6CC20;
    v12[4] = self;
    id v8 = v4;
    id v13 = v8;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke_2;
    v11[3] = &unk_1E6E6CBF8;
    void v11[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
  BOOL v9 = v14;

  return v9;
}

void __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 triggerEventIdentifiers];
  if (v7)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 32);
    id v6 = [v4 allKeys];
    [v5 removeObserverIdentifiers:v6 fromEventIdentifiers:v7];
  }
}

void __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v7 = [v6 displayTypeForIdentifier:v16];
  uint64_t v8 = [v6 usageFlagsForIdentifier:v16];
  if (v7 == 2)
  {
    uint64_t v9 = v8;
    id v10 = (void *)MEMORY[0x1E4FAF370];
    char v11 = [v5 displayBundleID];
    id v12 = [v5 eligibleContext];
    id v13 = [v5 triggerCondition];
    BOOL v14 = [v13 matchedDate];
    uint64_t v15 = [v10 eventWithContentID:v16 bundleID:v11 eligibleContext:v12 displayType:2 usageFlags:v9 date:v14];
    [v15 log];

    [*(id *)(a1 + 32) _registerWakingCallbackForContextualInfo:v5];
  }
  [v6 updateHintEligibleDateForIdentifier:v16 value:1];
}

- (id)_matchingIdentifiersForConditionWithType:(unint64_t)a3 forObserverIdentifiers:(id)a4 hasUpdates:(BOOL *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
      uint64_t v15 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v14];
      id v16 = [v15 conditionForType:a3];
      uint64_t v17 = v16;
      if (!v16)
      {
        if (a3) {
          goto LABEL_14;
        }
LABEL_13:
        [v8 setObject:v15 forKeyedSubscript:v14];
        goto LABEL_14;
      }
      uint64_t v18 = [v16 matchedDate];
      if (v18)
      {

        goto LABEL_14;
      }
      if ([(TPSDiscoverabilityController *)self _isConditionMet:v17 hasUpdates:a5 forIdentifier:v14])
      {
        goto LABEL_13;
      }
LABEL_14:

      ++v13;
    }
    while (v11 != v13);
    uint64_t v19 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v11 = v19;
  }
  while (v19);
LABEL_19:

  if ([v8 count])
  {
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_isConditionMet:(id)a3 hasUpdates:(BOOL *)a4 forIdentifier:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v42 = a5;
  uint64_t v8 = [v7 rules];
  v41 = v7;
  uint64_t v9 = [v7 joinType];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v58;
    uint64_t v43 = *(void *)v58;
    uint64_t v44 = v9;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v45 = v11;
      do
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v57 + 1) + 8 * v15);
        uint64_t v17 = [v16 matchedDate];
        if (v17)
        {
          id v18 = v17;

          ++v13;
          uint64_t v12 = v18;
          if (v9 == 1) {
            goto LABEL_37;
          }
        }
        else
        {
          v51 = v12;
          uint64_t v52 = v13;
          id v46 = v16;
          v50 = [v16 eventIdentifiers];
          uint64_t v19 = -[TPSEventsHistoryController contextualEventsForIdentifiers:](self->_eventsHistoryController, "contextualEventsForIdentifiers:");
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = 0;
            long long v24 = 0;
            uint64_t v25 = *(void *)v54;
            while (2)
            {
              uint64_t v26 = 0;
              uint64_t v48 = v23 + v22;
              do
              {
                if (*(void *)v54 != v25) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v27 = [*(id *)(*((void *)&v53 + 1) + 8 * v26) matchedDate];
                if (!v27)
                {
                  uint64_t v30 = v23 + v26;
                  goto LABEL_23;
                }
                uint64_t v28 = v27;
                if (!v24 || [v27 compare:v24] == 1)
                {
                  id v29 = v28;

                  long long v24 = v29;
                }
                *a4 = 1;

                ++v26;
              }
              while (v22 != v26);
              uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
              uint64_t v30 = v48;
              uint64_t v23 = v48;
              if (v22) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v30 = 0;
            long long v24 = 0;
          }
LABEL_23:

          if (v30 == [v20 count] && objc_msgSend(v50, "count") == v30)
          {
            [v46 setMatchedDate:v24];
            BOOL v31 = (void *)MEMORY[0x1E4FAF398];
            v32 = [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:v42];
            id v33 = [v46 identifier];
            __int16 v34 = [v31 eventWithTipID:v42 correlationID:v32 ruleID:v33];
            [v34 log];

            uint64_t v12 = v51;
            if (!v51 || [v24 compare:v51] == 1)
            {
              id v35 = v24;

              uint64_t v12 = v35;
            }
            uint64_t v9 = v44;
            uint64_t v13 = v52 + 1;
            if (v44 == 1)
            {
LABEL_36:

              id v18 = v12;
              goto LABEL_37;
            }
          }
          else
          {
            uint64_t v9 = v44;
            uint64_t v12 = v51;
            uint64_t v13 = v52;
            if (!v44) {
              goto LABEL_36;
            }
          }

          uint64_t v14 = v43;
          uint64_t v11 = v45;
        }
        ++v15;
      }
      while (v15 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
      id v18 = v12;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v18 = 0;
    uint64_t v13 = 0;
  }
LABEL_37:

  uint64_t v36 = [obj count];
  if (v9 == 1 && v13 || (v13 == v36 ? (BOOL v37 = v9 == 0) : (BOOL v37 = 0), v37 || !v36))
  {
    uint64_t v39 = v41;
    [v41 setMatchedDate:v18];
    BOOL v38 = 1;
  }
  else
  {
    BOOL v38 = 0;
    uint64_t v39 = v41;
  }

  return v38;
}

- (id)monitoringEventsForContentID:(id)a3
{
  id v3 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:a3];
  id v4 = [v3 monitoringEvents];

  return v4;
}

- (void)_registerWakingCallbackForContextualInfo:(id)a3
{
  id v4 = [a3 monitoringEvents];
  id v5 = [v4 desiredOutcomeEventMap];
  id v6 = [v5 allValues];

  id v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_38);
  if ([v7 count])
  {
    [(TPSEventsProviderManager *)self->_eventsProviderManager registerWakingCallbackForEvents:v7 type:0 clientIdentifier:@"com.apple.tipsd"];
    uint64_t v8 = [v7 valueForKeyPath:@"identifier"];
    eventRegistrationQueue = self->_eventRegistrationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke_2;
    v11[3] = &unk_1E6E6BEF8;
    void v11[4] = self;
    id v12 = v8;
    id v10 = v8;
    dispatch_sync(eventRegistrationQueue, v11);
  }
}

BOOL __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = [v2 type] == 3;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

uint64_t __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObjectsFromArray:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateRegisteredEventIdentifiers];
}

- (void)_reconcileRegisteredEvents
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Re-registering notification for duet events: %@", v2, v3, v4, v5, v6);
}

- (int64_t)customizationIDForContentID:(id)a3
{
  uint64_t v3 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:a3];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v5 = [v3 customizationID];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)updateContentViewedForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_DEFAULT, "update content viewed for %@", (uint8_t *)&v6, 0xCu);
  }

  [(TPSTipStatusController *)self->_tipStatusController updateContentViewedForIdentifier:v4 value:1];
  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
}

- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1E4492000, v8, OS_LOG_TYPE_DEFAULT, "update hint displayed for %@, context %@", buf, 0x16u);
  }

  [(TPSTipStatusController *)self->_tipStatusController addHintDisplayedForIdentifier:v6 context:v7];
  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
  uint64_t v9 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v6];
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [WeakRetained currentExperimentWithDiscoverabilityController:self];

    uint64_t v11 = [(TPSTipStatusController *)self->_tipStatusController displayTypeForIdentifier:v6];
    uint64_t v12 = [(TPSTipStatusController *)self->_tipStatusController usageFlagsForIdentifier:v6];
    char v13 = [(TPSTipStatusController *)self->_tipStatusController isOverrideHoldoutForIdentifier:v6];
    if (v11 == 2)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4FAF3F8] clientBundleIdentifier];
    }
    uint64_t v15 = (void *)MEMORY[0x1E4FAF3A8];
    id v16 = [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:v6];
    uint64_t v17 = [v9 displayBundleID];
    id v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (void *)v17;
    }
    else {
      uint64_t v19 = v14;
    }
    LOBYTE(v21) = v13;
    id v20 = [v15 eventWithTipID:v6 correlationID:v16 bundleID:v19 context:v7 displayType:v11 usageFlags:v12 experiment:v22 overrideHoldout:v21 date:0];
    [v20 log];
  }
}

- (void)updateHintWouldHaveBeenDisplayedForIdentifier:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1E4492000, v8, OS_LOG_TYPE_DEFAULT, "update hint would have been displayed for %@, context %@", buf, 0x16u);
  }

  [(TPSTipStatusController *)self->_tipStatusController updateHintWouldHaveBeenDisplayedDateForIdentifier:v6 value:1];
  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
  uint64_t v9 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v6];
  if (v9)
  {
    id v23 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v11 = [WeakRetained currentExperimentWithDiscoverabilityController:self];

    uint64_t v12 = [(TPSTipStatusController *)self->_tipStatusController displayTypeForIdentifier:v6];
    uint64_t v13 = [(TPSTipStatusController *)self->_tipStatusController usageFlagsForIdentifier:v6];
    char v14 = [(TPSTipStatusController *)self->_tipStatusController isOverrideHoldoutForIdentifier:v6];
    if (v12 == 2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4FAF3F8] clientBundleIdentifier];
    }
    id v16 = (void *)MEMORY[0x1E4FAF3A8];
    uint64_t v17 = [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:v6];
    uint64_t v18 = [v9 displayBundleID];
    uint64_t v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = v15;
    }
    LOBYTE(v22) = v14;
    id v7 = v23;
    uint64_t v21 = [v16 eventWithTipID:v6 correlationID:v17 bundleID:v20 context:v23 displayType:v12 usageFlags:v13 experiment:v11 overrideHoldout:v22 date:0];
    [v21 log];
  }
}

- (void)updateHintDismissedForIdentifier:(id)a3 dismissType:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1E4492000, v11, OS_LOG_TYPE_DEFAULT, "update hint dismissed for %@, context %@", (uint8_t *)&v26, 0x16u);
  }

  [(TPSTipStatusController *)self->_tipStatusController updateHintDismissedForIdentifier:v8 value:1];
  [(TPSTipStatusController *)self->_tipStatusController updateCacheData];
  uint64_t v12 = [(TPSDiscoverabilityController *)self contextualInfoForIdentifier:v8];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    char v14 = [(TPSTipStatusController *)self->_tipStatusController firstHintDisplayDateForIdentifier:v8];
    uint64_t v15 = v14;
    if (v14)
    {
      if ([v14 compare:v13] == 1)
      {
        id v16 = [MEMORY[0x1E4FAF480] discoverability];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          [v15 timeIntervalSince1970];
          uint64_t v18 = v17;
          [v13 timeIntervalSince1970];
          int v26 = 134218498;
          id v27 = v18;
          __int16 v28 = 2048;
          id v29 = v19;
          __int16 v30 = 2112;
          id v31 = v8;
          _os_log_impl(&dword_1E4492000, v16, OS_LOG_TYPE_DEFAULT, "First hint display date (%f) is later than dismissal date (%f) for identifier %@. Clock went back in time?", (uint8_t *)&v26, 0x20u);
        }
      }
      [v13 timeIntervalSinceDate:v15];
      double v21 = v20;
      uint64_t v22 = (void *)MEMORY[0x1E4FAF3A0];
      id v23 = [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:v8];
      id v24 = [v12 displayBundleID];
      id v25 = [v22 eventWithTipID:v8 correlationID:v23 bundleID:v24 context:v10 dismissType:v9 timeToDismissal:0 date:v21];
      [v25 log];
    }
    else
    {
      id v23 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:]();
      }
    }
  }
}

- (void)dataProviderManager:(id)a3 didFinishQueryWithResults:(id)a4 type:(int64_t)a5
{
  id v7 = a4;
  eventResultsProcessingQueue = self->_eventResultsProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__TPSDiscoverabilityController_dataProviderManager_didFinishQueryWithResults_type___block_invoke;
  block[3] = &unk_1E6E6C5C8;
  void block[4] = self;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  dispatch_async(eventResultsProcessingQueue, block);
}

uint64_t __83__TPSDiscoverabilityController_dataProviderManager_didFinishQueryWithResults_type___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processEventProviderQueryResults:*(void *)(a1 + 40) type:*(void *)(a1 + 48)];
}

- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  eventRegistrationQueue = self->_eventRegistrationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke;
  block[3] = &unk_1E6E6BEF8;
  void block[4] = self;
  id v10 = v8;
  id v18 = v10;
  dispatch_sync(eventRegistrationQueue, block);
  objc_initWeak(&location, self);
  id v11 = [(TPSDiscoverabilityController *)self contextualInfoMap];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke_2;
  v13[3] = &unk_1E6E6CC68;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeObject:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateRegisteredEventIdentifiers];
}

void __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [v6 desiredOutcomeEventIdentifiers];

  id v9 = [*(id *)(a1 + 32) identifier];
  LODWORD(v6) = [v8 containsObject:v9];

  if (v6)
  {
    id v10 = [WeakRetained tipStatusController];
    char v11 = [v10 isHintInelgibileForIdentifier:v5];

    if (v11)
    {
      id v12 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_1E4492000, v12, OS_LOG_TYPE_DEFAULT, "Hint already marked as ineligible for %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = [WeakRetained tipStatusController];
      id v12 = [v13 lastDisplayContextForIdentifier:v5];

      v17[0] = v5;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [WeakRetained markHintIneligibleForIdentifiers:v14 context:v12 reason:6];
    }
  }
}

- (TPSDiscoverabilityControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSDiscoverabilityControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (OS_dispatch_queue)contextualInfoQueue
{
  return self->_contextualInfoQueue;
}

- (void)setContextualInfoQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualInfoQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventResultsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_eventRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_contextualInfoMap, 0);
  objc_storeStrong((id *)&self->_eventsHistoryController, 0);
  objc_storeStrong((id *)&self->_eventsProviderManager, 0);

  objc_storeStrong((id *)&self->_registeredEventIdentifiers, 0);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Content %@ became invalid due to delivery info lifetime expiration", v2, v3, v4, v5, v6);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Content %@ became invalid due to max duration exceeded", v2, v3, v4, v5, v6);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Content %@ became invalid due eligibility expired", v2, v3, v4, v5, v6);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Content %@ became invalid due to precondition changed", v2, v3, v4, v5, v6);
}

- (void)contextualEligibilityWithTipIdentifiers:(id *)a1 tipsDeliveryInfoMap:(NSObject *)a2 deliveryInfoMap:experimentCampChangesToAll:.cold.1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 tipStatusMap];
  [v3 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Current tip status count: %lu", v4, 0xCu);
}

void __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 debugDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1E4492000, v3, v4, "Tip Status (%@): %@", v5, v6, v7, v8, v9);
}

void __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1E4492000, v3, v4, "Active events for type %@: %@", v5, v6, v7, v8, v9);
}

- (void)updateHintDismissedForIdentifier:dismissType:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4492000, v0, OS_LOG_TYPE_ERROR, "First display date not found on hint dismissal for identifier %@", v1, 0xCu);
}

@end