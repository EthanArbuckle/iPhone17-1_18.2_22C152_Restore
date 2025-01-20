@interface STStatusDomainPublisherXPCServerHandle
+ (id)sharedMachServiceServerHandle;
- (BOOL)_hasStatusDomainPublisherEntitlement;
- (NSString)description;
- (STStatusDomainPublisherXPCServerHandle)init;
- (STStatusDomainPublisherXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4;
- (id)_internalQueue_dataForDomain:(int)a3 usingFallbackIfNecessary:;
- (id)_internalQueue_volatileDataForDomain:(int)a3 usingFallbackIfNecessary:;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)publishedDataForDomain:(unint64_t)a3;
- (id)publishedVolatileDataForDomain:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_internalQueue_mutateDataForDomain:(int)a3 discardingOnExit:(void *)a4 wrappingCompletion:(void *)a5 usingBlock:;
- (void)_internalQueue_publishData:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:;
- (void)_internalQueue_publishDiff:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:;
- (void)_internalQueue_publishDiffToServer:(unint64_t)a3 forDomain:(void *)a4 withChangeContext:(uint64_t)a5 replacingData:(uint64_t)a6 discardingOnExit:(void *)a7 reply:;
- (void)_internalQueue_reregisterForPublishingDomains;
- (void)_internalQueue_setupXPCConnectionIfNecessary;
- (void)dealloc;
- (void)didObserveServerLaunch:(id)a3;
- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4;
- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5;
- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4;
- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
@end

@implementation STStatusDomainPublisherXPCServerHandle

uint64_t __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  [v2 removeObject:WeakRetained];

  if (![*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) removeObjectForKey:*(void *)(a1 + 64)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

void __115__STStatusDomainPublisherXPCServerHandle_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[4];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  v4 = v2;
  v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    v7 = -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](*(void *)(a1 + 32), *(void *)(a1 + 64), 1);
    if (v7)
    {
      v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v9 = 0;
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(void *)(a1 + 32));
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiff:forDomain:withChangeContext:discardingOnExit:completion:](*(void *)(a1 + 32), v8, *(void *)(a1 + 64), v9, 1, *(void **)(a1 + 56));
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12) {
        (*(void (**)(void))(v12 + 16))();
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (!*(void *)(a1 + 56))
    {
      v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
      id v3 = *(id *)(a1 + 72);
      v4 = v2();

      v5 = STStatusDomainPublisherXPCServerInterface();
      [v4 setRemoteObjectInterface:v5];

      int v6 = STStatusDomainPublisherXPCClientInterface();
      [v4 setExportedInterface:v6];

      [v4 setExportedObject:a1];
      objc_storeStrong((id *)(a1 + 56), v4);
      objc_initWeak(&location, (id)a1);
      [v4 setInterruptionHandler:&__block_literal_global_54];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_55;
      v11[3] = &unk_1E6B630F8;
      objc_copyWeak(&v12, &location);
      [v4 setInvalidationHandler:v11];
      [v4 resume];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_56;
      v9[3] = &unk_1E6B634F8;
      objc_copyWeak(&v10, &location);
      uint64_t v7 = [v4 remoteObjectProxyWithErrorHandler:v9];
      v8 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = a2;
  [v3 addDiff:v4 forClientKey:@"sharedClient" domain:v5];
  -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](*(void *)(a1 + 48), *(void **)(a1 + 40), *(void *)(a1 + 64), *(void **)(a1 + 56), 0, *(unsigned __int8 *)(a1 + 72), v6);
}

- (void)_internalQueue_publishDiff:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v13)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke;
      v27[3] = &unk_1E6B639D0;
      v27[4] = a1;
      id v28 = v13;
      v14 = (void (**)(void))MEMORY[0x1E01644A0](v27);
    }
    else
    {
      v14 = 0;
    }
    if (STIsValidDiffForStatusDomain(v11) && ([v11 isEmpty] & 1) == 0)
    {
      v15 = @"data";
      if (a5) {
        v15 = @"volatileData";
      }
      v16 = v15;
      id v17 = *(id *)(a1 + 8);
      v18 = [v17 recordForKey:v16];

      if (a5) {
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1, a3, 1);
      }
      else {
      v19 = -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1, a3, 1);
      }
      if (v19)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2;
        v20[3] = &unk_1E6B64348;
        id v21 = v18;
        uint64_t v25 = a3;
        id v22 = v11;
        uint64_t v23 = a1;
        id v24 = v12;
        char v26 = a5;
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_mutateDataForDomain:discardingOnExit:wrappingCompletion:usingBlock:](a1, a3, a5, v14, v20);
      }
      else if (v14)
      {
        v14[2](v14);
      }
    }
    else if (v14)
    {
      v14[2](v14);
    }
  }
}

