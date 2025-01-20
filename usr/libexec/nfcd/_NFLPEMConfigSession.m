@interface _NFLPEMConfigSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)_dumpLPEMAppletLogs;
- (BOOL)isSessionSEOnly;
- (NFDriverWrapper)driverWrapper;
- (void)configureHardwareForLPEMWithCompletion:(id)a3;
- (void)didStartSession:(id)a3;
- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4;
- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4;
- (void)getLPEMBluetoothLog:(BOOL)a3 callback:(id)a4;
- (void)getLPEMBluetoothLog:(BOOL)a3 withCompletion:(id)a4;
- (void)getLPEMFeaturesWithCompletion:(id)a3;
- (void)setDriverWrapper:(id)a3;
@end

@implementation _NFLPEMConfigSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 lpemConfigSessionAccess])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring LPEM Config session access", v11, ClassName, Name, 30);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 30;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring LPEM Config session access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031C258;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 31];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (void)didStartSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NFLPEMConfigSession;
  id v4 = a3;
  [(_NFSession *)&v6 didStartSession:v4];
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didStartSession:v4];
}

- (void)configureHardwareForLPEMWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    v21 = +[_NFHardwareManager sharedHardwareManager];
    sub_1001A102C((uint64_t)v21, v5);
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = [(_NFSession *)self sessionUID];
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 44, v12);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    v17 = object_getClassName(self);
    id v18 = sel_getName(a2);
    id v19 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v28 = v16;
    __int16 v29 = 2082;
    v30 = v17;
    __int16 v31 = 2082;
    int v32 = v18;
    __int16 v33 = 1024;
    int v34 = 44;
    __int16 v35 = 2114;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v5)
  {
    id v20 = objc_alloc((Class)NSError);
    v21 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithUTF8String:"Session not active"];
    int v26 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v24 = [v20 initWithDomain:v21 code:54 userInfo:v23];
    (*((void (**)(id, id))v5 + 2))(v5, v24);

LABEL_15:
  }
}

- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  v7 = (void (**)(id, id))a4;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    v23 = +[_NFHardwareManager sharedHardwareManager];
    [v23 disableLPEMFeature:a3 completion:v7];
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v14 = [(_NFSession *)self sessionUID];
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v15, ClassName, Name, 51, v14);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    id v19 = object_getClassName(self);
    id v20 = sel_getName(a2);
    v21 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v30 = v18;
    __int16 v31 = 2082;
    int v32 = v19;
    __int16 v33 = 2082;
    int v34 = v20;
    __int16 v35 = 1024;
    int v36 = 51;
    __int16 v37 = 2114;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v7)
  {
    id v22 = objc_alloc((Class)NSError);
    v23 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    id v24 = +[NSString stringWithUTF8String:"Session not active"];
    int v28 = v24;
    NSErrorUserInfoKey v25 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v26 = [v22 initWithDomain:v23 code:54 userInfo:v25];
    v7[2](v7, v26);

LABEL_15:
  }
}

- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    v23 = +[_NFHardwareManager sharedHardwareManager];
    sub_10019C848((uint64_t)v23, a3, 1, v7);
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v14 = [(_NFSession *)self sessionUID];
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v15, ClassName, Name, 59, v14);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    id v19 = object_getClassName(self);
    id v20 = sel_getName(a2);
    v21 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v30 = v18;
    __int16 v31 = 2082;
    int v32 = v19;
    __int16 v33 = 2082;
    int v34 = v20;
    __int16 v35 = 1024;
    int v36 = 59;
    __int16 v37 = 2114;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v7)
  {
    id v22 = objc_alloc((Class)NSError);
    v23 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    id v24 = +[NSString stringWithUTF8String:"Session not active"];
    int v28 = v24;
    NSErrorUserInfoKey v25 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v26 = [v22 initWithDomain:v23 code:54 userInfo:v25];
    (*((void (**)(id, id))v7 + 2))(v7, v26);

LABEL_15:
  }
}

