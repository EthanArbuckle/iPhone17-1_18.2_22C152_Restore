@interface NFFieldDetectSession
- (BOOL)isTimeLimited;
- (NFFieldDetectSessionDelegate)delegate;
- (void)didDetectField:(BOOL)a3;
- (void)didDetectFieldNotification:(id)a3;
- (void)didEndUnexpectedly;
- (void)setDelegate:(id)a3;
@end

@implementation NFFieldDetectSession

- (BOOL)isTimeLimited
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  v5 = [(NFFieldDetectSession *)obj delegate];
  obj->_detectFieldCallback = objc_opt_respondsToSelector() & 1;

  v6 = [(NFFieldDetectSession *)obj delegate];
  obj->_exitFieldCallback = objc_opt_respondsToSelector() & 1;

  v7 = [(NFFieldDetectSession *)obj delegate];
  obj->_enterFieldCallback = objc_opt_respondsToSelector() & 1;

  v8 = [(NFFieldDetectSession *)obj delegate];
  obj->_detectTechnologyCallback = objc_opt_respondsToSelector() & 1;

  objc_sync_exit(obj);
}

- (NFFieldDetectSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFFieldDetectSessionDelegate *)WeakRetained;
}

- (void)didDetectField:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFFieldDetectSession;
  v6 = [(NFSession *)&v9 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NFFieldDetectSession_didDetectField___block_invoke;
  block[3] = &unk_1E595CD88;
  block[4] = self;
  block[5] = a2;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

void __39__NFFieldDetectSession_didDetectField___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      int v3 = 1;
    }
    else if (v2[80] && v2[83])
    {
      v2[80] = 0;
      v16 = [*(id *)(a1 + 32) delegate];
      [v16 fieldDetectSessionDidExitField:*(void *)(a1 + 32)];

      int v3 = *(unsigned __int8 *)(a1 + 48);
      v2 = *(unsigned char **)(a1 + 32);
    }
    else
    {
      int v3 = 0;
    }
    if (v3 != v2[81])
    {
      v2[81] = v3;
      v17 = *(unsigned char **)(a1 + 32);
      if (v17[82])
      {
        id v19 = [v17 delegate];
        [v19 fieldDetectSession:*(void *)(a1 + 32) didDetectField:*(unsigned __int8 *)(a1 + 48)];
      }
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
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 54);
    }
    dispatch_get_specific(*v4);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v21 = v13;
      __int16 v22 = 2082;
      v23 = v14;
      __int16 v24 = 2082;
      v25 = v15;
      __int16 v26 = 1024;
      int v27 = 54;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFFieldDetectSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFFieldDetectSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__NFFieldDetectSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (v2[84])
    {
      int v3 = [v2 delegate];
      [v3 fieldDetectSession:*(void *)(a1 + 32) didEnterFieldWithNotification:*(void *)(a1 + 40)];

      *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
      v2 = *(unsigned char **)(a1 + 32);
    }
    if (v2[85])
    {
      id v4 = [[NFTechnologyEvent alloc] initWithFieldNotification:*(void *)(a1 + 40)];
      if (v4)
      {
        id v19 = v4;
        id v5 = [*(id *)(a1 + 32) delegate];
        [v5 fieldDetectSession:*(void *)(a1 + 32) didDetectTechnology:v19];

        id v4 = v19;
      }
    }
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 77);
    }
    dispatch_get_specific(*v6);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v21 = v15;
      __int16 v22 = 2082;
      v23 = v16;
      __int16 v24 = 2082;
      v25 = v17;
      __int16 v26 = 1024;
      int v27 = 77;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
}

- (void)didEndUnexpectedly
{
  v6.receiver = self;
  v6.super_class = (Class)NFFieldDetectSession;
  id v4 = [(NFSession *)&v6 callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__NFFieldDetectSession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E595C698;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

id __42__NFFieldDetectSession_didEndUnexpectedly__block_invoke(uint64_t a1)
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 102);
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
      uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
      int v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v21 = v11;
      __int16 v22 = 2082;
      v23 = v12;
      __int16 v24 = 2082;
      v25 = v13;
      __int16 v26 = 1024;
      int v27 = 102;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }
  v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [*(id *)(a1 + 32) delegate];
    [v16 fieldDetectSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFFieldDetectSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void).cxx_destruct
{
}

@end