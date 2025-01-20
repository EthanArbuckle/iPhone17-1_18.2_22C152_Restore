@interface _NFTrustSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isInstanceSelected;
- (BOOL)isSessionSEOnly;
- (BOOL)willStartSession;
- (NFSecureElementWrapper)secureElementWrapper;
- (NFTrustDBApplet)trustDBApplet;
- (NFTrustDataBase)trustDB;
- (NSArray)keys;
- (NSString)applicationIdentifier;
- (_NFTrustSession)initWithRemoteObject:(id)a3 workQueue:(id)a4;
- (id)deleteDBKey:(id)a3;
- (id)getListOfKeysWithError:(id *)a3;
- (id)initialRoutingConfig;
- (id)selectInstance;
- (unint64_t)getNumberOfKeys:(id *)a3;
- (void)createKey:(id)a3 cresteKeyRequest:(id)a4 completion:(id)a5;
- (void)deleteKey:(id)a3 completion:(id)a4;
- (void)deselectInstance;
- (void)didStartSession:(id)a3;
- (void)listKeysWithCompletion:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setIsInstanceSelected:(BOOL)a3;
- (void)setKeys:(id)a3;
- (void)setSecureElementWrapper:(id)a3;
- (void)setTrustDB:(id)a3;
- (void)setTrustDBApplet:(id)a3;
- (void)signWithKey:(id)a3 signRequest:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 completion:(id)a7;
@end

@implementation _NFTrustSession

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  v6 = [v5 applicationIdentifier];

  if (v6)
  {
    if ([v5 purpleTrustAccess])
    {
      id v7 = 0;
      goto LABEL_25;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v26 = 43;
      if (!isMetaClass) {
        uint64_t v26 = 45;
      }
      v21(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring PT access", v26, ClassName, Name, 43);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(a1);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v41 = v29;
      __int16 v42 = 2082;
      v43 = object_getClassName(a1);
      __int16 v44 = 2082;
      v45 = sel_getName(a2);
      __int16 v46 = 1024;
      int v47 = 43;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring PT access", buf, 0x22u);
    }

    id v30 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    v36[0] = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v37[0] = v18;
    v37[1] = &off_10031B310;
    v36[1] = @"Line";
    v36[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v37[2] = v19;
    v36[3] = NSDebugDescriptionErrorKey;
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 44];
    v37[3] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    id v7 = [v30 initWithDomain:v17 code:32 userInfo:v32];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v8 = NFLogGetLogger();
    if (v8)
    {
      v9 = (void (*)(uint64_t, const char *, ...))v8;
      v10 = object_getClass(a1);
      BOOL v11 = class_isMetaClass(v10);
      v34 = object_getClassName(a1);
      v35 = sel_getName(a2);
      uint64_t v12 = 45;
      if (v11) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Missing entitlement: %{public}@", v12, v34, v35, 38, @"application-identifier");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(a1);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v41 = v15;
      __int16 v42 = 2082;
      v43 = object_getClassName(a1);
      __int16 v44 = 2082;
      v45 = sel_getName(a2);
      __int16 v46 = 1024;
      int v47 = 38;
      __int16 v48 = 2114;
      CFStringRef v49 = @"application-identifier";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing entitlement: %{public}@", buf, 0x2Cu);
    }

    id v16 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v39 = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v7 = [v16 initWithDomain:v17 code:32 userInfo:v19];
  }

LABEL_25:

  return v7;
}

