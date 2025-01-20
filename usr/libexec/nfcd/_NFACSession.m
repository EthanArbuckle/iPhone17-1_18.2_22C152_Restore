@interface _NFACSession
- (BOOL)didEnd;
- (BOOL)didStart;
- (BOOL)isEnding;
- (BOOL)needsCleanup;
- (BOOL)priority;
- (BOOL)willStartSession;
- (NFACDriverWrapper)driverWrapper;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)workQueue;
- (_NFACSession)init;
- (_NFACSession)initWithRemoteObject:(id)a3 workQueue:(id)a4;
- (_NFSessionQueue)queue;
- (id)_powerAssertionIdentifier;
- (id)clientName;
- (id)remoteObject;
- (unint64_t)sessionID;
- (void)cleanup;
- (void)didEndSession:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession:(id)a3;
- (void)internalEndSession:(id)a3;
- (void)releaseRemoteObject;
- (void)setConnection:(id)a3;
- (void)setDriverWrapper:(id)a3;
- (void)setPriority:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _NFACSession

- (_NFACSession)init
{
  return [(_NFACSession *)self initWithRemoteObject:0 workQueue:0];
}

- (_NFACSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  v12.receiver = self;
  v12.super_class = (Class)_NFACSession;
  v9 = [(_NFACSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_remoteObject, a3);
    v10->_workQueue = v8;
    v10->_isEnding = 0;
    v10->_driverOpen = 0;
  }

  return v10;
}

- (void)releaseRemoteObject
{
  self->_remoteObject = 0;
  _objc_release_x1();
}

- (BOOL)isEnding
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isEnding = v2->_isEnding;
  objc_sync_exit(v2);

  return isEnding;
}

- (BOOL)didEnd
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL didEnd = v2->_didEnd;
  objc_sync_exit(v2);

  return didEnd;
}

- (id)_powerAssertionIdentifier
{
  v3 = [(_NFACSession *)self clientName];
  v4 = v3;
  if (!v3 || ![(__CFString *)v3 length])
  {

    v4 = @"unavailable";
  }
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"process:%@,pid:%d,%s,sessionID:%lu", v4, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), object_getClassName(self), self->_sessionID];

  return v5;
}

- (id)clientName
{
  v3 = [(_NFACSession *)self connection];

  if (!v3) {
    goto LABEL_3;
  }
  v4 = [(_NFACSession *)self connection];
  id v5 = [v4 NF_userInfo];
  v6 = [v5 objectForKeyedSubscript:@"ClientName"];

  if (!v6) {
LABEL_3:
  }
    v6 = &stru_100309C40;

  return v6;
}

- (BOOL)needsCleanup
{
  BOOL v3 = [(_NFACSession *)self didStart];
  if (v3) {
    LOBYTE(v3) = ![(_NFACSession *)self didEnd];
  }
  return v3;
}

- (void)cleanup
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 99);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v12;
    __int16 v22 = 2082;
    v23 = object_getClassName(self);
    __int16 v24 = 2082;
    v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 99;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v13 = self;
  objc_sync_enter(v13);
  BOOL driverOpen = v13->_driverOpen;
  v13->_BOOL driverOpen = 0;
  objc_sync_exit(v13);

  if (driverOpen)
  {
    driverWrapper = v13->_driverWrapper;
    v16 = [(_NFACSession *)v13 _powerAssertionIdentifier];
    [(NFACDriverWrapper *)driverWrapper closeSession:v16];
  }
  v17 = +[NFPowerAssertion sharedPowerAssertion];
  v18 = [(_NFACSession *)v13 _powerAssertionIdentifier];
  [v17 releasePowerAssertion:v18];
}

