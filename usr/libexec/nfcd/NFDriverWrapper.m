@interface NFDriverWrapper
- (BOOL)_isEMVPolling;
- (BOOL)enableHeadlessMode:(BOOL)a3 shutdown:(BOOL)a4;
- (BOOL)isJCOPTooOld:(unsigned __int8)a3 prod:(BOOL)a4 version:(unsigned __int16)a5;
- (double)nextRetryTime;
- (id)_attemptNFCCRecovery;
- (id)_getExtendedIdentifier:(id)a3;
- (id)_refreshTagInfo:(id)a3 update:(_NFDriverRemoteTag *)a4;
- (int)_checkFailForwardState;
- (int)_getRestoreStateAndRunBlockIfUnlocked:(id)a3;
- (int)_ntag5DriverRateFromTagRate:(int)a3;
- (int)_typeADriverRateFromTagRate:(int)a3;
- (void)_cardRemovalDetect:(id)a3;
- (void)_recoveryFailed;
- (void)_recoverySucceeded;
- (void)_storeFailForwardRecovery:(BOOL)a3;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
@end

@implementation NFDriverWrapper

- (BOOL)isJCOPTooOld:(unsigned __int8)a3 prod:(BOOL)a4 version:(unsigned __int16)a5
{
  if ((int)a3 > 199)
  {
    if (a3 != 200 && a3 != 210) {
      return 0;
    }
    return a5 < 0x424u;
  }
  if (a3 == 100) {
    return a5 < 0x424u;
  }
  return a3 == 115 && a5 < 0x31Bu;
}

- (int)_getRestoreStateAndRunBlockIfUnlocked:(id)a3
{
  v5 = (uint64_t (**)(void))a3;
  CFDictionaryRef v6 = (const __CFDictionary *)MKBGetDeviceLockStateInfo();
  if (!v6) {
    goto LABEL_19;
  }
  CFDictionaryRef v7 = v6;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, kMKBInfoBagState);
  if (!Value)
  {
    CFRelease(v7);
    goto LABEL_19;
  }
  int valuePtr = 0;
  int v9 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  CFRelease(v7);
  if (!v9)
  {
LABEL_19:
    int v10 = -1;
    goto LABEL_20;
  }
  if ((~valuePtr & 0xA000) != 0 && ((valuePtr & 0x2000) != 0 || (valuePtr & 6) == 0))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v12(6, "%c[%{public}s %{public}s]:%i Can't query MSU", v16, ClassName, Name, 69);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v26 = v19;
      __int16 v27 = 2082;
      v28 = v20;
      __int16 v29 = 2082;
      v30 = v21;
      __int16 v31 = 1024;
      int v32 = 69;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Can't query MSU", buf, 0x22u);
    }

    goto LABEL_19;
  }
  int v10 = v5[2](v5);
LABEL_20:

  return v10;
}

- (void)_recoverySucceeded
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Recovered from failed restore", v9, ClassName, Name, 77);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    int v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 77;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Recovered from failed restore", buf, 0x22u);
  }

  [(NFDriverWrapper *)self _storeFailForwardRecovery:1];
  if (self)
  {
    self->_isInDlMode = 0;
    +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:&off_100323258];
    delegate = self->_delegate;
  }
  else
  {
    +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:&off_100323258];
    delegate = 0;
  }
  v14 = delegate;
  [(NFDriverWrapperDelegate *)v14 handleHWRecoveryCompletion:1];
}

- (void)_recoveryFailed
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Failed to restore FW", v9, ClassName, Name, 86);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    int v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 86;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore FW", buf, 0x22u);
  }

  [(NFDriverWrapper *)self _storeFailForwardRecovery:0];
  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  v14 = delegate;
  [(NFDriverWrapperDelegate *)v14 handleHWRecoveryCompletion:0];
}

