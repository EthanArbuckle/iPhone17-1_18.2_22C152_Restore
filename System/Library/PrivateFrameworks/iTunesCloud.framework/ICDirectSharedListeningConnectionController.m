@interface ICDirectSharedListeningConnectionController
- (ICDirectSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5;
- (ICLiveLinkQRConnectionDataSource)dataSource;
- (ICSharedListeningConnectionReport)report;
- (MSVQRConnection)connection;
- (MSVTaskAssertion)assertion;
- (OS_dispatch_queue)delegateQueue;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (void)_handleQRDataSourceError:(id)a3;
- (void)connection:(id)a3 didEndWithError:(id)a4;
- (void)connection:(id)a3 didReceiveMessage:(id)a4;
- (void)connectionDidStart:(id)a3;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setReport:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDirectSharedListeningConnectionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setAssertion:(id)a3
{
}

- (MSVTaskAssertion)assertion
{
  return self->_assertion;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setReport:(id)a3
{
}

- (ICSharedListeningConnectionReport)report
{
  return self->_report;
}

- (ICLiveLinkQRConnectionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setConnection:(id)a3
{
}

- (MSVQRConnection)connection
{
  return self->_connection;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)connectionDidStart:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(ICDirectSharedListeningConnectionController *)self setState:4];
  os_unfair_lock_unlock(p_lock);
  v5 = [(ICDirectSharedListeningConnectionController *)self report];

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(ICDirectSharedListeningConnectionController *)self report];
      v8 = [v7 formattedReport];
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);
    }
    [(ICDirectSharedListeningConnectionController *)self setReport:0];
  }
  v9 = [(ICSharedListeningConnectionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = [(ICDirectSharedListeningConnectionController *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ICDirectSharedListeningConnectionController_connectionDidStart___block_invoke;
    v11[3] = &unk_1E5ACD4C8;
    id v12 = v9;
    v13 = self;
    dispatch_async(v10, v11);
  }
}

uint64_t __66__ICDirectSharedListeningConnectionController_connectionDidStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionControllerConnectionDidStart:*(void *)(a1 + 40)];
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  v6 = [(ICSharedListeningConnectionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = [(ICDirectSharedListeningConnectionController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__ICDirectSharedListeningConnectionController_connection_didReceiveMessage___block_invoke;
    block[3] = &unk_1E5ACD5C8;
    id v9 = v6;
    v10 = self;
    id v11 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __76__ICDirectSharedListeningConnectionController_connection_didReceiveMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionController:*(void *)(a1 + 40) connectionDidReceiveMessage:*(void *)(a1 + 48)];
}

- (void)connection:(id)a3 didEndWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(ICDirectSharedListeningConnectionController *)self state] >= 3) {
    [(ICDirectSharedListeningConnectionController *)self setState:2];
  }
  os_unfair_lock_unlock(&self->_lock);
  v6 = [(ICDirectSharedListeningConnectionController *)self report];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(ICDirectSharedListeningConnectionController *)self report];
      id v9 = [v8 formattedReport];
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);
    }
    [(ICDirectSharedListeningConnectionController *)self setReport:0];
  }
  v10 = [(ICSharedListeningConnectionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(ICDirectSharedListeningConnectionController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__ICDirectSharedListeningConnectionController_connection_didEndWithError___block_invoke;
    block[3] = &unk_1E5ACD5C8;
    id v13 = v10;
    v14 = self;
    id v15 = v5;
    dispatch_async(v11, block);
  }
}

uint64_t __74__ICDirectSharedListeningConnectionController_connection_didEndWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionController:*(void *)(a1 + 40) connectionDidEndWithError:*(void *)(a1 + 48)];
}

