@interface VUIMPMediaEntitiesFetchOperation
- (NSArray)requests;
- (NSArray)responses;
- (NSError)error;
- (NSOperationQueue)privateQueue;
- (VUIMPMediaEntitiesFetchOperation)init;
- (VUIMPMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4;
- (VUIMPMediaLibrary)mediaLibrary;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation VUIMPMediaEntitiesFetchOperation

- (VUIMPMediaEntitiesFetchOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
    if (v9) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requests" format];
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)VUIMPMediaEntitiesFetchOperation;
  v10 = [(VUIMPMediaEntitiesFetchOperation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(v9, "vui_deepCopy");
    requests = v10->_requests;
    v10->_requests = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_mediaLibrary, a3);
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v10->_privateQueue;
    v10->_privateQueue = v13;
  }
  return v10;
}

- (void)executionDidBegin
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_initWeak(&location, self);
  uint64_t v4 = (void *)MEMORY[0x1E4F28B48];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__VUIMPMediaEntitiesFetchOperation_executionDidBegin__block_invoke;
  v22[3] = &unk_1E6DF5490;
  objc_copyWeak(&v24, &location);
  id v5 = v3;
  id v23 = v5;
  v6 = [v4 blockOperationWithBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(VUIMPMediaEntitiesFetchOperation *)self requests];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [VUIMPMediaEntitiesSingleFetchOperation alloc];
        v13 = [(VUIMPMediaEntitiesFetchOperation *)self mediaLibrary];
        v14 = [(VUIMPMediaEntitiesSingleFetchOperation *)v12 initWithMediaLibrary:v13 request:v11];

        v15 = [v11 identifier];
        [v5 setObject:v14 forKey:v15];

        [v6 addDependency:v14];
        objc_super v16 = [(VUIMPMediaEntitiesFetchOperation *)self privateQueue];
        [v16 addOperation:v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  v17 = [(VUIMPMediaEntitiesFetchOperation *)self privateQueue];
  [v17 addOperation:v6];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __53__VUIMPMediaEntitiesFetchOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = objc_msgSend(WeakRetained, "requests", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(a1 + 32);
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) identifier];
          uint64_t v11 = [v9 objectForKey:v10];

          v12 = [v11 response];
          v13 = [v11 error];
          if (!v12)
          {

            id v3 = 0;
            goto LABEL_12;
          }
          [v3 addObject:v12];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v13 = 0;
LABEL_12:

    [WeakRetained setResponses:v3];
    [WeakRetained setError:v13];
    [WeakRetained finishExecutionIfPossible];
  }
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end