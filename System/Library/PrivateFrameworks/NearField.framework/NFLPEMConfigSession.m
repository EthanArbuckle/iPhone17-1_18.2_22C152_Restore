@interface NFLPEMConfigSession
- (BOOL)configureHardwareForLPEMWithError:(id *)a3;
- (BOOL)disableLPEMFeature:(unint64_t)a3 error:(id *)a4;
- (BOOL)enableLPEMFeature:(unint64_t)a3 error:(id *)a4;
- (id)getAndClearLPEMBluetoothLogWithError:(id *)a3;
- (id)getLPEMBluetoothLogWithError:(id *)a3;
- (unint64_t)getLPEMFeaturesWithError:(id *)a3;
@end

@implementation NFLPEMConfigSession

- (BOOL)configureHardwareForLPEMWithError:(id *)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__17;
  v14 = __Block_byref_object_dispose__17;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = self;
  v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke_28;
  v8[3] = &unk_1E595E930;
  v8[4] = &v10;
  v8[5] = a2;
  [v5 configureHardwareForLPEMWithCompletion:v8];

  if (a3) {
    *a3 = (id) v11[5];
  }
  BOOL v6 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 25, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 25;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35C38;
  v27[3] = @"Method";
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 26);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke_28(uint64_t a1, void *a2)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    v5 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v6 = [v3 code];
    v17[0] = *MEMORY[0x1E4F28568];
    v7 = NSString;
    if ([v3 code] > 70) {
      uint64_t v8 = 71;
    }
    else {
      uint64_t v8 = [v3 code];
    }
    uint64_t v9 = [v7 stringWithUTF8String:NFResultCodeString_3[v8]];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v18[0] = v9;
    v18[1] = v3;
    v17[1] = v10;
    v17[2] = @"Line";
    v18[2] = &unk_1EEF35C50;
    v17[3] = @"Method";
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v18[3] = v11;
    v17[4] = *MEMORY[0x1E4F28228];
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 31);
    v18[4] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    uint64_t v14 = [v4 initWithDomain:v5 code:v6 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)disableLPEMFeature:(unint64_t)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke_33;
  v10[3] = &unk_1E595E930;
  v10[4] = &v12;
  v10[5] = a2;
  [v7 disableLPEMFeature:a3 completion:v10];

  if (a4) {
    *a4 = (id) v13[5];
  }
  BOOL v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 52, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
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
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 52;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35C68;
  v27[3] = @"Method";
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 53);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke_33(uint64_t a1, void *a2)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    v5 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v6 = [v3 code];
    v17[0] = *MEMORY[0x1E4F28568];
    v7 = NSString;
    if ([v3 code] > 70) {
      uint64_t v8 = 71;
    }
    else {
      uint64_t v8 = [v3 code];
    }
    uint64_t v9 = [v7 stringWithUTF8String:NFResultCodeString_3[v8]];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v18[0] = v9;
    v18[1] = v3;
    v17[1] = v10;
    v17[2] = @"Line";
    v18[2] = &unk_1EEF35C80;
    v17[3] = @"Method";
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v18[3] = v11;
    v17[4] = *MEMORY[0x1E4F28228];
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 58);
    v18[4] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    uint64_t v14 = [v4 initWithDomain:v5 code:v6 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)enableLPEMFeature:(unint64_t)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__17;
  id v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  uint64_t v8 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke_38;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &v13;
  v11[6] = a2;
  v11[4] = self;
  [v8 enableLPEMFeature:a3 completion:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 79, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    v34 = v14;
    __int16 v35 = 1024;
    int v36 = 79;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35C98;
  v27[3] = @"Method";
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 80);
  v28[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 85, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v33 = v12;
      __int16 v34 = 2082;
      __int16 v35 = v13;
      __int16 v36 = 2082;
      __int16 v37 = v14;
      __int16 v38 = 1024;
      int v39 = 85;
      __int16 v40 = 2112;
      id v41 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v17 = [v3 code];
    v30[0] = *MEMORY[0x1E4F28568];
    uint64_t v18 = NSString;
    if ([v3 code] > 70) {
      uint64_t v19 = 71;
    }
    else {
      uint64_t v19 = [v3 code];
    }
    v20 = [v18 stringWithUTF8String:NFResultCodeString_3[v19]];
    uint64_t v21 = *MEMORY[0x1E4F28A50];
    v31[0] = v20;
    v31[1] = v3;
    v30[1] = v21;
    v30[2] = @"Line";
    v31[2] = &unk_1EEF35CB0;
    v30[3] = @"Method";
    uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v31[3] = v22;
    v30[4] = *MEMORY[0x1E4F28228];
    uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 86);
    v31[4] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
    uint64_t v25 = [v15 initWithDomain:v16 code:v17 userInfo:v24];
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
}

