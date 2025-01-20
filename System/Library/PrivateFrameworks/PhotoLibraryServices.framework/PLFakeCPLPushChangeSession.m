@interface PLFakeCPLPushChangeSession
+ (id)forwardingTargetForSelector:(SEL)a3;
- (PLFakeCPLPushChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4;
- (void)finalizeWithCompletionHandler:(id)a3;
@end

@implementation PLFakeCPLPushChangeSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v11 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  v8 = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5875CE0;
  v9[4] = self;
  dispatch_after(v7, v8, v9);
}

uint64_t __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained fakeBaseURL];
  id v4 = [v3 URLByAppendingPathComponent:@"resetevents.plist"];
  id v26 = [v4 path];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v3) = [v5 fileExistsAtPath:v26];

  if (v3)
  {
    id v6 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v26];
    dispatch_time_t v7 = [v6 lastObject];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKey:@"pending"];
      int v10 = [v9 BOOLValue];

      if (v10)
      {
        id v11 = (void *)[v8 mutableCopy];
        [v11 removeObjectForKey:@"pending"];
        v12 = [MEMORY[0x1E4F1C9C8] date];
        [v11 setObject:v12 forKey:@"endDate"];

        v13 = (void *)[v6 mutableCopy];
        [v13 removeLastObject];
        [v13 addObject:v11];
        [v13 writeToFile:v26 atomically:1];
        id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v15 = [v14 delegate];
        id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        [v15 libraryManagerHasChangesToPull:v16];
      }
    }
  }
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v18 = [v17 syncStatus];
  v19 = [v18 initialSyncDate];

  if (!v19)
  {
    v20 = [MEMORY[0x1E4F1C9C8] date];
    id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    v22 = [v21 syncStatus];
    [v22 setInitialSyncDate:v20];
  }
  v23 = [MEMORY[0x1E4F1C9C8] date];
  id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v25 = [v24 syncStatus];
  [v25 setLastSuccessfulSyncDate:v23];
}

- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v17 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  id v11 = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5875E18;
  id v14 = v6;
  v15 = self;
  id v12 = v6;
  dispatch_after(v10, v11, v13);
}

void __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v3 UUIDString];
  (*(void (**)(uint64_t, void, void, void *))(v1 + 16))(v1, 0, 0, v2);
}

void __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [*(id *)(a1 + 32) records];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v2;
        id v3 = *(void **)(*((void *)&v25 + 1) + 8 * v2);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v4 = [v3 resources];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v22;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v22 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
              id v10 = objc_alloc(MEMORY[0x1E4F59950]);
              id v11 = [MEMORY[0x1E4F29128] UUID];
              id v12 = [v11 UUIDString];
              v13 = (void *)[v10 initWithResource:v9 taskIdentifier:v12];

              id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
              v15 = [WeakRetained resourceProgressDelegate];
              id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
              [v15 libraryManager:v16 uploadDidFinishForResourceTransferTask:v13 withError:0];

              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
}

- (PLFakeCPLPushChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFakeCPLPushChangeSession;
  uint64_t v8 = [(PLFakeCPLPushChangeSession *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_libraryManager, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

@end