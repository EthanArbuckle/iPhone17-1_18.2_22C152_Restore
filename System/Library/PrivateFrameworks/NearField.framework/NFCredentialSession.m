@interface NFCredentialSession
- (NFCredentialSession)init;
- (NFCredentialSessionEvents)eventDelegate;
- (NFCredentialTransceiver)activeTransceiver;
- (id)wiredModeTransceive:(id)a3 outError:(id *)a4;
- (os_unfair_lock_s)lock;
- (void)_startWiredModeWithApplets:(void *)a3 selectOnStart:(void *)a4 externalAuth:(void *)a5 completion:;
- (void)didExpireTransactionForApplet:(id)a3;
- (void)fieldChanged:(BOOL)a3;
- (void)handleSessionSuspended:(id)a3;
- (void)notifyHCIData:(id)a3 appletIdentifier:(id)a4;
- (void)requestSETransceiverWithCompletion:(id)a3;
- (void)setActiveTransceiver:(id)a3;
- (void)setEventDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)startCardEmulationWithApplets:(id)a3 externalAuth:(id)a4 completion:(id)a5;
- (void)startWiredModeWithApplets:(id)a3 externalAuth:(id)a4 completion:(id)a5;
- (void)startWiredModeWithApplets:(id)a3 selectOnStart:(id)a4 externalAuth:(id)a5 completion:(id)a6;
- (void)startWiredModeWithIdentifiers:(id)a3 externalAuth:(id)a4 completion:(id)a5;
@end

@implementation NFCredentialSession

- (NFCredentialSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFCredentialSession;
  v2 = [(NFSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)handleSessionSuspended:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NFCredentialSession;
  [(NFSession *)&v6 handleSessionSuspended:a3];
  v4 = [(NFCredentialSession *)self activeTransceiver];
  id v5 = (id)[v4 _invalidateParentSession];
}

- (void)startWiredModeWithApplets:(id)a3 externalAuth:(id)a4 completion:(id)a5
{
}

- (void)_startWiredModeWithApplets:(void *)a3 selectOnStart:(void *)a4 externalAuth:(void *)a5 completion:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v13 = _os_activity_create(&dword_19D636000, "startWireModeWithApplets:selectOnStart:externalAuth:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    os_activity_scope_leave(&state);

    if ([v9 count])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke;
      v24[3] = &unk_1E595E138;
      id v14 = v12;
      id v25 = v14;
      v15 = [a1 remoteObjectProxyWithErrorHandler:v24];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_2;
      v21[3] = &unk_1E595DEC0;
      v21[4] = a1;
      v23 = sel__startWiredModeWithApplets_selectOnStart_externalAuth_completion_;
      id v22 = v14;
      [v15 requestApplets:v9 selectOnStart:v10 AIDAllowList:0 externalAuth:v11 mode:1 completion:v21];

      v16 = v25;
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = [NSString stringWithUTF8String:"nfcd"];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v18 = [NSString stringWithUTF8String:"Missing Parameter"];
      v28[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v20 = (void *)[v17 initWithDomain:v16 code:9 userInfo:v19];
      (*((void (**)(id, void *))v12 + 2))(v12, v20);
    }
  }
}

- (void)startWiredModeWithApplets:(id)a3 selectOnStart:(id)a4 externalAuth:(id)a5 completion:(id)a6
{
}

uint64_t __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(os_unfair_lock_s **)(a1 + 32);
  id v5 = v4 + 18;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_3;
  v14[3] = &unk_1E595C698;
  uint64_t v6 = *(void *)(a1 + 48);
  v14[4] = v4;
  v14[5] = v6;
  os_unfair_lock_lock(v4 + 18);
  __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_3((uint64_t)v14);
  os_unfair_lock_unlock(v5);
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)NFCredentialSession;
  v7 = objc_msgSendSuper2(&v13, sel_callbackQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_131;
  v10[3] = &unk_1E595D540;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v4 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v4(6, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", v8, ClassName, Name, 357);
  }
  dispatch_get_specific(*v2);
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    id v12 = object_getClassName(*(id *)(a1 + 32));
    objc_super v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v19 = v11;
    __int16 v20 = 2082;
    v21 = v12;
    __int16 v22 = 2082;
    v23 = v13;
    __int16 v24 = 1024;
    int v25 = 357;
    _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", buf, 0x22u);
  }

  id v14 = [*(id *)(a1 + 32) activeTransceiver];
  id v15 = (id)[v14 _invalidateParentSession];

  return [*(id *)(a1 + 32) setActiveTransceiver:0];
}

