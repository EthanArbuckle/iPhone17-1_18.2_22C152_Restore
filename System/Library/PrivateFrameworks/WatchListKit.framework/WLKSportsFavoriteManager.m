@interface WLKSportsFavoriteManager
+ (BOOL)isOptOutAvailable;
+ (id)defaultManager;
- (WLKSportsFavoriteCaching)_cache;
- (WLKSportsFavoriteManager)initWithCache:(id)a3;
- (id)_connection;
- (id)caller;
- (void)_getFavoritesIgnoringCache:(BOOL)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5;
- (void)_invalidationHandler;
- (void)_perform:(id)a3 completion:(id)a4;
- (void)_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 completion:(id)a6;
- (void)_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 completion:(id)a6;
- (void)_performUserSettingsOperation:(id)a3 completion:(id)a4;
- (void)addFavorites:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteLegacyCache;
- (void)favoritesWithCompletion:(id)a3;
- (void)getFavoritesIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)getFavoritesWithCompletion:(id)a3;
- (void)handleAccountDidChange:(id)a3;
- (void)handleRefreshCacheNotification;
- (void)handleSyncSettingChangedNotification;
- (void)isOnboarded:(id)a3;
- (void)removeFavorites:(id)a3 completion:(id)a4;
- (void)setOptInStatus:(BOOL)a3 completion:(id)a4;
- (void)set_cache:(id)a3;
- (void)watchlistd_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7;
- (void)watchlistd_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7;
@end

@implementation WLKSportsFavoriteManager

+ (id)defaultManager
{
  if (defaultManager___once_0 != -1) {
    dispatch_once(&defaultManager___once_0, &__block_literal_global_46);
  }
  v2 = (void *)defaultManager___defaultManager_0;

  return v2;
}

void __42__WLKSportsFavoriteManager_defaultManager__block_invoke()
{
  v0 = [WLKSportsFavoriteCache alloc];
  v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  v4 = [(WLKSportsFavoriteCache *)v0 initWithUserDefaults:v1];

  v2 = [[WLKSportsFavoriteManager alloc] initWithCache:v4];
  v3 = (void *)defaultManager___defaultManager_0;
  defaultManager___defaultManager_0 = (uint64_t)v2;
}

- (WLKSportsFavoriteManager)initWithCache:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WLKSportsFavoriteManager;
  v6 = [(WLKSportsFavoriteManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_xpcLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->__cache, a3);
    [(WLKSportsFavoriteManager *)v7 deleteLegacyCache];
    dispatch_queue_t v8 = dispatch_queue_create("WLKSportsFavoriteManagerQueue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v7);
    v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke;
    handler[3] = &unk_1E620A318;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification", &v7->_sportsFavoriteSyncSettingChangedNotificationToken, v10, handler);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_155;
    v14[3] = &unk_1E620A318;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification", &v7->_favoritesCacheSyncNotificationToken, v10, v14);

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel_handleAccountDidChange_ name:@"WLKAccountMonitorAccountDidChange" object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WLKIsDaemon() & 1) == 0)
  {
    v2 = WLKSystemLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Received opt in status changed notification, fetching cache", buf, 2u);
    }

    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_150;
    v3[3] = &unk_1E620BFA0;
    id v4 = WeakRetained;
    [v4 isOnboarded:v3];
  }
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_150(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = [NSNumber numberWithBool:a2];
  [v9 setObject:v10 forKey:@"WLKSportsFavoriteSyncSettingChangedNotificationOnboardingStatusKey"];

  if (v7) {
    [v9 setObject:v7 forKey:@"WLKSportsFavoriteSyncSettingChangedNotificationLastModifiedDateKey"];
  }
  if (v8) {
    [v9 setObject:v8 forKey:@"WLKSportsFavoriteSyncSettingChangedNotificationErrorKey"];
  }
  id v11 = WLKSystemLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Firing local opt in status changed notification", v13, 2u);
  }

  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"WLKSportsFavoriteSyncSettingChangedNotification" object:*(void *)(a1 + 32) userInfo:v9];
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_155(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WLKIsDaemon() & 1) == 0)
  {
    v2 = WLKSystemLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Received cache sync invalidation notification, fetching cache", buf, 2u);
    }

    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_156;
    v3[3] = &unk_1E620BFC8;
    id v4 = WeakRetained;
    [v4 favoritesWithCompletion:v3];
  }
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_156(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v7)
  {
    id v11 = (void *)[v7 copy];
    [v10 setObject:v11 forKey:@"WLKSportsFavoriteSyncCompletionNotificationFavoritesKey"];
  }
  if (v8) {
    [v10 setObject:v8 forKey:@"WLKSportsFavoriteSyncCompletionNotificationLastModifiedDateKey"];
  }
  if (v9) {
    [v10 setObject:v9 forKey:@"WLKSportsFavoriteSyncCompletionNotificationErrorKey"];
  }
  v12 = WLKSystemLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Firing local cache sync complete notification", v14, 2u);
  }

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"WLKSportsFavoriteSyncCompletionNotification" object:*(void *)(a1 + 32) userInfo:v10];
}

