@interface PPEventServerRequestHandler
- (NSString)clientProcessName;
- (PPEventServerRequestHandler)init;
- (void)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 queryId:(unint64_t)a6;
- (void)eventNameRecordsForClient:(id)a3 queryId:(unint64_t)a4;
- (void)interactionSummaryMetricsWithQueryId:(unint64_t)a3;
- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)resolveEventNameRecordChanges:(id)a3 client:(id)a4 queryId:(unint64_t)a5;
- (void)scoredEventsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)sendRTCLogsWithWithCompletion:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPEventServerRequestHandler

void __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[PPLocalEventStore defaultStore];
  v3 = [v2 scoredEventsWithQuery:a1[4]];

  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v3 count];
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPScoredEvents from PPEventStore: %lu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v5 = a1[6];
  v6 = *(void **)(a1[5] + 16);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_98;
  v13[3] = &unk_1E65DA408;
  id v7 = v3;
  id v14 = v7;
  p_long long buf = &buf;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_2;
  v10[3] = &unk_1E65DA430;
  uint64_t v8 = a1[6];
  uint64_t v11 = a1[5];
  uint64_t v12 = v8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_4;
  v9[3] = &unk_1E65DA458;
  v9[4] = v11;
  v9[5] = v8;
  [v6 sendBatchedResultForQueryWithName:@"scoredEvents" queryId:v5 batchGenerator:v13 sendError:v10 sendBatch:v9];

  _Block_object_dispose(&buf, 8);
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void)setClientProcessName:(id)a3
{
}

- (PPEventServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPEventServerRequestHandler;
  v2 = [(PPEventServerRequestHandler *)&v6 init];
  if (v2)
  {
    v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

- (void)scoredEventsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v15 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: scoredEvents queryId: %llu", buf, 0xCu);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  id v11 = v6;
  uint64_t v12 = self;
  unint64_t v13 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventHighlightsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

void __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = pp_events_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_events_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.eventHighlights", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalEventStore defaultStore];
  id v7 = [v6 eventHighlightsFrom:*(void *)(a1 + 32) to:*(void *)(a1 + 40) options:*(unsigned int *)(a1 + 64)];

  uint64_t v8 = pp_events_signpost_handle();
  id v9 = v8;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v9, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.eventHighlights", "", (uint8_t *)&buf, 2u);
  }

  v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v7 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPEventHighlights from PPEventStore: %lu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void **)(*(void *)(a1 + 48) + 16);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_91;
  v20[3] = &unk_1E65DA408;
  id v13 = v7;
  id v21 = v13;
  p_long long buf = &buf;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2_92;
  v17[3] = &unk_1E65DA430;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = v14;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_4;
  v16[3] = &unk_1E65DA458;
  v16[4] = v18;
  v16[5] = v14;
  [v12 sendBatchedResultForQueryWithName:@"eventHighlights" queryId:v11 batchGenerator:v20 sendError:v17 sendBatch:v16];

  _Block_object_dispose(&buf, 8);
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_91(uint64_t a1, BOOL *a2)
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

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) scoredEventsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_98(uint64_t a1, BOOL *a2)
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

- (void)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 queryId:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2048;
    unint64_t v29 = a6;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: enqueue eventHighlightsFrom:%@ to:%@ queryId:%llu", buf, 0x20u);
  }

  if (eventHighlightsFrom_to_options_queryId___pasOnceToken17 != -1) {
    dispatch_once(&eventHighlightsFrom_to_options_queryId___pasOnceToken17, &__block_literal_global_86_19974);
  }
  id v13 = (void *)eventHighlightsFrom_to_options_queryId___pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2;
  block[3] = &unk_1E65D9C58;
  id v19 = v10;
  id v20 = v11;
  int v23 = a5;
  id v21 = self;
  unint64_t v22 = a6;
  id v14 = v11;
  id v15 = v10;
  uint64_t v16 = v13;
  dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(PPXPCServerPipelinedBatchQueryManager *)self->_queryManager waitForBlockWithRequestThrottle:v17];
  dispatch_async(v16, v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
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
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: registerFeedback", v9, 2u);
  }

  uint64_t v8 = +[PPLocalEventStore defaultStore];
  [v8 registerFeedback:v6 completion:v5];
}

- (void)sendRTCLogsWithWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPEventServer: sendRTCLogs", buf, 2u);
  }

  id v5 = +[PPEventMetricsLogger defaultLogger];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PPEventServerRequestHandler_sendRTCLogsWithWithCompletion___block_invoke;
  v7[3] = &unk_1E65D9C80;
  id v8 = 0;
  id v9 = v3;
  id v6 = v3;
  [v5 sendRTCLogsWithCompletion:v7];
}

uint64_t __61__PPEventServerRequestHandler_sendRTCLogsWithWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_ERROR, "sendRTCLogsWithCompletion unexpectedly failed: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)interactionSummaryMetricsWithQueryId:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPEventServer: interactionSummaryMetrics queryId: %llu", buf, 0xCu);
  }

  queryManager = self->_queryManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke;
  v7[3] = &unk_1E65DA8A8;
  void v7[4] = self;
  v7[5] = a3;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v7];
}

