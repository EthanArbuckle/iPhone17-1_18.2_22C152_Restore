@interface SBActivitySystemApertureElementObserver
- (BOOL)_activityAlertIsPendingForIdentifier:(id)a3;
- (BOOL)_activityIsPendingForIdentifier:(id)a3;
- (BOOL)_canPresentAlert:(id)a3;
- (BOOL)_canRegisterElementForActivityItem:(id)a3;
- (BOOL)_hasValidAlertingAssertion;
- (BOOL)_isActivityOngoing:(id)a3;
- (BOOL)_isContentReadyForAlert:(id)a3;
- (BOOL)_registeredElementExistsForBundleIdentifier:(id)a3;
- (BOOL)_shouldSwapActivityItem:(id)a3 withOtherItem:(id)a4 itemAlerting:(BOOL)a5;
- (BOOL)_systemApertureElementAssertionExistsForBundleIdentifier:(id)a3;
- (BOOL)shouldHandleActivityItem:(id)a3;
- (SBActivitySystemApertureElementObserver)init;
- (id)_activatedElementItemForBundleIdentifier:(id)a3;
- (id)_createSceneHandle:(id)a3;
- (id)_createSystemApertureSceneHandleWithItem:(id)a3;
- (id)_pendingItemForAlert:(id)a3;
- (void)_addPendingAlert:(id)a3;
- (void)_addPendingItemIfNecessary:(id)a3;
- (void)_cleanUpAlertPresentation:(id)a3;
- (void)_cleanUpInvalidRegisteredElements;
- (void)_createAndActivateElementForActivityItem:(id)a3 completion:(id)a4;
- (void)_createAndActivateSystemApertureElementWithScene:(id)a3 item:(id)a4 completion:(id)a5;
- (void)_invalidateSystemApertureElementForItem:(id)a3 completion:(id)a4;
- (void)_prepareAndPresentActivityAlert:(id)a3;
- (void)_prepareForAlertingActivityIfNecessary:(id)a3 completion:(id)a4;
- (void)_presentAlert:(id)a3;
- (void)_presentOrPendActivityAlert:(id)a3;
- (void)_presentPendingAlertIfNecessary;
- (void)_presentPendingAlertIfNecessaryForActivityIdentifier:(id)a3;
- (void)_registerSystemApertureElementForPendingActivityIfNecessary;
- (void)_removePendingItem:(id)a3 withPendingAlerts:(BOOL)a4;
- (void)_removeSystemApertureSceneHandleWithItem:(id)a3;
- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3;
- (void)_storeSceneHandle:(id)a3 item:(id)a4;
- (void)_swapActivityItem:(id)a3 withItem:(id)a4;
- (void)_swapItemWithRegisteredItemIfNecessary:(id)a3 itemAlerting:(BOOL)a4;
- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4;
- (void)_updatePendingItemWithItem:(id)a3;
- (void)_updateSystemApertureElementProminence:(BOOL)a3 item:(id)a4;
- (void)activityDidEnd:(id)a3;
- (void)activityDidStart:(id)a3;
- (void)activityDidUpdate:(id)a3;
- (void)activityEnvironmentChanged:(int64_t)a3;
- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4;
- (void)activitySystemApertureSceneHandle:(id)a3 updatedContentPayloadID:(id)a4;
- (void)activityWasBlockedForItem:(id)a3;
- (void)activityWasUnblockedForItem:(id)a3;
- (void)dismissAlert:(id)a3;
- (void)presentAlert:(id)a3;
@end

@implementation SBActivitySystemApertureElementObserver

- (SBActivitySystemApertureElementObserver)init
{
  v26.receiver = self;
  v26.super_class = (Class)SBActivitySystemApertureElementObserver;
  v2 = [(SBActivitySystemApertureElementObserver *)&v26 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sceneHandleByActivityIdentifier = v2->_sceneHandleByActivityIdentifier;
    v2->_sceneHandleByActivityIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    elementAssertionByActivityIdentifier = v2->_elementAssertionByActivityIdentifier;
    v2->_elementAssertionByActivityIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    elementByActivityIdentifier = v2->_elementByActivityIdentifier;
    v2->_elementByActivityIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    activeItemByActivityIdentifier = v2->_activeItemByActivityIdentifier;
    v2->_activeItemByActivityIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    contentPayloadIDsByActivityIdentifier = v2->_contentPayloadIDsByActivityIdentifier;
    v2->_contentPayloadIDsByActivityIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    prominenceStateByActivityIdentifier = v2->_prominenceStateByActivityIdentifier;
    v2->_prominenceStateByActivityIdentifier = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    pendingItems = v2->_pendingItems;
    v2->_pendingItems = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    activeWidgetActivitiesWithSceneHandles = v2->_activeWidgetActivitiesWithSceneHandles;
    v2->_activeWidgetActivitiesWithSceneHandles = (NSMutableSet *)v17;

    uint64_t v19 = objc_opt_new();
    pendingAlerts = v2->_pendingAlerts;
    v2->_pendingAlerts = (NSMutableOrderedSet *)v19;

    uint64_t v21 = objc_opt_new();
    ongoingActivities = v2->_ongoingActivities;
    v2->_ongoingActivities = (NSMutableSet *)v21;

    uint64_t v23 = objc_opt_new();
    alertingAssertionsByActivityIdentifier = v2->_alertingAssertionsByActivityIdentifier;
    v2->_alertingAssertionsByActivityIdentifier = (NSMutableDictionary *)v23;

    v2->_activityEnvironment = 0;
  }
  return v2;
}

- (void)activityDidStart:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __60__SBActivitySystemApertureElementObserver_activityDidStart___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 addObject:v3];

  [*(id *)(a1 + 32) _cleanUpInvalidRegisteredElements];
  if ([*(id *)(a1 + 32) _canRegisterElementForActivityItem:*(void *)(a1 + 40)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _createAndActivateElementForActivityItem:v5 completion:0];
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) descriptor];
    v6 = [v11 platterTargetBundleIdentifier];
    uint64_t v7 = [*(id *)(a1 + 32) _activatedElementItemForBundleIdentifier:v6];
    int v8 = [*(id *)(a1 + 32) _shouldSwapActivityItem:*(void *)(a1 + 40) withOtherItem:v7 itemAlerting:0];
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    if (v8) {
      [v9 _swapActivityItem:v10 withItem:v7];
    }
    else {
      [v9 _addPendingItemIfNecessary:v10];
    }
  }
}

