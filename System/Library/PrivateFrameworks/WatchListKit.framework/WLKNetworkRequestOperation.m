@interface WLKNetworkRequestOperation
- (AMSURLRequestEncoder)encoder;
- (AMSURLSession)session;
- (NSData)data;
- (NSDate)startDate;
- (NSError)error;
- (NSHTTPURLResponse)httpResponse;
- (NSNumber)DSID;
- (NSString)identifier;
- (NSURLRequest)request;
- (NSURLSessionDataTask)task;
- (WLKMetricsActivity)nwactivity;
- (WLKNetworkRequestOperation)init;
- (WLKNetworkRequestOperation)initWithURLRequest:(id)a3 options:(int64_t)a4;
- (WLKNetworkRequestOperation)initWithURLRequest:(id)a3 options:(int64_t)a4 activity:(id)a5;
- (id)authenticationDelegate;
- (id)httpHeaderMaxAge;
- (id)httpHeaderResponseDate;
- (id)originalExpirationDate;
- (id)shortDescription;
- (int64_t)_statusCodeForAMSResult:(id)a3 error:(id)a4;
- (int64_t)options;
- (int64_t)resourceFetchType;
- (int64_t)responseStatusCode;
- (unint64_t)signpostIdentifier;
- (void)_finishExecutionIfPossibleWithError:(id)a3;
- (void)_startNetworkRequest;
- (void)cancel;
- (void)configureSession;
- (void)executionDidBegin;
- (void)finishExecutionIfPossible;
- (void)handleResult:(id)a3 error:(id)a4;
- (void)prepareAndStartNetworkRequest;
- (void)setAuthenticationDelegate:(id)a3;
- (void)setDSID:(id)a3;
- (void)setData:(id)a3;
- (void)setEncoder:(id)a3;
- (void)setError:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNwactivity:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResourceFetchType:(int64_t)a3;
- (void)setResponseStatusCode:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostIdentifier:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation WLKNetworkRequestOperation

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

uint64_t __49__WLKNetworkRequestOperation_handleResult_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) processResponse];
  v2 = *(void **)(a1 + 32);

  return [v2 finishExecutionIfPossible];
}

- (NSData)data
{
  return self->_data;
}

- (WLKNetworkRequestOperation)initWithURLRequest:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKNetworkRequestOperation;
  v7 = [(WLKAsyncOperation *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (NSURLRequest *)v9;

    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    v14 = WLKNetworkSignpostLogObject();
    v8->_signpostIdentifier = os_signpost_id_make_with_pointer(v14, v8);
  }
  return v8;
}

- (void)setDSID:(id)a3
{
}

- (void)finishExecutionIfPossible
{
  v3 = WLKNetworkSignpostLogObject();
  unint64_t v4 = [(WLKNetworkRequestOperation *)self signpostIdentifier];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_END, v5, "NetworkRequest.Total", "", buf, 2u);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)WLKNetworkRequestOperation;
  [(WLKAsyncOperation *)&v6 finishExecutionIfPossible];
}

void __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [WeakRetained startDate];
    [v8 timeIntervalSinceDate:v9];
    uint64_t v11 = v10;

    uint64_t v12 = [a1[4] _statusCodeForAMSResult:v5 error:v6];
    if (v6)
    {
      v29 = [v6 description];
    }
    else
    {
      v29 = &stru_1F13BCF18;
    }
    v13 = [v5 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 valueForHTTPHeaderField:@"x-apple-jingle-correlation-key"];
      objc_msgSend(v5, "taskMetrics", objc_claimAutoreleasedReturnValue());
    }
    else
    {
      objc_msgSend(v5, "taskMetrics", 0);
    v14 = };
    v15 = [v14 transactionMetrics];
    objc_super v16 = [v15 lastObject];

    [WeakRetained setResourceFetchType:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(WeakRetained, "setResourceFetchType:", objc_msgSend(v16, "resourceFetchType"));
    }
    v17 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [WeakRetained identifier];
      v19 = [a1[5] HTTPMethod];
      v20 = [a1[5] URL];
      uint64_t v21 = [v20 relativePath];
      uint64_t v22 = v12;
      v23 = (void *)v21;
      *(_DWORD *)buf = 134219522;
      uint64_t v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2112;
      v37 = v28;
      __int16 v38 = 2112;
      v39 = v19;
      __int16 v40 = 2112;
      uint64_t v41 = v21;
      __int16 v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request status: %lu elapsed time: %.5f id: %@ ck:%@ url: %@ %@ %@", buf, 0x48u);
    }
    v24 = WLKNetworkSignpostLogObject();
    uint64_t v25 = [WeakRetained signpostIdentifier];
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v24, OS_SIGNPOST_INTERVAL_END, v26, "NetworkRequest.URLRequest", "", buf, 2u);
      }
    }

    [WeakRetained setTask:0];
    v27 = [WeakRetained nwactivity];
    [v27 finish:v6];

    [WeakRetained handleResult:v5 error:v6];
  }
}