- (int)_checkFailForwardState
{
  v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"FuryRecoveryNeeded"];
  CFDictionaryRef v6 = (void *)v5;
  unsigned int restoreState = self->_restoreState;
  BOOL v8 = restoreState != -1 && v5 == 0;
  if (!v8)
  {
    uint64_t v9 = NFBuildVersion();
    int v10 = [v4 objectForKey:@"RecoveredOS"];
    v11 = [v4 objectForKey:@"RecoveryNeeded"];
    int v12 = v11;
    if (v9)
    {
      unsigned int v13 = [v11 isEqualToString:v9];
      unsigned int v14 = [v6 isEqualToString:v9];
      if (v13)
      {
        unsigned int v40 = v14;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v16 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          __int16 v18 = v12;
          int v19 = v10;
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          BOOL v8 = !isMetaClass;
          int v10 = v19;
          int v12 = v18;
          uint64_t v22 = 45;
          if (!v8) {
            uint64_t v22 = 43;
          }
          v16(6, "%c[%{public}s %{public}s]:%i Nearfield failed during restore", v22, ClassName, Name, 192);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v23 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = object_getClass(self);
          v25 = v12;
          int v26 = v10;
          if (class_isMetaClass(v24)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v46 = v27;
          int v10 = v26;
          int v12 = v25;
          __int16 v47 = 2082;
          v48 = object_getClassName(self);
          __int16 v49 = 2082;
          v50 = sel_getName(a2);
          __int16 v51 = 1024;
          int v52 = 192;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nearfield failed during restore", buf, 0x22u);
        }

        if (v40) {
          unsigned int restoreState = 1;
        }
        else {
          unsigned int restoreState = 2;
        }
        self->_unsigned int restoreState = restoreState;
        goto LABEL_34;
      }
      if (v14)
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10015A97C;
        v44[3] = &unk_100305370;
        v44[4] = self;
        v44[5] = a2;
        unsigned int restoreState = [(NFDriverWrapper *)self _getRestoreStateAndRunBlockIfUnlocked:v44];
LABEL_34:

        goto LABEL_35;
      }
      if ([v10 isEqualToString:v9])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v28 = NFLogGetLogger();
        if (v28)
        {
          __int16 v29 = (void (*)(uint64_t, const char *, ...))v28;
          v30 = object_getClass(self);
          BOOL v31 = class_isMetaClass(v30);
          v37 = object_getClassName(self);
          v39 = sel_getName(a2);
          uint64_t v32 = 45;
          if (v31) {
            uint64_t v32 = 43;
          }
          v29(6, "%c[%{public}s %{public}s]:%i Nearfield already recovered on %{public}@", v32, v37, v39, 208, v9);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v33 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = object_getClass(self);
          if (class_isMetaClass(v34)) {
            int v35 = 43;
          }
          else {
            int v35 = 45;
          }
          *(_DWORD *)buf = 67110146;
          int v46 = v35;
          __int16 v47 = 2082;
          v48 = object_getClassName(self);
          __int16 v49 = 2082;
          v50 = sel_getName(a2);
          __int16 v51 = 1024;
          int v52 = 208;
          __int16 v53 = 2114;
          v54 = v9;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nearfield already recovered on %{public}@", buf, 0x2Cu);
        }

        unsigned int restoreState = 0;
        self->_unsigned int restoreState = 0;
        self->_failForwardRecoveryStored = 1;
        goto LABEL_34;
      }
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10015AB0C;
    v41[3] = &unk_100305398;
    v41[4] = self;
    id v42 = v4;
    SEL v43 = a2;
    unsigned int restoreState = [(NFDriverWrapper *)self _getRestoreStateAndRunBlockIfUnlocked:v41];

    goto LABEL_34;
  }
LABEL_35:

  return restoreState;
}