- (void)activityDidUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBActivitySystemApertureElementObserver *)self _cleanUpInvalidRegisteredElements];
  uint64_t v5 = [v4 identifier];
  v6 = [v4 descriptor];
  uint64_t v7 = [v6 platterTargetBundleIdentifier];
  int v8 = SBLogActivity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v4 relevanceScore];
    *(_DWORD *)buf = 138543874;
    v27 = v5;
    __int16 v28 = 2114;
    v29 = v7;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] updated with relevance score %f", buf, 0x20u);
  }

  uint64_t v10 = [(SBActivitySystemApertureElementObserver *)self _activatedElementItemForBundleIdentifier:v7];
  id v11 = [v10 identifier];
  int v12 = [v11 isEqualToString:v5];

  uint64_t v13 = SBLogActivity();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] Update is on the registered element", buf, 0x16u);
    }

    [(NSMutableDictionary *)self->_activeItemByActivityIdentifier setObject:v4 forKeyedSubscript:v5];
    uint64_t v15 = (void *)[(NSMutableArray *)self->_pendingItems copy];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          -[SBActivitySystemApertureElementObserver _swapItemWithRegisteredItemIfNecessary:itemAlerting:](self, "_swapItemWithRegisteredItemIfNecessary:itemAlerting:", *(void *)(*((void *)&v21 + 1) + 8 * v20++), 0, (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v18);
    }
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] Update is on a pending element", buf, 0x16u);
    }

    [(SBActivitySystemApertureElementObserver *)self _updatePendingItemWithItem:v4];
    [(SBActivitySystemApertureElementObserver *)self _swapItemWithRegisteredItemIfNecessary:v4 itemAlerting:0];
  }
}

- (void)activityDidEnd:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 removeObject:v4];

  uint64_t v5 = [*v2 descriptor];
  v6 = [v5 activityIdentifier];
  if (v6)
  {
    uint64_t v7 = SBLogActivity();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v14 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ended", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_8;
    v10[3] = &unk_1E6AFFB30;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = *(id *)(a1 + 40);
    [v8 _invalidateSystemApertureElementForItem:v9 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _removeSystemApertureSceneHandleWithItem:*(void *)(a1 + 32)];
    [v3 _registerSystemApertureElementForPendingActivityIfNecessary];
    id WeakRetained = v3;
  }
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 descriptor];
  id v4 = [v3 presentationOptions];
  id v5 = [v4 destinations];
  char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_122);

  uint64_t v7 = +[SBLiveActivityDomain rootSettings];
  char v8 = [v7 hideActivitiesInDynamicIsland];

  char v9 = v6 & ~v8;
  return v9;
}

BOOL __68__SBActivitySystemApertureElementObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == 2;
}

- (void)activityWasBlockedForItem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogActivity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 identifier];
    int v7 = 138543362;
    char v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] was blocked", (uint8_t *)&v7, 0xCu);
  }
  [(SBActivitySystemApertureElementObserver *)self activityDidEnd:v4];
}

- (void)activityWasUnblockedForItem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogActivity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 identifier];
    int v7 = 138543362;
    char v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] was unblocked", (uint8_t *)&v7, 0xCu);
  }
  [(SBActivitySystemApertureElementObserver *)self activityDidStart:v4];
}

- (void)presentAlert:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBActivitySystemApertureElementObserver_presentAlert___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__SBActivitySystemApertureElementObserver_presentAlert___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) item];
  id v3 = [v2 identifier];

  int v4 = [*(id *)(a1 + 32) canPresentInEnvironment:*(void *)(*(void *)(a1 + 40) + 104) alertType:2];
  id v5 = SBLogActivity();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138543362;
      char v8 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] presents alert", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 40) _presentOrPendActivityAlert:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      int v7 = 138543362;
      char v8 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture can't present alert in this environment", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)dismissAlert:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBActivitySystemApertureElementObserver_dismissAlert___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__SBActivitySystemApertureElementObserver_dismissAlert___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) item];
  id v3 = [v2 identifier];

  id v4 = SBLogActivity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    char v8 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismisses alert", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v3];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 invalidateWithReason:@"SBActivitySystemApertureElementObserver's dismissAlertForActivityAlertProvider"];
    [*(id *)(*(void *)(a1 + 40) + 88) removeObjectForKey:v3];
  }
}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BSDispatchQueueAssertMain();
  BOOL v6 = [v8 identifier];
  BOOL v7 = [(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v6];

  if (v7) {
    [(SBActivitySystemApertureElementObserver *)self _updateSystemApertureElementProminence:v4 item:v8];
  }
}

- (void)activityEnvironmentChanged:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_activityEnvironment != a3)
  {
    self->_activityEnvironment = a3;
    if (a3 == 1)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      BOOL v4 = [(NSMutableDictionary *)self->_alertingAssertionsByActivityIdentifier allValues];
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
            [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidateWithReason:@"SBActivitySystemApertureElementObserver's activityEnvironmentChanged"];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }

      [(NSMutableDictionary *)self->_alertingAssertionsByActivityIdentifier removeAllObjects];
    }
  }
}

- (BOOL)_isActivityOngoing:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  LOBYTE(self) = [(NSMutableSet *)self->_ongoingActivities containsObject:v4];

  return (char)self;
}

- (void)_cleanUpInvalidRegisteredElements
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier allValues];
  id v4 = (void *)[v3 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v7 = 138543362;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "scene", v18);
        char v13 = [v12 isValid];

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = [v11 descriptor];
          uint64_t v15 = [v14 activityIdentifier];

          id v16 = [(NSMutableDictionary *)self->_activeItemByActivityIdentifier objectForKeyedSubscript:v15];
          if (v16)
          {
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __76__SBActivitySystemApertureElementObserver__cleanUpInvalidRegisteredElements__block_invoke;
            v19[3] = &unk_1E6AFB518;
            uint64_t v20 = v15;
            [(SBActivitySystemApertureElementObserver *)self _invalidateSystemApertureElementForItem:v16 completion:v19];
            uint64_t v17 = v20;
          }
          else
          {
            [v11 invalidate];
            [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier removeObjectForKey:v15];
            uint64_t v17 = SBLogActivity();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              objc_super v26 = v15;
              _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] scene handle removed.", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }
}

void __76__SBActivitySystemApertureElementObserver__cleanUpInvalidRegisteredElements__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SBLogActivity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] invalid scene removed.", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)_canRegisterElementForActivityItem:(id)a3
{
  int v4 = [a3 descriptor];
  uint64_t v5 = [v4 contentType];
  uint64_t v6 = [v4 platterTargetBundleIdentifier];
  BOOL v7 = [(SBActivitySystemApertureElementObserver *)self _registeredElementExistsForBundleIdentifier:v6];
  BOOL v8 = [(SBActivitySystemApertureElementObserver *)self _systemApertureElementAssertionExistsForBundleIdentifier:v6];
  BOOL v9 = v8;
  if (v5) {
    BOOL v10 = !v7 && !v8;
  }
  else {
    BOOL v10 = (unint64_t)[(NSMutableSet *)self->_activeWidgetActivitiesWithSceneHandles count] <= 1
  }
       && !v7
       && !v9;

  return v10;
}

