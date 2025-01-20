@interface PPEventClient
+ (id)sharedInstance;
- (BOOL)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 handleBatch:(id)a7;
- (BOOL)eventNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)interactionSummaryMetricsWithError:(id *)a3 handleBatch:(id)a4;
- (BOOL)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6;
- (BOOL)scoredEventsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)sendRTCLogsWithError:(id *)a3;
- (PPEventClient)init;
- (id)_remoteObjectProxy;
- (void)_unblockPendingQueries;
- (void)eventHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)eventNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)eventNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)interactionSummaryMetricsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)scoredEventsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
@end

@implementation PPEventClient

- (PPEventClient)init
{
  v40.receiver = self;
  v40.super_class = (Class)PPEventClient;
  v2 = [(PPEventClient *)&v40 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7A8E8];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA6DD20];
    v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_eventNameRecordBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    v9 = (void *)MEMORY[0x192F97350]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    [v4 setClasses:v12 forSelector:sel_eventNameRecordChangesBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    v13 = (void *)MEMORY[0x192F97350]();
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
    [v4 setClasses:v17 forSelector:sel_eventHighlightsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    v18 = (void *)MEMORY[0x192F97350]();
    id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v19, "initWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    [v4 setClasses:v24 forSelector:sel_scoredEventsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __21__PPEventClient_init__block_invoke;
    v37[3] = &unk_1E550F488;
    objc_copyWeak(&v38, &location);
    v25 = (void *)MEMORY[0x192F975A0](v37);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __21__PPEventClient_init__block_invoke_102;
    v35[3] = &unk_1E550F488;
    objc_copyWeak(&v36, &location);
    v26 = (void *)MEMORY[0x192F975A0](v35);
    v27 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Event" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v25 invalidationHandler:v26];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v27;

    v29 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    uint64_t v32 = [(PPXPCClientPipelinedBatchQueryManager *)v29 initWithName:v31];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v32;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 scoredEventsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

void __31__PPEventClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_433;
  sharedInstance__pasExprOnceResult_433 = v1;
}

- (BOOL)scoredEventsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "scoredEvents called", buf, 2u);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"scoredEvents";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"scoredEvents" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PPEventClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken12, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_433;
  return v2;
}

void __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

void __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 eventHighlightsFrom:*(void *)(a1 + 40) to:*(void *)(a1 + 48) options:*(unsigned int *)(a1 + 56) queryId:a2];
}

void __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)scoredEventsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "suggestedEventsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"scoredEventsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "eventHighlights called", buf, 2u);
  }

  uint64_t v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke;
  v27[3] = &unk_1E550DB90;
  v27[4] = self;
  id v28 = v12;
  id v29 = v13;
  int v30 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E550F4D8;
  id v25 = v14;
  uint64_t v26 = v16;
  v24 = @"eventHighlights";
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  BOOL v21 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"eventHighlights" error:a6 queryInitializer:v27 handleBatch:v23];

  return v21;
}

- (void)eventHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "eventHighlightsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"eventHighlightsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
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
  id v8 = [(PPEventClient *)self _remoteObjectProxy];
  [v8 registerFeedback:v7 completion:v6];
}

- (BOOL)sendRTCLogsWithError:(id *)a3
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__401;
  uint64_t v26 = __Block_byref_object_dispose__402;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__PPEventClient_sendRTCLogsWithError___block_invoke;
  v21[3] = &unk_1E550F638;
  v21[4] = &v22;
  id v5 = (void *)MEMORY[0x192F975A0](v21, a2);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__401;
  BOOL v15 = __Block_byref_object_dispose__402;
  id v16 = 0;
  id v6 = [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PPEventClient_sendRTCLogsWithError___block_invoke_2;
  v10[3] = &unk_1E550F660;
  v10[4] = &v17;
  v10[5] = &v11;
  [v6 sendRTCLogsWithWithCompletion:v10];

  id v7 = (void *)v23[5];
  if (v7)
  {
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3)
  {
    id v7 = (void *)v12[5];
LABEL_6:
    *a3 = v7;
  }
LABEL_7:
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

void __38__PPEventClient_sendRTCLogsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __38__PPEventClient_sendRTCLogsWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)interactionSummaryMetricsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "interactionSummaryMetrics batch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"interactionSummaryMetricsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)interactionSummaryMetricsWithError:(id *)a3 handleBatch:(id)a4
{
  id v6 = a4;
  id v7 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "interactionSummaryMetricsWithError called", buf, 2u);
  }

  uint64_t v8 = objc_opt_class();
  queryManager = self->_queryManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke;
  v17[3] = &unk_1E550DBB8;
  void v17[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke_2;
  v13[3] = &unk_1E550F4D8;
  id v15 = v6;
  uint64_t v16 = v8;
  id v14 = @"interactionSummaryMetrics";
  id v10 = v6;
  BOOL v11 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"interactionSummaryMetrics" error:a3 queryInitializer:v17 handleBatch:v13];

  return v11;
}

void __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v3 interactionSummaryMetricsWithQueryId:a2];
}

void __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [(PPEventClient *)self _remoteObjectProxy];
  [v9 logEventInteractionForEventWithEventIdentifier:v8 interface:v6 actionType:v5];
}

- (void)eventNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "eventNameRecordChangesBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"eventNameRecordChangesBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    _os_log_debug_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_DEBUG, "eventNameRecordChangesForClient:%@ called", buf, 0xCu);
  }

  uint64_t v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke;
  v25[3] = &unk_1E550F460;
  v25[4] = self;
  id v26 = v10;
  id v27 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E550F4D8;
  id v23 = v12;
  uint64_t v24 = v14;
  uint64_t v22 = @"eventNameRecordChangesWithError";
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  BOOL v19 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"eventNameRecordChangesWithError" error:a5 queryInitializer:v25 handleBatch:v21];

  return v19;
}

void __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 resolveEventNameRecordChanges:*(void *)(a1 + 40) client:*(void *)(a1 + 48) queryId:a2];
}

void __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)eventNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "eventNameRecordBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"eventNameRecordBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)eventNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "eventNameRecordsForClient:%@ called", buf, 0xCu);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  void v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  id v18 = @"eventNameRecordsWithError";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"eventNameRecordsWithError" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 eventNameRecordsForClient:*(void *)(a1 + 40) queryId:a2];
}

void __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke_2(void *a1, void *a2)
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
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.Event"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

void __21__PPEventClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Event";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __21__PPEventClient_init__block_invoke_102(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Event";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

@end