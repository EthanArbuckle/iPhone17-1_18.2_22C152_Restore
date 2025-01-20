@interface BYBuddyDaemonCloudSyncClient
+ (id)clientInterface;
- (BOOL)syncDidComplete;
- (BOOL)syncDidStart;
- (BYBuddyDaemonCloudSyncClient)init;
- (BYClientDaemonCloudSyncProtocol)delegate;
- (NSXPCConnection)connection;
- (void)cancelSync;
- (void)cloudSyncProgressUpdate:(int64_t)a3 completedClients:(int64_t)a4 errors:(id)a5;
- (void)connectToDaemon;
- (void)fetchCurrentSyncState:(id)a3;
- (void)isSyncInProgress:(id)a3;
- (void)needsToSync:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSyncDidComplete:(BOOL)a3;
- (void)setSyncDidStart:(BOOL)a3;
- (void)startSync;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
@end

@implementation BYBuddyDaemonCloudSyncClient

- (BYBuddyDaemonCloudSyncClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonCloudSyncClient;
  v2 = [(BYBuddyDaemonCloudSyncClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYBuddyDaemonCloudSyncClient *)v2 connectToDaemon];
  }
  return v3;
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE4FBA0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_syncCompletedWithErrors_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)needsToSync:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 needsToSync:v4];
}

- (void)startSync
{
  v3 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke_53;
  v5[3] = &unk_1E5D2BA60;
  v5[4] = self;
  [v4 startSync:v5];
}

void __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

uint64_t __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke_53(uint64_t a1)
{
  [*(id *)(a1 + 32) setSyncDidStart:1];
  v2 = *(void **)(a1 + 32);
  return [v2 setSyncDidComplete:0];
}

- (void)cancelSync
{
  id v3 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_56];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke_57;
  v5[3] = &unk_1E5D2BA60;
  v5[4] = self;
  [v4 cancelSync:v5];
}

void __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

uint64_t __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke_57(uint64_t a1)
{
  [*(id *)(a1 + 32) setSyncDidStart:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setSyncDidComplete:0];
}

- (void)isSyncInProgress:(id)a3
{
  id v4 = a3;
  int v5 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__BYBuddyDaemonCloudSyncClient_isSyncInProgress___block_invoke;
  v8[3] = &unk_1E5D2BB58;
  id v9 = v4;
  id v7 = v4;
  [v6 isSyncInProgress:v8];
}

uint64_t __49__BYBuddyDaemonCloudSyncClient_isSyncInProgress___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentSyncState:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  int v5 = [v6 remoteObjectProxy];
  [v5 isSyncInProgress:v4];
}

- (void)cloudSyncProgressUpdate:(int64_t)a3 completedClients:(int64_t)a4 errors:(id)a5
{
  id v8 = a5;
  id v10 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  id v9 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_60];
  [v9 cloudSyncProgressUpdate:a3 completedClients:a4 errors:v8 completion:&__block_literal_global_63];
}

void __80__BYBuddyDaemonCloudSyncClient_cloudSyncProgressUpdate_completedClients_errors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      id v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

- (void)connectToDaemon
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.cloud.xpc" options:0];
  [(BYBuddyDaemonCloudSyncClient *)self setConnection:v3];

  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5A8A0];
  int v5 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  id v6 = [(id)objc_opt_class() clientInterface];
  id v7 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v7 setExportedInterface:v6];

  id v8 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v8 setExportedObject:self];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke;
  v14[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  id v9 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v9 setInvalidationHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke_80;
  v12[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  uint64_t v10 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v10 setInterruptionHandler:v12];

  v11 = [(BYBuddyDaemonCloudSyncClient *)self connection];
  [v11 resume];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Cloud sync client connection invalidated!", v7, 2u);
  }

  if ([*(id *)(a1 + 32) syncDidStart]
    && ([*(id *)(a1 + 32) syncDidComplete] & 1) == 0)
  {
    id v4 = [WeakRetained delegate];
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BYCloudSyncErrorDomain" code:0 userInfo:0];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v4 syncCompletedWithErrors:v6];
  }
}

void __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke_80(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Cloud sync client connection interruption!", v7, 2u);
  }

  if ([*(id *)(a1 + 32) syncDidStart]
    && ([*(id *)(a1 + 32) syncDidComplete] & 1) == 0)
  {
    id v4 = [WeakRetained delegate];
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BYCloudSyncErrorDomain" code:0 userInfo:0];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v4 syncCompletedWithErrors:v6];
  }
}

- (void)syncProgress:(double)a3
{
  id v4 = [(BYBuddyDaemonCloudSyncClient *)self delegate];
  [v4 syncProgress:a3];
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  [(BYBuddyDaemonCloudSyncClient *)self setSyncDidComplete:1];
  id v5 = [(BYBuddyDaemonCloudSyncClient *)self delegate];
  [v5 syncCompletedWithErrors:v4];
}

- (BYClientDaemonCloudSyncProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYClientDaemonCloudSyncProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)syncDidStart
{
  return self->_syncDidStart;
}

- (void)setSyncDidStart:(BOOL)a3
{
  self->_syncDidStart = a3;
}

- (BOOL)syncDidComplete
{
  return self->_syncDidComplete;
}

- (void)setSyncDidComplete:(BOOL)a3
{
  self->_syncDidComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end