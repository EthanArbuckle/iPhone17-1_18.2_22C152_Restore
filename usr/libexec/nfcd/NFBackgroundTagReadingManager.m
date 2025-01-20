@interface NFBackgroundTagReadingManager
- (BOOL)isActive;
- (BOOL)isSuspended;
- (NFBackgroundTagReadingManager)initWithQueue:(id)a3 driverWrapper:(id)a4;
- (id)dumpState;
- (id)getECPFrame;
- (void)dealloc;
- (void)didCameraStateChange:(BOOL)a3;
- (void)didScreenStateChange:(int64_t)a3;
- (void)handleDetectedTags:(id)a3;
- (void)queueResume;
- (void)queueSuspend;
- (void)refreshUserDefaultsOverride;
- (void)releaseECPOption:(unint64_t)a3;
- (void)resume;
- (void)retainECPOption:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)suspend;
- (void)touchSystemReady:(BOOL)a3;
@end

@implementation NFBackgroundTagReadingManager

- (void)touchSystemReady:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Ready=%d", v10, ClassName, Name, 845, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v20 = v13;
    __int16 v21 = 2082;
    v22 = object_getClassName(self);
    __int16 v23 = 2082;
    v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 845;
    __int16 v27 = 1024;
    BOOL v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ready=%d", buf, 0x28u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventProcessingQueue);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B9C0;
  block[3] = &unk_100301BC8;
  block[4] = self;
  BOOL v18 = v3;
  dispatch_async(workQueue, block);
}

- (NFBackgroundTagReadingManager)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  id v67 = a3;
  v8 = a4;
  v68.receiver = self;
  v68.super_class = (Class)NFBackgroundTagReadingManager;
  v9 = [(NFBackgroundTagReadingManager *)&v68 init];
  if (!v9)
  {
LABEL_51:
    v33 = v9;
    goto LABEL_52;
  }
  if (!v67 || !v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v9);
      if (class_isMetaClass(Class)) {
        uint64_t v22 = 43;
      }
      else {
        uint64_t v22 = 45;
      }
      ClassName = object_getClassName(v9);
      Name = sel_getName(a2);
      CFStringRef v25 = @"nil queue, ";
      if (v67) {
        CFStringRef v25 = &stru_100309C40;
      }
      CFStringRef v26 = @"nil wrapper";
      if (v8) {
        CFStringRef v26 = &stru_100309C40;
      }
      Logger(3, "%c[%{public}s %{public}s]:%i %{public}@%{public}@", v22, ClassName, Name, 142, v25, v26);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = object_getClass(v9);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      v29 = object_getClassName(v9);
      v30 = sel_getName(a2);
      CFStringRef v31 = @"nil queue, ";
      if (v67) {
        CFStringRef v31 = &stru_100309C40;
      }
      *(_DWORD *)buf = 67110402;
      CFStringRef v32 = @"nil wrapper";
      if (v8) {
        CFStringRef v32 = &stru_100309C40;
      }
      *(_DWORD *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = v29;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v30;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 142;
      *(_WORD *)&buf[34] = 2114;
      *(void *)&buf[36] = v31;
      __int16 v72 = 2114;
      CFStringRef v73 = v32;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@%{public}@", buf, 0x36u);
    }
    goto LABEL_34;
  }
  if (v8[218])
  {
    v62 = [NFTagAppLauncher alloc];
    v66 = objc_opt_new();
    v70[0] = v66;
    v34 = [NFTagAppProcessorDockKit alloc];
    v65 = +[_NFHardwareManager sharedHardwareManager];
    v64 = [v65 xpcEventNotificationQueue];
    v63 = sub_1001A1CA0(v34, @"com.apple.dockaccessoryd.pairsetup", v64);
    v70[1] = v63;
    v35 = objc_opt_new();
    v70[2] = v35;
    v36 = [NFTagAppProcessorHomeKitAccessory alloc];
    v37 = +[_NFHardwareManager sharedHardwareManager];
    v38 = [v37 xpcEventNotificationQueue];
    v39 = sub_10014A4A8(v36, @"com.apple.nfcd.homekit.proxcard", v38);
    v70[3] = v39;
    v40 = +[NSArray arrayWithObjects:v70 count:4];
    v41 = sub_1001E3D84((id *)&v62->super.isa, v40);
    appLauncher = v9->_appLauncher;
    v9->_appLauncher = (NFTagAppLauncher *)v41;

    v9->_userDefaultsOverride = 0;
    objc_storeStrong((id *)&v9->_driverWrapper, a4);
    objc_storeStrong((id *)&v9->_workQueue, a3);
    v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = dispatch_queue_attr_make_with_qos_class(v43, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v45 = dispatch_queue_create("com.apple.nfcd.background.scan.eventProcessing", v44);
    eventProcessingQueue = v9->_eventProcessingQueue;
    v9->_eventProcessingQueue = (OS_dispatch_queue *)v45;

    SCPreferencesRef v47 = SCPreferencesCreate(kCFAllocatorDefault, @"nfcd", @"com.apple.radios.plist");
    v9->_radiosPreferences = v47;
    if (v47)
    {
      sub_1001ED2E4((uint64_t)v9);
      memset(buf, 0, 40);
      id v48 = objc_initWeak(&location, v9);
      *(void *)&buf[8] = v9;

      SCPreferencesSetCallback(v9->_radiosPreferences, (SCPreferencesCallBack)sub_1001ED5B8, (SCPreferencesContext *)buf);
      SCPreferencesSetDispatchQueue(v9->_radiosPreferences, (dispatch_queue_t)v9->_workQueue);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v49)
      {
        v50 = object_getClass(v9);
        if (class_isMetaClass(v50)) {
          uint64_t v51 = 43;
        }
        else {
          uint64_t v51 = 45;
        }
        v52 = object_getClassName(v9);
        v53 = sel_getName("listenForAirplaneMode");
        v49(3, "%c[%{public}s %{public}s]:%i Failed to listen for Airplane mode", v51, v52, v53, 230);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = object_getClass(v9);
        if (class_isMetaClass(v55)) {
          int v56 = 43;
        }
        else {
          int v56 = 45;
        }
        v57 = object_getClassName(v9);
        v58 = sel_getName("listenForAirplaneMode");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v56;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = v57;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v58;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 230;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to listen for Airplane mode", buf, 0x22u);
      }
    }
    if (v9->_airplaneMode) {
      [(NFBackgroundTagReadingManager *)v9 suspend];
    }
    uint64_t v59 = os_transaction_create();
    keepAliveAssertion = v9->_keepAliveAssertion;
    v9->_keepAliveAssertion = (OS_os_transaction *)v59;

    [(NFBackgroundTagReadingManager *)v9 refreshUserDefaultsOverride];
    goto LABEL_51;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10)
  {
    v11 = object_getClass(v9);
    if (class_isMetaClass(v11)) {
      uint64_t v12 = 43;
    }
    else {
      uint64_t v12 = 45;
    }
    int v13 = object_getClassName(v9);
    v14 = sel_getName(a2);
    v10(6, "%c[%{public}s %{public}s]:%i No RF capabilites, no BG tag reading", v12, v13, v14, 148);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(v9);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    BOOL v18 = object_getClassName(v9);
    v19 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = v18;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v19;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = 148;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No RF capabilites, no BG tag reading", buf, 0x22u);
  }
