@interface NFACDriverWrapper
- (BOOL)_isClosed;
- (BOOL)_restartDiscoveryWithReconfig:(BOOL)a3;
- (BOOL)_writeSMCMultiTagEnabled:(BOOL)a3;
- (BOOL)clearMultiTagPollingState;
- (BOOL)configureMultiTagPolling;
- (BOOL)fieldPresent;
- (BOOL)getControllerInfo:(id *)a3;
- (BOOL)getRFSettings:(id)a3;
- (BOOL)hwInBadState;
- (BOOL)queryTagNDEFCapability:(id)a3 hasNdefAbility:(_NFNDEFTagInfo *)a4 error:(id *)a5;
- (BOOL)readerModeProtectionActive;
- (BOOL)restartDiscovery;
- (BOOL)resumeDiscovery;
- (BOOL)sendToHCEDevice:(void *)a3 buffer:(const void *)a4 length:(unsigned int)a5;
- (BOOL)triggerDelayedWake:(unsigned __int8)a3;
- (BOOL)writeLockNdef:(id)a3 error:(id *)a4;
- (NFACDriverWrapper)init;
- (NFACDriverWrapperDelegate)delegate;
- (NFRoutingConfig)currentRouting;
- (_NFData)readFromHCEDevice:(void *)a3;
- (id)_internalTagFromMultiTag:(_NFDriverRemoteTag *)a3;
- (id)combinePowerCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5;
- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4;
- (id)getDieID;
- (id)getPowerCounters:(id *)a3;
- (id)owners;
- (id)pushSignedRF:(id)a3;
- (id)queryMultiTagState:(BOOL *)a3 error:(id *)a4;
- (id)readNdefDataFromTag:(id)a3 messageSize:(unsigned int)a4 error:(id *)a5;
- (id)setISO15693DataRate:(int)a3 forTag:(id)a4;
- (id)setRouting:(id)a3;
- (id)setTypeATagDataRate:(int)a3;
- (id)state;
- (id)transceive:(id)a3 tag:(id)a4 maxTimeout:(double)a5 error:(id *)a6;
- (int)_componentModeToSERouting:(unint64_t)a3;
- (int)_ntag5DriverRateFromTagRate:(int)a3;
- (int)_typeADriverRateFromTagRate:(int)a3;
- (unint64_t)_openDriver:(BOOL *)a3;
- (unint64_t)openSession:(id)a3;
- (unsigned)checkTagPresence:(id)a3;
- (unsigned)connectTag:(id)a3;
- (unsigned)disconnectTag:(id)a3 tagRemovalDetect:(BOOL)a4;
- (unsigned)getTagType:(id)a3;
- (unsigned)queryMifareTagCapability:(id)a3 error:(id *)a4;
- (void)_closeDriverAndLeaveHWEnabled:(BOOL)a3;
- (void)_getDriverConfig:(_NFDriverConfig *)a3;
- (void)_getHandleForTag:(id)a3;
- (void)closeSession:(id)a3;
- (void)configureDriverSettings:(id)a3;
- (void)driverDidDetectFieldChange:(BOOL)a3;
- (void)driverDidDetectHardwareReset:(const char *)a3;
- (void)driverDidDetectHostCardReader:(void *)a3;
- (void)driverDidDetectMultiTagStateChange:(_NFDriverMultiTagStateInfo *)a3 rfError:(BOOL)a4;
- (void)driverDidDetectRemoteTags:(_NFDriverRemoteTag *)a3 count:(unsigned __int8)a4;
- (void)driverPLLUnlock;
- (void)driverRestartDiscovery;
- (void)failForwardCompleted;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)setDelegate:(id)a3;
- (void)setDriverCallbacks;
- (void)setFailForwardDelegate:(id)a3;
- (void)setPollingConfig:(int)a3 tagNotificationConfig:(_NFDriverTagDiscoveryNtf)a4;
- (void)setPowerConsumptionMonitor:(id)a3;
- (void)simulateCrash:(unsigned __int16)a3 reason:(const char *)a4;
- (void)stopNowAndLeveHWEnabled:(BOOL)a3;
- (void)triggerFailForward;
@end

@implementation NFACDriverWrapper

- (NFACDriverWrapper)init
{
  v11.receiver = self;
  v11.super_class = (Class)NFACDriverWrapper;
  v2 = [(NFACDriverWrapper *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastFieldOffTime = 0;
    uint64_t v4 = objc_opt_new();
    sessionOwners = v3->_sessionOwners;
    v3->_sessionOwners = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    remoteTags = v3->_remoteTags;
    v3->_remoteTags = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    multiTagState = v3->_multiTagState;
    v3->_multiTagState = (NSMutableArray *)v8;
  }
  return v3;
}

- (id)owners
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_sessionOwners copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setFailForwardDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_ffDelegate, v4);

  objc_sync_exit(obj);
}

- (void)configureDriverSettings:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"flags"];
  self->_flags = (unint64_t)[v5 unsignedLongValue];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"pollPeriod"];
  self->_pollingPeriod = [v6 unsignedIntValue];

  v7 = [v4 objectForKeyedSubscript:@"multiTagPollPeriod"];
  self->_multiTagPollingPeriod = [v7 unsignedIntValue];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"multiTagPollRetries"];
  self->_multiTagPollingRetries = [v8 unsignedIntValue];

  v9 = [v4 objectForKeyedSubscript:@"typeATagDataRate"];
  self->_typeATagDataRate = [v9 unsignedIntValue];

  v10 = [v4 objectForKeyedSubscript:@"ntag5DataRate"];
  self->_ntag5DataRate = [v10 unsignedIntValue];

  id v11 = [v4 objectForKeyedSubscript:@"ntag5T1"];

  self->_ntag5T1 = [v11 unsignedIntValue];
}

- (unint64_t)openSession:(id)a3
{
  v5 = (NSMutableDictionary *)a3;
  char v57 = 0;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  int sessionCount = v6->_sessionCount;
  if (!sessionCount)
  {
    v6->_isClosing = 0;
    unint64_t v8 = [(NFACDriverWrapper *)v6 _openDriver:&v57];
    if (v8 != 1)
    {
      v6->_isClosing = 1;
      goto LABEL_48;
    }
    int sessionCount = v6->_sessionCount;
  }
  v6->_int sessionCount = sessionCount + 1;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class)) {
      uint64_t v11 = 43;
    }
    else {
      uint64_t v11 = 45;
    }
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    Logger(3, "%c[%{public}s %{public}s]:%i Session count: %lu", v11, ClassName, Name, 166, v6->_sessionCount);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = object_getClass(v6);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    v17 = object_getClassName(v6);
    v18 = sel_getName(a2);
    v19 = (NSMutableDictionary *)v6->_sessionCount;
    *(_DWORD *)buf = 67110146;
    int v59 = v16;
    __int16 v60 = 2082;
    v61 = v17;
    __int16 v62 = 2082;
    v63 = v18;
    __int16 v64 = 1024;
    int v65 = 166;
    __int16 v66 = 2048;
    v67 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session count: %lu", buf, 0x2Cu);
  }

  v20 = [(NSMutableDictionary *)v6->_sessionOwners objectForKey:v5];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (v20)
  {
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21)
    {
      v22 = object_getClass(v6);
      if (class_isMetaClass(v22)) {
        uint64_t v23 = 43;
      }
      else {
        uint64_t v23 = 45;
      }
      v24 = object_getClassName(v6);
      v25 = sel_getName(a2);
      v26 = [(NSMutableDictionary *)v6->_sessionOwners objectForKeyedSubscript:v5];
      v21(3, "%c[%{public}s %{public}s]:%i Owner %{public}@ already has a session : %{public}@", v23, v24, v25, 168, v5, v26);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(v6);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      v30 = object_getClassName(v6);
      v31 = sel_getName(a2);
      v32 = [(NSMutableDictionary *)v6->_sessionOwners objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 67110402;
      int v59 = v29;
      __int16 v60 = 2082;
      v61 = v30;
      __int16 v62 = 2082;
      v63 = v31;
      __int16 v64 = 1024;
      int v65 = 168;
      __int16 v66 = 2114;
      v67 = v5;
      __int16 v68 = 2114;
      v69 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Owner %{public}@ already has a session : %{public}@", buf, 0x36u);
    }
    v33 = [(NSMutableDictionary *)v6->_sessionOwners objectForKeyedSubscript:v5];
    v34 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v33 intValue] + 1);
    [(NSMutableDictionary *)v6->_sessionOwners setObject:v34 forKeyedSubscript:v5];
  }
  else
  {
    v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v35)
    {
      v36 = object_getClass(v6);
      if (class_isMetaClass(v36)) {
        uint64_t v37 = 43;
      }
      else {
        uint64_t v37 = 45;
      }
      v38 = object_getClassName(v6);
      v39 = sel_getName(a2);
      v35(6, "%c[%{public}s %{public}s]:%i Opening session on behalf of %{public}@", v37, v38, v39, 172, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = object_getClass(v6);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      v43 = object_getClassName(v6);
      v44 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v59 = v42;
      __int16 v60 = 2082;
      v61 = v43;
      __int16 v62 = 2082;
      v63 = v44;
      __int16 v64 = 1024;
      int v65 = 172;
      __int16 v66 = 2114;
      v67 = v5;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Opening session on behalf of %{public}@", buf, 0x2Cu);
    }

    v33 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)v6->_sessionOwners setObject:v33 forKeyedSubscript:v5];
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v45 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v45)
  {
    v46 = object_getClass(v6);
    if (class_isMetaClass(v46)) {
      uint64_t v47 = 43;
    }
    else {
      uint64_t v47 = 45;
    }
    v48 = object_getClassName(v6);
    v49 = sel_getName(a2);
    v45(6, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", v47, v48, v49, 175, v6->_sessionOwners);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v50 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = object_getClass(v6);
    if (class_isMetaClass(v51)) {
      int v52 = 43;
    }
    else {
      int v52 = 45;
    }
    v53 = object_getClassName(v6);
    v54 = sel_getName(a2);
    sessionOwners = v6->_sessionOwners;
    *(_DWORD *)buf = 67110146;
    int v59 = v52;
    __int16 v60 = 2082;
    v61 = v53;
    __int16 v62 = 2082;
    v63 = v54;
    __int16 v64 = 1024;
    int v65 = 175;
    __int16 v66 = 2114;
    v67 = sessionOwners;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", buf, 0x2Cu);
  }

  unint64_t v8 = 1;
LABEL_48:
  objc_sync_exit(v6);

  if (v57) {
    [(NFACDriverWrapper *)v6 triggerFailForward];
  }

  return v8;
}

- (void)closeSession:(id)a3
{
  v5 = (NSMutableDictionary *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSMutableDictionary *)v6->_sessionOwners objectForKey:v5];
  if ([v7 BOOLValue] && objc_msgSend(v7, "intValue"))
  {
    unsigned int v8 = [v7 intValue];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v8 == 1)
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v6);
        if (class_isMetaClass(Class)) {
          uint64_t v11 = 43;
        }
        else {
          uint64_t v11 = 45;
        }
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i Closing session on behalf of %{public}@", v11, ClassName, Name, 199, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = object_getClass(v6);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v77 = v16;
        __int16 v78 = 2082;
        v79 = object_getClassName(v6);
        __int16 v80 = 2082;
        v81 = sel_getName(a2);
        __int16 v82 = 1024;
        int v83 = 199;
        __int16 v84 = 2114;
        v85 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Closing session on behalf of %{public}@", buf, 0x2Cu);
      }

      [(NSMutableDictionary *)v6->_sessionOwners removeObjectForKey:v5];
    }
    else
    {
      v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v41)
      {
        int v42 = object_getClass(v6);
        if (class_isMetaClass(v42)) {
          uint64_t v43 = 43;
        }
        else {
          uint64_t v43 = 45;
        }
        v44 = object_getClassName(v6);
        v45 = sel_getName(a2);
        v41(6, "%c[%{public}s %{public}s]:%i Decrementing session on behalf of %{public}@", v43, v44, v45, 202, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = object_getClass(v6);
        if (class_isMetaClass(v47)) {
          int v48 = 43;
        }
        else {
          int v48 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v77 = v48;
        __int16 v78 = 2082;
        v79 = object_getClassName(v6);
        __int16 v80 = 2082;
        v81 = sel_getName(a2);
        __int16 v82 = 1024;
        int v83 = 202;
        __int16 v84 = 2114;
        v85 = v5;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Decrementing session on behalf of %{public}@", buf, 0x2Cu);
      }

      v49 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 intValue] - 1);
      [(NSMutableDictionary *)v6->_sessionOwners setObject:v49 forKeyedSubscript:v5];
    }
    int sessionCount = v6->_sessionCount;
    if (sessionCount > 0
      || (+[NSAssertionHandler currentHandler],
          v75 = objc_claimAutoreleasedReturnValue(),
          [v75 handleFailureInMethod:a2 object:v6 file:@"NFACDriverWrapper.m" lineNumber:206 description:@"Session over released"], v75, (int sessionCount = v6->_sessionCount) != 0))
    {
      char v51 = 0;
      v6->_int sessionCount = sessionCount - 1;
    }
    else
    {
      char v51 = 1;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v52)
    {
      v53 = object_getClass(v6);
      if (class_isMetaClass(v53)) {
        uint64_t v54 = 43;
      }
      else {
        uint64_t v54 = 45;
      }
      v55 = object_getClassName(v6);
      v56 = sel_getName(a2);
      v52(3, "%c[%{public}s %{public}s]:%i Session count: %lu", v54, v55, v56, 212, v6->_sessionCount);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    char v57 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = object_getClass(v6);
      if (class_isMetaClass(v58)) {
        int v59 = 43;
      }
      else {
        int v59 = 45;
      }
      __int16 v60 = object_getClassName(v6);
      v61 = sel_getName(a2);
      __int16 v62 = (NSMutableDictionary *)v6->_sessionCount;
      *(_DWORD *)buf = 67110146;
      int v77 = v59;
      __int16 v78 = 2082;
      v79 = v60;
      __int16 v80 = 2082;
      v81 = v61;
      __int16 v82 = 1024;
      int v83 = 212;
      __int16 v84 = 2048;
      v85 = v62;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session count: %lu", buf, 0x2Cu);
    }

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v63)
    {
      __int16 v64 = object_getClass(v6);
      if (class_isMetaClass(v64)) {
        uint64_t v65 = 43;
      }
      else {
        uint64_t v65 = 45;
      }
      __int16 v66 = object_getClassName(v6);
      v67 = sel_getName(a2);
      v63(6, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", v65, v66, v67, 213, v6->_sessionOwners);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = object_getClass(v6);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      v71 = object_getClassName(v6);
      v72 = sel_getName(a2);
      sessionOwners = v6->_sessionOwners;
      *(_DWORD *)buf = 67110146;
      int v77 = v70;
      __int16 v78 = 2082;
      v79 = v71;
      __int16 v80 = 2082;
      v81 = v72;
      __int16 v82 = 1024;
      int v83 = 213;
      __int16 v84 = 2114;
      v85 = sessionOwners;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", buf, 0x2Cu);
    }

    if (v6->_sessionCount) {
      char v74 = 1;
    }
    else {
      char v74 = v51;
    }
    if ((v74 & 1) == 0)
    {
      v6->_isClosing = 1;
      [(NFACDriverWrapper *)v6 _closeDriverAndLeaveHWEnabled:0];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17)
    {
      v18 = object_getClass(v6);
      if (class_isMetaClass(v18)) {
        uint64_t v19 = 43;
      }
      else {
        uint64_t v19 = 45;
      }
      v20 = object_getClassName(v6);
      v21 = sel_getName(a2);
      v22 = [(NSMutableDictionary *)v6->_sessionOwners objectForKeyedSubscript:v5];
      v17(3, "%c[%{public}s %{public}s]:%i Owner %{public}@ does not have a session : %{public}@", v19, v20, v21, 192, v5, v22);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(v6);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      v26 = object_getClassName(v6);
      v27 = sel_getName(a2);
      v28 = [(NSMutableDictionary *)v6->_sessionOwners objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 67110402;
      int v77 = v25;
      __int16 v78 = 2082;
      v79 = v26;
      __int16 v80 = 2082;
      v81 = v27;
      __int16 v82 = 1024;
      int v83 = 192;
      __int16 v84 = 2114;
      v85 = v5;
      __int16 v86 = 2114;
      v87 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Owner %{public}@ does not have a session : %{public}@", buf, 0x36u);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v29)
    {
      v30 = object_getClass(v6);
      if (class_isMetaClass(v30)) {
        uint64_t v31 = 43;
      }
      else {
        uint64_t v31 = 45;
      }
      v32 = object_getClassName(v6);
      v33 = sel_getName(a2);
      v29(3, "%c[%{public}s %{public}s]:%i Session owners : %{public}@", v31, v32, v33, 193, v6->_sessionOwners);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(v6);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      uint64_t v37 = object_getClassName(v6);
      v38 = sel_getName(a2);
      v39 = v6->_sessionOwners;
      *(_DWORD *)buf = 67110146;
      int v77 = v36;
      __int16 v78 = 2082;
      v79 = v37;
      __int16 v80 = 2082;
      v81 = v38;
      __int16 v82 = 1024;
      int v83 = 193;
      __int16 v84 = 2114;
      v85 = v39;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session owners : %{public}@", buf, 0x2Cu);
    }

    if (NFIsInternalBuild())
    {
      v40 = +[NSAssertionHandler currentHandler];
      [v40 handleFailureInMethod:a2 object:v6 file:@"NFACDriverWrapper.m" lineNumber:195 description:@"driver session not held"];
    }
  }

  objc_sync_exit(v6);
}

- (void)stopNowAndLeveHWEnabled:(BOOL)a3
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
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Closing driver now !", v11, ClassName, Name, 223);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v14;
    __int16 v19 = 2082;
    v20 = object_getClassName(self);
    __int16 v21 = 2082;
    v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 223;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Closing driver now !", buf, 0x22u);
  }

  v15 = self;
  objc_sync_enter(v15);
  v15->_isClosing = 1;
  [(NFACDriverWrapper *)v15 _closeDriverAndLeaveHWEnabled:v3];
  objc_sync_exit(v15);
}

