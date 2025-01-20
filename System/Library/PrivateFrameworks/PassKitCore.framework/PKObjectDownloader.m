@interface PKObjectDownloader
+ (id)sharedImageAssetDownloader;
- (NSURLSession)session;
- (PKObjectDownloader)init;
- (PKObjectDownloader)initWithSession:(id)a3;
- (id)_logStringFromCachedResponse:(id)a3 data:(id)a4;
- (id)_logStringFromRequest:(id)a3;
- (id)_logStringFromResponse:(id)a3 data:(id)a4;
- (id)cachedDataForURL:(id)a3;
- (int64_t)concurrentRequests;
- (void)_handleResponseForURL:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6;
- (void)_scheduleDownload:(id)a3 forURL:(id)a4;
- (void)_schedulePendingDownloads;
- (void)downloadFromUrl:(id)a3 completionHandler:(id)a4;
- (void)downloadWithRequest:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)setConcurrentRequests:(int64_t)a3;
- (void)setSession:(id)a3;
@end

@implementation PKObjectDownloader

+ (id)sharedImageAssetDownloader
{
  if (qword_1EB402E68 != -1) {
    dispatch_once(&qword_1EB402E68, &__block_literal_global_100);
  }
  v2 = (void *)_MergedGlobals_231;
  return v2;
}

void __48__PKObjectDownloader_sharedImageAssetDownloader__block_invoke()
{
  id v3 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v3 setTimeoutIntervalForResource:30.0];
  [v3 setRequestCachePolicy:0];
  v0 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v3];
  v1 = [[PKObjectDownloader alloc] initWithSession:v0];
  v2 = (void *)_MergedGlobals_231;
  _MergedGlobals_231 = (uint64_t)v1;
}

- (PKObjectDownloader)init
{
  id v3 = [MEMORY[0x1E4F18DC0] sharedSession];
  v4 = [(PKObjectDownloader *)self initWithSession:v3];

  return v4;
}

- (PKObjectDownloader)initWithSession:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKObjectDownloader;
  v6 = [(PKObjectDownloader *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passKitCore.PKObjectDownloader", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    downloads = v7->_downloads;
    v7->_downloads = v10;

    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    pendingURLs = v7->_pendingURLs;
    v7->_pendingURLs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    downloadingURLs = v7->_downloadingURLs;
    v7->_downloadingURLs = v14;

    v16 = [v5 configuration];
    v7->_concurrentRequests = [v16 HTTPMaximumConnectionsPerHost];
  }
  return v7;
}

- (void)_handleResponseForURL:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKObjectDownloader__handleResponseForURL_data_response_error___block_invoke;
  block[3] = &unk_1E56DB960;
  block[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __64__PKObjectDownloader__handleResponseForURL_data_response_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  id v3 = PKLogFacilityTypeGetObject(2uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) _logStringFromResponse:*(void *)(a1 + 48) data:*(void *)(a1 + 56)];
      uint64_t v6 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: response: %@ error: %@", buf, 0x16u);
    }
    id v3 = [v2 completionHandlers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _schedulePendingDownloads];
  }
  else if (v4)
  {
    id v11 = [*(id *)(a1 + 32) _logStringFromResponse:*(void *)(a1 + 48) data:*(void *)(a1 + 56)];
    uint64_t v12 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Found no matching download for response: %@ error: %@", buf, 0x16u);
  }
}

- (void)_schedulePendingDownloads
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v4 = self->_pendingURLs;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412290;
    long long v19 = v6;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      uint64_t v21 = v7;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        unint64_t v11 = [(NSMutableSet *)self->_downloadingURLs count];
        if (v11 < [(PKObjectDownloader *)self concurrentRequests])
        {
          uint64_t v12 = [(NSMutableDictionary *)self->_downloads objectForKey:v10];
          long long v13 = PKLogFacilityTypeGetObject(2uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = [v12 task];
            [v14 currentRequest];
            long long v15 = v4;
            v17 = id v16 = v3;
            id v18 = [(PKObjectDownloader *)self _logStringFromRequest:v17];
            *(_DWORD *)buf = v19;
            v27 = v18;
            _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Performing queued request:%@", buf, 0xCu);

            id v3 = v16;
            BOOL v4 = v15;
            uint64_t v8 = v20;

            uint64_t v7 = v21;
          }

          [(PKObjectDownloader *)self _scheduleDownload:v12 forURL:v10];
          [v3 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  [(NSMutableOrderedSet *)self->_pendingURLs removeObjectsInArray:v3];
}

- (void)_scheduleDownload:(id)a3 forURL:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_downloadingURLs containsObject:v7])
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 task];
      uint64_t v10 = [v9 currentRequest];
      unint64_t v11 = [(PKObjectDownloader *)self _logStringFromRequest:v10];
      int v12 = 138412290;
      long long v13 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Error - attempted to schedule already downloading request:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    [(NSMutableSet *)self->_downloadingURLs addObject:v7];
    uint64_t v8 = [v6 task];
    [v8 resume];
  }
}

