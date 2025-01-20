@interface STDynamicActivityAttributionManager
- (STDynamicActivityAttributionManager)init;
- (id)currentAttributedAppForClient:(id)a3;
- (id)currentAttributionForAttribution:(id)a3;
- (id)currentAttributionForClient:(id *)a3;
- (id)currentAttributionKeyForClient:(id)a3;
- (id)initWithLocalManager:(id *)a1;
- (void)dealloc;
- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5;
- (void)subscribeToUpdates:(id)a3;
- (void)unsubscribeFromUpdates:(id)a3;
@end

@implementation STDynamicActivityAttributionManager

- (STDynamicActivityAttributionManager)init
{
  if (_os_feature_enabled_impl())
  {
    v3 = -[STDynamicActivityAttributionManager initWithLocalManager:]((id *)&self->super.isa, 0);
  }
  else
  {
    v4 = objc_alloc_init(STLocalDynamicActivityAttributionManager);
    v3 = -[STDynamicActivityAttributionManager initWithLocalManager:]((id *)&self->super.isa, v4);
  }
  return v3;
}

- (id)initWithLocalManager:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)STDynamicActivityAttributionManager;
    v5 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_DWORD *)v5 + 2) = 0;
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      id v7 = a1[4];
      a1[4] = (id)v6;

      objc_storeStrong(a1 + 2, a2);
      if (!v4)
      {
        v8 = objc_alloc_init(STDynamicActivityAttributionMonitor);
        id v9 = a1[3];
        a1[3] = v8;

        [a1[3] activate];
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (STDynamicActivityAttributionManager *)self->_monitor;
  }
  [(STDynamicActivityAttributionManager *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionManager;
  [(STDynamicActivityAttributionManager *)&v3 dealloc];
}

- (id)currentAttributionKeyForClient:(id)a3
{
  id v4 = a3;
  if (self)
  {
    v5 = self->_localManager;
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [(STLocalDynamicActivityAttributionManager *)v5 currentAttributionKeyForClient:v4];
      goto LABEL_6;
    }
    monitor = self->_monitor;
  }
  else
  {
    monitor = 0;
  }
  id v9 = monitor;
  v10 = [(STDynamicActivityAttributionMonitor *)v9 currentAttributions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__STDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke;
  v14[3] = &unk_1E6B63120;
  objc_super v11 = (STLocalDynamicActivityAttributionManager *)v4;

  v15 = v11;
  v12 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);

  id v7 = [v12 localizationKey];

  uint64_t v6 = v15;
LABEL_6:

  return v7;
}

uint64_t __70__STDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 clientExecutablePath];
  id v4 = [v3 lastPathComponent];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)currentAttributedAppForClient:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = self->_localManager;
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [(STLocalDynamicActivityAttributionManager *)v5 currentAttributedAppForClient:v4];
      goto LABEL_6;
    }
    monitor = self->_monitor;
  }
  else
  {
    monitor = 0;
  }
  id v9 = monitor;
  v10 = [(STDynamicActivityAttributionMonitor *)v9 currentAttributions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__STDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke;
  v14[3] = &unk_1E6B63120;
  objc_super v11 = (STLocalDynamicActivityAttributionManager *)v4;

  v15 = v11;
  v12 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);

  id v7 = [v12 bundleIdentifier];

  uint64_t v6 = v15;
LABEL_6:

  return v7;
}

uint64_t __69__STDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 clientExecutablePath];
  id v4 = [v3 lastPathComponent];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)currentAttributionForClient:(id *)a3
{
  if (self)
  {
    id v4 = self;
    uint64_t v5 = self->_localManager;
    if (v5)
    {
      uint64_t v6 = v5;
      long long v7 = *(_OWORD *)&a3->var0[4];
      long long v11 = *(_OWORD *)a3->var0;
      long long v12 = v7;
      v8 = [(STLocalDynamicActivityAttributionManager *)v5 currentAttributionForClient:&v11];

      goto LABEL_6;
    }
    self = (STDynamicActivityAttributionManager *)v4->_monitor;
  }
  long long v9 = *(_OWORD *)&a3->var0[4];
  long long v11 = *(_OWORD *)a3->var0;
  long long v12 = v9;
  v8 = [(STDynamicActivityAttributionManager *)self attributionForClient:&v11];
LABEL_6:

  return v8;
}

