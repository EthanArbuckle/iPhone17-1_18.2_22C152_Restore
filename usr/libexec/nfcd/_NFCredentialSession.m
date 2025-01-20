@interface _NFCredentialSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)_validateCAPDU:(id)a3 isDFSelectCommand:(BOOL *)a4 outError:(id *)a5;
- (BOOL)appletSelectedInWiredMode;
- (BOOL)firstFieldNotification;
- (BOOL)seDirty;
- (BOOL)shouldHandleSecureElementTransactionData;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)willStartSession;
- (NFSecureElementWrapper)secureElementWrapper;
- (NFTimer)firstFieldNotificationTimer;
- (NSData)defaultWiredModeApplet;
- (NSDictionary)requestedApplets;
- (NSSet)allowedAIDsListInWiredMode;
- (_NFCredentialSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (id)_startCardEmulationWithApplet:(id)a3 externalAuth:(id)a4;
- (id)_startWiredModeWithExternalAuth:(id)a3 applets:(id)a4 selectOnStart:(id)a5;
- (id)initialRoutingConfig;
- (os_unfair_lock_s)requestedAppletsLock;
- (void)_setupFirstFieldNotificationTimer:(unint64_t)a3;
- (void)cleanup;
- (void)deleteApplets:(id)a3 completion:(id)a4;
- (void)didStartSession:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4;
- (void)handleTimerExpiredEvent:(id)a3;
- (void)listAppletsAndRefreshCache:(BOOL)a3 completion:(id)a4;
- (void)queryExtraInfoForApplets:(id)a3 completion:(id)a4;
- (void)requestApplets:(id)a3 selectOnStart:(id)a4 AIDAllowList:(id)a5 externalAuth:(id)a6 mode:(unint64_t)a7 completion:(id)a8;
- (void)setAllowedAIDsListInWiredMode:(id)a3;
- (void)setAppletSelectedInWiredMode:(BOOL)a3;
- (void)setDefaultWiredModeApplet:(id)a3;
- (void)setFirstFieldNotification:(BOOL)a3;
- (void)setFirstFieldNotificationTimer:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setRequestedApplets:(id)a3;
- (void)setRequestedAppletsLock:(os_unfair_lock_s)a3;
- (void)setSeDirty:(BOOL)a3;
- (void)setSecureElementWrapper:(id)a3;
- (void)signChallenge:(id)a3 completion:(id)a4;
- (void)transceive:(id)a3 completion:(id)a4;
@end

@implementation _NFCredentialSession

- (_NFCredentialSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)_NFCredentialSession;
  v6 = [(_NFXPCSession *)&v10 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6];
  v7 = v6;
  if (v6)
  {
    v6->_mode = 0;
    v6->_requestedAppletsLock._os_unfair_lock_opaque = 0;
    v8 = v6;
  }

  return v7;
}

- (BOOL)_validateCAPDU:(id)a3 isDFSelectCommand:(BOOL *)a4 outError:(id *)a5
{
  id v9 = a3;
  id v10 = [objc_alloc((Class)NFCommandAPDU) initWithData:v9];
  v11 = v10;
  if (a4) {
    *a4 = 0;
  }
  if (!v10)
  {
    if (a5)
    {
      id v14 = objc_alloc((Class)NSError);
      v15 = +[NSString stringWithUTF8String:"nfcd"];
      v111[0] = NSLocalizedDescriptionKey;
      v16 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      v112[0] = v16;
      v112[1] = &off_10031A8A8;
      v111[1] = @"Line";
      v111[2] = @"Method";
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v112[2] = v17;
      v111[3] = NSDebugDescriptionErrorKey;
      id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 65];
      v112[3] = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
      v20 = v14;
      v21 = v15;
      uint64_t v22 = 10;
LABEL_61:
      *a5 = [v20 initWithDomain:v21 code:v22 userInfo:v19];
LABEL_62:

LABEL_63:
LABEL_64:

      LOBYTE(a5) = 0;
      goto LABEL_66;
    }
    goto LABEL_66;
  }
  if (([v10 clss] & 0x80) != 0) {
    goto LABEL_65;
  }
  if ([v11 instruction] != 164) {
    goto LABEL_57;
  }
  if ([v11 p1] != 4)
  {
LABEL_65:
    LOBYTE(a5) = 1;
    goto LABEL_66;
  }
  int v12 = [v11 clss] & 0xC0;
  unsigned int v13 = [v11 clss];
  if (v12 == 64)
  {
    if ((v13 & 0x20) == 0) {
      goto LABEL_25;
    }
LABEL_14:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v29 = [v9 NF_asHexString];
      uint64_t v30 = 45;
      if (isMetaClass) {
        uint64_t v30 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Select command not supported: %{public}@", v30, ClassName, Name, 99, v29);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      v36 = [v9 NF_asHexString];
      *(_DWORD *)buf = 67110146;
      int v102 = v33;
      __int16 v103 = 2082;
      v104 = v34;
      __int16 v105 = 2082;
      v106 = v35;
      __int16 v107 = 1024;
      int v108 = 99;
      __int16 v109 = 2114;
      v110 = v36;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Select command not supported: %{public}@", buf, 0x2Cu);
    }
    if (!a5) {
      goto LABEL_66;
    }
    id v37 = objc_alloc((Class)NSError);
    v15 = +[NSString stringWithUTF8String:"nfcd"];
    v99[0] = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:"Security Violation"];
    v100[0] = v16;
    v100[1] = &off_10031A8C0;
    v99[1] = @"Line";
    v99[2] = @"Method";
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v100[2] = v17;
    v99[3] = NSDebugDescriptionErrorKey;
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 101];
    v100[3] = v18;
    v38 = v100;
    v39 = v99;
