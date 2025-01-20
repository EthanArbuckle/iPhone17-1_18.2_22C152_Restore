@interface PPContactClient
+ (id)sharedInstance;
- (BOOL)contactHandlesForSource:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)contactHandlesForTopics:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)contactNameRecordChangesForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)contactNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)rankedContactsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (PPContactClient)init;
- (id)_remoteObjectProxy;
- (void)_unblockPendingQueries;
- (void)contactHandlesForSourceBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)contactHandlesForTopicsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)contactNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)contactNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4;
- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5;
- (void)rankedContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)upcomingRelevantContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
@end

@implementation PPContactClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)contactNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"contactNameRecordChangesBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)contactNameRecordChangesForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesForClient:%@ called", buf, 0xCu);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"contactNameRecordChangesForClient";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"contactNameRecordChangesForClient" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 contactNameRecordChangesForClient:*(void *)(a1 + 40) queryId:a2];
}

void __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_debug_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesForClient:%@ called", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(PPContactClient *)self _remoteObjectProxy];
  [v9 contactNameRecordChangesForClient:v6 completion:v7];
}

- (void)contactNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "contactNameRecordBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"contactNameRecordBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)contactNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "contactNameRecordsForClient:%@ called", buf, 0xCu);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"contactNameRecordsWithError";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"contactNameRecordsWithError" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 contactNameRecordsForClient:*(void *)(a1 + 40) queryId:a2];
}

void __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)upcomingRelevantContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "upcomingRelevantContactsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"upcomingRelevantContactsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "upcomingRelevantContactsForQuery called", buf, 2u);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"upcomingRelevantContactsForQuery";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"upcomingRelevantContactsForQuery" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 upcomingRelevantContactsForQuery:*(void *)(a1 + 40) queryId:a2];
}

void __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v13 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_DEBUG, "feedbackDisambiguationResultWithContactChoices called", v13, 2u);
  }

  id v12 = [(PPContactClient *)self _remoteObjectProxy];
  [v12 feedbackDisambiguationResultWithChoicesIdentifiers:v10 chosenContactIdentifier:v9 completion:v8];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    int v12 = 138412290;
    id v13 = v11;
    _os_log_debug_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [(PPContactClient *)self _remoteObjectProxy];
  [v10 registerFeedback:v8 completion:v7];
}

- (void)contactHandlesForSourceBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "contactHandlesForSourceBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"contactHandlesForSourceBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (void)contactHandlesForTopicsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "contactHandlesForTopicsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"contactHandlesForTopicsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (void)rankedContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "rankedContactsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"rankedContactsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

- (BOOL)contactHandlesForSource:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "contactHandlesForSource called", buf, 2u);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"contactHandlesForSource";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"contactHandlesForSource" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 contactHandlesForSource:*(void *)(a1 + 40) queryId:a2];
}

void __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)contactHandlesForTopics:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "contactHandlesForTopics called", buf, 2u);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"contactHandlesForTopics";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"contactHandlesForTopics" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 contactHandlesForTopics:*(void *)(a1 + 40) queryId:a2];
}

void __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)rankedContactsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "rankedContactsWithQuery called", buf, 2u);
  }

  uint64_t v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E550F4B0;
  v21[4] = self;
  id v22 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E550F4D8;
  id v19 = v9;
  uint64_t v20 = v11;
  v18 = @"rankedContactsWithQuery";
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedContactsWithQuery" error:a4 queryInitializer:v21 handleBatch:v17];

  return v15;
}

void __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedContactsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

void __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
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
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.Contact"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPContactClient)init
{
  v36.receiver = self;
  v36.super_class = (Class)PPContactClient;
  v2 = [(PPContactClient *)&v36 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AAC8];
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA74190];
    uint64_t v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_rankedContactsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v9 = (void *)MEMORY[0x192F97350]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    [v4 setClasses:v12 forSelector:sel_upcomingRelevantContactsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v13 = (void *)MEMORY[0x192F97350]();
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    [v4 setClasses:v16 forSelector:sel_contactNameRecordBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    v17 = (void *)MEMORY[0x192F97350]();
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    [v4 setClasses:v20 forSelector:sel_contactNameRecordChangesBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __23__PPContactClient_init__block_invoke;
    v33[3] = &unk_1E550F488;
    objc_copyWeak(&v34, &location);
    v21 = (void *)MEMORY[0x192F975A0](v33);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __23__PPContactClient_init__block_invoke_94;
    v31[3] = &unk_1E550F488;
    objc_copyWeak(&v32, &location);
    id v22 = (void *)MEMORY[0x192F975A0](v31);
    v23 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Contact" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v21 invalidationHandler:v22];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v23;

    uint64_t v25 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    uint64_t v28 = [(PPXPCClientPipelinedBatchQueryManager *)v25 initWithName:v27];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v28;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __23__PPContactClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Contact";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __23__PPContactClient_init__block_invoke_94(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Contact";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PPContactClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12_5130 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken12_5130, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5131;
  return v2;
}

void __33__PPContactClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5131;
  sharedInstance__pasExprOnceResult_5131 = v1;
}

@end