@interface NFECommercePaymentSession
- (id)allApplets;
- (id)appletWithIdentifier:(id)a3;
- (id)performECommercePayment:(id)a3 request:(id)a4;
- (id)performECommercePayment:(id)a3 request:(id)a4 error:(id *)a5;
- (id)validateEcommercePaymentRequest:(id)a3;
- (void)didStartSession:(id)a3;
@end

@implementation NFECommercePaymentSession

- (id)allApplets
{
  return [(NSDictionary *)self->_appletsById allValues];
}

- (id)appletWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_appletsById objectForKey:a3];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFECommercePaymentSession;
  v6 = [(NFSession *)&v11 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke;
  block[3] = &unk_1E595CC48;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __45__NFECommercePaymentSession_didStartSession___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) didEnd])
  {
    v2 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 38, *(void *)(a1 + 40));
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
      int v29 = 38;
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
      v21.super_class = (Class)NFECommercePaymentSession;
      objc_msgSendSuper2(&v21, sel_didStartSession_);
      return;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_13;
    v20[3] = &unk_1E595C648;
    uint64_t v17 = *(void *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v17;
    v19.receiver = v16;
    v19.super_class = (Class)NFECommercePaymentSession;
    SEL v10 = objc_msgSendSuper2(&v19, sel_remoteObjectProxyWithErrorHandler_, v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_18;
    v18[3] = &unk_1E595CF08;
    v18[4] = *(void *)(a1 + 32);
    [v10 getAppletsWithCompletion:v18];
  }
}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 45, v3);
  }
  dispatch_get_specific(*v4);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v19 = v14;
    __int16 v20 = 2082;
    objc_super v21 = v15;
    __int16 v22 = 2082;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = 45;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFECommercePaymentSession;
  objc_msgSendSuper2(&v17, sel_didStartSession_, v3);
}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  objc_sync_enter(v6);
  uint64_t v9 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_2;
  v15[3] = &unk_1E595CE28;
  id v16 = v9;
  id v10 = v9;
  [v8 enumerateObjectsUsingBlock:v15];
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v8 forKeys:v10];

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v11;

  objc_sync_exit(v6);
  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)NFECommercePaymentSession;
  objc_msgSendSuper2(&v14, sel_didStartSession_, v7);
}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

- (id)performECommercePayment:(id)a3 request:(id)a4
{
  return [(NFECommercePaymentSession *)self performECommercePayment:a3 request:a4 error:0];
}

- (id)performECommercePayment:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_19D636000, "performECommercePayment:request:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v24 = 0x3032000000;
  int v25 = __Block_byref_object_copy__2;
  __int16 v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__2;
  objc_super v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke;
  v16[3] = &unk_1E595C6C0;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = a2;
  uint64_t v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke_23;
  v15[3] = &unk_1E595CF30;
  void v15[4] = self;
  v15[5] = &v17;
  v15[6] = &state;
  v15[7] = a2;
  [v12 performECommercePayment:v10 request:v9 completion:v15];

  if (a5) {
    *a5 = (id) v18[5];
  }
  id v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&state, 8);
  return v13;
}

void __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 79, v4);
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
    objc_super v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    objc_super v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 79;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 87, v7);
    }
    dispatch_get_specific(*v8);
    objc_super v14 = NFSharedLogGetLogger();
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
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 87;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (id)validateEcommercePaymentRequest:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  objc_super v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke;
  v9[3] = &unk_1E595C6C0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a2;
  id v4 = a3;
  id v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke_25;
  v8[3] = &unk_1E595CF58;
  v8[4] = &v10;
  [v5 validateEcommercePaymentRequest:v4 completion:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 107, v4);
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
    objc_super v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    objc_super v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 107;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke_25(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

@end