- (BOOL)_isClosed
{
  return self->_isClosing;
}

- (int)_componentModeToSERouting:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)setRouting:(id)a3
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if ([(NFACDriverWrapper *)v7 _isClosed])
  {
    id v8 = objc_alloc((Class)NSError);
    v9 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
    v10 = +[NSString stringWithUTF8String:"Aborted"];
    v112 = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v12 = [v8 initWithDomain:v9 code:3 userInfo:v11];

    objc_sync_exit(v7);
    goto LABEL_96;
  }
  objc_sync_exit(v7);

  [v6 calculateFieldDetectEnabled:0];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v7);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v7);
    Name = sel_getName(a2);
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v14(6, "%c[%{public}s %{public}s]:%i requesting: %{public}@", v17, ClassName, Name, 258, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = object_getClass(v7);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v102 = v20;
    __int16 v103 = 2082;
    v104 = object_getClassName(v7);
    __int16 v105 = 2082;
    v106 = sel_getName(a2);
    __int16 v107 = 1024;
    int v108 = 258;
    __int16 v109 = 2114;
    id v110 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i requesting: %{public}@", buf, 0x2Cu);
  }

  if (v6)
  {
    currentRouting = v7->_currentRouting;
    if (currentRouting)
    {
      if ([(NFRoutingConfig *)currentRouting isEquivalentRouting:v6])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v22)
        {
          __int16 v23 = object_getClass(v7);
          if (class_isMetaClass(v23)) {
            uint64_t v24 = 43;
          }
          else {
            uint64_t v24 = 45;
          }
          int v25 = object_getClassName(v7);
          v26 = sel_getName(a2);
          v22(6, "%c[%{public}s %{public}s]:%i Routing did not change", v24, v25, v26, 260);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v27 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = object_getClass(v7);
          if (class_isMetaClass(v28)) {
            int v29 = 43;
          }
          else {
            int v29 = 45;
          }
          v30 = object_getClassName(v7);
          uint64_t v31 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v102 = v29;
          __int16 v103 = 2082;
          v104 = v30;
          __int16 v105 = 2082;
          v106 = v31;
          __int16 v107 = 1024;
          int v108 = 260;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Routing did not change", buf, 0x22u);
        }

LABEL_84:
        id v12 = 0;
        goto LABEL_96;
      }
    }
  }
  if (([v6 wantsReader] & 1) != 0 || objc_msgSend(v6, "wantsMultiTag"))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v32)
    {
      v33 = object_getClass(v7);
      if (class_isMetaClass(v33)) {
        uint64_t v34 = 43;
      }
      else {
        uint64_t v34 = 45;
      }
      v35 = object_getClassName(v7);
      int v36 = sel_getName(a2);
      v32(6, "%c[%{public}s %{public}s]:%i Setting pollingMask: 0x%04x", v34, v35, v36, 266, [v6 polling]);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v37 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = object_getClass(v7);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      v40 = object_getClassName(v7);
      v41 = sel_getName(a2);
      unsigned int v42 = [v6 polling];
      *(_DWORD *)buf = 67110146;
      int v102 = v39;
      __int16 v103 = 2082;
      v104 = v40;
      __int16 v105 = 2082;
      v106 = v41;
      __int16 v107 = 1024;
      int v108 = 266;
      __int16 v109 = 1024;
      LODWORD(v110) = v42;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting pollingMask: 0x%04x", buf, 0x28u);
    }

    -[NFACDriverWrapper setPollingConfig:tagNotificationConfig:](v7, "setPollingConfig:tagNotificationConfig:", [v6 polling], [v6 tagDiscoveryConfig]);
    int v43 = 1;
  }
  else
  {
    int v43 = 0;
  }
  if ([v6 wantsMultiTag])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44)
    {
      v45 = object_getClass(v7);
      if (class_isMetaClass(v45)) {
        uint64_t v46 = 43;
      }
      else {
        uint64_t v46 = 45;
      }
      uint64_t v47 = object_getClassName(v7);
      int v48 = sel_getName(a2);
      v44(6, "%c[%{public}s %{public}s]:%i Enabling Multitag routing", v46, v47, v48, 273);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = object_getClass(v7);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      int v52 = object_getClassName(v7);
      v53 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v102 = v51;
      __int16 v103 = 2082;
      v104 = v52;
      __int16 v105 = 2082;
      v106 = v53;
      __int16 v107 = 1024;
      int v108 = 273;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling Multitag routing", buf, 0x22u);
    }

    unsigned int v54 = 1;
  }
  else
  {
    unsigned int v55 = [v6 wantsMultiTag];
    unsigned int v54 = v55 ^ [(NFRoutingConfig *)v7->_currentRouting wantsMultiTag];
  }
  -[NFACDriverWrapper _componentModeToSERouting:](v7, "_componentModeToSERouting:", [v6 embeddedMode]);
  if ((v43 & 1) == 0) {
    -[NFACDriverWrapper _componentModeToSERouting:](v7, "_componentModeToSERouting:", [v6 hostMode]);
  }
  [v6 fdOn];
  [v6 pollingType];
  if (v43 && [(NFReaderRestrictor *)v7->_readerPolicy readerModeProtectionActive])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v56)
    {
      char v57 = object_getClass(v7);
      if (class_isMetaClass(v57)) {
        uint64_t v58 = 43;
      }
      else {
        uint64_t v58 = 45;
      }
      int v59 = object_getClassName(v7);
      __int16 v60 = sel_getName(a2);
      v56(4, "%c[%{public}s %{public}s]:%i Denying reader mode, protection active", v58, v59, v60, 293);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v61 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      __int16 v62 = object_getClass(v7);
      if (class_isMetaClass(v62)) {
        int v63 = 43;
      }
      else {
        int v63 = 45;
      }
      __int16 v64 = object_getClassName(v7);
      uint64_t v65 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v102 = v63;
      __int16 v103 = 2082;
      v104 = v64;
      __int16 v105 = 2082;
      v106 = v65;
      __int16 v107 = 1024;
      int v108 = 293;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Denying reader mode, protection active", buf, 0x22u);
    }

    id v66 = objc_alloc((Class)NSError);
    v67 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
    __int16 v68 = +[NSString stringWithUTF8String:"Reader mode temporarily disabled"];
    v100 = v68;
    v69 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
    id v12 = [v66 initWithDomain:v67 code:47 userInfo:v69];
  }
  else
  {
    if (![v6 pollingType]
      && [(NFReaderRestrictor *)v7->_readerPolicy readerModeStoppedShouldCooloffRun])
    {
      [(NFACDriverWrapper *)v7 openSession:@"Cooloff"];
    }
    if (NFDriverSetConfiguration())
    {
      objc_storeStrong((id *)&v7->_currentRouting, a3);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v70)
      {
        v71 = object_getClass(v7);
        if (class_isMetaClass(v71)) {
          uint64_t v72 = 43;
        }
        else {
          uint64_t v72 = 45;
        }
        v73 = object_getClassName(v7);
        char v74 = sel_getName(a2);
        v70(6, "%c[%{public}s %{public}s]:%i Operating mode changed to:%{public}@", v72, v73, v74, 307, v6);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v75 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = object_getClass(v7);
        if (class_isMetaClass(v76)) {
          int v77 = 43;
        }
        else {
          int v77 = 45;
        }
        __int16 v78 = object_getClassName(v7);
        v79 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v102 = v77;
        __int16 v103 = 2082;
        v104 = v78;
        __int16 v105 = 2082;
        v106 = v79;
        __int16 v107 = 1024;
        int v108 = 307;
        __int16 v109 = 2114;
        id v110 = v6;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Operating mode changed to:%{public}@", buf, 0x2Cu);
      }

      if (v54) {
        -[NFACDriverWrapper _writeSMCMultiTagEnabled:](v7, "_writeSMCMultiTagEnabled:", [v6 wantsMultiTag]);
      }
      goto LABEL_84;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v80 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v80)
    {
      v81 = object_getClass(v7);
      if (class_isMetaClass(v81)) {
        uint64_t v82 = 43;
      }
      else {
        uint64_t v82 = 45;
      }
      int v83 = object_getClassName(v7);
      __int16 v84 = sel_getName(a2);
      v80(3, "%c[%{public}s %{public}s]:%i Failed to set configuration: %{public}@", v82, v83, v84, 302, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v85 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      __int16 v86 = object_getClass(v7);
      if (class_isMetaClass(v86)) {
        int v87 = 43;
      }
      else {
        int v87 = 45;
      }
      v88 = object_getClassName(v7);
      v89 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v102 = v87;
      __int16 v103 = 2082;
      v104 = v88;
      __int16 v105 = 2082;
      v106 = v89;
      __int16 v107 = 1024;
      int v108 = 302;
      __int16 v109 = 2114;
      id v110 = v6;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set configuration: %{public}@", buf, 0x2Cu);
    }

    id v90 = objc_alloc((Class)NSError);
    v91 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    v92 = +[NSString stringWithUTF8String:"Stack Error"];
    v98 = v92;
    v93 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    id v12 = [v90 initWithDomain:v91 code:15 userInfo:v93];
  }
LABEL_96:

  return v12;
}

- (BOOL)readerModeProtectionActive
{
  return [(NFReaderRestrictor *)self->_readerPolicy readerModeProtectionActive];
}

- (id)state
{
  BOOL v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithBool:self->_isClosing];
  [v3 setObject:v4 forKeyedSubscript:@"isClosing"];

  v5 = +[NSNumber numberWithUnsignedLongLong:self->_lastFieldOffTime];
  [v3 setObject:v5 forKeyedSubscript:@"Last Field OFF time"];

  id v6 = objc_opt_new();
  remoteTags = self->_remoteTags;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007A5BC;
  v37[3] = &unk_100302B68;
  id v8 = v6;
  id v38 = v8;
  [(NSMutableDictionary *)remoteTags enumerateKeysAndObjectsUsingBlock:v37];
  v30 = v8;
  id v9 = [objc_alloc((Class)NSDictionary) initWithDictionary:v8];
  v32 = v3;
  [v3 setObject:v9 forKeyedSubscript:@"Remote Tags"];

  v10 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v31 = self;
  uint64_t v11 = self->_multiTagState;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v17 = objc_alloc((Class)NSMutableDictionary);
        int v18 = [v16 asDictionary];
        id v19 = [v17 initWithDictionary:v18];

        int v20 = [v19 NF_dataForKey:@"identifier"];
        __int16 v21 = v20;
        if (v20)
        {
          v22 = [v20 NF_asHexString];
          [v19 setObject:v22 forKeyedSubscript:@"identifier"];
        }
        [v10 addObject:v19];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v13);
  }

  id v23 = [objc_alloc((Class)NSArray) initWithArray:v10];
  [v32 setObject:v23 forKeyedSubscript:@"Multi Tags"];

  thermalMonitor = v31->_thermalMonitor;
  if (thermalMonitor)
  {
    int v25 = +[NSNumber numberWithUnsignedInteger:sub_100077E24(thermalMonitor)];
    [v32 setObject:v25 forKeyedSubscript:@"ThermalState"];
  }
  else
  {
    [v32 setObject:@"N/A" forKeyedSubscript:@"ThermalState"];
  }
  id v26 = [objc_alloc((Class)NSDictionary) initWithDictionary:v31->_sessionOwners];
  [v32 setObject:v26 forKeyedSubscript:@"driverSessionOpened"];

  v27 = +[NSNumber numberWithInt:v31->_sessionCount];
  [v32 setObject:v27 forKeyedSubscript:@"driverSessionCount"];

  id v28 = [objc_alloc((Class)NSDictionary) initWithDictionary:v32];

  return v28;
}

- (void)simulateCrash:(unsigned __int16)a3 reason:(const char *)a4
{
}

- (void)driverRestartDiscovery
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
    v5(6, "%c[%{public}s %{public}s]:%i Restarting Discovery", v9, ClassName, Name, 389);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    id v17 = object_getClassName(self);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 389;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restarting Discovery", buf, 0x22u);
  }
}

- (void)driverPLLUnlock
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
    v5(6, "%c[%{public}s %{public}s]:%i PLL UNLOCK", v9, ClassName, Name, 394);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    id v19 = object_getClassName(self);
    __int16 v20 = 2082;
    int v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 394;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PLL UNLOCK", buf, 0x22u);
  }

  id v13 = [(NFACDriverWrapper *)self delegate];
  [v13 handlePLLUnlock];

  uint64_t v14 = sub_1002090CC();
  sub_10020A828((uint64_t)v14, @"pllUnlock");
}

- (void)driverDidDetectHardwareReset:(const char *)a3
{
  id v4 = [(NFACDriverWrapper *)self delegate];
  [v4 handleHardwareReset:a3];
}

- (void)driverDidDetectFieldChange:(BOOL)a3
{
  if ([(NFACDriverWrapper *)self _isClosed])
  {
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
      v6(3, "%c[%{public}s %{public}s]:%i Driver session is closed", v10, ClassName, Name, 409);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v16 = v13;
      __int16 v17 = 2082;
      __int16 v18 = object_getClassName(self);
      __int16 v19 = 2082;
      __int16 v20 = sel_getName(a2);
      __int16 v21 = 1024;
      int v22 = 409;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Driver session is closed", buf, 0x22u);
    }
  }
}

- (void)driverDidDetectHostCardReader:(void *)a3
{
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
    v6(6, "%c[%{public}s %{public}s]:%i Host card reader detected", v10, ClassName, Name, 416);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    __int16 v18 = object_getClassName(self);
    __int16 v19 = 2082;
    __int16 v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 416;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Host card reader detected", buf, 0x22u);
  }
}

