@interface WBSHistoryDatabaseAccessBroker
- (WBSHistoryDatabaseAccessBroker)init;
- (WBSHistoryDatabaseAccessBroker)initWithHistoryDatabaseURL:(id)a3;
- (id)_openDatabaseWithAccessType:(int64_t)a3 onQueue:(id)a4 error:(id *)a5;
- (id)databaseLastModifiedDate;
- (void)_requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5;
- (void)_requestReadOnlyAccessOnQueue:(id)a3 completionHandler:(id)a4;
- (void)_requestReadWriteAccessOnQueue:(id)a3 completionHandler:(id)a4;
- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5;
- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandlerWithInvalidationHandler:(id)a5;
@end

@implementation WBSHistoryDatabaseAccessBroker

- (WBSHistoryDatabaseAccessBroker)init
{
  return 0;
}

- (WBSHistoryDatabaseAccessBroker)initWithHistoryDatabaseURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryDatabaseAccessBroker;
  v5 = [(WBSHistoryDatabaseAccessBroker *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    historyDatabaseURL = v5->_historyDatabaseURL;
    v5->_historyDatabaseURL = (NSURL *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.History", 0);
    writeRequestQueue = v5->_writeRequestQueue;
    v5->_writeRequestQueue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__WBSHistoryDatabaseAccessBroker_requestAccessType_onQueue_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9C778;
  id v11 = v8;
  id v9 = v8;
  [(WBSHistoryDatabaseAccessBroker *)self requestAccessType:a3 onQueue:a4 completionHandlerWithInvalidationHandler:v10];
}

void __78__WBSHistoryDatabaseAccessBroker_requestAccessType_onQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v8[2](v8);
}

- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandlerWithInvalidationHandler:(id)a5
{
  id flagsa = a4;
  id v8 = a5;
  uint64_t v9 = (uint64_t)flagsa;
  id v10 = v8;
  if (!flagsa)
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
  }
  flags = (void *)v9;
  if ((unint64_t)(a3 - 2) < 2)
  {
    [(WBSHistoryDatabaseAccessBroker *)self _requestReadWriteAccessOnQueue:v9 completionHandler:v10];
  }
  else if ((unint64_t)a3 <= 1)
  {
    [(WBSHistoryDatabaseAccessBroker *)self _requestReadOnlyAccessOnQueue:v9 completionHandler:v10];
  }
}

- (void)_requestReadOnlyAccessOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSHistoryDatabaseAccessBroker__requestReadOnlyAccessOnQueue_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = v6;
  dispatch_async(v9, block);
}

uint64_t __82__WBSHistoryDatabaseAccessBroker__requestReadOnlyAccessOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestAccessType:0 onQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_requestReadWriteAccessOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeRequestQueue = self->_writeRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeRequestQueue, block);
}

void __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C8D730;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  dispatch_sync(v2, block);
}

uint64_t __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestAccessType:3 onQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v14 = 0;
  id v10 = [(WBSHistoryDatabaseAccessBroker *)self _openDatabaseWithAccessType:a3 onQueue:v8 error:&v14];
  id v11 = v14;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__WBSHistoryDatabaseAccessBroker__requestAccessType_onQueue_completionHandler___block_invoke;
    v12[3] = &unk_1E5C8CA70;
    id v13 = v10;
    (*((void (**)(id, id, void, void *))v9 + 2))(v9, v13, 0, v12);
  }
  else
  {
    (*((void (**)(id, void, id, void *))v9 + 2))(v9, 0, v11, &__block_literal_global_63);
  }
}

uint64_t __79__WBSHistoryDatabaseAccessBroker__requestAccessType_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (id)_openDatabaseWithAccessType:(int64_t)a3 onQueue:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:self->_historyDatabaseURL queue:v8];
  if ([v9 openWithAccessType:a3 error:a5])
  {
    id v10 = SafariShared::WBSSQLiteDatabaseFetch<>(v9, @"PRAGMA user_version");
    id v11 = [v10 nextObject];
    int v12 = [v11 intAtIndex:0];

    id v13 = [v10 statement];
    [v13 invalidate];

    if (v12 == 16)
    {
      id v14 = 0;
      v15 = v9;
    }
    else
    {
      if (a5)
      {
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v20[0] = @"History database does not have the correct schema version. Run Safari once to upgrade it.";
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        *a5 = [v16 errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v17];
      }
      [v9 close];
      v15 = 0;
      id v14 = v9;
    }

    id v9 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)databaseLastModifiedDate
{
  int8x16_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [MEMORY[0x1E4F97F98] writeAheadLogURLForDatabaseURL:self->_historyDatabaseURL];
  int8x16_t v5 = [v4 path];
  id v6 = [v3 attributesOfItemAtPath:v5 error:0];

  uint64_t v7 = *MEMORY[0x1E4F28310];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
  if (v8)
  {
    id v9 = v6;
  }
  else
  {
    id v10 = [(NSURL *)self->_historyDatabaseURL path];
    id v9 = [v3 attributesOfItemAtPath:v10 error:0];

    id v8 = [v9 objectForKeyedSubscript:v7];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequestQueue, 0);
  objc_storeStrong((id *)&self->_historyDatabaseURL, 0);
}

@end