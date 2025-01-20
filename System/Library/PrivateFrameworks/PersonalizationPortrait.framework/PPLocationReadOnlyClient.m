@interface PPLocationReadOnlyClient
+ (id)sharedInstance;
- (BOOL)locationRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)rankedLocationsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (PPLocationReadOnlyClient)init;
- (id)_remoteObjectProxy;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_unblockPendingQueries;
- (void)locationBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)locationRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPLocationReadOnlyClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PPLocationReadOnlyClient *)self _remoteObjectProxy];
  [v8 registerFeedback:v7 completion:v6];
}

- (BOOL)locationRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E550F4B0;
  v19[4] = self;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E550F4D8;
  id v17 = v9;
  uint64_t v18 = v10;
  v16 = @"locationRecordsWithQuery";
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"locationRecordsWithQuery" error:a4 queryInitializer:v19 handleBatch:v15];

  return (char)a4;
}

void __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 locationRecordsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

void __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)rankedLocationsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E550F4B0;
  v19[4] = self;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E550F4D8;
  id v17 = v9;
  uint64_t v18 = v10;
  v16 = @"rankedLocationsWithQuery";
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedLocationsWithQuery" error:a4 queryInitializer:v19 handleBatch:v15];

  return (char)a4;
}

void __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedLocationsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

void __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (void)locationRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)locationBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)_unblockPendingQueries
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.Location.readOnly"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPLocationReadOnlyClient)init
{
  v28.receiver = self;
  v28.super_class = (Class)PPLocationReadOnlyClient;
  v2 = [(PPLocationReadOnlyClient *)&v28 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7ACA8];
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA75838];
    uint64_t v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_locationBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v9 = (void *)MEMORY[0x192F97350]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    [v4 setClasses:v12 forSelector:sel_locationRecordBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __32__PPLocationReadOnlyClient_init__block_invoke;
    v25[3] = &unk_1E550F488;
    objc_copyWeak(&v26, &location);
    id v13 = (void *)MEMORY[0x192F975A0](v25);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__PPLocationReadOnlyClient_init__block_invoke_74;
    v23[3] = &unk_1E550F488;
    objc_copyWeak(&v24, &location);
    v14 = (void *)MEMORY[0x192F975A0](v23);
    v15 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Location.readOnly" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v13 invalidationHandler:v14];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v15;

    id v17 = [PPXPCClientPipelinedBatchQueryManager alloc];
    uint64_t v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = [(PPXPCClientPipelinedBatchQueryManager *)v17 initWithName:v19];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__PPLocationReadOnlyClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Location.readOnly";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __32__PPLocationReadOnlyClient_init__block_invoke_74(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Location.readOnly";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PPLocationReadOnlyClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8_6598 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken8_6598, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6599;
  return v2;
}

void __42__PPLocationReadOnlyClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6599;
  sharedInstance__pasExprOnceResult_6599 = v1;
}

@end