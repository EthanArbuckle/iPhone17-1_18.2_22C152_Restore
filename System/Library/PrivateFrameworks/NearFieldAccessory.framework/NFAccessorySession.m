@interface NFAccessorySession
- (BOOL)didEnd;
- (BOOL)isActive;
- (BOOL)isFirstInQueue;
- (NFAccessorySession)init;
- (id)callbackQueue;
- (id)proxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)state;
- (void)_didEndSession;
- (void)_didStartSession:(id)a3;
- (void)_endProxySession;
- (void)dealloc;
- (void)didEndUnexpectedly;
- (void)didStartSession:(id)a3;
- (void)didStartSessionWithoutQueue:(id)a3;
- (void)endSessionWithCompletion:(id)a3;
- (void)resume;
- (void)setDidEndCallback:(id)a3;
- (void)setDidStartCallback:(id)a3;
- (void)setIsFirstInQueue:(BOOL)a3;
- (void)setProxy:(id)a3;
@end

@implementation NFAccessorySession

- (NFAccessorySession)init
{
  v8.receiver = self;
  v8.super_class = (Class)NFAccessorySession;
  id v2 = [(NFAccessorySession *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NFAccessory.session", v4);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), (const void *)*MEMORY[0x263F8C6C0], (void *)3, 0);
    dispatch_suspend(*((dispatch_object_t *)v2 + 2));
    *((unsigned char *)v2 + 9) = 1;
  }
  return (NFAccessorySession *)v2;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_state == 1)
  {
    v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", v10, ClassName, Name, 47);
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
      int v23 = 47;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", buf, 0x22u);
    }
  }
  if (self->_isCallbackQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
  }
  v15.receiver = self;
  v15.super_class = (Class)NFAccessorySession;
  [(NFAccessorySession *)&v15 dealloc];
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
  v7 = (NFSessionAccessoryInterface *)a3;
  dispatch_queue_t v5 = self;
  objc_sync_enter(v5);
  proxy = v5->_proxy;
  if (proxy != v7)
  {
    v5->_proxy = 0;

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

- (id)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setDidStartCallback:(id)a3
{
  v4 = (void *)[a3 copy];
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__NFAccessorySession_setDidStartCallback___block_invoke;
  v7[3] = &unk_2644EC798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __42__NFAccessorySession_setDidStartCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(void *)(*(void *)(a1 + 32) + 32) = MEMORY[0x223C39230](*(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)setDidEndCallback:(id)a3
{
  v4 = (void *)[a3 copy];
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__NFAccessorySession_setDidEndCallback___block_invoke;
  v7[3] = &unk_2644EC798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __40__NFAccessorySession_setDidEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(void *)(*(void *)(a1 + 32) + 40) = MEMORY[0x223C39230](*(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)didStartSessionWithoutQueue:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_state)
  {
    dispatch_queue_t v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v7(3, "%c[%{public}s %{public}s]:%i Bad State", v11, ClassName, Name, 134);
    }
    dispatch_get_specific(*v5);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v14;
      __int16 v19 = 2082;
      __int16 v20 = object_getClassName(self);
      __int16 v21 = 2082;
      __int16 v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 134;
      _os_log_impl(&dword_21ECDA000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Bad State", buf, 0x22u);
    }
  }
  else
  {
    -[NFAccessorySession _didStartSession:](self, "_didStartSession:");
    if (a3)
    {
      [(NFAccessorySession *)self endSessionWithCompletion:0];
    }
    else
    {
      self->_state = 1;
    }
  }
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__NFAccessorySession_didStartSession___block_invoke;
  v7[3] = &unk_2644EC798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __38__NFAccessorySession_didStartSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStartSessionWithoutQueue:*(void *)(a1 + 40)];
}

- (void)endSessionWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_21ECDA000, "endSessionWithCompletion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 159);
  }
  dispatch_get_specific(*v7);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(self);
    int v18 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v16;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v17;
    __int16 v26 = 2082;
    v27 = v18;
    __int16 v28 = 1024;
    int v29 = 159;
    _os_log_impl(&dword_21ECDA000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__NFAccessorySession_endSessionWithCompletion___block_invoke;
  block[3] = &unk_2644ECAB0;
  block[4] = self;
  id v23 = v5;
  SEL v24 = a2;
  id v20 = v5;
  dispatch_async(callbackQueue, block);
}

