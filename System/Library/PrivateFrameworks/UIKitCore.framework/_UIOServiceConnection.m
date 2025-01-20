@interface _UIOServiceConnection
+ (id)connectionWithBSServiceConnection:(id)a3 toServer:(id)a4;
- (BOOL)clientHasEntitlement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BSServiceConnectionHost)connection;
- (NSString)bundleIdentifier;
- (UIOServer)server;
- (int64_t)pid;
- (unint64_t)hash;
- (void)addObserver:(id)a3;
- (void)performOverlayServerAction:(id)a3;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)sendAction:(id)a3;
- (void)serviceConnectionDidInvalidate;
@end

@implementation _UIOServiceConnection

+ (id)connectionWithBSServiceConnection:(id)a3 toServer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (id *)objc_opt_new();
  objc_storeWeak(v7 + 2, v6);

  objc_storeWeak(v7 + 3, v5);
  return v7;
}

- (int64_t)pid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = [WeakRetained remoteProcess];
  v4 = [v3 auditToken];
  int64_t v5 = [v4 versionedPID];

  return v5;
}

- (NSString)bundleIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = [WeakRetained remoteProcess];
  v4 = [v3 bundleIdentifier];

  return (NSString *)v4;
}

- (void)performOverlayServerAction:(id)a3
{
  id v4 = a3;
  if ([v4 isPermitted])
  {
    [v4 performActionFromConnection:self];
  }
  else
  {
    int64_t v5 = UIOLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Action is not permitted. Check implementation of -isPermitted.", v6, 2u);
    }
  }
}

- (void)sendAction:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  int64_t v5 = [WeakRetained remoteTarget];
  [v5 performOverlayClientAction:v4];
}

- (BOOL)clientHasEntitlement:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIOServiceConnection *)self connection];
  id v6 = [v5 remoteProcess];
  v7 = [v6 auditToken];
  char v8 = [v7 hasEntitlement:v4];

  return v8;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)removeAllObservers
{
}

- (void)serviceConnectionDidInvalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "serviceConnectionDidInvalidate:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v4 = [WeakRetained hash];
  id v5 = objc_loadWeakRetained((id *)&self->_server);
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (BSServiceConnectionHost)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (BSServiceConnectionHost *)WeakRetained;
}

- (UIOServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (UIOServer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end