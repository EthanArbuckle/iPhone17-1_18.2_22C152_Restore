@interface NFDigitalCarKeySession
+ (id)getVehicleReports:(id *)a3;
+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4;
+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5;
+ (id)resumeRangingForReaderIdentifier:(id)a3;
+ (id)vehicleReports:(id *)a3;
- (BOOL)cardEmulationStarted;
- (BOOL)fieldNotificationSent;
- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4;
- (BOOL)setActiveApplet:(id)a3 key:(id)a4 outError:(id *)a5;
- (BOOL)startCardEmulationAuthorization:(id)a3 deferred:(BOOL)a4 error:(id *)a5;
- (BOOL)stopCardEmulation:(id *)a3;
- (BOOL)supportsSecureRanging;
- (NFApplet)activeApplet;
- (NFApplet)defaultApplet;
- (NFDigitalCarKeySession)init;
- (NFDigitalCarKeySessionDelegate)delegate;
- (NFDigitalCarKeySessionPassthroughDelegate)passthroughDelegate;
- (NSDictionary)appletsById;
- (NSString)activeKey;
- (SESDCKSession)sesdSession;
- (id)_getAppletsFromNFCD;
- (id)activateWithToken:(id)a3;
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (id)cancelRKEFunction:(id)a3;
- (id)createSessionHandoffToken:(id *)a3;
- (id)sendRKEFunction:(id)a3 rkeAction:(id)a4 authorization:(id)a5;
- (id)setAuthorization:(id)a3;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndTransaction:(id)a3;
- (void)didEndUnexpectedly;
- (void)didExpireTransactionForApplet:(id)a3;
- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4;
- (void)didFailDeferredAuthorization;
- (void)didReceiveActivityTimeout:(id)a3;
- (void)didSelectApplet:(id)a3;
- (void)didStartSession:(id)a3;
- (void)didStartTransaction:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)handleSessionResumed;
- (void)handleSessionSuspended:(id)a3;
- (void)releaseSesdSession;
- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4;
- (void)sesSession:(id)a3 event:(id)a4;
- (void)setAppletsById:(id)a3;
- (void)setCardEmulationStarted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldNotificationSent:(BOOL)a3;
- (void)setPassthroughDelegate:(id)a3;
- (void)setSesdSession:(id)a3;
@end

@implementation NFDigitalCarKeySession

- (NFDigitalCarKeySession)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFDigitalCarKeySession;
  return [(NFSession *)&v3 init];
}

- (id)allApplets
{
  v2 = [(NFDigitalCarKeySession *)self appletsById];
  objc_super v3 = [v2 allValues];

  return v3;
}

- (id)appletWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NFDigitalCarKeySession *)self appletsById];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_getAppletsFromNFCD
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke;
  v7[3] = &unk_1E595CBD0;
  v7[5] = &v8;
  v7[6] = a2;
  v7[4] = self;
  objc_super v3 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke_42;
  v6[3] = &unk_1E595CBF8;
  v6[4] = self;
  v6[5] = &v8;
  [v3 getAppletsWithCompletion:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 107, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = v14;
    __int16 v25 = 1024;
    int v26 = 107;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else
  {
    id v19 = v8;
    uint64_t v10 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) identifier];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v11 forKeys:v10];
    [*(id *)(a1 + 32) setAppletsById:v18];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), a3);
    objc_sync_exit(v17);

    id v8 = v19;
  }
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v6 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NFDigitalCarKeySession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __42__NFDigitalCarKeySession_didStartSession___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) didEnd])
  {
    v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 135, *(void *)(a1 + 40));
    }
    dispatch_get_specific(*v2);
    SEL v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110146;
      int v44 = v12;
      __int16 v45 = 2082;
      v46 = v13;
      __int16 v47 = 2082;
      v48 = v14;
      __int16 v49 = 1024;
      int v50 = 135;
      __int16 v51 = 2114;
      uint64_t v52 = v15;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v42.receiver = *(id *)(a1 + 32);
    v42.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v42, sel_didStartSessionWithoutQueue_);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v16 = [*(id *)(a1 + 32) sesdSession];

    if (v16)
    {
      id v17 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v18 = NFLogGetLogger();
      if (v18)
      {
        id v19 = (void (*)(uint64_t, const char *, ...))v18;
        long long v20 = object_getClass(*(id *)(a1 + 32));
        BOOL v21 = class_isMetaClass(v20);
        long long v22 = object_getClassName(*(id *)(a1 + 32));
        v37 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v23 = 45;
        if (v21) {
          uint64_t v23 = 43;
        }
        v19(4, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!", v23, v22, v37, 145);
      }
      dispatch_get_specific(*v17);
      v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        __int16 v27 = object_getClassName(*(id *)(a1 + 32));
        id v28 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        int v44 = v26;
        __int16 v45 = 2082;
        v46 = v27;
        __int16 v47 = 2082;
        v48 = v28;
        __int16 v49 = 1024;
        int v50 = 145;
        _os_log_impl(&dword_19D636000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!",
          buf,
          0x22u);
      }
    }
    uint64_t v29 = [MEMORY[0x1E4F97A30] sharedInstance];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __42__NFDigitalCarKeySession_didStartSession___block_invoke_50;
    v39[3] = &unk_1E595CC20;
    objc_copyWeak(v40, &location);
    v40[1] = *(id *)(a1 + 48);
    v30 = [v29 startDigitalCarKeySessionWithOptions:0 startCallback:v39];
    [*(id *)(a1 + 32) setSesdSession:v30];

    v31 = *(void **)(a1 + 32);
    v32 = [v31 sesdSession];
    [v32 setDelegate:v31];

    v33 = *(void **)(a1 + 32);
    v34 = [v33 sesdSession];
    [v34 setPassthroughDelegate:v33];

    v35 = *(void **)(a1 + 32);
    v36 = [v35 _getAppletsFromNFCD];
    v38.receiver = v35;
    v38.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v38, sel_didStartSessionWithoutQueue_, v36);

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);
  }
}

