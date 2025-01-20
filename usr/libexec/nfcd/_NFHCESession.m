@interface _NFHCESession
+ (id)validateEntitlements:(id)a3;
- (BOOL)disableAutoStartOnField;
- (BOOL)emulationOnSessionStart;
- (BOOL)readOnConnected;
- (BOOL)suspendOnDisconnect;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)validateReceivedAPDU:(id)a3;
- (BOOL)willStartSession;
- (NFFieldNotification)sessionResumeField;
- (NFHCEBroadcastECPConfig)ecpBroadcastConfig;
- (NSData)effectiveECPFrame;
- (_NFHCESession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (id)_routingConfigWithECPBroadcastInHCE;
- (id)caLogger;
- (id)initialECPConfig;
- (id)initialRoutingConfig;
- (id)initialRoutingConfigWithField:(id)a3;
- (void)_asyncReadWithCompletion:(id)a3;
- (void)_didLoseTarget:(BOOL)a3 suspendAssertion:(BOOL)a4;
- (void)_syncStartAssertionTimer:(double)a3;
- (void)_syncStartEmulationWithCompletion:(id)a3;
- (void)asyncReadAPDUWithCompletion:(id)a3;
- (void)cleanup;
- (void)didEndSession:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleHceTargetLost;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)prioritizeSession:(id)a3;
- (void)readAPDUWithCompletion:(id)a3;
- (void)requestEmulationAssertion:(id)a3 completion:(id)a4;
- (void)restartDiscovery;
- (void)resume;
- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3;
- (void)sendAPDU:(id)a3 startReadOnCompletion:(BOOL)a4 completion:(id)a5;
- (void)setDisableAutoStartOnField:(BOOL)a3;
- (void)setEcpBroadcastConfig:(id)a3;
- (void)setEmulationOnSessionStart:(BOOL)a3;
- (void)setReadOnConnected:(BOOL)a3;
- (void)setSessionResumeField:(id)a3;
- (void)setSuspendOnDisconnect:(BOOL)a3;
- (void)startEmulationWithCompletion:(id)a3;
- (void)stopEmulationAndConfigWithRouting:(id)a3 completion:(id)a4;
- (void)stopEmulationWithCompletion:(id)a3;
- (void)suspensionStateUpdate:(BOOL)a3 triggeredByField:(id)a4;
@end

@implementation _NFHCESession

- (_NFHCESession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)_NFHCESession;
  v6 = [(_NFXPCSession *)&v10 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_connected = 0;
    v8 = v6;
  }

  return v7;
}