- (void)_storeFailForwardRecovery:(BOOL)a3
{
  BOOL v3 = a3;
  CFDictionaryRef v6 = NFBuildVersion();
  if (v6)
  {
    CFDictionaryRef v7 = self;
    objc_sync_enter(v7);
    BOOL v8 = +[NSUserDefaults standardUserDefaults];
    uint64_t v9 = v8;
    if (v3)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v7);
        if (class_isMetaClass(Class)) {
          uint64_t v12 = 43;
        }
        else {
          uint64_t v12 = 45;
        }
        ClassName = object_getClassName(v7);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i Storing OS as recovered : %{public}@", v12, ClassName, Name, 246, v6);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = object_getClass(v7);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v34 = v17;
        __int16 v35 = 2082;
        v36 = object_getClassName(v7);
        __int16 v37 = 2082;
        v38 = sel_getName(a2);
        __int16 v39 = 1024;
        int v40 = 246;
        __int16 v41 = 2114;
        id v42 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Storing OS as recovered : %{public}@", buf, 0x2Cu);
      }

      [v9 removeObjectForKey:@"RecoveryNeeded"];
      [v9 setObject:v6 forKey:@"RecoveredOS"];
      [v9 removeObjectForKey:@"FuryRecoveryNeeded"];
      int v19 = +[NSDate now];
      if (v7) {
        objc_setProperty_atomic(v7, v18, v19, 288);
      }

      sub_10015B1D4((uint64_t)v7, 0);
      if (v7) {
        delegate = v7->_delegate;
      }
      else {
        delegate = 0;
      }
      v21 = delegate;
      [(NFDriverWrapperDelegate *)v21 handleFailForwardCompleted];

      v7->_failForwardRecoveryStored = 1;
      v7->_unsigned int restoreState = 0;
    }
    else
    {
      [v8 removeObjectForKey:@"RecoveredOS"];
      [v9 setObject:v6 forKey:@"RecoveryNeeded"];
      [v9 setObject:v6 forKey:@"FuryRecoveryNeeded"];
      v30 = [v9 objectForKey:@"RecoveryAttempts"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v30 = 0;
      }
      BOOL v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v30 intValue] + 1);

      [v9 setObject:v31 forKey:@"RecoveryAttempts"];
      sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"failForwardRestoreAttemptFailureCount");
      v7->_unsigned int restoreState = 1;
    }
    objc_sync_exit(v7);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      int v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(v24);
      int v26 = object_getClassName(self);
      uint64_t v32 = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Failed to query build", v27, v26, v32, 238);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NFSharedLogGetLogger();
    CFDictionaryRef v7 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v34 = v29;
      __int16 v35 = 2082;
      v36 = object_getClassName(self);
      __int16 v37 = 2082;
      v38 = sel_getName(a2);
      __int16 v39 = 1024;
      int v40 = 238;
      _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query build", buf, 0x22u);
    }
  }
}

- (double)nextRetryTime
{
  uint64_t retryIndex = self->_retryIndex;
  if (retryIndex > 0xD) {
    return 86400.0;
  }
  else {
    return (double)dword_100284118[retryIndex];
  }
}

