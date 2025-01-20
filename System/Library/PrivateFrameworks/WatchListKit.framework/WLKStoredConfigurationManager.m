@interface WLKStoredConfigurationManager
+ (id)sharedInstance;
- (WLKStoredConfiguration)storedConfiguration;
- (WLKStoredConfigurationManager)init;
- (void)_handleAccountChange:(id)a3;
- (void)_handleLibraryChange:(id)a3;
- (void)_invalidateWithReason:(id)a3;
- (void)_setStoredConfiguration:(id)a3;
- (void)_updateConfiguration:(id)a3;
- (void)dealloc;
- (void)setStoredConfiguration:(id)a3;
@end

@implementation WLKStoredConfigurationManager

void __54__WLKStoredConfigurationManager__updateConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = WLKSystemLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Unsupported type in rrkvp key:%@ obj:%@", (uint8_t *)&v13, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (WLKStoredConfigurationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WLKStoredConfigurationManager;
  v3 = [(WLKStoredConfigurationManager *)&v7 init];
  if (v3 == self)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__handleLibraryChange_ name:@"WLKAppLibraryDidChangeNotification" object:0];
    v5 = +[WLKAccountMonitor sharedInstance];
    [v4 addObserver:self selector:sel__handleAccountChange_ name:@"WLKAccountMonitorAccountDidChange" object:v5];
  }
  return v3;
}

- (void)_updateConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - _updateConfiguration", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isActiveUser"));
  [v6 setObject:v7 forKeyedSubscript:@"activeUser"];
  id v8 = [v4 vppaStatusString];
  if ([v8 length]) {
    [v6 setObject:v8 forKeyedSubscript:@"vppaState"];
  }
  v9 = [v4 utsc];
  if ([v9 length]) {
    [v6 setObject:v9 forKeyedSubscript:@"utsc"];
  }
  v10 = [v4 requiredRequestKeyValuePairsDictionary];
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__WLKStoredConfigurationManager__updateConfiguration___block_invoke;
  v12[3] = &unk_1E620A0F8;
  v12[4] = buf;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];
  if (v14[24])
  {
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"rrkvp"];
    }
    if ([v6 count]) {
      [(WLKStoredConfigurationManager *)self _setStoredConfiguration:v6];
    }
  }
  else
  {
    id v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v17 = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Unsupported type in rrkvp %@. Will not persist.", v17, 0xCu);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)_setStoredConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  v5 = [v4 objectForKey:@"storedConfig"];
  id v6 = v3;
  id v7 = v5;
  id v8 = v7;
  if (v7 == v6)
  {
  }
  else
  {
    if (v6 && v7)
    {
      char v9 = [v6 isEqual:v7];

      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Stored config did change. Posting notification from:%@ to:%@", (uint8_t *)&v16, 0x16u);
    }

    pid_t v11 = getpid();
    notify_set_state(0, v11);
    notify_post("com.apple.WatchListKit.WLKStoredConfigurationDidChangeDispatchNotification");
    if (v6)
    {
      [v4 setObject:v6 forKey:@"storedConfig"];
      id v12 = NSNumber;
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSince1970];
      uint64_t v15 = [v12 numberWithDouble:floor(v14)];
      [v4 setObject:v15 forKey:@"storedConfigTimestamp"];
    }
    else
    {
      [v4 removeObjectForKey:@"storedConfig"];
      [v4 removeObjectForKey:@"storedConfigTimestamp"];
    }
  }
LABEL_13:
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_48);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

uint64_t __47__WLKStoredConfigurationManager_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_alloc_init(WLKStoredConfigurationManager);

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLKStoredConfigurationManager;
  [(WLKStoredConfigurationManager *)&v4 dealloc];
}

- (void)_invalidateWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Invalidating for reason: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WLKStoredConfigurationManager__invalidateWithReason___block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__WLKStoredConfigurationManager__invalidateWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStoredConfiguration:0];
}

- (void)_handleLibraryChange:(id)a3
{
}

- (void)_handleAccountChange:(id)a3
{
}

- (WLKStoredConfiguration)storedConfiguration
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  id v3 = [v2 objectForKey:@"storedConfig"];
  if (v3)
  {
    id v4 = objc_alloc_init(WLKStoredConfiguration);
    -[WLKStoredConfiguration setActiveUser:](v4, "setActiveUser:", objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", @"activeUser", 0));
    v5 = objc_msgSend(v3, "wlk_stringForKey:", @"vppaState");
    [(WLKStoredConfiguration *)v4 setVppaState:v5];
    id v6 = objc_msgSend(v3, "wlk_stringForKey:", @"utsc");
    [(WLKStoredConfiguration *)v4 setUtsc:v6];
    id v7 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"rrkvp");
    [(WLKStoredConfiguration *)v4 setRequiredRequestKeyValuePairs:v7];
    id v8 = [v2 objectForKey:@"storedConfigTimestamp"];
    uint64_t v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v8 doubleValue];
      pid_t v11 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
      [(WLKStoredConfiguration *)v4 setTimestamp:v11];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setStoredConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end