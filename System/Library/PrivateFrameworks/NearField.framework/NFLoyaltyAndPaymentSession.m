@interface NFLoyaltyAndPaymentSession
- (BOOL)_startCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)_startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)_startHostCardEmulation:(id *)a3;
- (BOOL)enablePlasticCardMode:(BOOL)a3;
- (BOOL)enablePlasticCardMode:(BOOL)a3 error:(id *)a4;
- (BOOL)setActivePaymentApplet:(id)a3;
- (BOOL)setActivePaymentApplet:(id)a3 error:(id *)a4;
- (BOOL)setActivePaymentApplet:(id)a3 keys:(id)a4 error:(id *)a5;
- (BOOL)setHostCards:(id)a3;
- (BOOL)startCardEmulation:(unsigned __int8)a3 authorization:(id)a4;
- (BOOL)startCardEmulation:(unsigned __int8)a3 authorization:(id)a4 error:(id *)a5;
- (BOOL)startDeferredCardEmulation:(unsigned __int8)a3 authorization:(id)a4;
- (BOOL)startDeferredCardEmulation:(unsigned __int8)a3 authorization:(id)a4 error:(id *)a5;
- (BOOL)startExpressMode:(id *)a3;
- (BOOL)stopCardEmulation;
- (BOOL)stopCardEmulation:(id *)a3;
- (NFApplet)activeApplet;
- (NFApplet)defaultApplet;
- (NFLoyaltyAndPaymentSessionDelegate)delegate;
- (NSSet)activeKeys;
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
- (void)didPerformValueAddedServiceTransactions:(id)a3;
- (void)didReceiveActivityTimeout:(id)a3;
- (void)didReceivePendingServerRequest;
- (void)didSelectApplet:(id)a3;
- (void)didSelectValueAddedService:(BOOL)a3;
- (void)didStartSession:(id)a3;
- (void)didStartTransaction:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NFLoyaltyAndPaymentSession

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  if (obj->_pendingServerRequest) {
    [(NFLoyaltyAndPaymentSession *)obj didReceivePendingServerRequest];
  }
  objc_sync_exit(obj);
}

- (NFLoyaltyAndPaymentSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFLoyaltyAndPaymentSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 60, *(void *)(a1 + 40));
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
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)v25 = 2082;
      *(void *)&v25[2] = v13;
      *(_WORD *)&v25[10] = 2082;
      *(void *)&v25[12] = v14;
      *(_WORD *)&v25[20] = 1024;
      *(_DWORD *)&v25[22] = 60;
      *(_WORD *)&v25[26] = 2114;
      *(void *)&v25[28] = v15;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v23.receiver = *(id *)(a1 + 32);
    v23.super_class = (Class)NFLoyaltyAndPaymentSession;
    objc_msgSendSuper2(&v23, sel_didStartSession_);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)v25 = buf;
    *(void *)&v25[8] = 0x3032000000;
    *(void *)&v25[16] = __Block_byref_object_copy__20;
    *(void *)&v25[24] = __Block_byref_object_dispose__20;
    *(void *)&v25[32] = 0;
    v16 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_13;
    v22[3] = &unk_1E595CBD0;
    uint64_t v17 = *(void *)(a1 + 48);
    v22[5] = buf;
    v22[6] = v17;
    v22[4] = v16;
    v18 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_16;
    v21[3] = &unk_1E595CBF8;
    v21[4] = *(void *)(a1 + 32);
    v21[5] = buf;
    [v18 getAppletsWithCompletion:v21];

    uint64_t v19 = *(void *)(*(void *)v25 + 40);
    v20.receiver = *(id *)(a1 + 32);
    v20.super_class = (Class)NFLoyaltyAndPaymentSession;
    objc_msgSendSuper2(&v20, sel_didStartSessionWithoutQueue_, v19);
    _Block_object_dispose(buf, 8);
  }
}

void __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_13(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 69, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = v14;
    __int16 v25 = 1024;
    int v26 = 69;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  objc_super v11 = objc_opt_new();
  int v12 = objc_opt_new();
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_2;
  __int16 v25 = &unk_1E595D0A0;
  id v26 = v12;
  id v27 = v11;
  id v13 = v11;
  id v14 = v12;
  [v7 enumerateObjectsUsingBlock:&v22];
  uint64_t v15 = objc_msgSend(v13, "allKeys", v22, v23, v24, v25);
  *(void *)(*(void *)(a1 + 32) + 104) = [v15 count];

  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v7 forKeys:v14];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 96);
  *(void *)(v17 + 96) = v16;

  uint64_t v19 = *(void *)(a1 + 32);
  int v20 = *(void **)(v19 + 120);
  *(void *)(v19 + 120) = v8;
  id v21 = v8;

  objc_sync_exit(v10);
}

void __46__NFLoyaltyAndPaymentSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
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
      [v10 setObject:&unk_1EEF35D70 forKeyedSubscript:v11];
    }
  }
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFLoyaltyAndPaymentSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFLoyaltyAndPaymentSession;
  [(NFSession *)&v5 endSessionWithCompletion:v4];
}

- (void)didEndUnexpectedly
{
  v6.receiver = self;
  v6.super_class = (Class)NFLoyaltyAndPaymentSession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NFLoyaltyAndPaymentSession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

id __48__NFLoyaltyAndPaymentSession_didEndUnexpectedly__block_invoke(uint64_t a1)
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 111);
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
      uint64_t v23 = v12;
      __int16 v24 = 2082;
      __int16 v25 = v13;
      __int16 v26 = 1024;
      int v27 = 111;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
  id v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 32) delegate];
    [v16 loyaltyAndPaymentSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFLoyaltyAndPaymentSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFLoyaltyAndPaymentSession;
  objc_super v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NFLoyaltyAndPaymentSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __45__NFLoyaltyAndPaymentSession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 48))
    {
      if (v2[112])
      {
        uint64_t v17 = [v2 delegate];
        char v18 = objc_opt_respondsToSelector();

        v2 = *(unsigned char **)(a1 + 32);
        if (v18)
        {
          v2[112] = 0;
          objc_super v19 = [*(id *)(a1 + 32) delegate];
          [v19 loyaltyAndPaymentSessionDidExitField:*(void *)(a1 + 32)];

          v2 = *(unsigned char **)(a1 + 32);
        }
      }
    }
    id v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v21 = [*(id *)(a1 + 32) delegate];
      [v21 loyaltyAndPaymentSession:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 126);
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
      __int16 v25 = v15;
      __int16 v26 = 2082;
      int v27 = v16;
      __int16 v28 = 1024;
      int v29 = 126;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NFLoyaltyAndPaymentSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __57__NFLoyaltyAndPaymentSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 loyaltyAndPaymentSession:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
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
        [v8 loyaltyAndPaymentSession:*(void *)(a1 + 32) didDetectTechnology:v22];

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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 144);
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
      int v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v24 = v18;
      __int16 v25 = 2082;
      __int16 v26 = v19;
      __int16 v27 = 2082;
      __int16 v28 = v20;
      __int16 v29 = 1024;
      int v30 = 144;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NFLoyaltyAndPaymentSession_didSelectApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__NFLoyaltyAndPaymentSession_didSelectApplet___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0) {
      return;
    }
    char v4 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:*(void *)(a1 + 40)];
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
    [v8 loyaltyAndPaymentSession:*(void *)(a1 + 32) didSelectApplet:v4];
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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 169);
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
      int v30 = 169;
      _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didStartTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NFLoyaltyAndPaymentSession_didStartTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __50__NFLoyaltyAndPaymentSession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 96);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    char v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 loyaltyAndPaymentSession:*(void *)(a1 + 32) didStartTransaction:*(void *)(a1 + 40)];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 186);
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
      int v28 = 186;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NFLoyaltyAndPaymentSession_didEndTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __48__NFLoyaltyAndPaymentSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 96);
    char v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    char v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 loyaltyAndPaymentSession:*(void *)(a1 + 32) didEndTransaction:*(void *)(a1 + 40)];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 200);
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
      int v28 = 200;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NFLoyaltyAndPaymentSession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __60__NFLoyaltyAndPaymentSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
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
      char v4 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:*(void *)(a1 + 40)];
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 loyaltyAndPaymentSession:*(void *)(a1 + 32) didExpireTransactionForApplet:v4];
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 214);
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
      int v27 = 214;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didFelicaStateChange:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFLoyaltyAndPaymentSession_didFelicaStateChange___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__NFLoyaltyAndPaymentSession_didFelicaStateChange___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 231);
    }
    dispatch_get_specific(*v6);
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
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
      int v19 = v14;
      __int16 v20 = 2082;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 1024;
      int v25 = 231;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_13;
  }
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 loyaltyAndPaymentSession:*(void *)(a1 + 32) didFelicaStateChange:*(void *)(a1 + 40)];
LABEL_13:
  }
  objc_sync_exit(v2);
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFLoyaltyAndPaymentSession;
  BOOL v8 = [(NFSession *)&v14 callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NFLoyaltyAndPaymentSession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E595CDB0;
  id v11 = v7;
  SEL v12 = a2;
  unsigned int v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __67__NFLoyaltyAndPaymentSession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
  {
    id v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 246);
    }
    dispatch_get_specific(*v9);
    BOOL v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v17;
      __int16 v23 = 2082;
      __int16 v24 = v18;
      __int16 v25 = 2082;
      uint64_t v26 = v19;
      __int16 v27 = 1024;
      int v28 = 246;
      _os_log_impl(&dword_19D636000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_15;
  }
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 loyaltyAndPaymentSession:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56)];
  }
  char v6 = [*(id *)(a1 + 32) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v8 = [*(id *)(a1 + 32) delegate];
    [v8 loyaltyAndPaymentSession:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56) withObject:*(void *)(a1 + 40)];