- (id)_attemptNFCCRecovery
{
  time_t v3 = time(0);
  if (self)
  {
    driver = self->_driver;
    if (self->_hwState == 4)
    {
      if (driver)
      {
        id v5 = objc_alloc((Class)NSError);
        CFDictionaryRef v6 = +[NSString stringWithUTF8String:"nfcd"];
        v89[0] = NSLocalizedDescriptionKey;
        CFDictionaryRef v7 = +[NSString stringWithUTF8String:"NFCC is in Download mode. NCI not available."];
        v90[0] = v7;
        v90[1] = &off_10031C4B0;
        v89[1] = @"Line";
        v89[2] = @"Method";
        id v8 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v90[2] = v8;
        v89[3] = NSDebugDescriptionErrorKey;
        id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 365];
        v90[3] = v9;
        int v10 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:4];
        id v11 = [v5 initWithDomain:v6 code:56 userInfo:v10];

        goto LABEL_62;
      }
    }
    else if (driver)
    {
      __assert_rtn("-[NFDriverWrapper(Recovery) _attemptNFCCRecovery]", "NFDriverWrapper+Recovery.m", 368, "[self isDriverOpened] == false");
    }
  }
  time_t v73 = v3;
  if (NFIsInternalBuild())
  {
    uint64_t v12 = +[NSUserDefaults standardUserDefaults];
    CFDictionaryRef v6 = [v12 valueForKey:@"skipNFCCrecovery"];

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ![(NFDriverWrapper *)v6 isEqualToString:@"Success"])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          __int16 v49 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v53 = 45;
          if (isMetaClass) {
            uint64_t v53 = 43;
          }
          v49(4, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery with failure", v53, ClassName, Name, 378);
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
          *(_DWORD *)buf = 67109890;
          int v82 = v56;
          __int16 v83 = 2082;
          v84 = object_getClassName(self);
          __int16 v85 = 2082;
          v86 = sel_getName(a2);
          __int16 v87 = 1024;
          int v88 = 378;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery with failure", buf, 0x22u);
        }

        id v57 = objc_alloc((Class)NSError);
        v58 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
        v59 = +[NSString stringWithUTF8String:"Feature Not Supported"];
        v80 = v59;
        v60 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        id v11 = [v57 initWithDomain:v58 code:14 userInfo:v60];
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v13 = NFLogGetLogger();
        if (v13)
        {
          unsigned int v14 = (void (*)(uint64_t, const char *, ...))v13;
          v15 = object_getClass(self);
          BOOL v16 = class_isMetaClass(v15);
          int v17 = object_getClassName(self);
          v71 = sel_getName(a2);
          uint64_t v18 = 45;
          if (v16) {
            uint64_t v18 = 43;
          }
          v14(4, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery", v18, v17, v71, 375);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = object_getClass(self);
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v82 = v21;
          __int16 v83 = 2082;
          v84 = object_getClassName(self);
          __int16 v85 = 2082;
          v86 = sel_getName(a2);
          __int16 v87 = 1024;
          int v88 = 375;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery", buf, 0x22u);
        }

        id v11 = 0;
      }
      goto LABEL_62;
    }
  }
  CFDictionaryRef v6 = self;
  objc_sync_enter(v6);
  int retryIndex = v6->_retryIndex;
  if ((retryIndex + 1) <= 0xD) {
    ++retryIndex;
  }
  v6->_int retryIndex = retryIndex;
  sub_10015B1D4((uint64_t)v6, 1);
  int v23 = NFSharedSignpostLog();
  if (os_signpost_enabled(v23))
  {
    int v24 = v6->_retryIndex;
    *(_DWORD *)buf = 67109120;
    int v82 = v24;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "fail-forward; retryIndex=%d",
      buf,
      8u);
  }

  v25 = objc_opt_new();
  int v26 = [v25 runService:&off_100323348];

  uint64_t v27 = [v26 valueForKey:@"Error"];
  if (!v27)
  {
    v33 = NFSharedSignpostLog();
    if (os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "success", buf, 2u);
    }
    int v34 = 0;
    id v11 = 0;
    goto LABEL_58;
  }
  sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"failForwardRestoreAttemptFailureCount");
  uint64_t v28 = NFSharedSignpostLog();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "restore failure", buf, 2u);
  }

  id v29 = objc_alloc((Class)NSError);
  v30 = +[NSString stringWithUTF8String:"nfcd"];
  id v31 = [v27 code];
  v77[0] = NSLocalizedDescriptionKey;
  if ((uint64_t)[v27 code] > 70) {
    uint64_t v32 = 71;
  }
  else {
    uint64_t v32 = (uint64_t)[v27 code];
  }
  __int16 v35 = +[NSString stringWithUTF8String:off_1003053B8[v32]];
  v78[0] = v35;
  v78[1] = v27;
  v77[1] = NSUnderlyingErrorKey;
  v77[2] = @"Line";
  v78[2] = &off_10031C4C8;
  v77[3] = @"Method";
  id v36 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v78[3] = v36;
  v77[4] = NSDebugDescriptionErrorKey;
  id v37 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 400];
  v78[4] = v37;
  v38 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];
  id v11 = [v29 initWithDomain:v30 code:v31 userInfo:v38];

  if ((NFProductAllowsWiredInDLMode() & 1) == 0)
  {
    __int16 v39 = v6->_delegate;
    [(NFDriverWrapperDelegate *)v39 stopFury];

    int v40 = NFSharedSignpostLog();
    if (os_signpost_enabled(v40))
    {
      int v41 = v6->_retryIndex;
      *(_DWORD *)buf = 67109120;
      int v82 = v41;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "fail-forward (full restore); retryIndex=%d",
        buf,
        8u);
    }

    id v42 = objc_opt_new();
    SEL v43 = [v42 runService:&off_100323370];

    int v34 = [v43 valueForKey:@"Error"];

    if (v34)
    {
      sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"failForwardRestoreAttemptFailureCount");
      v44 = NFSharedSignpostLog();
      if (os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "restore failure", buf, 2u);
      }

      id v45 = objc_alloc((Class)NSError);
      v33 = +[NSString stringWithUTF8String:"nfcd"];
      id v46 = [v34 code];
      v75[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)[v34 code] > 70) {
        uint64_t v47 = 71;
      }
      else {
        uint64_t v47 = (uint64_t)[v34 code];
      }
      v61 = +[NSString stringWithUTF8String:off_1003053B8[v47]];
      v76[0] = v61;
      v76[1] = v34;
      v75[1] = NSUnderlyingErrorKey;
      v75[2] = @"Line";
      v76[2] = &off_10031C4E0;
      v75[3] = @"Method";
      id v62 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v76[3] = v62;
      v75[4] = NSDebugDescriptionErrorKey;
      id v63 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 422];
      v76[4] = v63;
      v64 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:5];
      id v11 = [v45 initWithDomain:v33 code:v46 userInfo:v64];
    }
    else
    {
      v33 = NFSharedSignpostLog();
      if (os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "sucess", buf, 2u);
      }
      int v34 = 0;
      id v11 = 0;
    }
    int v26 = v43;