- (NSData)effectiveECPFrame
{
  v4 = [(_NFHCESession *)self ecpBroadcastConfig];

  if (v4)
  {
    uint64_t v5 = [(_NFHCESession *)self ecpBroadcastConfig];
    v6 = (void *)v5;
    if (v5) {
      v7 = *(void **)(v5 + 16);
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(5, "%c[%{public}s %{public}s]:%i Enabling FD & ECP Broadcast %@", v13, ClassName, Name, 74, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v31 = v16;
    __int16 v32 = 2082;
    v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 74;
    __int16 v38 = 2112;
    id v39 = v8;
    v17 = "%c[%{public}s %{public}s]:%i Enabling FD & ECP Broadcast %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x2Cu);
LABEL_14:

    goto LABEL_27;
  }
  if ((id)[(_NFSession *)self backgroundTagReadEcpOption] == (id)2)
  {
    id v8 = [(_NFSession *)self backgroundTagReadCustomECP];

    if (v8)
    {
      id v8 = [(_NFSession *)self backgroundTagReadCustomECP];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = NFLogGetLogger();
      if (v18)
      {
        v19 = (void (*)(uint64_t, const char *, ...))v18;
        v20 = object_getClass(self);
        BOOL v21 = class_isMetaClass(v20);
        v27 = object_getClassName(self);
        v29 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v21) {
          uint64_t v22 = 43;
        }
        v19(5, "%c[%{public}s %{public}s]:%i Enabling FD & custom ECP %@", v22, v27, v29, 78, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v31 = v24;
      __int16 v32 = 2082;
      v33 = object_getClassName(self);
      __int16 v34 = 2082;
      v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 78;
      __int16 v38 = 2112;
      id v39 = v8;
      v17 = "%c[%{public}s %{public}s]:%i Enabling FD & custom ECP %@";
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_27:

  return (NSData *)v8;
}

- (id)caLogger
{
  return self->_hceCALogger;
}

+ (id)validateEntitlements:(id)a3
{
  if ([a3 hceAccess])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v11, ClassName, Name, 91);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 91;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    int v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031AD10;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 92];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (void)cleanup
{
  v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFHCESession", buf, 2u);
  }

  if ([(_NFSession *)self didStart] && ![(_NFSession *)self isSuspended])
  {
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
      v6(6, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", v10, ClassName, Name, 102);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(self);
      id v15 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v26 = v13;
      __int16 v27 = 2082;
      v28 = v14;
      __int16 v29 = 2082;
      v30 = v15;
      __int16 v31 = 1024;
      int v32 = 102;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", buf, 0x22u);
    }

    int v16 = +[_NFHardwareManager sharedHardwareManager];
    v17 = +[NFRoutingConfig routingOff];
    id v18 = [v16 setRoutingConfig:v17];
  }
  suspendAssertionDeadline = self->_suspendAssertionDeadline;
  self->_suspendAssertionDeadline = 0;

  [(NFTimer *)self->_emuAssertionTimer stopTimer];
  emuAssertionTimer = self->_emuAssertionTimer;
  self->_emuAssertionTimer = 0;

  BOOL v21 = sub_1001AED74();
  sub_1001AF914((uint64_t)v21);
  v24.receiver = self;
  v24.super_class = (Class)_NFHCESession;
  [(_NFSession *)&v24 cleanup];
  uint64_t v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFHCESession", buf, 2u);
  }
}

- (void)_syncStartAssertionTimer:(double)a3
{
  if (!self->_emuAssertionTimer)
  {
    id v6 = objc_alloc((Class)NFTimer);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100090EDC;
    v23[3] = &unk_100301C40;
    void v23[4] = self;
    v23[5] = a2;
    v7 = [(_NFSession *)self workQueue];
    id v8 = (NFTimer *)[v6 initWithCallback:v23 queue:v7];
    emuAssertionTimer = self->_emuAssertionTimer;
    self->_emuAssertionTimer = v8;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000911D4;
  v22[3] = &unk_100301C40;
  v22[4] = self;
  *(double *)&v22[5] = a3;
  os_unfair_lock_lock(&self->_lock);
  sub_1000911D4((uint64_t)v22);
  os_unfair_lock_unlock(&self->_lock);
  [(NFTimer *)self->_emuAssertionTimer startTimer:a3];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(5, "%c[%{public}s %{public}s]:%i Assertion timer (%{public}fs) started", v15, ClassName, Name, 140, *(void *)&a3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    id v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v25 = v18;
    __int16 v26 = 2082;
    __int16 v27 = v19;
    __int16 v28 = 2082;
    __int16 v29 = v20;
    __int16 v30 = 1024;
    int v31 = 140;
    __int16 v32 = 2050;
    double v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assertion timer (%{public}fs) started", buf, 0x2Cu);
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NFHCESession;
  BOOL v4 = [(_NFXPCSession *)&v9 suspendWithInfo:a3];
  if (v4)
  {
    remoteDev = self->_remoteDev;
    self->_remoteDev = 0;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100091338;
    v8[3] = &unk_100301C68;
    v8[4] = self;
    os_unfair_lock_lock(&self->_lock);
    sub_100091338((uint64_t)v8);
    os_unfair_lock_unlock(&self->_lock);
    sub_1000207D8((uint64_t)self->_hceCALogger);
    id v6 = sub_1001AED74();
    sub_1001AF914((uint64_t)v6);
  }
  return v4;
}

- (void)resume
{
  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  [(_NFXPCSession *)&v3 resume];
  sub_100020768((uint64_t)self->_hceCALogger);
}

- (id)_routingConfigWithECPBroadcastInHCE
{
  uint64_t v36 = 0;
  int v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  p_lock = &self->_lock;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  __int16 v32 = sub_100091A74;
  double v33 = &unk_100301EB8;
  __int16 v34 = self;
  v35 = &v36;
  id v5 = v31;
  os_unfair_lock_lock(p_lock);
  v32((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  if (!*((unsigned char *)v37 + 24))
  {
    id v6 = [(_NFHCESession *)self ecpBroadcastConfig];
    if (v6)
    {
      BOOL v7 = v6[3] == 0;

      if (!v7)
      {
        id v8 = [(_NFHCESession *)self ecpBroadcastConfig];
        if (v8)
        {
          LODWORD(v9) = v8[3];
          double v10 = (double)v9;
        }
        else
        {
          double v10 = 0.0;
        }

        [(_NFHCESession *)self _syncStartAssertionTimer:v10 / 1000.0];
      }
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v13 = 43;
    }
    else {
      uint64_t v13 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i ECP broadcast in HCE enabled", v13, ClassName, Name, 205);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    id v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v41 = v18;
    __int16 v42 = 2082;
    v43 = v19;
    __int16 v44 = 2082;
    v45 = v20;
    __int16 v46 = 1024;
    int v47 = 205;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ECP broadcast in HCE enabled", buf, 0x22u);
  }

  char v21 = [(_NFHCESession *)self emulationOnSessionStart];
  uint64_t v22 = [(_NFHCESession *)self ecpBroadcastConfig];
  v23 = (void *)v22;
  if (v22) {
    objc_super v24 = *(void **)(v22 + 16);
  }
  else {
    objc_super v24 = 0;
  }
  id v25 = v24;
  uint64_t v26 = [(_NFHCESession *)self ecpBroadcastConfig];
  __int16 v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = *(unsigned int *)(v26 + 8);
  }
  else {
    uint64_t v28 = 0;
  }
  __int16 v29 = sub_100091400(self, v21, v25, v28);

  _Block_object_dispose(&v36, 8);

  return v29;
}

- (id)initialRoutingConfigWithField:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFHCESession *)self ecpBroadcastConfig];

  if (!v6)
  {
    int v31 = sub_100091400(self, [(_NFHCESession *)self emulationOnSessionStart], 0, 0);
    goto LABEL_50;
  }
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
  id v8 = [v7 objectForKey:@"disableECPBroadcastInHCE"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v9 = [v8 BOOLValue];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i disableECPBroadcastInHCE override=%d", v14, ClassName, Name, 226, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(self);
      id v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v65 = v17;
      __int16 v66 = 2082;
      v67 = v18;
      __int16 v68 = 2082;
      v69 = v19;
      __int16 v70 = 1024;
      int v71 = 226;
      __int16 v72 = 1024;
      unsigned int v73 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i disableECPBroadcastInHCE override=%d", buf, 0x28u);
    }

    if (v9) {
      goto LABEL_26;
    }
  }
  v20 = [(_NFHCESession *)self ecpBroadcastConfig];
  if (v20)
  {
    uint64_t v21 = v20[3];

    if (v21)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v22 = [(_NFHCESession *)self ecpBroadcastConfig];
      v23 = (void *)v22;
      if (v22) {
        objc_super v24 = *(void **)(v22 + 24);
      }
      else {
        objc_super v24 = 0;
      }
      id v25 = v24;

      id v26 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v60;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v60 != v28) {
              objc_enumerationMutation(v25);
            }
            if ([*(id *)(*((void *)&v59 + 1) + 8 * i) isEqual:v5])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v32 = NFLogGetLogger();
              if (v32)
              {
                double v33 = (void (*)(uint64_t, const char *, ...))v32;
                __int16 v34 = object_getClass(self);
                BOOL v35 = class_isMetaClass(v34);
                uint64_t v36 = object_getClassName(self);
                v57 = sel_getName(a2);
                uint64_t v37 = 45;
                if (v35) {
                  uint64_t v37 = 43;
                }
                v33(6, "%c[%{public}s %{public}s]:%i Broadcast field matches", v37, v36, v57, 238);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v38 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                char v39 = object_getClass(self);
                if (class_isMetaClass(v39)) {
                  int v40 = 43;
                }
                else {
                  int v40 = 45;
                }
                int v41 = object_getClassName(self);
                __int16 v42 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v65 = v40;
                __int16 v66 = 2082;
                v67 = v41;
                __int16 v68 = 2082;
                v69 = v42;
                __int16 v70 = 1024;
                int v71 = 238;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Broadcast field matches", buf, 0x22u);
              }

              int v31 = [(_NFHCESession *)self _routingConfigWithECPBroadcastInHCE];

              goto LABEL_49;
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

LABEL_26:
      uint64_t v30 = sub_100091400(self, [(_NFHCESession *)self emulationOnSessionStart], 0, 0);
      goto LABEL_48;
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v43 = NFLogGetLogger();
  if (v43)
  {
    __int16 v44 = (void (*)(uint64_t, const char *, ...))v43;
    v45 = object_getClass(self);
    BOOL v46 = class_isMetaClass(v45);
    int v47 = object_getClassName(self);
    v58 = sel_getName(a2);
    uint64_t v48 = 45;
    if (v46) {
      uint64_t v48 = 43;
    }
    v44(6, "%c[%{public}s %{public}s]:%i Broadcast field match rules unavailable", v48, v47, v58, 232);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v49 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = object_getClass(self);
    if (class_isMetaClass(v50)) {
      int v51 = 43;
    }
    else {
      int v51 = 45;
    }
    v52 = object_getClassName(self);
    v53 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v65 = v51;
    __int16 v66 = 2082;
    v67 = v52;
    __int16 v68 = 2082;
    v69 = v53;
    __int16 v70 = 1024;
    int v71 = 232;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Broadcast field match rules unavailable", buf, 0x22u);
  }

  uint64_t v30 = [(_NFHCESession *)self _routingConfigWithECPBroadcastInHCE];
LABEL_48:
  int v31 = (void *)v30;
LABEL_49:

LABEL_50:

  return v31;
}

- (id)initialRoutingConfig
{
  char v3 = [(_NFHCESession *)self emulationOnSessionStart];
  uint64_t v4 = [(_NFHCESession *)self ecpBroadcastConfig];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 16);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [(_NFHCESession *)self ecpBroadcastConfig];
  unsigned int v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = *(unsigned int *)(v8 + 8);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = sub_100091400(self, v3, v7, v10);

  return v11;
}

- (id)initialECPConfig
{
  uint64_t v3 = [(_NFHCESession *)self ecpBroadcastConfig];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 16);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if ([v6 length])
  {
    uint64_t v7 = [(_NFHCESession *)self ecpBroadcastConfig];
    uint64_t v8 = (void *)v7;
    if (v7) {
      unsigned int v9 = *(void **)(v7 + 16);
    }
    else {
      unsigned int v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  v4.receiver = self;
  v4.super_class = (Class)_NFHCESession;
  return [(_NFSession *)&v4 willStartSession];
}

- (void)endSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  [(_NFXPCSession *)&v3 endSession:a3];
}

- (void)prioritizeSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  [(_NFXPCSession *)&v3 prioritizeSessionWithCompletion:a3];
}

