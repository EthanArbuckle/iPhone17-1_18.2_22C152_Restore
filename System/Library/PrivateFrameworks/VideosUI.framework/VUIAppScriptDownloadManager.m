@interface VUIAppScriptDownloadManager
+ (id)sharedInstance;
- (NSMutableDictionary)appScriptDict;
- (NSURL)currentURL;
- (NSURLSessionDataTask)task;
- (id)_init;
- (void)fetchAppJavascript:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAppScriptDict:(id)a3;
- (void)setCurrentURL:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation VUIAppScriptDownloadManager

- (void)fetchAppJavascript:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [v8 absoluteString];
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "Prefetch application script from: %@.", buf, 0xCu);
    }
  }
  v12 = kVUIBagTVAppJetpackURL;
  v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v14 = +[VUIJetPackController controllerWithBagKey:v12 defaults:v13 urlOverrideDefaultKey:@"boot-url" withCachePolicy:a4];

  objc_initWeak((id *)buf, self);
  v15 = [v14 getJetPackSource];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__VUIAppScriptDownloadManager_fetchAppJavascript_cachePolicy_completionHandler___block_invoke;
  v18[3] = &unk_1E6DF9730;
  objc_copyWeak(&v21, (id *)buf);
  id v16 = v9;
  id v20 = v16;
  v18[4] = self;
  id v17 = v8;
  id v19 = v17;
  [v15 addFinishBlock:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __45__VUIAppScriptDownloadManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIAppScriptDownloadManager alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v0;
}

- (id)_init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VUIAppScriptDownloadManager;
  v2 = [(VUIAppScriptDownloadManager *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0x100000 diskCapacity:52428800 diskPath:0];
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 memoryCapacity];
      uint64_t v7 = [v4 diskCapacity];
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "Applicaiton script download manager uses custom URL cache: mem capacity %lu disk capacity %lu", buf, 0x16u);
    }

    [v3 setURLCache:v4];
    uint64_t v8 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3];
    session = v2->_session;
    v2->_session = (NSURLSession *)v8;

    [(VUIAppScriptDownloadManager *)v2 setCurrentURL:0];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(VUIAppScriptDownloadManager *)v2 setAppScriptDict:v10];

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionBlocksDict = v2->_completionBlocksDict;
    v2->_completionBlocksDict = v11;
  }
  return v2;
}

void __80__VUIAppScriptDownloadManager_fetchAppJavascript_cachePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (v5 && !v6)
  {
    uint64_t v8 = [v5 source];
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v5 url];
      v11 = [v10 absoluteString];
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "Successfully downloaded script from: %@.", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (!v12)
    {
      if (v8)
      {
        id v13 = *(id *)(a1 + 32);
        objc_sync_enter(v13);
        objc_super v14 = [WeakRetained appScriptDict];
        [v14 setObject:v8 forKey:*(void *)(a1 + 40)];

        objc_sync_exit(v13);
      }
      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(uint64_t, void *, id, uint64_t))(v12 + 16))(v12, v8, v6, 200);
    goto LABEL_12;
  }
  v15 = VUIDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v5 url];
    __int16 v17 = [v16 absoluteString];
    uint64_t v18 = [v6 description];
    *(_DWORD *)buf = 138412546;
    v30 = v17;
    __int16 v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "Failed to download application script from: %@. -- %@", buf, 0x16u);
  }
  uint64_t v8 = 0;
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_lock((os_unfair_lock_t)&__completionBlocksLock);
  [WeakRetained[2] objectForKey:*(void *)(a1 + 40)];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v19);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v22) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * v22));
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }

  objc_msgSend(v19, "removeAllObjects", (void)v24);
  os_unfair_lock_unlock((os_unfair_lock_t)&__completionBlocksLock);
  id v23 = *(id *)(a1 + 32);
  objc_sync_enter(v23);
  [WeakRetained setCurrentURL:0];
  objc_sync_exit(v23);
}

- (void)setCurrentURL:(id)a3
{
}

- (void)setAppScriptDict:(id)a3
{
}

- (NSMutableDictionary)appScriptDict
{
  return self->_appScriptDict;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_97);
  }
  v2 = (void *)sharedInstance___sharedInstance_3;
  return v2;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_appScriptDict, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_completionBlocksDict, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end