@interface RadioSyncRequest
- (BOOL)disableArtworkLoading;
- (BOOL)includeCleanTracksOnly;
- (BOOL)isAutomaticUpdate;
- (NSDictionary)resultingOverrideBagDictionary;
- (NSString)referer;
- (RadioSyncRequest)init;
- (RadioSyncRequest)initWithGlobalVersion:(unint64_t)a3;
- (id)_sortedChangesByType:(id)a3;
- (id)_stationSortOrderForChanges:(id)a3;
- (id)_updateModel:(id)a3 withChangeDictionary:(id)a4 changeType:(int64_t *)a5 loadArtworkSynchronously:(BOOL)a6;
- (id)changeList;
- (id)matchDictionary;
- (id)responseDictionary;
- (void)cancel;
- (void)setDisableArtworkLoading:(BOOL)a3;
- (void)setIncludeCleanTracksOnly:(BOOL)a3;
- (void)setIsAutomaticUpdate:(BOOL)a3;
- (void)setReferer:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RadioSyncRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingOverrideBagDictionary, 0);
  objc_storeStrong((id *)&self->_referer, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_artworkQueue, 0);
}

- (NSDictionary)resultingOverrideBagDictionary
{
  return self->_resultingOverrideBagDictionary;
}

- (void)setReferer:(id)a3
{
}

- (NSString)referer
{
  return self->_referer;
}

- (void)setIsAutomaticUpdate:(BOOL)a3
{
  self->_isAutomaticUpdate = a3;
}

- (BOOL)isAutomaticUpdate
{
  return self->_isAutomaticUpdate;
}

- (void)setIncludeCleanTracksOnly:(BOOL)a3
{
  self->_includeCleanTracksOnly = a3;
}

- (BOOL)includeCleanTracksOnly
{
  return self->_includeCleanTracksOnly;
}

- (void)setDisableArtworkLoading:(BOOL)a3
{
  self->_disableArtworkLoading = a3;
}

- (BOOL)disableArtworkLoading
{
  return self->_disableArtworkLoading;
}

- (id)_updateModel:(id)a3 withChangeDictionary:(id)a4 changeType:(int64_t *)a5 loadArtworkSynchronously:(BOOL)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 objectForKey:@"change-type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
    goto LABEL_30;
  }
  int64_t v11 = [v10 integerValue];
  int64_t v12 = v11;
  if (a5) {
    *a5 = v11;
  }
  if (v11 == 4)
  {
    v13 = [v9 objectForKey:@"sort-order"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v13 = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              v18 = v13;
              goto LABEL_27;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v18 = [v13 valueForKey:@"longLongValue", v27];
      [v8 setStationSortOrdering:v18];
LABEL_27:
    }
    goto LABEL_28;
  }
  unint64_t v20 = v11 - 1;
  if ((unint64_t)(v11 - 1) > 2)
  {
    v13 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v32 = v12;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Unknown change type (%ld): %@", buf, 0x16u);
    }
  }
  else
  {
    v13 = [v9 objectForKey:@"station-dict"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v13 objectForKey:@"station-id"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [v21 longLongValue];
        if (v20 > 1)
        {
          uint64_t v25 = v22;
          v26 = _RadioLogCategoryRequests();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v32 = v25;
            _os_log_impl(&dword_21B56B000, v26, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Deleting station with id: %llu", buf, 0xCu);
          }

          [v8 deleteStationWithID:v25];
        }
        else
        {
          v19 = (void *)[v8 newStationWithDictionary:v13];
          if (v19)
          {
LABEL_37:

            goto LABEL_29;
          }
          v23 = _RadioLogCategoryRequests();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v13;
            _os_log_impl(&dword_21B56B000, v23, OS_LOG_TYPE_ERROR, "Error: Unable to create station with dictionary: %@", buf, 0xCu);
          }
        }
      }
      v19 = 0;
      goto LABEL_37;
    }
  }
LABEL_28:
  v19 = 0;
LABEL_29:

LABEL_30:
  return v19;
}

- (id)_stationSortOrderForChanges:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "objectForKey:", @"change-type", (void)v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 integerValue] == 4)
        {
          v10 = [v8 objectForKey:@"sort-order"];

          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)_sortedChangesByType:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        int64_t v11 = [v10 objectForKey:@"change-type"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 integerValue] == 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        v18 = [v17 objectForKey:@"change-type"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 integerValue] == 2) {
          [v4 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v14);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v39 + 1) + 8 * k);
        uint64_t v25 = [v24 objectForKey:@"change-type"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 integerValue] == 3) {
          [v4 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v21);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v19;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v35 + 1) + 8 * m);
        v32 = objc_msgSend(v31, "objectForKey:", @"change-type", (void)v35);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v32 integerValue] == 4) {
          [v4 addObject:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v28);
  }

  __int16 v33 = (void *)[v4 copy];
  return v33;
}

