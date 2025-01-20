@interface SBActivityManager
+ (SBActivityManager)sharedInstance;
- (ACActivityCenter)activityCenter;
- (ACActivityProminenceListener)prominenceListener;
- (ACUISActivityAlertClient)activityAlertClient;
- (BOOL)isActivitySupported;
- (BSInvalidatable)activityAlertSubscription;
- (BSInvalidatable)activityExceedingReducedPushBudgetSubscription;
- (BSInvalidatable)activitySubscription;
- (DMFApplicationPolicyMonitor)applicationPolicyMonitor;
- (NSMutableDictionary)itemByActivityIdentifier;
- (NSMutableDictionary)itemsByBundleIdentifier;
- (NSMutableDictionary)prominenceAssertionByActivityIdentifier;
- (SBActivityManager)init;
- (SBLiveActivitySettings)activitySettings;
- (SBSoundController)soundController;
- (id)_activityLifecyclePayloadWithContentUpdate:(id)a3;
- (id)activities;
- (id)firstPartyActivityGroupingIdentifiers;
- (int64_t)environment;
- (void)_activityBlocked:(BOOL)a3 item:(id)a4;
- (void)_activityDismissedWithContentUpdate:(id)a3;
- (void)_activityFinishedWithContentUpdate:(id)a3;
- (void)_activityStartedOrUpdatedWithContentUpdate:(id)a3;
- (void)_addAppActivitiesRecordForBundleId:(id)a3 item:(id)a4;
- (void)_dismissActivityAlert:(id)a3;
- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3;
- (void)_handleActivityWithContentUpdate:(id)a3;
- (void)_hideAllActivities:(BOOL)a3;
- (void)_invalidateAllProminenceAssertion;
- (void)_invalidateProminenceAssertionForActivityIdenfier:(id)a3;
- (void)_presentActivityAlert:(id)a3;
- (void)_publishProminenceUpdate:(BOOL)a3 item:(id)a4;
- (void)_queue_invalidateProminenceAssertionForActivityIdenfier:(id)a3;
- (void)_removeAllObservers;
- (void)_removeAppActivitiesRecordForBundleId:(id)a3 item:(id)a4;
- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3;
- (void)_sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:(id)a3;
- (void)_updateAllApplicationMonitoringPolicies;
- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4;
- (void)activityAlertClient:(id)a3 dismissAlertProvider:(id)a4;
- (void)activityAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)cancelObservingActivityUpdates;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setActivityAlertClient:(id)a3;
- (void)setActivityAlertSubscription:(id)a3;
- (void)setActivityCenter:(id)a3;
- (void)setActivityExceedingReducedPushBudgetSubscription:(id)a3;
- (void)setActivitySettings:(id)a3;
- (void)setActivitySubscription:(id)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setItemByActivityIdentifier:(id)a3;
- (void)setItemsByBundleIdentifier:(id)a3;
- (void)setProminenceAssertionByActivityIdentifier:(id)a3;
- (void)setProminenceListener:(id)a3;
- (void)setSoundController:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)startObservingActivityUpdates;
@end

@implementation SBActivityManager