- (void)driverDidDetectRemoteTags:(_NFDriverRemoteTag *)a3 count:(unsigned __int8)a4
{
  unsigned int v4 = a4;
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 421);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v98 = v15;
    __int16 v99 = 2082;
    v100 = object_getClassName(self);
    __int16 v101 = 2082;
    int v102 = sel_getName(a2);
    __int16 v103 = 1024;
    int v104 = 421;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  int v16 = objc_opt_new();
  [(NSMutableDictionary *)self->_remoteTags removeAllObjects];
  if (a3 && v4)
  {
    unint64_t v17 = 0;
    sel = a2;
    uint64_t v93 = 96 * v4;
    while (2)
    {
      __int16 v18 = v16;
      id v19 = objc_alloc_init((Class)NFTagInternal);
      id v20 = [objc_alloc((Class)NSData) initWithBytes:a3[v17 / 0x60].var3 length:a3[v17 / 0x60].var4];
      [v19 _setIdentifier:v20];
      switch(a3[v17 / 0x60].var1)
      {
        case 0:
          [v19 _setTechnology:0];
          __int16 v21 = v19;
          uint64_t v22 = 0;
          goto LABEL_29;
        case 1:
          [v19 _setTechnology:1];
          int v23 = &a3[v17 / 0x60];
          unsigned int var0 = a3[v17 / 0x60].var2.var0.var0;
          if (var0 <= 2) {
            [v19 _setType:var0 + 1];
          }
          id v25 = objc_alloc((Class)NSData);
          goto LABEL_24;
        case 2:
          [v19 _setTechnology:2];
          int v26 = a3[v17 / 0x60].var2.var0.var0;
          if (v26 == 2)
          {
            __int16 v21 = v19;
            uint64_t v22 = 6;
          }
          else if (v26 == 1)
          {
            __int16 v21 = v19;
            uint64_t v22 = 5;
          }
          else
          {
            if (v26) {
              goto LABEL_61;
            }
            __int16 v21 = v19;
            uint64_t v22 = 4;
          }
LABEL_29:
          [v21 _setType:v22];
LABEL_61:
          v71 = [v19 tagID];
          remoteTags = self->_remoteTags;
          v95[0] = @"tagHandle";
          v73 = +[NSValue valueWithPointer:a3[v17 / 0x60].var0];
          v95[1] = @"type";
          v96[0] = v73;
          char v74 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 type]);
          v96[1] = v74;
          v75 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];
          [(NSMutableDictionary *)remoteTags setObject:v75 forKey:v71];

          [v19 _setUID:v71];
          int v16 = v18;
          [v18 addObject:v19];

          v17 += 96;
          if (v93 != v17) {
            continue;
          }
          [(NFReaderRestrictor *)self->_readerPolicy tagDetected];
          __int16 v86 = [(NFACDriverWrapper *)self delegate];
          [v86 handleRemoteTagsDetected:v16];
          break;
        case 3:
          [v19 _setTechnology:4];
          [v19 _setType:7];
          id v27 = [objc_alloc((Class)NSData) initWithBytes:(char *)&a3[v17 / 0x60].var2.var0.var0 + 1 length:a3[v17 / 0x60].var2.var2.var0];
          [v19 _setIdentifier:v27];

          id v28 = [objc_alloc((Class)NSData) initWithBytes:(char *)&a3[v17 / 0x60].var2.var0.var0 + 1 length:a3[v17 / 0x60].var2.var2.var0];
          [v19 _setIDm:v28];

          id v29 = [objc_alloc((Class)NSData) initWithBytes:&a3[v17 / 0x60].var2.var6.var3[4] length:8];
          [v19 _setPMm:v29];

          id v30 = objc_alloc((Class)NSArray);
          id v31 = [objc_alloc((Class)NSData) initWithBytes:&a3[v17 / 0x60].var2.var6.var3[12] length:2];
          id v32 = [v30 initWithObjects:v31];
          [v19 _setSystemCodes:v32];

          goto LABEL_61;
        case 4:
          [v19 _setTechnology:1];
          [v19 _setType:9];
          id v25 = objc_alloc((Class)NSData);
          int v23 = &a3[v17 / 0x60];
LABEL_24:
          id v33 = [v25 initWithBytes:v23->var2.var6.var3 length:v23->var2.var0.var4];
          [v19 _setHistoricalBytes:v33];

          id v34 = [objc_alloc((Class)NSData) initWithBytes:&v23->var2.var4.var0[5] length:2];
          [v19 _setAtqa:v34];

          id v35 = [objc_alloc((Class)NSData) initWithBytes:&v23->var2.var3.var0[4] length:1];
          [v19 _setSak:v35];

          goto LABEL_61;
        case 5:
          [v19 _setTechnology:16];
          __int16 v21 = v19;
          uint64_t v22 = 8;
          goto LABEL_29;
        case 6:
          [v19 _setTechnology:1];
          __int16 v21 = v19;
          uint64_t v22 = 11;
          goto LABEL_29;
        case 7:
          [v19 _setTechnology:1];
          __int16 v21 = v19;
          uint64_t v22 = 12;
          goto LABEL_29;
        case 8:
          [v19 _setTechnology:0];
          __int16 v21 = v19;
          uint64_t v22 = 10;
          goto LABEL_29;
        case 9:
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v36 = NFLogGetLogger();
          if (v36)
          {
            uint64_t v37 = (void (*)(uint64_t, const char *, ...))v36;
            id v38 = object_getClass(self);
            BOOL v39 = class_isMetaClass(v38);
            v40 = object_getClassName(self);
            v88 = sel_getName(sel);
            uint64_t v41 = 45;
            if (v39) {
              uint64_t v41 = 43;
            }
            v37(6, "%c[%{public}s %{public}s]:%i Found silent tag", v41, v40, v88, 498);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          unsigned int v42 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = object_getClass(self);
            if (class_isMetaClass(v43)) {
              int v44 = 43;
            }
            else {
              int v44 = 45;
            }
            v45 = object_getClassName(self);
            uint64_t v46 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            int v98 = v44;
            __int16 v99 = 2082;
            v100 = v45;
            __int16 v101 = 2082;
            int v102 = v46;
            __int16 v103 = 1024;
            int v104 = 498;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent tag", buf, 0x22u);
          }

          [v19 _setTechnology:1];
          [v19 _setType:3];
          uint64_t v47 = v19;
          uint64_t v48 = 1;
          goto LABEL_60;
        case 0xA:
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v49 = NFLogGetLogger();
          if (v49)
          {
            v50 = (void (*)(uint64_t, const char *, ...))v49;
            int v51 = object_getClass(self);
            BOOL v52 = class_isMetaClass(v51);
            v53 = object_getClassName(self);
            v89 = sel_getName(sel);
            uint64_t v54 = 45;
            if (v52) {
              uint64_t v54 = 43;
            }
            v50(6, "%c[%{public}s %{public}s]:%i Found silent A2 tag", v54, v53, v89, 504);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          unsigned int v55 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = object_getClass(self);
            if (class_isMetaClass(v56)) {
              int v57 = 43;
            }
            else {
              int v57 = 45;
            }
            uint64_t v58 = object_getClassName(self);
            int v59 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            int v98 = v57;
            __int16 v99 = 2082;
            v100 = v58;
            __int16 v101 = 2082;
            int v102 = v59;
            __int16 v103 = 1024;
            int v104 = 504;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A2 tag", buf, 0x22u);
          }

          [v19 _setTechnology:1];
          [v19 _setType:3];
          uint64_t v47 = v19;
          uint64_t v48 = 2;
          goto LABEL_60;
        case 0xB:
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v60 = NFLogGetLogger();
          if (v60)
          {
            v61 = (void (*)(uint64_t, const char *, ...))v60;
            __int16 v62 = object_getClass(self);
            BOOL v63 = class_isMetaClass(v62);
            __int16 v64 = object_getClassName(self);
            id v90 = sel_getName(sel);
            uint64_t v65 = 45;
            if (v63) {
              uint64_t v65 = 43;
            }
            v61(6, "%c[%{public}s %{public}s]:%i Found silent A3 tag", v65, v64, v90, 510);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v66 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = object_getClass(self);
            if (class_isMetaClass(v67)) {
              int v68 = 43;
            }
            else {
              int v68 = 45;
            }
            v69 = object_getClassName(self);
            int v70 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            int v98 = v68;
            __int16 v99 = 2082;
            v100 = v69;
            __int16 v101 = 2082;
            int v102 = v70;
            __int16 v103 = 1024;
            int v104 = 510;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A3 tag", buf, 0x22u);
          }

          [v19 _setTechnology:1];
          [v19 _setType:3];
          uint64_t v47 = v19;
          uint64_t v48 = 3;
LABEL_60:
          [v47 _setSilentType:v48];
          goto LABEL_61;
        default:
          goto LABEL_61;
      }
      break;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v76 = NFLogGetLogger();
    if (v76)
    {
      int v77 = (void (*)(uint64_t, const char *, ...))v76;
      __int16 v78 = object_getClass(self);
      BOOL v79 = class_isMetaClass(v78);
      __int16 v80 = object_getClassName(self);
      v91 = sel_getName(a2);
      uint64_t v81 = 45;
      if (v79) {
        uint64_t v81 = 43;
      }
      v77(3, "%c[%{public}s %{public}s]:%i Invalid tag data", v81, v80, v91, 428);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v86 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      uint64_t v82 = object_getClass(self);
      if (class_isMetaClass(v82)) {
        int v83 = 43;
      }
      else {
        int v83 = 45;
      }
      __int16 v84 = object_getClassName(self);
      v85 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v98 = v83;
      __int16 v99 = 2082;
      v100 = v84;
      __int16 v101 = 2082;
      int v102 = v85;
      __int16 v103 = 1024;
      int v104 = 428;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag data", buf, 0x22u);
    }
  }
}

- (void)_getHandleForTag:(id)a3
{
  remoteTags = self->_remoteTags;
  unsigned int v4 = [a3 UID];
  v5 = [(NSMutableDictionary *)remoteTags objectForKey:v4];

  id v6 = [v5 objectForKey:@"tagHandle"];
  v7 = v6;
  if (v6) {
    id v8 = [v6 pointerValue];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (unsigned)connectTag:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ([(NFACDriverWrapper *)v6 _isClosed])
  {
    unsigned int v7 = 3;
  }
  else
  {
    [(NFACDriverWrapper *)v6 _getHandleForTag:v5];
    if (NFDriverRemoteDevConnect())
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v6);
        if (class_isMetaClass(Class)) {
          uint64_t v10 = 43;
        }
        else {
          uint64_t v10 = 45;
        }
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to connect to tag: %{public}@", v10, ClassName, Name, 549, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = object_getClass(v6);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v18 = v15;
        __int16 v19 = 2082;
        id v20 = object_getClassName(v6);
        __int16 v21 = 2082;
        uint64_t v22 = sel_getName(a2);
        __int16 v23 = 1024;
        int v24 = 549;
        __int16 v25 = 2114;
        id v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to tag: %{public}@", buf, 0x2Cu);
      }

      unsigned int v7 = 28;
    }
    else
    {
      unsigned int v7 = 0;
    }
  }
  objc_sync_exit(v6);

  return v7;
}

- (unsigned)disconnectTag:(id)a3 tagRemovalDetect:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = self;
  objc_sync_enter(v8);
  if ([(NFACDriverWrapper *)v8 _isClosed])
  {
    unsigned int v9 = 3;
  }
  else
  {
    [(NFACDriverWrapper *)v8 _getHandleForTag:v7];
    int v10 = NFDriverRemoteDevDisconnect();
    if (v10)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class)) {
          uint64_t v13 = 43;
        }
        else {
          uint64_t v13 = 45;
        }
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag: %{public}@", v13, ClassName, Name, 566, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = object_getClass(v8);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v21 = v18;
        __int16 v22 = 2082;
        __int16 v23 = object_getClassName(v8);
        __int16 v24 = 2082;
        __int16 v25 = sel_getName(a2);
        __int16 v26 = 1024;
        int v27 = 566;
        __int16 v28 = 2114;
        id v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag: %{public}@", buf, 0x2Cu);
      }

      if (v10 == 18) {
        unsigned int v9 = 51;
      }
      else {
        unsigned int v9 = 15;
      }
    }
    else
    {
      if (v4
        && [(NFReaderRestrictor *)v8->_readerPolicy readerModeStoppedShouldCooloffRun])
      {
        [(NFACDriverWrapper *)v8 openSession:@"Cooloff"];
      }
      unsigned int v9 = 0;
    }
  }
  objc_sync_exit(v8);

  return v9;
}

- (BOOL)queryTagNDEFCapability:(id)a3 hasNdefAbility:(_NFNDEFTagInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = self;
  objc_sync_enter(v9);
  if ([(NFACDriverWrapper *)v9 _isClosed])
  {
    if (a5)
    {
      id v10 = objc_alloc((Class)NSError);
      uint64_t v11 = +[NSString stringWithUTF8String:"nfcd"];
      v50[0] = NSLocalizedDescriptionKey;
      uint64_t v12 = +[NSString stringWithUTF8String:"Exiting"];
      v51[0] = v12;
      v51[1] = &off_10031A800;
      v50[1] = @"Line";
      v50[2] = @"Method";
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v51[2] = v13;
      v50[3] = NSDebugDescriptionErrorKey;
      id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 584];
      v51[3] = v14;
      int v15 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
      *a5 = [v10 initWithDomain:v11 code:4 userInfo:v15];

LABEL_4:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    [(NFACDriverWrapper *)v9 _getHandleForTag:v8];
    int v16 = NFDriverRemoteDevCheckNdef();
    if (v16)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v9);
        if (class_isMetaClass(Class)) {
          uint64_t v19 = 43;
        }
        else {
          uint64_t v19 = 45;
        }
        ClassName = object_getClassName(v9);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to perform Ndef check", v19, ClassName, Name, 591);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = object_getClass(v9);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v43 = v24;
        __int16 v44 = 2082;
        v45 = object_getClassName(v9);
        __int16 v46 = 2082;
        uint64_t v47 = sel_getName(a2);
        __int16 v48 = 1024;
        int v49 = 591;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to perform Ndef check", buf, 0x22u);
      }

      if (a5)
      {
        if (v16 == 5)
        {
          id v30 = objc_alloc((Class)NSError);
          id v31 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
          id v32 = +[NSString stringWithUTF8String:"Invalid Parameter"];
          BOOL v39 = v32;
          id v33 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          *a5 = [v30 initWithDomain:v31 code:10 userInfo:v33];
        }
        else
        {
          id v25 = objc_alloc((Class)NSError);
          __int16 v26 = +[NSString stringWithUTF8String:"nfcd"];
          if (v16 == 6)
          {
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            int v27 = +[NSString stringWithUTF8String:"Tag Not Found"];
            uint64_t v41 = v27;
            __int16 v28 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            *a5 = [v25 initWithDomain:v26 code:28 userInfo:v28];
          }
          else
          {
            NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
            id v34 = +[NSString stringWithUTF8String:"Stack Error"];
            uint64_t v37 = v34;
            id v35 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            *a5 = [v25 initWithDomain:v26 code:15 userInfo:v35];
          }
        }
        goto LABEL_4;
      }
    }
    else
    {
      if (a5) {
        *a5 = 0;
      }
      LOBYTE(a5) = 1;
    }
  }
  objc_sync_exit(v9);

  return (char)a5;
}