uint64_t __47__NFAccessorySession_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[6] == 2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  else
  {
    [v2 _endProxySession];
    id v5 = *(void **)(a1 + 32);
    if (v5[6] != 1)
    {
      id v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v8(3, "%c[%{public}s %{public}s]:%i Session ended before starting", v12, ClassName, Name, 173);
      }
      dispatch_get_specific(*v6);
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        int v16 = object_getClassName(*(id *)(a1 + 32));
        int v17 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        int v27 = v15;
        __int16 v28 = 2082;
        int v29 = v16;
        __int16 v30 = 2082;
        v31 = v17;
        __int16 v32 = 1024;
        int v33 = 173;
        _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session ended before starting", buf, 0x22u);
      }

      int v18 = *(void **)(a1 + 32);
      id v19 = objc_alloc(MEMORY[0x263F087E8]);
      id v20 = [NSString stringWithUTF8String:"nfac.fwk"];
      uint64_t v24 = *MEMORY[0x263F08320];
      uint64_t v25 = @"Session ended before started.";
      __int16 v21 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      __int16 v22 = (void *)[v19 initWithDomain:v20 code:0 userInfo:v21];
      [v18 _didStartSession:v22];

      id v5 = *(void **)(a1 + 32);
    }
    [v5 _didEndSession];
    *(void *)(*(void *)(a1 + 32) + 48) = 2;
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)didEndUnexpectedly
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 191);
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
    int v16 = v13;
    __int16 v17 = 2082;
    int v18 = object_getClassName(self);
    __int16 v19 = 2082;
    id v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 191;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  [(NFAccessorySession *)self endSessionWithCompletion:0];
}

- (void)_endProxySession
{
  id v4 = [(NFAccessorySession *)self proxy];

  if (v4)
  {
    id v5 = [(NFAccessorySession *)self proxy];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__NFAccessorySession__endProxySession__block_invoke;
    v10[3] = &unk_2644EC8F8;
    v10[4] = self;
    v10[5] = a2;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__NFAccessorySession__endProxySession__block_invoke_14;
    v9[3] = &unk_2644ECAD8;
    v9[4] = self;
    v9[5] = a2;
    [v6 endSession:v9];

    v7 = self;
    objc_sync_enter(v7);
    proxy = v7->_proxy;
    v7->_proxy = 0;

    objc_sync_exit(v7);
  }
}

void __38__NFAccessorySession__endProxySession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 200, v3);
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
    int v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    id v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 200;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __38__NFAccessorySession__endProxySession__block_invoke_14(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v4 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v4(3, "%c[%{public}s %{public}s]:%i session ended", v8, ClassName, Name, 202);
  }
  dispatch_get_specific(*v2);
  uint64_t v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    int v12 = object_getClassName(*(id *)(a1 + 32));
    int v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v16 = v11;
    __int16 v17 = 2082;
    int v18 = v12;
    __int16 v19 = 2082;
    id v20 = v13;
    __int16 v21 = 1024;
    int v22 = 202;
    _os_log_impl(&dword_21ECDA000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i session ended", buf, 0x22u);
  }
}

- (void)_didStartSession:(id)a3
{
  didStartCallback = (void (**)(id, NFAccessorySession *))self->_didStartCallback;
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

- (void)_didEndSession
{
  didEndCallback = (void (**)(id, NFAccessorySession *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    id v4 = self->_didEndCallback;
    self->_didEndCallback = 0;
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void *))a3;
  id v6 = [(NFAccessorySession *)self proxy];
  v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  if (!v7)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i no proxy available", v14, ClassName, Name, 232);
    }
    dispatch_get_specific(*v8);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v27 = v17;
      __int16 v28 = 2082;
      int v29 = object_getClassName(self);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 232;
      _os_log_impl(&dword_21ECDA000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no proxy available", buf, 0x22u);
    }

    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    __int16 v19 = [NSString stringWithUTF8String:"nfac.fwk"];
    uint64_t v24 = *MEMORY[0x263F08320];
    __int16 v25 = @"No connection to nfcacd";
    id v20 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    __int16 v21 = (void *)[v18 initWithDomain:v19 code:0 userInfo:v20];
    v5[2](v5, v21);
  }
  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void *))a3;
  id v6 = [(NFAccessorySession *)self proxy];
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v5];

  if (!v7)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i no proxy available", v14, ClassName, Name, 244);
    }
    dispatch_get_specific(*v8);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v27 = v17;
      __int16 v28 = 2082;
      int v29 = object_getClassName(self);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 244;
      _os_log_impl(&dword_21ECDA000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no proxy available", buf, 0x22u);
    }

    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    __int16 v19 = [NSString stringWithUTF8String:"nfac.fwk"];
    uint64_t v24 = *MEMORY[0x263F08320];
    __int16 v25 = @"No connection to nfcacd";
    id v20 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    __int16 v21 = (void *)[v18 initWithDomain:v19 code:0 userInfo:v20];
    v5[2](v5, v21);
  }
  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong(&self->_didStartCallback, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end