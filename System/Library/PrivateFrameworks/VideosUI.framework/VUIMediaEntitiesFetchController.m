@interface VUIMediaEntitiesFetchController
- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4;
- (NSArray)requests;
- (NSArray)responses;
- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3;
- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4;
- (VUIMediaEntitiesFetchControllerDelegate)delegate;
- (VUIMediaEntityFetchResponse)response;
- (id)_fetchOperationForFetchReason:(int64_t)a3;
- (void)_didCompleteFetchOperation:(id)a3;
- (void)_handleContentsChangeFetchControllerOperationDidComplete:(id)a3;
- (void)_handleManualFetchControllerOperationDidComplete:(id)a3;
- (void)_notifyDelegateWithBlock:(id)a3;
- (void)_notifyFetchRequests:(id)a3 didCompleteWithResult:(id)a4;
- (void)_notifyFetchRequests:(id)a3 didFailWithError:(id)a4;
- (void)cancelFetch;
- (void)setDelegate:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation VUIMediaEntitiesFetchController

- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaEntitiesFetchController;
  v7 = [(VUIMediaLibraryFetchController *)&v11 initWithMediaLibrary:a3];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "vui_deepCopy");
    requests = v7->_requests;
    v7->_requests = (NSArray *)v8;
  }
  return v7;
}

- (void)cancelFetch
{
  [(VUIMediaEntitiesFetchController *)self setResponses:0];
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaEntitiesFetchController;
  [(VUIMediaLibraryFetchController *)&v3 cancelFetch];
}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  uint64_t v5 = [VUIMediaEntitiesFetchControllerOperation alloc];
  id v6 = [(VUIMediaLibraryFetchController *)self mediaLibrary];
  v7 = [(VUIMediaEntitiesFetchController *)self requests];
  uint64_t v8 = [(VUIMediaEntitiesFetchControllerOperation *)v5 initWithMediaLibrary:v6 fetchReason:a3 requests:v7];

  if (a3 == 1)
  {
    v9 = [(VUIMediaEntitiesFetchController *)self responses];
    [(VUIMediaEntitiesFetchControllerOperation *)v8 setCurrentFetchResponses:v9];
  }
  return v8;
}

- (void)_didCompleteFetchOperation:(id)a3
{
  id v4 = a3;
  if ([v4 fetchReason]) {
    [(VUIMediaEntitiesFetchController *)self _handleContentsChangeFetchControllerOperationDidComplete:v4];
  }
  else {
    [(VUIMediaEntitiesFetchController *)self _handleManualFetchControllerOperationDidComplete:v4];
  }
}

- (void)_handleManualFetchControllerOperationDidComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requests];
  id v6 = [v4 result];
  if (v6)
  {
    [(VUIMediaEntitiesFetchController *)self _updateResponseWithResult:v6 replaceContentsOnNilChanges:1];
    [(VUIMediaEntitiesFetchController *)self _notifyFetchRequests:v5 didCompleteWithResult:v6];
  }
  else
  {
    v7 = [v4 error];
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(VUIMediaEntitiesFetchController *)(uint64_t)v7 _handleManualFetchControllerOperationDidComplete:v8];
    }

    [(VUIMediaEntitiesFetchController *)self _notifyFetchRequests:v5 didFailWithError:v7];
  }
}

- (void)_handleContentsChangeFetchControllerOperationDidComplete:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 requests];
  id v6 = [v4 result];
  if (v6)
  {
    if ([(VUIMediaEntitiesFetchController *)self _updateResponseWithResult:v6 replaceContentsOnNilChanges:0])
    {
      [(VUIMediaEntitiesFetchController *)self _notifyFetchRequests:v5 didCompleteWithResult:v6];
    }
  }
  else
  {
    v7 = [v4 error];
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      v10 = v7;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Contents change media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v9, 0x16u);
    }

    [(VUIMediaEntitiesFetchController *)self _notifyFetchRequests:v5 didFailWithError:v7];
  }
}

- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v7 = [(VUIMediaEntitiesFetchController *)self responses];
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__VUIMediaEntitiesFetchController__updateResponseWithResult_replaceContentsOnNilChanges___block_invoke;
    v11[3] = &unk_1E6DF8B80;
    BOOL v14 = a4;
    id v12 = v6;
    uint64_t v13 = &v15;
    [v7 enumerateObjectsUsingBlock:v11];
    uint64_t v8 = v12;
  }
  else
  {
    uint64_t v8 = [v6 fetchResponses];
    [(VUIMediaEntitiesFetchController *)self setResponses:v8];
    *((unsigned char *)v16 + 24) = 1;
  }

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __89__VUIMediaEntitiesFetchController__updateResponseWithResult_replaceContentsOnNilChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) fetchResponses];
  id v6 = [v5 objectAtIndex:a3];

  v7 = [*(id *)(a1 + 32) fetchResponseChanges];
  uint64_t v8 = [v7 objectAtIndex:a3];

  LODWORD(v7) = [v9 hasDataForCheckHasItemsOption];
  if (v7 != [v6 hasDataForCheckHasItemsOption]
    || [v9 _updateWithResponse:v6 changes:v8 replaceContentsOnNilChanges:*(unsigned __int8 *)(a1 + 48)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_notifyDelegateWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUIMediaEntitiesFetchController *)self delegate];
  id v6 = [(VUIMediaLibraryFetchController *)self mediaLibrary];
  v7 = [v6 manager];

  uint64_t v8 = [v7 completionDispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__VUIMediaEntitiesFetchController__notifyDelegateWithBlock___block_invoke;
  v11[3] = &unk_1E6DF41E8;
  id v12 = v5;
  id v13 = v4;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v8, v11);
}

uint64_t __60__VUIMediaEntitiesFetchController__notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_notifyFetchRequests:(id)a3 didCompleteWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__VUIMediaEntitiesFetchController__notifyFetchRequests_didCompleteWithResult___block_invoke;
  v10[3] = &unk_1E6DF8BA8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VUIMediaEntitiesFetchController *)self _notifyDelegateWithBlock:v10];
}

void __78__VUIMediaEntitiesFetchController__notifyFetchRequests_didCompleteWithResult___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 controller:a1[4] fetchRequests:a1[5] didCompleteWithResult:a1[6]];
  }
}

- (void)_notifyFetchRequests:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__VUIMediaEntitiesFetchController__notifyFetchRequests_didFailWithError___block_invoke;
  v10[3] = &unk_1E6DF8BA8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VUIMediaEntitiesFetchController *)self _notifyDelegateWithBlock:v10];
}

void __73__VUIMediaEntitiesFetchController__notifyFetchRequests_didFailWithError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 controller:a1[4] fetchRequests:a1[5] didFailWithError:a1[6]];
  }
}

- (VUIMediaEntitiesFetchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMediaEntitiesFetchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (VUIMediaEntityFetchResponse)response
{
  return self->_response;
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleManualFetchControllerOperationDidComplete:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Manual media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v3, 0x16u);
}

@end