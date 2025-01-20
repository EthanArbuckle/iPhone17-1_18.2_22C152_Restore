@interface NFSeshatSession
+ (BOOL)isTransientError:(id)a3;
+ (unint64_t)largeCrumbsFromError:(id)a3;
+ (unsigned)smallCrumbsFromError:(id)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7;
- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 trackingError:(id *)a8;
- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6;
- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7;
- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4;
- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 trackingError:(id *)a5;
- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6;
- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7;
- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6;
- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7;
- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3 trackingError:(id *)a4;
- ($85CD2974BE96D4886BB301820D1C36C2)obliterate;
- ($85CD2974BE96D4886BB301820D1C36C2)obliterateWithTrackingError:(id *)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5;
- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6;
- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5;
- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6;
@end

@implementation NFSeshatSession

- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self allocateSlot:a3 authorizingUser:a4 authorizingUserToken:a5 outToken:a6 outWriteCount:a7 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 trackingError:(id *)a8
{
  uint64_t v10 = a4;
  uint64_t v11 = a3;
  id v14 = a5;
  v15 = _os_activity_create(&dword_19D636000, "allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2810000000;
  v36 = &unk_19D6F42CB;
  uint64_t v37 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__14;
  v31 = __Block_byref_object_dispose__14;
  id v32 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__14;
  v26 = __Block_byref_object_dispose__14;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke;
  v21[3] = &unk_1E595E440;
  v21[4] = self;
  v21[5] = &v33;
  v21[6] = &v22;
  v21[7] = a2;
  v16 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke_28;
  v20[3] = &unk_1E595E468;
  v20[4] = &state;
  v20[5] = &v33;
  v20[6] = &v22;
  v20[7] = a7;
  v20[8] = a2;
  [v16 allocateSlot:v11 authorizingUser:v10 authorizingUserToken:v14 completion:v20];

  if (a8) {
    *a8 = (id) v23[5];
  }
  *a6 = *(id *)(state.opaque[1] + 40);
  $85CD2974BE96D4886BB301820D1C36C2 v17 = ($85CD2974BE96D4886BB301820D1C36C2)v34[4];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v33, 8);
  return v17;
}

void __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 46, v3);
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
    v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 46;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  $85CD2974BE96D4886BB301820D1C36C2 v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35A88;
  v27[3] = @"Method";
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 48);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke_28(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  **(_DWORD **)(a1 + 56) = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    v13 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v14 = [v11 code];
    v25[0] = *MEMORY[0x1E4F28568];
    id v15 = NSString;
    if ([v11 code] > 70) {
      uint64_t v16 = 71;
    }
    else {
      uint64_t v16 = [v11 code];
    }
    $85CD2974BE96D4886BB301820D1C36C2 v17 = [v15 stringWithUTF8String:NFResultCodeString_2[v16]];
    uint64_t v18 = *MEMORY[0x1E4F28A50];
    v26[0] = v17;
    v26[1] = v11;
    v25[1] = v18;
    v25[2] = @"Line";
    v26[2] = &unk_1EEF35AA0;
    v25[3] = @"Method";
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 64)));
    v26[3] = v19;
    v25[4] = *MEMORY[0x1E4F28228];
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 64)), 57);
    v26[4] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
    uint64_t v22 = [v12 initWithDomain:v13 code:v14 userInfo:v21];
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self derive:a3 userHash:a4 outData:a5 outWriteCount:a6 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  uint64_t v10 = a3;
  id v13 = a4;
  uint64_t v14 = _os_activity_create(&dword_19D636000, "derive:userHash:outData:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2810000000;
  v34 = &unk_19D6F42CB;
  uint64_t v35 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14;
  uint64_t v29 = __Block_byref_object_dispose__14;
  id v30 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__14;
  uint64_t v24 = __Block_byref_object_dispose__14;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke;
  v19[3] = &unk_1E595E440;
  v19[4] = self;
  v19[5] = &v31;
  v19[6] = &v20;
  v19[7] = a2;
  id v15 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke_35;
  v18[3] = &unk_1E595E468;
  v18[4] = &state;
  v18[5] = &v31;
  v18[6] = &v20;
  v18[7] = a6;
  v18[8] = a2;
  [v15 derive:v10 userHash:v13 completion:v18];

  if (a7) {
    *a7 = (id) v21[5];
  }
  *a5 = *(id *)(state.opaque[1] + 40);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = ($85CD2974BE96D4886BB301820D1C36C2)v32[4];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v31, 8);
  return v16;
}

