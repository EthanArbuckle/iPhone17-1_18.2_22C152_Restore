@interface FCKeyValueStoreSavePolicyAppBackground
- (FCKeyValueStoreSavePolicyAppBackground)initWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4;
- (void)_saveIfNeeded;
- (void)activityObservingApplicationDidBecomeActive;
- (void)activityObservingApplicationDidEnterBackground;
- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3;
- (void)activityObservingApplicationWillTerminate;
- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4;
@end

@implementation FCKeyValueStoreSavePolicyAppBackground

- (void)activityObservingApplicationDidBecomeActive
{
  self->_inBackground = 0;
}

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke;
  v10[3] = &unk_1E5B4E088;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  FCPerformBlockOnMainThread(v10);
}

- (FCKeyValueStoreSavePolicyAppBackground)initWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCKeyValueStoreSavePolicyAppBackground;
  id v8 = [(FCKeyValueStoreSavePolicyAppBackground *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    v8->_inBackground = 1;
    objc_storeStrong((id *)&v8->_backgroundTaskable, a4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__FCKeyValueStoreSavePolicyAppBackground_initWithActivityMonitor_backgroundTaskable___block_invoke;
    v11[3] = &unk_1E5B4BE70;
    id v12 = v6;
    v13 = v9;
    FCPerformBlockOnMainThread(v11);
  }
  return v9;
}

unint64_t __85__FCKeyValueStoreSavePolicyAppBackground_initWithActivityMonitor_backgroundTaskable___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  unint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    unint64_t result = [*(id *)(a1 + 32) currentApplicationState];
    if (result <= 2) {
      *(unsigned char *)(*(void *)(a1 + 40) + 16) = 0x10100u >> (8 * result);
    }
  }
  return result;
}

void __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_2;
    v9[3] = &unk_1E5B4C018;
    v9[4] = *(void *)(a1 + 32);
    id v6 = MEMORY[0x1E4F14428];
    id v7 = v9;
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 60000000000);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_3;
    v8[3] = &unk_1E5B4C018;
    v8[4] = *(void *)(a1 + 32);
    id v6 = MEMORY[0x1E4F14428];
    id v7 = v8;
  }
  dispatch_after(v5, v6, v7);
}

uint64_t __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveIfNeeded];
}

uint64_t __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveIfNeeded];
}

- (void)activityObservingApplicationDidEnterBackground
{
  [MEMORY[0x1E4F29060] isMainThread];
  self->_inBackground = 1;
  [(FCKeyValueStoreSavePolicyAppBackground *)self _saveIfNeeded];
}

- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  self->_inBackground = 1;
  [(FCKeyValueStoreSavePolicyAppBackground *)self _saveIfNeeded];
}

- (void)activityObservingApplicationWillTerminate
{
  [MEMORY[0x1E4F29060] isMainThread];
  self->_inBackground = 1;
  [(FCKeyValueStoreSavePolicyAppBackground *)self _saveIfNeeded];
}

- (void)_saveIfNeeded
{
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v3 = self->_pendingQueue;
  v4 = _Block_copy(self->_pendingHandler);
  pendingQueue = self->_pendingQueue;
  self->_pendingQueue = 0;

  id pendingHandler = self->_pendingHandler;
  self->_id pendingHandler = 0;

  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (self->_inBackground)
    {
      dispatch_sync((dispatch_queue_t)v3, v4);
    }
    else
    {
      uint64_t v8 = [(FCBackgroundTaskable *)self->_backgroundTaskable fc_beginBackgroundTaskWithName:@"save-kvs" expirationHandler:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__FCKeyValueStoreSavePolicyAppBackground__saveIfNeeded__block_invoke;
      block[3] = &unk_1E5B50BE8;
      block[4] = self;
      id v10 = v4;
      uint64_t v11 = v8;
      dispatch_async((dispatch_queue_t)v3, block);
    }
  }
}

uint64_t __55__FCKeyValueStoreSavePolicyAppBackground__saveIfNeeded__block_invoke(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = a1[6];
  return objc_msgSend(v2, "fc_endBackgroundTask:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingHandler, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskable, 0);
}

@end