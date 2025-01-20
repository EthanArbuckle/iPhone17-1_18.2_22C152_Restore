@interface CLIndoorXPCProvider
+ (id)newConnectionFor:(id)a3;
- (CLIndoorXPCProvider)init;
- (CLIndoorXPCProvider)initWithConnection:(id)a3;
- (CLIndoorXPCProvider)initWithEndpoint:(id)a3;
- (id).cxx_construct;
- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4;
- (id)_defaultErrHandlerForCaller:(id)a3;
- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock;
- (void)dealloc;
- (void)invalidate;
- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock;
- (void)withinQueueInitializeConnection;
- (void)withinQueueInterruptionHandler;
- (void)withinQueueInvalidate;
- (void)withinQueueReinitializeRemoteState;
- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1;
@end

@implementation CLIndoorXPCProvider

+ (id)newConnectionFor:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = objc_alloc((Class)NSXPCConnection);
  v6 = [v3 endpointName];
  v7 = [v4 persistentDomainForName:@"com.apple.pipelined.framework"];
  v8 = [v7 objectForKey:@"UnprivilegedDaemon"];
  unsigned int v9 = [v8 BOOLValue];

  if (!v9)
  {
    uint64_t v11 = 4096;
    goto LABEL_7;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
    v10 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v10 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_4:
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UnprivilegedDaemon default found.  Connecting to service launched manually (i.e. not via launchd)", v14, 2u);
  }
LABEL_5:
  uint64_t v11 = 0;
LABEL_7:

  id v12 = [v5 initWithMachServiceName:v6 options:v11];
  return v12;
}

- (CLIndoorXPCProvider)init
{
  id v3 = [(CLIndoorXPCProvider *)self impl];
  id v4 = +[CLIndoorXPCProvider newConnectionFor:v3];

  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
    id v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, init", v8, 2u);
  }
LABEL_4:
  v6 = [(CLIndoorXPCProvider *)self initWithConnection:v4];

  return v6;
}

- (CLIndoorXPCProvider)initWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v4];
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
    v6 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithEndpoint", v9, 2u);
  }
LABEL_4:
  v7 = [(CLIndoorXPCProvider *)self initWithConnection:v5];

  return v7;
}

- (CLIndoorXPCProvider)initWithConnection:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLIndoorXPCProvider;
  v6 = [(CLIndoorXPCProvider *)&v28 init];
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    if ([(CLIndoorXPCProvider *)v6 conformsToProtocol:&OBJC_PROTOCOL___CLIndoorXPCProviderImplementation])
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = +[NSString stringWithFormat:@"com.apple.CoreIndoor.%@", v11];

      id v13 = v12;
      dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
      frameworkQueue = v8->_frameworkQueue;
      v8->_frameworkQueue = (OS_dispatch_queue *)v14;

      v16 = v8->_frameworkQueue;
      if (!v16)
      {
        v7 = 0;
        goto LABEL_10;
      }
      objc_storeStrong((id *)&v7->_connection, a3);
      if (v8->_connection)
      {
        dispatch_queue_set_specific((dispatch_queue_t)v8->_frameworkQueue, &unk_1003E68B0, v8, 0);
        dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v8->_frameworkQueue);
        interruptReconnection = v8->_interruptReconnection;
        v8->_interruptReconnection = (OS_dispatch_source *)v17;

        objc_initWeak(&location, v8);
        v19 = v8->_interruptReconnection;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3321888768;
        handler[2] = sub_1000B56E4;
        handler[3] = &unk_100452680;
        objc_copyWeak(to, &location);
        objc_copyWeak(&v26, to);
        dispatch_source_set_event_handler(v19, handler);
        objc_destroyWeak(to);
        dispatch_resume((dispatch_object_t)v8->_interruptReconnection);
        if (qword_10047BEE8 == -1)
        {
          v20 = qword_10047BEF0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
          {
LABEL_8:
            [(CLIndoorXPCProvider *)v8 withinQueueInitializeConnection];
            v7 = v8;
            objc_destroyWeak(&v26);
            objc_destroyWeak(&location);
            goto LABEL_10;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEE8, &stru_100452760);
          v20 = qword_10047BEF0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
        }
        LOWORD(to[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithConnection, re-initializing", (uint8_t *)to, 2u);
        goto LABEL_8;
      }
      CFStringRef v22 = @"Must provide a connection";
    }
    else
    {
      CFStringRef v22 = @"Concrete implementation of CLIndoorXPCProvider must conform to CLIndoorXPCProviderImplementation";
    }
    id v23 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