- (_NFTrustSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  v50.receiver = self;
  v50.super_class = (Class)_NFTrustSession;
  id v5 = [(_NFXPCSession *)&v50 initWithRemoteObject:a3 workQueue:a4];
  if (!v5) {
    goto LABEL_27;
  }
  v6 = sub_100032D1C();
  [(_NFTrustSession *)v5 setTrustDB:v6];

  id v7 = [(_NFTrustSession *)v5 trustDB];

  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v5);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v5);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Could not get DataBase", v27, ClassName, Name, 58);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(v5);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      id v30 = object_getClassName(v5);
      id v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v52 = v29;
      __int16 v53 = 2082;
      v54 = v30;
      __int16 v55 = 2082;
      v56 = v31;
      __int16 v57 = 1024;
      int v58 = 58;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not get DataBase", buf, 0x22u);
    }
    goto LABEL_24;
  }
  uint64_t v8 = [(_NFTrustSession *)v5 trustDB];
  id v49 = 0;
  v9 = sub_100031640(v8, @"A000000704C0000000000002", &v49);
  id v10 = v49;

  if (!v9)
  {
    [(_NFTrustSession *)v5 setTrustDBApplet:v10];
    v33 = [(_NFTrustSession *)v5 trustDBApplet];

    if (!v33)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v35 = NFLogGetLogger();
      if (v35)
      {
        v36 = (void (*)(uint64_t, const char *, ...))v35;
        v37 = object_getClass(v5);
        BOOL v38 = class_isMetaClass(v37);
        v45 = object_getClassName(v5);
        __int16 v48 = sel_getName(a2);
        uint64_t v39 = 45;
        if (v38) {
          uint64_t v39 = 43;
        }
        v36(3, "%c[%{public}s %{public}s]:%i Could not find DB Applet with AID %{public}@ in DataBase", v39, v45, v48, 75, @"A000000704C0000000000002");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v16 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      v40 = object_getClass(v5);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      __int16 v42 = object_getClassName(v5);
      v43 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v52 = v41;
      __int16 v53 = 2082;
      v54 = v42;
      __int16 v55 = 2082;
      v56 = v43;
      __int16 v57 = 1024;
      int v58 = 75;
      __int16 v59 = 2114;
      CFStringRef v60 = @"A000000704C0000000000002";
      v21 = "%c[%{public}s %{public}s]:%i Could not find DB Applet with AID %{public}@ in DataBase";
      goto LABEL_13;
    }

LABEL_27:
    v32 = v5;
    goto LABEL_28;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFLogGetLogger();
  if (v11)
  {
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(v5);
    BOOL v14 = class_isMetaClass(v13);
    __int16 v44 = object_getClassName(v5);
    __int16 v46 = sel_getName(a2);
    uint64_t v15 = 45;
    if (v14) {
      uint64_t v15 = 43;
    }
    v12(3, "%c[%{public}s %{public}s]:%i Could not get DB Applet from DataBase : %{public}@", v15, v44, v46, 67, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v16 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
  v17 = object_getClass(v5);
  if (class_isMetaClass(v17)) {
    int v18 = 43;
  }
  else {
    int v18 = 45;
  }
  id v19 = object_getClassName(v5);
  v20 = sel_getName(a2);
  *(_DWORD *)buf = 67110146;
  int v52 = v18;
  __int16 v53 = 2082;
  v54 = v19;
  __int16 v55 = 2082;
  v56 = v20;
  __int16 v57 = 1024;
  int v58 = 67;
  __int16 v59 = 2114;
  CFStringRef v60 = (const __CFString *)v9;
  v21 = "%c[%{public}s %{public}s]:%i Could not get DB Applet from DataBase : %{public}@";
LABEL_13:
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v21, buf, 0x2Cu);
LABEL_14:

LABEL_24:
  v32 = 0;
LABEL_28:

  return v32;
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  id v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = [v5 secureElementWrapper];
  secureElementWrapper = self->_secureElementWrapper;
  self->_secureElementWrapper = v6;

  if (v4)
  {
    id v8 = 0;
  }
  else
  {
    id v12 = 0;
    v9 = [(_NFTrustSession *)self getListOfKeysWithError:&v12];
    id v8 = v12;
    [(_NFTrustSession *)self setKeys:v9];
  }
  v11.receiver = self;
  v11.super_class = (Class)_NFTrustSession;
  [(_NFSession *)&v11 didStartSession:v4];
  id v10 = [(_NFXPCSession *)self remoteObject];
  [v10 didStartSession:v4];
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  v4.receiver = self;
  v4.super_class = (Class)_NFTrustSession;
  return [(_NFSession *)&v4 willStartSession];
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:1];
}

