@interface TPSURLSessionHandler
+ (id)sharedInstance;
- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3;
- (BOOL)respectCachingForRequest:(id)a3;
- (BOOL)shouldCacheToDiskForSessionTask:(id)a3;
- (BOOL)shouldIgnoreInMemoryCaching;
- (NSIndexSet)excludeCachingDataTypes;
- (NSString)certificateFilePath;
- (NSString)passphrase;
- (TPSURLSessionHandler)init;
- (TPSURLSessionHandlerDelegate)delegate;
- (id)URLSessionManagerSessionConfiguration:(id)a3;
- (id)URLSessionManagerSessionOperationQueue:(id)a3;
- (id)cacheControllerForDataType:(int64_t)a3;
- (id)processJSONFormattedDataForCDSError:(id)a3;
- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4;
- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4;
- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4;
- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5;
- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5;
- (void)setCertificateFilePath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludeCachingDataTypes:(id)a3;
- (void)setPassphrase:(id)a3;
- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3;
- (void)storeCachedResponseData:(id)a3 forSessionTask:(id)a4;
@end

@implementation TPSURLSessionHandler

- (BOOL)shouldIgnoreInMemoryCaching
{
  return self->_shouldIgnoreInMemoryCaching;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_1 != -1) {
    dispatch_once(&sharedInstance_predicate_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_gTPSURLSessionHandler;
  return v2;
}

uint64_t __38__TPSURLSessionHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TPSURLSessionHandler);
  uint64_t v1 = sharedInstance_gTPSURLSessionHandler;
  sharedInstance_gTPSURLSessionHandler = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (TPSURLSessionHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)TPSURLSessionHandler;
  return [(TPSURLSessionHandler *)&v3 init];
}

- (void)setPassphrase:(id)a3
{
  id v7 = a3;
  if (+[TPSCommonDefines isInternalDevice])
  {
    passphrase = self->_passphrase;
    p_passphrase = &self->_passphrase;
    if (![(NSString *)passphrase isEqualToString:v7]) {
      objc_storeStrong((id *)p_passphrase, a3);
    }
  }
}

- (void)setCertificateFilePath:(id)a3
{
  id v7 = a3;
  if (+[TPSCommonDefines isInternalDevice])
  {
    certificateFilePath = self->_certificateFilePath;
    p_certificateFilePath = &self->_certificateFilePath;
    if (![(NSString *)certificateFilePath isEqualToString:v7]) {
      objc_storeStrong((id *)p_certificateFilePath, a3);
    }
  }
}

- (id)cacheControllerForDataType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(__objc2_class *)*off_1E5906DF8[a3 - 1] sharedInstance];
  }
  return v5;
}

- (id)URLSessionManagerSessionOperationQueue:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v3 setMaxConcurrentOperationCount:4];
  return v3;
}

- (id)URLSessionManagerSessionConfiguration:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F29078], "tps_urlCacheWithIdentifier:memoryCapacity:diskCapacity:", 0, +[TPSURLSessionManager defaultURLCacheMemoryCapcity](TPSURLSessionManager, "defaultURLCacheMemoryCapcity", a3), +[TPSURLSessionManager defaultURLCacheDiskCapcity](TPSURLSessionManager, "defaultURLCacheDiskCapcity"));
  [MEMORY[0x1E4F29078] setSharedURLCache:v3];
  uint64_t v4 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  [v4 setURLCache:v3];

  return v4;
}

- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3
{
  return 0;
}

- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  v8 = (void (**)(id, void))a5;
  if (-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", [a3 dataType])) {
    id v9 = v10;
  }
  else {
    id v9 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v9);
}

- (BOOL)shouldCacheToDiskForSessionTask:(id)a3
{
  return !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", [a3 dataType]);
}

- (id)processJSONFormattedDataForCDSError:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"errorDetail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 objectForKey:@"errorCode"];
      uint64_t v6 = [v5 integerValue];

      uint64_t v7 = [v4 objectForKey:@"errorMessage"];
      v8 = (void *)v7;
      id v9 = 0;
      if (v6 >= 1 && v7)
      {
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:v6 userInfo:0];
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)storeCachedResponseData:(id)a3 forSessionTask:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 response];
  if (v6)
  {
    uint64_t v7 = [v5 underlyingSession];
    v8 = [v7 configuration];
    id v9 = [v8 URLCache];

    id v10 = objc_alloc(MEMORY[0x1E4F28B70]);
    v11 = v10;
    if (v16)
    {
      v12 = (void *)[v10 initWithResponse:v6 data:v16 userInfo:0 storagePolicy:0];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1C9B8] data];
      v12 = (void *)[v11 initWithResponse:v6 data:v13 userInfo:0 storagePolicy:0];
    }
    v14 = [v5 task];
    v15 = [v14 currentRequest];
    [v9 storeCachedResponse:v12 forRequest:v15];
  }
}

- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  uint64_t v7 = [v38 dataType];
  v8 = [(TPSURLSessionHandler *)self cacheControllerForDataType:v7];
  id v9 = [v38 identifier];
  id v10 = [v8 dataCacheForIdentifier:v9];
  uint64_t v11 = [v38 downloadTaskTotalBytes];
  if (v8)
  {
    v12 = [v38 response];
    uint64_t v13 = [v12 statusCode];

    id v14 = v6;
    if (v13 == 200)
    {
      v15 = 0;
    }
    else
    {
      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TPSURLSessionError" code:v13 userInfo:0];
    }
    BOOL v21 = v7 == 1 && v15 == 0;
    int v22 = !v21;
    if (v21)
    {
      id v19 = [v8 formattedDataWithFileURL:v14];
      v15 = [(TPSURLSessionHandler *)self processJSONFormattedDataForCDSError:v19];
    }
    else
    {
      id v19 = 0;
    }
    if (v15)
    {
      [v38 setDataError:v15];
    }
    else
    {
      if ([(TPSURLSessionHandler *)self shouldCacheToDiskForSessionTask:v38])
      {
        v23 = [v38 lastModified];
        uint64_t v24 = [v8 saveFileURL:v14 identifier:v9 fileSize:v11 lastModified:v23 dataCache:v10];

        id v14 = (id)v24;
      }
      if (v22)
      {
        uint64_t v25 = [v8 formattedDataWithFileURL:v14];

        id v19 = (id)v25;
      }
    }

    v20 = 0;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1C9B8];
    v17 = [v6 path];
    v18 = [v16 dataWithContentsOfFile:v17];

    id v19 = v18;
    v20 = v19;
  }
  v26 = [v38 response];
  if (v26)
  {
    v37 = v10;
    v27 = [v38 underlyingSession];
    v28 = [v27 configuration];
    v29 = [v28 URLCache];

    if (v20)
    {
      v30 = (objc_class *)MEMORY[0x1E4F28B70];
      id v31 = v20;
      id v32 = [v30 alloc];
    }
    else
    {
      id v31 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:0];
      id v33 = objc_alloc(MEMORY[0x1E4F28B70]);
      if (!v31)
      {
        id v31 = [MEMORY[0x1E4F1C9B8] data];
      }
      id v32 = v33;
    }
    v34 = (void *)[v32 initWithResponse:v26 data:v31 userInfo:0 storagePolicy:0];

    v35 = [v38 task];
    v36 = [v35 currentRequest];
    [v29 storeCachedResponse:v34 forRequest:v36];

    id v10 = v37;
  }
  [v38 setFormattedData:v19];
}

- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v11 = [v8 dataType];
  BOOL v12 = [(TPSURLSessionHandler *)self shouldCacheToDiskForSessionTask:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    [v8 setResponse:v13];
    id v14 = [v8 task];
    v15 = [v14 currentRequest];
    BOOL v16 = [(TPSURLSessionHandler *)self respectCachingForRequest:v15];

    if (v12 && v16)
    {
      v17 = [v13 allHeaderFields];
      v18 = [v17 objectForKeyedSubscript:@"Last-Modified"];

      [v8 setLastModified:v18];
      if (v18 && ![(NSIndexSet *)self->_excludeCachingDataTypes containsIndex:v11])
      {
        id v19 = [(TPSURLSessionHandler *)self cacheControllerForDataType:v11];
        v20 = [v8 identifier];
        BOOL v21 = [v19 dataCacheForIdentifier:v20];

        if (v21)
        {
          int v22 = [v21 lastModified];
          if ([v22 isEqualToString:v18])
          {
            int v23 = [v19 isDataCacheValid:v21];

            if (v23)
            {
              uint64_t v24 = +[TPSLogger default];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
                -[TPSURLSessionHandler sessionTask:didReceiveResponse:completionHandler:](v21, v24);
              }

              uint64_t v25 = [v19 cacheFileURLForDataCache:v21];
              v26 = [v19 formattedDataWithFileURL:v25];
              [v8 setFormattedData:v26];

              uint64_t v27 = 1;
              [v8 setIsCacheData:1];
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __73__TPSURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke;
              v33[3] = &unk_1E5906790;
              id v34 = v21;
              id v35 = v19;
              id v28 = v19;
              id v29 = v21;
              dispatch_async(MEMORY[0x1E4F14428], v33);

LABEL_21:
              uint64_t v30 = 0;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
      }
      if (v11 != 2
        || ([v13 allHeaderFields],
            uint64_t v31 = objc_claimAutoreleasedReturnValue(),
            [(id)v31 objectForKeyedSubscript:@"Content-Type"],
            id v32 = objc_claimAutoreleasedReturnValue(),
            (id)v31,
            LOBYTE(v31) = [v32 containsString:@"text/html"],
            v32,
            (v31 & 1) == 0))
      {

        uint64_t v27 = 0;
        uint64_t v30 = 2;
        goto LABEL_15;
      }
      uint64_t v27 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v27 = 0;
  if (v12) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 1;
  }
LABEL_15:
  v10[2](v10, v30, v27);
}

uint64_t __73__TPSURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setUpdatedDate:v2];

  id v3 = *(void **)(a1 + 40);
  return [v3 updateCache];
}

