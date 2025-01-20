@interface QLExtensionHostContextThumbnailOperation
- (NSFileCoordinationRetainedAccess)fileAccess;
- (NSFileCoordinator)coordinator;
- (NSOperationQueue)coordinationQueue;
- (NSURL)accessedURL;
- (NSXPCConnection)connection;
- (QLExtensionHostContextThumbnailOperation)initWithAppex:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (QLFileThumbnailRequest)request;
- (QLThumbnailExtension)appex;
- (RBSAssertion)assertion;
- (_EXExtensionProcess)process;
- (id)completionHandler;
- (id)timeoutBlock;
- (os_unfair_lock_s)finishLock;
- (void)finish;
- (void)finishWithReply:(id)a3 error:(id)a4;
- (void)generate;
- (void)main;
- (void)setAccessedURL:(id)a3;
- (void)setAppex:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCoordinationQueue:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setFileAccess:(id)a3;
- (void)setFinishLock:(os_unfair_lock_s)a3;
- (void)setProcess:(id)a3;
- (void)setRequest:(id)a3;
- (void)setTimeoutBlock:(id)a3;
@end

@implementation QLExtensionHostContextThumbnailOperation

- (QLExtensionHostContextThumbnailOperation)initWithAppex:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)QLExtensionHostContextThumbnailOperation;
  id v12 = [(QLExtensionHostContextThumbnailOperation *)&v24 init];
  v13 = (QLExtensionHostContextThumbnailOperation *)v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 32, a3);
    objc_storeStrong(&v13->_completionHandler, a4);
    v14 = (NSXPCConnection *)_Block_copy(v11);
    connection = v13->_connection;
    v13->_connection = v14;

    *(_DWORD *)(&v13->super._executing + 3) = 0;
    uint64_t v16 = objc_opt_new();
    request = v13->_request;
    v13->_request = (QLFileThumbnailRequest *)v16;

    uint64_t v18 = objc_opt_new();
    coordinator = v13->_coordinator;
    v13->_coordinator = (NSFileCoordinator *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.quicklook.ExtensionHostContextThumbnailOperation", v20);

    [(NSFileCoordinator *)v13->_coordinator setUnderlyingQueue:v21];
    v22 = v13;
  }
  return v13;
}

- (void)main
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ([(QLExtensionHostContextThumbnailOperation *)self isCancelled])
  {
    [(QLExtensionHostContextThumbnailOperation *)self finishWithReply:0 error:0];
  }
  else
  {
    v3 = [self->_completionHandler item];
    [v3 startAccessingIfNeeded];

    v4 = [self->_completionHandler item];
    v5 = [v4 urlWrapper];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28C98];
      v7 = [self->_completionHandler item];
      v8 = [v7 fileURL];
      id v9 = [v6 readingIntentWithURL:v8 options:1];

      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__QLExtensionHostContextThumbnailOperation_main__block_invoke;
      block[3] = &unk_1E6D0C958;
      objc_copyWeak(&v22, &location);
      dispatch_block_t v10 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(QLExtensionHostContextThumbnailOperation *)self setTimeoutBlock:v10];

      dispatch_time_t v11 = dispatch_time(0, 20000000000);
      id v12 = [(QLExtensionHostContextThumbnailOperation *)self coordinationQueue];
      v13 = [v12 underlyingQueue];
      v14 = [(QLExtensionHostContextThumbnailOperation *)self timeoutBlock];
      dispatch_after(v11, v13, v14);

      v15 = [(QLExtensionHostContextThumbnailOperation *)self coordinator];
      v24[0] = v9;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      v17 = [(QLExtensionHostContextThumbnailOperation *)self coordinationQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_7;
      v19[3] = &unk_1E6D0C980;
      v19[4] = self;
      id v18 = v9;
      id v20 = v18;
      [v15 coordinateAccessWithIntents:v16 queue:v17 byAccessor:v19];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      [(QLExtensionHostContextThumbnailOperation *)self generate];
    }
  }
}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke(uint64_t a1)
{
  v2 = _log_4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(a1);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained coordinator];
  [v5 cancel];

  id v6 = objc_loadWeakRetained(v3);
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.QLExtensionHostContextThumbnailOperation" code:2 userInfo:0];
  [v6 finishWithReply:0 error:v7];
}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [*(id *)(a1 + 32) timeoutBlock];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) timeoutBlock];
    dispatch_block_cancel(v4);
  }
  v5 = *(void **)(a1 + 32);
  if (v10)
  {
    [v5 finishWithReply:0 error:v10];
  }
  else
  {
    id v6 = [v5 coordinator];
    v7 = [v6 retainAccess];
    [*(id *)(a1 + 32) setFileAccess:v7];

    v8 = [*(id *)(a1 + 40) URL];
    LODWORD(v7) = [v8 startAccessingSecurityScopedResource];

    if (v7)
    {
      id v9 = [*(id *)(a1 + 40) URL];
      [*(id *)(a1 + 32) setAccessedURL:v9];
    }
    [*(id *)(a1 + 32) generate];
  }
}