LABEL_60:
    id v19 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v39 count:4];
    v20 = v37;
    v21 = v15;
    uint64_t v22 = 8;
    goto LABEL_61;
  }
  if (v13 <= 0x3F && ([v11 clss] & 0xC) != 0) {
    goto LABEL_14;
  }
LABEL_25:
  if (a4) {
    *a4 = 1;
  }
  if (![v11 payloadLength])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v46 = NFLogGetLogger();
    if (v46)
    {
      v47 = (void (*)(uint64_t, const char *, ...))v46;
      v48 = object_getClass(self);
      BOOL v49 = class_isMetaClass(v48);
      v50 = object_getClassName(self);
      v51 = sel_getName(a2);
      v52 = [v9 NF_asHexString];
      uint64_t v53 = 45;
      if (v49) {
        uint64_t v53 = 43;
      }
      v47(3, "%c[%{public}s %{public}s]:%i Select command not supported: %@", v53, v50, v51, 109, v52);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = object_getClass(self);
      if (class_isMetaClass(v55)) {
        int v56 = 43;
      }
      else {
        int v56 = 45;
      }
      v57 = object_getClassName(self);
      v58 = sel_getName(a2);
      v59 = [v9 NF_asHexString];
      *(_DWORD *)buf = 67110146;
      int v102 = v56;
      __int16 v103 = 2082;
      v104 = v57;
      __int16 v105 = 2082;
      v106 = v58;
      __int16 v107 = 1024;
      int v108 = 109;
      __int16 v109 = 2112;
      v110 = v59;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Select command not supported: %@", buf, 0x2Cu);
    }
    if (!a5) {
      goto LABEL_66;
    }
    id v37 = objc_alloc((Class)NSError);
    v15 = +[NSString stringWithUTF8String:"nfcd"];
    v97[0] = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:"Security Violation"];
    v98[0] = v16;
    v98[1] = &off_10031A8D8;
    v97[1] = @"Line";
    v97[2] = @"Method";
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v98[2] = v17;
    v97[3] = NSDebugDescriptionErrorKey;
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 110];
    v98[3] = v18;
    v38 = v98;
    v39 = v97;
    goto LABEL_60;
  }
  v40 = [v11 payload];
  v15 = [v40 NF_asHexString];

  v41 = [(_NFCredentialSession *)self allowedAIDsListInWiredMode];
  v42 = [v11 payload];
  v43 = [v41 member:v42];

  v44 = [(_NFCredentialSession *)self allowedAIDsListInWiredMode];
  id v45 = [v44 count];

  if (!v45 || !v43)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v60 = NFLogGetLogger();
    if (v60)
    {
      v61 = (void (*)(uint64_t, const char *, ...))v60;
      v62 = object_getClass(self);
      BOOL v63 = class_isMetaClass(v62);
      v85 = object_getClassName(self);
      v86 = sel_getName(a2);
      uint64_t v64 = 45;
      if (v63) {
        uint64_t v64 = 43;
      }
      v61(3, "%c[%{public}s %{public}s]:%i AID=%@ selection is not allowed", v64, v85, v86, 119, v15);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = object_getClass(self);
      if (class_isMetaClass(v66)) {
        int v67 = 43;
      }
      else {
        int v67 = 45;
      }
      v68 = object_getClassName(self);
      v69 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v102 = v67;
      __int16 v103 = 2082;
      v104 = v68;
      __int16 v105 = 2082;
      v106 = v69;
      __int16 v107 = 1024;
      int v108 = 119;
      __int16 v109 = 2112;
      v110 = v15;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i AID=%@ selection is not allowed", buf, 0x2Cu);
    }

    if (!a5) {
      goto LABEL_64;
    }
    id v70 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v95[0] = NSLocalizedDescriptionKey;
    id v17 = +[NSString stringWithUTF8String:"Security Violation"];
    v96[0] = v17;
    v96[1] = &off_10031A8F0;
    v95[1] = @"Line";
    v95[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v96[2] = v18;
    v95[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 121];
    v96[3] = v19;
    id v71 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:4];
    *a5 = [v70 initWithDomain:v16 code:8 userInfo:v71];
