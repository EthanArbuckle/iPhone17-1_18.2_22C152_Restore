@interface NFStorageService
- (BOOL)canRun;
- (id)fetchAppletEntitiesWithError:(id *)a3;
- (id)fetchESEExpressEntitiesWithError:(id *)a3;
- (id)serviceName;
- (id)updateAppletEntitiesWithConfig:(id)a3;
- (void)deleteAllAppletEntities;
- (void)deleteAllESEExpressEntities;
- (void)updateESEExpressEntitiesWithConfig:(id)a3;
@end

@implementation NFStorageService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return @"com.apple.stockholm.services.NFStorageServer";
}

- (id)fetchESEExpressEntitiesWithError:(id *)a3
{
  v126[4] = *MEMORY[0x263EF8340];
  v107.receiver = self;
  v107.super_class = (Class)NFStorageService;
  v6 = [(NFPrivateService *)&v107 runService:&unk_270651FE8];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v23(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v27, ClassName, Name, 46);
    }
    dispatch_get_specific(*v21);
    v28 = NFSharedLogGetLogger();
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
      int v116 = v30;
      __int16 v117 = 2082;
      v118 = v31;
      __int16 v119 = 2082;
      v120 = v32;
      __int16 v121 = 1024;
      int v122 = 46;
      _os_log_impl(&dword_257348000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }

    if (!a3)
    {
      v20 = 0;
      goto LABEL_52;
    }
    id v33 = objc_alloc(MEMORY[0x263F087E8]);
    id v19 = [NSString stringWithUTF8String:"nfcd"];
    v125[0] = *MEMORY[0x263F08320];
    id v7 = [NSString stringWithUTF8String:"Unexpected Result"];
    v126[0] = v7;
    v126[1] = &unk_270652088;
    v125[1] = @"Line";
    v125[2] = @"Method";
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v126[2] = v34;
    v125[3] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 47);
    v126[3] = v35;
    v36 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];
    *a3 = (id)[v33 initWithDomain:v19 code:13 userInfo:v36];

    goto LABEL_50;
  }
  id v7 = [v6 valueForKey:@"Error"];
  if (!v7)
  {
    uint64_t v37 = [v6 valueForKey:@"Reply"];
    if (v37)
    {
      id v19 = (id)v37;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v19 = v19;
        uint64_t v38 = [v19 countByEnumeratingWithState:&v103 objects:v110 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v104;
          while (2)
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v104 != v40) {
                objc_enumerationMutation(v19);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v76 = (const void **)MEMORY[0x263F8C6C0];
                dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
                uint64_t v77 = NFLogGetLogger();
                if (v77)
                {
                  v78 = (void (*)(uint64_t, const char *, ...))v77;
                  v79 = object_getClass(self);
                  BOOL v80 = class_isMetaClass(v79);
                  v81 = object_getClassName(self);
                  v99 = sel_getName(a2);
                  uint64_t v82 = 45;
                  if (v80) {
                    uint64_t v82 = 43;
                  }
                  v78(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v82, v81, v99, 73);
                }
                dispatch_get_specific(*v76);
                v83 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                {
                  v84 = object_getClass(self);
                  if (class_isMetaClass(v84)) {
                    int v85 = 43;
                  }
                  else {
                    int v85 = 45;
                  }
                  v86 = object_getClassName(self);
                  v87 = sel_getName(a2);
                  *(_DWORD *)buf = 67109890;
                  int v116 = v85;
                  __int16 v117 = 2082;
                  v118 = v86;
                  __int16 v119 = 2082;
                  v120 = v87;
                  __int16 v121 = 1024;
                  int v122 = 73;
                  _os_log_impl(&dword_257348000, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
                }

                if (a3)
                {
                  id v102 = objc_alloc(MEMORY[0x263F087E8]);
                  v88 = [NSString stringWithUTF8String:"nfcd"];
                  v108[0] = *MEMORY[0x263F08320];
                  v89 = [NSString stringWithUTF8String:"Invalid Parameter"];
                  v109[0] = v89;
                  v109[1] = &unk_2706520D0;
                  v108[1] = @"Line";
                  v108[2] = @"Method";
                  v90 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
                  v109[2] = v90;
                  v108[3] = *MEMORY[0x263F07F80];
                  v91 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 74);
                  v109[3] = v91;
                  v92 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:4];
                  *a3 = (id)[v102 initWithDomain:v88 code:10 userInfo:v92];
                }
                goto LABEL_50;
              }
            }
            uint64_t v39 = [v19 countByEnumeratingWithState:&v103 objects:v110 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }

        id v19 = v19;
        v20 = v19;
        goto LABEL_51;
      }
      v60 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v61 = NFLogGetLogger();
      if (v61)
      {
        v62 = (void (*)(uint64_t, const char *, ...))v61;
        v63 = object_getClass(self);
        BOOL v64 = class_isMetaClass(v63);
        v100 = object_getClassName(self);
        v98 = sel_getName(a2);
        uint64_t v65 = 45;
        if (v64) {
          uint64_t v65 = 43;
        }
        v62(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v65, v100, v98, 66);
      }
      dispatch_get_specific(*v60);
      v66 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67)) {
          int v68 = 43;
        }
        else {
          int v68 = 45;
        }
        v69 = object_getClassName(self);
        v70 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v116 = v68;
        __int16 v117 = 2082;
        v118 = v69;
        __int16 v119 = 2082;
        v120 = v70;
        __int16 v121 = 1024;
        int v122 = 66;
        _os_log_impl(&dword_257348000, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
      }

      if (a3)
      {
        id v101 = objc_alloc(MEMORY[0x263F087E8]);
        v71 = [NSString stringWithUTF8String:"nfcd"];
        v111[0] = *MEMORY[0x263F08320];
        v72 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v112[0] = v72;
        v112[1] = &unk_2706520B8;
        v111[1] = @"Line";
        v111[2] = @"Method";
        v73 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
        v112[2] = v73;
        v111[3] = *MEMORY[0x263F07F80];
        v74 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 67);
        v112[3] = v74;
        v75 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
        *a3 = (id)[v101 initWithDomain:v71 code:10 userInfo:v75];
      }
      goto LABEL_50;
    }
    v42 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v43 = NFLogGetLogger();
    if (v43)
    {
      v44 = (void (*)(uint64_t, const char *, ...))v43;
      v45 = object_getClass(self);
      BOOL v46 = class_isMetaClass(v45);
      v94 = object_getClassName(self);
      v97 = sel_getName(a2);
      uint64_t v47 = 45;
      if (v46) {
        uint64_t v47 = 43;
      }
      v44(3, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", v47, v94, v97, 60, 0);
    }
    dispatch_get_specific(*v42);
    v48 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49)) {
        int v50 = 43;
      }
      else {
        int v50 = 45;
      }
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v116 = v50;
      __int16 v117 = 2082;
      v118 = v51;
      __int16 v119 = 2082;
      v120 = v52;
      __int16 v121 = 1024;
      int v122 = 60;
      __int16 v123 = 2112;
      id v124 = 0;
      _os_log_impl(&dword_257348000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", buf, 0x2Cu);
    }

    if (a3)
    {
      id v53 = objc_alloc(MEMORY[0x263F087E8]);
      v54 = [NSString stringWithUTF8String:"nfcd"];
      v113[0] = *MEMORY[0x263F08320];
      v55 = [NSString stringWithUTF8String:"Missing Parameter"];
      v114[0] = v55;
      v114[1] = &unk_2706520A0;
      v113[1] = @"Line";
      v113[2] = @"Method";
      v56 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v114[2] = v56;
      v113[3] = *MEMORY[0x263F07F80];
      v57 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 61);
      v114[3] = v57;
      v58 = [NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:4];
      *a3 = (id)[v53 initWithDomain:v54 code:9 userInfo:v58];
    }
    goto LABEL_49;
  }
  v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(self);
    BOOL v12 = class_isMetaClass(v11);
    v93 = object_getClassName(self);
    v95 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v12) {
      uint64_t v13 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v13, v93, v95, 53, v7);
  }
  dispatch_get_specific(*v8);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    v17 = object_getClassName(self);
    v18 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v116 = v16;
    __int16 v117 = 2082;
    v118 = v17;
    __int16 v119 = 2082;
    v120 = v18;
    __int16 v121 = 1024;
    int v122 = 53;
    __int16 v123 = 2112;
    id v124 = v7;
    _os_log_impl(&dword_257348000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
  }

  if (!a3)
  {
LABEL_49:
    id v19 = 0;
LABEL_50:
    v20 = 0;
    goto LABEL_51;
  }
  id v7 = v7;
  id v19 = 0;
  v20 = 0;
  *a3 = v7;