- (void)didStartSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_NFHCESession;
  id v4 = a3;
  [(_NFSession *)&v11 didStartSession:v4];
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didStartSession:v4];

  if (!v4)
  {
    remoteDev = self->_remoteDev;
    self->_remoteDev = 0;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000923B8;
    v10[3] = &unk_100301C68;
    v10[4] = self;
    os_unfair_lock_lock(&self->_lock);
    sub_1000923B8((uint64_t)v10);
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v7 = objc_alloc_init(NFHceTagReadCALogger);
    hceCAuint64_t Logger = self->_hceCALogger;
    self->_hceCAuint64_t Logger = v7;

    sub_100020768((uint64_t)self->_hceCALogger);
    if ([(_NFSession *)self backgroundTagReadEcpOption])
    {
      unsigned int v9 = self->_hceCALogger;
      if (v9) {
        v9->_isConnectionHandover = 1;
      }
    }
  }
}

- (void)didEndSession:(id)a3
{
  id v5 = a3;
  if (![(_NFSession *)self didEnd])
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = [(_NFXPCSession *)self clientName];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v13, ClassName, Name, 309, v12);
    }
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(self);
      int v18 = sel_getName(a2);
      id v19 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)buf = 67110146;
      int v23 = v16;
      __int16 v24 = 2082;
      id v25 = v17;
      __int16 v26 = 2082;
      id v27 = v18;
      __int16 v28 = 1024;
      int v29 = 309;
      __int16 v30 = 2112;
      int v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);
    }
    sub_1000204B0((uint64_t)self->_hceCALogger);
    sub_1000207D8((uint64_t)self->_hceCALogger);
    hceCAuint64_t Logger = self->_hceCALogger;
    self->_hceCAuint64_t Logger = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)_NFHCESession;
  [(_NFSession *)&v21 didEndSession:v5];
}