- (void)setResourceFetchType:(int64_t)a3
{
  self->_resourceFetchType = a3;
}

void __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setTask:v6];
    id v5 = [v4 task];
    [v5 resume];
  }
}

- (void)setTask:(id)a3
{
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (WLKMetricsActivity)nwactivity
{
  return self->_nwactivity;
}

- (void)handleResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 response];
  [(WLKNetworkRequestOperation *)self setHttpResponse:v8];

  uint64_t v9 = [v7 data];
  [(WLKNetworkRequestOperation *)self setData:v9];

  [(WLKNetworkRequestOperation *)self setError:v6];
  int64_t v10 = [(WLKNetworkRequestOperation *)self _statusCodeForAMSResult:v7 error:v6];

  [(WLKNetworkRequestOperation *)self setResponseStatusCode:v10];
  uint64_t v11 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WLKNetworkRequestOperation_handleResult_error___block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_async(v11, block);
}

- (int64_t)_statusCodeForAMSResult:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [a3 response];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 statusCode];
  }
  else {
    uint64_t v8 = WLKHTTPStatusCodeForAMSError(v5);
  }
  int64_t v9 = v8;

  return v9;
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (void)setHttpResponse:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void)_startNetworkRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = WLKIgnoreHTTPCacheOverride();
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) != 0 || (int64_t options = self->_options, (options & 8) != 0))
  {
    id v6 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request will ignore HTTP cache", buf, 2u);
    }

    id v7 = (void *)[(NSURLRequest *)self->_request mutableCopy];
    [v7 setCachePolicy:1];
    uint64_t v8 = (void *)[v7 copy];
    [(WLKNetworkRequestOperation *)self setRequest:v8];

    int64_t v9 = [(WLKNetworkRequestOperation *)self session];
    int64_t v10 = [v9 configuration];
    uint64_t v11 = [v10 URLCache];
    [v11 removeCachedResponseForRequest:self->_request];

    int64_t options = self->_options;
  }
  if ((options & 4) != 0)
  {
    uint64_t v12 = (void *)[(NSURLRequest *)self->_request mutableCopy];
    id v33 = 0;
    BOOL v13 = +[WLKMescal signNetworkRequest:v12 error:&v33];
    id v14 = v33;
    if (v13)
    {
      v15 = (void *)[v12 copy];
      [(WLKNetworkRequestOperation *)self setRequest:v15];
    }
    else
    {
      [(WLKNetworkRequestOperation *)self _finishExecutionIfPossibleWithError:v14];
    }
  }
  objc_super v16 = [(AMSURLRequestEncoder *)self->_encoder requestByEncodingRequest:self->_request parameters:0];
  id v32 = 0;
  v17 = [v16 resultWithError:&v32];
  id v18 = v32;
  if (v17)
  {
    if ([(WLKAsyncOperation *)self isCancelled])
    {
      v19 = WLKCancelledError();
      [(WLKNetworkRequestOperation *)self _finishExecutionIfPossibleWithError:v19];
    }
    else
    {
      objc_initWeak(&location, self);
      session = self->_session;
      uint64_t v21 = [(WLKMetricsActivity *)self->_nwactivity activity];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke;
      v29[3] = &unk_1E620A730;
      objc_copyWeak(&v30, &location);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke_2;
      v26[3] = &unk_1E620A758;
      objc_copyWeak(&v28, &location);
      v26[4] = self;
      id v27 = v17;
      [(AMSURLSession *)session createDataTaskWithRequest:v27 activity:v21 dataTaskCreationCompletionHandler:v29 requestCompletionHandler:v26];

      uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      [(WLKNetworkRequestOperation *)self setStartDate:v22];

      v23 = WLKNetworkSignpostLogObject();
      os_signpost_id_t v24 = [(WLKNetworkRequestOperation *)self signpostIdentifier];
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        uint64_t v25 = [(NSURLRequest *)self->_request URL];
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "NetworkRequest.URLRequest", "%@", buf, 0xCu);
      }
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(WLKNetworkRequestOperation *)self _finishExecutionIfPossibleWithError:v18];
  }
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (void)setStartDate:(id)a3
{
}

