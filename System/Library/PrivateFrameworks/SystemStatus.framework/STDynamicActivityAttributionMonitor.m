@interface STDynamicActivityAttributionMonitor
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (STDynamicActivityAttributionMonitor)init;
- (STDynamicActivityAttributionMonitor)initWithServerHandle:(id)a3;
- (id)attributionForAttribution:(id)a3;
- (id)attributionForClient:(id *)a3;
- (id)currentAttributions;
- (id)handler;
- (void)activate;
- (void)currentAttributionsDidChange:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setHandler:(id)a3;
@end

@implementation STDynamicActivityAttributionMonitor

- (STDynamicActivityAttributionMonitor)init
{
  v3 = +[STDynamicAttributionXPCServerHandle sharedMachServiceServerHandle];
  v4 = [(STDynamicActivityAttributionMonitor *)self initWithServerHandle:v3];

  return v4;
}

- (STDynamicActivityAttributionMonitor)initWithServerHandle:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STDynamicActivityAttributionMonitor;
  v6 = [(STDynamicActivityAttributionMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_lock_server, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_attributions = v7->_lock_attributions;
    v7->_lock_attributions = v8;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_lock_invalidated)
  {
    v4 = [NSString stringWithFormat:@"invalidate must be called before this object is released"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"STDynamicActivityAttributionMonitor.m";
      __int16 v17 = 1024;
      int v18 = 47;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D9553830);
  }
  v8.receiver = self;
  v8.super_class = (Class)STDynamicActivityAttributionMonitor;
  [(STDynamicActivityAttributionMonitor *)&v8 dealloc];
}

- (void)activate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    id v5 = [NSString stringWithFormat:@"can't re-activate an invalidated monitor"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (objc_class *)objc_opt_class();
      objc_super v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      __int16 v11 = v6;
      __int16 v12 = 2114;
      __int16 v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"STDynamicActivityAttributionMonitor.m";
      __int16 v18 = 1024;
      int v19 = 52;
      __int16 v20 = 2114;
      uint64_t v21 = v5;
      _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D95539C4);
  }
  v9 = self->_lock_server;
  os_unfair_lock_unlock(p_lock);
  [(STDynamicActivityAttributionServerHandle *)v9 subscribeToUpdates:self];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v7 = 0;
  }
  else
  {
    v7 = self->_lock_server;
    self->_lock_invalidated = 1;
    lock_attributions = self->_lock_attributions;
    self->_lock_attributions = 0;

    id lock_handler = self->_lock_handler;
    self->_id lock_handler = 0;

    lock_server = self->_lock_server;
    self->_lock_server = 0;
  }
  os_unfair_lock_unlock(p_lock);
  [(STDynamicActivityAttributionServerHandle *)v7 unsubscribeFromUpdates:self];
}

- (id)handler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E01644A0](self->_lock_handler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1E01644A0](v4);

  return v5;
}

- (void)setHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)[v5 copy];

  id lock_handler = self->_lock_handler;
  self->_id lock_handler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)currentAttributions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_lock_attributions allValues];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)attributionForClient:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_attributions = self->_lock_attributions;
  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", BSVersionedPIDForAuditToken(), *(void *)a3->var0, *(void *)&a3->var0[2], *(void *)&a3->var0[4], *(void *)&a3->var0[6]);
  objc_super v8 = [(NSMutableDictionary *)lock_attributions objectForKey:v7];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)attributionForAttribution:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  v6 = [(STDynamicActivityAttributionMonitor *)self attributionForClient:v20];
  if (!v6)
  {
    int v7 = [v5 pid];
    if (v7 < 1)
    {
      v6 = 0;
    }
    else
    {
      int v8 = v7;
      os_unfair_lock_lock(&self->_lock);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = [(NSMutableDictionary *)self->_lock_attributions allKeys];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v8 == [v14 unsignedLongLongValue])
            {
              v6 = [(NSMutableDictionary *)self->_lock_attributions objectForKey:v14];
              goto LABEL_16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      v6 = 0;
LABEL_16:

      os_unfair_lock_unlock(&self->_lock);
    }
  }

  return v6;
}

- (void)currentAttributionsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    id v5 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "%@: Attributions did change: %@", buf, 0x16u);
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_attributions removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        lock_attributions = self->_lock_attributions;
        __int16 v14 = NSNumber;
        if (v12) {
          [*(id *)(*((void *)&v18 + 1) + 8 * i) clientAuditToken];
        }
        __int16 v15 = [v14 numberWithLongLong:BSVersionedPIDForAuditToken()];
        [(NSMutableDictionary *)lock_attributions setObject:v12 forKey:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  long long v16 = (void (**)(void, void))MEMORY[0x1E01644A0](self->_lock_handler);
  long long v17 = [(NSMutableDictionary *)self->_lock_attributions allValues];
  os_unfair_lock_unlock(p_lock);
  if (v16) {
    ((void (**)(void, void *))v16)[2](v16, v17);
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)MEMORY[0x1F410C158](self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_attributions, 0);
  objc_storeStrong((id *)&self->_lock_server, 0);

  objc_storeStrong(&self->_lock_handler, 0);
}

@end