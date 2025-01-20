@interface RCFallbackOperation
- (BOOL)enableExtraLogs;
- (BOOL)validateOperation;
- (NSString)requestKey;
- (NSString)storefrontID;
- (NSString)userID;
- (NSURL)fallbackURL;
- (OS_dispatch_queue)completionQueue;
- (RCConfigurationResource)cachedConfigurationResource;
- (RCConfigurationResource)configurationResource;
- (double)fallbackTimeoutDuration;
- (id)configurationCompletionHandler;
- (id)networkEventHandler;
- (unint64_t)environment;
- (void)_fetchConfigurationWithURL:(id)a3 requestKey:(id)a4 enableExtraLogs:(BOOL)a5 fallbackTimeoutDuration:(double)a6;
- (void)_parseFallbackResponse:(id)a3 fallbackURL:(id)a4 requestKey:(id)a5 enableExtraLogs:(BOOL)a6 maxAge:(id)a7 etag:(id)a8 lastModifiedString:(id)a9 completion:(id)a10;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachedConfigurationResource:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setConfigurationCompletionHandler:(id)a3;
- (void)setConfigurationResource:(id)a3;
- (void)setEnableExtraLogs:(BOOL)a3;
- (void)setEnvironment:(unint64_t)a3;
- (void)setFallbackTimeoutDuration:(double)a3;
- (void)setFallbackURL:(id)a3;
- (void)setNetworkEventHandler:(id)a3;
- (void)setRequestKey:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setUserID:(id)a3;
- (void)validateOperation;
@end

@implementation RCFallbackOperation

- (BOOL)validateOperation
{
  v3 = [(RCFallbackOperation *)self requestKey];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCFallbackOperation validateOperation]();
  }
  v4 = [(RCFallbackOperation *)self fallbackURL];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCFallbackOperation validateOperation]();
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)performOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = RCSharedLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(RCOperation *)self shortOperationDescription];
    BOOL v5 = [(RCFallbackOperation *)self fallbackURL];
    int v9 = 138543618;
    v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A4AB3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config with fallback URL: %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = [(RCFallbackOperation *)self fallbackURL];
  v7 = [(RCFallbackOperation *)self requestKey];
  BOOL v8 = [(RCFallbackOperation *)self enableExtraLogs];
  [(RCFallbackOperation *)self fallbackTimeoutDuration];
  -[RCFallbackOperation _fetchConfigurationWithURL:requestKey:enableExtraLogs:fallbackTimeoutDuration:](self, "_fetchConfigurationWithURL:requestKey:enableExtraLogs:fallbackTimeoutDuration:", v6, v7, v8);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCFallbackOperation *)self completionQueue];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = RCDispatchQueueForQualityOfService([(RCFallbackOperation *)self qualityOfService]);
  }
  BOOL v8 = v7;

  int v9 = [(RCFallbackOperation *)self configurationCompletionHandler];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__RCFallbackOperation_operationWillFinishWithError___block_invoke;
    v10[3] = &unk_1E5B75F80;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v8, v10);
  }
}

void __52__RCFallbackOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) configurationCompletionHandler];
  v2 = [*(id *)(a1 + 32) configurationResource];
  v3[2](v3, v2, *(void *)(a1 + 40));
}

- (void)_fetchConfigurationWithURL:(id)a3 requestKey:(id)a4 enableExtraLogs:(BOOL)a5 fallbackTimeoutDuration:(double)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = objc_alloc_init(RCURLFetchOperation);
  [(RCURLFetchOperation *)v12 setURL:v10];
  [(RCURLFetchOperation *)v12 setHTTPMethod:@"GET"];
  uint64_t v13 = [v10 absoluteString];
  [(RCURLFetchOperation *)v12 setLoggingKey:v13];

  [(RCURLFetchOperation *)v12 setURLRequestTimeoutDuration:a6];
  v14 = [(RCFallbackOperation *)self networkEventHandler];
  [(RCURLFetchOperation *)v12 setNetworkEventHandler:v14];

  v15 = [(RCFallbackOperation *)self cachedConfigurationResource];

  if (!v15) {
    goto LABEL_10;
  }
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = [(RCFallbackOperation *)self cachedConfigurationResource];
  v18 = [v17 lastModifiedFallbackString];

  v19 = [(RCFallbackOperation *)self cachedConfigurationResource];
  v20 = v19;
  if (v18)
  {
    v21 = [v19 lastModifiedFallbackString];
    v22 = @"If-Modified-Since";
LABEL_6:
    [v16 setObject:v21 forKeyedSubscript:v22];

    goto LABEL_7;
  }
  v23 = [v19 etag];

  if (v23)
  {
    v20 = [(RCFallbackOperation *)self cachedConfigurationResource];
    v21 = [v20 etag];
    v22 = @"If-None-Match";
    goto LABEL_6;
  }
