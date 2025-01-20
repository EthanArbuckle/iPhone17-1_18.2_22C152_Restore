@interface RadioRecentStationsRequest
- (BOOL)shouldGroupResponses;
- (RadioRecentStationsRequest)initWithCurrentStation:(id)a3;
- (RadioRecentStationsRequest)initWithCurrentStationStringID:(id)a3;
- (id)_newRecentStationsURLRequestPropertiesWithBaseURL:(id)a3;
- (id)_recentStationsResponseWithConnectionResponse:(id)a3 returningError:(id *)a4;
- (unint64_t)stationCount;
- (void)_configureRequestPropertiesForCaching:(id)a3 returningCacheKey:(id *)a4;
- (void)cancel;
- (void)getCachedRecentStationsResponseWithCompletionHandler:(id)a3;
- (void)setShouldGroupResponses:(BOOL)a3;
- (void)setStationCount:(unint64_t)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RadioRecentStationsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStationStringID, 0);
  objc_storeStrong((id *)&self->_currentStation, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setShouldGroupResponses:(BOOL)a3
{
  self->_shouldGroupResponses = a3;
}

- (RadioRecentStationsRequest)initWithCurrentStation:(id)a3
{
  id v5 = a3;
  v6 = [(RadioRequest *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_currentStation, a3);
  }

  return v7;
}

- (void)getCachedRecentStationsResponseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__RadioRecentStationsRequest_getCachedRecentStationsResponseWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643AA288;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RadioRequest *)self _loadRadioStoreBagWithCompletionHandler:v6];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)RadioRecentStationsRequest;
  [(RadioRequest *)&v3 cancel];
  [(SSURLConnectionRequest *)self->_request cancel];
}

void __83__RadioRecentStationsRequest_getCachedRecentStationsResponseWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 baseURL];
  if (v3)
  {
    id v4 = (void *)[*(id *)(a1 + 32) _newRecentStationsURLRequestPropertiesWithBaseURL:v3];
    id v5 = [(id)objc_opt_class() defaultURLCache];
    v6 = [v5 cachedConnectionResponseForRequestProperties:v4];

    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) _recentStationsResponseWithConnectionResponse:v6 returningError:0];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (id)_newRecentStationsURLRequestPropertiesWithBaseURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if (self->_stationCount)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v5 setObject:v6 forKey:@"count"];
  }
  if (!self->_shouldGroupResponses)
  {
    uint64_t v7 = [NSNumber numberWithBool:1];
    [v5 setObject:v7 forKey:@"flatten"];
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  v9 = [(RadioStation *)self->_currentStation stationStringID];
  if (v9 || (v9 = self->_currentStationStringID) != 0) {
    [v8 setObject:v9 forKey:@"radio-station-id"];
  }
  int64_t v10 = [(RadioStation *)self->_currentStation stationID];
  if (v10)
  {
    v11 = [NSNumber numberWithLongLong:v10];
    [v8 setObject:v11 forKey:@"station-id"];
  }
  v12 = [(RadioStation *)self->_currentStation stationHash];
  if (v12) {
    [v8 setObject:v12 forKey:@"station-hash"];
  }
  if ([v8 count]) {
    [v5 setObject:v8 forKey:@"station-info"];
  }
  v13 = [v4 URLByAppendingPathComponent:@"recentStations"];
  v14 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v13];
  v15 = objc_msgSend(MEMORY[0x263EFF8F8], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v5, -[RadioRequest isAsynchronousBackgroundRequest](self, "isAsynchronousBackgroundRequest"), 0);
  [v14 setHTTPBody:v15];

  return v14;
}

- (void)setStationCount:(unint64_t)a3
{
  self->_stationCount = a3;
}

- (unint64_t)stationCount
{
  return self->_stationCount;
}

- (BOOL)shouldGroupResponses
{
  return self->_shouldGroupResponses;
}

- (id)_recentStationsResponseWithConnectionResponse:(id)a3 returningError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(a3, "radio_decompressedBodyData");
  if (![v6 length])
  {
    id v11 = 0;
    int64_t v10 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v16 = 0;
  id v17 = 0;
  uint64_t v7 = [v6 propertyListForRadioResponseReturningError:&v17 unparsedResponseDictionary:&v16];
  id v8 = v17;
  id v9 = v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v10 = [[RadioRecentStationsResponse alloc] initWithResponseDictionary:v7];
    id v11 = 0;
    uint64_t v12 = 1;
  }
  else
  {
    id v11 = v8;
    v13 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize get stations response (%@)", buf, 0xCu);
    }

    int64_t v10 = 0;
    uint64_t v12 = 3;
  }
  [(RadioRequest *)self setStatus:v12];

  if (a4) {
LABEL_10:
  }
    *a4 = v11;
LABEL_11:
  v14 = v10;

  return v14;
}