LABEL_15:
  }
  objc_sync_exit(v2);
}

- (void)didFailDeferredAuthorization
{
  v6.receiver = self;
  v6.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NFLoyaltyAndPaymentSession_didFailDeferredAuthorization__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __58__NFLoyaltyAndPaymentSession_didFailDeferredAuthorization__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
  {
    objc_super v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 267);
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
      uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v19 = v14;
      __int16 v20 = 2082;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 1024;
      int v25 = 267;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_13;
  }
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 loyaltyAndPaymentSession:*(void *)(a1 + 32) didFailDeferredAuthorization:1];
LABEL_13:
  }
  objc_sync_exit(v2);
}

- (void)didSelectValueAddedService:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFLoyaltyAndPaymentSession;
  objc_super v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NFLoyaltyAndPaymentSession_didSelectValueAddedService___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __57__NFLoyaltyAndPaymentSession_didSelectValueAddedService___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v17 = [*(id *)(a1 + 32) delegate];
      [v17 loyaltyAndPaymentSession:*(void *)(a1 + 32) didSelectValueAddedService:*(unsigned __int8 *)(a1 + 48)];
    }
  }
  else
  {
    char v4 = (const void **)MEMORY[0x1E4FBA898];
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
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 281);
    }
    dispatch_get_specific(*v4);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      int v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 281;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didPerformValueAddedServiceTransactions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NFLoyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __70__NFLoyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v17 = [*(id *)(a1 + 32) delegate];
      [v17 loyaltyAndPaymentSession:*(void *)(a1 + 32) didPerformValueAddedServiceTransactions:*(void *)(a1 + 40)];
    }
  }
  else
  {
    char v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 293);
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
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      int v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 293;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didReceivePendingServerRequest
{
  v6.receiver = self;
  v6.super_class = (Class)NFLoyaltyAndPaymentSession;
  char v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__NFLoyaltyAndPaymentSession_didReceivePendingServerRequest__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __60__NFLoyaltyAndPaymentSession_didReceivePendingServerRequest__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    id v2 = [*(id *)(a1 + 32) delegate];

    uint64_t v3 = *(void *)(a1 + 32);
    if (v2)
    {
      *(unsigned char *)(v3 + 72) = 0;
      char v4 = [*(id *)(a1 + 32) delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        objc_super v6 = [*(id *)(a1 + 32) delegate];
        [v6 loyaltyAndPaymentSessionHasPendingServerRequest:*(void *)(a1 + 32)];
      }
    }
    else
    {
      *(unsigned char *)(v3 + 72) = 1;
    }
    objc_sync_exit(obj);
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 306);
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
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 1024;
      int v28 = 306;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didReceiveActivityTimeout:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLoyaltyAndPaymentSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NFLoyaltyAndPaymentSession_didReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __56__NFLoyaltyAndPaymentSession_didReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    id v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 loyaltyAndPaymentSessionDidReceiveActivityTimeout:*(void *)(a1 + 32)];
    }
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 loyaltyAndPaymentSessionDidReceiveActivityTimeout:*(void *)(a1 + 32) result:*(void *)(a1 + 40)];
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
      v10(3, "%c[%{public}s %{public}s]:%i Session not active", v14, ClassName, Name, 327);
    }
    dispatch_get_specific(*v8);
    uint64_t v15 = NFSharedLogGetLogger();
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
      int v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v23 = v17;
      __int16 v24 = 2082;
      __int16 v25 = v18;
      __int16 v26 = 2082;
      __int16 v27 = v19;
      __int16 v28 = 1024;
      int v29 = 327;
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