- (void)executionDidBegin
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(WLKNetworkRequestOperation *)self identifier];
    int v8 = 138412290;
    int64_t v9 = v4;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request start: %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = WLKNetworkSignpostLogObject();
  unint64_t v6 = [(WLKNetworkRequestOperation *)self signpostIdentifier];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NetworkRequest.Total", "", (uint8_t *)&v8, 2u);
    }
  }

  if (self->_request)
  {
    [(WLKNetworkRequestOperation *)self configureSession];
    [(WLKNetworkRequestOperation *)self _startNetworkRequest];
  }
  else
  {
    [(WLKNetworkRequestOperation *)self prepareAndStartNetworkRequest];
  }
}

- (void)prepareAndStartNetworkRequest
{
  [(WLKNetworkRequestOperation *)self configureSession];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__WLKNetworkRequestOperation_prepareAndStartNetworkRequest__block_invoke;
  v3[3] = &unk_1E620A6E0;
  objc_copyWeak(&v4, &location);
  [(WLKNetworkRequestOperation *)self prepareURLRequest:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)configureSession
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F4DE68]);
  id v4 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  id v5 = (void *)[v3 initWithBag:v4];

  [v5 setLogUUID:self->_identifier];
  if (self->_options) {
    [v5 setDialogOptions:1];
  }
  [v5 setIncludeClientVersions:0];
  int64_t options = self->_options;
  if ((options & 0x10) == 0)
  {
    if (+[WLKNetworkRequestUtilities isGDPRAccepted]) {
      goto LABEL_7;
    }
    int64_t options = self->_options;
  }
  if ((options & 0x200000) != 0)
  {
LABEL_7:
    os_signpost_id_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    int v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

    DSID = self->_DSID;
    if (DSID)
    {
      uint64_t v10 = objc_msgSend(v8, "ams_DSID");
      uint64_t v11 = DSID;
      uint64_t v12 = v10;
      if (v11 != v12)
      {
        BOOL v13 = v12;
        if (v12)
        {
          char v14 = [(NSNumber *)v11 isEqual:v12];

          if (v14) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        v15 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        uint64_t v16 = objc_msgSend(v15, "ams_iTunesAccountWithDSID:", self->_DSID);

        v17 = WLKNetworkingLogObject();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            v19 = self->_DSID;
            LODWORD(v33) = 138412290;
            *(void *)((char *)&v33 + 4) = v19;
            v20 = "WLKNetworkRequestOperation - Found account for DSID override: %@";
LABEL_19:
            _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v33, 0xCu);
          }
        }
        else if (v18)
        {
          uint64_t v21 = self->_DSID;
          LODWORD(v33) = 138412290;
          *(void *)((char *)&v33 + 4) = v21;
          v20 = "WLKNetworkRequestOperation - No account found for DSID override. Proceeding with non-personalized request %@";
          goto LABEL_19;
        }

        int v8 = (void *)v16;
        goto LABEL_21;
      }
    }
