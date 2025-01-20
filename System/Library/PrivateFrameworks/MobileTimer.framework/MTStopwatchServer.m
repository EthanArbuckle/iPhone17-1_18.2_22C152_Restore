@interface MTStopwatchServer
- (BOOL)_isSystemReady;
- (BOOL)systemReady;
- (MTStopwatchServer)init;
- (MTStopwatchServer)initWithStorage:(id)a3;
- (MTStopwatchStorage)storage;
- (MTXPCConnectionListenerProvider)connectionListenerProvider;
- (OS_dispatch_queue)serializerQueue;
- (id)_systemNotReadyError;
- (void)_systemNotReadyError;
- (void)createStopwatch:(id)a3 withCompletion:(id)a4;
- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5;
- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didCreateStopWatch:(id)a3 source:(id)a4;
- (void)didDeleteStopwatch:(id)a3 source:(id)a4;
- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4;
- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didUpdateStopwatch:(id)a3 source:(id)a4;
- (void)getStopwatchesWithCompletion:(id)a3;
- (void)handleSystemReady;
- (void)setSerializerQueue:(id)a3;
- (void)setStorage:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)testStopwatchWrite;
- (void)updateStopwatch:(id)a3 withCompletion:(id)a4;
@end

@implementation MTStopwatchServer

- (MTStopwatchServer)init
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMTStopwatchStorageClass_softClass;
  uint64_t v12 = getMTStopwatchStorageClass_softClass;
  if (!getMTStopwatchStorageClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getMTStopwatchStorageClass_block_invoke;
    v8[3] = &unk_1E5914EC0;
    v8[4] = &v9;
    __getMTStopwatchStorageClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  v5 = objc_opt_new();
  v6 = [(MTStopwatchServer *)self initWithStorage:v5];

  return v6;
}

- (MTStopwatchServer)initWithStorage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTStopwatchServer;
  v5 = [(MTStopwatchServer *)&v15 init];
  v6 = v5;
  if (v5)
  {
    [(MTStopwatchServer *)v5 setStorage:v4];
    v7 = MTLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%{public}@ initialized with storage: %{public}@ ", buf, 0x16u);
    }

    v8 = MTStopwatchClientInterface();
    uint64_t v9 = MTStopwatchServerInterface();
    v10 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.stopwatchserver" remoteObjectInterface:v8 exportedObject:v6 exportedObjectInterface:v9 lifecycleNotification:@"com.apple.MTStopwatchServer.wakeup" requiredEntitlement:@"com.apple.private.mobiletimerd" options:0];

    uint64_t v11 = +[MTXPCConnectionListenerProvider providerWithConnectionInfo:v10 errorHandler:0];
    connectionListenerProvider = v6->_connectionListenerProvider;
    v6->_connectionListenerProvider = (MTXPCConnectionListenerProvider *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobiletimer.stopwatchserver.serializer", 0);
    [(MTStopwatchServer *)v6 setSerializerQueue:v13];

    [v4 registerObserver:v6];
  }

  return v6;
}

- (void)startListening
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_INFO, "%{public}@ startListening", (uint8_t *)&v4, 0xCu);
  }

  [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider startListening];
}

- (void)stopListening
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_INFO, "%{public}@ stopListening", (uint8_t *)&v4, 0xCu);
  }

  [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider stopListening];
}

- (void)handleSystemReady
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_INFO, "%{public}@ handleSystemReady", buf, 0xCu);
  }

  int v4 = [(MTStopwatchServer *)self serializerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MTStopwatchServer_handleSystemReady__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __38__MTStopwatchServer_handleSystemReady__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v1 = [*(id *)(a1 + 32) storage];
  [v1 setSystemReady];

  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"com.apple.MTStopwatchServer.ready" object:0 userInfo:0 deliverImmediately:1];
}

- (void)testStopwatchWrite
{
  v3 = objc_alloc_init(MTStopwatch);
  int v4 = (void *)[(MTStopwatch *)v3 mutableCopy];

  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setStartDate:v5];

  uint64_t v6 = [(MTStopwatchServer *)self storage];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MTStopwatchServer_testStopwatchWrite__block_invoke;
  v8[3] = &unk_1E5915AA8;
  v8[4] = self;
  v7 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
  [v6 createStopWatch:v4 withCompletion:v8 source:v7];
}

void __39__MTStopwatchServer_testStopwatchWrite__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = MTLogForCategory(5);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__MTStopwatchServer_testStopwatchWrite__block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ wrote to stopwatch store successfully supposedly", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_isSystemReady
{
  id v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MTStopwatchServer *)self serializerQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MTStopwatchServer__isSystemReady__block_invoke;
  v5[3] = &unk_1E5915340;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__MTStopwatchServer__isSystemReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (id)_systemNotReadyError
{
  id v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(MTStopwatchServer *)(uint64_t)self _systemNotReadyError];
  }

  int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimerd.MTStopwatchServer.wakeup" code:1 userInfo:0];
  return v4;
}