- (SBActivityManager)init
{
  v33.receiver = self;
  v33.super_class = (Class)SBActivityManager;
  v2 = [(SBActivityManager *)&v33 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (ACActivityCenter *)v3;

    v5 = (ACUISActivityAlertClient *)objc_alloc_init(MEMORY[0x1E4F49750]);
    activityAlertClient = v2->_activityAlertClient;
    v2->_activityAlertClient = v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    bannerPresentableByActivityIdentifier = v2->_bannerPresentableByActivityIdentifier;
    v2->_bannerPresentableByActivityIdentifier = (NSMapTable *)v7;

    uint64_t v9 = objc_opt_new();
    itemByActivityIdentifier = v2->_itemByActivityIdentifier;
    v2->_itemByActivityIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = +[SBSoundController sharedInstance];
    soundController = v2->_soundController;
    v2->_soundController = (SBSoundController *)v11;

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v13 = (void *)getDMFApplicationPolicyMonitorClass_softClass;
    uint64_t v38 = getDMFApplicationPolicyMonitorClass_softClass;
    if (!getDMFApplicationPolicyMonitorClass_softClass)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getDMFApplicationPolicyMonitorClass_block_invoke;
      v34[3] = &unk_1E6AF56B0;
      v34[4] = &v35;
      __getDMFApplicationPolicyMonitorClass_block_invoke((uint64_t)v34);
      v13 = (void *)v36[3];
    }
    v14 = v13;
    _Block_object_dispose(&v35, 8);
    id v15 = [v14 alloc];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __25__SBActivityManager_init__block_invoke;
    v31 = &unk_1E6AF4AC0;
    v16 = v2;
    v32 = v16;
    uint64_t v17 = [v15 initWithPolicyChangeHandler:&v28];
    applicationPolicyMonitor = v16->_applicationPolicyMonitor;
    v16->_applicationPolicyMonitor = (DMFApplicationPolicyMonitor *)v17;

    v16->_environment = 0;
    uint64_t v19 = +[SBLiveActivityDomain rootSettings];
    activitySettings = v16->_activitySettings;
    v16->_activitySettings = (SBLiveActivitySettings *)v19;

    [(PTSettings *)v16->_activitySettings addKeyPathObserver:v16];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    activityProminenceQueue = v16->_activityProminenceQueue;
    v16->_activityProminenceQueue = (OS_dispatch_queue *)Serial;

    uint64_t v23 = objc_opt_new();
    queue_prominenceListener = v16->_queue_prominenceListener;
    v16->_queue_prominenceListener = (ACActivityProminenceListener *)v23;

    uint64_t v25 = objc_opt_new();
    queue_prominenceAssertionByActivityIdentifier = v16->_queue_prominenceAssertionByActivityIdentifier;
    v16->_queue_prominenceAssertionByActivityIdentifier = (NSMutableDictionary *)v25;
  }
  return v2;
}

void __25__SBActivityManager_init__block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __25__SBActivityManager_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllApplicationMonitoringPolicies];
}

- (void)dealloc
{
  [(SBActivityManager *)self cancelObservingActivityUpdates];
  [(NSMutableDictionary *)self->_itemByActivityIdentifier removeAllObjects];
  itemByActivityIdentifier = self->_itemByActivityIdentifier;
  self->_itemByActivityIdentifier = 0;

  [(NSMutableDictionary *)self->_itemsByBundleIdentifier removeAllObjects];
  itemsByBundleIdentifier = self->_itemsByBundleIdentifier;
  self->_itemsByBundleIdentifier = 0;

  [(NSMapTable *)self->_bannerPresentableByActivityIdentifier removeAllObjects];
  bannerPresentableByActivityIdentifier = self->_bannerPresentableByActivityIdentifier;
  self->_bannerPresentableByActivityIdentifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityManager;
  [(SBActivityManager *)&v6 dealloc];
}

+ (SBActivityManager)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_88);
  }
  v2 = (void *)sharedInstance___instance_1;
  return (SBActivityManager *)v2;
}

void __35__SBActivityManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBActivityManager);
  id v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;
}

