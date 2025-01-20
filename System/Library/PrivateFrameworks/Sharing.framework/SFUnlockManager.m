@interface SFUnlockManager
+ (id)sharedUnlockManager;
- (SFUnlockManager)init;
- (id)timerWithBlock:(id)a3;
- (void)cancelStateRequestTimer;
- (void)disableUnlockWithDevice:(id)a3;
- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6;
- (void)establishStashBagWithCompletionHandler:(id)a3;
- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4;
- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4;
- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation SFUnlockManager

+ (id)sharedUnlockManager
{
  if (sharedUnlockManager_onceToken != -1) {
    dispatch_once(&sharedUnlockManager_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedUnlockManager_manager;

  return v2;
}

void __38__SFUnlockManager_sharedUnlockManager__block_invoke()
{
  v0 = objc_alloc_init(SFUnlockManager);
  v1 = (void *)sharedUnlockManager_manager;
  sharedUnlockManager_manager = (uint64_t)v0;
}

- (SFUnlockManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFUnlockManager;
  v2 = [(SFUnlockManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    stateRequestTimer = v2->_stateRequestTimer;
    v2->_stateRequestTimer = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sharing.sfunlock.delegate-queue", 0);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    v13 = +[SFCompanionXPCManager sharedManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke;
    v14[3] = &unk_1E5BBD7C0;
    v14[4] = self;
    id v17 = v12;
    id v15 = v10;
    BOOL v18 = a4;
    id v16 = v11;
    [v13 unlockManagerWithCompletionHandler:v14];
  }
}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5BBD618;
    v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    v6 = [a2 remoteObjectProxyWithErrorHandler:v17];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_4;
    v15[3] = &unk_1E5BBD798;
    v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    [v6 enableUnlockWithDevice:v8 fromKey:v7 withPasscode:v9 completionHandler:v15];

    id v10 = v18;
  }
  else
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_6;
    v12[3] = &unk_1E5BBC9C8;
    id v14 = *(id *)(a1 + 56);
    id v13 = v5;
    dispatch_async(v11, v12);

    id v10 = v14;
  }
}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_5;
  block[3] = &unk_1E5BBD770;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)disableUnlockWithDevice:(id)a3
{
  id v3 = a3;
  v4 = +[SFCompanionXPCManager sharedManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SFUnlockManager_disableUnlockWithDevice___block_invoke;
  v6[3] = &unk_1E5BBD4E0;
  id v7 = v3;
  id v5 = v3;
  [v4 unlockManagerWithCompletionHandler:v6];
}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_131];
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_132;
    v8[3] = &unk_1E5BBD7E8;
    id v9 = v7;
    [v6 disableUnlockWithDevice:v9 completionHandler:v8];
  }
  else
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Error retrieving connection proxy = %@", buf, 0xCu);
    }
  }
}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Disabling unlock failed: XPC connection error = %@", (uint8_t *)&v4, 0xCu);
  }
}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_132(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEBUG, "Disabled unlock with device = %@, success = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[SFCompanionXPCManager sharedManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke;
    v9[3] = &unk_1E5BBD810;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    [v8 unlockManagerWithCompletionHandler:v9];
  }
}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5BBD618;
    v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_4;
    v13[3] = &unk_1E5BBD798;
    uint64_t v7 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    [v6 unlockEnabledWithDevice:v7 completionHandler:v13];

    id v8 = v16;
  }
  else
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_6;
    v10[3] = &unk_1E5BBC9C8;
    id v12 = *(id *)(a1 + 48);
    id v11 = v5;
    dispatch_async(v9, v10);

    id v8 = v12;
  }
}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_5;
  block[3] = &unk_1E5BBD770;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[SFCompanionXPCManager sharedManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5BBD668;
    void v6[4] = self;
    id v7 = v4;
    [v5 unlockManagerWithCompletionHandler:v6];
  }
}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E5BBD618;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E5BBD798;
    id v8 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    [v7 establishStashBagWithCompletionHandler:v14];

    id v9 = v17;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_6;
    v11[3] = &unk_1E5BBC9C8;
    id v13 = *(id *)(a1 + 40);
    id v12 = v5;
    dispatch_async(v10, v11);

    id v9 = v13;
  }
}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E5BBD770;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = +[SFCompanionXPCManager sharedManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_2;
      v13[3] = &unk_1E5BBD810;
      v13[4] = self;
      id v15 = v7;
      id v14 = v6;
      [v8 unlockManagerWithCompletionHandler:v13];

      id v9 = v15;
    }
    else
    {
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "establishStashBagWithManifest: Missing manifest data handler", buf, 2u);
      }

      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke;
      block[3] = &unk_1E5BBC658;
      id v17 = v7;
      dispatch_async(delegateQueue, block);
      id v9 = v17;
    }
  }
  else
  {
    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "establishStashBagWithManifest: Missing completion handler", buf, 2u);
    }
  }
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Missing manifest data handler";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"SFUnlockErrorDomian" code:112 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_3;
    v15[3] = &unk_1E5BBD618;
    v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_5;
    v13[3] = &unk_1E5BBD798;
    uint64_t v7 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    [v6 establishStashBagWithManifest:v7 completionHandler:v13];

    id v8 = v16;
  }
  else
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_7;
    v10[3] = &unk_1E5BBC9C8;
    id v12 = *(id *)(a1 + 48);
    id v11 = v5;
    dispatch_async(v9, v10);

    id v8 = v12;
  }
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_4;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_6;
  block[3] = &unk_1E5BBD770;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke;
    v16[3] = &unk_1E5BBC9C8;
    id v9 = v7;
    v16[4] = self;
    id v17 = v9;
    id v10 = [(SFUnlockManager *)self timerWithBlock:v16];
    stateRequestTimer = self->_stateRequestTimer;
    self->_stateRequestTimer = v10;

    dispatch_resume((dispatch_object_t)self->_stateRequestTimer);
    char v12 = +[SFCompanionXPCManager sharedManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5BBD810;
    v13[4] = self;
    id v15 = v9;
    id v14 = v6;
    [v12 unlockManagerWithCompletionHandler:v13];
  }
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"sharingd never responded";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v3 errorWithDomain:@"SFUnlockErrorDomian" code:113 userInfo:v4];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);

  return [*(id *)(a1 + 32) cancelStateRequestTimer];
}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_3;
    v18[3] = &unk_1E5BBD618;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_5;
    v16[3] = &unk_1E5BBD888;
    uint64_t v7 = *(void *)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v6 unlockStateForDevice:v7 completionHandler:v16];

    id v8 = v19;
  }
  else
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_7;
    block[3] = &unk_1E5BBD838;
    id v15 = *(id *)(a1 + 48);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    dispatch_async(v9, block);

    id v8 = v15;
  }
}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_4;
  block[3] = &unk_1E5BBD838;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 cancelStateRequestTimer];
}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_6;
  v11[3] = &unk_1E5BBD860;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 cancelStateRequestTimer];
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 cancelStateRequestTimer];
}

- (id)timerWithBlock:(id)a3
{
  delegateQueue = self->_delegateQueue;
  id v4 = a3;
  id v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, delegateQueue);
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler(v5, v4);

  return v5;
}

- (void)cancelStateRequestTimer
{
  stateRequestTimer = self->_stateRequestTimer;
  if (stateRequestTimer)
  {
    dispatch_source_cancel(stateRequestTimer);
    id v4 = self->_stateRequestTimer;
    self->_stateRequestTimer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateRequestTimer, 0);

  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end