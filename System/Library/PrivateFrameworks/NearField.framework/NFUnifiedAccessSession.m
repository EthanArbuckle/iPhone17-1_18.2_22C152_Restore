@interface NFUnifiedAccessSession
+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_startCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)_startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4;
- (BOOL)cardEmulationStarted;
- (BOOL)isACWG;
- (BOOL)isUnifiedAccessOrAcwg:(id)a3 secondaryIdentifier:(id)a4;
- (BOOL)setActivePaymentApplet:(id)a3 keys:(id)a4 error:(id *)a5;
- (BOOL)setActivePaymentApplets:(id)a3 error:(id *)a4;
- (BOOL)startExpressMode:(id *)a3;
- (BOOL)stopCardEmulation:(id *)a3;
- (BOOL)validateAidsAndKeys:(id)a3;
- (NFApplet)activeApplet;
- (NFUnifiedAccessSessionDelegate)delegate;
- (NSSet)activeKeys;
- (SESACWGSession)sesdSession;
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (id)appletsWithIdentifiers:(id)a3 secondaryIdentifier:(id)a4;
- (unint64_t)numberOfActiveSecureElements;
- (void)_createSesdSession;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndTransaction:(id)a3;
- (void)didEndUnexpectedly;
- (void)didExpireTransactionForApplet:(id)a3;
- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4;
- (void)didSelectApplet:(id)a3;
- (void)didStartSession:(id)a3;
- (void)didStartTransaction:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)releaseSesdSession;
- (void)sesSession:(id)a3 event:(id)a4;
- (void)setCardEmulationStarted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSesdSession:(id)a3;
@end

@implementation NFUnifiedAccessSession

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFUnifiedAccessSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFUnifiedAccessSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke(uint64_t a1)
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 65, *(void *)(a1 + 40));
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
      *(_DWORD *)&v25[22] = 65;
      *(_WORD *)&v25[26] = 2114;
      *(void *)&v25[28] = v15;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v23.receiver = *(id *)(a1 + 32);
    v23.super_class = (Class)NFUnifiedAccessSession;
    objc_msgSendSuper2(&v23, sel_didStartSession_);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)v25 = buf;
    *(void *)&v25[8] = 0x3032000000;
    *(void *)&v25[16] = __Block_byref_object_copy__22;
    *(void *)&v25[24] = __Block_byref_object_dispose__22;
    *(void *)&v25[32] = 0;
    v16 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke_13;
    v22[3] = &unk_1E595CBD0;
    uint64_t v17 = *(void *)(a1 + 48);
    v22[5] = buf;
    v22[6] = v17;
    v22[4] = v16;
    v18 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke_16;
    v21[3] = &unk_1E595CBF8;
    v21[4] = *(void *)(a1 + 32);
    v21[5] = buf;
    [v18 getAppletsWithCompletion:v21];

    if ([*(id *)(a1 + 32) isACWG]) {
      [*(id *)(a1 + 32) _createSesdSession];
    }
    uint64_t v19 = *(void *)(*(void *)v25 + 40);
    v20.receiver = *(id *)(a1 + 32);
    v20.super_class = (Class)NFUnifiedAccessSession;
    objc_msgSendSuper2(&v20, sel_didStartSessionWithoutQueue_, v19);
    _Block_object_dispose(buf, 8);
  }
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_13(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 74, v3);
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
    int v26 = 74;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
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
  v24 = __42__NFUnifiedAccessSession_didStartSession___block_invoke_2;
  __int16 v25 = &unk_1E595D0A0;
  id v26 = v12;
  id v27 = v11;
  id v13 = v11;
  id v14 = v12;
  [v7 enumerateObjectsUsingBlock:&v22];
  uint64_t v15 = objc_msgSend(v13, "allKeys", v22, v23, v24, v25);
  *(void *)(*(void *)(a1 + 32) + 96) = [v15 count];

  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v7 forKeys:v14];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 88);
  *(void *)(v17 + 88) = v16;

  uint64_t v19 = *(void *)(a1 + 32);
  int v20 = *(void **)(v19 + 112);
  *(void *)(v19 + 112) = v8;
  id v21 = v8;

  objc_sync_exit(v10);
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
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
      [v10 setObject:&unk_1EEF35D88 forKeyedSubscript:v11];
    }
  }
}