- (unsigned)queryMifareTagCapability:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = self;
    objc_sync_enter(v8);
    if ([(NFACDriverWrapper *)v8 _isClosed])
    {
      if (!a4)
      {
LABEL_33:
        objc_sync_exit(v8);
        goto LABEL_34;
      }
      id v9 = objc_alloc((Class)NSError);
      id v10 = +[NSString stringWithUTF8String:"nfcd"];
      v53[0] = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:"Exiting"];
      v54[0] = v11;
      v54[1] = &off_10031A818;
      v53[1] = @"Line";
      v53[2] = @"Method";
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v54[2] = v12;
      v53[3] = NSDebugDescriptionErrorKey;
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 627];
      v54[3] = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
      *a4 = [v9 initWithDomain:v10 code:4 userInfo:v14];
    }
    else
    {
      uint64_t v52 = 0;
      memset(buf, 0, sizeof(buf));
      [(NFACDriverWrapper *)v8 _getHandleForTag:v7];
      if (!NFDriverRemoteDevGetMiFareInfo())
      {
        if ((*(_DWORD *)buf - 1) >= 4) {
          LODWORD(a4) = 0;
        }
        else {
          LODWORD(a4) = *(_DWORD *)buf + 12;
        }
        goto LABEL_33;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class)) {
          uint64_t v29 = 43;
        }
        else {
          uint64_t v29 = 45;
        }
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to query MIFARE info", v29, ClassName, Name, 635);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = object_getClass(v8);
        if (class_isMetaClass(v33)) {
          int v34 = 43;
        }
        else {
          int v34 = 45;
        }
        *(_DWORD *)int v43 = 67109890;
        int v44 = v34;
        __int16 v45 = 2082;
        __int16 v46 = object_getClassName(v8);
        __int16 v47 = 2082;
        __int16 v48 = sel_getName(a2);
        __int16 v49 = 1024;
        int v50 = 635;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query MIFARE info", v43, 0x22u);
      }

      if (!a4) {
        goto LABEL_33;
      }
      id v35 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v36 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      uint64_t v37 = +[NSString stringWithUTF8String:"Stack Error"];
      unsigned int v42 = v37;
      NSErrorUserInfoKey v38 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a4 = [v35 initWithDomain:v36 code:15 userInfo:v38];
    }
    LODWORD(a4) = 0;
    goto LABEL_33;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFLogGetLogger();
  if (v15)
  {
    int v16 = (void (*)(uint64_t, const char *, ...))v15;
    unint64_t v17 = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(v17);
    uint64_t v19 = object_getClassName(self);
    NSErrorUserInfoKey v40 = sel_getName(a2);
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v16(3, "%c[%{public}s %{public}s]:%i Invalid tag parameter", v20, v19, v40, 619);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = object_getClassName(self);
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = sel_getName(a2);
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = 619;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag parameter", buf, 0x22u);
  }

  if (a4)
  {
    id v24 = objc_alloc((Class)NSError);
    id v8 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    id v25 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v56 = v25;
    __int16 v26 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    *a4 = [v24 initWithDomain:v8 code:10 userInfo:v26];

    LODWORD(a4) = 0;
LABEL_34:
  }
  return a4;
}

- (id)readNdefDataFromTag:(id)a3 messageSize:(unsigned int)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = self;
  objc_sync_enter(v10);
  if ([(NFACDriverWrapper *)v10 _isClosed])
  {
    if (!a5) {
      goto LABEL_51;
    }
    id v11 = objc_alloc((Class)NSError);
    id v12 = +[NSString stringWithUTF8String:"nfcd"];
    v90[0] = NSLocalizedDescriptionKey;
    id v13 = +[NSString stringWithUTF8String:"Exiting"];
    v91[0] = v13;
    v91[1] = &off_10031A830;
    v90[1] = @"Line";
    v90[2] = @"Method";
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v91[2] = v14;
    v90[3] = NSDebugDescriptionErrorKey;
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 666];
    v91[3] = v15;
    int v16 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:4];
    *a5 = [v11 initWithDomain:v12 code:4 userInfo:v16];

    goto LABEL_50;
  }
  if (a4 > 0x8000)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v10);
      if (class_isMetaClass(Class)) {
        uint64_t v19 = 43;
      }
      else {
        uint64_t v19 = 45;
      }
      ClassName = object_getClassName(v10);
      Name = sel_getName(a2);
      Logger(5, "%c[%{public}s %{public}s]:%i NDEF message size is over the read limit", v19, ClassName, Name, 673);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = object_getClass(v10);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v75 = v24;
      __int16 v76 = 2082;
      int v77 = object_getClassName(v10);
      __int16 v78 = 2082;
      BOOL v79 = sel_getName(a2);
      __int16 v80 = 1024;
      int v81 = 673;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NDEF message size is over the read limit", buf, 0x22u);
    }

    if (a5)
    {
      id v25 = objc_alloc((Class)NSError);
      __int16 v26 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      int v27 = +[NSString stringWithUTF8String:"NDEF message size is over the limit"];
      v89 = v27;
      __int16 v28 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      *a5 = [v25 initWithDomain:v26 code:43 userInfo:v28];

LABEL_50:
      a5 = 0;
      goto LABEL_51;
    }
    goto LABEL_51;
  }
  if (a4)
  {
    if (a5) {
      *a5 = 0;
    }
    if (!NFDataCreateWithLength())
    {
      if (!a5) {
        goto LABEL_51;
      }
      id v54 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v55 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
      v56 = +[NSString stringWithUTF8String:"No resources"];
      v69 = v56;
      int v57 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      *a5 = [v54 initWithDomain:v55 code:34 userInfo:v57];

      goto LABEL_50;
    }
    [(NFACDriverWrapper *)v10 _getHandleForTag:v9];
    if (NFDriverRemoteDevReadNdef())
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29)
      {
        id v30 = object_getClass(v10);
        if (class_isMetaClass(v30)) {
          uint64_t v31 = 43;
        }
        else {
          uint64_t v31 = 45;
        }
        id v32 = object_getClassName(v10);
        id v33 = sel_getName(a2);
        v29(3, "%c[%{public}s %{public}s]:%i Failed to read NDEF from tag %{public}@, status=%d", v31, v32, v33, 694, v9, 0);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = object_getClass(v10);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        *(_DWORD *)buf = 67110402;
        int v75 = v36;
        __int16 v76 = 2082;
        int v77 = object_getClassName(v10);
        __int16 v78 = 2082;
        BOOL v79 = sel_getName(a2);
        __int16 v80 = 1024;
        int v81 = 694;
        __int16 v82 = 2114;
        id v83 = v9;
        __int16 v84 = 1024;
        int v85 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read NDEF from tag %{public}@, status=%d", buf, 0x32u);
      }

      if (!a5) {
        goto LABEL_35;
      }
      id v37 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v38 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      BOOL v39 = +[NSString stringWithUTF8String:"Stack Error"];
      v73 = v39;
      NSErrorUserInfoKey v40 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      id v41 = [v37 initWithDomain:v38 code:15 userInfo:v40];
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v59)
      {
        uint64_t v60 = object_getClass(v10);
        if (class_isMetaClass(v60)) {
          uint64_t v61 = 43;
        }
        else {
          uint64_t v61 = 45;
        }
        __int16 v62 = object_getClassName(v10);
        BOOL v63 = sel_getName(a2);
        v59(5, "%c[%{public}s %{public}s]:%i zero-length message", v61, v62, v63, 708);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v64 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = object_getClass(v10);
        if (class_isMetaClass(v65)) {
          int v66 = 43;
        }
        else {
          int v66 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v75 = v66;
        __int16 v76 = 2082;
        int v77 = object_getClassName(v10);
        __int16 v78 = 2082;
        BOOL v79 = sel_getName(a2);
        __int16 v80 = 1024;
        int v81 = 708;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i zero-length message", buf, 0x22u);
      }

      if (!a5) {
        goto LABEL_35;
      }
      id v67 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v38 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
      BOOL v39 = +[NSString stringWithUTF8String:"Zero-length NDEF message"];
      v71 = v39;
      NSErrorUserInfoKey v40 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      id v41 = [v67 initWithDomain:v38 code:49 userInfo:v40];
    }
    *a5 = v41;

LABEL_35:
    a5 = 0;
    NFDataRelease();
    goto LABEL_51;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unsigned int v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v42)
  {
    int v43 = object_getClass(v10);
    if (class_isMetaClass(v43)) {
      uint64_t v44 = 43;
    }
    else {
      uint64_t v44 = 45;
    }
    __int16 v45 = object_getClassName(v10);
    __int16 v46 = sel_getName(a2);
    v42(5, "%c[%{public}s %{public}s]:%i zero-length message", v44, v45, v46, 678);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v47 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v48 = object_getClass(v10);
    if (class_isMetaClass(v48)) {
      int v49 = 43;
    }
    else {
      int v49 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v75 = v49;
    __int16 v76 = 2082;
    int v77 = object_getClassName(v10);
    __int16 v78 = 2082;
    BOOL v79 = sel_getName(a2);
    __int16 v80 = 1024;
    int v81 = 678;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i zero-length message", buf, 0x22u);
  }

  if (a5)
  {
    id v50 = objc_alloc((Class)NSError);
    int v51 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    uint64_t v52 = +[NSString stringWithUTF8String:"Zero-length NDEF message"];
    int v87 = v52;
    v53 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    *a5 = [v50 initWithDomain:v51 code:49 userInfo:v53];

    goto LABEL_50;
  }
LABEL_51:
  objc_sync_exit(v10);

  return a5;
}

- (BOOL)writeLockNdef:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = self;
  objc_sync_enter(v8);
  if ([(NFACDriverWrapper *)v8 _isClosed])
  {
    if (!a4)
    {
LABEL_11:
      BOOL v16 = 0;
      goto LABEL_12;
    }
    id v9 = objc_alloc((Class)NSError);
    id v10 = +[NSString stringWithUTF8String:"nfcd"];
    v25[0] = NSLocalizedDescriptionKey;
    id v11 = +[NSString stringWithUTF8String:"Exiting"];
    v26[0] = v11;
    v26[1] = &off_10031A848;
    v25[1] = @"Line";
    v25[2] = @"Method";
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v26[2] = v12;
    v25[3] = NSDebugDescriptionErrorKey;
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 729];
    v26[3] = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    *a4 = [v9 initWithDomain:v10 code:4 userInfo:v14];

LABEL_10:
    goto LABEL_11;
  }
  [(NFACDriverWrapper *)v8 _getHandleForTag:v7];
  int v15 = NFDriverRemoteDevWriteLockNdef();
  BOOL v16 = v15 == 0;
  if (a4 && v15)
  {
    if (v15 == 6)
    {
      id v17 = objc_alloc((Class)NSError);
      id v10 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      id v11 = +[NSString stringWithUTF8String:"Connection Closed"];
      int v24 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v18 = [v17 initWithDomain:v10 code:21 userInfo:v12];
    }
    else
    {
      id v19 = objc_alloc((Class)NSError);
      id v10 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v11 = +[NSString stringWithUTF8String:"Stack Error"];
      __int16 v22 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v18 = [v19 initWithDomain:v10 code:15 userInfo:v12];
    }
    *a4 = v18;
    goto LABEL_10;
  }
LABEL_12:
  objc_sync_exit(v8);

  return v16;
}