LABEL_21:
    objc_msgSend(v5, "setAccount:", v8, v33);
  }
  [(WLKNetworkRequestOperation *)self setEncoder:v5];
  uint64_t v22 = +[WLKLaunchConfiguration sharedInstance];
  int v23 = [v22 useSharedURLSession];

  if (!v23) {
    goto LABEL_42;
  }
  os_signpost_id_t v24 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [(WLKNetworkRequestOperation *)self shortDescription];
    LODWORD(v33) = 138412290;
    *(void *)((char *)&v33 + 4) = v25;
    _os_log_impl(&dword_1BA2E8000, v24, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use shared URLSession for request: %@", (uint8_t *)&v33, 0xCu);
  }
  os_signpost_id_t v26 = +[WLKURLSessionManager sharedInstance];
  id v27 = [v26 urlSession];

  if (!v27)
  {
LABEL_42:
    if ((self->_options & 0x100000) == 0) {
      goto LABEL_32;
    }
    id v28 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(WLKNetworkRequestOperation *)self shortDescription];
      LODWORD(v33) = 138412290;
      *(void *)((char *)&v33 + 4) = v29;
      _os_log_impl(&dword_1BA2E8000, v28, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use sharedCacheAMSURLSession for request: %@", (uint8_t *)&v33, 0xCu);
    }
    if (configureSession_sharedCacheAMSURLSessionOnceToken != -1) {
      dispatch_once(&configureSession_sharedCacheAMSURLSessionOnceToken, &__block_literal_global_10);
    }
    id v27 = (id)configureSession_sharedCacheAMSURLSession;
    if (!v27)
    {
LABEL_32:
      id v30 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = [(WLKNetworkRequestOperation *)self shortDescription];
        LODWORD(v33) = 138412290;
        *(void *)((char *)&v33 + 4) = v31;
        _os_log_impl(&dword_1BA2E8000, v30, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use default AMSURLSession for request: %@", (uint8_t *)&v33, 0xCu);
      }
      if (configureSession_sharedAMSURLSessionOnceToken != -1) {
        dispatch_once(&configureSession_sharedAMSURLSessionOnceToken, &__block_literal_global_23);
      }
      id v27 = (id)configureSession_sharedAMSURLSession;
    }
  }
  if ((self->_options & 1) == 0)
  {
    id v32 = [(WLKNetworkRequestOperation *)self authenticationDelegate];
    [v27 setDelegate:v32];
  }
  [(WLKNetworkRequestOperation *)self setSession:v27];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSession:(id)a3
{
}

- (void)setEncoder:(id)a3
{
}

- (id)authenticationDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_authenticationDelegate);

  return WeakRetained;
}

- (AMSURLSession)session
{
  return self->_session;
}

void __59__WLKNetworkRequestOperation_prepareAndStartNetworkRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_signpost_id_t v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRequest:v8];
    if (v8)
    {
      [v7 _startNetworkRequest];
    }
    else
    {
      if (!v5)
      {
        WLKError(0, 0, @"WLKNetworkRequestOperation: failed to prepare request. No error was provided.");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v7 setError:v5];
      [v7 finishExecutionIfPossible];
    }
  }
}

- (void)setRequest:(id)a3
{
}

- (int64_t)resourceFetchType
{
  return self->_resourceFetchType;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setNwactivity:(id)a3
{
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_nwactivity, 0);
  objc_destroyWeak(&self->_authenticationDelegate);
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)httpHeaderMaxAge
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(WLKNetworkRequestOperation *)self httpResponse];
  id v3 = [v2 valueForHTTPHeaderField:@"Cache-Control"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 componentsSeparatedByString:@","];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          int64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsString:", @"max-age", (void)v17))
          {
            uint64_t v10 = [v9 componentsSeparatedByString:@"="];
            if ([v10 count] == 2)
            {
              uint64_t v12 = [v10 objectAtIndex:1];
              BOOL v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              char v14 = [v12 stringByTrimmingCharactersInSet:v13];

              v15 = NSNumber;
              [v14 doubleValue];
              uint64_t v11 = objc_msgSend(v15, "numberWithDouble:");

              goto LABEL_15;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_15:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)httpHeaderResponseDate
{
  if (httpHeaderResponseDate_onceToken != -1) {
    dispatch_once(&httpHeaderResponseDate_onceToken, &__block_literal_global_7);
  }
  id v3 = [(WLKNetworkRequestOperation *)self httpResponse];
  id v4 = [v3 valueForHTTPHeaderField:@"Date"];

  uint64_t v5 = [(id)httpHeaderResponseDate_httpDateFormatter dateFromString:v4];

  return v5;
}

uint64_t __69__WLKNetworkRequestOperation_ResponseHeaders__httpHeaderResponseDate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)httpHeaderResponseDate_httpDateFormatter;
  httpHeaderResponseDate_httpDateFormatter = (uint64_t)v0;

  v2 = (void *)httpHeaderResponseDate_httpDateFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)httpHeaderResponseDate_httpDateFormatter;

  return [v4 setDateFormat:@"EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz"];
}

