@interface NFRemoteAdminRedirectSession
- (BOOL)aborted;
- (BOOL)closeSession;
- (BOOL)openConnection:(id)a3;
- (BOOL)openSession;
- (BOOL)startNewSession;
- (NFRemoteAdminConnection)connection;
- (NFRemoteAdminRedirectSession)init;
- (NFRemoteAdminRedirectSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5;
- (NFRemoteAdminRedirectState)redirectState;
- (NSString)targetSEID;
- (id)getNextRequest;
- (int64_t)abortedReason;
- (unint64_t)executeHttpRequest:(id)a3 httpHeader:(id)a4 response:(id)a5 responseHeader:(id)a6 duration:(double *)a7 sessionError:(id *)a8;
- (unint64_t)executeScript:(id)a3;
- (unint64_t)performCheckIn;
- (unint64_t)performRedirect;
- (unint64_t)run;
- (unsigned)redirectStepError;
- (void)abort:(int64_t)a3;
- (void)closeConnection;
- (void)processNotification:(id)a3;
- (void)setConnection:(id)a3;
- (void)setRedirectStepError:(unsigned int)a3;
@end

@implementation NFRemoteAdminRedirectSession

- (NFRemoteAdminRedirectSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFRemoteAdminRedirectSession;
  return [(NFRemoteAdminRedirectSession *)&v3 init];
}

- (NFRemoteAdminRedirectSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NFRemoteAdminRedirectSession;
  v11 = [(NFRemoteAdminRedirectSession *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v9 seid];
    targetSEID = v11->_targetSEID;
    v11->_targetSEID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_redirectState, a3);
    objc_storeStrong((id *)&v11->_seSession, a5);
    v11->_allocateSESession = v10 == 0;
    v11->_oneTimeConnection = a4;
  }

  return v11;
}

- (void)abort:(int64_t)a3
{
  v5 = self;
  objc_sync_enter(v5);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v5);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Aborting...", v8, ClassName, Name, 67);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(v5);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    v18 = object_getClassName(v5);
    __int16 v19 = 2082;
    v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 67;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting...", buf, 0x22u);
  }

  v5->_abort = a3;
  if (v5->_allocateSESession) {
    [(NFSecureElementManagerSession *)v5->_seSession endSessionWithCompletion:&stru_100058778];
  }
  v14 = [(NFRemoteAdminRedirectSession *)v5 connection];
  [v14 disconnect];

  objc_sync_exit(v5);
}

- (BOOL)aborted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_abort > 0;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)abortedReason
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t abort = v2->_abort;
  objc_sync_exit(v2);

  return abort;
}

- (void)processNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v5 setNotification:v4];
}

