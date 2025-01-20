@interface RadioGetGenreTreeNodesRequest
+ (id)cacheKeyForGenreWithNodeID:(unint64_t)a3;
+ (id)fallbackRequestPath;
+ (id)requestBagKey;
+ (id)responseContentKey;
- (RadioGetGenreTreeNodesRequest)init;
- (RadioGetGenreTreeNodesRequest)initWithParentNodeID:(unint64_t)a3;
- (SSMetricsConfiguration)metricsConfiguration;
- (SSMetricsPageEvent)metricsPageEvent;
- (id)_genreTreeByApplyingResponse:(id)a3;
- (void)startWithCachedCompletionHandler:(id)a3 networkCompletionHandler:(id)a4;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RadioGetGenreTreeNodesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (id)_genreTreeByApplyingResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(a3, "radio_decompressedBodyData");
  if ([v4 length])
  {
    id v14 = 0;
    id v15 = 0;
    v5 = [v4 propertyListForRadioResponseReturningError:&v15 unparsedResponseDictionary:&v14];
    id v6 = v15;
    id v7 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(id)objc_opt_class() responseContentKey];
      v9 = [v5 objectForKey:v8];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }
      v10 = (SSMetricsConfiguration *)[objc_alloc(MEMORY[0x263F7B230]) initWithStorePlatformData:v7];
      metricsConfiguration = self->_metricsConfiguration;
      self->_metricsConfiguration = v10;
      uint64_t v12 = 1;
    }
    else
    {
      metricsConfiguration = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(metricsConfiguration, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v6;
        __int16 v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_21B56B000, metricsConfiguration, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize genre tree response (%@), data: %@", buf, 0x16u);
      }
      v9 = 0;
      uint64_t v12 = 3;
    }

    [(RadioRequest *)self setStatus:v12];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RadioRequest *)self requestContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke;
  v8[3] = &unk_2643AA3A8;
  id v9 = v5;
  id v10 = v4;
  v8[4] = self;
  id v6 = v5;
  id v7 = v4;
  [(RadioRequest *)self _loadRadioStoreBagWithCompletionHandler:v8];
}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v48[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 radioConfigurationDictionary];
  v5 = [v3 baseURL];
  id v6 = [(id)objc_opt_class() requestBagKey];
  id v7 = [v4 objectForKey:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || v5)
  {
    v47 = @"parent-id";
    v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 72)];
    v48[0] = v11;
    id v10 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];

    uint64_t v12 = [v4 objectForKey:@"max-protocol-version"];
    int v13 = [v12 intValue];

    if (v7 && v13 >= 4)
    {
      id v14 = [NSString queryStringForRadioRequestParameters:v10 protocolVersion:4 error:0];
      id v15 = NSURL;
      v16 = [v7 stringByAppendingString:v14];
      id v17 = [v15 URLWithString:v16];

      __int16 v18 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [v17 absoluteString];
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_21B56B000, v18, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Request URL: %@", buf, 0xCu);
      }
      uint64_t v20 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v17];
      [v20 setHTTPMethod:@"GET"];
    }
    else
    {
      v21 = [(id)objc_opt_class() fallbackRequestPath];
      id v14 = [v5 URLByAppendingPathComponent:v21];

      v22 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [v14 absoluteString];
        *(_DWORD *)buf = 138412290;
        v46 = v23;
        _os_log_impl(&dword_21B56B000, v22, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Request URL: %@", buf, 0xCu);
      }
      uint64_t v20 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v14];
      id v17 = objc_msgSend(MEMORY[0x263EFF8F8], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v10, objc_msgSend(*(id *)(a1 + 32), "isAsynchronousBackgroundRequest"), 0);
      [v20 setHTTPBody:v17];
    }

    v24 = [(id)objc_opt_class() defaultURLCache];
    v25 = [v24 cachedConnectionResponseForRequestProperties:v20];

    if (v25
      && (objc_msgSend(v25, "ssv_isExpiredResponse") & 1) == 0
      && ([*(id *)(a1 + 32) _genreTreeByApplyingResponse:v25],
          (uint64_t v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = (void *)v26;
      v28 = [v25 metricsPageEvent];
      uint64_t v29 = [v28 mutableCopy];
      uint64_t v30 = *(void *)(a1 + 32);
      v31 = *(void **)(v30 + 96);
      *(void *)(v30 + 96) = v29;

      [*(id *)(*(void *)(a1 + 32) + 96) setCachedResponse:1];
      [*(id *)(a1 + 32) setCachedResponse:1];
      uint64_t v32 = *(void *)(a1 + 48);
      if (v32) {
        (*(void (**)(uint64_t, void *, void))(v32 + 16))(v32, v27, 0);
      }
      v33 = [MEMORY[0x263F08A00] defaultCenter];
      [v33 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];
    }
    else
    {
      v34 = +[RadioNetworkObserver sharedNetworkObserver];
      [v34 beginUsingNetwork];

      uint64_t v35 = [MEMORY[0x263F7B360] newRadioRequestWithRequestContext:*(void *)(a1 + 40) requestProperties:v20 storeBag:v3];
      uint64_t v36 = *(void *)(a1 + 32);
      v37 = *(void **)(v36 + 80);
      *(void *)(v36 + 80) = v35;

      uint64_t v38 = *(void *)(a1 + 32);
      v39 = *(void **)(v38 + 80);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_20;
      v40[3] = &unk_2643AA380;
      v40[4] = v38;
      id v41 = v20;
      id v42 = *(id *)(a1 + 48);
      [v39 startWithConnectionResponseBlock:v40];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setStatus:5];
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_2643AA510;
    id v9 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v44 = v9;
    dispatch_async(v8, block);

    id v10 = v44;
  }
}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];
}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RadioNetworkObserver sharedNetworkObserver];
  [v7 endUsingNetwork];

  if (v5)
  {
    uint64_t v8 = [v5 statusCode];
  }
  else
  {
    id v9 = [v6 userInfo];
    id v10 = [v9 objectForKey:*MEMORY[0x263F7B760]];
    uint64_t v8 = [v10 integerValue];
  }
  v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = v8;
    _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    uint64_t v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = (uint64_t)v6;
      _os_log_impl(&dword_21B56B000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get genre tree (%@)", buf, 0xCu);
    }

    if (!v6)
    {
      int v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F7B758];
      uint64_t v33 = *MEMORY[0x263F7B760];
      id v15 = [NSNumber numberWithInteger:v8];
      v34 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v6 = [v13 errorWithDomain:v14 code:109 userInfo:v16];
    }
    if (v8 <= 399)
    {
      uint64_t v17 = 1;
      if (v8 == 200 || v8 == 204) {
        goto LABEL_22;
      }
    }
    else
    {
      switch(v8)
      {
        case 404:
          goto LABEL_15;
        case 401:
          uint64_t v17 = 2;
          goto LABEL_22;
        case 400:
LABEL_15:
          uint64_t v17 = 4;
LABEL_22:
          [*(id *)(a1 + 32) setStatus:v17];
          __int16 v18 = 0;
          goto LABEL_23;
      }
    }
    uint64_t v17 = 3;
    goto LABEL_22;
  }
  __int16 v18 = [*(id *)(a1 + 32) _genreTreeByApplyingResponse:v5];
  if (v18)
  {
    v19 = [(id)objc_opt_class() defaultURLCache];
    [v19 storeConnectionResponse:v5 forRequestProperties:*(void *)(a1 + 40)];
  }
