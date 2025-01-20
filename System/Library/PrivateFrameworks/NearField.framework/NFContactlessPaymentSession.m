@interface NFContactlessPaymentSession
- (BOOL)setActivePaymentApplet:(id)a3 authorization:(id)a4;
- (BOOL)setActivePaymentApplet:(id)a3 authorization:(id)a4 error:(id *)a5;
- (BOOL)setActivePaymentApplet:(id)a3 makeDefault:(BOOL)a4 authorization:(id)a5;
- (BOOL)startCardEmulationWithAuthorization:(id)a3;
- (BOOL)startCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)startDeferredCardEmulationWithAuthorization:(id)a3;
- (BOOL)startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)stopCardEmulation;
- (BOOL)stopCardEmulation:(id *)a3;
- (NFApplet)activeApplet;
- (NFApplet)defaultApplet;
- (NFContactlessPaymentSessionDelegate)delegate;
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (id)felicaAppletState:(id)a3;
- (id)felicaAppletState:(id)a3 error:(id *)a4;
- (id)transitAppletState:(id)a3 error:(id *)a4;
- (unint64_t)numberOfActiveSecureElements;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndTransaction:(id)a3;
- (void)didEndUnexpectedly;
- (void)didExpireTransactionForApplet:(id)a3;
- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4;
- (void)didFailDeferredAuthorization;
- (void)didFelicaStateChange:(id)a3;
- (void)didReceiveActivityTimeout:(id)a3;
- (void)didReceivePendingServerRequest;
- (void)didSelectApplet:(id)a3;
- (void)didStartSession:(id)a3;
- (void)didStartTransaction:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NFContactlessPaymentSession

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFContactlessPaymentSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFContactlessPaymentSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NFContactlessPaymentSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __47__NFContactlessPaymentSession_didStartSession___block_invoke(uint64_t a1)
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 53, *(void *)(a1 + 40));
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
      v25 = v13;
      __int16 v26 = 2082;
      v27 = v14;
      __int16 v28 = 1024;
      int v29 = 53;
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
      v21.super_class = (Class)NFContactlessPaymentSession;
      objc_msgSendSuper2(&v21, sel_didStartSession_);
      return;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__NFContactlessPaymentSession_didStartSession___block_invoke_13;
    v20[3] = &unk_1E595C648;
    uint64_t v17 = *(void *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v17;
    v19.receiver = v16;
    v19.super_class = (Class)NFContactlessPaymentSession;
    SEL v10 = objc_msgSendSuper2(&v19, sel_remoteObjectProxyWithErrorHandler_, v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__NFContactlessPaymentSession_didStartSession___block_invoke_18;
    v18[3] = &unk_1E595CE50;
    v18[4] = *(void *)(a1 + 32);
    [v10 getAppletsWithCompletion:v18];
  }
}

void __47__NFContactlessPaymentSession_didStartSession___block_invoke_13(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 60, v3);
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
    int v25 = 60;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFContactlessPaymentSession;
  objc_msgSendSuper2(&v17, sel_didStartSession_, v3);
}

void __47__NFContactlessPaymentSession_didStartSession___block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4)
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
  v23[2] = __47__NFContactlessPaymentSession_didStartSession___block_invoke_2;
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
  v18 = *(void **)(v17 + 72);
  *(void *)(v17 + 72) = v16;

  uint64_t v19 = *(void *)(a1 + 32);
  __int16 v20 = *(void **)(v19 + 104);
  *(void *)(v19 + 104) = v7;
  id v21 = v7;

  objc_sync_exit(v8);
  v22.receiver = *(id *)(a1 + 32);
  v22.super_class = (Class)NFContactlessPaymentSession;
  objc_msgSendSuper2(&v22, sel_didStartSession_, v9);
}

void __47__NFContactlessPaymentSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
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
      [v10 setObject:&unk_1EEF35D58 forKeyedSubscript:v11];
    }
  }
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFContactlessPaymentSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFContactlessPaymentSession;
  [(NFSession *)&v5 endSessionWithCompletion:v4];
}