void __42__NFDigitalCarKeySession_didStartSession___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to start SESDCKSession.  Error - %{public}@", "-[NFDigitalCarKeySession didStartSession:]_block_invoke", 151, v4);
    }
    dispatch_get_specific(*v5);
    WeakRetained = NFSharedLogGetLogger();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)__int16 v27 = "-[NFDigitalCarKeySession didStartSession:]_block_invoke";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = 151;
      __int16 v28 = 2114;
      uint64_t v29 = v4;
      _os_log_impl(&dword_19D636000, WeakRetained, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to start SESDCKSession.  Error - %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v8 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v9 = NFLogGetLogger();
      if (v9)
      {
        SEL v10 = (void (*)(uint64_t, const char *, ...))v9;
        Class = object_getClass(WeakRetained);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 40));
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i Started SESDCKSession", v14, ClassName, Name, 160);
      }
      dispatch_get_specific(*v8);
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(WeakRetained);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        uint64_t v18 = object_getClassName(WeakRetained);
        id v19 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)__int16 v27 = v17;
        *(_WORD *)&v27[4] = 2082;
        *(void *)&v27[6] = v18;
        __int16 v28 = 2082;
        uint64_t v29 = v19;
        __int16 v30 = 1024;
        int v31 = 160;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Started SESDCKSession", buf, 0x22u);
      }

      long long v20 = [WeakRetained sesdSession];
      BOOL v21 = [WeakRetained activeKey];
      id v22 = (id)[v20 setActiveKey:v21];

      if ([WeakRetained cardEmulationStarted])
      {
        uint64_t v23 = [WeakRetained sesdSession];
        id v24 = (id)[v23 disableBluetooth:1];
      }
    }
  }
}

- (void)didEndUnexpectedly
{
  v6.receiver = self;
  v6.super_class = (Class)NFDigitalCarKeySession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__NFDigitalCarKeySession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __44__NFDigitalCarKeySession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) releaseSesdSession];
    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id v4 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 sessionDidEndUnexpectedly:*(void *)(a1 + 32)];
    }
    v17.receiver = *(id *)(a1 + 32);
    v17.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v17, sel_didEndUnexpectedly);
  }
  else
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 192);
    }
    dispatch_get_specific(*v5);
    id v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      BOOL v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 192;
      _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (BOOL)setActiveApplet:(id)a3 key:(id)a4 outError:(id *)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _os_activity_create(&dword_19D636000, "seActiveApplet:key:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  uint64_t state = 0;
  *(void *)state_8 = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  if ([(NFDigitalCarKeySession *)self cardEmulationStarted])
  {
    int v12 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v14(4, "%c[%{public}s %{public}s]:%i Cannot set active applet while card emulation is in progress.", v18, ClassName, Name, 204);
    }
    dispatch_get_specific(*v12);
    int v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      __int16 v22 = object_getClassName(self);
      uint64_t v23 = sel_getName(a2);
      LODWORD(state) = 67109890;
      HIDWORD(state) = v21;
      *(_WORD *)state_8 = 2082;
      *(void *)&state_8[2] = v22;
      *(_WORD *)&state_8[10] = 2082;
      *(void *)&state_8[12] = v23;
      *(_WORD *)&state_8[20] = 1024;
      *(_DWORD *)&state_8[22] = 204;
      _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot set active applet while card emulation is in progress.", (uint8_t *)&state, 0x22u);
    }

    if (a5)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v25 = [NSString stringWithUTF8String:"nf.fwk"];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = @"Card emulation currently in progress";
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
      __int16 v27 = v24;
      __int16 v28 = v25;
      uint64_t v29 = 2;
LABEL_18:
      *a5 = (id)[v27 initWithDomain:v28 code:v29 userInfo:v26];

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    __int16 v30 = self;
    objc_sync_enter(v30);
    objc_storeStrong((id *)&v30->_activeKey, a4);
    objc_sync_exit(v30);

    int v31 = [(NFDigitalCarKeySession *)v30 sesdSession];
    id v32 = (id)[v31 setActiveKey:v10];

    v33 = [v9 identifier];
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_PURPLE_TRUST_AIR_CCC length:13];
    v35 = objc_msgSend(v34, "NF_asHexString");
    char v36 = [v33 isEqualToString:v35];

    if (v36)
    {
      uint64_t state = 0;
      *(void *)state_8 = &state;
      *(void *)&state_8[8] = 0x3032000000;
      *(void *)&state_8[16] = __Block_byref_object_copy__0;
      *(void *)&state_8[24] = __Block_byref_object_dispose__0;
      id v46 = 0;
      if (v10) {
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, 0);
      }
      else {
        v37 = 0;
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke;
      v43[3] = &unk_1E595CBD0;
      v43[5] = &state;
      v43[6] = a2;
      v43[4] = v30;
      v39 = [(NFSession *)v30 synchronousRemoteObjectProxyWithErrorHandler:v43];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke_74;
      v42[3] = &unk_1E595CC70;
      v42[5] = &state;
      v42[6] = a2;
      v42[4] = v30;
      [v39 setActivePaymentApplet:v9 keys:v37 authorization:0 completion:v42];

      if (a5) {
        *a5 = *(id *)(*(void *)state_8 + 40);
      }
      LOBYTE(a5) = *(void *)(*(void *)state_8 + 40) == 0;

      _Block_object_dispose(&state, 8);
    }
    else if (a5)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v25 = [NSString stringWithUTF8String:"nf.fwk"];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = @"Bad applet provided.  Expected PTA";
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      __int16 v27 = v38;
      __int16 v28 = v25;
      uint64_t v29 = 10;
      goto LABEL_18;
    }
  }

  return (char)a5;
}

void __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 232, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    id v24 = v14;
    __int16 v25 = 1024;
    int v26 = 232;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke_74(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), a2);
  objc_sync_exit(v9);

  if (v8)
  {
    id v10 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 242, v8);
    }
    dispatch_get_specific(*v10);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_super v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(*(id *)(a1 + 32));
      int v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v24 = v18;
      __int16 v25 = 2082;
      int v26 = v19;
      __int16 v27 = 2082;
      id v28 = v20;
      __int16 v29 = 1024;
      int v30 = 242;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

