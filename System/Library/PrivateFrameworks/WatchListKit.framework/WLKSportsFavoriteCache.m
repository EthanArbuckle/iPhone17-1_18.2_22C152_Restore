@interface WLKSportsFavoriteCache
- (BOOL)hasCache;
- (WLKSportsFavoriteCache)initWithUserDefaults:(id)a3;
- (id)dictionaryRepresentation;
- (void)addFavorites:(id)a3 completion:(id)a4;
- (void)deleteLegacyCacheWithCompletion:(id)a3;
- (void)getFavoritesWithCompletion:(id)a3;
- (void)hasFavoritesSyncEnabledKey:(id)a3;
- (void)invalidate;
- (void)isOptedIn:(id)a3;
- (void)removeFavorites:(id)a3 completion:(id)a4;
- (void)setCache:(id)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5;
- (void)setOptInStatus:(BOOL)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5;
@end

@implementation WLKSportsFavoriteCache

- (WLKSportsFavoriteCache)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLKSportsFavoriteCache;
  v6 = [(WLKSportsFavoriteCache *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("WLKSportsFavoritePersistentCacheQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v6;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WLKSportsFavoriteCache_invalidate__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__WLKSportsFavoriteCache_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:@"my-sports-onboarding-status"];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:@"my-sports-onboarding-status-last-modified-date"];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:@"my-sports-favorites"];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 removeObjectForKey:@"my-sports-favorites-last-modified-date"];
}

- (void)deleteLegacyCacheWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WLKSportsFavoriteCache_deleteLegacyCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__WLKSportsFavoriteCache_deleteLegacyCacheWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) dictionaryRepresentation];
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v9 hasPrefix:@"WLKSportsFavoritesCacheKey"] & 1) != 0
          || ([v9 hasPrefix:@"WLKSportsFavoriteCacheLastModifiedKey"] & 1) != 0
          || ([v9 hasPrefix:@"WLKSportsFavoriteCacheSyncingAvailableOverride"] & 1) != 0
          || ([v9 hasPrefix:@"WLKSportsFavoriteCacheSyncingEnabledKey"] & 1) != 0
          || ([v9 hasPrefix:@"WLKSportsFavoriteCacheSyncingEnabledLastModifiedKey"] & 1) != 0
          || [v9 hasPrefix:@"WLKSportsFavoriteCacheSyncingEnabledOverride"])
        {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

- (BOOL)hasCache
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__WLKSportsFavoriteCache_hasCache__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__WLKSportsFavoriteCache_hasCache__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"my-sports-favorites"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)setCache:(id)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__WLKSportsFavoriteCache_setCache_overrideLastModifiedDate_completion___block_invoke;
  v13[3] = &unk_1E620BC78;
  id v14 = v8;
  uint64_t v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __71__WLKSportsFavoriteCache_setCache_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "ID", (void)v11);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v2 forKey:@"my-sports-favorites"];
  if (*(unsigned char *)(a1 + 56))
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 16);
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [v9 setObject:v10 forKey:@"my-sports-favorites-last-modified-date"];
  }
  objc_msgSend(*(id *)(a1 + 40), "getFavoritesWithCompletion:", *(void *)(a1 + 48), (void)v11);
}

- (void)getFavoritesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WLKSportsFavoriteCache_getFavoritesWithCompletion___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__WLKSportsFavoriteCache_getFavoritesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) stringArrayForKey:@"my-sports-favorites"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[WLKSportsFavoriteFactory favoriteWithID:*(void *)(*((void *)&v12 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"my-sports-favorites-last-modified-date"];
  id v10 = WLKSystemLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v17 = v3;
    __int16 v18 = 2112;
    long long v19 = v9;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - cached favorites: %@, lastModified: %@", buf, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v2, v9);
  }
}

- (void)addFavorites:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WLKSportsFavoriteCache_addFavorites_completion___block_invoke;
  block[3] = &unk_1E620BF50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __50__WLKSportsFavoriteCache_addFavorites_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) stringArrayForKey:@"my-sports-favorites"];
  id v3 = (void *)v2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    uint64_t v4 = (void *)v2;
  }
  id v5 = v4;

  id v6 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v5];
  id v7 = (void *)[v6 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * v12++), (void)v16);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v13 = [v7 array];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v13 forKey:@"my-sports-favorites"];
  long long v14 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v15 = [MEMORY[0x1E4F1C9C8] now];
  [v14 setObject:v15 forKey:@"my-sports-favorites-last-modified-date"];

  [*(id *)(a1 + 32) getFavoritesWithCompletion:*(void *)(a1 + 48)];
}

- (void)removeFavorites:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WLKSportsFavoriteCache_removeFavorites_completion___block_invoke;
  block[3] = &unk_1E620BF50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __53__WLKSportsFavoriteCache_removeFavorites_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) stringArrayForKey:@"my-sports-favorites"];
  id v3 = (void *)v2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    uint64_t v4 = (void *)v2;
  }
  id v5 = v4;

  id v6 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v5];
  id v7 = (void *)[v6 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "removeObject:", *(void *)(*((void *)&v16 + 1) + 8 * v12++), (void)v16);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v13 = [v7 array];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v13 forKey:@"my-sports-favorites"];
  long long v14 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v15 = [MEMORY[0x1E4F1C9C8] now];
  [v14 setObject:v15 forKey:@"my-sports-favorites-last-modified-date"];

  [*(id *)(a1 + 32) getFavoritesWithCompletion:*(void *)(a1 + 48)];
}

- (void)hasFavoritesSyncEnabledKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WLKSportsFavoriteCache_hasFavoritesSyncEnabledKey___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__WLKSportsFavoriteCache_hasFavoritesSyncEnabledKey___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"my-sports-onboarding-status"];

  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)isOptedIn:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__WLKSportsFavoriteCache_isOptedIn___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __36__WLKSportsFavoriteCache_isOptedIn___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) BOOLForKey:@"my-sports-onboarding-status"];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"my-sports-onboarding-status-last-modified-date"];
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 debugDescription];
    v6[0] = 67109378;
    v6[1] = v2;
    __int16 v7 = 2112;
    id v8 = v5;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - cached onboarding state: %d, lastModified: %@", (uint8_t *)v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setOptInStatus:(BOOL)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WLKSportsFavoriteCache_setOptInStatus_overrideLastModifiedDate_completion___block_invoke;
  block[3] = &unk_1E620BF78;
  BOOL v13 = a3;
  BOOL v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

uint64_t __77__WLKSportsFavoriteCache_setOptInStatus_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - setting cache for onboarding state: %d", (uint8_t *)v9, 8u);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v4 setObject:v5 forKey:@"my-sports-onboarding-status"];

  if (*(unsigned char *)(a1 + 49))
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    __int16 v7 = [MEMORY[0x1E4F1C9C8] now];
    [v6 setObject:v7 forKey:@"my-sports-onboarding-status-last-modified-date"];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WLKSportsFavoriteCache_dictionaryRepresentation__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_sync(queue, block);

  return v3;
}

void __50__WLKSportsFavoriteCache_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = @"my-sports-onboarding-status";
  v4[1] = @"my-sports-onboarding-status-last-modified-date";
  v4[2] = @"my-sports-favorites";
  v4[3] = @"my-sports-favorites-last-modified-date";
  int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  id v3 = (id)[v1 dictionaryWithValuesForKeys:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end