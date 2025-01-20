@interface STStatusDomainPublisherXPCClientHandle
- (STStatusDomainPublisherXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4;
- (dispatch_queue_t)_internalQueue_fallbackDataForDomain:(dispatch_queue_t *)a1;
- (void)_internalQueue_unregisterFromPublishingDomain:(uint64_t)a1;
- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4;
- (void)publishData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 discardingOnExit:(BOOL)a6 reply:(id)a7;
- (void)publishDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 replacingData:(BOOL)a6 discardingOnExit:(BOOL)a7 reply:(id)a8;
- (void)registerToPublishDomain:(unint64_t)a3 fallbackData:(id)a4;
- (void)replaceDataChangeRecord:(id)a3 discardingOnExit:(BOOL)a4 reply:(id)a5;
- (void)unregisterFromPublishingDomain:(unint64_t)a3;
@end

@implementation STStatusDomainPublisherXPCClientHandle

void __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[7];
  }
  v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void *)(a1 + 64);
  v5 = v2;
  v6 = [v3 numberWithUnsignedInteger:v4];
  LODWORD(v4) = [v5 containsObject:v6];

  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 64);
    if (v7)
    {
      if (*(unsigned char *)(a1 + 72)) {
        uint64_t v9 = 40;
      }
      else {
        uint64_t v9 = 32;
      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 16));
      v10 = [*(id *)(v7 + v9) objectForKey:v8];
      if (v10)
      {
LABEL_11:
        id v29 = v10;
        [v10 applyDiff:*(void *)(a1 + 40)];
        if (*(unsigned char *)(a1 + 73))
        {
          v13 = (void *)[v29 copyWithZone:0];
          uint64_t v14 = *(void *)(a1 + 32);
          if (*(unsigned char *)(a1 + 72))
          {
            if (v14)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v14 + 8));
              uint64_t v16 = *(void *)(a1 + 32);
            }
            else
            {
              uint64_t v16 = 0;
              id WeakRetained = 0;
            }
            [WeakRetained publishVolatileData:v13 forPublisherClient:v16 domain:*(void *)(a1 + 64) withChangeContext:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
          }
          else
          {
            if (v14)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v14 + 8));
              uint64_t v24 = *(void *)(a1 + 32);
            }
            else
            {
              uint64_t v24 = 0;
              id WeakRetained = 0;
            }
            [WeakRetained publishData:v13 forPublisherClient:v24 domain:*(void *)(a1 + 64) withChangeContext:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
          }
        }
        else
        {
          uint64_t v19 = *(void *)(a1 + 32);
          if (*(unsigned char *)(a1 + 72))
          {
            if (v19)
            {
              id v20 = objc_loadWeakRetained((id *)(v19 + 8));
              uint64_t v21 = *(void *)(a1 + 32);
            }
            else
            {
              uint64_t v21 = 0;
              id v20 = 0;
            }
            uint64_t v22 = *(void *)(a1 + 64);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_2;
            v33[3] = &unk_1E6AD2990;
            id v34 = *(id *)(a1 + 48);
            id v35 = *(id *)(a1 + 40);
            [v20 updateVolatileDataForPublisherClient:v21 domain:v22 usingDiffProvider:v33 completion:*(void *)(a1 + 56)];

            v23 = v34;
          }
          else
          {
            if (v19)
            {
              id v25 = objc_loadWeakRetained((id *)(v19 + 8));
              uint64_t v26 = *(void *)(a1 + 32);
            }
            else
            {
              uint64_t v26 = 0;
              id v25 = 0;
            }
            uint64_t v27 = *(void *)(a1 + 64);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_3;
            v30[3] = &unk_1E6AD2990;
            id v31 = *(id *)(a1 + 48);
            id v32 = *(id *)(a1 + 40);
            [v25 updateDataForPublisherClient:v26 domain:v27 usingDiffProvider:v30 completion:*(void *)(a1 + 56)];

            v23 = v31;
          }
        }
        return;
      }
      v11 = *(dispatch_queue_t **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 64);
    }
    else
    {
      v11 = 0;
    }
    v12 = -[STStatusDomainPublisherXPCClientHandle _internalQueue_fallbackDataForDomain:](v11, v8);
    id v28 = (id)[v12 mutableCopyWithZone:0];

    v10 = v28;
    if (v28) {
      goto LABEL_11;
    }
  }
  uint64_t v17 = *(void *)(a1 + 56);
  if (v17)
  {
    v18 = *(void (**)(void))(v17 + 16);
    v18();
  }
}