- (BOOL)startCardEmulationAuthorization:(id)a3 deferred:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v35[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = _os_activity_create(&dword_19D636000, "startCardEmulationAuthorization:deferred:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if ([(NFDigitalCarKeySession *)self cardEmulationStarted]) {
    [(NFDigitalCarKeySession *)self stopCardEmulation:0];
  }
  uint64_t v11 = [(NFDigitalCarKeySession *)self sesdSession];
  id v12 = (id)[v11 disableBluetooth:1];

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__0;
  id v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke;
  v28[3] = &unk_1E595CBD0;
  v28[5] = &state;
  v28[6] = a2;
  v28[4] = self;
  int v13 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v28];
  if (v13)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke_76;
    v27[3] = &unk_1E595CBD0;
    v27[4] = self;
    v27[5] = &state;
    v27[6] = a2;
    uint64_t v14 = (void *)MEMORY[0x19F3A96D0](v27);
    if (v6) {
      [v13 startDeferredCardEmulationWithAuthorization:v9 completion:v14];
    }
    else {
      [v13 startCardEmulationWithAuthorization:v9 completion:v14];
    }
  }
  else if (!*(void *)(state.opaque[1] + 40))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16 = [NSString stringWithUTF8String:"nfcd"];
    v34[0] = *MEMORY[0x1E4F28568];
    objc_super v17 = [NSString stringWithUTF8String:"Unexpected Result"];
    v35[0] = v17;
    v34[1] = *MEMORY[0x1E4F28588];
    int v18 = (void *)[[NSString alloc] initWithFormat:@"Failed to get sync proxy."];
    v35[1] = v18;
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v20 = [v15 initWithDomain:v16 code:13 userInfo:v19];
    __int16 v21 = *(void **)(state.opaque[1] + 40);
    *(void *)(state.opaque[1] + 40) = v20;
  }
  uint64_t v22 = state.opaque[1];
  if (a5)
  {
    *a5 = *(id *)(state.opaque[1] + 40);
    uint64_t v22 = state.opaque[1];
  }
  uint64_t v23 = *(void *)(v22 + 40);
  if (v23)
  {
    int v24 = [(NFDigitalCarKeySession *)self sesdSession];
    id v25 = (id)[v24 disableBluetooth:0];
  }
  else
  {
    [(NFDigitalCarKeySession *)self setCardEmulationStarted:1];
  }

  _Block_object_dispose(&state, 8);
  return v23 == 0;
}

void __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 272, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 272;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 279, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 279;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (BOOL)stopCardEmulation:(id *)a3
{
  BOOL v6 = _os_activity_create(&dword_19D636000, "stopCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke_81;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  [v7 stopCardEmulationWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  BOOL v8 = *(void *)(state.opaque[1] + 40) == 0;
  _Block_object_dispose(&state, 8);

  return v8;
}

void __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 323, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 323;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 327, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v21 = v13;
      __int16 v22 = 2082;
      __int16 v23 = v14;
      __int16 v24 = 2082;
      __int16 v25 = v15;
      __int16 v26 = 1024;
      int v27 = 327;
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) sesdSession];
    id v17 = (id)[v16 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
  }
}

- (void)endSession
{
}

- (void)releaseSesdSession
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 358);
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = NFSharedLogGetLogger();
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
    int v19 = v13;
    __int16 v20 = 2082;
    int v21 = object_getClassName(self);
    __int16 v22 = 2082;
    __int16 v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 358;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v14 = [(NFDigitalCarKeySession *)self sesdSession];
  [v14 setDelegate:0];

  uint64_t v15 = [(NFDigitalCarKeySession *)self sesdSession];
  [v15 setPassthroughDelegate:0];

  id v16 = [(NFDigitalCarKeySession *)self sesdSession];
  [v16 endSession];

  [(NFDigitalCarKeySession *)self setSesdSession:0];
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "endSessionWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  BOOL v6 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFDigitalCarKeySession_endSessionWithCompletion___block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)NFDigitalCarKeySession;
  [(NFSession *)&v7 endSessionWithCompletion:v4];
}

uint64_t __51__NFDigitalCarKeySession_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) releaseSesdSession];
  v2 = *(void **)(a1 + 32);
  return [v2 setDelegate:0];
}

- (id)activateWithToken:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  id v7 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 383);
  }
  dispatch_get_specific(*v6);
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
    *(_DWORD *)buf = 67109890;
    int v22 = v16;
    __int16 v23 = 2082;
    __int16 v24 = object_getClassName(self);
    __int16 v25 = 2082;
    uint64_t v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 383;
    _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)NFDigitalCarKeySession;
  id v17 = [(NFSession *)&v20 activateWithToken:v7];

  return v17;
}

- (id)createSessionHandoffToken:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 389);
  }
  dispatch_get_specific(*v6);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v15;
    __int16 v22 = 2082;
    __int16 v23 = object_getClassName(self);
    __int16 v24 = 2082;
    __int16 v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 389;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19.receiver = self;
  v19.super_class = (Class)NFDigitalCarKeySession;
  int v16 = [(NFSession *)&v19 createSessionHandoffToken:a3];
  return v16;
}

