@interface STStatusDomainXPCClientHandle
- (NSArray)preferredLocalizations;
- (STStatusDomainXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4;
- (void)_internalQueue_stopObservingDomain:(uint64_t)a1;
- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5;
- (void)observeDomain:(id)a3 withPreferredLocalizations:(id)a4;
- (void)reportUserInteraction:(id)a3 forDomain:(unint64_t)a4;
- (void)serverDataForDomains:(id)a3 reply:(id)a4;
- (void)stopObservingDomain:(id)a3;
@end

@implementation STStatusDomainXPCClientHandle

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 || STIsValidDataForStatusDomain())
  {
    if (v9)
    {
      if (STIsValidDataChangeContextForStatusDomain()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke;
    v13[3] = &unk_1E6AD20E8;
    v13[4] = self;
    unint64_t v16 = a4;
    id v14 = v8;
    id v9 = v11;
    id v15 = v9;
    dispatch_async(internalQueue, v13);
  }
}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[7];
  }
  v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void *)(a1 + 56);
  v5 = v2;
  v6 = [v3 numberWithUnsignedInteger:v4];
  LODWORD(v4) = [v5 containsObject:v6];

  if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v26 = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_2;
    v27 = &unk_1E6AD2878;
    uint64_t v28 = v8;
    uint64_t v30 = v9;
    id v29 = *(id *)(a1 + 48);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_3;
    v21 = &unk_1E6AD28A0;
    id v11 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v24 = v10;
    id v23 = v11;
    id v12 = v7;
    v13 = v25;
    id v14 = &v18;
    if (!v8)
    {
LABEL_13:

      return;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 16));
    id v15 = *(id *)(v8 + 32);
    unint64_t v16 = objc_msgSend(v15, "objectForKey:", v9, v18, v19);
    if (v12)
    {
      [v15 setObject:v12 forKey:v9];

      if (v16)
      {
        v17 = [v12 diffFromData:v16];
        if (([v17 isEmpty] & 1) == 0) {
          v20(v14, v17);
        }

        goto LABEL_12;
      }
    }
    else
    {
      [v15 removeObjectForKey:v9];
    }
    v26(v13, v12);
LABEL_12:

    goto LABEL_13;
  }
}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_3(void *a1, void *a2)
{
  uint64_t v4 = (void *)a1[4];
  if (v4) {
    uint64_t v4 = (void *)v4[3];
  }
  v5 = v4;
  id v6 = a2;
  id v7 = [v5 remoteObjectProxy];
  [v7 observeDiff:v6 forDomain:a1[6] withChangeContext:a1[5]];
}

- (STStatusDomainXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 valueForEntitlement:*MEMORY[0x1E4FA9828]];
  uint64_t v10 = STEntitledDomainsForEntitlementValue(v9);
  if ([v10 count])
  {
    v35.receiver = self;
    v35.super_class = (Class)STStatusDomainXPCClientHandle;
    id v11 = [(STStatusDomainXPCClientHandle *)&v35 init];
    id v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_serverHandle, v8);
      long long v33 = 0u;
      long long v34 = 0u;
      if (v7) {
        [v7 auditToken];
      }
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.systemstatus.observerqueue.client-%d", BSPIDForAuditToken());
      uint64_t Serial = BSDispatchQueueCreateSerial();
      internalQueue = v12->_internalQueue;
      v12->_internalQueue = (OS_dispatch_queue *)Serial;

      unint64_t v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      dataByDomain = v12->_dataByDomain;
      v12->_dataByDomain = v16;

      uint64_t v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      clientHandleWrappersByDomain = v12->_clientHandleWrappersByDomain;
      v12->_clientHandleWrappersByDomain = v18;

      uint64_t v20 = [v10 copy];
      entitledDomains = v12->_entitledDomains;
      v12->_entitledDomains = (NSSet *)v20;

      uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
      observingDomains = v12->_observingDomains;
      v12->_observingDomains = (NSMutableSet *)v22;

      uint64_t v24 = STStatusDomainXPCClientInterface();
      [v7 setRemoteObjectInterface:v24];

      v25 = STStatusDomainXPCServerInterface();
      [v7 setExportedInterface:v25];

      [v7 setExportedObject:v12];
      objc_initWeak(&location, v12);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v30[3] = &unk_1E6AD2408;
      objc_copyWeak(&v31, &location);
      [v7 setInterruptionHandler:v30];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3;
      v28[3] = &unk_1E6AD2408;
      objc_copyWeak(&v29, &location);
      [v7 setInvalidationHandler:v28];
      objc_storeStrong((id *)&v12->_clientXPCConnection, a3);
      [v7 resume];
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    self = v12;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = WeakRetained[2];
  }
  else {
    v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);
}