LABEL_58:

    goto LABEL_59;
  }
  int v34 = v27;
LABEL_59:
  v65 = +[NSUserDefaults standardUserDefaults];
  [v65 removeObjectForKey:@"RecoveryInProgress"];

  if (!v11)
  {
    v66 = +[NSDate now];
    objc_setProperty_atomic(v6, v67, v66, 288);

    v68 = +[NSUserDefaults standardUserDefaults];
    [v68 removeObjectForKey:@"FuryRecoveryNeeded"];

    v69 = v6->_delegate;
    [(NFDriverWrapperDelegate *)v69 handleFailForwardCompleted];
  }
  v6->_lastRetry = v73;

  objc_sync_exit(v6);
LABEL_62:

  return v11;
}

- (BOOL)_isEMVPolling
{
  return (self->_driver->var6 - 1) < 3;
}

- (id)_getExtendedIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = arc4random();
  id v5 = [v3 tagID];
  unsigned int v6 = [v5 hash];
  unsigned int v7 = [v3 type];

  unint64_t v10 = (v7 + v6) | (unint64_t)(v4 << 32);
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&v10 length:8];

  return v8;
}

- (id)_refreshTagInfo:(id)a3 update:(_NFDriverRemoteTag *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NFTagInternal) initWithNFTag:v5];
  if (a4 && [v5 type] == 3 && a4->var2.var0.var4)
  {
    id v7 = [objc_alloc((Class)NSData) initWithBytes:a4->var2.var6.var3 length:a4->var2.var0.var4];
    [v6 _setHistoricalBytes:v7];
  }

  return v6;
}

