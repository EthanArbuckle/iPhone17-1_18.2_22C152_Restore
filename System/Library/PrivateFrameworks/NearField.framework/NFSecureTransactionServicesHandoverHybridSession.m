@interface NFSecureTransactionServicesHandoverHybridSession
- (BOOL)setActiveApplet:(id)a3 authorization:(id)a4 error:(id *)a5;
- (BOOL)startCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)stopCardEmulation:(id *)a3;
- (NFApplet)activeApplet;
- (NFApplet)defaultApplet;
- (NFSecureTransactionServicesHandoverHybridSessionDelegate)delegate;
- (NFTNEPReaderDelegate)tagReaderDelegate;
- (NFTNEPTagDeviceDelegate)tagDeviceDelegate;
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (unint64_t)numberOfActiveSecureElements;
- (void)connectionHandoverProcessCompleted;
- (void)connectionHandoverProcessFailure:(id)a3;
- (void)connectionHandoverTNEPServiceSelected:(id)a3;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndTransaction:(id)a3;
- (void)didExpireTransactionForApplet:(id)a3;
- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4;
- (void)didSelectApplet:(id)a3;
- (void)didStartSession:(id)a3;
- (void)didStartTransaction:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)fieldChange:(BOOL)a3;
- (void)fieldNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTagDeviceDelegate:(id)a3;
- (void)setTagReaderDelegate:(id)a3;
- (void)startSTSNotificationListenerWithEndpoint:(id)a3;
- (void)staticReaderEngagementDiscovered:(id)a3;
- (void)stopTNEPOperation;
- (void)tnepReaderServicesAborted:(id)a3;
- (void)tnepReaderServicesDiscovered:(id)a3;
- (void)tnepTagDeviceDeselected:(id)a3;
- (void)tnepTagDeviceNDEFMessageReceived:(id)a3;
- (void)tnepTagDeviceReaderDetected;
- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4;
@end

@implementation NFSecureTransactionServicesHandoverHybridSession

- (void)startSTSNotificationListenerWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_19D636000, "startSTSNotificationListenerWithEndpoint:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__NFSecureTransactionServicesHandoverHybridSession_startSTSNotificationListenerWithEndpoint___block_invoke;
  v8[3] = &unk_1E595C648;
  v8[4] = self;
  v8[5] = a2;
  v7 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v8];
  [v7 startSTSNotificationListenerEndpoint:v5];
}

void __93__NFSecureTransactionServicesHandoverHybridSession_startSTSNotificationListenerWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 44, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 44;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFSecureTransactionServicesHandoverHybridSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFSecureTransactionServicesHandoverHybridSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 72, *(void *)(a1 + 40));
    }
    dispatch_get_specific(*v2);
    SEL v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      v13 = object_getClassName(*(id *)(a1 + 32));
      v14 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110146;
      int v23 = v12;
      __int16 v24 = 2082;
      __int16 v25 = v13;
      __int16 v26 = 2082;
      uint64_t v27 = v14;
      __int16 v28 = 1024;
      int v29 = 72;
      __int16 v30 = 2114;
      uint64_t v31 = v15;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      v21.receiver = *(id *)(a1 + 32);
      v21.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
      objc_msgSendSuper2(&v21, sel_didStartSession_);
      return;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_15;
    v20[3] = &unk_1E595C648;
    uint64_t v17 = *(void *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v17;
    v19.receiver = v16;
    v19.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
    SEL v10 = objc_msgSendSuper2(&v19, sel_remoteObjectProxyWithErrorHandler_, v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_19;
    v18[3] = &unk_1E595CE50;
    v18[4] = *(void *)(a1 + 32);
    [v10 getAppletsWithCompletion:v18];
  }
}

void __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 80, v3);
  }
  dispatch_get_specific(*v4);
  SEL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_super v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v19 = v12;
    __int16 v20 = 2082;
    objc_super v21 = v13;
    __int16 v22 = 2082;
    int v23 = v14;
    __int16 v24 = 1024;
    int v25 = 80;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  objc_msgSendSuper2(&v17, sel_didStartSession_, v3);
}

