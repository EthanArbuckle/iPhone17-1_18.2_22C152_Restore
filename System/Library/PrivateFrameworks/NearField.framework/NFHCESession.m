@interface NFHCESession
- (NFHCESessionDelegate)delegate;
- (id)readAPDU:(id *)a3;
- (id)requestEmulationAssertion:(double)a3;
- (id)sendAPDU:(id)a3;
- (id)sendAPDU:(id)a3 startReadOnCompletion:(BOOL)a4;
- (id)startEmulation;
- (id)stopEmulation;
- (void)didConnectToReader;
- (void)didDisconnectFromReader;
- (void)didEndUnexpectedly;
- (void)didReceiveAPDU:(id)a3;
- (void)didReceiveField:(id)a3;
- (void)endSession;
- (void)readAPDUWithCompletion:(id)a3;
- (void)restartDiscovery;
- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)suspensionStateUpdate:(BOOL)a3 triggeredByField:(id)a4;
@end

@implementation NFHCESession

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFHCESessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFHCESessionDelegate *)WeakRetained;
}

- (void)endSession
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)NFHCESession;
  [(NFSession *)&v3 endSession];
}

- (id)startEmulation
{
  id v4 = _os_activity_create(&dword_19D636000, "startEmulation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__NFHCESession_startEmulation__block_invoke;
  v9[3] = &unk_1E595C6C0;
  v9[4] = self;
  v9[5] = &state;
  v9[6] = a2;
  v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__NFHCESession_startEmulation__block_invoke_12;
  v8[3] = &unk_1E595CBD0;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 startEmulationWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __30__NFHCESession_startEmulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 49, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 49;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __30__NFHCESession_startEmulation__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
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
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 52, v3);
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
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      __int16 v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 52;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)stopEmulation
{
  id v4 = _os_activity_create(&dword_19D636000, "stopEmulation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__9;
  int v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__NFHCESession_stopEmulation__block_invoke;
  v9[3] = &unk_1E595C6C0;
  v9[4] = self;
  v9[5] = &state;
  v9[6] = a2;
  v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__NFHCESession_stopEmulation__block_invoke_13;
  v8[3] = &unk_1E595CBD0;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 stopEmulationWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __29__NFHCESession_stopEmulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 67, v4);
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
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 67;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __29__NFHCESession_stopEmulation__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
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
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 70, v3);
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
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      __int16 v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 70;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)sendAPDU:(id)a3
{
  return [(NFHCESession *)self sendAPDU:a3 startReadOnCompletion:0];
}

- (id)sendAPDU:(id)a3 startReadOnCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = _os_activity_create(&dword_19D636000, "sendAPDU:startReadOnCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__NFHCESession_sendAPDU_startReadOnCompletion___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__NFHCESession_sendAPDU_startReadOnCompletion___block_invoke_14;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  [v9 sendAPDU:v7 startReadOnCompletion:v4 completion:v12];

  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

void __47__NFHCESession_sendAPDU_startReadOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 90, v4);
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
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 90;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __47__NFHCESession_sendAPDU_startReadOnCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
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
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 93, v3);
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
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      __int16 v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 93;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)readAPDU:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "readAPDU:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__9;
  __int16 v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__NFHCESession_readAPDU___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25__NFHCESession_readAPDU___block_invoke_15;
  v10[3] = &unk_1E595D910;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v12;
  v10[7] = a2;
  [v7 readAPDUWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __25__NFHCESession_readAPDU___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 109, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
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
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 109;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __25__NFHCESession_readAPDU___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 112, v6);
    }
    dispatch_get_specific(*v7);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v26 = v15;
      __int16 v27 = 2082;
      uint64_t v28 = v16;
      __int16 v29 = 2082;
      v30 = v17;
      __int16 v31 = 1024;
      int v32 = 112;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
  id v20 = v5;

  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v6;
}

- (void)readAPDUWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "readAPDUWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__NFHCESession_readAPDUWithCompletion___block_invoke;
  v13[3] = &unk_1E595DEC0;
  v13[4] = self;
  SEL v15 = a2;
  id v7 = v5;
  id v14 = v7;
  id v8 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__NFHCESession_readAPDUWithCompletion___block_invoke_17;
  v10[3] = &unk_1E595DFA8;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v7;
  [v8 asyncReadAPDUWithCompletion:v10];
}