- (void)didEndUnexpectedly
{
  v6.receiver = self;
  v6.super_class = (Class)NFContactlessPaymentSession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__NFContactlessPaymentSession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

id __49__NFContactlessPaymentSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 98);
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
      id v12 = object_getClassName(*(id *)(a1 + 32));
      id v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v21 = v11;
      __int16 v22 = 2082;
      int v23 = v12;
      __int16 v24 = 2082;
      id v25 = v13;
      __int16 v26 = 1024;
      int v27 = 98;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
  id v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 32) delegate];
    [v16 contactlessPaymentSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFContactlessPaymentSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFContactlessPaymentSession;
  objc_super v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NFContactlessPaymentSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __46__NFContactlessPaymentSession_didDetectField___block_invoke(uint64_t a1)
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
          objc_super v19 = [*(id *)(a1 + 32) delegate];
          [v19 contactlessPaymentSessionDidExitField:*(void *)(a1 + 32)];

          v2 = *(unsigned char **)(a1 + 32);
        }
      }
    }
    id v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v21 = [*(id *)(a1 + 32) delegate];
      [v21 contactlessPaymentSession:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 114);
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
      char v15 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v23 = v14;
      __int16 v24 = 2082;
      id v25 = v15;
      __int16 v26 = 2082;
      int v27 = v16;
      __int16 v28 = 1024;
      int v29 = 114;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NFContactlessPaymentSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __58__NFContactlessPaymentSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSession:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
    }
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [[NFTechnologyEvent alloc] initWithFieldNotification:*(void *)(a1 + 40)];
      if (v7)
      {
        __int16 v22 = v7;
        BOOL v8 = [*(id *)(a1 + 32) delegate];
        [v8 contactlessPaymentSession:*(void *)(a1 + 32) didDetectTechnology:v22];

        id v7 = v22;
      }
    }
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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 132);
    }
    dispatch_get_specific(*v9);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      objc_super v19 = object_getClassName(*(id *)(a1 + 32));
      __int16 v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v24 = v18;
      __int16 v25 = 2082;
      __int16 v26 = v19;
      __int16 v27 = 2082;
      __int16 v28 = v20;
      __int16 v29 = 1024;
      int v30 = 132;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NFContactlessPaymentSession_didSelectApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __47__NFContactlessPaymentSession_didSelectApplet___block_invoke(uint64_t a1)
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
      char v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", *(void *)(a1 + 40));
      __int16 v22 = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      char v4 = [(NFApplet *)v5 initWithDictionary:v7];
    }
    BOOL v8 = [*(id *)(a1 + 32) delegate];
    [v8 contactlessPaymentSession:*(void *)(a1 + 32) didSelectApplet:v4];
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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 156);
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
      int v18 = object_getClassName(*(id *)(a1 + 32));
      objc_super v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 2082;
      __int16 v28 = v19;
      __int16 v29 = 1024;
      int v30 = 156;
      _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didStartTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFContactlessPaymentSession_didStartTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__NFContactlessPaymentSession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 72);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    char v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 contactlessPaymentSession:*(void *)(a1 + 32) didStartTransaction:*(void *)(a1 + 40)];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 173);
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
      int v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 173;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NFContactlessPaymentSession_didEndTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __49__NFContactlessPaymentSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 72);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    char v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 contactlessPaymentSession:*(void *)(a1 + 32) didEndTransaction:*(void *)(a1 + 40)];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 187);
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
      int v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 187;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NFContactlessPaymentSession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __61__NFContactlessPaymentSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
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
      [v5 contactlessPaymentSession:*(void *)(a1 + 32) didExpireTransactionForApplet:v4];
    }
    objc_sync_exit(obj);
  }
  else
  {
    char v6 = (const void **)MEMORY[0x1E4FBA898];
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 201);
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
      int v27 = 201;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didFelicaStateChange:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NFContactlessPaymentSession_didFelicaStateChange___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __52__NFContactlessPaymentSession_didFelicaStateChange___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSession:*(void *)(a1 + 32) didFelicaStateChange:*(void *)(a1 + 40)];
    }
    objc_sync_exit(obj);
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
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 217);
    }
    dispatch_get_specific(*v5);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v20 = v14;
      __int16 v21 = 2082;
      __int16 v22 = v15;
      __int16 v23 = 2082;
      __int16 v24 = v16;
      __int16 v25 = 1024;
      int v26 = 217;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFContactlessPaymentSession;
  BOOL v8 = [(NFSession *)&v14 callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__NFContactlessPaymentSession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E595CDB0;
  id v11 = v7;
  SEL v12 = a2;
  unsigned int v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __68__NFContactlessPaymentSession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSession:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56)];
    }
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 contactlessPaymentSession:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56) withObject:*(void *)(a1 + 40)];
    }
    objc_sync_exit(obj);
  }
  else
  {
    BOOL v8 = (const void **)MEMORY[0x1E4FBA898];
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
      v10(3, "%c[%{public}s %{public}s]:%i Session not active", v14, ClassName, Name, 232);
    }
    dispatch_get_specific(*v8);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(*(id *)(a1 + 32));
      objc_super v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v23 = v17;
      __int16 v24 = 2082;
      __int16 v25 = v18;
      __int16 v26 = 2082;
      uint64_t v27 = v19;
      __int16 v28 = 1024;
      int v29 = 232;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didFailDeferredAuthorization
{
  v6.receiver = self;
  v6.super_class = (Class)NFContactlessPaymentSession;
  char v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NFContactlessPaymentSession_didFailDeferredAuthorization__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __59__NFContactlessPaymentSession_didFailDeferredAuthorization__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSession:*(void *)(a1 + 32) didFailDeferredAuthorization:1];
    }
    objc_sync_exit(obj);
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 253);
    }
    dispatch_get_specific(*v5);
    SEL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v20 = v14;
      __int16 v21 = 2082;
      __int16 v22 = v15;
      __int16 v23 = 2082;
      __int16 v24 = v16;
      __int16 v25 = 1024;
      int v26 = 253;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didReceivePendingServerRequest
{
  v6.receiver = self;
  v6.super_class = (Class)NFContactlessPaymentSession;
  char v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NFContactlessPaymentSession_didReceivePendingServerRequest__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __61__NFContactlessPaymentSession_didReceivePendingServerRequest__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSessionHasPendingServerRequest:*(void *)(a1 + 32)];
    }
    objc_sync_exit(obj);
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 268);
    }
    dispatch_get_specific(*v5);
    SEL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v20 = v14;
      __int16 v21 = 2082;
      __int16 v22 = v15;
      __int16 v23 = 2082;
      __int16 v24 = v16;
      __int16 v25 = 1024;
      int v26 = 268;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didReceiveActivityTimeout:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessPaymentSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NFContactlessPaymentSession_didReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __57__NFContactlessPaymentSession_didReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessPaymentSessionDidReceiveActivityTimeout:*(void *)(a1 + 32)];
    }
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 contactlessPaymentSessionDidReceiveActivityTimeout:*(void *)(a1 + 32) result:*(void *)(a1 + 40)];
    }
    objc_sync_exit(obj);
  }
  else
  {
    BOOL v8 = (const void **)MEMORY[0x1E4FBA898];
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
      v10(3, "%c[%{public}s %{public}s]:%i Session not active", v14, ClassName, Name, 283);
    }
    dispatch_get_specific(*v8);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(*(id *)(a1 + 32));
      objc_super v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v23 = v17;
      __int16 v24 = 2082;
      __int16 v25 = v18;
      __int16 v26 = 2082;
      uint64_t v27 = v19;
      __int16 v28 = 1024;
      int v29 = 283;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
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