uint64_t __88__NFCredentialSession__startWiredModeWithApplets_selectOnStart_externalAuth_completion___block_invoke_131(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startWiredModeWithIdentifiers:(id)a3 externalAuth:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _os_activity_create(&dword_19D636000, "startWiredModeWithIdentifiers:externalAuth:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  if ([v9 count])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke;
    v23[3] = &unk_1E595E138;
    id v13 = v11;
    id v24 = v13;
    id v14 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v23];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_2;
    v20[3] = &unk_1E595DEC0;
    v20[4] = self;
    SEL v22 = a2;
    id v21 = v13;
    [v14 requestApplets:0 selectOnStart:0 AIDAllowList:v9 externalAuth:v10 mode:1 completion:v20];

    id v15 = v24;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    id v17 = [NSString stringWithUTF8String:"Missing Parameter"];
    v27[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    int v19 = (void *)[v16 initWithDomain:v15 code:9 userInfo:v18];
    (*((void (**)(id, void *))v11 + 2))(v11, v19);
  }
}

uint64_t __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(os_unfair_lock_s **)(a1 + 32);
  id v5 = v4 + 18;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_3;
  v14[3] = &unk_1E595C698;
  uint64_t v6 = *(void *)(a1 + 48);
  v14[4] = v4;
  v14[5] = v6;
  os_unfair_lock_lock(v4 + 18);
  __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_3((uint64_t)v14);
  os_unfair_lock_unlock(v5);
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)NFCredentialSession;
  v7 = objc_msgSendSuper2(&v13, sel_callbackQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_132;
  v10[3] = &unk_1E595D540;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v4 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v4(6, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", v8, ClassName, Name, 389);
  }
  dispatch_get_specific(*v2);
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    id v12 = object_getClassName(*(id *)(a1 + 32));
    objc_super v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v19 = v11;
    __int16 v20 = 2082;
    id v21 = v12;
    __int16 v22 = 2082;
    v23 = v13;
    __int16 v24 = 1024;
    int v25 = 389;
    _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", buf, 0x22u);
  }

  id v14 = [*(id *)(a1 + 32) activeTransceiver];
  id v15 = (id)[v14 _invalidateParentSession];

  return [*(id *)(a1 + 32) setActiveTransceiver:0];
}

uint64_t __77__NFCredentialSession_startWiredModeWithIdentifiers_externalAuth_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startCardEmulationWithApplets:(id)a3 externalAuth:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = _os_activity_create(&dword_19D636000, "startCardEmulationWithApplets:externalAuth:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke;
  v19[3] = &unk_1E595E138;
  id v13 = v9;
  id v20 = v13;
  id v14 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_2;
  v16[3] = &unk_1E595DEC0;
  id v17 = v13;
  SEL v18 = a2;
  v16[4] = self;
  id v15 = v13;
  [v14 requestApplets:v11 selectOnStart:0 AIDAllowList:0 externalAuth:v10 mode:2 completion:v16];
}

uint64_t __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(os_unfair_lock_s **)(a1 + 32);
  id v5 = v4 + 18;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_3;
  v14[3] = &unk_1E595C698;
  uint64_t v6 = *(void *)(a1 + 48);
  v14[4] = v4;
  v14[5] = v6;
  os_unfair_lock_lock(v4 + 18);
  __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_3((uint64_t)v14);
  os_unfair_lock_unlock(v5);
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)NFCredentialSession;
  v7 = objc_msgSendSuper2(&v13, sel_callbackQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_133;
  v10[3] = &unk_1E595D540;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v4 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v4(6, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", v8, ClassName, Name, 416);
  }
  dispatch_get_specific(*v2);
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    id v12 = object_getClassName(*(id *)(a1 + 32));
    objc_super v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v19 = v11;
    __int16 v20 = 2082;
    id v21 = v12;
    __int16 v22 = 2082;
    v23 = v13;
    __int16 v24 = 1024;
    int v25 = 416;
    _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidate active SE transceiver", buf, 0x22u);
  }

  id v14 = [*(id *)(a1 + 32) activeTransceiver];
  id v15 = (id)[v14 _invalidateParentSession];

  return [*(id *)(a1 + 32) setActiveTransceiver:0];
}

