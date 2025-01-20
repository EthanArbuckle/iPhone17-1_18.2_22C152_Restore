@interface SBSuspendedUnderLockManager
- (BOOL)_shouldBeBackgroundUnderLockForScene:(id)a3 withSettings:(id)a4;
- (BOOL)_shouldPutSceneUnderLock:(id)a3;
- (BOOL)isSuspendedUnderLock;
- (SBSuspendedUnderLockManager)initWithDelegate:(id)a3 eventQueue:(id)a4;
- (SBSuspendedUnderLockManagerDelegate)delegate;
- (void)interceptUpdateForScene:(id)a3 withNewSettings:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSuspendedUnderLock:(BOOL)a3;
- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5;
@end

@implementation SBSuspendedUnderLockManager

- (void)interceptUpdateForScene:(id)a3 withNewSettings:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = objc_opt_class();
  v11 = SBSafeCast(v10, v8);
  if ([v11 isUISubclass])
  {
    v12 = [WeakRetained suspendedUnderLockManager:self sceneHandleForScene:v7];
    if (v12)
    {
      if (self->_eventQueue_suspendedUnderLock
        && [(SBSuspendedUnderLockManager *)self _shouldPutSceneUnderLock:v7])
      {
        if ([v8 isForeground]
          && [(SBSuspendedUnderLockManager *)self _shouldBeBackgroundUnderLockForScene:v7 withSettings:v8])
        {
          v13 = SBLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [v7 identifier];
            int v16 = 138412290;
            v17 = v14;
            _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Intercepted scene (%@) attempting to foreground, but it should be background - forcing to background.", (uint8_t *)&v16, 0xCu);
          }
          [v11 setForeground:0];
        }
        if ([v11 isForeground]) {
          [v11 setUnderLock:1];
        }
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"SBSuspendedUnderLockManager.m" lineNumber:140 description:@"Must have a handle for this scene if we're trying to intercept it."];
    }
  }
}

- (SBSuspendedUnderLockManager)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSuspendedUnderLockManager;
  id v8 = [(SBSuspendedUnderLockManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_eventQueue, a4);
  }

  return v9;
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void))a4;
  v9 = (void (**)(void))a5;
  if (self->_suspendedUnderLock == v6)
  {
    if (v8) {
      v8[2](v8);
    }
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    self->_suspendedUnderLock = v6;
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543362;
      v21 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Suspended under lock = %{public}@", buf, 0xCu);
    }
    uint64_t v12 = setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock__monotonicallyIncreasingEventCount++;
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"SuspendedUnderLockUpdate-%ld", v12);
    v14 = (void *)MEMORY[0x1E4F624D8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke;
    v16[3] = &unk_1E6B0ACB0;
    v16[4] = self;
    v17 = v8;
    BOOL v19 = v6;
    uint64_t v18 = v9;
    v15 = [v14 eventWithName:v13 handler:v16];
    [(FBWorkspaceEventQueue *)self->_eventQueue executeOrAppendEvent:v15];
  }
}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = *(unsigned char *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4 = [WeakRetained suspendedUnderLockManagerVisibleScenes:*(void *)(a1 + 32)];
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Main workspace suspended under lock = %{public}@", buf, 0xCu);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) sceneIfExists];
        v13 = v12;
        if (v12)
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_2;
          v29[3] = &unk_1E6B03DC8;
          v29[4] = *(void *)(a1 + 32);
          id v30 = v12;
          [v30 updateSettingsWithBlock:v29];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  if (!*(unsigned char *)(*(void *)(a1 + 32) + 25))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = WeakRetained;
    v14 = objc_msgSend(WeakRetained, "runningApplicationScenes:");
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = [*(id *)(*((void *)&v25 + 1) + 8 * j) sceneIfExists];
          if (v19)
          {
            uint64_t v20 = objc_opt_class();
            v21 = [v19 settings];
            uint64_t v22 = SBSafeCast(v20, v21);

            if ([v22 underLock]) {
              [v19 updateSettingsWithBlock:&__block_literal_global_339];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v16);
    }

    id WeakRetained = v24;
  }
  uint64_t v23 = *(void *)(a1 + 48);
  if (v23) {
    (*(void (**)(void))(v23 + 16))();
  }
}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  v5 = SBSafeCast(v4, v3);

  BOOL v6 = *(unsigned char **)(a1 + 32);
  if (v6[25] && [v6 _shouldPutSceneUnderLock:*(void *)(a1 + 40)])
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v8 settings];
    LODWORD(v7) = [v7 _shouldBeBackgroundUnderLockForScene:v8 withSettings:v9];

    uint64_t v10 = v7 ^ 1;
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v10 = 1;
  }
  [v5 setForeground:v10];
  [v5 setUnderLock:v11];
  uint64_t v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 40) identifier];
    int v14 = [v5 isForeground];
    uint64_t v15 = @"Background";
    if (v14) {
      uint64_t v15 = @"Foreground";
    }
    int v16 = 138543618;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    BOOL v19 = v15;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Mutating foregroundness due to under lock change for %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);
  }
}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setUnderLock:0];
}

- (BOOL)_shouldPutSceneUnderLock:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [WeakRetained suspendedUnderLockManager:self shouldPreventUnderLockForScene:v5];

  return (v7 & 1) == 0 && self->_eventQueue_suspendedUnderLock;
}

- (BOOL)_shouldBeBackgroundUnderLockForScene:(id)a3 withSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [WeakRetained suspendedUnderLockManager:self shouldPreventSuspendUnderLockForScene:v7 settings:v6];

  if ((v9 & 1) != 0 || !self->_eventQueue_suspendedUnderLock) {
    LOBYTE(v10) = 0;
  }
  else {
    int v10 = [v6 isIgnoringOcclusions] ^ 1;
  }

  return v10;
}

- (BOOL)isSuspendedUnderLock
{
  return self->_suspendedUnderLock;
}

- (SBSuspendedUnderLockManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSuspendedUnderLockManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end