void __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  objc_sync_enter(v8);
  objc_super v11 = objc_opt_new();
  int v12 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_2;
  v23[3] = &unk_1E595D0A0;
  id v24 = v12;
  id v25 = v11;
  id v13 = v11;
  id v14 = v12;
  [v10 enumerateObjectsUsingBlock:v23];
  uint64_t v15 = [v13 allKeys];
  *(void *)(*(void *)(a1 + 32) + 88) = [v15 count];

  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v10 forKeys:v14];
  uint64_t v17 = *(void *)(a1 + 32);
  int v18 = *(void **)(v17 + 72);
  *(void *)(v17 + 72) = v16;

  uint64_t v19 = *(void *)(a1 + 32);
  __int16 v20 = *(void **)(v19 + 104);
  *(void *)(v19 + 104) = v7;
  id v21 = v7;

  objc_sync_exit(v8);
  v22.receiver = *(id *)(a1 + 32);
  v22.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  objc_msgSendSuper2(&v22, sel_didStartSession_, v9);
}

void __68__NFSecureTransactionServicesHandoverHybridSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [v12 identifier];
  [v3 addObject:v4];

  uint64_t v5 = [v12 seIdentifier];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = *(void **)(a1 + 40);
    id v8 = [v12 seIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v10 = *(void **)(a1 + 40);
      objc_super v11 = [v12 seIdentifier];
      [v10 setObject:&unk_1EEF355C0 forKeyedSubscript:v11];
    }
  }
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFSecureTransactionServicesHandoverHybridSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  [(NFSession *)&v5 endSessionWithCompletion:v4];
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__NFSecureTransactionServicesHandoverHybridSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __67__NFSecureTransactionServicesHandoverHybridSession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 48))
    {
      if (v2[96])
      {
        uint64_t v17 = [v2 delegate];
        char v18 = objc_opt_respondsToSelector();

        v2 = *(unsigned char **)(a1 + 32);
        if (v18)
        {
          v2[96] = 0;
          uint64_t v19 = [*(id *)(a1 + 32) delegate];
          [v19 sessionDidExitField:*(void *)(a1 + 32)];

          v2 = *(unsigned char **)(a1 + 32);
        }
      }
    }
    id v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v21 = [*(id *)(a1 + 32) delegate];
      [v21 session:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
    }
  }
  else
  {
    objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 133);
    }
    dispatch_get_specific(*v5);
    id v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v23 = v14;
      __int16 v24 = 2082;
      id v25 = v15;
      __int16 v26 = 2082;
      id v27 = v16;
      __int16 v28 = 1024;
      int v29 = 133;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NFSecureTransactionServicesHandoverHybridSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __79__NFSecureTransactionServicesHandoverHybridSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
      id v17 = [*(id *)(a1 + 32) delegate];
      [v17 session:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
    }
  }
  else
  {
    char v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 151);
    }
    dispatch_get_specific(*v4);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      id v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 151;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NFSecureTransactionServicesHandoverHybridSession_didSelectApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __68__NFSecureTransactionServicesHandoverHybridSession_didSelectApplet___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0) {
      return;
    }
    char v4 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
    if (!v4)
    {
      id v5 = [NFApplet alloc];
      id v21 = @"identifier";
      v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", *(void *)(a1 + 40));
      __int16 v22 = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      char v4 = [(NFApplet *)v5 initWithDictionary:v7];
    }
    BOOL v8 = [*(id *)(a1 + 32) delegate];
    [v8 session:*(void *)(a1 + 32) didSelectApplet:v4];
  }
  else
  {
    id v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 165);
    }
    dispatch_get_specific(*v9);
    char v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      char v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 2082;
      __int16 v28 = v19;
      __int16 v29 = 1024;
      int v30 = 165;
      _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didStartTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NFSecureTransactionServicesHandoverHybridSession_didStartTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __72__NFSecureTransactionServicesHandoverHybridSession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 72);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 session:*(void *)(a1 + 32) didStartTransaction:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 182);
    }
    dispatch_get_specific(*v7);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(*(id *)(a1 + 32));
      char v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 1024;
      int v28 = 182;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NFSecureTransactionServicesHandoverHybridSession_didEndTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __70__NFSecureTransactionServicesHandoverHybridSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 72);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 session:*(void *)(a1 + 32) didEndTransaction:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 196);
    }
    dispatch_get_specific(*v7);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(*(id *)(a1 + 32));
      char v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 1024;
      int v28 = 196;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NFSecureTransactionServicesHandoverHybridSession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __82__NFSecureTransactionServicesHandoverHybridSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 session:*(void *)(a1 + 32) didExpireTransactionForApplet:v4];
    }
    objc_sync_exit(obj);
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 210);
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
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 2082;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = 210;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFSecureTransactionServicesHandoverHybridSession;
  BOOL v8 = [(NFSession *)&v14 callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__NFSecureTransactionServicesHandoverHybridSession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E595CDB0;
  id v11 = v7;
  SEL v12 = a2;
  unsigned int v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __89__NFSecureTransactionServicesHandoverHybridSession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 227);
    }
    dispatch_get_specific(*v6);
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v19 = v14;
      __int16 v20 = 2082;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 1024;
      int v25 = 227;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_13;
  }
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 session:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56) withObject:*(void *)(a1 + 40)];
LABEL_13:
  }
  objc_sync_exit(v2);
}