- (void)didEndSession:(id)a3
{
  id v44 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 117);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v46 = v13;
    __int16 v47 = 2082;
    v48 = object_getClassName(self);
    __int16 v49 = 2082;
    v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 117;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v14 = self;
  objc_sync_enter(v14);
  if (v14->_didEnd)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v15)
    {
      v16 = object_getClass(v14);
      if (class_isMetaClass(v16)) {
        uint64_t v17 = 43;
      }
      else {
        uint64_t v17 = 45;
      }
      v18 = object_getClassName(v14);
      v19 = sel_getName(a2);
      v15(6, "%c[%{public}s %{public}s]:%i Session already ended", v17, v18, v19, 120);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = object_getClass(v14);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      v23 = object_getClassName(v14);
      __int16 v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v46 = v22;
      __int16 v47 = 2082;
      v48 = v23;
      __int16 v49 = 2082;
      v50 = v24;
      __int16 v51 = 1024;
      int v52 = 120;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended", buf, 0x22u);
    }

    objc_sync_exit(v14);
  }
  else
  {
    objc_sync_exit(v14);

    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
    {
      v28 = object_getClass(v14);
      if (class_isMetaClass(v28)) {
        uint64_t v29 = 43;
      }
      else {
        uint64_t v29 = 45;
      }
      v30 = object_getClassName(v14);
      v31 = sel_getName(a2);
      v32 = [(_NFACSession *)v14 clientName];
      v33 = [(_NFACSession *)v14 connection];
      v27(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", v29, v30, v31, 126, v32, [v33 processIdentifier], v26, v44);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = object_getClass(v14);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      v37 = object_getClassName(v14);
      v38 = sel_getName(a2);
      v39 = [(_NFACSession *)v14 clientName];
      v40 = [(_NFACSession *)v14 connection];
      unsigned int v41 = [v40 processIdentifier];
      *(_DWORD *)buf = 67110658;
      int v46 = v36;
      __int16 v47 = 2082;
      v48 = v37;
      __int16 v49 = 2082;
      v50 = v38;
      __int16 v51 = 1024;
      int v52 = 126;
      __int16 v53 = 2114;
      v54 = v39;
      __int16 v55 = 1024;
      unsigned int v56 = v41;
      __int16 v57 = 2114;
      uint64_t v58 = v26;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", buf, 0x3Cu);
    }
    [(_NFACSession *)v14 cleanup];
    v42 = v14;
    objc_sync_enter(v42);
    v14->_BOOL didEnd = 1;
    objc_sync_exit(v42);

    v14 = (_NFACSession *)v26;
  }
}

- (BOOL)willStartSession
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 136);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v12;
    __int16 v34 = 2082;
    v35 = object_getClassName(self);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 136;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  int v13 = +[NFPowerAssertion sharedPowerAssertion];
  v14 = [(_NFACSession *)self _powerAssertionIdentifier];
  [v13 holdPowerAssertion:v14 onBehalfOf:-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")];

  driverWrapper = self->_driverWrapper;
  v16 = [(_NFACSession *)self _powerAssertionIdentifier];
  id v17 = [(NFACDriverWrapper *)driverWrapper openSession:v16];

  if (v17 == (id)1)
  {
    v18 = self;
    objc_sync_enter(v18);
    v18->_BOOL driverOpen = 1;
    objc_sync_exit(v18);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      int v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      uint64_t v29 = object_getClassName(self);
      v31 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v22) {
        uint64_t v23 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v23, v29, v31, 143, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NFSharedLogGetLogger();
    v18 = (_NFACSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v33 = v25;
      __int16 v34 = 2082;
      v35 = v26;
      __int16 v36 = 2082;
      v37 = v27;
      __int16 v38 = 1024;
      int v39 = 143;
      __int16 v40 = 2048;
      id v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }
  }

  return v17 == (id)1;
}

