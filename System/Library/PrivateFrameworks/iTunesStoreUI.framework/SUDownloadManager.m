@interface SUDownloadManager
- (BOOL)deleteDownload:(id)a3;
- (NSArray)downloads;
- (SSDownloadManager)downloadManager;
- (SUDownloadManager)initWithDownloadManager:(id)a3;
- (SUDownloadManager)initWithDownloadManager:(id)a3 clientInterface:(id)a4;
- (id)downloadForDownloadIdentifier:(int64_t)a3;
- (void)_finishPreflightWithCompletionBlock:(id)a3;
- (void)_reloadDownloadManager;
- (void)_removeObject:(id)a3 fromArray:(id *)a4;
- (void)dealloc;
- (void)preflightWithCompletionBlock:(id)a3;
- (void)reloadDownloadManager;
@end

@implementation SUDownloadManager

- (SUDownloadManager)initWithDownloadManager:(id)a3
{
  id v5 = +[SUClientDispatch clientInterface];

  return [(SUDownloadManager *)self initWithDownloadManager:a3 clientInterface:v5];
}

- (SUDownloadManager)initWithDownloadManager:(id)a3 clientInterface:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUDownloadManager;
  v6 = [(SUDownloadManager *)&v9 init];
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_downloadManager = (SSDownloadManager *)a3;
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUDownloadManager.%p", v6);
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v7 UTF8String], 0);
  }
  return v6;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUDownloadManager;
  [(SUDownloadManager *)&v4 dealloc];
}

- (BOOL)deleteDownload:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SUDownloadManager_deleteDownload___block_invoke;
  block[3] = &unk_264813A38;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __36__SUDownloadManager_deleteDownload___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) storeItemIdentifier];
  uint64_t v2 = SSGetUnsignedLongLongFromValue();
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedDownload"), "persistentIdentifier");
  char v4 = dispatch_semaphore_create(0);
  id v5 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(*(id *)(a1 + 32), "managedDownload"), 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SUDownloadManager_deleteDownload___block_invoke_2;
  v8[3] = &unk_264814C40;
  uint64_t v7 = *(void *)(a1 + 48);
  v8[4] = v4;
  v8[5] = v7;
  [v5 cancelDownloads:v6 completionBlock:v8];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) _removeObject:*(void *)(a1 + 32) fromArray:*(void *)(a1 + 40) + 8];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithLongLong:", v3));
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "purchaseManager"), "removePurchasedItemIdentifier:", v2);
  }
}

intptr_t __36__SUDownloadManager_deleteDownload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)downloadForDownloadIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__45;
  v11 = __Block_byref_object_dispose__45;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUDownloadManager_downloadForDownloadIdentifier___block_invoke;
  block[3] = &unk_264814C68;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__SUDownloadManager_downloadForDownloadIdentifier___block_invoke(void *a1)
{
  id v2 = (id)[objc_alloc(NSNumber) initWithLongLong:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[*(id *)(a1[4] + 40) objectForKey:v2];
}

- (SSDownloadManager)downloadManager
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__45;
  char v10 = __Block_byref_object_dispose__45;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SUDownloadManager_downloadManager__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (SSDownloadManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUDownloadManager_downloadManager__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)downloads
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__45;
  char v10 = __Block_byref_object_dispose__45;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__SUDownloadManager_downloads__block_invoke;
  v5[3] = &unk_264812E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SUDownloadManager_downloads__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[1];
  if (!v3)
  {
    [v2 _reloadDownloadManager];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)preflightWithCompletionBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke;
  v4[3] = &unk_264814CB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_2;
    block[3] = &unk_264814C90;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 8) = objc_alloc_init(MEMORY[0x263EFF8C0]);
    uint64_t v2 = [MEMORY[0x263F7B420] weakReferenceWithObject:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_3;
    v5[3] = &unk_264814CE0;
    v5[4] = v3;
    v5[5] = v2;
    void v5[6] = *(void *)(a1 + 40);
    [v4 getDownloadsUsingBlock:v5];
  }
}

uint64_t __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_4;
  v2[3] = &unk_264814CB8;
  long long v3 = *(_OWORD *)(a1 + 40);
  dispatch_async(v1, v2);
}

uint64_t __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _finishPreflightWithCompletionBlock:v3];
}

- (void)reloadDownloadManager
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUDownloadManager_reloadDownloadManager__block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __42__SUDownloadManager_reloadDownloadManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDownloadManager];
}

- (void)_finishPreflightWithCompletionBlock:(id)a3
{
  if ([(NSArray *)self->_cachedDownloads count])
  {
    if (!a3) {
      return;
    }
  }
  else
  {

    self->_cachedDownloads = 0;
    if (!a3) {
      return;
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUDownloadManager__finishPreflightWithCompletionBlock___block_invoke;
  block[3] = &unk_264814C90;
  block[4] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__SUDownloadManager__finishPreflightWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reloadDownloadManager
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = (void *)[(SSDownloadManager *)self->_downloadManager downloads];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
        uint64_t v12 = (ISUDownload *)(id)[(NSMutableDictionary *)self->_downloadsByID objectForKey:v11];
        if (v12)
        {
          v13 = v12;
          [(ISUDownload *)v12 setManagedDownload:v10];
        }
        else
        {
          v13 = [[ISUDownload alloc] initWithManagedDownload:v10];
        }
        [v4 addObject:v13];
        [(NSMutableDictionary *)v3 setObject:v13 forKey:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  self->_cachedDownloads = (NSArray *)[v4 copy];
  self->_downloadsByID = v3;
}

- (void)_removeObject:(id)a3 fromArray:(id *)a4
{
  if (*a4)
  {
    uint64_t v5 = [*a4 indexOfObject:a3];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      id v7 = (id)[*a4 mutableCopy];
      [v7 removeObjectAtIndex:v6];

      *a4 = (id)[v7 copy];
    }
  }
}

@end