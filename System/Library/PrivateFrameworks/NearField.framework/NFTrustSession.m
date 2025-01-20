@interface NFTrustSession
- (BOOL)deleteKey:(id)a3 error:(id *)a4;
- (id)createKey:(id)a3 request:(id)a4 error:(id *)a5;
- (id)getKey:(id)a3 error:(id *)a4;
- (id)listKeys:(id *)a3;
- (id)signWithKey:(id)a3 request:(id)a4 authorization:(id)a5 error:(id *)a6;
- (id)signWithKey:(id)a3 request:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 error:(id *)a7;
@end

@implementation NFTrustSession

- (id)createKey:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = _os_activity_create(&dword_19D636000, "createKey:request:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  id v43 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  if (!a5)
  {
    v15 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v21 = 45;
      if (isMetaClass) {
        uint64_t v21 = 43;
      }
      v17(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v21, ClassName, Name, 27);
    }
    dispatch_get_specific(*v15);
    v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      v25 = object_getClassName(self);
      v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v45 = v24;
      __int16 v46 = 2082;
      v47 = v25;
      __int16 v48 = 2082;
      v49 = v26;
      __int16 v50 = 1024;
      int v51 = 27;
      _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    id v27 = 0;
    goto LABEL_20;
  }
  if (!v9)
  {
    v28 = @"keyIdentifier is nil";
LABEL_18:
    PTErrorInvalidParameters(v28);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v10)
  {
    v28 = @"Request is nil";
    goto LABEL_18;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __42__NFTrustSession_createKey_request_error___block_invoke;
  v32[3] = &unk_1E595C6C0;
  v32[4] = self;
  v32[5] = &v33;
  v32[6] = a2;
  v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v32];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __42__NFTrustSession_createKey_request_error___block_invoke_19;
  v31[3] = &unk_1E595D028;
  v31[4] = &v33;
  v31[5] = &state;
  [v12 createKey:v9 cresteKeyRequest:v10 completion:v31];

  v13 = (void *)v34[5];
  if (v13)
  {
    id v14 = v13;
LABEL_19:
    id v27 = 0;
    *a5 = v14;
    goto LABEL_20;
  }
  id v27 = *(id *)(state.opaque[1] + 40);
LABEL_20:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&state, 8);
  return v27;
}

void __42__NFTrustSession_createKey_request_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 44, v4);
  }
  dispatch_get_specific(*v5);
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
    id v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 44;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFTrustSession_createKey_request_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)deleteKey:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "deleteKey:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  if (a4)
  {
    if (!v7)
    {
      PTErrorInvalidParameters(@"keyIdentifier is nil");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v11 = 0;
      goto LABEL_16;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__NFTrustSession_deleteKey_error___block_invoke;
    v28[3] = &unk_1E595C6C0;
    v28[4] = self;
    v28[5] = &state;
    v28[6] = a2;
    id v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v28];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __34__NFTrustSession_deleteKey_error___block_invoke_21;
    v27[3] = &unk_1E595CF58;
    v27[4] = &state;
    [v9 deleteKey:v7 completion:v27];

    uint64_t v10 = *(void **)(state.opaque[1] + 40);
    BOOL v11 = v10 == 0;
    if (v10)
    {
      id v12 = v10;
LABEL_16:
      *a4 = v12;
    }
  }
  else
  {
    int v13 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v19, ClassName, Name, 68);
    }
    dispatch_get_specific(*v13);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      v23 = object_getClassName(self);
      __int16 v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v35 = v22;
      __int16 v36 = 2082;
      v37 = v23;
      __int16 v38 = 2082;
      v39 = v24;
      __int16 v40 = 1024;
      int v41 = 68;
      _os_log_impl(&dword_19D636000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    BOOL v11 = 0;
  }
  _Block_object_dispose(&state, 8);

  return v11;
}

void __34__NFTrustSession_deleteKey_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 80, v4);
  }
  dispatch_get_specific(*v5);
  BOOL v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 80;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __34__NFTrustSession_deleteKey_error___block_invoke_21(uint64_t a1, void *a2)
{
}