- (id)getNextRequest
{
  p_isa = (id *)&self->super.isa;
  id v4 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v5 = [v4 step];

  v6 = [p_isa redirectState];
  v7 = v6;
  if (v5 == (id)2)
  {
    p_isa = [v6 redirectResponse];

    goto LABEL_91;
  }
  uint64_t v8 = [v6 unsentScriptResponse];

  id v9 = [p_isa redirectState];
  id v10 = v9;
  if (v8)
  {
    p_isa = [v9 unsentScriptResponse];

    goto LABEL_91;
  }
  v11 = [v9 whitelistedInstances];

  uint64_t v12 = objc_opt_new();
  int v13 = [p_isa redirectState];
  v14 = [v13 version];
  if (v14)
  {
    objc_super v15 = [p_isa redirectState];
    int v16 = [v15 version];
    [v12 setObject:v16 forKeyedSubscript:@"version"];
  }
  else
  {
    [v12 setObject:&off_10005B2C0 forKeyedSubscript:@"version"];
  }

  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:@"whitelistedInstances"];
  }
  id v17 = p_isa[1];
  if (v17)
  {
    v108 = 0;
  }
  else
  {
    id v18 = p_isa[2];
    id v113 = 0;
    uint64_t v19 = [v18 stateInformationWithRedirectInfo:v12 error:&v113];
    v108 = (__CFString *)v113;
    id v20 = p_isa[1];
    p_isa[1] = (id)v19;

    id v17 = p_isa[1];
    if (!v17)
    {
LABEL_23:
      v31 = v12;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v33 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(p_isa);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(p_isa);
        Name = sel_getName(a2);
        if (v108) {
          CFStringRef v38 = v108;
        }
        else {
          CFStringRef v38 = &stru_100059418;
        }
        uint64_t v39 = 45;
        if (isMetaClass) {
          uint64_t v39 = 43;
        }
        v33(3, "%c[%{public}s %{public}s]:%i Failed to query state information %{public}@", v39, ClassName, Name, 164, v38);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = object_getClass(p_isa);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        v43 = object_getClassName(p_isa);
        v44 = sel_getName(a2);
        CFStringRef v45 = v108;
        *(_DWORD *)buf = 67110146;
        if (!v108) {
          CFStringRef v45 = &stru_100059418;
        }
        int v116 = v42;
        __int16 v117 = 2082;
        v118 = v43;
        __int16 v119 = 2082;
        v120 = v44;
        __int16 v121 = 1024;
        int v122 = 164;
        __int16 v123 = 2114;
        CFStringRef v124 = v45;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query state information %{public}@", buf, 0x2Cu);
      }
      p_isa = 0;
      uint64_t v12 = v31;
      goto LABEL_90;
    }
  }
  if (![v17 count]) {
    goto LABEL_23;
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v21 = p_isa[1];
  id v22 = [v21 countByEnumeratingWithState:&v109 objects:v114 count:16];
  v107 = v12;
  if (v22)
  {
    id v23 = v22;
    SEL sel = v11;
    uint64_t v24 = *(void *)v110;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v110 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        v27 = [v26 NF_stringForKey:@"SEID"];
        v28 = [p_isa targetSEID];
        unsigned int v29 = [v27 isEqualToString:v28];

        if (v29)
        {
          id v30 = v26;

          goto LABEL_39;
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v109 objects:v114 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    id v30 = 0;
LABEL_39:

    v40 = v30;
    v11 = (char *)sel;
    uint64_t v12 = v107;
    if (!p_isa) {
      goto LABEL_89;
    }
  }
  else
  {

    v40 = 0;
  }
  v46 = objc_opt_new();
  if (v40)
  {
    v47 = v11;
    v48 = [p_isa redirectState];
    v49 = [v48 version];
    if (v49)
    {
      v50 = [p_isa redirectState];
      v51 = [v50 version];
      [v46 setObject:v51 forKeyedSubscript:@"kVersion"];
    }
    else
    {
      [v46 setObject:&off_10005B2C0 forKeyedSubscript:@"kVersion"];
    }

    v65 = [p_isa redirectState];
    v66 = [v65 forwardDataToSP];
    if (v66)
    {
      v67 = [p_isa redirectState];
      v68 = [v67 forwardDataToSP];
      [v46 setObject:v68 forKeyedSubscript:@"forwardData"];
    }
    else
    {
      [v46 setObject:&__NSDictionary0__struct forKeyedSubscript:@"forwardData"];
    }

    v69 = objc_opt_new();
    [v69 setObject:@"internal" forKeyedSubscript:@"secureElementType"];
    v70 = [p_isa targetSEID];

    if (v70)
    {
      v71 = [p_isa targetSEID];
      [v69 setObject:v71 forKeyedSubscript:@"SEID"];

      v72 = [v40 NF_dictionaryForKey:@"casdCertificate"];
      if (v72)
      {
        [v69 setObject:v72 forKeyedSubscript:@"casdCertificate"];
        v73 = [p_isa redirectState];
        v74 = [v73 version];
        unsigned int v75 = [v74 intValue];

        if (v75 == 4)
        {
          v76 = [v40 NF_arrayForKey:@"protocolV4Containers"];
          if ([v76 count]) {
            [v69 setObject:v76 forKeyedSubscript:@"containers"];
          }
        }
        id v77 = [objc_alloc((Class)NSDictionary) initWithDictionary:v69];
        [v46 setObject:v77 forKeyedSubscript:@"SEStateInfo"];

        v78 = (id *)[objc_alloc((Class)NSDictionary) initWithDictionary:v46];
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v90 = NFLogGetLogger();
        if (v90)
        {
          v91 = (void (*)(uint64_t, const char *, ...))v90;
          v92 = object_getClass(p_isa);
          BOOL v93 = class_isMetaClass(v92);
          v94 = object_getClassName(p_isa);
          v105 = sel_getName("_generateRequestForSEState:");
          uint64_t v95 = 45;
          if (v93) {
            uint64_t v95 = 43;
          }
          v91(3, "%c[%{public}s %{public}s]:%i Missing CASD certificate", v95, v94, v105, 117);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v96 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          v97 = object_getClass(p_isa);
          if (class_isMetaClass(v97)) {
            int v98 = 43;
          }
          else {
            int v98 = 45;
          }
          v99 = object_getClassName(p_isa);
          v100 = sel_getName("_generateRequestForSEState:");
          *(_DWORD *)buf = 67109890;
          int v116 = v98;
          __int16 v117 = 2082;
          v118 = v99;
          __int16 v119 = 2082;
          v120 = v100;
          __int16 v121 = 1024;
          int v122 = 117;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing CASD certificate", buf, 0x22u);
        }

        v78 = (id *)objc_opt_new();
      }
      p_isa = v78;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v79 = NFLogGetLogger();
      if (v79)
      {
        v80 = (void (*)(uint64_t, const char *, ...))v79;
        v81 = object_getClass(p_isa);
        BOOL v82 = class_isMetaClass(v81);
        v83 = object_getClassName(p_isa);
        v104 = sel_getName("_generateRequestForSEState:");
        uint64_t v84 = 45;
        if (v82) {
          uint64_t v84 = 43;
        }
        v80(3, "%c[%{public}s %{public}s]:%i Invalid SEID", v84, v83, v104, 111);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = object_getClass(p_isa);
        if (class_isMetaClass(v86)) {
          int v87 = 43;
        }
        else {
          int v87 = 45;
        }
        v88 = object_getClassName(p_isa);
        v89 = sel_getName("_generateRequestForSEState:");
        *(_DWORD *)buf = 67109890;
        int v116 = v87;
        __int16 v117 = 2082;
        v118 = v88;
        __int16 v119 = 2082;
        v120 = v89;
        __int16 v121 = 1024;
        int v122 = 111;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid SEID", buf, 0x22u);
      }

      p_isa = (id *)objc_opt_new();
    }

    v11 = v47;
    uint64_t v12 = v107;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v52 = NFLogGetLogger();
    if (v52)
    {
      v53 = (void (*)(uint64_t, const char *, ...))v52;
      v54 = object_getClass(p_isa);
      BOOL v55 = class_isMetaClass(v54);
      v56 = v12;
      v57 = v11;
      v58 = object_getClassName(p_isa);
      v103 = sel_getName("_generateRequestForSEState:");
      uint64_t v59 = 45;
      if (v55) {
        uint64_t v59 = 43;
      }
      v102 = v58;
      v11 = v57;
      uint64_t v12 = v56;
      v53(3, "%c[%{public}s %{public}s]:%i Failed to find STATE!!!!", v59, v102, v103, 101);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = object_getClass(p_isa);
      if (class_isMetaClass(v61)) {
        int v62 = 43;
      }
      else {
        int v62 = 45;
      }
      v63 = object_getClassName(p_isa);
      v64 = sel_getName("_generateRequestForSEState:");
      *(_DWORD *)buf = 67109890;
      int v116 = v62;
      __int16 v117 = 2082;
      v118 = v63;
      __int16 v119 = 2082;
      v120 = v64;
      __int16 v121 = 1024;
      int v122 = 101;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to find STATE!!!!", buf, 0x22u);
    }

    p_isa = (id *)[objc_alloc((Class)NSDictionary) initWithDictionary:v46];
  }

LABEL_89:
LABEL_90:

LABEL_91:

  return p_isa;
}

- (unint64_t)executeScript:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v6 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i Executing TSM script", v12, ClassName, Name, 187);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v123 = v15;
    __int16 v124 = 2082;
    v125 = object_getClassName(self);
    __int16 v126 = 2082;
    v127 = sel_getName(a2);
    __int16 v128 = 1024;
    int v129 = 187;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Executing TSM script", buf, 0x22u);
  }

  int v16 = objc_opt_new();
  if (!v16)
  {
    id v113 = +[NSAssertionHandler currentHandler];
    [v113 handleFailureInMethod:a2 object:self file:@"NFRemoteAdminRedirectSession.m" lineNumber:191 description:@"Out of resources"];
  }
  id v17 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v16 setCheckAIDAllowList:[v17 step] == (id)1];

  id v18 = [(NFRemoteAdminRedirectSession *)self targetSEID];
  [v16 setSeid:v18];

  uint64_t v19 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v20 = [v19 whitelistedInstances];
  [v16 setAIDAllowList:v20];

  [v16 setInitialSelectBeforeRun:self->_performInitialAIDSelectFromWhitelist];
  seSession = self->_seSession;
  id v121 = 0;
  LODWORD(v19) = [(NFSecureElementManagerSession *)seSession runScript:v6 parameters:v16 outputResults:&v121];

  id v22 = v121;
  self->_unsigned int redirectStepError = v19;
  self->_performInitialAIDSelectFromWhitelist = 0;
  id v23 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v23 setUnsentScriptResponse:v22];

  uint64_t v24 = [(NFRemoteAdminRedirectSession *)self redirectState];
  v25 = [v24 performanceMetrics];
  [v16 outTotalAPDUExecutionDuration];
  double v27 = v26;
  [v25 totalAPDUTime];
  [v25 setTotalAPDUTime:v27 + v28];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v29 = NFLogGetLogger();
  if (v29)
  {
    id v30 = (void (*)(uint64_t, const char *, ...))v29;
    v31 = object_getClass(self);
    BOOL v32 = class_isMetaClass(v31);
    v114 = object_getClassName(self);
    int v116 = sel_getName(a2);
    uint64_t v33 = 45;
    if (v32) {
      uint64_t v33 = 43;
    }
    v30(6, "%c[%{public}s %{public}s]:%i scriptResults = %{public}@", v33, v114, v116, 209, v22);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = object_getClass(self);
    if (class_isMetaClass(v35)) {
      int v36 = 43;
    }
    else {
      int v36 = 45;
    }
    v37 = object_getClassName(self);
    CFStringRef v38 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v123 = v36;
    __int16 v124 = 2082;
    v125 = v37;
    __int16 v126 = 2082;
    v127 = v38;
    __int16 v128 = 1024;
    int v129 = 209;
    __int16 v130 = 2114;
    id v131 = v22;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i scriptResults = %{public}@", buf, 0x2Cu);
  }

  if ([v16 outIncompleteExecution])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      __int16 v117 = sel_getName(a2);
      uint64_t v44 = 45;
      if (v42) {
        uint64_t v44 = 43;
      }
      v40(5, "%c[%{public}s %{public}s]:%i Incomplete script execution", v44, v43, v117, 212);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v45 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    v46 = object_getClass(self);
    if (class_isMetaClass(v46)) {
      int v47 = 43;
    }
    else {
      int v47 = 45;
    }
    v48 = object_getClassName(self);
    v49 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v123 = v47;
    __int16 v124 = 2082;
    v125 = v48;
    __int16 v126 = 2082;
    v127 = v49;
    __int16 v128 = 1024;
    int v129 = 212;
    v50 = "%c[%{public}s %{public}s]:%i Incomplete script execution";
    v51 = v45;
    uint32_t v52 = 34;
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);
LABEL_42:
    unint64_t v65 = 6;
    goto LABEL_56;
  }
  if ([v16 outFailureResponseDetected])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v53 = NFLogGetLogger();
    if (v53)
    {
      v54 = (void (*)(uint64_t, const char *, ...))v53;
      BOOL v55 = object_getClass(self);
      BOOL v56 = class_isMetaClass(v55);
      v57 = object_getClassName(self);
      v58 = sel_getName(a2);
      id v120 = [v16 outFinalSWStatus];
      uint64_t v59 = 45;
      if (v56) {
        uint64_t v59 = 43;
      }
      v54(5, "%c[%{public}s %{public}s]:%i Failure response detected: 0x%lX", v59, v57, v58, 216, v120);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v45 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    v60 = object_getClass(self);
    if (class_isMetaClass(v60)) {
      int v61 = 43;
    }
    else {
      int v61 = 45;
    }
    int v62 = object_getClassName(self);
    v63 = sel_getName(a2);
    id v64 = [v16 outFinalSWStatus];
    *(_DWORD *)buf = 67110146;
    int v123 = v61;
    __int16 v124 = 2082;
    v125 = v62;
    __int16 v126 = 2082;
    v127 = v63;
    __int16 v128 = 1024;
    int v129 = 216;
    __int16 v130 = 2048;
    id v131 = v64;
    v50 = "%c[%{public}s %{public}s]:%i Failure response detected: 0x%lX";
    v51 = v45;
    uint32_t v52 = 44;
    goto LABEL_41;
  }
  unsigned int redirectStepError = self->_redirectStepError;
  if (redirectStepError == 3 || redirectStepError == 15 || [(NFRemoteAdminRedirectSession *)self aborted])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v67 = NFLogGetLogger();
    if (v67)
    {
      v68 = (void (*)(uint64_t, const char *, ...))v67;
      v69 = object_getClass(self);
      BOOL v70 = class_isMetaClass(v69);
      v71 = object_getClassName(self);
      v118 = sel_getName(a2);
      uint64_t v72 = 45;
      if (v70) {
        uint64_t v72 = 43;
      }
      v68(3, "%c[%{public}s %{public}s]:%i Aborting redirect step.", v72, v71, v118, 221);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v45 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v73 = object_getClass(self);
      if (class_isMetaClass(v73)) {
        int v74 = 43;
      }
      else {
        int v74 = 45;
      }
      unsigned int v75 = object_getClassName(self);
      v76 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v123 = v74;
      __int16 v124 = 2082;
      v125 = v75;
      __int16 v126 = 2082;
      v127 = v76;
      __int16 v128 = 1024;
      int v129 = 221;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Aborting redirect step.", buf, 0x22u);
    }
    unint64_t v65 = 1;
  }
  else
  {
    unsigned int v78 = self->_redirectStepError;
    if (v78)
    {
      if (v78 == 7)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v79 = NFLogGetLogger();
        if (v79)
        {
          v80 = (void (*)(uint64_t, const char *, ...))v79;
          v81 = object_getClass(self);
          BOOL v82 = class_isMetaClass(v81);
          v83 = object_getClassName(self);
          uint64_t v84 = sel_getName(a2);
          uint64_t v85 = 45;
          if (v82) {
            uint64_t v85 = 43;
          }
          v80(4, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", v85, v83, v84, 224, self->_redirectStepError);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        CFStringRef v45 = NFSharedLogGetLogger();
        unint64_t v65 = 16;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v86 = object_getClass(self);
          if (class_isMetaClass(v86)) {
            int v87 = 43;
          }
          else {
            int v87 = 45;
          }
          v88 = object_getClassName(self);
          v89 = sel_getName(a2);
          unsigned int v90 = self->_redirectStepError;
          *(_DWORD *)buf = 67110146;
          int v123 = v87;
          __int16 v124 = 2082;
          v125 = v88;
          __int16 v126 = 2082;
          v127 = v89;
          __int16 v128 = 1024;
          int v129 = 224;
          __int16 v130 = 1024;
          LODWORD(v131) = v90;
          unint64_t v65 = 16;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", buf, 0x28u);
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v91 = NFLogGetLogger();
        if (v91)
        {
          v92 = (void (*)(uint64_t, const char *, ...))v91;
          BOOL v93 = object_getClass(self);
          BOOL v94 = class_isMetaClass(v93);
          uint64_t v95 = object_getClassName(self);
          v96 = sel_getName(a2);
          uint64_t v97 = 45;
          if (v94) {
            uint64_t v97 = 43;
          }
          v92(4, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", v97, v95, v96, 227, self->_redirectStepError);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        CFStringRef v45 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          int v98 = object_getClass(self);
          if (class_isMetaClass(v98)) {
            int v99 = 43;
          }
          else {
            int v99 = 45;
          }
          v100 = object_getClassName(self);
          v101 = sel_getName(a2);
          unsigned int v102 = self->_redirectStepError;
          *(_DWORD *)buf = 67110146;
          int v123 = v99;
          __int16 v124 = 2082;
          v125 = v100;
          __int16 v126 = 2082;
          v127 = v101;
          __int16 v128 = 1024;
          int v129 = 227;
          __int16 v130 = 1024;
          LODWORD(v131) = v102;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", buf, 0x28u);
        }
        unint64_t v65 = 10;
      }
    }
    else
    {
      if (v22)
      {
        unint64_t v65 = 6;
        goto LABEL_57;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v103 = NFLogGetLogger();
      if (v103)
      {
        v104 = (void (*)(uint64_t, const char *, ...))v103;
        v105 = object_getClass(self);
        BOOL v106 = class_isMetaClass(v105);
        v107 = object_getClassName(self);
        __int16 v119 = sel_getName(a2);
        uint64_t v108 = 45;
        if (v106) {
          uint64_t v108 = 43;
        }
        v104(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v108, v107, v119, 230);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      CFStringRef v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        long long v109 = object_getClass(self);
        if (class_isMetaClass(v109)) {
          int v110 = 43;
        }
        else {
          int v110 = 45;
        }
        long long v111 = object_getClassName(self);
        long long v112 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v123 = v110;
        __int16 v124 = 2082;
        v125 = v111;
        __int16 v126 = 2082;
        v127 = v112;
        __int16 v128 = 1024;
        int v129 = 230;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
      }
      unint64_t v65 = 4;
    }
  }
LABEL_56:

LABEL_57:
  return v65;
}

- (unint64_t)executeHttpRequest:(id)a3 httpHeader:(id)a4 response:(id)a5 responseHeader:(id)a6 duration:(double *)a7 sessionError:(id *)a8
{
  uint64_t v86 = 0;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [(NFRemoteAdminRedirectSession *)self connection];
  id v20 = [v19 performRequest:0 body:v18 header:v17 response:v16 responseHeader:v15 httpStatus:&v86 duration:a7 sessionError:a8];

  id v21 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v22 = [v21 step];

  if (v22 == (id)1)
  {
    if ((v20 & 0xFFFFFFF7) == 0x11)
    {
      id v23 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v23 setHttpStatus:0];
    }
    else
    {
      id v23 = +[NSNumber numberWithInteger:v86];
      uint64_t v24 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v24 setHttpStatus:v23];
    }
  }
  if (v20 <= 0x19 && ((1 << (char)v20) & 0x2060000) != 0) {
    +[NFExceptionsCALogger postAnalyticsTSMConnectivityException:v20];
  }
  if (v86 == 412)
  {
    v25 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v25 setUnsentScriptResponse:0];

    return 6;
  }
  if (!v20) {
    return 8 * (v86 == 404);
  }
  if ((v20 - 19) <= 1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      double v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v32 = 45;
      if (isMetaClass) {
        uint64_t v32 = 43;
      }
      v28(6, "%c[%{public}s %{public}s]:%i Server error", v32, ClassName, Name, 283);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v33 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v34 = object_getClass(self);
    if (class_isMetaClass(v34)) {
      int v35 = 43;
    }
    else {
      int v35 = 45;
    }
    int v36 = object_getClassName(self);
    v37 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v88 = v35;
    __int16 v89 = 2082;
    unsigned int v90 = v36;
    __int16 v91 = 2082;
    v92 = v37;
    __int16 v93 = 1024;
    int v94 = 283;
    CFStringRef v38 = "%c[%{public}s %{public}s]:%i Server error";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v38, buf, 0x22u);