- (void)startObservingActivityUpdates
{
  uint64_t v3 = SBLogActivity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Start observing activity updates", (uint8_t *)buf, 2u);
  }

  if (!self->_activitySubscription)
  {
    objc_initWeak(buf, self);
    activityCenter = self->_activityCenter;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__SBActivityManager_startObservingActivityUpdates__block_invoke;
    v12[3] = &unk_1E6AFC9D8;
    objc_copyWeak(&v13, buf);
    v5 = [(ACActivityCenter *)activityCenter observeContentUpdatesWithHandler:v12];
    activitySubscription = self->_activitySubscription;
    self->_activitySubscription = v5;

    [(ACUISActivityAlertClient *)self->_activityAlertClient setDelegate:self];
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  if (!self->_activityExceedingReducedPushBudgetSubscription)
  {
    objc_initWeak(buf, self);
    uint64_t v7 = self->_activityCenter;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SBActivityManager_startObservingActivityUpdates__block_invoke_3;
    v10[3] = &unk_1E6AFCA00;
    objc_copyWeak(&v11, buf);
    v8 = [(ACActivityCenter *)v7 observeActivitiesExceedingReducedPushBudgetWithHandler:v10];
    activityExceedingReducedPushBudgetSubscription = self->_activityExceedingReducedPushBudgetSubscription;
    self->_activityExceedingReducedPushBudgetSubscription = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleActivityWithContentUpdate:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleActivityExceedingReducedPushBudgetWithIdentifier:v5];
  }
}

- (void)cancelObservingActivityUpdates
{
  id v3 = SBLogActivity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Cancel observing activity updates", v9, 2u);
  }

  activitySubscription = self->_activitySubscription;
  if (activitySubscription)
  {
    [(BSInvalidatable *)activitySubscription invalidate];
    [(BSInvalidatable *)self->_activityAlertSubscription invalidate];
    [(BSInvalidatable *)self->_activityExceedingReducedPushBudgetSubscription invalidate];
    activityExceedingReducedPushBudgetSubscription = self->_activityExceedingReducedPushBudgetSubscription;
    self->_activityExceedingReducedPushBudgetSubscription = 0;

    objc_super v6 = self->_activitySubscription;
    self->_activitySubscription = 0;

    activityAlertSubscription = self->_activityAlertSubscription;
    self->_activityAlertSubscription = 0;

    [(SBActivityManager *)self _invalidateAllProminenceAssertion];
    v8 = [(SBActivityManager *)self prominenceAssertionByActivityIdentifier];
    [v8 removeAllObjects];

    [(SBActivityManager *)self _removeAllObservers];
  }
}

- (BOOL)isActivitySupported
{
  return [(ACActivityCenter *)self->_activityCenter areActivitiesEnabled];
}

- (id)activities
{
  return (id)[(NSMutableDictionary *)self->_itemByActivityIdentifier allValues];
}

- (id)firstPartyActivityGroupingIdentifiers
{
  return &unk_1F3347BE0;
}

- (void)setEnvironment:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_environment != a3)
  {
    id v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = @"ambient";
      if (!a3) {
        objc_super v6 = @"none";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Activity environment changed: %@", buf, 0xCu);
    }

    self->_environment = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__SBActivityManager_setEnvironment___block_invoke;
    v7[3] = &unk_1E6AF4A70;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __36__SBActivityManager_setEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v19 + 1) + 8 * v4);
        if (objc_opt_respondsToSelector()) {
          [v5 activityEnvironmentChanged:*(void *)(a1 + 40)];
        }
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        objc_super v6 = [*(id *)(a1 + 32) prominenceAssertionByActivityIdentifier];
        uint64_t v7 = [v6 allKeys];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
              if ([v5 shouldHandleActivityItem:v12]) {
                [*(id *)(a1 + 32) _publishProminenceUpdate:0 item:v12];
              }

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v9);
        }

        ++v4;
      }
      while (v4 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }
}

- (void)_handleActivityWithContentUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(SBActivityManager *)self _sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:v4];
  uint64_t v5 = [v4 state];
  if (v5 == 2)
  {
    [(SBActivityManager *)self _activityDismissedWithContentUpdate:v4];
  }
  else if (v5 == 1)
  {
    [(SBActivityManager *)self _activityFinishedWithContentUpdate:v4];
  }
  else if (v5)
  {
    objc_super v6 = SBLogActivity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = [v4 state];
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled activity state: %ld", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(SBActivityManager *)self _activityStartedOrUpdatedWithContentUpdate:v4];
  }
}

- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v4];
        if ([v10 shouldHandleActivityItem:v11]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v10 activityDidExceedReducedPushBudget:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_activityStartedOrUpdatedWithContentUpdate:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v5];
  uint64_t v28 = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = SBLogActivity();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v5;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity did update", buf, 0xCu);
    }
    uint64_t v9 = (void *)v5;

    [(SBActivityItem *)v7 setContentUpdate:v4];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    uint64_t v10 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v15 shouldHandleActivityItem:v7]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v15 activityDidUpdate:v7];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v16 = [[SBActivityItem alloc] initWithContentUpdate:v4];
    uint64_t v17 = SBLogActivity();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v5;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity started", buf, 0xCu);
    }

    v27 = (void *)v5;
    [(NSMutableDictionary *)self->_itemByActivityIdentifier setObject:v16 forKey:v5];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v18 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          if ([v23 shouldHandleActivityItem:v16]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v24 = [v4 descriptor];
            [v23 activityDidStart:v16];
            uint64_t v25 = [v24 platterTargetBundleIdentifier];
            [(SBActivityManager *)self _addAppActivitiesRecordForBundleId:v25 item:v16];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v20);
    }

    activityProminenceQueue = self->_activityProminenceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke;
    block[3] = &unk_1E6AF4E00;
    block[4] = self;
    uint64_t v9 = v27;
    id v30 = v27;
    uint64_t v7 = v16;
    v31 = v7;
    dispatch_async(activityProminenceQueue, block);
  }
}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = SBLogActivity();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] listening for activity prominence changes", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_40;
    uint64_t v11 = &unk_1E6AF7920;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = *(id *)(a1 + 48);
    uint64_t v7 = [v5 listenForActivityProminence:v6 withHandler:&v8];
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateProminenceAssertionForActivityIdenfier:", *(void *)(a1 + 40), v8, v9, v10, v11);
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_40(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_2;
  block[3] = &unk_1E6AFCA28;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _publishProminenceUpdate:*(unsigned __int8 *)(a1 + 48) item:*(void *)(a1 + 32)];
}

- (void)_activityFinishedWithContentUpdate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v14 = v4;
  id v5 = [v4 identifier];
  id v6 = SBLogActivity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ended", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        id v13 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v5];
        if ([v12 shouldHandleActivityItem:v13]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v12 activityDidEnd:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(SBActivityManager *)self _invalidateProminenceAssertionForActivityIdenfier:v5];
}

- (void)_activityDismissedWithContentUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v16 = v4;
  id v5 = [v4 identifier];
  id v6 = SBLogActivity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissed", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v5];
        if ([v12 shouldHandleActivityItem:v13]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v14 = [v13 descriptor];
          [v12 activityDidDismiss:v13];
          long long v15 = [v14 platterTargetBundleIdentifier];
          [(SBActivityManager *)self _removeAppActivitiesRecordForBundleId:v15 item:v13];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(SBActivityManager *)self _invalidateProminenceAssertionForActivityIdenfier:v5];
  [(NSMutableDictionary *)self->_itemByActivityIdentifier removeObjectForKey:v5];
}

- (void)_publishProminenceUpdate:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 shouldHandleActivityItem:v6]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v12 activityProminenceChanged:v4 item:v6];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_invalidateProminenceAssertionForActivityIdenfier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  activityProminenceQueue = self->_activityProminenceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SBActivityManager__invalidateProminenceAssertionForActivityIdenfier___block_invoke;
  block[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activityProminenceQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__SBActivityManager__invalidateProminenceAssertionForActivityIdenfier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_invalidateProminenceAssertionForActivityIdenfier:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)_queue_invalidateProminenceAssertionForActivityIdenfier:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_prominenceAssertionByActivityIdentifier, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_queue_prominenceAssertionByActivityIdentifier removeObjectForKey:v6];
  }
}