- (void)getLPEMFeaturesWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    v21 = +[_NFHardwareManager sharedHardwareManager];
    sub_10019D8D4((uint64_t)v21, v5);
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = [(_NFSession *)self sessionUID];
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 66, v12);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    v17 = object_getClassName(self);
    int v18 = sel_getName(a2);
    id v19 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v28 = v16;
    __int16 v29 = 2082;
    int v30 = v17;
    __int16 v31 = 2082;
    int v32 = v18;
    __int16 v33 = 1024;
    int v34 = 66;
    __int16 v35 = 2114;
    int v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v5)
  {
    id v20 = objc_alloc((Class)NSError);
    v21 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    id v22 = +[NSString stringWithUTF8String:"Session not active"];
    id v26 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v24 = [v20 initWithDomain:v21 code:54 userInfo:v23];
    (*((void (**)(id, id, void))v5 + 2))(v5, v24, 0);

LABEL_15:
  }
}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (void)getLPEMBluetoothLog:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int v14 = [(_NFSession *)self sessionUID];
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v15, ClassName, Name, 79, v14);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      id v19 = object_getClassName(self);
      id v20 = sel_getName(a2);
      v21 = [(_NFSession *)self sessionUID];
      *(_DWORD *)buf = 67110146;
      int v31 = v18;
      __int16 v32 = 2082;
      __int16 v33 = v19;
      __int16 v34 = 2082;
      __int16 v35 = v20;
      __int16 v36 = 1024;
      int v37 = 79;
      __int16 v38 = 2114;
      v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
    if (v7)
    {
      id v22 = objc_alloc((Class)NSError);
      v23 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      id v24 = +[NSString stringWithUTF8String:"Session not active"];
      __int16 v29 = v24;
      NSErrorUserInfoKey v25 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v26 = [v22 initWithDomain:v23 code:54 userInfo:v25];
      NSErrorUserInfoKey v27 = objc_opt_new();
      v7[2](v7, v26, v27);
    }
  }
  else
  {
    [(_NFLPEMConfigSession *)self getLPEMBluetoothLog:v4 callback:v7];
  }
}

