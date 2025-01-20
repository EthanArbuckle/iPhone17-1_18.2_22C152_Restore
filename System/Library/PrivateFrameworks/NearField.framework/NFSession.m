@interface NFSession
- (BOOL)didEnd;
- (BOOL)isActive;
- (BOOL)isFirstInQueue;
- (BOOL)isTimeLimited;
- (NFSession)init;
- (NFSessionDelegate)sessionDelegate;
- (OS_dispatch_queue)callbackQueue;
- (id)activateWithToken:(id)a3;
- (id)createSessionHandoffToken:(id *)a3;
- (id)didEndCallback;
- (id)didStartCallback;
- (id)proxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)state;
- (void)_endProxySession;
- (void)_invokeDidEndSession;
- (void)_invokeDidStartCallback:(id)a3;
- (void)dealloc;
- (void)didStartSession:(id)a3;
- (void)didStartSessionWithoutQueue:(id)a3;
- (void)endSession;
- (void)endSessionAndStartNextSession:(id)a3 completion:(id)a4;
- (void)endSessionWithCompletion:(id)a3;
- (void)handleSessionResumed;
- (void)handleSessionSuspended:(id)a3;
- (void)prioritizeSession;
- (void)resume;
- (void)setDidEndCallback:(id)a3;
- (void)setDidStartCallback:(id)a3;
- (void)setIsFirstInQueue:(BOOL)a3;
- (void)setProxy:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setSessionTimeLimit:(double)a3;
@end

@implementation NFSession

- (NFSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)NFSession;
  id v2 = [(NFSession *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearfield.session", v3);
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), (const void *)*MEMORY[0x1E4FBA898], 0, 0);
    dispatch_suspend(*((dispatch_object_t *)v2 + 2));
    *((unsigned char *)v2 + 9) = 1;
    *((void *)v2 + 7) = 0;
  }
  return (NFSession *)v2;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_state == 1)
  {
    dispatch_queue_t v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
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
      v6(3, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", v10, ClassName, Name, 53);
    }
    dispatch_get_specific(*v4);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v13;
      __int16 v18 = 2082;
      v19 = object_getClassName(self);
      __int16 v20 = 2082;
      v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 53;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", buf, 0x22u);
    }
  }
  if (self->_isCallbackQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
  }
  v15.receiver = self;
  v15.super_class = (Class)NFSession;
  [(NFSession *)&v15 dealloc];
}

- (id)proxy
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  v6 = (NFSessionInterface *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_proxy != v6) {
    objc_storeStrong((id *)&v5->_proxy, a3);
  }
  objc_sync_exit(v5);
}

- (BOOL)didEnd
{
  return self->_state == 2;
}

- (BOOL)isActive
{
  return self->_state == 1;
}

- (BOOL)isFirstInQueue
{
  return self->_isFirstInQueue;
}

- (void)setIsFirstInQueue:(BOOL)a3
{
  self->_isFirstInQueue = a3;
}