- (void)_createSesdSession
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v4 = [(NFUnifiedAccessSession *)self sesdSession];

  if (v4)
  {
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!", v11, ClassName, Name, 112);
    }
    dispatch_get_specific(*v5);
    id v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      uint64_t v15 = object_getClassName(self);
      uint64_t v16 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v24 = v14;
      __int16 v25 = 2082;
      id v26 = v15;
      __int16 v27 = 2082;
      id v28 = v16;
      __int16 v29 = 1024;
      int v30 = 112;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!",
        buf,
        0x22u);
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F97A30] sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__NFUnifiedAccessSession__createSesdSession__block_invoke;
  v20[3] = &unk_1E595EB20;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  v20[4] = self;
  v18 = [v17 startACWGSessionWithOptions:0 startCallback:v20];
  [(NFUnifiedAccessSession *)self setSesdSession:v18];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __44__NFUnifiedAccessSession__createSesdSession__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to start SESACWGSession.  Error - %{public}@", "-[NFUnifiedAccessSession _createSesdSession]_block_invoke", 117, v4);
    }
    dispatch_get_specific(*v5);
    id WeakRetained = NFSharedLogGetLogger();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)int v30 = "-[NFUnifiedAccessSession _createSesdSession]_block_invoke";
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = 117;
      __int16 v31 = 2114;
      v32 = v4;
      _os_log_impl(&dword_19D636000, WeakRetained, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to start SESACWGSession.  Error - %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v8 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v9 = NFLogGetLogger();
      if (v9)
      {
        id v10 = (void (*)(uint64_t, const char *, ...))v9;
        Class = object_getClass(WeakRetained);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i Started SESACWGSession", v14, ClassName, Name, 126);
      }
      dispatch_get_specific(*v8);
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = object_getClass(WeakRetained);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(WeakRetained);
        uint64_t v19 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)int v30 = v17;
        *(_WORD *)&v30[4] = 2082;
        *(void *)&v30[6] = v18;
        __int16 v31 = 2082;
        v32 = v19;
        __int16 v33 = 1024;
        int v34 = 126;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Started SESACWGSession", buf, 0x22u);
      }

      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = [WeakRetained sesdSession];
      [v21 setDelegate:v20];

      uint64_t v22 = [WeakRetained activeKeys];
      uint64_t v23 = [v22 anyObject];
      if (v23)
      {
        int v24 = [WeakRetained sesdSession];
        id v25 = (id)[v24 setActiveKey:v23];

        if ([WeakRetained cardEmulationStarted])
        {
          id v26 = [WeakRetained sesdSession];
          id v27 = (id)[v26 disableBluetooth:1];
        }
      }
    }
  }
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFUnifiedAccessSession *)self releaseSesdSession];
  [(NFUnifiedAccessSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFUnifiedAccessSession;
  [(NFSession *)&v5 endSessionWithCompletion:v4];
}

- (void)didEndUnexpectedly
{
  id v4 = [(NFUnifiedAccessSession *)self sesdSession];
  id v5 = (id)[v4 disableBluetooth:0];

  [(NFUnifiedAccessSession *)self releaseSesdSession];
  v8.receiver = self;
  v8.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v8 callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__NFUnifiedAccessSession_didEndUnexpectedly__block_invoke;
  v7[3] = &unk_1E595C698;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

id __44__NFUnifiedAccessSession_didEndUnexpectedly__block_invoke(uint64_t a1)
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 165);
    }
    dispatch_get_specific(*v2);
    uint64_t v9 = NFSharedLogGetLogger();
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
      id v25 = v13;
      __int16 v26 = 1024;
      int v27 = 165;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
  [*(id *)(a1 + 32) setCardEmulationStarted:0];
  uint64_t v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 32) delegate];
    [v16 unifiedAccessSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFUnifiedAccessSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void)releaseSesdSession
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (const void **)MEMORY[0x1E4FBA898];
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 179);
  }
  dispatch_get_specific(*v4);
  int v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = object_getClass(self);
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
    uint64_t v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 179;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v14 = [(NFUnifiedAccessSession *)self sesdSession];

  if (v14)
  {
    char v15 = [(NFUnifiedAccessSession *)self sesdSession];
    [v15 setDelegate:0];

    uint64_t v16 = [(NFUnifiedAccessSession *)self sesdSession];
    [v16 endSession];

    [(NFUnifiedAccessSession *)self setSesdSession:0];
  }
}