uint64_t __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
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

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = WeakRetained[2];
  }
  else {
    v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);
}

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 56);
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
        -[STStatusDomainXPCClientHandle _internalQueue_stopObservingDomain:](*(void *)(a1 + 32), *(void **)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_internalQueue_stopObservingDomain:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    id v10 = *(id *)(a1 + 56);
    int v5 = [v10 containsObject:v4];
    [v10 removeObject:v4];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [v4 unsignedIntegerValue];

    id v8 = *(id *)(a1 + 40);
    long long v9 = [v8 objectForKey:v7];
    [v8 removeObjectForKey:v7];

    if (v5 && v9) {
      [WeakRetained removeClient:v9 forDomain:v7];
    }
  }
}

- (void)observeDomain:(id)a3 withPreferredLocalizations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainXPCClientHandle_observeDomain_withPreferredLocalizations___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __74__STStatusDomainXPCClientHandle_observeDomain_withPreferredLocalizations___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 48);
  }
  else {
    v3 = 0;
  }
  if (![v3 containsObject:*(void *)(a1 + 40)]) {
    return;
  }
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[7];
  }
  id v12 = v4;
  char v5 = [v12 containsObject:*(void *)(a1 + 40)];
  [v12 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
    if ((v5 & 1) == 0)
    {
LABEL_8:
      uint64_t v8 = [*(id *)(a1 + 40) unsignedIntegerValue];
      id v9 = [[STStatusDomainClientHandleWrapper alloc] initWithWrappedClientHandle:*(void *)(a1 + 32) preferredLocalizations:*(void *)(a1 + 48)];
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        long long v11 = *(void **)(v10 + 40);
      }
      else {
        long long v11 = 0;
      }
      [v11 setObject:v9 forKey:v8];
      [WeakRetained registerClient:v9 forDomain:v8];
    }
  }
  else
  {
    id WeakRetained = 0;
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
  }
}

- (void)stopObservingDomain:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__STStatusDomainXPCClientHandle_stopObservingDomain___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __53__STStatusDomainXPCClientHandle_stopObservingDomain___block_invoke(uint64_t a1)
{
}

- (void)reportUserInteraction:(id)a3 forDomain:(unint64_t)a4
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
    block[2] = __65__STStatusDomainXPCClientHandle_reportUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E6AD2110;
    void block[4] = self;
    unint64_t v10 = a4;
    id v9 = v6;
    dispatch_async(internalQueue, block);
  }
}

void __65__STStatusDomainXPCClientHandle_reportUserInteraction_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[6];
  }
  v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = a1[6];
  char v5 = v2;
  id v6 = [v3 numberWithUnsignedInteger:v4];
  LODWORD(v4) = [v5 containsObject:v6];

  if (v4)
  {
    uint64_t v7 = a1[4];
    if (v7) {
      id v8 = *(void **)(v7 + 40);
    }
    else {
      id v8 = 0;
    }
    id v9 = [v8 objectForKey:a1[6]];
    if (v9)
    {
      id v12 = v9;
      uint64_t v10 = a1[4];
      if (v10) {
        id WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
      }
      else {
        id WeakRetained = 0;
      }
      [WeakRetained reportUserInteraction:a1[5] forClient:v12 domain:a1[6]];

      id v9 = v12;
    }
  }
}

- (void)serverDataForDomains:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__STStatusDomainXPCClientHandle_serverDataForDomains_reply___block_invoke;
  block[3] = &unk_1E6AD2850;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __60__STStatusDomainXPCClientHandle_serverDataForDomains_reply___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) count];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 48);
    }
    else {
      uint64_t v4 = 0;
    }
    if ([*(id *)(a1 + 32) isSubsetOfSet:v4])
    {
      uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v2];
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
      }
      else {
        id WeakRetained = 0;
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            id v13 = objc_msgSend(WeakRetained, "dataForDomain:", objc_msgSend(v12, "unsignedIntegerValue", (void)v14));
            if (v13) {
              [v2 setObject:v13 forKey:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSArray)preferredLocalizations
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_2(void *a1, void *a2)
{
  uint64_t v4 = (void *)a1[4];
  if (v4) {
    uint64_t v4 = (void *)v4[3];
  }
  uint64_t v5 = v4;
  id v6 = a2;
  id v7 = [v5 remoteObjectProxy];
  [v7 observeData:v6 forDomain:a1[6] withChangeContext:a1[5]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingDomains, 0);
  objc_storeStrong((id *)&self->_entitledDomains, 0);
  objc_storeStrong((id *)&self->_clientHandleWrappersByDomain, 0);
  objc_storeStrong((id *)&self->_dataByDomain, 0);
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end