- (id)cachedDataForURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  session = self->_session;
  id v5 = a3;
  id v6 = [(NSURLSession *)session configuration];
  id v7 = [v6 URLCache];
  uint64_t v8 = (void *)MEMORY[0x1E4F18DA8];
  uint64_t v9 = [v6 requestCachePolicy];
  [v6 timeoutIntervalForRequest];
  uint64_t v10 = objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v5, v9);

  unint64_t v11 = [v7 cachedResponseForRequest:v10];
  uint64_t v12 = [v11 data];
  if (v12)
  {
    long long v13 = v12;
    uint64_t v14 = [v11 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    uint64_t v19 = [v15 statusCode];
    uint64_t v20 = PKLogFacilityTypeGetObject(2uLL);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v15 && v19 >= 200 && v19 <= 299)
    {
      if (v21)
      {
        long long v22 = [(PKObjectDownloader *)self _logStringFromCachedResponse:v11 data:v13];
        int v25 = 138412290;
        v26 = v22;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Returning cached data for response: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      if (v21)
      {
        long long v23 = [(PKObjectDownloader *)self _logStringFromCachedResponse:v11 data:v13];
        int v25 = 138412290;
        v26 = v23;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Not returning cached data for response since the status was not 200: %@", (uint8_t *)&v25, 0xCu);
      }
      uint64_t v20 = v13;
      long long v13 = 0;
    }

    id v16 = v13;
    id v18 = v16;
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(PKObjectDownloader *)self _logStringFromRequest:v10];
      int v25 = 138412290;
      v26 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: No cached data found for request: %@", (uint8_t *)&v25, 0xCu);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)downloadFromUrl:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [(PKObjectDownloader *)self session];
  uint64_t v8 = (void *)MEMORY[0x1E4F18DA8];
  uint64_t v9 = [v13 configuration];
  uint64_t v10 = [v9 requestCachePolicy];
  unint64_t v11 = [v13 configuration];
  [v11 timeoutIntervalForRequest];
  uint64_t v12 = objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v7, v10);

  [(PKObjectDownloader *)self downloadWithRequest:v12 completionHandler:v6];
}

- (void)downloadWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URL];
  uint64_t v9 = v8;
  if (v8)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E56D8BA8;
    v14[4] = self;
    id v15 = v8;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(queue, v14);
  }
  else
  {
    unint64_t v11 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: No URL for request: %@", buf, 0xCu);
    }

    if (v7)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v13 = (void *)[v12 initWithDomain:*MEMORY[0x1E4F289A0] code:-1002 userInfo:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v13);
    }
  }
}

void __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [*(id *)(a1 + 32) _logStringFromRequest:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Queueing completion onto existing download for: %@", buf, 0xCu);
    }
    id v5 = [v2 completionHandlers];
    id v6 = (void *)[*(id *)(a1 + 56) copy];
    [v5 addObject:v6];

    if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
    {
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 16) insertObject:*(void *)(a1 + 40) atIndex:0];
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) session];
    uint64_t v8 = objc_alloc_init(PKObjectDownload);
    uint64_t v9 = [(PKObjectDownload *)v8 completionHandlers];
    uint64_t v10 = (void *)[*(id *)(a1 + 56) copy];
    [v9 addObject:v10];

    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKey:*(void *)(a1 + 40)];
    unint64_t v11 = *(void **)(a1 + 48);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    BOOL v21 = __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke_28;
    long long v22 = &unk_1E56E7A68;
    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = v11;
    id v12 = [v7 dataTaskWithRequest:v24 completionHandler:&v19];
    -[PKObjectDownload setTask:](v8, "setTask:", v12, v19, v20, v21, v22, v23);
    unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    unint64_t v14 = [*(id *)(a1 + 32) concurrentRequests];
    id v15 = PKLogFacilityTypeGetObject(2uLL);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 >= v14)
    {
      if (v16)
      {
        id v18 = [*(id *)(a1 + 32) _logStringFromRequest:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Queueing request:%@", buf, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 32) + 16) insertObject:*(void *)(a1 + 40) atIndex:0];
    }
    else
    {
      if (v16)
      {
        id v17 = [*(id *)(a1 + 32) _logStringFromRequest:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Performing request:%@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _scheduleDownload:v8 forURL:*(void *)(a1 + 40)];
    }
  }
}

void __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 URL];
  [v6 _handleResponseForURL:v11 data:v10 response:v9 error:v8];
}

- (id)_logStringFromRequest:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 HTTPMethod];
  id v6 = [v4 URL];
  id v7 = [v4 allHTTPHeaderFields];
  id v8 = [v7 debugDescription];
  id v9 = [v4 HTTPBody];

  id v10 = [v3 stringWithFormat:@"\n%@ %@\n%@\n%@\n", v5, v6, v8, v9];

  return v10;
}

- (id)_logStringFromCachedResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 response];
  id v8 = [(PKObjectDownloader *)self _logStringFromResponse:v7 data:v6];

  return v8;
}

- (id)_logStringFromResponse:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = NSString;
  if (isKindOfClass)
  {
    id v9 = v5;
    id v10 = [v9 URL];
    uint64_t v11 = [v9 statusCode];
    id v12 = [v9 allHeaderFields];

    unint64_t v13 = [v12 debugDescription];
    uint64_t v14 = [v6 length];

    id v15 = [v8 stringWithFormat:@"\n%@ %ld\n%@\nData length: %lu\n", v10, v11, v13, v14];
  }
  else
  {
    id v10 = [v5 URL];
    uint64_t v16 = [v6 length];

    id v15 = [v8 stringWithFormat:@"\n%@\nData length: %lu\n", v10, v16];
  }

  return v15;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PKObjectDownloader_invalidate__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__PKObjectDownloader_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v2 invalidateAndCancel];
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSession:(id)a3
{
}

- (int64_t)concurrentRequests
{
  return self->_concurrentRequests;
}

- (void)setConcurrentRequests:(int64_t)a3
{
  self->_concurrentRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadingURLs, 0);
  objc_storeStrong((id *)&self->_pendingURLs, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end