- (unsigned)checkTagPresence:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(NFACDriverWrapper *)v5 _isClosed])
  {
    unsigned int v6 = 3;
  }
  else
  {
    [(NFACDriverWrapper *)v5 _getHandleForTag:v4];
    if (NFDriverRemoteDevCheckPresence()) {
      unsigned int v6 = 28;
    }
    else {
      unsigned int v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4
{
  id v4 = self;
  objc_sync_enter(v4);
  if ([(NFACDriverWrapper *)v4 _isClosed])
  {
    id v5 = objc_alloc((Class)NSError);
    unsigned int v6 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    id v7 = +[NSString stringWithUTF8String:"Aborted"];
    BOOL v16 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v9 = [v5 initWithDomain:v6 code:3 userInfo:v8];
LABEL_5:
    id v11 = v9;

    goto LABEL_6;
  }
  if (NFDriverContinuousWave())
  {
    id v10 = objc_alloc((Class)NSError);
    unsigned int v6 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v7 = +[NSString stringWithUTF8String:"Stack Error"];
    id v14 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v9 = [v10 initWithDomain:v6 code:15 userInfo:v8];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_6:
  objc_sync_exit(v4);

  return v11;
}

- (id)transceive:(id)a3 tag:(id)a4 maxTimeout:(double)a5 error:(id *)a6
{
  id v74 = a3;
  id v75 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  if ([(NFACDriverWrapper *)v10 _isClosed])
  {
    if (a6)
    {
      id v11 = objc_alloc((Class)NSError);
      id v12 = +[NSString stringWithUTF8String:"nfcd"];
      v90[0] = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v13 = +[NSString stringWithUTF8String:"Exiting"];
      v91[0] = v13;
      v91[1] = &off_10031A860;
      v90[1] = @"Line";
      v90[2] = @"Method";
      id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v91[2] = v14;
      v90[3] = NSDebugDescriptionErrorKey;
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 787];
      v91[3] = v15;
      BOOL v16 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:4];
      *a6 = [v11 initWithDomain:v12 code:4 userInfo:v16];
    }
    objc_sync_exit(v10);
    id v17 = 0;
    goto LABEL_43;
  }
  id v18 = v74;
  [v18 bytes];
  [v18 length];
  NFDataCreateWithBytesNoCopy();
  if (a6) {
    *a6 = 0;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v10);
    if (class_isMetaClass(Class)) {
      uint64_t v21 = 43;
    }
    else {
      uint64_t v21 = 45;
    }
    ClassName = object_getClassName(v10);
    Name = sel_getName(a2);
    int v24 = [v18 NF_asHexString];
    Logger(6, "%c[%{public}s %{public}s]:%i TX: %{public}@", v21, ClassName, Name, 801, v24);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = object_getClass(v10);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    __int16 v28 = object_getClassName(v10);
    uint64_t v29 = sel_getName(a2);
    id v30 = [v18 NF_asHexString];
    *(_DWORD *)buf = 67110146;
    int v81 = v27;
    __int16 v82 = 2082;
    id v83 = v28;
    __int16 v84 = 2082;
    int v85 = v29;
    __int16 v86 = 1024;
    int v87 = 801;
    __int16 v88 = 2114;
    v89 = v30;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TX: %{public}@", buf, 0x2Cu);
  }
  if ([v75 technology] == 4)
  {
    [(NFACDriverWrapper *)v10 _getHandleForTag:v75];
    int v31 = NFDriverRemoteDeviceFelicaTransceive();
LABEL_24:
    int v32 = v31;
    goto LABEL_25;
  }
  if ([v75 technology] == 16)
  {
    [(NFACDriverWrapper *)v10 _getHandleForTag:v75];
    int v31 = NFDriverRemoteDeviceIso15693Transceive();
    goto LABEL_24;
  }
  if ([v75 technology] == 1 || objc_msgSend(v75, "technology") == 2)
  {
    [(NFACDriverWrapper *)v10 _getHandleForTag:v75];
    int v31 = NFDriverRemoteDeviceIso14443Transceive();
    goto LABEL_24;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v53 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v53)
  {
    id v54 = object_getClass(v10);
    if (class_isMetaClass(v54)) {
      uint64_t v55 = 43;
    }
    else {
      uint64_t v55 = 45;
    }
    v56 = object_getClassName(v10);
    int v57 = sel_getName(a2);
    v53(3, "%c[%{public}s %{public}s]:%i Tag tech = %d", v55, v56, v57, 813, [v75 technology]);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v58 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    int v59 = object_getClass(v10);
    if (class_isMetaClass(v59)) {
      int v60 = 43;
    }
    else {
      int v60 = 45;
    }
    uint64_t v61 = object_getClassName(v10);
    __int16 v62 = sel_getName(a2);
    unsigned int v63 = [v75 technology];
    *(_DWORD *)buf = 67110146;
    int v81 = v60;
    __int16 v82 = 2082;
    id v83 = v61;
    __int16 v84 = 2082;
    int v85 = v62;
    __int16 v86 = 1024;
    int v87 = 813;
    __int16 v88 = 1024;
    LODWORD(v89) = v63;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag tech = %d", buf, 0x28u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v64 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v64)
  {
    uint64_t v65 = object_getClass(v10);
    if (class_isMetaClass(v65)) {
      uint64_t v66 = 43;
    }
    else {
      uint64_t v66 = 45;
    }
    id v67 = object_getClassName(v10);
    NSErrorUserInfoKey v68 = sel_getName(a2);
    v64(3, "%c[%{public}s %{public}s]:%i Reader mode transceive is not supported for this tag type", v66, v67, v68, 814);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v69 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    NSErrorUserInfoKey v70 = object_getClass(v10);
    if (class_isMetaClass(v70)) {
      int v71 = 43;
    }
    else {
      int v71 = 45;
    }
    NSErrorUserInfoKey v72 = object_getClassName(v10);
    v73 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v81 = v71;
    __int16 v82 = 2082;
    id v83 = v72;
    __int16 v84 = 2082;
    int v85 = v73;
    __int16 v86 = 1024;
    int v87 = 814;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader mode transceive is not supported for this tag type", buf, 0x22u);
  }

  int v32 = 5;
LABEL_25:
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v33)
  {
    int v34 = object_getClass(v10);
    if (class_isMetaClass(v34)) {
      uint64_t v35 = 43;
    }
    else {
      uint64_t v35 = 45;
    }
    int v36 = object_getClassName(v10);
    id v37 = sel_getName(a2);
    NSErrorUserInfoKey v38 = [0 NF_asHexString];
    v33(6, "%c[%{public}s %{public}s]:%i RX: %{public}@", v35, v36, v37, 822, v38);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v39 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    NSErrorUserInfoKey v40 = object_getClass(v10);
    if (class_isMetaClass(v40)) {
      int v41 = 43;
    }
    else {
      int v41 = 45;
    }
    unsigned int v42 = object_getClassName(v10);
    int v43 = sel_getName(a2);
    uint64_t v44 = [0 NF_asHexString];
    *(_DWORD *)buf = 67110146;
    int v81 = v41;
    __int16 v82 = 2082;
    id v83 = v42;
    __int16 v84 = 2082;
    int v85 = v43;
    __int16 v86 = 1024;
    int v87 = 822;
    __int16 v88 = 2114;
    v89 = v44;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i RX: %{public}@", buf, 0x2Cu);
  }
  NFDataRelease();
  NFDataRelease();
  if (v32 == 6)
  {
    id v45 = objc_alloc((Class)NSError);
    ErrorCode = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
    __int16 v47 = +[NSString stringWithUTF8String:"Tag Not Found"];
    BOOL v79 = v47;
    __int16 v48 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    id v49 = [v45 initWithDomain:ErrorCode code:28 userInfo:v48];
  }
  else
  {
    ErrorCode = (void *)NFDriverCreateErrorCode();
    if (!ErrorCode)
    {
      id v49 = 0;
      goto LABEL_40;
    }
    id v50 = objc_alloc((Class)NSError);
    __int16 v47 = +[NSString stringWithUTF8String:"nfcd"];
    v76[0] = NSLocalizedDescriptionKey;
    __int16 v48 = +[NSString stringWithUTF8String:"Stack Error"];
    v76[1] = NSUnderlyingErrorKey;
    v77[0] = v48;
    v77[1] = ErrorCode;
    int v51 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    id v49 = [v50 initWithDomain:v47 code:15 userInfo:v51];
  }
LABEL_40:

  objc_sync_exit(v10);
  if (a6) {
    *a6 = v49;
  }
  id v10 = (NFACDriverWrapper *)0;

  id v17 = v10;
LABEL_43:

  return v17;
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
        id v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", v13, ClassName, Name, 856, v3);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        __int16 v22 = object_getClassName(self);
        __int16 v23 = 2082;
        int v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 856;
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

- (id)setISO15693DataRate:(int)a3 forTag:(id)a4
{
  id v7 = a4;
  unsigned int ntag5DataRate = self->_ntag5DataRate;
  if (ntag5DataRate) {
    uint64_t v9 = ntag5DataRate;
  }
  else {
    uint64_t v9 = a3;
  }
  if ([(NFACDriverWrapper *)self _ntag5DriverRateFromTagRate:v9]
    && (id v10 = self,
        objc_sync_enter(v10),
        [(NFACDriverWrapper *)v10 _getHandleForTag:v7],
        unsigned int v11 = NFDriverISO15693SetDataRate(),
        objc_sync_exit(v10),
        v10,
        v11))
  {
    id v12 = objc_alloc((Class)NSError);
    uint64_t v13 = +[NSString stringWithUTF8String:"nfcd"];
    v21[0] = NSLocalizedDescriptionKey;
    if (v11 >= 0x47) {
      int v14 = 71;
    }
    else {
      int v14 = v11;
    }
    id v15 = +[NSString stringWithUTF8String:off_100302920[v14]];
    v22[0] = v15;
    v22[1] = &off_10031A878;
    v21[1] = @"Line";
    v21[2] = @"Method";
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v22[2] = v16;
    v21[3] = NSDebugDescriptionErrorKey;
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 885];
    v22[3] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    id v19 = [v12 initWithDomain:v13 code:v11 userInfo:v18];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
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
        id v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", v13, ClassName, Name, 895, v3);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        __int16 v22 = object_getClassName(self);
        __int16 v23 = 2082;
        int v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 895;
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

- (id)setTypeATagDataRate:(int)a3
{
  unsigned int typeATagDataRate = self->_typeATagDataRate;
  if (typeATagDataRate) {
    *(void *)&a3 = typeATagDataRate;
  }
  else {
    uint64_t v6 = a3;
  }
  if ([(NFACDriverWrapper *)self _typeADriverRateFromTagRate:*(void *)&a3]
    && (int v7 = self,
        objc_sync_enter(v7),
        unsigned int v8 = NFDriverSetTypeATagDataRate(),
        objc_sync_exit(v7),
        v7,
        v8))
  {
    id v9 = objc_alloc((Class)NSError);
    id v10 = +[NSString stringWithUTF8String:"nfcd"];
    v18[0] = NSLocalizedDescriptionKey;
    if (v8 >= 0x47) {
      int v11 = 71;
    }
    else {
      int v11 = v8;
    }
    id v12 = +[NSString stringWithUTF8String:off_100302920[v11]];
    v19[0] = v12;
    v19[1] = &off_10031A890;
    v18[1] = @"Line";
    v18[2] = @"Method";
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v19[2] = v13;
    v18[3] = NSDebugDescriptionErrorKey;
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 930];
    v19[3] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    id v16 = [v9 initWithDomain:v10 code:v8 userInfo:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (unsigned)getTagType:(id)a3
{
  remoteTags = self->_remoteTags;
  int v4 = [a3 UID];
  int v5 = [(NSMutableDictionary *)remoteTags objectForKey:v4];

  uint64_t v6 = [v5 objectForKey:@"type"];
  int v7 = v6;
  if (v6) {
    unsigned int v8 = [v6 unsignedIntValue];
  }
  else {
    unsigned int v8 = 0;
  }

  return v8;
}

- (_NFData)readFromHCEDevice:(void *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if ([(NFACDriverWrapper *)v3 _isClosed]) {
    int v4 = 0;
  }
  else {
    int v4 = (_NFData *)NFDriverRemoteDevReceive();
  }
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)sendToHCEDevice:(void *)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  int v5 = self;
  objc_sync_enter(v5);
  if ([(NFACDriverWrapper *)v5 _isClosed]) {
    char v6 = 0;
  }
  else {
    char v6 = NFDriverRemoteDevSend();
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)setPollingConfig:(int)a3 tagNotificationConfig:(_NFDriverTagDiscoveryNtf)a4
{
}

- (BOOL)_restartDiscoveryWithReconfig:(BOOL)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  unsigned __int8 v4 = [(NFACDriverWrapper *)v3 _isClosed];
  if (v4)
  {
    LOBYTE(restarted) = 0;
  }
  else
  {
    if (v3->_driver->var4) {
      unsigned int v6 = [(NFReaderRestrictor *)v3->_readerPolicy readerModeProtectionActive];
    }
    else {
      unsigned int v6 = 0;
    }
    if ([(NFReaderRestrictor *)v3->_readerPolicy readerModeStoppedShouldCooloffRun])
    {
      [(NFACDriverWrapper *)v3 openSession:@"Cooloff"];
      unsigned int v6 = 1;
    }
    int restarted = NFDriverRestartDiscovery();
    if ((restarted & v6) == 1)
    {
      [(NFReaderRestrictor *)v3->_readerPolicy triggerBurnoutTimer];
      LOBYTE(restarted) = 1;
    }
  }
  objc_sync_exit(v3);

  return restarted & ~v4;
}

- (BOOL)restartDiscovery
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1008);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    id v18 = object_getClassName(self);
    __int16 v19 = 2082;
    int v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 1008;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return [(NFACDriverWrapper *)self _restartDiscoveryWithReconfig:1];
}

- (BOOL)resumeDiscovery
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1014);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    id v18 = object_getClassName(self);
    __int16 v19 = 2082;
    int v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 1014;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return [(NFACDriverWrapper *)self _restartDiscoveryWithReconfig:0];
}

- (id)getDieID
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1021);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v12;
    __int16 v33 = 2082;
    int v34 = object_getClassName(self);
    __int16 v35 = 2082;
    int v36 = sel_getName(a2);
    __int16 v37 = 1024;
    int v38 = 1021;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  unint64_t v13 = [(NFACDriverWrapper *)self openSession:@"DieID"];
  if (v13 == 1)
  {
    *(void *)buf = 0;
    int DieID = NFDriverReadDieID();
    [(NFACDriverWrapper *)self closeSession:@"DieID"];
    id v15 = 0;
    if (DieID && *(void *)buf)
    {
      id v16 = objc_alloc((Class)NSData);
      id v15 = [v16 initWithBytesNoCopy:*(void *)buf length:0];
    }
  }
  else
  {
    unint64_t v17 = v13;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      __int16 v19 = (void (*)(uint64_t, const char *, ...))v18;
      int v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      uint64_t v29 = object_getClassName(self);
      int v31 = sel_getName(a2);
      uint64_t v22 = 45;
      if (v21) {
        uint64_t v22 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v22, v29, v31, 1025, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      int v26 = object_getClassName(self);
      __int16 v27 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v25;
      __int16 v33 = 2082;
      int v34 = v26;
      __int16 v35 = 2082;
      int v36 = v27;
      __int16 v37 = 1024;
      int v38 = 1025;
      __int16 v39 = 2048;
      unint64_t v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }

    id v15 = 0;
  }

  return v15;
}

- (BOOL)configureMultiTagPolling
{
  if (!self->_driver)
  {
    int v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"NFACDriverWrapper.m" lineNumber:1044 description:@"driver not open"];
  }

  return NFDriverConfigureAutomaticMultiTagPolling();
}

- (id)queryMultiTagState:(BOOL *)a3 error:(id *)a4
{
  int v7 = objc_opt_new();
  bzero(v20, 0x300uLL);
  if (NFDriverGetMultiTagState())
  {
    if (a4)
    {
      id v8 = objc_alloc((Class)NSError);
      uint64_t v9 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      id v10 = +[NSString stringWithUTF8String:"Security Violation"];
      int v28 = v10;
      int v11 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a4 = [v8 initWithDomain:v9 code:8 userInfo:v11];
    }
    id v12 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i MultiTag Enabled: %d", "-[NFACDriverWrapper queryMultiTagState:error:]", 1061, 0);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 136446722;
      uint64_t v22 = "-[NFACDriverWrapper queryMultiTagState:error:]";
      __int16 v23 = 1024;
      int v24 = 1061;
      __int16 v25 = 1024;
      int v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i MultiTag Enabled: %d", (uint8_t *)&buf, 0x18u);
    }

    if (a3) {
      *a3 = 0;
    }
    uint64_t v15 = 0;
    char v16 = 1;
    do
    {
      char v17 = v16;
      uint64_t v18 = [(NFACDriverWrapper *)self _internalTagFromMultiTag:&v20[6 * v15 + 12]];
      if (v18) {
        [v7 addObject:v18];
      }

      char v16 = 0;
      uint64_t v15 = 1;
    }
    while ((v17 & 1) != 0);
    id v12 = v7;
  }

  return v12;
}

- (BOOL)clearMultiTagPollingState
{
  driver = self->_driver;
  if (!driver)
  {
    int v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"NFACDriverWrapper.m" lineNumber:1079 description:@"driver not open"];

    driver = self->_driver;
  }

  return _NFDriverClearAutomaticMultiTagPollingState(driver, a2);
}

- (BOOL)getRFSettings:(id)a3
{
  id v5 = a3;
  unsigned int v6 = self;
  objc_sync_enter(v6);
  if (!v6->_driver)
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:v6 file:@"NFACDriverWrapper.m" lineNumber:1093 description:@"driver not open"];
  }
  char v7 = NFDriverRFSettingsCopy();
  objc_sync_exit(v6);

  return v7;
}

- (id)getPowerCounters:(id *)a3
{
  if (!self->_lastPowerStateQuery)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Power state tracking not available", v15, ClassName, Name, 1131);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    char v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      char v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)int buf = 67109890;
      int v51 = v18;
      __int16 v52 = 2082;
      v53 = object_getClassName(self);
      __int16 v54 = 2082;
      uint64_t v55 = sel_getName(a2);
      __int16 v56 = 1024;
      int v57 = 1131;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Power state tracking not available", buf, 0x22u);
    }

    id v19 = objc_alloc((Class)NSError);
    id ErrorCode = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
    uint64_t v22 = +[NSString stringWithUTF8String:"Invalid State"];
    uint64_t v65 = v22;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    id v25 = [v19 initWithDomain:ErrorCode code:12 userInfo:v23];
    goto LABEL_18;
  }
  int PowerCounter = NFDriverGetPowerCounter();
  if (PowerCounter) {
    BOOL v7 = PowerCounter == 15;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id ErrorCode = (id)NFDriverCreateErrorCode();
    id v21 = objc_alloc((Class)NSError);
    uint64_t v22 = +[NSString stringWithUTF8String:"nfcd"];
    v62[0] = NSLocalizedDescriptionKey;
    __int16 v23 = +[NSString stringWithUTF8String:"Stack Error"];
    v62[1] = NSUnderlyingErrorKey;
    v63[0] = v23;
    v63[1] = ErrorCode;
    int v24 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    id v25 = [v21 initWithDomain:v22 code:15 userInfo:v24];

LABEL_18:
    goto LABEL_34;
  }
  [(NSDate *)self->_lastPowerStateQuery timeIntervalSinceNow];
  double v9 = v8;
  uint64_t v22 = objc_opt_new();
  int v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  [v22 setObject:v26 forKey:@"idleTime"];

  NSErrorUserInfoKey v27 = +[NSNumber numberWithUnsignedInt:0];
  [v22 setObject:v27 forKey:@"rfTime"];

  int v28 = +[NSNumber numberWithInt:-((double)0 - v9 * -1000.0)];
  [v22 setObject:v28 forKey:@"sleepTime"];

  uint64_t v29 = +[NSNumber numberWithUnsignedInt:0];
  if ([(NSMutableArray *)self->_multiTagState count]) {
    CFStringRef v30 = @"vGpioFalseDetectCountWithTags";
  }
  else {
    CFStringRef v30 = @"vGpioFalseDetectCount";
  }
  [v22 setObject:v29 forKey:v30];
  int v31 = sub_1002090CC();
  sub_10020A2E8((uint64_t)v31, v29);

  int v32 = +[NSNumber numberWithUnsignedLongLong:0];
  [v22 setObject:v32 forKey:@"SEUptime"];

  __int16 v33 = +[NSNumber numberWithBool:0];
  [v22 setObject:v33 forKey:@"eseStatus"];

  int v34 = +[NSNumber numberWithBool:0];
  [v22 setObject:v34 forKey:@"mboxStatus"];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v35 = NFLogGetLogger();
  if (v35)
  {
    int v36 = (void (*)(uint64_t, const char *, ...))v35;
    __int16 v37 = object_getClass(self);
    BOOL v38 = class_isMetaClass(v37);
    __int16 v39 = object_getClassName(self);
    id v49 = sel_getName(a2);
    uint64_t v40 = 45;
    if (v38) {
      uint64_t v40 = 43;
    }
    v36(6, "%c[%{public}s %{public}s]:%i Last query was %g seconds ago, power dict = %{public}@", v40, v39, v49, 1177, *(void *)&v9, v22);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v41 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v42 = object_getClass(self);
    if (class_isMetaClass(v42)) {
      int v43 = 43;
    }
    else {
      int v43 = 45;
    }
    *(_DWORD *)int buf = 67110402;
    int v51 = v43;
    __int16 v52 = 2082;
    v53 = object_getClassName(self);
    __int16 v54 = 2082;
    uint64_t v55 = sel_getName(a2);
    __int16 v56 = 1024;
    int v57 = 1177;
    __int16 v58 = 2048;
    double v59 = v9;
    __int16 v60 = 2114;
    uint64_t v61 = v22;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Last query was %g seconds ago, power dict = %{public}@", buf, 0x36u);
  }

  if (a3) {
    *a3 = [objc_alloc((Class)NSDictionary) initWithDictionary:v22];
  }
  lastPowerStateQuery = self->_lastPowerStateQuery;
  self->_lastPowerStateQuery = 0;

  id v45 = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:0.0];
  __int16 v46 = self->_lastPowerStateQuery;
  self->_lastPowerStateQuery = v45;

  id ErrorCode = 0;
  id v25 = ErrorCode;