- (void)publishDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 replacingData:(BOOL)a6 discardingOnExit:(BOOL)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = (void (**)(void))a8;
  if (STIsValidDiffForStatusDomain() && ([v14 isEmpty] & 1) == 0)
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke;
    v18[3] = &unk_1E6AD2968;
    v18[4] = self;
    unint64_t v22 = a4;
    BOOL v23 = a7;
    id v19 = v14;
    BOOL v24 = a6;
    id v20 = v15;
    uint64_t v21 = v16;
    dispatch_async(internalQueue, v18);
  }
  else if (v16)
  {
    v16[2](v16);
  }
}

id __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = *(id *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  return v4;
}

id __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = *(id *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  return v4;
}

- (STStatusDomainPublisherXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 valueForEntitlement:*MEMORY[0x1E4FA98A8]];
  v10 = STEntitledDomainsForEntitlementValue(v9);
  if ([v10 count])
  {
    v37.receiver = self;
    v37.super_class = (Class)STStatusDomainPublisherXPCClientHandle;
    v11 = [(STStatusDomainPublisherXPCClientHandle *)&v37 init];
    v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_serverHandle, v8);
      long long v35 = 0u;
      long long v36 = 0u;
      if (v7) {
        [v7 auditToken];
      }
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.systemstatus.publisherqueue.client-%d", BSPIDForAuditToken());
      uint64_t Serial = BSDispatchQueueCreateSerial();
      internalQueue = v12->_internalQueue;
      v12->_internalQueue = (OS_dispatch_queue *)Serial;

      uint64_t v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      dataByDomain = v12->_dataByDomain;
      v12->_dataByDomain = v16;

      v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      volatileDataByDomain = v12->_volatileDataByDomain;
      v12->_volatileDataByDomain = v18;

      id v20 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      fallbackDataByDomain = v12->_fallbackDataByDomain;
      v12->_fallbackDataByDomain = v20;

      uint64_t v22 = [v10 copy];
      entitledDomains = v12->_entitledDomains;
      v12->_entitledDomains = (NSSet *)v22;

      uint64_t v24 = [MEMORY[0x1E4F1CA80] set];
      publishingDomains = v12->_publishingDomains;
      v12->_publishingDomains = (NSMutableSet *)v24;

      uint64_t v26 = STStatusDomainPublisherXPCClientInterface();
      [v7 setRemoteObjectInterface:v26];

      uint64_t v27 = STStatusDomainPublisherXPCServerInterface();
      [v7 setExportedInterface:v27];

      [v7 setExportedObject:v12];
      objc_initWeak(&location, v12);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v32[3] = &unk_1E6AD2408;
      objc_copyWeak(&v33, &location);
      [v7 setInterruptionHandler:v32];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3;
      v30[3] = &unk_1E6AD2408;
      objc_copyWeak(&v31, &location);
      [v7 setInvalidationHandler:v30];
      objc_storeStrong((id *)&v12->_clientXPCConnection, a3);
      [v7 resume];
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    self = v12;
    id v28 = self;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = WeakRetained[2];
  }
  else {
    v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);
}

uint64_t __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 24);
  }
  else {
    v2 = 0;
  }
  return [v2 invalidate];
}

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = WeakRetained[2];
  }
  else {
    v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);
}

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 64);
  }
  else {
    v3 = 0;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)[v3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[STStatusDomainPublisherXPCClientHandle _internalQueue_unregisterFromPublishingDomain:](*(void *)(a1 + 32), objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "unsignedIntegerValue", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_internalQueue_unregisterFromPublishingDomain:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v8 = *(id *)(a1 + 64);
    id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
    int v5 = [v8 containsObject:v4];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
      [v8 removeObject:v6];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      [WeakRetained removePublisherClient:a1 forDomain:a2];

      [*(id *)(a1 + 48) removeObjectForKey:a2];
      [*(id *)(a1 + 40) removeObjectForKey:a2];
    }
  }
}