LABEL_34:

  v33 = 0;
  v9->_backgroundTagDetectState = 2;
LABEL_52:

  return v33;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  if (self)
  {
    radiosPreferences = self->_radiosPreferences;
    if (radiosPreferences)
    {
      CFRelease(radiosPreferences);
      self->_radiosPreferences = 0;
    }
  }
  if (self->_backgroundTagDetectState != 2)
  {
    sub_100180B08();
    v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    sub_1001818FC(v5, @"NFBackgroundTagReadingManager");
  }
  sub_1001ED238((uint64_t)self);
  sub_1001ED290((uint64_t)self);
  suspendTimer = self->_suspendTimer;
  self->_suspendTimer = 0;

  v7.receiver = self;
  v7.super_class = (Class)NFBackgroundTagReadingManager;
  [(NFBackgroundTagReadingManager *)&v7 dealloc];
}

- (BOOL)isActive
{
  BOOL v3 = sub_100202C68(self->_screenStateMonitor);
  v4 = sub_100180B08();
  BOOL v5 = sub_1001823D8(v4);

  if (self->_backgroundTagDetectState != 1) {
    return 0;
  }
  BOOL v6 = self->_suspend <= 0 && v3;
  if (!v6 || v5) {
    return 0;
  }
  if (self->_touchSensorMonitor) {
    return self->_touchSystemReady;
  }
  return 1;
}

- (BOOL)isSuspended
{
  return self->_suspend > 0;
}

- (void)suspend
{
}

- (void)queueSuspend
{
}

- (void)resume
{
}

- (void)queueResume
{
}