void __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 95, v3);
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
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 95;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  $85CD2974BE96D4886BB301820D1C36C2 v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35AB8;
  v27[3] = @"Method";
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 97);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke_35(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  **(_DWORD **)(a1 + 56) = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v13 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v14 = [v11 code];
    v25[0] = *MEMORY[0x1E4F28568];
    id v15 = NSString;
    if ([v11 code] > 70) {
      uint64_t v16 = 71;
    }
    else {
      uint64_t v16 = [v11 code];
    }
    $85CD2974BE96D4886BB301820D1C36C2 v17 = [v15 stringWithUTF8String:NFResultCodeString_2[v16]];
    uint64_t v18 = *MEMORY[0x1E4F28A50];
    v26[0] = v17;
    v26[1] = v11;
    v25[1] = v18;
    v25[2] = @"Line";
    v26[2] = &unk_1EEF35AD0;
    v25[3] = @"Method";
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 64)));
    v26[3] = v19;
    v25[4] = *MEMORY[0x1E4F28228];
    uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 64)), 106);
    v26[4] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
    uint64_t v22 = [v12 initWithDomain:v13 code:v14 userInfo:v21];
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self resetCounter:a3 userToken:a4 outWriteCount:a5 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6
{
  uint64_t v8 = a3;
  id v11 = a4;
  id v12 = _os_activity_create(&dword_19D636000, "resetCounter:userToken:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2810000000;
  v26 = &unk_19D6F42CB;
  uint64_t v27 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke;
  v17[3] = &unk_1E595E440;
  v17[4] = self;
  v17[5] = &v23;
  v17[6] = &state;
  v17[7] = a2;
  id v13 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke_41;
  v16[3] = &unk_1E595E490;
  v16[4] = &v23;
  v16[5] = &state;
  v16[6] = a5;
  v16[7] = a2;
  [v13 resetCounter:v8 userToken:v11 completion:v16];

  if (a6) {
    *a6 = *(id *)(state.opaque[1] + 40);
  }
  $85CD2974BE96D4886BB301820D1C36C2 v14 = ($85CD2974BE96D4886BB301820D1C36C2)v24[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 141, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    $85CD2974BE96D4886BB301820D1C36C2 v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 141;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  $85CD2974BE96D4886BB301820D1C36C2 v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35AE8;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 143);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke_41(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v10 = [v7 code];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = NSString;
    if ([v7 code] > 70) {
      uint64_t v12 = 71;
    }
    else {
      uint64_t v12 = [v7 code];
    }
    id v13 = [v11 stringWithUTF8String:NFResultCodeString_2[v12]];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = @"Line";
    v22[2] = &unk_1EEF35B00;
    v21[3] = @"Method";
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E4F28228];
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 151);
    v22[4] = v16;
    $85CD2974BE96D4886BB301820D1C36C2 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    uint64_t v18 = [v8 initWithDomain:v9 code:v10 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self authorizeUpdate:a3 slotIndex:a4 userToken:a5 outWriteCount:a6 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  uint64_t v9 = a4;
  BOOL v10 = a3;
  id v13 = a5;
  uint64_t v14 = _os_activity_create(&dword_19D636000, "authorizeUpdate:slotIndex:userToken:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2810000000;
  v28 = &unk_19D6F42CB;
  uint64_t v29 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__14;
  uint64_t v23 = __Block_byref_object_dispose__14;
  id v24 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke;
  v19[3] = &unk_1E595E440;
  v19[4] = self;
  v19[5] = &v25;
  v19[6] = &state;
  v19[7] = a2;
  id v15 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke_48;
  v18[3] = &unk_1E595E490;
  v18[4] = &v25;
  v18[5] = &state;
  v18[6] = a6;
  v18[7] = a2;
  [v15 authorizeUpdate:v10 slotIndex:v9 userToken:v13 completion:v18];

  if (a7) {
    *a7 = *(id *)(state.opaque[1] + 40);
  }
  $85CD2974BE96D4886BB301820D1C36C2 v16 = ($85CD2974BE96D4886BB301820D1C36C2)v26[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 187, v3);
  }
  dispatch_get_specific(*v4);
  BOOL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 187;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  $85CD2974BE96D4886BB301820D1C36C2 v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35B18;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 189);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke_48(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v10 = [v7 code];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = NSString;
    if ([v7 code] > 70) {
      uint64_t v12 = 71;
    }
    else {
      uint64_t v12 = [v7 code];
    }
    id v13 = [v11 stringWithUTF8String:NFResultCodeString_2[v12]];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = @"Line";
    v22[2] = &unk_1EEF35B30;
    v21[3] = @"Method";
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E4F28228];
    $85CD2974BE96D4886BB301820D1C36C2 v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 197);
    v22[4] = v16;
    $85CD2974BE96D4886BB301820D1C36C2 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    uint64_t v18 = [v8 initWithDomain:v9 code:v10 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self deleteSlot:a3 outWriteCount:a4 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 trackingError:(id *)a5
{
  uint64_t v7 = a3;
  uint64_t v10 = _os_activity_create(&dword_19D636000, "deleteSlot:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2810000000;
  id v24 = &unk_19D6F42CB;
  uint64_t v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__14;
  uint64_t v19 = __Block_byref_object_dispose__14;
  id v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke;
  v15[3] = &unk_1E595E440;
  v15[4] = self;
  v15[5] = &v21;
  v15[6] = &state;
  v15[7] = a2;
  id v11 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke_54;
  v14[3] = &unk_1E595E490;
  v14[4] = &v21;
  v14[5] = &state;
  v14[6] = a4;
  v14[7] = a2;
  [v11 deleteSlot:v7 completion:v14];

  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  $85CD2974BE96D4886BB301820D1C36C2 v12 = ($85CD2974BE96D4886BB301820D1C36C2)v22[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 229, v3);
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
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 229;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35B48;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 231);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke_54(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v10 = [v7 code];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = NSString;
    if ([v7 code] > 70) {
      uint64_t v12 = 71;
    }
    else {
      uint64_t v12 = [v7 code];
    }
    id v13 = [v11 stringWithUTF8String:NFResultCodeString_2[v12]];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = @"Line";
    v22[2] = &unk_1EEF35B60;
    v21[3] = @"Method";
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E4F28228];
    $85CD2974BE96D4886BB301820D1C36C2 v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 239);
    v22[4] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    uint64_t v18 = [v8 initWithDomain:v9 code:v10 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self getData:a3 updateKUD:a4 outWriteLimit:a5 outWriteCount:a6 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  uint64_t v14 = _os_activity_create(&dword_19D636000, "getData:updateKUD:outWriteLimit:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2810000000;
  v34 = &unk_19D6F42CB;
  uint64_t v35 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14;
  uint64_t v29 = __Block_byref_object_dispose__14;
  id v30 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__14;
  id v24 = __Block_byref_object_dispose__14;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke;
  v19[3] = &unk_1E595E440;
  v19[4] = self;
  v19[5] = &v31;
  v19[6] = &v20;
  v19[7] = a2;
  id v15 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke_60;
  v18[3] = &unk_1E595E4B8;
  void v18[8] = a5;
  void v18[9] = a6;
  v18[4] = &state;
  v18[5] = &v31;
  v18[6] = &v20;
  v18[7] = a4;
  v18[10] = a2;
  [v15 getDataWithCompletion:v18];

  if (a7) {
    *a7 = (id) v21[5];
  }
  *a3 = *(id *)(state.opaque[1] + 40);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = ($85CD2974BE96D4886BB301820D1C36C2)v32[4];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v31, 8);
  return v16;
}

void __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 276, v3);
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
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 276;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  $85CD2974BE96D4886BB301820D1C36C2 v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35B78;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 278);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke_60(uint64_t a1, uint64_t a2, void *a3, char a4, int a5, int a6, void *a7)
{
  v31[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  **(unsigned char **)(a1 + 56) = a4;
  $85CD2974BE96D4886BB301820D1C36C2 v16 = *(_DWORD **)(a1 + 72);
  **(_DWORD **)(a1 + 64) = a5;
  _DWORD *v16 = a6;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  if (v15)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v19 = [v15 code];
    v30[0] = *MEMORY[0x1E4F28568];
    uint64_t v20 = NSString;
    if ([v15 code] > 70) {
      uint64_t v21 = 71;
    }
    else {
      uint64_t v21 = [v15 code];
    }
    uint64_t v22 = [v20 stringWithUTF8String:NFResultCodeString_2[v21]];
    uint64_t v23 = *MEMORY[0x1E4F28A50];
    v31[0] = v22;
    v31[1] = v15;
    v30[1] = v23;
    v30[2] = @"Line";
    v31[2] = &unk_1EEF35B90;
    v30[3] = @"Method";
    id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 80)));
    v31[3] = v24;
    v30[4] = *MEMORY[0x1E4F28228];
    id v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 80)), 289);
    v31[4] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
    uint64_t v27 = [v17 initWithDomain:v18 code:v19 userInfo:v26];
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self getHash:a3 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3 trackingError:(id *)a4
{
  id v8 = _os_activity_create(&dword_19D636000, "getHash:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2810000000;
  uint64_t v28 = &unk_19D6F42CB;
  uint64_t v29 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__14;
  uint64_t v23 = __Block_byref_object_dispose__14;
  id v24 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__14;
  uint64_t v18 = __Block_byref_object_dispose__14;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__NFSeshatSession_getHash_trackingError___block_invoke;
  v13[3] = &unk_1E595E440;
  v13[4] = self;
  v13[5] = &v25;
  v13[6] = &v14;
  v13[7] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__NFSeshatSession_getHash_trackingError___block_invoke_67;
  v12[3] = &unk_1E595E4E0;
  v12[4] = &state;
  v12[5] = &v25;
  v12[6] = &v14;
  v12[7] = a2;
  [v9 getHashWithCompletion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  *a3 = *(id *)(state.opaque[1] + 40);
  $85CD2974BE96D4886BB301820D1C36C2 v10 = ($85CD2974BE96D4886BB301820D1C36C2)v26[4];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v25, 8);
  return v10;
}

void __41__NFSeshatSession_getHash_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 320, v3);
  }
  dispatch_get_specific(*v4);
  $85CD2974BE96D4886BB301820D1C36C2 v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 320;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35BA8;
  v27[3] = @"Method";
  id v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 322);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __41__NFSeshatSession_getHash_trackingError___block_invoke_67(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v11 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v12 = [v9 code];
    v23[0] = *MEMORY[0x1E4F28568];
    id v13 = NSString;
    if ([v9 code] > 70) {
      uint64_t v14 = 71;
    }
    else {
      uint64_t v14 = [v9 code];
    }
    id v15 = [v13 stringWithUTF8String:NFResultCodeString_2[v14]];
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    v24[0] = v15;
    v24[1] = v9;
    v23[1] = v16;
    v23[2] = @"Line";
    v24[2] = &unk_1EEF35BC0;
    v23[3] = @"Method";
    id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v24[3] = v17;
    v23[4] = *MEMORY[0x1E4F28228];
    uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 330);
    v24[4] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
    uint64_t v20 = [v10 initWithDomain:v11 code:v12 userInfo:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self upgradeKey:a3 inputData:a4 outWriteCount:a5 trackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6
{
  uint64_t v8 = a3;
  id v11 = a4;
  uint64_t v12 = _os_activity_create(&dword_19D636000, "upgradeKey:inputData:outWriteCount:trackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2810000000;
  v26 = &unk_19D6F42CB;
  uint64_t v27 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__14;
  uint64_t v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke;
  v17[3] = &unk_1E595E440;
  v17[4] = self;
  v17[5] = &v23;
  v17[6] = &state;
  v17[7] = a2;
  id v13 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke_74;
  v16[3] = &unk_1E595E490;
  v16[4] = &v23;
  v16[5] = &state;
  v16[6] = a5;
  v16[7] = a2;
  [v13 upgradeKey:v8 inputData:v11 completion:v16];

  if (a6) {
    *a6 = *(id *)(state.opaque[1] + 40);
  }
  $85CD2974BE96D4886BB301820D1C36C2 v14 = ($85CD2974BE96D4886BB301820D1C36C2)v24[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 364, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    $85CD2974BE96D4886BB301820D1C36C2 v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 364;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35BD8;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 366);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke_74(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v10 = [v7 code];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = NSString;
    if ([v7 code] > 70) {
      uint64_t v12 = 71;
    }
    else {
      uint64_t v12 = [v7 code];
    }
    id v13 = [v11 stringWithUTF8String:NFResultCodeString_2[v12]];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = @"Line";
    v22[2] = &unk_1EEF35BF0;
    v21[3] = @"Method";
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E4F28228];
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 374);
    v22[4] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    uint64_t v18 = [v8 initWithDomain:v9 code:v10 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)obliterate
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(NFSeshatSession *)self obliterateWithTrackingError:0];
}

