@interface SUQueueSessionManager
- (SUQueueSessionManager)init;
- (id)_queueSessionWithDownloadKinds:(id)a3 fromArray:(id)a4;
- (id)_queueSessionWithManagerOptions:(id)a3 fromArray:(id)a4;
- (id)_queueSessionWithQueue:(id)a3 fromArray:(id)a4;
- (id)beginDownloadManagerSessionForDownloadKind:(id)a3;
- (id)beginDownloadManagerSessionWithDownloadKinds:(id)a3;
- (id)beginDownloadManagerSessionWithManagerOptions:(id)a3;
- (id)beginPreorderManagerSessionWithItemKinds:(id)a3;
- (void)_endQueueSession:(id)a3 fromArray:(id)a4;
- (void)dealloc;
- (void)endDownloadManagerSessionForManager:(id)a3;
- (void)endPreorderManagerSessionWithManager:(id)a3;
@end

@implementation SUQueueSessionManager

- (id)beginDownloadManagerSessionWithManagerOptions:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__SUQueueSessionManager_beginDownloadManagerSessionWithManagerOptions___block_invoke;
  block[3] = &unk_264813A38;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __71__SUQueueSessionManager_beginDownloadManagerSessionWithManagerOptions___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = v2[2];
  if (!v3)
  {
    *(void *)(a1[4] + 16) = objc_alloc_init(MEMORY[0x263EFF980]);
    v2 = (void *)a1[4];
    uint64_t v3 = v2[2];
  }
  id v4 = (void *)[v2 _queueSessionWithManagerOptions:a1[5] fromArray:v3];
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setCount:", objc_msgSend(v4, "count") + 1);
    *(void *)(*(void *)(a1[6] + 8) + 40) = [v5 queue];
  }
  else
  {
    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      *(void *)(*(void *)(a1[6] + 8) + 40) = objc_alloc(MEMORY[0x263F7B178]);
      *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(*(void *)(a1[6] + 8) + 40) initWithManagerOptions:a1[5]];
    }
    v6 = [[SUClientQueueSession alloc] initWithQueue:*(void *)(*(void *)(a1[6] + 8) + 40)];
    [(SUClientQueueSession *)v6 setManagerOptions:a1[5]];
    [*(id *)(a1[4] + 16) addObject:v6];

    id v7 = *(id *)(*(void *)(a1[6] + 8) + 40);
  }
  v8 = *(void **)(*(void *)(a1[6] + 8) + 40);

  return v8;
}

- (id)_queueSessionWithManagerOptions:(id)a3 fromArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "managerOptions"), "isEqual:", a3)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUQueueSessionManager;
  [(SUQueueSessionManager *)&v4 dealloc];
}

- (SUQueueSessionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUQueueSessionManager;
  v2 = [(SUQueueSessionManager *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUQueueSessionManager.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);
  }
  return v2;
}

- (id)beginDownloadManagerSessionForDownloadKind:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SUQueueSessionManager_beginDownloadManagerSessionForDownloadKind___block_invoke;
  block[3] = &unk_264813A38;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __68__SUQueueSessionManager_beginDownloadManagerSessionForDownloadKind___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(a1[4] + 16);
  id result = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        uint64_t v8 = (void *)[v7 downloadKinds];
        if (![v8 count]) {
          uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "managerOptions"), "downloadKinds");
        }
        if ([v8 containsObject:a1[5]])
        {
          objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") + 1);
          id result = (id)[v7 queue];
          *(void *)(*(void *)(a1[6] + 8) + 40) = result;
          return result;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)beginDownloadManagerSessionWithDownloadKinds:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F7B180]);
  [v5 setDownloadKinds:a3];
  objc_msgSend(v5, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F7B628], *MEMORY[0x263F7B6D8], 0));
  objc_msgSend(v5, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F7B558], 0));
  id v6 = [(SUQueueSessionManager *)self beginDownloadManagerSessionWithManagerOptions:v5];

  return v6;
}

- (id)beginPreorderManagerSessionWithItemKinds:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  long long v10 = __Block_byref_object_copy__48;
  long long v11 = __Block_byref_object_dispose__48;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SUQueueSessionManager_beginPreorderManagerSessionWithItemKinds___block_invoke;
  block[3] = &unk_264813A38;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __66__SUQueueSessionManager_beginPreorderManagerSessionWithItemKinds___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = v2[3];
  if (!v3)
  {
    *(void *)(a1[4] + 24) = objc_alloc_init(MEMORY[0x263EFF980]);
    v2 = (void *)a1[4];
    uint64_t v3 = v2[3];
  }
  id v4 = (void *)[v2 _queueSessionWithDownloadKinds:a1[5] fromArray:v3];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCount:", objc_msgSend(v4, "count") + 1);
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[v5 queue];
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = [objc_alloc(MEMORY[0x263F7B2B8]) initWithItemKinds:a1[5]];
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v6 = [[SUClientQueueSession alloc] initWithQueue:*(void *)(*(void *)(a1[6] + 8) + 40)];
      [(SUClientQueueSession *)v6 setDownloadKinds:a1[5]];
      [*(id *)(a1[4] + 24) addObject:v6];
    }
  }
}

- (void)endDownloadManagerSessionForManager:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SUQueueSessionManager_endDownloadManagerSessionForManager___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __61__SUQueueSessionManager_endDownloadManagerSessionForManager___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queueSessionWithQueue:*(void *)(a1 + 40) fromArray:*(void *)(*(void *)(a1 + 32) + 16)];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[2];
    return [v4 _endQueueSession:v3 fromArray:v5];
  }
  return result;
}

- (void)endPreorderManagerSessionWithManager:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SUQueueSessionManager_endPreorderManagerSessionWithManager___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __62__SUQueueSessionManager_endPreorderManagerSessionWithManager___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queueSessionWithQueue:*(void *)(a1 + 40) fromArray:*(void *)(*(void *)(a1 + 32) + 24)];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[3];
    return [v4 _endQueueSession:v3 fromArray:v5];
  }
  return result;
}

- (void)_endQueueSession:(id)a3 fromArray:(id)a4
{
  uint64_t v6 = [a3 count];
  if (v6 < 2)
  {
    [a4 removeObject:a3];
  }
  else
  {
    [a3 setCount:v6 - 1];
  }
}

- (id)_queueSessionWithDownloadKinds:(id)a3 fromArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "downloadKinds"), "isEqualToArray:", a3)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_queueSessionWithQueue:(id)a3 fromArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ((id)[v10 queue] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end