void __39__NFHCESession_readAPDUWithCompletion___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 128, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    id v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 128;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __39__NFHCESession_readAPDUWithCompletion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 132, v6);
    }
    dispatch_get_specific(*v7);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 2082;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = 132;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)requestEmulationAssertion:(double)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = _os_activity_create(&dword_19D636000, "requestEmulationAssertion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__9;
  __int16 v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  id v7 = (void *)[objc_alloc(NSNumber) initWithDouble:a3];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __42__NFHCESession_requestEmulationAssertion___block_invoke;
  v27[3] = &unk_1E595CBD0;
  v27[5] = &state;
  v27[6] = a2;
  v27[4] = self;
  id v8 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__NFHCESession_requestEmulationAssertion___block_invoke_18;
  v26[3] = &unk_1E595CF58;
  v26[4] = &state;
  [v8 requestEmulationAssertion:v7 completion:v26];

  uint64_t v9 = *(void **)(state.opaque[1] + 40);
  if (v9)
  {
    uint64_t v10 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 152, *(void *)(state.opaque[1] + 40));
    }
    dispatch_get_specific(*v10);
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      int v21 = object_getClassName(self);
      __int16 v22 = sel_getName(a2);
      uint64_t v23 = *(void *)(state.opaque[1] + 40);
      *(_DWORD *)buf = 67110146;
      int v34 = v20;
      __int16 v35 = 2082;
      v36 = v21;
      __int16 v37 = 2082;
      v38 = v22;
      __int16 v39 = 1024;
      int v40 = 152;
      __int16 v41 = 2114;
      uint64_t v42 = v23;
      _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v9 = *(void **)(state.opaque[1] + 40);
  }
  id v24 = v9;

  _Block_object_dispose(&state, 8);
  return v24;
}

void __42__NFHCESession_requestEmulationAssertion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 145, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    id v24 = v14;
    __int16 v25 = 1024;
    int v26 = 145;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __42__NFHCESession_requestEmulationAssertion___block_invoke_18(uint64_t a1, void *a2)
{
}

- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "resumeSessionFromWaitingOnFieldWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__NFHCESession_resumeSessionFromWaitingOnFieldWithCompletion___block_invoke;
  v13[3] = &unk_1E595DEC0;
  v13[4] = self;
  SEL v15 = a2;
  id v7 = v5;
  id v14 = v7;
  id v8 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__NFHCESession_resumeSessionFromWaitingOnFieldWithCompletion___block_invoke_19;
  v10[3] = &unk_1E595DEC0;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v7;
  [v8 resumeSessionFromWaitingOnFieldWithCompletion:v10];
}

void __62__NFHCESession_resumeSessionFromWaitingOnFieldWithCompletion___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 162, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 162;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__NFHCESession_resumeSessionFromWaitingOnFieldWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
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
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 166, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      int v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      int v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 166;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)restartDiscovery
{
  id v4 = _os_activity_create(&dword_19D636000, "restartDiscovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__NFHCESession_restartDiscovery__block_invoke;
  v6[3] = &unk_1E595C648;
  v6[4] = self;
  v6[5] = a2;
  id v5 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v6];
  [v5 restartDiscovery];
}

void __32__NFHCESession_restartDiscovery__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 177, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 177;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

- (void)didEndUnexpectedly
{
  v5.receiver = self;
  v5.super_class = (Class)NFHCESession;
  id v3 = [(NFSession *)&v5 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NFHCESession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

id __34__NFHCESession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NFHCESession;
  return objc_msgSendSuper2(&v6, sel_didEndUnexpectedly);
}

- (void)didConnectToReader
{
  v5.receiver = self;
  v5.super_class = (Class)NFHCESession;
  char v3 = [(NFSession *)&v5 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NFHCESession_didConnectToReader__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__NFHCESession_didConnectToReader__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSessionDidConnect:*(void *)(a1 + 32)];
  }
}

- (void)didDisconnectFromReader
{
  v5.receiver = self;
  v5.super_class = (Class)NFHCESession;
  char v3 = [(NFSession *)&v5 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NFHCESession_didDisconnectFromReader__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__NFHCESession_didDisconnectFromReader__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSessionDidDisconnect:*(void *)(a1 + 32)];
  }
}

- (void)didReceiveAPDU:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFHCESession;
  objc_super v5 = [(NFSession *)&v9 callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__NFHCESession_didReceiveAPDU___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __31__NFHCESession_didReceiveAPDU___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSession:*(void *)(a1 + 32) didReceiveAPDU:*(void *)(a1 + 40)];
  }
}

- (void)didReceiveField:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFHCESession;
  objc_super v5 = [(NFSession *)&v9 callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__NFHCESession_didReceiveField___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __32__NFHCESession_didReceiveField___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSession:*(void *)(a1 + 32) didReceiveField:*(void *)(a1 + 40)];
  }
}

- (void)suspensionStateUpdate:(BOOL)a3 triggeredByField:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFHCESession;
  id v7 = [(NFSession *)&v12 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NFHCESession_suspensionStateUpdate_triggeredByField___block_invoke;
  block[3] = &unk_1E595DFD0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __55__NFHCESession_suspensionStateUpdate_triggeredByField___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 hceSession:*(void *)(a1 + 32) triggeredByField:*(void *)(a1 + 40) started:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void).cxx_destruct
{
}

@end