LABEL_51:

LABEL_52:
  return v20;
}

- (void)updateESEExpressEntitiesWithConfig:(id)a3
{
  v46[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v45[0] = @"Operation";
  v45[1] = @"Model";
  v46[0] = @"Update";
  v46[1] = @"Express";
  v45[2] = @"Config";
  v46[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  v34.receiver = self;
  v34.super_class = (Class)NFStorageService;
  id v7 = [(NFPrivateService *)&v34 runService:v6];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v7 valueForKey:@"Error"];
    if (v8)
    {
      uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v14, ClassName, Name, 98, v8);
      }
      dispatch_get_specific(*v9);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(self);
        id v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v36 = v17;
        __int16 v37 = 2082;
        uint64_t v38 = v18;
        __int16 v39 = 2082;
        uint64_t v40 = v19;
        __int16 v41 = 1024;
        int v42 = 98;
        __int16 v43 = 2112;
        v44 = v8;
        _os_log_impl(&dword_257348000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    v20 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      id v33 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v26, v25, v33, 92);
    }
    dispatch_get_specific(*v20);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      v29 = object_getClassName(self);
      int v30 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v36 = v28;
      __int16 v37 = 2082;
      uint64_t v38 = v29;
      __int16 v39 = 2082;
      uint64_t v40 = v30;
      __int16 v41 = 1024;
      int v42 = 92;
      _os_log_impl(&dword_257348000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }
}