- (void)_createAndActivateElementForActivityItem:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, uint64_t))a4;
  BSDispatchQueueAssertMain();
  BOOL v9 = [v7 descriptor];
  BOOL v10 = [v9 activityIdentifier];
  if ([(SBActivitySystemApertureElementObserver *)self shouldHandleActivityItem:v7]
    && v10)
  {
    long long v11 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier objectForKeyedSubscript:v10];
    long long v12 = SBLogActivity();
    char v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:]();
      }

      if (v8) {
        v8[2](v8, 1);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v22 = v10;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] started, creating system aperture element", buf, 0xCu);
      }

      uint64_t v14 = [(SBActivitySystemApertureElementObserver *)self _createSystemApertureSceneHandleWithItem:v7];
      uint64_t v15 = [v14 scene];
      if (v15)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke;
        v18[3] = &unk_1E6AF5AA0;
        id v19 = v10;
        uint64_t v20 = v8;
        [(SBActivitySystemApertureElementObserver *)self _createAndActivateSystemApertureElementWithScene:v15 item:v7 completion:v18];
      }
      else
      {
        id v16 = SBLogActivity();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:]();
        }

        if (v8) {
          v8[2](v8, 0);
        }
      }
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBActivitySystemApertureElementObserver.m" lineNumber:282 description:@"Activity cannot be started in system aperture if it doesn't have a system aperture destination or an identifier"];

    if (v8) {
      v8[2](v8, 0);
    }
  }
}

uint64_t __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = SBLogActivity();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is created and activate successfully", (uint8_t *)&v15, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      BOOL v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke_cold_1(a1, v5, v9, v10, v11, v12, v13, v14);
    }

    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      BOOL v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)_registerSystemApertureElementForPendingActivityIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  uint64_t v3 = [(NSMutableArray *)self->_pendingItems firstObject];
  if ((unint64_t)[(NSMutableSet *)self->_activeWidgetActivitiesWithSceneHandles count] <= 1)
  {
    int v4 = [v3 descriptor];
    uint64_t v5 = [v4 platterTargetBundleIdentifier];
    BOOL v6 = [(SBActivitySystemApertureElementObserver *)self _registeredElementExistsForBundleIdentifier:v5];

    if (!v6)
    {
      if (v3)
      {
        [(SBActivitySystemApertureElementObserver *)self _removePendingItem:v3 withPendingAlerts:0];
        id v7 = SBLogActivity();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v8 = [v3 identifier];
          int v13 = 138543362;
          uint64_t v14 = v8;
          _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] starting new activity from pending activities", (uint8_t *)&v13, 0xCu);
        }
        uint64_t v9 = [v3 identifier];
        BOOL v10 = [(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v9];

        if (v10)
        {
          [(SBActivitySystemApertureElementObserver *)self _createAndActivateElementForActivityItem:v3 completion:0];
        }
        else
        {
          uint64_t v11 = SBLogActivity();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [v3 identifier];
            int v13 = 138543362;
            uint64_t v14 = v12;
            _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity has already ended, abort starting pending activity", (uint8_t *)&v13, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_prepareForAlertingActivityIfNecessary:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  BSDispatchQueueAssertMain();
  BOOL v8 = [v6 item];
  uint64_t v9 = [v8 identifier];

  if ([(SBActivitySystemApertureElementObserver *)self _activityIsPendingForIdentifier:v9])
  {
    BOOL v10 = SBLogActivity();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] preparing element for alerting pending activity", (uint8_t *)&v13, 0xCu);
    }

    if ([(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v9])
    {
      uint64_t v11 = [(SBActivitySystemApertureElementObserver *)self _pendingItemForAlert:v6];
      [(SBActivitySystemApertureElementObserver *)self _createAndActivateElementForActivityItem:v11 completion:v7];
    }
    else
    {
      uint64_t v12 = SBLogActivity();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity has already ended, no alert necessary", (uint8_t *)&v13, 0xCu);
      }

      if (v7) {
        v7[2](v7, 0);
      }
    }
  }
  else if (v7)
  {
    ((void (**)(id, BOOL))v7)[2](v7, [(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v9]);
  }
}

- (void)_presentPendingAlertIfNecessary
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_pendingAlerts firstObject];
  if (v3)
  {
    int v4 = v3;
    [(SBActivitySystemApertureElementObserver *)self _presentOrPendActivityAlert:v3];
    uint64_t v3 = v4;
  }
}

- (void)_presentPendingAlertIfNecessaryForActivityIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableOrderedSet *)self->_pendingAlerts copy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138543874;
    long long v20 = v8;
    id v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "item", v20);
        uint64_t v14 = [v13 identifier];
        int v15 = [v14 isEqualToString:v4];

        if (v15
          && [(SBActivitySystemApertureElementObserver *)self _canPresentAlert:v12]
          && [(SBActivitySystemApertureElementObserver *)self _isContentReadyForAlert:v12])
        {
          uint64_t v16 = [(NSMutableDictionary *)self->_contentPayloadIDsByActivityIdentifier objectForKeyedSubscript:v4];
          uint64_t v17 = SBLogActivity();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            long long v18 = [v12 payloadIdentifier];
            id v19 = [v16 description];
            *(_DWORD *)buf = v20;
            id v27 = v4;
            __int16 v28 = 2114;
            v29 = v18;
            __int16 v30 = 2114;
            uint64_t v31 = v19;
            _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Showing alert with payload ID: %{public}@, payload IDs received for the activity: %{public}@", buf, 0x20u);

            id v6 = v21;
          }

          [(SBActivitySystemApertureElementObserver *)self _prepareAndPresentActivityAlert:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }
}

- (void)_presentOrPendActivityAlert:(id)a3
{
  id v4 = a3;
  if ([(SBActivitySystemApertureElementObserver *)self _canPresentAlert:v4])
  {
    if ([(SBActivitySystemApertureElementObserver *)self _isContentReadyForAlert:v4])
    {
      [(SBActivitySystemApertureElementObserver *)self _prepareAndPresentActivityAlert:v4];
    }
    else
    {
      self->_preparingElementForPendingAlert = 1;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__SBActivitySystemApertureElementObserver__presentOrPendActivityAlert___block_invoke;
      v10[3] = &unk_1E6AF4A98;
      void v10[4] = self;
      id v11 = v4;
      [(SBActivitySystemApertureElementObserver *)self _prepareForAlertingActivityIfNecessary:v11 completion:v10];
    }
  }
  else
  {
    [(SBActivitySystemApertureElementObserver *)self _addPendingAlert:v4];
    uint64_t v5 = [v4 item];
    id v6 = [v5 identifier];

    uint64_t v7 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v6];
    uint64_t v8 = [(SBActivitySystemApertureElementObserver *)self _pendingItemForAlert:v4];
    uint64_t v9 = (void *)v8;
    if (!v7 && v8) {
      [(SBActivitySystemApertureElementObserver *)self _swapItemWithRegisteredItemIfNecessary:v8 itemAlerting:1];
    }
  }
}