LABEL_34:

  return v25;
}

- (id)combinePowerCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  double v9 = objc_opt_new();
  if (![v7 count])
  {
    id v44 = v8;
    if (!v5) {
      goto LABEL_11;
    }
    [v9 addEntriesFromDictionary:v8];
    id v45 = +[NSNumber numberWithBool:1];
    CFStringRef v48 = @"Overflow";
    __int16 v46 = v9;
    __int16 v47 = v45;
    goto LABEL_10;
  }
  id v10 = [v7 objectForKeyedSubscript:@"idleTime"];
  unsigned int v11 = [v10 intValue];
  id v12 = [v8 objectForKeyedSubscript:@"idleTime"];
  uint64_t v13 = [v12 intValue] + v11;

  id v14 = +[NSNumber numberWithUnsignedInt:v13];
  [v9 setObject:v14 forKeyedSubscript:@"idleTime"];

  uint64_t v15 = [v7 objectForKeyedSubscript:@"rfTime"];
  LODWORD(v13) = [v15 intValue];
  char v16 = [v8 objectForKeyedSubscript:@"rfTime"];
  uint64_t v17 = [v16 intValue] + v13;

  int v18 = +[NSNumber numberWithUnsignedInt:v17];
  [v9 setObject:v18 forKeyedSubscript:@"rfTime"];

  id v19 = [v7 objectForKeyedSubscript:@"sleepTime"];
  LODWORD(v17) = [v19 intValue];
  int v20 = [v8 objectForKeyedSubscript:@"sleepTime"];
  uint64_t v21 = [v20 intValue] + v17;

  uint64_t v22 = +[NSNumber numberWithUnsignedInt:v21];
  [v9 setObject:v22 forKeyedSubscript:@"sleepTime"];

  __int16 v23 = [v7 objectForKeyedSubscript:@"falseDetect"];
  LODWORD(v21) = [v23 intValue];
  int v24 = [v8 objectForKeyedSubscript:@"falseDetect"];
  uint64_t v25 = [v24 intValue] + v21;

  int v26 = +[NSNumber numberWithUnsignedInt:v25];
  [v9 setObject:v26 forKeyedSubscript:@"falseDetect"];

  NSErrorUserInfoKey v27 = [v7 objectForKeyedSubscript:@"vGpioFalseDetectCount"];
  LODWORD(v25) = [v27 intValue];
  int v28 = [v8 objectForKeyedSubscript:@"vGpioFalseDetectCount"];
  uint64_t v29 = [v28 intValue] + v25;

  CFStringRef v30 = +[NSNumber numberWithUnsignedInt:v29];
  [v9 setObject:v30 forKeyedSubscript:@"vGpioFalseDetectCount"];

  int v31 = [v7 objectForKeyedSubscript:@"vGpioFalseDetectCountWithTags"];
  LODWORD(v29) = [v31 intValue];
  int v32 = [v8 objectForKeyedSubscript:@"vGpioFalseDetectCountWithTags"];
  uint64_t v33 = [v32 intValue] + v29;

  int v34 = +[NSNumber numberWithUnsignedInt:v33];
  [v9 setObject:v34 forKeyedSubscript:@"vGpioFalseDetectCountWithTags"];

  uint64_t v35 = [v7 objectForKeyedSubscript:@"SEUptime"];
  int v36 = (char *)[v35 longLongValue];
  __int16 v37 = [v8 objectForKeyedSubscript:@"SEUptime"];
  BOOL v38 = &v36[(void)[v37 longLongValue]];

  __int16 v39 = +[NSNumber numberWithUnsignedLongLong:v38];
  [v9 setObject:v39 forKeyedSubscript:@"SEUptime"];

  if (v5)
  {
    uint64_t v40 = +[NSNumber numberWithBool:1];
    [v9 setObject:v40 forKeyedSubscript:@"Overflow"];
  }
  int v41 = [v8 objectForKeyedSubscript:@"eseStatus"];

  if (v41)
  {
    unsigned int v42 = [v8 objectForKeyedSubscript:@"eseStatus"];
    [v9 setObject:v42 forKeyedSubscript:@"eseStatus"];
  }
  int v43 = [v8 objectForKeyedSubscript:@"mboxStatus"];

  id v44 = v9;
  if (v43)
  {
    id v45 = [v8 objectForKeyedSubscript:@"mboxStatus"];
    __int16 v46 = v9;
    __int16 v47 = v45;
    CFStringRef v48 = @"mboxStatus";
LABEL_10:
    [v46 setObject:v47 forKeyedSubscript:v48];

    id v44 = v9;
  }
LABEL_11:
  id v49 = [objc_alloc((Class)NSDictionary) initWithDictionary:v44];

  return v49;
}

- (BOOL)triggerDelayedWake:(unsigned __int8)a3
{
  return NFDriverTriggerDelayedWake();
}

- (id)pushSignedRF:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v6 = a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 1246);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)int buf = 67109890;
    int v34 = v15;
    __int16 v35 = 2082;
    int v36 = object_getClassName(self);
    __int16 v37 = 2082;
    BOOL v38 = sel_getName(a2);
    __int16 v39 = 1024;
    int v40 = 1246;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  id v16 = v6;
  [v16 bytes];
  [v16 length];

  if (NFDataCreateWithBytes())
  {
    char v17 = NFDriverRFSettingsPushSignedSetting();
    NFDataRelease();
    if (v17)
    {
      id v18 = 0;
      goto LABEL_16;
    }
    id v26 = objc_alloc((Class)NSError);
    int v20 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    uint64_t v21 = +[NSString stringWithUTF8String:"Unknown Error"];
    CFStringRef v30 = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    __int16 v23 = v26;
    int v24 = v20;
    uint64_t v25 = 6;
  }
  else
  {
    id v19 = objc_alloc((Class)NSError);
    int v20 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    uint64_t v21 = +[NSString stringWithUTF8String:"No resources"];
    int v32 = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    __int16 v23 = v19;
    int v24 = v20;
    uint64_t v25 = 34;
  }
  id v18 = [v23 initWithDomain:v24 code:v25 userInfo:v22];

LABEL_16:

  return v18;
}

- (void)_getDriverConfig:(_NFDriverConfig *)a3
{
  *(_OWORD *)&a3->id var2 = 0u;
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->unsigned int var0 = 0u;
  id var2 = a3->var2;
  a3->id var2 = 0;

  a3->unsigned int var0 = "com.apple.spmi.nfc.hammerfest";
  a3->var3 = self->_flags | 0x80000;
  a3->var4 = self->_pollingPeriod;
  a3->var6 = self->_multiTagPollingPeriod;
  a3->var7 = self->_multiTagPollingRetries;
}

- (void)setDriverCallbacks
{
  NFDriverSetCallback();
  NFDriverSetCallback();
  NFDriverSetCallback();
  NFDriverSetCallback();
  NFDriverSetCallback();
  NFDriverSetCallback();

  NFDriverSetCallback();
}

- (BOOL)getControllerInfo:(id *)a3
{
  unsigned __int8 v4 = self;
  objc_sync_enter(v4);
  if (!v4->_driver)
  {
    uint64_t v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:v4 file:@"NFACDriverWrapper.m" lineNumber:1290 description:@"driver not open"];
  }
  char ControllerInfo = NFDriverGetControllerInfo();
  if (ControllerInfo)
  {
    __int16 v23 = [NFHardwareControllerInfo alloc];
    v25[0] = @"siliconVersion";
    id v6 = +[NSNumber numberWithUnsignedInt:0];
    v26[0] = v6;
    v25[1] = @"siliconName";
    id v7 = +[NSNumber numberWithUnsignedInt:0];
    v26[1] = v7;
    v25[2] = @"ROMVersion";
    id v8 = +[NSNumber numberWithUnsignedInt:0];
    v26[2] = v8;
    v25[3] = @"firmwareVersion";
    double v9 = +[NSNumber numberWithUnsignedInt:0];
    v26[3] = v9;
    void v25[4] = @"firmwareRevision";
    id v10 = +[NSNumber numberWithUnsignedInt:0];
    void v26[4] = v10;
    v25[5] = @"middlewareVersion";
    unsigned int v11 = +[NSNumber numberWithUnsignedInt:0];
    v26[5] = v11;
    v25[6] = @"hasMFW";
    uint64_t v12 = +[NSNumber numberWithBool:v4->_driver->var10];
    v26[6] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
    *a3 = [(NFHardwareControllerInfo *)v23 initWithDictionary:v13];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v4);
      if (class_isMetaClass(Class)) {
        uint64_t v16 = 43;
      }
      else {
        uint64_t v16 = 45;
      }
      ClassName = object_getClassName(v4);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to get info", v16, ClassName, Name, 1294);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v19 = object_getClass(v4);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)int buf = 67109890;
      int v28 = v20;
      __int16 v29 = 2082;
      CFStringRef v30 = object_getClassName(v4);
      __int16 v31 = 2082;
      int v32 = sel_getName(a2);
      __int16 v33 = 1024;
      int v34 = 1294;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get info", buf, 0x22u);
    }
  }

  objc_sync_exit(v4);
  return ControllerInfo;
}

- (BOOL)_writeSMCMultiTagEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFDictionaryRef v6 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v21(3, "%c[%{public}s %{public}s]:%i Failed to get AppleSMCSensorDispatcher", v25, ClassName, Name, 1316);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      NSErrorUserInfoKey v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v28;
      *(_WORD *)buf_8 = 2082;
      *(void *)&buf_8[2] = object_getClassName(self);
      *(_WORD *)&buf_8[10] = 2082;
      *(void *)&buf_8[12] = sel_getName(a2);
      *(_WORD *)&buf_8[20] = 1024;
      *(_DWORD *)&buf_8[22] = 1316;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get AppleSMCSensorDispatcher", (uint8_t *)&buf, 0x22u);
    }

    goto LABEL_23;
  }
  io_object_t v8 = MatchingService;
  io_connect_t connect = 0;
  uint64_t v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  IOObjectRelease(v8);
  if (!v9)
  {
    uint64_t buf = 1;
    uint64_t v77 = 0;
    long long v75 = 0u;
    long long v76 = 0u;
    *(_OWORD *)&buf_8[24] = 0u;
    *(void *)buf_8 = 1313227587;
    *(_OWORD *)&buf_8[8] = v3;
    uint64_t v30 = IOConnectCallStructMethod(connect, 3u, &buf, 0x58uLL, 0, 0);
    IOServiceClose(connect);
    BOOL v29 = v30 == 0;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFLogGetLogger();
    int v32 = (void (*)(uint64_t, const char *, ...))v31;
    if (v30)
    {
      if (v31)
      {
        __int16 v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        __int16 v58 = object_getClassName(self);
        uint64_t v61 = sel_getName(a2);
        uint64_t v35 = 45;
        if (v34) {
          uint64_t v35 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i Failed to write data to SMC - %x", v35, v58, v61, 1337, v30);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      __int16 v37 = object_getClass(self);
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      __int16 v39 = object_getClassName(self);
      int v40 = sel_getName(a2);
      *(_DWORD *)unsigned int v63 = 67110146;
      int v64 = v38;
      __int16 v65 = 2082;
      uint64_t v66 = v39;
      __int16 v67 = 2082;
      NSErrorUserInfoKey v68 = v40;
      __int16 v69 = 1024;
      int v70 = 1337;
      __int16 v71 = 1024;
      LODWORD(v72) = v30;
      int v41 = "%c[%{public}s %{public}s]:%i Failed to write data to SMC - %x";
      unsigned int v42 = v36;
      os_log_type_t v43 = OS_LOG_TYPE_ERROR;
      uint32_t v44 = 40;
    }
    else
    {
      if (v31)
      {
        id v45 = object_getClass(self);
        BOOL v46 = class_isMetaClass(v45);
        __int16 v47 = object_getClassName(self);
        CFStringRef v48 = sel_getName(a2);
        if (v3) {
          CFStringRef v49 = @"on";
        }
        else {
          CFStringRef v49 = @"off";
        }
        uint64_t v50 = 45;
        if (v46) {
          uint64_t v50 = 43;
        }
        v32(6, "%c[%{public}s %{public}s]:%i Sent notification to SMC about power %{public}@", v50, v47, v48, 1340, v49);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_50;
      }
      int v51 = object_getClass(self);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      v53 = object_getClassName(self);
      __int16 v54 = sel_getName(a2);
      *(_DWORD *)unsigned int v63 = 67110146;
      if (v3) {
        CFStringRef v55 = @"on";
      }
      else {
        CFStringRef v55 = @"off";
      }
      int v64 = v52;
      __int16 v65 = 2082;
      uint64_t v66 = v53;
      __int16 v67 = 2082;
      NSErrorUserInfoKey v68 = v54;
      __int16 v69 = 1024;
      int v70 = 1340;
      __int16 v71 = 2114;
      CFStringRef v72 = v55;
      int v41 = "%c[%{public}s %{public}s]:%i Sent notification to SMC about power %{public}@";
      unsigned int v42 = v36;
      os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
      uint32_t v44 = 44;
    }
    _os_log_impl((void *)&_mh_execute_header, v42, v43, v41, v63, v44);
LABEL_50:

    return v29;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFLogGetLogger();
  if (v10)
  {
    unsigned int v11 = (void (*)(uint64_t, const char *, ...))v10;
    uint64_t v12 = object_getClass(self);
    BOOL v13 = class_isMetaClass(v12);
    int v57 = object_getClassName(self);
    double v59 = sel_getName(a2);
    uint64_t v14 = 45;
    if (v13) {
      uint64_t v14 = 43;
    }
    v11(3, "%c[%{public}s %{public}s]:%i Could not open service: %#x", v14, v57, v59, 1324, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    id v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v17;
    *(_WORD *)buf_8 = 2082;
    *(void *)&buf_8[2] = v18;
    *(_WORD *)&buf_8[10] = 2082;
    *(void *)&buf_8[12] = v19;
    *(_WORD *)&buf_8[20] = 1024;
    *(_DWORD *)&buf_8[22] = 1324;
    *(_WORD *)&buf_8[26] = 1024;
    *(_DWORD *)&buf_8[28] = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not open service: %#x", (uint8_t *)&buf, 0x28u);
  }

LABEL_23:
  LOBYTE(v29) = 0;
  return v29;
}

- (BOOL)hwInBadState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"FailForwardNeeded"];
  unsigned __int8 v4 = [v3 BOOLValue];

  BOOL v5 = [v2 objectForKey:@"FailForwardInProgress"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v4 | v6;
}

- (void)failForwardCompleted
{
  v2 = NFSharedSignpostLog();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "end", v4, 2u);
  }

  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"FailForwardNeeded"];
  [v3 removeObjectForKey:@"FailForwardInProgress"];
  [v3 removeObjectForKey:@"FailForwardLastAttemptTimestamp"];
  [v3 removeObjectForKey:@"FailForwardDetectedTimestamp"];
}