- (void)fieldNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NFSecureTransactionServicesHandoverHybridSession_fieldNotification___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__NFSecureTransactionServicesHandoverHybridSession_fieldNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) fieldNotification:*(void *)(a1 + 40)];
}

- (void)fieldChange:(BOOL)a3
{
  id v5 = [(NFSession *)self callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__NFSecureTransactionServicesHandoverHybridSession_fieldChange___block_invoke;
  v6[3] = &unk_1E595D0F0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __64__NFSecureTransactionServicesHandoverHybridSession_fieldChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 session:*(void *)(a1 + 32) fieldChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)tnepReaderServicesDiscovered:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__NFSecureTransactionServicesHandoverHybridSession_tnepReaderServicesDiscovered___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__NFSecureTransactionServicesHandoverHybridSession_tnepReaderServicesDiscovered___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagReaderDelegate];
  [v2 didDiscoverServices:*(void *)(a1 + 40)];
}

- (void)staticReaderEngagementDiscovered:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i handover select %@", v11, ClassName, Name, 285, v5);
  }
  dispatch_get_specific(*v6);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v18 = v14;
    __int16 v19 = 2082;
    __int16 v20 = object_getClassName(self);
    __int16 v21 = 2082;
    __int16 v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 285;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select %@", buf, 0x2Cu);
  }
}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5 = a3;
  id v6 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NFSecureTransactionServicesHandoverHybridSession_tnepReaderServicesAborted___block_invoke;
  block[3] = &unk_1E595CC48;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __78__NFSecureTransactionServicesHandoverHybridSession_tnepReaderServicesAborted___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tagReaderDelegate];
  [v2 didAbort:*(void *)(a1 + 40)];

  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 session:*(void *)(a1 + 32) didEndUnexpectedly:*(void *)(a1 + 40)];
  }
  id v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
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
    v8(4, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", v12, ClassName, Name, 295);
  }
  dispatch_get_specific(*v6);
  unsigned int v13 = NFSharedLogGetLogger();
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
    int v21 = v15;
    __int16 v22 = 2082;
    __int16 v23 = v16;
    __int16 v24 = 2082;
    __int16 v25 = v17;
    __int16 v26 = 1024;
    int v27 = 295;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", buf, 0x22u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceDeselected___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceDeselected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagDeviceDelegate];
  [v2 didDeselect:*(void *)(a1 + 40)];
}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceNDEFMessageReceived___block_invoke;
  v7[3] = &unk_1E595D0C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __85__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceNDEFMessageReceived___block_invoke(uint64_t a1)
{
  char v3 = [[NFNdefMessage alloc] initWithNDEFMessage:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) tagDeviceDelegate];
  [v2 didReceiveMessage:v3];
}

- (void)tnepTagDeviceReaderDetected
{
  char v3 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceReaderDetected__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __79__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceReaderDetected__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tagDeviceDelegate];
  [v1 didDetectReader];
}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceSelected_respondHandler___block_invoke;
  block[3] = &unk_1E595D140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __89__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceSelected_respondHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagDeviceDelegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceSelected_respondHandler___block_invoke_2;
  v4[3] = &unk_1E595D118;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 didSelect:v3 respondHandler:v4];
}

void __89__NFSecureTransactionServicesHandoverHybridSession_tnepTagDeviceSelected_respondHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4FBA868]);
        id v13 = objc_msgSend(v12, "initWithNDEFRecord:", v11, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)connectionHandoverTNEPServiceSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverTNEPServiceSelected___block_invoke;
  v7[3] = &unk_1E595D0C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __90__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverTNEPServiceSelected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) tnepService:*(void *)(a1 + 40)];
}

