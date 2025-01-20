@interface VUIURLImageLoader
+ (id)sharedInstance;
+ (id)sharedInstanceWithMinimalSession:(BOOL)a3;
- (AMSURLSession)session;
- (BOOL)isImageRotationEnabled;
- (BOOL)useMinimalSessionImageLoading;
- (NSMutableDictionary)loadIDsByURL;
- (NSMutableDictionary)loadOptionsByID;
- (NSMutableDictionary)taskOptionsByURL;
- (NSURLSession)urlSession;
- (OS_dispatch_queue)processingQueue;
- (VUIURLImageLoader)initWithMinimalSessionImageLoading:(BOOL)a3;
- (id)URLForObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_executeOnProcessingQueue:(id)a3;
- (void)cancelLoad:(id)a3;
- (void)setImageRotationEnabled:(BOOL)a3;
@end

@implementation VUIURLImageLoader

- (id)imageKeyForObject:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 absoluteString];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 identifier];
    goto LABEL_5;
  }
  v6 = VUICImageLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v10 = 138412290;
    *(void *)&v10[4] = objc_opt_class();
    id v7 = *(id *)&v10[4];
    _os_log_impl(&dword_1E29E1000, v6, OS_LOG_TYPE_INFO, "URLImageLoader cannot create key for object of type [%@]", v10, 0xCu);
  }
  v5 = 0;
LABEL_9:
  v8 = objc_msgSend(v5, "vui_SHA256String", *(_OWORD *)v10);

  return v8;
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 url];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

+ (id)sharedInstanceWithMinimalSession:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VUIURLImageLoader_sharedInstanceWithMinimalSession___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  if (sharedInstanceWithMinimalSession__onceToken != -1) {
    dispatch_once(&sharedInstanceWithMinimalSession__onceToken, block);
  }
  id v3 = (void *)sharedInstanceWithMinimalSession__sSharedInstance;
  return v3;
}

+ (id)sharedInstance
{
  return +[VUIURLImageLoader sharedInstanceWithMinimalSession:1];
}

- (AMSURLSession)session
{
  return self->_session;
}

uint64_t __54__VUIURLImageLoader_sharedInstanceWithMinimalSession___block_invoke(uint64_t a1)
{
  v1 = [[VUIURLImageLoader alloc] initWithMinimalSessionImageLoading:*(unsigned __int8 *)(a1 + 32)];
  uint64_t v2 = sharedInstanceWithMinimalSession__sSharedInstance;
  sharedInstanceWithMinimalSession__sSharedInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (VUIURLImageLoader)initWithMinimalSessionImageLoading:(BOOL)a3
{
  BOOL v3 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VUIURLImageLoader;
  id v4 = [(VUIURLImageLoader *)&v24 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [v5 setHTTPMaximumConnectionsPerHost:4];
    [v5 setHTTPShouldUsePipelining:1];
    [v5 setWaitsForConnectivity:0];
    objc_msgSend(v5, "set_timingDataOptions:", 1);
    BOOL v6 = (void *)MEMORY[0x1E4F4DE90];
    id v7 = [MEMORY[0x1E4F4DDC8] currentProcess];
    v8 = [v6 userAgentForProcessInfo:v7];

    if ([v8 length])
    {
      v25 = @"User-Agent";
      v26[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      [v5 setHTTPAdditionalHeaders:v9];
    }
    v4->_useMinimalSessionImageLoading = v3;
    if (v3)
    {
      uint64_t v10 = [MEMORY[0x1E4F4DE88] minimalSessionUsing:v5];
      session = v4->_session;
      v4->_session = (AMSURLSession *)v10;

      [(AMSURLSession *)v4->_session setDelegate:v4];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v5 delegate:v4 delegateQueue:0];
      urlSession = v4->_urlSession;
      v4->_urlSession = (NSURLSession *)v12;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"VUIURLImageLoader (%p) processing queue", v4);
    id v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 cStringUsingEncoding:4], 0);
    processingQueue = v4->_processingQueue;
    v4->_processingQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    loadOptionsByID = v4->_loadOptionsByID;
    v4->_loadOptionsByID = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    loadIDsByURL = v4->_loadIDsByURL;
    v4->_loadIDsByURL = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    taskOptionsByURL = v4->_taskOptionsByURL;
    v4->_taskOptionsByURL = (NSMutableDictionary *)v21;
  }
  return v4;
}

