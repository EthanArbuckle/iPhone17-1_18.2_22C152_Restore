@interface _NFSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)allowsBackgroundMode;
- (BOOL)didEnd;
- (BOOL)didStart;
- (BOOL)forceExpressExit;
- (BOOL)isEnding;
- (BOOL)isFeatureSupported:(unint64_t)a3;
- (BOOL)isSessionSEOnly;
- (BOOL)isSuspended;
- (BOOL)needsCleanup;
- (BOOL)priority;
- (BOOL)shouldHandleSecureElementTransactionData;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)willStartSession;
- (NFExpressModeManager)expressModeManager;
- (NSData)backgroundTagReadCustomECP;
- (NSData)parentToken;
- (NSData)token;
- (NSDate)creation;
- (NSDate)dequeueDate;
- (NSMutableArray)startOnFieldList;
- (NSMutableArray)suspendOnFieldList;
- (NSString)sessionUID;
- (OS_dispatch_queue)workQueue;
- (_NFSession)initWithWorkQueue:(id)a3 expressModeManager:(id)a4 allowsBackgroundMode:(BOOL)a5;
- (_NFSessionQueue)queue;
- (id)clientName;
- (id)initialECPConfig;
- (id)initialRoutingConfig;
- (id)powerAssertionIdentifier;
- (int)processIdentifier;
- (int)sessionID;
- (unint64_t)backgroundTagReadEcpOption;
- (unint64_t)fieldHandlingInSuspension;
- (unint64_t)serviceType;
- (unint64_t)signpostId;
- (unsigned)uid;
- (void)activateWithToken:(id)a3 completion:(id)a4;
- (void)createHandoffTokenWithCompletion:(id)a3;
- (void)dealloc;
- (void)didEndSession:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession:(id)a3;
- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4;
- (void)holdAssertion;
- (void)internalEndSession:(id)a3;
- (void)prioritizeSessionWithCompletion:(id)a3;
- (void)releaseAssertion;
- (void)resume;
- (void)setBackgroundTagReadCustomECP:(id)a3;
- (void)setBackgroundTagReadEcpOption:(unint64_t)a3;
- (void)setFieldHandlingInSuspension:(unint64_t)a3;
- (void)setForceExpressExit:(BOOL)a3;
- (void)setParentToken:(id)a3;
- (void)setPriority:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setServiceType:(unint64_t)a3;
- (void)setSessionID:(int)a3;
- (void)setStartOnFieldList:(id)a3;
- (void)setSuspendOnFieldList:(id)a3;
- (void)setUid:(unsigned int)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _NFSession

- (_NFSession)initWithWorkQueue:(id)a3 expressModeManager:(id)a4 allowsBackgroundMode:(BOOL)a5
{
  v8 = (OS_dispatch_queue *)a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_NFSession;
  v10 = [(_NFSession *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_workQueue = v8;
    v10->_isEnding = 0;
    v10->_allowsBackgroundMode = a5;
    objc_storeStrong((id *)&v10->_expressModeManager, a4);
    uint64_t v12 = +[NSDate now];
    creation = v11->_creation;
    v11->_creation = (NSDate *)v12;

    id v14 = objc_alloc((Class)NSString);
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    +[NSDate timeIntervalSinceReferenceDate];
    v18 = (NSString *)[v14 initWithFormat:@"%@-%lf", v16, v17];
    sessionUID = v11->_sessionUID;
    v11->_sessionUID = v18;

    v20 = NFSharedSignpostLog();
    v11->_signpostId = os_signpost_id_generate(v20);

    v11->_serviceType = 1;
  }

  return v11;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig routingOffWithFD:1];
}

- (id)initialECPConfig
{
  return 0;
}

+ (id)validateEntitlements:(id)a3
{
  return 0;
}