- (void)generate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Denying to thumbnail %@ with %@ as it is TCC-protected", (uint8_t *)&v5, 0x16u);
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke(uint64_t a1)
{
  v2 = _log_4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_2(a1);
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = [WeakRetained appex];
  char v6 = [v5 supportsConcurrentRequests];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_loadWeakRetained(v3);
    uint64_t v8 = [v7 process];
    [v8 invalidate];

    uint64_t v9 = _log_4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_1(v3, v9);
    }

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"generation timing out"];
    id v11 = objc_alloc(MEMORY[0x1E4F96490]);
    id v12 = (void *)MEMORY[0x1E4F96430];
    id v13 = objc_loadWeakRetained(v3);
    v14 = [v13 process];
    v15 = [v12 predicateMatchingIdentifier:v14];
    uint64_t v16 = (void *)[v11 initWithPredicate:v15 context:v10];

    [v16 execute:0];
  }
  id v17 = objc_loadWeakRetained(v3);
  id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.QLExtensionHostContextThumbnailOperation" code:1 userInfo:0];
  [v17 finishWithReply:0 error:v18];
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) coordinationQueue];
  int v5 = [v4 underlyingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_2;
  v7[3] = &unk_1E6D0C750;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithReply:0 error:*(void *)(a1 + 40)];
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timeoutBlock];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) timeoutBlock];
    dispatch_block_cancel(v8);
  }
  uint64_t v9 = [*(id *)(a1 + 32) assertion];
  [v9 invalidate];

  id v10 = _log_4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 288);
    id v12 = [v5 debugDescription];
    int v13 = 138412802;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "Thumbnail extension generated thumbnail for %@: reply = %@, error = %@", (uint8_t *)&v13, 0x20u);
  }
  [*(id *)(a1 + 32) finishWithReply:v5 error:v6];
}

- (void)finishWithReply:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(&self->super._executing + 3));
  connection = self->_connection;
  if (connection) {
    ((void (*)(NSXPCConnection *, id, id))connection[2].super.isa)(connection, v8, v6);
  }
  [(QLExtensionHostContextThumbnailOperation *)self finish];
  os_unfair_lock_unlock((os_unfair_lock_t)(&self->super._executing + 3));
}

- (void)finish
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = _log_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id completionHandler = self->_completionHandler;
    *(_DWORD *)buf = 138412290;
    id v16 = completionHandler;
    _os_log_impl(&dword_1DDC5E000, v3, OS_LOG_TYPE_INFO, "Operation did finish for %@", buf, 0xCu);
  }

  accessedURL = self->_accessedURL;
  if (accessedURL) {
    dispatch_block_cancel(accessedURL);
  }
  if (self->_coordinationQueue)
  {
    -[QLFileThumbnailRequest releaseAccess:](self->_request, "releaseAccess:");
    coordinationQueue = self->_coordinationQueue;
    self->_coordinationQueue = 0;
  }
  [(NSFileCoordinationRetainedAccess *)self->_fileAccess stopAccessingSecurityScopedResource];
  fileAccess = self->_fileAccess;
  self->_fileAccess = 0;

  id v8 = [self->_completionHandler item];
  [v8 cleanup];

  uint64_t v9 = self->_accessedURL;
  self->_accessedURL = 0;

  connection = self->_connection;
  self->_connection = 0;

  [(_EXExtensionProcess *)self->_process invalidate];
  process = self->_process;
  self->_process = 0;

  appex = self->_appex;
  self->_appex = 0;

  [self->_timeoutBlock invalidate];
  id timeoutBlock = self->_timeoutBlock;
  self->_id timeoutBlock = 0;

  v14.receiver = self;
  v14.super_class = (Class)QLExtensionHostContextThumbnailOperation;
  [(QLAsynchronousOperation *)&v14 finish];
}

- (QLThumbnailExtension)appex
{
  return *(QLThumbnailExtension **)&self->_finishLock._os_unfair_lock_opaque;
}

- (void)setAppex:(id)a3
{
}

- (_EXExtensionProcess)process
{
  return (_EXExtensionProcess *)self->_appex;
}

- (void)setProcess:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)self->_process;
}

- (void)setConnection:(id)a3
{
}

- (id)completionHandler
{
  return self->_connection;
}

- (void)setCompletionHandler:(id)a3
{
}

- (QLFileThumbnailRequest)request
{
  return (QLFileThumbnailRequest *)self->_completionHandler;
}

- (void)setRequest:(id)a3
{
}

- (NSFileCoordinator)coordinator
{
  return (NSFileCoordinator *)self->_request;
}

- (void)setCoordinator:(id)a3
{
}

- (NSOperationQueue)coordinationQueue
{
  return (NSOperationQueue *)self->_coordinator;
}

- (void)setCoordinationQueue:(id)a3
{
}

- (NSFileCoordinationRetainedAccess)fileAccess
{
  return (NSFileCoordinationRetainedAccess *)self->_coordinationQueue;
}

- (void)setFileAccess:(id)a3
{
}

- (NSURL)accessedURL
{
  return (NSURL *)self->_fileAccess;
}

- (void)setAccessedURL:(id)a3
{
}

- (id)timeoutBlock
{
  return self->_accessedURL;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (RBSAssertion)assertion
{
  return (RBSAssertion *)self->_timeoutBlock;
}

- (void)setAssertion:(id)a3
{
}

- (os_unfair_lock_s)finishLock
{
  return *(os_unfair_lock_s *)(&self->super._executing + 3);
}

- (void)setFinishLock:(os_unfair_lock_s)a3
{
  *(os_unfair_lock_s *)(&self->super._executing + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_accessedURL, 0);
  objc_storeStrong((id *)&self->_fileAccess, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_appex, 0);
  objc_storeStrong((id *)&self->_finishLock, 0);
}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained request];
  id v3 = [v2 item];
  OUTLINED_FUNCTION_0_1(&dword_1DDC5E000, v4, v5, "Coordination for %@ took more than %d seconds to reply", v6, v7, v8, v9, 2u);
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained process];
  v5[0] = 67109120;
  v5[1] = objc_msgSend(v4, "rbs_pid");
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Invalidating process (pid: %d) due to timing out", (uint8_t *)v5, 8u);
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained request];
  OUTLINED_FUNCTION_0_1(&dword_1DDC5E000, v3, v4, "Generation for %@ took more than %d seconds to reply", v5, v6, v7, v8, 2u);
}

@end