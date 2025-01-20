@interface SBFFileCacheURLFaultHandler
- (NSArray)retryIntervals;
- (NSURLSession)urlSession;
- (SBFFileCacheURLFaultHandler)init;
- (void)attemptLoadFromURL:(id)a3 session:(id)a4 retryIntervalEnumerator:(id)a5 completionHandler:(id)a6;
- (void)fileCache:(id)a3 loadFileForIdentifier:(id)a4 completionHandler:(id)a5;
- (void)performLoadFromURL:(id)a3 session:(id)a4 completionHandler:(id)a5;
- (void)setRetryIntervals:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation SBFFileCacheURLFaultHandler

- (SBFFileCacheURLFaultHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBFFileCacheURLFaultHandler;
  v2 = [(SBFFileCacheURLFaultHandler *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F290E0];
    v4 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    uint64_t v5 = [v3 sessionWithConfiguration:v4];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v5;

    retryIntervals = v2->_retryIntervals;
    v2->_retryIntervals = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (void)fileCache:(id)a3 loadFileForIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SBFFileCacheURLFaultHandler *)self retryIntervals];
  objc_super v9 = [v11 objectEnumerator];
  v10 = [(SBFFileCacheURLFaultHandler *)self urlSession];
  [(SBFFileCacheURLFaultHandler *)self attemptLoadFromURL:v8 session:v10 retryIntervalEnumerator:v9 completionHandler:v7];
}

- (void)attemptLoadFromURL:(id)a3 session:(id)a4 retryIntervalEnumerator:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke;
  v18[3] = &unk_1E548D4A8;
  id v22 = v11;
  id v23 = v13;
  id v19 = v12;
  v20 = self;
  id v21 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  [(SBFFileCacheURLFaultHandler *)self performLoadFromURL:v15 session:v14 completionHandler:v18];
}

void __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v6 = [*(id *)(a1 + 32) nextObject];
    id v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      id v10 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke_2;
      block[3] = &unk_1E548D480;
      id v11 = *(void **)(a1 + 48);
      block[4] = *(void *)(a1 + 40);
      id v13 = v11;
      id v14 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 64);
      dispatch_after(v9, v10, block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

uint64_t __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) attemptLoadFromURL:*(void *)(a1 + 40) session:*(void *)(a1 + 48) retryIntervalEnumerator:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)performLoadFromURL:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __76__SBFFileCacheURLFaultHandler_performLoadFromURL_session_completionHandler___block_invoke;
  id v15 = &unk_1E548D4D0;
  id v16 = v7;
  id v17 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = [a4 dataTaskWithURL:v10 completionHandler:&v12];
  objc_msgSend(v11, "resume", v12, v13, v14, v15);
}

void __76__SBFFileCacheURLFaultHandler_performLoadFromURL_session_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x1E4F28CF0];
    id v7 = a2;
    a2 = (void *)[[v6 alloc] initRegularFileWithContents:v7];

    id v8 = [*(id *)(a1 + 32) lastPathComponent];
    [a2 setFilename:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)retryIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRetryIntervals:(id)a3
{
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_retryIntervals, 0);
}

@end