LABEL_78:

    goto LABEL_62;
  }
  if (v15)
  {
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1000855F4;
    v89[3] = &unk_100302DD0;
    v89[4] = self;
    id v90 = v15;
    os_unfair_lock_lock(&self->_requestedAppletsLock);
    v16 = sub_1000855F4((uint64_t)v89);
    os_unfair_lock_unlock(&self->_requestedAppletsLock);
  }
  else
  {
    v16 = 0;
  }
  if (([v16 BOOLValue] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v73 = NFLogGetLogger();
    if (v73)
    {
      v74 = (void (*)(uint64_t, const char *, ...))v73;
      v75 = object_getClass(self);
      BOOL v76 = class_isMetaClass(v75);
      v77 = object_getClassName(self);
      v87 = sel_getName(a2);
      uint64_t v78 = 45;
      if (v76) {
        uint64_t v78 = 43;
      }
      v74(3, "%c[%{public}s %{public}s]:%i AID=%@ selection is not allowed", v78, v77, v87, 134, v15);
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
      *(_DWORD *)buf = 67110146;
      int v102 = v81;
      __int16 v103 = 2082;
      v104 = v82;
      __int16 v105 = 2082;
      v106 = v83;
      __int16 v107 = 1024;
      int v108 = 134;
      __int16 v109 = 2112;
      v110 = v15;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i AID=%@ selection is not allowed", buf, 0x2Cu);
    }

    if (!a5) {
      goto LABEL_63;
    }
    id v88 = objc_alloc((Class)NSError);
    id v17 = +[NSString stringWithUTF8String:"nfcd"];
    v93[0] = NSLocalizedDescriptionKey;
    id v18 = +[NSString stringWithUTF8String:"Security Violation"];
    v94[0] = v18;
    v94[1] = &off_10031A938;
    v93[1] = @"Line";
    v93[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v94[2] = v19;
    v93[3] = NSDebugDescriptionErrorKey;
    id v71 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 136];
    v94[3] = v71;
    v84 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:4];
    *a5 = [v88 initWithDomain:v17 code:8 userInfo:v84];

    goto LABEL_78;
  }
  [(_NFCredentialSession *)self setAppletSelectedInWiredMode:1];

LABEL_57:
  if ([v11 instruction] != 112) {
    goto LABEL_65;
  }
  if (a5)
  {
    id v37 = objc_alloc((Class)NSError);
    v15 = +[NSString stringWithUTF8String:"nfcd"];
    v91[0] = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:"Security Violation"];
    v92[0] = v16;
    v92[1] = &off_10031A950;
    v91[1] = @"Line";
    v91[2] = @"Method";
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v92[2] = v17;
    v91[3] = NSDebugDescriptionErrorKey;
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 145];
    v92[3] = v18;
    v38 = v92;
    v39 = v91;
    goto LABEL_60;
  }
LABEL_66:

  return (char)a5;
}