- (id)currentAttributionForAttribution:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = self->_localManager;
    if (v5)
    {
      uint64_t v6 = v5;
      long long v7 = [(STLocalDynamicActivityAttributionManager *)v5 currentAttributionForAttribution:v4];

      goto LABEL_6;
    }
    monitor = self->_monitor;
  }
  else
  {
    monitor = 0;
  }
  long long v7 = [(STDynamicActivityAttributionMonitor *)monitor attributionForAttribution:v4];
LABEL_6:

  return v7;
}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      long long v11 = v10;
      [(STLocalDynamicActivityAttributionManager *)v10 setLocalizableAttributionKey:v12 andApplication:v8 forClient:v9];
    }
  }
}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      long long v11 = v10;
      long long v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      [(STLocalDynamicActivityAttributionManager *)v10 setAttributionLocalizableKey:v8 maskingClientAuditToken:v13 forClient:v9];
    }
  }
}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      long long v11 = v10;
      long long v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      [(STLocalDynamicActivityAttributionManager *)v10 setAttributionStringWithFormat:v8 maskingClientAuditToken:v13 forClient:v9];
    }
  }
}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      long long v11 = v10;
      long long v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      [(STLocalDynamicActivityAttributionManager *)v10 setAttributionWebsiteString:v8 maskingClientAuditToken:v13 forClient:v9];
    }
  }
}

- (void)subscribeToUpdates:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = self->_localManager;
    if (v5)
    {
      uint64_t v6 = (NSMutableSet *)v5;
      [(STLocalDynamicActivityAttributionManager *)v5 subscribeToUpdates:v4];
      goto LABEL_10;
    }
    p_clientLock = &self->_clientLock;
    os_unfair_lock_lock(&self->_clientLock);
    lock_registeredClients = self->_lock_registeredClients;
  }
  else
  {
    p_clientLock = (os_unfair_lock_s *)8;
    os_unfair_lock_lock((os_unfair_lock_t)8);
    lock_registeredClients = 0;
  }
  uint64_t v6 = lock_registeredClients;
  uint64_t v9 = [(NSMutableSet *)v6 count];
  [(NSMutableSet *)v6 addObject:v4];
  os_unfair_lock_unlock(p_clientLock);
  if (self) {
    monitor = self->_monitor;
  }
  else {
    monitor = 0;
  }
  long long v11 = monitor;
  objc_initWeak(&location, self);
  if (!v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke;
    v18[3] = &unk_1E6B63148;
    objc_copyWeak(&v19, &location);
    v18[4] = self;
    [(STDynamicActivityAttributionMonitor *)v11 setHandler:v18];
    objc_destroyWeak(&v19);
  }
  long long v12 = [(STDynamicActivityAttributionMonitor *)v11 currentAttributions];
  v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke_2;
  block[3] = &unk_1E6B63080;
  id v16 = v4;
  id v17 = v12;
  id v14 = v12;
  dispatch_async(v13, block);

  objc_destroyWeak(&location);
LABEL_10:
}

void __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock(WeakRetained + 2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 32);
  }
  else {
    uint64_t v6 = 0;
  }
  long long v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(WeakRetained + 2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "currentAttributionsDidChange:", v3, (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

uint64_t __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) currentAttributionsDidChange:*(void *)(a1 + 40)];
}

- (void)unsubscribeFromUpdates:(id)a3
{
  id v10 = a3;
  if (self)
  {
    id v4 = self->_localManager;
    if (v4)
    {
      uint64_t v5 = (NSMutableSet *)v4;
      [(STLocalDynamicActivityAttributionManager *)v4 unsubscribeFromUpdates:v10];
      goto LABEL_9;
    }
    p_clientLock = &self->_clientLock;
    os_unfair_lock_lock(&self->_clientLock);
    lock_registeredClients = self->_lock_registeredClients;
  }
  else
  {
    p_clientLock = (os_unfair_lock_s *)8;
    os_unfair_lock_lock((os_unfair_lock_t)8);
    lock_registeredClients = 0;
  }
  uint64_t v5 = lock_registeredClients;
  [(NSMutableSet *)v5 removeObject:v10];
  uint64_t v8 = [(NSMutableSet *)v5 count];
  os_unfair_lock_unlock(p_clientLock);
  if (!v8)
  {
    if (self) {
      monitor = self->_monitor;
    }
    else {
      monitor = 0;
    }
    [(STDynamicActivityAttributionMonitor *)monitor setHandler:0];
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_registeredClients, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_localManager, 0);
}

@end