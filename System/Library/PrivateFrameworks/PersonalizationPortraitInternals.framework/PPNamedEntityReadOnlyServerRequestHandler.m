@interface PPNamedEntityReadOnlyServerRequestHandler
- (NSString)clientProcessName;
- (PPNamedEntityReadOnlyServerRequestHandler)init;
- (_PASBundleIdResolver)bundleIdResolver;
- (void)mapItemForPlaceName:(id)a3 completion:(id)a4;
- (void)namedEntityRecordsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)rankedNamedEntitiesWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPNamedEntityReadOnlyServerRequestHandler

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
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: registerFeedback", buf, 2u);
  }

  v8 = +[PPLocalNamedEntityStore defaultStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PPNamedEntityReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke;
  v10[3] = &unk_1E65DA480;
  id v11 = v5;
  id v9 = v5;
  [v8 registerFeedback:v6 completion:v10];
}

uint64_t __73__PPNamedEntityReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)mapItemForPlaceName:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *, id))a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: mapItemForPlaceName", buf, 2u);
  }

  v8 = pp_entities_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = pp_entities_signpost_handle();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPNamedEntityReadOnlyServer.mapItemForPlaceName", "", v19, 2u);
  }

  v12 = +[PPLocalNamedEntityStore defaultStore];
  id v18 = 0;
  v13 = [v12 mapItemForPlaceName:v6 error:&v18];

  id v14 = v18;
  v15 = pp_entities_signpost_handle();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v16, OS_SIGNPOST_INTERVAL_END, v9, "PPNamedEntityReadOnlyServer.mapItemForPlaceName", "", v17, 2u);
  }

  v5[2](v5, v13, v14);
}

- (void)namedEntityRecordsWithQuery:(id)a3 queryId:(unint64_t)a4
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
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  unint64_t v17 = a4;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  id v11 = pp_xpc_server_log_handle();
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
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = pp_entities_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_entities_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPNamedEntityReadOnlyServer.namedEntityRecordsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v7 = a1[4];
  id v26 = 0;
  v8 = [v6 namedEntityRecordsWithQuery:v7 error:&v26];
  id v9 = v26;

  id v10 = pp_entities_signpost_handle();
  id v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPNamedEntityReadOnlyServer.namedEntityRecordsWithQuery", "", (uint8_t *)&buf, 2u);
  }

  v12 = pp_xpc_server_log_handle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[5] + 8) namedEntityRecordBatch:0 isLast:1 error:v9 queryId:a1[6] completion:&__block_literal_global_140];
  }
  else
  {
    if (v13)
    {
      uint64_t v14 = [v8 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    id v15 = *(void **)(a1[5] + 16);
    v16 = (void *)[[NSString alloc] initWithFormat:@"%@-namedEntityRecordsWithQuery", *(void *)(a1[5] + 24)];
    uint64_t v17 = a1[6];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_144;
    v23[3] = &unk_1E65DA408;
    id v24 = v8;
    p_long long buf = &buf;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_2;
    v20[3] = &unk_1E65DA430;
    uint64_t v18 = a1[6];
    uint64_t v21 = a1[5];
    uint64_t v22 = v18;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_4;
    v19[3] = &unk_1E65DA458;
    v19[4] = v21;
    v19[5] = v18;
    [v15 sendBatchedResultForQueryWithName:v16 queryId:v17 batchGenerator:v23 sendError:v20 sendBatch:v19];

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_144(uint64_t a1, BOOL *a2)
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

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) namedEntityRecordBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_146];
}

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) namedEntityRecordBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)rankedNamedEntitiesWithQuery:(id)a3 queryId:(unint64_t)a4
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
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  unint64_t v17 = a4;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  id v11 = pp_xpc_server_log_handle();
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
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = pp_entities_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_entities_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPNamedEntityReadOnlyServer.rankedNamedEntitiesWithQuery", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalNamedEntityStore defaultStore];
  id v25 = 0;
  uint64_t v7 = [v6 rankedNamedEntitiesWithQuery:a1[4] error:&v25 clientProcessName:*(void *)(a1[5] + 24)];
  id v8 = v25;

  id v9 = pp_entities_signpost_handle();
  id v10 = v9;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v10, OS_SIGNPOST_INTERVAL_END, v3, "PPNamedEntityReadOnlyServer.rankedNamedEntitiesWithQuery", "", (uint8_t *)&buf, 2u);
  }

  id v11 = pp_xpc_server_log_handle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      uint64_t v13 = [v7 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v14 = *(void **)(a1[5] + 16);
    id v15 = (void *)[[NSString alloc] initWithFormat:@"%@-rankedNamedEntitiesWithQuery", *(void *)(a1[5] + 24)];
    uint64_t v16 = a1[6];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_132;
    v22[3] = &unk_1E65DA408;
    id v23 = v7;
    p_long long buf = &buf;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_2;
    v19[3] = &unk_1E65DA430;
    uint64_t v17 = a1[6];
    uint64_t v20 = a1[5];
    uint64_t v21 = v17;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_4;
    v18[3] = &unk_1E65DA458;
    v18[4] = v20;
    v18[5] = v17;
    [v14 sendBatchedResultForQueryWithName:v15 queryId:v16 batchGenerator:v22 sendError:v19 sendBatch:v18];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v12)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[5] + 8) namedEntityBatch:0 isLast:1 error:v8 queryId:a1[6] completion:&__block_literal_global_21270];
  }
}

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_132(uint64_t a1, BOOL *a2)
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

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) namedEntityBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_135_21273];
}

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) namedEntityBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void)unblockPendingQueries
{
}

- (PPNamedEntityReadOnlyServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPNamedEntityReadOnlyServerRequestHandler;
  v2 = [(PPNamedEntityReadOnlyServerRequestHandler *)&v6 init];
  if (v2)
  {
    os_signpost_id_t v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

@end