@interface PPXPCServerPipelinedBatchQueryManager
- (PPXPCServerPipelinedBatchQueryManager)initWithPipelineDepth:(int64_t)a3 pipelinedCallTimeoutNsec:(unint64_t)a4 maxConcurrentRequestsPerConnection:(unint64_t)a5;
- (void)_unblockQueryReplyThrottleSemaphore:(id)a3;
- (void)runConcurrentlyWithRequestThrottle:(id)a3;
- (void)runSynchronouslyWithRequestThrottle:(id)a3;
- (void)sendBatchedResultForQueryWithName:(id)a3 queryId:(unint64_t)a4 batchGenerator:(id)a5 sendError:(id)a6 sendBatch:(id)a7;
- (void)unblockPendingQueries;
- (void)waitForBlockWithRequestThrottle:(id)a3;
@end

@implementation PPXPCServerPipelinedBatchQueryManager

id __73__PPXPCServerPipelinedBatchQueryManager_waitForBlockWithRequestThrottle___block_invoke_2(uint64_t a1)
{
  return self;
}

intptr_t __118__PPXPCServerPipelinedBatchQueryManager_sendBatchedResultForQueryWithName_queryId_batchGenerator_sendError_sendBatch___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __76__PPXPCServerPipelinedBatchQueryManager_runConcurrentlyWithRequestThrottle___block_invoke_2(uint64_t a1)
{
  return self;
}

- (PPXPCServerPipelinedBatchQueryManager)initWithPipelineDepth:(int64_t)a3 pipelinedCallTimeoutNsec:(unint64_t)a4 maxConcurrentRequestsPerConnection:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)PPXPCServerPipelinedBatchQueryManager;
  v8 = [(PPXPCServerPipelinedBatchQueryManager *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_pipelineDepth = a3;
    v8->_pipelinedCallTimeoutNsec = a4;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(a5);
    concurrentRequestSem = v9->_concurrentRequestSem;
    v9->_concurrentRequestSem = (OS_dispatch_semaphore *)v10;

    uint64_t v12 = objc_opt_new();
    queryReplyThrottleSemaphores = v9->_queryReplyThrottleSemaphores;
    v9->_queryReplyThrottleSemaphores = (NSMutableDictionary *)v12;

    atomic_store(0, (unsigned __int8 *)&v9->_isInterrupted);
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryReplyThrottleSemaphores, 0);
  objc_storeStrong((id *)&self->_concurrentRequestSem, 0);
}

- (void)runConcurrentlyWithRequestThrottle:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = blockNotifyQueue();
  dispatch_sync(v6, &__block_literal_global_26);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v7 = qos_class_self();
  v8 = dispatch_get_global_queue(v7, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PPXPCServerPipelinedBatchQueryManager_runConcurrentlyWithRequestThrottle___block_invoke_2;
  block[3] = &unk_1E65DBDE8;
  id v12 = v5;
  id v13 = v4;
  block[4] = self;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v8, block);
}

- (void)waitForBlockWithRequestThrottle:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = blockNotifyQueue();
  dispatch_sync(v6, &__block_literal_global_29_15055);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v7 = blockNotifyQueue();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PPXPCServerPipelinedBatchQueryManager_waitForBlockWithRequestThrottle___block_invoke_2;
  v9[3] = &unk_1E65DC568;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_block_notify(v4, v7, v9);
}

