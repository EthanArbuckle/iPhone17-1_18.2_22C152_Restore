@interface PPConnectionsClient
+ (id)sharedInstance;
- (BOOL)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6;
- (BOOL)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 handleBatch:(id)a9;
- (PPConnectionsClient)init;
- (id)_remoteObjectProxy;
- (void)_unblockPendingQueries;
- (void)recentLocationsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPConnectionsClient

void __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 recentLocationsForConsumer:*(void *)(a1 + 64) criteria:*(void *)(a1 + 40) limit:*(void *)(a1 + 72) explanationSet:*(void *)(a1 + 48) client:*(void *)(a1 + 56) queryId:a2];
}

void __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)recentLocationsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "recentLocationsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"recentLocationsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (BOOL)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 handleBatch:(id)a9
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  v19 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v39 = a3;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2048;
    unint64_t v43 = a5;
    _os_log_debug_impl(&dword_18CAA6000, v19, OS_LOG_TYPE_DEBUG, "recentLocationsForConsumer: %lu criteria: %@ limit: %lu called", buf, 0x20u);
  }

  uint64_t v20 = objc_opt_class();
  queryManager = self->_queryManager;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke;
  v32[3] = &unk_1E550EA18;
  v32[4] = self;
  id v33 = v15;
  unint64_t v36 = a3;
  unint64_t v37 = a5;
  id v34 = v16;
  id v35 = v17;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke_2;
  v28[3] = &unk_1E550F4D8;
  id v30 = v18;
  uint64_t v31 = v20;
  v29 = @"recentLocationsForConsumer";
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  BOOL v26 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"recentLocationsForConsumer" error:a8 queryInitializer:v32 handleBatch:v28];

  return v26;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PPConnectionsClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_5200 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_5200, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5201;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PPConnectionsClient *)self _remoteObjectProxy];
  [v8 registerFeedback:v7 completion:v6];
}

- (BOOL)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_debug_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_DEBUG, "recentLocationDonationsSinceDate: %@ client: %@ called", buf, 0x16u);
  }

  uint64_t v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke;
  v25[3] = &unk_1E550F460;
  v25[4] = self;
  id v26 = v10;
  id v27 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E550F4D8;
  id v23 = v12;
  uint64_t v24 = v14;
  id v22 = @"recentLocationDonationsSinceDate";
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  BOOL v19 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"recentLocationDonationsSinceDate" error:a5 queryInitializer:v25 handleBatch:v21];

  return v19;
}

void __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 recentLocationDonationsSinceDate:*(void *)(a1 + 40) client:*(void *)(a1 + 48) queryId:a2];
}

void __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)_unblockPendingQueries
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.Connections"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPConnectionsClient)init
{
  v24.receiver = self;
  v24.super_class = (Class)PPConnectionsClient;
  v2 = [(PPConnectionsClient *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AB28];
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA743F0];
    uint64_t v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_recentLocationsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __27__PPConnectionsClient_init__block_invoke;
    v21[3] = &unk_1E550F488;
    objc_copyWeak(&v22, &location);
    BOOL v9 = (void *)MEMORY[0x192F975A0](v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __27__PPConnectionsClient_init__block_invoke_73;
    v19[3] = &unk_1E550F488;
    objc_copyWeak(&v20, &location);
    id v10 = (void *)MEMORY[0x192F975A0](v19);
    id v11 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Connections" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v9 invalidationHandler:v10];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v11;

    id v13 = [PPXPCClientPipelinedBatchQueryManager alloc];
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    uint64_t v16 = [(PPXPCClientPipelinedBatchQueryManager *)v13 initWithName:v15];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__PPConnectionsClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Connections";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __27__PPConnectionsClient_init__block_invoke_73(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Connections";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __37__PPConnectionsClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5201;
  sharedInstance__pasExprOnceResult_5201 = v1;
}

@end