@interface SBSystemActionSuppressionManager
- (id)initWithSelectedAction:(id *)a1;
- (uint64_t)removeObserver:(uint64_t)result;
- (uint64_t)suppressionStatus;
- (uint64_t)systemActionInteractionDidStartWithLongPressTimeout:(uint64_t)result;
- (void)_didReduceState:(id)a3;
- (void)_queryPocketStateWithTimeout:(double)a3;
- (void)_subscribeToViewObstructionEvents;
- (void)_unsubscribeFromViewObstructionEvents;
- (void)_updateViewObstructionSubscription;
- (void)addObserver:(uint64_t)a1;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4;
@end

@implementation SBSystemActionSuppressionManager

- (id)initWithSelectedAction:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)SBSystemActionSuppressionManager;
    a1 = (id *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      v4 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
      [v4 addObserver:a1];
      objc_initWeak(&location, a1);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __59__SBSystemActionSuppressionManager_initWithSelectedAction___block_invoke;
      v16 = &unk_1E6AFBE98;
      objc_copyWeak(&v17, &location);
      v5 = (void *)MEMORY[0x1D948C7A0](&v13);
      v6 = [SBSystemActionSuppressionManagerStateReducer alloc];
      v7 = +[SBSystemActionViewObstructionState emptyState]();
      v8 = -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:]((id *)&v6->super.isa, v5, (void *)1, v7, v3, 0, objc_msgSend(v4, "backlightState", v13, v14, v15, v16), objc_msgSend(v4, "isAlwaysOnEnabled"));
      id v9 = a1[3];
      a1[3] = v8;

      if ([MEMORY[0x1E4F22268] isPocketStateAvailable])
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F22268]);
        id v11 = a1[2];
        a1[2] = v10;

        [a1[2] setDelegate:a1];
      }
      [a1 _updateViewObstructionSubscription];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __59__SBSystemActionSuppressionManager_initWithSelectedAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReduceState:v3];
}

- (uint64_t)suppressionStatus
{
  if (a1)
  {
    -[SBHomeScreenConfigurationServer listener](a1[4]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)systemActionInteractionDidStartWithLongPressTimeout:(uint64_t)result
{
  if (result)
  {
    id v3 = (BOOL *)result;
    if ((os_variant_has_internal_diagnostics() & 1) != 0
      || (result = -[SBCameraHardwareButton shouldUsePocketStateDetection](v3[4]), result))
    {
      double v4 = a2 + -0.1;
      if (a2 + -0.1 < 0.1) {
        double v4 = 0.1;
      }
      return [v3 _queryPocketStateWithTimeout:v4];
    }
  }
  return result;
}

- (void)addObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      double v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 48) removeObject:a2];
  }
  return result;
}

- (void)_subscribeToViewObstructionEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_subscribedToViewObstructionEvents && [MEMORY[0x1E4F22298] isAvailable])
  {
    id v3 = SBLogSystemActionSuppression();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) subscribing to VO", buf, 0xCu);
    }

    suppressionManager = self->_suppressionManager;
    if (!suppressionManager)
    {
      uint64_t v5 = (CMSuppressionManager *)[objc_alloc(MEMORY[0x1E4F22298]) initWithClientType:3];
      v6 = self->_suppressionManager;
      self->_suppressionManager = v5;

      suppressionManager = self->_suppressionManager;
    }
    self->_subscribedToViewObstructionEvents = 1;
    [(CMSuppressionManager *)suppressionManager startService];
    id v7 = self->_suppressionManager;
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__SBSystemActionSuppressionManager__subscribeToViewObstructionEvents__block_invoke;
    v9[3] = &unk_1E6AFBEC0;
    v9[4] = self;
    [(CMSuppressionManager *)v7 startSuppressionUpdatesToQueue:v8 withOptions:1 withHandler:v9];
  }
}

