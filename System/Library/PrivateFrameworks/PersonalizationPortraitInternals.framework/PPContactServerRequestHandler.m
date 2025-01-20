@interface PPContactServerRequestHandler
- (NSString)clientProcessName;
- (PPContactServerRequestHandler)init;
- (PPContactServerRequestHandler)initWithStore:(id)a3;
- (void)contactHandlesForSource:(id)a3 queryId:(unint64_t)a4;
- (void)contactHandlesForTopics:(id)a3 queryId:(unint64_t)a4;
- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4;
- (void)contactNameRecordChangesForClient:(id)a3 queryId:(unint64_t)a4;
- (void)contactNameRecordsForClient:(id)a3 queryId:(unint64_t)a4;
- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5;
- (void)rankedContactsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setClientProcessName:(id)a3;
- (void)setIsTerminated;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
- (void)upcomingRelevantContactsForQuery:(id)a3 queryId:(unint64_t)a4;
@end

@implementation PPContactServerRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_store, 0);
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

- (void)contactNameRecordChangesForClient:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordChangesForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

void __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke(void *a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_contacts_signpost_handle();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactNameRecordChangesForClient", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  id v32 = 0;
  v8 = [v7 contactNameRecordChangesForClient:v6 error:&v32];
  id v9 = v32;
  v10 = pp_contacts_signpost_handle();
  id v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactNameRecordChangesForClient", "", buf, 2u);
  }

  if (v8)
  {
    v33 = v8;
    unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v13 = *(void **)(a1[4] + 16);
    id v14 = (void *)[[NSString alloc] initWithFormat:@"%@-contactNameRecordChangesForClient", a1[5]];
    uint64_t v15 = a1[6];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_2;
    v25[3] = &unk_1E65DA408;
    id v16 = v12;
    id v26 = v16;
    v27 = buf;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_3;
    v22[3] = &unk_1E65DA430;
    uint64_t v17 = a1[6];
    uint64_t v23 = a1[4];
    uint64_t v24 = v17;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_5;
    v21[3] = &unk_1E65DA458;
    v21[4] = v23;
    v21[5] = v17;
    [v13 sendBatchedResultForQueryWithName:v14 queryId:v15 batchGenerator:v25 sendError:v22 sendBatch:v21];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    v34 = @"PPServerSideErrorInfoKey";
    v19 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
    v35[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v16 = (id)[v18 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v20];

    [*(id *)(a1[4] + 8) contactNameRecordChangesBatch:0 isLast:1 error:v16 queryId:a1[6] completion:&__block_literal_global_138_16875];
  }
}

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactNameRecordChangesBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_144_16878];
}

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactNameRecordChangesBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  v8 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordChangesForClient: %@", buf, 0xCu);
  }

  id v9 = pp_contacts_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = pp_contacts_signpost_handle();
  unint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPContactServer.contactNameRecordChangesForClient", "", buf, 2u);
  }

  store = self->_store;
  id v22 = 0;
  id v14 = [(PPLocalContactStore *)store contactNameRecordChangesForClient:v6 error:&v22];
  id v15 = v22;
  id v16 = pp_contacts_signpost_handle();
  uint64_t v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPContactServer.contactNameRecordChangesForClient", "", buf, 2u);
  }

  if (v14)
  {
    v7[2](v7, v14, 0);
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = @"PPServerSideErrorInfoKey";
    v19 = (void *)[[NSString alloc] initWithFormat:@"%@", v15];
    uint64_t v24 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v21 = (void *)[v18 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v20];

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v21);
  }
}

