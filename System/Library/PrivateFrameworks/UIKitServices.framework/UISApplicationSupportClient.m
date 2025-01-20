@interface UISApplicationSupportClient
- (UISApplicationSupportClient)init;
- (id)_applicationSupportServiceEndpoint;
- (id)_remoteTarget;
- (id)applicationInitializationContextWithParameters:(id)a3;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 completion:(id)a6;
- (void)invalidate;
- (void)requestPasscodeUnlockUIWithCompletion:(id)a3;
@end

@implementation UISApplicationSupportClient

void __44__UISApplicationSupportClient__remoteTarget__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F628B0];
  id v4 = a2;
  v5 = [v3 userInteractive];
  [v4 setServiceQuality:v5];

  [v4 setInterface:*(void *)(a1 + 32)];
  [v4 setInterfaceTarget:*(void *)(a1 + 40)];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 8)];
  [v4 setInterruptionHandler:&__block_literal_global_7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke_4;
  v6[3] = &unk_1E5735058;
  v6[4] = *(void *)(a1 + 40);
  [v4 setInvalidationHandler:v6];
}

- (id)applicationInitializationContextWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  do
  {
    v5 = [(UISApplicationSupportClient *)self _remoteTarget];
    v6 = v5;
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __78__UISApplicationSupportClient_applicationInitializationContextWithParameters___block_invoke;
      v9[3] = &unk_1E57354A0;
      v9[4] = &v14;
      v9[5] = &v10;
      [v5 initializeClientWithParameters:v4 completion:v9];
    }
    else
    {
      *((unsigned char *)v11 + 24) = 0;
    }
  }
  while (*((unsigned char *)v11 + 24));
  id v7 = (id)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)_remoteTarget
{
  BSDispatchQueueAssertNot();
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke;
  block[3] = &unk_1E57350A8;
  block[4] = self;
  block[5] = &v8;
  block[6] = a2;
  dispatch_sync(queue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (UISApplicationSupportClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)UISApplicationSupportClient;
  v2 = [(UISApplicationSupportClient *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.uikit.applicationSupportClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)_applicationSupportServiceEndpoint
{
  v2 = getenv("APPLICATION_SUPPORT_SERVICE_MACH_NAME");
  if (v2) {
    [NSString stringWithUTF8String:v2];
  }
  else {
  v3 = [MEMORY[0x1E4F62888] defaultShellMachName];
  }
  dispatch_queue_t v4 = [MEMORY[0x1E4F62888] endpointForMachName:v3 service:0x1EE28E690 instance:0];

  return v4;
}

void __44__UISApplicationSupportClient__remoteTarget__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2) {
    goto LABEL_3;
  }
  v3 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:0x1EE28E690];
  dispatch_queue_t v4 = [MEMORY[0x1E4F62868] protocolForProtocol:&unk_1EE29C230];
  [v3 setServer:v4];

  id v5 = (void *)MEMORY[0x1E4F62880];
  v6 = [*(id *)(a1 + 32) _applicationSupportServiceEndpoint];
  uint64_t v7 = [v5 connectionWithEndpoint:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v7;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke_2;
  v20[3] = &unk_1E5735080;
  id v21 = v3;
  uint64_t v22 = v10;
  id v12 = v3;
  [v11 configureConnection:v20];
  [*(id *)(*(void *)(a1 + 32) + 24) activate];

  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
LABEL_3:
    uint64_t v13 = [v2 remoteTarget];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      [*(id *)(*(void *)(a1 + 32) + 24) activate];
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 24) remoteTarget];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        id v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"UISApplicationSupportClient.m", 160, @"unable to create a remote target for %@", 0x1EE28E690 object file lineNumber description];
      }
    }
  }
}

void __41__UISApplicationSupportClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_queue_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

void __78__UISApplicationSupportClient_applicationInitializationContextWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  dispatch_queue_t v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v7 = v4;
  id v6 = a3;
  LOBYTE(v4) = [v6 isBSServiceConnectionError];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__UISApplicationSupportClient_invalidate__block_invoke;
  block[3] = &unk_1E5734F98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  if (!self->_queue_invalidated)
  {
    dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"UISApplicationSupportClient.m" lineNumber:43 description:@"UISApplicationSupportClient must be invalidated before deallocation."];
  }
  v5.receiver = self;
  v5.super_class = (Class)UISApplicationSupportClient;
  [(UISApplicationSupportClient *)&v5 dealloc];
}

- (void)requestPasscodeUnlockUIWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UISApplicationSupportClient.m", 59, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(UISApplicationSupportClient *)self _remoteTarget];
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke;
    v14[3] = &unk_1E5735450;
    id v7 = &v15;
    id v15 = v5;
    id v8 = v5;
    [v6 requestPasscodeUnlockUIWithCompletion:v14];
  }
  else
  {
    v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_3;
    block[3] = &unk_1E5735478;
    id v7 = &v13;
    id v13 = v5;
    id v10 = v5;
    dispatch_async(v9, block);
  }
}

void __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_2;
  block[3] = &unk_1E5735428;
  id v8 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [*(id *)(a1 + 40) BOOLValue];
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
  uint64_t v17 = [(UISApplicationSupportClient *)self _remoteTarget];
  if (v17)
  {
    v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    id v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke;
    v26[3] = &unk_1E5735450;
    v20 = &v27;
    id v27 = v11;
    id v21 = v11;
    [v17 destroyScenesPersistentIdentifiers:v10 animationType:v18 destroySessions:v19 completion:v26];
  }
  else
  {
    v18 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_3;
    block[3] = &unk_1E5735478;
    v20 = &v25;
    id v25 = v11;
    id v22 = v11;
    dispatch_async(v18, block);
  }
}

void __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_2;
  block[3] = &unk_1E5735428;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

uint64_t __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__UISApplicationSupportClient__remoteTarget__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 activate];
}

void __44__UISApplicationSupportClient__remoteTarget__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;
}

@end