@interface MRGroupSessionDiscovery
- (MRGroupSessionDiscovery)initWithDelegate:(id)a3;
- (MRGroupSessionDiscoveryDelegate)delegate;
- (MRGroupSessionInfo)activeSession;
- (MRGroupSessionXPCConnection)connection;
- (NSSet)discoveredSessions;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (id)debugDescription;
- (os_unfair_lock_s)lock;
- (void)activeSessionDidChange:(id)a3;
- (void)discoveredSessionsDidChange:(id)a3;
- (void)handleDidRestoreConnectionNotification;
- (void)initializeConnection;
- (void)notifyDelegateWithActiveSession:(id)a3;
- (void)notifyDelegateWithDiscoveredSessions:(id)a3;
- (void)registerNotifications;
- (void)setActiveSession:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDiscoveredSessions:(id)a3;
@end

@implementation MRGroupSessionDiscovery

- (MRGroupSessionDiscovery)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRGroupSessionDiscovery;
  v5 = [(MRGroupSessionDiscovery *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = MRGroupSessionSubsystemGetNotificationQueue();
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionDiscovery.callbackQueue", v7, v8);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v4);
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    discoveredSessions = v6->_discoveredSessions;
    v6->_discoveredSessions = (NSSet *)v11;

    [(MRGroupSessionDiscovery *)v6 registerNotifications];
    [(MRGroupSessionDiscovery *)v6 initializeConnection];
  }

  return v6;
}

- (void)initializeConnection
{
  objc_initWeak(&location, self);
  v3 = [MRGroupSessionXPCConnection alloc];
  id v4 = [MEMORY[0x1E4F77A40] proxyWithObject:self protocol:&unk_1EE69DA18];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke;
  v7[3] = &unk_1E57D12D0;
  objc_copyWeak(&v8, &location);
  v5 = [(MRGroupSessionXPCConnection *)v3 initWithClientObject:v4 invalidationHandler:v7];

  [(MRGroupSessionDiscovery *)self setConnection:v5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_8;
  v6[3] = &unk_1E57D7440;
  v6[4] = self;
  [(MRGroupSessionXPCConnection *)v5 sendMessage:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_cold_1((uint64_t)WeakRetained, v2);
    }

    [WeakRetained setConnection:0];
    v3 = [MEMORY[0x1E4F1CAD0] set];
    [WeakRetained discoveredSessionsDidChange:v3];

    [WeakRetained activeSessionDidChange:0];
  }
}

uint64_t __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_8(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_2;
  v3[3] = &unk_1E57D7418;
  v3[4] = *(void *)(a1 + 32);
  return [a2 connectToDiscoveryWithReply:v3];
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v8 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ XPC connection initialized with state: activeSession=%@, discoveredSessions=%@", (uint8_t *)&v10, 0x20u);
  }

  [*(id *)(a1 + 32) notifyDelegateWithDiscoveredSessions:v6];
  [*(id *)(a1 + 32) notifyDelegateWithActiveSession:v7];
}

- (void)registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleDidRestoreConnectionNotification name:@"kMRMediaRemoteServiceClientDidRestoreConnectionNotification" object:0];
}

- (void)handleDidRestoreConnectionNotification
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionDiscovery] %@ Daemon connection restored. Re-initializing", (uint8_t *)&v4, 0xCu);
  }

  [(MRGroupSessionDiscovery *)self initializeConnection];
}

- (id)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = [NSString stringWithFormat:@"<%@: %p - activeSession=%@,discoveredSessions=%@>", objc_opt_class(), self, self->_activeSession, self->_discoveredSessions];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setConnection:(id)a3
{
  int v4 = (MRGroupSessionXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  self->_connection = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (MRGroupSessionInfo)activeSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_activeSession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSSet)discoveredSessions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_discoveredSessions;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)discoveredSessionsDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_discoveredSessions, a3);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ Discovered sessions changed: %@", (uint8_t *)&v7, 0x16u);
  }

  [(MRGroupSessionDiscovery *)self notifyDelegateWithDiscoveredSessions:v5];
}

- (void)activeSessionDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_activeSession, a3);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ Active session changed: %@", (uint8_t *)&v7, 0x16u);
  }

  [(MRGroupSessionDiscovery *)self notifyDelegateWithActiveSession:v5];
}

- (void)notifyDelegateWithDiscoveredSessions:(id)a3
{
  id v4 = a3;
  id v5 = [(MRGroupSessionDiscovery *)self delegate];
  if (v5)
  {
    uint64_t v6 = [(MRGroupSessionDiscovery *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MRGroupSessionDiscovery_notifyDelegateWithDiscoveredSessions___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v8 = v5;
    __int16 v9 = self;
    id v10 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __64__MRGroupSessionDiscovery_notifyDelegateWithDiscoveredSessions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSessionDiscovery:*(void *)(a1 + 40) discoveredSessionsDidChange:*(void *)(a1 + 48)];
}

- (void)notifyDelegateWithActiveSession:(id)a3
{
  id v4 = a3;
  id v5 = [(MRGroupSessionDiscovery *)self delegate];
  if (v5)
  {
    uint64_t v6 = [(MRGroupSessionDiscovery *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MRGroupSessionDiscovery_notifyDelegateWithActiveSession___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v8 = v5;
    __int16 v9 = self;
    id v10 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __59__MRGroupSessionDiscovery_notifyDelegateWithActiveSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSessionDiscovery:*(void *)(a1 + 40) activeSessionDidChange:*(void *)(a1 + 48)];
}

- (void)setDiscoveredSessions:(id)a3
{
}

- (void)setActiveSession:(id)a3
{
}

- (MRGroupSessionXPCConnection)connection
{
  return self->_connection;
}

- (MRGroupSessionDiscoveryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRGroupSessionDiscoveryDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);

  objc_storeStrong((id *)&self->_discoveredSessions, 0);
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRGroupSessionDiscovery] %@ XPC connection invalidated", (uint8_t *)&v2, 0xCu);
}

@end