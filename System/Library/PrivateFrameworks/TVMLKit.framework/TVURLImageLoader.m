@interface TVURLImageLoader
+ (id)sharedInstance;
- (BOOL)isImageRotationEnabled;
- (NSMutableDictionary)loadIDsByURL;
- (NSMutableDictionary)loadOptionsByID;
- (NSMutableDictionary)taskOptionsByURL;
- (NSURLSession)session;
- (OS_dispatch_queue)processingQueue;
- (TVURLImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_executeOnProcessingQueue:(id)a3;
- (void)cancelLoad:(id)a3;
- (void)setImageRotationEnabled:(BOOL)a3;
@end

@implementation TVURLImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_36);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __34__TVURLImageLoader_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TVURLImageLoader);
  uint64_t v1 = sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (TVURLImageLoader)init
{
  v16.receiver = self;
  v16.super_class = (Class)TVURLImageLoader;
  v2 = [(TVURLImageLoader *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v3 setHTTPMaximumConnectionsPerHost:4];
    [v3 setHTTPShouldUsePipelining:1];
    [v3 setWaitsForConnectivity:0];
    objc_msgSend(v3, "set_timingDataOptions:", 1);
    uint64_t v4 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v3 delegate:v2 delegateQueue:0];
    session = v2->_session;
    v2->_session = (NSURLSession *)v4;

    objc_msgSend(NSString, "stringWithFormat:", @"TVURLImageLoader (%p) processing queue", v2);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 cStringUsingEncoding:4], 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    loadOptionsByID = v2->_loadOptionsByID;
    v2->_loadOptionsByID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    loadIDsByURL = v2->_loadIDsByURL;
    v2->_loadIDsByURL = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    taskOptionsByURL = v2->_taskOptionsByURL;
    v2->_taskOptionsByURL = (NSMutableDictionary *)v13;
  }
  return v2;
}

- (void)_executeOnProcessingQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(TVURLImageLoader *)self processingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TVURLImageLoader__executeOnProcessingQueue___block_invoke;
  block[3] = &unk_264BA8008;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __46__TVURLImageLoader__executeOnProcessingQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 url];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 absoluteString];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 identifier];
    goto LABEL_5;
  }
  id v6 = (void *)TVMLKitImageLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
    -[TVURLImageLoader imageKeyForObject:](v6);
  }
  id v5 = 0;
LABEL_9:
  dispatch_queue_t v7 = objc_msgSend(v5, "tv_SHA256String");

  return v7;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = self;
    objc_super v16 = [(TVURLImageLoader *)self session];
    id v17 = [v16 dataTaskWithURL:v11];

    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
        -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](v44);
      }
      id v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
      (*((void (**)(id, void, void, void, void, id))v13 + 2))(v13, 0, 0, 0, 0, v28);
      id v17 = 0;
      id v25 = 0;
      goto LABEL_23;
    }
    id v51 = v11;
    v52 = self;
    v47 = v14;
    id v48 = v13;
    id v49 = v12;
    id v29 = v11;
    id v30 = objc_alloc(MEMORY[0x263F089E0]);
    v31 = [v29 url];
    v32 = (void *)[v30 initWithURL:v31];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v33 = [v29 headers];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v61;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v60 + 1) + 8 * v37);
          v39 = [v29 headers];
          v40 = [v39 objectForKey:v38];
          [v32 setValue:v40 forHTTPHeaderField:v38];

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [v33 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v35);
    }

    v41 = [(TVURLImageLoader *)v52 session];
    id v17 = [v41 dataTaskWithRequest:v32];

    v42 = [v29 decrypter];

    v15 = v26;
    if (v42)
    {
      v43 = [v29 decrypter];
      [v26 setObject:v43 forKey:@"TVURLImageLoaderTaskDecryptorKey"];
    }
    id v13 = v48;
    id v12 = v49;
    v14 = v47;
    id v11 = v51;
    if (v17)
    {
LABEL_3:
      id v50 = v11;
      v18 = [v17 originalRequest];
      v19 = [v18 URL];

      v20 = [MEMORY[0x263F08C38] UUID];
      v21 = [v20 description];

      [v14 setObject:v21 forKey:@"TVURLImageLoaderOptionsIDKey"];
      [v14 setObject:v19 forKey:@"TVURLImageLoaderOptionsURLKey"];
      if (v13)
      {
        v22 = (void *)[v13 copy];
        [v14 setObject:v22 forKey:@"TVURLImageLoaderOptionsCompletionHandlerKey"];
      }
      [v15 setObject:v17 forKey:@"TVURLImageLoaderTaskKey"];
      v23 = [v12 recordForResource:3 withInitiator:2];
      if (v23) {
        [v15 setObject:v23 forKey:@"TVURLImageLoaderOptionsRequestRecordKey"];
      }
      v24 = [MEMORY[0x263EFF990] data];
      [v15 setObject:v24 forKey:@"TVURLImageLoaderTaskReceivedDataKey"];

      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v53[3] = &unk_264BA8030;
      id v25 = v21;
      id v54 = v25;
      id v55 = v14;
      id v56 = v19;
      id v17 = v17;
      id v57 = v17;
      v26 = v15;
      id v58 = v15;
      id v59 = v23;
      id v27 = v23;
      id v28 = v19;
      [(TVURLImageLoader *)v52 _executeOnProcessingQueue:v53];

      id v11 = v50;
LABEL_23:

      goto LABEL_24;
    }
  }
  v26 = v15;
  id v25 = 0;
