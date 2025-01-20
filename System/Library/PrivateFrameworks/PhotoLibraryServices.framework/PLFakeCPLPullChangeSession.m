@interface PLFakeCPLPullChangeSession
+ (id)forwardingTargetForSelector:(SEL)a3;
- (PLFakeCPLPullChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
@end

@implementation PLFakeCPLPullChangeSession

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
  block[2] = __60__PLFakeCPLPullChangeSession_finalizeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v11 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
  v7 = [MEMORY[0x1E4F1C9C8] date];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);
  v9 = [WeakRetained syncStatus];
  [v9 setLastSuccessfulSyncDate:v7];
}

uint64_t __60__PLFakeCPLPullChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PLFakeCPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __75__PLFakeCPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v3 UUIDString];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLFakeCPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __66__PLFakeCPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PLFakeCPLPullChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFakeCPLPullChangeSession;
  id v8 = [(PLFakeCPLPullChangeSession *)&v11 init];
  id v9 = v8;
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