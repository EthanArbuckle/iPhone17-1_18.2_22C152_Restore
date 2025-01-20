@interface SBApplicationSupportServiceDelegate
- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4;
- (SBApplicationSupportServiceDelegate)init;
- (void)_rebuildDefaultContext;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 forClient:(id)a6 completion:(id)a7;
- (void)requestPasscodeCheckUIForClient:(id)a3 withCompletion:(id)a4;
- (void)requestPasscodeUnlockUIForClient:(id)a3 withCompletion:(id)a4;
- (void)service:(id)a3 initializeClient:(id)a4 withCompletion:(id)a5;
@end

@implementation SBApplicationSupportServiceDelegate

- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4
{
  return +[SBApplicationSupportServiceRequestContext shouldOverrideClientInitialization:a4];
}

- (void)service:(id)a3 initializeClient:(id)a4 withCompletion:(id)a5
{
}

- (SBApplicationSupportServiceDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBApplicationSupportServiceDelegate;
  v2 = [(SBApplicationSupportServiceDelegate *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB33C0] sharedInstance];
    service = v2->_service;
    v2->_service = (UISApplicationSupportService *)v3;

    [(UISApplicationSupportService *)v2->_service setDelegate:v2];
    [(SBApplicationSupportServiceDelegate *)v2 _rebuildDefaultContext];
    [(UISApplicationSupportService *)v2->_service start];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__rebuildDefaultContext name:*MEMORY[0x1E4F43ED0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationSupportServiceSingleton.m" lineNumber:51 description:@"this object should not dealloc"];

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSupportServiceDelegate;
  [(SBApplicationSupportServiceDelegate *)&v5 dealloc];
}

- (void)_rebuildDefaultContext
{
  service = self->_service;
  objc_msgSend(MEMORY[0x1E4FB3390], "sb_embeddedDisplayDefaultContext");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UISApplicationSupportService *)service setDefaultContext:v3];
}

- (void)requestPasscodeUnlockUIForClient:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x1E4F62448] sharedInstance];
  v8 = objc_msgSend(v7, "processForPID:", objc_msgSend(v5, "pid"));

  v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received passcode unlock request from %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke;
  v12[3] = &unk_1E6AF5A78;
  id v13 = v5;
  id v14 = v6;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [(id)SBApp authenticationController];
  int v3 = [v2 isAuthenticated];

  if (v3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v5 = [(id)SBApp lockScreenService];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke_2;
    v7[3] = &unk_1E6AF5DA8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v5 requestPasscodeUnlockUIForClient:v6 options:0 description:@"UISApplicationSupportService" withCompletion:v7];
  }
}

uint64_t __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)requestPasscodeCheckUIForClient:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x1E4F62448] sharedInstance];
  id v8 = objc_msgSend(v7, "processForPID:", objc_msgSend(v5, "pid"));

  v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received passcode check request from %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke;
  v12[3] = &unk_1E6AF5A78;
  id v13 = v5;
  id v14 = v6;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [(id)SBApp authenticationController];
  int v3 = [v2 isAuthenticated];

  if (v3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v5 = [(id)SBApp lockScreenService];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke_2;
    v7[3] = &unk_1E6AF5DA8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v5 requestPasscodeCheckUIForClient:v6 options:0 description:@"UISApplicationSupportService" withCompletion:v7];
  }
}

uint64_t __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 forClient:(id)a6 completion:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = (void (**)(id, void, void *))a7;
  uint64_t v14 = [v12 pid];
  v15 = [MEMORY[0x1E4F62448] sharedInstance];
  v16 = [v15 processForPID:v14];

  uint64_t v17 = [MEMORY[0x1E4F963F8] identifierWithPid:v14];
  v18 = [MEMORY[0x1E4F963E8] handleForIdentifier:v17 error:0];
  v19 = SBLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v38 = v16;
    __int16 v39 = 2114;
    id v40 = v11;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received destroy scenes request from %{public}@ for %{public}@", buf, 0x16u);
  }

  if (!v18
    || !+[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:v18 withOptions:0])
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_8:
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28588];
        v36 = @"This functionality is not supported for this device idiom.";
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v22 = [v21 errorWithDomain:@"SBApplicationSupportService" code:1 userInfo:v20];
        v13[2](v13, 0, v22);

        goto LABEL_11;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v24 = [v23 userInterfaceIdiom];

      if (v24 != 1) {
        goto LABEL_8;
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_2;
    v25[3] = &unk_1E6B02398;
    id v26 = v12;
    id v27 = v11;
    unint64_t v29 = a4;
    BOOL v30 = a5;
    v28 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v25);

    v20 = v26;
    goto LABEL_11;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke;
  block[3] = &unk_1E6AF5FC8;
  id v32 = v16;
  id v33 = v11;
  v34 = v13;
  dispatch_async(MEMORY[0x1E4F14428], block);

  v20 = v32;
LABEL_11:
}

void __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)SBApp systemUIScenesCoordinator];
  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) identity];
    [v2 destroyScenesWithPersistentIdentifiers:*(void *)(a1 + 40) processIdentity:v3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28228];
    v9[0] = @"SpringBoard has not finished booting yet.";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    objc_super v7 = [v5 errorWithDomain:@"SBApplicationSupportService" code:1 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
  }
}

void __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 realToken];
  }
  int v3 = SBRunningApplicationForAuditToken();
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v25 = a1;
  id v5 = *(id *)(a1 + 40);
  uint64_t v28 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v28)
  {
    uint64_t v6 = *(void *)v32;
    objc_super v7 = &off_1E6AF0000;
    id v26 = v5;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v10 = [v7[125] sharedInstance];
        id v11 = [v10 sceneManagerForPersistenceIdentifier:v9];

        id v12 = [v11 existingSceneHandleForPersistenceIdentifier:v9];
        if (v12) {
          goto LABEL_9;
        }
        uint64_t v14 = [v3 _sceneIdentifierForStoredPersistenceIdentifier:v9];
        if (!v14)
        {
          id v12 = 0;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        [MEMORY[0x1E4F62A60] identityForIdentifier:v14];
        uint64_t v17 = v16 = v4;
        [v11 displayIdentity];
        v19 = v18 = v7;
        v20 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v3 sceneIdentity:v17 displayIdentity:v19];

        objc_super v7 = v18;
        id v12 = [v11 fetchOrCreateApplicationSceneHandleForRequest:v20];

        uint64_t v4 = v16;
        id v5 = v26;
        uint64_t v6 = v27;

        if (v12)
        {
LABEL_9:
          id v13 = [v12 application];

          if (v13 == v3) {
            [v4 addObject:v12];
          }
        }
LABEL_15:
      }
      uint64_t v28 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v28);
  }

  if ([v4 count])
  {
    v21 = SBApplicationSceneEntityDestructionMakeIntentFromServicesRequest(*(void *)(v25 + 56), *(unsigned __int8 *)(v25 + 64));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_3;
    v29[3] = &unk_1E6B02370;
    id v30 = *(id *)(v25 + 48);
    SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v4, v21, v29);
    v22 = v30;
  }
  else
  {
    uint64_t v23 = *(void *)(v25 + 48);
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28588];
    v38 = @"No scene handles found for provided persistence IDs.";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v22 = [v24 errorWithDomain:@"SBApplicationSupportService" code:2 userInfo:v21];
    (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v22);
  }
}

uint64_t __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end