- (void)_configureRequestPropertiesForCaching:(id)a3 returningCacheKey:(id *)a4
{
  id v8 = a3;
  [v8 setHTTPMethod:@"GET"];
  if (a4)
  {
    id v5 = [v8 HTTPBody];
    [v5 bytes];
    [v5 length];
    ISMD5StringForBytes();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v6;
    if (!v6) {
      v6 = &stru_26CB5A330;
    }
    *a4 = v6;
  }
  [v8 setHTTPBody:0];
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RadioRequest *)self requestContext];
  v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke;
  block[3] = &unk_2643AA498;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_2643AA3A8;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _loadRadioStoreBagWithCompletionHandler:v3];
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 baseURL];
  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 setStatus:5];
    v29 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_3;
    block[3] = &unk_2643AA510;
    id v30 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v44 = v30;
    dispatch_async(v29, block);

    v6 = v44;
    goto LABEL_10;
  }
  v6 = (void *)[v5 _newRecentStationsURLRequestPropertiesWithBaseURL:v4];
  id v7 = (void *)[MEMORY[0x263F7B360] newRadioRequestWithRequestContext:*(void *)(a1 + 40) requestProperties:v6 storeBag:v3];
  id v8 = [v7 requestProperties];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = *(void **)(a1 + 32);
  id v42 = 0;
  [v10 _configureRequestPropertiesForCaching:v9 returningCacheKey:&v42];
  id v11 = v42;
  uint64_t v12 = [(id)objc_opt_class() defaultURLCache];
  id v41 = 0;
  v13 = [v12 cachedConnectionResponseForRequestProperties:v9 cachedResponse:&v41];
  id v35 = v41;

  if (v13)
  {
    if ((objc_msgSend(v13, "ssv_isExpiredResponse") & 1) == 0)
    {
      v14 = [v35 userInfo];
      [v14 objectForKey:@"com.apple.Radio.RadioRecentStationsRequest.bodyMD5"];
      v34 = v13;
      v15 = v4;
      id v16 = v3;
      id v17 = v7;
      v18 = v6;
      v20 = id v19 = v11;
      int v21 = [v20 isEqual:v19];

      id v11 = v19;
      v6 = v18;
      id v7 = v17;
      id v3 = v16;
      id v4 = v15;
      v13 = v34;

      if (v21)
      {
        v22 = *(void **)(a1 + 32);
        id v40 = 0;
        v23 = [v22 _recentStationsResponseWithConnectionResponse:v34 returningError:&v40];
        id v24 = v40;
        if (!v24)
        {
          [*(id *)(a1 + 32) setCachedResponse:1];
          uint64_t v31 = *(void *)(a1 + 48);
          if (v31) {
            (*(void (**)(uint64_t, void *, void))(v31 + 16))(v31, v23, 0);
          }
          [MEMORY[0x263F08A00] defaultCenter];
          v33 = v32 = v23;
          [v33 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];

          goto LABEL_8;
        }
        v25 = v24;
      }
    }
  }
  v26 = +[RadioNetworkObserver sharedNetworkObserver];
  [v26 beginUsingNetwork];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v7);
  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(void **)(v27 + 72);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_4;
  v36[3] = &unk_2643AA2B8;
  v36[4] = v27;
  id v37 = v9;
  id v38 = v11;
  id v39 = *(id *)(a1 + 48);
  [v28 startWithConnectionResponseBlock:v36];

LABEL_8:
LABEL_10:
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"RadioRequestErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
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
  id v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v8;
    _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioRecentStationsRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    uint64_t v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v6;
      _os_log_impl(&dword_21B56B000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get recent stations (%@)", buf, 0xCu);
    }

    id v13 = v6;
    if (!v6)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F7B758];
      uint64_t v37 = *MEMORY[0x263F7B760];
      id v16 = [NSNumber numberWithInteger:v8];
      id v38 = v16;
      id v17 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v13 = [v14 errorWithDomain:v15 code:109 userInfo:v17];
    }
    if (v8 <= 399)
    {
      uint64_t v18 = 1;
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
          uint64_t v18 = 2;
          goto LABEL_22;
        case 400:
LABEL_15:
          uint64_t v18 = 4;
LABEL_22:
          [*(id *)(a1 + 32) setStatus:v18];
          uint64_t v20 = 0;
          goto LABEL_23;
      }
    }
    uint64_t v18 = 3;
    goto LABEL_22;
  }
  id v19 = *(void **)(a1 + 32);
  id v34 = v6;
  uint64_t v20 = [v19 _recentStationsResponseWithConnectionResponse:v5 returningError:&v34];
  id v13 = v34;

  if (v20)
  {
    int v21 = [(id)objc_opt_class() defaultURLCache];
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    id v35 = @"com.apple.Radio.RadioRecentStationsRequest.bodyMD5";
    uint64_t v36 = v22;
    id v24 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v21 storeConnectionResponse:v5 forRequestProperties:v23 userInfo:v24];
  }
LABEL_23:
  v25 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_11;
  block[3] = &unk_2643AA358;
  id v26 = *(id *)(a1 + 56);
  id v30 = v20;
  id v31 = v13;
  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = v26;
  id v27 = v13;
  id v28 = v20;
  dispatch_async(v25, block);
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_11(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:a1[6]];
}

- (RadioRecentStationsRequest)initWithCurrentStationStringID:(id)a3
{
  id v4 = a3;
  id v5 = [(RadioRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    currentStationStringID = v5->_currentStationStringID;
    v5->_currentStationStringID = (NSString *)v6;
  }
  return v5;
}

@end