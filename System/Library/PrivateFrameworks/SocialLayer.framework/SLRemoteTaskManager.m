@interface SLRemoteTaskManager
- (BOOL)synchronous;
- (OS_dispatch_queue)backgroundConcurrentQueue;
- (OS_dispatch_queue)targetSerialQueue;
- (SLRemoteTaskManager)initWithDelegate:(id)a3 targetSerialQueue:(id)a4 synchronous:(BOOL)a5;
- (SLRemoteTaskManagerDelegate)delegate;
- (id)_serviceWithErrorHandler:(id)a3;
- (void)setBackgroundConcurrentQueue:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetSerialQueue:(id)a3;
- (void)startTask:(id)a3 withTimeout:(double)a4 timeoutHandler:(id)a5 errorHandler:(id)a6;
@end

@implementation SLRemoteTaskManager

- (SLRemoteTaskManager)initWithDelegate:(id)a3 targetSerialQueue:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SLRemoteTaskManager;
  v10 = [(SLRemoteTaskManager *)&v18 init];
  if (v10)
  {
    v11 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = @"NO";
      *(_DWORD *)buf = 134218754;
      v20 = v10;
      if (v5) {
        v12 = @"YES";
      }
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_INFO, "[%p] initWithDelegate: %@ targetSerialQueue: %@ synchronous: %@", buf, 0x2Au);
    }

    objc_storeWeak((id *)&v10->_delegate, v8);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SocialLayer.SLRemoteTaskManager", v14);
    backgroundConcurrentQueue = v10->_backgroundConcurrentQueue;
    v10->_backgroundConcurrentQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_targetSerialQueue, a4);
    v10->_synchronous = v5;
  }
  return v10;
}

- (void)startTask:(id)a3 withTimeout:(double)a4 timeoutHandler:(id)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SLRemoteTaskManager *)self synchronous]) {
    [(SLRemoteTaskManager *)self targetSerialQueue];
  }
  else {
  v13 = [(SLRemoteTaskManager *)self backgroundConcurrentQueue];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke;
  block[3] = &unk_1E58AA1F0;
  double v21 = a4;
  block[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14;
  v29 = __Block_byref_object_dispose__14;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__14;
  __int16 v23 = __Block_byref_object_dispose__14;
  v2 = [*(id *)(a1 + 32) targetSerialQueue];
  double v3 = *(double *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_5;
  v16[3] = &unk_1E58A8C68;
  id v18 = &v25;
  id v17 = *(id *)(a1 + 40);
  id v24 = +[SLGracePeriodTimer timerWithQueue:v2 delay:v16 action:v3];

  v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_2;
  v12[3] = &unk_1E58AA1A0;
  id v14 = &v25;
  id v15 = &v19;
  id v13 = *(id *)(a1 + 48);
  BOOL v5 = [v4 _serviceWithErrorHandler:v12];
  if (v5)
  {
    [(id)v20[5] arm];
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v7 = (void *)v26[5];
    v26[5] = v6;

    id v8 = [*(id *)(a1 + 32) targetSerialQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_3;
    v11[3] = &unk_1E58AA1C8;
    v11[4] = &v25;
    v11[5] = &v19;
    dispatch_async(v8, v11);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    v32[0] = @"XPC connection error. We were unable to retrieve a connection to the handshake service in sociallayerd";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v8 = [v9 errorWithDomain:@"com.apple.SocialLayer.SLRemoteTaskManager" code:1 userInfo:v10];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_2(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1[5] + 8) + 40) cancel];
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) isValid])
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) suppress];
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F28228];
    v6[0] = @"XPC connection error. sociallayerd may have crashed";
    double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    v4 = [v2 errorWithDomain:@"com.apple.SocialLayer.SLRemoteTaskManager" code:1 userInfo:v3];

    (*(void (**)(void))(a1[4] + 16))();
  }
}

uint64_t __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isValid];
    if ((result & 1) == 0)
    {
      double v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return [v3 cancel];
    }
  }
  return result;
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLRemoteTaskManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SLRemoteTaskManager *)self delegate];
    id v8 = [v7 taskServiceWithErrorHandler:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (SLRemoteTaskManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLRemoteTaskManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)targetSerialQueue
{
  return self->_targetSerialQueue;
}

- (void)setTargetSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundConcurrentQueue
{
  return self->_backgroundConcurrentQueue;
}

- (void)setBackgroundConcurrentQueue:(id)a3
{
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_targetSerialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end