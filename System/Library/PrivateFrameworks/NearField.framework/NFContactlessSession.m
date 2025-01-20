@interface NFContactlessSession
- (BOOL)setActiveApplet:(id)a3;
- (BOOL)setActiveApplet:(id)a3 error:(id *)a4;
- (BOOL)startCardEmulation;
- (BOOL)startCardEmulation:(id *)a3;
- (BOOL)stopCardEmulation;
- (BOOL)stopCardEmulation:(id *)a3;
- (NFApplet)activeApplet;
- (NFContactlessSessionDelegate)delegate;
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndUnexpectedly;
- (void)didFelicaStateChange:(id)a3;
- (void)didSelectApplet:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NFContactlessSession

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFContactlessSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFContactlessSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NFContactlessSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __40__NFContactlessSession_didStartSession___block_invoke(uint64_t a1)
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 48, *(void *)(a1 + 40));
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
      int v29 = 48;
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
      v21.super_class = (Class)NFContactlessSession;
      objc_msgSendSuper2(&v21, sel_didStartSession_);
      return;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__NFContactlessSession_didStartSession___block_invoke_13;
    v20[3] = &unk_1E595C648;
    uint64_t v17 = *(void *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v17;
    v19.receiver = v16;
    v19.super_class = (Class)NFContactlessSession;
    SEL v10 = objc_msgSendSuper2(&v19, sel_remoteObjectProxyWithErrorHandler_, v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__NFContactlessSession_didStartSession___block_invoke_18;
    v18[3] = &unk_1E595CE50;
    v18[4] = *(void *)(a1 + 32);
    [v10 getAppletsWithCompletion:v18];
  }
}

void __40__NFContactlessSession_didStartSession___block_invoke_13(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 55, v3);
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
    int v25 = 55;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFContactlessSession;
  objc_msgSendSuper2(&v17, sel_didStartSession_, v3);
}

void __40__NFContactlessSession_didStartSession___block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  objc_sync_enter(v8);
  objc_super v11 = objc_opt_new();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__NFContactlessSession_didStartSession___block_invoke_2;
  v20[3] = &unk_1E595CE28;
  id v21 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:v20];
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v10 forKeys:v12];

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  uint64_t v16 = *(void *)(a1 + 32);
  objc_super v17 = *(void **)(v16 + 96);
  *(void *)(v16 + 96) = v7;
  id v18 = v7;

  objc_sync_exit(v8);
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFContactlessSession;
  objc_msgSendSuper2(&v19, sel_didStartSession_, v9);
}

void __40__NFContactlessSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFContactlessSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFContactlessSession;
  [(NFSession *)&v5 endSessionWithCompletion:v4];
}

- (void)didEndUnexpectedly
{
  v6.receiver = self;
  v6.super_class = (Class)NFContactlessSession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__NFContactlessSession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

id __42__NFContactlessSession_didEndUnexpectedly__block_invoke(uint64_t a1)
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 88);
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
      uint64_t v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v21 = v11;
      __int16 v22 = 2082;
      int v23 = v12;
      __int16 v24 = 2082;
      int v25 = v13;
      __int16 v26 = 1024;
      int v27 = 88;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 32) delegate];
    [v16 contactlessSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFContactlessSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFContactlessSession;
  objc_super v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NFContactlessSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  void block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __39__NFContactlessSession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 48))
    {
      if (v2[88])
      {
        objc_super v17 = [v2 delegate];
        char v18 = objc_opt_respondsToSelector();

        v2 = *(unsigned char **)(a1 + 32);
        if (v18)
        {
          v2[88] = 0;
          objc_super v19 = [*(id *)(a1 + 32) delegate];
          [v19 contactlessSessionDidExitField:*(void *)(a1 + 32)];

          v2 = *(unsigned char **)(a1 + 32);
        }
      }
    }
    id v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v21 = [*(id *)(a1 + 32) delegate];
      [v21 contactlessSession:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 104);
    }
    dispatch_get_specific(*v5);
    id v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(*(id *)(a1 + 32));
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
      int v25 = v15;
      __int16 v26 = 2082;
      int v27 = v16;
      __int16 v28 = 1024;
      int v29 = 104;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessSession;
  objc_super v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFContactlessSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__NFContactlessSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
      char v4 = [*(id *)(a1 + 32) delegate];
      [v4 contactlessSession:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];
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
        [v8 contactlessSession:*(void *)(a1 + 32) didDetectTechnology:v22];

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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 122);
    }
    dispatch_get_specific(*v9);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_super v17 = object_getClass(*(id *)(a1 + 32));
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
      int v30 = 122;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didSelectApplet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NFContactlessSession_didSelectApplet___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __40__NFContactlessSession_didSelectApplet___block_invoke(uint64_t a1)
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
    [v8 contactlessSession:*(void *)(a1 + 32) didSelectApplet:v4];
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
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 147);
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
      int v30 = 147;
      _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didFelicaStateChange:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFContactlessSession;
  char v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NFContactlessSession_didFelicaStateChange___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __45__NFContactlessSession_didFelicaStateChange___block_invoke(uint64_t a1)
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
      [v4 contactlessSession:*(void *)(a1 + 32) didFelicaStateChange:*(void *)(a1 + 40)];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 164);
    }
    dispatch_get_specific(*v5);
    id v12 = NFSharedLogGetLogger();
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
      uint64_t v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v20 = v14;
      __int16 v21 = 2082;
      __int16 v22 = v15;
      __int16 v23 = 2082;
      int v24 = v16;
      __int16 v25 = 1024;
      int v26 = 164;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (id)allApplets
{
  return [(NSDictionary *)self->_appletsById allValues];
}

- (id)appletWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_appletsById objectForKey:a3];
}

- (BOOL)setActiveApplet:(id)a3
{
  return [(NFContactlessSession *)self setActiveApplet:a3 error:0];
}

- (BOOL)setActiveApplet:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = _os_activity_create(&dword_19D636000, "seActiveApplet:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  uint64_t v16 = __Block_byref_object_copy__1;
  int v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__NFContactlessSession_setActiveApplet_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__NFContactlessSession_setActiveApplet_error___block_invoke_48;
  v12[3] = &unk_1E595CE78;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  [v9 setActiveApplet:v7 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __46__NFContactlessSession_setActiveApplet_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 202, v4);
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
    int v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 202;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __46__NFContactlessSession_setActiveApplet_error___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), a2);
  objc_sync_exit(v8);

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 212, v7);
    }
    dispatch_get_specific(*v9);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      id v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v23 = v17;
      __int16 v24 = 2082;
      int v25 = v18;
      __int16 v26 = 2082;
      id v27 = v19;
      __int16 v28 = 1024;
      int v29 = 212;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startCardEmulation
{
  return [(NFContactlessSession *)self startCardEmulation:0];
}

- (BOOL)startCardEmulation:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "startCardEmulation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFContactlessSession_startCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__NFContactlessSession_startCardEmulation___block_invoke_50;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 startCardEmulationWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __43__NFContactlessSession_startCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 240, v4);
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
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 240;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFContactlessSession_startCardEmulation___block_invoke_50(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 244, v4);
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
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 244;
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
  return [(NFContactlessSession *)self stopCardEmulation:0];
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
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NFContactlessSession_stopCardEmulation___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NFContactlessSession_stopCardEmulation___block_invoke_51;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
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

void __42__NFContactlessSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 270, v4);
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
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 270;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFContactlessSession_stopCardEmulation___block_invoke_51(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 274, v4);
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
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = 274;
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
  return (NFApplet *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appletsById, 0);
}

@end