- (id)selectInstance
{
  objc_super v4 = [(_NFTrustSession *)self trustDBApplet];

  if (!v4)
  {
    sub_100140A54();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if ([(_NFTrustSession *)self isInstanceSelected])
  {
    id v5 = 0;
    goto LABEL_30;
  }
  v6 = [(_NFTrustSession *)self secureElementWrapper];

  if (!v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v37 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v41 = 45;
      if (isMetaClass) {
        uint64_t v41 = 43;
      }
      v37(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, error in NFCd, could not select instance", v41, ClassName, Name, 144);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v100 = v44;
      __int16 v101 = 2082;
      v102 = object_getClassName(self);
      __int16 v103 = 2082;
      v104 = sel_getName(a2);
      __int16 v105 = 1024;
      int v106 = 144;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, error in NFCd, could not select instance", buf, 0x22u);
    }

    id v45 = objc_alloc((Class)NSError);
    id v12 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
    __int16 v46 = +[NSString stringWithUTF8String:"Unknown Error"];
    v112 = v46;
    int v47 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v5 = [v45 initWithDomain:v12 code:6 userInfo:v47];

    goto LABEL_29;
  }
  id v7 = [(_NFTrustSession *)self secureElementWrapper];
  id v8 = [(_NFTrustSession *)self trustDBApplet];
  v9 = [v8 instanceAID];
  id v10 = +[NSData NF_dataWithHexString:v9];
  id v90 = 0;
  objc_super v11 = [v7 selectByName:v10 error:&v90];
  id v12 = v90;

  if (v12)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFLogGetLogger();
    if (v13)
    {
      BOOL v14 = (void (*)(uint64_t, const char *, ...))v13;
      uint64_t v15 = object_getClass(self);
      BOOL v16 = class_isMetaClass(v15);
      v17 = object_getClassName(self);
      int v18 = sel_getName(a2);
      [(_NFTrustSession *)self trustDBApplet];
      v20 = id v19 = v11;
      v21 = [v20 instanceAID];
      uint64_t v22 = 45;
      if (v16) {
        uint64_t v22 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i Could not select instance (AID: %{public}@): %{public}@", v22, v17, v18, 151, v21, v12);

      objc_super v11 = v19;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      uint64_t v27 = sel_getName(a2);
      v28 = [(_NFTrustSession *)self trustDBApplet];
      int v29 = [v28 instanceAID];
      *(_DWORD *)buf = 67110402;
      int v100 = v25;
      __int16 v101 = 2082;
      v102 = v26;
      __int16 v103 = 2082;
      v104 = v27;
      __int16 v105 = 1024;
      int v106 = 151;
      __int16 v107 = 2114;
      v108 = v29;
      __int16 v109 = 2114;
      id v110 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not select instance (AID: %{public}@): %{public}@", buf, 0x36u);
    }
    id v30 = objc_alloc((Class)NSError);
    id v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithUTF8String:"Unknown Error"];
    v98 = v32;
    v33 = &v98;
    v34 = &v97;
  }
  else if (v11)
  {
    if ([v11 status] == 27266)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v49 = NFLogGetLogger();
      if (v49)
      {
        objc_super v50 = (void (*)(uint64_t, const char *, ...))v49;
        v51 = object_getClass(self);
        BOOL v52 = class_isMetaClass(v51);
        __int16 v53 = object_getClassName(self);
        v87 = sel_getName(a2);
        uint64_t v54 = 45;
        if (v52) {
          uint64_t v54 = 43;
        }
        v50(3, "%c[%{public}s %{public}s]:%i Failed to select instance, instance not found on device, erase database for this instance", v54, v53, v87, 161);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v55 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        int v58 = object_getClassName(self);
        __int16 v59 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v100 = v57;
        __int16 v101 = 2082;
        v102 = v58;
        __int16 v103 = 2082;
        v104 = v59;
        __int16 v105 = 1024;
        int v106 = 161;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance, instance not found on device, erase database for this instance", buf, 0x22u);
      }

      CFStringRef v60 = [(_NFTrustSession *)self trustDB];
      id v61 = sub_100032904(v60);

      id v30 = objc_alloc((Class)NSError);
      id v31 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
      v32 = +[NSString stringWithUTF8String:"Unknown Error"];
      v94 = v32;
      v33 = &v94;
      v34 = &v93;
    }
    else
    {
      if ([v11 status] == 36864)
      {
        [(_NFTrustSession *)self setIsInstanceSelected:1];
        id v5 = 0;
        goto LABEL_18;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v73 = NFLogGetLogger();
      if (v73)
      {
        v74 = (void (*)(uint64_t, const char *, ...))v73;
        v75 = object_getClass(self);
        BOOL v76 = class_isMetaClass(v75);
        v77 = object_getClassName(self);
        v78 = sel_getName(a2);
        uint64_t v89 = [v11 status];
        uint64_t v79 = 45;
        if (v76) {
          uint64_t v79 = 43;
        }
        v74(3, "%c[%{public}s %{public}s]:%i Failed to select instance %u", v79, v77, v78, 167, v89);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = object_getClass(self);
        if (class_isMetaClass(v81)) {
          int v82 = 43;
        }
        else {
          int v82 = 45;
        }
        v83 = object_getClassName(self);
        v84 = sel_getName(a2);
        unsigned int v85 = [v11 status];
        *(_DWORD *)buf = 67110146;
        int v100 = v82;
        __int16 v101 = 2082;
        v102 = v83;
        __int16 v103 = 2082;
        v104 = v84;
        __int16 v105 = 1024;
        int v106 = 167;
        __int16 v107 = 1024;
        LODWORD(v108) = v85;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance %u", buf, 0x28u);
      }

      id v30 = objc_alloc((Class)NSError);
      id v31 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
      v32 = +[NSString stringWithUTF8String:"Unknown Error"];
      v92 = v32;
      v33 = &v92;
      v34 = &v91;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v62 = NFLogGetLogger();
    if (v62)
    {
      v63 = (void (*)(uint64_t, const char *, ...))v62;
      v64 = object_getClass(self);
      BOOL v65 = class_isMetaClass(v64);
      v66 = object_getClassName(self);
      v88 = sel_getName(a2);
      uint64_t v67 = 45;
      if (v65) {
        uint64_t v67 = 43;
      }
      v63(3, "%c[%{public}s %{public}s]:%i Failed to select instance, expecting RAPDU", v67, v66, v88, 156);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
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
      int v100 = v70;
      __int16 v101 = 2082;
      v102 = v71;
      __int16 v103 = 2082;
      v104 = v72;
      __int16 v105 = 1024;
      int v106 = 156;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance, expecting RAPDU", buf, 0x22u);
    }

    id v30 = objc_alloc((Class)NSError);
    id v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithUTF8String:"Unknown Error"];
    v96 = v32;
    v33 = &v96;
    v34 = &v95;
  }
  uint64_t v35 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v34 count:1];
  id v5 = [v30 initWithDomain:v31 code:6 userInfo:v35];

