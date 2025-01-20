@interface MOContextHistoryReader
- (BOOL)_isFetchDetail:(id)a3 matchingBundleId:(id)a4 orAlternateId:(id)a5;
- (id)_enumeratePublishersForStream:(id)a3 usingBlock:(id)a4;
- (id)_getFrameworkClientIdentity;
- (unint64_t)_getLatestFetchIdForClient:(id)a3 usingPublisher:(id)a4;
- (void)loadPersonalizedContextWithOptions:(id)a3 withReply:(id)a4;
@end

@implementation MOContextHistoryReader

- (id)_getFrameworkClientIdentity
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    v4 = (__CFString *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", 0);
    if (v4)
    {
      v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
      {
        CFRelease(v3);
        goto LABEL_8;
      }
    }
    CFRelease(v3);
  }
  v5 = [NSString stringWithCString:*(void *)_CFGetProgname() encoding:4];
LABEL_8:
  v7 = objc_opt_new();
  v8 = [MEMORY[0x263F086E0] mainBundle];
  v9 = [v8 bundleIdentifier];

  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:@"bundle-Id"];
  }
  if (v5)
  {
    [v7 setObject:v5 forKeyedSubscript:@"alt-Id"];
    if ([&unk_270720DF8 containsObject:v5])
    {
      v10 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_259147000, v10, OS_LOG_TYPE_DEFAULT, "Client is photoanalysisd test alias.", (uint8_t *)&v14, 2u);
      }

      v9 = @"com.apple.photoanalysisd";
    }
  }
  v11 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_259147000, v11, OS_LOG_TYPE_DEFAULT, "client bundle-id: %@", (uint8_t *)&v14, 0xCu);
  }

  v12 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_259147000, v12, OS_LOG_TYPE_DEFAULT, "client alt-id: %@", (uint8_t *)&v14, 0xCu);
  }

  return v7;
}

- (BOOL)_isFetchDetail:(id)a3 matchingBundleId:(id)a4 orAlternateId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v9)
    {
      v5 = [v8 clientBundleIdentifier];
      if ([v9 isEqualToString:v5])
      {
        char v12 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (!v11)
      {
        char v12 = 0;
        goto LABEL_11;
      }
LABEL_8:
      v13 = [v8 alternateClientIdentifier];
      char v12 = [v11 isEqualToString:v13];

      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (v10) {
      goto LABEL_8;
    }
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)_enumeratePublishersForStream:(id)a3 usingBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFTypeID v6 = (void (**)(id, void *, void *))a4;
  id v36 = 0;
  v7 = [v5 remoteDevicesWithError:&v36];
  id v8 = v36;
  if (v8)
  {
    id v9 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOContextHistoryReader _enumeratePublishersForStream:usingBlock:](v8);
    }

    id v10 = v8;
  }
  else
  {
    v11 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v28 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      uint64_t v29 = *(void *)v33;
      id v30 = v12;
      do
      {
        uint64_t v16 = 0;
        uint64_t v31 = v14;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
          v18 = (void *)MEMORY[0x25A2D72D0]();
          if ([v17 platform] == 2)
          {
            v19 = [v5 publisherForDevice:v17 withUseCase:@"PromptsReader" options:v11];
            v20 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = [v17 deviceIdentifier];
              [v17 model];
              v22 = v11;
              v23 = v6;
              v25 = id v24 = v5;
              uint64_t v26 = [v17 platform];
              *(_DWORD *)buf = 138412802;
              v38 = v21;
              __int16 v39 = 2112;
              v40 = v25;
              __int16 v41 = 2048;
              uint64_t v42 = v26;
              _os_log_impl(&dword_259147000, v20, OS_LOG_TYPE_INFO, "Found sync device: %@, %@, %ld", buf, 0x20u);

              id v5 = v24;
              CFTypeID v6 = v23;
              v11 = v22;
              id v12 = v30;

              uint64_t v15 = v29;
            }

            v6[2](v6, v17, v19);
            uint64_t v14 = v31;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v14);
    }

    id v10 = 0;
    id v8 = 0;
    v7 = v28;
  }

  return v10;
}

- (unint64_t)_getLatestFetchIdForClient:(id)a3 usingPublisher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"bundle-Id"];
  id v9 = [v6 objectForKeyedSubscript:@"alt-Id"];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke;
  v17[3] = &unk_265448AE8;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = [v7 filterWithIsIncluded:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_29;
  v16[3] = &unk_265448B30;
  v16[4] = v20;
  v16[5] = &v22;
  id v13 = (id)[v12 sinkWithCompletion:&__block_literal_global_1 receiveInput:v16];

  unint64_t v14 = v23[3];
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke(void *a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 personalizedContext];

  if (v4)
  {
    id v5 = [v4 fetchDetails];
    if (v5)
    {
      id v6 = [v4 fetchDetails];
      id v7 = [v6 timestamp];
      if (v7)
      {
        id v8 = [v4 fetchDetails];
        if ([v8 fetchId])
        {
          id v9 = (void *)a1[4];
          id v10 = [v4 fetchDetails];
          uint64_t v11 = [v9 _isFetchDetail:v10 matchingBundleId:a1[5] orAlternateId:a1[6]];
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2_cold_1(v2);
    }
  }
}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_29(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  id v13 = [v3 personalizedContext];

  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4
    || ([v13 fetchDetails],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 timestamp],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v4 isAfterDate:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v8 = [v13 fetchDetails];
    uint64_t v9 = [v8 timestamp];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [v13 fetchDetails];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v12 fetchId];
  }
}