- (id)matchDictionary
{
  return 0;
}

- (id)changeList
{
  return 0;
}

- (id)responseDictionary
{
  return self->_responseDictionary;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RadioRequest *)self requestContext];
  uint64_t v6 = +[RadioModel sharedModel];
  uint64_t v7 = [v6 databaseVersion];

  if (v7 != 3)
  {
    uint64_t v8 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B56B000, v8, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Doing a full sync for a database version update...", buf, 2u);
    }

    self->_globalVersion = 0;
    self->_isAutomaticUpdate = 0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke;
  v11[3] = &unk_2643AA078;
  id v12 = v5;
  id v13 = v4;
  v11[4] = self;
  BOOL v14 = v7 != 3;
  id v9 = v5;
  id v10 = v4;
  [(RadioRequest *)self _loadRadioStoreBagWithCompletionHandler:v11];
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 baseURL];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"sync"];
    uint64_t v7 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v6;
      _os_log_impl(&dword_21B56B000, v7, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Request URL: %@", buf, 0xCu);
    }

    id v34 = (void *)v6;
    uint64_t v8 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v6];
    [v8 setShouldProcessProtocol:0];
    id v9 = (void *)MEMORY[0x263EFF9A0];
    id v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 80)];
    int64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"global-version", 0);

    id v12 = [*(id *)(a1 + 32) changeList];
    if ([v12 count]) {
      [v11 setObject:v12 forKey:@"change-list"];
    }
    __int16 v33 = v12;
    uint64_t v13 = [*(id *)(a1 + 32) matchDictionary];
    if (v13) {
      [v11 setObject:v13 forKey:@"match"];
    }
    v32 = (void *)v13;
    BOOL v14 = [v3 radioConfigurationDictionary];
    uint64_t v15 = [v14 objectForKey:@"show-explicit-toggle"];

    if ((objc_opt_respondsToSelector() & 1) == 0 || [v15 BOOLValue])
    {
      uint64_t v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 105)];
      [v11 setObject:v16 forKey:@"clean"];
    }
    uint64_t v17 = +[RadioModel backgroundModel];
    v18 = [v17 globalHash];
    if ([v18 length]) {
      [v11 setObject:v18 forKey:@"global-hash"];
    }
    uint64_t v19 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v19 + 106))
    {
      [v11 setObject:MEMORY[0x263EFFA88] forKey:@"auto-update"];
      uint64_t v19 = *(void *)(a1 + 32);
    }
    if ([*(id *)(v19 + 112) length]) {
      [v8 setValue:*(void *)(*(void *)(a1 + 32) + 112) forHTTPHeaderField:@"Referer"];
    }
    uint64_t v20 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v11;
      _os_log_impl(&dword_21B56B000, v20, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Request parameters: %@", buf, 0xCu);
    }

    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF8F8], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v11, objc_msgSend(*(id *)(a1 + 32), "isAsynchronousBackgroundRequest"), 0);
    [v8 setHTTPBody:v21];
    uint64_t v22 = +[RadioNetworkObserver sharedNetworkObserver];
    [v22 beginUsingNetwork];

    uint64_t v23 = [MEMORY[0x263F7B360] newRadioRequestWithRequestContext:*(void *)(a1 + 40) requestProperties:v8 storeBag:v3];
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void **)(v24 + 88);
    *(void *)(v24 + 88) = v23;

    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void **)(v26 + 88);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_39;
    v35[3] = &unk_2643AA050;
    v35[4] = v26;
    id v36 = v17;
    char v39 = *(unsigned char *)(a1 + 56);
    id v37 = *(id *)(a1 + 40);
    id v38 = *(id *)(a1 + 48);
    id v28 = v17;
    [v27 startWithConnectionResponseBlock:v35];

    uint64_t v29 = v34;
  }
  else
  {
    [*(id *)(a1 + 32) setStatus:5];
    long long v30 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_2643AA510;
    id v31 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v41 = v31;
    dispatch_async(v30, block);

    uint64_t v29 = v41;
  }
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(*(void *)(a1 + 32) + 80), 0);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 32)];
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  v80[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[RadioNetworkObserver sharedNetworkObserver];
  [v7 endUsingNetwork];

  id v8 = v6;
  id v9 = v8;
  if (v5)
  {
    uint64_t v10 = [v5 statusCode];
  }
  else
  {
    int64_t v11 = [v8 userInfo];
    id v12 = [v11 objectForKey:*MEMORY[0x263F7B760]];
    uint64_t v10 = [v12 integerValue];
  }
  uint64_t v13 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Status code: %lli", (uint8_t *)&buf, 0xCu);
  }

  if ((unint64_t)(v10 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    BOOL v14 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_21B56B000, v14, OS_LOG_TYPE_ERROR, "Error: Unable to read station listing (%@)", (uint8_t *)&buf, 0xCu);
    }

    id v15 = v9;
    if (!v9)
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v79 = *MEMORY[0x263F7B760];
      uint64_t v17 = [NSNumber numberWithInteger:v10];
      v80[0] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v80 forKeys:&v79 count:1];
      id v15 = [v16 errorWithDomain:*MEMORY[0x263F7B758] code:109 userInfo:v18];
    }
    if (v10 <= 399)
    {
      uint64_t v19 = 1;
      if (v10 == 200 || v10 == 204) {
        goto LABEL_30;
      }
    }
    else
    {
      switch(v10)
      {
        case 404:
          goto LABEL_15;
        case 401:
          uint64_t v19 = 2;
          goto LABEL_30;
        case 400:
LABEL_15:
          uint64_t v19 = 4;
LABEL_30:
          [*(id *)(a1 + 32) setStatus:v19];
          uint64_t v25 = 0;
          goto LABEL_57;
      }
    }
    uint64_t v19 = 3;
    goto LABEL_30;
  }
  uint64_t v20 = objc_msgSend(v5, "radio_decompressedBodyData");
  if ([v20 length])
  {
    id v72 = 0;
    id v73 = v9;
    v53 = [v20 propertyListForRadioResponseReturningError:&v73 unparsedResponseDictionary:&v72];
    id v15 = v73;

    id v21 = v72;
    id v52 = v72;
    if (v52)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v21);
      v51 = [v52 objectForKey:@"error"];
      if (v51)
      {
        [*(id *)(a1 + 32) setStatus:3];
        id v22 = v51;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v23 = [v22 objectForKey:@"error-value"];
          if (objc_opt_respondsToSelector()) {
            uint64_t v24 = (int)[v23 intValue];
          }
          else {
            uint64_t v24 = 0;
          }
        }
        else
        {
          uint64_t v24 = 0;
        }

        [*(id *)(a1 + 32) setErrorCode:v24];
        uint64_t v41 = [MEMORY[0x263F087E8] errorWithDomain:@"RadioRequestErrorDomain" code:v24 userInfo:0];

        long long v40 = os_log_create("com.apple.amp.radio", "Requests");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_21B56B000, v40, OS_LOG_TYPE_ERROR, "Error: Sync request failed (%@)", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v25 = 0;
        id v15 = (id)v41;
      }
      else
      {
        long long v50 = [v53 objectForKey:@"global-version"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [v50 unsignedLongLongValue];
          [*(id *)(a1 + 40) setGlobalVersion:v25];
        }
        else
        {
          uint64_t v25 = 0;
        }
        long long v49 = [v53 objectForKey:@"bag"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v27 = [v49 copy];
          uint64_t v28 = *(void *)(a1 + 32);
          uint64_t v29 = *(void **)(v28 + 120);
          *(void *)(v28 + 120) = v27;
        }
        long long v48 = [v53 objectForKey:@"global-hash"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 40) setGlobalHash:v48];
        }
        long long v46 = [v53 objectForKey:@"type"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = [v46 unsignedIntValue];
          id v31 = os_log_create("com.apple.amp.radio", "Requests");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v30;
            _os_log_impl(&dword_21B56B000, v31, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Sync type: %lli", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          uint64_t v30 = 1;
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v75 = 0x3032000000;
        v76 = __Block_byref_object_copy__175;
        v77 = __Block_byref_object_dispose__176;
        objc_msgSend(MEMORY[0x263EFF9C0], "set", v46);
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x3032000000;
        v70[3] = __Block_byref_object_copy__175;
        v70[4] = __Block_byref_object_dispose__176;
        id v71 = [MEMORY[0x263EFF9C0] set];
        v32 = *(void **)(a1 + 40);
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_53;
        v62[3] = &unk_2643A9FD8;
        id v33 = v53;
        uint64_t v34 = *(void *)(a1 + 32);
        long long v35 = *(void **)(a1 + 40);
        id v63 = v33;
        uint64_t v64 = v34;
        id v65 = v35;
        p_long long buf = &buf;
        v67 = v70;
        uint64_t v68 = v30;
        char v69 = *(unsigned char *)(a1 + 64);
        [v32 performWriteTransactionWithBlock:v62];
        if (v30 == 2)
        {
          id v36 = os_log_create("com.apple.amp.radio", "Requests");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v61 = 0;
            _os_log_impl(&dword_21B56B000, v36, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Synchronously fetching featured stations...", v61, 2u);
          }

          id v37 = objc_alloc_init(RadioGetFeaturedStationsRequest);
          [(RadioRequest *)v37 setRequestContext:*(void *)(a1 + 48)];
          [(RadioGetFeaturedStationsRequest *)v37 setDisableArtworkLoading:*(unsigned __int8 *)(*(void *)(a1 + 32) + 104)];
          dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_62;
          v59[3] = &unk_2643AA000;
          char v39 = v38;
          v60 = v39;
          [(RadioGetFeaturedStationsRequest *)v37 startWithCompletionHandler:v59];
          dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
        }
        [*(id *)(a1 + 32) setStatus:1];

        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&buf, 8);

        long long v40 = v50;
      }
    }
    else
    {
      uint64_t v26 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_21B56B000, v26, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize station listing (%@)", (uint8_t *)&buf, 0xCu);
      }

      [*(id *)(a1 + 32) setStatus:3];
      uint64_t v25 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
    id v15 = v9;
  }