- (void)suspensionStateUpdate:(BOOL)a3 triggeredByField:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v4 && [(_NFHCESession *)self disableAutoStartOnField]) {
    [(_NFHCESession *)self setSessionResumeField:v6];
  }
  uint64_t v7 = NFSharedSignpostLog();
  if (os_signpost_enabled(v7))
  {
    v9[0] = 67240192;
    v9[1] = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SESSION_SUSPEND_STATE_UPDATE", "started=%{public,signpost.description:attribute}d", (uint8_t *)v9, 8u);
  }

  uint64_t v8 = [(_NFXPCSession *)self remoteObject];
  [v8 suspensionStateUpdate:v4 triggeredByField:v6];
}

- (void)stopEmulationAndConfigWithRouting:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v16.receiver = self;
  v16.super_class = (Class)_NFHCESession;
  unsigned int v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100092824;
  v12[3] = &unk_100303130;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a2;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (BOOL)validateReceivedAPDU:(id)a3
{
  return 1;
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_remoteDev, a3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100092FD8;
  v12[3] = &unk_100301C68;
  v12[4] = self;
  os_unfair_lock_lock(&self->_lock);
  sub_100092FD8((uint64_t)v12);
  os_unfair_lock_unlock(&self->_lock);
  id v7 = NFSharedSignpostLog();
  if (os_signpost_enabled(v7))
  {
    unsigned int v8 = [(_NFHCESession *)self readOnConnected];
    *(_DWORD *)buf = 67240192;
    unsigned int v14 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READER_DETECTED", "readOnConnected=%{public,signpost.description:attribute}d", buf, 8u);
  }

  unsigned int v9 = [(_NFXPCSession *)self remoteObject];
  [v9 didConnectToReader];

  id v10 = sub_1001AED74();
  sub_1001B0384((uint64_t)v10);
  sub_1000203B0((uint64_t)self->_hceCALogger);
  if ([(_NFHCESession *)self readOnConnected])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100092FF0;
    v11[3] = &unk_100303158;
    v11[4] = self;
    v11[5] = a2;
    [(_NFHCESession *)self _asyncReadWithCompletion:v11];
  }
}

