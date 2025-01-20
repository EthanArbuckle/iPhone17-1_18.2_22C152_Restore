@interface WBSettingsTaskHandler
- (BOOL)_shouldEnqueueTask:(id)a3;
- (WBSettingsTaskHandler)init;
- (id)finishBackgroundTaskAssertionBlock;
- (id)startBackgroundTaskAssertionBlock;
- (void)_attemptCurrentTask;
- (void)_currentTaskAttemptDidFinishWithError:(id)a3;
- (void)_enqueueTask:(id)a3;
- (void)_finishCurrentTask;
- (void)_performNextTask;
- (void)enqueueTask:(id)a3;
- (void)setFinishBackgroundTaskAssertionBlock:(id)a3;
- (void)setStartBackgroundTaskAssertionBlock:(id)a3;
@end

@implementation WBSettingsTaskHandler

- (WBSettingsTaskHandler)init
{
  v12.receiver = self;
  v12.super_class = (Class)WBSettingsTaskHandler;
  v2 = [(WBSettingsTaskHandler *)&v12 init];
  if (v2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.WebBookmarks.WBSettingsTaskHandler.%p", v2);
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    tasks = v2->_tasks;
    v2->_tasks = (NSMutableArray *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)enqueueTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__WBSettingsTaskHandler_enqueueTask___block_invoke;
  v7[3] = &unk_2643D9CF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__WBSettingsTaskHandler_enqueueTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueTask:*(void *)(a1 + 40)];
}

- (void)_enqueueTask:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WBSettingsTaskHandler *)self _shouldEnqueueTask:v4])
  {
    [(NSMutableArray *)self->_tasks addObject:v4];
    [(WBSettingsTaskHandler *)self _performNextTask];
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      int v7 = 134217984;
      uint64_t v8 = [v4 taskType];
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Not queueing settings task with type %ld since one has already been scheduled.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)_shouldEnqueueTask:(id)a3
{
  id v4 = a3;
  v5 = [v4 websiteDataRecord];
  if (v5)
  {

LABEL_12:
    BOOL v13 = 1;
    goto LABEL_13;
  }
  id v6 = [v4 profileIdentifier];

  if (v6) {
    goto LABEL_12;
  }
  uint64_t v7 = [(NSMutableArray *)self->_tasks count];
  uint64_t v8 = [v4 taskType];
  if (v7 < 2) {
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 2;
  do
  {
    v11 = [(NSMutableArray *)self->_tasks objectAtIndexedSubscript:v10 - 1];
    uint64_t v12 = [v11 taskType];

    BOOL v13 = v12 != v9;
  }
  while (v12 != v9 && v7 != v10++);
LABEL_13:

  return v13;
}

- (void)_performNextTask
{
  uint64_t v3 = [(NSMutableArray *)self->_tasks count];
  currentTask = self->_currentTask;
  if (currentTask) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    id backgroundTaskAssertionToken = self->_backgroundTaskAssertionToken;
    if (backgroundTaskAssertionToken)
    {
      finishBackgroundTaskAssertionBlock = (uint64_t (**)(void))self->_finishBackgroundTaskAssertionBlock;
      if (finishBackgroundTaskAssertionBlock)
      {
        finishBackgroundTaskAssertionBlock = (uint64_t (**)(void))finishBackgroundTaskAssertionBlock[2]();
        id backgroundTaskAssertionToken = self->_backgroundTaskAssertionToken;
      }
      self->_id backgroundTaskAssertionToken = 0;
      MEMORY[0x270F9A758](finishBackgroundTaskAssertionBlock, backgroundTaskAssertionToken);
    }
  }
  else
  {
    if (currentTask) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    if (!v6)
    {
      if (!self->_backgroundTaskAssertionToken)
      {
        startBackgroundTaskAssertionBlock = (void (**)(void))self->_startBackgroundTaskAssertionBlock;
        if (startBackgroundTaskAssertionBlock)
        {
          uint64_t v8 = startBackgroundTaskAssertionBlock[2]();
          id v9 = self->_backgroundTaskAssertionToken;
          self->_id backgroundTaskAssertionToken = v8;
        }
      }
      uint64_t v10 = [(NSMutableArray *)self->_tasks objectAtIndexedSubscript:0];
      v11 = self->_currentTask;
      self->_currentTask = v10;

      self->_currentRetryCount = 0;
      [(NSMutableArray *)self->_tasks removeObjectAtIndex:0];
      [(WBSettingsTaskHandler *)self _attemptCurrentTask];
    }
  }
}