LABEL_18:
LABEL_29:

LABEL_30:

  return v5;
}

- (void)deselectInstance
{
  objc_super v4 = [(_NFTrustSession *)self trustDBApplet];

  if (!v4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Could not deselect instance, instance not found in database", v10, ClassName, Name, 182);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v78 = v13;
      __int16 v79 = 2082;
      v80 = object_getClassName(self);
      __int16 v81 = 2082;
      int v82 = sel_getName(a2);
      __int16 v83 = 1024;
      int v84 = 182;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not deselect instance, instance not found in database", buf, 0x22u);
    }
  }
  [(_NFTrustSession *)self setIsInstanceSelected:0];
  BOOL v14 = [(_NFTrustSession *)self secureElementWrapper];

  if (v14)
  {
    uint64_t v15 = [(_NFTrustSession *)self secureElementWrapper];
    id v16 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283946 length:8];
    id v76 = 0;
    v17 = [v15 selectByName:v16 error:&v76];
    int v18 = v76;

    if (v18)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v19 = NFLogGetLogger();
      if (v19)
      {
        v20 = (void (*)(uint64_t, const char *, ...))v19;
        v21 = object_getClass(self);
        BOOL v22 = class_isMetaClass(v21);
        v23 = object_getClassName(self);
        v24 = sel_getName(a2);
        [(_NFTrustSession *)self trustDBApplet];
        int v25 = a2;
        v27 = uint64_t v26 = v17;
        v28 = [v27 instanceAID];
        uint64_t v29 = 45;
        if (v22) {
          uint64_t v29 = 43;
        }
        v20(3, "%c[%{public}s %{public}s]:%i Could not deselect instance (AID: %{public}@): %{public}@", v29, v23, v24, 195, v28, v18);

        v17 = v26;
        a2 = v25;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        uint64_t v35 = [(_NFTrustSession *)self trustDBApplet];
        v36 = [v35 instanceAID];
        *(_DWORD *)buf = 67110402;
        int v78 = v32;
        __int16 v79 = 2082;
        v80 = v33;
        __int16 v81 = 2082;
        int v82 = v34;
        __int16 v83 = 1024;
        int v84 = 195;
        __int16 v85 = 2114;
        v86 = v36;
        __int16 v87 = 2114;
        v88 = v18;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not deselect instance (AID: %{public}@): %{public}@", buf, 0x36u);
      }
      goto LABEL_53;
    }
    if (v17)
    {
      if ([v17 status] == 36864)
      {
LABEL_54:

        goto LABEL_55;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v47 = NFLogGetLogger();
      if (v47)
      {
        __int16 v48 = (void (*)(uint64_t, const char *, ...))v47;
        uint64_t v49 = object_getClass(self);
        BOOL v50 = class_isMetaClass(v49);
        v51 = object_getClassName(self);
        BOOL v52 = sel_getName(a2);
        uint64_t v75 = [v17 status];
        uint64_t v53 = 45;
        if (v50) {
          uint64_t v53 = 43;
        }
        v48(3, "%c[%{public}s %{public}s]:%i Failed to deselect instance %u", v53, v51, v52, 205, v75);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_53:

        goto LABEL_54;
      }
      uint64_t v54 = object_getClass(self);
      if (class_isMetaClass(v54)) {
        int v55 = 43;
      }
      else {
        int v55 = 45;
      }
      v56 = object_getClassName(self);
      int v57 = sel_getName(a2);
      unsigned int v58 = [v17 status];
      *(_DWORD *)buf = 67110146;
      int v78 = v55;
      __int16 v79 = 2082;
      v80 = v56;
      __int16 v81 = 2082;
      int v82 = v57;
      __int16 v83 = 1024;
      int v84 = 205;
      __int16 v85 = 1024;
      LODWORD(v86) = v58;
      __int16 v59 = "%c[%{public}s %{public}s]:%i Failed to deselect instance %u";
      CFStringRef v60 = v30;
      uint32_t v61 = 40;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v62 = NFLogGetLogger();
      if (v62)
      {
        v63 = (void (*)(uint64_t, const char *, ...))v62;
        v64 = object_getClass(self);
        BOOL v65 = class_isMetaClass(v64);
        v66 = object_getClassName(self);
        v74 = sel_getName(a2);
        uint64_t v67 = 45;
        if (v65) {
          uint64_t v67 = 43;
        }
        v63(3, "%c[%{public}s %{public}s]:%i Failed to deselect instance, expecting RAPDU", v67, v66, v74, 200);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      v68 = object_getClass(self);
      if (class_isMetaClass(v68)) {
        int v69 = 43;
      }
      else {
        int v69 = 45;
      }
      int v70 = object_getClassName(self);
      v71 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v78 = v69;
      __int16 v79 = 2082;
      v80 = v70;
      __int16 v81 = 2082;
      int v82 = v71;
      __int16 v83 = 1024;
      int v84 = 200;
      __int16 v59 = "%c[%{public}s %{public}s]:%i Failed to deselect instance, expecting RAPDU";
      CFStringRef v60 = v30;
      uint32_t v61 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
    goto LABEL_53;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v37 = NFLogGetLogger();
  if (v37)
  {
    BOOL v38 = (void (*)(uint64_t, const char *, ...))v37;
    uint64_t v39 = object_getClass(self);
    BOOL v40 = class_isMetaClass(v39);
    uint64_t v41 = object_getClassName(self);
    uint64_t v73 = sel_getName(a2);
    uint64_t v42 = 45;
    if (v40) {
      uint64_t v42 = 43;
    }
    v38(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, could not deselect instance", v42, v41, v73, 188);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v43 = object_getClass(self);
    if (class_isMetaClass(v43)) {
      int v44 = 43;
    }
    else {
      int v44 = 45;
    }
    id v45 = object_getClassName(self);
    __int16 v46 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v78 = v44;
    __int16 v79 = 2082;
    v80 = v45;
    __int16 v81 = 2082;
    int v82 = v46;
    __int16 v83 = 1024;
    int v84 = 188;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, could not deselect instance", buf, 0x22u);
  }
LABEL_55:
}

- (id)getListOfKeysWithError:(id *)a3
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_10000B848;
  v36 = sub_1000D45A8;
  id v37 = (id)objc_opt_new();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10000B848;
  id v30 = sub_1000D45A8;
  id v31 = 0;
  if (!a3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v16 = 43;
      }
      else {
        uint64_t v16 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i getListOfKeysWithError expects error to be returned", v16, ClassName, Name, 220);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      BOOL v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v41 = v21;
      __int16 v42 = 2082;
      v43 = v22;
      __int16 v44 = 2082;
      id v45 = v23;
      __int16 v46 = 1024;
      int v47 = 220;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i getListOfKeysWithError expects error to be returned", buf, 0x22u);
    }

LABEL_16:
    id v13 = 0;
    goto LABEL_18;
  }
  v6 = [(_NFTrustSession *)self trustDB];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    id v8 = [(_NFTrustSession *)self selectInstance];
    *a3 = v8;
    if (!v8)
    {
      v9 = [(_NFTrustSession *)self trustDB];
      uint64_t v10 = (objc_class *)objc_opt_class();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000D45B0;
      v25[3] = &unk_100304028;
      v25[4] = self;
      v25[5] = &v26;
      v25[6] = &v32;
      v25[7] = a2;
      sub_10003310C(v9, v10, v25);

      CFStringRef v38 = @"totalPurpleTrustKeys";
      objc_super v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(id)v33[5] count]);
      uint64_t v39 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:v12];

      *a3 = (id) v27[5];
      id v13 = (id)v33[5];
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  sub_100140A54();
  id v13 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);

  return v13;
}