- (BOOL)respectCachingForRequest:(id)a3
{
  uint64_t v3 = [a3 cachePolicy];
  return v3 != 1 && v3 != 4;
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 task];
  if (!v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v6 response];
      uint64_t v10 = [v9 statusCode];

      uint64_t v11 = [v8 response];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = [v8 response];
        id v14 = [v13 allHeaderFields];
        v15 = [v14 objectForKeyedSubscript:@"Last-Modified"];
        [v6 setLastModified:v15];
      }
      else
      {
        id v13 = 0;
      }
      BOOL v16 = [v6 dataTaskData];
      v17 = [v6 task];
      v18 = [v17 originalRequest];

      BOOL v19 = [(TPSURLSessionHandler *)self respectCachingForRequest:v18];
      if (v6 && v19 && [v13 statusCode] != 404 && objc_msgSend(v13, "statusCode") != 200 && v18)
      {
        v39 = v16;
        v20 = [MEMORY[0x1E4F29078] sharedURLCache];
        BOOL v21 = [v20 cachedResponseForRequest:v18];

        int v22 = [v21 response];
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass();

        if (v23)
        {
          uint64_t v24 = [v21 response];

          if ([v24 statusCode] == 200)
          {
            uint64_t v25 = [v21 data];

            if (v25)
            {
              uint64_t v10 = [v24 statusCode];
              v26 = +[TPSLogger data];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = [v18 URL];
                *(_DWORD *)buf = 138412290;
                v45 = v27;
                _os_log_impl(&dword_19C8DC000, v26, OS_LOG_TYPE_DEFAULT, "Using cache data for request: %@", buf, 0xCu);
              }
              id v28 = (void *)MEMORY[0x1E4F1CA58];
              id v29 = [v21 data];
              uint64_t v30 = [v28 dataWithData:v29];

              [v6 setDataTaskData:v30];
              [v6 setIsCacheData:v30 != 0];
              v39 = (void *)v30;
            }
          }
        }
        else
        {
          uint64_t v24 = v13;
        }

        id v13 = v24;
        BOOL v16 = v39;
      }
      if (v10 == 200)
      {
        uint64_t v31 = 0;
        if (!v6) {
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TPSURLSessionError" code:v10 userInfo:0];
        if (!v6)
        {
LABEL_31:
          [v6 setDataError:v31];

          goto LABEL_32;
        }
      }
      if ([v16 length])
      {
        uint64_t v32 = [v6 dataType];
        id v33 = [v6 dataError];

        if (!v33 || v32 == 1)
        {
          id v34 = -[TPSURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", [v6 dataType]);
          v40 = v16;
          id v35 = [v34 formattedDataWithData:v16];
          if (v32 == 1)
          {
            uint64_t v36 = [(TPSURLSessionHandler *)self processJSONFormattedDataForCDSError:v35];

            uint64_t v31 = (void *)v36;
          }

          if (v35)
          {
            [v6 setFormattedData:v35];
          }
          BOOL v16 = v40;
        }
      }
      goto LABEL_31;
    }
  }
LABEL_32:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TPSURLSessionHandler_sessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_1E5906790;
  id v42 = v7;
  id v43 = v8;
  id v37 = v8;
  id v38 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__TPSURLSessionHandler_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 code] != -999)
    {
      uint64_t v3 = +[TPSLogger data];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 40) currentRequest];
        id v5 = [v4 URL];
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "URLSession %@ failed with error, %@", buf, 0x16u);
      }
      id v7 = +[TPSNetworkPathMonitor sharedMonitor];
      [v7 start];
    }
  }
  else
  {
    id v8 = +[TPSNetworkPathMonitor sharedMonitor];
    [v8 stop];
  }
}

- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (+[TPSCommonDefines isInternalDevice]
    && [v6 previousFailureCount] < 4)
  {
    id v8 = [v6 proposedCredential];
    id v9 = [v6 protectionSpace];
    uint64_t v10 = [v9 authenticationMethod];
    if ([v10 isEqualToString:*MEMORY[0x1E4F28968]])
    {
      __int16 v11 = [v9 host];
      int v12 = [v11 hasSuffix:@".apple.com"];

      if (v12)
      {
        if (self->_passphrase && self->_certificateFilePath)
        {
          CFDataRef v13 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:self->_certificateFilePath];
          if (v13)
          {
            id v14 = (void *)*MEMORY[0x1E4F3B9E8];
            values = self->_passphrase;
            keys[0] = v14;
            CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
            CFArrayRef items = 0;
            if (!SecPKCS12Import(v13, v15, &items))
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
              Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
              SecCertificateRef v22 = 0;
              SecIdentityCopyCertificate(Value, &v22);
              uint64_t v24 = v22;
              CFArrayRef v18 = CFArrayCreate(0, (const void **)&v24, 1, 0);
              uint64_t v19 = [MEMORY[0x1E4F29098] credentialWithIdentity:Value certificates:v18 persistence:1];

              if (v18) {
                CFRelease(v18);
              }
              id v8 = (void *)v19;
            }
            if (v15) {
              CFRelease(v15);
            }
          }
        }
      }
    }
    if (v8)
    {
      uint64_t v20 = 0;
      BOOL v21 = v8;
    }
    else
    {
      uint64_t v20 = 1;
      BOOL v21 = 0;
    }
    ((void (**)(id, uint64_t, void *))v7)[2](v7, v20, v21);
  }
  else
  {
    v7[2](v7, 3, 0);
  }
}

- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E5906DD8;
  objc_copyWeak(&v18, &location);
  id v16 = v8;
  id v17 = v10;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (+[TPSCommonDefines isInternalDevice]) {
      goto LABEL_11;
    }
    id v4 = 0;
LABEL_13:
    (*((void (**)(void))a1[6] + 2))();
LABEL_22:

    goto LABEL_23;
  }
  id v4 = objc_loadWeakRetained(WeakRetained + 2);
  if (!+[TPSCommonDefines isInternalDevice]) {
    goto LABEL_13;
  }
  if (v4)
  {
    id v5 = [a1[4] protectionSpace];
    id v6 = [v5 authenticationMethod];

    if (([v6 isEqualToString:*MEMORY[0x1E4F28970]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F28978]])
    {
      if ([a1[4] previousFailureCount] > 3)
      {
        if (objc_opt_respondsToSelector()) {
          [v4 urlSessionHandlerURLAuthenticationFailed:v3];
        }
        (*((void (**)(void))a1[6] + 2))();
      }
      else
      {
        uint64_t v7 = [a1[4] proposedCredential];
        if (v7 && (v8 = (void *)v7, uint64_t v9 = [a1[4] previousFailureCount], v8, v9 <= 1))
        {
          id v10 = (void (**)(id, void, void *))a1[6];
          id v11 = [a1[4] proposedCredential];
          v10[2](v10, 0, v11);
        }
        else
        {
          id v12 = [a1[5] task];
          id v13 = [v12 currentRequest];
          id v14 = [v13 URL];
          id v15 = [v14 host];

          if (objc_opt_respondsToSelector())
          {
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2;
            v16[3] = &unk_1E5906DB0;
            id v17 = a1[6];
            [v4 urlSessionHandlerURL:v3 authenticateWithHost:v15 completionHandler:v16];
          }
          else
          {
            (*((void (**)(void))a1[6] + 2))();
          }
        }
      }
    }

    goto LABEL_22;
  }
LABEL_11:
  (*((void (**)(void))a1[6] + 2))();
LABEL_23:
}

void __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 length] && objc_msgSend(v5, "length"))
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29098]) initWithUser:v7 password:v5 persistence:2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (TPSURLSessionHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSURLSessionHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3
{
  self->_shouldIgnoreInMemoryCaching = a3;
}

- (NSIndexSet)excludeCachingDataTypes
{
  return self->_excludeCachingDataTypes;
}

- (void)setExcludeCachingDataTypes:(id)a3
{
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSString)certificateFilePath
{
  return self->_certificateFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateFilePath, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_excludeCachingDataTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sessionTask:(void *)a1 didReceiveResponse:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Data cache Last-Modified did not change, cancel request and use cache %@", (uint8_t *)&v4, 0xCu);
}

@end