- (unint64_t)getLPEMFeaturesWithError:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__17;
  uint64_t v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &v15;
  void v10[6] = a2;
  v10[4] = self;
  uint64_t v6 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke_44;
  v9[3] = &unk_1E595E958;
  v9[4] = self;
  v9[5] = &v15;
  v9[6] = &v11;
  void v9[7] = a2;
  [v6 getLPEMFeaturesWithCompletion:v9];

  if (a3) {
    *a3 = (id) v16[5];
  }
  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 108, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    __int16 v34 = v14;
    __int16 v35 = 1024;
    int v36 = 108;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35CC8;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 109);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke_44(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 114, v5);
    }
    dispatch_get_specific(*v6);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      id v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v35 = v14;
      __int16 v36 = 2082;
      __int16 v37 = v15;
      __int16 v38 = 2082;
      uint64_t v39 = v16;
      __int16 v40 = 1024;
      int v41 = 114;
      __int16 v42 = 2112;
      id v43 = v5;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v19 = [v5 code];
    v32[0] = *MEMORY[0x1E4F28568];
    id v20 = NSString;
    if ([v5 code] > 70) {
      uint64_t v21 = 71;
    }
    else {
      uint64_t v21 = [v5 code];
    }
    uint64_t v22 = [v20 stringWithUTF8String:NFResultCodeString_3[v21]];
    uint64_t v23 = *MEMORY[0x1E4F28A50];
    v33[0] = v22;
    v33[1] = v5;
    v32[1] = v23;
    v32[2] = @"Line";
    v33[2] = &unk_1EEF35CE0;
    v32[3] = @"Method";
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v33[3] = v24;
    v32[4] = *MEMORY[0x1E4F28228];
    uint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 115);
    v33[4] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
    uint64_t v27 = [v17 initWithDomain:v18 code:v19 userInfo:v26];
    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

- (id)getLPEMBluetoothLogWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__17;
  uint64_t v21 = __Block_byref_object_dispose__17;
  id v22 = 0;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__17;
  id v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &v17;
  void v10[6] = a2;
  v10[4] = self;
  uint64_t v6 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke_50;
  v9[3] = &unk_1E595DC40;
  v9[4] = self;
  v9[5] = &v17;
  v9[6] = &v11;
  void v9[7] = a2;
  [v6 getLPEMBluetoothLog:0 withCompletion:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 141, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    __int16 v34 = v14;
    __int16 v35 = 1024;
    int v36 = 141;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35CF8;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 142);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %@", v12, ClassName, Name, 146, v5);
    }
    dispatch_get_specific(*v7);
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
      id v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v36 = v15;
      __int16 v37 = 2082;
      id v38 = v16;
      __int16 v39 = 2082;
      __int16 v40 = v17;
      __int16 v41 = 1024;
      int v42 = 146;
      __int16 v43 = 2112;
      id v44 = v5;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v20 = [v5 code];
    v33[0] = *MEMORY[0x1E4F28568];
    uint64_t v21 = NSString;
    if ([v5 code] > 70) {
      uint64_t v22 = 71;
    }
    else {
      uint64_t v22 = [v5 code];
    }
    uint64_t v23 = [v21 stringWithUTF8String:NFResultCodeString_3[v22]];
    uint64_t v24 = *MEMORY[0x1E4F28A50];
    v34[0] = v23;
    v34[1] = v5;
    v33[1] = v24;
    v33[2] = @"Line";
    v34[2] = &unk_1EEF35D10;
    v33[3] = @"Method";
    uint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v34[3] = v25;
    v33[4] = *MEMORY[0x1E4F28228];
    uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 147);
    v34[4] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
    uint64_t v28 = [v18 initWithDomain:v19 code:v20 userInfo:v27];
    uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
    int v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

- (id)getAndClearLPEMBluetoothLogWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__17;
  uint64_t v21 = __Block_byref_object_dispose__17;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__17;
  int v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &v17;
  void v10[6] = a2;
  v10[4] = self;
  id v6 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke_56;
  v9[3] = &unk_1E595DC40;
  v9[4] = self;
  v9[5] = &v17;
  v9[6] = &v11;
  void v9[7] = a2;
  [v6 getLPEMBluetoothLog:1 withCompletion:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 173, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    v32 = v13;
    __int16 v33 = 2082;
    __int16 v34 = v14;
    __int16 v35 = 1024;
    int v36 = 173;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF35D28;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 174);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %@", v12, ClassName, Name, 178, v5);
    }
    dispatch_get_specific(*v7);
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
      id v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v36 = v15;
      __int16 v37 = 2082;
      id v38 = v16;
      __int16 v39 = 2082;
      __int16 v40 = v17;
      __int16 v41 = 1024;
      int v42 = 178;
      __int16 v43 = 2112;
      id v44 = v5;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v20 = [v5 code];
    v33[0] = *MEMORY[0x1E4F28568];
    uint64_t v21 = NSString;
    if ([v5 code] > 70) {
      uint64_t v22 = 71;
    }
    else {
      uint64_t v22 = [v5 code];
    }
    uint64_t v23 = [v21 stringWithUTF8String:NFResultCodeString_3[v22]];
    uint64_t v24 = *MEMORY[0x1E4F28A50];
    v34[0] = v23;
    v34[1] = v5;
    v33[1] = v24;
    v33[2] = @"Line";
    v34[2] = &unk_1EEF35D40;
    v33[3] = @"Method";
    uint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v34[3] = v25;
    v33[4] = *MEMORY[0x1E4F28228];
    uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 179);
    v34[4] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
    uint64_t v28 = [v18 initWithDomain:v19 code:v20 userInfo:v27];
    uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
    int v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

@end