LABEL_10:

  return v7;
}

- (void)dealloc
{
  id v3 = [(CLIndoorXPCProvider *)self impl];
  id v4 = [v3 endpointName];
  id v5 = [v4 UTF8String];

  if (dispatch_get_specific(&unk_1003E68B0) == self || !self->_frameworkQueue)
  {
    if (qword_10047BEE8 == -1)
    {
      unsigned int v9 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        [(CLIndoorXPCProvider *)self withinQueueInvalidate];
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_100452760);
      unsigned int v9 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
    }
    *(_DWORD *)buf = 136446210;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "dealloc connection to %{public}s", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
    v6 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v6 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "dealloc begins", buf, 2u);
  }
LABEL_6:
  frameworkQueue = self->_frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000B5A00;
  block[3] = &unk_1004526B0;
  id v12 = self;
  v8 = v12;
  dispatch_sync(frameworkQueue, block);

LABEL_11:
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorXPCProvider;
  [(CLIndoorXPCProvider *)&v10 dealloc];
}

- (void)invalidate
{
  frameworkQueue = self->_frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000B5B78;
  block[3] = &unk_1004526E0;
  id v5 = self;
  id v3 = v5;
  dispatch_sync(frameworkQueue, block);
}

- (void)withinQueueInvalidate
{
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
  }
  id v3 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    id v5 = [(CLIndoorXPCProvider *)self impl];
    v6 = [v5 endpointName];
    int v10 = 134349314;
    uint64_t v11 = connection;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "About to invalidate connection %{public}p to %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  interruptReconnection = self->_interruptReconnection;
  if (interruptReconnection) {
    dispatch_source_cancel(interruptReconnection);
  }
  v8 = self->_connection;
  self->_connection = 0;

  unsigned int v9 = [(CLIndoorXPCProvider *)self impl];
  [v9 withinQueueInvalidateState];
}

- (void)withinQueueInitializeConnection
{
  id v3 = [(CLIndoorXPCProvider *)self impl];
  id v4 = [v3 remoteObjectProtocol];
  id v5 = +[NSXPCInterface interfaceWithProtocol:v4];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  __int16 v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3321888768;
  id v14 = sub_1000B6C00;
  v15 = &unk_100452780;
  objc_copyWeak(&v16, &to);
  v6 = objc_retainBlock(&v12);
  objc_destroyWeak(&v16);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v6];

  objc_destroyWeak(&to);
  objc_initWeak(&from, self);
  objc_copyWeak(&v8, &from);
  __int16 v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3321888768;
  id v14 = sub_1000B6CB8;
  v15 = &unk_1004527D8;
  objc_copyWeak(&v16, &v8);
  v7 = objc_retainBlock(&v12);
  objc_destroyWeak(&v16);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v7];

  objc_destroyWeak(&v8);
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)withinQueueInterruptionHandler
{
  id v3 = [(CLIndoorXPCProvider *)self impl];
  id v4 = [v3 withinQueuePermanentShutdownReason];

  if (v4)
  {
    if (qword_10047BEE8 != -1) {
      dispatch_once(&qword_10047BEE8, &stru_100452760);
    }
    id v5 = (id)qword_10047BEF0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(CLIndoorXPCProvider *)self impl];
      v7 = [v6 endpointName];
      id v8 = [v4 description];
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC connection invalidated by daemon to %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [(CLIndoorXPCProvider *)self withinQueueInvalidate];
  }
  else
  {
    if (qword_10047BEE8 != -1) {
      dispatch_once(&qword_10047BEE8, &stru_100452760);
    }
    unsigned int v9 = (id)qword_10047BEF0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(CLIndoorXPCProvider *)self impl];
      uint64_t v11 = [v10 endpointName];
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "pipelined interruption handler for %{public}@", (uint8_t *)&v12, 0xCu);
    }
    [(CLIndoorXPCProvider *)self withinQueueHandleReconnect:std::chrono::steady_clock::now().__d_.__rep_];
  }
}

- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  unsigned int v5 = -[CLIndoorXPCProvider withinQueueShouldReinitializeRemote:](self, "withinQueueShouldReinitializeRemote:");
  if (v5 == 1)
  {
    [(CLIndoorXPCProvider *)self withinQueueReinitializeRemoteState];
    if (self->_lastReconnectTime.m_initialized)
    {
LABEL_5:
      *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
      return;
    }
  }
  else
  {
    if (v5 == 2) {
      [(CLIndoorXPCProvider *)self withinQueueScheduleReconnect:*(void *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) - a3.var0.__rep_ + 10000000000 reason:@"deferred re-initialization"];
    }
    if (self->_lastReconnectTime.m_initialized) {
      goto LABEL_5;
    }
  }
  self->_lastReconnectTime.m_initialized = 1;
  *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
}

- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  unsigned int v5 = [(CLIndoorXPCProvider *)self impl];
  unsigned __int8 v6 = [v5 withinQueueCanReinitializeRemoteState];

  if (v6)
  {
    if (self->_lastReconnectTime.m_initialized
      && a3.var0.__rep_ - *(void *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) < 10000000000)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (qword_10047BEE8 != -1) {
      dispatch_once(&qword_10047BEE8, &stru_100452760);
    }
    id v8 = (id)qword_10047BEF0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = [(CLIndoorXPCProvider *)self impl];
      int v10 = [v9 endpointName];
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Already invalidated/no remote state - ignoring request to re-initialize %{public}@", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
}

- (void)withinQueueReinitializeRemoteState
{
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
  }
  id v3 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(CLIndoorXPCProvider *)self impl];
    unsigned int v5 = [v4 endpointName];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "re-initializing pipelined connection to %{public}@ with existing state", (uint8_t *)&v7, 0xCu);
  }
  unsigned __int8 v6 = [(CLIndoorXPCProvider *)self impl];
  [v6 withinQueueReinitializeRemoteState];
}

- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  id v6 = a4;
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_100452760);
  }
  int v7 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(CLIndoorXPCProvider *)self impl];
    unsigned int v9 = [v8 endpointName];
    int v11 = 138543874;
    int v12 = v9;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2048;
    int64_t v16 = a3.__rep_ / 1000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Connection to %{public}@ %{public}@ - retrying in %lld milliseconds", (uint8_t *)&v11, 0x20u);
  }
  dispatch_time_t v10 = dispatch_time(0, a3.__rep_);
  dispatch_source_set_timer((dispatch_source_t)self->_interruptReconnection, v10, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
}

- (id)_defaultErrHandlerForCaller:(id)a3
{
  id v3 = [(CLIndoorXPCProvider *)self _defaultErrHandler:&stru_100452710 forCaller:a3];

  return v3;
}

- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768;
  v11[2] = sub_1000B6990;
  v11[3] = &unk_100452730;
  id v5 = a4;
  id v6 = objc_retainBlock(a3);
  id v7 = v5;
  id v12 = v7;
  id v13 = objc_retainBlock(v6);
  id v8 = objc_retainBlock(v11);

  unsigned int v9 = objc_retainBlock(v8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptReconnection, 0);
  if (self->_lastReconnectTime.m_initialized) {
    self->_lastReconnectTime.m_initialized = 0;
  }
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_frameworkQueue, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  return self;
}

@end