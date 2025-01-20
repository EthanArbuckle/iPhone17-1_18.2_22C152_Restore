@interface SBFocusAppConfigurationContextMonitor
+ (id)sharedInstance;
- (SBFocusAppConfigurationContextMonitor)init;
- (id)targetContentIdentifierPrefixForBundleIdentifier:(id)a3;
- (void)_updatePrefixes:(id)a3;
- (void)modeConfigurationService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4;
@end

@implementation SBFocusAppConfigurationContextMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25 != -1) {
    dispatch_once(&sharedInstance_onceToken_25, &__block_literal_global_180);
  }
  v2 = (void *)sharedInstance_monitor;
  return v2;
}

void __55__SBFocusAppConfigurationContextMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBFocusAppConfigurationContextMonitor);
  v1 = (void *)sharedInstance_monitor;
  sharedInstance_monitor = (uint64_t)v0;
}

- (SBFocusAppConfigurationContextMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBFocusAppConfigurationContextMonitor;
  v2 = [(SBFocusAppConfigurationContextMonitor *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.springboard.focusappconfigurationcontextmonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v2->_lock);
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    lock_prefixes = v2->_lock_prefixes;
    v2->_lock_prefixes = (NSDictionary *)v6;

    os_unfair_lock_unlock(&v2->_lock);
    uint64_t v8 = [MEMORY[0x1E4F5F690] serviceForClientIdentifier:@"com.apple.springboard.focusappconfigurationcontextmonitor"];
    configurationService = v2->_configurationService;
    v2->_configurationService = (DNDModeConfigurationService *)v8;

    v10 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SBFocusAppConfigurationContextMonitor_init__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

void __45__SBFocusAppConfigurationContextMonitor_init__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addListener:*(void *)(a1 + 32) withCompletionHandler:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = 0;
  v3 = [v2 getAppConfigurationTargetContentIdentifierPrefixesForCurrentModeReturningError:&v6];
  id v4 = v6;
  if (v3)
  {
    [*(id *)(a1 + 32) _updatePrefixes:v3];
  }
  else
  {
    v5 = SBLogFocusModes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (id)targetContentIdentifierPrefixForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(NSDictionary *)self->_lock_prefixes objectForKey:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)modeConfigurationService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __123__SBFocusAppConfigurationContextMonitor_modeConfigurationService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  v8[3] = &unk_1E6AF5290;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __123__SBFocusAppConfigurationContextMonitor_modeConfigurationService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v7 = 0;
  id v4 = [v3 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v2 error:&v7];
  id v5 = v7;
  if (v4)
  {
    [*(id *)(a1 + 32) _updatePrefixes:v4];
  }
  else
  {
    id v6 = SBLogFocusModes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
}

- (void)_updatePrefixes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 copy];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "bundleID", (void)v18);
        v13 = [v6 objectForKey:v11];
        objc_super v14 = [v13 anyObject];

        if (v14) {
          [v5 setObject:v14 forKey:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  v15 = (NSDictionary *)[v5 copy];
  lock_prefixes = self->_lock_prefixes;
  self->_lock_prefixes = v15;

  os_unfair_lock_unlock(&self->_lock);
  v17 = SBLogFocusModes();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "FocusAppConfigurationContextMonitor updated prefixes. prefixes=%@", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationService, 0);
  objc_storeStrong((id *)&self->_lock_prefixes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "FocusAppConfigurationContextMonitor error fetching target content identifier prefixes. error=%@", (uint8_t *)&v2, 0xCu);
}

@end