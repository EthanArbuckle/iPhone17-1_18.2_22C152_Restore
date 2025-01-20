@interface SASBulletinManager
- (SASBulletinManager)init;
- (SASBulletinManagerDelegate)delegate;
- (id)_displayNameForBulletin:(id)a3;
- (id)allBulletins;
- (id)bulletinForIdentifier:(id)a3;
- (id)bulletinsOnLockScreen;
- (void)_bulletinsDidChange;
- (void)_setupObserver;
- (void)addBulletinCompletionWithBulletin:(id)a3 forFeed:(unint64_t)a4;
- (void)dealloc;
- (void)modifyBulletinCompletionWithBulletin:(id)a3;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 modifyBulletin:(id)a4;
- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4;
- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SASBulletinManager

- (SASBulletinManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SASBulletinManager;
  v2 = [(SASBulletinManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SASBulletinCache);
    bulletinCache = v2->_bulletinCache;
    v2->_bulletinCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bulletinsOnLockScreen = v2->_bulletinsOnLockScreen;
    v2->_bulletinsOnLockScreen = v5;

    [(SASBulletinManager *)v2 _setupObserver];
  }
  return v2;
}

- (void)_setupObserver
{
  observer = self->_observer;
  if (!observer)
  {
    v4 = (BBObserver *)objc_alloc_init(MEMORY[0x1E4F50CD0]);
    v5 = self->_observer;
    self->_observer = v4;

    observer = self->_observer;
  }
  [(BBObserver *)observer setDelegate:self];
  v6 = self->_observer;
  [(BBObserver *)v6 setObserverFeed:65023];
}

- (void)dealloc
{
  [(BBObserver *)self->_observer invalidate];
  [(BBObserver *)self->_observer setDelegate:0];
  observer = self->_observer;
  self->_observer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SASBulletinManager;
  [(SASBulletinManager *)&v4 dealloc];
}

- (void)_bulletinsDidChange
{
  id v3 = [(SASBulletinManager *)self delegate];
  [v3 bulletinManagerDidChangeBulletins:self];
}

- (id)_displayNameForBulletin:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F223C0];
  v5 = [v3 sectionID];
  v6 = [v4 applicationProxyForIdentifier:v5];
  v7 = [v6 localizedNameForContext:0];

  if ([v7 length])
  {
    id v8 = v7;
LABEL_5:
    v11 = v8;
    goto LABEL_7;
  }
  v9 = [v3 sectionID];
  int v10 = [v9 isEqualToString:@"com.apple.cmas"];

  if (v10)
  {
    id v8 = [v3 title];
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)allBulletins
{
  v2 = [(SASBulletinCache *)self->_bulletinCache allBulletins];
  id v3 = [v2 allValues];

  return v3;
}

- (id)bulletinsOnLockScreen
{
  return (id)[(NSMutableDictionary *)self->_bulletinsOnLockScreen allValues];
}

- (id)bulletinForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    bulletinCache = self->_bulletinCache;
    p_bulletinCache = (void **)&self->_bulletinCache;
    v7 = [(SASBulletinCache *)bulletinCache cachedBulletinForID:v4];
    if (!v7)
    {
      id v8 = (void *)*MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
        [(SASBulletinManager *)(uint64_t)v4 bulletinForIdentifier:v8];
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4E400]);
  [v8 setRead:0];
  [v8 setBulletin:v7];
  objc_initWeak(&location, self);
  v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke;
  block[3] = &unk_1E6B67F08;
  objc_copyWeak(v15, &location);
  id v13 = v8;
  id v14 = v7;
  v15[1] = (id)a5;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [WeakRetained _displayNameForBulletin:*(void *)(a1 + 40)];
    [v4 setDisplayName:v5];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke_2;
    block[3] = &unk_1E6B67EE0;
    void block[4] = v3;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addBulletinCompletionWithBulletin:*(void *)(a1 + 40) forFeed:*(void *)(a1 + 48)];
}

- (void)addBulletinCompletionWithBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6 = a3;
  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  id v8 = [v6 bulletinID];
  id v9 = [(NSMutableDictionary *)bulletinsOnLockScreen objectForKey:v8];

  objc_msgSend(v6, "setAvailableOnLockScreen:", objc_msgSend(v9, "availableOnLockScreen"));
  if ((a4 & 8) != 0)
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
      -[SASBulletinManager addBulletinCompletionWithBulletin:forFeed:](v10, v6);
    }
    [v6 setAvailableOnLockScreen:1];
    id v11 = self->_bulletinsOnLockScreen;
    v12 = [v6 bulletinID];
    [(NSMutableDictionary *)v11 setObject:v6 forKey:v12];
  }
  [(SASBulletinCache *)self->_bulletinCache insertBulletin:v6 fromFeed:a4];
  [(SASBulletinManager *)self _bulletinsDidChange];
}

