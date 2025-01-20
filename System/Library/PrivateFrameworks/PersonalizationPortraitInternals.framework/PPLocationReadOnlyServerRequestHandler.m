@interface PPLocationReadOnlyServerRequestHandler
- (NSString)clientProcessName;
- (PPLocationReadOnlyServerRequestHandler)init;
- (_PASBundleIdResolver)bundleIdResolver;
- (void)locationRecordsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)rankedLocationsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPLocationReadOnlyServerRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: registerFeedback", v9, 2u);
  }

  v8 = +[PPLocalLocationStore defaultStore];
  [v8 registerFeedback:v6 completion:v5];
}

- (void)locationRecordsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    v21 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: locationRecordsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  unint64_t v17 = a4;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    v13 = [v10 customizedDescription];
    *(_DWORD *)buf = 134218498;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: locationRecordsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = pp_locations_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_locations_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPLocationReadOnlyServer.locationRecordsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalLocationStore defaultStore];
  uint64_t v7 = a1[4];
  id v26 = 0;
  v8 = [v6 locationRecordsWithQuery:v7 error:&v26];
  id v9 = v26;

  id v10 = pp_locations_signpost_handle();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPLocationReadOnlyServer.locationRecordsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  v12 = pp_xpc_server_log_handle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: locationRecordsWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[5] + 8) locationRecordBatch:0 isLast:1 error:v9 queryId:a1[6] completion:&__block_literal_global_138];
  }
  else
  {
    if (v13)
    {
      uint64_t v14 = [v8 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: locationRecordsWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    id v15 = *(void **)(a1[5] + 16);
    v16 = (void *)[[NSString alloc] initWithFormat:@"%@-locationRecordsWithQuery", *(void *)(a1[5] + 24)];
    uint64_t v17 = a1[6];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_142;
    v23[3] = &unk_1E65DA408;
    id v24 = v8;
    p_long long buf = &buf;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_2;
    v20[3] = &unk_1E65DA430;
    uint64_t v18 = a1[6];
    uint64_t v21 = a1[5];
    uint64_t v22 = v18;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_4;
    v19[3] = &unk_1E65DA458;
    v19[4] = v21;
    v19[5] = v18;
    [v15 sendBatchedResultForQueryWithName:v16 queryId:v17 batchGenerator:v23 sendError:v20 sendBatch:v19];

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_142(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) locationRecordBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_144_15291];
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_locationRecordsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) locationRecordBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)rankedLocationsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)long long buf = 134218242;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    uint64_t v21 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: rankedLocationsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  unint64_t v17 = a4;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    BOOL v13 = [v10 customizedDescription];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: rankedLocationsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = pp_locations_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_locations_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPLocationReadOnlyServer.rankedLocationsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalLocationStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 24);
  id v27 = 0;
  id v9 = [v6 rankedLocationsWithQuery:v7 clientProcessName:v8 error:&v27];
  id v10 = v27;

  v11 = pp_locations_signpost_handle();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPLocationReadOnlyServer.rankedLocationsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  BOOL v13 = pp_xpc_server_log_handle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: rankedLocationsWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[5] + 8) locationBatch:0 isLast:1 error:v10 queryId:a1[6] completion:&__block_literal_global_15302];
  }
  else
  {
    if (v14)
    {
      uint64_t v15 = [v9 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPLocationReadOnlyServer: rankedLocationsWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v16 = *(void **)(a1[5] + 16);
    unint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@-rankedLocationsWithQuery", *(void *)(a1[5] + 24)];
    uint64_t v18 = a1[6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_130;
    v24[3] = &unk_1E65DA408;
    id v25 = v9;
    p_long long buf = &buf;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_2;
    v21[3] = &unk_1E65DA430;
    uint64_t v19 = a1[6];
    uint64_t v22 = a1[5];
    uint64_t v23 = v19;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_4;
    v20[3] = &unk_1E65DA458;
    void v20[4] = v22;
    v20[5] = v19;
    [v16 sendBatchedResultForQueryWithName:v17 queryId:v18 batchGenerator:v24 sendError:v21 sendBatch:v20];

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_130(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) locationBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_133];
}

uint64_t __75__PPLocationReadOnlyServerRequestHandler_rankedLocationsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) locationBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void)unblockPendingQueries
{
}

- (PPLocationReadOnlyServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPLocationReadOnlyServerRequestHandler;
  v2 = [(PPLocationReadOnlyServerRequestHandler *)&v6 init];
  if (v2)
  {
    os_signpost_id_t v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

@end