- (void)handleDetectedTags:(id)a3
{
  id v142 = a3;
  BOOL v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_TAG_DETECTED", (const char *)&unk_100286819, buf, 2u);
  }

  BOOL v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", (const char *)&unk_100286819, buf, 2u);
  }

  if (self->_backgroundTagDetectState != 1)
  {
    int v12 = 0;
    goto LABEL_152;
  }
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v7 = v142;
  id v8 = [v7 countByEnumeratingWithState:&v145 objects:v150 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v146;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v146 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v145 + 1) + 8 * i);
        if ([v11 type] != 10 && objc_msgSend(v11, "type"))
        {
          id v8 = v11;
          goto LABEL_18;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v145 objects:v150 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  id v13 = v8;
  if ([v13 type] == 5)
  {
    *(_DWORD *)buf = 0;
    v14 = [v13 tagB];
    v15 = [v14 pupi];
    id v16 = [objc_alloc((Class)NSData) initWithBytes:buf length:4];
    unsigned int v17 = [v15 isEqualToData:v16];

    if (v17)
    {
      BOOL v18 = self->_suspendTimer == 0;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      int v20 = (void (*)(uint64_t, const char *, ...))Logger;
      if (v18)
      {
        if (Logger)
        {
          Class = object_getClass(self);
          if (class_isMetaClass(Class)) {
            uint64_t v100 = 43;
          }
          else {
            uint64_t v100 = 45;
          }
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v20(6, "%c[%{public}s %{public}s]:%i Ignore non-compliant tag; suspend tag detect for %f",
            v100,
            ClassName,
            Name,
            416,
            0x3FF8000000000000);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v103 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          v104 = object_getClass(self);
          if (class_isMetaClass(v104)) {
            int v105 = 43;
          }
          else {
            int v105 = 45;
          }
          v106 = object_getClassName(self);
          v107 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&uint8_t buf[4] = v105;
          *(_WORD *)v152 = 2082;
          *(void *)&v152[2] = v106;
          *(_WORD *)&v152[10] = 2082;
          *(void *)&v152[12] = v107;
          *(_WORD *)&v152[20] = 1024;
          *(_DWORD *)&v152[22] = 416;
          *(_WORD *)&v152[26] = 2048;
          *(void *)&v152[28] = 0x3FF8000000000000;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore non-compliant tag; suspend tag detect for %f",
            buf,
            0x2Cu);
        }

        objc_initWeak((id *)buf, self);
        [(NFBackgroundTagReadingManager *)self suspend];
        id v108 = objc_alloc((Class)NFTimer);
        v143[0] = _NSConcreteStackBlock;
        v143[1] = 3221225472;
        v143[2] = sub_1001EF568;
        v143[3] = &unk_1003022A0;
        objc_copyWeak(v144, (id *)buf);
        v144[1] = (id)a2;
        id v109 = [v108 initWithCallback:v143 queue:self->_workQueue];
        suspendTimer = self->_suspendTimer;
        p_suspendTimer = (id *)&self->_suspendTimer;
        id *p_suspendTimer = v109;

        [*p_suspendTimer startTimer:1.5];
        objc_destroyWeak(v144);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (Logger)
        {
          __int16 v21 = object_getClass(self);
          if (class_isMetaClass(v21)) {
            uint64_t v22 = 43;
          }
          else {
            uint64_t v22 = 45;
          }
          __int16 v23 = object_getClassName(self);
          v24 = sel_getName(a2);
          v20(4, "%c[%{public}s %{public}s]:%i Timer has already started", v22, v23, v24, 431);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        CFStringRef v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v26 = object_getClass(self);
          if (class_isMetaClass(v26)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          int v28 = object_getClassName(self);
          v29 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v27;
          *(_WORD *)v152 = 2082;
          *(void *)&v152[2] = v28;
          *(_WORD *)&v152[10] = 2082;
          *(void *)&v152[12] = v29;
          *(_WORD *)&v152[20] = 1024;
          *(_DWORD *)&v152[22] = 431;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timer has already started", buf, 0x22u);
        }
      }
      v112 = NFSharedSignpostLog();
      if (os_signpost_enabled(v112))
      {
        *(void *)buf = 67240192;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v112, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", "tagProcessed=%{public, signpost.description:attribute}u", buf, 8u);
      }

      goto LABEL_165;
    }
  }
  else
  {
  }
  p_backgroundNDEFTag = (void **)&self->_backgroundNDEFTag;
  objc_storeStrong((id *)&self->_backgroundNDEFTag, v8);
  if (v13)
  {
    sel = [v13 tagID];
    [sel NF_asHexString];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    CFStringRef v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x2050000000;
    CFStringRef v32 = (__CFString *)qword_100347600;
    CFStringRef v157 = (const __CFString *)qword_100347600;
    if (!qword_100347600)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)v152 = 3221225472;
      *(void *)&v152[8] = sub_1001F0914;
      *(void *)&v152[16] = &unk_100301E40;
      *(void *)&v152[24] = &v154;
      sub_1001F0914((uint64_t)buf);
      CFStringRef v32 = (__CFString *)v155[3];
    }
    v33 = v32;
    _Block_object_dispose(&v154, 8);
    SEL v34 = NSSelectorFromString(@"keyPathForNFCTagIdentifiers");
    v35 = (void (*)(__CFString *, SEL))[(__CFString *)v33 methodForSelector:v34];
    if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v36 = v35(v33, v34);
      if (v36)
      {
        CFStringRef v154 = 0;
        v155 = &v154;
        uint64_t v156 = 0x2050000000;
        v37 = (__CFString *)qword_100347608;
        CFStringRef v157 = (const __CFString *)qword_100347608;
        if (!qword_100347608)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)v152 = 3221225472;
          *(void *)&v152[8] = sub_1001F0BA0;
          *(void *)&v152[16] = &unk_100301E40;
          *(void *)&v152[24] = &v154;
          sub_1001F0BA0((uint64_t)buf);
          v37 = (__CFString *)v155[3];
        }
        v38 = v37;
        _Block_object_dispose(&v154, 8);
        SEL v39 = NSSelectorFromString(@"userContext");
        v40 = (void (*)(__CFString *, SEL))[(__CFString *)v38 methodForSelector:v39];
        if (v40 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v41 = v40(v38, v39);
          id v153 = v31;
          v42 = +[NSArray arrayWithObjects:&v153 count:1];
          [v41 setObject:v42 forKeyedSubscript:v36];
        }
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v43)
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44)) {
          uint64_t v45 = 43;
        }
        else {
          uint64_t v45 = 45;
        }
        v46 = object_getClassName(self);
        SCPreferencesRef v47 = sel_getName("_updateLastNFCTag:");
        v43(3, "%c[%{public}s %{public}s]:%i keyPath not found", v45, v46, v47, 386);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v48 = object_getClass(self);
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        v50 = object_getClassName(self);
        uint64_t v51 = sel_getName("_updateLastNFCTag:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v49;
        *(_WORD *)v152 = 2082;
        *(void *)&v152[2] = v50;
        *(_WORD *)&v152[10] = 2082;
        *(void *)&v152[12] = v51;
        *(_WORD *)&v152[20] = 1024;
        *(_DWORD *)&v152[22] = 386;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i keyPath not found", buf, 0x22u);
      }
    }

    CFStringRef v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x2050000000;
    v52 = (__CFString *)qword_100347610;
    CFStringRef v157 = (const __CFString *)qword_100347610;
    if (!qword_100347610)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)v152 = 3221225472;
      *(void *)&v152[8] = sub_1001F0C68;
      *(void *)&v152[16] = &unk_100301E40;
      *(void *)&v152[24] = &v154;
      sub_1001F0C68((uint64_t)buf);
      v52 = (__CFString *)v155[3];
    }
    v53 = v52;
    _Block_object_dispose(&v154, 8);
    id v54 = [[v53 alloc] initWithTagID:v31];
    if (v54)
    {
      CFStringRef v154 = 0;
      v155 = &v154;
      uint64_t v156 = 0x2020000000;
      v55 = (void (*)(void))off_100347618;
      CFStringRef v157 = (const __CFString *)off_100347618;
      if (!off_100347618)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v152 = 3221225472;
        *(void *)&v152[8] = sub_1001F0EF8;
        *(void *)&v152[16] = &unk_100301E40;
        *(void *)&v152[24] = &v154;
        int v56 = sub_1001F0D30();
        v57 = dlsym(v56, "__BMRootLibrary");
        *(void *)(*(void *)(*(void *)&v152[24] + 8) + 24) = v57;
        off_100347618 = *(_UNKNOWN **)(*(void *)(*(void *)&v152[24] + 8) + 24);
        v55 = (void (*)(void))v155[3];
      }
      _Block_object_dispose(&v154, 8);
      if (!v55)
      {
        v139 = +[NSAssertionHandler currentHandler];
        v140 = +[NSString stringWithUTF8String:"id<BMRootLibrary> NFBiomeLibrary(void)"];
        [v139 handleFailureInFunction:v140 file:@"NFBackgroundTagReadingManager.m" lineNumber:64 description:@"%s", dlerror()];

        __break(1u);
      }
      v58 = v55();
      uint64_t v59 = [v58 Device];
      v60 = [v59 Wireless];
      v61 = [v60 NFCTag];

      v62 = [v61 source];
      [v62 sendEvent:v54];
    }
  }
  v63 = sub_10023D968();
  sub_10023D9FC((uint64_t)v63, *p_backgroundNDEFTag);

  id v64 = *p_backgroundNDEFTag;
  if (!v64)
  {
    objc_super v68 = 0;
    uint64_t v69 = 3;
    goto LABEL_143;
  }
  v65 = +[_NFHardwareManager sharedHardwareManager];
  [v65 notifyReaderModeActivityStart];

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (int v67 = sub_10018FAE8(driverWrapper, v64, 0)) == 0)
  {
    v70 = NFSharedSignpostLog();
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "start", buf, 2u);
    }

    CFStringRef v154 = 0;
    v155 = 0;
    uint64_t v156 = 0;
    v71 = self->_driverWrapper;
    id v153 = 0;
    int v72 = sub_100190624(v71, v64, (uint64_t *)&v154, (uint64_t)&v153);
    id v73 = v153;
    if (v72)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v74)
      {
        v75 = object_getClass(self);
        if (class_isMetaClass(v75)) {
          uint64_t v76 = 43;
        }
        else {
          uint64_t v76 = 45;
        }
        v77 = object_getClassName(self);
        v78 = sel_getName("_readNDEFFromTag:readResult:");
        if ((_BYTE)v156) {
          CFStringRef v79 = @"readable";
        }
        else {
          CFStringRef v79 = @"not readable";
        }
        v74(6, "%c[%{public}s %{public}s]:%i NDEF tag %{public}@", v76, v77, v78, 685, v79);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = object_getClass(self);
        if (class_isMetaClass(v81)) {
          int v82 = 43;
        }
        else {
          int v82 = 45;
        }
        v83 = object_getClassName(self);
        v84 = sel_getName("_readNDEFFromTag:readResult:");
        CFStringRef v85 = @"readable";
        if (!(_BYTE)v156) {
          CFStringRef v85 = @"not readable";
        }
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v82;
        *(_WORD *)v152 = 2082;
        *(void *)&v152[2] = v83;
        *(_WORD *)&v152[10] = 2082;
        *(void *)&v152[12] = v84;
        *(_WORD *)&v152[20] = 1024;
        *(_DWORD *)&v152[22] = 685;
        *(_WORD *)&v152[26] = 2114;
        *(void *)&v152[28] = v85;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NDEF tag %{public}@", buf, 0x2Cu);
      }
    }
    if (v73)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v86 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v86)
      {
        v87 = object_getClass(self);
        if (class_isMetaClass(v87)) {
          uint64_t v88 = 43;
        }
        else {
          uint64_t v88 = 45;
        }
        v89 = object_getClassName(self);
        v90 = sel_getName("_readNDEFFromTag:readResult:");
        v86(6, "%c[%{public}s %{public}s]:%i Tag does not contain NDEF, status=%{public}@", v88, v89, v90, 689, v73);
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
        v95 = sel_getName("_readNDEFFromTag:readResult:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v93;
        *(_WORD *)v152 = 2082;
        *(void *)&v152[2] = v94;
        *(_WORD *)&v152[10] = 2082;
        *(void *)&v152[12] = v95;
        *(_WORD *)&v152[20] = 1024;
        *(_DWORD *)&v152[22] = 689;
        *(_WORD *)&v152[26] = 2114;
        *(void *)&v152[28] = v73;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag does not contain NDEF, status=%{public}@", buf, 0x2Cu);
      }

      if ([v73 code] == (id)51 || objc_msgSend(v73, "code") == (id)15)
      {
        sub_1002128B4(self->_driverWrapper);
      }
      else
      {
        if ([v73 code] != (id)28)
        {
          if ([v73 code] == (id)37)
          {
            sub_1001900C4(self->_driverWrapper, v64, 1u);
            +[NFLPCDStatisticsCALogger postAnalyticsLPCDStatistic:&off_100323618];
            uint64_t v69 = 2;
          }
          else if ([v73 code] == (id)64)
          {
            uint64_t v69 = 4;
          }
          else
          {
            uint64_t v69 = 3;
          }
          goto LABEL_103;
        }
        sub_100215CAC(self->_driverWrapper);
      }
      uint64_t v69 = 5;
LABEL_103:
      v96 = +[_NFHardwareManager sharedHardwareManager];
      [v96 notifyReaderModeActivityEnd];

      v97 = NFSharedSignpostLog();
      if (os_signpost_enabled(v97))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "done", buf, 2u);
      }
      objc_super v68 = 0;
      goto LABEL_142;
    }
    if ((_BYTE)v156)
    {
      v113 = self->_driverWrapper;
      *(void *)buf = 0;
      v97 = sub_100193320(v113, v64, v154, buf);
      id v73 = *(id *)buf;
    }
    else
    {
      id v73 = 0;
      v97 = 0;
    }
    v114 = NFSharedSignpostLog();
    if (os_signpost_enabled(v114))
    {
      *(_WORD *)v149 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "tag read", v149, 2u);
    }

    v115 = +[_NFHardwareManager sharedHardwareManager];
    [v115 notifyReaderModeActivityEnd];

    v116 = NFSharedSignpostLog();
    if (os_signpost_enabled(v116))
    {
      *(_WORD *)v149 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "done", v149, 2u);
    }

    v117 = [v97 asData];
    id v118 = [v117 length];

    v119 = sub_10023D968();
    sub_10023DF68((uint64_t)v119, (uint64_t)v118);

    if (v73)
    {
      if ([v73 code] == (id)51)
      {
        sub_1002128B4(self->_driverWrapper);
LABEL_137:
        objc_super v68 = 0;
        uint64_t v69 = 3;
LABEL_142:

        goto LABEL_143;
      }
      id v121 = [v73 code];
      v122 = self->_driverWrapper;
      if (v121 == (id)21)
      {
        sub_100215CAC(v122);
        goto LABEL_137;
      }
      sub_1001900C4(v122, v64, 1u);
      v120 = v97;
      v97 = v120;
    }
    else
    {
      sub_1001900C4(self->_driverWrapper, v64, 1u);
      v120 = v97;
      v97 = v120;
      id v73 = 0;
    }
    uint64_t v69 = 3;
    objc_super v68 = v120;
    goto LABEL_142;
  }
  if (v67 == 51) {
    sub_1002128B4(self->_driverWrapper);
  }
  else {
    sub_100215CAC(self->_driverWrapper);
  }
  v98 = +[_NFHardwareManager sharedHardwareManager];
  [v98 notifyReaderModeActivityEnd];

  objc_super v68 = 0;
  uint64_t v69 = 5;