LABEL_24:
  id v45 = v25;

  return v45;
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
  id v5 = [v3 loadOptionsByID];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
    __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_2();
  }
  id v6 = [v3 loadIDsByURL];
  dispatch_queue_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v7)
  {
    dispatch_queue_t v7 = [MEMORY[0x263EFF980] array];
    id v8 = [v3 loadIDsByURL];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  [v7 addObject:*(void *)(a1 + 32)];
  if ([v7 count] == 1)
  {
    id v9 = (void *)TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
      __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_1(a1, v9);
    }
    v10 = (void *)[*(id *)(a1 + 64) copy];
    id v11 = [v3 taskOptionsByURL];
    [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];

    [*(id *)(a1 + 56) resume];
    id v12 = *(void **)(a1 + 72);
    id v13 = [*(id *)(a1 + 56) originalRequest];
    [v12 willSendRequest:v13];
  }
}

- (void)cancelLoad:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__TVURLImageLoader_cancelLoad___block_invoke;
    v5[3] = &unk_264BA8058;
    id v6 = v4;
    [(TVURLImageLoader *)self _executeOnProcessingQueue:v5];
  }
}

void __31__TVURLImageLoader_cancelLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 loadOptionsByID];
  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = (void *)(a1 + 32);
  dispatch_queue_t v7 = [v4 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v3 loadOptionsByID];
    id v9 = [v8 objectForKeyedSubscript:*v5];
    v10 = [v9 objectForKeyedSubscript:@"TVURLImageLoaderOptionsURLKey"];

    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
      __31__TVURLImageLoader_cancelLoad___block_invoke_cold_2();
    }
    id v11 = [v3 loadOptionsByID];
    [v11 removeObjectForKey:*v5];

    id v12 = [v3 loadIDsByURL];
    id v13 = [v12 objectForKeyedSubscript:v10];

    [v13 removeObject:*v5];
    if (![v13 count])
    {
      v14 = [v3 loadIDsByURL];
      [v14 removeObjectForKey:v10];

      v15 = [v3 taskOptionsByURL];
      objc_super v16 = [v15 objectForKeyedSubscript:v10];
      id v17 = [v16 objectForKeyedSubscript:@"TVURLImageLoaderTaskKey"];

      v18 = [v3 taskOptionsByURL];
      [v18 removeObjectForKey:v10];

      v19 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
        __31__TVURLImageLoader_cancelLoad___block_invoke_cold_1(v19);
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
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__TVURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v15[3] = &unk_264BA8080;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(TVURLImageLoader *)self _executeOnProcessingQueue:v15];
}

