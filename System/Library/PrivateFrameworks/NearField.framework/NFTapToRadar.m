@interface NFTapToRadar
+ (id)_getInstance;
+ (void)handleCallback:(unint64_t)a3;
+ (void)requestTapToRadar:(id)a3 preferences:(id)a4;
- (NFTapToRadar)init;
- (void)_handleCallbackSync:(unint64_t)a3;
- (void)_requestTapToRadarSync:(id)a3 prefs:(id)a4;
@end

@implementation NFTapToRadar

- (NFTapToRadar)init
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)NFTapToRadar;
  v3 = [(NFTapToRadar *)&v66 init];
  if (!v3) {
    goto LABEL_31;
  }
  v4 = NFProductGetName();
  if ([v4 hasPrefix:@"T"]
    && [v4 hasSuffix:@"AP"])
  {
    v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on T HW", v11, ClassName, Name, 67);
    }
    dispatch_get_specific(*v5);
    v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v13 = object_getClass(v3);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    v15 = object_getClassName(v3);
    v16 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v68 = v14;
    __int16 v69 = 2082;
    v70 = v15;
    __int16 v71 = 2082;
    v72 = v16;
    __int16 v73 = 1024;
    int v74 = 67;
    v17 = "%c[%{public}s %{public}s]:%i Disabled NF TTR on T HW";
    goto LABEL_25;
  }
  if ((NFProductIsDevBoard() & 1) == 0 && (NFProductIsVM() & 1) == 0 && !NFProductIsNED())
  {
    if (dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2))
    {
      Class v32 = NSClassFromString(&cfstr_Lsapplicationw.isa);
      v3->_lsApplicationWorkspace = v32;
      if (v32)
      {
        pendingRequest = v3->_pendingRequest;
        v3->_pendingRequest = 0;

        v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_UTILITY, 0);
        dispatch_queue_t v36 = dispatch_queue_create("com.apple.stockholm.TTR", v35);
        queue = v3->_queue;
        v3->_queue = (OS_dispatch_queue *)v36;

        userDefaults = v3->_userDefaults;
        v3->_userDefaults = 0;

LABEL_31:
        v31 = v3;
        goto LABEL_32;
      }
      v50 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v51 = NFLogGetLogger();
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(v3);
        BOOL v54 = class_isMetaClass(v53);
        v61 = object_getClassName(v3);
        v65 = sel_getName(a2);
        uint64_t v55 = 45;
        if (v54) {
          uint64_t v55 = 43;
        }
        v52(3, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", v55, v61, v65, 88, @"LSApplicationWorkspace");
      }
      dispatch_get_specific(*v50);
      v12 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v56 = object_getClass(v3);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      v58 = object_getClassName(v3);
      v59 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v68 = v57;
      __int16 v69 = 2082;
      v70 = v58;
      __int16 v71 = 2082;
      v72 = v59;
      __int16 v73 = 1024;
      int v74 = 88;
      __int16 v75 = 2114;
      v76 = (const char *)@"LSApplicationWorkspace";
      v17 = "%c[%{public}s %{public}s]:%i Failed to get class %{public}@";
    }
    else
    {
      v40 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v41 = NFLogGetLogger();
      if (v41)
      {
        v42 = (void (*)(uint64_t, const char *, ...))v41;
        v43 = object_getClass(v3);
        BOOL v44 = class_isMetaClass(v43);
        v60 = object_getClassName(v3);
        v64 = sel_getName(a2);
        uint64_t v45 = 45;
        if (v44) {
          uint64_t v45 = 43;
        }
        v42(3, "%c[%{public}s %{public}s]:%i Failed to dlopen %s", v45, v60, v64, 82, "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices");
      }
      dispatch_get_specific(*v40);
      v12 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v46 = object_getClass(v3);
      if (class_isMetaClass(v46)) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      v48 = object_getClassName(v3);
      v49 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v68 = v47;
      __int16 v69 = 2082;
      v70 = v48;
      __int16 v71 = 2082;
      v72 = v49;
      __int16 v73 = 1024;
      int v74 = 82;
      __int16 v75 = 2080;
      v76 = "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices";
      v17 = "%c[%{public}s %{public}s]:%i Failed to dlopen %s";
    }
    v29 = v12;
    uint32_t v30 = 44;
    goto LABEL_26;
  }
  v18 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(v3);
    BOOL v22 = class_isMetaClass(v21);
    v23 = object_getClassName(v3);
    v63 = sel_getName(a2);
    uint64_t v24 = 45;
    if (v22) {
      uint64_t v24 = 43;
    }
    v20(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", v24, v23, v63, 72);
  }
  dispatch_get_specific(*v18);
  v12 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    goto LABEL_27;
  }
  v25 = object_getClass(v3);
  if (class_isMetaClass(v25)) {
    int v26 = 43;
  }
  else {
    int v26 = 45;
  }
  v27 = object_getClassName(v3);
  v28 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  int v68 = v26;
  __int16 v69 = 2082;
  v70 = v27;
  __int16 v71 = 2082;
  v72 = v28;
  __int16 v73 = 1024;
  int v74 = 72;
  v17 = "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs";