- (void)deleteLegacyCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__WLKSportsFavoriteManager_deleteLegacyCache__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  if (deleteLegacyCache___once != -1) {
    dispatch_once(&deleteLegacyCache___once, block);
  }
}

uint64_t __45__WLKSportsFavoriteManager_deleteLegacyCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) deleteLegacyCacheWithCompletion:0];
}

- (void)handleAccountDidChange:(id)a3
{
  [(WLKSportsFavoriteCaching *)self->__cache invalidate];
  v3 = (void *)MEMORY[0x1E4FA9C68];

  [v3 accountDidChange];
}

- (id)caller
{
  if (WLKIsNewsApp()) {
    return @"apple-news";
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  int favoritesCacheSyncNotificationToken = self->_favoritesCacheSyncNotificationToken;
  if (favoritesCacheSyncNotificationToken) {
    notify_cancel(favoritesCacheSyncNotificationToken);
  }
  int sportsFavoriteSyncSettingChangedNotificationToken = self->_sportsFavoriteSyncSettingChangedNotificationToken;
  if (sportsFavoriteSyncSettingChangedNotificationToken) {
    notify_cancel(sportsFavoriteSyncSettingChangedNotificationToken);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)WLKSportsFavoriteManager;
  [(WLKSportsFavoriteManager *)&v6 dealloc];
}

- (id)_connection
{
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    connection = self->_connection;
    self->_connection = v4;

    objc_super v6 = self->_connection;
    id v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = self->_connection;
    id v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_168];
    objc_initWeak(&location, self);
    id v10 = self->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __39__WLKSportsFavoriteManager__connection__block_invoke_169;
    v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  id v11 = self->_connection;

  return v11;
}

void __39__WLKSportsFavoriteManager__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Connection interrupted.", v1, 2u);
  }
}

void __39__WLKSportsFavoriteManager__connection__block_invoke_169(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidationHandler];
}

- (void)_invalidationHandler
{
  v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void)handleRefreshCacheNotification
{
  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__WLKSportsFavoriteManager_handleRefreshCacheNotification__block_invoke;
    block[3] = &unk_1E620A708;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __58__WLKSportsFavoriteManager_handleRefreshCacheNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistd_performAction:withIDs:caller:overrideLastModifiedDate:completion:", 0, 0, 0, 1, &__block_literal_global_171);
}

- (void)handleSyncSettingChangedNotification
{
  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__WLKSportsFavoriteManager_handleSyncSettingChangedNotification__block_invoke;
    block[3] = &unk_1E620A708;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __64__WLKSportsFavoriteManager_handleSyncSettingChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistd_performUserSettingsAction:setFavoritesSyncEnabled:caller:overrideLastModifiedDate:completion:", 0, 0, 0, 1, &__block_literal_global_174);
}