- (void)registerToPublishDomain:(unint64_t)a3 fallbackData:(id)a4
{
  id v6 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__STStatusDomainPublisherXPCClientHandle_registerToPublishDomain_fallbackData___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __79__STStatusDomainPublisherXPCClientHandle_registerToPublishDomain_fallbackData___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = a1[6];
  int v5 = v2;
  id v6 = [v3 numberWithUnsignedInteger:v4];
  LODWORD(v4) = [v5 containsObject:v6];

  if (v4)
  {
    uint64_t v7 = (void *)a1[4];
    if (v7) {
      uint64_t v7 = (void *)v7[8];
    }
    uint64_t v16 = v7;
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[6]];
    char v9 = [v16 containsObject:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[6]];
      [v16 addObject:v10];

      uint64_t v11 = a1[4];
      if (v11) {
        long long v12 = *(void **)(v11 + 48);
      }
      else {
        long long v12 = 0;
      }
      [v12 setObject:a1[5] forKey:a1[6]];
      uint64_t v13 = a1[4];
      if (v13)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
        uint64_t v15 = a1[4];
      }
      else
      {
        uint64_t v15 = 0;
        id WeakRetained = 0;
      }
      [WeakRetained registerPublisherClient:v15 forDomain:a1[6] fallbackData:a1[5]];
    }
  }
}

- (void)unregisterFromPublishingDomain:(unint64_t)a3
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__STStatusDomainPublisherXPCClientHandle_unregisterFromPublishingDomain___block_invoke;
  v4[3] = &unk_1E6AD28C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

void __73__STStatusDomainPublisherXPCClientHandle_unregisterFromPublishingDomain___block_invoke(uint64_t a1)
{
}

- (void)replaceDataChangeRecord:(id)a3 discardingOnExit:(BOOL)a4 reply:(id)a5
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
  v13[2] = __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke;
  v13[3] = &unk_1E6AD2940;
  id v14 = v8;
  uint64_t v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domainsWithData];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke_2;
  v25[3] = &unk_1E6AD28F0;
  id v4 = v3;
  id v26 = v4;
  [v2 enumerateWithBlock:v25];
  int v5 = *(void **)(a1 + 40);
  if (v5) {
    int v5 = (void *)v5[7];
  }
  id v6 = v5;
  if ([v4 isSubsetOfSet:v6])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 64);
    }
    else {
      uint64_t v8 = 0;
    }
    int v9 = [v4 isSubsetOfSet:v8];

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FA9508]);
      id v11 = *(char **)(a1 + 40);
      if (v11)
      {
        uint64_t v12 = 40;
        if (!*(unsigned char *)(a1 + 56)) {
          uint64_t v12 = 32;
        }
        id v11 = *(char **)&v11[v12];
      }
      uint64_t v13 = v11;
      [v13 removeAllObjects];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke_3;
      v21[3] = &unk_1E6AD2918;
      v21[4] = *(void *)(a1 + 40);
      id v14 = v10;
      id v22 = v14;
      id v23 = *(id *)(a1 + 32);
      uint64_t v15 = v13;
      uint64_t v24 = v15;
      [v2 enumerateWithBlock:v21];
      uint64_t v16 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 56))
      {
        if (v16)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
          uint64_t v18 = *(void *)(a1 + 40);
        }
        else
        {
          uint64_t v18 = 0;
          id WeakRetained = 0;
        }
        [WeakRetained replaceVolatileDataChangeRecord:v14 forPublisherClient:v18 completion:*(void *)(a1 + 48)];
      }
      else
      {
        if (v16)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
          uint64_t v20 = *(void *)(a1 + 40);
        }
        else
        {
          uint64_t v20 = 0;
          id WeakRetained = 0;
        }
        [WeakRetained replaceDataChangeRecord:v14 forPublisherClient:v20 completion:*(void *)(a1 + 48)];
      }

      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v19 = *(void *)(a1 + 48);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
LABEL_22:
}