- (void)getStopwatchesWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void, void *))a3;
  v5 = MTLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ getStopwatchesWithCompletion", (uint8_t *)&v7, 0xCu);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    uint64_t v6 = [(MTStopwatchServer *)self storage];
    [v6 getStopwatchesWitchCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v6 = [(MTStopwatchServer *)self _systemNotReadyError];
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)createStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 identifier];
    int v12 = 138543618;
    dispatch_queue_t v13 = self;
    __int16 v14 = 2114;
    objc_super v15 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ createStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    v10 = [(MTStopwatchServer *)self storage];
    uint64_t v11 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v10 createStopWatch:v6 withCompletion:v7 source:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v10 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 identifier];
    int v12 = 138543618;
    dispatch_queue_t v13 = self;
    __int16 v14 = 2114;
    objc_super v15 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ updateStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    v10 = [(MTStopwatchServer *)self storage];
    uint64_t v11 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v10 updateStopwatch:v6 withCompletion:v7 source:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v10 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 identifier];
    int v12 = 138543618;
    dispatch_queue_t v13 = self;
    __int16 v14 = 2114;
    objc_super v15 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ deleteStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    v10 = [(MTStopwatchServer *)self storage];
    uint64_t v11 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v10 deleteStopwatch:v6 withCompletion:v7 source:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v10 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  uint64_t v11 = MTLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543874;
    objc_super v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_INFO, "%{public}@ didAddLap lap: %{public}@ for stopwatch: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    int v12 = [(MTStopwatchServer *)self storage];
    dispatch_queue_t v13 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v12 didAddLap:v8 forStopwatch:v9 withCompletion:v10 source:v13];

LABEL_7:
    goto LABEL_8;
  }
  if (v10)
  {
    int v12 = [(MTStopwatchServer *)self _systemNotReadyError];
    v10[2](v10, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didClearAllLapsForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didClearAllLapsForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didStartLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didStartLapTimerForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didPauseLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didPauseLapTimerForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didLapLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didLapLapTimerForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didResetLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didResetLapTimerForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didResumeLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ([(MTStopwatchServer *)self _isSystemReady])
  {
    id v9 = [(MTStopwatchServer *)self storage];
    v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 didResumeLapTimerForStopwatch:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(MTStopwatchServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didCreateStopWatch:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTStopwatchServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didCreateStopWatch_source___block_invoke;
  v10[3] = &unk_1E5917EA0;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __47__MTStopwatchServer_didCreateStopWatch_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didCreateStopwatch:*(void *)(a1 + 32)];
}

- (void)didDeleteStopwatch:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTStopwatchServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didDeleteStopwatch_source___block_invoke;
  v10[3] = &unk_1E5917EA0;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __47__MTStopwatchServer_didDeleteStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateStopwatch:*(void *)(a1 + 32)];
}

- (void)didUpdateStopwatch:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTStopwatchServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didUpdateStopwatch_source___block_invoke;
  v10[3] = &unk_1E5917EA0;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __47__MTStopwatchServer_didUpdateStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didDeleteStopwatch:*(void *)(a1 + 32)];
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MTStopwatchServer *)self connectionListenerProvider];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__MTStopwatchServer_didAddLap_forStopwatch_source___block_invoke;
  v14[3] = &unk_1E5917EC8;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 performBlockOnAllClients:v14 excludingClient:v10];
}

uint64_t __51__MTStopwatchServer_didAddLap_forStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didAddLap:*(void *)(a1 + 32) forStopwatch:*(void *)(a1 + 40)];
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__MTStopwatchServer_didClearAllLapsForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __71__MTStopwatchServer_didClearAllLapsForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didClearAllLapsForStopwatch:*(void *)(a1 + 32)];
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didStartLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __72__MTStopwatchServer_didStartLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didStartLapTimerForStopwatch:*(void *)(a1 + 32)];
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didPauseLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __72__MTStopwatchServer_didPauseLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didPauseLapTimerForStopwatch:*(void *)(a1 + 32)];
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__MTStopwatchServer_didLapLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __70__MTStopwatchServer_didLapLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didLapLapTimerForStopwatch:*(void *)(a1 + 32)];
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didResetLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __72__MTStopwatchServer_didResetLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didResetLapTimerForStopwatch:*(void *)(a1 + 32)];
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MTStopwatchServer *)self connectionListenerProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__MTStopwatchServer_didResumeLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E5917EA0;
  id v12 = v7;
  id v10 = v7;
  [v9 performBlockOnAllClients:v11 excludingClient:v8];
}

uint64_t __73__MTStopwatchServer_didResumeLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didResumeLapTimerForStopwatch:*(void *)(a1 + 32)];
}

- (MTStopwatchStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __39__MTStopwatchServer_testStopwatchWrite__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ recieved stopwatch write error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_systemNotReadyError
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ System isn't ready...", (uint8_t *)&v2, 0xCu);
}

@end