LABEL_7:
  [(RCURLFetchOperation *)v12 setAdditionalRequestHTTPHeaders:v16];
  v24 = RCSharedLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(RCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v37 = v25;
    __int16 v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1A4AB3000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ sending additional headers with URL fetch operation: %@", buf, 0x16u);
  }
LABEL_10:
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke;
  v31 = &unk_1E5B75FD0;
  v32 = self;
  id v33 = v10;
  id v34 = v11;
  BOOL v35 = a5;
  id v26 = v11;
  id v27 = v10;
  [(RCURLFetchOperation *)v12 setConfigurationCompletionHandler:&v28];
  -[RCOperation associateChildOperation:](self, "associateChildOperation:", v12, v28, v29, v30, v31, v32);
  [(RCOperation *)v12 start];
}

void __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v9 || v12)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_2;
    v34[3] = &unk_1E5B75F80;
    v34[4] = *(void *)(a1 + 32);
    id v35 = v12;
    __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_2((uint64_t)v34);
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    if ([v11 statusCode] == 304)
    {
      v14 = [*(id *)(a1 + 32) cachedConfigurationResource];
      v15 = (void *)[v14 copy];
      [*(id *)(a1 + 32) setConfigurationResource:v15];

      v16 = [MEMORY[0x1E4F1C9C8] date];
      v17 = [*(id *)(a1 + 32) configurationResource];
      [v17 setLastFetchedDate:v16];

      v18 = RCSharedLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [*(id *)(a1 + 32) shortOperationDescription];
        *(_DWORD *)buf = 138543362;
        v37 = v19;
        _os_log_impl(&dword_1A4AB3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ the config has not changed since we last downloaded it (HTTP 304)", buf, 0xCu);
      }
    }
    else
    {
      v20 = [v11 allHeaderFields];
      v18 = [v20 objectForKeyedSubscript:@"ETag"];

      v21 = [v11 allHeaderFields];
      v22 = [v21 objectForKeyedSubscript:@"Last-Modified"];

      v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(unsigned __int8 *)(a1 + 56);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_24;
      v27[3] = &unk_1E5B75FA8;
      v27[4] = v23;
      v27[5] = &v28;
      [v23 _parseFallbackResponse:v9 fallbackURL:v24 requestKey:v25 enableExtraLogs:v26 maxAge:v10 etag:v18 lastModifiedString:v22 completion:v27];
    }
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v29[5]];
    _Block_object_dispose(&v28, 8);
  }
}