- (void)contactNameRecordsForClient:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordsForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke(void *a1)
{
  v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactNameRecordsForClient", "", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(50);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_115;
  aBlock[3] = &unk_1E65DC568;
  v8 = v6;
  v43 = v8;
  id v9 = v7;
  v44 = v9;
  os_signpost_id_t v10 = _Block_copy(aBlock);
  id v11 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPContactServer.contactNameRecordsForClient"];
  id v12 = objc_alloc(MEMORY[0x1E4F93B70]);
  v13 = objc_opt_new();
  id v14 = (void *)[v12 initWithGuardedData:v13];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_2;
  block[3] = &unk_1E65D8A80;
  __int16 v15 = (void *)a1[5];
  block[4] = a1[4];
  id v36 = v15;
  id v16 = v10;
  id v40 = v16;
  uint64_t v17 = v9;
  v37 = v17;
  id v18 = v14;
  id v38 = v18;
  v19 = v8;
  v39 = v19;
  os_signpost_id_t v41 = v3;
  dispatch_async(v11, block);
  v20 = *(void **)(a1[4] + 16);
  v21 = (void *)[[NSString alloc] initWithFormat:@"%@-contactNameRecordsForClient", a1[5]];
  uint64_t v22 = a1[6];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_129;
  v30[3] = &unk_1E65D8AD0;
  uint64_t v23 = a1[4];
  v33 = v17;
  id v34 = v16;
  v30[4] = v23;
  uint64_t v31 = v19;
  id v32 = v18;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_131;
  v29[3] = &unk_1E65DA430;
  v29[4] = v23;
  v29[5] = v22;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3_135;
  v28[3] = &unk_1E65DA458;
  v28[4] = v23;
  v28[5] = v22;
  uint64_t v24 = v17;
  id v25 = v18;
  id v26 = v19;
  id v27 = v16;
  [v20 sendBatchedResultForQueryWithName:v21 queryId:v22 batchGenerator:v30 sendError:v29 sendBatch:v28];
}

intptr_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_115(uint64_t a1)
{
  unsigned int v2 = 0;
  do
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  while (v2++ < 0x32);
  return result;
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 32);
  id v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3;
  v13 = &unk_1E65D8A38;
  uint64_t v14 = v2;
  id v18 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  LOBYTE(v4) = [v4 iterContactNameRecordsForClient:v3 error:&v19 block:&v10];
  id v5 = v19;
  if ((v4 & 1) == 0)
  {
    dispatch_semaphore_t v6 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPContactRecordResultBuffer: iterContactNameRecordsForClient: failed with error: %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "runWithLockAcquired:", &__block_literal_global_125_16910, v10, v11, v12, v13, v14);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  dispatch_semaphore_t v7 = pp_contacts_signpost_handle();
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PPContactServer.contactNameRecordsForClient", "", buf, 2u);
  }
}

id __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_129(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = objc_opt_new();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 24));
  if (v5)
  {
    v8 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "PPContactRecordResultBuffer: batchGenerator terminated.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_14:
    *a2 = 1;
    id v11 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_15;
  }
LABEL_2:
  if ((unint64_t)[v4 count] <= 0x31 && !*((unsigned char *)v20 + 24))
  {
    do
    {
      if ([MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(a1 + 40) timeoutSeconds:1.0] != 1)
      {
        dispatch_semaphore_t v7 = *(void **)(a1 + 48);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_130;
        v13[3] = &unk_1E65D8AA8;
        id v16 = &v19;
        id v17 = a2;
        id v14 = v4;
        id v15 = *(id *)(a1 + 56);
        [v7 runWithLockAcquired:v13];

        goto LABEL_2;
      }
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 24));
    }
    while ((v6 & 1) == 0);
    os_signpost_id_t v9 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPContactRecordResultBuffer: batchGenerator terminated while waiting on semaphore.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  id v11 = v4;
LABEL_15:
  _Block_object_dispose(&v19, 8);

  return v11;
}

uint64_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_131(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactNameRecordBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_134_16898];
}

uint64_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3_135(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactNameRecordBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_130(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 loadingComplete])
  {
    uint64_t v4 = [v3 records];
    **(unsigned char **)(a1 + 56) = [v4 count] == 0;
  }
  else
  {
    **(unsigned char **)(a1 + 56) = 0;
  }
  unsigned __int8 v5 = [v3 records];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    dispatch_semaphore_t v7 = [v3 records];
    v8 = [v7 lastObject];

    os_signpost_id_t v9 = [v3 records];
    [v9 removeLastObject];

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v8 clientCopy];
    [v10 addObject:v11];

    id v12 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [*(id *)(a1 + 32) count];
      int v15 = 134217984;
      uint64_t v16 = v14;
      _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: batchGenerator: clientRecords = %tu", (uint8_t *)&v15, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v13 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 67109120;
      LODWORD(v16) = [v3 loadingComplete];
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: batchGenerator: buffer empty, loadingComplete: %d", (uint8_t *)&v15, 8u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 24));
  if ((v6 & 1) == 0)
  {
    do
    {
      if ([MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(a1 + 40) timeoutSeconds:1.0] != 1)
      {
        uint64_t v10 = *(void **)(a1 + 48);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_120;
        v11[3] = &unk_1E65D8A10;
        id v12 = v5;
        id v13 = *(id *)(a1 + 56);
        [v10 runWithLockAcquired:v11];

        goto LABEL_11;
      }
      unsigned __int8 v7 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 24));
    }
    while ((v7 & 1) == 0);
    v8 = pp_xpc_server_log_handle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    os_signpost_id_t v9 = "PPContactRecordResultBuffer: iterContactNameRecordsForClient terminated while waiting on semaphore.";
    goto LABEL_8;
  }
  v8 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    os_signpost_id_t v9 = "PPContactRecordResultBuffer: iterContactNameRecordsForClient terminated.";