- (void)_executeOnProcessingQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(VUIURLImageLoader *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VUIURLImageLoader__executeOnProcessingQueue___block_invoke;
  block[3] = &unk_1E6DDDBE8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __47__VUIURLImageLoader__executeOnProcessingQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  v35 = self;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v37 = a7;
  id v38 = a8;
  v41 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v40 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v39;
    id v11 = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = VUICImageLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = objc_opt_class();
        id v32 = *(id *)((char *)&buf + 4);
        _os_log_impl(&dword_1E29E1000, v31, OS_LOG_TYPE_INFO, "URLImageLoader cannot load image for object of type [%@]", (uint8_t *)&buf, 0xCu);
      }
      id v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
      (*((void (**)(id, void, void, void, void, id))v38 + 2))(v38, 0, 0, 0, 0, v30);
      id v11 = 0;
      id v10 = 0;
      id v29 = 0;
      goto LABEL_24;
    }
    id v12 = v39;
    id v11 = [v12 url];
    id v13 = objc_alloc(MEMORY[0x1E4F28E88]);
    id v14 = [v12 url];
    id v10 = (id)[v13 initWithURL:v14];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    dispatch_queue_t v15 = [v12 headers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v52 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          v20 = objc_msgSend(v12, "headers", v35);
          uint64_t v21 = [v20 objectForKey:v19];
          [v10 setValue:v21 forHTTPHeaderField:v19];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v16);
    }

    v22 = [v12 decrypter];

    if (v22)
    {
      v23 = [v12 decrypter];
      [v40 setObject:v23 forKey:@"VUIURLImageLoaderTaskDecryptorKey"];
    }
  }
  if (v10)
  {
    objc_super v24 = [MEMORY[0x1E4F29128] UUID];
    v25 = [v24 description];

    [v41 setObject:v25 forKey:@"VUIURLImageLoaderOptionsIDKey"];
    [v41 setObject:v11 forKey:@"VUIURLImageLoaderOptionsURLKey"];
    if (v38)
    {
      v26 = (void *)[v38 copy];
      [v41 setObject:v26 forKey:@"VUIURLImageLoaderOptionsCompletionHandlerKey"];
    }
    v27 = objc_msgSend(v37, "recordForResource:withInitiator:", 3, 2, v35);
    if (v27) {
      [v40 setObject:v27 forKey:@"VUIURLImageLoaderOptionsRequestRecordKey"];
    }
    v28 = [MEMORY[0x1E4F1CA58] data];
    [v40 setObject:v28 forKey:@"VUIURLImageLoaderTaskReceivedDataKey"];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__3;
    v58 = __Block_byref_object_dispose__3;
    id v59 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __109__VUIURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v42[3] = &unk_1E6DDDC10;
    id v29 = v25;
    id v43 = v29;
    id v44 = v41;
    id v11 = v11;
    id v45 = v11;
    id v10 = v10;
    id v46 = v10;
    v47 = v36;
    p_long long buf = &buf;
    id v48 = v40;
    id v30 = v27;
    id v49 = v30;
    [v36 _executeOnProcessingQueue:v42];

    _Block_object_dispose(&buf, 8);
LABEL_24:

    goto LABEL_25;
  }
  id v29 = 0;
LABEL_25:
  id v33 = v29;

  return v33;
}