- (void)deleteAllESEExpressEntities
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)NFStorageService;
  v4 = [(NFPrivateService *)&v31 runService:&unk_270652010];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 valueForKey:@"Error"];
    if (v5)
    {
      v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v8(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v11, ClassName, Name, 118, v5);
      }
      dispatch_get_specific(*v6);
      BOOL v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = object_getClass(self);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        v15 = object_getClassName(self);
        int v16 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v33 = v14;
        __int16 v34 = 2082;
        v35 = v15;
        __int16 v36 = 2082;
        __int16 v37 = v16;
        __int16 v38 = 1024;
        int v39 = 118;
        __int16 v40 = 2112;
        __int16 v41 = v5;
        _os_log_impl(&dword_257348000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    int v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      id v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      v22 = object_getClassName(self);
      int v30 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v23, v22, v30, 112);
    }
    dispatch_get_specific(*v17);
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      uint64_t v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v33 = v25;
      __int16 v34 = 2082;
      v35 = v26;
      __int16 v36 = 2082;
      __int16 v37 = v27;
      __int16 v38 = 1024;
      int v39 = 112;
      _os_log_impl(&dword_257348000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }
}

- (id)fetchAppletEntitiesWithError:(id *)a3
{
  v97[4] = *MEMORY[0x263EF8340];
  v81.receiver = self;
  v81.super_class = (Class)NFStorageService;
  v6 = [(NFPrivateService *)&v81 runService:&unk_270652038];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v27, ClassName, Name, 136);
    }
    dispatch_get_specific(*v21);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      objc_super v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v87 = v30;
      __int16 v88 = 2082;
      v89 = v31;
      __int16 v90 = 2082;
      v91 = v32;
      __int16 v92 = 1024;
      int v93 = 136;
      _os_log_impl(&dword_257348000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }

    if (!a3)
    {
      v20 = 0;
      goto LABEL_44;
    }
    id v33 = objc_alloc(MEMORY[0x263F087E8]);
    id v19 = [NSString stringWithUTF8String:"nfcd"];
    v96[0] = *MEMORY[0x263F08320];
    id v7 = [NSString stringWithUTF8String:"Unexpected Result"];
    v97[0] = v7;
    v97[1] = &unk_2706520E8;
    v96[1] = @"Line";
    v96[2] = @"Method";
    __int16 v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v97[2] = v34;
    v96[3] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 137);
    v97[3] = v35;
    __int16 v36 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:4];
    *a3 = (id)[v33 initWithDomain:v19 code:13 userInfo:v36];

    goto LABEL_42;
  }
  id v7 = [v6 valueForKey:@"Error"];
  if (!v7)
  {
    uint64_t v37 = [v6 valueForKey:@"Reply"];
    if (v37)
    {
      id v19 = (id)v37;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v19;
        v20 = v19;
        goto LABEL_43;
      }
      v58 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v59 = NFLogGetLogger();
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        uint64_t v61 = object_getClass(self);
        BOOL v62 = class_isMetaClass(v61);
        v79 = object_getClassName(self);
        v78 = sel_getName(a2);
        BOOL v44 = !v62;
        v58 = (const void **)MEMORY[0x263F8C6C0];
        uint64_t v63 = 45;
        if (!v44) {
          uint64_t v63 = 43;
        }
        v60(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v63, v79, v78, 156);
      }
      dispatch_get_specific(*v58);
      BOOL v64 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = object_getClass(self);
        if (class_isMetaClass(v65)) {
          int v66 = 43;
        }
        else {
          int v66 = 45;
        }
        v67 = object_getClassName(self);
        int v68 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v87 = v66;
        __int16 v88 = 2082;
        v89 = v67;
        __int16 v90 = 2082;
        v91 = v68;
        __int16 v92 = 1024;
        int v93 = 156;
        _os_log_impl(&dword_257348000, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
      }

      if (a3)
      {
        id v80 = objc_alloc(MEMORY[0x263F087E8]);
        v69 = [NSString stringWithUTF8String:"nfcd"];
        v82[0] = *MEMORY[0x263F08320];
        v70 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v83[0] = v70;
        v83[1] = &unk_270652118;
        v82[1] = @"Line";
        v82[2] = @"Method";
        v71 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
        v83[2] = v71;
        v82[3] = *MEMORY[0x263F07F80];
        v72 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 157);
        v83[3] = v72;
        v73 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:4];
        *a3 = (id)[v80 initWithDomain:v69 code:10 userInfo:v73];
      }