- (BOOL)isACWG
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_LYON_0 length:9];
  id v4 = objc_msgSend(v3, "NF_asHexString");

  id v5 = [(NFApplet *)self->_activeApplet identifier];
  LOBYTE(v3) = [v5 hasPrefix:v4];

  return (char)v3;
}

- (BOOL)isUnifiedAccessOrAcwg:(id)a3 secondaryIdentifier:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_LYON_0 length:9];
  uint64_t v10 = objc_msgSend(v9, "NF_asHexString");

  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_HYDRA_HOME_SE length:7];
  id v12 = objc_msgSend(v11, "NF_asHexString");

  int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_HYDRA_CORPORATE_SE length:7];
  uint64_t v14 = objc_msgSend(v13, "NF_asHexString");

  if (!v7 || !v8)
  {
    sel = a2;
    uint64_t v16 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sel);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i Invalid  primaryIdentifier %@, secondaryIdentifier = %@ ", v22, ClassName, Name, 204, v7, v8);
    }
    dispatch_get_specific(*v16);
    uint64_t v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v30 = v25;
      __int16 v31 = 2082;
      v32 = object_getClassName(self);
      __int16 v33 = 2082;
      int v34 = sel_getName(sel);
      __int16 v35 = 1024;
      int v36 = 204;
      __int16 v37 = 2112;
      id v38 = v7;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid  primaryIdentifier %@, secondaryIdentifier = %@ ", buf, 0x36u);
    }

    goto LABEL_20;
  }
  if (([v7 hasPrefix:v10] & 1) == 0
    && ([v7 hasPrefix:v12] & 1) == 0
    && ![v7 hasPrefix:v14]
    || ([v8 hasPrefix:v10] & 1) == 0
    && ([v8 hasPrefix:v12] & 1) == 0
    && ([v8 hasPrefix:v14] & 1) == 0)
  {
LABEL_20:
    BOOL v15 = 0;
    goto LABEL_21;
  }
  BOOL v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)validateAidsAndKeys:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] == 2)
  {
    v6 = [v5 allKeys];
    id v7 = [v6 objectAtIndex:0];

    id v8 = [v5 allKeys];
    uint64_t v9 = [v8 objectAtIndex:1];

    BOOL v10 = [(NFUnifiedAccessSession *)self isUnifiedAccessOrAcwg:v7 secondaryIdentifier:v9];
    if (!v10)
    {
      int v11 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v17 = 45;
        if (isMetaClass) {
          uint64_t v17 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryAID %@, secondaryAID = %@ ", v17, ClassName, Name, 234, v7, v9);
      }
      dispatch_get_specific(*v11);
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = object_getClass(self);
        if (class_isMetaClass(v19)) {
          int v20 = 43;
        }
        else {
          int v20 = 45;
        }
        *(_DWORD *)buf = 67110402;
        int v34 = v20;
        __int16 v35 = 2082;
        int v36 = object_getClassName(self);
        __int16 v37 = 2082;
        id v38 = sel_getName(a2);
        __int16 v39 = 1024;
        int v40 = 234;
        __int16 v41 = 2112;
        v42 = v7;
        __int16 v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryAID %@, secondaryAID = %@ ", buf, 0x36u);
      }
    }
  }
  else
  {
    int v21 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      uint64_t v23 = (void (*)(uint64_t, const char *, ...))v22;
      __int16 v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      int v30 = object_getClassName(self);
      v32 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v25) {
        uint64_t v26 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", v26, v30, v32, 226, v5);
    }
    dispatch_get_specific(*v21);
    id v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v34 = v28;
      __int16 v35 = 2082;
      int v36 = object_getClassName(self);
      __int16 v37 = 2082;
      id v38 = sel_getName(a2);
      __int16 v39 = 1024;
      int v40 = 226;
      __int16 v41 = 2114;
      v42 = v5;
      _os_log_impl(&dword_19D636000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", buf, 0x2Cu);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NFUnifiedAccessSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __41__NFUnifiedAccessSession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v17 = [*(id *)(a1 + 32) delegate];
      [v17 unifiedAccessSession:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
    }
  }
  else
  {
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
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 249);
    }
    dispatch_get_specific(*v4);
    int v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      BOOL v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      int v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 249;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NFUnifiedAccessSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __53__NFUnifiedAccessSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
      id v17 = [*(id *)(a1 + 32) delegate];
      [v17 unifiedAccessSession:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
    }
  }
  else
  {
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
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 262);
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
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      BOOL v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      int v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 262;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFUnifiedAccessSession;
  id v5 = [(NFSession *)&v7 callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__NFUnifiedAccessSession_didSelectApplet___block_invoke;
  v6[3] = &unk_1E595C698;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);
}

