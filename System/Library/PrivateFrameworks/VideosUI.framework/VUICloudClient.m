@interface VUICloudClient
+ (id)sharedInstance;
- (NSMutableDictionary)artworkMap;
- (VUICloudClient)init;
- (void)loadArtworkURLsForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)setArtworkMap:(id)a3;
@end

@implementation VUICloudClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_65);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

void __32__VUICloudClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUICloudClient);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
}

- (VUICloudClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUICloudClient;
  v2 = [(VUICloudClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    artworkMap = v2->_artworkMap;
    v2->_artworkMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)loadArtworkURLsForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  id v38 = objc_alloc_init(MEMORY[0x1E4FB85C8]);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke;
  v54[3] = &unk_1E6DF7D88;
  v54[4] = self;
  id v10 = v8;
  id v55 = v10;
  id v11 = v9;
  id v56 = v11;
  [v6 enumerateObjectsUsingBlock:v54];
  uint64_t v12 = [v11 count];
  uint64_t v13 = [v10 count];
  uint64_t v14 = v13;
  if (v12) {
    v7[2](v7, v11, v13 == 0);
  }
  if (v14)
  {
    val = self;
    v36 = v7;
    id v37 = v6;
    v34 = (void *)[v7 copy];
    v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    v16 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = [v10 count];
    if (v17)
    {
      unint64_t v18 = v17;
      uint64_t v19 = 0;
      do
      {
        if (v18 >= 0x1F4) {
          uint64_t v20 = 500;
        }
        else {
          uint64_t v20 = v18;
        }
        v21 = objc_msgSend(v10, "subarrayWithRange:", v19, v20);
        [v16 addObject:v21];
        v18 -= v20;
        v19 += v20;
      }
      while (v18);
    }
    v22 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E6DF7DB0;
    id v33 = v15;
    id v53 = v33;
    v23 = _Block_copy(aBlock);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v24 = v16;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          dispatch_group_enter(v22);
          v30 = (void *)[v29 copy];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_3;
          v45[3] = &unk_1E6DF7DD8;
          id v47 = v23;
          v46 = v22;
          [v38 loadArtworkInfoForPurchaseHistoryIDs:v30 completionHandler:v45];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v26);
    }

    objc_initWeak(&location, val);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_4;
    block[3] = &unk_1E6DF4588;
    objc_copyWeak(&v43, &location);
    id v40 = v38;
    id v41 = v33;
    id v42 = v34;
    id v31 = v34;
    id v32 = v33;
    dispatch_group_notify(v22, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

    v7 = v36;
    id v6 = v37;
  }
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKey:v4];
  id v6 = (id)v5;
  if (v5) {
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v4];
  }
  else {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v18 = a1;
  id v17 = *(id *)(a1 + 32);
  objc_sync_enter(v17);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v27 = *(void *)v30;
    uint64_t v25 = *MEMORY[0x1E4FB8398];
    uint64_t v26 = *MEMORY[0x1E4FB8360];
    uint64_t v23 = *MEMORY[0x1E4FB8390];
    uint64_t v24 = *MEMORY[0x1E4FB8378];
    uint64_t v22 = *MEMORY[0x1E4FB8370];
    uint64_t v20 = *MEMORY[0x1E4FB8388];
    uint64_t v21 = *MEMORY[0x1E4FB8368];
    do
    {
      uint64_t v28 = v4;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v7 = [v6 objectForKeyedSubscript:v26];
        v8 = [v6 objectForKeyedSubscript:v25];
        uint64_t v9 = [v7 objectForKeyedSubscript:v24];
        uint64_t v10 = [v7 objectForKeyedSubscript:v23];
        id v11 = [v7 objectForKeyedSubscript:v22];
        uint64_t v12 = [v7 objectForKeyedSubscript:v21];
        uint64_t v13 = [v7 objectForKeyedSubscript:v20];
        if (v8 && v9 | v10)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
          v15 = v14;
          if (v10) {
            [v14 setObject:v10 forKeyedSubscript:@"template-url"];
          }
          if (v9) {
            [v15 setObject:v9 forKeyedSubscript:@"full-url"];
          }
          if (v11) {
            [v15 setObject:v11 forKeyedSubscript:@"full-token"];
          }
          if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
            [v15 setObject:v16 forKeyedSubscript:@"supports-layered-image"];
          }
          if (v12) {
            [v15 setObject:v12 forKeyedSubscript:@"cover-art-url"];
          }
          [*(id *)(v18 + 32) setObject:v15 forKeyedSubscript:v8];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v17);
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v2);
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    id v3 = [WeakRetained artworkMap];
    [v3 addEntriesFromDictionary:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSMutableDictionary)artworkMap
{
  return self->_artworkMap;
}

- (void)setArtworkMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end