- (BOOL)setActivePaymentApplet:(id)a3 makeDefault:(BOOL)a4 authorization:(id)a5
{
  return [(NFContactlessPaymentSession *)self setActivePaymentApplet:a3 authorization:a5];
}

- (BOOL)setActivePaymentApplet:(id)a3 authorization:(id)a4
{
  return [(NFContactlessPaymentSession *)self setActivePaymentApplet:a3 authorization:a4 error:0];
}

- (BOOL)setActivePaymentApplet:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = _os_activity_create(&dword_19D636000, "setActivePaymentApplet:authorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = __Block_byref_object_copy__19;
  int v20 = __Block_byref_object_dispose__19;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__NFContactlessPaymentSession_setActivePaymentApplet_authorization_error___block_invoke;
  v16[3] = &unk_1E595C6C0;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  SEL v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__NFContactlessPaymentSession_setActivePaymentApplet_authorization_error___block_invoke_68;
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

void __74__NFContactlessPaymentSession_setActivePaymentApplet_authorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 338, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    int v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 338;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __74__NFContactlessPaymentSession_setActivePaymentApplet_authorization_error___block_invoke_68(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
      SEL v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 348, v8);
    }
    dispatch_get_specific(*v10);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = object_getClass(*(id *)(a1 + 32));
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
      int v30 = 348;
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