void __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v2 addObject:v3];
}

void __89__STStatusDomainPublisherXPCClientHandle_replaceDataChangeRecord_discardingOnExit_reply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[STStatusDomainPublisherXPCClientHandle _internalQueue_fallbackDataForDomain:](*(dispatch_queue_t **)(a1 + 32), a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setFallbackData:v6 forClientKey:@"sharedClient" domain:a2];
  [*(id *)(a1 + 40) addEntriesFromDataChangeRecord:*(void *)(a1 + 48) forDomain:a2 replacingClientKeysWithKey:@"sharedClient"];
  id v4 = [*(id *)(a1 + 40) currentDataForDomain:a2];
  int v5 = (void *)[v4 mutableCopyWithZone:0];

  [*(id *)(a1 + 56) setObject:v5 forKey:a2];
}

- (dispatch_queue_t)_internalQueue_fallbackDataForDomain:(dispatch_queue_t *)a1
{
  if (a1)
  {
    id v4 = a1;
    dispatch_assert_queue_V2(a1[2]);
    a1 = [v4[6] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)publishData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 discardingOnExit:(BOOL)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(void))a7;
  if (v12 && !STIsValidDataForStatusDomain())
  {
    if (v14) {
      v14[2](v14);
    }
  }
  else
  {
    if (v13)
    {
      if (STIsValidDataChangeContextForStatusDomain()) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __105__STStatusDomainPublisherXPCClientHandle_publishData_forDomain_withChangeContext_discardingOnExit_reply___block_invoke;
    v18[3] = &unk_1E6AD2968;
    v18[4] = self;
    unint64_t v22 = a4;
    BOOL v23 = a6;
    BOOL v24 = v12 == 0;
    id v19 = v12;
    id v13 = v16;
    id v20 = v13;
    uint64_t v21 = v14;
    dispatch_async(internalQueue, v18);
  }
}

void __105__STStatusDomainPublisherXPCClientHandle_publishData_forDomain_withChangeContext_discardingOnExit_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = v2;
  id v6 = [v3 numberWithUnsignedInteger:v4];
  LODWORD(v4) = [v5 containsObject:v6];

  if (v4)
  {
    uint64_t v7 = *(char **)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = 40;
      if (!*(unsigned char *)(a1 + 72)) {
        uint64_t v8 = 32;
      }
      uint64_t v7 = *(char **)&v7[v8];
    }
    int v9 = v7;
    BOOL v17 = v9;
    if (*(unsigned char *)(a1 + 73))
    {
      [v9 removeObjectForKey:*(void *)(a1 + 64)];
    }
    else
    {
      id v12 = (void *)[*(id *)(a1 + 40) mutableCopyWithZone:0];
      [v17 setObject:v12 forKey:*(void *)(a1 + 64)];
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      if (v13)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
        uint64_t v15 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v15 = 0;
        id WeakRetained = 0;
      }
      [WeakRetained publishVolatileData:*(void *)(a1 + 40) forPublisherClient:v15 domain:*(void *)(a1 + 64) withChangeContext:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      if (v13)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
        uint64_t v16 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v16 = 0;
        id WeakRetained = 0;
      }
      [WeakRetained publishData:*(void *)(a1 + 40) forPublisherClient:v16 domain:*(void *)(a1 + 64) withChangeContext:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
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

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (STIsValidUserInteractionForStatusDomain())
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__STStatusDomainPublisherXPCClientHandle_handleUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E6AD2110;
    void block[4] = self;
    id v9 = v6;
    unint64_t v10 = a4;
    dispatch_async(internalQueue, block);
  }
}

void __74__STStatusDomainPublisherXPCClientHandle_handleUserInteraction_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v3 = v2;
  id v4 = [v3 remoteObjectProxy];
  [v4 handleUserInteraction:a1[5] forDomain:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingDomains, 0);
  objc_storeStrong((id *)&self->_entitledDomains, 0);
  objc_storeStrong((id *)&self->_fallbackDataByDomain, 0);
  objc_storeStrong((id *)&self->_volatileDataByDomain, 0);
  objc_storeStrong((id *)&self->_dataByDomain, 0);
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end