+ (BOOL)isOptOutAvailable
{
  return 1;
}

- (void)isOnboarded:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  char v5 = WLKCheckAuthentication(&v11);
  id v6 = v11;
  if (v5)
  {
    cache = self->__cache;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke;
    v9[3] = &unk_1E620C060;
    v9[4] = self;
    id v10 = v4;
    [(WLKSportsFavoriteCaching *)cache hasFavoritesSyncEnabledKey:v9];
  }
  else
  {
    id v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v6);
  }
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(v2 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2;
    v8[3] = &unk_1E620C010;
    id v9 = *(id *)(a1 + 40);
    [v3 isOptedIn:v8];
    id v4 = v9;
  }
  else
  {
    char v5 = *(NSObject **)(v2 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_176;
    block[3] = &unk_1E620A870;
    block[4] = v2;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
    id v4 = v7;
  }
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - isOnboarded reply with cached onboarding state: %d, lastModified: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_176(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [v2 caller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2_177;
  v5[3] = &unk_1E620B8C8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _performUserSettingsAction:0 setFavoritesSyncEnabled:0 caller:v3 completion:v5];
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_3;
  v7[3] = &unk_1E620C038;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 isOptedIn:v7];
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 debugDescription];
    id v8 = [*(id *)(a1 + 32) localizedDescription];
    v9[0] = 67109634;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - isOnboarded reply with fresh onboarding state: %d, lastModified: %@, error: %@", (uint8_t *)v9, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setOptInStatus:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v14 = 0;
  char v7 = WLKCheckAuthentication(&v14);
  id v8 = v14;
  if (v7)
  {
    if (v4
      || +[WLKSportsFavoriteManager isOptOutAvailable])
    {
      id v9 = [(WLKSportsFavoriteManager *)self caller];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__WLKSportsFavoriteManager_setOptInStatus_completion___block_invoke;
      v12[3] = &unk_1E620A368;
      id v13 = v6;
      [(WLKSportsFavoriteManager *)self _performUserSettingsAction:1 setFavoritesSyncEnabled:v4 caller:v9 completion:v12];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKSportsFavoriteErrorDomain" code:-2 userInfo:0];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    __int16 v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

uint64_t __54__WLKSportsFavoriteManager_setOptInStatus_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)favoritesWithCompletion:(id)a3
{
}

- (void)getFavoritesWithCompletion:(id)a3
{
}

- (void)addFavorites:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WLKSportsFavoriteManager *)self caller];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__WLKSportsFavoriteManager_addFavorites_completion___block_invoke;
  v10[3] = &unk_1E620C088;
  id v11 = v6;
  id v9 = v6;
  [(WLKSportsFavoriteManager *)self _performAction:1 withIDs:v7 caller:v8 completion:v10];
}

uint64_t __52__WLKSportsFavoriteManager_addFavorites_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFavorites:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WLKSportsFavoriteManager *)self caller];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__WLKSportsFavoriteManager_removeFavorites_completion___block_invoke;
  v10[3] = &unk_1E620C088;
  id v11 = v6;
  id v9 = v6;
  [(WLKSportsFavoriteManager *)self _performAction:2 withIDs:v7 caller:v8 completion:v10];
}

uint64_t __55__WLKSportsFavoriteManager_removeFavorites_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getFavoritesIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__WLKSportsFavoriteManager_getFavoritesIgnoringCache_completion___block_invoke;
  v8[3] = &unk_1E620C088;
  id v9 = v6;
  id v7 = v6;
  [(WLKSportsFavoriteManager *)self _getFavoritesIgnoringCache:v4 overrideLastModifiedDate:0 completion:v8];
}