- (void)listKeysWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFTrustSession;
  v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4F6C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (unint64_t)getNumberOfKeys:(id *)a3
{
  v3 = [(_NFTrustSession *)self keys];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)deleteDBKey:(id)a3
{
  id v5 = (id *)a3;
  if (!v5)
  {
    sub_100140F40(@"Could not delete Key with nil DB Key");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  uint64_t v6 = [(_NFTrustSession *)self trustDB];
  if (!v6
    || (id v7 = (void *)v6,
        [(_NFTrustSession *)self trustDBApplet],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    uint64_t v19 = sub_100140A54();
    v127[0] = @"purpleTrustOperationType";
    v127[1] = @"purpleTrustOperationErrorStep";
    v128[0] = &off_10031B328;
    v128[1] = &off_10031B328;
    v128[2] = &off_10031B340;
    v127[2] = @"purpleTrustOperationCAErrorCode";
    v127[3] = @"purpleTrustOperationErrorCode";
    v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 code]);
    v128[3] = v20;
    int v21 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:4];

    sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v21);
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322D08];
    id v10 = v19;

LABEL_17:
    id v22 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = [(_NFTrustSession *)self selectInstance];
  if (v9)
  {
    id v10 = (id)v9;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Failed to select instance : %{public}@", v15, ClassName, Name, 365, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v112 = v18;
      __int16 v113 = 2082;
      v114 = object_getClassName(self);
      __int16 v115 = 2082;
      v116 = sel_getName(a2);
      __int16 v117 = 1024;
      int v118 = 365;
      __int16 v119 = 2114;
      id v120 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance : %{public}@", buf, 0x2Cu);
    }

    goto LABEL_17;
  }
  id v22 = v5[4];
  if (v22)
  {
    v24 = [(_NFTrustSession *)self trustDBApplet];
    sub_100034610(v24, v22);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v25 = NFLogGetLogger();
      if (v25)
      {
        uint64_t v26 = (void (*)(uint64_t, const char *, ...))v25;
        uint64_t v27 = object_getClass(self);
        BOOL v28 = class_isMetaClass(v27);
        v94 = object_getClassName(self);
        v99 = sel_getName(a2);
        uint64_t v29 = 45;
        if (v28) {
          uint64_t v29 = 43;
        }
        v26(3, "%c[%{public}s %{public}s]:%i Failed to clean DB Applet slot : %{public}@", v29, v94, v99, 373, v10);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v112 = v32;
        __int16 v113 = 2082;
        v114 = object_getClassName(self);
        __int16 v115 = 2082;
        v116 = sel_getName(a2);
        __int16 v117 = 1024;
        int v118 = 373;
        __int16 v119 = 2114;
        id v120 = v10;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to clean DB Applet slot : %{public}@", buf, 0x2Cu);
      }

      v125[0] = @"purpleTrustOperationType";
      v125[1] = @"purpleTrustOperationErrorStep";
      v126[0] = &off_10031B328;
      v126[1] = &off_10031B370;
      v126[2] = &off_10031B340;
      v125[2] = @"purpleTrustOperationCAErrorCode";
      v125[3] = @"purpleTrustOperationErrorCode";
      v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
      v126[3] = v33;
      uint64_t v34 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];

      sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v34);
      uint64_t v35 = &off_100322D30;