- (void)handleSessionResumed
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 397);
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v42 = v13;
    __int16 v43 = 2082;
    int v44 = object_getClassName(self);
    __int16 v45 = 2082;
    id v46 = sel_getName(a2);
    __int16 v47 = 1024;
    int v48 = 397;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v14 = [(NFDigitalCarKeySession *)self activeApplet];
  int v15 = [v14 identifier];

  id v16 = [(NFDigitalCarKeySession *)self _getAppletsFromNFCD];
  dispatch_get_specific(*v4);
  uint64_t v17 = NFLogGetLogger();
  if (v17)
  {
    int v18 = (void (*)(uint64_t, const char *, ...))v17;
    objc_super v19 = object_getClass(self);
    BOOL v20 = class_isMetaClass(v19);
    int v21 = object_getClassName(self);
    __int16 v22 = sel_getName(a2);
    __int16 v23 = [(NFDigitalCarKeySession *)self activeApplet];
    __int16 v24 = [v23 identifier];
    uint64_t v25 = 45;
    if (v20) {
      uint64_t v25 = 43;
    }
    v18(6, "%c[%{public}s %{public}s]:%i here - Orig AID:%{public}@   current AID:%{public}@", v25, v21, v22, 408, v15, v24);
  }
  dispatch_get_specific(*v4);
  __int16 v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    uint64_t v29 = object_getClassName(self);
    uint64_t v30 = sel_getName(a2);
    __int16 v31 = [(NFDigitalCarKeySession *)self activeApplet];
    id v32 = [v31 identifier];
    *(_DWORD *)buf = 67110402;
    int v42 = v28;
    __int16 v43 = 2082;
    int v44 = v29;
    __int16 v45 = 2082;
    id v46 = v30;
    __int16 v47 = 1024;
    int v48 = 408;
    __int16 v49 = 2114;
    int v50 = v15;
    __int16 v51 = 2114;
    uint64_t v52 = v32;
    _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i here - Orig AID:%{public}@   current AID:%{public}@", buf, 0x36u);
  }
  if (v15)
  {
    id v33 = [(NFDigitalCarKeySession *)self activeApplet];
    v34 = [v33 identifier];
    char v35 = [v15 isEqualToString:v34];

    if ((v35 & 1) == 0)
    {
      char v36 = [(NFDigitalCarKeySession *)self appletsById];
      v37 = [v36 objectForKey:v15];

      id v38 = [(NFDigitalCarKeySession *)self activeKey];
      [(NFDigitalCarKeySession *)self setActiveApplet:v37 key:v38 outError:0];
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)NFDigitalCarKeySession;
  [(NFSession *)&v40 handleSessionResumed];
}

- (void)handleSessionSuspended:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 421);
  }
  dispatch_get_specific(*v6);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v31 = v15;
    __int16 v32 = 2082;
    id v33 = object_getClassName(self);
    __int16 v34 = 2082;
    char v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 421;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if ([(NFDigitalCarKeySession *)self cardEmulationStarted])
  {
    dispatch_get_specific(*v6);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      uint64_t v17 = (void (*)(uint64_t, const char *, ...))v16;
      int v18 = object_getClass(self);
      BOOL v19 = class_isMetaClass(v18);
      BOOL v20 = object_getClassName(self);
      int v28 = sel_getName(a2);
      uint64_t v21 = 45;
      if (v19) {
        uint64_t v21 = 43;
      }
      v17(4, "%c[%{public}s %{public}s]:%i Card Emulation had started and yet this session has been suspended.", v21, v20, v28, 426);
    }
    dispatch_get_specific(*v6);
    __int16 v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      uint64_t v25 = object_getClassName(self);
      __int16 v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v31 = v24;
      __int16 v32 = 2082;
      id v33 = v25;
      __int16 v34 = 2082;
      char v35 = v26;
      __int16 v36 = 1024;
      int v37 = 426;
      _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Card Emulation had started and yet this session has been suspended.", buf, 0x22u);
    }

    [(NFDigitalCarKeySession *)self stopCardEmulation:0];
  }
  v29.receiver = self;
  v29.super_class = (Class)NFDigitalCarKeySession;
  [(NFSession *)&v29 handleSessionSuspended:v5];
}

+ (id)getVehicleReports:(id *)a3
{
  return +[NFDigitalCarKeySession vehicleReports:a3];
}

+ (id)vehicleReports:(id *)a3
{
  id v4 = _os_activity_create(&dword_19D636000, "vehicleReports:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  id v5 = [MEMORY[0x1E4F97A10] getVehicleReports:a3];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__NFDigitalCarKeySession_vehicleReports___block_invoke;
    v9[3] = &unk_1E595CCC0;
    id v7 = v6;
    id v10 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __41__NFDigitalCarKeySession_vehicleReports___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[NFVehicleReport alloc] initWithSESVehicleReport:v5];

  [*(id *)(a1 + 32) setValue:v7 forKey:v6];
}

- (BOOL)supportsSecureRanging
{
  id v3 = [(NFDigitalCarKeySession *)self sesdSession];
  if (v3)
  {
    id v4 = [(NFDigitalCarKeySession *)self sesdSession];
    char v5 = [v4 supportsSecureRanging];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)setAuthorization:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_activity_create(&dword_19D636000, "setAuthorization:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [(NFDigitalCarKeySession *)self sesdSession];

  if (v6)
  {
    if (v4)
    {
      id v7 = [(NFDigitalCarKeySession *)self sesdSession];
      BOOL v8 = [v7 setAuthorization:v4];
      goto LABEL_7;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v7 = [NSString stringWithUTF8String:"nfcd"];
    v19[0] = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithUTF8String:"Missing Parameter"];
    v20[0] = v10;
    v19[1] = *MEMORY[0x1E4F28588];
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Bad parameter"];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    int v13 = v16;
    uint64_t v14 = v7;
    uint64_t v15 = 9;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v7 = [NSString stringWithUTF8String:"nfcd"];
    v21[0] = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithUTF8String:"Invalid State"];
    v22[0] = v10;
    v21[1] = *MEMORY[0x1E4F28588];
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"SESSession not available."];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    int v13 = v9;
    uint64_t v14 = v7;
    uint64_t v15 = 12;
  }
  BOOL v8 = (void *)[v13 initWithDomain:v14 code:v15 userInfo:v12];

LABEL_7:
  return v8;
}

- (id)cancelRKEFunction:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_activity_create(&dword_19D636000, "cancelRKEFunction:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [(NFDigitalCarKeySession *)self sesdSession];

  if (v6)
  {
    id v7 = [(NFDigitalCarKeySession *)self sesdSession];
    BOOL v8 = [v7 cancelRKEFunction:v4];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v7 = [NSString stringWithUTF8String:"nfcd"];
    v15[0] = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithUTF8String:"Invalid State"];
    v16[0] = v10;
    v15[1] = *MEMORY[0x1E4F28588];
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"SESSession not available."];
    v16[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    BOOL v8 = (void *)[v9 initWithDomain:v7 code:12 userInfo:v12];
  }
  return v8;
}