+ (id)validateEntitlements:(id)a3
{
  if ([a3 seCredentialManagerAccess])
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
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring credential manager access", v11, ClassName, Name, 156);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = object_getClass(a1);
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
      uint64_t v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 156;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring credential manager access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    id v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031A968;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 157];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:0];
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322C90];
  v4.receiver = self;
  v4.super_class = (Class)_NFCredentialSession;
  return [(_NFSession *)&v4 willStartSession];
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSessionStarted", (const char *)&unk_100286819, buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)_NFCredentialSession;
  [(_NFSession *)&v10 didStartSession:v4];
  v6 = +[_NFHardwareManager sharedHardwareManager];
  v7 = [v6 secureElementWrapper];
  secureElementWrapper = self->_secureElementWrapper;
  self->_secureElementWrapper = v7;

  id v9 = [(_NFXPCSession *)self remoteObject];
  [v9 didStartSession:v4];
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSessionSuspended", (const char *)&unk_100286819, buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)_NFCredentialSession;
  BOOL v6 = [(_NFXPCSession *)&v10 suspendWithInfo:v4];

  if (v6)
  {
    v7 = [(_NFCredentialSession *)self firstFieldNotificationTimer];
    [v7 stopTimer];

    if (self && self->_mode == 2) {
      [(_NFCredentialSession *)self requestApplets:0 selectOnStart:0 AIDAllowList:0 externalAuth:0 mode:0 completion:&stru_100302DF0];
    }
    v8 = sub_1001AED74();
    sub_1001AF914((uint64_t)v8);
  }
  return v6;
}

- (void)_setupFirstFieldNotificationTimer:(unint64_t)a3
{
  [(_NFCredentialSession *)self setFirstFieldNotification:0];
  id v5 = [(_NFCredentialSession *)self firstFieldNotificationTimer];
  [v5 stopTimer];

  if (a3 == 2)
  {
    BOOL v6 = [(_NFCredentialSession *)self firstFieldNotificationTimer];

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = objc_alloc((Class)NFTimer);
      objc_copyWeak(&v12, &location);
      v8 = [(_NFSession *)self workQueue];
      id v9 = [v7 initWithCallback:&v11 queue:v8];
      [(_NFCredentialSession *)self setFirstFieldNotificationTimer:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    objc_super v10 = [(_NFCredentialSession *)self firstFieldNotificationTimer];
    [v10 startTimer:0.3];
  }
}

- (id)_startCardEmulationWithApplet:(id)a3 externalAuth:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
  uint64_t v53 = +[NFRoutingConfig embeddedCardEmulationWithHCE:0 emulationType:3];
  objc_super v10 = +[_NFHardwareManager sharedHardwareManager];
  v52 = (void *)v9;
  uint64_t v11 = [v10 setRoutingConfig:v9];

  id v51 = v8;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v11;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Routing failure: %@", buf, 0xCu);
    }
    id v12 = objc_alloc((Class)NSError);
    unsigned int v13 = +[NSString stringWithUTF8String:"nfcd"];
    id v14 = [v11 code];
    v62[0] = NSLocalizedDescriptionKey;
    id v15 = v7;
    if ((uint64_t)[v11 code] > 70) {
      uint64_t v16 = 71;
    }
    else {
      uint64_t v16 = (uint64_t)[v11 code];
    }
    v21 = +[NSString stringWithUTF8String:off_100302B88[v16]];
    v63[0] = v21;
    v63[1] = v11;
    v62[1] = NSUnderlyingErrorKey;
    v62[2] = @"Line";
    v63[2] = &off_10031A980;
    v62[3] = @"Method";
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v63[3] = v22;
    v62[4] = NSDebugDescriptionErrorKey;
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 253];
    v63[4] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:5];
    id v25 = [v12 initWithDomain:v13 code:v14 userInfo:v24];

    goto LABEL_25;
  }
  id v17 = [(_NFCredentialSession *)self secureElementWrapper];
  uint64_t v11 = sub_1002457D4(v17);

  if (v11)
  {
    id v18 = objc_alloc((Class)NSError);
    unsigned int v13 = +[NSString stringWithUTF8String:"nfcd"];
    id v19 = [v11 code];
    v60[0] = NSLocalizedDescriptionKey;
    id v15 = v7;
    if ((uint64_t)[v11 code] > 70) {
      uint64_t v20 = 71;
    }
    else {
      uint64_t v20 = (uint64_t)[v11 code];
    }
    v21 = +[NSString stringWithUTF8String:off_100302B88[v20]];
    v61[0] = v21;
    v61[1] = v11;
    v60[1] = NSUnderlyingErrorKey;
    v60[2] = @"Line";
    v61[2] = &off_10031A998;
    v60[3] = @"Method";
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v61[3] = v22;
    v60[4] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 258];
    v61[4] = v31;
    int v32 = v61;
    int v33 = v60;