- (id)_internalQueue_volatileDataForDomain:(int)a3 usingFallbackIfNecessary:
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v6 = [*(id *)(a1 + 8) recordForKey:@"volatileData"];
    uint64_t v7 = [v6 currentDataForDomain:a2];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a3 == 0;
    }
    if (!v8)
    {
      uint64_t v7 = [v6 fallbackDataForClientKey:@"sharedClient" domain:a2];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke(uint64_t a1)
{
  isa = *(NSObject **)(a1 + 32);
  if (isa) {
    isa = isa[6].isa;
  }
  dispatch_async(isa, *(dispatch_block_t *)(a1 + 40));
}

- (void)_internalQueue_publishDiffToServer:(unint64_t)a3 forDomain:(void *)a4 withChangeContext:(uint64_t)a5 replacingData:(uint64_t)a6 discardingOnExit:(void *)a7 reply:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a4;
  id v15 = a7;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (!v15) {
      id v15 = &__block_literal_global_46;
    }
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      v16 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a6) {
          id v17 = @"volatile";
        }
        else {
          id v17 = &stru_1F335AB10;
        }
        uint64_t v18 = a6;
        if (a5) {
          v19 = @"data-replacing";
        }
        else {
          v19 = &stru_1F335AB10;
        }
        STSystemStatusDescriptionForDomain(a3);
        v20 = unint64_t v21 = a3;
        *(_DWORD *)buf = 138544386;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        uint64_t v25 = v19;
        a6 = v18;
        __int16 v26 = 2114;
        v27 = v20;
        __int16 v28 = 2114;
        id v29 = v13;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl(&dword_1D9514000, v16, OS_LOG_TYPE_DEFAULT, "Publishing %{public}@ %{public}@ diff for %{public}@ domain: %{public}@ -- context: %{public}@", buf, 0x34u);

        a3 = v21;
      }
    }
    [*(id *)(a1 + 64) publishDiff:v13 forDomain:a3 withChangeContext:v14 replacingData:a5 discardingOnExit:a6 reply:v15];
  }
}

- (void)_internalQueue_mutateDataForDomain:(int)a3 discardingOnExit:(void *)a4 wrappingCompletion:(void *)a5 usingBlock:
{
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = 16;
    if (a3) {
      uint64_t v11 = 24;
    }
    id v12 = *(id *)(a1 + v11);
    id v13 = [v12 objectForKey:a2];
    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      [v12 setObject:v13 forKey:a2];
    }
    uint64_t v29 = 0;
    __int16 v30 = (id *)&v29;
    uint64_t v31 = 0x3042000000;
    uint64_t v32 = __Block_byref_object_copy__51;
    v33 = __Block_byref_object_dispose__52;
    id v34 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    unint64_t v21 = __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke;
    id v22 = &unk_1E6B64398;
    uint64_t v23 = a1;
    id v14 = v13;
    id v24 = v14;
    v27 = &v29;
    id v15 = v12;
    id v25 = v15;
    uint64_t v28 = a2;
    id v26 = v9;
    v16 = (void *)MEMORY[0x1E01644A0](&v19);
    id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22, v23);
    objc_storeWeak(v30 + 5, v17);
    uint64_t v18 = (void *)MEMORY[0x1E01644A0](v17);
    [v14 addObject:v18];

    _Block_object_dispose(&v29, 8);
    objc_destroyWeak(&v34);
  }
  else
  {
    v16 = 0;
  }
  v10[2](v10, v16);
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__STStatusDomainPublisherXPCServerHandle_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E6B642D0;
  id v20 = v12;
  unint64_t v21 = a4;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(internalQueue, block);
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__STStatusDomainPublisherXPCServerHandle_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E6B642D0;
  id v20 = v12;
  unint64_t v21 = a4;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(internalQueue, block);
}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke;
  v13[3] = &unk_1E6B634A8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