void __109__VUIURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[*(id *)(a1 + 40) copy];
  id v5 = [v3 loadOptionsByID];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

  id v6 = VUICImageLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    int v31 = 138412546;
    id v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v8;
    _os_log_impl(&dword_1E29E1000, v6, OS_LOG_TYPE_INFO, "URLImageLoader Adding request %@ URL %@", (uint8_t *)&v31, 0x16u);
  }

  id v9 = [v3 loadIDsByURL];
  id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = [v3 loadIDsByURL];
    [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  [v10 addObject:*(void *)(a1 + 32)];
  if ([v10 count] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [*(id *)(a1 + 64) useMinimalSessionImageLoading];
      id v13 = *(void **)(a1 + 64);
      if (v12)
      {
        id v14 = [v13 session];
        dispatch_queue_t v15 = [MEMORY[0x1E4F290D0] requestWithURL:*(void *)(a1 + 56)];
        uint64_t v16 = [v14 dataTaskWithRequest:v15];
        uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
        v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

LABEL_18:
        objc_super v24 = VUICImageLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) description];
          uint64_t v26 = *(void *)(a1 + 48);
          int v31 = 138412546;
          id v32 = v25;
          __int16 v33 = 2112;
          uint64_t v34 = v26;
          _os_log_impl(&dword_1E29E1000, v24, OS_LOG_TYPE_INFO, "URLImageLoader Loading task %@ URL %@", (uint8_t *)&v31, 0x16u);
        }
        [*(id *)(a1 + 72) setObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forKey:@"VUIURLImageLoaderTaskKey"];
        v27 = (void *)[*(id *)(a1 + 72) copy];
        v28 = [v3 taskOptionsByURL];
        [v28 setObject:v27 forKeyedSubscript:*(void *)(a1 + 48)];

        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) resume];
        id v29 = *(void **)(a1 + 80);
        id v30 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) originalRequest];
        [v29 willSendRequest:v30];

        goto LABEL_21;
      }
      id v14 = [v13 urlSession];
      uint64_t v21 = [v14 dataTaskWithURL:*(void *)(a1 + 56)];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v14 = VUICImageLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1E29E1000, v14, OS_LOG_TYPE_INFO, "URLImageLoader invalid NSURLSessionTask source type", (uint8_t *)&v31, 2u);
        }
        goto LABEL_18;
      }
      int v19 = [*(id *)(a1 + 64) useMinimalSessionImageLoading];
      v20 = *(void **)(a1 + 64);
      if (v19) {
        [v20 session];
      }
      else {
      id v14 = [v20 urlSession];
      }
      uint64_t v21 = [v14 dataTaskWithRequest:*(void *)(a1 + 56)];
    }
    uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    goto LABEL_18;
  }
LABEL_21:
}

- (void)cancelLoad:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__VUIURLImageLoader_cancelLoad___block_invoke;
    v5[3] = &unk_1E6DDDC38;
    id v6 = v4;
    [(VUIURLImageLoader *)self _executeOnProcessingQueue:v5];
  }
}

void __32__VUIURLImageLoader_cancelLoad___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 loadOptionsByID];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 loadOptionsByID];
    id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"VUIURLImageLoaderOptionsURLKey"];

    id v9 = VUICImageLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 32);
      int v21 = 138412546;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      objc_super v24 = v8;
      _os_log_impl(&dword_1E29E1000, v9, OS_LOG_TYPE_INFO, "URLImageLoader Canceling request %@ URL %@", (uint8_t *)&v21, 0x16u);
    }

    id v11 = [v3 loadOptionsByID];
    [v11 removeObjectForKey:*(void *)(a1 + 32)];

    int v12 = [v3 loadIDsByURL];
    id v13 = [v12 objectForKeyedSubscript:v8];

    [v13 removeObject:*(void *)(a1 + 32)];
    if (![v13 count])
    {
      id v14 = [v3 loadIDsByURL];
      [v14 removeObjectForKey:v8];

      dispatch_queue_t v15 = [v3 taskOptionsByURL];
      uint64_t v16 = [v15 objectForKeyedSubscript:v8];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"VUIURLImageLoaderTaskKey"];

      v18 = [v3 taskOptionsByURL];
      [v18 removeObjectForKey:v8];

      int v19 = VUICImageLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [v17 description];
        int v21 = 138412546;
        uint64_t v22 = v20;
        __int16 v23 = 2112;
        objc_super v24 = v8;
        _os_log_impl(&dword_1E29E1000, v19, OS_LOG_TYPE_INFO, "URLImageLoader Canceling task %@ URL %@", (uint8_t *)&v21, 0x16u);
      }
      [v17 cancel];
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__VUIURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v15[3] = &unk_1E6DDDC60;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(VUIURLImageLoader *)self _executeOnProcessingQueue:v15];
}

void __78__VUIURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 originalRequest];
  id v11 = [v5 URL];

  id v6 = [v4 taskOptionsByURL];

  id v7 = [v6 objectForKey:v11];
  uint64_t v8 = [v7 objectForKey:@"VUIURLImageLoaderOptionsRequestRecordKey"];

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _timingData];
  [v8 didReceiveResponse:v9 timingData:v10];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__VUIURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke;
  v11[3] = &unk_1E6DDDC88;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(VUIURLImageLoader *)self _executeOnProcessingQueue:v11];
}