void __42__NFUnifiedAccessSession_didSelectApplet___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 278);
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
      id v12 = object_getClassName(*(id *)(a1 + 32));
      int v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v16 = v11;
      __int16 v17 = 2082;
      v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 1024;
      int v22 = 278;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didStartTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NFUnifiedAccessSession_didStartTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__NFUnifiedAccessSession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v4 = [v2 appletIdentifier];
    uint64_t v5 = [v3 objectForKey:v4];
    [v2 _setApplet:v5];

    v6 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 unifiedAccessSession:*(void *)(a1 + 32) didStartTransaction:*(void *)(a1 + 40)];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 289);
    }
    dispatch_get_specific(*v7);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      __int16 v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 1024;
      int v28 = 289;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NFUnifiedAccessSession_didEndTransaction___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __44__NFUnifiedAccessSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 88);
    v6 = [v4 appletIdentifier];
    uint64_t v7 = [v5 objectForKey:v6];
    [v4 _setApplet:v7];

    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if (v7)
    {
      id v22 = [*(id *)(a1 + 32) delegate];
      [v22 unifiedAccessSession:*(void *)(a1 + 32) didEndTransaction:*(void *)(a1 + 40)];
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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 303);
    }
    dispatch_get_specific(*v9);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      __int16 v19 = object_getClassName(*(id *)(a1 + 32));
      id v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v24 = v18;
      __int16 v25 = 2082;
      uint64_t v26 = v19;
      __int16 v27 = 2082;
      int v28 = v20;
      __int16 v29 = 1024;
      int v30 = 303;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFUnifiedAccessSession;
  id v5 = [(NFSession *)&v7 callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__NFUnifiedAccessSession_didExpireTransactionForApplet___block_invoke;
  v6[3] = &unk_1E595C698;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);
}