uint64_t __65__WLKSportsFavoriteManager_getFavoritesIgnoringCache_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getFavoritesIgnoringCache:(BOOL)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  id v15 = 0;
  char v8 = WLKCheckAuthentication(&v15);
  id v9 = v15;
  if (v8)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke;
    v12[3] = &unk_1E620BC50;
    void v12[4] = self;
    BOOL v14 = a3;
    id v13 = v7;
    dispatch_async(queue, v12);
  }
  else
  {
    id v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v9);
  }
}

void __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) hasCache] && !*(unsigned char *)(a1 + 48))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke_2;
    v5[3] = &unk_1E620C0B0;
    id v6 = *(id *)(a1 + 40);
    [v3 getFavoritesWithCompletion:v5];
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v4 = [v2 caller];
    [v2 _performAction:0 withIDs:0 caller:v4 completion:*(void *)(a1 + 40)];
  }
}

uint64_t __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = 0;
  char v13 = WLKCheckAuthentication(&v32);
  id v14 = v32;
  if (v13)
  {
    if (WLKIsDaemon() & 1) != 0 || (WLKIsRunningTest())
    {
      [(WLKSportsFavoriteManager *)self watchlistd_performAction:a3 withIDs:v10 caller:v11 overrideLastModifiedDate:0 completion:v12];
    }
    else
    {
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      char v31 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke;
      v27[3] = &unk_1E620C0D8;
      v29 = v30;
      id v28 = v12;
      v16 = (void *)MEMORY[0x1BA9E94D0](v27);
      id v17 = WLKSystemLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Performing sports favorites action over xpc.", buf, 2u);
      }

      v18 = [(WLKSportsFavoriteManager *)self _connection];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_180;
      v24[3] = &unk_1E620A438;
      id v19 = v16;
      id v25 = v19;
      v20 = [v18 remoteObjectProxyWithErrorHandler:v24];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_182;
      v22[3] = &unk_1E620C088;
      id v21 = v19;
      id v23 = v21;
      [v20 performSportsFavoritesAction:a3 ids:v10 caller:v11 completion:v22];

      _Block_object_dispose(v30, 8);
    }
  }
  else
  {
    id v15 = WLKSystemLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, void, id))v12 + 2))(v12, 0, 0, v14);
  }
}

uint64_t __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_182(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        id v15 = +[WLKSportsFavoriteFactory favoriteWithID:v14];
        [v11 addObject:v15];
      }
      uint64_t v10 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v31 = 0;
  char v12 = WLKCheckAuthentication(&v31);
  id v13 = v31;
  if (v12)
  {
    if (WLKIsDaemon() & 1) != 0 || (WLKIsRunningTest())
    {
      [(WLKSportsFavoriteManager *)self watchlistd_performUserSettingsAction:a3 setFavoritesSyncEnabled:v7 caller:v10 overrideLastModifiedDate:0 completion:v11];
    }
    else
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      char v30 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke;
      v26[3] = &unk_1E620C100;
      id v28 = v29;
      id v27 = v11;
      id v15 = (void *)MEMORY[0x1BA9E94D0](v26);
      v16 = WLKSystemLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Performing sports favorites (user settings) action over xpc.", buf, 2u);
      }

      long long v17 = [(WLKSportsFavoriteManager *)self _connection];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_183;
      v23[3] = &unk_1E620A438;
      id v18 = v15;
      id v24 = v18;
      long long v19 = [v17 remoteObjectProxyWithErrorHandler:v23];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_184;
      v21[3] = &unk_1E620A368;
      id v20 = v18;
      id v22 = v20;
      [v19 performSportsFavoritesAction:a3 favoritesSyncEnabled:v7 caller:v10 completion:v21];

      _Block_object_dispose(v29, 8);
    }
  }
  else
  {
    uint64_t v14 = WLKSystemLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

uint64_t __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_183(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)watchlistd_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v26 = 0;
  char v15 = WLKCheckAuthentication(&v26);
  id v16 = v26;
  if (v15)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke;
    block[3] = &unk_1E620C1A0;
    unint64_t v24 = a3;
    id v20 = v12;
    id v21 = v13;
    id v22 = self;
    BOOL v25 = a6;
    id v23 = v14;
    dispatch_async(queue, block);
  }
  else
  {
    id v18 = WLKSystemLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, void, id))v14 + 2))(v14, 0, 0, v16);
  }
}