void __56__VUIURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 originalRequest];
  id v12 = [v5 URL];

  id v6 = [v4 taskOptionsByURL];
  id v7 = [v6 objectForKey:v12];
  id v8 = [v7 objectForKey:@"VUIURLImageLoaderTaskReceivedDataKey"];

  [v8 appendData:*(void *)(a1 + 40)];
  id v9 = [v4 taskOptionsByURL];

  id v10 = [v9 objectForKey:v12];
  id v11 = [v10 objectForKey:@"VUIURLImageLoaderOptionsRequestRecordKey"];

  [v11 didReceiveData:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v7 = (objc_class *)MEMORY[0x1E4F28B70];
  id v8 = (void (**)(id, id))a6;
  id v9 = a5;
  id v10 = [v7 alloc];
  id v11 = [v9 response];
  id v12 = [v9 data];
  id v13 = [v9 userInfo];

  id v14 = (id)[v10 initWithResponse:v11 data:v12 userInfo:v13 storagePolicy:2];
  v8[2](v8, v14);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_1E6DDDC88;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(VUIURLImageLoader *)self _executeOnProcessingQueue:v11];
}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) originalRequest];
  id v5 = [v4 URL];

  id v6 = [v3 taskOptionsByURL];
  id v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKeyedSubscript:@"VUIURLImageLoaderTaskKey"];
  id v9 = *(void **)(a1 + 32);

  if (v8 != v9)
  {
    id v10 = 0;
    goto LABEL_45;
  }
  id v11 = [v7 objectForKey:@"VUIURLImageLoaderOptionsRequestRecordKey"];
  id v49 = [v7 objectForKey:@"VUIURLImageLoaderTaskDecryptorKey"];
  v50 = [v7 objectForKey:@"VUIURLImageLoaderTaskReceivedDataKey"];
  id v12 = [*(id *)(a1 + 32) response];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v13 = [*(id *)(a1 + 32) response];

  if (!v13)
  {
LABEL_7:
    id v16 = VUICImageLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v5 absoluteString];
      *(_DWORD *)long long buf = 138412290;
      v74 = v17;
      _os_log_impl(&dword_1E29E1000, v16, OS_LOG_TYPE_DEFAULT, "URLImageLoader returned a non-NSHTTPURLResponse with url [%@]", buf, 0xCu);
    }
    dispatch_queue_t v15 = *(void **)(a1 + 40);
    if (v15) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 200;
    }
    goto LABEL_12;
  }
  uint64_t v14 = [v13 statusCode];
  dispatch_queue_t v15 = *(void **)(a1 + 40);