+ (id)sharedMachServiceServerHandle
{
  if (qword_1EB5A35F8 != -1) {
    dispatch_once(&qword_1EB5A35F8, &__block_literal_global_18);
  }
  v2 = (void *)_MergedGlobals_16;

  return v2;
}

void __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(NSObject **)(v2 + 40);
  }
  else {
    id v3 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke_2;
  block[3] = &unk_1E6B64370;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v12 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  id v10 = v6;
  uint64_t v13 = v7;
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v3, block);
}

void __107__STStatusDomainPublisherXPCServerHandle_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = v2;
  uint64_t v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    uint64_t v7 = -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](*(void *)(a1 + 32), *(void *)(a1 + 64), 1);
    if (v7)
    {
      id v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v9 = 0;
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(void *)(a1 + 32));
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiff:forDomain:withChangeContext:discardingOnExit:completion:](*(void *)(a1 + 32), v8, *(void *)(a1 + 64), v9, 0, *(void **)(a1 + 56));
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12) {
        (*(void (**)(void))(v12 + 16))();
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10)
    {
      id v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
}

- (id)_internalQueue_dataForDomain:(int)a3 usingFallbackIfNecessary:
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    int v6 = [*(id *)(a1 + 8) recordForKey:@"data"];
    uint64_t v7 = [v6 currentDataForDomain:a2];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a3 == 0;
    }
    if (!v8)
    {
      uint64_t v7 = [v6 fallbackDataForClientKey:@"sharedClient" domain:a2];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v12 = v2;
  uint64_t v3 = [v12 objectForKey:a1[7]];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [v12 setObject:v3 forKey:a1[7]];
  }
  [v3 addObject:a1[5]];
  if ([v3 count] == 1)
  {
    uint64_t v4 = a1[4];
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    int v6 = [v5 recordForKey:@"data"];
    [v6 setFallbackData:a1[6] forClientKey:@"sharedClient" domain:a1[7]];
    uint64_t v7 = a1[4];
    if (v7) {
      BOOL v8 = *(void **)(v7 + 8);
    }
    else {
      BOOL v8 = 0;
    }
    id v9 = [v8 recordForKey:@"volatileData"];
    [v9 setFallbackData:a1[6] forClientKey:@"sharedClient" domain:a1[7]];
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
    uint64_t v10 = a1[4];
    if (v10) {
      id v11 = *(void **)(v10 + 64);
    }
    else {
      id v11 = 0;
    }
    [v11 registerToPublishDomain:a1[7] fallbackData:a1[6]];
  }
}

uint64_t __71__STStatusDomainPublisherXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  v0 = objc_alloc_init(STStatusDomainPublisherXPCServerHandle);
  uint64_t v1 = _MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (STStatusDomainPublisherXPCServerHandle)init
{
  uint64_t v3 = +[STServerLaunchMonitor sharedInstance];
  uint64_t v4 = [(STStatusDomainPublisherXPCServerHandle *)self initWithXPCConnectionProvider:&__block_literal_global_10 serverLaunchObservable:v3];

  return v4;
}

id __46__STStatusDomainPublisherXPCServerHandle_init__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.systemstatus.publisher" options:0];

  return v0;
}

- (STStatusDomainPublisherXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)STStatusDomainPublisherXPCServerHandle;
  BOOL v8 = [(STStatusDomainPublisherXPCServerHandle *)&v29 init];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1CAA0];
    v30[0] = @"data";
    v30[1] = @"volatileData";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v11 = [v9 orderedSetWithArray:v10];

    uint64_t v12 = [[STStatusDomainDataChangeLog alloc] initWithRecordKeys:v11];
    dataChangeLog = v8->_dataChangeLog;
    v8->_dataChangeLog = v12;

    id v14 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    dataMutationCompletionsByDomain = v8->_dataMutationCompletionsByDomain;
    v8->_dataMutationCompletionsByDomain = v14;

    unint64_t v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    volatileDataMutationCompletionsByDomain = v8->_volatileDataMutationCompletionsByDomain;
    v8->_volatileDataMutationCompletionsByDomain = v16;

    id v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    publisherClientsByDomain = v8->_publisherClientsByDomain;
    v8->_publisherClientsByDomain = v18;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v22 = BSDispatchQueueCreateSerial();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [v6 copy];
    id xpcConnectionProvider = v8->_xpcConnectionProvider;
    v8->_id xpcConnectionProvider = (id)v24;

    objc_storeStrong((id *)&v8->_serverLaunchObservable, a4);
    [(STServerLaunchObservable *)v8->_serverLaunchObservable addObserver:v8];
    uint64_t v28 = v8;
    id v26 = (id)BSLogAddStateCaptureBlockWithTitle();
  }
  return v8;
}