LABEL_143:

  if (sub_1001E4194((uint64_t)self->_appLauncher, self->_backgroundNDEFTag, v68))
  {
    unsigned int v123 = [*p_backgroundNDEFTag type] - 1;
    if (v123 <= 0xE && ((0x65EDu >> v123) & 1) != 0) {
      ++*(_DWORD *)((char *)&self->super.isa + qword_1002843F8[v123]);
    }
    uint64_t v69 = 1;
    int v12 = 1;
    if (!v68) {
      goto LABEL_151;
    }
    goto LABEL_150;
  }
  int v12 = 0;
  if (v68)
  {
LABEL_150:
    v124 = sub_10023D968();
    v125 = [v68 asData];
    sub_10023DF68((uint64_t)v124, (uint64_t)[v125 length]);
  }
LABEL_151:
  v126 = sub_10023D968();
  sub_10023E090((uint64_t)v126, v69);

  v127 = sub_10023D968();
  sub_10023DAD0((uint64_t)v127, *p_backgroundNDEFTag, [*p_backgroundNDEFTag type]);

LABEL_152:
  v128 = NFSharedSignpostLog();
  if (os_signpost_enabled(v128))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v128, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", "tagProcessed=%{public, signpost.description:attribute}u", buf, 8u);
  }

  v129 = self->_driverWrapper;
  if (v129 && v129->_hasAntenna)
  {
    tagTypeReadCount = self->_tagTypeReadCount;
    if (*(void *)self->_tagTypeReadCount
      || self->_tagTypeReadCount[2]
      || self->_tagTypeReadCount[3]
      || self->_tagTypeReadCount[4])
    {
      CFStringRef v154 = @"tagType1ReadSuccessCount";
      v131 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      *(void *)buf = v131;
      v155 = (const __CFString **)@"tagType2ReadSuccessCount";
      v132 = +[NSNumber numberWithUnsignedInt:self->_tagTypeReadCount[1]];
      *(void *)v152 = v132;
      uint64_t v156 = @"tagType3ReadSuccessCount";
      v133 = +[NSNumber numberWithUnsignedInt:self->_tagTypeReadCount[2]];
      *(void *)&v152[8] = v133;
      CFStringRef v157 = @"tagType4ReadSuccessCount";
      v134 = +[NSNumber numberWithUnsignedInt:self->_tagTypeReadCount[3]];
      *(void *)&v152[16] = v134;
      CFStringRef v158 = @"tagType5ReadSuccessCount";
      v135 = +[NSNumber numberWithUnsignedInt:self->_tagTypeReadCount[4]];
      *(void *)&v152[24] = v135;
      v136 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v154 count:5];
      +[NFLPCDStatisticsCALogger postAnalyticsLPCDStatistic:v136];
    }
    *(void *)tagTypeReadCount = 0;
    *((void *)tagTypeReadCount + 1) = 0;
    tagTypeReadCount[4] = 0;
  }
  if (NFIsInternalBuild())
  {
    v137 = +[NSUserDefaults standardUserDefaults];
    unsigned int v138 = [v137 BOOLForKey:@"postBackgroundTagEvents"];

    if (v138)
    {
      id v13 = +[NSDistributedNotificationCenter defaultCenter];
      [v13 postNotificationName:@"com.apple.nfcd.backgroundTag.detect.event" object:0 userInfo:0 options:1];
LABEL_165:
    }
  }
}