LABEL_23:

    return 3;
  }
  if (v20 == 17)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFLogGetLogger();
    if (v50)
    {
      v51 = (void (*)(uint64_t, const char *, ...))v50;
      uint32_t v52 = object_getClass(self);
      BOOL v53 = class_isMetaClass(v52);
      v54 = object_getClassName(self);
      v83 = sel_getName(a2);
      uint64_t v55 = 45;
      if (v53) {
        uint64_t v55 = 43;
      }
      v51(6, "%c[%{public}s %{public}s]:%i Network client error", v55, v54, v83, 292);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = object_getClass(self);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      uint64_t v59 = object_getClassName(self);
      v60 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v88 = v58;
      __int16 v89 = 2082;
      unsigned int v90 = v59;
      __int16 v91 = 2082;
      v92 = v60;
      __int16 v93 = 1024;
      int v94 = 292;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network client error", buf, 0x22u);
    }

    return 15;
  }
  else if (v20 == 25)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      BOOL v82 = sel_getName(a2);
      uint64_t v44 = 45;
      if (v42) {
        uint64_t v44 = 43;
      }
      v40(6, "%c[%{public}s %{public}s]:%i Network Unavailable", v44, v43, v82, 288);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v45 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = object_getClass(self);
      if (class_isMetaClass(v46)) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      v48 = object_getClassName(self);
      v49 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v88 = v47;
      __int16 v89 = 2082;
      unsigned int v90 = v48;
      __int16 v91 = 2082;
      v92 = v49;
      __int16 v93 = 1024;
      int v94 = 288;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network Unavailable", buf, 0x22u);
    }

    return 2;
  }
  else
  {
    BOOL oneTimeConnection = self->_oneTimeConnection;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v62 = NFLogGetLogger();
    v63 = (void (*)(uint64_t, const char *, ...))v62;
    if (oneTimeConnection)
    {
      if (v62)
      {
        id v64 = object_getClass(self);
        BOOL v65 = class_isMetaClass(v64);
        v66 = object_getClassName(self);
        uint64_t v84 = sel_getName(a2);
        uint64_t v67 = 45;
        if (v65) {
          uint64_t v67 = 43;
        }
        v63(6, "%c[%{public}s %{public}s]:%i Other error, short retry only", v67, v66, v84, 298);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v68 = object_getClass(self);
      if (class_isMetaClass(v68)) {
        int v69 = 43;
      }
      else {
        int v69 = 45;
      }
      BOOL v70 = object_getClassName(self);
      v71 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v88 = v69;
      __int16 v89 = 2082;
      unsigned int v90 = v70;
      __int16 v91 = 2082;
      v92 = v71;
      __int16 v93 = 1024;
      int v94 = 298;
      CFStringRef v38 = "%c[%{public}s %{public}s]:%i Other error, short retry only";
      goto LABEL_22;
    }
    if (v62)
    {
      uint64_t v72 = object_getClass(self);
      BOOL v73 = class_isMetaClass(v72);
      int v74 = object_getClassName(self);
      uint64_t v85 = sel_getName(a2);
      uint64_t v75 = 45;
      if (v73) {
        uint64_t v75 = 43;
      }
      v63(6, "%c[%{public}s %{public}s]:%i Other error", v75, v74, v85, 301);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      id v77 = object_getClass(self);
      if (class_isMetaClass(v77)) {
        int v78 = 43;
      }
      else {
        int v78 = 45;
      }
      uint64_t v79 = object_getClassName(self);
      v80 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v88 = v78;
      __int16 v89 = 2082;
      unsigned int v90 = v79;
      __int16 v91 = 2082;
      v92 = v80;
      __int16 v93 = 1024;
      int v94 = 301;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Other error", buf, 0x22u);
    }

    return 4;
  }
}