- (void)triggerFailForward
{
  unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [v4 objectForKey:@"enableFailForwardOnAPDEV"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (!NFProductIsDevBoard() || (v6 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ffDelegate);
    if (WeakRetained)
    {
      uint64_t v16 = NFSharedSignpostLog();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "begin", buf, 2u);
      }

      int v17 = +[NSDate now];
      id v18 = [WeakRetained triggerHammerfestRecoveryAt:v17];

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
          uint64_t v23 = 45;
          if (isMetaClass) {
            uint64_t v23 = 43;
          }
          v20(3, "%c[%{public}s %{public}s]:%i Failed to trigger recovery (%@)!", v23, ClassName, Name, 1384, v18);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v24 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = object_getClass(self);
          if (class_isMetaClass(v25)) {
            int v26 = 43;
          }
          else {
            int v26 = 45;
          }
          NSErrorUserInfoKey v27 = object_getClassName(self);
          int v28 = sel_getName(a2);
          *(_DWORD *)uint64_t buf = 67110146;
          unsigned int v45 = v26;
          __int16 v46 = 2082;
          __int16 v47 = v27;
          __int16 v48 = 2082;
          CFStringRef v49 = v28;
          __int16 v50 = 1024;
          int v51 = 1384;
          __int16 v52 = 2112;
          v53 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to trigger recovery (%@)!", buf, 0x2Cu);
        }

        BOOL v29 = NFSharedSignpostLog();
        if (os_signpost_enabled(v29))
        {
          unsigned int v30 = [v18 code];
          *(_DWORD *)uint64_t buf = 67109120;
          unsigned int v45 = v30;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "begin, error.code: %d", buf, 8u);
        }
      }
      else
      {
        [v4 setBool:1 forKey:@"FailForwardInProgress"];
        __int16 v39 = +[NSDate date];
        [v4 setObject:v39 forKey:@"FailForwardLastAttemptTimestamp"];

        self->_failForwardAttemptedAfterFirstUnlock = 1;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        int v32 = (void (*)(uint64_t, const char *, ...))v31;
        __int16 v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        uint64_t v35 = object_getClassName(self);
        os_log_type_t v43 = sel_getName(a2);
        uint64_t v36 = 45;
        if (v34) {
          uint64_t v36 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i delegate not set!", v36, v35, v43, 1377);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v37 = object_getClass(self);
        if (class_isMetaClass(v37)) {
          int v38 = 43;
        }
        else {
          int v38 = 45;
        }
        *(_DWORD *)uint64_t buf = 67109890;
        unsigned int v45 = v38;
        __int16 v46 = 2082;
        __int16 v47 = object_getClassName(self);
        __int16 v48 = 2082;
        CFStringRef v49 = sel_getName(a2);
        __int16 v50 = 1024;
        int v51 = 1377;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set!", buf, 0x22u);
      }
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v7 = NFLogGetLogger();
    if (v7)
    {
      io_object_t v8 = (void (*)(uint64_t, const char *, ...))v7;
      uint64_t v9 = object_getClass(self);
      BOOL v10 = class_isMetaClass(v9);
      unsigned int v11 = object_getClassName(self);
      int v41 = sel_getName(a2);
      uint64_t v12 = 45;
      if (v10) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i skipping Fail Forward - assuming HW not present", v12, v11, v41, 1369);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    WeakRetained = NFSharedLogGetLogger();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)uint64_t buf = 67109890;
      unsigned int v45 = v15;
      __int16 v46 = 2082;
      __int16 v47 = object_getClassName(self);
      __int16 v48 = 2082;
      CFStringRef v49 = sel_getName(a2);
      __int16 v50 = 1024;
      int v51 = 1369;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i skipping Fail Forward - assuming HW not present", buf, 0x22u);
    }
  }
}

- (unint64_t)_openDriver:(BOOL *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ffDelegate);
  uint64_t v7 = &AMFDRSealingMapCopyLocalData_ptr;
  if (self->_driver)
  {
LABEL_2:
    v188[0] = 0;
    [(NFACDriverWrapper *)self getControllerInfo:v188];
    id v8 = v188[0];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v11 = 43;
      }
      else {
        uint64_t v11 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Controller info : %{public}@", v11, ClassName, Name, 1555, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(self);
      id v18 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v16;
      __int16 v204 = 2082;
      *(void *)v205 = v17;
      *(_WORD *)&v205[8] = 2082;
      *(void *)&v205[10] = v18;
      __int16 v206 = 1024;
      int v207 = 1555;
      __int16 v208 = 2114;
      double v209 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Controller info : %{public}@", buf, 0x2Cu);
    }

    id v19 = [(NFACDriverWrapper *)self delegate];
    [v19 handleStackLoad];

    [(NFReaderRestrictor *)self->_readerPolicy stackLoaded:0];
    int v20 = (NSDate *)[objc_alloc((Class)v7[435]) initWithTimeIntervalSinceNow:0.0];
    lastPowerStateQuery = self->_lastPowerStateQuery;
    self->_lastPowerStateQuery = v20;

    NFDriverConfigureAutomaticMultiTagPolling();
    id v22 = [(NFACDriverWrapper *)self setTypeATagDataRate:0];
    unint64_t v23 = 1;
    goto LABEL_170;
  }
  v186 = a3;
  int v187 = MKBDeviceUnlockedSinceBoot();
  id v8 = +[NSDate date];
  int v24 = +[NSUserDefaults standardUserDefaults];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v25 = NFLogGetLogger();
  if (v25)
  {
    int v26 = (void (*)(uint64_t, const char *, ...))v25;
    NSErrorUserInfoKey v27 = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(v27);
    BOOL v29 = object_getClassName(self);
    v184 = sel_getName(a2);
    uint64_t v30 = 45;
    if (isMetaClass) {
      uint64_t v30 = 43;
    }
    v26(6, "%c[%{public}s %{public}s]:%i starting stack", v30, v29, v184, 1404);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v31 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = object_getClass(self);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    *(_DWORD *)uint64_t buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v33;
    __int16 v204 = 2082;
    *(void *)v205 = object_getClassName(self);
    *(_WORD *)&v205[8] = 2082;
    *(void *)&v205[10] = sel_getName(a2);
    __int16 v206 = 1024;
    int v207 = 1404;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i starting stack", buf, 0x22u);
  }

  self->_lastFieldOffTime = 0;
  if (!WeakRetained)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34)
    {
      uint64_t v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        uint64_t v36 = 43;
      }
      else {
        uint64_t v36 = 45;
      }
      __int16 v37 = object_getClassName(self);
      int v38 = sel_getName(a2);
      v34(4, "%c[%{public}s %{public}s]:%i delegate not set!?", v36, v37, v38, 1414);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      unsigned int v42 = object_getClassName(self);
      os_log_type_t v43 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v41;
      __int16 v204 = 2082;
      *(void *)v205 = v42;
      *(_WORD *)&v205[8] = 2082;
      *(void *)&v205[10] = v43;
      __int16 v206 = 1024;
      int v207 = 1414;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set!?", buf, 0x22u);
    }
  }
  if ([WeakRetained getPrimaryHardwareState] == 3)
  {
    uint32_t v44 = [v24 objectForKey:@"FailForwardDetectedTimestamp"];
    if (v44)
    {
      BOOL v45 = v187 == 1;
      [v8 timeIntervalSinceDate:v44];
      double v47 = v46;
      if (v46 <= 600.0) {
        BOOL v45 = 0;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v48 = NFLogGetLogger();
      CFStringRef v49 = (void (*)(uint64_t, const char *, ...))v48;
      if (v45)
      {
        if (v48)
        {
          __int16 v50 = object_getClass(self);
          if (class_isMetaClass(v50)) {
            uint64_t v51 = 43;
          }
          else {
            uint64_t v51 = 45;
          }
          __int16 v52 = object_getClassName(self);
          v53 = sel_getName(a2);
          v49(6, "%c[%{public}s %{public}s]:%i Fail forward still in progress for %f seconds - try again...", v51, v52, v53, 1425, *(void *)&v47);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v54 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v55 = object_getClass(self);
          if (class_isMetaClass(v55)) {
            int v56 = 43;
          }
          else {
            int v56 = 45;
          }
          int v57 = object_getClassName(self);
          __int16 v58 = sel_getName(a2);
          *(_DWORD *)uint64_t buf = 67110146;
          *(_DWORD *)&uint8_t buf[4] = v56;
          __int16 v204 = 2082;
          *(void *)v205 = v57;
          *(_WORD *)&v205[8] = 2082;
          *(void *)&v205[10] = v58;
          __int16 v206 = 1024;
          int v207 = 1425;
          __int16 v208 = 2048;
          double v209 = v47;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Fail forward still in progress for %f seconds - try again...", buf, 0x2Cu);
        }

        goto LABEL_61;
      }
      if (v48)
      {
        v126 = object_getClass(self);
        if (class_isMetaClass(v126)) {
          uint64_t v127 = 43;
        }
        else {
          uint64_t v127 = 45;
        }
        v128 = object_getClassName(self);
        v129 = sel_getName(a2);
        v49(3, "%c[%{public}s %{public}s]:%i Fail forward in progress - bail out...", v127, v128, v129, 1428);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v64 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v130 = object_getClass(self);
        if (class_isMetaClass(v130)) {
          int v131 = 43;
        }
        else {
          int v131 = 45;
        }
        v132 = object_getClassName(self);
        v133 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v131;
        __int16 v204 = 2082;
        *(void *)v205 = v132;
        *(_WORD *)&v205[8] = 2082;
        *(void *)&v205[10] = v133;
        __int16 v206 = 1024;
        int v207 = 1428;
        __int16 v69 = "%c[%{public}s %{public}s]:%i Fail forward in progress - bail out...";
LABEL_144:
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v69, buf, 0x22u);
      }
    }
    else
    {
      if (![WeakRetained isRecoveryInProgress])
      {
LABEL_61:

        goto LABEL_62;
      }
      [v24 setObject:v8 forKey:@"FailForwardDetectedTimestamp"];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      double v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v59)
      {
        __int16 v60 = object_getClass(self);
        if (class_isMetaClass(v60)) {
          uint64_t v61 = 43;
        }
        else {
          uint64_t v61 = 45;
        }
        __int16 v62 = object_getClassName(self);
        unsigned int v63 = sel_getName(a2);
        v59(3, "%c[%{public}s %{public}s]:%i Fail forward detected - bail out...", v61, v62, v63, 1435);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v64 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        __int16 v65 = object_getClass(self);
        if (class_isMetaClass(v65)) {
          int v66 = 43;
        }
        else {
          int v66 = 45;
        }
        __int16 v67 = object_getClassName(self);
        NSErrorUserInfoKey v68 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v66;
        __int16 v204 = 2082;
        *(void *)v205 = v67;
        *(_WORD *)&v205[8] = 2082;
        *(void *)&v205[10] = v68;
        __int16 v206 = 1024;
        int v207 = 1435;
        __int16 v69 = "%c[%{public}s %{public}s]:%i Fail forward detected - bail out...";
        goto LABEL_144;
      }
    }

    goto LABEL_169;
  }
LABEL_62:
  if (![v24 BOOLForKey:@"FailForwardInProgress"]) {
    goto LABEL_91;
  }
  int v70 = [v24 objectForKey:@"FailForwardLastAttemptTimestamp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v71 = v70) == 0)
  {
    if (v187 == 1)
    {
      [v24 removeObjectForKey:@"FailForwardInProgress"];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v85 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v85)
      {
        __int16 v86 = object_getClass(self);
        if (class_isMetaClass(v86)) {
          uint64_t v87 = 43;
        }
        else {
          uint64_t v87 = 45;
        }
        __int16 v88 = object_getClassName(self);
        v89 = sel_getName(a2);
        v85(6, "%c[%{public}s %{public}s]:%i No FF timestamp stored - try again...", v87, v88, v89, 1467);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v80 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        id v90 = object_getClass(self);
        if (class_isMetaClass(v90)) {
          int v91 = 43;
        }
        else {
          int v91 = 45;
        }
        v92 = object_getClassName(self);
        uint64_t v93 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v91;
        __int16 v204 = 2082;
        *(void *)v205 = v92;
        *(_WORD *)&v205[8] = 2082;
        *(void *)&v205[10] = v93;
        __int16 v206 = 1024;
        int v207 = 1467;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No FF timestamp stored - try again...", buf, 0x22u);
      }
      CFStringRef v72 = 0;
      goto LABEL_90;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v144 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v144)
    {
      v145 = object_getClass(self);
      if (class_isMetaClass(v145)) {
        uint64_t v146 = 43;
      }
      else {
        uint64_t v146 = 45;
      }
      v147 = object_getClassName(self);
      v148 = sel_getName(a2);
      v144(4, "%c[%{public}s %{public}s]:%i No FF timestamp stored but device is locked - bail out...", v146, v147, v148, 1470);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v149 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      v150 = object_getClass(self);
      if (class_isMetaClass(v150)) {
        int v151 = 43;
      }
      else {
        int v151 = 45;
      }
      v152 = object_getClassName(self);
      v153 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v151;
      __int16 v204 = 2082;
      *(void *)v205 = v152;
      *(_WORD *)&v205[8] = 2082;
      *(void *)&v205[10] = v153;
      __int16 v206 = 1024;
      int v207 = 1470;
      _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No FF timestamp stored but device is locked - bail out...", buf, 0x22u);
    }
    CFStringRef v72 = 0;
LABEL_168:

    goto LABEL_169;
  }
  CFStringRef v72 = v71;
  [v8 timeIntervalSinceDate:v71];
  double v74 = v73;
  if (v73 <= 86400.0 && self->_failForwardAttemptedAfterFirstUnlock || v187 != 1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v175 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v175)
    {
      v176 = object_getClass(self);
      if (class_isMetaClass(v176)) {
        uint64_t v177 = 43;
      }
      else {
        uint64_t v177 = 45;
      }
      v178 = object_getClassName(self);
      v179 = sel_getName(a2);
      v175(3, "%c[%{public}s %{public}s]:%i Hammerfest recovery in progress - bail out...", v177, v178, v179, 1460);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v149 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      v180 = object_getClass(self);
      if (class_isMetaClass(v180)) {
        int v181 = 43;
      }
      else {
        int v181 = 45;
      }
      v182 = object_getClassName(self);
      v183 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v181;
      __int16 v204 = 2082;
      *(void *)v205 = v182;
      *(_WORD *)&v205[8] = 2082;
      *(void *)&v205[10] = v183;
      __int16 v206 = 1024;
      int v207 = 1460;
      _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hammerfest recovery in progress - bail out...", buf, 0x22u);
    }
    goto LABEL_168;
  }
  [v24 removeObjectForKey:@"FailForwardInProgress"];
  [v24 removeObjectForKey:@"FailForwardLastAttemptTimestamp"];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  long long v75 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v75)
  {
    long long v76 = object_getClass(self);
    if (class_isMetaClass(v76)) {
      uint64_t v77 = 43;
    }
    else {
      uint64_t v77 = 45;
    }
    NSErrorUserInfoKey v78 = object_getClassName(self);
    BOOL v79 = sel_getName(a2);
    v75(6, "%c[%{public}s %{public}s]:%i Still in recovery but last attempt was  %f seconds ago - try again...", v77, v78, v79, 1457, *(void *)&v74);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v80 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    int v81 = object_getClass(self);
    if (class_isMetaClass(v81)) {
      int v82 = 43;
    }
    else {
      int v82 = 45;
    }
    id v83 = object_getClassName(self);
    __int16 v84 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v82;
    __int16 v204 = 2082;
    *(void *)v205 = v83;
    *(_WORD *)&v205[8] = 2082;
    *(void *)&v205[10] = v84;
    __int16 v206 = 1024;
    int v207 = 1457;
    __int16 v208 = 2048;
    double v209 = v74;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Still in recovery but last attempt was  %f seconds ago - try again...", buf, 0x2Cu);
  }
LABEL_90:

LABEL_91:
  if (![v24 BOOLForKey:@"FailForwardNeeded"]
    || ([v24 BOOLForKey:@"FailForwardInProgress"] & 1) != 0)
  {
    [v24 removeObjectForKey:@"FailForwardDetectedTimestamp"];
    v94 = NFSharedSignpostLog();
    if (os_signpost_enabled(v94))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v94, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", (const char *)&unk_100286819, buf, 2u);
    }

    *(void *)&v205[6] = 0;
    [(NFACDriverWrapper *)self _getDriverConfig:buf];
    char v190 = 1;
    v95 = (_NFDriver *)NFDriverOpen();
    self->_driver = v95;
    if (!v95)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v117 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v117)
      {
        v118 = object_getClass(self);
        if (class_isMetaClass(v118)) {
          uint64_t v119 = 43;
        }
        else {
          uint64_t v119 = 45;
        }
        v120 = object_getClassName(self);
        v121 = sel_getName(a2);
        v117(3, "%c[%{public}s %{public}s]:%i Failed to open device: %s", v119, v120, v121, 1493, *(void *)buf);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v122 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        v123 = object_getClass(self);
        if (class_isMetaClass(v123)) {
          int v124 = 43;
        }
        else {
          int v124 = 45;
        }
        *(_DWORD *)v193 = 67110146;
        int v194 = v124;
        __int16 v195 = 2082;
        v196 = object_getClassName(self);
        __int16 v197 = 2082;
        v198 = sel_getName(a2);
        __int16 v199 = 1024;
        int v200 = 1493;
        __int16 v201 = 2080;
        uint64_t v202 = *(void *)buf;
        _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open device: %s", v193, 0x2Cu);
      }

      v125 = NFSharedSignpostLog();
      if (os_signpost_enabled(v125))
      {
        *(_WORD *)v193 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", (const char *)&unk_100286819, v193, 2u);
      }

      if (v190) {
        unint64_t v23 = 2;
      }
      else {
        unint64_t v23 = 3;
      }
      LODWORD(Stack) = 1;