void __56__NFUnifiedAccessSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) sesdSession];
    id v3 = (id)[v2 disableBluetooth:0];

    [*(id *)(a1 + 32) setCardEmulationStarted:0];
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) delegate];
      [v6 unifiedAccessSession:*(void *)(a1 + 32) didExpireTransactionForApplet:0];
    }
    objc_sync_exit(obj);
  }
  else
  {
    objc_super v7 = (const void **)MEMORY[0x1E4FBA898];
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
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 320);
    }
    dispatch_get_specific(*v7);
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
      __int16 v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      uint64_t v26 = v18;
      __int16 v27 = 1024;
      int v28 = 320;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFUnifiedAccessSession;
  uint64_t v8 = [(NFSession *)&v14 callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__NFUnifiedAccessSession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E595CDB0;
  id v11 = v7;
  SEL v12 = a2;
  unsigned int v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __63__NFUnifiedAccessSession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
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
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 345);
    }
    dispatch_get_specific(*v6);
    char v5 = NFSharedLogGetLogger();
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
      int v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v19 = v14;
      __int16 v20 = 2082;
      __int16 v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 1024;
      int v25 = 345;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_13;
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) delegate];
    [v5 unifiedAccessSession:*(void *)(a1 + 32) didExpressModeStateChange:*(unsigned int *)(a1 + 56) withObject:*(void *)(a1 + 40)];
LABEL_13:
  }
  objc_sync_exit(v2);
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

- (id)appletsWithIdentifiers:(id)a3 secondaryIdentifier:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(NFUnifiedAccessSession *)self isUnifiedAccessOrAcwg:v7 secondaryIdentifier:v8])
  {
    id v9 = [(NSDictionary *)self->_appletsById objectForKey:v7];
    uint64_t v10 = [(NSDictionary *)self->_appletsById objectForKey:v8];
    id v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v22 addObject:v9];
      [v22 addObject:v11];
LABEL_41:

      goto LABEL_42;
    }
    if (v9)
    {
      if (v10)
      {
LABEL_40:
        id v22 = 0;
        goto LABEL_41;
      }
    }
    else
    {
      __int16 v23 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v25 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v28 = 45;
        if (isMetaClass) {
          uint64_t v28 = 43;
        }
        v25(3, "%c[%{public}s %{public}s]:%i Unable to get applet for primaryIdentifier %@ ", v28, ClassName, Name, 432, v7);
      }
      dispatch_get_specific(*v23);
      uint64_t v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v30 = object_getClass(self);
        if (class_isMetaClass(v30)) {
          int v31 = 43;
        }
        else {
          int v31 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v50 = v31;
        __int16 v51 = 2082;
        v52 = object_getClassName(self);
        __int16 v53 = 2082;
        v54 = sel_getName(a2);
        __int16 v55 = 1024;
        int v56 = 432;
        __int16 v57 = 2112;
        id v58 = v7;
        _os_log_impl(&dword_19D636000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to get applet for primaryIdentifier %@ ", buf, 0x2Cu);
      }

      if (v11) {
        goto LABEL_40;
      }
    }
    v32 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v33 = NFLogGetLogger();
    if (v33)
    {
      int v34 = (void (*)(uint64_t, const char *, ...))v33;
      __int16 v35 = object_getClass(self);
      BOOL v36 = class_isMetaClass(v35);
      uint64_t v45 = object_getClassName(self);
      v48 = sel_getName(a2);
      uint64_t v37 = 45;
      if (v36) {
        uint64_t v37 = 43;
      }
      v34(3, "%c[%{public}s %{public}s]:%i Unable to get applet for secondaryIdentifier %@", v37, v45, v48, 435, v8);
    }
    dispatch_get_specific(*v32);
    id v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      __int16 v41 = object_getClassName(self);
      v42 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v50 = v40;
      __int16 v51 = 2082;
      v52 = v41;
      __int16 v53 = 2082;
      v54 = v42;
      __int16 v55 = 1024;
      int v56 = 435;
      __int16 v57 = 2112;
      id v58 = v8;
      _os_log_impl(&dword_19D636000, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to get applet for secondaryIdentifier %@", buf, 0x2Cu);
    }

    goto LABEL_40;
  }
  unsigned int v13 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v14 = NFLogGetLogger();
  if (v14)
  {
    uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
    int v16 = object_getClass(self);
    BOOL v17 = class_isMetaClass(v16);
    int v18 = object_getClassName(self);
    v46 = sel_getName(a2);
    uint64_t v19 = 45;
    if (v17) {
      uint64_t v19 = 43;
    }
    v15(3, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryIdentifier %@, secondaryIdentifier = %@ ", v19, v18, v46, 416, v7, v8);
  }
  dispatch_get_specific(*v13);
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v50 = v21;
    __int16 v51 = 2082;
    v52 = object_getClassName(self);
    __int16 v53 = 2082;
    v54 = sel_getName(a2);
    __int16 v55 = 1024;
    int v56 = 416;
    __int16 v57 = 2112;
    id v58 = v7;
    __int16 v59 = 2112;
    id v60 = v8;
    _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryIdentifier %@, secondaryIdentifier = %@ ", buf, 0x36u);
  }
  id v22 = 0;
