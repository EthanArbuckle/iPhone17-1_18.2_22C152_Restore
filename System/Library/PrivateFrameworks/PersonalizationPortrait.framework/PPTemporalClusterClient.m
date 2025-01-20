@interface PPTemporalClusterClient
+ (id)sharedInstance;
- (BOOL)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 handleBatch:(id)a6;
- (PPTemporalClusterClient)init;
- (id)_remoteObjectProxy;
- (void)_unblockPendingQueries;
- (void)rankedTemporalClusterBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
@end

@implementation PPTemporalClusterClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)rankedTemporalClusterBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = pp_temporal_clusters_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "rankedTemporalClusterBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"rankedTemporalClusterBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = pp_temporal_clusters_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_DEBUG, "rankedTemporalClustersForStartDate called", buf, 2u);
  }

  uint64_t v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke;
  v25[3] = &unk_1E550F460;
  v25[4] = self;
  id v26 = v10;
  id v27 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E550F4D8;
  id v23 = v12;
  uint64_t v24 = v14;
  v22 = @"rankedTemporalClustersForStartDate";
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  BOOL v19 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedTemporalClustersForStartDate" error:a5 queryInitializer:v25 handleBatch:v21];

  return v19;
}

void __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedTemporalClustersForStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) queryId:a2];
}

void __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (void)_unblockPendingQueries
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.TemporalCluster"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPTemporalClusterClient)init
{
  v30.receiver = self;
  v30.super_class = (Class)PPTemporalClusterClient;
  v2 = [(PPTemporalClusterClient *)&v30 init];
  if (v2)
  {
    uint64_t v24 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AC48];
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA75720];
    context = (void *)MEMORY[0x192F97350]();
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    id v11 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v22, objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_rankedTemporalClusterBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __31__PPTemporalClusterClient_init__block_invoke;
    v27[3] = &unk_1E550F488;
    objc_copyWeak(&v28, &location);
    id v12 = (void *)MEMORY[0x192F975A0](v27);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __31__PPTemporalClusterClient_init__block_invoke_71;
    v25[3] = &unk_1E550F488;
    objc_copyWeak(&v26, &location);
    id v13 = (void *)MEMORY[0x192F975A0](v25);
    uint64_t v14 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.TemporalCluster" allowedServerInterface:v24 allowedClientInterface:v3 clientExportedObject:v2 interruptionHandler:v12 invalidationHandler:v13];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v14;

    id v16 = [PPXPCClientPipelinedBatchQueryManager alloc];
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = [(PPXPCClientPipelinedBatchQueryManager *)v16 initWithName:v18];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v19;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__PPTemporalClusterClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_temporal_clusters_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.TemporalCluster";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __31__PPTemporalClusterClient_init__block_invoke_71(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_temporal_clusters_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.TemporalCluster";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PPTemporalClusterClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_6525 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_6525, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6526;
  return v2;
}

void __41__PPTemporalClusterClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6526;
  sharedInstance__pasExprOnceResult_6526 = v1;
}

@end