- (void)resume
{
  if (self->_isCallbackQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
    self->_isCallbackQueueSuspended = 0;
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setDidStartCallback:(id)a3
{
  dispatch_queue_t v4 = (void *)[a3 copy];
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__NFSession_setDidStartCallback___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __33__NFSession_setDidStartCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = MEMORY[0x19F3A96D0](*(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (void)setDidEndCallback:(id)a3
{
  dispatch_queue_t v4 = (void *)[a3 copy];
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__NFSession_setDidEndCallback___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __31__NFSession_setDidEndCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = MEMORY[0x19F3A96D0](*(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (void)didStartSessionWithoutQueue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_state)
  {
    id v6 = v4;
    if (v4)
    {
      [(NFSession *)self _invokeDidStartCallback:v4];
      id v4 = (id)[(NFSession *)self endSession];
    }
    else
    {
      if ([(NFSession *)self isTimeLimited]) {
        [(NFSession *)self setSessionTimeLimit:900.0];
      }
      self->_state = 1;
      id v4 = (id)[(NFSession *)self _invokeDidStartCallback:0];
    }
    id v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__NFSession_didStartSession___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __29__NFSession_didStartSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStartSessionWithoutQueue:*(void *)(a1 + 40)];
}

- (BOOL)isTimeLimited
{
  return 1;
}

- (void)setSessionTimeLimit:(double)a3
{
  id v5 = _os_activity_create(&dword_19D636000, "setSessionTimeLimit:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sessionKillSwitch = self->_sessionKillSwitch;
  if (a3 != 0.0 || sessionKillSwitch == 0)
  {
    if (a3 != 0.0)
    {
      if (!sessionKillSwitch)
      {
        id v8 = objc_alloc(MEMORY[0x1E4FBA890]);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __33__NFSession_setSessionTimeLimit___block_invoke;
        v12[3] = &unk_1E595C698;
        v12[4] = self;
        *(double *)&v12[5] = a3;
        v9 = (NFTimer *)[v8 initSleepTimerWithCallback:v12 queue:self->_callbackQueue];
        uint64_t v10 = self->_sessionKillSwitch;
        self->_sessionKillSwitch = v9;

        sessionKillSwitch = self->_sessionKillSwitch;
      }
      [(NFTimer *)sessionKillSwitch startTimer:a3];
    }
  }
  else
  {
    [(NFTimer *)sessionKillSwitch stopTimer];
    v11 = self->_sessionKillSwitch;
    self->_sessionKillSwitch = 0;
  }
}

uint64_t __33__NFSession_setSessionTimeLimit___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = _os_activity_create(&dword_19D636000, "com.apple.nfcd.session.activeTimer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)os_activity_scope_state_s state = 136315394;
    *(void *)&state[4] = Name;
    *(_WORD *)&state[12] = 2048;
    *(void *)&state[14] = v7;
    _os_log_fault_impl(&dword_19D636000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s is still active after %lf seconds", state, 0x16u);
  }
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__NFSession_setSessionTimeLimit___block_invoke_15;
  v8[3] = &unk_1E595CC98;
  v8[4] = v3;
  return [v3 endSessionWithCompletion:v8];
}

void __33__NFSession_setSessionTimeLimit___block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) sessionDelegate];
    [v4 handleSessionReachedTimeLimit];
  }
}

- (void)endSession
{
}

- (void)endSessionAndStartNextSession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "endSessionAndStartNextSession:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  [v7 prioritizeSession];
  [(NFSession *)self endSessionWithCompletion:v6];
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "endSessionWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__NFSession_endSessionWithCompletion___block_invoke;
  v8[3] = &unk_1E595E1D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(callbackQueue, v8);
}

uint64_t __38__NFSession_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    [*(id *)(v2 + 48) stopTimer];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 56) == 2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  else
  {
    [(id)v2 _endProxySession];
    id v7 = *(void **)(a1 + 32);
    if (v7[7] != 1)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v9 = [NSString stringWithUTF8String:"nf.fwk"];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"Session ended before started.";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v11 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v10];
      [v7 _invokeDidStartCallback:v11];

      id v7 = *(void **)(a1 + 32);
    }
    [v7 _invokeDidEndSession];
    *(void *)(*(void *)(a1 + 32) + 56) = 2;
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_endProxySession
{
  id v4 = [(NFSession *)self proxy];

  if (v4)
  {
    id v5 = [(NFSession *)self proxy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__NFSession__endProxySession__block_invoke;
    v9[3] = &unk_1E595C648;
    v9[4] = self;
    v9[5] = a2;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v6 endSession:&__block_literal_global_4];

    id v7 = self;
    objc_sync_enter(v7);
    proxy = v7->_proxy;
    v7->_proxy = 0;

    objc_sync_exit(v7);
  }
}

void __29__NFSession__endProxySession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 255, v3);
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
    int v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 255;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

- (void)_invokeDidStartCallback:(id)a3
{
  didStartCallback = (void (**)(id, NFSession *))self->_didStartCallback;
  if (didStartCallback)
  {
    if (a3) {
      id v5 = 0;
    }
    else {
      id v5 = self;
    }
    didStartCallback[2](didStartCallback, v5);
    id v6 = self->_didStartCallback;
    self->_didStartCallback = 0;
  }
}