- (id)sendRKEFunction:(id)a3 rkeAction:(id)a4 authorization:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = _os_activity_create(&dword_19D636000, "sendRKEFunction:action:authorization:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__0;
  __int16 v47 = __Block_byref_object_dispose__0;
  id v48 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  int v42 = __Block_byref_object_dispose__0;
  dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __66__NFDigitalCarKeySession_sendRKEFunction_rkeAction_authorization___block_invoke;
  v37[3] = &unk_1E595CCE8;
  v37[4] = &state;
  v37[5] = &v38;
  [(NFDigitalCarKeySession *)self sendRKEFunction:v11 action:v10 authorization:v9 completion:v37];

  int v13 = v39[5];
  dispatch_time_t v14 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    uint64_t v15 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v21 = 45;
      if (isMetaClass) {
        uint64_t v21 = 43;
      }
      v17(4, "%c[%{public}s %{public}s]:%i Timed out waiting for rkeFunction response.!", v21, ClassName, Name, 524);
    }
    dispatch_get_specific(*v15);
    __int16 v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      uint64_t v25 = object_getClassName(self);
      __int16 v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v52 = v24;
      __int16 v53 = 2082;
      v54 = v25;
      __int16 v55 = 2082;
      v56 = v26;
      __int16 v57 = 1024;
      int v58 = 524;
      _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timed out waiting for rkeFunction response.!", buf, 0x22u);
    }

    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v28 = [NSString stringWithUTF8String:"nfcd"];
    v49[0] = *MEMORY[0x1E4F28568];
    objc_super v29 = [NSString stringWithUTF8String:"Timeout"];
    v50[0] = v29;
    v49[1] = *MEMORY[0x1E4F28588];
    uint64_t v30 = (void *)[[NSString alloc] initWithFormat:@"Timed out waitng for response to sendRKEFunction:action:authorization:completion:"];
    v50[1] = v30;
    int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
    uint64_t v32 = [v27 initWithDomain:v28 code:5 userInfo:v31];
    id v33 = *(void **)(state.opaque[1] + 40);
    *(void *)(state.opaque[1] + 40) = v32;
  }
  id v34 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&state, 8);
  return v34;
}

void __66__NFDigitalCarKeySession_sendRKEFunction_rkeAction_authorization___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  char v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_time_t v14 = _os_activity_create(&dword_19D636000, "sendRKEFunction:action:authorization:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  uint64_t v15 = [(NFDigitalCarKeySession *)self sesdSession];

  if (v15)
  {
    if ([(NFDigitalCarKeySession *)self cardEmulationStarted])
    {
      v24.receiver = self;
      v24.super_class = (Class)NFDigitalCarKeySession;
      id v16 = [(NFSession *)&v24 callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_2;
      block[3] = &unk_1E595CD10;
      id v23 = v13;
      dispatch_async(v16, block);

      uint64_t v17 = v23;
    }
    else
    {
      BOOL v19 = [(NFDigitalCarKeySession *)self sesdSession];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_3;
      v20[3] = &unk_1E595CD60;
      v20[4] = self;
      id v21 = v13;
      [v19 sendRKEFunction:v10 action:v11 authorization:v12 completion:v20];

      uint64_t v17 = v21;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NFDigitalCarKeySession;
    int v18 = [(NFSession *)&v27 callbackQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke;
    v25[3] = &unk_1E595CD10;
    id v26 = v13;
    dispatch_async(v18, v25);

    uint64_t v17 = v26;
  }
}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v3 = [NSString stringWithUTF8String:"nfcd"];
  v8[0] = *MEMORY[0x1E4F28568];
  id v4 = [NSString stringWithUTF8String:"Invalid State"];
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E4F28588];
  char v5 = (void *)[[NSString alloc] initWithFormat:@"SESSession not yet allocated."];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v7 = (void *)[v2 initWithDomain:v3 code:12 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v7);
}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_2(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v3 = [NSString stringWithUTF8String:"nfcd"];
  v8[0] = *MEMORY[0x1E4F28568];
  id v4 = [NSString stringWithUTF8String:"Invalid State"];
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E4F28588];
  char v5 = (void *)[[NSString alloc] initWithFormat:@"Card Emulation In Progress"];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v7 = (void *)[v2 initWithDomain:v3 code:12 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v7);
}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)NFDigitalCarKeySession;
  id v7 = objc_msgSendSuper2(&v15, sel_callbackQueue);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_4;
  block[3] = &unk_1E595CD38;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19D636000, "sendPassthroughMessage:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFDigitalCarKeySession *)self sesdSession];

  if (v8)
  {
    if (![(NFDigitalCarKeySession *)self cardEmulationStarted])
    {
      id v10 = [(NFDigitalCarKeySession *)self sesdSession];
      LOBYTE(a4) = [v10 sendPassthroughMessage:v6 error:a4];
      goto LABEL_9;
    }
    if (a4)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v10 = [NSString stringWithUTF8String:"nfcd"];
      v19[0] = *MEMORY[0x1E4F28568];
      id v11 = [NSString stringWithUTF8String:"Invalid State"];
      v20[0] = v11;
      v19[1] = *MEMORY[0x1E4F28588];
      id v12 = (void *)[[NSString alloc] initWithFormat:@"Card Emulation In Progress"];
      v20[1] = v12;
      id v13 = (void *)MEMORY[0x1E4F1C9E8];
      id v14 = v20;
      objc_super v15 = v19;
LABEL_7:
      id v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:2];
      *a4 = (id)[v9 initWithDomain:v10 code:12 userInfo:v16];

      LOBYTE(a4) = 0;
LABEL_9:
    }
  }
  else if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v10 = [NSString stringWithUTF8String:"nfcd"];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithUTF8String:"Invalid State"];
    v22[0] = v11;
    v21[1] = *MEMORY[0x1E4F28588];
    id v12 = (void *)[[NSString alloc] initWithFormat:@"SESSession not yet allocated."];
    v22[1] = v12;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = v22;
    objc_super v15 = v21;
    goto LABEL_7;
  }

  return (char)a4;
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19D636000, "pauseRangingForReaderIdentifier:durationInSec:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  os_activity_scope_leave(&v10);

  id v8 = [MEMORY[0x1E4F97A10] pauseRangingForReaderIdentifier:v6 durationInSec:v5];

  return v8;
}

