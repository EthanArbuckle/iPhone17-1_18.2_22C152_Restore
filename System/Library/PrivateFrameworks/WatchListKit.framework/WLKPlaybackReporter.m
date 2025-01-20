@interface WLKPlaybackReporter
- (WLKPlaybackReporter)init;
- (id)_connection;
- (void)_invalidationHandler;
- (void)endPlaybackSession:(id)a3;
- (void)reportPlayback:(id)a3 sessionID:(id)a4 completion:(id)a5;
- (void)reportPlayback:(id)a3 withCompletion:(id)a4;
@end

@implementation WLKPlaybackReporter

- (WLKPlaybackReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKPlaybackReporter;
  result = [(WLKPlaybackReporter *)&v3 init];
  if (result) {
    result->_xpcLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)reportPlayback:(id)a3 withCompletion:(id)a4
{
}

- (void)reportPlayback:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke;
  v22[3] = &unk_1E620A368;
  id v23 = v10;
  id v11 = v10;
  v12 = (void *)MEMORY[0x1BA9E94D0](v22);
  v13 = [(WLKPlaybackReporter *)self _connection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke_2;
  v20 = &unk_1E620A438;
  id v21 = v12;
  id v14 = v12;
  v15 = [v13 remoteObjectProxyWithErrorHandler:&v17];

  v16 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Requesting playback report [%@] %@", buf, 0x16u);
  }

  objc_msgSend(v15, "reportPlayback:sessionID:completion:", v8, v9, v14, v17, v18, v19, v20);
}

uint64_t __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endPlaybackSession:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(WLKPlaybackReporter *)self _connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_31];

  uint64_t v7 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Requesting endPlaybackSession [%@]", (uint8_t *)&v8, 0xCu);
  }

  [v6 endPlaybackSession:v4];
}

void __42__WLKPlaybackReporter_endPlaybackSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_connection
{
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_xpcConnection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v4;

    uint64_t v6 = self->_xpcConnection;
    uint64_t v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    int v8 = self->_xpcConnection;
    id v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global_5];
    objc_initWeak(&location, self);
    uint64_t v10 = self->_xpcConnection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __34__WLKPlaybackReporter__connection__block_invoke_6;
    v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  id v11 = self->_xpcConnection;

  return v11;
}

void __34__WLKPlaybackReporter__connection__block_invoke()
{
  v0 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Connection interrupted.", v1, 2u);
  }
}

void __34__WLKPlaybackReporter__connection__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidationHandler];
}

- (void)_invalidationHandler
{
  id v3 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void).cxx_destruct
{
}

@end