LABEL_24:
    uint64_t v46 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v33 count:5];
    id v25 = [v18 initWithDomain:v13 code:v19 userInfo:v46];

LABEL_25:
    id v7 = v15;
    id v8 = v51;
    goto LABEL_26;
  }
  int v26 = [(_NFCredentialSession *)self secureElementWrapper];
  __int16 v27 = +[NSSet setWithObject:v7];
  id v28 = [v26 mountCOXForApplets:v27];

  __int16 v29 = [(_NFCredentialSession *)self secureElementWrapper];
  uint64_t v11 = sub_1002440F8(v29, v7);

  if (v11)
  {
    id v18 = objc_alloc((Class)NSError);
    unsigned int v13 = +[NSString stringWithUTF8String:"nfcd"];
    id v19 = [v11 code];
    v58[0] = NSLocalizedDescriptionKey;
    id v15 = v7;
    if ((uint64_t)[v11 code] > 70) {
      uint64_t v30 = 71;
    }
    else {
      uint64_t v30 = (uint64_t)[v11 code];
    }
    v21 = +[NSString stringWithUTF8String:off_100302B88[v30]];
    v59[0] = v21;
    v59[1] = v11;
    v58[1] = NSUnderlyingErrorKey;
    v58[2] = @"Line";
    v59[2] = &off_10031A9B0;
    v58[3] = @"Method";
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v59[3] = v22;
    v58[4] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 265];
    v59[4] = v31;
    int v32 = v59;
    int v33 = v58;
    goto LABEL_24;
  }
  if (v8)
  {
    v34 = [(_NFCredentialSession *)self secureElementWrapper];
    uint64_t v35 = [(_NFSession *)self uid];
    v36 = [v7 identifierAsData];
    unsigned int v37 = sub_1001F22B8(v34, v8, v35, v36, 0);

    if (v37)
    {
      id v38 = objc_alloc((Class)NSError);
      v39 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v40 = v37;
      v56[0] = NSLocalizedDescriptionKey;
      if (v37 >= 0x47) {
        int v41 = 71;
      }
      else {
        int v41 = v37;
      }
      v42 = +[NSString stringWithUTF8String:off_100302B88[v41]];
      v57[0] = v42;
      v57[1] = &off_10031A9C8;
      v56[1] = @"Line";
      v56[2] = @"Method";
      id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v57[2] = v43;
      v56[3] = NSDebugDescriptionErrorKey;
      id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 274];
      v57[3] = v44;
      id v45 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
      id v25 = [v38 initWithDomain:v39 code:v40 userInfo:v45];

      goto LABEL_26;
    }
  }
  v48 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v11 = [v48 setRoutingConfig:v53];

  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v11;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Routing failure: %@", buf, 0xCu);
    }
    id v18 = objc_alloc((Class)NSError);
    unsigned int v13 = +[NSString stringWithUTF8String:"nfcd"];
    id v19 = [v11 code];
    v54[0] = NSLocalizedDescriptionKey;
    id v15 = v7;
    if ((uint64_t)[v11 code] > 70) {
      uint64_t v49 = 71;
    }
    else {
      uint64_t v49 = (uint64_t)[v11 code];
    }
    v21 = +[NSString stringWithUTF8String:off_100302B88[v49]];
    v55[0] = v21;
    v55[1] = v11;
    v54[1] = NSUnderlyingErrorKey;
    v54[2] = @"Line";
    v55[2] = &off_10031A9E0;
    v54[3] = @"Method";
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v55[3] = v22;
    v54[4] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 281];
    v55[4] = v31;
    int v32 = v55;
    int v33 = v54;
    goto LABEL_24;
  }
  v50 = sub_1001AED74();
  sub_1001B0384((uint64_t)v50);

  id v25 = 0;
LABEL_26:

  return v25;
}