- (id)getECPFrame
{
  if (self->_ecpCHEnableCount)
  {
    id v3 = [objc_alloc((Class)NSMutableData) initWithBytes:&unk_1002843F0 length:8];
    sub_100183960();
    v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = sub_100184158(v4);

    [v3 appendData:v5];
    sub_100183960();
    BOOL v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    self->_ecpCHRandom = sub_100183E14(v6);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)start
{
  int64_t suspend = self->_suspend;
  if (self->_backgroundTagDetectState != 1)
  {
    if (suspend <= 0)
    {
      sub_100180B08();
      int v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      if (!sub_100182428(v12, @"NFBackgroundTagReadingManager")) {
        sub_100180D64(v12, self, @"NFBackgroundTagReadingManager");
      }
      if (self->_userDefaultsOverride != 1)
      {
        self->_backgroundTagDetectState = 1;
        BOOL v18 = sub_10020EC8C(self->_driverWrapper, @"TagReader", 1uLL);

        if (v18)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            int v20 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v24 = 45;
            if (isMetaClass) {
              uint64_t v24 = 43;
            }
            v20(3, "%c[%{public}s %{public}s]:%i Fail background tag read configuration", v24, ClassName, Name, 550);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          CFStringRef v25 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v26 = object_getClass(self);
            if (class_isMetaClass(v26)) {
              int v27 = 43;
            }
            else {
              int v27 = 45;
            }
            *(_DWORD *)buf = 67109890;
            int v31 = v27;
            __int16 v32 = 2082;
            v33 = object_getClassName(self);
            __int16 v34 = 2082;
            v35 = sel_getName(a2);
            __int16 v36 = 1024;
            int v37 = 550;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail background tag read configuration", buf, 0x22u);
          }

          self->_backgroundTagDetectState = 0;
        }
        else
        {
          sub_1001EDE9C((void **)&self->super.isa);
          sub_1001EDE34((uint64_t)self);
          sub_100183960();
          int v28 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          sub_100184318(v28);
        }
      }
      goto LABEL_29;
    }
LABEL_5:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v5 = NFLogGetLogger();
    if (v5)
    {
      BOOL v6 = (void (*)(uint64_t, const char *, ...))v5;
      id v7 = object_getClass(self);
      BOOL v8 = class_isMetaClass(v7);
      uint64_t v9 = object_getClassName(self);
      uint64_t v10 = sel_getName(a2);
      uint64_t v11 = 45;
      if (v8) {
        uint64_t v11 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i suspend count = %d", v11, v9, v10, 524, self->_suspend);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NFSharedLogGetLogger();
    int v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      v15 = object_getClassName(self);
      id v16 = sel_getName(a2);
      int64_t v17 = self->_suspend;
      *(_DWORD *)buf = 67110146;
      int v31 = v14;
      __int16 v32 = 2082;
      v33 = v15;
      __int16 v34 = 2082;
      v35 = v16;
      __int16 v36 = 1024;
      int v37 = 524;
      __int16 v38 = 1024;
      int v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i suspend count = %d", buf, 0x28u);
    }
LABEL_29:

    return;
  }
  if (suspend >= 1) {
    goto LABEL_5;
  }
}

