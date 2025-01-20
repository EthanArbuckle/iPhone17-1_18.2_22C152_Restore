@interface MRClientApplicationConnectionManager
+ (MRClientApplicationConnectionManager)sharedManager;
- (MRClientApplicationConnectionManager)init;
- (NSMapTable)connections;
- (NSMapTable)handoffSessionHandlers;
- (NSMapTable)listenerPendingConnections;
- (NSMapTable)listeners;
- (id)connectionForIdentifier:(id)a3;
- (id)handoffSessionHandlerForPlayerPath:(id)a3;
- (id)listenerForServiceName:(id)a3 playerPath:(id)a4;
- (os_unfair_lock_s)lock;
- (void)listenerForHandlingConnection:(id)a3 completion:(id)a4;
- (void)registerConnection:(id)a3;
- (void)registerHandoffSessionHandlerForPlayerPath:(id)a3 handler:(id)a4;
- (void)registerListener:(id)a3;
- (void)unregisterConnection:(id)a3;
@end

@implementation MRClientApplicationConnectionManager

- (MRClientApplicationConnectionManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRClientApplicationConnectionManager;
  v2 = [(MRClientApplicationConnectionManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    connections = v3->_connections;
    v3->_connections = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    listeners = v3->_listeners;
    v3->_listeners = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    listenerPendingConnections = v3->_listenerPendingConnections;
    v3->_listenerPendingConnections = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    handoffSessionHandlers = v3->_handoffSessionHandlers;
    v3->_handoffSessionHandlers = (NSMapTable *)v10;
  }
  return v3;
}

+ (MRClientApplicationConnectionManager)sharedManager
{
  if (sharedManager___once_1 != -1) {
    dispatch_once(&sharedManager___once_1, &__block_literal_global_41);
  }
  v2 = (void *)sharedManager___shared_0;

  return (MRClientApplicationConnectionManager *)v2;
}

uint64_t __53__MRClientApplicationConnectionManager_sharedManager__block_invoke()
{
  sharedManager___shared_0 = objc_alloc_init(MRClientApplicationConnectionManager);

  return MEMORY[0x1F41817F8]();
}

- (void)registerListener:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [v4 serviceName];
  uint64_t v6 = [v4 playerPath];
  v7 = [(MRClientApplicationConnectionManager *)self listeners];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v9 = [(MRClientApplicationConnectionManager *)self listeners];
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    [v9 setObject:v10 forKey:v6];
  }
  v11 = [(MRClientApplicationConnectionManager *)self listeners];
  v12 = [v11 objectForKey:v6];

  objc_super v13 = [v12 objectForKey:v5];

  if (v13)
  {
    v14 = _MRLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      [(MRClientApplicationConnectionManager *)v5 registerListener:v14];
    }
  }
  v36 = v12;
  v38 = (void *)v5;
  [v12 setObject:v4 forKey:v5];
  v15 = _MRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v4 serviceName];
    *(_DWORD *)buf = 138412546;
    v54 = v16;
    __int16 v55 = 2112;
    uint64_t v56 = v6;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRClientApplicationConnectionManager] Registered listener for service: %@, path: %@", buf, 0x16u);
  }
  v37 = (void *)v6;

  [MEMORY[0x1E4F1CA48] array];
  v40 = v39 = self;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = self->_listenerPendingConnections;
  uint64_t v17 = [(NSMapTable *)obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v21 = [v20 context];
        id v22 = [v21 destinationPlayerPath];
        id v23 = [v4 playerPath];
        if (v22 == v23)
        {
        }
        else
        {
          char v24 = [v22 isEqual:v23];

          if ((v24 & 1) == 0)
          {

            goto LABEL_23;
          }
        }
        id v25 = [v20 serviceName];
        id v26 = [v4 serviceName];
        if (v25 == v26)
        {

LABEL_22:
          v21 = [(NSMapTable *)v39->_listenerPendingConnections objectForKey:v20];
          id v22 = (id)MEMORY[0x1997190F0]();
          [v40 addObject:v22];
LABEL_23:

          continue;
        }
        v27 = v26;
        char v28 = [v25 isEqual:v26];

        if (v28) {
          goto LABEL_22;
        }
      }
      uint64_t v18 = [(NSMapTable *)obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v18);
  }

  os_unfair_lock_unlock(locka);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = v40;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v43 + 1) + 8 * j) + 16))();
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v31);
  }
}

- (id)listenerForServiceName:(id)a3 playerPath:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = [(MRClientApplicationConnectionManager *)self listeners];
  uint64_t v10 = [v9 objectForKey:v7];

  v11 = [v10 objectForKey:v8];

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)registerConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(MRClientApplicationConnectionManager *)self connections];
  id v7 = [v5 identifier];
  [v6 setObject:v5 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(MRClientApplicationConnectionManager *)self connections];
  id v7 = [v5 identifier];

  [v6 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)connectionForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(MRClientApplicationConnectionManager *)self connections];
  id v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)listenerForHandlingConnection:(id)a3 completion:(id)a4
{
  id v16 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(MRClientApplicationConnectionManager *)self listeners];
  v9 = [v16 context];
  uint64_t v10 = [v9 destinationPlayerPath];
  v11 = [v8 objectForKey:v10];

  v12 = [v16 serviceName];
  objc_super v13 = [v11 objectForKey:v12];

  if (v13)
  {
    os_unfair_lock_unlock(&self->_lock);
    v6[2](v6, v13);
  }
  else
  {
    listenerPendingConnections = self->_listenerPendingConnections;
    v15 = (void *)MEMORY[0x1997190F0](v6);
    [(NSMapTable *)listenerPendingConnections setObject:v15 forKey:v16];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)registerHandoffSessionHandlerForPlayerPath:(id)a3 handler:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  handoffSessionHandlers = self->_handoffSessionHandlers;
  uint64_t v10 = (void *)MEMORY[0x1997190F0](v7);

  [(NSMapTable *)handoffSessionHandlers setObject:v10 forKey:v8];

  os_unfair_lock_unlock(p_lock);
}

- (id)handoffSessionHandlerForPlayerPath:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(NSMapTable *)self->_handoffSessionHandlers objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  id v7 = (void *)MEMORY[0x1997190F0](v6);

  return v7;
}

- (NSMapTable)connections
{
  return self->_connections;
}

- (NSMapTable)listeners
{
  return self->_listeners;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMapTable)listenerPendingConnections
{
  return self->_listenerPendingConnections;
}

- (NSMapTable)handoffSessionHandlers
{
  return self->_handoffSessionHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffSessionHandlers, 0);
  objc_storeStrong((id *)&self->_listenerPendingConnections, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)registerListener:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_194F3C000, log, OS_LOG_TYPE_FAULT, "[MRClientApplicationConnectionManager] registerListener - registering duplicate listener for service: %@, playerPath: %@", (uint8_t *)&v3, 0x16u);
}

@end