- (unint64_t)performRedirect
{
  if ([(NFRemoteAdminRedirectSession *)self aborted]) {
    return 1;
  }
  id v6 = [(NFRemoteAdminRedirectSession *)self getNextRequest];
  if (v6)
  {
    v7 = objc_opt_new();
    id v115 = 0;
    double v116 = 0.0;
    unint64_t v4 = [(NFRemoteAdminRedirectSession *)self executeHttpRequest:v6 httpHeader:0 response:v7 responseHeader:0 duration:&v116 sessionError:&v115];
    id v8 = v115;
    id v9 = [(NFRemoteAdminRedirectSession *)self redirectState];
    id v10 = [v9 performanceMetrics];
    [v10 setNsUrlSessionError:v8];

    if (v4)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        id v15 = v5;
        id v16 = v7;
        id v17 = v6;
        id v18 = v8;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v104 = ClassName;
        id v8 = v18;
        id v6 = v17;
        v7 = v16;
        id v5 = v15;
        v12(6, "%c[%{public}s %{public}s]:%i HTTP failed, status=0x%lx", v20, v104, Name, 419, v4);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = object_getClass(self);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        uint64_t v24 = object_getClassName(self);
        v25 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v118 = v23;
        __int16 v119 = 2082;
        id v120 = v24;
        __int16 v121 = 2082;
        int v122 = v25;
        __int16 v123 = 1024;
        int v124 = 419;
        __int16 v125 = 2048;
        unint64_t v126 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HTTP failed, status=0x%lx", buf, 0x2Cu);
      }

      if (v4 != 2) {
        sub_1000136B0(self, 0, v116);
      }
    }
    else
    {
      v34 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v34 setUnsentScriptResponse:0];

      sub_1000136B0(self, [v7 count] != 0, v116);
      int v35 = v7;
      int v36 = v35;
      if (self)
      {
        if ([v35 count])
        {
          id v113 = v8;
          v37 = [v36 objectForKeyedSubscript:@"kVersion"];
          id v38 = [v37 integerValue];

          v114 = v5;
          if (v38 != (id)2)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v39 = NFLogGetLogger();
            if (v39)
            {
              v40 = (void (*)(uint64_t, const char *, ...))v39;
              v41 = object_getClass(self);
              BOOL v42 = class_isMetaClass(v41);
              v43 = object_getClassName(self);
              uint64_t v44 = sel_getName("_processRedirectCommands:");
              CFStringRef v45 = +[NSNumber numberWithInteger:v38];
              uint64_t v46 = 45;
              if (v42) {
                uint64_t v46 = 43;
              }
              v40(6, "%c[%{public}s %{public}s]:%i Protocol version = %{public}@", v46, v43, v44, 337, v45);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v47 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = object_getClass(self);
              if (class_isMetaClass(v48)) {
                int v49 = 43;
              }
              else {
                int v49 = 45;
              }
              uint64_t v50 = object_getClassName(self);
              v51 = sel_getName("_processRedirectCommands:");
              uint32_t v52 = +[NSNumber numberWithInteger:v38];
              *(_DWORD *)buf = 67110146;
              int v118 = v49;
              __int16 v119 = 2082;
              id v120 = v50;
              __int16 v121 = 2082;
              int v122 = v51;
              __int16 v123 = 1024;
              int v124 = 337;
              __int16 v125 = 2114;
              unint64_t v126 = (unint64_t)v52;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Protocol version = %{public}@", buf, 0x2Cu);
            }
          }
          BOOL v53 = [v36 NF_numberForKey:@"SPStatusCode"];
          if (v53)
          {
            v54 = [(NFRemoteAdminRedirectSession *)self redirectState];
            [v54 setSpStatusCode:v53];
          }
          else
          {
            int v69 = [v36 NF_stringForKey:@"SPStatusCode"];
            v54 = v69;
            if (v69)
            {
              BOOL v70 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v69 integerValue]);
              v71 = [(NFRemoteAdminRedirectSession *)self redirectState];
              [v71 setSpStatusCode:v70];
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v72 = NFLogGetLogger();
              if (v72)
              {
                BOOL v73 = (void (*)(uint64_t, const char *, ...))v72;
                int v74 = object_getClass(self);
                BOOL v75 = class_isMetaClass(v74);
                v76 = object_getClassName(self);
                long long v111 = sel_getName("_processRedirectCommands:");
                uint64_t v77 = 45;
                if (v75) {
                  uint64_t v77 = 43;
                }
                BOOL v106 = v76;
                BOOL v53 = 0;
                v73(6, "%c[%{public}s %{public}s]:%i SPStatusCode not available", v77, v106, v111, 350);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              BOOL v70 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                int v78 = object_getClass(self);
                uint64_t v79 = v53;
                if (class_isMetaClass(v78)) {
                  int v80 = 43;
                }
                else {
                  int v80 = 45;
                }
                v81 = object_getClassName(self);
                BOOL v82 = sel_getName("_processRedirectCommands:");
                *(_DWORD *)buf = 67109890;
                int v118 = v80;
                BOOL v53 = v79;
                __int16 v119 = 2082;
                id v120 = v81;
                __int16 v121 = 2082;
                int v122 = v82;
                __int16 v123 = 1024;
                int v124 = 350;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SPStatusCode not available", buf, 0x22u);
              }
            }
          }
          v83 = [v36 NF_numberForKey:@"kStartNewSession"];
          uint64_t v84 = v83;
          if (v83
            && [v83 BOOLValue]
            && ![(NFRemoteAdminRedirectSession *)self startNewSession])
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v85 = NFLogGetLogger();
            if (v85)
            {
              uint64_t v86 = (void (*)(uint64_t, const char *, ...))v85;
              int v87 = object_getClass(self);
              BOOL v88 = class_isMetaClass(v87);
              __int16 v89 = v53;
              unsigned int v90 = object_getClassName(self);
              long long v112 = sel_getName("_processRedirectCommands:");
              uint64_t v91 = 45;
              if (v88) {
                uint64_t v91 = 43;
              }
              v107 = v90;
              BOOL v53 = v89;
              v86(3, "%c[%{public}s %{public}s]:%i Failed to restart session", v91, v107, v112, 362);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v92 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              __int16 v93 = object_getClass(self);
              int v94 = v53;
              if (class_isMetaClass(v93)) {
                int v95 = 43;
              }
              else {
                int v95 = 45;
              }
              v96 = object_getClassName(self);
              uint64_t v97 = sel_getName("_processRedirectCommands:");
              *(_DWORD *)buf = 67109890;
              int v118 = v95;
              BOOL v53 = v94;
              __int16 v119 = 2082;
              id v120 = v96;
              __int16 v121 = 2082;
              int v122 = v97;
              __int16 v123 = 1024;
              int v124 = 362;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restart session", buf, 0x22u);
            }
          }
          int v98 = [v36 NF_dictionaryForKey:@"forwardData"];
          if (v98)
          {
            int v99 = [(NFRemoteAdminRedirectSession *)self redirectState];
            [v99 setForwardDataToSMP:v98];
          }
          v100 = [v36 NF_arrayForKey:@"kCommands"];
          if (![v100 count]
            || (unint64_t v101 = [(NFRemoteAdminRedirectSession *)self executeScript:v36], v101 == 6)
            || (unint64_t v4 = v101) == 0)
          {
            unsigned int v102 = [v36 NF_dictionaryForKey:@"kNotification"];
            if (v102) {
              [(NFRemoteAdminRedirectSession *)self processNotification:v102];
            }
            if ([v100 count]) {
              unint64_t v4 = 6;
            }
            else {
              unint64_t v4 = 0;
            }
          }
          id v8 = v113;
          id v5 = v114;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v55 = NFLogGetLogger();
          if (v55)
          {
            BOOL v56 = (void (*)(uint64_t, const char *, ...))v55;
            v57 = object_getClass(self);
            BOOL v58 = class_isMetaClass(v57);
            uint64_t v59 = v7;
            v60 = v6;
            id v61 = v8;
            uint64_t v62 = object_getClassName(self);
            int v110 = sel_getName("_processRedirectCommands:");
            uint64_t v63 = 45;
            if (v58) {
              uint64_t v63 = 43;
            }
            v105 = v62;
            id v8 = v61;
            id v6 = v60;
            v7 = v59;
            v56(6, "%c[%{public}s %{public}s]:%i no further action required", v63, v105, v110, 330);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v53 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            id v64 = object_getClass(self);
            BOOL v65 = v53;
            if (class_isMetaClass(v64)) {
              int v66 = 43;
            }
            else {
              int v66 = 45;
            }
            uint64_t v67 = object_getClassName(self);
            v68 = sel_getName("_processRedirectCommands:");
            *(_DWORD *)buf = 67109890;
            int v118 = v66;
            BOOL v53 = v65;
            __int16 v119 = 2082;
            id v120 = v67;
            __int16 v121 = 2082;
            int v122 = v68;
            __int16 v123 = 1024;
            int v124 = 330;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i no further action required", buf, 0x22u);
          }
          unint64_t v4 = 0;
        }
      }
      else
      {
        unint64_t v4 = 0;
      }
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v26 = NFLogGetLogger();
    if (v26)
    {
      double v27 = (void (*)(uint64_t, const char *, ...))v26;
      double v28 = object_getClass(self);
      BOOL v29 = class_isMetaClass(v28);
      id v30 = object_getClassName(self);
      long long v109 = sel_getName(a2);
      uint64_t v31 = 45;
      if (v29) {
        uint64_t v31 = 43;
      }
      v27(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v31, v30, v109, 404);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v118 = v33;
      __int16 v119 = 2082;
      id v120 = object_getClassName(self);
      __int16 v121 = 2082;
      int v122 = sel_getName(a2);
      __int16 v123 = 1024;
      int v124 = 404;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
    }
    unint64_t v4 = 3;
  }

  return v4;
}