- (void)_attemptCurrentTask
{
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2;
  v7[3] = &unk_2643D9CF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentTaskAttemptDidFinishWithError:*(void *)(a1 + 40)];
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2_6;
  v7[3] = &unk_2643D9CF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void v7[5];
  id v8;

  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_6;
  v7[3] = &unk_2643D9CF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentTaskAttemptDidFinishWithError:*(void *)(a1 + 40)];
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_4;
  v7[3] = &unk_2643D9CF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentTaskAttemptDidFinishWithError:*(void *)(a1 + 40)];
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentTaskAttemptDidFinishWithError:*(void *)(a1 + 40)];
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_8;
  v7[3] = &unk_2643D9CF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentTaskAttemptDidFinishWithError:*(void *)(a1 + 40)];
}

- (void)_finishCurrentTask
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    currentTask = self->_currentTask;
    BOOL v5 = v3;
    int v7 = 134217984;
    uint64_t v8 = [(WBSettingsTask *)currentTask taskType];
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Marking current task with type %ld as finished. Attempting next available task", (uint8_t *)&v7, 0xCu);
  }
  id v6 = self->_currentTask;
  self->_currentTask = 0;

  [(WBSettingsTaskHandler *)self _performNextTask];
}

- (void)_currentTaskAttemptDidFinishWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 domain];
  char v6 = [v5 isEqualToString:@"WebBookmarksXPCConnectionErrorDomain"];

  if (v6)
  {
    objc_initWeak(&location, self);
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(WBSettingsTask *)self->_currentTask taskType];
      uint64_t v9 = objc_msgSend(v4, "wb_privacyPreservingDescription");
      -[WBSettingsTaskHandler _currentTaskAttemptDidFinishWithError:](v9, buf, v8, v7);
    }

    dispatch_time_t v10 = dispatch_time(0, 200000000);
    queue = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__WBSettingsTaskHandler__currentTaskAttemptDidFinishWithError___block_invoke;
    v16[3] = &unk_2643D9D58;
    objc_copyWeak(&v17, &location);
    dispatch_after(v10, queue, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    BOOL v13 = v12;
    if (v4)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(WBSettingsTaskHandler *)(uint64_t)self _currentTaskAttemptDidFinishWithError:v4];
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      currentTask = self->_currentTask;
      v15 = v13;
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = [(WBSettingsTask *)currentTask taskType];
      _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_INFO, "Successfully performed settings task with type: %ld", buf, 0xCu);
    }
    [(WBSettingsTaskHandler *)self _finishCurrentTask];
  }
}

void __63__WBSettingsTaskHandler__currentTaskAttemptDidFinishWithError___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ++WeakRetained[4];
    v2 = WeakRetained;
    [WeakRetained _attemptCurrentTask];
    WeakRetained = v2;
  }
}

- (id)startBackgroundTaskAssertionBlock
{
  return self->_startBackgroundTaskAssertionBlock;
}

- (void)setStartBackgroundTaskAssertionBlock:(id)a3
{
}

- (id)finishBackgroundTaskAssertionBlock
{
  return self->_finishBackgroundTaskAssertionBlock;
}

- (void)setFinishBackgroundTaskAssertionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBackgroundTaskAssertionBlock, 0);
  objc_storeStrong(&self->_startBackgroundTaskAssertionBlock, 0);
  objc_storeStrong(&self->_backgroundTaskAssertionToken, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_currentTaskAttemptDidFinishWithError:(uint64_t)a3 .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Received error while performing settings task with type: %ld, error: %{public}@", buf, 0x16u);
}

- (void)_currentTaskAttemptDidFinishWithError:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 24);
  BOOL v5 = a2;
  uint64_t v6 = [v4 taskType];
  int v7 = objc_msgSend(a3, "wb_privacyPreservingDescription");
  int v8 = 134218242;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_21C043000, v5, OS_LOG_TYPE_ERROR, "Settings task with type %ld finished with a non-xpc error %{public}@", (uint8_t *)&v8, 0x16u);
}

@end