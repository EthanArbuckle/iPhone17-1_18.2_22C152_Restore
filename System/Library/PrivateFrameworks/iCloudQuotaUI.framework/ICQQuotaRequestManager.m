@interface ICQQuotaRequestManager
+ (id)noAccountError;
+ (id)sharedManager;
- (ICQQuotaRequestManager)init;
- (id)_sendSynchronousAARequest:(id)a3;
- (id)appDetailsForBundleIDs:(id)a3 error:(id *)a4;
- (id)quotaInfoDetailed:(BOOL)a3 error:(id *)a4;
- (void)clearCachedAppDetails;
- (void)clearCachedQuotaInfo;
- (void)getAppDetailsForBundleIDs:(id)a3 handler:(id)a4;
- (void)getQuotaInfoDetailed:(BOOL)a3 handler:(id)a4;
- (void)noteQuotaInfoChanged;
@end

@implementation ICQQuotaRequestManager

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_13);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

void __39__ICQQuotaRequestManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ICQQuotaRequestManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

+ (id)noAccountError
{
  v2 = (void *)MEMORY[0x263F087E8];
  v3 = [NSDictionary dictionaryWithObject:@"No Primary Account" forKey:*MEMORY[0x263F08320]];
  v4 = [v2 errorWithDomain:@"com.apple.appleaccount" code:0 userInfo:v3];

  return v4;
}

- (ICQQuotaRequestManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICQQuotaRequestManager;
  v2 = [(ICQQuotaRequestManager *)&v10 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    appDetailsCache = v2->_appDetailsCache;
    v2->_appDetailsCache = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.preferences.quota_info_queue", 0);
    quota_info_queue = v2->_quota_info_queue;
    v2->_quota_info_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)clearCachedQuotaInfo
{
  quota_info_queue = self->_quota_info_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICQQuotaRequestManager_clearCachedQuotaInfo__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(quota_info_queue, block);
}

void __46__ICQQuotaRequestManager_clearCachedQuotaInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)noteQuotaInfoChanged
{
  [(ICQQuotaRequestManager *)self clearCachedQuotaInfo];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"QuotaInformationChanged" object:0];
}

- (id)_sendSynchronousAARequest:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_alloc(MEMORY[0x263F25938]);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __52__ICQQuotaRequestManager__sendSynchronousAARequest___block_invoke;
  v15 = &unk_264922BD0;
  v17 = &v18;
  dispatch_queue_t v7 = v5;
  v16 = v7;
  v8 = (void *)[v6 initWithRequest:v4 handler:&v12];
  -[NSOperationQueue addOperation:](self->_requestQueue, "addOperation:", v8, v12, v13, v14, v15);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)v19[5];
  if (!v9) {
    __assert_rtn("-[ICQQuotaRequestManager _sendSynchronousAARequest:]", "ICQQuotaRequestManager.m", 77, "response");
  }
  id v10 = v9;

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __52__ICQQuotaRequestManager__sendSynchronousAARequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)quotaInfoDetailed:(BOOL)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  quota_info_queue = self->_quota_info_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__ICQQuotaRequestManager_quotaInfoDetailed_error___block_invoke;
  v9[3] = &unk_264922BF8;
  BOOL v10 = a3;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = &v17;
  dispatch_sync(quota_info_queue, v9);
  if (a4)
  {
    id v6 = (void *)v12[5];
    if (v6) {
      *a4 = v6;
    }
  }
  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __50__ICQQuotaRequestManager_quotaInfoDetailed_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3 || *(unsigned char *)(a1 + 56) && !*(unsigned char *)(v2 + 32))
  {
    *(void *)(v2 + 24) = 0;

    id v4 = [MEMORY[0x263EFB210] defaultStore];
    dispatch_semaphore_t v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
    if (v5)
    {
      id v6 = [[ICQQuotaInfoRequest alloc] initWithAccount:v5 accountStore:v4 detailed:*(unsigned __int8 *)(a1 + 56)];
      id v7 = [*(id *)(a1 + 32) _sendSynchronousAARequest:v6];
      v8 = [v7 error];

      if (v8)
      {
        uint64_t v9 = [v7 error];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v7);
        *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(a1 + 56);
      }
    }
    else
    {
      uint64_t v12 = [(id)objc_opt_class() noAccountError];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(ICQQuotaInfoRequest **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v14 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v14, v3);
}

- (void)getQuotaInfoDetailed:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke;
  block[3] = &unk_264922C48;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v10 = 0;
  id v4 = [v2 quotaInfoDetailed:v3 error:&v10];
  id v5 = v10;
  if (*(void *)(a1 + 40))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke_2;
    v6[3] = &unk_264922C20;
    id v9 = *(id *)(a1 + 40);
    id v7 = v4;
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)clearCachedAppDetails
{
  obj = self->_appDetailsCache;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_appDetailsCache removeAllObjects];
  objc_sync_exit(obj);
}

- (id)appDetailsForBundleIDs:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v27 = self->_appDetailsCache;
  objc_sync_enter(v27);
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = (void *)[v6 mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_appDetailsCache objectForKey:v12];
        if (v13)
        {
          [v8 removeObject:v12];
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  if (![v8 count]) {
    goto LABEL_26;
  }
  v26 = [MEMORY[0x263EFB210] defaultStore];
  v25 = objc_msgSend(v26, "aa_primaryAppleAccount");
  if (!v25)
  {
    if (a4)
    {
      *a4 = [(id)objc_opt_class() noAccountError];
    }

    goto LABEL_26;
  }
  v24 = [(ICQQuotaRequestManager *)self quotaInfoDetailed:0 error:a4];
  if (v24)
  {
    v14 = [[ICQQuotaAppDetailsRequest alloc] initWithAccount:v25 accountStore:v26 bundleIDs:v8 quotaInfo:v24];
    [(ICQQuotaRequestManager *)self _sendSynchronousAARequest:v14];
    id v23 = v14;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v28 = (ICQQuotaAppDetailsResponse *)objc_claimAutoreleasedReturnValue();
    v15 = [(ICQQuotaAppDetailsResponse *)v28 apps];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          appDetailsCache = self->_appDetailsCache;
          v21 = [v19 bundleID];
          [(NSMutableDictionary *)appDetailsCache setObject:v19 forKey:v21];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v16);
    }
  }
  else
  {
    v28 = 0;
  }

  if (!v28) {
LABEL_26:
  }
    v28 = objc_alloc_init(ICQQuotaAppDetailsResponse);
  [(ICQQuotaAppDetailsResponse *)v28 addApps:v7];

  objc_sync_exit(v27);
  return v28;
}

- (void)getAppDetailsForBundleIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  id v4 = [v2 appDetailsForBundleIDs:v3 error:&v13];
  id v5 = v13;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke_2;
  v9[3] = &unk_264922C20;
  id v6 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v10 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDetailsCache, 0);
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_quota_info_queue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end