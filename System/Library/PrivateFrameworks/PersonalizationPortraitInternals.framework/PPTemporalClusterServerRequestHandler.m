@interface PPTemporalClusterServerRequestHandler
- (NSString)clientProcessName;
- (PPTemporalClusterServerRequestHandler)init;
- (void)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 queryId:(unint64_t)a5;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPTemporalClusterServerRequestHandler

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

- (void)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    unint64_t v24 = a5;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPTemporalClusterServer: rankedTemporalClustersForStartDate: %@ endDate: %@ queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke;
  v14[3] = &unk_1E65DB3B0;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  unint64_t v18 = a5;
  id v12 = v9;
  id v13 = v8;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
}

void __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke(void *a1)
{
  v2 = pp_temporal_clusters_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_temporal_clusters_signpost_handle();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTemporalClusterServer.rankedTemporalClustersForStartDate", "", buf, 2u);
  }

  v6 = +[PPLocalTemporalClusterStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v27 = 0;
  id v9 = [v6 rankedTemporalClusterForStartDate:v7 endDate:v8 error:&v27];
  id v10 = v27;

  v11 = pp_temporal_clusters_signpost_handle();
  id v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTemporalClusterServer.rankedTemporalClustersForStartDate", "", buf, 2u);
  }

  if (v10)
  {
    [*(id *)(a1[6] + 8) rankedTemporalClusterBatch:0 isLast:1 error:v10 queryId:a1[7] completion:&__block_literal_global_14245];
  }
  else
  {
    *(void *)buf = 0;
    unint64_t v24 = buf;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v13 = a1[7];
    v14 = *(void **)(a1[6] + 16);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_2;
    v20[3] = &unk_1E65DA408;
    id v21 = v9;
    id v22 = buf;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_3;
    v17[3] = &unk_1E65DA430;
    uint64_t v15 = a1[7];
    uint64_t v18 = a1[6];
    uint64_t v19 = v15;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_5;
    v16[3] = &unk_1E65DA458;
    v16[4] = v18;
    v16[5] = v15;
    [v14 sendBatchedResultForQueryWithName:@"rankedTemporalClustersForStartDate" queryId:v13 batchGenerator:v20 sendError:v17 sendBatch:v16];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 5) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 6;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedTemporalClusterBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_63_14249];
}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedTemporalClusterBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)unblockPendingQueries
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (PPTemporalClusterServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPTemporalClusterServerRequestHandler;
  v2 = [(PPTemporalClusterServerRequestHandler *)&v6 init];
  if (v2)
  {
    os_signpost_id_t v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

@end