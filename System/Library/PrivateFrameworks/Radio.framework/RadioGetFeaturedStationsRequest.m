@interface RadioGetFeaturedStationsRequest
- (BOOL)disableArtworkLoading;
- (BOOL)disableCachedResponses;
- (RadioGetFeaturedStationsRequest)init;
- (RadioGetFeaturedStationsRequest)initWithStationCount:(unsigned int)a3;
- (id)_importFeaturedStationWithDictionary:(id)a3 inModel:(id)a4 loadArtworkSynchronously:(BOOL)a5;
- (id)_stationDictionariesByApplyingResponse:(id)a3 error:(id *)a4;
- (void)cancel;
- (void)setDisableArtworkLoading:(BOOL)a3;
- (void)setDisableCachedResponses:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)startWithFeaturedStationsCompletionHandler:(id)a3;
@end

@implementation RadioGetFeaturedStationsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_artworkQueue, 0);
}

- (void)setDisableCachedResponses:(BOOL)a3
{
  self->_disableCachedResponses = a3;
}

- (BOOL)disableCachedResponses
{
  return self->_disableCachedResponses;
}

- (void)setDisableArtworkLoading:(BOOL)a3
{
  self->_disableArtworkLoading = a3;
}

- (BOOL)disableArtworkLoading
{
  return self->_disableArtworkLoading;
}

- (id)_stationDictionariesByApplyingResponse:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(a3, "radio_decompressedBodyData");
  if ([v6 length])
  {
    id v15 = 0;
    v7 = [v6 propertyListForRadioResponseReturningError:&v15];
    id v8 = v15;
    v9 = v8;
    if (v7)
    {
      v10 = [v7 objectForKey:@"stations"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!self->_stationCount || [v10 count] <= (unint64_t)self->_stationCount)
        {
          id v12 = 0;
          uint64_t v13 = 1;
LABEL_16:
          [(RadioRequest *)self setStatus:v13];

          if (!a4) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        uint64_t v11 = [v10 subarrayWithRange:0];
      }
      else
      {
        uint64_t v11 = 0;
      }
      id v12 = 0;
      uint64_t v13 = 1;
    }
    else
    {
      id v12 = v8;
      v10 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v12;
        __int16 v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_21B56B000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize featured stations response (%@), data: %@", buf, 0x16u);
      }
      uint64_t v11 = 0;
      uint64_t v13 = 3;
    }

    v10 = v11;
    goto LABEL_16;
  }
  v10 = 0;
  id v12 = 0;
  if (a4) {
LABEL_17:
  }
    *a4 = v12;
LABEL_18:

  return v10;
}

- (id)_importFeaturedStationWithDictionary:(id)a3 inModel:(id)a4 loadArtworkSynchronously:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 objectForKey:@"station-hash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v7 stationWithHash:v8];
      if (v9) {
        goto LABEL_10;
      }
    }
    if ([v8 length])
    {
      v9 = (void *)[v7 newFeaturedStationWithDictionary:v6];
      if (v9)
      {
LABEL_10:

        goto LABEL_12;
      }
      v10 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_21B56B000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to create featured station with dictionary: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)startWithFeaturedStationsCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke;
  v7[3] = &unk_2643AA510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestContext];
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_2;
  v6[3] = &unk_2643AA3A8;
  v6[4] = v3;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 _loadRadioStoreBagWithCompletionHandler:v6];
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 baseURL];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"getFeaturedStations"];
    id v7 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 absoluteString];
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_21B56B000, v7, OS_LOG_TYPE_INFO, "[RadioGetFeaturedStationsRequest] Request URL: %@", buf, 0xCu);
    }
    v9 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v6];
    v10 = [(id)objc_opt_class() defaultURLCache];
    uint64_t v11 = [v10 cachedConnectionResponseForRequestProperties:v9];

    if (v11 && (objc_msgSend(v11, "ssv_isExpiredResponse") & 1) == 0)
    {
      int v12 = *(void **)(a1 + 32);
      id v31 = 0;
      id v13 = [v12 _stationDictionariesByApplyingResponse:v11 error:&v31];
      id v14 = v31;
      id v15 = v14;
      if (v13)
      {
        [*(id *)(a1 + 32) setCachedResponse:1];
        uint64_t v16 = *(void *)(a1 + 48);
        if (v16) {
          (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v13, v15);
        }
        id v17 = [MEMORY[0x263F08A00] defaultCenter];
        [v17 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];

        goto LABEL_16;
      }
    }
    uint64_t v20 = *(_DWORD **)(a1 + 32);
    if (v20[22])
    {
      v34 = @"count";
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      v35 = v21;
      id v15 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];

      uint64_t v20 = *(_DWORD **)(a1 + 32);
    }
    else
    {
      id v15 = (void *)MEMORY[0x263EFFA78];
    }
    id v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v15, objc_msgSend(v20, "isAsynchronousBackgroundRequest"), 0);
    [v9 setHTTPBody:v13];
    v22 = +[RadioNetworkObserver sharedNetworkObserver];
    [v22 beginUsingNetwork];

    uint64_t v23 = [MEMORY[0x263F7B360] newRadioRequestWithRequestContext:*(void *)(a1 + 40) requestProperties:v9 storeBag:v3];
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 80);
    *(void *)(v24 + 80) = v23;

    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 80);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_28;
    v28[3] = &unk_2643AA380;
    v28[4] = v26;
    id v29 = v9;
    id v30 = *(id *)(a1 + 48);
    [v27 startWithConnectionResponseBlock:v28];