uint64_t __71__SBActivitySystemApertureElementObserver__presentOrPendActivityAlert___block_invoke(uint64_t result, int a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 96) = 0;
  if (a2) {
    return [*(id *)(result + 32) _addPendingAlert:*(void *)(result + 40)];
  }
  return result;
}

- (void)_addPendingAlert:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 item];
  id v6 = [v5 identifier];

  uint64_t v7 = SBLogActivity();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding to pending alerts", (uint8_t *)&v8, 0xCu);
  }

  [(NSMutableOrderedSet *)self->_pendingAlerts addObject:v4];
}

- (void)_prepareAndPresentActivityAlert:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__SBActivitySystemApertureElementObserver__prepareAndPresentActivityAlert___block_invoke;
  v6[3] = &unk_1E6AF4A98;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBActivitySystemApertureElementObserver *)self _prepareForAlertingActivityIfNecessary:v5 completion:v6];
}

uint64_t __75__SBActivitySystemApertureElementObserver__prepareAndPresentActivityAlert___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _presentAlert:*(void *)(result + 40)];
  }
  return result;
}

- (void)_cleanUpAlertPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  id v6 = [v5 identifier];

  if ([(SBActivitySystemApertureElementObserver *)self _activityIsPendingForIdentifier:v6])
  {
    objc_initWeak(&location, self);
    id v7 = [v4 item];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke;
    v8[3] = &unk_1E6AFFB30;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [(SBActivitySystemApertureElementObserver *)self _invalidateSystemApertureElementForItem:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) item];
    [WeakRetained _removeSystemApertureSceneHandleWithItem:v2];

    [WeakRetained _registerSystemApertureElementForPendingActivityIfNecessary];
  }
}

- (void)_presentAlert:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(SBActivitySystemApertureElementObserver *)self _canPresentAlert:v5])
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBActivitySystemApertureElementObserver.m" lineNumber:439 description:@"Cannot present an alert when an alert is active or content is not ready"];
  }
  id v6 = [v5 item];
  id v7 = [v6 identifier];

  int v8 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier objectForKey:v7];
  id v9 = [v8 descriptor];

  if ([(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v7])
  {
    id v10 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v7];
    if (objc_opt_respondsToSelector())
    {
      id v11 = SBLogActivity();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 description];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v7;
        __int16 v32 = 2112;
        uint64_t v33 = v12;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] enables alerting for element %@", buf, 0x16u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke;
      v27[3] = &unk_1E6AFFB58;
      id v13 = v7;
      id v28 = v13;
      id v14 = v9;
      id v29 = v14;
      [(SBActivitySystemApertureElementObserver *)self _sendAnalyticsEventWithPayloadBuilder:v27];
      [(NSMutableOrderedSet *)self->_pendingAlerts removeObject:v5];
      [v5 alertWithScreenOn:1 playSound:1];
      int v15 = [v5 isProminent];
      unsigned int v16 = [v14 isMomentary];
      char v17 = v16;
      long long v18 = [v10 requestAlertingAssertionImplicitlyDismissable:v15 & v16];
      if (v18)
      {
        [(NSMutableDictionary *)self->_alertingAssertionsByActivityIdentifier setObject:v18 forKey:v13];
        [v18 setAutomaticallyInvalidatable:0 lockingWithKey:@"SBActivitySystemApertureElementObserver" reason:@"SBActivitySystemApertureElementObserver"];
        objc_initWeak((id *)buf, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke_2;
        v22[3] = &unk_1E6AFFB80;
        id v23 = v13;
        objc_copyWeak(&v25, (id *)buf);
        id v24 = v5;
        char v26 = v17;
        [v18 addInvalidationBlock:v22];

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        long long v20 = SBLogActivity();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          [(SBActivitySystemApertureElementObserver *)(uint64_t)v13 _presentAlert:v20];
        }
      }
    }
  }
  else
  {
    id v19 = SBLogActivity();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v7;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not presenting an alert for it", buf, 0xCu);
    }

    [(NSMutableOrderedSet *)self->_pendingAlerts removeObject:v5];
    [(SBActivitySystemApertureElementObserver *)self _presentPendingAlertIfNecessary];
    [(SBActivitySystemApertureElementObserver *)self _cleanUpAlertPresentation:v5];
  }
}

id __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v7[0] = v2;
  v6[0] = @"activityId";
  v6[1] = @"bundleId";
  id v3 = [v1 platterTargetBundleIdentifier];
  v6[2] = @"eventType";
  v7[1] = v3;
  v7[2] = @"alert-jindo";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

void __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogActivity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] invalidating alerting assertion", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _presentPendingAlertIfNecessary];
    [v5 _cleanUpAlertPresentation:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 56))
    {
      id v6 = [*(id *)(a1 + 40) item];
      id v7 = objc_alloc_init(MEMORY[0x1E4F18130]);
      int v8 = [v6 identifier];
      [v7 endActivity:v8];
    }
  }
}

- (BOOL)_canPresentAlert:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 item];
  id v5 = [v4 identifier];

  id v6 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v5];
  id v7 = SBLogActivity();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v6 description];
      int v12 = 138543618;
      id v13 = v5;
      __int16 v14 = 2112;
      int v15 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Element for alerting: %@", (uint8_t *)&v12, 0x16u);
    }
    char v10 = [v6 isReadyForPresentation];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBActivitySystemApertureElementObserver _canPresentAlert:]();
    }

    char v10 = 0;
  }

  return v10;
}

- (BOOL)_isContentReadyForAlert:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 item];
  id v6 = [v5 identifier];

  id v7 = [v4 payloadIdentifier];

  if (v7)
  {
    int v8 = [(NSMutableDictionary *)self->_contentPayloadIDsByActivityIdentifier objectForKeyedSubscript:v6];
    int v9 = v8;
    if (v8) {
      char v10 = [v8 containsObject:v7];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = SBLogActivity();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      __int16 v14 = v6;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] No payload ID passed with the alert", (uint8_t *)&v13, 0xCu);
    }

    char v10 = 1;
  }

  return v10;
}

