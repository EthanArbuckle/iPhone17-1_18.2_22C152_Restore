@interface WBSPasswordBreachRequestManager
- (WBSPasswordBreachRequestManager)initWithContext:(id)a3;
- (void)_buildRequestWithURL:(id)a3 headers:(id)a4 completionHandler:(id)a5;
- (void)_fetchBucketAtURL:(id)a3 withClientBlindedHash:(id)a4 completionHandler:(id)a5;
- (void)fetchHighFrequencyBucketWithCompletionHandler:(id)a3;
- (void)fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSPasswordBreachRequestManager

- (WBSPasswordBreachRequestManager)initWithContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSPasswordBreachRequestManager;
  v6 = [(WBSPasswordBreachRequestManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    fetchOperationQueue = v7->_fetchOperationQueue;
    v7->_fetchOperationQueue = v8;

    v10 = [NSString stringWithFormat:@"com.apple.SafariShared.%@.%p.operationQueue", objc_opt_class(), v7];
    [(NSOperationQueue *)v7->_fetchOperationQueue setName:v10];

    v11 = (void *)MEMORY[0x1E4F18DC0];
    v12 = [v5 configuration];
    v13 = [v12 urlSessionConfiguration];
    uint64_t v14 = [v11 sessionWithConfiguration:v13 delegate:0 delegateQueue:v7->_fetchOperationQueue];
    session = v7->_session;
    v7->_session = (NSURLSession *)v14;

    v16 = v7;
  }

  return v7;
}

- (void)_fetchBucketAtURL:(id)a3 withClientBlindedHash:(id)a4 completionHandler:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    v16 = @"x-req-p";
    v11 = objc_msgSend(NSString, "safari_stringAsHexWithData:", v9);
    v17[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    v12 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke;
  v14[3] = &unk_1E615C0C8;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(WBSPasswordBreachRequestManager *)self _buildRequestWithURL:v8 headers:v12 completionHandler:v14];
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2;
  v5[3] = &unk_1E615C0A0;
  id v6 = *(id *)(a1 + 40);
  v4 = [v3 downloadTaskWithRequest:a2 completionHandler:v5];
  [v4 resume];
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_6(v11, v10);
    }
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    if (objc_msgSend(v10, "safari_statusCodeGroup") == 2)
    {
      id v44 = 0;
      v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:&v44];
      id v13 = v44;
      if (v12)
      {
        uint64_t v14 = [[WBSPasswordBreachBloomFilter alloc] initWithSerializedRepresentation:v12];
        if (v14)
        {
          id v15 = [v10 valueForHTTPHeaderField:@"x-res-p"];
          if ([v15 length])
          {
            v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "safari_dataWithHexString:", v15);
            if ([v16 length])
            {
              v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
            }
            else
            {
              v36 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_3(v36, v37, v38, v39, v40, v41, v42, v43);
              }
              v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
            }
            v17();
          }
          else
          {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          }
        }
        else
        {
          v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
      }
      else
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_1(v27, v13);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }

      goto LABEL_5;
    }
    v26 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_4(v26, v10);
    }
LABEL_4:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_5:

    goto LABEL_6;
  }
  objc_super v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_5(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_6:
}

- (void)_buildRequestWithURL:(id)a3 headers:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [MEMORY[0x1E4F18D50] requestWithURL:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v17);
        [v9 setValue:v16 forHTTPHeaderField:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  v8[2](v8, v9);
}

- (void)fetchHighFrequencyBucketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPasswordBreachContext *)self->_context configuration];
  id v6 = [v5 highFrequencyBucketURL];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__WBSPasswordBreachRequestManager_fetchHighFrequencyBucketWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E615C0F0;
  id v9 = v4;
  id v7 = v4;
  [(WBSPasswordBreachRequestManager *)self _fetchBucketAtURL:v6 withClientBlindedHash:0 completionHandler:v8];
}

uint64_t __81__WBSPasswordBreachRequestManager_fetchHighFrequencyBucketWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes:(id)a3 completionHandler:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27 = (void (**)(id, void *))a4;
  id v7 = dispatch_group_create();
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = [(WBSPasswordBreachContext *)self->_context configuration];
  int v9 = [v8 verboseSensitiveLoggingEnabled];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * v10);
        uint64_t v12 = v7;
        dispatch_group_enter(v7);
        uint64_t v13 = [obj objectForKeyedSubscript:v11];
        if (v9)
        {
          uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            long long v20 = NSString;
            uint64_t v21 = v14;
            uint64_t v22 = [v13 second];
            uint64_t v23 = objc_msgSend(v20, "safari_stringAsHexWithData:", v22);
            uint64_t v24 = [v13 first];
            *(_DWORD *)buf = 138740483;
            uint64_t v42 = v11;
            __int16 v43 = 2117;
            id v44 = v23;
            __int16 v45 = 2117;
            v46 = v24;
            _os_log_debug_impl(&dword_1B728F000, v21, OS_LOG_TYPE_DEBUG, "Looking up password with UUID %{sensitive}@, client-blinded hash %{sensitive}@ in bucket %{sensitive}@", buf, 0x20u);
          }
        }
        uint64_t v15 = [(WBSPasswordBreachContext *)self->_context configuration];
        v16 = [v15 lowFrequencyBucketURL];
        long long v17 = [v13 first];
        long long v18 = [v16 URLByAppendingPathComponent:v17];

        long long v19 = [v13 second];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke;
        v32[3] = &unk_1E615C118;
        char v36 = v9;
        id v33 = v29;
        uint64_t v34 = v11;
        id v7 = v12;
        uint64_t v35 = v12;
        [(WBSPasswordBreachRequestManager *)self _fetchBucketAtURL:v18 withClientBlindedHash:v19 completionHandler:v32];

        ++v10;
      }
      while (v30 != v10);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v30);
  }

  uint64_t v25 = [(WBSPasswordBreachContext *)self->_context configuration];
  dispatch_time_t v26 = dispatch_time(0, 1000000000 * [v25 lowFrequencyBucketFetchTimeout]);
  dispatch_group_wait(v7, v26);

  v27[2](v27, v29);
}

void __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(unsigned char *)(a1 + 56))
  {
    if ([v6 length])
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke_cold_1(v8, (uint64_t)v7);
      }
    }
  }
  int v9 = [[WBSPair alloc] initWithFirst:v5 second:v7];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to map downloaded data: %{public}@", v7, v8, v9, v10, 2u);
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_4(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 statusCode];
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Received non 2xx status code response: %d", (uint8_t *)v4, 8u);
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_6(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to fetch bucket with error: %{public}@", v7, v8, v9, v10, 2u);
}

void __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "safari_stringAsHexWithData:", a2);
  int v6 = 138739971;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEBUG, "\tReceived server-client-blinded hash %{sensitive}@", (uint8_t *)&v6, 0xCu);
}

@end