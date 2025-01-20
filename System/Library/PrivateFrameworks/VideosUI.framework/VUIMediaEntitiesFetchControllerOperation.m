@interface VUIMediaEntitiesFetchControllerOperation
- (NSArray)currentFetchResponses;
- (NSArray)requests;
- (NSError)error;
- (NSOperation)currentSubOperation;
- (VUIMediaEntitiesFetchControllerOperation)initWithMediaLibrary:(id)a3 fetchReason:(int64_t)a4 requests:(id)a5;
- (VUIMediaEntitiesFetchControllerResult)result;
- (VUIMediaLibrary)mediaLibrary;
- (id)_resultWithResponses:(id)a3;
- (int64_t)fetchReason;
- (void)_handleCompletdFetchWithResponses:(id)a3 error:(id)a4;
- (void)_startChangesOperationWithMediaEntityFetchResponses:(id)a3 currentFetchResponses:(id)a4;
- (void)_startMediaLibraryFetchOperation;
- (void)cancel;
- (void)setCurrentFetchResponses:(id)a3;
- (void)setCurrentSubOperation:(id)a3;
- (void)setError:(id)a3;
- (void)setFetchReason:(int64_t)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VUIMediaEntitiesFetchControllerOperation

- (VUIMediaEntitiesFetchControllerOperation)initWithMediaLibrary:(id)a3 fetchReason:(int64_t)a4 requests:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaEntitiesFetchControllerOperation;
  v11 = [(VUIMediaEntitiesFetchControllerOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibrary, a3);
    v12->_fetchReason = a4;
    uint64_t v13 = objc_msgSend(v10, "vui_deepCopy");
    requests = v12->_requests;
    v12->_requests = (NSArray *)v13;
  }
  return v12;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaEntitiesFetchControllerOperation;
  [(VUIMediaEntitiesFetchControllerOperation *)&v4 cancel];
  v3 = [(VUIMediaEntitiesFetchControllerOperation *)self currentSubOperation];
  [v3 cancel];

  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (void)_startMediaLibraryFetchOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(VUIMediaEntitiesFetchControllerOperation *)self mediaLibrary];
    v5 = [v4 identifier];
    v6 = [(VUIMediaEntitiesFetchControllerOperation *)self mediaLibrary];
    v7 = [v6 title];
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaEntitiesFetchControllerOperation:: start fetch with media library id %@ # title %@", buf, 0x16u);
  }
  v8 = [(VUIMediaEntitiesFetchControllerOperation *)self mediaLibrary];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIMediaEntitiesFetchControllerOperationDomain" code:0 userInfo:0];
    [(VUIMediaEntitiesFetchControllerOperation *)self _handleCompletdFetchWithResponses:0 error:v13];
  }
  else
  {
    id v10 = [VUIMediaLibraryFetchMediaEntitiesOperation alloc];
    v11 = [(VUIMediaEntitiesFetchControllerOperation *)self mediaLibrary];
    v12 = [(VUIMediaEntitiesFetchControllerOperation *)self requests];
    uint64_t v13 = [(VUIMediaLibraryFetchMediaEntitiesOperation *)v10 initWithMediaLibrary:v11 requests:v12];

    objc_initWeak((id *)buf, v13);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__VUIMediaEntitiesFetchControllerOperation__startMediaLibraryFetchOperation__block_invoke;
    v14[3] = &unk_1E6DF5440;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, (id *)buf);
    [(VUIMediaLibraryFetchMediaEntitiesOperation *)v13 setCompletionBlock:v14];
    [(VUIMediaEntitiesFetchControllerOperation *)self setCurrentSubOperation:v13];
    [(VUIAsynchronousOperation *)v13 start];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __76__VUIMediaEntitiesFetchControllerOperation__startMediaLibraryFetchOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && ([v2 isCancelled] & 1) == 0)
  {
    v3 = [v2 responses];
    objc_super v4 = [v2 error];
    [WeakRetained _handleCompletdFetchWithResponses:v3 error:v4];
  }
}

- (void)_handleCompletdFetchWithResponses:(id)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(VUIMediaEntitiesFetchControllerOperation *)self currentFetchResponses];
    if (v8)
    {
      [(VUIMediaEntitiesFetchControllerOperation *)self _startChangesOperationWithMediaEntityFetchResponses:v6 currentFetchResponses:v8];
    }
    else
    {
      v11 = [(VUIMediaEntitiesFetchControllerOperation *)self _resultWithResponses:v6];
      [(VUIMediaEntitiesFetchControllerOperation *)self setResult:v11];
      [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
    }
  }
  else
  {
    BOOL v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(VUIMediaEntitiesFetchControllerOperation *)self requests];
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v12, 0x16u);
    }
    [(VUIMediaEntitiesFetchControllerOperation *)self setError:v7];
    [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
  }
}

- (void)_startChangesOperationWithMediaEntityFetchResponses:(id)a3 currentFetchResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VUIMediaEntitiesFetchControllerOperation *)self _resultWithResponses:v6];
  BOOL v9 = [[VUIMediaEntityFetchResponseChangesOperation alloc] initWithLatestFetchResponses:v6 currentFetchResponses:v7];
  objc_initWeak(&location, v9);
  objc_initWeak(&from, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __118__VUIMediaEntitiesFetchControllerOperation__startChangesOperationWithMediaEntityFetchResponses_currentFetchResponses___block_invoke;
  v11[3] = &unk_1E6DF65E0;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  id v10 = v8;
  id v12 = v10;
  [(VUIMediaEntityFetchResponseChangesOperation *)v9 setCompletionBlock:v11];
  [(VUIMediaEntitiesFetchControllerOperation *)self setCurrentSubOperation:v9];
  [(VUIAsynchronousOperation *)v9 start];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __118__VUIMediaEntitiesFetchControllerOperation__startChangesOperationWithMediaEntityFetchResponses_currentFetchResponses___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2 && ([v2 isCancelled] & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_super v4 = [v2 fetchResponseChanges];
    [v3 setFetchResponseChanges:v4];

    [WeakRetained setResult:*(void *)(a1 + 32)];
    [WeakRetained finishExecutionIfPossible];
  }
}

- (id)_resultWithResponses:(id)a3
{
  id v4 = a3;
  v5 = [[VUIMediaEntitiesFetchControllerResult alloc] initWithFetchReason:[(VUIMediaEntitiesFetchControllerOperation *)self fetchReason] fetchResponses:v4];

  return v5;
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)currentFetchResponses
{
  return self->_currentFetchResponses;
}

- (void)setCurrentFetchResponses:(id)a3
{
}

- (VUIMediaEntitiesFetchControllerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (NSOperation)currentSubOperation
{
  return self->_currentSubOperation;
}

- (void)setCurrentSubOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubOperation, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentFetchResponses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end