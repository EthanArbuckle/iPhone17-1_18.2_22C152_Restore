@interface WLKPostPlayAutoPlayCache
+ (void)_postLocalNotificationForType:(unint64_t)a3 status:(BOOL)a4 error:(id)a5;
- (BOOL)_cacheResultForType:(unint64_t)a3;
- (BOOL)currentSettingForType:(unint64_t)a3;
- (BOOL)hasCacheForType:(unint64_t)a3;
- (BOOL)isWaitingForConnection;
- (WLKPostPlayAutoPlayCache)initWithUserDefaults:(id)a3;
- (id)_cacheKeyForType:(unint64_t)a3;
- (id)currentSettings;
- (void)_setEnabled:(BOOL)a3 type:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setIsWaitingForConnection:(BOOL)a3;
- (void)updateWithSettings:(id)a3;
@end

@implementation WLKPostPlayAutoPlayCache

- (BOOL)isWaitingForConnection
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"auto-play-is-waiting-for-connection-status"];
}

- (void)updateWithSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - update cache for post play auto-play settings: %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = [v4 nextEpisodeSettingValue];

  if (v6)
  {
    v7 = [v4 nextEpisodeSettingValue];
    uint64_t v8 = [v7 BOOLValue];

    [(WLKPostPlayAutoPlayCache *)self _setEnabled:v8 type:1];
  }
  v9 = [v4 recommendedItemsSettingValue];

  if (v9)
  {
    v10 = [v4 recommendedItemsSettingValue];
    uint64_t v11 = [v10 BOOLValue];

    [(WLKPostPlayAutoPlayCache *)self _setEnabled:v11 type:2];
  }
}

- (void)_setEnabled:(BOOL)a3 type:(unint64_t)a4
{
  BOOL v5 = a3;
  *(void *)&v19[5] = *MEMORY[0x1E4F143B8];
  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
    int v18 = 67109378;
    v19[0] = v5;
    LOWORD(v19[1]) = 2112;
    *(void *)((char *)&v19[1] + 2) = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - setting cache for post play auto-play state: %d, type: %@", (uint8_t *)&v18, 0x12u);
  }
  v9 = [(WLKPostPlayAutoPlayCache *)self _cacheKeyForType:a4];
  if ([(WLKPostPlayAutoPlayCache *)self hasCacheForType:a4]) {
    int v10 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:v9];
  }
  else {
    int v10 = 1;
  }
  userDefaults = self->_userDefaults;
  int v12 = [NSNumber numberWithBool:v5];
  [(NSUserDefaults *)userDefaults setObject:v12 forKey:v9];

  if (v10 != v5)
  {
    if (a4 == 2)
    {
      id v13 = WLKSystemLogObject();
      uint64_t v14 = "com.apple.WatchListKit.WLKPostPlayAutoPlayRecommendedItemsStatusChangedNotification";
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        *(void *)v19 = "com.apple.WatchListKit.WLKPostPlayAutoPlayRecommendedItemsStatusChangedNotification";
        _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - posting (cross process) notification %s", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v15 = 20;
      goto LABEL_15;
    }
    if (a4 == 1)
    {
      id v13 = WLKSystemLogObject();
      uint64_t v14 = "com.apple.WatchListKit.WLKPostPlayAutoPlayNextEpisodeStatusChangedNotification";
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        *(void *)v19 = "com.apple.WatchListKit.WLKPostPlayAutoPlayNextEpisodeStatusChangedNotification";
        _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - posting (cross process) notification %s", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v15 = 16;
LABEL_15:

      int v16 = *(_DWORD *)((char *)&self->super.isa + v15);
      pid_t v17 = getpid();
      notify_set_state(v16, v17);
      notify_post(v14);
    }
  }
}

- (BOOL)hasCacheForType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[WLKPostPlayAutoPlayCache _cacheKeyForType:](self, "_cacheKeyForType:");
  v6 = [(NSUserDefaults *)self->_userDefaults objectForKey:v5];

  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    v9 = [NSNumber numberWithBool:v6 != 0];
    int v11 = 138412546;
    int v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - hasCacheForType: %@, hasCache: %@", (uint8_t *)&v11, 0x16u);
  }
  return v6 != 0;
}

- (id)_cacheKeyForType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = @"auto-play-recommended-items-status";
  if (a3 != 2) {
    id v4 = 0;
  }
  if (a3 == 1) {
    BOOL v5 = @"auto-play-next-episode-status";
  }
  else {
    BOOL v5 = v4;
  }
  v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a3];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - _cacheKeyForType: %@, key: %@", (uint8_t *)&v9, 0x16u);
  }
  return v5;
}

- (WLKPostPlayAutoPlayCache)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WLKPostPlayAutoPlayCache;
  v6 = [(WLKPostPlayAutoPlayCache *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    objc_initWeak(&location, v7);
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__WLKPostPlayAutoPlayCache_initWithUserDefaults___block_invoke;
    handler[3] = &unk_1E620AAB8;
    int v10 = v7;
    pid_t v17 = v10;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKPostPlayAutoPlayNextEpisodeStatusChangedNotification", &v7->_postPlayAutoPlayNextEpisodeSettingChangedNotificationToken, v8, handler);
    __int16 v11 = MEMORY[0x1E4F14428];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__WLKPostPlayAutoPlayCache_initWithUserDefaults___block_invoke_19;
    v13[3] = &unk_1E620AAB8;
    uint64_t v14 = v10;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKPostPlayAutoPlayRecommendedItemsStatusChangedNotification", v10 + 5, v11, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v7;
}

void __49__WLKPostPlayAutoPlayCache_initWithUserDefaults___block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 16), &state64);
  if (state64 != getpid())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v3 = WLKSystemLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Received post play auto-play next episode status changed notification, fetching cache", v4, 2u);
      }

      objc_msgSend((id)objc_opt_class(), "_postLocalNotificationForType:status:error:", 1, objc_msgSend(WeakRetained, "_cacheResultForType:", 1), 0);
    }
  }
}

