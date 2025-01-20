@interface IODConnection
+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10;
- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3;
- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6;
- (IODConnection)init;
- (IODConnection)initWithService:(id)a3;
- (IODConnection)initWithService:(id)a3 andType:(unsigned int)a4;
- (void)dealloc;
@end

@implementation IODConnection

+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6
{
  uint64_t v8 = *(void *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
  v9 = (void *)qword_100047C18;
  v10 = +[NSNumber numberWithUnsignedInt:v8];
  uint64_t v11 = [v9 objectForKey:v10];

  if (v11)
  {
    uint64_t v12 = *(void *)(v11 + 40);
    uint64_t v13 = *(void *)(v11 + 48);
    v14 = *(id *)(v11 + 24);
    BOOL v15 = v13 != 0;
  }
  else
  {
    v14 = 0;
    uint64_t v12 = 0;
    BOOL v15 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
  if (a6 <= 0x10 && v14 && v12 && v15)
  {
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0xA010000000;
    v25 = &unk_10003A47F;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    __memmove_chk();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000079A0;
    v16[3] = &unk_10003C578;
    uint64_t v19 = v12;
    id v17 = (id)v11;
    v18 = buf;
    int v20 = a4;
    unsigned int v21 = a6;
    dispatch_async(v14, v16);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection NO CONNECTION callback clientID %u\n", buf, 8u);
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
  {
    return [(IOKConnection *)iokConnection callMethodWithSelector:*(void *)&a3 scalarInputs:a4 scalarInputCount:v8 scalarOutputs:a6 scalarOutputCount:a7 error:a8];
  }
  else
  {
    uint64_t clientID = self->_clientID;
    if (clientID) {
      return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v10 scalarInputs:a4 scalarInputCount:v8 structInput:0 structInputSize:0 scalarOutputs:a6 scalarOutputCount:a7 error:a8];
    }
    else {
      return 0;
    }
  }
}

- (IODConnection)init
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IODConnection init]");
  +[NSException raise:NSInvalidArgumentException, @"Do not call %@", v3 format];

  return 0;
}

- (IODConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IODConnection;
  v7 = [(IODConnection *)&v14 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_uint64_t clientID = 0;
    asyncCallbackPort = v7->_asyncCallbackPort;
    v7->_asyncCallbackPort = 0;

    asyncCallbackQueue = v8->_asyncCallbackQueue;
    v8->_asyncCallbackQueue = 0;

    v8->_asyncCallback = 0;
    v8->_refcon = 0;
    if (qword_100047C08 != -1) {
      dispatch_once(&qword_100047C08, &stru_10003C510);
    }
    id v11 = [v6 entryID];
    unsigned int v12 = [(id)qword_100047C00 openDaemonClient:dword_100047C10 withRegistryEntryID:v11 clientType:v4 error:0];
    v8->_uint64_t clientID = v12;
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnectionDaemon failed to open service with registryEntryID %llu\n", buf, 0xCu);
    }
  }

  return v8;
}

- (IODConnection)initWithService:(id)a3
{
  return [(IODConnection *)self initWithService:a3 andType:0];
}

- (void)dealloc
{
  iokConnection = self->_iokConnection;
  self->_iokConnection = 0;

  uint64_t clientID = self->_clientID;
  if (clientID) {
    [(id)qword_100047C00 closeDaemonClient:dword_100047C10 daemonClientID:clientID error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)IODConnection;
  [(IODConnection *)&v5 dealloc];
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v14 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection) {
    return [(IOKConnection *)iokConnection callMethodWithSelector:*(void *)&a3 scalarInputs:a4 scalarInputCount:v12 structInput:a6 structInputSize:a7 scalarOutputs:a8 scalarOutputCount:a9 structOutput:0 structOutputSize:0 error:a10];
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v14 scalarInputs:a4 scalarInputCount:v12 structInput:a6 structInputSize:a7 scalarOutputs:a8 scalarOutputCount:a9 error:a10];
  }
  else {
    return 0;
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
  {
    return [(IOKConnection *)iokConnection callMethodWithSelector:*(void *)&a3 structInput:a4 structInputSize:a5 structOutput:0 structOutputSize:0 error:a6];
  }
  else
  {
    uint64_t clientID = self->_clientID;
    if (clientID) {
      return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v7 scalarInputs:0 scalarInputCount:0 structInput:a4 structInputSize:a5 scalarOutputs:0 scalarOutputCount:0 error:a6];
    }
    else {
      return 0;
    }
  }
}

- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a6;
  objc_storeStrong((id *)&self->_asyncCallbackQueue, a6);
  if (!self->_asyncCallbackQueue) {
    goto LABEL_10;
  }
  if (!self->_iokConnection)
  {
    uint64_t clientID = self->_clientID;
    if (clientID)
    {
      if ([(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v9 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0])
      {
        os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
        self->_asyncCallback = a4;
        self->_refcon = a5;
        id v17 = (void *)qword_100047C18;
        v18 = +[NSNumber numberWithUnsignedInt:self->_clientID];
        [v17 setObject:self forKey:v18];

        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
        unsigned __int8 v15 = 1;
        goto LABEL_11;
      }
      unsigned __int8 v15 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      unsigned int v19 = self->_clientID;
      *(_DWORD *)buf = 67109634;
      unsigned int v22 = v19;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v9;
      HIWORD(v23) = 2080;
      uint64_t v24 = "fail";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection::registerAsyncNotificationsWithSelector clientID %u selector %u result %s\n", buf, 0x18u);
    }
LABEL_10:
    unsigned __int8 v15 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = (IOKNotificationPort *)[objc_alloc((Class)IOKNotificationPort) initOnDispatchQueue:v11];
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = v12;

  uint64_t v14 = self->_asyncCallbackPort;
  if (!v14) {
    goto LABEL_10;
  }
  v23 = a4;
  uint64_t v24 = (const char *)a5;
  unsigned __int8 v15 = [(IOKConnection *)self->_iokConnection callAsyncMethodWithSelector:v9 wakePort:[(IOKNotificationPort *)v14 machPort] reference:buf referenceCount:8 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:0 error:0];
LABEL_11:

  return v15;
}

- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
  {
    unsigned __int8 v6 = [(IOKConnection *)iokConnection callMethodWithSelector:*(void *)&a3 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:0 error:0];
  }
  else
  {
    if (!self->_clientID)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
    uint64_t v7 = (void *)qword_100047C18;
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:self->_clientID];
    [v7 removeObjectForKey:v8];

    self->_asyncCallback = 0;
    self->_refcon = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
    unsigned __int8 v6 = [(id)qword_100047C00 callMethodForDaemonClient:self->_clientID clientMethodSelector:v3 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0];
  }
  BOOL v9 = v6;
LABEL_6:
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = 0;

  asyncCallbackQueue = self->_asyncCallbackQueue;
  self->_asyncCallbackQueue = 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncCallbackPort, 0);
  objc_storeStrong((id *)&self->_asyncCallbackQueue, 0);

  objc_storeStrong((id *)&self->_iokConnection, 0);
}

@end