@interface FCAnalyticsEndpointConnection
- (FCAnalyticsEndpointConnection)initWithEndpointConnection:(id)a3;
- (FCAsyncSerialQueue)serialQueue;
- (FCEndpointConnection)endpointConnection;
- (void)setEndpointConnection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 completion:(id)a6;
- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 priority:(float)a6 callbackQueue:(id)a7 completion:(id)a8;
@end

@implementation FCAnalyticsEndpointConnection

- (FCAnalyticsEndpointConnection)initWithEndpointConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAnalyticsEndpointConnection;
  v6 = [(FCAnalyticsEndpointConnection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointConnection, a3);
    v8 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v8;
  }
  return v7;
}

- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_get_global_queue(17, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1.0;
  [(FCAnalyticsEndpointConnection *)self uploadEnvelopeBatch:v13 withURL:v12 valuesByHTTPHeaderField:v11 priority:v15 callbackQueue:v10 completion:v14];
}

- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 priority:(float)a6 callbackQueue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = [(FCAnalyticsEndpointConnection *)self serialQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke;
  v25[3] = &unk_1E5B5C0F0;
  id v26 = v14;
  id v27 = v15;
  v28 = self;
  id v29 = v16;
  float v32 = a6;
  id v30 = v17;
  id v31 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  [v19 enqueueBlock:v25];
}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) data];
  id v5 = *(id *)(a1 + 40);
  v6 = NewsCoreUserDefaults();
  int v7 = [v6 BOOLForKey:@"running_ui_automation"];
  char v8 = v7;
  if (v7)
  {
    int v9 = NFInternalBuild();

    if (!v9)
    {
      char v8 = 0;
      goto LABEL_6;
    }
    v6 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    [v6 setQuery:@"testRequest=true"];
    uint64_t v10 = [v6 URL];

    id v5 = (id)v10;
  }

LABEL_6:
  id v11 = [*(id *)(a1 + 48) endpointConnection];
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2;
  v18[3] = &unk_1E5B5C0C8;
  char v22 = v8;
  id v19 = v5;
  id v20 = v3;
  id v21 = *(id *)(a1 + 72);
  id v15 = v3;
  id v16 = v5;
  LODWORD(v17) = v12;
  [v11 performHTTPRequestWithURL:v16 valuesByHTTPHeaderField:v13 method:@"PUT" data:v4 contentType:@"application/octet-stream" priority:1 requiresMescalSigning:v17 callbackQueue:v14 completion:v18];
}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(unsigned char *)(a1 + 56) && [v7 length])
  {
    uint64_t v10 = FCURLForNewsAnalyticsPayloads();
    id v11 = [v10 URLByAppendingPathComponent:@"response.json"];
    int v12 = [v11 path];

    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__88;
    v42 = __Block_byref_object_dispose__88;
    id v43 = 0;
    id obj = 0;
    float v32 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:4 error:&obj];
    objc_storeStrong(&v43, obj);
    uint64_t v13 = objc_msgSend(v32, "fc_firstObjectPassingTest:", &__block_literal_global_187);
    uint64_t v14 = (void *)v13;
    id v15 = (void *)MEMORY[0x1E4F1CC08];
    if (v13) {
      id v15 = (void *)v13;
    }
    id v31 = v15;

    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_15;
    v34[3] = &unk_1E5B5C0A0;
    id v17 = v12;
    id v35 = v17;
    v36 = &v38;
    id v18 = objc_msgSend(v16, "fc_dictionary:", v34);
    id v19 = objc_msgSend(v18, "fc_dictionaryByMergingDictionary:withValueCombiner:", v31, &__block_literal_global_26_2);
    v52[0] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    id v21 = (id *)(v39 + 5);
    id v33 = (id)v39[5];
    char v22 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v20 options:0 error:&v33];
    objc_storeStrong(v21, v33);
    [v22 writeToFile:v17 atomically:0];

    if (v39[5])
    {
      id v23 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v28 = [NSString alloc];
        id v29 = [(id)v39[5] localizedDescription];
        id v30 = (void *)[v28 initWithFormat:@"Expected nil error but got %@", v29];
        *(_DWORD *)buf = 136315906;
        v45 = "-[FCAnalyticsEndpointConnection uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue"
              ":completion:]_block_invoke_2";
        __int16 v46 = 2080;
        v47 = "FCAnalyticsEndpointConnection.m";
        __int16 v48 = 1024;
        int v49 = 124;
        __int16 v50 = 2114;
        v51 = v30;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }

    _Block_object_dispose(&v38, 8);
  }
  if (v8)
  {
    v25 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v8 statusCode], *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v26 = *(void *)(a1 + 48);
    if (v26) {
      (*(void (**)(uint64_t, BOOL, void *, uint64_t))(v26 + 16))(v26, v25 == 0, v25, 1);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27) {
      (*(void (**)(uint64_t, void, id, void))(v27 + 16))(v27, 0, v9, 0);
    }
  }
}

BOOL __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2_17;
  v7[3] = &unk_1E5B5C078;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  FCPerformIfNonNil(v4, v7);
}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2_17(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:4 error:&obj];

  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = [v5 firstObject];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    uint64_t v10 = v8;
  }
  id v11 = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v12 = [NSString alloc];
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedDescription];
    uint64_t v14 = (void *)[v12 initWithFormat:@"Expected nil error but got %@", v13];
    *(_DWORD *)buf = 136315906;
    id v17 = "-[FCAnalyticsEndpointConnection uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue:com"
          "pletion:]_block_invoke_2";
    __int16 v18 = 2080;
    id v19 = "FCAnalyticsEndpointConnection.m";
    __int16 v20 = 1024;
    int v21 = 107;
    __int16 v22 = 2114;
    id v23 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [*(id *)(a1 + 32) addEntriesFromDictionary:v11];
}

uint64_t __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 numberWithInteger:v7 + v6];
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end