- (BOOL)setActivePaymentApplet:(id)a3
{
  return [(NFLoyaltyAndPaymentSession *)self setActivePaymentApplet:a3 error:0];
}

- (BOOL)setActivePaymentApplet:(id)a3 error:(id *)a4
{
  return [(NFLoyaltyAndPaymentSession *)self setActivePaymentApplet:a3 keys:0 error:a4];
}

- (BOOL)setActivePaymentApplet:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = _os_activity_create(&dword_19D636000, "setActivePayentApplet:keys:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__20;
  __int16 v25 = __Block_byref_object_dispose__20;
  id v26 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__NFLoyaltyAndPaymentSession_setActivePaymentApplet_keys_error___block_invoke;
  v21[3] = &unk_1E595C6C0;
  v21[4] = self;
  v21[5] = &state;
  void v21[6] = a2;
  uint64_t v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__NFLoyaltyAndPaymentSession_setActivePaymentApplet_keys_error___block_invoke_72;
  v16[3] = &unk_1E595EA50;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  p_os_activity_scope_state_s state = &state;
  int v19 = &v27;
  SEL v20 = a2;
  [v12 setActivePaymentApplet:v10 keys:v13 authorization:0 completion:v16];

  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __64__NFLoyaltyAndPaymentSession_setActivePaymentApplet_keys_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 383, v4);
  }
  dispatch_get_specific(*v5);
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
    char v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    int v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 383;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __64__NFLoyaltyAndPaymentSession_setActivePaymentApplet_keys_error___block_invoke_72(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a2);
  if (*(void *)(a1 + 40)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a3);
  }
  objc_sync_exit(v11);

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    uint64_t v12 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 396, v10);
    }
    dispatch_get_specific(*v12);
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      int v21 = object_getClassName(*(id *)(a1 + 32));
      __int16 v22 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v26 = v20;
      __int16 v27 = 2082;
      uint64_t v28 = v21;
      __int16 v29 = 2082;
      char v30 = v22;
      __int16 v31 = 1024;
      int v32 = 396;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)startCardEmulation:(unsigned __int8)a3 authorization:(id)a4
{
  return [(NFLoyaltyAndPaymentSession *)self startCardEmulation:a3 authorization:a4 error:0];
}

- (BOOL)startCardEmulation:(unsigned __int8)a3 authorization:(id)a4 error:(id *)a5
{
  if (a3 == 2) {
    return -[NFLoyaltyAndPaymentSession _startHostCardEmulation:](self, "_startHostCardEmulation:", a5, a4);
  }
  else {
    return [(NFLoyaltyAndPaymentSession *)self _startCardEmulationWithAuthorization:a4 error:a5];
  }
}

- (BOOL)_startCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "_startCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__NFLoyaltyAndPaymentSession__startCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__NFLoyaltyAndPaymentSession__startCardEmulationWithAuthorization_error___block_invoke_74;
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