LABEL_42:
      v20 = 0;
      goto LABEL_43;
    }
    __int16 v38 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      __int16 v40 = (void (*)(uint64_t, const char *, ...))v39;
      __int16 v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      __int16 v43 = object_getClassName(self);
      uint64_t v77 = sel_getName(a2);
      BOOL v44 = !v42;
      __int16 v38 = (const void **)MEMORY[0x263F8C6C0];
      uint64_t v45 = 45;
      if (!v44) {
        uint64_t v45 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", v45, v43, v77, 150, 0);
    }
    dispatch_get_specific(*v38);
    BOOL v46 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = object_getClass(self);
      if (class_isMetaClass(v47)) {
        int v48 = 43;
      }
      else {
        int v48 = 45;
      }
      v49 = object_getClassName(self);
      int v50 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v87 = v48;
      __int16 v88 = 2082;
      v89 = v49;
      __int16 v90 = 2082;
      v91 = v50;
      __int16 v92 = 1024;
      int v93 = 150;
      __int16 v94 = 2112;
      id v95 = 0;
      _os_log_impl(&dword_257348000, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", buf, 0x2Cu);
    }

    if (a3)
    {
      id v51 = objc_alloc(MEMORY[0x263F087E8]);
      v52 = [NSString stringWithUTF8String:"nfcd"];
      v84[0] = *MEMORY[0x263F08320];
      id v53 = [NSString stringWithUTF8String:"Missing Parameter"];
      v85[0] = v53;
      v85[1] = &unk_270652100;
      v84[1] = @"Line";
      v84[2] = @"Method";
      v54 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v85[2] = v54;
      v84[3] = *MEMORY[0x263F07F80];
      v55 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 151);
      v85[3] = v55;
      v56 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:4];
      *a3 = (id)[v51 initWithDomain:v52 code:9 userInfo:v56];
    }
LABEL_41:
    id v19 = 0;
    goto LABEL_42;
  }
  v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    uint64_t v11 = object_getClass(self);
    BOOL v12 = class_isMetaClass(v11);
    v74 = object_getClassName(self);
    v75 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v12) {
      uint64_t v13 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v13, v74, v75, 143, v7);
  }
  dispatch_get_specific(*v8);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(self);
    uint64_t v18 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v87 = v16;
    __int16 v88 = 2082;
    v89 = v17;
    __int16 v90 = 2082;
    v91 = v18;
    __int16 v92 = 1024;
    int v93 = 143;
    __int16 v94 = 2112;
    id v95 = v7;
    _os_log_impl(&dword_257348000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
  }

  if (!a3) {
    goto LABEL_41;
  }
  id v7 = v7;
  id v19 = 0;
  v20 = 0;
  *a3 = v7;
LABEL_43:

LABEL_44:
  return v20;
}