uint64_t __77__NFCredentialSession_startCardEmulationWithApplets_externalAuth_completion___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)wiredModeTransceive:(id)a3 outError:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = _os_activity_create(&dword_19D636000, "wireModeTransceive:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__11;
  v47 = __Block_byref_object_dispose__11;
  id v48 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__11;
  v42 = __Block_byref_object_dispose__11;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__11;
  v36 = __Block_byref_object_dispose__11;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke;
  v31[3] = &unk_1E595D770;
  v31[4] = self;
  v31[5] = &v32;
  os_unfair_lock_lock(&self->_lock);
  __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke((uint64_t)v31);
  os_unfair_lock_unlock(&self->_lock);
  id v9 = (void *)v33[5];
  if (v9 && ([v9 hasInvalidated] & 1) == 0)
  {
    int v11 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Existing active transceiver found", v17, ClassName, Name, 440);
    }
    dispatch_get_specific(*v11);
    SEL v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      id v21 = object_getClassName(self);
      __int16 v22 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v52 = v20;
      __int16 v53 = 2082;
      v54 = v21;
      __int16 v55 = 2082;
      v56 = v22;
      __int16 v57 = 1024;
      int v58 = 440;
      _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Existing active transceiver found", buf, 0x22u);
    }

    if (a4)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      __int16 v24 = [NSString stringWithUTF8String:"nfcd"];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      int v25 = [NSString stringWithUTF8String:"Invalid State"];
      v50 = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      *a4 = (id)[v23 initWithDomain:v24 code:12 userInfo:v26];

      a4 = 0;
    }
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke_135;
    v30[3] = &unk_1E595CF58;
    v30[4] = &v38;
    id v10 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v30];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke_2;
    v29[3] = &unk_1E595E0C0;
    v29[4] = &state;
    v29[5] = &v38;
    [v10 transceive:v7 completion:v29];

    if (a4) {
      *a4 = (id) v39[5];
    }
    a4 = (id *)*(id *)(state.opaque[1] + 40);
  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&state, 8);

  return a4;
}

uint64_t __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) activeTransceiver];
  return MEMORY[0x1F41817F8]();
}

void __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke_135(uint64_t a1, void *a2)
{
}

void __52__NFCredentialSession_wiredModeTransceive_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestSETransceiverWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "requestSETransceiverWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__11;
  SEL v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke;
  v14[3] = &unk_1E595D770;
  v14[4] = self;
  v14[5] = &state;
  os_unfair_lock_lock(&self->_lock);
  __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke((uint64_t)v14);
  os_unfair_lock_unlock(&self->_lock);
  id v6 = *(void **)(state.opaque[1] + 40);
  if (v6 && ([v6 hasInvalidated] & 1) == 0)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(state.opaque[1] + 40), 0);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_2;
    v12[3] = &unk_1E595E138;
    id v7 = v4;
    id v13 = v7;
    uint64_t v8 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v12];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_3;
    v9[3] = &unk_1E595E188;
    p_os_activity_scope_state_s state = &state;
    v9[4] = self;
    id v10 = v7;
    [v8 requestApplets:0 selectOnStart:0 AIDAllowList:0 externalAuth:0 mode:3 completion:v9];
  }
  _Block_object_dispose(&state, 8);
}

uint64_t __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) activeTransceiver];
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [*(id *)(a1 + 32) setActiveTransceiver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 activeTransceiver];
    [v8 setParentSession:v7];
  }
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFCredentialSession;
  uint64_t v9 = objc_msgSendSuper2(&v17, sel_callbackQueue);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_4;
  block[3] = &unk_1E595E160;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v15 = v10;
  uint64_t v16 = v11;
  id v14 = v3;
  id v12 = v3;
  dispatch_async(v9, block);
}

uint64_t __58__NFCredentialSession_requestSETransceiverWithCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (void)notifyHCIData:(id)a3 appletIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFCredentialSession;
  uint64_t v8 = [(NFSession *)&v14 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NFCredentialSession_notifyHCIData_appletIdentifier___block_invoke;
  block[3] = &unk_1E595CFA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__NFCredentialSession_notifyHCIData_appletIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [WeakRetained session:*(void *)(a1 + 32) didReceiveHCIData:*(void *)(a1 + 40) forAppletWithIdentifier:*(void *)(a1 + 48)];
  }
}

- (void)fieldChanged:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NFCredentialSession;
  uint64_t v5 = [(NFSession *)&v8 callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NFCredentialSession_fieldChanged___block_invoke;
  v6[3] = &unk_1E595D0F0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __36__NFCredentialSession_fieldChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [WeakRetained session:*(void *)(a1 + 32) fieldChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFCredentialSession;
  id v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NFCredentialSession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __53__NFCredentialSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      id v9 = [*(id *)(a1 + 40) identifier];
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v4(6, "%c[%{public}s %{public}s]:%i auth expired event for applet: %{public}@", v10, ClassName, Name, 524, v9);
    }
    dispatch_get_specific(*v2);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      objc_super v14 = object_getClassName(*(id *)(a1 + 32));
      id v15 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v16 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      id v21 = v14;
      __int16 v22 = 2082;
      id v23 = v15;
      __int16 v24 = 1024;
      int v25 = 524;
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i auth expired event for applet: %{public}@", buf, 0x2Cu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [WeakRetained session:*(void *)(a1 + 32) didExpireAuthorizationForApplet:*(void *)(a1 + 40)];
  }
}

- (NFCredentialSessionEvents)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);
  return (NFCredentialSessionEvents *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NFCredentialTransceiver)activeTransceiver
{
  return self->_activeTransceiver;
}

- (void)setActiveTransceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransceiver, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end