- (void)_invokeDidEndSession
{
  didEndCallback = (void (**)(id, NFSession *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    id v4 = self->_didEndCallback;
    self->_didEndCallback = 0;
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(NFSession *)self proxy];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v8 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"No connection to nfcd";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v10 = (void *)[v7 initWithDomain:v8 code:0 userInfo:v9];
    v4[2](v4, v10);
  }
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(NFSession *)self proxy];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v8 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"No connection to nfcd";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v10 = (void *)[v7 initWithDomain:v8 code:0 userInfo:v9];
    v4[2](v4, v10);
  }
  return v6;
}

- (void)prioritizeSession
{
  id v4 = _os_activity_create(&dword_19D636000, "prioritizeSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  if (self->_state != 2)
  {
    id v5 = [(NFSession *)self proxy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__NFSession_prioritizeSession__block_invoke;
    v7[3] = &unk_1E595C648;
    v7[4] = self;
    void v7[5] = a2;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v7];
    [v6 prioritizeSessionWithCompletion:&__block_literal_global_33];
  }
}

void __30__NFSession_prioritizeSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 313, v3);
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
    int v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 313;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

- (id)createSessionHandoffToken:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "createSessionHandoffToken:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__13;
  __int16 v22 = __Block_byref_object_dispose__13;
  id v23 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__13;
  int v17 = __Block_byref_object_dispose__13;
  id v18 = 0;
  id v7 = [(NFSession *)self proxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__NFSession_createSessionHandoffToken___block_invoke;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  void v12[6] = a2;
  v12[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NFSession_createSessionHandoffToken___block_invoke_34;
  v11[3] = &unk_1E595E0C0;
  v11[4] = &state;
  v11[5] = &v13;
  [v8 createHandoffTokenWithCompletion:v11];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __39__NFSession_createSessionHandoffToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 326, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v4);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 67110146;
    int v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 2082;
    __int16 v25 = v16;
    __int16 v26 = 1024;
    int v27 = 326;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v3;
}

void __39__NFSession_createSessionHandoffToken___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  *id v7 = v9;
}

- (id)activateWithToken:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "activateWithToken:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  id v7 = [(NFSession *)self proxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__NFSession_activateWithToken___block_invoke;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  void v12[6] = a2;
  v12[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__NFSession_activateWithToken___block_invoke_36;
  v11[3] = &unk_1E595CF58;
  v11[4] = &state;
  [v8 activateWithToken:v5 completion:v11];

  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __31__NFSession_activateWithToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 349, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v4);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 67110146;
    int v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 2082;
    __int16 v25 = v16;
    __int16 v26 = 1024;
    int v27 = 349;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v3;
}

void __31__NFSession_activateWithToken___block_invoke_36(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)handleSessionSuspended:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(v5, "NF_numberForKey:", @"ReasonCode");
  id v7 = objc_msgSend(v5, "NF_dataForKey:", @"Field");
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28DC0];
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    int v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    id v33 = 0;
    uint64_t v13 = [v8 unarchivedObjectOfClasses:v12 fromData:v7 error:&v33];
    id v14 = v33;

    if (v14)
    {
      sel = a2;
      uint64_t v15 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v17 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(sel);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v17(3, "%c[%{public}s %{public}s]:%i Archive error=%{public}@", v20, ClassName, Name, 375, v14);
      }
      dispatch_get_specific(*v15);
      int v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = object_getClass(self);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        __int16 v24 = object_getClassName(self);
        __int16 v25 = sel_getName(sel);
        *(_DWORD *)buf = 67110146;
        int v35 = v23;
        __int16 v36 = 2082;
        v37 = v24;
        __int16 v38 = 2082;
        v39 = v25;
        __int16 v40 = 1024;
        int v41 = 375;
        __int16 v42 = 2114;
        id v43 = v14;
        _os_log_impl(&dword_19D636000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Archive error=%{public}@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  __int16 v26 = objc_msgSend(v5, "NF_dataForKey:", @"Token");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_sessionDelegate);
    objc_msgSend(v29, "handleSessionSuspended:token:reason:field:", self, v26, objc_msgSend(v6, "integerValue"), v13);
  }
}

- (void)handleSessionResumed
{
  p_sessionDelegate = &self->_sessionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_sessionDelegate);
    [v6 handleSessionResumed:self];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NFSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (NFSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (id)didStartCallback
{
  return self->_didStartCallback;
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_sessionKillSwitch, 0);
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong(&self->_didStartCallback, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end