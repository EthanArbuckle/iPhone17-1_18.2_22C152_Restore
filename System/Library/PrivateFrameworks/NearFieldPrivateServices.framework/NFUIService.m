@interface NFUIService
- (BOOL)canRun;
- (id)debugContext;
- (id)serviceName;
- (void)coreNFCUIActivateWithCompletion:(id)a3;
- (void)coreNFCUIInvalidate;
- (void)coreNFCUISetInvalidationHandler:(id)a3;
- (void)coreNFCUISetMode:(int64_t)a3;
- (void)coreNFCUISetScanText:(id)a3;
- (void)coreNFCUITagScannedCount:(int64_t)a3;
- (void)launchBundleWithIdentifier:(id)a3 launchReason:(unint64_t)a4 launchDomain:(int64_t)a5;
- (void)serviceNotificationReceived:(id)a3 error:(id)a4;
- (void)setDebugContext:(id)a3;
@end

@implementation NFUIService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return @"com.apple.stockholm.services.NFUIService";
}

- (void)coreNFCUIActivateWithCompletion:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = @"Action";
  v11[1] = @"UserData";
  debugContext = (__CFString *)self->_debugContext;
  if (!debugContext) {
    debugContext = &stru_270651340;
  }
  v12[0] = @"CoreNFCUI_Activate";
  v12[1] = debugContext;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__NFUIService_coreNFCUIActivateWithCompletion___block_invoke;
  v9[3] = &unk_265429608;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)NFUIService;
  id v7 = v4;
  [(NFPrivateService *)&v8 runService:v6 withCompletion:v9];
}

void __47__NFUIService_coreNFCUIActivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 valueForKey:@"Error"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)coreNFCUITagScannedCount:(int64_t)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  debugContext = (__CFString *)self->_debugContext;
  v10[0] = @"Action";
  v10[1] = @"UserData";
  if (debugContext) {
    v5 = debugContext;
  }
  else {
    v5 = &stru_270651340;
  }
  v11[0] = @"CoreNFCUI_TagCount";
  v11[1] = v5;
  v10[2] = @"Parameter";
  v6 = [NSNumber numberWithInteger:a3];
  void v11[2] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  v9.receiver = self;
  v9.super_class = (Class)NFUIService;
  id v8 = [(NFPrivateService *)&v9 runService:v7];
}

- (void)coreNFCUISetMode:(int64_t)a3
{
  void v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"Action";
  v9[1] = @"UserData";
  debugContext = (__CFString *)self->_debugContext;
  if ((unint64_t)(a3 - 1) >= 3) {
    a3 = 0;
  }
  if (!debugContext) {
    debugContext = &stru_270651340;
  }
  v10[0] = @"CoreNFCUI_Mode";
  v10[1] = debugContext;
  v9[2] = @"Parameter";
  v5 = [NSNumber numberWithInteger:a3];
  v10[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v8.receiver = self;
  v8.super_class = (Class)NFUIService;
  id v7 = [(NFPrivateService *)&v8 runService:v6];
}

- (void)coreNFCUISetScanText:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = @"Action";
    v10[1] = @"UserData";
    debugContext = (__CFString *)self->_debugContext;
    if (!debugContext) {
      debugContext = &stru_270651340;
    }
    v11[0] = @"CoreNFCUI_ScanText";
    v11[1] = debugContext;
    v10[2] = @"Parameter";
    void v11[2] = v4;
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    v9.receiver = self;
    v9.super_class = (Class)NFUIService;
    id v8 = [(NFPrivateService *)&v9 runService:v7];
  }
}

- (void)coreNFCUIInvalidate
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Calling Invalidation for %@", v11, ClassName, Name, 91, self->_debugContext);
  }
  dispatch_get_specific(*v4);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    v15 = object_getClassName(self);
    v16 = sel_getName(a2);
    id debugContext = self->_debugContext;
    *(_DWORD *)buf = 67110146;
    int v25 = v14;
    __int16 v26 = 2082;
    v27 = v15;
    __int16 v28 = 2082;
    v29 = v16;
    __int16 v30 = 1024;
    int v31 = 91;
    __int16 v32 = 2112;
    id v33 = debugContext;
    _os_log_impl(&dword_257348000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Calling Invalidation for %@", buf, 0x2Cu);
  }

  v22[0] = @"Action";
  v22[1] = @"UserData";
  v18 = (__CFString *)self->_debugContext;
  if (!v18) {
    v18 = &stru_270651340;
  }
  v23[0] = @"CoreNFCUI_Invalidate";
  v23[1] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v21.receiver = self;
  v21.super_class = (Class)NFUIService;
  id v20 = [(NFPrivateService *)&v21 runService:v19];
}

- (void)coreNFCUISetInvalidationHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (v5) {
      v13 = "Not NULL";
    }
    else {
      v13 = "NULL";
    }
    v24 = v13;
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i Setting Invalidation Handler to %s for %@", v14, ClassName, Name, 99, v24, self->_debugContext);
  }
  dispatch_get_specific(*v6);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    id debugContext = self->_debugContext;
    if (v5) {
      objc_super v21 = "Not NULL";
    }
    else {
      objc_super v21 = "NULL";
    }
    *(_DWORD *)buf = 67110402;
    int v26 = v17;
    __int16 v27 = 2082;
    __int16 v28 = v18;
    __int16 v29 = 2082;
    __int16 v30 = v19;
    __int16 v31 = 1024;
    int v32 = 99;
    __int16 v33 = 2080;
    uint64_t v34 = v21;
    __int16 v35 = 2112;
    id v36 = debugContext;
    _os_log_impl(&dword_257348000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting Invalidation Handler to %s for %@", buf, 0x36u);
  }

  v22 = (void *)MEMORY[0x25A2B4F10](v5);
  id uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_id uiInvalidationHandler = v22;
}

- (void)serviceNotificationReceived:(id)a3 error:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 objectForKey:@"Action"];
  id v10 = [v7 objectForKey:@"UserData"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v40 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v44 = 45;
      if (isMetaClass) {
        uint64_t v44 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i Error : no action.", v44, ClassName, Name, 110);
    }
    dispatch_get_specific(*v38);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v79 = v46;
      __int16 v80 = 2082;
      v81 = object_getClassName(self);
      __int16 v82 = 2082;
      v83 = sel_getName(a2);
      __int16 v84 = 1024;
      int v85 = 110;
      _os_log_impl(&dword_257348000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : no action.", buf, 0x22u);
    }
    goto LABEL_58;
  }
  if ([v9 isEqualToString:@"CoreNFCUI_Invalidate"])
  {
    uint64_t v11 = [v7 objectForKey:@"Parameter"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = [v11 objectForKey:@"UserCancelled"];
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v13 = NFLogGetLogger();
        if (v13)
        {
          uint64_t v14 = (void (*)(uint64_t, const char *, ...))v13;
          v15 = object_getClass(self);
          BOOL v16 = class_isMetaClass(v15);
          v74 = object_getClassName(self);
          int v17 = sel_getName(a2);
          uint64_t v18 = 45;
          if (v16) {
            uint64_t v18 = 43;
          }
          v14(3, "%c[%{public}s %{public}s]:%i Error : missing user cancel parameter for context pair {local %@, remote %@}", v18, v74, v17, 125, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = object_getClass(self);
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          int v75 = v21;
          v22 = object_getClassName(self);
          v23 = sel_getName(a2);
          id debugContext = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          int v79 = v75;
          __int16 v80 = 2082;
          v81 = v22;
          __int16 v82 = 2082;
          v83 = v23;
          __int16 v84 = 1024;
          int v85 = 125;
          __int16 v86 = 2112;
          id v87 = debugContext;
          __int16 v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_257348000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : missing user cancel parameter for context pair {local %@, remote %@}", buf, 0x36u);
        }
      }
      id uiInvalidationHandler = self->_uiInvalidationHandler;
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v26 = NFLogGetLogger();
      __int16 v27 = (void (*)(uint64_t, const char *, ...))v26;
      if (uiInvalidationHandler)
      {
        if (v26)
        {
          __int16 v28 = object_getClass(self);
          BOOL v29 = class_isMetaClass(v28);
          v72 = object_getClassName(self);
          __int16 v30 = sel_getName(a2);
          uint64_t v31 = 45;
          if (v29) {
            uint64_t v31 = 43;
          }
          v27(6, "%c[%{public}s %{public}s]:%i Invoking Invalidation handler  for context pair {local %@, remote %@}", v31, v72, v30, 129, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        int v32 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v33 = object_getClass(self);
          if (class_isMetaClass(v33)) {
            int v34 = 43;
          }
          else {
            int v34 = 45;
          }
          int v73 = v34;
          __int16 v35 = object_getClassName(self);
          id v36 = sel_getName(a2);
          id v37 = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          int v79 = v73;
          __int16 v80 = 2082;
          v81 = v35;
          __int16 v82 = 2082;
          v83 = v36;
          __int16 v84 = 1024;
          int v85 = 129;
          __int16 v86 = 2112;
          id v87 = v37;
          __int16 v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_257348000, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking Invalidation handler  for context pair {local %@, remote %@}", buf, 0x36u);
        }

        (*((void (**)(id, id, uint64_t))self->_uiInvalidationHandler + 2))(self->_uiInvalidationHandler, v8, [v12 BOOLValue]);
      }
      else
      {
        if (v26)
        {
          v61 = object_getClass(self);
          BOOL v62 = class_isMetaClass(v61);
          v76 = object_getClassName(self);
          v63 = sel_getName(a2);
          uint64_t v64 = 45;
          if (v62) {
            uint64_t v64 = 43;
          }
          v27(6, "%c[%{public}s %{public}s]:%i No Invalidation handler set for context pair {local %@, remote %@}", v64, v76, v63, 132, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v65 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = object_getClass(self);
          if (class_isMetaClass(v66)) {
            int v67 = 43;
          }
          else {
            int v67 = 45;
          }
          int v77 = v67;
          v68 = object_getClassName(self);
          v69 = sel_getName(a2);
          id v70 = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          int v79 = v77;
          __int16 v80 = 2082;
          v81 = v68;
          __int16 v82 = 2082;
          v83 = v69;
          __int16 v84 = 1024;
          int v85 = 132;
          __int16 v86 = 2112;
          id v87 = v70;
          __int16 v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_257348000, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No Invalidation handler set for context pair {local %@, remote %@}", buf, 0x36u);
        }
      }
    }
    else
    {
      v47 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v48 = NFLogGetLogger();
      if (v48)
      {
        v49 = (void (*)(uint64_t, const char *, ...))v48;
        v50 = object_getClass(self);
        BOOL v51 = class_isMetaClass(v50);
        v52 = object_getClassName(self);
        v53 = sel_getName(a2);
        BOOL v54 = !v51;
        v47 = (const void **)MEMORY[0x263F8C6C0];
        uint64_t v55 = 45;
        if (!v54) {
          uint64_t v55 = 43;
        }
        v49(3, "%c[%{public}s %{public}s]:%i Error : no parameter for context pair {local %@, remote %@}", v55, v52, v53, 119, self->_debugContext, v10);
      }
      dispatch_get_specific(*v47);
      v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        v58 = object_getClassName(self);
        v59 = sel_getName(a2);
        id v60 = self->_debugContext;
        *(_DWORD *)buf = 67110402;
        int v79 = v57;
        __int16 v80 = 2082;
        v81 = v58;
        __int16 v82 = 2082;
        v83 = v59;
        __int16 v84 = 1024;
        int v85 = 119;
        __int16 v86 = 2112;
        id v87 = v60;
        __int16 v88 = 2112;
        v89 = v10;
        _os_log_impl(&dword_257348000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : no parameter for context pair {local %@, remote %@}", buf, 0x36u);
      }
    }

LABEL_58:
  }
}

- (void)launchBundleWithIdentifier:(id)a3 launchReason:(unint64_t)a4 launchDomain:(int64_t)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = NFSharedSignpostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  v12 = NFSharedSignpostLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)id v37 = a4;
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = a5;
    _os_signpost_emit_with_name_impl(&dword_257348000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "launchBundleWithIdentifier", "reason=%lu, domain=%lu", buf, 0x16u);
  }

  if (v9)
  {
    v34[0] = @"Action";
    v34[1] = @"launchBundleIdentifier";
    v35[0] = @"launchBundle";
    v35[1] = v9;
    v34[2] = @"launchReason";
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
    v35[2] = v14;
    v34[3] = @"walletDomain";
    v15 = [NSNumber numberWithInteger:a5];
    v35[3] = v15;
    BOOL v16 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __68__NFUIService_launchBundleWithIdentifier_launchReason_launchDomain___block_invoke;
    v33[3] = &unk_265429630;
    v33[4] = self;
    v33[5] = a2;
    v33[6] = v11;
    v32.receiver = self;
    v32.super_class = (Class)NFUIService;
    [(NFPrivateService *)&v32 runService:v16 withCompletion:v33];
  }
  else
  {
    int v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Invalid bundleIdentifier parameter", v23, ClassName, Name, 150);
    }
    dispatch_get_specific(*v17);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      __int16 v27 = object_getClassName(self);
      __int16 v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v37 = v26;
      *(_WORD *)&v37[4] = 2082;
      *(void *)&v37[6] = v27;
      *(_WORD *)&v37[14] = 2082;
      *(void *)&v37[16] = v28;
      __int16 v38 = 1024;
      int v39 = 150;
      _os_log_impl(&dword_257348000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid bundleIdentifier parameter", buf, 0x22u);
    }

    BOOL v29 = NFSharedSignpostLog();
    __int16 v30 = v29;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_257348000, v30, OS_SIGNPOST_INTERVAL_END, v11, "launchBundleWithIdentifier", "", buf, 2u);
    }
  }
}

void __68__NFUIService_launchBundleWithIdentifier_launchReason_launchDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!+[NFPrivateService isResultSuccessful:a2])
  {
    id v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Launch error", v9, ClassName, Name, 162);
    }
    dispatch_get_specific(*v3);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v20 = v12;
      __int16 v21 = 2082;
      v22 = v13;
      __int16 v23 = 2082;
      v24 = v14;
      __int16 v25 = 1024;
      int v26 = 162;
      _os_log_impl(&dword_257348000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Launch error", buf, 0x22u);
    }
  }
  v15 = NFSharedSignpostLog();
  BOOL v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 48);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_257348000, v16, OS_SIGNPOST_INTERVAL_END, v17, "launchBundleWithIdentifier", "", buf, 2u);
  }
}

- (id)debugContext
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDebugContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debugContext, 0);
  objc_storeStrong(&self->_uiInvalidationHandler, 0);
}

@end