- (id)_startWiredModeWithExternalAuth:(id)a3 applets:(id)a4 selectOnStart:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
  unsigned int v13 = +[_NFHardwareManager sharedHardwareManager];
  id v14 = [v13 setRoutingConfig:v12];

  id v51 = v10;
  if (!v14)
  {
    id v19 = [(_NFCredentialSession *)self secureElementWrapper];
    id v20 = sub_1002457D4(v19);

    id v21 = [v10 count];
    id v22 = [(_NFCredentialSession *)self secureElementWrapper];
    id v23 = v22;
    if (v21)
    {
      v24 = +[NSSet setWithArray:v10];
      id v25 = [v23 mountCOXForApplets:v24];

      id v16 = [v11 identifierAsData];
      if (!v16) {
        id v16 = [objc_alloc((Class)NSData) initWithBytes:"FACTORYTESTAPP" length:14];
      }
      int v26 = [(_NFCredentialSession *)self secureElementWrapper];
      id v52 = 0;
      unsigned __int8 v27 = [v26 select:v16 error:&v52];
      id v14 = v52;

      if ((v27 & 1) == 0)
      {
        id v49 = objc_alloc((Class)NSError);
        __int16 v29 = +[NSString stringWithUTF8String:"nfcd"];
        id v46 = [v14 code];
        v55[0] = NSLocalizedDescriptionKey;
        id v50 = v9;
        if ((uint64_t)[v14 code] > 70) {
          uint64_t v47 = 71;
        }
        else {
          uint64_t v47 = (uint64_t)[v14 code];
        }
        id v30 = +[NSString stringWithUTF8String:off_100302B88[v47]];
        v56[0] = v30;
        v56[1] = v14;
        v55[1] = NSUnderlyingErrorKey;
        v55[2] = @"Line";
        v56[2] = &off_10031AA10;
        v55[3] = @"Method";
        id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v56[3] = v31;
        v55[4] = NSDebugDescriptionErrorKey;
        id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 313];
        void v56[4] = v32;
        v48 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];
        id v28 = [v49 initWithDomain:v29 code:v46 userInfo:v48];

        goto LABEL_15;
      }
      [(_NFCredentialSession *)self setDefaultWiredModeApplet:v16];

      id v10 = v51;
      if (!v9)
      {
LABEL_11:
        id v28 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      id v37 = [v22 globalUnmountCOX];

      id v14 = 0;
      if (!v9) {
        goto LABEL_11;
      }
    }
    id v38 = [(_NFCredentialSession *)self secureElementWrapper];
    uint64_t v39 = [(_NFSession *)self uid];
    uint64_t v40 = [v10 firstObject];
    int v41 = [v40 identifierAsData];
    unsigned int v42 = sub_1001F22B8(v38, v9, v39, v41, 0);

    if (!v42)
    {
      id v28 = 0;
      goto LABEL_16;
    }
    id v50 = v9;
    id v43 = objc_alloc((Class)NSError);
    id v16 = +[NSString stringWithUTF8String:"nfcd"];
    id v44 = (void *)v42;
    v53[0] = NSLocalizedDescriptionKey;
    if (v42 >= 0x47) {
      int v45 = 71;
    }
    else {
      int v45 = v42;
    }
    __int16 v29 = +[NSString stringWithUTF8String:off_100302B88[v45]];
    v54[0] = v29;
    v54[1] = &off_10031AA28;
    v53[1] = @"Line";
    v53[2] = @"Method";
    id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v54[2] = v30;
    v53[3] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 327];
    v54[3] = v31;
    id v32 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
    int v33 = v43;
    id v34 = v16;
    id v35 = v44;
    goto LABEL_14;
  }
  id v50 = v9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v14;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Routing failure: %@", buf, 0xCu);
  }
  id v15 = objc_alloc((Class)NSError);
  id v16 = +[NSString stringWithUTF8String:"nfcd"];
  id v17 = [v14 code];
  v57[0] = NSLocalizedDescriptionKey;
  if ((uint64_t)[v14 code] > 70) {
    uint64_t v18 = 71;
  }
  else {
    uint64_t v18 = (uint64_t)[v14 code];
  }
  __int16 v29 = +[NSString stringWithUTF8String:off_100302B88[v18]];
  v58[0] = v29;
  v58[1] = v14;
  v57[1] = NSUnderlyingErrorKey;
  v57[2] = @"Line";
  v58[2] = &off_10031A9F8;
  v57[3] = @"Method";
  id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v58[3] = v30;
  void v57[4] = NSDebugDescriptionErrorKey;
  id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 298];
  v58[4] = v31;
  id v32 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:5];
  int v33 = v15;
  id v34 = v16;
  id v35 = v17;