- (void)_cardRemovalDetect:(id)a3
{
  sub_10018F904((uint64_t)self, a3);
  while (![(NFReaderRestrictor *)self->_readerPolicy readerModeProtectionActive])
  {
    if (NFDriverRemoteDevCheckPresence()) {
      return;
    }
    usleep(0x3D090u);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(4, "%c[%{public}s %{public}s]:%i Burnout occurred", v10, ClassName, Name, 138);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    uint64_t v18 = object_getClassName(self);
    __int16 v19 = 2082;
    __int16 v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 138;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Burnout occurred", buf, 0x22u);
  }
}

- (BOOL)enableHeadlessMode:(BOOL)a3 shutdown:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    int v7 = 1;
    byte_100347558 = 1;
  }
  else
  {
    int v7 = byte_100347558;
  }
  if (v7) {
    BOOL v8 = !a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Something trying to turn LPM ON after user shutdown. Denying.", v17, ClassName, Name, 254);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NFSharedLogGetLogger();
    uint64_t v10 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v54 = v19;
    __int16 v55 = 2082;
    int v56 = object_getClassName(self);
    __int16 v57 = 2082;
    v58 = sel_getName(a2);
    __int16 v59 = 1024;
    int v60 = 254;
    __int16 v20 = "%c[%{public}s %{public}s]:%i Something trying to turn LPM ON after user shutdown. Denying.";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_24:
    char v11 = 0;
    goto LABEL_59;
  }
  if (a3)
  {
    id v9 = sub_10021A750();

    if (!v9)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v32 = NFLogGetLogger();
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        int v34 = object_getClass(self);
        BOOL v35 = class_isMetaClass(v34);
        id v36 = object_getClassName(self);
        int v52 = sel_getName(a2);
        uint64_t v37 = 45;
        if (v35) {
          uint64_t v37 = 43;
        }
        v33(3, "%c[%{public}s %{public}s]:%i LPEM not enabled", v37, v36, v52, 259);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      NFSharedLogGetLogger();
      uint64_t v10 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v54 = v39;
      __int16 v55 = 2082;
      int v56 = object_getClassName(self);
      __int16 v57 = 2082;
      v58 = sel_getName(a2);
      __int16 v59 = 1024;
      int v60 = 259;
      __int16 v20 = "%c[%{public}s %{public}s]:%i LPEM not enabled";
      goto LABEL_23;
    }
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  if (v10 && v10->_isClosing)
  {
    char v11 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v4)
    {
      __int16 v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21)
      {
        int v22 = object_getClass(v10);
        if (class_isMetaClass(v22)) {
          uint64_t v23 = 43;
        }
        else {
          uint64_t v23 = 45;
        }
        int v24 = object_getClassName(v10);
        v25 = sel_getName(a2);
        v21(6, "%c[%{public}s %{public}s]:%i Enabling LPEM", v23, v24, v25, 269);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = object_getClass(v10);
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v54 = v28;
        __int16 v55 = 2082;
        int v56 = object_getClassName(v10);
        __int16 v57 = 2082;
        v58 = sel_getName(a2);
        __int16 v59 = 1024;
        int v60 = 269;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling LPEM", buf, 0x22u);
      }

      id v29 = sub_10021A750();
      sub_10021DB84((uint64_t)v29);

      sub_10021A750();
      v30 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      id v31 = sub_10021ADE4(v30);
    }
    else
    {
      int v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v40)
      {
        int v41 = object_getClass(v10);
        if (class_isMetaClass(v41)) {
          uint64_t v42 = 43;
        }
        else {
          uint64_t v42 = 45;
        }
        SEL v43 = object_getClassName(v10);
        v44 = sel_getName(a2);
        v40(6, "%c[%{public}s %{public}s]:%i Disabling LPEM", v42, v43, v44, 273);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = object_getClass(v10);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v54 = v47;
        __int16 v55 = 2082;
        int v56 = object_getClassName(v10);
        __int16 v57 = 2082;
        v58 = sel_getName(a2);
        __int16 v59 = 1024;
        int v60 = 273;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling LPEM", buf, 0x22u);
      }

      v48 = sub_10021A750();
      sub_10021DD48((uint64_t)v48);

      sub_10021A750();
      v30 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      id v49 = sub_10021AD90(v30);
    }

    char v11 = NFDriverSetHeadlessMode();
  }
  objc_sync_exit(v10);
