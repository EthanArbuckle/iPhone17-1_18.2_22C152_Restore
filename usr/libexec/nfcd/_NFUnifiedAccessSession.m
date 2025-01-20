@interface _NFUnifiedAccessSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)allowTransactionsInWiredMode;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)willStartSession;
- (NFDriverWrapper)driverWrapper;
- (NFStepUpController)stepUpController;
- (_NFUnifiedAccessSession)initWithRemoteObject:(id)a3 expressModeManager:(id)a4 driverWrapper:(id)a5 workQueue:(id)a6;
- (void)_invalidateStepupController;
- (void)cleanup;
- (void)didStartSession:(id)a3;
- (void)endSession:(id)a3;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5;
- (void)setDriverWrapper:(id)a3;
- (void)setStepUpController:(id)a3;
- (void)startSTSNotificationListenerEndpoint:(id)a3;
- (void)waitForSafeTransactionCompletion;
@end

@implementation _NFUnifiedAccessSession

- (_NFUnifiedAccessSession)initWithRemoteObject:(id)a3 expressModeManager:(id)a4 driverWrapper:(id)a5 workQueue:(id)a6
{
  id v7 = a5;
  id v12 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v17 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    id v20 = v7;
    id v21 = v12;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v23 = 45;
    if (isMetaClass) {
      uint64_t v23 = 43;
    }
    v30 = ClassName;
    id v12 = v21;
    id v7 = v20;
    v17(6, "%c[%{public}s %{public}s]:%i ", v23, v30, Name, 34);
  }
  v24 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v34 = v27;
    __int16 v35 = 2082;
    v36 = object_getClassName(self);
    __int16 v37 = 2082;
    v38 = sel_getName(v24);
    __int16 v39 = 1024;
    int v40 = 34;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v32.receiver = self;
  v32.super_class = (Class)_NFUnifiedAccessSession;
  v28 = [(_NFContactlessPaymentSession *)&v32 initWithRemoteObject:v15 workQueue:v13 expressModeManager:v14 allowsBackgroundMode:0 hostCardEmulationSupport:1];

  if (v28) {
    objc_storeStrong((id *)(v28 + 363), v7);
  }

  return (_NFUnifiedAccessSession *)v28;
}

- (BOOL)allowTransactionsInWiredMode
{
  return 1;
}

- (BOOL)willStartSession
{
  v3 = [NFStepUpController alloc];
  v4 = [(_NFSession *)self workQueue];
  v5 = [(NFStepUpController *)v3 initWithQueue:v4 driverWrapper:*(void *)(&self->super._transactionState + 1)];
  v6 = *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3);
  *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3) = v5;

  v8.receiver = self;
  v8.super_class = (Class)_NFUnifiedAccessSession;
  return [(_NFContactlessSession *)&v8 willStartSession];
}

- (void)startSTSNotificationListenerEndpoint:(id)a3
{
  id v5 = a3;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v12 = [(_NFSession *)self sessionUID];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 58, v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = [(_NFSession *)self sessionUID];
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      v24 = v17;
      __int16 v25 = 2082;
      v26 = v18;
      __int16 v27 = 1024;
      int v28 = 58;
      __int16 v29 = 2114;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
  }
  else
  {
    id v20 = [*(id *)((char *)&self->_driverWrapper + 3) connectToNotificationListener:v5];
  }
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v5 = a3;
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
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 80);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    v24 = object_getClassName(self);
    __int16 v25 = 2082;
    v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 80;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  id v15 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D9A0;
  block[3] = &unk_100301C90;
  block[4] = self;
  id v19 = v5;
  SEL v20 = a2;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5
{
}

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 118);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(a1);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v39 = v14;
    __int16 v40 = 2082;
    v41 = object_getClassName(a1);
    __int16 v42 = 2082;
    v43 = sel_getName(a2);
    __int16 v44 = 1024;
    int v45 = 118;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if [v5 seSessionAccess] && (objc_msgSend(v5, "hceAccess"))
  {
    id v15 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      v18 = object_getClass(a1);
      BOOL v19 = class_isMetaClass(v18);
      SEL v20 = object_getClassName(a1);
      __int16 v35 = sel_getName(a2);
      uint64_t v21 = 45;
      if (v19) {
        uint64_t v21 = 43;
      }
      v17(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v21, v20, v35, 120);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = object_getClass(a1);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      __int16 v25 = object_getClassName(a1);
      v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v24;
      __int16 v40 = 2082;
      v41 = v25;
      __int16 v42 = 2082;
      v43 = v26;
      __int16 v44 = 1024;
      int v45 = 120;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    id v27 = objc_alloc((Class)NSError);
    int v28 = +[NSString stringWithUTF8String:"nfcd"];
    v36[0] = NSLocalizedDescriptionKey;
    __int16 v29 = +[NSString stringWithUTF8String:"Not entitled"];
    v37[0] = v29;
    v37[1] = &off_10031F8A0;
    v36[1] = @"Line";
    v36[2] = @"Method";
    id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v37[2] = v30;
    v36[3] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 121];
    v37[3] = v31;
    objc_super v32 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    id v15 = [v27 initWithDomain:v28 code:32 userInfo:v32];
  }

  return v15;
}