- (BOOL)_hasValidAlertingAssertion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(NSMutableDictionary *)self->_alertingAssertionsByActivityIdentifier allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isValid])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_pendingItemForAlert:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 item];
  id v5 = [v4 identifier];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_pendingItems;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v14);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_registeredElementExistsForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) descriptor];
        long long v10 = [v9 platterTargetBundleIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_systemApertureElementAssertionExistsForBundleIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(NSMutableDictionary *)self->_activeItemByActivityIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v11 = [v10 descriptor];
        char v12 = [v11 platterTargetBundleIdentifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          elementAssertionByActivityIdentifier = self->_elementAssertionByActivityIdentifier;
          long long v16 = [v10 identifier];
          long long v17 = [(NSMutableDictionary *)elementAssertionByActivityIdentifier objectForKey:v16];
          BOOL v14 = v17 != 0;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (id)_activatedElementItemForBundleIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        char v11 = [v10 descriptor];
        char v12 = [v11 platterTargetBundleIdentifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          BOOL v14 = [v10 descriptor];
          long long v15 = [v14 activityIdentifier];

          long long v16 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v15];
          long long v17 = v16;
          if (v16 && ([v16 isActivated] & 1) != 0)
          {
            uint64_t v18 = [(NSMutableDictionary *)self->_activeItemByActivityIdentifier objectForKeyedSubscript:v15];

            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)_shouldSwapActivityItem:(id)a3 withOtherItem:(id)a4 itemAlerting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (!v8 || !v9)
  {
    long long v16 = SBLogActivity();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = [v8 identifier];
      long long v22 = [v10 identifier];
      int v38 = 138543618;
      v39 = v21;
      __int16 v40 = 2114;
      v41 = v22;
      long long v23 = "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping because items can't be found";
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v38, 0x16u);
    }
LABEL_14:
    BOOL v20 = 0;
    goto LABEL_24;
  }
  char v11 = [v8 descriptor];
  char v12 = [v11 platterTargetBundleIdentifier];
  int v13 = [v10 descriptor];
  BOOL v14 = [v13 platterTargetBundleIdentifier];
  char v15 = [v12 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    long long v16 = SBLogActivity();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = [v8 identifier];
      long long v22 = [v10 identifier];
      int v38 = 138543618;
      v39 = v21;
      __int16 v40 = 2114;
      v41 = v22;
      long long v23 = "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping items because bundle identifiers doesn't match";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  long long v16 = [v8 identifier];
  if (v5
    && [(SBActivitySystemApertureElementObserver *)self _activityAlertIsPendingForIdentifier:v16])
  {
    long long v17 = SBLogActivity();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v8 identifier];
      long long v19 = [v10 identifier];
      int v38 = 138543618;
      v39 = v18;
      __int16 v40 = 2114;
      v41 = v19;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Swapping items because alert is pending", (uint8_t *)&v38, 0x16u);
    }
    BOOL v20 = 1;
  }
  else
  {
    long long v17 = [v10 identifier];
    uint64_t v24 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier objectForKeyedSubscript:v17];
    uint64_t v25 = SBLogActivity();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        id v27 = [v8 identifier];
        id v28 = [v10 identifier];
        [v8 relevanceScore];
        uint64_t v30 = v29;
        [v10 relevanceScore];
        int v38 = 138544130;
        v39 = v27;
        __int16 v40 = 2114;
        v41 = v28;
        __int16 v42 = 2048;
        uint64_t v43 = v30;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Checking relevance scores for swapping decision: Swapping Activity Relevance Score: %f, Swapped Activity Relevance Score: %f", (uint8_t *)&v38, 0x2Au);
      }
      [v8 relevanceScore];
      double v33 = v32;
      [v10 relevanceScore];
      BOOL v20 = v33 > v34;
    }
    else
    {
      if (v26)
      {
        v35 = [v8 identifier];
        v36 = [v10 identifier];
        int v38 = 138543618;
        v39 = v35;
        __int16 v40 = 2114;
        v41 = v36;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping items because no element found for registered item", (uint8_t *)&v38, 0x16u);
      }
      BOOL v20 = 0;
    }
  }
LABEL_24:

  return v20;
}

- (void)_swapItemWithRegisteredItemIfNecessary:(id)a3 itemAlerting:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [v9 descriptor];
  uint64_t v7 = [v6 platterTargetBundleIdentifier];

  id v8 = [(SBActivitySystemApertureElementObserver *)self _activatedElementItemForBundleIdentifier:v7];
  if ([(SBActivitySystemApertureElementObserver *)self _shouldSwapActivityItem:v9 withOtherItem:v8 itemAlerting:v4])
  {
    [(SBActivitySystemApertureElementObserver *)self _swapActivityItem:v9 withItem:v8];
    [(SBActivitySystemApertureElementObserver *)self _removePendingItem:v9 withPendingAlerts:0];
  }
}

- (void)_swapActivityItem:(id)a3 withItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = SBLogActivity();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [v6 identifier];
      char v11 = [v6 descriptor];
      char v12 = [v11 platterTargetBundleIdentifier];
      int v13 = [v8 identifier];
      BOOL v14 = [v8 descriptor];
      char v15 = [v14 platterTargetBundleIdentifier];
      *(_DWORD *)buf = 138544130;
      long long v21 = v10;
      __int16 v22 = 2114;
      long long v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      id v27 = v15;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Swapping item [ActivityID: %{public}@, BundleID: %{public}@] with other item [ActivityID: %{public}@, BundleID: %{public}@]", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke;
    v16[3] = &unk_1E6AFFBA8;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v8;
    id v18 = v6;
    [(SBActivitySystemApertureElementObserver *)self _invalidateSystemApertureElementForItem:v17 completion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, a1 + 6);
  id v4 = a1[4];
  id v5 = a1[5];
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _removeSystemApertureSceneHandleWithItem:*(void *)(a1 + 32)];
    [v3 _createAndActivateElementForActivityItem:*(void *)(a1 + 40) completion:0];
    id WeakRetained = v3;
  }
}

- (BOOL)_activityAlertIsPendingForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_pendingAlerts;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "item", (void)v13);
        long long v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_activityIsPendingForIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_pendingItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addPendingItemIfNecessary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableArray *)self->_pendingItems containsObject:v4] & 1) == 0)
  {
    id v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 identifier];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] added to pending activities", (uint8_t *)&v7, 0xCu);
    }
    [(NSMutableArray *)self->_pendingItems addObject:v4];
  }
}

