@interface WFVoiceShortcutCache
- (BOOL)isEnabled;
- (NSArray)voiceShortcuts;
- (NSMutableArray)waitingFetchRequests;
- (WFVoiceShortcutCache)init;
- (unint64_t)state;
- (void)clear;
- (void)databaseDidChange;
- (void)dealloc;
- (void)getCachedVoiceShortcuts:(id)a3;
- (void)registerForDatabaseNotifications;
- (void)setCachedVoiceShortcuts:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setVoiceShortcuts:(id)a3;
- (void)unregisterFromDatabaseNotifications;
@end

@implementation WFVoiceShortcutCache

- (WFVoiceShortcutCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFVoiceShortcutCache;
  v2 = [(WFVoiceShortcutCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    waitingFetchRequests = v2->_waitingFetchRequests;
    v2->_waitingFetchRequests = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = +[VCAccessSpecifier accessSpecifierForCurrentProcess];
    v2->_enabled = [v5 allowUnrestrictedAccess] ^ 1;
    v6 = v2;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingFetchRequests, 0);
  objc_storeStrong((id *)&self->_voiceShortcuts, 0);
}

- (unint64_t)state
{
  return self->_state;
}

- (NSMutableArray)waitingFetchRequests
{
  return self->_waitingFetchRequests;
}

- (NSArray)voiceShortcuts
{
  return self->_voiceShortcuts;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)databaseDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[WFVoiceShortcutCache databaseDidChange]";
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEBUG, "%s Shortcuts database changed - clearing out voice shortcuts cache.", (uint8_t *)&v4, 0xCu);
  }

  [(WFVoiceShortcutCache *)self clear];
}

- (void)unregisterFromDatabaseNotifications
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification" object:0];
}

- (void)registerForDatabaseNotifications
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_databaseDidChange name:@"com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification" object:0];
}

- (void)setVoiceShortcuts:(id)a3
{
  v5 = (NSArray *)a3;
  p_voiceShortcuts = &self->_voiceShortcuts;
  if (self->_voiceShortcuts != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_voiceShortcuts, a3);
    p_voiceShortcuts = (NSArray **)[(WFVoiceShortcutCache *)self registerForDatabaseNotifications];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_voiceShortcuts, v5);
}

- (void)clear
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WFVoiceShortcutCache *)self setVoiceShortcuts:0];
  os_unfair_lock_unlock(p_lock);
}

- (void)setCachedVoiceShortcuts:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WFVoiceShortcutCache.m", 86, @"Invalid parameter not satisfying: %@", @"setterBlock" object file lineNumber description];
  }
  if ([(WFVoiceShortcutCache *)self isEnabled])
  {
    os_unfair_lock_lock(&self->_lock);
    if ([(WFVoiceShortcutCache *)self state] == 1)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      self->_state = 1;
      os_unfair_lock_unlock(&self->_lock);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__WFVoiceShortcutCache_setCachedVoiceShortcuts___block_invoke_2;
      v7[3] = &unk_1E6078028;
      v7[4] = self;
      v5[2](v5, v7);
    }
  }
  else
  {
    v5[2](v5, __block_literal_global_7050);
  }
}

void __48__WFVoiceShortcutCache_setCachedVoiceShortcuts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) setVoiceShortcuts:v3];
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  int v4 = [*(id *)(a1 + 32) waitingFetchRequests];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [*(id *)(a1 + 32) waitingFetchRequests];
  [v6 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
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
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)getCachedVoiceShortcuts:(id)a3
{
  id aBlock = a3;
  if (!aBlock)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFVoiceShortcutCache.m", 64, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];
  }
  if ([(WFVoiceShortcutCache *)self isEnabled])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = [(WFVoiceShortcutCache *)self state];
    if (v6 == 1)
    {
      uint64_t v10 = [(WFVoiceShortcutCache *)self waitingFetchRequests];
      uint64_t v11 = _Block_copy(aBlock);
      [v10 addObject:v11];

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      id v7 = aBlock;
      if (v6) {
        goto LABEL_10;
      }
      uint64_t v8 = [(WFVoiceShortcutCache *)self voiceShortcuts];
      uint64_t v9 = (void *)[v8 copy];

      os_unfair_lock_unlock(p_lock);
      (*((void (**)(id, void *))aBlock + 2))(aBlock, v9);
    }
  }
  else
  {
    uint64_t v6 = (*((uint64_t (**)(id, void))aBlock + 2))(aBlock, 0);
  }
  id v7 = aBlock;
LABEL_10:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)dealloc
{
  [(WFVoiceShortcutCache *)self unregisterFromDatabaseNotifications];
  v3.receiver = self;
  v3.super_class = (Class)WFVoiceShortcutCache;
  [(WFVoiceShortcutCache *)&v3 dealloc];
}

@end