LABEL_42:

  return v22;
}

- (BOOL)setActivePaymentApplet:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  id v11 = _os_activity_create(&dword_19D636000, "setActivePaymentApplet:keys:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__22;
  int v25 = __Block_byref_object_dispose__22;
  id v26 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  id v21[2] = __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke;
  v21[3] = &unk_1E595C6C0;
  v21[4] = self;
  v21[5] = &state;
  void v21[6] = a2;
  BOOL v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke_57;
  v16[3] = &unk_1E595EA50;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  p_os_activity_scope_state_s state = &state;
  uint64_t v19 = &v27;
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

void __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 451, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 451;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke_57(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
  if (*(void *)(a1 + 40)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a3);
  }
  objc_sync_exit(v11);

  if ([*(id *)(a1 + 32) isACWG])
  {
    BOOL v12 = [*(id *)(a1 + 32) sesdSession];

    if (!v12)
    {
      [*(id *)(a1 + 32) _createSesdSession];
      if (v10) {
        goto LABEL_9;
      }
LABEL_20:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_21;
    }
    id v13 = v9;
    char v14 = [v13 anyObject];
    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) sesdSession];
      id v16 = (id)[v15 setActiveKey:v14];
    }
  }
  if (!v10) {
    goto LABEL_20;
  }
LABEL_9:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  id v17 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    uint64_t v22 = 45;
    if (isMetaClass) {
      uint64_t v22 = 43;
    }
    v19(3, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, Name, 477, v10);
  }
  dispatch_get_specific(*v17);
  uint64_t v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    __int16 v26 = object_getClassName(*(id *)(a1 + 32));
    id v27 = sel_getName(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 67110146;
    int v31 = v25;
    __int16 v32 = 2082;
    uint64_t v33 = v26;
    __int16 v34 = 2082;
    __int16 v35 = v27;
    __int16 v36 = 1024;
    int v37 = 477;
    __int16 v38 = 2114;
    id v39 = v10;
    _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

LABEL_21:
}

- (BOOL)setActivePaymentApplets:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "setActivePaymentApplets:keys:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = __Block_byref_object_copy__22;
  id v27 = __Block_byref_object_dispose__22;
  id v28 = 0;
  if ([(NFUnifiedAccessSession *)self validateAidsAndKeys:v7])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke;
    v23[3] = &unk_1E595C6C0;
    v23[4] = self;
    v23[5] = &state;
    v23[6] = a2;
    id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v23];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke_62;
    v18[3] = &unk_1E595EA50;
    v18[4] = self;
    id v19 = v7;
    p_os_activity_scope_state_s state = &state;
    int v21 = &v29;
    SEL v22 = a2;
    [v9 setActivePaymentApplets:v19 authorization:0 completion:v18];

    if (a4) {
      *a4 = *(id *)(state.opaque[1] + 40);
    }
    BOOL v10 = *((unsigned char *)v30 + 24) != 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    BOOL v12 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v34[0] = v13;
    char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v15 = [v11 initWithDomain:v12 code:10 userInfo:v14];
    id v16 = *(void **)(state.opaque[1] + 40);
    *(void *)(state.opaque[1] + 40) = v15;

    BOOL v10 = 0;
    if (a4) {
      *a4 = *(id *)(state.opaque[1] + 40);
    }
  }
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v29, 8);
  return v10;
}

