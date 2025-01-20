@interface SBSceneRenderingEnvironmentManager
- (NSString)description;
- (SBSceneRenderingEnvironmentManager)init;
- (SBSceneRenderingEnvironmentManager)initWithBKSInterface:(id)a3;
- (id)registerParticipantForSceneWithIdentifier:(id)a3 displayConfiguration:(id)a4;
- (void)_cleanupForPotentiallyInvalidAssertionForSanitizedDisplayUUID:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
@end

@implementation SBSceneRenderingEnvironmentManager

- (SBSceneRenderingEnvironmentManager)init
{
  v3 = objc_alloc_init(SBSceneRenderingEnviromentManagerDefaultBKSInterface);
  v4 = [(SBSceneRenderingEnvironmentManager *)self initWithBKSInterface:v3];

  return v4;
}

- (SBSceneRenderingEnvironmentManager)initWithBKSInterface:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentManager.m", 50, @"Invalid parameter not satisfying: %@", @"bksInterface" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBSceneRenderingEnvironmentManager;
  v7 = [(SBSceneRenderingEnvironmentManager *)&v20 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bksInterface, a3);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayUUIDToAssertion = v8->_displayUUIDToAssertion;
    v8->_displayUUIDToAssertion = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayUUIDToIdentifier = v8->_displayUUIDToIdentifier;
    v8->_displayUUIDToIdentifier = v11;

    objc_initWeak(&location, v8);
    id v13 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v18, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
    stateDumpHandle = v8->_stateDumpHandle;
    v8->_stateDumpHandle = (BSInvalidatable *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __59__SBSceneRenderingEnvironmentManager_initWithBKSInterface___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E4F4F720];
    v3 = [MEMORY[0x1E4F4F728] debugStyle];
    v4 = [v2 descriptionForRootObject:WeakRetained withStyle:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_displayUUIDToAssertion enumerateKeysAndObjectsUsingBlock:&__block_literal_global_248];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneRenderingEnvironmentManager;
  [(SBSceneRenderingEnvironmentManager *)&v3 dealloc];
}

uint64_t __45__SBSceneRenderingEnvironmentManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (id)registerParticipantForSceneWithIdentifier:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentManager.m", 79, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentManager.m", 80, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

LABEL_3:
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v31 = [v8 hardwareIdentifier];
  uint64_t v9 = [v8 hardwareIdentifier];
  v10 = (void *)v9;
  v11 = @"main";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = [(NSMutableDictionary *)self->_displayUUIDToAssertion objectForKey:v12];
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = SBLogShellScene();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v14 UUIDString];
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      __int16 v39 = 2114;
      v40 = v12;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Generated scene rendering environment identifier %{public}@ for displayUUID %{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v17 = (void *)MEMORY[0x1E4F4F6E8];
    id v18 = [NSString stringWithFormat:@"SBSceneRenderingEnvironmentManager-%@", v12];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke;
    v32[3] = &unk_1E6AFFAC0;
    objc_copyWeak(&v36, (id *)buf);
    id v19 = v14;
    id v33 = v19;
    id v34 = v31;
    objc_super v20 = v12;
    v35 = v20;
    id v13 = [v17 assertionWithIdentifier:v18 stateDidChangeHandler:v32];

    v21 = SBLogShellScene();
    [v13 setLog:v21];

    [(NSMutableDictionary *)self->_displayUUIDToIdentifier setObject:v19 forKey:v20];
    [(NSMutableDictionary *)self->_displayUUIDToAssertion setObject:v13 forKey:v20];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  v22 = [v13 acquireForReason:v6];
  v23 = [(NSMutableDictionary *)self->_displayUUIDToIdentifier objectForKey:v12];
  v24 = [v23 UUIDString];

  if (!v24)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentManager.m", 118, @"environment identifier is nil for sanitizedDisplayUUID %@ existing identifiers: %@", v12, self->_displayUUIDToIdentifier object file lineNumber description];
  }
  v25 = [[SBSceneRenderingEnvironmentParticipant alloc] initWithRenderingEnvironmentIdentifier:v24 assertion:v22];

  return v25;
}

void __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a2 isActive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v4 = (void *)WeakRetained[1];
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      v10 = WeakRetained;
      id v6 = [*(id *)(a1 + 32) UUIDString];
      id v7 = [v5 setWithObject:v6];
      [v4 setDisplayIdentifiers:v7 forDisplayUUID:*(void *)(a1 + 40)];

      id WeakRetained = v10;
    }
  }
  else
  {
    v8 = SBLogShellScene();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup of scene rendering environments for displayUUID %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke_31;
    block[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
  }
}

void __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _cleanupForPotentiallyInvalidAssertionForSanitizedDisplayUUID:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_cleanupForPotentiallyInvalidAssertionForSanitizedDisplayUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(NSMutableDictionary *)self->_displayUUIDToAssertion objectForKey:v4];
  char v6 = [v5 isActive];
  id v7 = SBLogShellScene();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "No cleanup of scene rendering environment for displayUUID %{public}@ necessary - it is still active", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up scene rendering environment for displayUUID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = v4;
    if ([@"main" isEqualToString:v9]) {
      v10 = 0;
    }
    else {
      v10 = v9;
    }
    id v7 = v10;

    [(SBSceneRenderingEnvironmentManagerBKSInterface *)self->_bksInterface setDisplayIdentifiers:0 forDisplayUUID:v7];
    [v5 invalidate];
    [(NSMutableDictionary *)self->_displayUUIDToAssertion removeObjectForKey:v9];
    [(NSMutableDictionary *)self->_displayUUIDToIdentifier removeObjectForKey:v9];
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBSceneRenderingEnvironmentManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __64__SBSceneRenderingEnvironmentManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"displayUUIDToAssertion"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayUUIDToIdentifier"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_displayUUIDToIdentifier, 0);
  objc_storeStrong((id *)&self->_displayUUIDToAssertion, 0);
  objc_storeStrong((id *)&self->_bksInterface, 0);
}

@end