- (void)stop
{
  if (self->_backgroundTagDetectState)
  {
    sub_1001ED238((uint64_t)self);
    sub_1001ED290((uint64_t)self);
    self->_backgroundTagDetectState = 0;
    sub_1002114AC(self->_driverWrapper, @"TagReader");
    backgroundNDEFTag = self->_backgroundNDEFTag;
    self->_backgroundNDEFTag = 0;
  }
}

- (void)refreshUserDefaultsOverride
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v3 objectForKey:@"backgroundTagDetect"];

  v4 = v7;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [v7 BOOLValue];
      unint64_t v6 = 1;
      if (v5) {
        unint64_t v6 = 2;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    v4 = v7;
  }
  else
  {
    unint64_t v6 = 0;
  }
  self->_userDefaultsOverride = v6;
}

- (void)retainECPOption:(unint64_t)a3
{
  if (a3)
  {
    unsigned int ecpCHEnableCount = self->_ecpCHEnableCount;
    if (ecpCHEnableCount < 0xB) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = ecpCHEnableCount;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unexpected retain count=%d", buf, 8u);
      unsigned int ecpCHEnableCount = self->_ecpCHEnableCount;
    }
    if (ecpCHEnableCount == -1)
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
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v7(4, "%c[%{public}s %{public}s]:%i count overflow", v11, ClassName, Name, 642);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = object_getClass(self);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        v15 = object_getClassName(self);
        id v16 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        unsigned int v19 = v14;
        __int16 v20 = 2082;
        __int16 v21 = v15;
        __int16 v22 = 2082;
        __int16 v23 = v16;
        __int16 v24 = 1024;
        int v25 = 642;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i count overflow", buf, 0x22u);
      }
    }
    else
    {
LABEL_6:
      self->_unsigned int ecpCHEnableCount = ecpCHEnableCount + 1;
    }
  }
}