- (void)connectionHandoverProcessFailure:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverProcessFailure___block_invoke;
  v7[3] = &unk_1E595D0C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __85__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverProcessFailure___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) connectionHandoverProcessFailure:*(void *)(a1 + 40)];
}

- (void)connectionHandoverProcessCompleted
{
  uint64_t v3 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverProcessCompleted__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __86__NFSecureTransactionServicesHandoverHybridSession_connectionHandoverProcessCompleted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connectionHandoverCompleted:*(void *)(a1 + 32)];
}

- (unint64_t)numberOfActiveSecureElements
{
  return self->_numActiveSEs;
}

- (id)allApplets
{
  return [(NSDictionary *)self->_appletsById allValues];
}

- (id)appletWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_appletsById objectForKey:a3];
}

- (BOOL)setActiveApplet:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_19D636000, "setActivePaymentApplet:authorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  __int16 v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__NFSecureTransactionServicesHandoverHybridSession_setActiveApplet_authorization_error___block_invoke;
  v16[3] = &unk_1E595C6C0;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  id v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__NFSecureTransactionServicesHandoverHybridSession_setActiveApplet_authorization_error___block_invoke_59;
  v15[3] = &unk_1E595D168;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = &v22;
  v15[7] = a2;
  [v12 setActivePaymentApplet:v10 keys:0 authorization:v9 completion:v15];

  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  char v13 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __88__NFSecureTransactionServicesHandoverHybridSession_setActiveApplet_authorization_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 393, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    long long v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 393;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __88__NFSecureTransactionServicesHandoverHybridSession_setActiveApplet_authorization_error___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a2);
  objc_sync_exit(v9);

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    uint64_t v10 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 403, v8);
    }
    dispatch_get_specific(*v10);
    long long v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(*(id *)(a1 + 32));
      __int16 v20 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v18;
      __int16 v25 = 2082;
      __int16 v26 = v19;
      __int16 v27 = 2082;
      uint64_t v28 = v20;
      __int16 v29 = 1024;
      int v30 = 403;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "startCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__4;
  long long v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__NFSecureTransactionServicesHandoverHybridSession_startCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__NFSecureTransactionServicesHandoverHybridSession_startCardEmulationWithAuthorization_error___block_invoke_61;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  [v9 startCardEmulationWithAuthorization:v7 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __94__NFSecureTransactionServicesHandoverHybridSession_startCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 432, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 432;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __94__NFSecureTransactionServicesHandoverHybridSession_startCardEmulationWithAuthorization_error___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 436, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 436;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)stopCardEmulation:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "stopCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__NFSecureTransactionServicesHandoverHybridSession_stopCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__NFSecureTransactionServicesHandoverHybridSession_stopCardEmulation___block_invoke_62;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  void v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 stopCardEmulationWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __70__NFSecureTransactionServicesHandoverHybridSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 464, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 464;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __70__NFSecureTransactionServicesHandoverHybridSession_stopCardEmulation___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 468, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 468;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)stopTNEPOperation
{
  uint64_t v3 = _os_activity_create(&dword_19D636000, "stopTNEPOperation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__4;
  id v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__NFSecureTransactionServicesHandoverHybridSession_stopTNEPOperation__block_invoke;
  v5[3] = &unk_1E595CF58;
  v5[4] = &state;
  id v4 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v5];
  [v4 tnepServiceInvalidate];

  _Block_object_dispose(&state, 8);
}

void __69__NFSecureTransactionServicesHandoverHybridSession_stopTNEPOperation__block_invoke(uint64_t a1, void *a2)
{
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 104, 1);
}

- (NFApplet)defaultApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (NFTNEPTagDeviceDelegate)tagDeviceDelegate
{
  return self->_tagDeviceDelegate;
}

- (void)setTagDeviceDelegate:(id)a3
{
}

- (NFTNEPReaderDelegate)tagReaderDelegate
{
  return self->_tagReaderDelegate;
}

- (void)setTagReaderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagReaderDelegate, 0);
  objc_storeStrong((id *)&self->_tagDeviceDelegate, 0);
  objc_storeStrong((id *)&self->_defaultApplet, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appletsById, 0);
}

@end