LABEL_46:
      +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:v35];
      id v47 = v10;
LABEL_47:
      id v10 = v47;

      goto LABEL_18;
    }
  }
  id v36 = v5[3];

  if (v36) {
    objc_storeStrong(v5 + 3, 0);
  }
  id v37 = [(_NFTrustSession *)self trustDB];
  sub_1000322DC((uint64_t)v37);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      uint64_t v39 = (void (*)(uint64_t, const char *, ...))v38;
      BOOL v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      NSErrorUserInfoKey v95 = object_getClassName(self);
      int v100 = sel_getName(a2);
      uint64_t v42 = 45;
      if (v41) {
        uint64_t v42 = 43;
      }
      v39(3, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", v42, v95, v100, 397, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __int16 v44 = object_getClass(self);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v112 = v45;
      __int16 v113 = 2082;
      v114 = object_getClassName(self);
      __int16 v115 = 2082;
      v116 = sel_getName(a2);
      __int16 v117 = 1024;
      int v118 = 397;
      __int16 v119 = 2114;
      id v120 = v10;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", buf, 0x2Cu);
    }

    v123[0] = @"purpleTrustOperationType";
    v123[1] = @"purpleTrustOperationErrorStep";
    v124[0] = &off_10031B328;
    v124[1] = &off_10031B370;
    v124[2] = &off_10031B340;
    v123[2] = @"purpleTrustOperationCAErrorCode";
    v123[3] = @"purpleTrustOperationErrorCode";
    __int16 v46 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    v124[3] = v46;
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:4];

    sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v34);
    uint64_t v35 = &off_100322D58;
    goto LABEL_46;
  }
  objc_storeStrong(v5 + 4, 0);
  __int16 v48 = NFSharedSignpostLog();
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", (const char *)&unk_100286819, buf, 2u);
  }

  if (v22
    && ([(_NFTrustSession *)self secureElementWrapper],
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        sub_1000BC134(v49, v22),
        BOOL v50 = objc_claimAutoreleasedReturnValue(),
        v49,
        v50))
  {
    v51 = NFSharedSignpostLog();
    if (os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", "failed", buf, 2u);
    }

    BOOL v52 = [v50 domain];
    if ([v52 isEqualToString:@"GP"])
    {
      id v53 = [v50 code];

      if (v53 != (id)27272) {
        goto LABEL_70;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        int v55 = (void (*)(uint64_t, const char *, ...))v54;
        v56 = object_getClass(self);
        BOOL v57 = class_isMetaClass(v56);
        __int16 v103 = object_getClassName(self);
        unsigned int v58 = sel_getName(a2);
        id v59 = v5[1];
        uint64_t v60 = 45;
        if (v57) {
          uint64_t v60 = 43;
        }
        v55(3, "%c[%{public}s %{public}s]:%i Key with identifier %{public}@ is supposed to be in slot %{public}@ but slot is empty", v60, v103, v58, 426, v59, v22);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint32_t v61 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v62 = object_getClass(self);
        if (class_isMetaClass(v62)) {
          int v63 = 43;
        }
        else {
          int v63 = 45;
        }
        int v104 = v63;
        v64 = object_getClassName(self);
        BOOL v65 = sel_getName(a2);
        id v66 = v5[1];
        *(_DWORD *)buf = 67110402;
        int v112 = v104;
        __int16 v113 = 2082;
        v114 = v64;
        __int16 v115 = 2082;
        v116 = v65;
        __int16 v117 = 1024;
        int v118 = 426;
        __int16 v119 = 2114;
        id v120 = v66;
        __int16 v121 = 2114;
        id v122 = v22;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Key with identifier %{public}@ is supposed to be in slot %{public}@ but slot is empty", buf, 0x36u);
      }
      v109[0] = @"purpleTrustOperationType";
      v109[1] = @"purpleTrustOperationErrorStep";
      v110[0] = &off_10031B328;
      v110[1] = &off_10031B388;
      v110[2] = &off_10031B3A0;
      v109[2] = @"purpleTrustOperationCAErrorCode";
      v109[3] = @"purpleTrustOperationErrorCode";
      uint64_t v67 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v50 code]);
      v110[3] = v67;
      BOOL v52 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:4];

      sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v52);
      +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322D80];
    }
  }
  else
  {
    BOOL v52 = NFSharedSignpostLog();
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", (const char *)&unk_100286819, buf, 2u);
    }
    BOOL v50 = 0;
  }