+ (id)resumeRangingForReaderIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = _os_activity_create(&dword_19D636000, "resumeRangingForReaderIdentifier:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);
  os_activity_scope_leave(&v7);

  id v5 = [MEMORY[0x1E4F97A10] resumeRangingForReaderIdentifier:v3];

  return v5;
}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v7 = [MEMORY[0x1E4F97A10] requestAssertionForKeyID:a3 withOptions:a4 error:a5];
  if (v7)
  {
    id v8 = [[NFDCKAssertion alloc] initWithSESAssertion:v7];
  }
  else
  {
    id v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(4, "%c[%{public}s %{public}s]:%i Failed to get DCK assertion", v15, ClassName, Name, 627);
    }
    dispatch_get_specific(*v9);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(a1);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v22 = v18;
      __int16 v23 = 2082;
      objc_super v24 = object_getClassName(a1);
      __int16 v25 = 2082;
      id v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 627;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get DCK assertion", buf, 0x22u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NFDigitalCarKeySession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  BOOL v8 = a3;
  void block[4] = self;
  void block[5] = a2;
  dispatch_async(v6, block);
}

void __41__NFDigitalCarKeySession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    if (!*(unsigned char *)(a1 + 48))
    {
      id v16 = (void *)v2;
      if ([*(id *)(a1 + 32) fieldNotificationSent])
      {
        if (objc_opt_respondsToSelector())
        {
          [*(id *)(a1 + 32) setFieldNotificationSent:0];
          [v16 sessionDidExitField:*(void *)(a1 + 32)];
        }
      }
    }
    MEMORY[0x1F4181820]();
  }
  else
  {
    id v3 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Session not active", v9, ClassName, Name, 652);
    }
    dispatch_get_specific(*v3);
    os_activity_scope_state_s v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      id v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v18 = v12;
      __int16 v19 = 2082;
      BOOL v20 = v13;
      __int16 v21 = 2082;
      int v22 = v14;
      __int16 v23 = 1024;
      int v24 = 652;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NFDigitalCarKeySession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __53__NFDigitalCarKeySession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v15 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      [*(id *)(a1 + 32) setFieldNotificationSent:1];
      [v15 session:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 669);
    }
    dispatch_get_specific(*v2);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      int v12 = object_getClassName(*(id *)(a1 + 32));
      id v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v17 = v11;
      __int16 v18 = 2082;
      __int16 v19 = v12;
      __int16 v20 = 2082;
      __int16 v21 = v13;
      __int16 v22 = 1024;
      int v23 = 669;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NFDigitalCarKeySession_didSelectApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __42__NFDigitalCarKeySession_didSelectApplet___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v3 = [*(id *)(a1 + 32) appletsById];
      id v4 = [v3 objectForKey:*(void *)(a1 + 40)];

      if (!v4)
      {
        id v5 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v7 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 48));
          uint64_t v12 = 45;
          if (isMetaClass) {
            uint64_t v12 = 43;
          }
          v7(4, "%c[%{public}s %{public}s]:%i Applet ID [%{public}@] was not preexisting in array of applets.", v12, ClassName, Name, 686, *(void *)(a1 + 40));
        }
        dispatch_get_specific(*v5);
        id v13 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v14)) {
            int v15 = 43;
          }
          else {
            int v15 = 45;
          }
          id v16 = object_getClassName(*(id *)(a1 + 32));
          int v17 = sel_getName(*(SEL *)(a1 + 48));
          uint64_t v18 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 67110146;
          int v37 = v15;
          __int16 v38 = 2082;
          v39 = v16;
          __int16 v40 = 2082;
          v41 = v17;
          __int16 v42 = 1024;
          int v43 = 686;
          __int16 v44 = 2114;
          uint64_t v45 = v18;
          _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet ID [%{public}@] was not preexisting in array of applets.", buf, 0x2Cu);
        }

        __int16 v19 = [NFApplet alloc];
        id v34 = @"identifier";
        __int16 v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", *(void *)(a1 + 40));
        char v35 = v20;
        __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v4 = [(NFApplet *)v19 initWithDictionary:v21];
      }
      [v2 session:*(void *)(a1 + 32) didSelectApplet:v4];
    }
  }
  else
  {
    __int16 v22 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))v23;
      uint64_t v25 = object_getClass(*(id *)(a1 + 32));
      BOOL v26 = class_isMetaClass(v25);
      __int16 v27 = object_getClassName(*(id *)(a1 + 32));
      id v33 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v28 = 45;
      if (v26) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Session not active", v28, v27, v33, 693);
    }
    dispatch_get_specific(*v22);
    uint64_t v2 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      int v31 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v32 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v37 = v30;
      __int16 v38 = 2082;
      v39 = v31;
      __int16 v40 = 2082;
      v41 = v32;
      __int16 v42 = 1024;
      int v43 = 693;
      _os_log_impl(&dword_19D636000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didStartTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NFDigitalCarKeySession_didStartTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__NFDigitalCarKeySession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v19 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v2 = [[NFDigitalCarKeyStartEvent alloc] initFromContactlessPaymentStartEvent:*(void *)(a1 + 40)];
      id v3 = [*(id *)(a1 + 32) appletsById];
      id v4 = [*(id *)(a1 + 40) appletIdentifier];
      id v5 = [v3 objectForKey:v4];
      [v2 _setApplet:v5];

      [v19 session:*(void *)(a1 + 32) didStartTransaction:v2];
    }
  }
  else
  {
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 711);
    }
    dispatch_get_specific(*v6);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      id v16 = object_getClassName(*(id *)(a1 + 32));
      int v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v21 = v15;
      __int16 v22 = 2082;
      uint64_t v23 = v16;
      __int16 v24 = 2082;
      uint64_t v25 = v17;
      __int16 v26 = 1024;
      int v27 = 711;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NFDigitalCarKeySession_didEndTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __44__NFDigitalCarKeySession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id v21 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [[NFDigitalCarKeyEndEvent alloc] initFromContactlessPaymentEndEvent:*(void *)(a1 + 40)];
      id v5 = [*(id *)(a1 + 32) appletsById];
      id v6 = [*(id *)(a1 + 40) appletIdentifier];
      id v7 = [v5 objectForKey:v6];
      [v4 _setApplet:v7];

      [v21 session:*(void *)(a1 + 32) didEndTransaction:v4];
    }
  }
  else
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      SEL v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Session not active", v14, ClassName, Name, 732);
    }
    dispatch_get_specific(*v8);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      uint64_t v18 = object_getClassName(*(id *)(a1 + 32));
      id v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v23 = v17;
      __int16 v24 = 2082;
      uint64_t v25 = v18;
      __int16 v26 = 2082;
      int v27 = v19;
      __int16 v28 = 1024;
      int v29 = 732;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NFDigitalCarKeySession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __56__NFDigitalCarKeySession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id v19 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [*(id *)(a1 + 32) appletsById];
      id v5 = [v4 objectForKey:*(void *)(a1 + 40)];

      [v19 session:*(void *)(a1 + 32) didExpireTransactionForApplet:v5];
    }
  }
  else
  {
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 752);
    }
    dispatch_get_specific(*v6);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      id v16 = object_getClassName(*(id *)(a1 + 32));
      int v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v21 = v15;
      __int16 v22 = 2082;
      int v23 = v16;
      __int16 v24 = 2082;
      uint64_t v25 = v17;
      __int16 v26 = 1024;
      int v27 = 752;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didFailDeferredAuthorization
{
  v6.receiver = self;
  v6.super_class = (Class)NFDigitalCarKeySession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__NFDigitalCarKeySession_didFailDeferredAuthorization__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __54__NFDigitalCarKeySession_didFailDeferredAuthorization__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id v17 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v17 sessionDidFailDeferredAuthorization:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 770);
    }
    dispatch_get_specific(*v4);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      int v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      int v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 770;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFDigitalCarKeySession;
  uint64_t v8 = [(NFSession *)&v14 callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__NFDigitalCarKeySession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E595CDB0;
  unsigned int v13 = a3;
  v10[4] = self;
  id v11 = v7;
  SEL v12 = a2;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __63__NFDigitalCarKeySession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v15 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v15 session:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56) withObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 786);
    }
    dispatch_get_specific(*v2);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      SEL v12 = object_getClassName(*(id *)(a1 + 32));
      unsigned int v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v17 = v11;
      __int16 v18 = 2082;
      int v19 = v12;
      __int16 v20 = 2082;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = 786;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didReceiveActivityTimeout:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeySession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NFDigitalCarKeySession_didReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E595CC48;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __52__NFDigitalCarKeySession_didReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v15 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v15 sessionDidReceiveActivityTimeout:*(void *)(a1 + 32) result:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 813);
    }
    dispatch_get_specific(*v2);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      SEL v12 = object_getClassName(*(id *)(a1 + 32));
      unsigned int v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v17 = v11;
      __int16 v18 = 2082;
      int v19 = v12;
      __int16 v20 = 2082;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = 813;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFDigitalCarKeySession;
  id v7 = [(NFSession *)&v12 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NFDigitalCarKeySession_sesSession_didReceivePassthroughMessage___block_invoke;
  block[3] = &unk_1E595CC48;
  id v10 = v6;
  SEL v11 = a2;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __66__NFDigitalCarKeySession_sesSession_didReceivePassthroughMessage___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v15 = [*(id *)(a1 + 32) passthroughDelegate];
    [v15 session:*(void *)(a1 + 32) didReceivePassthroughMessage:*(void *)(a1 + 40)];
  }
  else
  {
    id v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(4, "%c[%{public}s %{public}s]:%i Ignoring message as session is no longer active.", v8, ClassName, Name, 826);
    }
    dispatch_get_specific(*v2);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      objc_super v12 = object_getClassName(*(id *)(a1 + 32));
      unsigned int v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v17 = v11;
      __int16 v18 = 2082;
      int v19 = v12;
      __int16 v20 = 2082;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = 826;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring message as session is no longer active.", buf, 0x22u);
    }
  }
}