- (void)_updatePendingItemWithItem:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = -1;
  pendingItems = self->_pendingItems;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  char v10 = __70__SBActivitySystemApertureElementObserver__updatePendingItemWithItem___block_invoke;
  char v11 = &unk_1E6AFFBD0;
  id v6 = v4;
  id v12 = v6;
  long long v13 = &v14;
  [(NSMutableArray *)pendingItems enumerateObjectsUsingBlock:&v8];
  uint64_t v7 = v15[3];
  if (v7 == -1) {
    -[SBActivitySystemApertureElementObserver _addPendingItemIfNecessary:](self, "_addPendingItemIfNecessary:", v6, v8, v9, v10, v11);
  }
  else {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pendingItems, "replaceObjectAtIndex:withObject:", v7, v6, v8, v9, v10, v11);
  }

  _Block_object_dispose(&v14, 8);
}

void __70__SBActivitySystemApertureElementObserver__updatePendingItemWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [*(id *)(a1 + 32) identifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_removePendingItem:(id)a3 withPendingAlerts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSMutableArray *)self->_pendingItems containsObject:v6])
  {
    [(NSMutableArray *)self->_pendingItems removeObject:v6];
    if (v4)
    {
      pendingAlerts = self->_pendingAlerts;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__SBActivitySystemApertureElementObserver__removePendingItem_withPendingAlerts___block_invoke;
      v14[3] = &unk_1E6AFFBF8;
      id v8 = v6;
      id v15 = v8;
      int v9 = [(NSMutableOrderedSet *)pendingAlerts bs_firstObjectPassingTest:v14];
      if (v9)
      {
        char v10 = SBLogActivity();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          char v11 = [v8 identifier];
          *(_DWORD *)buf = 138543362;
          uint64_t v17 = v11;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removed from pending alert for this item", buf, 0xCu);
        }
        [(NSMutableOrderedSet *)self->_pendingAlerts removeObject:v9];
      }
    }
    id v12 = SBLogActivity();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removed from pending activities", buf, 0xCu);
    }
  }
}

BOOL __80__SBActivitySystemApertureElementObserver__removePendingItem_withPendingAlerts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 item];
  BOOL v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  BOOL v6 = v4 == v5;

  return v6;
}

- (id)_createSystemApertureSceneHandleWithItem:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [v4 descriptor];
  BOOL v6 = [v5 activityIdentifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier objectForKey:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = NSString;
    char v10 = [v4 identifier];
    char v11 = [v9 stringWithFormat:@"[ActivityID: %@] Active system aperture scene handle found while creating a new system aperture scene handle", v10];
  }
  else
  {
    id v8 = [(SBActivitySystemApertureElementObserver *)self _createSceneHandle:v4];
    [(SBActivitySystemApertureElementObserver *)self _storeSceneHandle:v8 item:v4];
  }

  return v8;
}

- (id)_createSceneHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = SBLogActivity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 identifier];
    int v10 = 138543362;
    char v11 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Creating a system aperture scene handle", (uint8_t *)&v10, 0xCu);
  }
  BOOL v6 = [v3 descriptor];
  uint64_t v7 = [MEMORY[0x1E4FA7CB0] defaultMetrics];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F49770]) initWithDescriptor:v6 metricsRequest:v7];

  return v8;
}

- (void)_storeSceneHandle:(id)a3 item:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogActivity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 identifier];
    int v16 = 138543362;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Storing scene handle", (uint8_t *)&v16, 0xCu);
  }
  if (v6)
  {
    int v10 = [v7 descriptor];
    char v11 = [v10 activityIdentifier];
    [v6 setDelegate:self];
    [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier setObject:v6 forKey:v11];
    [(NSMutableDictionary *)self->_activeItemByActivityIdentifier setObject:v7 forKeyedSubscript:v11];
    if (![v10 contentType])
    {
      activeWidgetActivitiesWithSceneHandles = self->_activeWidgetActivitiesWithSceneHandles;
      long long v13 = [v10 activityIdentifier];
      [(NSMutableSet *)activeWidgetActivitiesWithSceneHandles addObject:v13];
    }
    uint64_t v14 = SBLogActivity();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v7 identifier];
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Scene handle stored successfully", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_removeSystemApertureSceneHandleWithItem:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [v4 descriptor];
  id v6 = [v5 activityIdentifier];
  id v7 = [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier objectForKey:v6];
  [(NSMutableDictionary *)self->_activeItemByActivityIdentifier removeObjectForKey:v6];
  if (v7)
  {
    [v7 invalidate];
    [(NSMutableDictionary *)self->_sceneHandleByActivityIdentifier removeObjectForKey:v6];
  }
  [(NSMutableDictionary *)self->_contentPayloadIDsByActivityIdentifier removeObjectForKey:v6];
  id v8 = [v4 identifier];
  BOOL v9 = [(SBActivitySystemApertureElementObserver *)self _isActivityOngoing:v8];

  if (v9) {
    [(SBActivitySystemApertureElementObserver *)self _addPendingItemIfNecessary:v4];
  }
  else {
    [(SBActivitySystemApertureElementObserver *)self _removePendingItem:v4 withPendingAlerts:1];
  }
  pendingAlerts = self->_pendingAlerts;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__SBActivitySystemApertureElementObserver__removeSystemApertureSceneHandleWithItem___block_invoke;
  v19[3] = &unk_1E6AFFC20;
  id v11 = v6;
  id v20 = v11;
  unint64_t v12 = [(NSMutableOrderedSet *)pendingAlerts indexOfObjectPassingTest:v19];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = v12;
    char v14 = [(NSMutableOrderedSet *)self->_pendingAlerts count] <= v12 || v9;
    if ((v14 & 1) == 0) {
      [(NSMutableOrderedSet *)self->_pendingAlerts removeObjectAtIndex:v13];
    }
  }
  activeWidgetActivitiesWithSceneHandles = self->_activeWidgetActivitiesWithSceneHandles;
  int v16 = [v5 activityIdentifier];
  LODWORD(activeWidgetActivitiesWithSceneHandles) = [(NSMutableSet *)activeWidgetActivitiesWithSceneHandles containsObject:v16];

  if (activeWidgetActivitiesWithSceneHandles)
  {
    uint64_t v17 = self->_activeWidgetActivitiesWithSceneHandles;
    uint64_t v18 = [v5 activityIdentifier];
    [(NSMutableSet *)v17 removeObject:v18];
  }
}

uint64_t __84__SBActivitySystemApertureElementObserver__removeSystemApertureSceneHandleWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 item];
  id v6 = [v5 identifier];
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (a3) {
    return v7;
  }
  else {
    return 0;
  }
}