- (void)dealloc
{
  [(_NFSession *)self releaseObjects];
  v3.receiver = self;
  v3.super_class = (Class)_NFSession;
  [(_NFSession *)&v3 dealloc];
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

- (void)holdAssertion
{
  if (!self->_hasAssertion)
  {
    objc_super v3 = +[NFPowerAssertion sharedPowerAssertion];
    v4 = [(_NFSession *)self powerAssertionIdentifier];
    [v3 holdPowerAssertion:v4 onBehalfOf:-[_NFSession processIdentifier](self, "processIdentifier")];

    self->_hasAssertion = 1;
  }
}

- (void)releaseAssertion
{
  if (self->_hasAssertion)
  {
    objc_super v3 = +[NFPowerAssertion sharedPowerAssertion];
    v4 = [(_NFSession *)self powerAssertionIdentifier];
    [v3 releasePowerAssertion:v4];

    self->_hasAssertion = 0;
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = [v5 NF_numberForKey:@"ReasonCode"];
  v8 = v7;
  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class)) {
        uint64_t v21 = 43;
      }
      else {
        uint64_t v21 = 45;
      }
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Missing reason code", v21, ClassName, Name, 117);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    v24 = object_getClass(v6);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v56 = v25;
    __int16 v57 = 2082;
    v58 = object_getClassName(v6);
    __int16 v59 = 2082;
    v60 = sel_getName(a2);
    __int16 v61 = 1024;
    int v62 = 117;
    v18 = "%c[%{public}s %{public}s]:%i Missing reason code";
    goto LABEL_58;
  }
  if ([v7 integerValue])
  {
    if ([v8 integerValue] == (id)2)
    {
      id v9 = [v5 objectForKey:@"Field"];

      if (!v9)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v10)
        {
          v11 = object_getClass(v6);
          if (class_isMetaClass(v11)) {
            uint64_t v12 = 43;
          }
          else {
            uint64_t v12 = 45;
          }
          v13 = object_getClassName(v6);
          id v14 = sel_getName(a2);
          v10(3, "%c[%{public}s %{public}s]:%i Missing field", v12, v13, v14, 129);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v15 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        v16 = object_getClass(v6);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v56 = v17;
        __int16 v57 = 2082;
        v58 = object_getClassName(v6);
        __int16 v59 = 2082;
        v60 = sel_getName(a2);
        __int16 v61 = 1024;
        int v62 = 129;
        v18 = "%c[%{public}s %{public}s]:%i Missing field";
LABEL_58:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x22u);
LABEL_59:

        BOOL v46 = 0;
        goto LABEL_60;
      }
    }
  }
  else if (!v6->_token)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v47)
    {
      v48 = object_getClass(v6);
      if (class_isMetaClass(v48)) {
        uint64_t v49 = 43;
      }
      else {
        uint64_t v49 = 45;
      }
      v50 = object_getClassName(v6);
      v51 = sel_getName(a2);
      v47(3, "%c[%{public}s %{public}s]:%i Missing token", v49, v50, v51, 123);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    v52 = object_getClass(v6);
    if (class_isMetaClass(v52)) {
      int v53 = 43;
    }
    else {
      int v53 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v56 = v53;
    __int16 v57 = 2082;
    v58 = object_getClassName(v6);
    __int16 v59 = 2082;
    v60 = sel_getName(a2);
    __int16 v61 = 1024;
    int v62 = 123;
    v18 = "%c[%{public}s %{public}s]:%i Missing token";
    goto LABEL_58;
  }
  BOOL isSuspended = v6->_isSuspended;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (isSuspended)
  {
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
    {
      v28 = object_getClass(v6);
      if (class_isMetaClass(v28)) {
        uint64_t v29 = 43;
      }
      else {
        uint64_t v29 = 45;
      }
      v30 = object_getClassName(v6);
      v31 = sel_getName(a2);
      v27(4, "%c[%{public}s %{public}s]:%i Already in suspended state", v29, v30, v31, 135);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    v32 = object_getClass(v6);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v56 = v33;
    __int16 v57 = 2082;
    v58 = object_getClassName(v6);
    __int16 v59 = 2082;
    v60 = sel_getName(a2);
    __int16 v61 = 1024;
    int v62 = 135;
    v18 = "%c[%{public}s %{public}s]:%i Already in suspended state";
    goto LABEL_58;
  }
  v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v34)
  {
    v35 = object_getClass(v6);
    if (class_isMetaClass(v35)) {
      uint64_t v36 = 43;
    }
    else {
      uint64_t v36 = 45;
    }
    v37 = object_getClassName(v6);
    v38 = sel_getName(a2);
    v34(6, "%c[%{public}s %{public}s]:%i Suspending session %{public}@ using token %{public}@", v36, v37, v38, 139, v6->_sessionUID, v6->_token);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v39 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = object_getClass(v6);
    if (class_isMetaClass(v40)) {
      int v41 = 43;
    }
    else {
      int v41 = 45;
    }
    v42 = object_getClassName(v6);
    v43 = sel_getName(a2);
    sessionUID = v6->_sessionUID;
    token = v6->_token;
    *(_DWORD *)buf = 67110402;
    int v56 = v41;
    __int16 v57 = 2082;
    v58 = v42;
    __int16 v59 = 2082;
    v60 = v43;
    __int16 v61 = 1024;
    int v62 = 139;
    __int16 v63 = 2114;
    v64 = sessionUID;
    __int16 v65 = 2114;
    v66 = token;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspending session %{public}@ using token %{public}@", buf, 0x36u);
  }

  BOOL v46 = 1;
  v6->_BOOL isSuspended = 1;
  [(_NFSession *)v6 releaseAssertion];
LABEL_60:

  objc_sync_exit(v6);
  return v46;
}