LABEL_12:
  uint64_t v54 = a1;
  v55 = v3;
  v47 = v7;
  long long v51 = v11;
  if (v15 || (unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFF37)
  {
    if (v15)
    {
      id v10 = v15;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28760];
      v79[0] = @"statusCode";
      [NSNumber numberWithInteger:v14];
      v23 = uint64_t v22 = v5;
      v80[0] = v23;
      v79[1] = *MEMORY[0x1E4F28568];
      objc_super v24 = [MEMORY[0x1E4F28D20] localizedStringForStatusCode:v14];
      v80[1] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
      uint64_t v26 = v21;
      id v3 = v55;
      id v10 = [v20 errorWithDomain:v26 code:-18 userInfo:v25];

      id v5 = v22;
    }
    [v11 didFailWithError:v10];
    id v18 = VUICImageLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v27 = [*(id *)(v54 + 32) description];
      *(_DWORD *)long long buf = 138412802;
      v74 = v27;
      __int16 v75 = 2112;
      v76 = v5;
      __int16 v77 = 2112;
      id v78 = v10;
      _os_log_impl(&dword_1E29E1000, v18, OS_LOG_TYPE_INFO, "URLImageLoader Finished task %@ url %@ with error [%@]", buf, 0x20u);
    }
    long long v52 = 0;
  }
  else
  {
    id v18 = v50;
    if ([v18 length])
    {
      if (v49)
      {
        uint64_t v19 = [v49 decryptImageData:v18];

        if (v19)
        {
          long long v52 = +[VUIImage imageWithData:v19];
          objc_msgSend(v52, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
          id v10 = 0;
          id v18 = v19;
        }
        else
        {
          id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
          id v18 = 0;
          long long v52 = 0;
        }
      }
      else
      {
        long long v52 = +[VUIImage imageWithData:v18];
        objc_msgSend(v52, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
        id v10 = 0;
      }
      v28 = VUICImageLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v30 = [*(id *)(v54 + 32) description];
        *(_DWORD *)long long buf = 138412546;
        v74 = v30;
        __int16 v75 = 2112;
        v76 = v5;
        _os_log_impl(&dword_1E29E1000, v28, OS_LOG_TYPE_INFO, "URLImageLoader Finished loading task %@ url %@", buf, 0x16u);
      }
    }
    else
    {
      v28 = VUICImageLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [*(id *)(a1 + 32) description];
        *(_DWORD *)long long buf = 138412546;
        v74 = v29;
        __int16 v75 = 2112;
        v76 = v5;
        _os_log_impl(&dword_1E29E1000, v28, OS_LOG_TYPE_INFO, "URLImageLoader Finished loading task %@ url %@ with no data", buf, 0x16u);
      }
      long long v52 = 0;
      id v10 = 0;
    }

    [v51 didCompleteLoadingWithResponseBody:v18];
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  int v31 = [v3 loadIDsByURL];
  id v48 = v5;
  id v32 = [v31 objectForKeyedSubscript:v5];

  id obj = v32;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v69 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        id v38 = [v55 loadOptionsByID];
        id v39 = [v38 objectForKeyedSubscript:v37];

        v40 = [v55 loadOptionsByID];
        [v40 removeObjectForKey:v37];

        v41 = [v39 objectForKey:@"VUIURLImageLoaderOptionsCompletionHandlerKey"];
        v42 = v41;
        if (v10)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_50;
          block[3] = &unk_1E6DDD668;
          id v67 = v41;
          id v65 = *(id *)(v54 + 32);
          id v66 = v10;
          dispatch_async(MEMORY[0x1E4F14428], block);

          id v43 = &v65;
          id v44 = &v67;
        }
        else if (v52)
        {
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2;
          v59[3] = &unk_1E6DDDCB0;
          id v63 = v41;
          id v60 = *(id *)(v54 + 32);
          id v61 = v52;
          id v62 = *(id *)(v54 + 40);
          dispatch_async(MEMORY[0x1E4F14428], v59);

          id v43 = &v60;
          id v44 = &v63;
        }
        else
        {
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3;
          v56[3] = &unk_1E6DDD5F0;
          id v58 = v41;
          id v57 = *(id *)(v54 + 32);
          dispatch_async(MEMORY[0x1E4F14428], v56);
          id v43 = &v57;
          id v44 = &v58;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v34);
  }

  id v3 = v55;
  id v45 = [v55 loadIDsByURL];
  id v5 = v48;
  [v45 removeObjectForKey:v48];

  id v46 = [v55 taskOptionsByURL];
  [v46 removeObjectForKey:v48];

  id v7 = v47;
LABEL_45:
}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_50(uint64_t a1)
{
  if (*(void *)(a1 + 48) && [*(id *)(a1 + 32) state] != 2)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 40))
    {
      id v3 = *(void (**)(uint64_t, void, void, void, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 48);
      v3(v4, 0, 0, 0, 0);
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v5);
    }
  }
}

uint64_t __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 56))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) state];
    if (result != 2)
    {
      uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 56) + 16);
      return v2();
    }
  }
  return result;
}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40) && [*(id *)(a1 + 32) state] != 2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);
  }
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (BOOL)useMinimalSessionImageLoading
{
  return self->_useMinimalSessionImageLoading;
}

- (BOOL)isImageRotationEnabled
{
  return self->_imageRotationEnabled;
}

- (void)setImageRotationEnabled:(BOOL)a3
{
  self->_imageRotationEnabled = a3;
}

- (NSMutableDictionary)loadOptionsByID
{
  return self->_loadOptionsByID;
}

- (NSMutableDictionary)loadIDsByURL
{
  return self->_loadIDsByURL;
}

- (NSMutableDictionary)taskOptionsByURL
{
  return self->_taskOptionsByURL;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_taskOptionsByURL, 0);
  objc_storeStrong((id *)&self->_loadIDsByURL, 0);
  objc_storeStrong((id *)&self->_loadOptionsByID, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end