LABEL_25:
  v29 = v12;
  uint32_t v30 = 34;
LABEL_26:
  _os_log_impl(&dword_19D636000, v29, OS_LOG_TYPE_ERROR, v17, buf, v30);
LABEL_27:

  v31 = 0;
LABEL_32:

  return v31;
}

+ (id)_getInstance
{
  if (qword_1EB4D1F70 != -1) {
    dispatch_once(&qword_1EB4D1F70, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_13;
  return v2;
}

uint64_t __28__NFTapToRadar__getInstance__block_invoke()
{
  _MergedGlobals_13 = objc_alloc_init(NFTapToRadar);
  return MEMORY[0x1F41817F8]();
}

- (void)_handleCallbackSync:(unint64_t)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    if (a3 == 2)
    {
      v8 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i User canceled response", v14, ClassName, Name, 126);
      }
      dispatch_get_specific(*v8);
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
        *(_DWORD *)buf = 67109890;
        int v72 = v17;
        __int16 v73 = 2082;
        int v74 = object_getClassName(self);
        __int16 v75 = 2082;
        v76 = sel_getName(a2);
        __int16 v77 = 1024;
        int v78 = 126;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i User canceled response", buf, 0x22u);
      }

      userDefaults = self->_userDefaults;
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [(NSUserDefaults *)userDefaults setObject:v19 forKey:@"NFTTRProhibitRequestsUntil"];

      [(NSUserDefaults *)self->_userDefaults synchronize];
    }
    else
    {
      uint32_t v30 = self->_userDefaults;
      v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
      [(NSUserDefaults *)v30 setObject:v31 forKey:@"NFTTRProhibitRequestsUntil"];

      [(NSUserDefaults *)self->_userDefaults synchronize];
      if (a3 == 1)
      {
        Class v32 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v33 = NFLogGetLogger();
        if (v33)
        {
          v34 = (void (*)(uint64_t, const char *, ...))v33;
          v35 = object_getClass(self);
          BOOL v36 = class_isMetaClass(v35);
          v37 = object_getClassName(self);
          __int16 v69 = sel_getName(a2);
          uint64_t v38 = 45;
          if (v36) {
            uint64_t v38 = 43;
          }
          v34(6, "%c[%{public}s %{public}s]:%i NotNow response", v38, v37, v69, 139);
        }
        dispatch_get_specific(*v32);
        v39 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = object_getClass(self);
          if (class_isMetaClass(v40)) {
            int v41 = 43;
          }
          else {
            int v41 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v72 = v41;
          __int16 v73 = 2082;
          int v74 = object_getClassName(self);
          __int16 v75 = 2082;
          v76 = sel_getName(a2);
          __int16 v77 = 1024;
          int v78 = 139;
          _os_log_impl(&dword_19D636000, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NotNow response", buf, 0x22u);
        }
      }
      else
      {
        v42 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:@"483780"];
        [v6 addObject:v42];

        v43 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:@"Purple Stockholm"];
        [v6 addObject:v43];

        BOOL v44 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:@"1.0"];
        [v6 addObject:v44];

        uint64_t v45 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:@"Crash/Hang/Data Loss"];
        [v6 addObject:v45];

        v46 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
        [v6 addObject:v46];

        int v47 = (void *)MEMORY[0x1E4F290C8];
        v48 = (void *)[[NSString alloc] initWithFormat:@"Stockholm TTR - %@", self->_pendingRequest];
        v49 = [v47 queryItemWithName:@"Title" value:v48];
        [v6 addObject:v49];

        v50 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:self->_pendingRequest];
        [v6 addObject:v50];

        [v7 setScheme:@"tap-to-radar"];
        [v7 setHost:@"new"];
        [v7 setQueryItems:v6];
        uint64_t v51 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v52 = NFLogGetLogger();
        if (v52)
        {
          v53 = (void (*)(uint64_t, const char *, ...))v52;
          BOOL v54 = object_getClass(self);
          BOOL v55 = class_isMetaClass(v54);
          objc_super v66 = object_getClassName(self);
          v70 = sel_getName(a2);
          uint64_t v56 = 45;
          if (v55) {
            uint64_t v56 = 43;
          }
          v53(6, "%c[%{public}s %{public}s]:%i URL: %{public}@", v56, v66, v70, 154, v7);
        }
        dispatch_get_specific(*v51);
        int v57 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = object_getClass(self);
          if (class_isMetaClass(v58)) {
            int v59 = 43;
          }
          else {
            int v59 = 45;
          }
          *(_DWORD *)buf = 67110146;
          int v72 = v59;
          __int16 v73 = 2082;
          int v74 = object_getClassName(self);
          __int16 v75 = 2082;
          v76 = sel_getName(a2);
          __int16 v77 = 1024;
          int v78 = 154;
          __int16 v79 = 2114;
          v80 = v7;
          _os_log_impl(&dword_19D636000, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i URL: %{public}@", buf, 0x2Cu);
        }

        v60 = [(objc_class *)self->_lsApplicationWorkspace defaultWorkspace];
        v61 = [v7 URL];
        [v60 openURL:v61 configuration:0 completionHandler:0];
      }
    }
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    runLoopSource = self->_runLoopSource;
    if (runLoopSource) {
      CFRelease(runLoopSource);
    }
    self->_runLoopSource = 0;
    userNotification = self->_userNotification;
    if (userNotification) {
      CFRelease(userNotification);
    }
    self->_userNotification = 0;
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    p_super = &self->_userDefaults->super;
    self->_userDefaults = 0;
  }
  else
  {
    v20 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      BOOL v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      int v68 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", v26, v25, v68, 121);
    }
    dispatch_get_specific(*v20);
    p_super = NFSharedLogGetLogger();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v72 = v29;
      __int16 v73 = 2082;
      int v74 = object_getClassName(self);
      __int16 v75 = 2082;
      v76 = sel_getName(a2);
      __int16 v77 = 1024;
      int v78 = 121;
      _os_log_impl(&dword_19D636000, p_super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", buf, 0x22u);
    }
  }
}