- (void)resume
{
  objc_super v3 = self;
  objc_sync_enter(v3);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v3);
    if (class_isMetaClass(Class)) {
      uint64_t v6 = 43;
    }
    else {
      uint64_t v6 = 45;
    }
    ClassName = object_getClassName(v3);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Resuming session %{public}@", v6, ClassName, Name, 150, v3->_sessionUID);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = object_getClass(v3);
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    uint64_t v12 = object_getClassName(v3);
    v13 = sel_getName(a2);
    sessionUID = v3->_sessionUID;
    *(_DWORD *)buf = 67110146;
    int v17 = v11;
    __int16 v18 = 2082;
    v19 = v12;
    __int16 v20 = 2082;
    uint64_t v21 = v13;
    __int16 v22 = 1024;
    int v23 = 150;
    __int16 v24 = 2114;
    int v25 = sessionUID;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming session %{public}@", buf, 0x2Cu);
  }

  v3->_BOOL isSuspended = 0;
  token = v3->_token;
  v3->_token = 0;

  [(_NFSession *)v3 holdAssertion];
  objc_sync_exit(v3);
}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 0;
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Unimplemented", v11, ClassName, Name, 164);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v14;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    uint64_t v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 164;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unimplemented", buf, 0x22u);
  }
}

- (id)powerAssertionIdentifier
{
  objc_super v3 = [(_NFSession *)self clientName];
  v4 = v3;
  if (!v3 || ![(__CFString *)v3 length])
  {

    v4 = @"unavailable";
  }
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"process:%@, %s,sessionID:%d", v4, object_getClassName(self), self->_sessionID];

  return v5;
}

- (id)clientName
{
  return @"nfcd";
}

- (int)processIdentifier
{
  return 0;
}

- (BOOL)isSessionSEOnly
{
  return 0;
}

- (BOOL)isFeatureSupported:(unint64_t)a3
{
  if (a3)
  {
    char v4 = a3;
    if ((a3 & 1) == 0)
    {
      unsigned int v5 = 1;
      if ((a3 & 2) == 0) {
        return v5;
      }
      goto LABEL_16;
    }
    unsigned int v5 = [(_NFSession *)self allowsBackgroundMode];
    if ((v4 & 2) != 0) {
LABEL_16:
    }
      v5 &= [(_NFSession *)self forceExpressExit];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Invalid input", v12, ClassName, Name, 200);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v19 = v15;
      __int16 v20 = 2082;
      uint64_t v21 = object_getClassName(self);
      __int16 v22 = 2082;
      int v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 200;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid input", buf, 0x22u);
    }

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)needsCleanup
{
  BOOL v3 = [(_NFSession *)self didStart];
  if (v3) {
    LOBYTE(v3) = ![(_NFSession *)self didEnd];
  }
  return v3;
}

- (void)didEndSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v6->_didEnd)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class)) {
        uint64_t v9 = 43;
      }
      else {
        uint64_t v9 = 45;
      }
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Session has ended previously", v9, ClassName, Name, 235);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(v6);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v34 = v14;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = object_getClassName(v6);
      *(_WORD *)&v34[14] = 2082;
      *(void *)&v34[16] = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 235;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has ended previously", buf, 0x22u);
    }

    objc_sync_exit(v6);