void __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 512, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 512;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke_62(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
  if (*(void *)(a1 + 40)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a3);
  }
  objc_sync_exit(v11);

  if ([*(id *)(a1 + 32) isACWG])
  {
    BOOL v12 = [*(id *)(a1 + 32) sesdSession];

    if (!v12)
    {
      [*(id *)(a1 + 32) _createSesdSession];
      if (v10) {
        goto LABEL_9;
      }
LABEL_20:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_21;
    }
    id v13 = v9;
    char v14 = [v13 anyObject];
    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) sesdSession];
      id v16 = (id)[v15 setActiveKey:v14];
    }
  }
  if (!v10) {
    goto LABEL_20;
  }
LABEL_9:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  id v17 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    uint64_t v22 = 45;
    if (isMetaClass) {
      uint64_t v22 = 43;
    }
    v19(3, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, Name, 537, v10);
  }
  dispatch_get_specific(*v17);
  uint64_t v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    __int16 v26 = object_getClassName(*(id *)(a1 + 32));
    id v27 = sel_getName(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 67110146;
    int v31 = v25;
    __int16 v32 = 2082;
    uint64_t v33 = v26;
    __int16 v34 = 2082;
    __int16 v35 = v27;
    __int16 v36 = 1024;
    int v37 = 537;
    __int16 v38 = 2114;
    id v39 = v10;
    _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

LABEL_21:
}

- (BOOL)_startCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "_startCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__22;
  int v21 = __Block_byref_object_dispose__22;
  id v22 = 0;
  id v9 = [(NFUnifiedAccessSession *)self sesdSession];
  id v10 = (id)[v9 disableBluetooth:1];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke;
  v17[3] = &unk_1E595C6C0;
  v17[4] = self;
  v17[5] = &state;
  v17[6] = a2;
  id v11 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke_63;
  v16[3] = &unk_1E595CA18;
  v16[4] = self;
  void v16[5] = &state;
  v16[6] = &v23;
  v16[7] = a2;
  [v11 startCardEmulationWithAuthorization:v7 completion:v16];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  if (*(void *)(state.opaque[1] + 40))
  {
    BOOL v12 = [(NFUnifiedAccessSession *)self sesdSession];
    id v13 = (id)[v12 disableBluetooth:0];
  }
  else
  {
    [(NFUnifiedAccessSession *)self setCardEmulationStarted:1];
  }
  char v14 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 572, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 572;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 576, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
      int v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 576;
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

- (BOOL)_startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "_startDeferredCardEmulationWithAuthorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  id v16 = __Block_byref_object_copy__22;
  id v17 = __Block_byref_object_dispose__22;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_64;
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

void __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 615, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 615;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 619, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
      int v25 = 619;
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
  v6 = _os_activity_create(&dword_19D636000, "stopCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__22;
  id v17 = __Block_byref_object_dispose__22;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke_65;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  [v7 stopCardEmulationWithCompletion:v12];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  id v8 = [(NFUnifiedAccessSession *)self sesdSession];
  id v9 = (id)[v8 disableBluetooth:0];

  [(NFUnifiedAccessSession *)self setCardEmulationStarted:0];
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 648, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 648;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 652, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
      int v25 = 652;
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
  v6 = _os_activity_create(&dword_19D636000, "startExpressMode:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  char v14 = __Block_byref_object_copy__22;
  uint64_t v15 = __Block_byref_object_dispose__22;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFUnifiedAccessSession_startExpressMode___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__NFUnifiedAccessSession_startExpressMode___block_invoke_66;
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

void __43__NFUnifiedAccessSession_startExpressMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  char v5 = (const void **)MEMORY[0x1E4FBA898];
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 683, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 683;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFUnifiedAccessSession_startExpressMode___block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v5 = (const void **)MEMORY[0x1E4FBA898];
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 687, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
      int v25 = 687;
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

- (void)sesSession:(id)a3 event:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i eventPayload = %@", v12, ClassName, Name, 708, v6);
  }
  dispatch_get_specific(*v7);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v25 = v15;
    __int16 v26 = 2082;
    id v27 = object_getClassName(self);
    __int16 v28 = 2082;
    uint64_t v29 = sel_getName(a2);
    __int16 v30 = 1024;
    int v31 = 708;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i eventPayload = %@", buf, 0x2Cu);
  }

  v23.receiver = self;
  v23.super_class = (Class)NFUnifiedAccessSession;
  id v16 = [(NFSession *)&v23 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NFUnifiedAccessSession_sesSession_event___block_invoke;
  block[3] = &unk_1E595CC48;
  block[4] = self;
  id v21 = v6;
  SEL v22 = a2;
  id v17 = v6;
  dispatch_async(v16, block);
}