- (void)sesSession:(id)a3 event:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFDigitalCarKeySession;
  id v9 = [(NFSession *)&v16 callbackQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NFDigitalCarKeySession_sesSession_event___block_invoke;
  v12[3] = &unk_1E595CDD8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __43__NFDigitalCarKeySession_sesSession_event___block_invoke(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"xpcEventName"];
    if ([v2 isEqualToString:@"com.apple.secureelementservice.dck.event.did.request.secure.element"])
    {
      if ([*(id *)(a1 + 32) cardEmulationStarted])
      {
        id v3 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v5 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 56));
          uint64_t v9 = 45;
          if (isMetaClass) {
            uint64_t v9 = 43;
          }
          v5(4, "%c[%{public}s %{public}s]:%i SESD requested SE and session needs to stop card emulation first.", v9, ClassName, Name, 848);
        }
        dispatch_get_specific(*v3);
        id v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v11)) {
            int v12 = 43;
          }
          else {
            int v12 = 45;
          }
          id v13 = object_getClassName(*(id *)(a1 + 32));
          id v14 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          int v73 = v12;
          __int16 v74 = 2082;
          v75 = v13;
          __int16 v76 = 2082;
          v77 = v14;
          __int16 v78 = 1024;
          int v79 = 848;
          _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SESD requested SE and session needs to stop card emulation first.", buf, 0x22u);
        }

        [*(id *)(a1 + 32) stopCardEmulation:0];
      }
      SEL v15 = *(void **)(a1 + 32);
      id v71 = 0;
      objc_super v16 = [v15 createSessionHandoffToken:&v71];
      id v17 = v71;
      if (v16)
      {
        uint64_t v18 = [*(id *)(a1 + 48) setSecureElementToken:v16];

        id v17 = (id)v18;
      }
      if (v17)
      {
        int v19 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v20 = NFLogGetLogger();
        if (v20)
        {
          int v21 = (void (*)(uint64_t, const char *, ...))v20;
          __int16 v22 = object_getClass(*(id *)(a1 + 32));
          BOOL v23 = class_isMetaClass(v22);
          v65 = object_getClassName(*(id *)(a1 + 32));
          v67 = sel_getName(*(SEL *)(a1 + 56));
          uint64_t v24 = 45;
          if (v23) {
            uint64_t v24 = 43;
          }
          v21(3, "%c[%{public}s %{public}s]:%i Failed to create handoff token for sesd - %{public}@", v24, v65, v67, 859, v17);
        }
        dispatch_get_specific(*v19);
        int v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v26)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          uint64_t v28 = object_getClassName(*(id *)(a1 + 32));
          int v29 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67110146;
          int v73 = v27;
          __int16 v74 = 2082;
          v75 = v28;
          __int16 v76 = 2082;
          v77 = v29;
          __int16 v78 = 1024;
          int v79 = 859;
          __int16 v80 = 2114;
          id v81 = v17;
          _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create handoff token for sesd - %{public}@", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if ([v2 isEqualToString:@"com.apple.secureelementservice.dck.event.did.request.authorization"])
      {
        v41 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v42 = NFLogGetLogger();
        if (v42)
        {
          int v43 = (void (*)(uint64_t, const char *, ...))v42;
          __int16 v44 = object_getClass(*(id *)(a1 + 32));
          BOOL v45 = class_isMetaClass(v44);
          uint64_t v46 = object_getClassName(*(id *)(a1 + 32));
          v69 = sel_getName(*(SEL *)(a1 + 56));
          uint64_t v47 = 45;
          if (v45) {
            uint64_t v47 = 43;
          }
          v43(6, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_REQUEST_AUTHORIZATION", v47, v46, v69, 863);
        }
        dispatch_get_specific(*v41);
        id v48 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v49 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v49)) {
            int v50 = 43;
          }
          else {
            int v50 = 45;
          }
          __int16 v51 = object_getClassName(*(id *)(a1 + 32));
          int v52 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          int v73 = v50;
          __int16 v74 = 2082;
          v75 = v51;
          __int16 v76 = 2082;
          v77 = v52;
          __int16 v78 = 1024;
          int v79 = 863;
          _os_log_impl(&dword_19D636000, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_REQUEST_AUTHORIZATION", buf, 0x22u);
        }

        __int16 v53 = [*(id *)(a1 + 32) delegate];
        if (objc_opt_respondsToSelector()) {
          [v53 sessionRequestAuthorization:*(void *)(a1 + 32)];
        }
      }
      else if ([v2 isEqualToString:@"com.apple.secureelementservice.dck.event.did.consume.authorization"])
      {
        v54 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v55 = NFLogGetLogger();
        if (v55)
        {
          v56 = (void (*)(uint64_t, const char *, ...))v55;
          __int16 v57 = object_getClass(*(id *)(a1 + 32));
          BOOL v58 = class_isMetaClass(v57);
          uint64_t v59 = object_getClassName(*(id *)(a1 + 32));
          v70 = sel_getName(*(SEL *)(a1 + 56));
          uint64_t v60 = 45;
          if (v58) {
            uint64_t v60 = 43;
          }
          v56(6, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_CONSUME_AUTHORIZATION", v60, v59, v70, 869);
        }
        dispatch_get_specific(*v54);
        __int16 v53 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v61 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v61)) {
            int v62 = 43;
          }
          else {
            int v62 = 45;
          }
          v63 = object_getClassName(*(id *)(a1 + 32));
          v64 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          int v73 = v62;
          __int16 v74 = 2082;
          v75 = v63;
          __int16 v76 = 2082;
          v77 = v64;
          __int16 v78 = 1024;
          int v79 = 869;
          _os_log_impl(&dword_19D636000, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_CONSUME_AUTHORIZATION", buf, 0x22u);
        }
      }
      else
      {
        __int16 v53 = [*(id *)(a1 + 32) delegate];
        if (objc_opt_respondsToSelector()) {
          [v53 session:*(void *)(a1 + 32) event:*(void *)(a1 + 40)];
        }
      }
    }
  }
  else
  {
    uint64_t v30 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
      id v33 = object_getClass(*(id *)(a1 + 32));
      BOOL v34 = class_isMetaClass(v33);
      char v35 = object_getClassName(*(id *)(a1 + 32));
      v68 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v36 = 45;
      if (v34) {
        uint64_t v36 = 43;
      }
      v32(3, "%c[%{public}s %{public}s]:%i Session not active", v36, v35, v68, 886);
    }
    dispatch_get_specific(*v30);
    id v2 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v37 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      v39 = object_getClassName(*(id *)(a1 + 32));
      __int16 v40 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      int v73 = v38;
      __int16 v74 = 2082;
      v75 = v39;
      __int16 v76 = 2082;
      v77 = v40;
      __int16 v78 = 1024;
      int v79 = 886;
      _os_log_impl(&dword_19D636000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (NFDigitalCarKeySessionPassthroughDelegate)passthroughDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passthroughDelegate);
  return (NFDigitalCarKeySessionPassthroughDelegate *)WeakRetained;
}

- (void)setPassthroughDelegate:(id)a3
{
}

- (NFDigitalCarKeySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NFDigitalCarKeySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)activeKey
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NFApplet)defaultApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)fieldNotificationSent
{
  return self->_fieldNotificationSent;
}

- (void)setFieldNotificationSent:(BOOL)a3
{
  self->_fieldNotificationSent = a3;
}

- (BOOL)cardEmulationStarted
{
  return self->_cardEmulationStarted;
}

- (void)setCardEmulationStarted:(BOOL)a3
{
  self->_cardEmulationStarted = a3;
}

- (NSDictionary)appletsById
{
  return self->_appletsById;
}

- (void)setAppletsById:(id)a3
{
}

- (SESDCKSession)sesdSession
{
  return self->_sesdSession;
}

- (void)setSesdSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sesdSession, 0);
  objc_storeStrong((id *)&self->_appletsById, 0);
  objc_storeStrong((id *)&self->_defaultApplet, 0);
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_passthroughDelegate);
}

@end