- ($85CD2974BE96D4886BB301820D1C36C2)obliterateWithTrackingError:(id *)a3
{
  v6 = _os_activity_create(&dword_19D636000, "obliterateWithTrackingError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2810000000;
  uint64_t v20 = &unk_19D6F42CB;
  uint64_t v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  id v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NFSeshatSession_obliterateWithTrackingError___block_invoke;
  v11[3] = &unk_1E595E440;
  v11[4] = self;
  v11[5] = &v17;
  v11[6] = &state;
  v11[7] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__NFSeshatSession_obliterateWithTrackingError___block_invoke_80;
  v10[3] = &unk_1E595E508;
  v10[4] = &v17;
  v10[5] = &state;
  v10[6] = a2;
  [v7 obliterateWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  $85CD2974BE96D4886BB301820D1C36C2 v8 = ($85CD2974BE96D4886BB301820D1C36C2)v18[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__NFSeshatSession_obliterateWithTrackingError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 402, v3);
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
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 402;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 7;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35C08;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 404);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __47__NFSeshatSession_obliterateWithTrackingError___block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v7 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v8 = [v5 code];
    v19[0] = *MEMORY[0x1E4F28568];
    uint64_t v9 = NSString;
    if ([v5 code] > 70) {
      uint64_t v10 = 71;
    }
    else {
      uint64_t v10 = [v5 code];
    }
    id v11 = [v9 stringWithUTF8String:NFResultCodeString_2[v10]];
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    v20[0] = v11;
    v20[1] = v5;
    v19[1] = v12;
    v19[2] = @"Line";
    v20[2] = &unk_1EEF35C20;
    v19[3] = @"Method";
    uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v20[3] = v13;
    v19[4] = *MEMORY[0x1E4F28228];
    uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 411);
    v20[4] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
    uint64_t v16 = [v6 initWithDomain:v7 code:v8 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

+ (BOOL)isTransientError:(id)a3
{
  char v3 = LOBYTE(a3.var0) - 7;
  if (a3.var0 - 7 < 0x12 && ((0x20249u >> v3) & 1) != 0) {
    return (0x1FDB7u >> v3) & 1;
  }
  LOBYTE(v4) = 0;
  if ((int)a3.var1 <= 27263)
  {
    if (a3.var1 == 26368) {
      return v4;
    }
    int v5 = 27010;
  }
  else
  {
    if (a3.var1 - 27264 <= 4 && ((1 << (LOBYTE(a3.var1) + 0x80)) & 0x19) != 0) {
      return v4;
    }
    int v5 = 27392;
  }
  if (a3.var1 != v5) {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (unsigned)smallCrumbsFromError:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 code] << 26;
  int v5 = [v3 userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v7)
  {
    do
    {
      uint64_t v8 = [v7 userInfo];
      uint64_t v9 = [v8 objectForKey:v6];

      if (!v9)
      {
        unsigned int v4 = v4 & 0xFFFFFC0F | (16 * ([v7 code] & 0x3F));
        uint64_t v10 = [v7 userInfo];
        id v11 = [v10 objectForKeyedSubscript:@"Line"];

        if (v11) {
          unsigned int v4 = v4 & 0xFC0003FF | ((unsigned __int16)[v11 shortValue] << 10);
        }
      }
      uint64_t v12 = [v7 userInfo];
      uint64_t v13 = [v12 objectForKey:v6];

      id v7 = (void *)v13;
    }
    while (v13);
  }

  return v4;
}

+ (unint64_t)largeCrumbsFromError:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  id v7 = v5;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    uint64_t v10 = v7;
    do
    {
      [v6 insertObject:v10 atIndex:0];
      id v11 = [v10 userInfo];
      uint64_t v12 = [v11 objectForKey:v9];

      uint64_t v10 = (void *)v12;
    }
    while (v12);
  }
  uint64_t v13 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v15(3, "%c[%{public}s %{public}s]:%i ALL Errors = %{public}@", v18, ClassName, Name, 565, v6);
  }
  dispatch_get_specific(*v13);
  uint64_t v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = object_getClass(a1);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v60 = v21;
    __int16 v61 = 2082;
    v62 = object_getClassName(a1);
    __int16 v63 = 2082;
    v64 = sel_getName(a2);
    __int16 v65 = 1024;
    int v66 = 565;
    __int16 v67 = 2114;
    v68 = v6;
    _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ALL Errors = %{public}@", buf, 0x2Cu);
  }

  if ((unint64_t)[v6 count] < 2)
  {
    uint64_t v22 = 0;
    unint64_t v33 = 0;
  }
  else
  {
    uint64_t v22 = [v6 objectAtIndex:0];
    dispatch_get_specific(*v13);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      id v24 = (void (*)(uint64_t, const char *, ...))v23;
      uint64_t v25 = object_getClass(a1);
      BOOL v26 = class_isMetaClass(v25);
      v54 = object_getClassName(a1);
      v57 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v26) {
        uint64_t v27 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Error 0 = %{public}@", v27, v54, v57, 569, v22);
    }
    dispatch_get_specific(*v13);
    uint64_t v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = object_getClass(a1);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      __int16 v31 = object_getClassName(a1);
      id v32 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v60 = v30;
      __int16 v61 = 2082;
      v62 = v31;
      __int16 v63 = 2082;
      v64 = v32;
      __int16 v65 = 1024;
      int v66 = 569;
      __int16 v67 = 2114;
      v68 = v22;
      _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error 0 = %{public}@", buf, 0x2Cu);
    }

    unint64_t v33 = 16 * ([v22 code] & 0x3F);
    v34 = [v22 userInfo];
    __int16 v35 = [v34 objectForKeyedSubscript:@"Line"];

    if (v35) {
      unint64_t v33 = v33 & 0xFFFFFFFFFF8003FFLL | (([v35 shortValue] & 0x1FFF) << 10);
    }
  }
  if ((unint64_t)[v6 count] < 3)
  {
    int v36 = v22;
  }
  else
  {
    int v36 = [v6 objectAtIndex:1];

    dispatch_get_specific(*v13);
    uint64_t v37 = NFLogGetLogger();
    if (v37)
    {
      id v38 = (void (*)(uint64_t, const char *, ...))v37;
      uint64_t v39 = object_getClass(a1);
      BOOL v40 = class_isMetaClass(v39);
      v55 = object_getClassName(a1);
      v58 = sel_getName(a2);
      uint64_t v41 = 45;
      if (v40) {
        uint64_t v41 = 43;
      }
      v38(3, "%c[%{public}s %{public}s]:%i Error 1 = %{public}@", v41, v55, v58, 581, v36);
    }
    dispatch_get_specific(*v13);
    v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = object_getClass(a1);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      v45 = object_getClassName(a1);
      v46 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v60 = v44;
      __int16 v61 = 2082;
      v62 = v45;
      __int16 v63 = 2082;
      v64 = v46;
      __int16 v65 = 1024;
      int v66 = 581;
      __int16 v67 = 2114;
      v68 = v36;
      _os_log_impl(&dword_19D636000, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error 1 = %{public}@", buf, 0x2Cu);
    }

    unint64_t v33 = v33 & 0xFFFFFFFFC0FFFFFFLL | (([v36 code] & 0x3F) << 24);
    v47 = [v36 userInfo];
    v48 = [v47 objectForKeyedSubscript:@"Line"];

    if (v48) {
      unint64_t v33 = v33 & 0xFFFFF8003FFFFFFFLL | (([v48 shortValue] & 0x1FFF) << 30);
    }
  }
  unint64_t v49 = v33 & 0xFFFC0FFFFFFFFFFFLL | (([v8 code] & 0x3F) << 44);
  v50 = [v8 userInfo];
  v51 = [v50 objectForKeyedSubscript:@"Line"];

  if (v51) {
    v49 |= ([v51 shortValue] & 0x1FFF) << 50;
  }

  return v49;
}

@end