LABEL_8:
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
  }
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  *a3 = 1;
LABEL_11:
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_123(uint64_t a1, void *a2)
{
  [a2 setLoadingComplete:1];
  uint64_t v2 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: loading is complete.", v3, 2u);
  }
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 records];
  [v4 addObject:*(void *)(a1 + 32)];

  id v5 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v6 = [v3 records];
    int v7 = 134217984;
    uint64_t v8 = [v6 count];
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: loading: record.count = %tu", (uint8_t *)&v7, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPContactServer: feedbackDisambiguationResultWithChoicesIdentifiers", buf, 2u);
  }

  queryManager = self->_queryManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __119__PPContactServerRequestHandler_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke;
  v16[3] = &unk_1E65DA018;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v16];
}

uint64_t __119__PPContactServerRequestHandler_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 32) feedbackDisambiguationResultWithChoicesIdentifiers:a1[5] chosenContactIdentifier:a1[6]];
  uint64_t v2 = *(uint64_t (**)(void))(a1[7] + 16);
  return v2();
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPContactServer: registerFeedback", v9, 2u);
  }

  [(PPLocalContactStore *)self->_store registerFeedback:v7 completion:v6];
}

- (void)contactHandlesForSource:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 documentId];
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactHandlesForSource:%@ queryId:%llu", buf, 0x16u);
  }
  queryManager = self->_queryManager;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke;
  v11[3] = &unk_1E65DB808;
  void v11[4] = self;
  id v12 = v6;
  unint64_t v13 = a4;
  id v10 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v11];
}

void __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke(void *a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactHandlesForSource", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  id v7 = *(void **)(a1[4] + 32);
  id v31 = 0;
  id v8 = [v7 contactHandlesForSource:v6 error:&v31];
  id v9 = v31;
  id v10 = pp_contacts_signpost_handle();
  id v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactHandlesForSource", "", buf, 2u);
  }

  if (v8)
  {
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    id v12 = *(void **)(a1[4] + 16);
    unint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@-contactHandlesForSource", *(void *)(a1[4] + 40)];
    uint64_t v14 = a1[6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_2;
    v24[3] = &unk_1E65DA408;
    id v25 = v8;
    id v26 = buf;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_3;
    v21[3] = &unk_1E65DA430;
    uint64_t v15 = a1[6];
    uint64_t v22 = a1[4];
    uint64_t v23 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_5;
    v20[3] = &unk_1E65DA458;
    v20[4] = v22;
    v20[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v24 sendError:v21 sendBatch:v20];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v32 = @"PPServerSideErrorInfoKey";
    unint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
    v33[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v19 = (void *)[v16 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v18];

    [*(id *)(a1[4] + 8) contactHandlesForSourceBatch:0 isLast:1 error:v19 queryId:a1[6] completion:&__block_literal_global_109_16926];
  }
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactHandlesForSourceBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_114_16928];
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactHandlesForSourceBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)contactHandlesForTopics:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v14 = [v6 count];
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactHandlesForTopics:%tu queryId:%llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

void __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke(void *a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactHandlesForTopics", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  uint64_t v7 = *(void **)(a1[4] + 32);
  id v32 = 0;
  id v8 = [v7 contactHandlesForTopics:v6 error:&v32];
  id v9 = v32;
  id v10 = pp_contacts_signpost_handle();
  id v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactHandlesForTopics", "", buf, 2u);
  }

  if (v8)
  {
    *(void *)buf = 0;
    uint64_t v29 = buf;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    unint64_t v12 = *(void **)(a1[4] + 16);
    unint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@-contactHandlesForTopics", *(void *)(a1[4] + 40)];
    uint64_t v14 = a1[6];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_2;
    v25[3] = &unk_1E65DA408;
    id v26 = v8;
    id v27 = buf;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_3;
    v22[3] = &unk_1E65DA430;
    uint64_t v15 = a1[6];
    uint64_t v23 = a1[4];
    uint64_t v24 = v15;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_5;
    v21[3] = &unk_1E65DA458;
    void v21[4] = v23;
    v21[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v25 sendError:v22 sendBatch:v21];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = (void *)MEMORY[0x1CB79D060]();
    v33 = @"PPServerSideErrorInfoKey";
    uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
    v34[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];

    v20 = (void *)[v16 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v19];

    [*(id *)(a1[4] + 8) contactHandlesForTopicsBatch:0 isLast:1 error:v20 queryId:a1[6] completion:&__block_literal_global_101_16938];
  }
}