- (void)sendBatchedResultForQueryWithName:(id)a3 queryId:(unint64_t)a4 batchGenerator:(id)a5 sendError:(id)a6 sendBatch:(id)a7
{
  v60[1] = *MEMORY[0x1E4F143B8];
  v44 = a3;
  id v12 = (void (**)(id, unsigned __int8 *, id *))a5;
  id v13 = (void (**)(id, id))a6;
  v41 = (void (**)(id, void *, uint64_t, void *))a7;
  v14 = self->_queryReplyThrottleSemaphores;
  objc_sync_enter(v14);
  queryReplyThrottleSemaphores = self->_queryReplyThrottleSemaphores;
  v16 = [NSNumber numberWithUnsignedLongLong:a4];
  v17 = [(NSMutableDictionary *)queryReplyThrottleSemaphores objectForKeyedSubscript:v16];

  if (!v17)
  {
    dispatch_semaphore_t v23 = dispatch_semaphore_create(self->_pipelineDepth);
    v24 = self->_queryReplyThrottleSemaphores;
    v25 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v25];

    objc_sync_exit(v14);
    unsigned __int8 v49 = 0;
    *(void *)&long long v56 = 0;
    *((void *)&v56 + 1) = &v56;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    uint64_t v42 = *MEMORY[0x1E4F28798];
    uint64_t v43 = *MEMORY[0x1E4F28588];
    while (1)
    {
      v26 = (void *)MEMORY[0x1CB79D060]();
      id v48 = 0;
      unsigned __int8 v27 = atomic_load((unsigned __int8 *)(*((void *)&v56 + 1) + 24));
      if (v27) {
        break;
      }
      v28 = v12[2](v12, &v49, &v48);
      if (v28) {
        goto LABEL_10;
      }
      v13[2](v13, v48);
      char v29 = 0;
LABEL_20:

      if (v49) {
        char v37 = 0;
      }
      else {
        char v37 = v29;
      }
      if ((v37 & 1) == 0)
      {
        [(PPXPCServerPipelinedBatchQueryManager *)self _unblockQueryReplyThrottleSemaphore:v23];
        v38 = self->_queryReplyThrottleSemaphores;
        objc_sync_enter(v38);
        v39 = self->_queryReplyThrottleSemaphores;
        v40 = [NSNumber numberWithUnsignedLongLong:a4];
        [(NSMutableDictionary *)v39 setObject:0 forKeyedSubscript:v40];

        objc_sync_exit(v38);
        _Block_object_dispose(&v56, 8);
        v14 = (NSMutableDictionary *)v23;
        goto LABEL_25;
      }
    }
    unsigned __int8 v49 = 1;
    v28 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v23 timeoutSeconds:(double)self->_pipelinedCallTimeoutNsec / 1000000000.0] == 1)
    {
      v30 = [[NSString alloc] initWithFormat:@"timeout while handling pipelined results for query \"%@\" with queryId %llu", v44, a4];
      v31 = pp_xpc_server_log_handle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v30;
        _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v54 = v43;
      v55 = v30;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v34 = (void *)[v32 initWithDomain:v42 code:5 userInfo:v33];

      v13[2](v13, v34);
    }
    else
    {
      unsigned __int8 v35 = atomic_load((unsigned __int8 *)&self->_isInterrupted);
      if ((v35 & 1) == 0)
      {
        uint64_t v36 = v49;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __118__PPXPCServerPipelinedBatchQueryManager_sendBatchedResultForQueryWithName_queryId_batchGenerator_sendError_sendBatch___block_invoke;
        v45[3] = &unk_1E65D8378;
        v47 = &v56;
        v46 = v23;
        v41[2](v41, v28, v36, v45);
        char v29 = 1;
        v30 = v46;
LABEL_19:

        goto LABEL_20;
      }
      v30 = pp_xpc_server_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v44;
        __int16 v52 = 2048;
        unint64_t v53 = a4;
        _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEFAULT, "Prematurely terminating pending query \"%@\" with queryId %llu due to connection failure.", buf, 0x16u);
      }
    }
    char v29 = 0;
    goto LABEL_19;
  }
  v18 = (void *)[[NSString alloc] initWithFormat:@"query \"%@\" can't be started because queryId %llu is already in use", v44, a4];
  v19 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v56) = 138412290;
    *(void *)((char *)&v56 + 4) = v18;
    _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v56, 0xCu);
  }

  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v59 = *MEMORY[0x1E4F28588];
  v60[0] = v18;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  v22 = (void *)[v20 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];

  v13[2](v13, v22);
  objc_sync_exit(v14);
LABEL_25:
}

- (void)_unblockQueryReplyThrottleSemaphore:(id)a3
{
  if (self->_pipelineDepth)
  {
    unint64_t v5 = 0;
    do
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)a3);
      ++v5;
    }
    while (v5 < self->_pipelineDepth);
  }
}

- (void)unblockPendingQueries
{
  atomic_store(1u, (unsigned __int8 *)&self->_isInterrupted);
  v3 = self->_queryReplyThrottleSemaphores;
  objc_sync_enter(v3);
  queryReplyThrottleSemaphores = self->_queryReplyThrottleSemaphores;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PPXPCServerPipelinedBatchQueryManager_unblockPendingQueries__block_invoke;
  v5[3] = &unk_1E65D8350;
  v5[4] = self;
  [(NSMutableDictionary *)queryReplyThrottleSemaphores enumerateKeysAndObjectsUsingBlock:v5];
  objc_sync_exit(v3);
}

uint64_t __62__PPXPCServerPipelinedBatchQueryManager_unblockPendingQueries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unblockQueryReplyThrottleSemaphore:");
}

- (void)runSynchronouslyWithRequestThrottle:(id)a3
{
  id v4 = (void (**)(void))a3;
  unint64_t v5 = blockNotifyQueue();
  dispatch_sync(v5, &__block_literal_global_15061);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4);

  concurrentRequestSem = self->_concurrentRequestSem;
  dispatch_semaphore_signal(concurrentRequestSem);
}

@end