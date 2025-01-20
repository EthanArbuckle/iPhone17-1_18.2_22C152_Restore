@interface ULBGSystemTaskManager
- (BGSystemTaskScheduler)scheduler;
- (ULBGSystemTaskManager)init;
- (void)deregisterAndCancelTaskWithIdentifier:(id)a3;
- (void)registerAndSubmitTaskWithRequest:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5;
- (void)setScheduler:(id)a3;
@end

@implementation ULBGSystemTaskManager

- (ULBGSystemTaskManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ULBGSystemTaskManager;
  v2 = [(ULBGSystemTaskManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F29900] sharedScheduler];
    [(ULBGSystemTaskManager *)v2 setScheduler:v3];
  }
  return v2;
}

- (void)registerAndSubmitTaskWithRequest:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ULBGSystemTaskManager *)self scheduler];
  v12 = [v8 identifier];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __83__ULBGSystemTaskManager_registerAndSubmitTaskWithRequest_usingQueue_launchHandler___block_invoke;
  v30[3] = &unk_2653F9CF8;
  id v13 = v9;
  id v31 = v13;
  id v14 = v10;
  id v32 = v14;
  LOBYTE(v10) = [v11 registerForTaskWithIdentifier:v12 usingQueue:v13 launchHandler:v30];

  if (v10)
  {
    v15 = [(ULBGSystemTaskManager *)self scheduler];
    v16 = [v8 identifier];
    v17 = [v15 taskRequestForIdentifier:v16];

    if (v17)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
      }
      v18 = (void *)logObject_MicroLocation_Default;
      if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v19 = v18;
      v20 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: Trying to submit already existing task: %@", buf, 0xCu);
    }
    else
    {
      v22 = [(ULBGSystemTaskManager *)self scheduler];
      v23 = [v8 createRequestFromSelf];
      id v29 = 0;
      int v24 = [v22 submitTaskRequest:v23 error:&v29];
      v19 = v29;

      if (v24)
      {
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
        }
        v25 = (void *)logObject_MicroLocation_Default;
        if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        v20 = v25;
        v26 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        v34 = v26;
        _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: Registered and submitted task: %@", buf, 0xCu);
      }
      else
      {
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
        }
        v27 = (void *)logObject_MicroLocation_Default;
        if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        v20 = v27;
        v26 = [v8 identifier];
        v28 = [v19 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v34 = v26;
        __int16 v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Could not submit task: %@ with error: %@", buf, 0x16u);
      }
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
  }
  v21 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    v17 = v21;
    v19 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    v34 = v19;
    _os_log_impl(&dword_25631F000, v17, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Could not register task: %@", buf, 0xCu);
    goto LABEL_22;
  }
LABEL_24:
}

void __83__ULBGSystemTaskManager_registerAndSubmitTaskWithRequest_usingQueue_launchHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v4 = [MEMORY[0x263EFF910] date];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
  }
  objc_super v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v3 identifier];
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: task: %@ started at: %@", (uint8_t *)&v16, 0x16u);
  }
  id v8 = [[ULBGSystemTask alloc] initWithUnderlyingTask:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v3 setTaskCompleted];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
  }
  id v9 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    v11 = [v3 identifier];
    if ([(ULBGSystemTask *)v8 shouldCancel]) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    id v13 = NSNumber;
    id v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSinceDate:v4];
    v15 = objc_msgSend(v13, "numberWithDouble:");
    int v16 = 138412802;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: task: %@ ended, interrupted: %@, duration: %@(sec)", (uint8_t *)&v16, 0x20u);
  }
}

- (void)deregisterAndCancelTaskWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(ULBGSystemTaskManager *)self scheduler];
  id v18 = 0;
  char v6 = [v5 cancelTaskRequestWithIdentifier:v4 error:&v18];
  id v7 = v18;

  if (v6)
  {
    id v8 = [(ULBGSystemTaskManager *)self scheduler];
    int v9 = [v8 deregisterTaskWithIdentifier:v4];

    if (v9)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
      }
      uint64_t v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        v11 = "[ULBGSystemTaskManager]: Deregistered and cancelled task: %@";
        v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_25631F000, v12, v13, v11, buf, 0xCu);
      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
      }
      uint64_t v17 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        v11 = "[ULBGSystemTaskManager]: Couldnt deregister task: %@";
        v12 = v17;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
    }
    id v14 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      int v16 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Couldnt cancel task: %@ with error: %@", buf, 0x16u);
    }
  }
}

- (BGSystemTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end