- (void)handleFieldNotification:(id)a3
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
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %@", v10, ClassName, Name, 396, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = object_getClassName(self);
    __int16 v23 = 2082;
    __int16 v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 396;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  unsigned int v14 = NFSharedSignpostLog();
  if (os_signpost_enabled(v14))
  {
    unsigned int v15 = [(_NFHCESession *)self emulationOnSessionStart];
    *(_DWORD *)buf = 67240192;
    unsigned int v20 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_FIELD_NTF", "emulationOnSessionStart=%{public,signpost.description:attribute}d", buf, 8u);
  }

  objc_super v16 = [(_NFXPCSession *)self remoteObject];
  [v16 didReceiveField:v5];
}

- (void)_didLoseTarget:(BOOL)a3 suspendAssertion:(BOOL)a4
{
  if (a3)
  {
    id v7 = [(_NFXPCSession *)self remoteObject];
    [v7 didDisconnectFromReader];

    unsigned int v8 = NFSharedSignpostLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_TARGET_LOST", "onRFStateChange", buf, 2u);
    }
  }
  unsigned int v9 = sub_1001AED74();
  sub_1001AF914((uint64_t)v9);
  if ([(_NFHCESession *)self suspendOnDisconnect]
    && !a4
    && ![(_NFSession *)self isSuspended])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Suspending", v15, ClassName, Name, 419);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    objc_super v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      id v19 = object_getClassName(self);
      unsigned int v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v24 = v18;
      __int16 v25 = 2082;
      int v26 = v19;
      __int16 v27 = 2082;
      id v28 = v20;
      __int16 v29 = 1024;
      int v30 = 419;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspending", buf, 0x22u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000936A4;
    v22[3] = &unk_100303158;
    v22[4] = self;
    v22[5] = a2;
    [(_NFXPCSession *)self createHandoffTokenWithCompletion:v22];
  }
}