LABEL_197:

      uint64_t v7 = &AMFDRSealingMapCopyLocalData_ptr;
      if (Stack) {
        goto LABEL_171;
      }
      goto LABEL_2;
    }
    [(NFACDriverWrapper *)self setDriverCallbacks];
    v96 = NFSharedSignpostLog();
    if (os_signpost_enabled(v96))
    {
      *(_WORD *)v193 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v96, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", (const char *)&unk_100286819, v193, 2u);
    }

    NSErrorUserInfoKey v97 = NFSharedSignpostLog();
    if (os_signpost_enabled(v97))
    {
      *(_WORD *)v193 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LoadStack", (const char *)&unk_100286819, v193, 2u);
    }

    v185 = +[NFCALogger sharedCALogger];
    id v98 = [v185 getTimestamp];
    uint64_t Stack = NFDriverLoadStack();
    id v100 = [v185 getDurationFrom:v98];
    __int16 v101 = NFSharedSignpostLog();
    if (os_signpost_enabled(v101))
    {
      *(_WORD *)v193 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LoadStack", (const char *)&unk_100286819, v193, 2u);
    }

    memset(&v188[1], 0, 24);
    int v189 = 0;
    NFDriverGetControllerInfo();
    id v102 = [v185 getHardwareTypeForCA:0];
    __int16 v103 = sub_1002090CC();
    sub_1002093BC((uint64_t)v103, (uint64_t)v100, Stack, (uint64_t)v102, v187 == 1);

    if (Stack <= 0x11)
    {
      if (((1 << Stack) & 0x34004) != 0)
      {
        NFDriverClose();
        self->_driver = 0;
        [v24 setBool:1 forKey:@"FailForwardNeeded"];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (v187 == 1)
        {
          int v104 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v104)
          {
            __int16 v105 = object_getClass(self);
            if (class_isMetaClass(v105)) {
              uint64_t v106 = 43;
            }
            else {
              uint64_t v106 = 45;
            }
            __int16 v107 = object_getClassName(self);
            int v108 = sel_getName(a2);
            v104(3, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; recovery triggered",
              v106,
              v107,
              v108,
              1529,
              Stack);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v109 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          {
            id v110 = object_getClass(self);
            if (class_isMetaClass(v110)) {
              int v111 = 43;
            }
            else {
              int v111 = 45;
            }
            v112 = object_getClassName(self);
            v113 = sel_getName(a2);
            *(_DWORD *)v193 = 67110146;
            int v194 = v111;
            __int16 v195 = 2082;
            v196 = v112;
            __int16 v197 = 2082;
            v198 = v113;
            __int16 v199 = 1024;
            int v200 = 1529;
            __int16 v201 = 1024;
            LODWORD(v202) = Stack;
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; recovery triggered",
              v193,
              0x28u);
          }

          v114 = +[NSString stringWithFormat:@"%du", Stack];
          v191[0] = @"FailureKey";
          v191[1] = @"Result";
          v192[0] = @"ttrFury";
          v115 = +[NSNumber numberWithUnsignedInt:Stack];
          v192[1] = v115;
          v116 = +[NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:2];
          sub_100199334((uint64_t)NFBugCapture, @"Failed to start stack; FailForward triggered",
            v114,
            v116);

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v193 = 67240192;
            int v194 = Stack;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to start stack; FailForward triggered (result=%{public}du)",
              v193,
              8u);
          }
          BOOL *v186 = 1;
        }
        else
        {
          v155 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v155)
          {
            v156 = object_getClass(self);
            if (class_isMetaClass(v156)) {
              uint64_t v157 = 43;
            }
            else {
              uint64_t v157 = 45;
            }
            v158 = object_getClassName(self);
            v159 = sel_getName(a2);
            v155(3, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; but not unlocked yet - postpone",
              v157,
              v158,
              v159,
              1539,
              Stack);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v160 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
          {
            v161 = object_getClass(self);
            if (class_isMetaClass(v161)) {
              int v162 = 43;
            }
            else {
              int v162 = 45;
            }
            v163 = object_getClassName(self);
            v164 = sel_getName(a2);
            *(_DWORD *)v193 = 67110146;
            int v194 = v162;
            __int16 v195 = 2082;
            v196 = v163;
            __int16 v197 = 2082;
            v198 = v164;
            __int16 v199 = 1024;
            int v200 = 1539;
            __int16 v201 = 1024;
            LODWORD(v202) = Stack;
            _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; but not unlocked yet - postpone",
              v193,
              0x28u);
          }
        }
LABEL_195:
        LODWORD(Stack) = 1;
        goto LABEL_196;
      }
      if (!Stack)
      {
LABEL_196:

        unint64_t v23 = 2;
        goto LABEL_197;
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v165 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v165)
    {
      v166 = object_getClass(self);
      if (class_isMetaClass(v166)) {
        uint64_t v167 = 43;
      }
      else {
        uint64_t v167 = 45;
      }
      v168 = object_getClassName(self);
      v169 = sel_getName(a2);
      v165(3, "%c[%{public}s %{public}s]:%i Failed to start stack : %d", v167, v168, v169, 1545, Stack);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v170 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      v171 = object_getClass(self);
      if (class_isMetaClass(v171)) {
        int v172 = 43;
      }
      else {
        int v172 = 45;
      }
      v173 = object_getClassName(self);
      v174 = sel_getName(a2);
      *(_DWORD *)v193 = 67110146;
      int v194 = v172;
      __int16 v195 = 2082;
      v196 = v173;
      __int16 v197 = 2082;
      v198 = v174;
      __int16 v199 = 1024;
      int v200 = 1545;
      __int16 v201 = 1024;
      LODWORD(v202) = Stack;
      _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack : %d", v193, 0x28u);
    }

    NFDriverClose();
    self->_driver = 0;
    goto LABEL_195;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v134 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v134)
  {
    v135 = object_getClass(self);
    if (class_isMetaClass(v135)) {
      uint64_t v136 = 43;
    }
    else {
      uint64_t v136 = 45;
    }
    v137 = object_getClassName(self);
    v138 = sel_getName(a2);
    v134(4, "%c[%{public}s %{public}s]:%i HW in bad state but recovery is not triggered - trigger it now", v136, v137, v138, 1476);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v139 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
  {
    v140 = object_getClass(self);
    if (class_isMetaClass(v140)) {
      int v141 = 43;
    }
    else {
      int v141 = 45;
    }
    v142 = object_getClassName(self);
    v143 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v141;
    __int16 v204 = 2082;
    *(void *)v205 = v142;
    *(_WORD *)&v205[8] = 2082;
    *(void *)&v205[10] = v143;
    __int16 v206 = 1024;
    int v207 = 1476;
    _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HW in bad state but recovery is not triggered - trigger it now", buf, 0x22u);
  }

  BOOL *v186 = 1;
LABEL_169:

  unint64_t v23 = 2;
LABEL_170:

LABEL_171:
  return v23;
}

- (void)setPowerConsumptionMonitor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NFThermalMonitor *)sub_100077710((id *)[NFThermalMonitor alloc], v4);

  thermalMonitor = self->_thermalMonitor;
  self->_thermalMonitor = v5;

  uint64_t v7 = [[NFLastOneReaderRestrictor alloc] initWithThermalMonitor:self->_thermalMonitor delegate:self];
  readerPolicy = self->_readerPolicy;
  self->_readerPolicy = &v7->super;

  _objc_release_x1(v7, readerPolicy);
}

- (void)_closeDriverAndLeaveHWEnabled:(BOOL)a3
{
  if (self->_driver)
  {
    BOOL v3 = a3;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i stopping stack; leaveHWOn=%d", v10, ClassName, Name, 1585, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)uint64_t buf = 67110146;
      int v21 = v13;
      __int16 v22 = 2082;
      unint64_t v23 = object_getClassName(self);
      __int16 v24 = 2082;
      uint64_t v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 1585;
      __int16 v28 = 1024;
      BOOL v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i stopping stack; leaveHWOn=%d",
        buf,
        0x28u);
    }

    if (!v3) {
      [(NFACDriverWrapper *)self _writeSMCMultiTagEnabled:0];
    }
    uint64_t v14 = [(NFACDriverWrapper *)self delegate];
    [v14 handleStackUnload];

    [(NFReaderRestrictor *)self->_readerPolicy stackUnloaded];
    readerPolicy = self->_readerPolicy;
    self->_readerPolicy = 0;

    thermalMonitor = self->_thermalMonitor;
    self->_thermalMonitor = 0;

    NFDriverUnloadStackAndLeaveHWEnabled();
    NFDriverClose();
    self->_driver = 0;
    lastPowerStateQuery = self->_lastPowerStateQuery;
    self->_lastPowerStateQuery = 0;
  }
}

- (id)_internalTagFromMultiTag:(_NFDriverRemoteTag *)a3
{
  if (a3 && a3->var4)
  {
    id v6 = objc_alloc_init((Class)NFTagInternal);
    id v7 = [objc_alloc((Class)NSData) initWithBytes:a3->var3 length:a3->var4];
    [v6 _setIdentifier:v7];
    switch(a3->var1)
    {
      case 1:
        [v6 _setTechnology:1];
        id v8 = v6;
        uint64_t v9 = 1;
        goto LABEL_13;
      case 2:
        [v6 _setTechnology:2];
        id v8 = v6;
        uint64_t v9 = 4;
        goto LABEL_13;
      case 3:
        [v6 _setTechnology:4];
        id v8 = v6;
        uint64_t v9 = 7;
        goto LABEL_13;
      case 4:
        [v6 _setTechnology:1];
        id v8 = v6;
        uint64_t v9 = 9;
        goto LABEL_13;
      case 5:
        [v6 _setTechnology:16];
        id v8 = v6;
        uint64_t v9 = 8;
        goto LABEL_13;
      case 6:
        [v6 _setTechnology:1];
        id v8 = v6;
        uint64_t v9 = 11;
        goto LABEL_13;
      case 7:
        [v6 _setTechnology:1];
        id v8 = v6;
        uint64_t v9 = 12;
        goto LABEL_13;
      case 9:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
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
          v11(6, "%c[%{public}s %{public}s]:%i Found silent tag", v15, ClassName, Name, 1651);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v16 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = object_getClass(self);
          if (class_isMetaClass(v17)) {
            int v18 = 43;
          }
          else {
            int v18 = 45;
          }
          *(_DWORD *)uint64_t buf = 67109890;
          int v44 = v18;
          __int16 v45 = 2082;
          double v46 = object_getClassName(self);
          __int16 v47 = 2082;
          uint64_t v48 = sel_getName(a2);
          __int16 v49 = 1024;
          int v50 = 1651;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent tag", buf, 0x22u);
        }

        [v6 _setTechnology:1];
        [v6 _setType:3];
        id v19 = v6;
        uint64_t v20 = 1;
        goto LABEL_44;
      case 0xA:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v21 = NFLogGetLogger();
        if (v21)
        {
          __int16 v22 = (void (*)(uint64_t, const char *, ...))v21;
          unint64_t v23 = object_getClass(self);
          BOOL v24 = class_isMetaClass(v23);
          uint64_t v25 = object_getClassName(self);
          int v41 = sel_getName(a2);
          uint64_t v26 = 45;
          if (v24) {
            uint64_t v26 = 43;
          }
          v22(6, "%c[%{public}s %{public}s]:%i Found silent A2 tag", v26, v25, v41, 1657);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v27 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = object_getClass(self);
          if (class_isMetaClass(v28)) {
            int v29 = 43;
          }
          else {
            int v29 = 45;
          }
          *(_DWORD *)uint64_t buf = 67109890;
          int v44 = v29;
          __int16 v45 = 2082;
          double v46 = object_getClassName(self);
          __int16 v47 = 2082;
          uint64_t v48 = sel_getName(a2);
          __int16 v49 = 1024;
          int v50 = 1657;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A2 tag", buf, 0x22u);
        }

        [v6 _setTechnology:1];
        [v6 _setType:3];
        id v19 = v6;
        uint64_t v20 = 2;
        goto LABEL_44;
      case 0xB:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v30 = NFLogGetLogger();
        if (v30)
        {
          uint64_t v31 = (void (*)(uint64_t, const char *, ...))v30;
          int v32 = object_getClass(self);
          BOOL v33 = class_isMetaClass(v32);
          BOOL v34 = object_getClassName(self);
          unsigned int v42 = sel_getName(a2);
          uint64_t v35 = 45;
          if (v33) {
            uint64_t v35 = 43;
          }
          v31(6, "%c[%{public}s %{public}s]:%i Found silent A3 tag", v35, v34, v42, 1663);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v36 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v37 = object_getClass(self);
          if (class_isMetaClass(v37)) {
            int v38 = 43;
          }
          else {
            int v38 = 45;
          }
          *(_DWORD *)uint64_t buf = 67109890;
          int v44 = v38;
          __int16 v45 = 2082;
          double v46 = object_getClassName(self);
          __int16 v47 = 2082;
          uint64_t v48 = sel_getName(a2);
          __int16 v49 = 1024;
          int v50 = 1663;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A3 tag", buf, 0x22u);
        }

        [v6 _setTechnology:1];
        [v6 _setType:3];
        id v19 = v6;
        uint64_t v20 = 3;
LABEL_44:
        [v19 _setSilentType:v20];
        break;
      default:
        [v6 _setTechnology:0];
        id v8 = v6;
        uint64_t v9 = 0;
LABEL_13:
        [v8 _setType:v9];
        break;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)driverDidDetectMultiTagStateChange:(_NFDriverMultiTagStateInfo *)a3 rfError:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 1680);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)uint64_t buf = 67109890;
    int v24 = v16;
    __int16 v25 = 2082;
    uint64_t v26 = object_getClassName(self);
    __int16 v27 = 2082;
    __int16 v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 1680;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  [(NSMutableArray *)self->_multiTagState removeAllObjects];
  uint64_t v17 = 0;
  char v18 = 1;
  do
  {
    char v19 = v18;
    uint64_t v20 = [(NFACDriverWrapper *)self _internalTagFromMultiTag:&a3->var1[v17]];
    if (v20) {
      [(NSMutableArray *)self->_multiTagState addObject:v20];
    }

    char v18 = 0;
    uint64_t v17 = 1;
  }
  while ((v19 & 1) != 0);
  uint64_t v21 = [(NFACDriverWrapper *)self delegate];
  [v21 handleMultiTagStateChanged:self->_multiTagState rfError:v4];
}

- (void)handleReaderBurnoutTimer
{
  id v2 = [(NFACDriverWrapper *)self delegate];
  [v2 handleReaderBurnoutTimer];
}

- (void)handleReaderBurnoutCleared
{
  BOOL v3 = [(NFACDriverWrapper *)self delegate];
  [v3 handleReaderBurnoutCleared];

  [(NFACDriverWrapper *)self closeSession:@"Cooloff"];
}

- (NFACDriverWrapperDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NFACDriverWrapperDelegate *)a3;
}

- (BOOL)fieldPresent
{
  return self->_fieldPresent;
}

- (NFRoutingConfig)currentRouting
{
  return (NFRoutingConfig *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ffDelegate);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_readerPolicy, 0);
  objc_storeStrong((id *)&self->_lastPowerStateQuery, 0);
  objc_storeStrong((id *)&self->_multiTagState, 0);
  objc_storeStrong((id *)&self->_remoteTags, 0);
  objc_storeStrong((id *)&self->_currentRouting, 0);

  objc_storeStrong((id *)&self->_sessionOwners, 0);
}

@end