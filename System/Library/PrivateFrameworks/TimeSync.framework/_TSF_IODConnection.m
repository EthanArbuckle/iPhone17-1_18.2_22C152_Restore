@interface _TSF_IODConnection
+ (void)daemonClientRefresh;
+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10;
- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3;
- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6;
- (_TSF_IODConnection)init;
- (_TSF_IODConnection)initWithService:(id)a3;
- (_TSF_IODConnection)initWithService:(id)a3 andType:(unsigned int)a4;
- (void)dealloc;
@end

@implementation _TSF_IODConnection

- (_TSF_IODConnection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[_TSF_IODConnection init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (_TSF_IODConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TSF_IODConnection;
  v7 = [(_TSF_IODConnection *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_clientID = 0;
    asyncCallbackPort = v7->_asyncCallbackPort;
    v7->_asyncCallbackPort = 0;

    asyncCallbackQueue = v8->_asyncCallbackQueue;
    v8->_asyncCallbackQueue = 0;

    v8->_asyncCallback = 0;
    v8->_refcon = 0;
    if (initWithService_andType__onceToken != -1) {
      dispatch_once(&initWithService_andType__onceToken, &__block_literal_global_4);
    }
    uint64_t v11 = [v6 entryID];
    unsigned int v12 = [(id)gDaemonServiceClient openDaemonClientWithRegistryEntryID:v11 clientType:v4 error:0];
    v8->_clientID = v12;
    if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IODConnectionFramework failed to open registryEntryID %llu\n", buf, 0xCu);
    }
  }

  return v8;
}

- (_TSF_IODConnection)initWithService:(id)a3
{
  return [(_TSF_IODConnection *)self initWithService:a3 andType:0];
}

- (void)dealloc
{
  uint64_t clientID = self->_clientID;
  if (clientID) {
    [(id)gDaemonServiceClient closeDaemonClient:clientID error:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)_TSF_IODConnection;
  [(_TSF_IODConnection *)&v4 dealloc];
}

+ (void)daemonClientRefresh
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClientExported:daemonClientRefresh\n", buf, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
  v2 = [(id)gClients allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        uint64_t v10 = v8[4];
        uint64_t v9 = v8[5];
        uint64_t v11 = v8[2];
        *(void *)buf = 0;
        uint64_t v16 = buf;
        uint64_t v17 = 0xA010000000;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v27 = 0;
        v18 = &unk_1BA8EEA63;
        uint64_t v19 = 1000;
        if (v11) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12 && v9 != 0)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __41___TSF_IODConnection_daemonClientRefresh__block_invoke;
          block[3] = &unk_1E622ACE0;
          block[5] = v10;
          block[6] = v9;
          block[4] = buf;
          dispatch_async(v11, block);
        }
        _Block_object_dispose(buf, 8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }
}

+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
  uint64_t v10 = (void *)gClients;
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
  uint64_t v12 = [v10 objectForKey:v11];

  if (v12)
  {
    uint64_t v13 = *(void *)(v12 + 32);
    uint64_t v14 = *(void *)(v12 + 40);
    v15 = *(id *)(v12 + 16);
    BOOL v16 = v14 != 0;
  }
  else
  {
    v15 = 0;
    uint64_t v13 = 0;
    BOOL v16 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
  if (a6 <= 0x10 && v15 && v13 && v16)
  {
    *(void *)buf = 0;
    *(void *)&long long v25 = buf;
    *((void *)&v25 + 1) = 0xA010000000;
    long long v26 = &unk_1BA8EEA63;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    __memmove_chk();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76___TSF_IODConnection_dispatchNotificationForClientID_ioResult_args_numArgs___block_invoke;
    v18[3] = &unk_1E622AD08;
    uint64_t v21 = v13;
    id v19 = (id)v12;
    long long v20 = buf;
    int v22 = a4;
    unsigned int v23 = a6;
    dispatch_async(v15, v18);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v17 = 0;
    if (a5 && a6) {
      unint64_t v17 = *a5;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v9;
    LOWORD(v25) = 2048;
    *(void *)((char *)&v25 + 2) = v17;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IODConnection NO CONNECTION callback clientID %u arg0 %llu\n", buf, 0x12u);
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v14 = *(void *)&a3;
  uint64_t clientID = self->_clientID;
  if (clientID) {
    return [(id)gDaemonServiceClient callMethodForDaemonClient:clientID clientMethodSelector:v14 scalarInputs:a4 scalarInputCount:v12 structInput:a6 structInputSize:a7 scalarOutputs:a8 scalarOutputCount:a9 error:a10];
  }
  else {
    return 0;
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  uint64_t clientID = self->_clientID;
  if (clientID) {
    return [(id)gDaemonServiceClient callMethodForDaemonClient:clientID clientMethodSelector:v10 scalarInputs:a4 scalarInputCount:v8 structInput:0 structInputSize:0 scalarOutputs:a6 scalarOutputCount:a7 error:a8];
  }
  else {
    return 0;
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  uint64_t clientID = self->_clientID;
  if (clientID) {
    return [(id)gDaemonServiceClient callMethodForDaemonClient:clientID clientMethodSelector:v7 scalarInputs:0 scalarInputCount:0 structInput:a4 structInputSize:a5 scalarOutputs:0 scalarOutputCount:0 error:a6];
  }
  else {
    return 0;
  }
}

- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a6;
  objc_storeStrong((id *)&self->_asyncCallbackQueue, a6);
  if (self->_asyncCallbackQueue && (uint64_t clientID = self->_clientID, clientID))
  {
    int v13 = [(id)gDaemonServiceClient callMethodForDaemonClient:clientID clientMethodSelector:v9 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0];
    BOOL v14 = 0;
    if (v13)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
      self->_asyncCallback = a4;
      self->_refcon = a5;
      v15 = (void *)gClients;
      BOOL v16 = [NSNumber numberWithUnsignedInt:self->_clientID];
      [v15 setObject:self forKey:v16];

      os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3
{
  if (self->_clientID)
  {
    uint64_t v4 = *(void *)&a3;
    os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
    uint64_t v5 = (void *)gClients;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_clientID];
    [v5 removeObjectForKey:v6];

    self->_asyncCallback = 0;
    self->_refcon = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
    char v7 = [(id)gDaemonServiceClient callMethodForDaemonClient:self->_clientID clientMethodSelector:v4 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0];
  }
  else
  {
    char v7 = 0;
  }
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = 0;

  asyncCallbackQueue = self->_asyncCallbackQueue;
  self->_asyncCallbackQueue = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncCallbackPort, 0);
  objc_storeStrong((id *)&self->_asyncCallbackQueue, 0);
}

@end