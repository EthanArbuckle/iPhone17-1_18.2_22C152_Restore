@interface SBKeyboardFocusService
- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 sceneResolver:(id)a4 serviceListenerFactory:(id)a5;
- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 systemUIScenesCoordinator:(id)a4;
- (void)_lock_updateExternalSceneIdentities;
- (void)client:(id)a3 deferAdditionalEnvironments:(id)a4 whenSceneHasKeyboardFocus:(id)a5 pid:(id)a6;
- (void)client:(id)a3 removeKeyboardFocusFromSceneIdentity:(id)a4 pid:(id)a5;
- (void)client:(id)a3 requestKeyboardFocusForSceneIdentity:(id)a4 pid:(id)a5 completion:(id)a6;
- (void)client:(id)a3 setExternalSceneIdentities:(id)a4;
- (void)client:(id)a3 stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a4 pid:(id)a5;
- (void)clientDidDisconnect:(id)a3;
@end

@implementation SBKeyboardFocusService

- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 systemUIScenesCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(_SBKeyboardServiceSceneResolver);
  [(_SBKeyboardServiceSceneResolver *)v8 setSystemUIScenesCoordinator:v6];

  v9 = objc_alloc_init(SBKeyboardServiceConnectionListenerFactory);
  v10 = [(SBKeyboardFocusService *)self initWithKeyboardFocusController:v7 sceneResolver:v8 serviceListenerFactory:v9];

  return v10;
}

- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 sceneResolver:(id)a4 serviceListenerFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBKeyboardFocusService;
  v12 = [(SBKeyboardFocusService *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyboardFocusController, a3);
    objc_storeStrong((id *)&v13->_sceneResolver, a4);
    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v13->_serviceQueue;
    v13->_serviceQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [v11 newKeyboardServiceListenerForDelegate:v13 serviceQueue:v13->_serviceQueue];
    serviceConnectionListener = v13->_serviceConnectionListener;
    v13->_serviceConnectionListener = (_SBKeyboardServiceConnectionListening *)v16;

    [(_SBKeyboardServiceConnectionListening *)v13->_serviceConnectionListener activate];
  }

  return v13;
}

- (void)client:(id)a3 requestKeyboardFocusForSceneIdentity:(id)a4 pid:(id)a5 completion:(id)a6
{
  id v8 = a4;
  id v12 = a5;
  id v13 = a6;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  BSDispatchMain();
}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  v3 = SBLogKeyboardFocus();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 48) intValue];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 1024;
      int v20 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: requestKeyboardFocusForSceneIdentity %{public}@ pid: %i", buf, 0x12u);
    }

    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 32);
      *(void *)(v9 + 32) = v8;

      id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    [v7 addObject:v2];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_4;
    v13[3] = &unk_1E6AF4DB0;
    v13[4] = v11;
    id v14 = v2;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    [v12 userFocusRequestForScene:v14 reason:@"SBKeyboardFocusService" completion:v13];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_4(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 32) containsObject:a1[5]] & 1) == 0)
  {
    v4 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[6];
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: finally got a callback for userFocusRequestedForScene %{public}@, but we are no longer tracking this scene, so updating keyboard focus controller once more", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1[4] + 8) removeKeyboardFocusFromScene:a1[5]];
  }
  uint64_t v6 = a1[7];
  id v7 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
}

- (void)client:(id)a3 removeKeyboardFocusFromSceneIdentity:(id)a4 pid:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  if (v2)
  {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:v2];
    v4 = SBLogKeyboardFocus();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = [*(id *)(a1 + 48) intValue];
        int v9 = 138543618;
        uint64_t v10 = v6;
        __int16 v11 = 1024;
        int v12 = v7;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity %{public}@ pid: %i", (uint8_t *)&v9, 0x12u);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) removeKeyboardFocusFromScene:v2];
      [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v2];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_1();
    }
  }
}