- (void)cleanup
{
  v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFUnifiedAccessSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup]) {
    [(_NFUnifiedAccessSession *)self _invalidateStepupController];
  }
  v5.receiver = self;
  v5.super_class = (Class)_NFUnifiedAccessSession;
  [(_NFContactlessPaymentSession *)&v5 cleanup];
  v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFUnifiedAccessSession", buf, 2u);
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NFUnifiedAccessSession;
  BOOL v4 = [(_NFContactlessPaymentSession *)&v6 suspendWithInfo:a3];
  if (v4 && [(_NFSession *)self needsCleanup]) {
    [(_NFUnifiedAccessSession *)self _invalidateStepupController];
  }
  return v4;
}

- (void)_invalidateStepupController
{
  [*(id *)((char *)&self->_driverWrapper + 3) invalidate];
  v3 = *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3);
  *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3) = 0;
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  [(_NFUnifiedAccessSession *)self _invalidateStepupController];
  v5.receiver = self;
  v5.super_class = (Class)_NFUnifiedAccessSession;
  [(_NFXPCSession *)&v5 endSession:v4];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
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
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 164);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v44 = v14;
    __int16 v45 = 2082;
    v46 = object_getClassName(self);
    __int16 v47 = 2082;
    v48 = sel_getName(a2);
    __int16 v49 = 1024;
    int v50 = 164;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v42.receiver = self;
  v42.super_class = (Class)_NFUnifiedAccessSession;
  [(_NFContactlessPaymentSession *)&v42 didStartSession:v5];
  if (v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      uint64_t v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      __int16 v37 = object_getClassName(self);
      __int16 v40 = sel_getName(a2);
      uint64_t v19 = 45;
      if (v18) {
        uint64_t v19 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v19, v37, v40, 167, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      __int16 v23 = object_getClassName(self);
      int v24 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v44 = v22;
      __int16 v45 = 2082;
      v46 = v23;
      __int16 v47 = 2082;
      v48 = v24;
      __int16 v49 = 1024;
      int v50 = 167;
      __int16 v51 = 2114;
      id v52 = v5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
    }

    __int16 v25 = [(_NFXPCSession *)self remoteObject];
    [v25 didStartSession:v5];
  }
  else
  {
    __int16 v25 = [*(id *)((char *)&self->_driverWrapper + 3) startISO18013WithConnectionHandoverConfiguration];
    if (v25)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v26 = NFLogGetLogger();
      if (v26)
      {
        id v27 = (void (*)(uint64_t, const char *, ...))v26;
        int v28 = object_getClass(self);
        BOOL v29 = class_isMetaClass(v28);
        v38 = object_getClassName(self);
        v41 = sel_getName(a2);
        uint64_t v30 = 45;
        if (v29) {
          uint64_t v30 = 43;
        }
        v27(3, "%c[%{public}s %{public}s]:%i Reader start error: %{public}@", v30, v38, v41, 173, v25);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_super v32 = object_getClass(self);
        if (class_isMetaClass(v32)) {
          int v33 = 43;
        }
        else {
          int v33 = 45;
        }
        int v34 = object_getClassName(self);
        __int16 v35 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v44 = v33;
        __int16 v45 = 2082;
        v46 = v34;
        __int16 v47 = 2082;
        v48 = v35;
        __int16 v49 = 1024;
        int v50 = 173;
        __int16 v51 = 2114;
        id v52 = v25;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader start error: %{public}@", buf, 0x2Cu);
      }
    }
    v36 = [(_NFXPCSession *)self remoteObject];
    [v36 didStartSession:v25];
  }
}

- (void)waitForSafeTransactionCompletion
{
  if ([(_NFContactlessPaymentSession *)self dontWaitForEOT])
  {
    usleep(0x2710u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)_NFUnifiedAccessSession;
    [(_NFContactlessPaymentSession *)&v3 waitForSafeTransactionCompletion];
  }
}

- (NFDriverWrapper)driverWrapper
{
  return *(NFDriverWrapper **)(&self->super._transactionState + 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFStepUpController)stepUpController
{
  return *(NFStepUpController **)((char *)&self->_driverWrapper + 3);
}

- (void)setStepUpController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), 0);

  objc_storeStrong((id *)(&self->super._transactionState + 1), 0);
}

@end