LABEL_13:

    goto LABEL_14;
  }
  objc_sync_exit(v6);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFLogGetLogger();
  if (v15)
  {
    v16 = (void (*)(uint64_t, const char *, ...))v15;
    int v17 = object_getClass(v6);
    if (class_isMetaClass(v17)) {
      uint64_t v18 = 43;
    }
    else {
      uint64_t v18 = 45;
    }
    int v19 = object_getClassName(v6);
    __int16 v20 = sel_getName(a2);
    uint64_t v21 = [(_NFSession *)v6 clientName];
    v16(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", v18, v19, v20, 240, v21, [(_NFSession *)v6 processIdentifier], v6->_sessionUID);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = object_getClass(v6);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(v6);
    v26 = sel_getName(a2);
    v27 = [(_NFSession *)v6 clientName];
    unsigned int v28 = [(_NFSession *)v6 processIdentifier];
    sessionUID = v6->_sessionUID;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v34 = v24;
    *(_WORD *)&v34[4] = 2082;
    *(void *)&v34[6] = v25;
    *(_WORD *)&v34[14] = 2082;
    *(void *)&v34[16] = v26;
    __int16 v35 = 1024;
    int v36 = 240;
    __int16 v37 = 2114;
    v38 = v27;
    __int16 v39 = 1024;
    unsigned int v40 = v28;
    __int16 v41 = 2114;
    v42 = sessionUID;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", buf, 0x3Cu);
  }
  [(_NFSession *)v6 cleanup];
  v30 = v6;
  objc_sync_enter(v30);
  v6->_BOOL didEnd = 1;
  objc_sync_exit(v30);

  if (v30->_didStart)
  {
    NFSharedSignpostLog();
    uint64_t v6 = (_NFSession *)objc_claimAutoreleasedReturnValue();
    v31 = [(_NFSession *)v30 signpostId];
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&v6->super))
    {
      v32 = v30->_sessionUID;
      *(_DWORD *)buf = 138412546;
      *(void *)v34 = v32;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, &v6->super, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v31, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)willStartSession
{
  BOOL v3 = NFSharedSignpostLog();
  unint64_t v4 = [(_NFSession *)self signpostId];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, v5, "WILL_START_SESSION", (const char *)&unk_100286819, v9, 2u);
    }
  }

  uint64_t v6 = +[NSDate now];
  dequeueDate = self->_dequeueDate;
  self->_dequeueDate = v6;

  return 1;
}

- (void)didStartSession:(id)a3
{
  os_signpost_id_t v5 = (__CFString *)a3;
  uint64_t v6 = NFSharedSignpostLog();
  unint64_t v7 = [(_NFSession *)self signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      sessionUID = self->_sessionUID;
      *(_DWORD *)buf = 138412546;
      *(void *)__int16 v35 = sessionUID;
      *(_WORD *)&v35[8] = 2112;
      *(void *)&v35[10] = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = [(_NFSession *)self clientName];
    uint64_t v17 = [(_NFSession *)self processIdentifier];
    if (v5) {
      CFStringRef v18 = v5;
    }
    else {
      CFStringRef v18 = &stru_100309C40;
    }
    uint64_t v19 = 43;
    if (!isMetaClass) {
      uint64_t v19 = 45;
    }
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@ ID:%d %@", v19, ClassName, Name, 263, v16, v17, self->_sessionUID, self->_sessionID, v18);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    int v23 = object_getClassName(self);
    int v24 = sel_getName(a2);
    int v25 = [(_NFSession *)self clientName];
    unsigned int v26 = [(_NFSession *)self processIdentifier];
    v27 = self->_sessionUID;
    int sessionID = self->_sessionID;
    if (v5) {
      CFStringRef v29 = v5;
    }
    else {
      CFStringRef v29 = &stru_100309C40;
    }
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)__int16 v35 = v22;
    *(_WORD *)&v35[4] = 2082;
    *(void *)&v35[6] = v23;
    *(_WORD *)&v35[14] = 2082;
    *(void *)&v35[16] = v24;
    __int16 v36 = 1024;
    int v37 = 263;
    __int16 v38 = 2114;
    __int16 v39 = v25;
    __int16 v40 = 1024;
    unsigned int v41 = v26;
    __int16 v42 = 2114;
    v43 = v27;
    __int16 v44 = 1024;
    int v45 = sessionID;
    __int16 v46 = 2112;
    CFStringRef v47 = v29;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@ ID:%d %@", buf, 0x4Cu);
  }
  self->_didStart = 1;
  if (v5)
  {
    self->_BOOL didEnd = 1;
    v30 = NFSharedSignpostLog();
    unint64_t v31 = [(_NFSession *)self signpostId];
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v32 = v31;
      if (os_signpost_enabled(v30))
      {
        int v33 = self->_sessionUID;
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v35 = v33;
        *(_WORD *)&v35[8] = 2112;
        *(void *)&v35[10] = v5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v32, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
      }
    }
  }
}