void __69__SBSystemActionSuppressionManager__subscribeToViewObstructionEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SBLogSystemActionSuppression();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [v6 localizedDescription];
      v15 = [v6 localizedFailureReason];
      int v16 = 138544130;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v5;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_fault_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_FAULT, "(%{public}@) suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
    id v11 = +[SBSystemActionViewObstructionState stateWithError:]((uint64_t)SBSystemActionViewObstructionState, v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression event: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
    id v11 = +[SBSystemActionViewObstructionState stateWithEvent:]((uint64_t)SBSystemActionViewObstructionState, v5);
  }
  uint64_t v12 = v11;
  -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:](v10, v11);
}

- (void)_unsubscribeFromViewObstructionEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_subscribedToViewObstructionEvents)
  {
    id v3 = SBLogSystemActionSuppression();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) unsubscribing from VO", (uint8_t *)&v6, 0xCu);
    }

    [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
    [(CMSuppressionManager *)self->_suppressionManager stopService];
    self->_subscribedToViewObstructionEvents = 0;
    stateReducer = self->_stateReducer;
    id v5 = +[SBSystemActionViewObstructionState emptyState]();
    -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:]((uint64_t)stateReducer, v5);
  }
}

- (void)_updateViewObstructionSubscription
{
  if (-[_SBLoadApplicationResult isSuccess]((BOOL)self->_state))
  {
    [(SBSystemActionSuppressionManager *)self _subscribeToViewObstructionEvents];
  }
  else
  {
    [(SBSystemActionSuppressionManager *)self _unsubscribeFromViewObstructionEvents];
  }
}

- (void)_queryPocketStateWithTimeout:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F22268] isPocketStateAvailable])
  {
    id v5 = SBLogSystemActionSuppression();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) querying pocket state", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    BSContinuousMachTimeNow();
    id v7 = v6;
    pocketStateManager = self->_pocketStateManager;
    id v9 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke;
    v10[3] = &unk_1E6AFBEE8;
    objc_copyWeak(v11, (id *)buf);
    v11[1] = v7;
    [(CMPocketStateManager *)pocketStateManager queryStateOntoQueue:MEMORY[0x1E4F14428] andMonitorFor:v10 withTimeout:10.0 andHandler:a3];

    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
}

void __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = SBLogSystemActionSuppression();
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke_cold_1((uint64_t)WeakRetained, v5, v8);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = SBNSStringFromCMPocketStateType(a2);
        int v12 = 138543618;
        uint64_t v13 = WeakRetained;
        __int16 v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) pocket state queried: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      -[SBSystemActionSuppressionManagerStateReducer setPocketState:](WeakRetained[3], a2);
    }
    uint64_t v10 = +[SBSystemActionAnalyticsTracker sharedTracker]();
    BSContinuousMachTimeNow();
    -[SBSystemActionAnalyticsTracker trackPocketStateQueryWithExecutionTime:error:]((uint64_t)v10, v5, v11 - *(double *)(a1 + 40));
  }
}

- (void)_didReduceState:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    int v6 = self->_state;
    objc_storeStrong((id *)&self->_state, a3);
    [(SBSystemActionSuppressionManager *)self _updateViewObstructionSubscription];
    id v7 = -[SBHomeScreenConfigurationServer listener]((uint64_t)self->_state);
    uint64_t v8 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);
    char v9 = BSEqualObjects();

    if ((v9 & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
            uint64_t v16 = -[SBHomeScreenConfigurationServer listener]((uint64_t)self->_state);
            [v15 systemActionSuppressionManager:self didUpdateSuppressionStatus:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SBSystemActionSuppressionManager_pocketStateManager_didUpdateState___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __70__SBSystemActionSuppressionManager_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSystemActionSuppression();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = SBNSStringFromCMPocketStateType(*(void *)(a1 + 40));
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) pocket state change: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  -[SBSystemActionSuppressionManagerStateReducer setPocketState:](*(void **)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 40));
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
}

- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateReducer, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

void __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a2 localizedDescription];
  __int16 v7 = [a2 localizedFailureReason];
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "(%{public}@) failed to query pocket state - error:%{public}@ reason:%{public}@", (uint8_t *)&v8, 0x20u);
}

@end