- (void)setProminenceListener:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  activityProminenceQueue = self->_activityProminenceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SBActivityManager_setProminenceListener___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(activityProminenceQueue, v7);
}

void __43__SBActivityManager_setProminenceListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = *(void **)(v2 + 32);
  id v4 = (id *)(v2 + 32);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (ACActivityProminenceListener)prominenceListener
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__26;
  uint64_t v11 = __Block_byref_object_dispose__26;
  id v12 = 0;
  activityProminenceQueue = self->_activityProminenceQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SBActivityManager_prominenceListener__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(activityProminenceQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACActivityProminenceListener *)v4;
}

void __39__SBActivityManager_prominenceListener__block_invoke(uint64_t a1)
{
}

- (void)setProminenceAssertionByActivityIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  activityProminenceQueue = self->_activityProminenceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBActivityManager_setProminenceAssertionByActivityIdentifier___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(activityProminenceQueue, v7);
}

void __64__SBActivityManager_setProminenceAssertionByActivityIdentifier___block_invoke(uint64_t a1)
{
  if ((BSEqualDictionaries() & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (NSMutableDictionary)prominenceAssertionByActivityIdentifier
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__26;
  uint64_t v11 = __Block_byref_object_dispose__26;
  id v12 = 0;
  activityProminenceQueue = self->_activityProminenceQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBActivityManager_prominenceAssertionByActivityIdentifier__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(activityProminenceQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __60__SBActivityManager_prominenceAssertionByActivityIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_invalidateAllProminenceAssertion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(SBActivityManager *)self prominenceAssertionByActivityIdentifier];
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_presentActivityAlert:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    uint64_t v5 = [v4 item];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [v4 payloadIdentifier];
    long long v8 = SBLogActivity();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v6;
      __int16 v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] presents an alert with payload: %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)v6;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v9 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v14 shouldHandleActivityItem:v5]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v14 presentAlert:v4];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBActivityManager _presentActivityAlert:](v5, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void)_dismissActivityAlert:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    uint64_t v5 = [v4 item];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = SBLogActivity();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismisses the alert", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v8 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 shouldHandleActivityItem:v5]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v13 dismissAlert:v4];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBActivityManager _dismissActivityAlert:](v5, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_removeAllObservers
{
  uint64_t v3 = SBLogActivity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Removing all activity observers", v4, 2u);
  }

  [(NSHashTable *)self->_observers removeAllObjects];
}

- (void)_addAppActivitiesRecordForBundleId:(id)a3 item:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v7 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier allKeys];
  char v8 = [v7 containsObject:v14];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier objectForKey:v14];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v10 = v9;
  [v9 addObject:v6];

  itemsByBundleIdentifier = self->_itemsByBundleIdentifier;
  if (!itemsByBundleIdentifier)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v13 = self->_itemsByBundleIdentifier;
    self->_itemsByBundleIdentifier = v12;

    itemsByBundleIdentifier = self->_itemsByBundleIdentifier;
  }
  [(NSMutableDictionary *)itemsByBundleIdentifier setObject:v10 forKey:v14];
}

- (void)_removeAppActivitiesRecordForBundleId:(id)a3 item:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v7 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier objectForKey:v9];

  if (v7)
  {
    char v8 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier objectForKey:v9];
    if ([v8 containsObject:v6])
    {
      [v8 removeObject:v6];
      [(NSMutableDictionary *)self->_itemsByBundleIdentifier setObject:v8 forKey:v9];
    }
  }
}

- (void)_updateAllApplicationMonitoringPolicies
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [(SBActivityManager *)self applicationPolicyMonitor];
  id v4 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke;
  v5[3] = &unk_1E6AFAC08;
  v5[4] = self;
  [v3 requestPoliciesForBundleIdentifiers:v4 completionHandler:v5];
}

