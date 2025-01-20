@interface WLKSettingsAMSBagTracker
+ (id)sharedTracker;
- (NSDictionary)trackedBagKeys;
- (WLKSettingsAMSBagTracker)init;
- (id)isNowPlayingEnabled;
- (void)_removeInactiveKeys:(id)a3;
- (void)_setIsNowPlayingEnabled:(BOOL)a3;
- (void)_updateBoolValueForTrackedKey:(id)a3;
- (void)_updateKeys:(id)a3;
- (void)setTrackedBagKeys:(id)a3;
- (void)updateTrackedBagValues;
- (void)updateTrackedBagValuesWithChangedKeys:(id)a3;
@end

@implementation WLKSettingsAMSBagTracker

+ (id)sharedTracker
{
  if (sharedTracker___once != -1) {
    dispatch_once(&sharedTracker___once, &__block_literal_global_13);
  }
  v2 = (void *)sharedTracker___singleInstance;

  return v2;
}

uint64_t __41__WLKSettingsAMSBagTracker_sharedTracker__block_invoke()
{
  sharedTracker___singleInstance = objc_alloc_init(WLKSettingsAMSBagTracker);

  return MEMORY[0x1F41817F8]();
}

- (WLKSettingsAMSBagTracker)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)WLKSettingsAMSBagTracker;
  v2 = [(WLKSettingsAMSBagTracker *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10[0] = kBagKeyUVSearchNowPlayingEnabled;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setValue:v4 forKey:@"uvSearch"];

    uint64_t v5 = [v3 copy];
    trackedBagKeys = v2->_trackedBagKeys;
    v2->_trackedBagKeys = (NSDictionary *)v5;

    v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AMSBagTracker_SportsEnabledKey", 0);
    [(WLKSettingsAMSBagTracker *)v2 _removeInactiveKeys:v7];
  }
  return v2;
}

- (void)updateTrackedBagValues
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - updateTrackedBagValues", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_trackedBagKeys;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = -[NSDictionary objectForKey:](self->_trackedBagKeys, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        [(WLKSettingsAMSBagTracker *)self _updateKeys:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)updateTrackedBagValuesWithChangedKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Update tracked bag values did change", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = -[NSDictionary objectForKey:](self->_trackedBagKeys, "objectForKey:", v11, (void)v14);

        if (v12)
        {
          long long v13 = [(NSDictionary *)self->_trackedBagKeys objectForKey:v11];
          [(WLKSettingsAMSBagTracker *)self _updateKeys:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)isNowPlayingEnabled
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v3 = [v2 objectForKey:@"AMSBagTracker_NowPlayingEnabledKey"];

  return v3;
}

- (void)_updateBoolValueForTrackedKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:kBagKeyUVSearchNowPlayingEnabled])
  {
    uint64_t v5 = [MEMORY[0x1E4FA9C70] app];
    id v6 = [v5 cachedBooleanForKey:v4];
    uint64_t v7 = [v6 BOOLValue];

    uint64_t v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Update now playing enabled: %d", (uint8_t *)v9, 8u);
    }

    [(WLKSettingsAMSBagTracker *)self _setIsNowPlayingEnabled:v7];
  }
}

- (void)_updateKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(WLKSettingsAMSBagTracker *)self _updateBoolValueForTrackedKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_setIsNowPlayingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"AMSBagTracker_NowPlayingEnabledKey"];
}

- (void)_removeInactiveKeys:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138412290;
    long long v14 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        long long v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults", v14);
        long long v11 = [v10 objectForKey:v9];

        if (v11)
        {
          long long v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
          [v12 removeObjectForKey:v9];

          long long v13 = WLKSystemLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v9;
            _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Removed object from user defaults for key: %@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }
}

- (NSDictionary)trackedBagKeys
{
  return self->_trackedBagKeys;
}

- (void)setTrackedBagKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end