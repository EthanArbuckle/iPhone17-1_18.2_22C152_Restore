@interface VUIMediaItemEntityTypesFetchController
- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4;
- (VUIMediaItemEntityTypesFetchController)initWithMediaLibrary:(id)a3;
- (VUIMediaItemEntityTypesFetchControllerDelegate)delegate;
- (VUIMediaItemEntityTypesFetchResponse)response;
- (id)_fetchOperationForFetchReason:(int64_t)a3;
- (void)_didCompleteFetchOperation:(id)a3;
- (void)_handleContentsChangeFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4;
- (void)_handleInitialFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4;
- (void)_notifyDelegateWithBlock:(id)a3;
- (void)_notifyFetchDidCompleteWithResult:(id)a3;
- (void)_notifyFetchDidFailWithError:(id)a3;
- (void)cancelFetch;
- (void)setDelegate:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation VUIMediaItemEntityTypesFetchController

- (VUIMediaItemEntityTypesFetchController)initWithMediaLibrary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaItemEntityTypesFetchController;
  return [(VUIMediaLibraryFetchController *)&v4 initWithMediaLibrary:a3];
}

- (void)cancelFetch
{
  [(VUIMediaItemEntityTypesFetchController *)self setResponse:0];
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaItemEntityTypesFetchController;
  [(VUIMediaLibraryFetchController *)&v3 cancelFetch];
}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  v5 = [VUIMediaItemEntityTypesFetchControllerOperation alloc];
  v6 = [(VUIMediaLibraryFetchController *)self mediaLibrary];
  v7 = [(VUIMediaItemEntityTypesFetchControllerOperation *)v5 initWithMediaLibrary:v6 fetchReason:a3];

  if (a3 == 1)
  {
    v8 = [(VUIMediaItemEntityTypesFetchController *)self response];
    [(VUIMediaItemEntityTypesFetchControllerOperation *)v7 setCurrentFetchResponse:v8];
  }
  return v7;
}

- (void)_didCompleteFetchOperation:(id)a3
{
  id v4 = a3;
  id v7 = [v4 result];
  v5 = [v4 error];
  uint64_t v6 = [v4 fetchReason];

  if (v6) {
    [(VUIMediaItemEntityTypesFetchController *)self _handleContentsChangeFetchControllerOperationDidCompleteWithResult:v7 error:v5];
  }
  else {
    [(VUIMediaItemEntityTypesFetchController *)self _handleInitialFetchControllerOperationDidCompleteWithResult:v7 error:v5];
  }
}

- (void)_handleInitialFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(VUIMediaItemEntityTypesFetchController *)self _updateResponseWithResult:v6 replaceContentsOnNilChanges:1];
    [(VUIMediaItemEntityTypesFetchController *)self _notifyFetchDidCompleteWithResult:v6];
  }
  else
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaItemEntityTypesFetchController _handleInitialFetchControllerOperationDidCompleteWithResult:error:]((uint64_t)v7, v8);
    }

    [(VUIMediaItemEntityTypesFetchController *)self _notifyFetchDidFailWithError:v7];
  }
}

- (void)_handleContentsChangeFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([(VUIMediaItemEntityTypesFetchController *)self _updateResponseWithResult:v6 replaceContentsOnNilChanges:0])
    {
      [(VUIMediaItemEntityTypesFetchController *)self _notifyFetchDidCompleteWithResult:v6];
    }
  }
  else
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Contents change media category types fetch failed with error (%@)", (uint8_t *)&v9, 0xCu);
    }

    [(VUIMediaItemEntityTypesFetchController *)self _notifyFetchDidFailWithError:v7];
  }
}

- (void)_notifyDelegateWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(VUIMediaItemEntityTypesFetchController *)self delegate];
  id v6 = [(VUIMediaLibraryFetchController *)self mediaLibrary];
  id v7 = [v6 manager];

  v8 = [v7 completionDispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__VUIMediaItemEntityTypesFetchController__notifyDelegateWithBlock___block_invoke;
  v11[3] = &unk_1E6DF41E8;
  id v12 = v5;
  id v13 = v4;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v8, v11);
}

uint64_t __67__VUIMediaItemEntityTypesFetchController__notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_notifyFetchDidCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__VUIMediaItemEntityTypesFetchController__notifyFetchDidCompleteWithResult___block_invoke;
  v6[3] = &unk_1E6DF9C28;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VUIMediaItemEntityTypesFetchController *)self _notifyDelegateWithBlock:v6];
}

void __76__VUIMediaItemEntityTypesFetchController__notifyFetchDidCompleteWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 controller:*(void *)(a1 + 32) fetchDidCompleteWithResult:*(void *)(a1 + 40)];
  }
}

- (void)_notifyFetchDidFailWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__VUIMediaItemEntityTypesFetchController__notifyFetchDidFailWithError___block_invoke;
  v6[3] = &unk_1E6DF9C28;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VUIMediaItemEntityTypesFetchController *)self _notifyDelegateWithBlock:v6];
}

void __71__VUIMediaItemEntityTypesFetchController__notifyFetchDidFailWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 controller:*(void *)(a1 + 32) fetchDidFailWithError:*(void *)(a1 + 40)];
  }
}

- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VUIMediaItemEntityTypesFetchController *)self response];
  v8 = [v6 fetchResponse];
  if (v7)
  {
    id v9 = [v6 fetchChanges];
    char v10 = [v7 _updateWithResponse:v8 changes:v9 replaceContentsOnNilChanges:v4];
  }
  else
  {
    [(VUIMediaItemEntityTypesFetchController *)self setResponse:v8];
    char v10 = 1;
  }

  return v10;
}

- (VUIMediaItemEntityTypesFetchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMediaItemEntityTypesFetchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleInitialFetchControllerOperationDidCompleteWithResult:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Initial media category types fetch failed with error (%@)", (uint8_t *)&v2, 0xCu);
}

@end