- (void)releaseECPOption:(unint64_t)a3
{
  if (a3)
  {
    unsigned int ecpCHEnableCount = self->_ecpCHEnableCount;
    if (ecpCHEnableCount)
    {
      self->_unsigned int ecpCHEnableCount = ecpCHEnableCount - 1;
    }
    else
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
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v7(4, "%c[%{public}s %{public}s]:%i count underflow", v11, ClassName, Name, 653);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = object_getClass(self);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v17 = v14;
        __int16 v18 = 2082;
        unsigned int v19 = object_getClassName(self);
        __int16 v20 = 2082;
        __int16 v21 = sel_getName(a2);
        __int16 v22 = 1024;
        int v23 = 653;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i count underflow", buf, 0x22u);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Retain count underflow", buf, 2u);
      }
    }
  }
}

- (void)didScreenStateChange:(int64_t)a3
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
    if (a3 == 1) {
      int v12 = "yes";
    }
    else {
      int v12 = "no";
    }
    __int16 v21 = v12;
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i screenState=%ld -- allowBackgroundTagReading=%s", v13, ClassName, Name, 803, a3, v21);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(self);
    __int16 v18 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    if (a3 == 1) {
      unsigned int v19 = "yes";
    }
    else {
      unsigned int v19 = "no";
    }
    int v25 = v16;
    __int16 v26 = 2082;
    int v27 = v17;
    __int16 v28 = 2082;
    v29 = v18;
    __int16 v30 = 1024;
    int v31 = 803;
    __int16 v32 = 2048;
    int64_t v33 = a3;
    __int16 v34 = 2080;
    v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i screenState=%ld -- allowBackgroundTagReading=%s", buf, 0x36u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventProcessingQueue);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F050C;
  block[3] = &unk_100301BC8;
  BOOL v23 = a3 == 1;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)didCameraStateChange:(BOOL)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0660;
  block[3] = &unk_100306F48;
  BOOL v5 = a3;
  dispatch_async(workQueue, block);
}