uint64_t __95__STStatusDomainPublisherXPCServerHandle_initWithXPCConnectionProvider_serverLaunchObservable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) description];
}

- (void)dealloc
{
  uint64_t v2 = self;
  if (self) {
    self = (STStatusDomainPublisherXPCServerHandle *)self->_serverLaunchObservable;
  }
  [(STStatusDomainPublisherXPCServerHandle *)self removeObserver:v2];
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainPublisherXPCServerHandle;
  [(STStatusDomainPublisherXPCServerHandle *)&v3 dealloc];
}

- (id)publishedDataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__STStatusDomainPublisherXPCServerHandle_publishedDataForDomain___block_invoke;
  block[3] = &unk_1E6B63458;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__STStatusDomainPublisherXPCServerHandle_publishedDataForDomain___block_invoke(uint64_t *a1)
{
  -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1[4], a1[6], 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__STStatusDomainPublisherXPCServerHandle_publishedVolatileDataForDomain___block_invoke;
  block[3] = &unk_1E6B63458;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__STStatusDomainPublisherXPCServerHandle_publishedVolatileDataForDomain___block_invoke(uint64_t *a1)
{
  -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1[4], a1[6], 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainPublisherXPCServerHandle_removePublisherClient_forDomain___block_invoke;
  block[3] = &unk_1E6B63480;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __74__STStatusDomainPublisherXPCServerHandle_removePublisherClient_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v13 = v2;
  uint64_t v3 = [v13 objectForKey:a1[6]];
  [v3 removeObject:a1[5]];
  if (![v3 count])
  {
    [v13 removeObjectForKey:a1[6]];
    uint64_t v4 = a1[4];
    if (v4) {
      id v5 = *(void **)(v4 + 64);
    }
    else {
      id v5 = 0;
    }
    [v5 unregisterFromPublishingDomain:a1[6]];
    uint64_t v6 = a1[4];
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [v7 recordForKey:@"volatileData"];
    [v8 removeAllEntriesForClientKey:@"sharedClient" domain:a1[6]];
    uint64_t v9 = a1[4];
    if (v9) {
      id v10 = *(void **)(v9 + 8);
    }
    else {
      id v10 = 0;
    }
    unint64_t v11 = [v10 recordForKey:@"data"];
    id v12 = [v11 currentDataForDomain:a1[6]];

    if (!v12) {
      [v11 removeAllEntriesForClientKey:@"sharedClient" domain:a1[6]];
    }
  }
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__STStatusDomainPublisherXPCServerHandle_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E6B642A8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(internalQueue, v21);
}

void __109__STStatusDomainPublisherXPCServerHandle_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v3 = a1[9];
  uint64_t v4 = v2;
  id v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:a1[5]];

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
    uint64_t v7 = a1[4];
    id v8 = (void *)a1[6];
    uint64_t v9 = (void *)a1[7];
    unint64_t v11 = (void *)a1[8];
    uint64_t v10 = a1[9];
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishData:forDomain:withChangeContext:discardingOnExit:completion:](v7, v8, v10, v9, 0, v11);
  }
  else
  {
    uint64_t v12 = a1[8];
    if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
      v13();
    }
  }
}

