@interface SBDashBoardIdleTimerProvider
- (BOOL)isDisabledAssertionActiveForReason:(id)a3;
- (BOOL)isIdleTimerEnabled;
- (SBDashBoardIdleTimerProvider)initWithDelegate:(id)a3;
- (SBDashBoardIdleTimerProviderDelegate)delegate;
- (SBIdleTimer)idleTimer;
- (id)_copyIdleTimerBehaviorForBehaviorProvider:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)effectiveIdleTimerBehavior;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_proposeEffectiveIdleTimerBehaviorForReason:(id)a3;
- (void)_proposeIdleTimerBehavior:(id)a3 forReason:(id)a4;
- (void)addDisabledIdleTimerAssertionReason:(id)a3;
- (void)dealloc;
- (void)idleTimerDidExpire:(id)a3;
- (void)idleTimerDidRefresh:(id)a3;
- (void)idleTimerDidWarn:(id)a3;
- (void)removeDisabledIdleTimerAssertionReason:(id)a3;
- (void)resetIdleTimer;
- (void)setDelegate:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)updateIdleTimerWithIdleDimProvider:(id)a3 reason:(id)a4;
@end

@implementation SBDashBoardIdleTimerProvider

- (SBDashBoardIdleTimerProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDashBoardIdleTimerProvider;
  v5 = [(SBDashBoardIdleTimerProvider *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    idleTimer = v6->_idleTimer;
    v6->_idleTimer = 0;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disabledIdleTimerAssertions = v6->_disabledIdleTimerAssertions;
    v6->_disabledIdleTimerAssertions = v8;

    objc_initWeak(&location, v6);
    id v10 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v14, &location);
    uint64_t v11 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v6->_stateCaptureAssertion;
    v6->_stateCaptureAssertion = (BSInvalidatable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __49__SBDashBoardIdleTimerProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionBuilderWithMultilinePrefix:&stru_1F3084718];
  v3 = [v2 build];

  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardIdleTimerProvider;
  [(SBDashBoardIdleTimerProvider *)&v3 dealloc];
}

- (void)setIdleTimer:(id)a3
{
  id v4 = (SBIdleTimer *)a3;
  [(SBIdleTimer *)self->_idleTimer removeIdleTimerObserver:self];
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;
  v6 = v4;

  [(SBIdleTimer *)v6 addIdleTimerObserver:self];
}

- (void)resetIdleTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained idleTimerWillRefresh:self];

  idleTimer = self->_idleTimer;
  [(SBIdleTimer *)idleTimer reset];
}

- (void)updateIdleTimerWithIdleDimProvider:(id)a3 reason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  p_idleTimerProvider = &self->_idleTimerProvider;
  uint64_t v10 = [(SBFIdleTimerBehaviorProviding *)self->_idleTimerProvider idleTimerDuration];
  if (v10 != [v7 idleTimerDuration]
    || (uint64_t v11 = [(SBFIdleTimerBehaviorProviding *)*p_idleTimerProvider idleWarnMode],
        v11 != [v7 idleWarnMode])
    || (uint64_t v12 = [(SBFIdleTimerBehaviorProviding *)*p_idleTimerProvider idleTimerMode],
        v12 != [v7 idleTimerMode]))
  {
    objc_storeStrong((id *)&self->_idleTimerProvider, a3);
    BOOL v13 = [(SBDashBoardIdleTimerProvider *)self isIdleTimerEnabled];
    id v14 = SBLogIdleTimer();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        objc_super v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        int v20 = 138543618;
        v21 = v17;
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating idle timer for reason: %{public}@", (uint8_t *)&v20, 0x16u);
      }
      id v14 = [(SBDashBoardIdleTimerProvider *)self _copyIdleTimerBehaviorForBehaviorProvider:v7];
      [(SBDashBoardIdleTimerProvider *)self _proposeIdleTimerBehavior:v14 forReason:v8];
    }
    else if (v15)
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      int v20 = 138543618;
      v21 = v19;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating idle timer for reason: %{public}@ (but not active)", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (id)effectiveIdleTimerBehavior
{
  if ([(SBDashBoardIdleTimerProvider *)self isIdleTimerEnabled] && self->_idleTimerProvider)
  {
    id v3 = -[SBDashBoardIdleTimerProvider _copyIdleTimerBehaviorForBehaviorProvider:](self, "_copyIdleTimerBehaviorForBehaviorProvider:");
  }
  else
  {
    id v3 = +[SBIdleTimerBehavior disabledBehavior];
  }
  return v3;
}

- (void)addDisabledIdleTimerAssertionReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_disabledIdleTimerAssertions containsObject:v4])
  {
    v5 = SBLogIdleTimer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v14 = 138543618;
      BOOL v15 = v7;
      __int16 v16 = 2114;
      id v17 = v4;
      id v8 = "%{public}@ - Skipping add disabled reason: %{public}@ as it already exist in _disabledIdleTimerAssertion";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v9 = [(NSMutableSet *)self->_disabledIdleTimerAssertions count];
  [(NSMutableSet *)self->_disabledIdleTimerAssertions addObject:v4];
  v5 = SBLogIdleTimer();
  BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v11);
      int v14 = 138543618;
      BOOL v15 = v7;
      __int16 v16 = 2114;
      id v17 = v4;
      id v8 = "%{public}@ - Added idle timer disabled reason: %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v10)
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    int v14 = 138543618;
    BOOL v15 = v13;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Disabling idle timer for reason: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  [(SBDashBoardIdleTimerProvider *)self _proposeEffectiveIdleTimerBehaviorForReason:v4];
LABEL_9:
}

- (void)removeDisabledIdleTimerAssertionReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_disabledIdleTimerAssertions containsObject:v4] & 1) == 0)
  {
    id v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v15 = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2114;
      id v18 = v4;
      BOOL v13 = "%{public}@ - Skipping remove disabled reason: %{public}@ as it doesn't exist in _disabledIdleTimerAssertions";
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v5 = [(NSMutableSet *)self->_disabledIdleTimerAssertions count];
  [(NSMutableSet *)self->_disabledIdleTimerAssertions removeObject:v4];
  uint64_t v6 = [(NSMutableSet *)self->_disabledIdleTimerAssertions count];
  id v7 = SBLogIdleTimer();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v8)
    {
      int v14 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v14);
      int v15 = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2114;
      id v18 = v4;
      BOOL v13 = "%{public}@ - Removed idle timer disabled reason: %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v9);
    int v15 = 138543618;
    __int16 v16 = v10;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Reenabling idle timer as last reason removed: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  [(SBDashBoardIdleTimerProvider *)self _proposeEffectiveIdleTimerBehaviorForReason:v4];
LABEL_13:
}

- (BOOL)isDisabledAssertionActiveForReason:(id)a3
{
  return [(NSMutableSet *)self->_disabledIdleTimerAssertions containsObject:a3];
}

- (BOOL)isIdleTimerEnabled
{
  return [(NSMutableSet *)self->_disabledIdleTimerAssertions count] == 0;
}

- (void)idleTimerDidRefresh:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (SBIdleTimer *)a3;
  if ([(SBDashBoardIdleTimerProvider *)self isIdleTimerEnabled] && self->_idleTimer == v4)
  {
    uint64_t v5 = SBLogIdleTimer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543618;
      BOOL v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer refreshed %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained idleTimerDidRefresh:self];
  }
}

- (void)idleTimerDidExpire:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (SBIdleTimer *)a3;
  if ([(SBDashBoardIdleTimerProvider *)self isIdleTimerEnabled] && self->_idleTimer == v4)
  {
    uint64_t v5 = SBLogIdleTimer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543618;
      BOOL v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer expired %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained idleTimerDidExpire:self];
  }
}

- (void)idleTimerDidWarn:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (SBIdleTimer *)a3;
  if ([(SBDashBoardIdleTimerProvider *)self isIdleTimerEnabled] && self->_idleTimer == v4)
  {
    uint64_t v5 = SBLogIdleTimer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543618;
      BOOL v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer warned %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained idleTimerDidWarn:self];
  }
}

- (id)succinctDescription
{
  v2 = [(SBDashBoardIdleTimerProvider *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBDashBoardIdleTimerProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBDashBoardIdleTimerProvider *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBDashBoardIdleTimerProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __70__SBDashBoardIdleTimerProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  [*(id *)(a1 + 40) appendArraySection:v3 withName:@"DisabledAssertions" skipIfEmpty:0];
  id v2 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 8) withName:@"IdleTimer"];
}

- (id)_copyIdleTimerBehaviorForBehaviorProvider:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_proposeEffectiveIdleTimerBehaviorForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDashBoardIdleTimerProvider *)self effectiveIdleTimerBehavior];
  [(SBDashBoardIdleTimerProvider *)self _proposeIdleTimerBehavior:v5 forReason:v4];
}

- (void)_proposeIdleTimerBehavior:(id)a3 forReason:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [WeakRetained dashBoardIdleTimerProvider:self didProposeBehavior:v8 reason:v7];

  [(SBDashBoardIdleTimerProvider *)self setIdleTimer:v10];
}

- (SBDashBoardIdleTimerProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDashBoardIdleTimerProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBIdleTimer)idleTimer
{
  return self->_idleTimer;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disabledIdleTimerAssertions, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerProvider, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
}

@end