uint64_t __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setConfigurationResource:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_parseFallbackResponse:(id)a3 fallbackURL:(id)a4 requestKey:(id)a5 enableExtraLogs:(BOOL)a6 maxAge:(id)a7 etag:(id)a8 lastModifiedString:(id)a9 completion:(id)a10
{
  BOOL v54 = a6;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v59 = a5;
  id v56 = a7;
  id v58 = a8;
  id v57 = a9;
  v15 = (void (**)(id, RCConfigurationResource *, void))a10;
  uint64_t v16 = objc_msgSend(v14, "rc_gzipInflate");
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v14;
  }
  uint64_t v63 = 0;
  id v55 = v18;
  v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "rc_dictionaryFromData:error:");
  id v20 = 0;
  if (v20)
  {
    v21 = RCSharedLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [(RCOperation *)self shortOperationDescription];
      v23 = v22 = v19;
      *(_DWORD *)buf = 138543618;
      v65 = v23;
      __int16 v66 = 2114;
      id v67 = v20;
      _os_log_impl(&dword_1A4AB3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ parseFallbackResponse - JSON parsing failed with error: %{public}@", buf, 0x16u);

      v19 = v22;
    }
  }
  if (v19)
  {
    uint64_t v24 = objc_alloc_init(RCConfigurationResource);
    [(RCConfigurationResource *)v24 setRequestKey:v59];
    v53 = v17;
    if (v17)
    {
      [(RCConfigurationResource *)v24 setGzippedConfigurationData:v14];
    }
    else
    {
      uint64_t v25 = objc_msgSend(v14, "rc_gzipDeflate");
      [(RCConfigurationResource *)v24 setGzippedConfigurationData:v25];
    }
    uint64_t v26 = +[RCUserSegmentationConfiguration userSegmentationConfigurationWithConfigDict:v19 environment:[(RCFallbackOperation *)self environment]];
    [(RCConfigurationResource *)v24 setUserSegmentationConfiguration:v26];

    [(RCConfigurationResource *)v24 setTreatmentIDs:0];
    [(RCConfigurationResource *)v24 setSegmentSetIDs:0];
    id v27 = [(RCFallbackOperation *)self userID];
    [(RCConfigurationResource *)v24 setUserID:v27];

    uint64_t v28 = [(RCFallbackOperation *)self storefrontID];
    [(RCConfigurationResource *)v24 setStorefrontID:v28];

    uint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
    [(RCConfigurationResource *)v24 setLastFetchedDate:v29];

    [(RCConfigurationResource *)v24 setFallbackMaxAge:v56];
    uint64_t v30 = (void *)[v58 copy];
    [(RCConfigurationResource *)v24 setEtag:v30];

    v31 = (void *)[v57 copy];
    [(RCConfigurationResource *)v24 setLastModifiedFallbackString:v31];

    v32 = RCSharedLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [(RCOperation *)self shortOperationDescription];
      id v33 = [(RCConfigurationResource *)v24 lastFetchedDate];
      [(RCConfigurationResource *)v24 fallbackMaxAge];
      id v34 = v52 = v14;
      id v35 = [(RCConfigurationResource *)v24 etag];
      [(RCConfigurationResource *)v24 lastModifiedFallbackString];
      v36 = v50 = v19;
      [(RCConfigurationResource *)v24 treatmentIDs];
      v37 = v51 = v15;
      v47 = objc_msgSend(v37, "rc_description");
      [(RCConfigurationResource *)v24 segmentSetIDs];
      uint64_t v38 = v49 = self;
      uint64_t v39 = objc_msgSend(v38, "rc_description");
      *(_DWORD *)buf = 138545154;
      v65 = v48;
      __int16 v66 = 2112;
      id v67 = v59;
      __int16 v68 = 2112;
      v69 = v33;
      __int16 v70 = 2112;
      v71 = v34;
      __int16 v72 = 2112;
      v73 = v35;
      __int16 v74 = 2112;
      v75 = v36;
      __int16 v76 = 2112;
      v77 = v47;
      __int16 v78 = 2112;
      uint64_t v79 = v39;
      uint64_t v40 = (void *)v39;
      _os_log_impl(&dword_1A4AB3000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ fallback: received configuration with requestKey: %@ lastFetchedDate: %@ maxAge: %@ etag: %@ lastModified: %@ treatmentIDs: %@ segmentSetIDs: %@", buf, 0x52u);

      self = v49;
      v15 = v51;

      v19 = v50;
      id v14 = v52;
    }
    v17 = v53;
    if (v54)
    {
      v41 = self;
      v42 = v19;
      v43 = RCSharedLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = [(RCOperation *)v41 shortOperationDescription];
        v45 = v15;
        v46 = (void *)[[NSString alloc] initWithData:v55 encoding:4];
        *(_DWORD *)buf = 138543618;
        v65 = v44;
        __int16 v66 = 2112;
        id v67 = v46;
        _os_log_impl(&dword_1A4AB3000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ CloudKit JSON response: %@", buf, 0x16u);

        v15 = v45;
        v17 = v53;
      }

      v19 = v42;
    }
    v15[2](v15, v24, 0);
  }
  else
  {
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke;
    v60[3] = &unk_1E5B75FF8;
    v61 = (RCConfigurationResource *)v20;
    v62 = v15;
    __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke((uint64_t)v60);

    uint64_t v24 = v61;
  }
}

void __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "rc_parsingError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (void)setRequestKey:(id)a3
{
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (void)setFallbackURL:(id)a3
{
}

- (RCConfigurationResource)cachedConfigurationResource
{
  return self->_cachedConfigurationResource;
}

- (void)setCachedConfigurationResource:(id)a3
{
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (BOOL)enableExtraLogs
{
  return self->_enableExtraLogs;
}

- (void)setEnableExtraLogs:(BOOL)a3
{
  self->_enableExtraLogs = a3;
}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (void)setConfigurationCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (double)fallbackTimeoutDuration
{
  return self->_fallbackTimeoutDuration;
}

- (void)setFallbackTimeoutDuration:(double)a3
{
  self->_fallbackTimeoutDuration = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (void)setNetworkEventHandler:(id)a3
{
}

- (RCConfigurationResource)configurationResource
{
  return self->_configurationResource;
}

- (void)setConfigurationResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationResource, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedConfigurationResource, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);

  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (void)validateOperation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"the fallback operation must have valid requestKey"];
  int v1 = 136315906;
  v2 = "-[RCFallbackOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCFallbackOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end