void __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[WLKSportsFavoriteRequestOperation alloc] initWithAction:*(void *)(a1 + 64) ids:*(void *)(a1 + 32) caller:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_2;
  v5[3] = &unk_1E620C178;
  id v4 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  void v5[4] = v4;
  char v9 = *(unsigned char *)(a1 + 72);
  id v7 = v3;
  id v6 = *(id *)(a1 + 32);
  [v4 _perform:v2 completion:v5];
}

void __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8 == 2)
  {
    if (!v6)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15)
      {
        id v16 = *(void **)(*(void *)(a1 + 32) + 40);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_5;
        v25[3] = &unk_1E620C150;
        id v12 = &v27;
        id v17 = *(id *)(a1 + 48);
        id v14 = (id *)&v26;
        uint64_t v26 = 0;
        id v27 = v17;
        [v16 removeFavorites:v15 completion:v25];
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    if (!v6)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      if (v19)
      {
        id v20 = *(void **)(*(void *)(a1 + 32) + 40);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_4;
        v28[3] = &unk_1E620C150;
        id v12 = &v30;
        id v21 = *(id *)(a1 + 48);
        id v14 = (id *)&v29;
        uint64_t v29 = 0;
        id v30 = v21;
        [v20 addFavorites:v19 completion:v28];
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (v8 || v6)
  {
LABEL_10:
    id v18 = *(void **)(*(void *)(a1 + 32) + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_6;
    v22[3] = &unk_1E620C150;
    id v12 = &v24;
    id v24 = *(id *)(a1 + 48);
    id v14 = &v23;
    id v23 = v7;
    [v18 getFavoritesWithCompletion:v22];
    goto LABEL_11;
  }
  char v9 = *(void **)(*(void *)(a1 + 32) + 40);
  id v10 = [v5 favorites];
  uint64_t v11 = *(unsigned __int8 *)(a1 + 64);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_3;
  v31[3] = &unk_1E620C128;
  id v12 = &v33;
  id v13 = *(id *)(a1 + 48);
  id v14 = (id *)&v32;
  uint64_t v32 = 0;
  id v33 = v13;
  char v34 = *(unsigned char *)(a1 + 64);
  [v9 setCache:v10 overrideLastModifiedDate:v11 completion:v31];

LABEL_11:
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v4, 0xCu);
    }

    return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
  }
  return result;
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v5, 0xCu);
  }

  return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v5, 0xCu);
  }

  return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

- (void)watchlistd_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v25 = 0;
  char v14 = WLKCheckAuthentication(&v25);
  id v15 = v25;
  if (v14)
  {
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke;
    v18[3] = &unk_1E620C240;
    unint64_t v22 = a3;
    BOOL v23 = a4;
    id v19 = v12;
    id v20 = self;
    id v21 = v13;
    BOOL v24 = a6;
    dispatch_async(queue, v18);
  }
  else
  {
    id v17 = WLKSystemLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WLKSportsFavoriteManager isOnboarded:]();
    }

    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
  }
}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [WLKUserSettingsRequestOperation alloc];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = [[WLKUserSettings alloc] initWithFavoritesSyncEnabled:*(unsigned __int8 *)(a1 + 64)];
  int v5 = [(WLKUserSettingsRequestOperation *)v2 initWithAction:v3 userSettings:v4 caller:*(void *)(a1 + 32)];

  uint64_t v6 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_2;
  v9[3] = &unk_1E620C218;
  v9[4] = v6;
  id v7 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 65);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 _performUserSettingsOperation:v5 completion:v9];
}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_3;
    v18[3] = &unk_1E620C1C8;
    uint64_t v8 = &v20;
    id v20 = *(id *)(a1 + 40);
    char v9 = &v19;
    id v19 = v6;
    [v7 isOptedIn:v18];
  }
  else
  {
    uint64_t v10 = [v5 favoritesSyncEnabled];
    if (*(unsigned char *)(a1 + 56)) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = *(void *)(a1 + 48) == 1;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_189;
    v14[3] = &unk_1E620C1F0;
    uint64_t v8 = &v15;
    id v15 = v5;
    char v9 = (id *)v16;
    id v12 = *(id *)(a1 + 40);
    char v17 = *(unsigned char *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 48);
    v16[0] = v12;
    v16[1] = v13;
    [v7 setOptInStatus:v10 overrideLastModifiedDate:v11 completion:v14];
  }
}