- (void)_handleQRDataSourceError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(ICDirectSharedListeningConnectionController *)self setState:-1];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = [(ICDirectSharedListeningConnectionController *)self report];

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(ICDirectSharedListeningConnectionController *)self report];
      v8 = [v7 formattedReport];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);
    }
    [(ICDirectSharedListeningConnectionController *)self setReport:0];
  }
  [(ICDirectSharedListeningConnectionController *)self stop];
  id v9 = [(ICSharedListeningConnectionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = [(ICDirectSharedListeningConnectionController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICDirectSharedListeningConnectionController__handleQRDataSourceError___block_invoke;
    block[3] = &unk_1E5ACD5C8;
    id v12 = v9;
    id v13 = self;
    id v14 = v4;
    dispatch_async(v10, block);
  }
}

uint64_t __72__ICDirectSharedListeningConnectionController__handleQRDataSourceError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionController:*(void *)(a1 + 40) didEncounterFatalError:*(void *)(a1 + 48)];
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDirectSharedListeningConnectionController *)self connection];
  [v5 sendMessage:v4];
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(ICDirectSharedListeningConnectionController *)self connection];
  [v3 stop];

  os_unfair_lock_lock(&self->_lock);
  id v4 = [(ICDirectSharedListeningConnectionController *)self assertion];

  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(ICDirectSharedListeningConnectionController *)self assertion];
      int v7 = 134218242;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Releasing assertion %@.", (uint8_t *)&v7, 0x16u);
    }
    [(ICDirectSharedListeningConnectionController *)self setAssertion:0];
  }
  [(ICDirectSharedListeningConnectionController *)self setConnection:0];
  [(ICDirectSharedListeningConnectionController *)self setState:0];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(ICDirectSharedListeningConnectionController *)self assertion];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F77A28]);
    v6 = [(ICSharedListeningConnectionController *)self bundleID];
    int v7 = (void *)[v5 initWithName:@"SharedListeningAssertion" bundleID:v6 subsystem:@"QuickRelay" reason:1 flags:3];
    [(ICDirectSharedListeningConnectionController *)self setAssertion:v7];

    v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(ICDirectSharedListeningConnectionController *)self assertion];
      *(_DWORD *)buf = 134218242;
      v30 = self;
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Taking out assertion %@.", buf, 0x16u);
    }
  }
  if (![(ICDirectSharedListeningConnectionController *)self state])
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = self;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Begin session discovery and connection.", buf, 0xCu);
    }

    [(ICDirectSharedListeningConnectionController *)self setState:1];
    id v13 = objc_opt_new();
    [(ICDirectSharedListeningConnectionController *)self setReport:v13];

    id v14 = [(ICSharedListeningConnectionController *)self sessionIdentifier];
    if (v14)
    {
      id v15 = [(ICSharedListeningConnectionController *)self sessionIdentifier];
      uint64_t v16 = [(ICSharedListeningConnectionController *)self identity];
      uint64_t v17 = +[ICLiveLinkQRConnectionDataSource dataSourceForExistingSharedListeningSession:v15 identity:v16];
    }
    else
    {
      id v15 = [(ICSharedListeningConnectionController *)self identity];
      uint64_t v17 = +[ICLiveLinkQRConnectionDataSource dataSourceForNewSharedListeningSessionWithIdentity:v15];
    }

    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__ICDirectSharedListeningConnectionController_start__block_invoke;
    v27[3] = &unk_1E5ACC760;
    objc_copyWeak(&v28, (id *)buf);
    [v17 setDataSourceErrorHandler:v27];
    uint64_t v18 = [(ICDirectSharedListeningConnectionController *)self report];
    [v17 setReport:v18];

    v19 = (void *)MEMORY[0x1E4F779E8];
    v20 = objc_opt_new();
    v21 = [v19 connectionWithDataSource:v17 messageCoder:v20];
    [(ICDirectSharedListeningConnectionController *)self setConnection:v21];

    v22 = [(ICDirectSharedListeningConnectionController *)self connection];
    [v22 setDelegate:self];

    v23 = [(ICDirectSharedListeningConnectionController *)self report];
    v24 = [(ICDirectSharedListeningConnectionController *)self connection];
    [v24 setReport:v23];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__ICDirectSharedListeningConnectionController_start__block_invoke_2;
    v25[3] = &unk_1E5ACC788;
    v25[4] = self;
    uint64_t v11 = v17;
    v26 = v11;
    [v11 populateWithCompletion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }
  if ([(ICDirectSharedListeningConnectionController *)self state] == 2)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] Start connection for populated controller.", buf, 2u);
    }

    uint64_t v11 = [(ICDirectSharedListeningConnectionController *)self connection];
    [v11 start];
LABEL_22:

    goto LABEL_23;
  }
  if ([(ICDirectSharedListeningConnectionController *)self state] != 1
    && [(ICDirectSharedListeningConnectionController *)self state] != 3
    && [(ICDirectSharedListeningConnectionController *)self state] != 4
    && [(ICDirectSharedListeningConnectionController *)self state] == -1)
  {
    uint64_t v11 = _ICLogCategoryQuickRelay();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][D] Client trying to start controller in invalidated state.", buf, 2u);
    }
    goto LABEL_22;
  }
LABEL_23:
  os_unfair_lock_unlock(p_lock);
}

void __52__ICDirectSharedListeningConnectionController_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleQRDataSourceError:v3];
}

void __52__ICDirectSharedListeningConnectionController_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (a2)
  {
    [(os_unfair_lock_s *)v3 _handleQRDataSourceError:a2];
  }
  else
  {
    os_unfair_lock_lock(v3 + 14);
    [*(id *)(a1 + 32) setState:2];
    id v4 = [*(id *)(a1 + 40) sharedListeningSessionIdentifier];
    [*(id *)(a1 + 32) setSessionIdentifier:v4];

    id v5 = [*(id *)(a1 + 40) sharedSessionToken];
    [*(id *)(a1 + 32) setSessionToken:v5];

    v6 = [*(id *)(a1 + 40) sharedListeningSessionInviteURL];
    [*(id *)(a1 + 32) setInviteURL:v6];

    [*(id *)(a1 + 32) setState:3];
    int v7 = [*(id *)(a1 + 32) connection];
    [v7 start];

    v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
    os_unfair_lock_unlock(v8);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICDirectSharedListeningConnectionController;
  [(ICDirectSharedListeningConnectionController *)&v4 dealloc];
}

- (ICDirectSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ICDirectSharedListeningConnectionController;
  id v5 = [(ICSharedListeningConnectionController *)&v10 initWithSessionIdentifier:a3 identity:a4 bundleID:a5];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDirectSharedListeningConnectionController.delegateQueue", v6);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v7;

    v5->_state = 0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

@end