- (void)observer:(id)a3 modifyBulletin:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  bulletinCache = self->_bulletinCache;
  uint64_t v7 = [v5 bulletinID];
  id v8 = [(SASBulletinCache *)bulletinCache cachedBulletinForID:v7];

  if (v8)
  {
    id v9 = self->_bulletinCache;
    uint64_t v10 = [v5 bulletinID];
    [(SASBulletinCache *)v9 removeBulletinForID:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F4E400]);
    [v11 setRead:0];
    [v11 setBulletin:v5];
    objc_initWeak((id *)location, self);
    v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SASBulletinManager_observer_modifyBulletin___block_invoke;
    block[3] = &unk_1E6B67B00;
    objc_copyWeak(&v20, (id *)location);
    id v18 = v11;
    id v19 = v5;
    id v13 = v11;
    dispatch_async(v12, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v14 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [v5 bulletinID];
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[SASBulletinManager observer:modifyBulletin:]";
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Trying to modify a bulletin %@ that I don't already have.", location, 0x16u);
    }
  }
}

void __46__SASBulletinManager_observer_modifyBulletin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [WeakRetained _displayNameForBulletin:*(void *)(a1 + 40)];
    [v4 setDisplayName:v5];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__SASBulletinManager_observer_modifyBulletin___block_invoke_2;
    v6[3] = &unk_1E6B67F30;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __46__SASBulletinManager_observer_modifyBulletin___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyBulletinCompletionWithBulletin:*(void *)(a1 + 40)];
}

- (void)modifyBulletinCompletionWithBulletin:(id)a3
{
  id v9 = a3;
  [(SASBulletinCache *)self->_bulletinCache insertBulletin:v9 fromFeed:65023];
  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  id v5 = [v9 bulletinID];
  id v6 = [(NSMutableDictionary *)bulletinsOnLockScreen objectForKey:v5];

  if (v6)
  {
    id v7 = self->_bulletinsOnLockScreen;
    id v8 = [v9 bulletinID];
    [(NSMutableDictionary *)v7 setObject:v9 forKey:v8];
  }
  [(SASBulletinManager *)self _bulletinsDidChange];
}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  id v6 = a3;
  id v7 = [a4 bulletinID];
  [(SASBulletinManager *)self observer:v6 purgeReferencesToBulletinID:v7];
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  char v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = v7;
  if ((v5 & 8) != 0)
  {
    id v9 = [v7 bulletinID];
    uint64_t v10 = [(NSMutableDictionary *)self->_bulletinsOnLockScreen objectForKey:v9];

    id v11 = *MEMORY[0x1E4F4E360];
    v12 = *MEMORY[0x1E4F4E360];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SASBulletinManager observer:removeBulletin:forFeed:]();
      }
      [(NSMutableDictionary *)self->_bulletinsOnLockScreen removeObjectForKey:v9];
      [(SASBulletinManager *)self _bulletinsDidChange];
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[SASBulletinManager observer:removeBulletin:forFeed:]";
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Asked to remove a bulletin from lock screen %@ that I don't already have.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SASBulletinCache *)self->_bulletinCache cachedBulletinForID:v5];

  if (v6)
  {
    [(SASBulletinCache *)self->_bulletinCache removeBulletinForID:v5];
    [(NSMutableDictionary *)self->_bulletinsOnLockScreen removeObjectForKey:v5];
    [(SASBulletinManager *)self _bulletinsDidChange];
  }
  else
  {
    id v7 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[SASBulletinManager observer:purgeReferencesToBulletinID:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Asked to remove a bulletin %@ that I don't already have.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        [(SASBulletinManager *)self observer:v6 purgeReferencesToBulletinID:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (SASBulletinManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SASBulletinManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bulletinsOnLockScreen, 0);
  objc_storeStrong((id *)&self->_bulletinCache, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)bulletinForIdentifier:(void *)a3 .cold.1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = *a2;
  id v5 = a3;
  id v6 = [v4 allBulletins];
  id v7 = [v6 allKeys];
  int v8 = 136315650;
  uint64_t v9 = "-[SASBulletinManager bulletinForIdentifier:]";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  long long v13 = v7;
  _os_log_debug_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEBUG, "%s Bulletin with identifier: %@ not found in cache with bulletinIDs: %@", (uint8_t *)&v8, 0x20u);
}

- (void)addBulletinCompletionWithBulletin:(void *)a1 forFeed:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 bbBulletin];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEBUG, "%s %@ added to lock screen feed", (uint8_t *)v5, 0x16u);
}

- (void)observer:removeBulletin:forFeed:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D9588000, v0, OS_LOG_TYPE_DEBUG, "%s %@ removed from lock screen feed", (uint8_t *)v1, 0x16u);
}

@end