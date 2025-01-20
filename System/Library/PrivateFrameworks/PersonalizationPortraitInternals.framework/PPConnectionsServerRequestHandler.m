@interface PPConnectionsServerRequestHandler
- (NSString)clientProcessName;
- (PPConnectionsServerRequestHandler)init;
- (void)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 queryId:(unint64_t)a5;
- (void)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 queryId:(unint64_t)a8;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPConnectionsServerRequestHandler

- (void)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 queryId:(unint64_t)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v17 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2048;
    unint64_t v35 = a5;
    _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: recentLocationsForConsumer: %lu criteria: %@ limit: %lu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke;
  v22[3] = &unk_1E65D89B0;
  unint64_t v27 = a3;
  unint64_t v28 = a5;
  id v23 = v14;
  id v24 = v15;
  unint64_t v29 = a8;
  v25 = self;
  id v26 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v22];
}

void __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke(void *a1)
{
  v2 = pp_connections_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_connections_signpost_handle();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsServer.recentLocationsForConsumer", "", buf, 2u);
  }

  v6 = +[PPLocalConnectionsStore defaultStore];
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[9];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  id v30 = 0;
  v11 = [v6 recentLocationsForConsumer:v7 criteria:v9 limit:v8 explanationSet:v10 timeout:3000000000 error:&v30];
  id v12 = v30;

  v13 = pp_connections_signpost_handle();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsServer.recentLocationsForConsumer", "", buf, 2u);
  }

  if (v11)
  {
    *(void *)buf = 0;
    unint64_t v27 = buf;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    id v15 = *(void **)(a1[6] + 16);
    id v16 = (void *)[[NSString alloc] initWithFormat:@"%@-recentLocationsForConsumer", a1[7]];
    uint64_t v17 = a1[10];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_2;
    v23[3] = &unk_1E65DA408;
    id v24 = v11;
    v25 = buf;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_3;
    v20[3] = &unk_1E65DA430;
    uint64_t v18 = a1[10];
    uint64_t v21 = a1[6];
    uint64_t v22 = v18;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_5;
    v19[3] = &unk_1E65DA458;
    v19[4] = v21;
    v19[5] = v18;
    [v15 sendBatchedResultForQueryWithName:v16 queryId:v17 batchGenerator:v23 sendError:v20 sendBatch:v19];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [*(id *)(a1[6] + 8) recentLocationsBatch:0 isLast:1 error:v12 queryId:a1[10] completion:&__block_literal_global_70];
  }
}

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) recentLocationsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
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
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: registerFeedback", buf, 2u);
  }

  uint64_t v8 = +[PPLocalConnectionsStore defaultStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPConnectionsServerRequestHandler_registerFeedback_completion___block_invoke;
  v10[3] = &unk_1E65DA480;
  id v11 = v5;
  id v9 = v5;
  [v8 registerFeedback:v6 completion:v10];
}

uint64_t __65__PPConnectionsServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) recentLocationsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_75_16511];
}

- (void)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    unint64_t v24 = a5;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: recentLocationDonationsSinceDate: %@ client: %@ queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke;
  v14[3] = &unk_1E65DB3B0;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  unint64_t v18 = a5;
  id v12 = v9;
  id v13 = v8;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
}

void __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke(void *a1)
{
  v2 = pp_connections_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_connections_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsServer.recentLocationDonationsSinceDate", "", buf, 2u);
  }

  id v6 = +[PPLocalConnectionsStore defaultStore];
  uint64_t v7 = a1[4];
  id v27 = 0;
  id v8 = [v6 recentLocationDonationsSinceDate:v7 error:&v27];
  id v9 = v27;

  uint64_t v10 = pp_connections_signpost_handle();
  id v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsServer.recentLocationDonationsSinceDate", "", buf, 2u);
  }

  if (v8)
  {
    *(void *)buf = 0;
    unint64_t v24 = buf;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    id v12 = *(void **)(a1[5] + 16);
    id v13 = (void *)[[NSString alloc] initWithFormat:@"%@-recentLocationDonationsSinceDate", a1[6]];
    uint64_t v14 = a1[7];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_2;
    v20[3] = &unk_1E65DA408;
    id v21 = v8;
    id v22 = buf;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_3;
    v17[3] = &unk_1E65DA430;
    uint64_t v15 = a1[7];
    uint64_t v18 = a1[5];
    uint64_t v19 = v15;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_5;
    v16[3] = &unk_1E65DA458;
    v16[4] = v18;
    v16[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v20 sendError:v17 sendBatch:v16];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [*(id *)(a1[5] + 8) recentLocationsBatch:0 isLast:1 error:v9 queryId:a1[7] completion:&__block_literal_global_16520];
  }
}

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) recentLocationsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_64_16522];
}

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) recentLocationsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)unblockPendingQueries
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (PPConnectionsServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsServerRequestHandler;
  v2 = [(PPConnectionsServerRequestHandler *)&v6 init];
  if (v2)
  {
    os_signpost_id_t v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

@end