- (void)client:(id)a3 deferAdditionalEnvironments:(id)a4 whenSceneHasKeyboardFocus:(id)a5 pid:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = v10;
  id v11 = v9;
  id v12 = v10;
  id v13 = v16;
  id v14 = v15;
  BSDispatchMain();
}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  if (v2)
  {
    char v3 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 56);
    id v24 = 0;
    int v7 = [v3 unarchivedDictionaryWithKeysOfClass:v4 objectsOfClass:v5 fromData:v6 error:&v24];
    id v8 = v24;
    if (v8)
    {
      id v9 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      id v9 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", *(void *)(a1 + 40), [*(id *)(a1 + 48) intValue]);
      id v16 = [*(id *)(*(void *)(a1 + 32) + 8) deferAdditionalEnvironments:v7 whenTargetHasKeyboardFocus:v9];
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
      v17 = *(void **)(*(void *)(a1 + 32) + 40);
      if (!v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        v17 = *(void **)(*(void *)(a1 + 32) + 40);
      }
      id v21 = [v17 objectForKey:*(void *)(a1 + 64)];
      if (!v21)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [*(id *)(*(void *)(a1 + 32) + 40) setObject:v21 forKey:*(void *)(a1 + 64)];
      }
      v22 = [v21 objectForKey:v9];
      v23 = v22;
      if (v22) {
        [v22 invalidate];
      }
      [v21 setObject:v16 forKey:v9];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
    }
  }
  else
  {
    id v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_1();
    }
  }
}

- (void)client:(id)a3 setExternalSceneIdentities:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_externalSceneIdentitiesByClient)
  {
    int v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_externalSceneIdentitiesByClient = self->_lock_externalSceneIdentitiesByClient;
    self->_lock_externalSceneIdentitiesByClient = v7;
  }
  uint64_t v9 = [v6 count];
  uint64_t v10 = self->_lock_externalSceneIdentitiesByClient;
  if (v9) {
    [(NSMapTable *)v10 setObject:v6 forKey:v11];
  }
  else {
    [(NSMapTable *)v10 removeObjectForKey:v11];
  }
  [(SBKeyboardFocusService *)self _lock_updateExternalSceneIdentities];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)client:(id)a3 stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a4 pid:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v8, [a5 intValue]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = [(NSMapTable *)self->_lock_additionalDeferringRulesByClient objectForKey:v9];

  uint64_t v12 = [v11 objectForKey:v13];
  if (v12)
  {
    [v11 removeObjectForKey:v13];
    [v12 invalidate];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)clientDidDisconnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = -[NSMapTable objectForKey:](self->_lock_additionalDeferringRulesByClient, "objectForKey:", v4, 0);
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMapTable *)self->_lock_additionalDeferringRulesByClient removeObjectForKey:v4];
  [(NSMapTable *)self->_lock_externalSceneIdentitiesByClient removeObjectForKey:v4];
  [(SBKeyboardFocusService *)self _lock_updateExternalSceneIdentities];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_updateExternalSceneIdentities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMapTable *)self->_lock_externalSceneIdentitiesByClient objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 unionSet:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v3;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: external scene identities are now: %{public}@", buf, 0xCu);
  }

  [(SBKeyboardFocusControlling *)self->_keyboardFocusController setExternalSceneIdentities:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_lock_externalSceneIdentitiesByClient, 0);
  objc_storeStrong((id *)&self->_lock_additionalDeferringRulesByClient, 0);
  objc_storeStrong((id *)&self->_focusRequestedScenes, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
  objc_storeStrong((id *)&self->_sceneResolver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "SBKeyboardFocusService: requestKeyboardFocusForSceneIdentity failed to find scene %{public}@", v2, v3, v4, v5, v6);
}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity failed to find scene %{public}@", v2, v3, v4, v5, v6);
}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity called for non-focus-requested scene %{public}@", v2, v3, v4, v5, v6);
}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "SBKeyboardFocusService: deferAdditionalEnvironments: failed to find scene %{public}@", v2, v3, v4, v5, v6);
}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end