- (id)dumpState
{
  id v3 = objc_opt_new();
  v4 = +[NSNumber numberWithUnsignedInteger:self->_backgroundTagDetectState];
  [v3 setObject:v4 forKeyedSubscript:@"State"];

  BOOL v5 = +[NSNumber numberWithInteger:self->_suspend];
  [v3 setObject:v5 forKeyedSubscript:@"Suspend"];

  if (self->_appLauncher) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 setObject:v6 forKeyedSubscript:@"App Launcher"];
  if (self->_backgroundNDEFTag) {
    id v7 = &off_10031F690;
  }
  else {
    id v7 = &off_10031F6A8;
  }
  [v3 setObject:v7 forKeyedSubscript:@"Tag count"];
  BOOL v8 = +[NSNumber numberWithUnsignedInteger:self->_userDefaultsOverride];
  [v3 setObject:v8 forKeyedSubscript:@"Defaults Override"];

  uint64_t v9 = +[NSNumber numberWithBool:self->_touchSystemReady];
  [v3 setObject:v9 forKeyedSubscript:@"Touch Ready"];

  uint64_t v10 = +[NSNumber numberWithBool:self->_airplaneMode];
  [v3 setObject:v10 forKeyedSubscript:@"Airplane mode"];

  uint64_t v11 = +[NSNumber numberWithUnsignedInt:self->_ecpCHEnableCount];
  [v3 setObject:v11 forKeyedSubscript:@"CH Enable Count"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_eventProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_suspendTimer, 0);
  objc_storeStrong((id *)&self->_touchSensorEventTimer, 0);
  objc_storeStrong((id *)&self->_screenStateMonitor, 0);
  objc_storeStrong((id *)&self->_touchSensorMonitor, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);

  objc_storeStrong((id *)&self->_backgroundNDEFTag, 0);
}

@end