- (id)updateAppletEntitiesWithConfig:(id)a3
{
  v64[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v63[0] = @"Operation";
  v63[1] = @"Model";
  v64[0] = @"Update";
  v64[1] = @"Applets";
  v63[2] = @"Config";
  v64[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];
  v48.receiver = self;
  v48.super_class = (Class)NFStorageService;
  id v7 = [(NFPrivateService *)&v48 runService:v6];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v7 valueForKey:@"Error"];
    if (!v8)
    {
      uint64_t v39 = 0;
      goto LABEL_29;
    }
    uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v14, ClassName, Name, 180, v8);
    }
    dispatch_get_specific(*v9);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      uint64_t v18 = object_getClassName(self);
      id v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v52 = v17;
      __int16 v53 = 2082;
      v54 = v18;
      __int16 v55 = 2082;
      v56 = v19;
      __int16 v57 = 1024;
      int v58 = 180;
      __int16 v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_257348000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
    }

    id v47 = objc_alloc(MEMORY[0x263F087E8]);
    v20 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v46 = [v8 code];
    v49[0] = *MEMORY[0x263F08320];
    BOOL v21 = NSString;
    if ([v8 code] > 70) {
      uint64_t v22 = 71;
    }
    else {
      uint64_t v22 = [v8 code];
    }
    __int16 v36 = [v21 stringWithUTF8String:NFResultCodeString[v22]];
    uint64_t v40 = *MEMORY[0x263F08608];
    v50[0] = v36;
    v50[1] = v8;
    v49[1] = v40;
    v49[2] = @"Line";
    v50[2] = &unk_270652148;
    v49[3] = @"Method";
    uint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v50[3] = v37;
    v49[4] = *MEMORY[0x263F07F80];
    __int16 v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 181);
    v50[4] = v38;
    __int16 v41 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
    uint64_t v39 = (void *)[v47 initWithDomain:v20 code:v46 userInfo:v41];
  }
  else
  {
    uint64_t v23 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      int v25 = (void (*)(uint64_t, const char *, ...))v24;
      uint64_t v26 = object_getClass(self);
      BOOL v27 = class_isMetaClass(v26);
      int v28 = object_getClassName(self);
      uint64_t v45 = sel_getName(a2);
      uint64_t v29 = 45;
      if (v27) {
        uint64_t v29 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v29, v28, v45, 174);
    }
    dispatch_get_specific(*v23);
    int v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_super v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      id v33 = object_getClassName(self);
      __int16 v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v52 = v32;
      __int16 v53 = 2082;
      v54 = v33;
      __int16 v55 = 2082;
      v56 = v34;
      __int16 v57 = 1024;
      int v58 = 174;
      _os_log_impl(&dword_257348000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }

    id v35 = objc_alloc(MEMORY[0x263F087E8]);
    v8 = [NSString stringWithUTF8String:"nfcd"];
    v61[0] = *MEMORY[0x263F08320];
    v20 = [NSString stringWithUTF8String:"XPC Error"];
    v62[0] = v20;
    v62[1] = &unk_270652130;
    v61[1] = @"Line";
    v61[2] = @"Method";
    __int16 v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v62[2] = v36;
    v61[3] = *MEMORY[0x263F07F80];
    uint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 175);
    v62[3] = v37;
    __int16 v38 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
    uint64_t v39 = (void *)[v35 initWithDomain:v8 code:7 userInfo:v38];
  }

LABEL_29:
  return v39;
}

- (void)deleteAllAppletEntities
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)NFStorageService;
  v4 = [(NFPrivateService *)&v31 runService:&unk_270652060];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 valueForKey:@"Error"];
    if (v5)
    {
      v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v8(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v11, ClassName, Name, 202, v5);
      }
      dispatch_get_specific(*v6);
      BOOL v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = object_getClass(self);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        v15 = object_getClassName(self);
        int v16 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v33 = v14;
        __int16 v34 = 2082;
        id v35 = v15;
        __int16 v36 = 2082;
        uint64_t v37 = v16;
        __int16 v38 = 1024;
        int v39 = 202;
        __int16 v40 = 2112;
        __int16 v41 = v5;
        _os_log_impl(&dword_257348000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    int v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      id v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      uint64_t v22 = object_getClassName(self);
      int v30 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v23, v22, v30, 196);
    }
    dispatch_get_specific(*v17);
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      BOOL v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v33 = v25;
      __int16 v34 = 2082;
      id v35 = v26;
      __int16 v36 = 2082;
      uint64_t v37 = v27;
      __int16 v38 = 1024;
      int v39 = 196;
      _os_log_impl(&dword_257348000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }
}

@end