void __49__WLKPostPlayAutoPlayCache_initWithUserDefaults___block_invoke_19(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 20), &state64);
  if (state64 != getpid())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v3 = WLKSystemLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Received post play auto-play recommended items status changed notification, fetching cache", v4, 2u);
      }

      objc_msgSend((id)objc_opt_class(), "_postLocalNotificationForType:status:error:", 2, objc_msgSend(WeakRetained, "_cacheResultForType:", 2), 0);
    }
  }
}

- (void)dealloc
{
  int postPlayAutoPlayNextEpisodeSettingChangedNotificationToken = self->_postPlayAutoPlayNextEpisodeSettingChangedNotificationToken;
  if (postPlayAutoPlayNextEpisodeSettingChangedNotificationToken) {
    notify_cancel(postPlayAutoPlayNextEpisodeSettingChangedNotificationToken);
  }
  int postPlayAutoPlayRecommendedItemsSettingChangedNotificationToken = self->_postPlayAutoPlayRecommendedItemsSettingChangedNotificationToken;
  if (postPlayAutoPlayRecommendedItemsSettingChangedNotificationToken) {
    notify_cancel(postPlayAutoPlayRecommendedItemsSettingChangedNotificationToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)WLKPostPlayAutoPlayCache;
  [(WLKPostPlayAutoPlayCache *)&v5 dealloc];
}

- (void)invalidate
{
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"auto-play-next-episode-status"];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"auto-play-recommended-items-status"];
  userDefaults = self->_userDefaults;

  [(NSUserDefaults *)userDefaults removeObjectForKey:@"auto-play-is-waiting-for-connection-status"];
}

- (id)currentSettings
{
  v3 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
  BOOL v4 = [(WLKPostPlayAutoPlayCache *)self _cacheResultForType:1];
  objc_super v5 = [NSNumber numberWithBool:v4];
  [(WLKPostPlayAutoPlaySettings *)v3 setNextEpisodeSettingValue:v5];

  BOOL v6 = [(WLKPostPlayAutoPlayCache *)self _cacheResultForType:2];
  v7 = [NSNumber numberWithBool:v6];
  [(WLKPostPlayAutoPlaySettings *)v3 setRecommendedItemsSettingValue:v7];

  return v3;
}

- (BOOL)currentSettingForType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(WLKPostPlayAutoPlayCache *)self currentSettings];
  objc_super v5 = v4;
  if (a3 == 2)
  {
    BOOL v6 = [v4 recommendedItemsSettingValue];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    BOOL v6 = [v4 nextEpisodeSettingValue];
LABEL_5:
    v7 = v6;
    uint64_t v8 = [v6 BOOLValue];

    goto LABEL_7;
  }
  uint64_t v8 = 1;
LABEL_7:
  id v9 = WLKSystemLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [NSNumber numberWithUnsignedInteger:a3];
    __int16 v11 = [NSNumber numberWithBool:v8];
    int v13 = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    int v16 = v11;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - currentSettingForType: %@, enabled: %@", (uint8_t *)&v13, 0x16u);
  }
  return v8;
}

- (void)setIsWaitingForConnection:(BOOL)a3
{
  userDefaults = self->_userDefaults;
  if (a3) {
    [(NSUserDefaults *)userDefaults setBool:1 forKey:@"auto-play-is-waiting-for-connection-status"];
  }
  else {
    [(NSUserDefaults *)userDefaults removeObjectForKey:@"auto-play-is-waiting-for-connection-status"];
  }
}

+ (void)_postLocalNotificationForType:(unint64_t)a3 status:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Firing local post play auto-play status changed notification for type: %@", buf, 0xCu);
  }
  if (a3 - 1 >= 2) {
    +[WLKPostPlayAutoPlayCache _postLocalNotificationForType:status:error:]();
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v11 = [NSNumber numberWithBool:v5];
  [v10 setObject:v11 forKey:@"WLKPostPlayAutoPlaySettingChangedNotificationStatusKey"];

  if (v7) {
    [v10 setObject:v7 forKey:@"WLKPostPlayAutoPlaySettingChangedNotificationErrorKey"];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__WLKPostPlayAutoPlayCache__postLocalNotificationForType_status_error___block_invoke;
  v13[3] = &unk_1E6209F68;
  uint64_t v14 = @"WLKPostPlayAutoPlayNextEpisodeSettingChangedNotification";
  id v15 = v10;
  id v12 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __71__WLKPostPlayAutoPlayCache__postLocalNotificationForType_status_error___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:0 userInfo:*(void *)(a1 + 40)];
}

- (BOOL)_cacheResultForType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (-[WLKPostPlayAutoPlayCache hasCacheForType:](self, "hasCacheForType:"))
  {
    BOOL v5 = [(WLKPostPlayAutoPlayCache *)self _cacheKeyForType:a3];
    BOOL v6 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:v5];
    id v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 1024;
      BOOL v14 = v6;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - cached post play auto-play type: %@, state: %d", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    BOOL v5 = WLKSystemLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - No cache result for type: %@, default to YES", (uint8_t *)&v11, 0xCu);
    }
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
}

+ (void)_postLocalNotificationForType:status:error:.cold.1()
{
  __assert_rtn("+[WLKPostPlayAutoPlayCache _postLocalNotificationForType:status:error:]", "WLKPostPlayAutoPlayCache.m", 180, "notificationName != nil");
}

@end