+ (void)handleCallback:(unint64_t)a3
{
  v4 = +[NFTapToRadar _getInstance];
  v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__NFTapToRadar_handleCallback___block_invoke;
    v7[3] = &unk_1E595C698;
    v8 = v4;
    unint64_t v9 = a3;
    dispatch_async(v6, v7);
  }
}

uint64_t __31__NFTapToRadar_handleCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCallbackSync:*(void *)(a1 + 40)];
}

+ (void)requestTapToRadar:(id)a3 preferences:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _os_activity_create(&dword_19D636000, "requestTapToRadar:preferences:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  v8 = (void *)MEMORY[0x19F3A9490]();
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t v9 = +[NFTapToRadar _getInstance];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = v9[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__NFTapToRadar_requestTapToRadar_preferences___block_invoke;
      block[3] = &unk_1E595CFA0;
      v13 = v9;
      id v14 = v5;
      id v15 = v6;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __46__NFTapToRadar_requestTapToRadar_preferences___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestTapToRadarSync:*(void *)(a1 + 40) prefs:*(void *)(a1 + 48)];
}

- (void)_requestTapToRadarSync:(id)a3 prefs:(id)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (__CFString *)a4;
  SInt32 error = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    unint64_t v9 = (const void **)MEMORY[0x1E4FBA898];
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
      v11(3, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", v15, ClassName, Name, 214);
    }
    dispatch_get_specific(*v9);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v121 = v18;
      __int16 v122 = 2082;
      v123 = object_getClassName(self);
      __int16 v124 = 2082;
      v125 = sel_getName(a2);
      __int16 v126 = 1024;
      int v127 = 214;
      uint64_t v19 = "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight";