LABEL_14:
  id v28 = [v33 initWithDomain:v34 code:v35 userInfo:v32];
LABEL_15:

  id v9 = v50;
LABEL_16:
  id v10 = v51;
LABEL_17:

  return v28;
}

- (void)requestApplets:(id)a3 selectOnStart:(id)a4 AIDAllowList:(id)a5 externalAuth:(id)a6 mode:(unint64_t)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = NFSharedSignpostLog();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession requestApplets:externalAuth:mode:", "before dispatch", buf, 2u);
  }

  v35.receiver = self;
  v35.super_class = (Class)_NFCredentialSession;
  id v21 = [(_NFSession *)&v35 workQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000870E0;
  v27[3] = &unk_100302E18;
  SEL v33 = a2;
  unint64_t v34 = a7;
  v27[4] = self;
  id v28 = v18;
  id v29 = v15;
  id v30 = v17;
  id v31 = v16;
  id v32 = v19;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v18;
  id v26 = v19;
  dispatch_async(v21, v27);
}

- (void)transceive:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession transceive:", "before dispatch", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFCredentialSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100088B68;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)listAppletsAndRefreshCache:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession listAppletsAndRefreshCache:", "before dispatch", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)_NFCredentialSession;
  id v9 = [(_NFSession *)&v15 workQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000898D4;
  v11[3] = &unk_100302E40;
  id v12 = v7;
  SEL v13 = a2;
  v11[4] = self;
  BOOL v14 = a3;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (void)queryExtraInfoForApplets:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession queryExtraInfoForApplets:", "before dispatch", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFCredentialSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008A238;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)deleteApplets:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession deleteApplets:", "before dispatch", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFCredentialSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008A948;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)signChallenge:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFCredentialSession signChallenge:", "before dispatch", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFCredentialSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008B3FC;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)cleanup
{
  if ([(_NFSession *)self needsCleanup])
  {
    id v4 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
    id v5 = +[_NFHardwareManager sharedHardwareManager];
    BOOL v6 = [v5 setRoutingConfig:v4];

    if (v6)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v8(3, "%c[%{public}s %{public}s]:%i Failed to config wired mode", v12, ClassName, Name, 679);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      SEL v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = object_getClass(self);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v24 = v15;
        __int16 v25 = 2082;
        id v26 = object_getClassName(self);
        __int16 v27 = 2082;
        id v28 = sel_getName(a2);
        __int16 v29 = 1024;
        int v30 = 679;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to config wired mode", buf, 0x22u);
      }
    }
    else
    {
      SEL v16 = [(_NFCredentialSession *)self secureElementWrapper];
      id v17 = sub_1002457D4(v16);

      id v18 = [(_NFCredentialSession *)self secureElementWrapper];
      id v19 = [v18 globalUnmountCOX];
    }
    id v20 = [(_NFCredentialSession *)self firstFieldNotificationTimer];
    [v20 stopTimer];

    id v21 = sub_1001AED74();
    sub_1001AF914((uint64_t)v21);

    [(_NFCredentialSession *)self setMode:0];
  }
}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 1;
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HCI data", (const char *)&unk_100286819, v10, 2u);
  }

  id v9 = [(_NFXPCSession *)self remoteObject];
  [v9 notifyHCIData:v7 appletIdentifier:v6];
}

- (void)handleFieldChanged:(BOOL)a3
{
  if (self && self->_mode == 2)
  {
    BOOL v4 = a3;
    if (![(_NFCredentialSession *)self firstFieldNotification])
    {
      [(_NFCredentialSession *)self setFirstFieldNotification:1];
      id v5 = [(_NFCredentialSession *)self firstFieldNotificationTimer];
      [v5 stopTimer];
    }
    id v6 = [(_NFXPCSession *)self remoteObject];
    [v6 fieldChanged:v4];
  }
}