LABEL_70:
  v68 = [(_NFTrustSession *)self trustDB];
  int v69 = sub_100031D24(v68, v5);

  if (v69)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v70 = NFLogGetLogger();
    if (v70)
    {
      v71 = (void (*)(uint64_t, const char *, ...))v70;
      v72 = object_getClass(self);
      BOOL v73 = class_isMetaClass(v72);
      v96 = object_getClassName(self);
      __int16 v101 = sel_getName(a2);
      uint64_t v74 = 45;
      if (v73) {
        uint64_t v74 = 43;
      }
      v71(3, "%c[%{public}s %{public}s]:%i Failed to remove Key from NFTrustDB : %{public}@ ...", v74, v96, v101, 449, v69);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v75 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      id v76 = object_getClass(self);
      if (class_isMetaClass(v76)) {
        int v77 = 43;
      }
      else {
        int v77 = 45;
      }
      int v78 = object_getClassName(self);
      __int16 v79 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v112 = v77;
      __int16 v113 = 2082;
      v114 = v78;
      __int16 v115 = 2082;
      v116 = v79;
      __int16 v117 = 1024;
      int v118 = 449;
      __int16 v119 = 2114;
      id v120 = v69;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to remove Key from NFTrustDB : %{public}@ ...", buf, 0x2Cu);
    }

    v107[0] = @"purpleTrustOperationType";
    v107[1] = @"purpleTrustOperationErrorStep";
    v108[0] = &off_10031B328;
    v108[1] = &off_10031B388;
    v108[2] = &off_10031B340;
    v107[2] = @"purpleTrustOperationCAErrorCode";
    v107[3] = @"purpleTrustOperationErrorCode";
    v80 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v69 code]);
    v108[3] = v80;
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:4];

    sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v34);
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322DA8];
    id v47 = v69;
    goto LABEL_47;
  }
  __int16 v81 = [(_NFTrustSession *)self trustDB];
  sub_1000322DC((uint64_t)v81);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v82 = NFLogGetLogger();
    if (v82)
    {
      __int16 v83 = (void (*)(uint64_t, const char *, ...))v82;
      int v84 = object_getClass(self);
      BOOL v85 = class_isMetaClass(v84);
      NSErrorUserInfoKey v97 = object_getClassName(self);
      v102 = sel_getName(a2);
      uint64_t v86 = 45;
      if (v85) {
        uint64_t v86 = 43;
      }
      v83(3, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", v86, v97, v102, 470, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v87 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = object_getClass(self);
      if (class_isMetaClass(v88)) {
        int v89 = 43;
      }
      else {
        int v89 = 45;
      }
      id v90 = object_getClassName(self);
      NSErrorUserInfoKey v91 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v112 = v89;
      __int16 v113 = 2082;
      v114 = v90;
      __int16 v115 = 2082;
      v116 = v91;
      __int16 v117 = 1024;
      int v118 = 470;
      __int16 v119 = 2114;
      id v120 = v10;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", buf, 0x2Cu);
    }

    v105[0] = @"purpleTrustOperationType";
    v105[1] = @"purpleTrustOperationErrorStep";
    v106[0] = &off_10031B328;
    v106[1] = &off_10031B388;
    v106[2] = &off_10031B340;
    v105[2] = @"purpleTrustOperationCAErrorCode";
    v105[3] = @"purpleTrustOperationErrorCode";
    v92 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    v106[3] = v92;
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];

    sub_10020307C((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v34);
    uint64_t v35 = &off_100322DD0;
    goto LABEL_46;
  }