LABEL_59:

  return v11;
}

- (int)_ntag5DriverRateFromTagRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 211)
  {
    if (a3 != 212)
    {
      if (a3 != 424 && a3 != 848) {
        return 0;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", v13, ClassName, Name, 29, v3);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      unsigned int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        int v22 = object_getClassName(self);
        __int16 v23 = 2082;
        int v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 29;
        __int16 v27 = 1024;
        int v28 = v3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", buf, 0x28u);
      }
    }
    return 4;
  }
  if (a3 == 106) {
    int v4 = 3;
  }
  else {
    int v4 = 0;
  }
  if (a3 == 52) {
    int v5 = 2;
  }
  else {
    int v5 = v4;
  }
  if (a3 == 26) {
    return 1;
  }
  else {
    return v5;
  }
}

- (int)_typeADriverRateFromTagRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 211)
  {
    if (a3 == 848) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    if (a3 == 424) {
      int v8 = 3;
    }
    else {
      int v8 = v7;
    }
    if (a3 == 212) {
      return 2;
    }
    else {
      return v8;
    }
  }
  else
  {
    if (a3 == 26 || a3 == 52)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", v13, ClassName, Name, 68, v3);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      unsigned int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        int v22 = object_getClassName(self);
        __int16 v23 = 2082;
        int v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 68;
        __int16 v27 = 1024;
        int v28 = v3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", buf, 0x28u);
      }
    }
    else if (a3 != 106)
    {
      return 0;
    }
    return 1;
  }
}

- (void)handleReaderBurnoutTimer
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", v9, ClassName, Name, 1932);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    uint64_t v18 = object_getClassName(self);
    __int16 v19 = 2082;
    int v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 1932;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", buf, 0x22u);
  }

  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  [(NFDriverWrapperDelegate *)delegate handleReaderBurnoutTimer];
}

- (void)handleReaderBurnoutCleared
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", v9, ClassName, Name, 1939);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    uint64_t v18 = object_getClassName(self);
    __int16 v19 = 2082;
    int v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 1939;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", buf, 0x22u);
  }

  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  [(NFDriverWrapperDelegate *)delegate handleReaderBurnoutCleared];
  sub_1002114AC(self, @"Cooloff");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hammerfestLastRecoveryTime, 0);
  objc_storeStrong((id *)&self->_chipscopeConfig, 0);
  objc_storeStrong((id *)&self->_workqueue, 0);
  objc_storeStrong((id *)&self->_currentRouting, 0);
  objc_storeStrong((id *)&self->_sessionOwners, 0);
  objc_storeStrong((id *)&self->_ctConnection, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_temperaturePollTimer, 0);
  objc_storeStrong((id *)&self->_fieldCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_fieldAssertionTimer, 0);
  objc_storeStrong((id *)&self->_fieldPresentLock, 0);
  objc_storeStrong((id *)&self->_readerPolicy, 0);
  objc_storeStrong((id *)&self->_temperatureReporter, 0);
  objc_storeStrong((id *)&self->_lastPowerStateQuery, 0);
  objc_storeStrong((id *)&self->_remoteTags, 0);
  objc_storeStrong((id *)&self->_tagRemovedSemaphore, 0);

  objc_storeStrong((id *)&self->_failForwardRetryTimer, 0);
}

@end