- (void)handleTimerExpiredEvent:(id)a3
{
  id v5 = a3;
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
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 718, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v50 = v13;
    __int16 v51 = 2082;
    id v52 = v14;
    __int16 v53 = 2082;
    v54 = v15;
    __int16 v55 = 1024;
    int v56 = 718;
    __int16 v57 = 2114;
    id v58 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  SEL v16 = NFSharedSignpostLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTH_EXPIRED", (const char *)&unk_100286819, buf, 2u);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10008C730;
  v47[3] = &unk_100302E68;
  v47[4] = self;
  os_unfair_lock_lock(&self->_requestedAppletsLock);
  id v17 = sub_10008C730((uint64_t)v47);
  os_unfair_lock_unlock(&self->_requestedAppletsLock);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v44;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [v17 objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        if (v23)
        {
          __int16 v25 = (void *)v23;
          unint64_t v34 = v18;
          goto LABEL_30;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  int v24 = [v17 allValues];
  __int16 v25 = [v24 firstObject];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v26 = NFLogGetLogger();
  if (v26)
  {
    __int16 v27 = (void (*)(uint64_t, const char *, ...))v26;
    id v28 = object_getClass(self);
    BOOL v29 = class_isMetaClass(v28);
    int v30 = object_getClassName(self);
    id v31 = sel_getName(a2);
    id v32 = [v25 identifier];
    uint64_t v33 = 45;
    if (v29) {
      uint64_t v33 = 43;
    }
    v27(6, "%c[%{public}s %{public}s]:%i Assumes %{public}@", v33, v30, v31, 737, v32);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unint64_t v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v35 = object_getClass(self);
    if (class_isMetaClass(v35)) {
      int v36 = 43;
    }
    else {
      int v36 = 45;
    }
    id v37 = object_getClassName(self);
    id v38 = sel_getName(a2);
    uint64_t v39 = [v25 identifier];
    *(_DWORD *)buf = 67110146;
    int v50 = v36;
    __int16 v51 = 2082;
    id v52 = v37;
    __int16 v53 = 2082;
    v54 = v38;
    __int16 v55 = 1024;
    int v56 = 737;
    __int16 v57 = 2114;
    id v58 = v39;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assumes %{public}@", buf, 0x2Cu);
  }
LABEL_30:

  uint64_t v40 = [(_NFXPCSession *)self remoteObject];
  [v40 didExpireTransactionForApplet:v25];

  [(_NFCredentialSession *)self requestApplets:0 selectOnStart:0 AIDAllowList:0 externalAuth:0 mode:0 completion:&stru_100302E88];
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSSet)allowedAIDsListInWiredMode
{
  return self->_allowedAIDsListInWiredMode;
}

- (void)setAllowedAIDsListInWiredMode:(id)a3
{
}

- (NSDictionary)requestedApplets
{
  return self->_requestedApplets;
}

- (void)setRequestedApplets:(id)a3
{
}

- (NFTimer)firstFieldNotificationTimer
{
  return self->_firstFieldNotificationTimer;
}

- (void)setFirstFieldNotificationTimer:(id)a3
{
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return self->_secureElementWrapper;
}

- (void)setSecureElementWrapper:(id)a3
{
}

- (BOOL)appletSelectedInWiredMode
{
  return self->_appletSelectedInWiredMode;
}

- (void)setAppletSelectedInWiredMode:(BOOL)a3
{
  self->_appletSelectedInWiredMode = a3;
}

- (NSData)defaultWiredModeApplet
{
  return self->_defaultWiredModeApplet;
}

- (void)setDefaultWiredModeApplet:(id)a3
{
}

- (os_unfair_lock_s)requestedAppletsLock
{
  return self->_requestedAppletsLock;
}

- (void)setRequestedAppletsLock:(os_unfair_lock_s)a3
{
  self->_requestedAppletsLock = a3;
}

- (BOOL)firstFieldNotification
{
  return self->_firstFieldNotification;
}

- (void)setFirstFieldNotification:(BOOL)a3
{
  self->_firstFieldNotification = a3;
}

- (BOOL)seDirty
{
  return self->_seDirty;
}

- (void)setSeDirty:(BOOL)a3
{
  self->_seDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultWiredModeApplet, 0);
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_firstFieldNotificationTimer, 0);
  objc_storeStrong((id *)&self->_requestedApplets, 0);
  objc_storeStrong((id *)&self->_allowedAIDsListInWiredMode, 0);

  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end