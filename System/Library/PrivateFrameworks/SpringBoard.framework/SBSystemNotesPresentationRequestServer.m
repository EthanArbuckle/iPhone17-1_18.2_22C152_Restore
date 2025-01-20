@interface SBSystemNotesPresentationRequestServer
- (SBSystemNotesPresentationRequestServer)init;
- (SBSystemNotesPresentationRequestServerDelegate)delegate;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SBSystemNotesPresentationRequestServer

- (SBSystemNotesPresentationRequestServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesPresentationRequestServer;
  v2 = [(SBSystemNotesPresentationRequestServer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.systemNotesPresentation"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SpringBoard.SBSSystemNotesPresentationRequestServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F628A0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__SBSystemNotesPresentationRequestServer_init__block_invoke;
    v12[3] = &unk_1E6AF58F0;
    v8 = v2;
    v13 = v8;
    uint64_t v9 = [v7 listenerWithConfigurator:v12];
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;
  }
  return v2;
}

void __46__SBSystemNotesPresentationRequestServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6C68] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  id v26 = 0;
  char v8 = SBIsSystemNotesEnabled(&v26);
  id v9 = v26;
  if (v8)
  {
    clientAuthenticator = self->_clientAuthenticator;
    v11 = [v6 remoteProcess];
    v12 = [v11 auditToken];
    id v25 = 0;
    char v13 = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v12 error:&v25];
    id v14 = v25;

    if (v13)
    {
      queue = self->_queue;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke;
      v22 = &unk_1E6AF5290;
      v23 = self;
      id v16 = v6;
      id v24 = v16;
      dispatch_sync(queue, &v19);
      objc_msgSend(v16, "activate", v19, v20, v21, v22, v23);
    }
    else
    {
      v18 = SBLogSystemNotes();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SBSystemNotesPresentationRequestServer listener:didReceiveConnection:withContext:]((uint64_t)v14, (uint64_t)v6, v18);
      }

      [v6 invalidate];
    }
    id v9 = v14;
  }
  else
  {
    v17 = SBLogSystemNotes();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesPresentationRequestServer listener:didReceiveConnection:withContext:]((uint64_t)v9, v17);
    }

    [v6 invalidate];
  }
}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [WeakRetained server:*(void *)(a1 + 32) targetForNewClientConnection:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E6B00F40;
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v9, &location);
  uint64_t v8 = *(void *)(a1 + 32);
  [v4 configureConnection:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6C68] serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = [MEMORY[0x1E4FA6C68] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E6AF7420;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v6];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 32)];
  objc_destroyWeak(&v7);
}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogSystemNotes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(WeakRetained + 1);
    [v7 server:v6 connectionDidInvalidate:v3];
  }
}

- (void)activate
{
}

- (SBSystemNotesPresentationRequestServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemNotesPresentationRequestServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Connection did not pass entitlement validation: %{public}@\n %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Service unavailable. Invalidating connection. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end