LABEL_16:
    goto LABEL_17;
  }
  [*(id *)(a1 + 32) setStatus:5];
  __int16 v18 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_3;
  block[3] = &unk_2643AA510;
  id v19 = *(id *)(a1 + 48);
  block[4] = *(void *)(a1 + 32);
  id v33 = v19;
  dispatch_async(v18, block);

  id v6 = v33;
LABEL_17:
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
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
    v9 = [v6 userInfo];
    v10 = [v9 objectForKey:*MEMORY[0x263F7B760]];
    uint64_t v8 = [v10 integerValue];
  }
  uint64_t v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = v8;
    _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioGetFeaturedStationsRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    int v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v6;
      _os_log_impl(&dword_21B56B000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get featured stations (%@)", buf, 0xCu);
    }

    id v13 = v6;
    if (!v6)
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F7B758];
      uint64_t v32 = *MEMORY[0x263F7B760];
      uint64_t v16 = [NSNumber numberWithInteger:v8];
      id v33 = v16;
      id v17 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v13 = [v14 errorWithDomain:v15 code:109 userInfo:v17];
    }
    if (v8 <= 399)
    {
      uint64_t v18 = 1;
      if (v8 == 200 || v8 == 204) {
        goto LABEL_23;
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
          goto LABEL_23;
        case 400:
LABEL_15:
          uint64_t v18 = 4;
LABEL_23:
          [*(id *)(a1 + 32) setStatus:v18];
          uint64_t v20 = 0;
          goto LABEL_24;
      }
    }
    uint64_t v18 = 3;
    goto LABEL_23;
  }
  id v19 = *(void **)(a1 + 32);
  if (v6)
  {
    id v31 = v6;
    uint64_t v20 = [v19 _stationDictionariesByApplyingResponse:v5 error:&v31];
    id v13 = v31;
  }
  else
  {
    uint64_t v20 = [v19 _stationDictionariesByApplyingResponse:v5 error:0];
    id v13 = 0;
  }
LABEL_24:
  if ([v20 count] && !*(unsigned char *)(*(void *)(a1 + 32) + 93))
  {
    v21 = [(id)objc_opt_class() defaultURLCache];
    [v21 storeConnectionResponse:v5 forRequestProperties:*(void *)(a1 + 40)];
  }
  v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_30;
  block[3] = &unk_2643AA358;
  id v23 = *(id *)(a1 + 48);
  id v27 = v20;
  id v28 = v13;
  uint64_t v29 = *(void *)(a1 + 32);
  id v30 = v23;
  id v24 = v13;
  id v25 = v20;
  dispatch_async(v22, block);
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_30(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:a1[6]];
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643AA330;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RadioGetFeaturedStationsRequest *)self startWithFeaturedStationsCompletionHandler:v6];
}

void __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v20 = a2;
  id v19 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__959;
  uint64_t v35 = __Block_byref_object_dispose__960;
  id v36 = 0;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    if ([*(id *)(a1 + 32) isCachedResponse] && objc_msgSend(v20, "count"))
    {
      id v21 = +[RadioModel sharedModel];
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v20, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = v20;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v11 = [v10 objectForKey:@"station-hash"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v12 = [v21 stationWithHash:v11];
                if (!v12)
                {

                  goto LABEL_20;
                }
                [v5 addObject:v12];
              }
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      if ([v5 count])
      {
        id v5 = v5;
        id v13 = v5;
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
LABEL_20:
      id v14 = +[RadioModel backgroundModel];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke_5;
      v22[3] = &unk_2643AA308;
      uint64_t v26 = &v31;
      id v23 = v14;
      id v15 = v20;
      uint64_t v16 = *(void *)(a1 + 32);
      id v24 = v15;
      uint64_t v25 = v16;
      id v21 = v23;
      [v23 performWriteTransactionWithBlock:v22];
      id v17 = +[RadioModel sharedModel];
      id v13 = [v17 convertObjects:v32[5]];

      id v5 = v23;
    }
  }
  else
  {
    id v13 = 0;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v13, v19);
  }

  _Block_object_dispose(&v31, 8);
}

void __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(a1 + 32) userStations];
  uint64_t v7 = [v6 valueForKey:@"stationHash"];
  long long v27 = [v5 setWithArray:v7];

  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [*(id *)(a1 + 32) featuredStations];
  uint64_t v26 = [v8 setWithArray:v9];

  int v10 = [*(id *)(a1 + 40) count];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    int v29 = ~v10;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v17 = objc_msgSend(v16, "objectForKey:", @"station-hash", v26);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v27 containsObject:v17] & 1) == 0)
        {
          uint64_t v18 = [*(id *)(a1 + 48) _importFeaturedStationWithDictionary:v16 inModel:*(void *)(a1 + 32) loadArtworkSynchronously:v13 < 3];
          id v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "setSortOrder:");
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v19];
            ++v13;
            ++v29;
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  id v20 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v26 minusSet:v20];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v26;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(a1 + 32), "deleteStation:", *(void *)(*((void *)&v30 + 1) + 8 * j), v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }
}

- (void)cancel
{
}

- (RadioGetFeaturedStationsRequest)initWithStationCount:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RadioGetFeaturedStationsRequest;
  id v4 = [(RadioRequest *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_stationCount = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Radio.RadioSyncRequest.artworkQueue", 0);
    artworkQueue = v5->_artworkQueue;
    v5->_artworkQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (RadioGetFeaturedStationsRequest)init
{
  return [(RadioGetFeaturedStationsRequest *)self initWithStationCount:0];
}

@end