- (void)handleFieldChanged:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    p_lock = &self->_lock;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    id v7 = (void (*)(void *))sub_1000939B8;
    unsigned int v8 = &unk_100303180;
    unsigned int v9 = self;
    uint64_t v10 = &v16;
    id v11 = &v12;
    id v5 = v6;
    os_unfair_lock_lock(p_lock);
    v7(v5);
    os_unfair_lock_unlock(p_lock);

    [(_NFHCESession *)self _didLoseTarget:*((unsigned __int8 *)v17 + 24) suspendAssertion:*((unsigned __int8 *)v13 + 24)];
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
}

- (void)handleHceTargetLost
{
  remoteDev = self->_remoteDev;
  self->_remoteDev = 0;

  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_TARGET_LOST", (const char *)&unk_100286819, buf, 2u);
  }

  *(void *)buf = 0;
  int v17 = buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = (void (*)(void *))sub_100093BB0;
  unsigned int v8 = &unk_100303180;
  unsigned int v9 = self;
  uint64_t v10 = buf;
  id v11 = &v12;
  id v5 = v6;
  os_unfair_lock_lock(&self->_lock);
  v7(v5);
  os_unfair_lock_unlock(&self->_lock);

  [(_NFHCESession *)self _didLoseTarget:v17[24] suspendAssertion:*((unsigned __int8 *)v13 + 24)];
  sub_1000204B0((uint64_t)self->_hceCALogger);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_syncStartEmulationWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    kdebug_trace();
    __int16 v25 = NFSharedSignpostLog();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION", (const char *)&unk_100286819, buf, 2u);
    }

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v27 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v32 = [(_NFXPCSession *)self clientName];
      uint64_t v33 = 45;
      if (isMetaClass) {
        uint64_t v33 = 43;
      }
      v27(6, "%c[%{public}s %{public}s]:%i %{public}@", v33, ClassName, Name, 484, v32);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      uint64_t v37 = object_getClassName(self);
      uint64_t v38 = sel_getName(a2);
      char v39 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)buf = 67110146;
      int v59 = v36;
      __int16 v60 = 2082;
      long long v61 = v37;
      __int16 v62 = 2082;
      v63 = v38;
      __int16 v64 = 1024;
      int v65 = 484;
      __int16 v66 = 2114;
      v67 = v39;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
    int v40 = +[_NFHardwareManager sharedHardwareManager];
    int v41 = +[NFRoutingConfig hostCardEmulation];
    id v42 = [v40 setRoutingConfig:v41];

    if (v5) {
      v5[2](v5, 0);
    }
    uint64_t v43 = NFLogGetLogger();
    if (v43)
    {
      __int16 v44 = (void (*)(uint64_t, const char *, ...))v43;
      v45 = object_getClass(self);
      BOOL v46 = class_isMetaClass(v45);
      int v47 = object_getClassName(self);
      uint64_t v48 = sel_getName(a2);
      v49 = [(_NFXPCSession *)self clientName];
      uint64_t v50 = 45;
      if (v46) {
        uint64_t v50 = 43;
      }
      v44(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", v50, v47, v48, 489, v49);
    }
    __int16 v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = object_getClass(self);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      v55 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)buf = 67110146;
      int v59 = v52;
      __int16 v60 = 2082;
      long long v61 = v53;
      __int16 v62 = 2082;
      v63 = v54;
      __int16 v64 = 1024;
      int v65 = 489;
      __int16 v66 = 2112;
      v67 = v55;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", buf, 0x2Cu);
    }
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))v6;
    unsigned int v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    uint64_t v10 = object_getClassName(self);
    id v11 = sel_getName(a2);
    uint64_t v12 = [(_NFSession *)self sessionUID];
    uint64_t v13 = 45;
    if (v9) {
      uint64_t v13 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, v10, v11, 480, v12);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    char v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(self);
    uint64_t v18 = sel_getName(a2);
    char v19 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v59 = v16;
    __int16 v60 = 2082;
    long long v61 = v17;
    __int16 v62 = 2082;
    v63 = v18;
    __int16 v64 = 1024;
    int v65 = 480;
    __int16 v66 = 2114;
    v67 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v5)
  {
    id v20 = objc_alloc((Class)NSError);
    __int16 v21 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    uint64_t v22 = +[NSString stringWithUTF8String:"Session not active"];
    v57 = v22;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    id v24 = [v20 initWithDomain:v21 code:54 userInfo:v23];
    ((void (**)(id, id))v5)[2](v5, v24);

LABEL_15:
  }
}