LABEL_23:
  uint64_t v20 = [v5 metricsPageEvent];
  uint64_t v21 = [v20 mutableCopy];
  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 96);
  *(void *)(v22 + 96) = v21;

  v24 = dispatch_get_global_queue(0, 0);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_22;
  v28[3] = &unk_2643AA358;
  id v25 = *(id *)(a1 + 48);
  id v29 = v18;
  id v30 = v6;
  uint64_t v31 = *(void *)(a1 + 32);
  id v32 = v25;
  id v26 = v6;
  id v27 = v18;
  dispatch_async(v24, v28);
}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_22(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:a1[6]];
}

- (void)startWithCachedCompletionHandler:(id)a3 networkCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__RadioGetGenreTreeNodesRequest_startWithCachedCompletionHandler_networkCompletionHandler___block_invoke;
  v10[3] = &unk_2643AA2E0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RadioGetGenreTreeNodesRequest *)self startWithCompletionHandler:v10];
}

void __91__RadioGetGenreTreeNodesRequest_startWithCachedCompletionHandler_networkCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (RadioGetGenreTreeNodesRequest)initWithParentNodeID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RadioGetGenreTreeNodesRequest;
  result = [(RadioRequest *)&v5 init];
  if (result) {
    result->_parentNodeID = a3;
  }
  return result;
}

- (RadioGetGenreTreeNodesRequest)init
{
  return [(RadioGetGenreTreeNodesRequest *)self initWithParentNodeID:0];
}

+ (id)responseContentKey
{
  return @"genre-tree";
}

+ (id)requestBagKey
{
  return @"getGenreTreeNodes-url";
}

+ (id)fallbackRequestPath
{
  return @"getGenreTreeNodes";
}

+ (id)cacheKeyForGenreWithNodeID:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"getGenreTreeNodes-%llu", a3);
}

@end