void __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v8, &location);
  id v7 = v5;
  BSDispatchMain();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3;
    v4[3] = &unk_1E6AFCA50;
    v4[4] = WeakRetained;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

uint64_t __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateForScreenTimeLimitForBundleId:a2 policy:a3];
}

- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v8 = [(NSMutableDictionary *)self->_itemsByBundleIdentifier objectForKey:v7];

  id v9 = (void *)[v8 copy];
  uint64_t v10 = [v6 integerValue];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SBActivityManager__updateForScreenTimeLimitForBundleId_policy___block_invoke;
  v11[3] = &unk_1E6AFCA78;
  v11[4] = self;
  BOOL v12 = v10 != 0;
  [v9 enumerateObjectsUsingBlock:v11];
}

void __65__SBActivityManager__updateForScreenTimeLimitForBundleId_policy___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 descriptor];
  uint64_t v4 = [v3 contentType];

  if (v4 != 1) {
    [*(id *)(a1 + 32) _activityBlocked:*(unsigned __int8 *)(a1 + 40) item:v5];
  }
}

- (void)_activityBlocked:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    uint64_t v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v4)
        {
          if (objc_opt_respondsToSelector())
          {
            uint64_t v13 = SBLogActivity();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [v6 identifier];
              *(_DWORD *)buf = 138543362;
              long long v23 = v14;
              _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] hides activity content", buf, 0xCu);

              id v7 = v17;
            }

            [v12 activityWasBlocked:v6];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = SBLogActivity();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v6 identifier];
            *(_DWORD *)buf = 138543362;
            long long v23 = v16;
            _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] unhides activity content", buf, 0xCu);

            id v7 = v17;
          }

          [v12 activityWasUnblocked:v6];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)_sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKeyedSubscript:v5];

  if ([v4 state] || !v6)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__SBActivityManager__sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate___block_invoke;
    v7[3] = &unk_1E6AFCAA0;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [(SBActivityManager *)self _sendAnalyticsEventWithPayloadBuilder:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

id __78__SBActivityManager__sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained _activityLifecyclePayloadWithContentUpdate:*(void *)(a1 + 32)];

  return v3;
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
}