- (void)internalEndSession:(id)a3
{
  os_signpost_id_t v5 = (void (**)(void))a3;
  uint64_t v6 = NFSharedSignpostLog();
  unint64_t v7 = [(_NFSession *)self signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "INTERNAL_END_SESSION", (const char *)&unk_100286819, buf, 2u);
    }
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  BOOL didEnd = v9->_didEnd;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (didEnd)
  {
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v9);
      if (class_isMetaClass(Class)) {
        uint64_t v13 = 43;
      }
      else {
        uint64_t v13 = 45;
      }
      ClassName = object_getClassName(v9);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Already ended", v13, ClassName, Name, 278);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(v9);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      uint64_t v19 = object_getClassName(v9);
      __int16 v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v33 = v18;
      __int16 v34 = 2082;
      __int16 v35 = v19;
      __int16 v36 = 2082;
      int v37 = v20;
      __int16 v38 = 1024;
      int v39 = 278;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    uint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21)
    {
      int v22 = object_getClass(v9);
      if (class_isMetaClass(v22)) {
        uint64_t v23 = 43;
      }
      else {
        uint64_t v23 = 45;
      }
      int v24 = object_getClassName(v9);
      int v25 = sel_getName(a2);
      v21(6, "%c[%{public}s %{public}s]:%i %{public}@", v23, v24, v25, 280, v9->_sessionUID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = object_getClass(v9);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      CFStringRef v29 = object_getClassName(v9);
      v30 = sel_getName(a2);
      sessionUID = v9->_sessionUID;
      *(_DWORD *)buf = 67110146;
      int v33 = v28;
      __int16 v34 = 2082;
      __int16 v35 = v29;
      __int16 v36 = 2082;
      int v37 = v30;
      __int16 v38 = 1024;
      int v39 = 280;
      __int16 v40 = 2114;
      unsigned int v41 = sessionUID;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v16 = [(_NFSession *)v9 queue];
    [v16 dequeueSession:v9];
  }

  objc_sync_exit(v9);
  if (v5) {
    v5[2](v5);
  }
}

- (void)endSession:(id)a3
{
  os_signpost_id_t v5 = (void (**)(void))a3;
  uint64_t v6 = NFSharedSignpostLog();
  unint64_t v7 = [(_NFSession *)self signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "END_SESSION", (const char *)&unk_100286819, buf, 2u);
    }
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  BOOL didEnd = v9->_didEnd;
  if (v9->_didEnd)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v9);
      if (class_isMetaClass(Class)) {
        uint64_t v13 = 43;
      }
      else {
        uint64_t v13 = 45;
      }
      ClassName = object_getClassName(v9);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Already ended", v13, ClassName, Name, 295);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(v9);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      uint64_t v19 = object_getClassName(v9);
      __int16 v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v27 = v18;
      __int16 v28 = 2082;
      CFStringRef v29 = v19;
      __int16 v30 = 2082;
      unint64_t v31 = v20;
      __int16 v32 = 1024;
      int v33 = 295;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    v9->_BOOL isEnding = 1;
    uint64_t v21 = [(_NFSession *)v9 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051AF0;
    block[3] = &unk_100301D38;
    block[4] = v9;
    SEL v25 = a2;
    int v24 = v5;
    dispatch_async(v21, block);
  }
  objc_sync_exit(v9);

  if (v5) {
    BOOL v22 = !didEnd;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22) {
    v5[2](v5);
  }
}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051D50;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)activateWithToken:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005215C;
  v12[3] = &unk_100301D60;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