void __73__NFLoyaltyAndPaymentSession__startCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 430, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    char v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 430;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __73__NFLoyaltyAndPaymentSession__startCardEmulationWithAuthorization_error___block_invoke_74(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 434, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      char v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 434;
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

- (BOOL)_startHostCardEmulation:(id *)a3
{
  char v6 = _os_activity_create(&dword_19D636000, "_startHostCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  char v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NFLoyaltyAndPaymentSession__startHostCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__NFLoyaltyAndPaymentSession__startHostCardEmulation___block_invoke_75;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  void v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 startHostCardEmulationWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __54__NFLoyaltyAndPaymentSession__startHostCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 456, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    char v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 456;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __54__NFLoyaltyAndPaymentSession__startHostCardEmulation___block_invoke_75(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 460, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      char v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 460;
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

- (BOOL)startDeferredCardEmulation:(unsigned __int8)a3 authorization:(id)a4
{
  return [(NFLoyaltyAndPaymentSession *)self startDeferredCardEmulation:a3 authorization:a4 error:0];
}

- (BOOL)startDeferredCardEmulation:(unsigned __int8)a3 authorization:(id)a4 error:(id *)a5
{
  if (a3 == 2) {
    return -[NFLoyaltyAndPaymentSession _startHostCardEmulation:](self, "_startHostCardEmulation:", a5, a4);
  }
  else {
    return [(NFLoyaltyAndPaymentSession *)self _startDeferredCardEmulationWithAuthorization:a4 error:a5];
  }
}

- (BOOL)_startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "_startDeferredCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  id v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__NFLoyaltyAndPaymentSession__startDeferredCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__NFLoyaltyAndPaymentSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_76;
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

void __81__NFLoyaltyAndPaymentSession__startDeferredCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 494, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    char v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 494;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __81__NFLoyaltyAndPaymentSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_76(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 498, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      char v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 498;
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
  return [(NFLoyaltyAndPaymentSession *)self stopCardEmulation:0];
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
  char v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__NFLoyaltyAndPaymentSession_stopCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__NFLoyaltyAndPaymentSession_stopCardEmulation___block_invoke_77;
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

void __48__NFLoyaltyAndPaymentSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 524, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    char v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 524;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __48__NFLoyaltyAndPaymentSession_stopCardEmulation___block_invoke_77(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 528, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      char v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 528;
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
  return [(NFLoyaltyAndPaymentSession *)self felicaAppletState:a3 error:0];
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
  __int16 v22 = __Block_byref_object_copy__20;
  uint64_t v23 = __Block_byref_object_dispose__20;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__NFLoyaltyAndPaymentSession_felicaAppletState_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__NFLoyaltyAndPaymentSession_felicaAppletState_error___block_invoke_78;
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

void __54__NFLoyaltyAndPaymentSession_felicaAppletState_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 554, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 554;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __54__NFLoyaltyAndPaymentSession_felicaAppletState_error___block_invoke_78(uint64_t a1, void *a2, void *a3)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 558, v7);
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
      int v28 = 558;
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
  int v22 = __Block_byref_object_copy__20;
  __int16 v23 = __Block_byref_object_dispose__20;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__NFLoyaltyAndPaymentSession_transitAppletState_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__NFLoyaltyAndPaymentSession_transitAppletState_error___block_invoke_80;
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

void __55__NFLoyaltyAndPaymentSession_transitAppletState_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 580, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 580;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __55__NFLoyaltyAndPaymentSession_transitAppletState_error___block_invoke_80(uint64_t a1, void *a2, void *a3)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 584, v7);
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
      int v28 = 584;
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

- (BOOL)setHostCards:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "setHostCards:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__NFLoyaltyAndPaymentSession_setHostCards___block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v7 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v9];
  [v7 setHostCards:v5];

  return 1;
}

void __43__NFLoyaltyAndPaymentSession_setHostCards___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 602, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 602;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

- (BOOL)enablePlasticCardMode:(BOOL)a3
{
  return [(NFLoyaltyAndPaymentSession *)self enablePlasticCardMode:a3 error:0];
}

- (BOOL)enablePlasticCardMode:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "enablePlasticCardMode:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  int v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__NFLoyaltyAndPaymentSession_enablePlasticCardMode_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__NFLoyaltyAndPaymentSession_enablePlasticCardMode_error___block_invoke_81;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  [v9 enablePlasticCardMode:v5 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __58__NFLoyaltyAndPaymentSession_enablePlasticCardMode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 621, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 621;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __58__NFLoyaltyAndPaymentSession_enablePlasticCardMode_error___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 625, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
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
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 625;
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

- (BOOL)startExpressMode:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "startExpressMode:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  uint64_t v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NFLoyaltyAndPaymentSession_startExpressMode___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__NFLoyaltyAndPaymentSession_startExpressMode___block_invoke_82;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  void v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 startExpressModeWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__NFLoyaltyAndPaymentSession_startExpressMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 647, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 647;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __47__NFLoyaltyAndPaymentSession_startExpressMode___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 651, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
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
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 651;
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

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 120, 1);
}

- (NSSet)activeKeys
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (NFApplet)defaultApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultApplet, 0);
  objc_storeStrong((id *)&self->_activeKeys, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_storeStrong((id *)&self->_appletsById, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end