- (id)_activityLifecyclePayloadWithContentUpdate:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 descriptor];
  id v6 = [v5 platterTargetBundleIdentifier];

  id v7 = [NSNumber numberWithInt:0];
  switch([v3 state])
  {
    case 0:
      id v8 = @"Start";
      break;
    case 1:
      id v8 = @"End";
      break;
    case 2:
      id v9 = [v3 descriptor];
      uint64_t v10 = [v9 createdDate];

      uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
      [v11 timeIntervalSinceDate:v10];
      double v13 = v12;

      uint64_t v14 = [NSNumber numberWithDouble:v13 / 60.0];

      id v8 = @"Dismissed";
      id v7 = (void *)v14;
      break;
    case 3:
      id v8 = @"Stale";
      break;
    default:
      id v8 = 0;
      break;
  }
  v17[0] = @"activityId";
  v17[1] = @"bundleId";
  v18[0] = v4;
  v18[1] = v6;
  v17[2] = @"eventType";
  v17[3] = @"duration";
  v18[2] = v8;
  v18[3] = v7;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (void)_hideAllActivities:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogActivity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v19 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "All activities hidden: %{public}d", buf, 8u);
  }

  id v6 = [(NSMutableDictionary *)self->_itemByActivityIdentifier allValues];
  id v7 = (void *)[v6 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
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
        -[SBActivityManager _activityBlocked:item:](self, "_activityBlocked:item:", v3, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
        id v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)activityAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke;
  block[3] = &unk_1E6AFCAC8;
  long long v13 = self;
  id v14 = v8;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v3 = [v2 activityIdentifier];

    if (v3)
    {
      uint64_t v43 = [*(id *)(a1 + 32) activityIdentifier];
      id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "objectForKeyedSubscript:");
      BOOL v5 = [v4 descriptor];
      uint64_t v6 = [v5 contentType];

      if (v6)
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = [*(id *)(a1 + 32) payloadIdentifier];
      }
      long long v16 = [SBActivityAlert alloc];
      uint64_t v17 = [*(id *)(a1 + 32) options];
      long long v18 = [*(id *)(a1 + 32) title];
      BOOL v19 = [*(id *)(a1 + 32) body];
      uint64_t v20 = (void *)v7;
      long long v21 = [(SBActivityAlert *)v16 initWithItem:v4 payloadIdentifier:v7 options:v17 title:v18 body:v19];

      BOOL v22 = [(SBActivityAlert *)v21 shouldAlertInEnvironment:*(void *)(*(void *)(a1 + 40) + 48)];
      BOOL v23 = [(SBActivityAlert *)v21 canPresentInEnvironment:*(void *)(*(void *)(a1 + 40) + 48) alertType:0];
      long long v24 = [*(id *)(a1 + 32) options];
      uint64_t v25 = [v24 presentationOptions];
      int v26 = [v25 interrupting];

      v27 = [*(id *)(a1 + 32) options];
      uint64_t v28 = [v27 presentationOptions];
      int v29 = [v28 optional];

      __int16 v30 = SBLogActivity();
      v31 = (void *)v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        uint64_t v45 = v43;
        __int16 v46 = 1026;
        BOOL v47 = v22;
        __int16 v48 = 1026;
        BOOL v49 = v23;
        __int16 v50 = 1026;
        int v51 = v29;
        __int16 v52 = 1026;
        int v53 = v26;
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] shouldPresentActivityAlert: %{public}d, canPresentActivityAlert: %{public}d, isAlertPresentationOptional: %{public}d, interrupting: %{public}d", buf, 0x24u);
      }

      if (v22)
      {
        if ((v26 & 1) == 0)
        {
          long long v34 = SBLogActivity();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v43;
            _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is not interrupting, don't alert, send an error back", buf, 0xCu);
          }

          long long v33 = SBActivityAlertError(2uLL);
          goto LABEL_22;
        }
        if (v23)
        {
          [*(id *)(a1 + 40) _presentActivityAlert:v21];
        }
        else
        {
          long long v36 = SBLogActivity();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v43;
            _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] is already visible to the user and interrupting", buf, 0xCu);
          }

          if (v29)
          {
            long long v37 = +[SBLockScreenManager sharedInstance];
            if ([v37 isUILocked]
              && (+[SBBacklightController sharedInstance],
                  long long v38 = objc_claimAutoreleasedReturnValue(),
                  char v39 = [v38 screenIsOn],
                  v38,
                  v31 = (void *)v43,
                  (v39 & 1) == 0))
            {
              v42 = SBLogActivity();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v45 = v43;
                _os_log_impl(&dword_1D85BA000, v42, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is optional and screen is locked and off, don't alert", buf, 0xCu);
              }

              long long v33 = SBActivityAlertError(1uLL);
            }
            else
            {
              v40 = SBLogActivity();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v45 = (uint64_t)v31;
                _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is optional, interrupting and screen is on, alert user", buf, 0xCu);
              }

              [(SBActivityAlert *)v21 alertWithScreenOn:1 playSound:1];
              long long v33 = 0;
            }

            goto LABEL_22;
          }
          v41 = SBLogActivity();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v43;
            _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is mandatory and interrupting, turn screen on and play sound", buf, 0xCu);
          }

          [(SBActivityAlert *)v21 alertWithScreenOn:1 playSound:1];
        }
      }
      else
      {
        uint64_t v32 = SBLogActivity();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v45 = v43;
          _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity can't be alerted either on this device or on watch", buf, 0xCu);
        }
      }
      long long v33 = 0;
