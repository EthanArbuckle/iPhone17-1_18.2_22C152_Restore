@interface SBLegacyVOIPRefreshWakeTracker
- (BOOL)beginWakeForApplication:(id)a3;
- (RBSAssertion)appKeepAliveAssertion;
- (double)wakeDuration;
- (id)_createAssertionForAppProcessIdentity:(id)a3;
- (void)dealloc;
- (void)endWake;
- (void)setAppKeepAliveAssertion:(id)a3;
@end

@implementation SBLegacyVOIPRefreshWakeTracker

- (void)dealloc
{
  [(SBLegacyVOIPRefreshWakeTracker *)self setAppKeepAliveAssertion:0];
  v3.receiver = self;
  v3.super_class = (Class)SBLegacyVOIPRefreshWakeTracker;
  [(SBLegacyVOIPRefreshWakeTracker *)&v3 dealloc];
}

- (BOOL)beginWakeForApplication:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [v4 info];
  v6 = [v5 processIdentity];

  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: waking %{public}@.", buf, 0xCu);
  }

  v8 = +[SBWorkspace mainWorkspace];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke;
  v12[3] = &unk_1E6AF9688;
  id v13 = v4;
  v14 = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = v4;
  [v8 requestTransitionWithBuilder:v12];

  return 1;
}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:59];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_2;
  v8[3] = &unk_1E6AF57C0;
  id v9 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_3;
  v6[3] = &unk_1E6AF4A98;
  id v4 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v4;
  id v5 = (id)[v3 addCompletionHandler:v6];
}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42758]) initWithInfo:0 responder:0];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(SBApplicationSceneEntity *)v6 addActions:v5];

  [v3 setBackground:1];
  [v3 setWaitsForSceneUpdates:0];
  [v3 setEntity:v6 forLayoutRole:1];
}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v6 = [v3 _createAssertionForAppProcessIdentity:*(void *)(a1 + 40)];
    objc_msgSend(v3, "setAppKeepAliveAssertion:");
  }
  else
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: SBWorkspace rejected activation of %{public}@.", buf, 0xCu);
    }
  }
}

- (void)endWake
{
  BSDispatchQueueAssertMain();
  [(SBLegacyVOIPRefreshWakeTracker *)self setAppKeepAliveAssertion:0];
}

- (double)wakeDuration
{
  return 10.0;
}

- (void)setAppKeepAliveAssertion:(id)a3
{
  id v4 = (RBSAssertion *)a3;
  BSDispatchQueueAssertMain();
  appKeepAliveAssertion = self->_appKeepAliveAssertion;
  if (appKeepAliveAssertion != v4) {
    [(RBSAssertion *)appKeepAliveAssertion invalidate];
  }
  id v6 = self->_appKeepAliveAssertion;
  self->_appKeepAliveAssertion = v4;
}

- (id)_createAssertionForAppProcessIdentity:(id)a3
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F96478] targetWithProcessIdentity:v4];
  id v6 = [MEMORY[0x1E4F96338] grantUserInitiated];
  v22[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F96470] withReason:10003];
  v22[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F96350] grant];
  v22[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
  v22[3] = v9;
  id v10 = [MEMORY[0x1E4F96460] grantWithResistance:30];
  v22[4] = v10;
  v11 = (void *)MEMORY[0x1E4F96368];
  [(SBLegacyVOIPRefreshWakeTracker *)self wakeDuration];
  v12 = objc_msgSend(v11, "invalidateAfterInterval:");
  v22[5] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"Wake for VoIP Keep Alive" target:v5 attributes:v13];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke;
  v20[3] = &unk_1E6AF96B0;
  v20[4] = self;
  id v15 = v4;
  id v21 = v15;
  [v14 setInvalidationHandler:v20];
  id v19 = 0;
  LOBYTE(v7) = [v14 acquireWithError:&v19];
  id v16 = v19;
  if ((v7 & 1) == 0)
  {
    v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(SBLegacyVOIPRefreshWakeTracker *)(uint64_t)v15 _createAssertionForAppProcessIdentity:v17];
    }

    v14 = 0;
  }

  return v14;
}

void __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 40);
  id v10 = v6;
  id v7 = v6;
  id v8 = v5;
  BSDispatchMain();
}

uint64_t __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke_2(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 8))
  {
    uint64_t v1 = result;
    v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 48);
      id v4 = [*(id *)(v1 + 56) localizedFailureReason];
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2114;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: keep-alive assertion for %{public}@ invalidated: %{public}@", (uint8_t *)&v5, 0x16u);
    }
    return [*(id *)(v1 + 40) setAppKeepAliveAssertion:0];
  }
  return result;
}

- (RBSAssertion)appKeepAliveAssertion
{
  return self->_appKeepAliveAssertion;
}

- (void).cxx_destruct
{
}

- (void)_createAssertionForAppProcessIdentity:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a2 descriptionWithMultilinePrefix:0];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "SBLegacyVOIPRefreshWakeTracker: failed to acquire keep-alive assertion for %{public}@: %{public}@.", (uint8_t *)&v6, 0x16u);
}

@end