- (id)signWithKey:(id)a3 request:(id)a4 authorization:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = _os_activity_create(&dword_19D636000, "signWithKey:request:authorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  int v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  __int16 v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  if (!a6)
  {
    v18 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v24, ClassName, Name, 107);
    }
    dispatch_get_specific(*v18);
    int v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      uint64_t v28 = object_getClassName(self);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v48 = v27;
      __int16 v49 = 2082;
      __int16 v50 = v28;
      __int16 v51 = 2082;
      uint64_t v52 = v29;
      __int16 v53 = 1024;
      int v54 = 107;
      _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    id v30 = 0;
    goto LABEL_20;
  }
  if (!v11)
  {
    v31 = @"keyIdentifier is nil";
LABEL_18:
    PTErrorInvalidParameters(v31);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v12)
  {
    v31 = @"signRequest is nil";
    goto LABEL_18;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke;
  v35[3] = &unk_1E595C6C0;
  v35[4] = self;
  v35[5] = &v36;
  v35[6] = a2;
  v15 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v35];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke_25;
  v34[3] = &unk_1E595D050;
  v34[4] = &v36;
  v34[5] = &state;
  [v15 signWithKey:v11 signRequest:v12 paymentRequest:0 authorization:v13 completion:v34];

  v16 = (void *)v37[5];
  if (v16)
  {
    id v17 = v16;
LABEL_19:
    id v30 = 0;
    *a6 = v17;
    goto LABEL_20;
  }
  id v30 = *(id *)(state.opaque[1] + 40);
LABEL_20:
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&state, 8);
  return v30;
}

void __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 124, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
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
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 124;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke_25(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 signResponse];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)signWithKey:(id)a3 request:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 error:(id *)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = _os_activity_create(&dword_19D636000, "signWithKey:request:paymentRequest:authorization:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  int v48 = __Block_byref_object_dispose__3;
  id v49 = 0;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__3;
  uint64_t v43 = __Block_byref_object_dispose__3;
  id v44 = 0;
  if (!a7)
  {
    uint64_t v21 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v27, ClassName, Name, 153);
    }
    dispatch_get_specific(*v21);
    uint64_t v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v51 = v30;
      __int16 v52 = 2082;
      __int16 v53 = v31;
      __int16 v54 = 2082;
      uint64_t v55 = v32;
      __int16 v56 = 1024;
      int v57 = 153;
      _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    id v33 = 0;
    goto LABEL_24;
  }
  if (!v13)
  {
    v34 = @"keyIdentifier is nil";
LABEL_22:
    PTErrorInvalidParameters(v34);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!v14)
  {
    v34 = @"signRequest is nil";
    goto LABEL_22;
  }
  if (!v15)
  {
    v34 = @"paymentRequest is nil";
    goto LABEL_22;
  }
  if (!v16)
  {
    v34 = @"authorization is nil";
    goto LABEL_22;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke;
  v38[3] = &unk_1E595C6C0;
  v38[4] = self;
  v38[5] = &v39;
  v38[6] = a2;
  v18 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v38];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke_33;
  v37[3] = &unk_1E595D050;
  v37[4] = &v39;
  v37[5] = &state;
  [v18 signWithKey:v13 signRequest:v14 paymentRequest:v15 authorization:v16 completion:v37];

  int v19 = (void *)v40[5];
  if (v19)
  {
    id v20 = v19;
LABEL_23:
    id v33 = 0;
    *a7 = v20;
    goto LABEL_24;
  }
  id v33 = *(id *)(state.opaque[1] + 40);
LABEL_24:
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&state, 8);
  return v33;
}

void __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 180, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 180;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getKey:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(NFTrustSession *)self listKeys:a4];
  id v9 = v8;
  if (a4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v16 = [v15 identifier];
          char v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            id v18 = v15;

            goto LABEL_22;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    PTErrorKeyNotFound(v7);
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v19 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v21(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v25, ClassName, Name, 200);
    }
    dispatch_get_specific(*v19);
    __int16 v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v37 = v28;
      __int16 v38 = 2082;
      uint64_t v39 = object_getClassName(self);
      __int16 v40 = 2082;
      uint64_t v41 = sel_getName(a2);
      __int16 v42 = 1024;
      int v43 = 200;
      _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    id v18 = 0;
  }
LABEL_22:

  return v18;
}

- (id)listKeys:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_19D636000, "listKeys:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__3;
  long long v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  if (a3)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __27__NFTrustSession_listKeys___block_invoke;
    v24[3] = &unk_1E595C6C0;
    v24[4] = self;
    v24[5] = &v25;
    v24[6] = a2;
    id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __27__NFTrustSession_listKeys___block_invoke_34;
    v23[3] = &unk_1E595D078;
    v23[4] = &v25;
    v23[5] = &state;
    [v7 listKeysWithCompletion:v23];

    *a3 = (id) v26[5];
    id v8 = *(id *)(state.opaque[1] + 40);
  }
  else
  {
    id v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v15, ClassName, Name, 222);
    }
    dispatch_get_specific(*v9);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      char v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(self);
      __int16 v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v37 = v18;
      __int16 v38 = 2082;
      uint64_t v39 = v19;
      __int16 v40 = 2082;
      uint64_t v41 = v20;
      __int16 v42 = 1024;
      int v43 = 222;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    id v8 = 0;
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __27__NFTrustSession_listKeys___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 229, v4);
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
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 229;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __27__NFTrustSession_listKeys___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end