uint64_t __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - returning cached value for sports onboarding state: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) favoritesSyncEnabled];
    int v7 = 67109120;
    LODWORD(v8) = v5;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - returning new value for sports onboarding state: %d", (uint8_t *)&v7, 8u);
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) favoritesSyncEnabled], v3);
  if (*(unsigned char *)(a1 + 56) || *(void *)(a1 + 48) == 1)
  {
    id v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification";
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v7, 0xCu);
    }

    notify_post("com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification");
  }
}

- (void)_perform:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (([v5 action] == 1 || objc_msgSend(v5, "action") == 2)
    && ([v5 ids],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    uint64_t v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action will not be executed -- empty ids parameter.", (uint8_t *)location, 2u);
    }

    BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKSportsFavoriteErrorDomain" code:-1 userInfo:0];
    v6[2](v6, 0, v11);
  }
  else
  {
    objc_initWeak(location, v5);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __48__WLKSportsFavoriteManager__perform_completion___block_invoke;
    id v15 = &unk_1E6209FD0;
    objc_copyWeak(&v17, location);
    id v16 = v6;
    [v5 setCompletionBlock:&v12];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultQueue", v12, v13, v14, v15);
    [v9 addOperation:v5];

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
}

void __48__WLKSportsFavoriteManager__perform_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained error];
  int v4 = WLKXPCSafeErrorFromError(v3);

  id v5 = WLKSystemLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = [v4 localizedDescription];
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action failed -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v4);
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = [0 localizedDescription];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action succeeded -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v9, 0);
  }
}

- (void)_performUserSettingsOperation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, void, void *))a4;
  if ([v5 action] == 1
    && ([v5 userSettings], int v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    uint64_t v9 = WLKSystemLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action will not be executed -- empty userSettings parameter.", (uint8_t *)location, 2u);
    }

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKSportsFavoriteErrorDomain" code:-1 userInfo:0];
    v6[2](v6, 0, v10);
  }
  else
  {
    objc_initWeak(location, v5);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __69__WLKSportsFavoriteManager__performUserSettingsOperation_completion___block_invoke;
    __int16 v14 = &unk_1E6209FD0;
    objc_copyWeak(&v16, location);
    uint64_t v15 = v6;
    [v5 setCompletionBlock:&v11];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultQueue", v11, v12, v13, v14);
    [v8 addOperation:v5];

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
}

void __69__WLKSportsFavoriteManager__performUserSettingsOperation_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained error];
  int v4 = WLKXPCSafeErrorFromError(v3);

  id v5 = WLKSystemLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = [v4 localizedDescription];
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action failed -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v4);
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = [0 localizedDescription];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action succeeded -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v9, 0);
  }
}

- (WLKSportsFavoriteCaching)_cache
{
  return (WLKSportsFavoriteCaching *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_cache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cache, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isOnboarded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKSportsFavorites - User is not signed in, returning early with error %@", v2, v3, v4, v5, v6);
}

@end