- (void)getLPEMBluetoothLog:(BOOL)a3 callback:(id)a4
{
  id v7 = a4;
  v8 = +[NSXPCConnection currentConnection];
  v9 = [(_NFSession *)self workQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100147928;
  v11[3] = &unk_100304DC0;
  id v12 = v7;
  SEL v13 = a2;
  v11[4] = self;
  BOOL v14 = a3;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (BOOL)_dumpLPEMAppletLogs
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", (const char *)&unk_100286819, buf, 2u);
  }

  if (byte_100347469 != 1)
  {
    int v16 = +[NFRoutingConfig embeddedWiredMode];
    int v18 = +[_NFHardwareManager sharedHardwareManager];
    id v19 = [v18 setRoutingConfig:v16];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    v21 = (void (*)(uint64_t, const char *, ...))Logger;
    if (v19)
    {
      if (Logger)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v25 = 45;
        if (isMetaClass) {
          uint64_t v25 = 43;
        }
        v21(6, "%c[%{public}s %{public}s]:%i Failed to set routing to retrieve LPEM logs", v25, ClassName, Name, 205);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        __int16 v29 = object_getClassName(self);
        int v30 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v127 = v28;
        __int16 v128 = 2082;
        v129 = v29;
        __int16 v130 = 2082;
        v131 = v30;
        __int16 v132 = 1024;
        int v133 = 205;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to set routing to retrieve LPEM logs", buf, 0x22u);
      }

      int v31 = NFSharedSignpostLog();
      if (os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", (const char *)&unk_100286819, buf, 2u);
      }
      BOOL v17 = 0;
      goto LABEL_111;
    }
    if (Logger)
    {
      __int16 v32 = object_getClass(self);
      BOOL v33 = class_isMetaClass(v32);
      __int16 v34 = object_getClassName(self);
      v116 = sel_getName(a2);
      uint64_t v35 = 45;
      if (v33) {
        uint64_t v35 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i reading logs from applet", v35, v34, v116, 210);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v36 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = object_getClass(self);
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      v39 = object_getClassName(self);
      v40 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v127 = v38;
      __int16 v128 = 2082;
      v129 = v39;
      __int16 v130 = 2082;
      v131 = v40;
      __int16 v132 = 1024;
      int v133 = 210;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i reading logs from applet", buf, 0x22u);
    }

    v41 = [v18 secureElementWrapper];
    id v125 = 0;
    v42 = sub_1000A695C(v41, 4, &v125);
    v43 = v125;
    int v31 = v43;
    if (v42) {
      BOOL v44 = 1;
    }
    else {
      BOOL v44 = v43 == 0;
    }
    BOOL v17 = !v44;

    if (!v17)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v62 = NFLogGetLogger();
      if (v62)
      {
        v63 = (void (*)(uint64_t, const char *, ...))v62;
        v64 = object_getClass(self);
        BOOL v65 = class_isMetaClass(v64);
        v66 = object_getClassName(self);
        v118 = sel_getName(a2);
        uint64_t v67 = 45;
        if (v65) {
          uint64_t v67 = 43;
        }
        v111 = v66;
        id v19 = 0;
        v63(6, "%c[%{public}s %{public}s]:%i Failed to log Applet LPEM Log", v67, v111, v118, 216);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v68 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = object_getClass(self);
        if (class_isMetaClass(v69)) {
          int v70 = 43;
        }
        else {
          int v70 = 45;
        }
        v71 = object_getClassName(self);
        v72 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v127 = v70;
        __int16 v128 = 2082;
        v129 = v71;
        __int16 v130 = 2082;
        v131 = v72;
        __int16 v132 = 1024;
        int v133 = 216;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to log Applet LPEM Log", buf, 0x22u);
      }

      v47 = NFSharedSignpostLog();
      if (os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", (const char *)&unk_100286819, buf, 2u);
      }
      goto LABEL_110;
    }
    id v45 = objc_alloc((Class)NSString);
    v46 = NSHomeDirectory();
    v47 = [v45 initWithFormat:@"%@%@", v46, @"/Library/Logs/nfcd_lpem.bin"];

    if (!v47)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v73 = NFLogGetLogger();
      if (v73)
      {
        v74 = (void (*)(uint64_t, const char *, ...))v73;
        v75 = object_getClass(self);
        BOOL v76 = class_isMetaClass(v75);
        v77 = object_getClassName(self);
        v119 = sel_getName(a2);
        BOOL v44 = !v76;
        v47 = 0;
        uint64_t v78 = 45;
        if (!v44) {
          uint64_t v78 = 43;
        }
        v112 = v77;
        id v19 = 0;
        v74(3, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log: File URL is nil", v78, v112, v119, 249);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v79 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v80 = object_getClass(self);
        if (class_isMetaClass(v80)) {
          int v81 = 43;
        }
        else {
          int v81 = 45;
        }
        v82 = object_getClassName(self);
        v83 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v127 = v81;
        __int16 v128 = 2082;
        v129 = v82;
        __int16 v130 = 2082;
        v131 = v83;
        __int16 v132 = 1024;
        int v133 = 249;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log: File URL is nil", buf, 0x22u);
      }
      v84 = &AMFDRSealingMapCopyLocalData_ptr;
      goto LABEL_105;
    }
    v122 = v47;
    v48 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:");
    v124 = NFBootUUID();
    v123 = v48;
    if (v48)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49 = [v48 objectForKeyedSubscript:@"bootuuid"];
        if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          unsigned __int8 v50 = [v49 isEqual:v124];

          if (v50)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v51 = NFLogGetLogger();
            if (v51)
            {
              v52 = (void (*)(uint64_t, const char *, ...))v51;
              v53 = object_getClass(self);
              BOOL v54 = class_isMetaClass(v53);
              v55 = object_getClassName(self);
              v117 = sel_getName(a2);
              uint64_t v56 = 45;
              if (v54) {
                uint64_t v56 = 43;
              }
              v52(6, "%c[%{public}s %{public}s]:%i File already present from this boot. Not erasing.", v56, v55, v117, 246);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v57 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = object_getClass(self);
              if (class_isMetaClass(v58)) {
                int v59 = 43;
              }
              else {
                int v59 = 45;
              }
              v60 = object_getClassName(self);
              v61 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v127 = v59;
              __int16 v128 = 2082;
              v129 = v60;
              __int16 v130 = 2082;
              v131 = v61;
              __int16 v132 = 1024;
              int v133 = 246;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i File already present from this boot. Not erasing.", buf, 0x22u);
            }
            v47 = v122;
LABEL_104:
            v84 = &AMFDRSealingMapCopyLocalData_ptr;
            v79 = v123;

            id v19 = 0;
LABEL_105:

            id v106 = [objc_alloc((Class)v84[434]) initWithBytes:&unk_100284102 length:10];
            v107 = [v31 objectForKey:v106];

            if (v107)
            {
              id v108 = [objc_alloc((Class)v84[434]) initWithBytes:&unk_100284102 length:10];
              [v108 NF_asHexString];
              PLLogRegisteredEvent();
            }
            v109 = NFSharedSignpostLog();
            if (os_signpost_enabled(v109))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v109, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", (const char *)&unk_100286819, buf, 2u);
            }