- (void)startEmulationWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", (const char *)&unk_100286819, buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)_NFHCESession;
  uint64_t v6 = [(_NFSession *)&v10 workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094360;
  v8[3] = &unk_100302390;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)stopEmulationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NFRoutingConfig routingOff];
  [(_NFHCESession *)self stopEmulationAndConfigWithRouting:v5 completion:v4];
}

- (void)sendAPDU:(id)a3 startReadOnCompletion:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFHCESession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000944E4;
  block[3] = &unk_1003031F8;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  SEL v17 = a2;
  BOOL v18 = a4;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

- (void)readAPDUWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFHCESession;
  uint64_t v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009561C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)asyncReadAPDUWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFHCESession;
  uint64_t v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095FE4;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_asyncReadWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, id))a3;
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
      v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 648, v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      SEL v17 = object_getClassName(self);
      BOOL v18 = sel_getName(a2);
      objc_super v19 = [(_NFSession *)self sessionUID];
      *(_DWORD *)buf = 67110146;
      int v34 = v16;
      __int16 v35 = 2082;
      int v36 = v17;
      __int16 v37 = 2082;
      uint64_t v38 = v18;
      __int16 v39 = 1024;
      int v40 = 648;
      __int16 v41 = 2114;
      id v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
    if (v5)
    {
      id v20 = objc_alloc((Class)NSError);
      __int16 v21 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      uint64_t v22 = +[NSString stringWithUTF8String:"Session not active"];
      uint64_t v32 = v22;
      __int16 v23 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v24 = [v20 initWithDomain:v21 code:54 userInfo:v23];
      v5[2](v5, 0, v24);
    }
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10009680C;
    v30[3] = &unk_1003031A8;
    v30[4] = self;
    os_unfair_lock_lock(&self->_lock);
    __int16 v25 = sub_10009680C((uint64_t)v30);
    os_unfair_lock_unlock(&self->_lock);
    if (v25)
    {
      v5[2](v5, 0, v25);
    }
    else
    {
      int v26 = NFSharedSignpostLog();
      if (os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ", (const char *)&unk_100286819, buf, 2u);
      }

      remoteDev = self->_remoteDev;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100096938;
      v28[3] = &unk_100303248;
      v28[4] = self;
      __int16 v29 = v5;
      [(NFHostCardEmulationDeviceHandle *)remoteDev readAPDUWithCompletion:v28];
    }
  }
}

- (void)requestEmulationAssertion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFHCESession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100096DC0;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFHCESession;
  uint64_t v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097D04;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)restartDiscovery
{
  v6.receiver = self;
  v6.super_class = (Class)_NFHCESession;
  id v4 = [(_NFSession *)&v6 workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100098184;
  v5[3] = &unk_100301C40;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

- (BOOL)readOnConnected
{
  return self->_readOnConnected;
}

- (void)setReadOnConnected:(BOOL)a3
{
  self->_readOnConnected = a3;
}

- (BOOL)emulationOnSessionStart
{
  return self->_emulationOnSessionStart;
}

- (void)setEmulationOnSessionStart:(BOOL)a3
{
  self->_emulationOnSessionStart = a3;
}

- (BOOL)suspendOnDisconnect
{
  return self->_suspendOnDisconnect;
}

- (void)setSuspendOnDisconnect:(BOOL)a3
{
  self->_suspendOnDisconnect = a3;
}

- (BOOL)disableAutoStartOnField
{
  return self->_disableAutoStartOnField;
}

- (void)setDisableAutoStartOnField:(BOOL)a3
{
  self->_disableAutoStartOnField = a3;
}

- (NFFieldNotification)sessionResumeField
{
  return self->_sessionResumeField;
}

- (void)setSessionResumeField:(id)a3
{
}

- (NFHCEBroadcastECPConfig)ecpBroadcastConfig
{
  return self->_ecpBroadcastConfig;
}

- (void)setEcpBroadcastConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecpBroadcastConfig, 0);
  objc_storeStrong((id *)&self->_sessionResumeField, 0);
  objc_storeStrong((id *)&self->_hceCALogger, 0);
  objc_storeStrong((id *)&self->_suspendAssertionDeadline, 0);
  objc_storeStrong((id *)&self->_emuAssertionTimer, 0);

  objc_storeStrong((id *)&self->_remoteDev, 0);
}

@end