- (void)_internalQueue_publishData:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:
{
  unint64_t v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v13)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke;
      v35[3] = &unk_1E6B639D0;
      v35[4] = a1;
      id v36 = v13;
      id v14 = (void (**)(void))MEMORY[0x1E01644A0](v35);
    }
    else
    {
      id v14 = 0;
    }
    BOOL valid = STIsValidDataForStatusDomain((void *)v11);
    if (!v11 || valid)
    {
      if (v12)
      {
        if (STIsValidDataChangeContextForStatusDomain(v12)) {
          id v17 = v12;
        }
        else {
          id v17 = 0;
        }
      }
      else
      {
        id v17 = 0;
      }
      id v16 = v17;

      id v18 = @"data";
      if (a5) {
        id v18 = @"volatileData";
      }
      id v19 = v18;
      id v20 = *(id *)(a1 + 8);
      id v24 = [v20 recordForKey:v19];

      if (a5) {
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1, a3, 0);
      }
      else {
      uint64_t v21 = -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1, a3, 0);
      }
      id v22 = (void *)v21;
      BOOL v23 = v21 == 0;
      if (v11 | v21 && ([(id)v21 isEqual:v11] & 1) == 0)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2;
        v25[3] = &unk_1E6B64320;
        id v26 = v24;
        uint64_t v31 = a3;
        BOOL v32 = v11 == 0;
        BOOL v33 = v23;
        id v27 = (id)v11;
        uint64_t v28 = a1;
        id v29 = v16;
        char v34 = a5;
        id v30 = v22;
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_mutateDataForDomain:discardingOnExit:wrappingCompletion:usingBlock:](a1, a3, a5, v14, v25);
      }
      else if (v14)
      {
        v14[2](v14);
      }
    }
    else
    {
      if (v14) {
        v14[2](v14);
      }
      id v16 = v12;
    }

    id v12 = v16;
  }
}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __117__STStatusDomainPublisherXPCServerHandle_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E6B642A8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(internalQueue, v21);
}

void __117__STStatusDomainPublisherXPCServerHandle_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v3 = a1[9];
  uint64_t v4 = v2;
  id v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:a1[5]];

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
    uint64_t v7 = a1[4];
    id v8 = (void *)a1[6];
    uint64_t v9 = (void *)a1[7];
    unint64_t v11 = (void *)a1[8];
    uint64_t v10 = a1[9];
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishData:forDomain:withChangeContext:discardingOnExit:completion:](v7, v8, v10, v9, 1, v11);
  }
  else
  {
    uint64_t v12 = a1[8];
    if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
      v13();
    }
  }
}

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (STIsValidUserInteractionForStatusDomain(v6))
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E6B63480;
    void block[4] = self;
    unint64_t v10 = a4;
    id v9 = v6;
    dispatch_async(internalQueue, block);
  }
}

void __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 48)];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(NSObject **)(v6 + 48);
  }
  else {
    uint64_t v7 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke_2;
  block[3] = &unk_1E6B63480;
  id v12 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "handleUserInteraction:forDomain:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didObserveServerLaunch:(id)a3
{
  uint64_t v4 = STSystemStatusLogPublishing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_1D9514000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, resending data if necessary", (uint8_t *)v7, 2u);
  }

  if (self)
  {
    if (-[STStatusDomainPublisherXPCServerHandle _hasStatusDomainPublisherEntitlement]())
    {
      internalQueue = self->_internalQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke;
      v7[3] = &unk_1E6B633E8;
      v7[4] = self;
      dispatch_async(internalQueue, v7);
    }
    else
    {
      uint64_t v6 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_fault_impl(&dword_1D9514000, v6, OS_LOG_TYPE_FAULT, "Server connection rejected due to missing entitlement", (uint8_t *)v7, 2u);
      }
    }
  }
}

