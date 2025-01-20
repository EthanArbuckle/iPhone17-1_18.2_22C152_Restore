@interface NDAnalyticsPayloadUploader
- (FCAnalyticsEndpointConnection)endpointConnection;
- (FCAsyncSerialQueue)uploadQueue;
- (NDAnalyticsPayloadUploader)init;
- (NDAnalyticsPayloadUploader)initWithAppConfigurationManager:(id)a3;
- (void)setEndpointConnection:(id)a3;
- (void)setUploadQueue:(id)a3;
- (void)uploadPayloadsForInfos:(id)a3 withEnvelopeStore:(id)a4 perPayloadCompletion:(id)a5 completion:(id)a6;
@end

@implementation NDAnalyticsPayloadUploader

- (NDAnalyticsPayloadUploader)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsPayloadUploader init]";
    __int16 v9 = 2080;
    v10 = "NDAnalyticsPayloadUploader.m";
    __int16 v11 = 1024;
    int v12 = 32;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAnalyticsPayloadUploader init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAnalyticsPayloadUploader)initWithAppConfigurationManager:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadUploader initWithAppConfigurationManager:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)NDAnalyticsPayloadUploader;
  v5 = [(NDAnalyticsPayloadUploader *)&v12 init];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F59430]) initWithSourceApplicationBundleIdentifier:@"com.apple.news"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F59348]) initWithEndpointConnection:v6];
    endpointConnection = v5->_endpointConnection;
    v5->_endpointConnection = (FCAnalyticsEndpointConnection *)v7;

    uint64_t v9 = objc_opt_new();
    uploadQueue = v5->_uploadQueue;
    v5->_uploadQueue = (FCAsyncSerialQueue *)v9;
  }
  return v5;
}

- (void)uploadPayloadsForInfos:(id)a3 withEnvelopeStore:(id)a4 perPayloadCompletion:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v22 = a5;
  id v19 = a6;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:]();
    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:]();
  }
LABEL_6:
  objc_super v12 = v11;
  if (!v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:]();
  }
  __int16 v13 = [(NDAnalyticsPayloadUploader *)self uploadQueue];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke;
        v25[3] = &unk_264538B30;
        id v26 = v12;
        uint64_t v27 = v18;
        v28 = self;
        id v29 = v22;
        [v13 enqueueBlock:v25];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  if (v20)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_4;
    v23[3] = &unk_264538B58;
    id v24 = v20;
    [v13 enqueueBlock:v23];
  }
}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) entriesToUpload];
  id v6 = [v4 envelopesForEntries:v5];

  uint64_t v7 = [v6 allValues];
  v8 = [*(id *)(a1 + 40) droppedEntriesByReason];
  uint64_t v9 = [v8 objectForKeyedSubscript:&unk_26D195D90];

  id v10 = objc_opt_new();
  [v10 setMajorVersion:0];
  [v10 setMinorVersion:1];
  [v10 setPatchVersion:0];
  objc_msgSend(v10, "setEnvelopeDroppedCountDueToSizeLimit:", objc_msgSend(v9, "count"));
  id v11 = (void *)[v7 mutableCopy];
  [v10 setEnvelopes:v11];

  objc_super v12 = (void *)MEMORY[0x263EFF8C0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_25;
  v25[3] = &unk_264538AE0;
  id v26 = v7;
  id v27 = v9;
  id v13 = v9;
  id v14 = v7;
  uint64_t v15 = objc_msgSend(v12, "fc_array:", v25);
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:v15];
  uint64_t v16 = [*(id *)(a1 + 48) endpointConnection];
  v17 = [*(id *)(a1 + 40) endpointURL];
  uint64_t v18 = [*(id *)(a1 + 40) valuesByHTTPHeaderField];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_3;
  v22[3] = &unk_264538B08;
  id v23 = v3;
  id v19 = *(id *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 40);
  id v24 = v19;
  v22[4] = v20;
  id v21 = v3;
  [v16 uploadEnvelopeBatch:v10 withURL:v17 valuesByHTTPHeaderField:v18 completion:v22];
}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_2);
  [v8 addObjectsFromArray:v3];

  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = NDAnalyticsEnvelopeContentTypesFromEntries(v4);
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = MEMORY[0x263EFFA68];
    }
    [v8 addObjectsFromArray:v7];
  }
}

uint64_t __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 contentType];

  return [v2 numberWithInt:v3];
}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void (**)(uint64_t))(v4 + 16);
  id v6 = a3;
  v5(v4);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (FCAnalyticsEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (FCAsyncSerialQueue)uploadQueue
{
  return self->_uploadQueue;
}

- (void)setUploadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadQueue, 0);

  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

- (void)initWithAppConfigurationManager:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigurationManager", v6, 2u);
}

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"perPayloadCompletion", v6, 2u);
}

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeStore", v6, 2u);
}

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"payloadInfos", v6, 2u);
}

@end