LABEL_22:
      uint64_t v35 = *(void *)(a1 + 48);
      if (v35) {
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v33);
      }

      return;
    }
  }
  id v8 = SBLogActivity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)activityAlertClient:(id)a3 dismissAlertProvider:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBActivityManager_activityAlertClient_dismissAlertProvider___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __62__SBActivityManager_activityAlertClient_dismissAlertProvider___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) activityIdentifier];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKeyedSubscript:v9];
  BOOL v3 = [*(id *)(a1 + 32) payloadIdentifier];
  id v4 = [SBActivityAlert alloc];
  id v5 = [*(id *)(a1 + 32) options];
  id v6 = [*(id *)(a1 + 32) title];
  uint64_t v7 = [*(id *)(a1 + 32) body];
  id v8 = [(SBActivityAlert *)v4 initWithItem:v2 payloadIdentifier:v3 options:v5 title:v6 body:v7];

  [*(id *)(a1 + 40) _dismissActivityAlert:v8];
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBActivityManager_settings_changedValueForKeyPath___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __53__SBActivityManager_settings_changedValueForKeyPath___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasPrefix:@"hideActivitiesInLockScreen"] & 1) != 0
    || ([*(id *)(a1 + 32) hasPrefix:@"hideActivitiesInDynamicIsland"] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) hasPrefix:@"hideActivitiesInAmbient"], result))
  {
    BOOL v3 = SBLogActivity();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Live Activity Visibility settings have changed.", v5, 2u);
    }

    if (([*(id *)(*(void *)(a1 + 40) + 128) hideActivitiesInLockScreen] & 1) != 0
      || ([*(id *)(*(void *)(a1 + 40) + 128) hideActivitiesInAmbient] & 1) != 0)
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 128) hideActivitiesInDynamicIsland];
    }
    return [*(id *)(a1 + 40) _hideAllActivities:v4];
  }
  return result;
}

- (int64_t)environment
{
  return self->_environment;
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
}

- (ACUISActivityAlertClient)activityAlertClient
{
  return self->_activityAlertClient;
}

- (void)setActivityAlertClient:(id)a3
{
}

- (BSInvalidatable)activitySubscription
{
  return self->_activitySubscription;
}

- (void)setActivitySubscription:(id)a3
{
}

- (BSInvalidatable)activityExceedingReducedPushBudgetSubscription
{
  return self->_activityExceedingReducedPushBudgetSubscription;
}

- (void)setActivityExceedingReducedPushBudgetSubscription:(id)a3
{
}

- (BSInvalidatable)activityAlertSubscription
{
  return self->_activityAlertSubscription;
}

- (void)setActivityAlertSubscription:(id)a3
{
}

- (SBSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
}

- (DMFApplicationPolicyMonitor)applicationPolicyMonitor
{
  return self->_applicationPolicyMonitor;
}

- (NSMutableDictionary)itemByActivityIdentifier
{
  return self->_itemByActivityIdentifier;
}

- (void)setItemByActivityIdentifier:(id)a3
{
}

- (NSMutableDictionary)itemsByBundleIdentifier
{
  return self->_itemsByBundleIdentifier;
}

- (void)setItemsByBundleIdentifier:(id)a3
{
}

- (SBLiveActivitySettings)activitySettings
{
  return self->_activitySettings;
}

- (void)setActivitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySettings, 0);
  objc_storeStrong((id *)&self->_itemsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_activityAlertSubscription, 0);
  objc_storeStrong((id *)&self->_activityExceedingReducedPushBudgetSubscription, 0);
  objc_storeStrong((id *)&self->_activitySubscription, 0);
  objc_storeStrong((id *)&self->_activityAlertClient, 0);
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_queue_prominenceAssertionByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_prominenceListener, 0);
  objc_storeStrong((id *)&self->_activityProminenceQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bannerPresentableByActivityIdentifier, 0);
}

- (void)_presentActivityAlert:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dismissActivityAlert:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end