- (void)createHandoffTokenWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, id))a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v6->_token)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class)) {
        uint64_t v9 = 43;
      }
      else {
        uint64_t v9 = 45;
      }
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Token already exists.", v9, ClassName, Name, 335);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(v6);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v48 = v14;
      __int16 v49 = 2082;
      v50 = object_getClassName(v6);
      __int16 v51 = 2082;
      v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 335;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Token already exists.", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
    uint64_t v17 = +[NSString stringWithUTF8String:"Invalid State"];
    __int16 v63 = v17;
    int v18 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    id v19 = [v15 initWithDomain:v16 code:12 userInfo:v18];
    v5[2](v5, 0, v19);
  }
  else if (v6->_isSuspended || !v6->_didStart || v6->_didEnd)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20)
    {
      uint64_t v21 = object_getClass(v6);
      if (class_isMetaClass(v21)) {
        uint64_t v22 = 43;
      }
      else {
        uint64_t v22 = 45;
      }
      uint64_t v23 = object_getClassName(v6);
      int v24 = sel_getName(a2);
      v20(3, "%c[%{public}s %{public}s]:%i Session not active", v22, v23, v24, 341);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = object_getClass(v6);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v48 = v27;
      __int16 v49 = 2082;
      v50 = object_getClassName(v6);
      __int16 v51 = 2082;
      v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 341;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

    id v28 = objc_alloc((Class)NSError);
    CFStringRef v29 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    __int16 v30 = +[NSString stringWithUTF8String:"Session not active"];
    __int16 v61 = v30;
    unint64_t v31 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    id v32 = [v28 initWithDomain:v29 code:54 userInfo:v31];
    v5[2](v5, 0, v32);
  }
  else
  {
    arc4random_buf(__buf, 0x10uLL);
    int v33 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:__buf length:16];
    token = v6->_token;
    v6->_token = v33;

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v35)
    {
      __int16 v36 = object_getClass(v6);
      if (class_isMetaClass(v36)) {
        uint64_t v37 = 43;
      }
      else {
        uint64_t v37 = 45;
      }
      __int16 v38 = object_getClassName(v6);
      int v39 = sel_getName(a2);
      v35(6, "%c[%{public}s %{public}s]:%i Session %{public}@ created token %{public}@", v37, v38, v39, 349, v6->_sessionUID, v6->_token);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = object_getClass(v6);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      v43 = object_getClassName(v6);
      __int16 v44 = sel_getName(a2);
      sessionUID = v6->_sessionUID;
      __int16 v46 = v6->_token;
      *(_DWORD *)buf = 67110402;
      int v48 = v42;
      __int16 v49 = 2082;
      v50 = v43;
      __int16 v51 = 2082;
      v52 = v44;
      __int16 v53 = 1024;
      int v54 = 349;
      __int16 v55 = 2114;
      int v56 = sessionUID;
      __int16 v57 = 2114;
      v58 = v46;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session %{public}@ created token %{public}@", buf, 0x36u);
    }

    ((void (**)(id, NSData *, id))v5)[2](v5, v6->_token, 0);
  }
  objc_sync_exit(v6);
}

- (_NFSessionQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (_NFSessionQueue *)a3;
}

- (NFExpressModeManager)expressModeManager
{
  return (NFExpressModeManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)startOnFieldList
{
  return self->_startOnFieldList;
}

- (void)setStartOnFieldList:(id)a3
{
}

- (NSMutableArray)suspendOnFieldList
{
  return self->_suspendOnFieldList;
}

- (void)setSuspendOnFieldList:(id)a3
{
}

- (NSString)sessionUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)creation
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)dequeueDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)parentToken
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setParentToken:(id)a3
{
}

- (NSData)backgroundTagReadCustomECP
{
  return self->_backgroundTagReadCustomECP;
}

- (void)setBackgroundTagReadCustomECP:(id)a3
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

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (unint64_t)backgroundTagReadEcpOption
{
  return self->_backgroundTagReadEcpOption;
}

- (void)setBackgroundTagReadEcpOption:(unint64_t)a3
{
  self->_backgroundTagReadEcpOption = a3;
}

- (unint64_t)fieldHandlingInSuspension
{
  return self->_fieldHandlingInSuspension;
}

- (void)setFieldHandlingInSuspension:(unint64_t)a3
{
  self->_fieldHandlingInSuspension = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
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

- (BOOL)allowsBackgroundMode
{
  return self->_allowsBackgroundMode;
}

- (BOOL)forceExpressExit
{
  return self->_forceExpressExit;
}

- (void)setForceExpressExit:(BOOL)a3
{
  self->_forceExpressExit = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (int)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(int)a3
{
  self->_int sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTagReadCustomECP, 0);
  objc_storeStrong((id *)&self->_parentToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_dequeueDate, 0);
  objc_storeStrong((id *)&self->_creation, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_suspendOnFieldList, 0);
  objc_storeStrong((id *)&self->_startOnFieldList, 0);

  objc_storeStrong((id *)&self->_expressModeManager, 0);
}

@end