- (BOOL)startCardEmulationWithAuthorization:(id)a3
{
  return [(NFContactlessPaymentSession *)self startCardEmulationWithAuthorization:a3 error:0];
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
  int v16 = __Block_byref_object_copy__19;
  int v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__NFContactlessPaymentSession_startCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__NFContactlessPaymentSession_startCardEmulationWithAuthorization_error___block_invoke_70;
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

void __73__NFContactlessPaymentSession_startCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 375, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 375;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __73__NFContactlessPaymentSession_startCardEmulationWithAuthorization_error___block_invoke_70(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 379, v4);
    }
    dispatch_get_specific(*v5);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SEL v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 379;
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

- (BOOL)startDeferredCardEmulationWithAuthorization:(id)a3
{
  return [(NFContactlessPaymentSession *)self startDeferredCardEmulationWithAuthorization:a3 error:0];
}

- (BOOL)startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "startDeferredCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  int v16 = __Block_byref_object_copy__19;
  int v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__NFContactlessPaymentSession_startDeferredCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__NFContactlessPaymentSession_startDeferredCardEmulationWithAuthorization_error___block_invoke_71;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  [v9 startDeferredCardEmulationWithAuthorization:v7 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __81__NFContactlessPaymentSession_startDeferredCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 406, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 406;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __81__NFContactlessPaymentSession_startDeferredCardEmulationWithAuthorization_error___block_invoke_71(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 410, v4);
    }
    dispatch_get_specific(*v5);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SEL v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 410;
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

- (BOOL)stopCardEmulation
{
  return [(NFContactlessPaymentSession *)self stopCardEmulation:0];
}

- (BOOL)stopCardEmulation:(id *)a3
{
  char v6 = _os_activity_create(&dword_19D636000, "stopCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  uint64_t v14 = __Block_byref_object_copy__19;
  uint64_t v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NFContactlessPaymentSession_stopCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__NFContactlessPaymentSession_stopCardEmulation___block_invoke_72;
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

void __49__NFContactlessPaymentSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 436, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 436;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __49__NFContactlessPaymentSession_stopCardEmulation___block_invoke_72(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 440, v4);
    }
    dispatch_get_specific(*v5);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SEL v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 440;
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

- (id)felicaAppletState:(id)a3
{
  return [(NFContactlessPaymentSession *)self felicaAppletState:a3 error:0];
}

- (id)felicaAppletState:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "felicaAppletState:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__19;
  int v23 = __Block_byref_object_dispose__19;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  id v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__NFContactlessPaymentSession_felicaAppletState_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__NFContactlessPaymentSession_felicaAppletState_error___block_invoke_73;
  v12[3] = &unk_1E595CA40;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  v12[7] = a2;
  [v9 getFelicaAppletState:v7 completion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __55__NFContactlessPaymentSession_felicaAppletState_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 467, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 467;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __55__NFContactlessPaymentSession_felicaAppletState_error___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    char v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 471, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 471;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (id)transitAppletState:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "transitAppletState:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__19;
  __int16 v23 = __Block_byref_object_dispose__19;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  id v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__NFContactlessPaymentSession_transitAppletState_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__NFContactlessPaymentSession_transitAppletState_error___block_invoke_75;
  v12[3] = &unk_1E595CA40;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  v12[7] = a2;
  [v9 getTransitAppletState:v7 completion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __56__NFContactlessPaymentSession_transitAppletState_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 493, v4);
  }
  dispatch_get_specific(*v5);
  objc_super v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    SEL v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 493;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __56__NFContactlessPaymentSession_transitAppletState_error___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    char v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 497, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 497;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 104, 1);
}

- (NFApplet)defaultApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultApplet, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appletsById, 0);
}

@end