void __43__NFUnifiedAccessSession_sesSession_event___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"xpcEventName"];
    id v3 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i event = %@", v8, ClassName, Name, 713, v2);
    }
    dispatch_get_specific(*v3);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
      int v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v30 = v11;
      __int16 v31 = 2082;
      __int16 v32 = v12;
      __int16 v33 = 2082;
      uint64_t v34 = v13;
      __int16 v35 = 1024;
      int v36 = 713;
      __int16 v37 = 2112;
      __int16 v38 = v2;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i event = %@", buf, 0x2Cu);
    }

    char v14 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 session:*(void *)(a1 + 32) didReceiveEvent:*(void *)(a1 + 40)];
    }
  }
  else
  {
    int v15 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      id v17 = (void (*)(uint64_t, const char *, ...))v16;
      id v18 = object_getClass(*(id *)(a1 + 32));
      BOOL v19 = class_isMetaClass(v18);
      __int16 v20 = object_getClassName(*(id *)(a1 + 32));
      __int16 v28 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v21 = 45;
      if (v19) {
        uint64_t v21 = 43;
      }
      v17(3, "%c[%{public}s %{public}s]:%i Session not active", v21, v20, v28, 720);
    }
    dispatch_get_specific(*v15);
    id v2 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      SEL v22 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      __int16 v24 = object_getClassName(*(id *)(a1 + 32));
      int v25 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v30 = v23;
      __int16 v31 = 2082;
      __int16 v32 = v24;
      __int16 v33 = 2082;
      uint64_t v34 = v25;
      __int16 v35 = 1024;
      int v36 = 720;
      _os_log_impl(&dword_19D636000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  int v11 = _os_activity_create(&dword_19D636000, "requestAssertionForKeyID:options:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_LYON_0 length:9];
  int v13 = objc_msgSend(v12, "NF_asHexString");

  char v14 = [MEMORY[0x1E4F97A30] requestAssertionForKeyID:v10 withAppletID:v13 withOptions:v9 error:a5];

  if (v14)
  {
    int v15 = [[NFUnifiedAccessAssertion alloc] initWithSESAssertion:v14];
  }
  else
  {
    uint64_t v16 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(4, "%c[%{public}s %{public}s]:%i Failed to get SES assertion", v22, ClassName, Name, 737);
    }
    dispatch_get_specific(*v16);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = object_getClass(a1);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      __int16 v26 = object_getClassName(a1);
      id v27 = sel_getName(a2);
      *(_DWORD *)os_activity_scope_state_s state = 67109890;
      *(_DWORD *)&state[4] = v25;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v26;
      __int16 v31 = 2082;
      __int16 v32 = v27;
      __int16 v33 = 1024;
      int v34 = 737;
      _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get SES assertion", state, 0x22u);
    }

    int v15 = 0;
  }

  return v15;
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (NSSet)activeKeys
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)cardEmulationStarted
{
  return self->_cardEmulationStarted;
}

- (void)setCardEmulationStarted:(BOOL)a3
{
  self->_cardEmulationStarted = a3;
}

- (SESACWGSession)sesdSession
{
  return self->_sesdSession;
}

- (void)setSesdSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sesdSession, 0);
  objc_storeStrong((id *)&self->_activeKeys, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_storeStrong((id *)&self->_appletsById, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end