void __77__TVURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 originalRequest];
  id v11 = [v5 URL];

  uint64_t v6 = [v4 taskOptionsByURL];

  dispatch_queue_t v7 = [v6 objectForKey:v11];
  id v8 = [v7 objectForKey:@"TVURLImageLoaderOptionsRequestRecordKey"];

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _timingData];
  [v8 didReceiveResponse:v9 timingData:v10];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__TVURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke;
  v11[3] = &unk_264BA80A8;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(TVURLImageLoader *)self _executeOnProcessingQueue:v11];
}

void __55__TVURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 originalRequest];
  id v12 = [v5 URL];

  uint64_t v6 = [v4 taskOptionsByURL];
  id v7 = [v6 objectForKey:v12];
  id v8 = [v7 objectForKey:@"TVURLImageLoaderTaskReceivedDataKey"];

  [v8 appendData:*(void *)(a1 + 40)];
  id v9 = [v4 taskOptionsByURL];

  id v10 = [v9 objectForKey:v12];
  id v11 = [v10 objectForKey:@"TVURLImageLoaderOptionsRequestRecordKey"];

  [v11 didReceiveData:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v7 = (objc_class *)MEMORY[0x263F086F8];
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
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_264BA80A8;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(TVURLImageLoader *)self _executeOnProcessingQueue:v11];
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  v79[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) originalRequest];
  id v5 = [v4 URL];

  uint64_t v6 = [v3 taskOptionsByURL];
  id v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKeyedSubscript:@"TVURLImageLoaderTaskKey"];
  id v9 = *(void **)(a1 + 32);

  if (v8 == v9)
  {
    id v11 = [v7 objectForKey:@"TVURLImageLoaderOptionsRequestRecordKey"];
    id v10 = [v7 objectForKey:@"TVURLImageLoaderTaskDecryptorKey"];
    id v50 = [v7 objectForKey:@"TVURLImageLoaderTaskReceivedDataKey"];
    id v12 = [*(id *)(a1 + 32) response];
    uint64_t v13 = objc_msgSend(v12, "itunes_statusCode");

    id v14 = *(void **)(a1 + 40);
    v47 = v11;
    id v48 = v7;
    uint64_t v51 = a1;
    id v54 = (id *)(a1 + 32);
    v46 = v10;
    if (v14 || (unint64_t)(v13 - 400) <= 0xFFFFFFFFFFFFFF37)
    {
      if (v14)
      {
        id v10 = v14;
      }
      else
      {
        id v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v19 = *MEMORY[0x263F08410];
        v78[0] = @"statusCode";
        v20 = [NSNumber numberWithInteger:v13];
        v79[0] = v20;
        v78[1] = *MEMORY[0x263F08320];
        v21 = [MEMORY[0x263F088A0] localizedStringForStatusCode:v13];
        v79[1] = v21;
        [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
        v23 = v22 = v11;
        id v10 = [v18 errorWithDomain:v19 code:-18 userInfo:v23];

        id v11 = v22;
      }
      [v11 didFailWithError:v10];
      v24 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
      {
        id v43 = *v54;
        v44 = v24;
        id v45 = [v43 description];
        *(_DWORD *)buf = 138412802;
        v73 = v45;
        __int16 v74 = 2112;
        v75 = v5;
        __int16 v76 = 2112;
        id v77 = v10;
        _os_log_debug_impl(&dword_230B4C000, v44, OS_LOG_TYPE_DEBUG, "URLImageLoader Finished task %@ url %@ with error [%@]", buf, 0x20u);
      }
      v52 = 0;
    }
    else
    {
      id v15 = v50;
      if ([v15 length])
      {
        if (v10)
        {
          uint64_t v16 = [v10 decryptImageData:v15];

          if (v16)
          {
            id v17 = +[TVImage imageWithData:v16];
            objc_msgSend(v17, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
            id v10 = 0;
            id v15 = (id)v16;
          }
          else
          {
            id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
            id v15 = 0;
            id v17 = 0;
          }
        }
        else
        {
          id v17 = +[TVImage imageWithData:v15];
          objc_msgSend(v17, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
        }
        v26 = (void *)TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
          __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_2((uint64_t)v54, v26);
        }
      }
      else
      {
        id v25 = (void *)TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG)) {
          __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_1(a1 + 32, v25);
        }
        id v17 = 0;
        id v10 = 0;
      }
      v52 = v17;
      [v11 didCompleteLoadingWithResponseBody:v15];
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v27 = [v3 loadIDsByURL];
    id v49 = v5;
    id v28 = [v27 objectForKeyedSubscript:v5];

    id obj = v28;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v68 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v34 = [v3 loadOptionsByID];
          uint64_t v35 = [v34 objectForKeyedSubscript:v33];

          uint64_t v36 = [v3 loadOptionsByID];
          [v36 removeObjectForKey:v33];

          uint64_t v37 = [v35 objectForKey:@"TVURLImageLoaderOptionsCompletionHandlerKey"];
          uint64_t v38 = v37;
          if (v10)
          {
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_43;
            block[3] = &unk_264BA7B28;
            id v66 = v37;
            id v64 = *v54;
            id v65 = v10;
            dispatch_async(MEMORY[0x263EF83A0], block);

            v39 = &v64;
            v40 = &v66;
          }
          else if (v52)
          {
            v58[0] = MEMORY[0x263EF8330];
            v58[1] = 3221225472;
            v58[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2;
            v58[3] = &unk_264BA80D0;
            id v62 = v37;
            id v59 = *(id *)(v51 + 32);
            id v60 = v52;
            id v61 = *(id *)(v51 + 40);
            dispatch_async(MEMORY[0x263EF83A0], v58);

            v39 = &v59;
            v40 = &v62;
          }
          else
          {
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            v55[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3;
            v55[3] = &unk_264BA7B50;
            id v57 = v37;
            id v56 = *v54;
            dispatch_async(MEMORY[0x263EF83A0], v55);
            v39 = &v56;
            v40 = &v57;
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v30);
    }

    v41 = [v3 loadIDsByURL];
    id v5 = v49;
    [v41 removeObjectForKey:v49];

    v42 = [v3 taskOptionsByURL];
    [v42 removeObjectForKey:v49];

    id v7 = v48;
  }
  else
  {
    id v10 = 0;
  }
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_43(uint64_t a1)
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
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v5);
    }
  }
}