LABEL_110:
LABEL_111:

            goto LABEL_112;
          }
        }
        else
        {
        }
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v85 = NFLogGetLogger();
    if (v85)
    {
      v86 = (void (*)(uint64_t, const char *, ...))v85;
      v87 = object_getClass(self);
      BOOL v88 = class_isMetaClass(v87);
      v89 = object_getClassName(self);
      v120 = sel_getName(a2);
      uint64_t v90 = 45;
      if (v88) {
        uint64_t v90 = 43;
      }
      v86(6, "%c[%{public}s %{public}s]:%i Cached boot UUID does not match current boot UUID or file does not exist, updating ..", v90, v89, v120, 235);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v91 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      v92 = object_getClass(self);
      if (class_isMetaClass(v92)) {
        int v93 = 43;
      }
      else {
        int v93 = 45;
      }
      v94 = object_getClassName(self);
      v95 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v127 = v93;
      __int16 v128 = 2082;
      v129 = v94;
      __int16 v130 = 2082;
      v131 = v95;
      __int16 v132 = 1024;
      int v133 = 235;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cached boot UUID does not match current boot UUID or file does not exist, updating ..", buf, 0x22u);
    }

    v57 = [v31 mutableCopy];
    [v57 setObject:v124 forKeyedSubscript:@"bootuuid"];
    v47 = v122;
    if ([v57 writeToFile:v122 atomically:0])
    {
      byte_100347469 = 1;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v96 = NFLogGetLogger();
      if (v96)
      {
        v97 = (void (*)(uint64_t, const char *, ...))v96;
        v98 = object_getClass(self);
        BOOL v99 = class_isMetaClass(v98);
        v113 = object_getClassName(self);
        v121 = sel_getName(a2);
        BOOL v44 = !v99;
        v47 = v122;
        uint64_t v100 = 45;
        if (!v44) {
          uint64_t v100 = 43;
        }
        v97(3, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log to %{public}@", v100, v113, v121, 241, v122);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v101 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        v102 = object_getClass(self);
        if (class_isMetaClass(v102)) {
          int v103 = 43;
        }
        else {
          int v103 = 45;
        }
        v104 = object_getClassName(self);
        v105 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v127 = v103;
        __int16 v128 = 2082;
        v129 = v104;
        __int16 v130 = 2082;
        v131 = v105;
        __int16 v132 = 1024;
        int v133 = 241;
        __int16 v134 = 2114;
        v135 = v47;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log to %{public}@", buf, 0x2Cu);
      }
    }
    goto LABEL_104;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v5 = NFLogGetLogger();
  if (v5)
  {
    objc_super v6 = (void (*)(uint64_t, const char *, ...))v5;
    id v7 = object_getClass(self);
    BOOL v8 = class_isMetaClass(v7);
    v9 = object_getClassName(self);
    v114 = sel_getName(a2);
    uint64_t v10 = 45;
    if (v8) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Applet LPEM Log already retrieved", v10, v9, v114, 194);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    BOOL v14 = object_getClassName(self);
    uint64_t v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v127 = v13;
    __int16 v128 = 2082;
    v129 = v14;
    __int16 v130 = 2082;
    v131 = v15;
    __int16 v132 = 1024;
    int v133 = 194;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet LPEM Log already retrieved", buf, 0x22u);
  }

  int v16 = NFSharedSignpostLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", (const char *)&unk_100286819, buf, 2u);
  }
  BOOL v17 = 1;
LABEL_112:

  return v17;
}

- (NFDriverWrapper)driverWrapper
{
  return self->_driverWrapper;
}

- (void)setDriverWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end