- (void)_updateSystemApertureElementProminence:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  unsigned int v7 = [v6 identifier];
  if (v4 && self->_activityEnvironment == 1)
  {
    id v8 = SBLogActivity();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Environment is ambient, system aperture element can't become prominent", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v8 = [(NSMutableDictionary *)self->_prominenceStateByActivityIdentifier objectForKeyedSubscript:v7];
    int v9 = [v8 BOOLValue];
    int v10 = SBLogActivity();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromBOOL();
      unint64_t v12 = NSStringFromBOOL();
      int v17 = 138543874;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Prominence state update: %@, current prominence state: %@", (uint8_t *)&v17, 0x20u);
    }
    if (v9 != v4)
    {
      unint64_t v13 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
      [(NSMutableDictionary *)self->_prominenceStateByActivityIdentifier setObject:v13 forKeyedSubscript:v7];

      char v14 = [[SBActivityAlert alloc] initWithItem:v6 payloadIdentifier:0 options:0 title:0 body:0];
      [(SBActivityAlert *)v14 setProminent:1];
      id v15 = SBLogActivity();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v16)
        {
          int v17 = 138543362;
          uint64_t v18 = v7;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Presenting a prominent alert", (uint8_t *)&v17, 0xCu);
        }

        [(SBActivitySystemApertureElementObserver *)self presentAlert:v14];
      }
      else
      {
        if (v16)
        {
          int v17 = 138543362;
          uint64_t v18 = v7;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Dismissing a prominent alert", (uint8_t *)&v17, 0xCu);
        }

        [(SBActivitySystemApertureElementObserver *)self dismissAlert:v14];
      }
    }
  }
}

- (void)_createAndActivateSystemApertureElementWithScene:(id)a3 item:(id)a4 completion:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void))a5;
  v35 = v8;
  int v10 = [v8 descriptor];
  id v11 = [v10 activityIdentifier];
  unint64_t v12 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v11];
  if (v12)
  {
    unint64_t v13 = SBLogActivity();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBActivitySystemApertureElementObserver _createAndActivateSystemApertureElementWithScene:item:completion:]();
    }

    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    uint64_t v29 = [(id)SBApp systemApertureControllerForMainDisplay];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke;
    v55[3] = &unk_1E6AF9178;
    id v31 = v36;
    id v56 = v31;
    double v34 = (void *)MEMORY[0x1D948C7A0](v55);
    char v14 = +[SBSystemApertureSceneElement activePlaceholderElementPassingTest:v34];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_2;
    v52[3] = &unk_1E6AFFC48;
    id v33 = v11;
    id v53 = v33;
    id v15 = v9;
    id v54 = v15;
    double v32 = (void *)MEMORY[0x1D948C7A0](v52);
    if (!v14)
    {
      BOOL v16 = self;
      int v17 = [SBSystemApertureSceneElement alloc];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_3;
      v47[3] = &unk_1E6AFFC98;
      v47[4] = v16;
      id v48 = v33;
      id v49 = v29;
      id v50 = v32;
      v51 = v15;
      char v14 = [(SBSystemApertureSceneElement *)v17 initWithScene:v31 statusBarBackgroundActivitiesSuppresser:v49 readyForPresentationHandler:v47];
    }
    uint64_t v18 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
    [(SBSystemApertureSceneElementConfiguration *)v18 setAllowsSceneReactivation:1];
    if (![v10 contentType])
    {
      __int16 v19 = [MEMORY[0x1E4FA7CB0] defaultMetrics];
      id v20 = [v19 systemApertureMetrics];

      __int16 v21 = [v20 expandedMetricsRequest];
      __int16 v22 = [v21 heightRequest];
      [v22 maximum];
      -[SBSystemApertureSceneElementConfiguration setMaximumHeight:](v18, "setMaximumHeight:");
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementByActivityIdentifier, "setObject:forKeyedSubscript:", v14, v33, v29);
    BOOL v23 = [(SBSystemApertureSceneElement *)v14 isActivated];
    __int16 v24 = SBLogActivity();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543362;
        id v58 = v33;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Update System Aperture element with connected scene", buf, 0xCu);
      }

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_66;
      v37[3] = &unk_1E6AFFCC0;
      v37[4] = self;
      id v38 = v32;
      [(SBSystemApertureSceneElement *)v14 updateWithConnectedScene:v31 configuration:v18 elementAssertionAcquisitionHandler:v37];
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543362;
        id v58 = v33;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System Aperture element is not activated. Activating...", buf, 0xCu);
      }

      [(SBSystemApertureSceneElement *)v14 setConfiguration:v18];
      __int16 v26 = [v31 clientHandle];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        uint64_t v28 = SBLogActivity();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v58 = v33;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activating System Aperture element with deferred check for existing placeholder", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v14);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_63;
        v39[3] = &unk_1E6AFFCE8;
        objc_copyWeak(&v44, (id *)buf);
        id v40 = v33;
        id v41 = v31;
        __int16 v42 = v18;
        id v43 = v32;
        objc_copyWeak(&v45, &location);
        [(SBSystemApertureSceneElement *)v14 activateWithPostActivationPlaceholderTest:v34 foundPlaceholderHandler:v39];
        objc_destroyWeak(&v45);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(SBSystemApertureSceneElement *)v14 activate];
      }
    }
  }
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) clientHandle];
  id v5 = [v4 bundleIdentifier];

  id v6 = [*(id *)(a1 + 32) clientSettings];
  uint64_t v7 = objc_msgSend(v6, "SBUISA_elementIdentifier");
  id v8 = (void *)v7;
  int v9 = (void *)*MEMORY[0x1E4FA7F18];
  if (v7) {
    int v9 = (void *)v7;
  }
  id v10 = v9;

  id v11 = [v3 clientIdentifier];
  if ([v5 isEqualToString:v11])
  {
    unint64_t v12 = [v3 elementIdentifier];
    uint64_t v13 = [v10 isEqualToString:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a2[2];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = a2;
  [v5 setObject:a3 forKeyedSubscript:v6];
  [v7 _presentPendingAlertIfNecessaryForActivityIdentifier:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  id v8 = a1[8];
  id v4 = v3;
  BSDispatchMain();
}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2 && *(unsigned char *)(a1 + 80))
  {
    id v3 = SBLogActivity();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is ready for presentation", (uint8_t *)&v9, 0xCu);
    }

    id v5 = [*(id *)(a1 + 48) registerElement:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v6 = SBLogActivity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is NOT yet ready for presentation", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 72);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Placeholder System Aperture element found, updating it with connected scene", buf, 0xCu);
    }

    [WeakRetained[3] setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    unint64_t v12 = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_64;
    uint64_t v13 = &unk_1E6AFFCC0;
    id v15 = *(id *)(a1 + 56);
    char v14 = WeakRetained;
    [v3 updateWithConnectedScene:v7 configuration:v8 elementAssertionAcquisitionHandler:&v10];
    id v9 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v9, "deactivateWhenRemovedWithHandler:", 0, v10, v11, v12, v13);
  }
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_66(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)_invalidateSystemApertureElementForItem:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 descriptor];
  id v9 = [v8 activityIdentifier];
  uint64_t v10 = SBLogActivity();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Invalidating system aperture element", buf, 0xCu);
  }

  uint64_t v11 = [(NSMutableDictionary *)self->_elementAssertionByActivityIdentifier objectForKeyedSubscript:v9];
  unint64_t v12 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v9];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke;
  v24[3] = &unk_1E6AF4E00;
  id v13 = v11;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  BOOL v27 = self;
  id v15 = (void (**)(void))MEMORY[0x1D948C7A0](v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2;
  v22[3] = &unk_1E6AFFD10;
  id v16 = v7;
  id v23 = v16;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1D948C7A0](v22);
  if ([v12 isDeactivating])
  {
    uint64_t v18 = SBLogActivity();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v14;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Invalidating system aperture element - already deactivated", buf, 0xCu);
    }
  }
  else
  {
    if ([v12 isActivated] && (objc_msgSend(v12, "isDeactivating") & 1) == 0)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_70;
      v19[3] = &unk_1E6AFFD38;
      id v20 = v14;
      __int16 v21 = v17;
      [v12 deactivateWhenRemovedWithHandler:v19];
      v15[2](v15);

      goto LABEL_11;
    }
    [(SBActivitySystemApertureElementObserver *)self _removeSystemApertureSceneHandleWithItem:v6];
    [(SBActivitySystemApertureElementObserver *)self _registerSystemApertureElementForPendingActivityIfNecessary];
  }
  v15[2](v15);
  ((void (**)(void, void *))v17)[2](v17, v12);