void __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke(uint64_t a1)
{
  v2 = +[PPEventMetricsLogger defaultLogger];
  id v3 = [v2 loggedInteractionsSummaryMetrics];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_2;
  v12[3] = &unk_1E65DA408;
  id v6 = v3;
  id v13 = v6;
  id v14 = v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_3;
  v9[3] = &unk_1E65DA430;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = v7;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_5;
  v8[3] = &unk_1E65DA458;
  v8[4] = v10;
  v8[5] = v7;
  [v5 sendBatchedResultForQueryWithName:@"interactionSummaryMetrics" queryId:v4 batchGenerator:v12 sendError:v9 sendBatch:v8];

  _Block_object_dispose(v15, 8);
}

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) interactionSummaryMetricsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_106_19965];
}

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) interactionSummaryMetricsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPEventServer: logEventInteractionForEventWithEventIdentifier", v10, 2u);
  }

  unint64_t v9 = +[PPEventMetricsLogger defaultLogger];
  [v9 logEventInteractionForEventWithEventIdentifier:v7 interface:v6 actionType:v5];
}

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) scoredEventsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_100];
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2_92(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventHighlightsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_94];
}

void __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  dispatch_workloop_t v1 = dispatch_workloop_create("eventHighlightsFromTo");
  v2 = (void *)eventHighlightsFrom_to_options_queryId___pasExprOnceResult;
  eventHighlightsFrom_to_options_queryId___pasExprOnceResult = (uint64_t)v1;
}

- (void)resolveEventNameRecordChanges:(id)a3 client:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPEventServer: eventNameRecordChangesForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke;
  v14[3] = &unk_1E65DB3B0;
  id v15 = v8;
  id v16 = v9;
  dispatch_block_t v17 = self;
  unint64_t v18 = a5;
  id v12 = v9;
  id v13 = v8;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
}

void __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke(void *a1)
{
  v2 = pp_events_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_events_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.resolveEventNameRecordChanges", "", buf, 2u);
  }

  uint64_t v6 = +[PPLocalEventStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v28 = 0;
  id v9 = [v6 resolveEventNameRecordChanges:v7 client:v8 error:&v28];
  id v10 = v28;

  uint64_t v11 = pp_events_signpost_handle();
  id v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.resolveEventNameRecordChanges", "", buf, 2u);
  }

  if (v10)
  {
    [*(id *)(a1[6] + 8) eventNameRecordChangesBatch:0 isLast:1 error:v10 queryId:a1[7] completion:&__block_literal_global_79_19990];
  }
  else
  {
    *(void *)long long buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    id v13 = *(void **)(a1[6] + 16);
    id v14 = (void *)[[NSString alloc] initWithFormat:@"%@-eventNameRecordChangesForClient", a1[5]];
    uint64_t v15 = a1[7];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_2;
    v21[3] = &unk_1E65DA408;
    id v22 = v9;
    uint64_t v23 = buf;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_3;
    v18[3] = &unk_1E65DA430;
    uint64_t v16 = a1[7];
    uint64_t v19 = a1[6];
    uint64_t v20 = v16;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_5;
    v17[3] = &unk_1E65DA458;
    void v17[4] = v19;
    v17[5] = v16;
    [v13 sendBatchedResultForQueryWithName:v14 queryId:v15 batchGenerator:v21 sendError:v18 sendBatch:v17];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventNameRecordChangesBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_84];
}

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventNameRecordChangesBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)eventNameRecordsForClient:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: eventNameRecordsForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  id v11 = v6;
  id v12 = self;
  unint64_t v13 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

void __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke(void *a1)
{
  v2 = pp_events_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_events_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.eventNameRecordsForClient", "", buf, 2u);
  }

  id v6 = +[PPLocalEventStore defaultStore];
  uint64_t v7 = a1[4];
  id v27 = 0;
  uint64_t v8 = [v6 eventNameRecordsForClient:v7 error:&v27];
  id v9 = v27;

  id v10 = pp_events_signpost_handle();
  id v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.eventNameRecordsForClient", "", buf, 2u);
  }

  if (v9)
  {
    [*(id *)(a1[5] + 8) eventNameRecordBatch:0 isLast:1 error:v9 queryId:a1[6] completion:&__block_literal_global_20001];
  }
  else
  {
    *(void *)long long buf = 0;
    uint64_t v24 = buf;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    id v12 = *(void **)(a1[5] + 16);
    unint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@-eventNameRecordsForClient", a1[4]];
    uint64_t v14 = a1[6];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_2;
    v20[3] = &unk_1E65DA408;
    id v21 = v8;
    id v22 = buf;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_3;
    v17[3] = &unk_1E65DA430;
    uint64_t v15 = a1[6];
    uint64_t v18 = a1[5];
    uint64_t v19 = v15;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_5;
    v16[3] = &unk_1E65DA458;
    v16[4] = v18;
    v16[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v20 sendError:v17 sendBatch:v16];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventNameRecordBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_73];
}

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) eventNameRecordBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)unblockPendingQueries
{
}

@end