LABEL_40:
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x22u);
      goto LABEL_87;
    }
    goto LABEL_87;
  }
  if (SpringBoardServicesLibraryCore())
  {
    v20 = getSBUserNotificationDismissOnLock();

    if (v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1CB18]);
      if (v8) {
        BOOL v22 = v8;
      }
      else {
        BOOL v22 = @"com.apple.nfcd.nfttr";
      }
      v23 = (NSUserDefaults *)[v21 initWithSuiteName:v22];
      userDefaults = self->_userDefaults;
      self->_userDefaults = v23;

      v16 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"NFTTRProhibitRequestsUntil"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = (objc_class *)MEMORY[0x1E4F28C10];
        uint64_t v26 = v16;
        id v27 = objc_alloc_init(v25);
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
        [v27 setLocale:v28];

        [v27 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
        v16 = [v27 dateFromString:v26];
      }
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v29 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v30 = [v16 compare:v29];

          if (v30 == 1)
          {
            v31 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v32 = NFLogGetLogger();
            if (v32)
            {
              uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
              v34 = object_getClass(self);
              BOOL v35 = class_isMetaClass(v34);
              v106 = object_getClassName(self);
              v111 = sel_getName(a2);
              uint64_t v36 = 45;
              if (v35) {
                uint64_t v36 = 43;
              }
              v33(6, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", v36, v106, v111, 237, v16);
            }
            dispatch_get_specific(*v31);
            v37 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v38 = object_getClass(self);
              if (class_isMetaClass(v38)) {
                int v39 = 43;
              }
              else {
                int v39 = 45;
              }
              *(_DWORD *)buf = 67110146;
              int v121 = v39;
              __int16 v122 = 2082;
              v123 = object_getClassName(self);
              __int16 v124 = 2082;
              v125 = sel_getName(a2);
              __int16 v126 = 1024;
              int v127 = 237;
              __int16 v128 = 2114;
              v129 = v16;
              _os_log_impl(&dword_19D636000, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", buf, 0x2Cu);
            }

            v40 = self->_userDefaults;
            self->_userDefaults = 0;

            goto LABEL_87;
          }
        }
      }
      v50 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v51 = NFLogGetLogger();
      if (v51)
      {
        uint64_t v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(self);
        BOOL v54 = class_isMetaClass(v53);
        BOOL v55 = object_getClassName(self);
        v113 = sel_getName(a2);
        uint64_t v56 = 45;
        if (v54) {
          uint64_t v56 = 43;
        }
        v52(3, "%c[%{public}s %{public}s]:%i TTR Prohibition time is in Unexpected format", v56, v55, v113, 242);
      }
      dispatch_get_specific(*v50);
      int v57 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = object_getClass(self);
        if (class_isMetaClass(v58)) {
          int v59 = 43;
        }
        else {
          int v59 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v121 = v59;
        __int16 v122 = 2082;
        v123 = object_getClassName(self);
        __int16 v124 = 2082;
        v125 = sel_getName(a2);
        __int16 v126 = 1024;
        int v127 = 242;
        _os_log_impl(&dword_19D636000, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i TTR Prohibition time is in Unexpected format", buf, 0x22u);
      }

      uint64_t v60 = *MEMORY[0x1E4F1D9A8];
      v118[0] = *MEMORY[0x1E4F1D990];
      v118[1] = v60;
      v119[0] = @"Stockholm Error Detected!";
      v119[1] = @"Please file a Radar";
      uint64_t v61 = *MEMORY[0x1E4F1D9D0];
      v118[2] = *MEMORY[0x1E4F1D9E0];
      v118[3] = v61;
      v119[2] = @"File Radar";
      v119[3] = @"Not Now";
      uint64_t v62 = *MEMORY[0x1E4F1D9B8];
      v118[4] = *MEMORY[0x1E4F1DA10];
      v118[5] = v62;
      v119[4] = @"Never bother me again";
      v119[5] = MEMORY[0x1E4F1CC38];
      v63 = getSBUserNotificationDismissOnLock();
      v118[6] = v63;
      v119[6] = MEMORY[0x1E4F1CC28];
      CFDictionaryRef v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:7];

      v65 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v64);
      self->_userNotification = v65;
      if (!v65 || error)
      {
        CFDictionaryRef v116 = v64;
        dispatch_get_specific(*v50);
        uint64_t v81 = NFLogGetLogger();
        if (v81)
        {
          v82 = (void (*)(uint64_t, const char *, ...))v81;
          v83 = object_getClass(self);
          BOOL v84 = class_isMetaClass(v83);
          v85 = v50;
          v86 = object_getClassName(self);
          v87 = sel_getName(a2);
          uint64_t v88 = 45;
          if (v84) {
            uint64_t v88 = 43;
          }
          v108 = v86;
          v50 = v85;
          v82(3, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", v88, v108, v87, 258, error);
        }
        dispatch_get_specific(*v50);
        v89 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          v90 = object_getClass(self);
          if (class_isMetaClass(v90)) {
            int v91 = 43;
          }
          else {
            int v91 = 45;
          }
          v92 = object_getClassName(self);
          v93 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v121 = v91;
          __int16 v122 = 2082;
          v123 = v92;
          __int16 v124 = 2082;
          v125 = v93;
          __int16 v126 = 1024;
          int v127 = 258;
          __int16 v128 = 1024;
          LODWORD(v129) = error;
          _os_log_impl(&dword_19D636000, v89, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", buf, 0x28u);
        }

        userNotification = self->_userNotification;
        CFDictionaryRef v64 = v116;
        if (!userNotification) {
          goto LABEL_85;
        }
      }
      else
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v65, (CFUserNotificationCallBack)NFTTRUserNotificationCallback, 0);
        self->_runLoopSource = RunLoopSource;
        if (RunLoopSource)
        {
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
          dispatch_get_specific(*v50);
          uint64_t v68 = NFLogGetLogger();
          if (v68)
          {
            __int16 v69 = (void (*)(uint64_t, const char *, ...))v68;
            v70 = object_getClass(self);
            BOOL v71 = class_isMetaClass(v70);
            int v72 = object_getClassName(self);
            v114 = sel_getName(a2);
            uint64_t v73 = 45;
            if (v71) {
              uint64_t v73 = 43;
            }
            v107 = v72;
            v50 = (const void **)MEMORY[0x1E4FBA898];
            v69(6, "%c[%{public}s %{public}s]:%i TTR prompt created", v73, v107, v114, 276);
          }
          dispatch_get_specific(*v50);
          int v74 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v75 = object_getClass(self);
            if (class_isMetaClass(v75)) {
              int v76 = 43;
            }
            else {
              int v76 = 45;
            }
            __int16 v77 = object_getClassName(self);
            int v78 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v121 = v76;
            __int16 v122 = 2082;
            v123 = v77;
            __int16 v124 = 2082;
            v125 = v78;
            __int16 v126 = 1024;
            int v127 = 276;
            _os_log_impl(&dword_19D636000, v74, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR prompt created", buf, 0x22u);
          }

          __int16 v79 = (NSString *)v7;
          pendingRequest = (NSUserDefaults *)self->_pendingRequest;
          self->_pendingRequest = v79;
          goto LABEL_86;
        }
        dispatch_get_specific(*v50);
        uint64_t v95 = NFLogGetLogger();
        if (v95)
        {
          v96 = (void (*)(uint64_t, const char *, ...))v95;
          v97 = object_getClass(self);
          BOOL v98 = class_isMetaClass(v97);
          v99 = object_getClassName(self);
          v115 = sel_getName(a2);
          uint64_t v100 = 45;
          if (v98) {
            uint64_t v100 = 43;
          }
          v109 = v99;
          v50 = (const void **)MEMORY[0x1E4FBA898];
          v96(3, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", v100, v109, v115, 268);
        }
        dispatch_get_specific(*v50);
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
          *(_DWORD *)buf = 67109890;
          int v121 = v103;
          __int16 v122 = 2082;
          v123 = v104;
          __int16 v124 = 2082;
          v125 = v105;
          __int16 v126 = 1024;
          int v127 = 268;
          _os_log_impl(&dword_19D636000, v101, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", buf, 0x22u);
        }

        userNotification = self->_userNotification;
      }
      CFRelease(userNotification);
LABEL_85:
      self->_userNotification = 0;
      pendingRequest = self->_userDefaults;
      self->_userDefaults = 0;
LABEL_86:

      goto LABEL_87;
    }
  }
  int v41 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v42 = NFLogGetLogger();
  if (v42)
  {
    v43 = (void (*)(uint64_t, const char *, ...))v42;
    BOOL v44 = object_getClass(self);
    BOOL v45 = class_isMetaClass(v44);
    v46 = object_getClassName(self);
    v112 = sel_getName(a2);
    uint64_t v47 = 45;
    if (v45) {
      uint64_t v47 = 43;
    }
    v43(3, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", v47, v46, v112, 219);
  }
  dispatch_get_specific(*v41);
  v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v48 = object_getClass(self);
    if (class_isMetaClass(v48)) {
      int v49 = 43;
    }
    else {
      int v49 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v121 = v49;
    __int16 v122 = 2082;
    v123 = object_getClassName(self);
    __int16 v124 = 2082;
    v125 = sel_getName(a2);
    __int16 v126 = 1024;
    int v127 = 219;
    uint64_t v19 = "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock";
    goto LABEL_40;
  }
LABEL_87:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end