- (NSString)description
{
  return (NSString *)[(STStatusDomainPublisherXPCServerHandle *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STStatusDomainPublisherXPCServerHandle *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STStatusDomainPublisherXPCServerHandle *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STStatusDomainPublisherXPCServerHandle *)self succinctDescriptionBuilder];
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E6B635E0;
  id v7 = v5;
  id v12 = v7;
  id v13 = v4;
  uint64_t v14 = self;
  id v8 = v4;
  dispatch_sync(internalQueue, block);
  id v9 = v7;

  return v9;
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E6B63080;
  v3[4] = a1[6];
  id v4 = v1;
  [v4 appendBodySectionWithName:0 multilinePrefix:v2 block:v3];
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[1];
  }
  uint64_t v3 = v2;
  id v4 = [v3 recordForKey:@"data"];
  uint64_t v5 = [v4 domainsWithData];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v13[3] = &unk_1E6B642F8;
  id v14 = v4;
  id v15 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 enumerateWithBlock:v13];
  id v7 = [v3 recordForKey:@"volatileData"];
  id v8 = [v7 domainsWithData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v10[3] = &unk_1E6B642F8;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v9 = v7;
  [v8 enumerateWithBlock:v10];
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, unint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) currentDataForDomain:a2];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = STSystemStatusDescriptionForDomain(a2);
  id v6 = (id)[v4 appendObject:v7 withName:v5];
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, unint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) currentDataForDomain:a2];
  id v4 = NSString;
  uint64_t v5 = STSystemStatusDescriptionForDomain(a2);
  id v6 = [v4 stringWithFormat:@"%@ (volatile)", v5];

  id v7 = (id)[*(id *)(a1 + 40) appendObject:v8 withName:v6];
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke(uint64_t a1)
{
  isa = *(NSObject **)(a1 + 32);
  if (isa) {
    isa = isa[6].isa;
  }
  dispatch_async(isa, *(dispatch_block_t *)(a1 + 40));
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) forClientKey:@"sharedClient" domain:*(void *)(a1 + 72)];
  if (*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void **)(a1 + 56);
    int v6 = *(unsigned __int8 *)(a1 + 82);
    id v7 = *(id *)(a1 + 40);
    id v8 = v5;
    id v9 = v14;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 40));
      if (!v9) {
        id v9 = (void (**)(void))&__block_literal_global_38;
      }
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
      }
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        long long v10 = STSystemStatusLogPublishing();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          if (v6) {
            id v11 = @"volatile";
          }
          else {
            id v11 = &stru_1F335AB10;
          }
          id v12 = STSystemStatusDescriptionForDomain(v4);
          *(_DWORD *)buf = 138544130;
          id v16 = v11;
          __int16 v17 = 2114;
          id v18 = v12;
          __int16 v19 = 2114;
          id v20 = v7;
          __int16 v21 = 2114;
          id v22 = v8;
          _os_log_impl(&dword_1D9514000, v10, OS_LOG_TYPE_DEFAULT, "Publishing %{public}@ data for %{public}@ domain: %{public}@ -- context: %{public}@", buf, 0x2Au);
        }
      }
      [*(id *)(v3 + 64) publishData:v7 forDomain:v4 withChangeContext:v8 discardingOnExit:v6 != 0 reply:v9];
    }
  }
  else
  {
    id v13 = [*(id *)(a1 + 40) diffFromData:*(void *)(a1 + 64)];
    if ([v13 isEmpty])
    {
      if (v14) {
        v14[2]();
      }
    }
    else
    {
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](*(void *)(a1 + 48), v13, *(void *)(a1 + 72), *(void **)(a1 + 56), 1, *(unsigned __int8 *)(a1 + 82), v14);
    }
  }
}

void __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  v0 = STSystemStatusLogPublishing();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D9514000, v0, OS_LOG_TYPE_DEFAULT, "Server connection interrupted", v1, 2u);
  }
}

void __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = STSystemStatusLogPublishing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_1D9514000, v2, OS_LOG_TYPE_DEFAULT, "Server connection invalidated", (uint8_t *)v4, 2u);
  }

  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__STStatusDomainPublisherXPCServerHandle__tearDownXPCConnection__block_invoke;
    v4[3] = &unk_1E6B633E8;
    v4[4] = WeakRetained;
    dispatch_async(v3, v4);
  }
}

void __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = STSystemStatusLogPublishing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 localizedDescription];
    LODWORD(v8) = 138543362;
    *(void *)((char *)&v8 + 4) = v6;
    _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "Server proxy error, re-registering if necessary: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (WeakRetained && -[STStatusDomainPublisherXPCServerHandle _hasStatusDomainPublisherEntitlement]())
  {
    id v7 = WeakRetained[5];
    *(void *)&long long v8 = MEMORY[0x1E4F143A8];
    *((void *)&v8 + 1) = 3221225472;
    id v9 = __84__STStatusDomainPublisherXPCServerHandle__reregisterForPublishingDomainsIfNecessary__block_invoke;
    long long v10 = &unk_1E6B633E8;
    id v11 = WeakRetained;
    dispatch_async(v7, &v8);
  }
}

