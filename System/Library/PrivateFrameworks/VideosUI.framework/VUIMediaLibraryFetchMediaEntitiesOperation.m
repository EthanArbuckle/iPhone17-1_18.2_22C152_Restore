@interface VUIMediaLibraryFetchMediaEntitiesOperation
- (NSArray)requests;
- (NSArray)responses;
- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3;
- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3 requests:(id)a4;
- (void)executionDidBegin;
- (void)setRequests:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation VUIMediaLibraryFetchMediaEntitiesOperation

- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaLibraryFetchMediaEntitiesOperation;
  v7 = [(VUIMediaLibraryOperation *)&v11 initWithMediaLibrary:a3];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "vui_deepCopy");
    requests = v7->_requests;
    v7->_requests = (NSArray *)v8;
  }
  return v7;
}

- (void)executionDidBegin
{
  objc_initWeak(&location, self);
  v3 = [(VUIMediaLibraryOperation *)self mediaLibrary];
  v4 = [(VUIMediaLibraryFetchMediaEntitiesOperation *)self requests];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __63__VUIMediaLibraryFetchMediaEntitiesOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E6DF4C88;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [v3 enqueueFetchRequests:v4 completionHandler:&v6];

  -[VUIMediaLibraryOperation setAsyncWorkToken:](self, "setAsyncWorkToken:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __63__VUIMediaLibraryFetchMediaEntitiesOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    if (v8) {
      objc_msgSend(v7, "setResponses:");
    }
    else {
      [v7 setError:v5];
    }
    [v7 finishExecutionIfPossible];
  }
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
}

@end