- (void)loadPersonalizedContextWithOptions:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, id))a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v8, OS_LOG_TYPE_INFO, "Fetching context from shared stream", buf, 2u);
  }

  uint64_t v9 = [(MOContextHistoryReader *)self _getFrameworkClientIdentity];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"bundle-Id"];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"alt-Id"];
  id v12 = BiomeLibrary();
  id v13 = [v12 PersonalizedSensing];
  unint64_t v14 = [v13 MomentsContext];

  *(void *)buf = 0;
  long long v35 = buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = (id)objc_opt_new();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v26 = 0;
  v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke;
  v19[3] = &unk_265448BF8;
  v19[4] = self;
  id v15 = v9;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  id v17 = v11;
  id v22 = v17;
  v23 = &v26;
  uint64_t v24 = v32;
  uint64_t v25 = buf;
  id v18 = [(MOContextHistoryReader *)self _enumeratePublishersForStream:v14 usingBlock:v19];
  if (![*((id *)v35 + 5) count] && v18) {
    objc_storeStrong(v27 + 5, v18);
  }
  v7[2](v7, *((void *)v35 + 5), v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(buf, 8);
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _getLatestFetchIdForClient:*(void *)(a1 + 40) usingPublisher:v6];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x25A2D72D0]();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_2;
    v26[3] = &unk_265448B58;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v29 = v8;
    v26[4] = v10;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    uint64_t v11 = [v6 filterWithIsIncluded:v26];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy_;
    v24[4] = __Block_byref_object_dispose_;
    id v25 = 0;
    id v12 = objc_opt_new();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_3;
    v23[3] = &unk_265448B80;
    v23[4] = v24;
    id v13 = [v11 reduceWithInitial:v12 nextPartialResult:v23];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_32;
    v20[3] = &unk_265448BA8;
    id v14 = v5;
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 72);
    id v21 = v14;
    uint64_t v22 = v15;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_33;
    v19[3] = &unk_265448BD0;
    uint64_t v17 = *(void *)(a1 + 80);
    v19[4] = v16;
    void v19[5] = v24;
    v19[6] = v17;
    id v18 = (id)[v13 sinkWithCompletion:v20 receiveInput:v19];

    _Block_object_dispose(v24, 8);
  }
}

uint64_t __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_2(void *a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 personalizedContext];

  if (v4)
  {
    id v5 = [v4 fetchDetails];
    if (a1[7] == [v5 fetchId])
    {
      id v6 = (void *)a1[4];
      uint64_t v7 = [v4 fetchDetails];
      uint64_t v8 = [v6 _isFetchDetail:v7 matchingBundleId:a1[5] orAlternateId:a1[6]];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 eventBody];
  uint64_t v7 = [v6 personalizedContext];

  uint64_t v8 = [v7 fetchDetails];
  uint64_t v9 = [v5 count];
  if (v9 == [v8 batchContextReplyStartIndex])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v10 = [v8 timestamp];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    id v13 = [v7 contexts];

    if (v13)
    {
      id v14 = [v7 contexts];
      [v5 addObjectsFromArray:v14];
    }
  }
  else
  {
    if ([v5 count])
    {
      uint64_t v15 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19[0] = 67109376;
        v19[1] = [v8 fetchId];
        __int16 v20 = 1024;
        int v21 = [v8 batchContextReplyStartIndex];
        _os_log_impl(&dword_259147000, v15, OS_LOG_TYPE_INFO, "Skip split fetch batch fetchId=%u, index=%u", (uint8_t *)v19, 0xEu);
      }
    }
    [v5 removeAllObjects];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
  return v5;
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_32_cold_1(a1, v3, v5);
    }

    uint64_t v6 = [v3 error];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_33(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (!v4 || ([v4 isAfterDate:*(void *)(*(void *)(a1[5] + 8) + 40)] & 1) == 0)
  {
    id v5 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = +[MOContext fromBiome:](MOContext, "fromBiome:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
          if (v11) {
            [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), *(id *)(*(void *)(a1[5] + 8) + 40));
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
    }
  }
}

- (void)_enumeratePublishersForStream:(void *)a1 usingBlock:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_259147000, v2, v3, "Can't get MomentContext remote devices: %@", v4, v5, v6, v7, 2u);
}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 error];
  uint64_t v2 = [v1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_259147000, v3, v4, "Can't load biome sync context: %@", v5, v6, v7, v8, 2u);
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_32_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) deviceIdentifier];
  uint64_t v6 = [a2 error];
  uint64_t v7 = [v6 localizedDescription];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_259147000, a3, OS_LOG_TYPE_ERROR, "Can't load biome sync context from %@: %@", (uint8_t *)&v8, 0x16u);
}

@end