LABEL_18:

  return v10;
}

- (void)deleteKey:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFTrustSession;
  uint64_t v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D6740;
  v12[3] = &unk_100304090;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)createKey:(id)a3 cresteKeyRequest:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFTrustSession;
  id v11 = a3;
  id v12 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D72AC;
  block[3] = &unk_1003040B8;
  id v17 = v10;
  SEL v18 = a2;
  block[4] = self;
  void block[5] = v11;
  id v16 = v9;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)signWithKey:(id)a3 signRequest:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)_NFTrustSession;
  id v17 = a4;
  SEL v18 = [(_NFSession *)&v30 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D97A4;
  block[3] = &unk_1003040E0;
  id v28 = v16;
  SEL v29 = a2;
  block[4] = self;
  id v24 = v13;
  id v25 = v17;
  id v26 = v15;
  id v27 = v14;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v16;
  dispatch_async(v18, block);
}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (BOOL)isInstanceSelected
{
  return self->_isInstanceSelected;
}

- (void)setIsInstanceSelected:(BOOL)a3
{
  self->_isInstanceSelected = a3;
}

- (NFTrustDBApplet)trustDBApplet
{
  return self->_trustDBApplet;
}

- (void)setTrustDBApplet:(id)a3
{
}

- (NFTrustDataBase)trustDB
{
  return self->_trustDB;
}

- (void)setTrustDB:(id)a3
{
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return self->_secureElementWrapper;
}

- (void)setSecureElementWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_trustDB, 0);
  objc_storeStrong((id *)&self->_trustDBApplet, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end