- (unint64_t)performCheckIn
{
  id v5 = [(NFRemoteAdminRedirectSession *)self getNextRequest];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v5)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Sending redirect result to TSM", v11, ClassName, Name, 448);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v46 = v14;
      __int16 v47 = 2082;
      v48 = object_getClassName(self);
      __int16 v49 = 2082;
      uint64_t v50 = sel_getName(a2);
      __int16 v51 = 1024;
      int v52 = 448;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Sending redirect result to TSM", buf, 0x22u);
    }

    id v15 = objc_opt_new();
    id v16 = [(NFRemoteAdminRedirectSession *)self redirectState];
    id v17 = [v16 httpHeaderInfo];
    id v44 = 0;
    unint64_t v18 = [(NFRemoteAdminRedirectSession *)self executeHttpRequest:v5 httpHeader:v17 response:v15 responseHeader:0 duration:0 sessionError:&v44];
    id v19 = v44;

    uint64_t v20 = [v15 NF_numberForKey:@"kStartNewSession"];
    if ([v20 BOOLValue])
    {
      id v21 = sub_100037740();
      id v22 = [(NFRemoteAdminState *)self->_redirectState serverIdentifier];
      int v23 = sub_10003BD48(v21, v22);

      [v23 setPendingImmediateRetry:1];
      [v23 save];
      unint64_t v18 = 12;
    }
    else
    {
      if (v18 <= 0xC && ((1 << v18) & 0x1011) != 0) {
        goto LABEL_26;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
        int v33 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v33);
        v43 = object_getClassName(self);
        v34 = sel_getName(a2);
        uint64_t v35 = 45;
        if (v42) {
          uint64_t v35 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i Failed to post redirect result to TSM, status=0x%lx", v35, v43, v34, 463, v18);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v36 = object_getClass(self);
        if (class_isMetaClass(v36)) {
          int v37 = 43;
        }
        else {
          int v37 = 45;
        }
        id v38 = object_getClassName(self);
        uint64_t v39 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v46 = v37;
        __int16 v47 = 2082;
        v48 = v38;
        __int16 v49 = 2082;
        uint64_t v50 = v39;
        __int16 v51 = 1024;
        int v52 = 463;
        __int16 v53 = 2048;
        unint64_t v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to post redirect result to TSM, status=0x%lx", buf, 0x2Cu);
      }
    }

LABEL_26:
    goto LABEL_27;
  }
  if (Logger)
  {
    uint64_t v24 = object_getClass(self);
    BOOL v25 = class_isMetaClass(v24);
    uint64_t v26 = object_getClassName(self);
    v41 = sel_getName(a2);
    uint64_t v27 = 45;
    if (v25) {
      uint64_t v27 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v27, v26, v41, 444);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    double v28 = object_getClass(self);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v46 = v29;
    __int16 v47 = 2082;
    v48 = object_getClassName(self);
    __int16 v49 = 2082;
    uint64_t v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 444;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
  }
  unint64_t v18 = 3;
LABEL_27:

  return v18;
}

