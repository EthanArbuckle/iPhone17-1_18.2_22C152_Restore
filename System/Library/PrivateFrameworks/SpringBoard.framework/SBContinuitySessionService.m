@interface SBContinuitySessionService
- (SBContinuitySessionFactory)sessionFactory;
- (SBContinuitySessionService)init;
- (SBContinuitySessionService)initWithServiceListenerFactory:(id)a3;
- (void)activate;
- (void)clientDidConnect:(id)a3;
- (void)clientDidDisconnect:(id)a3;
- (void)setSessionFactory:(id)a3;
@end

@implementation SBContinuitySessionService

- (SBContinuitySessionService)init
{
  v3 = objc_alloc_init(SBContinuitySessionServiceConnectionListenerFactory);
  v4 = [(SBContinuitySessionService *)self initWithServiceListenerFactory:v3];

  return v4;
}

- (SBContinuitySessionService)initWithServiceListenerFactory:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuitySessionService;
  v5 = [(SBContinuitySessionService *)&v12 init];
  if (v5)
  {
    v6 = (void *)BSDispatchQueueCreateWithQualityOfService();
    uint64_t v7 = [v4 newContinuitySessionServiceListenerForDelegate:v5 serviceQueue:v6];
    serviceConnectionListener = v5->_serviceConnectionListener;
    v5->_serviceConnectionListener = (_SBContinuitySessionServiceConnectionListening *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sessions = v5->_sessions;
    v5->_sessions = (NSMapTable *)v9;
  }
  return v5;
}

- (void)activate
{
}

- (void)clientDidConnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __47__SBContinuitySessionService_clientDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) succinctDescription];
    int v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "client connected: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  v5 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"SBContinuitySessionService.m" lineNumber:54 description:@"already have a session for this client"];

    if (WeakRetained) {
      goto LABEL_5;
    }
LABEL_7:
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"SBContinuitySessionService.m" lineNumber:55 description:@"client connected but we don't have a session factory to hook him up to"];

    goto LABEL_5;
  }
  if (!WeakRetained) {
    goto LABEL_7;
  }
LABEL_5:
  v6 = (void *)[WeakRetained newContinuitySession];
  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v6 forKey:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setSession:v6];
  [*(id *)(a1 + 32) setDelegate:v6];
  [v6 continuitySessionServiceClientConnected:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) continuitySessionDidUpdateState:v6];
}

- (void)clientDidDisconnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __50__SBContinuitySessionService_clientDidDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) succinctDescription];
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "client disconnected: %{public}@ invalidating session", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setSession:0];
  [*(id *)(a1 + 32) setDelegate:0];
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.client-disconnected"];
  [v4 invalidateForReasons:v5];

  [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:*(void *)(a1 + 32)];
}

- (SBContinuitySessionFactory)sessionFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionFactory);
  return (SBContinuitySessionFactory *)WeakRetained;
}

- (void)setSessionFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionFactory);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end