- (id)originalExpirationDate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(WLKNetworkRequestOperation *)self httpHeaderMaxAge];
  id v4 = [(WLKNetworkRequestOperation *)self httpHeaderResponseDate];
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    uint64_t v6 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v3, "integerValue"));
  }
  uint64_t v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    char v14 = v6;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "MaxAge: %@, Response Date: %@, Expiration:%@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

- (WLKNetworkRequestOperation)init
{
  return 0;
}

- (WLKNetworkRequestOperation)initWithURLRequest:(id)a3 options:(int64_t)a4 activity:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WLKNetworkRequestOperation;
  uint64_t v10 = [(WLKAsyncOperation *)&v18 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nwactivity, a5);
    v11->_int64_t options = a4;
    uint64_t v12 = [v8 copy];
    request = v11->_request;
    v11->_request = (NSURLRequest *)v12;

    char v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [v14 UUIDString];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v15;
  }
  return v11;
}

- (id)shortDescription
{
  uint64_t v3 = [(WLKNetworkRequestOperation *)self identifier];
  id v4 = (void *)v3;
  uint64_t v5 = &stru_1F13BCF18;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  if ((unint64_t)[(__CFString *)v6 length] >= 7)
  {
    uint64_t v7 = [(WLKNetworkRequestOperation *)self identifier];
    uint64_t v8 = [v7 substringToIndex:7];

    uint64_t v6 = (__CFString *)v8;
  }
  id v9 = NSString;
  uint64_t v10 = [(NSURLRequest *)self->_request URL];
  __int16 v11 = [v10 path];
  uint64_t v12 = [v9 stringWithFormat:@"%@ %@", v6, v11];

  return v12;
}

void __46__WLKNetworkRequestOperation_configureSession__block_invoke()
{
  id v4 = +[WLKNetworkRequestUtilities _sharedCacheSessionConfiguration];
  if (v4)
  {
    uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v4];
    v1 = (void *)configureSession_sharedCacheAMSURLSession;
    configureSession_sharedCacheAMSURLSession = v0;

    v2 = (void *)configureSession_sharedCacheAMSURLSession;
    uint64_t v3 = objc_alloc_init(WLKURLResponseDecoder);
    [v2 setResponseDecoder:v3];
  }
}

void __46__WLKNetworkRequestOperation_configureSession__block_invoke_21()
{
  id v4 = +[WLKNetworkRequestUtilities defaultSessionConfiguration];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v4];
  v1 = (void *)configureSession_sharedAMSURLSession;
  configureSession_sharedAMSURLSession = v0;

  v2 = (void *)configureSession_sharedAMSURLSession;
  uint64_t v3 = objc_alloc_init(WLKURLResponseDecoder);
  [v2 setResponseDecoder:v3];
}

- (void)_finishExecutionIfPossibleWithError:(id)a3
{
  [(WLKNetworkRequestOperation *)self setError:a3];

  [(WLKNetworkRequestOperation *)self finishExecutionIfPossible];
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WLKNetworkRequestOperation *)self identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request cancelled: %@", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)WLKNetworkRequestOperation;
  [(WLKAsyncOperation *)&v6 cancel];
  uint64_t v5 = [(WLKNetworkRequestOperation *)self task];
  [v5 cancel];
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (int64_t)options
{
  return self->_options;
}

- (AMSURLRequestEncoder)encoder
{
  return self->_encoder;
}

- (void)setSignpostIdentifier:(unint64_t)a3
{
  self->_signpostIdentifier = a3;
}

@end