- (void)didStartSession:(id)a3
{
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = [(_NFACSession *)self connection];
  v8 = [v7 NF_userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ClientName"];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = [(_NFACSession *)self connection];
    id v24 = [v16 processIdentifier];
    uint64_t v17 = 43;
    if (!isMetaClass) {
      uint64_t v17 = 45;
    }
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@", v17, ClassName, Name, 158, v9, v24, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    BOOL v22 = sel_getName(a2);
    uint64_t v23 = [(_NFACSession *)self connection];
    *(_DWORD *)buf = 67110658;
    int v26 = v20;
    __int16 v27 = 2082;
    v28 = v21;
    __int16 v29 = 2082;
    v30 = v22;
    __int16 v31 = 1024;
    int v32 = 158;
    __int16 v33 = 2114;
    __int16 v34 = v9;
    __int16 v35 = 1024;
    unsigned int v36 = [v23 processIdentifier];
    __int16 v37 = 2114;
    __int16 v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@", buf, 0x3Cu);
  }
  self->_didStart = 1;
}

- (void)internalEndSession:(id)a3
{
  id v5 = (void (**)(void))a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 166);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v39 = v14;
    __int16 v40 = 2082;
    id v41 = object_getClassName(self);
    __int16 v42 = 2082;
    v43 = sel_getName(a2);
    __int16 v44 = 1024;
    int v45 = 166;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v15 = self;
  objc_sync_enter(v15);
  BOOL didEnd = v15->_didEnd;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (didEnd)
  {
    uint64_t v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17)
    {
      v18 = object_getClass(v15);
      if (class_isMetaClass(v18)) {
        uint64_t v19 = 43;
      }
      else {
        uint64_t v19 = 45;
      }
      int v20 = object_getClassName(v15);
      int v21 = sel_getName(a2);
      v17(6, "%c[%{public}s %{public}s]:%i Already ended", v19, v20, v21, 169);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = object_getClass(v15);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      int v25 = object_getClassName(v15);
      int v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v24;
      __int16 v40 = 2082;
      id v41 = v25;
      __int16 v42 = 2082;
      v43 = v26;
      __int16 v44 = 1024;
      int v45 = 169;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    __int16 v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
    {
      v28 = object_getClass(v15);
      if (class_isMetaClass(v28)) {
        uint64_t v29 = 43;
      }
      else {
        uint64_t v29 = 45;
      }
      v30 = object_getClassName(v15);
      __int16 v31 = sel_getName(a2);
      v27(6, "%c[%{public}s %{public}s]:%i ", v29, v30, v31, 171);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v33 = object_getClass(v15);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      __int16 v35 = object_getClassName(v15);
      unsigned int v36 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v34;
      __int16 v40 = 2082;
      id v41 = v35;
      __int16 v42 = 2082;
      v43 = v36;
      __int16 v44 = 1024;
      int v45 = 171;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    BOOL v22 = [(_NFACSession *)v15 queue];
    [v22 dequeueSession:v15];
  }

  objc_sync_exit(v15);
  if (v5) {
    v5[2](v5);
  }
}

- (void)endSession:(id)a3
{
  id v5 = (void (**)(void))a3;
  v6 = self;
  objc_sync_enter(v6);
  BOOL didEnd = v6->_didEnd;
  if (v6->_didEnd)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class)) {
        uint64_t v10 = 43;
      }
      else {
        uint64_t v10 = 45;
      }
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Already ended", v10, ClassName, Name, 182);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = object_getClass(v6);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v22 = v15;
      __int16 v23 = 2082;
      int v24 = object_getClassName(v6);
      __int16 v25 = 2082;
      int v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 182;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    v6->_BOOL isEnding = 1;
    v16 = [(_NFACSession *)v6 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001592C4;
    block[3] = &unk_100301D38;
    block[4] = v6;
    SEL v20 = a2;
    uint64_t v19 = v5;
    dispatch_async(v16, block);
  }
  objc_sync_exit(v6);

  if (v5) {
    BOOL v17 = !didEnd;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17) {
    v5[2](v5);
  }
}

- (_NFSessionQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (_NFSessionQueue *)a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
}

- (NFACDriverWrapper)driverWrapper
{
  return (NFACDriverWrapper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  self->_workQueue = (OS_dispatch_queue *)a3;
}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 64, 1);
}

- (BOOL)priority
{
  return self->_priority;
}

- (void)setPriority:(BOOL)a3
{
  self->_priority = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_sessionName, 0);
}

@end