LABEL_11:
}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2 && [v2 isValid])
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = [NSString stringWithFormat:@"[ActivityID: %@] ended", a1[5]];
    [v3 invalidateWithReason:v4];
  }
  [*(id *)(a1[6] + 16) removeObjectForKey:a1[5]];
  [*(id *)(a1[6] + 24) removeObjectForKey:a1[5]];
  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[6] + 48);
  return [v6 removeObjectForKey:v5];
}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2_71;
  block[3] = &unk_1E6AFCAC8;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2_71(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogActivity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Element deactivated", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  void v27[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 descriptor];
  id v8 = [v7 activityIdentifier];
  id v9 = [v7 platterTargetBundleIdentifier];
  if (v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_elementByActivityIdentifier objectForKeyedSubscript:v8];
    uint64_t v11 = v10;
    if (v10 && ([v10 isActivated] & 1) != 0)
    {
      if ([v11 layoutMode] <= 0)
      {
        id v14 = SBLogActivity();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:]();
        }
      }
      else
      {
        unint64_t v12 = (void *)MEMORY[0x1E4F629C8];
        v26[0] = *MEMORY[0x1E4F625E0];
        if (v6)
        {
          id v25 = v6;
          id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        }
        else
        {
          id v13 = (void *)MEMORY[0x1E4F1CBF0];
        }
        uint64_t v15 = *MEMORY[0x1E4F62658];
        v26[1] = *MEMORY[0x1E4F62688];
        v26[2] = v15;
        v26[3] = *MEMORY[0x1E4F626A0];
        v27[0] = v13;
        v27[1] = MEMORY[0x1E4F1CC38];
        v27[2] = *MEMORY[0x1E4FA7098];
        v27[3] = MEMORY[0x1E4F1CC38];
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
        id v14 = [v12 optionsWithDictionary:v16];

        if (v6) {
        uint64_t v17 = SBLogActivity();
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543619;
          __int16 v22 = v8;
          __int16 v23 = 2113;
          id v24 = v6;
          _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Sending open application request for %{private}@", buf, 0x16u);
        }

        uint64_t v18 = SBSCreateOpenApplicationService();
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke;
        v19[3] = &unk_1E6AFFD60;
        id v20 = v8;
        [v18 openApplication:v9 withOptions:v14 completion:v19];
      }
    }
    else
    {
      id v14 = SBLogActivity();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:]();
      }
    }
  }
  else
  {
    uint64_t v11 = SBLogActivity();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:]();
    }
  }
}

void __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogActivity();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Open application succeeded.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)activitySystemApertureSceneHandle:(id)a3 updatedContentPayloadID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SBActivitySystemApertureElementObserver_activitySystemApertureSceneHandle_updatedContentPayloadID___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__SBActivitySystemApertureElementObserver_activitySystemApertureSceneHandle_updatedContentPayloadID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) descriptor];
  uint64_t v3 = [v2 activityIdentifier];

  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = SBLogActivity();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Updated payload ID received: %{public}@", buf, 0x16u);
    }

    id v8 = [*(id *)(*(void *)(a1 + 48) + 40) objectForKeyedSubscript:v3];
    int v5 = v8;
    if (v8)
    {
      [v8 addObject:*(void *)(a1 + 40)];
    }
    else
    {
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", *(void *)(a1 + 40), 0);
      [*(id *)(*(void *)(a1 + 48) + 40) setObject:v9 forKeyedSubscript:v3];
    }
    [*(id *)(a1 + 48) _presentPendingAlertIfNecessaryForActivityIdentifier:v3];
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] No payload ID received.", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingAssertionsByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_ongoingActivities, 0);
  objc_storeStrong((id *)&self->_pendingAlerts, 0);
  objc_storeStrong((id *)&self->_activeWidgetActivitiesWithSceneHandles, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_prominenceStateByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_contentPayloadIDsByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activeItemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_elementByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_elementAssertionByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneHandleByActivityIdentifier, 0);
}

- (void)_createAndActivateElementForActivityItem:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] Activity system aperture scene cannot be created.", v2, v3, v4, v5, v6);
}

- (void)_createAndActivateElementForActivityItem:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] System aperture scene handle is already present, not creating new one", v2, v3, v4, v5, v6);
}

void __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentAlert:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 description];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "[ActivityID: %{public}@] alerting assertion cannot be requested for element %@", (uint8_t *)&v6, 0x16u);
}

- (void)_canPresentAlert:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] No element found for alerting", v2, v3, v4, v5, v6);
}

- (void)_createAndActivateSystemApertureElementWithScene:item:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] System aperture element already present, not creating new one", v2, v3, v4, v5, v6);
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_9(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] Unable to resolve container bundle identifier", v2, v3, v4, v5, v6);
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_9(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] No active element found", v2, v3, v4, v5, v6);
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_9(&dword_1D85BA000, v0, v1, "[ActivityID: %{public}@] Active element is not visible", v2, v3, v4, v5, v6);
}

void __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[ActivityID: %{public}@] Open application failed: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end