id __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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
  id v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v5, v7);
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return v9;
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactHandlesForTopicsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_106];
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) contactHandlesForTopicsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)upcomingRelevantContactsForQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6 = a3;
  queryManager = self->_queryManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke;
  v9[3] = &unk_1E65DB808;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v9];
}

void __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke(void *a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.upcomingRelevantContactsForQuery", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  uint64_t v7 = *(void **)(a1[4] + 32);
  id v31 = 0;
  id v8 = [v7 upcomingRelevantContactsForQuery:v6 error:&v31];
  id v9 = v31;
  id v10 = pp_contacts_signpost_handle();
  unint64_t v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.upcomingRelevantContactsForQuery", "", buf, 2u);
  }

  if (v8)
  {
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    unint64_t v12 = *(void **)(a1[4] + 16);
    unint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@-upcomingRelevantContactsForQuery", *(void *)(a1[4] + 40)];
    uint64_t v14 = a1[6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_2;
    v24[3] = &unk_1E65DA408;
    id v25 = v8;
    id v26 = buf;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_3;
    v21[3] = &unk_1E65DA430;
    uint64_t v15 = a1[6];
    uint64_t v22 = a1[4];
    uint64_t v23 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_5;
    v20[3] = &unk_1E65DA458;
    v20[4] = v22;
    v20[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v24 sendError:v21 sendBatch:v20];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v32 = @"PPServerSideErrorInfoKey";
    uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
    v33[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v19 = (void *)[v16 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v18];

    [*(id *)(a1[4] + 8) upcomingRelevantContactsBatch:0 isLast:1 error:v19 queryId:a1[6] completion:&__block_literal_global_93_16947];
  }
}

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) upcomingRelevantContactsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_98];
}

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) upcomingRelevantContactsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)rankedContactsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: rankedContactsWithQuery:%@ queryId:%llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke;
  v10[3] = &unk_1E65DB808;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v10];
}

void __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke(void *a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.rankedContactsWithQuery", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  uint64_t v7 = *(void **)(a1[4] + 32);
  id v31 = 0;
  id v8 = [v7 rankedContactsWithQuery:v6 error:&v31];
  id v9 = v31;
  id v10 = pp_contacts_signpost_handle();
  id v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.rankedContactsWithQuery", "", buf, 2u);
  }

  if (v8)
  {
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    unint64_t v12 = *(void **)(a1[4] + 16);
    unint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@-rankedContactsWithQuery", *(void *)(a1[4] + 40)];
    uint64_t v14 = a1[6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_2;
    v24[3] = &unk_1E65DA408;
    id v25 = v8;
    id v26 = buf;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_3;
    v21[3] = &unk_1E65DA430;
    uint64_t v15 = a1[6];
    uint64_t v22 = a1[4];
    uint64_t v23 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_5;
    v20[3] = &unk_1E65DA458;
    v20[4] = v22;
    v20[5] = v15;
    [v12 sendBatchedResultForQueryWithName:v13 queryId:v14 batchGenerator:v24 sendError:v21 sendBatch:v20];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v32 = @"PPServerSideErrorInfoKey";
    uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
    v33[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v19 = (void *)[v16 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v18];

    [*(id *)(a1[4] + 8) rankedContactsBatch:0 isLast:1 error:v19 queryId:a1[6] completion:&__block_literal_global_16957];
  }
}

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedContactsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_87];
}

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedContactsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)unblockPendingQueries
{
}

- (void)setIsTerminated
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (PPContactServerRequestHandler)initWithStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPContactServerRequestHandler;
  unint64_t v6 = [(PPContactServerRequestHandler *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v6->_queryManager;
    v6->_queryManager = v7;

    objc_storeStrong((id *)&v6->_store, a3);
    atomic_store(0, (unsigned __int8 *)&v6->_isTerminated);
  }

  return v6;
}

- (PPContactServerRequestHandler)init
{
  os_signpost_id_t v3 = +[PPLocalContactStore defaultStore];
  uint64_t v4 = [(PPContactServerRequestHandler *)self initWithStore:v3];

  return v4;
}

@end