- (unint64_t)run
{
  id v253 = 0;
  unint64_t v4 = +[NFSecureElement embeddedSecureElementWithError:&v253];
  id v5 = v253;
  if (!v4 || ([v4 available] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", v13, ClassName, Name, 656, v5);
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
      id v17 = object_getClassName(self);
      unint64_t v18 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v256 = v16;
      __int16 v257 = 2082;
      v258 = v17;
      __int16 v259 = 2082;
      v260 = v18;
      __int16 v261 = 1024;
      int v262 = 656;
      __int16 v263 = 2114;
      id v264 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", buf, 0x2Cu);
    }

    id v19 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v19 setStep:3];

    unint64_t v8 = 1;
    goto LABEL_15;
  }
  id v6 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v7 = [v6 step];

  id v252 = v5;
  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    if (self)
    {
      id v254 = 0;
      id v22 = +[NFSecureElement embeddedSecureElementWithError:&v254];
      id v23 = v254;
      uint64_t v24 = [v22 serialNumber];
      if (v24)
      {
        BOOL v25 = [(NFRemoteAdminRedirectSession *)self targetSEID];
        id v26 = [v25 caseInsensitiveCompare:v24];

        if (v26)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v27 = NFLogGetLogger();
          if (v27)
          {
            double v28 = (void (*)(uint64_t, const char *, ...))v27;
            int v29 = object_getClass(self);
            BOOL v30 = class_isMetaClass(v29);
            uint64_t v31 = object_getClassName(self);
            id v32 = v23;
            int v33 = sel_getName("_redirectStart");
            v34 = [(NFRemoteAdminRedirectSession *)self targetSEID];
            v239 = v33;
            id v23 = v32;
            uint64_t v35 = 45;
            if (v30) {
              uint64_t v35 = 43;
            }
            v28(5, "%c[%{public}s %{public}s]:%i Invalid target SEID:%{public}@", v35, v31, v239, 484, v34);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v36 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            int v37 = object_getClass(self);
            if (class_isMetaClass(v37)) {
              int v38 = 43;
            }
            else {
              int v38 = 45;
            }
            uint64_t v39 = object_getClassName(self);
            id v40 = v23;
            v41 = sel_getName("_redirectStart");
            BOOL v42 = [(NFRemoteAdminRedirectSession *)self targetSEID];
            *(_DWORD *)buf = 67110146;
            int v256 = v38;
            __int16 v257 = 2082;
            v258 = v39;
            __int16 v259 = 2082;
            v260 = v41;
            id v23 = v40;
            __int16 v261 = 1024;
            int v262 = 484;
            __int16 v263 = 2114;
            id v264 = v42;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid target SEID:%{public}@", buf, 0x2Cu);
          }
          v43 = [(NFRemoteAdminRedirectSession *)self redirectState];
          [v43 setStep:2];

          id v44 = [(NFRemoteAdminRedirectSession *)self redirectState];
          [v44 setIncompleteReason:@"ScriptExecutionError"];
        }
        else
        {
          id v44 = [(NFRemoteAdminRedirectSession *)self redirectState];
          [v44 setStep:1];
        }

        uint64_t v50 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v50 save];
        unint64_t v8 = 0;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v45 = NFLogGetLogger();
        if (v45)
        {
          int v46 = (void (*)(uint64_t, const char *, ...))v45;
          __int16 v47 = object_getClass(self);
          BOOL v48 = class_isMetaClass(v47);
          v233 = object_getClassName(self);
          v240 = sel_getName("_redirectStart");
          uint64_t v49 = 45;
          if (v48) {
            uint64_t v49 = 43;
          }
          v46(3, "%c[%{public}s %{public}s]:%i Missing primary SEID (error - %{public}@", v49, v233, v240, 478, v23);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v50 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          __int16 v51 = object_getClass(self);
          if (class_isMetaClass(v51)) {
            int v52 = 43;
          }
          else {
            int v52 = 45;
          }
          __int16 v53 = object_getClassName(self);
          unint64_t v54 = sel_getName("_redirectStart");
          *(_DWORD *)buf = 67110146;
          int v256 = v52;
          __int16 v257 = 2082;
          v258 = v53;
          __int16 v259 = 2082;
          v260 = v54;
          __int16 v261 = 1024;
          int v262 = 478;
          __int16 v263 = 2114;
          id v264 = v23;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing primary SEID (error - %{public}@", buf, 0x2Cu);
        }
        unint64_t v8 = 4;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    id v5 = v252;
  }
  uint64_t v55 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v56 = [v55 step];

  if (v56 == (id)1)
  {
    if (self)
    {
      self->_performInitialAIDSelectFromWhitelist = 1;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v57 = NFLogGetLogger();
      if (v57)
      {
        BOOL v58 = (void (*)(uint64_t, const char *, ...))v57;
        uint64_t v59 = object_getClass(self);
        BOOL v60 = class_isMetaClass(v59);
        id v61 = object_getClassName(self);
        v241 = sel_getName("_redirectInProgress");
        uint64_t v62 = 45;
        if (v60) {
          uint64_t v62 = 43;
        }
        v58(6, "%c[%{public}s %{public}s]:%i Communicating with SP-TSM", v62, v61, v241, 531);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v63 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = object_getClass(self);
        if (class_isMetaClass(v64)) {
          int v65 = 43;
        }
        else {
          int v65 = 45;
        }
        int v66 = object_getClassName(self);
        uint64_t v67 = sel_getName("_redirectInProgress");
        *(_DWORD *)buf = 67109890;
        int v256 = v65;
        __int16 v257 = 2082;
        v258 = v66;
        __int16 v259 = 2082;
        v260 = v67;
        __int16 v261 = 1024;
        int v262 = 531;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Communicating with SP-TSM", buf, 0x22u);
      }

      mach_continuous_time();
      if ([(NFRemoteAdminRedirectSession *)self openSession])
      {
        v68 = [(NFRemoteAdminRedirectSession *)self redirectState];
        int v69 = [v68 redirectUrl];
        unsigned __int8 v70 = [(NFRemoteAdminRedirectSession *)self openConnection:v69];

        if (v70)
        {
          if (![(NFRemoteAdminRedirectSession *)self aborted])
          {
            unint64_t v71 = 0;
            do
            {
              unint64_t v72 = [(NFRemoteAdminRedirectSession *)self performRedirect];
              if (v72 == 6)
              {
                unint64_t v71 = 0;
              }
              else
              {
                uint64_t v73 = v72;
                BOOL v74 = v72 == 15 || v72 == 3;
                if (!v74 || v71 > 2) {
                  goto LABEL_100;
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v75 = NFLogGetLogger();
                if (v75)
                {
                  v76 = (void (*)(uint64_t, const char *, ...))v75;
                  uint64_t v77 = object_getClass(self);
                  BOOL v78 = class_isMetaClass(v77);
                  uint64_t v79 = object_getClassName(self);
                  int v80 = sel_getName("_redirectInProgress");
                  uint64_t v81 = 45;
                  if (v78) {
                    uint64_t v81 = 43;
                  }
                  v76(6, "%c[%{public}s %{public}s]:%i Retrying in %d seconds", v81, v79, v80, 546, dword_10004505C[v71]);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                BOOL v82 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                {
                  v83 = object_getClass(self);
                  if (class_isMetaClass(v83)) {
                    int v84 = 43;
                  }
                  else {
                    int v84 = 45;
                  }
                  uint64_t v85 = object_getClassName(self);
                  uint64_t v86 = sel_getName("_redirectInProgress");
                  unsigned int v87 = dword_10004505C[v71];
                  *(_DWORD *)buf = 67110146;
                  int v256 = v84;
                  __int16 v257 = 2082;
                  v258 = v85;
                  __int16 v259 = 2082;
                  v260 = v86;
                  __int16 v261 = 1024;
                  int v262 = 546;
                  __int16 v263 = 1024;
                  LODWORD(v264) = v87;
                  _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Retrying in %d seconds", buf, 0x28u);
                }

                sleep(dword_10004505C[v71++]);
              }
            }
            while (![(NFRemoteAdminRedirectSession *)self aborted]);
          }
          uint64_t v73 = 6;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v101 = NFLogGetLogger();
          if (v101)
          {
            unsigned int v102 = (void (*)(uint64_t, const char *, ...))v101;
            uint64_t v103 = object_getClass(self);
            BOOL v104 = class_isMetaClass(v103);
            v105 = object_getClassName(self);
            v243 = sel_getName("_redirectInProgress");
            uint64_t v106 = 45;
            if (v104) {
              uint64_t v106 = 43;
            }
            v102(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v106, v105, v243, 535);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v107 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
            uint64_t v108 = object_getClass(self);
            if (class_isMetaClass(v108)) {
              int v109 = 43;
            }
            else {
              int v109 = 45;
            }
            int v110 = object_getClassName(self);
            long long v111 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            int v256 = v109;
            __int16 v257 = 2082;
            v258 = v110;
            __int16 v259 = 2082;
            v260 = v111;
            __int16 v261 = 1024;
            int v262 = 535;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
          }

          uint64_t v73 = 2;
        }
LABEL_100:
        if ([(NFRemoteAdminRedirectSession *)self aborted]) {
          unint64_t v8 = 1;
        }
        else {
          unint64_t v8 = v73;
        }
        sub_10001484C(self, v8);
        [(NFRemoteAdminRedirectSession *)self closeConnection];
        [(NFRemoteAdminRedirectSession *)self closeSession];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v112 = NFLogGetLogger();
        if (v112)
        {
          id v113 = (void (*)(uint64_t, const char *, ...))v112;
          v114 = object_getClass(self);
          BOOL v115 = class_isMetaClass(v114);
          v235 = object_getClassName(self);
          v244 = sel_getName("_redirectInProgress");
          uint64_t v116 = 45;
          if (v115) {
            uint64_t v116 = 43;
          }
          v113(6, "%c[%{public}s %{public}s]:%i Redirect processing completed: %d", v116, v235, v244, 560, v8);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v117 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          int v118 = object_getClass(self);
          if (class_isMetaClass(v118)) {
            int v119 = 43;
          }
          else {
            int v119 = 45;
          }
          id v120 = object_getClassName(self);
          __int16 v121 = sel_getName("_redirectInProgress");
          *(_DWORD *)buf = 67110146;
          int v256 = v119;
          __int16 v257 = 2082;
          v258 = v120;
          __int16 v259 = 2082;
          v260 = v121;
          __int16 v261 = 1024;
          int v262 = 560;
          __int16 v263 = 1024;
          LODWORD(v264) = v8;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect processing completed: %d", buf, 0x28u);
        }

        int v100 = 1;
        id v5 = v252;
      }
      else
      {
        unsigned int v88 = [(NFRemoteAdminRedirectSession *)self aborted];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v89 = NFLogGetLogger();
        unsigned int v90 = (void (*)(uint64_t, const char *, ...))v89;
        if (v88)
        {
          if (v89)
          {
            uint64_t v91 = object_getClass(self);
            BOOL v92 = class_isMetaClass(v91);
            __int16 v93 = object_getClassName(self);
            v242 = sel_getName("_redirectInProgress");
            uint64_t v94 = 45;
            if (v92) {
              uint64_t v94 = 43;
            }
            v234 = v93;
            id v5 = v252;
            v90(6, "%c[%{public}s %{public}s]:%i Aborted", v94, v234, v242, 562);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v95 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            v96 = object_getClass(self);
            if (class_isMetaClass(v96)) {
              int v97 = 43;
            }
            else {
              int v97 = 45;
            }
            int v98 = object_getClassName(self);
            int v99 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            int v256 = v97;
            __int16 v257 = 2082;
            v258 = v98;
            __int16 v259 = 2082;
            v260 = v99;
            __int16 v261 = 1024;
            int v262 = 562;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted", buf, 0x22u);
          }

          unint64_t v8 = 1;
          sub_10001484C(self, 1);
          int v100 = 1;
        }
        else
        {
          if (v89)
          {
            int v122 = object_getClass(self);
            BOOL v123 = class_isMetaClass(v122);
            int v124 = object_getClassName(self);
            v245 = sel_getName("_redirectInProgress");
            uint64_t v125 = 45;
            if (v123) {
              uint64_t v125 = 43;
            }
            v236 = v124;
            id v5 = v252;
            v90(3, "%c[%{public}s %{public}s]:%i Failed to open SE wired mode", v125, v236, v245, 566);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          unint64_t v126 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            v127 = object_getClass(self);
            if (class_isMetaClass(v127)) {
              int v128 = 43;
            }
            else {
              int v128 = 45;
            }
            int v129 = object_getClassName(self);
            __int16 v130 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            int v256 = v128;
            __int16 v257 = 2082;
            v258 = v129;
            __int16 v259 = 2082;
            v260 = v130;
            __int16 v261 = 1024;
            int v262 = 566;
            _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open SE wired mode", buf, 0x22u);
          }

          int v100 = 0;
          unint64_t v8 = 14;
        }
      }
      id v131 = [(NFRemoteAdminRedirectSession *)self redirectState];
      v132 = [v131 performanceMetrics];
      mach_continuous_time();
      double v133 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime() / 1000.0;
      [v132 totalSessionTime];
      [v132 setTotalSessionTime:v134 + v133];

      if (v100)
      {
        v135 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v135 incrementStep];

        v136 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v136 clearRetryInterval];

        v137 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v137 save];
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  v138 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v139 = [v138 step];

  if (v139 != (id)2) {
    goto LABEL_16;
  }
  if (!self)
  {
    unint64_t v8 = 0;
    goto LABEL_16;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v140 = NFLogGetLogger();
  if (v140)
  {
    v141 = (void (*)(uint64_t, const char *, ...))v140;
    v142 = object_getClass(self);
    BOOL v143 = class_isMetaClass(v142);
    v144 = object_getClassName(self);
    v246 = sel_getName("_redirectCheckIn");
    uint64_t v145 = 45;
    if (v143) {
      uint64_t v145 = 43;
    }
    v141(6, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", v145, v144, v246, 608);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v146 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
  {
    v147 = object_getClass(self);
    if (class_isMetaClass(v147)) {
      int v148 = 43;
    }
    else {
      int v148 = 45;
    }
    v149 = object_getClassName(self);
    v150 = sel_getName("_redirectCheckIn");
    *(_DWORD *)buf = 67109890;
    int v256 = v148;
    __int16 v257 = 2082;
    v258 = v149;
    __int16 v259 = 2082;
    v260 = v150;
    __int16 v261 = 1024;
    int v262 = 608;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", buf, 0x22u);
  }

  unint64_t v151 = 0;
  char v152 = 0;
  unint64_t v8 = 4;
  do
  {
    if ((v152 & 1) != 0
      || ([(NFRemoteAdminRedirectSession *)self redirectState],
          v153 = objc_claimAutoreleasedReturnValue(),
          [v153 sourceUrl],
          v154 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v155 = [(NFRemoteAdminRedirectSession *)self openConnection:v154],
          v154,
          v153,
          (v155 & 1) != 0))
    {
      unint64_t v156 = [(NFRemoteAdminRedirectSession *)self performCheckIn];
      char v152 = 1;
      if (v156 == 6) {
        continue;
      }
      if (v156 != 3)
      {
        unint64_t v8 = v156;
        goto LABEL_171;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v157 = NFLogGetLogger();
      if (v157)
      {
        v158 = (void (*)(uint64_t, const char *, ...))v157;
        v159 = object_getClass(self);
        BOOL v160 = class_isMetaClass(v159);
        v161 = object_getClassName(self);
        v247 = sel_getName("_redirectCheckIn");
        uint64_t v162 = 45;
        if (v160) {
          uint64_t v162 = 43;
        }
        v158(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v162, v161, v247, 615);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v163 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
      {
        v164 = object_getClass(self);
        if (class_isMetaClass(v164)) {
          int v165 = 43;
        }
        else {
          int v165 = 45;
        }
        v166 = object_getClassName(self);
        v167 = sel_getName("_redirectCheckIn");
        *(_DWORD *)buf = 67109890;
        int v256 = v165;
        __int16 v257 = 2082;
        v258 = v166;
        __int16 v259 = 2082;
        v260 = v167;
        __int16 v261 = 1024;
        int v262 = 615;
        _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
      }

      v168 = [(NFRemoteAdminRedirectSession *)self redirectState];
      uint64_t v169 = [v168 retryInterval];
      v170 = (void *)v169;
      if (v169) {
        v171 = *(void **)(v169 + 16);
      }
      else {
        v171 = 0;
      }
      id v172 = v171;

      if (v172) {
        goto LABEL_171;
      }
      char v152 = 0;
    }
    v173 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v173 clearRetryInterval];

    if (v151 > 2) {
      goto LABEL_171;
    }
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v174 = NFLogGetLogger();
      if (v174)
      {
        v175 = (void (*)(uint64_t, const char *, ...))v174;
        v176 = object_getClass(self);
        BOOL v177 = class_isMetaClass(v176);
        v178 = object_getClassName(self);
        v179 = sel_getName("_redirectCheckIn");
        uint64_t v180 = 45;
        if (v177) {
          uint64_t v180 = 43;
        }
        v175(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v180, v178, v179, 630, dword_10004505C[v151]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v181 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
      {
        v182 = object_getClass(self);
        if (class_isMetaClass(v182)) {
          int v183 = 43;
        }
        else {
          int v183 = 45;
        }
        v184 = object_getClassName(self);
        v185 = sel_getName("_redirectCheckIn");
        unsigned int v186 = dword_10004505C[v151];
        *(_DWORD *)buf = 67110146;
        int v256 = v183;
        __int16 v257 = 2082;
        v258 = v184;
        __int16 v259 = 2082;
        v260 = v185;
        __int16 v261 = 1024;
        int v262 = 630;
        __int16 v263 = 1024;
        LODWORD(v264) = v186;
        _os_log_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
      }
    }
    sleep(dword_10004505C[v151++]);
  }
  while (![(NFRemoteAdminRedirectSession *)self aborted]);
  unint64_t v8 = 6;
LABEL_171:
  id v5 = v252;
  switch(__ROR8__(v8, 2))
  {
    case 0:
    case 3:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v187 = NFLogGetLogger();
      if (v187)
      {
        v188 = (void (*)(uint64_t, const char *, ...))v187;
        v189 = object_getClass(self);
        BOOL v190 = class_isMetaClass(v189);
        v191 = object_getClassName(self);
        v248 = sel_getName("_processRedirectCheckInResult:");
        uint64_t v192 = 45;
        if (v190) {
          uint64_t v192 = 43;
        }
        v237 = v191;
        id v5 = v252;
        v188(6, "%c[%{public}s %{public}s]:%i Redirect check in completed", v192, v237, v248, 586);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v193 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
      {
        v194 = object_getClass(self);
        if (class_isMetaClass(v194)) {
          int v195 = 43;
        }
        else {
          int v195 = 45;
        }
        v196 = object_getClassName(self);
        v197 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        int v256 = v195;
        __int16 v257 = 2082;
        v258 = v196;
        __int16 v259 = 2082;
        v260 = v197;
        __int16 v261 = 1024;
        int v262 = 586;
        _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect check in completed", buf, 0x22u);
      }

      v198 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v198 incrementStep];
      goto LABEL_213;
    case 1:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v199 = NFLogGetLogger();
      if (v199)
      {
        v200 = (void (*)(uint64_t, const char *, ...))v199;
        v201 = object_getClass(self);
        BOOL v202 = class_isMetaClass(v201);
        v203 = object_getClassName(self);
        v249 = sel_getName("_processRedirectCheckInResult:");
        uint64_t v204 = 45;
        if (v202) {
          uint64_t v204 = 43;
        }
        v200(6, "%c[%{public}s %{public}s]:%i Redirect check in - long retry", v204, v203, v249, 592);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v205 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
      {
        v206 = object_getClass(self);
        if (class_isMetaClass(v206)) {
          int v207 = 43;
        }
        else {
          int v207 = 45;
        }
        v208 = object_getClassName(self);
        v209 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        int v256 = v207;
        __int16 v257 = 2082;
        v258 = v208;
        __int16 v259 = 2082;
        v260 = v209;
        __int16 v261 = 1024;
        int v262 = 592;
        _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect check in - long retry", buf, 0x22u);
      }

      v198 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v198 incrementLongRetry];
      unint64_t v8 = 4;
      goto LABEL_213;
    case 2:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v210 = NFLogGetLogger();
      if (v210)
      {
        v211 = (void (*)(uint64_t, const char *, ...))v210;
        v212 = object_getClass(self);
        BOOL v213 = class_isMetaClass(v212);
        v214 = object_getClassName(self);
        v250 = sel_getName("_processRedirectCheckInResult:");
        uint64_t v215 = 45;
        if (v213) {
          uint64_t v215 = 43;
        }
        v211(6, "%c[%{public}s %{public}s]:%i Device not registered", v215, v214, v250, 589);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v216 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
      {
        v217 = object_getClass(self);
        if (class_isMetaClass(v217)) {
          int v218 = 43;
        }
        else {
          int v218 = 45;
        }
        v219 = object_getClassName(self);
        v220 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        int v256 = v218;
        __int16 v257 = 2082;
        v258 = v219;
        __int16 v259 = 2082;
        v260 = v220;
        __int16 v261 = 1024;
        int v262 = 589;
        _os_log_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Device not registered", buf, 0x22u);
      }

      v198 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v198 incrementStep];
      unint64_t v8 = 8;
      goto LABEL_213;
    default:
      if (![(NFRemoteAdminRedirectSession *)self aborted]) {
        goto LABEL_214;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v221 = NFLogGetLogger();
      if (v221)
      {
        v222 = (void (*)(uint64_t, const char *, ...))v221;
        v223 = object_getClass(self);
        BOOL v224 = class_isMetaClass(v223);
        v225 = object_getClassName(self);
        v251 = sel_getName("_processRedirectCheckInResult:");
        uint64_t v226 = 45;
        if (v224) {
          uint64_t v226 = 43;
        }
        v222(6, "%c[%{public}s %{public}s]:%i Abort check in", v226, v225, v251, 595);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v227 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
      {
        v228 = object_getClass(self);
        if (class_isMetaClass(v228)) {
          int v229 = 43;
        }
        else {
          int v229 = 45;
        }
        v230 = object_getClassName(self);
        v231 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        int v256 = v229;
        __int16 v257 = 2082;
        v258 = v230;
        __int16 v259 = 2082;
        v260 = v231;
        __int16 v261 = 1024;
        int v262 = 595;
        _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort check in", buf, 0x22u);
      }

      v198 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v198 incrementStep];
      unint64_t v8 = 1;
LABEL_213:

LABEL_214:
      [(NFRemoteAdminRedirectSession *)self closeConnection];
      break;
  }
LABEL_15:
  uint64_t v20 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v20 save];

LABEL_16:
  return v8;
}

- (BOOL)startNewSession
{
  return 1;
}

- (BOOL)openSession
{
  seSession = self->_seSession;
  if (!seSession)
  {
    id v5 = sub_10001AEC4();
    sub_10001FDA4((uint64_t)v5);

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = +[NFHardwareManager sharedHardwareManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000166A4;
    v15[3] = &unk_1000587A0;
    v15[4] = self;
    SEL v17 = a2;
    unint64_t v8 = v6;
    int v16 = v8;
    id v9 = [v7 startSecureElementManagerSessionWithPriority:v15];

    do
    {
      if ([(NFRemoteAdminRedirectSession *)self aborted]) {
        break;
      }
      dispatch_time_t v10 = dispatch_time(0, 119000000000);
      intptr_t v11 = dispatch_semaphore_wait(v8, v10);
      uint64_t v12 = sub_10001AEC4();
      sub_10001FDFC(v12);
    }
    while (v11);
    uint64_t v13 = sub_10001AEC4();
    sub_10001FD4C((uint64_t)v13);

    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      [v9 endSessionWithCompletion:&stru_1000587C0];

      return 0;
    }

    seSession = self->_seSession;
  }
  return seSession != 0;
}

- (BOOL)closeSession
{
  seSession = self->_seSession;
  if (seSession && self->_allocateSESession) {
    [(NFSecureElementManagerSession *)seSession endSessionWithCompletion:&stru_1000587E0];
  }
  return 1;
}

- (BOOL)openConnection:(id)a3
{
  id v5 = a3;
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i [TSM] %@", v10, ClassName, Name, 741, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    intptr_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v62 = v13;
      __int16 v63 = 2082;
      id v64 = object_getClassName(self);
      __int16 v65 = 2082;
      int v66 = sel_getName(a2);
      __int16 v67 = 1024;
      int v68 = 741;
      __int16 v69 = 2112;
      id v70 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] %@", buf, 0x2Cu);
    }
  }
  int v14 = +[NSURL URLWithString:v5];
  if (!v14)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v35 = NFLogGetLogger();
    if (v35)
    {
      int v36 = (void (*)(uint64_t, const char *, ...))v35;
      int v37 = object_getClass(self);
      BOOL v38 = class_isMetaClass(v37);
      uint64_t v57 = object_getClassName(self);
      uint64_t v59 = sel_getName(a2);
      uint64_t v39 = 45;
      if (v38) {
        uint64_t v39 = 43;
      }
      v36(3, "%c[%{public}s %{public}s]:%i Invalid URL string: %{public}@", v39, v57, v59, 745, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v33 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      BOOL v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v62 = v41;
      __int16 v63 = 2082;
      id v64 = v42;
      __int16 v65 = 2082;
      int v66 = v43;
      __int16 v67 = 1024;
      int v68 = 745;
      __int16 v69 = 2114;
      id v70 = v5;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URL string: %{public}@", buf, 0x2Cu);
    }
    goto LABEL_46;
  }
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      int v16 = (void (*)(uint64_t, const char *, ...))v15;
      SEL v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      id v19 = object_getClassName(self);
      uint64_t v20 = sel_getName(a2);
      id v21 = [v14 absoluteString];
      uint64_t v22 = 45;
      if (v18) {
        uint64_t v22 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i [TSM] url: %@", v22, v19, v20, 749, v21);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      id v26 = object_getClassName(self);
      uint64_t v27 = sel_getName(a2);
      double v28 = [v14 absoluteString];
      *(_DWORD *)buf = 67110146;
      int v62 = v25;
      __int16 v63 = 2082;
      id v64 = v26;
      __int16 v65 = 2082;
      int v66 = v27;
      __int16 v67 = 1024;
      int v68 = 749;
      __int16 v69 = 2112;
      id v70 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] url: %@", buf, 0x2Cu);
    }
  }
  int v29 = [NFRemoteAdminConnectionHTTP alloc];
  BOOL v30 = [(NFRemoteAdminRedirectSession *)self redirectState];
  BOOL v31 = [v30 step] != (id)1;
  id v32 = +[NFSecureElement embeddedSecureElementWithError:0];
  int v33 = -[NFRemoteAdminConnectionHTTP initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:](v29, "initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:", v14, 0, v31, [v32 isProductionSigned] ^ 1);

  if (!v33)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v44 = NFLogGetLogger();
    if (v44)
    {
      uint64_t v45 = (void (*)(uint64_t, const char *, ...))v44;
      int v46 = object_getClass(self);
      BOOL v47 = class_isMetaClass(v46);
      BOOL v48 = object_getClassName(self);
      BOOL v60 = sel_getName(a2);
      uint64_t v49 = 45;
      if (v47) {
        uint64_t v49 = 43;
      }
      v45(3, "%c[%{public}s %{public}s]:%i Failed to create connection", v49, v48, v60, 757);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      __int16 v51 = object_getClass(self);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      __int16 v53 = object_getClassName(self);
      unint64_t v54 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v62 = v52;
      __int16 v63 = 2082;
      id v64 = v53;
      __int16 v65 = 2082;
      int v66 = v54;
      __int16 v67 = 1024;
      int v68 = 757;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create connection", buf, 0x22u);
    }

    int v33 = 0;
    goto LABEL_46;
  }
  if ([v33 connect])
  {
LABEL_46:
    BOOL v34 = 0;
    goto LABEL_47;
  }
  [(NFRemoteAdminRedirectSession *)self setConnection:v33];
  BOOL v34 = 1;
LABEL_47:

  return v34;
}

- (void)closeConnection
{
  BOOL v3 = [(NFRemoteAdminRedirectSession *)self connection];

  if (v3)
  {
    unint64_t v4 = [(NFRemoteAdminRedirectSession *)self connection];
    [v4 disconnect];

    [(NFRemoteAdminRedirectSession *)self setConnection:0];
  }
}

- (NFRemoteAdminRedirectState)redirectState
{
  return self->_redirectState;
}

- (NSString)targetSEID
{
  return self->_targetSEID;
}

- (NFRemoteAdminConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unsigned)redirectStepError
{
  return self->_redirectStepError;
}

- (void)setRedirectStepError:(unsigned int)a3
{
  self->_unsigned int redirectStepError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetSEID, 0);
  objc_storeStrong((id *)&self->_redirectState, 0);
  objc_storeStrong((id *)&self->_seSession, 0);

  objc_storeStrong((id *)&self->_seStateInfos, 0);
}

@end