uint64_t __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t result)
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

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40) && [*(id *)(a1 + 32) state] != 2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);
  }
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (BOOL)isImageRotationEnabled
{
  return self->_imageRotationEnabled;
}

- (void)setImageRotationEnabled:(BOOL)a3
{
  self->_imageRotationEnabled = a3;
}

- (NSURLSession)session
{
  return self->_session;
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
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)imageKeyForObject:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v3, v4, "URLImageLoader cannot create key for object of type [%@]", v5, v6, v7, v8, 2u);
}

- (void)loadImageForObject:(void *)a1 scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v3, v4, "URLImageLoader cannot load image for object of type [%@]", v5, v6, v7, v8, 2u);
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2_0() description];
  OUTLINED_FUNCTION_0_0(&dword_230B4C000, v5, v6, "URLImageLoader Loading task %@ URL %@", v7, v8, v9, v10, 2u);
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_230B4C000, v0, v1, "URLImageLoader Adding request %@ URL %@");
}

void __31__TVURLImageLoader_cancelLoad___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_2_0() description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_230B4C000, v4, v5, "URLImageLoader Canceling task %@ URL %@", v6, v7, v8, v9, v10);
}

void __31__TVURLImageLoader_cancelLoad___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_230B4C000, v0, v1, "URLImageLoader Canceling request %@ URL %@");
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2_0() description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_230B4C000, v5, v6, "URLImageLoader Finished loading task %@ url %@ with no data", v7, v8, v9, v10, v11);
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2_0() description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_230B4C000, v5, v6, "URLImageLoader Finished loading task %@ url %@", v7, v8, v9, v10, v11);
}

@end