LABEL_57:
  long long v42 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B56B000, v42, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Sync completed", (uint8_t *)&buf, 2u);
  }

  uint64_t v43 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_64;
  block[3] = &unk_2643AA028;
  id v57 = *(id *)(a1 + 56);
  uint64_t v58 = v25;
  uint64_t v44 = *(void *)(a1 + 32);
  id v55 = v15;
  uint64_t v56 = v44;
  id v45 = v15;
  dispatch_async(v43, block);
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_53(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) objectForKey:@"change-list"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  id v3 = [*(id *)(a1 + 40) _sortedChangesByType:v2];

  uint64_t v25 = [*(id *)(a1 + 40) _stationSortOrderForChanges:v3];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = [*(id *)(a1 + 48) userStations];
  uint64_t v24 = [v4 setWithArray:v5];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = v3;
  uint64_t v6 = [v2 countByEnumeratingWithState:&v30 objects:v36 count:16];
  id v23 = v2;
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v31;
  uint64_t v22 = a1 + 64;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(v2);
      }
      uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v25)
        {
          int64_t v11 = [v10 objectForKey:@"station-dict"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [v11 objectForKey:@"station-id"];
            if (v12) {
              BOOL v13 = (unint64_t)[v25 indexOfObject:v12] < 2;
            }
            else {
              BOOL v13 = 0;
            }

            id v2 = v23;
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
        *(void *)long long buf = 1;
        BOOL v14 = objc_msgSend(*(id *)(a1 + 40), "_updateModel:withChangeDictionary:changeType:loadArtworkSynchronously:", *(void *)(a1 + 48), v10, buf, v13, v22);
        if (v14)
        {
          [v24 removeObject:v14];
          uint64_t v15 = a1 + 56;
          if (*(void *)buf == 1) {
            goto LABEL_21;
          }
          if (*(void *)buf == 2)
          {
            uint64_t v15 = v22;
LABEL_21:
            [*(id *)(*(void *)(*(void *)v15 + 8) + 40) addObject:v14];
          }
        }

        continue;
      }
    }
    uint64_t v7 = [v2 countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v7);
LABEL_25:

  if (*(void *)(a1 + 72) == 2)
  {
    uint64_t v16 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_21B56B000, v16, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Removing stations after full sync: %@", buf, 0xCu);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v24;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(a1 + 48), "deleteStationWithID:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "stationID", v22));
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    id v2 = v23;
  }

LABEL_37:
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 48) setDatabaseVersion:3];
  }
}

intptr_t __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_62(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_64(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[7], a1[4]);
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:a1[5]];
}

- (void)cancel
{
}

- (RadioSyncRequest)initWithGlobalVersion:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RadioSyncRequest;
  id v4 = [(RadioRequest *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_globalVersion = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Radio.RadioSyncRequest.artworkQueue", 0);
    artworkQueue = v5->_artworkQueue;
    v5->_artworkQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (RadioSyncRequest)init
{
  id v3 = +[RadioModel sharedModel];
  id v4 = -[RadioSyncRequest initWithGlobalVersion:](self, "initWithGlobalVersion:", [v3 globalVersion]);

  return v4;
}

@end