- (BOOL)_hasStatusDomainPublisherEntitlement
{
  v0 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
  uint64_t v1 = [v0 valueForEntitlement:@"com.apple.systemstatus.publisher.domains"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v2 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && [v1 count] != 0;
  }

  return v2;
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  -[STStatusDomainPublisherXPCServerHandle _internalQueue_reregisterForPublishingDomains](*(void *)(a1 + 32));
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[1];
  }
  id v3 = v2;
  unint64_t v4 = [v3 recordForKey:@"data"];
  uint64_t v5 = [v4 domainsWithData];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      id v7 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v4;
        _os_log_impl(&dword_1D9514000, v7, OS_LOG_TYPE_DEFAULT, "Re-sending change record: %{public}@", buf, 0xCu);
      }
    }
    long long v8 = *(void **)(a1 + 32);
    if (v8) {
      long long v8 = (void *)v8[2];
    }
    id v9 = v8;
    long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F788]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_58;
    v36[3] = &unk_1E6B643C0;
    id v11 = v10;
    id v37 = v11;
    [v9 enumerateWithBlock:v36];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = *(void **)(v12 + 64);
    }
    else {
      id v13 = 0;
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2;
    v33[3] = &unk_1E6B635E0;
    v33[4] = v12;
    id v34 = v11;
    id v35 = v9;
    id v14 = v9;
    id v15 = v11;
    [v13 replaceDataChangeRecord:v4 discardingOnExit:0 reply:v33];
  }
  id v16 = [v3 recordForKey:@"volatileData"];
  __int16 v17 = [v16 domainsWithData];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      __int16 v19 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v16;
        _os_log_impl(&dword_1D9514000, v19, OS_LOG_TYPE_DEFAULT, "Re-sending volatile change record: %{public}@", buf, 0xCu);
      }
    }
    id v20 = *(void **)(a1 + 32);
    if (v20) {
      id v20 = (void *)v20[3];
    }
    __int16 v21 = v20;
    id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F788]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_61;
    v31[3] = &unk_1E6B643C0;
    id v23 = v22;
    id v32 = v23;
    [v21 enumerateWithBlock:v31];
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24) {
      id v25 = *(void **)(v24 + 64);
    }
    else {
      id v25 = 0;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2_62;
    v28[3] = &unk_1E6B635E0;
    v28[4] = v24;
    id v29 = v23;
    id v30 = v21;
    unint64_t v26 = v21;
    id v27 = v23;
    [v25 replaceDataChangeRecord:v16 discardingOnExit:1 reply:v28];
  }
}

- (void)_internalQueue_reregisterForPublishingDomains
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1);
    id v2 = *(id *)(a1 + 32);
    id v3 = *(id *)(a1 + 8);
    unint64_t v4 = [v3 recordForKey:@"volatileData"];

    if ([v2 count])
    {
      id v5 = *(id *)(a1 + 64);
      uint64_t v6 = [v2 allKeys];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke;
      v8[3] = &unk_1E6B642F8;
      id v9 = v4;
      id v10 = v5;
      id v7 = v5;
      [v6 enumerateWithBlock:v8];
    }
  }
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)[a3 copy];
  [v4 setObject:v5 forKey:a2];
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(NSObject **)(v2 + 40);
  }
  else {
    id v3 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3;
  v4[3] = &unk_1E6B63080;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4;
  v2[3] = &unk_1E6B643E8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateWithBlock:v2];
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:a2];
  [v6 minusOrderedSet:v5];
  if (![v6 count]) {
    [*(id *)(a1 + 32) removeObjectForKey:a2];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)[a3 copy];
  [v4 setObject:v5 forKey:a2];
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(NSObject **)(v2 + 40);
  }
  else {
    id v3 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3_63;
  v4[3] = &unk_1E6B63080;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3_63(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4_64;
  v2[3] = &unk_1E6B643E8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateWithBlock:v2];
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4_64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:a2];
  [v6 minusOrderedSet:v5];
  if (![v6 count]) {
    [*(id *)(a1 + 32) removeObjectForKey:a2];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __84__STStatusDomainPublisherXPCServerHandle__reregisterForPublishingDomainsIfNecessary__block_invoke(uint64_t a1)
{
}

void __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) fallbackDataForClientKey:@"sharedClient" domain:a2];
  [*(id *)(a1 + 40) registerToPublishDomain:a2 fallbackData:v4];
}

void __64__STStatusDomainPublisherXPCServerHandle__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(v1 + 56), 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong(&self->_xpcConnectionProvider, 0);
  objc_storeStrong(&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_publisherClientsByDomain, 0);
  objc_storeStrong((id *)&self->_volatileDataMutationCompletionsByDomain, 0);
  objc_storeStrong((id *)&self->_dataMutationCompletionsByDomain, 0);

  objc_storeStrong((id *)&self->_dataChangeLog, 0);
}

@end