@interface NIServerAcwgSession
- (BOOL)_validateLockAttributes;
- (JobConfig)_aopJobConfigWithTimeouts;
- (NIAcwgConfiguration)configuration;
- (NIServerAcwgSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NIServerNumberResponse)isRangingLimitExceeded;
- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_configureForOwnerDevice;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)_setURSKTTL:(unint64_t)a3;
- (id)configure;
- (id)deleteURSKs;
- (id)disableAllServices;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7;
- (id)run;
- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3;
- (unint64_t)requiresUWBToRun;
- (void)_alishaSessionInvalidatedWithReason:(int)a3;
- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4;
- (void)_handleHealthChanged:(int)a3;
- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3;
- (void)_handleSessionStats:(SessionStats *)a3;
- (void)_handleTimeoutEvent:(int)a3 time:(double)a4;
- (void)_sendAnalyticsOnRangingComplete:(int64_t)a3 suspendReason:(int64_t)a4;
- (void)dealloc;
- (void)didReceiveAopSensorFusionUpdate:(int)a3 withBtConnHandle:(unsigned __int16)a4;
- (void)invalidate;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processUpdatedLockState:(unsigned __int16)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
@end

@implementation NIServerAcwgSession

- (NIServerAcwgSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A4D4(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  uint64_t v19 = objc_opt_class();
  if (v19 != objc_opt_class())
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"NIServerAcwgSession.mm" lineNumber:331 description:@"NIServerAcwgSession given invalid configuration."];
  }
  v20 = [v9 serverSessionIdentifier];
  BOOL v21 = v20 == 0;

  if (v21)
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"NIServerAcwgSession.mm", 332, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v22 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-acwg,initWithResourcesManager. Configuration: %@", buf, 0xCu);
  }
  v35.receiver = self;
  v35.super_class = (Class)NIServerAcwgSession;
  id v23 = [(NIServerBaseSession *)&v35 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v23)
  {
    uint64_t v24 = [v9 clientConnectionQueue];
    v25 = (void *)*((void *)v23 + 6);
    *((void *)v23 + 6) = v24;

    id v26 = [v10 copy];
    v27 = (void *)*((void *)v23 + 42);
    *((void *)v23 + 42) = v26;

    v28 = [v9 serverSessionIdentifier];
    uint64_t v29 = [v28 UUIDString];
    v30 = (void *)*((void *)v23 + 7);
    *((void *)v23 + 7) = v29;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v23 + 6), "com.apple.nearbyd.acwg-session.queue-context-key", *((void **)v23 + 7), 0);
    id v31 = v23;
  }

  return (NIServerAcwgSession *)v23;
}

- (id)lastConfiguration
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A54C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  configuration = self->_configuration;

  return configuration;
}

- (void)invalidate
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A5C4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  *(void *)buf = 105;
  sub_1001D0C38(&self->_suspendReasonStack.c.__map_.__first_, buf);
  v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,invalidate.", buf, 2u);
  }
  id v12 = [(NIServerAcwgSession *)self disableAllServices];
  v13.receiver = self;
  v13.super_class = (Class)NIServerAcwgSession;
  [(NIServerBaseSession *)&v13 invalidate];
}

- (id)disableAllServices
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A63C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,disableAllServices.", buf, 2u);
  }
  v23.receiver = self;
  v23.super_class = (Class)NIServerAcwgSession;
  id v12 = [(NIServerBaseSession *)&v23 disableAllServices];
  ptr = self->_acwgManager.__ptr_;
  if (ptr)
  {
    sub_1003379CC(ptr);
    cntrl = (std::__shared_weak_count *)self->_acwgManager.__cntrl_;
    self->_acwgManager.__ptr_ = 0;
    self->_acwgManager.__cntrl_ = 0;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  p_uwbSystemListener = &self->_uwbSystemListener;
  if (self->_uwbSystemListener.__ptr_)
  {
    uint64_t v16 = sub_1002F6464();
    uint64_t v17 = self->_uwbSystemListener.__cntrl_;
    BOOL v21 = p_uwbSystemListener->__ptr_;
    v22 = (std::__shared_weak_count *)v17;
    if (v17) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v17 + 1, 1uLL, memory_order_relaxed);
    }
    sub_1002FA594((uint64_t)v16, (unint64_t *)&v21);
    if (v22) {
      sub_10001A970(v22);
    }
    uint64_t v18 = (std::__shared_weak_count *)self->_uwbSystemListener.__cntrl_;
    p_uwbSystemListener->__ptr_ = 0;
    self->_uwbSystemListener.__cntrl_ = 0;
    if (v18) {
      sub_10001A970(v18);
    }
  }
  uint64_t v19 = sub_1002F6464();
  sub_1002F66D0((uint64_t)v19, 2, self->_lockBtConnHandle);

  return v12;
}

- (void)dealloc
{
  p_uwbSystemListener = (unint64_t *)&self->_uwbSystemListener;
  if (self->_uwbSystemListener.__ptr_)
  {
    uint64_t v4 = sub_1002F6464();
    uint64_t v5 = (std::__shared_weak_count *)p_uwbSystemListener[1];
    unint64_t v8 = *p_uwbSystemListener;
    uint64_t v9 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_1002FA594((uint64_t)v4, &v8);
    if (v9) {
      sub_10001A970(v9);
    }
    uint64_t v6 = (std::__shared_weak_count *)p_uwbSystemListener[1];
    unint64_t *p_uwbSystemListener = 0;
    p_uwbSystemListener[1] = 0;
    if (v6) {
      sub_10001A970(v6);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NIServerAcwgSession;
  [(NIServerAcwgSession *)&v7 dealloc];
}

- (duration<long)nominalCycleRate
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A6B4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return (duration<long long, std::ratio<1, 1000>>)3000;
}

- (unint64_t)requiresUWBToRun
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A72C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 2;
}

- (BOOL)_validateLockAttributes
{
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A80C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = [(NIAcwgConfiguration *)self->_configuration lockIdentifier];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041A7A4();
    }
    return 0;
  }
  else
  {
    id v13 = objc_alloc((Class)NSUUID);
    uint64_t v14 = [(NIAcwgConfiguration *)self->_configuration lockIdentifier];
    id v15 = [v13 initWithUUIDString:v14];

    BOOL v16 = v15 != 0;
    if (v15)
    {
      unsigned int v17 = [(NIAcwgConfiguration *)self->_configuration lockBtConnHandle];
      self->_int lockBtConnHandle = v17;
      if (v17 == 0xFFFF)
      {
        uint64_t v18 = [(NIAcwgConfiguration *)self->_configuration lockIdentifier];
        uint64_t v19 = [v18 substringToIndex:2];

        *(_DWORD *)buf = 0;
        v20 = +[NSScanner scannerWithString:v19];
        [v20 scanHexInt:buf];

        self->_int lockBtConnHandle = *(_WORD *)buf;
        BOOL v21 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-acwg,lockBtConnHandle not valid... extracting it from lockIdentifier", v25, 2u);
        }
      }
      v22 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int lockBtConnHandle = self->_lockBtConnHandle;
        *(_DWORD *)buf = 67109120;
        int v27 = lockBtConnHandle;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-acwg,int lockBtConnHandle = 0x%04x", buf, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041A7D8();
    }
  }
  return v16;
}

- (id)configure
{
  v52 = self;
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A9A0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)v52->_clientQueue);
  if (!v52->_configuration) {
    sub_10041A884();
  }
  uint64_t v10 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-acwg,configure", buf, 2u);
  }
  if ([(NIServerAcwgSession *)v52 _validateLockAttributes])
  {
    p_alishaSystem = &v52->_alishaSystem;
    if (!v52->_alishaSystem.__ptr_)
    {
      BOOL v12 = operator new(0x20uLL);
      v12[1] = 0;
      v12[2] = 0;
      *BOOL v12 = off_100857AF8;
      v12[3] = off_10085EFA8;
      cntrl = (std::__shared_weak_count *)p_alishaSystem->__cntrl_;
      p_alishaSystem->__ptr_ = (AlishaSubsystem *)(v12 + 3);
      p_alishaSystem->__cntrl_ = (__shared_weak_count *)v12;
      if (cntrl) {
        sub_10001A970(cntrl);
      }
    }
    if (!v52->_uwbSystemListener.__ptr_)
    {
      sub_1001D1074(&v52, buf);
      shared_ptr<PRRangingManagerClient> v14 = *(shared_ptr<PRRangingManagerClient> *)buf;
      memset(buf, 0, sizeof(buf));
      id v15 = (std::__shared_weak_count *)v52->_uwbSystemListener.__cntrl_;
      v52->_uwbSystemListener = v14;
      if (v15) {
        sub_10001A970(v15);
      }
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
      BOOL v16 = sub_1002F6464();
      ptr = v52->_uwbSystemListener.__ptr_;
      unsigned int v17 = (std::__shared_weak_count *)v52->_uwbSystemListener.__cntrl_;
      v51 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1002FA4B8((uint64_t)v16, (unint64_t *)&ptr);
      if (v51) {
        sub_10001A970(v51);
      }
      uint64_t v18 = sub_1002F6464();
      v48 = v52->_uwbSystemListener.__ptr_;
      uint64_t v19 = (std::__shared_weak_count *)v52->_uwbSystemListener.__cntrl_;
      v49 = v19;
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1002F6B1C((uint64_t)v18, (uint64_t *)&v48);
      if (v49) {
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    sub_1002DC17C((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v20 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041A8B0(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      CFStringRef v54 = @"Failed to query device capabilities.";
      v28 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v29 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v28];

      goto LABEL_40;
    }
    if (v47)
    {
      v39 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if (!v47) {
          sub_10000AE44();
        }
        sub_100330480(&buf[8]);
        if (v45 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = __p;
        }
        *(_DWORD *)v55 = 136315138;
        v56 = p_p;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Acwg Capabilities: %s", v55, 0xCu);
        if (v45 < 0) {
          operator delete(__p);
        }
      }

      sub_1001D08D4((uint64_t)&v52->_cachedCapabilities, (uint64_t)&buf[8]);
      if ((id)[(NIAcwgConfiguration *)v52->_configuration configurationType] == (id)1)
      {
        uint64_t v29 = [(NIServerAcwgSession *)v52 _configureForOwnerDevice];
LABEL_40:
        sub_1001D0BEC((uint64_t)&buf[8]);
        goto LABEL_41;
      }
      v42 = "_configuration.configurationType == _NIAcwgConfigurationTypeOwner";
      int v43 = 497;
    }
    else
    {
      v42 = "response.payload.has_value()";
      int v43 = 485;
    }
    __assert_rtn("-[NIServerAcwgSession configure]", "NIServerAcwgSession.mm", v43, v42);
  }
  v30 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041A928(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
  CFStringRef v58 = @"Lock identifier nil or invalid.";
  v38 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  uint64_t v29 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v38];

LABEL_41:

  return v29;
}

- (id)run
{
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AAB4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,run owner session", buf, 2u);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041AA18();
    }
    v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      __int16 v24 = 1024;
      int v25 = 506;
      __int16 v26 = 2080;
      uint64_t v27 = "-[NIServerAcwgSession run]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  int v13 = sub_100337BC8((uint64_t)ptr);
  if (v13)
  {
    sub_100333FC8(v13, buf);
    if (SBYTE3(v27) >= 0) {
      shared_ptr<PRRangingManagerClient> v14 = buf;
    }
    else {
      shared_ptr<PRRangingManagerClient> v14 = *(unsigned char **)buf;
    }
    id v15 = +[NSString stringWithFormat:@"Failed to run NI Acwg owner session (%s)", v14];
    if (SBYTE3(v27) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v22 = v15;
    BOOL v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    unsigned int v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v16];
  }
  else
  {
    uint64_t v18 = sub_1002F6464();
    sub_1002F66D0((uint64_t)v18, 1, self->_lockBtConnHandle);
    unsigned int v17 = 0;
  }

  return v17;
}

- (id)pauseWithSource:(int64_t)a3
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AB94(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  int v13 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    shared_ptr<PRRangingManagerClient> v14 = sub_1002B807C(a3);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,pause owner session: %@", buf, 0xCu);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AB2C();
    }
    goto LABEL_31;
  }
  uint64_t v26 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v16 = 107;
      goto LABEL_18;
    case 2:
      uint64_t v16 = 104;
LABEL_18:
      uint64_t v26 = v16;
      break;
    case 0:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041AB60();
      }
      id v15 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        __int16 v30 = 1024;
        int v31 = 541;
        __int16 v32 = 2080;
        uint64_t v33 = "-[NIServerAcwgSession pauseWithSource:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
  }
  sub_1001D0C38(&self->_suspendReasonStack.c.__map_.__first_, &v26);
  int v17 = sub_10033806C((uint64_t)self->_acwgManager.__ptr_);
  int v18 = v17;
  if (!v17)
  {
LABEL_31:
    __int16 v24 = 0;
    goto LABEL_32;
  }
  sub_100338A50(v17, buf);
  if (SBYTE3(v33) >= 0) {
    uint64_t v19 = buf;
  }
  else {
    uint64_t v19 = *(unsigned char **)buf;
  }
  v20 = +[NSString stringWithFormat:@"Failed to stop ranging when pausing NI ACWG session (%s)", v19, v26];
  if (SBYTE3(v33) < 0) {
    operator delete(*(void **)buf);
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041AA4C();
  }
  NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
  v28 = v20;
  NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v22 = (v18 + 103);
  if (v22 >= 4) {
    uint64_t v23 = -5887;
  }
  else {
    uint64_t v23 = v22 - 19703;
  }
  __int16 v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v23 userInfo:v21];

LABEL_32:

  return v24;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v38 = a4;
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AC74(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  id v15 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = NIAcwgSessionTriggerReasonToString(v38);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgM1Msg:%@ triggerReason:%@", buf, 0x16u);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041AC0C();
    }
    int v31 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 571;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  p_sessionReasonStack = &self->_sessionReasonStack;
  sub_1001D1148(&self->_sessionReasonStack.c.__map_.__first_, &v38);
  ptr = self->_acwgManager.__ptr_;
  if (v6)
  {
    [v6 toStruct];
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  sub_1003383EC((uint64_t)ptr, (uint64_t)buf, (uint64_t)&v34);
  if (*(void *)&buf[24])
  {
    *(void *)&long long v42 = *(void *)&buf[24];
    operator delete(*(void **)&buf[24]);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  v33.receiver = self;
  v33.super_class = (Class)NIServerAcwgSession;
  uint64_t v19 = [(NIServerBaseSession *)&v33 resourcesManager];
  int v20 = v34;
  if (v34 || !v37)
  {
    sub_100338A50(v34, buf);
    if ((buf[23] & 0x80u) == 0) {
      __int16 v24 = buf;
    }
    else {
      __int16 v24 = *(uint8_t **)buf;
    }
    NSErrorUserInfoKey v21 = +[NSString stringWithFormat:@"process M1 msg failed (%s)", v24];
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    v40 = v21;
    int v25 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v26 = (v20 + 103);
    if (v26 >= 4) {
      uint64_t v27 = -5887;
    }
    else {
      uint64_t v27 = v26 - 19703;
    }
    v28 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v27 userInfo:v25];

    uint64_t v29 = [v19 remote];
    [v29 didProcessAcwgM1MsgWithResponse:0 error:v28];

    unint64_t value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041AC40();
      }
      __int16 v32 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 598;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_1001D14E8(p_sessionReasonStack, 1);
  }
  else
  {
    NSErrorUserInfoKey v21 = +[NIAcwgM2Msg fromStruct:](NIAcwgM2Msg, "fromStruct:", v35, v36);
    uint64_t v22 = [v19 remote];
    [v22 didProcessAcwgM1MsgWithResponse:v21 error:0];

    uint64_t v23 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG M1 processing succeeded and generated M2: %@", buf, 0xCu);
    }
  }
}

- (void)processAcwgM3Msg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AD20(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)char v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgM3Msg:%@", buf, 0xCu);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041ACEC();
    }
    v28 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)char v37 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = 609;
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "-[NIServerAcwgSession processAcwgM3Msg:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v31.receiver = self;
  v31.super_class = (Class)NIServerAcwgSession;
  uint64_t v14 = [(NIServerBaseSession *)&v31 resourcesManager];
  ptr = self->_acwgManager.__ptr_;
  *(void *)int v34 = [v4 toStruct];
  *(_DWORD *)&v34[8] = v16;
  sub_1003385D8((uint64_t)ptr, (uint64_t)v34, (uint64_t)buf);
  int v17 = *(_DWORD *)buf;
  if (*(_DWORD *)buf || !v38)
  {
    sub_100338A50(*(int *)buf, v34);
    if (v35 >= 0) {
      NSErrorUserInfoKey v21 = v34;
    }
    else {
      NSErrorUserInfoKey v21 = *(unsigned char **)v34;
    }
    int v18 = +[NSString stringWithFormat:@"process M3 failed (%s)", v21];
    if (v35 < 0) {
      operator delete(*(void **)v34);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    objc_super v33 = v18;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v23 = (v17 + 103);
    if (v23 >= 4) {
      uint64_t v24 = -5887;
    }
    else {
      uint64_t v24 = v23 - 19703;
    }
    int v25 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v24 userInfo:v22];

    uint64_t v26 = [v14 remote];
    [v26 didProcessAcwgM3MsgWithResponse:0 error:v25];

    unint64_t value = self->_sessionReasonStack.c.__size_.__value_;
    if (value)
    {
      self->_sessionReasonStack.c.__size_.__value_ = value - 1;
      sub_1001D14E8(&self->_sessionReasonStack.c.__map_.__first_, 1);
    }
  }
  else
  {
    long long v29 = *(_OWORD *)&v37[4];
    uint64_t v30 = *(void *)&v37[20];
    int v18 = +[NIAcwgM4Msg fromStruct:&v29];
    uint64_t v19 = [v14 remote];
    [v19 didProcessAcwgM3MsgWithResponse:v18 error:0];

    int v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v34 = 138412290;
      *(void *)&v34[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG M3 processing succeeded and generated M4: %@", v34, 0xCu);
    }
  }
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v29 = a4;
  uint64_t v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AE00(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NIAcwgSuspendTriggerReasonToString(v29);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-acwg,suspendAcwgRanging:%u triggerReason:%@", buf, 0x12u);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041AD98();
    }
    uint64_t v27 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 648;
      __int16 v33 = 2080;
      int v34 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  sub_1001D0C38(&self->_suspendReasonStack.c.__map_.__first_, &v29);
  if ((unint64_t)(v29 - 100) <= 7)
  {
    if (((1 << (v29 - 100)) & 0x8F) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041ADCC();
      }
      int v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 657;
        __int16 v33 = 2080;
        int v34 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    goto LABEL_14;
  }
  if ((unint64_t)(v29 - 200) < 2)
  {
LABEL_14:
    int v17 = sub_10033806C((uint64_t)self->_acwgManager.__ptr_);
    goto LABEL_15;
  }
  int v17 = -100;
LABEL_15:
  v28.receiver = self;
  v28.super_class = (Class)NIServerAcwgSession;
  int v18 = [(NIServerBaseSession *)&v28 resourcesManager];
  if (v17)
  {
    sub_100338A50(v17, buf);
    if (SBYTE3(v34) >= 0) {
      uint64_t v19 = buf;
    }
    else {
      uint64_t v19 = *(unsigned char **)buf;
    }
    int v20 = +[NSString stringWithFormat:@"Supending ACWG Ranging failed (%s)", v19];
    if (SBYTE3(v34) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    objc_super v31 = v20;
    NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v22 = (v17 + 103);
    if (v22 >= 4) {
      uint64_t v23 = -5887;
    }
    else {
      uint64_t v23 = v22 - 19703;
    }
    uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v23 userInfo:v21];

    int v25 = [v18 remote];
    [v25 uwbSessionDidFailWithError:v24];
  }
  else
  {
    uint64_t v26 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG suspend processing succeeded", buf, 2u);
    }
  }
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AEE0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  id v15 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = NIAcwgSessionTriggerReasonToString(a4);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgRangingSessionResumeRequestMsg:%u triggerReason:%@", buf, 0x12u);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041AE78();
    }
    NSErrorUserInfoKey v30 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 706;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  p_sessionReasonStack = &self->_sessionReasonStack;
  *(void *)buf = a4;
  sub_1001D1148(&self->_sessionReasonStack.c.__map_.__first_, buf);
  sub_1003386B8((uint64_t)self->_acwgManager.__ptr_, a3, (uint64_t)buf);
  int v18 = *(_DWORD *)buf;
  v32.receiver = self;
  v32.super_class = (Class)NIServerAcwgSession;
  uint64_t v19 = [(NIServerBaseSession *)&v32 resourcesManager];
  if (v18 || !buf[24])
  {
    sub_100338A50(v18, v33);
    if (SBYTE3(v37) >= 0) {
      uint64_t v23 = v33;
    }
    else {
      uint64_t v23 = *(unsigned char **)v33;
    }
    int v20 = +[NSString stringWithFormat:@"ACWG Resume failed (%s)", v23];
    if (SBYTE3(v37) < 0) {
      operator delete(*(void **)v33);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v39 = v20;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v25 = (v18 + 103);
    if (v25 >= 4) {
      uint64_t v26 = -5887;
    }
    else {
      uint64_t v26 = v25 - 19703;
    }
    uint64_t v27 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v26 userInfo:v24];

    objc_super v28 = [v19 remote];
    [v28 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:0 error:v27];

    unint64_t value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041AEAC();
      }
      objc_super v31 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v33 = 136315650;
        *(void *)&v33[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        __int16 v34 = 1024;
        int v35 = 734;
        __int16 v36 = 2080;
        char v37 = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", v33, 0x1Cu);
      }
      abort();
    }
    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_1001D14E8(p_sessionReasonStack, 1);
  }
  else
  {
    int v20 = +[NIAcwgRangingSessionResumeResponseMsg fromStruct:](NIAcwgRangingSessionResumeResponseMsg, "fromStruct:", *(void *)&buf[8], *(void *)&buf[16]);
    NSErrorUserInfoKey v21 = [v19 remote];
    [v21 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:v20 error:0];

    uint64_t v22 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG resume processing succeeded", v33, 2u);
    }
  }
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041AF8C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,prefetchAcwgUrsk:%u", buf, 8u);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041AF58();
    }
    uint64_t v27 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      __int16 v33 = 1024;
      int v34 = 745;
      __int16 v35 = 2080;
      __int16 v36 = "-[NIServerAcwgSession prefetchAcwgUrsk:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  int v29 = 0;
  int v15 = sub_100338888((uint64_t)ptr, v3, &v29);
  v28.receiver = self;
  v28.super_class = (Class)NIServerAcwgSession;
  int v16 = [(NIServerBaseSession *)&v28 resourcesManager];
  int v17 = v16;
  if (v15)
  {
    sub_100333FC8(v29, buf);
    if (SBYTE3(v36) >= 0) {
      int v18 = buf;
    }
    else {
      int v18 = *(unsigned char **)buf;
    }
    uint64_t v19 = +[NSString stringWithFormat:@"prefetchAcwgUrsk failed (%s)", v18];
    if (SBYTE3(v36) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041AA4C();
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    objc_super v31 = v19;
    int v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v21 = (v15 + 103);
    if (v21 >= 4) {
      uint64_t v22 = -5887;
    }
    else {
      uint64_t v22 = v21 - 19703;
    }
    uint64_t v23 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v22 userInfo:v20];

    uint64_t v24 = [v17 remote];
    [v24 didPrefetchAcwgUrsk:v3 error:v23];
  }
  else
  {
    uint64_t v25 = [v16 remote];
    [v25 didPrefetchAcwgUrsk:v3 error:0];

    uint64_t v26 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG URSK Prefetch succeeded", buf, 2u);
    }
  }
}

- (void)processUpdatedLockState:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v22[0] = &off_100878790;
  v22[1] = &off_1008787A8;
  v23[0] = @"Secured";
  v23[1] = @"Unsecured";
  v22[2] = &off_1008787C0;
  v23[2] = @"Jammed";
  id v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v20[0] = &off_100878790;
  v20[1] = &off_1008787A8;
  v21[0] = @"Unspecified";
  v21[1] = @"Manual";
  v20[2] = &off_1008787C0;
  v20[3] = &off_1008787D8;
  v21[2] = @"Auto";
  v21[3] = @"Schedule";
  v20[4] = &off_1008787F0;
  v21[4] = @"This User Device";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  uint64_t v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processUpdatedLockState:0x%04x", (uint8_t *)&v16, 8u);
  }
  uint64_t v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedChar:v3];
    uint64_t v9 = [v4 objectForKeyedSubscript:v8];
    uint64_t v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"<Error: Unknown Value>";
    }
    uint64_t v12 = +[NSNumber numberWithUnsignedChar:v3 >> 8];
    uint64_t v13 = [v5 objectForKeyedSubscript:v12];
    uint64_t v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = @"<Error: Unknown Value>";
    }
    int v16 = 138412546;
    CFStringRef v17 = v11;
    __int16 v18 = 2112;
    CFStringRef v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Lock State Update: new_state = %@, operation_source = %@", (uint8_t *)&v16, 0x16u);
  }
}

- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7
{
  uint64_t v13 = (void *)qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"Unknown";
    if (a3 == 138) {
      uint64_t v14 = @"ConnCompltEventCount0";
    }
    if (a3 == 12) {
      uint64_t v14 = @"LESetPHY";
    }
    CFStringRef v15 = v14;
    *(_DWORD *)buf = 138413058;
    v56 = (const char *)v15;
    __int16 v57 = 2048;
    *(void *)CFStringRef v58 = a4;
    *(_WORD *)&v58[8] = 2048;
    *(void *)&v58[10] = a5;
    __int16 v59 = 2048;
    *(double *)v60 = a6;
    int v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monotonic time: %f [s]", buf, 0x2Au);
  }
  *a7 = 0;
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041B004();
    }
    __int16 v36 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      __int16 v57 = 1024;
      *(_DWORD *)CFStringRef v58 = 813;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monoton"
                           "icTimeSec:response:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  if (a3 == 12 || a3 == 138)
  {
    if (a3 == 12) {
      int v17 = 12;
    }
    else {
      int v17 = 138;
    }
    __int16 v18 = sub_100007D00();
    BOOL v19 = sub_1003D2EDC((uint64_t)v18);
    unint64_t v20 = 7500 * a4;
    if (v19) {
      unint64_t v20 = a4;
    }
    *(_DWORD *)buf = v17;
    LODWORD(v56) = 1;
    BYTE4(v56) = 0;
    v58[2] = 0;
    *(void *)&v58[10] = v20;
    LOBYTE(v59) = 1;
    *(void *)&v60[3] = a5;
    *(double *)&v60[7] = a6;
    sub_100338774((uint64_t)self->_acwgManager.__ptr_, (unsigned int *)buf, (uint64_t)&v39);
    if (v39)
    {
      sub_100333FC8(v39, __p);
      if (SBYTE3(v52) >= 0) {
        uint64_t v21 = __p;
      }
      else {
        uint64_t v21 = *(unsigned char **)__p;
      }
      uint64_t v22 = +[NSString stringWithFormat:@"Failed to process Bluetooth host time sync. %s", v21];
      if (SBYTE3(v52) < 0) {
        operator delete(*(void **)__p);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041AA4C();
      }
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      CFStringRef v54 = v22;
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19887 userInfo:v23];
    }
    else
    {
      if (!v47)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10041B0B0();
        }
        char v37 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__p = 136315650;
          *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          __int16 v49 = 1024;
          int v50 = 847;
          __int16 v51 = 2080;
          v52 = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:]";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", __p, 0x1Cu);
        }
        abort();
      }
      int v34 = [NIBluetoothHostTimeSyncResponse alloc];
      LOWORD(v38) = v46;
      uint64_t v24 = 0;
      *a7 = [(NIBluetoothHostTimeSyncResponse *)v34 initWithDeviceEventCount:v40 uwbDeviceTimeUs:v41 uwbDeviceTimeUncertainty:v42 uwbClockSkewMeasurementAvailable:v43 deviceMaxPpm:v44 success:v45 retryDelay:v38];
    }
  }
  else
  {
    uint64_t v25 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041B038(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
    CFStringRef v62 = @"Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.";
    __int16 v33 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19887 userInfo:v33];
  }

  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B0E4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = sub_1002D162C();
  int v11 = sub_1002D2FCC((NSObject **)v10, 8);
  uint64_t v12 = &__kCFBooleanFalse;
  if (v11) {
    uint64_t v12 = &__kCFBooleanTrue;
  }
  id v13 = v12;
  uint64_t v14 = 0;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)deleteURSKs
{
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B190(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041B15C();
    }
    goto LABEL_15;
  }
  int v12 = sub_10033880C((uint64_t)ptr);
  if (!v12)
  {
LABEL_15:
    int v16 = 0;
    goto LABEL_16;
  }
  sub_100333FC8(v12, __p);
  if (v19 >= 0) {
    id v13 = __p;
  }
  else {
    id v13 = (void **)__p[0];
  }
  uint64_t v14 = +[NSString stringWithFormat:@"Failed to delete keys (%s)", v13];
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041AA4C();
  }
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  uint64_t v21 = v14;
  CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  int v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19883 userInfo:v15];

LABEL_16:

  return v16;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B280(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  [@"com.apple.nearbyd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    if (v6 && [v6 length] == (id)32)
    {
      [v6 getBytes:v37 length:32];
      unsigned int v34 = a4;
      long long v35 = v37[0];
      long long v36 = v37[1];
      int v15 = sub_1002DC7BC((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v34);
      if (v15)
      {
        sub_100333FC8(v15, __p);
        if (v31 >= 0) {
          int v16 = __p;
        }
        else {
          int v16 = (void **)__p[0];
        }
        int v17 = +[NSString stringWithFormat:@"Failed to set debug key (%s)", v16];
        if (v31 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041AA4C();
        }
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        __int16 v33 = v17;
        __int16 v18 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        char v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v18];
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      NSErrorUserInfoKey v20 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041B208(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      CFStringRef v39 = @"Nil or invalid length URSK.";
      uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      char v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v28];
    }
  }
  else
  {
    char v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v19;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B2F8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  [@"com.apple.nearbyd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    int v13 = sub_1002DC964((uint64_t)self->_alishaSystem.__ptr_, a3);
    if (v13)
    {
      sub_100333FC8(v13, __p);
      if (v20 >= 0) {
        uint64_t v14 = __p;
      }
      else {
        uint64_t v14 = (void **)__p[0];
      }
      int v15 = +[NSString stringWithFormat:@"Failed to set URSK TTL (%s)", v14];
      if (v20 < 0) {
        operator delete(__p[0]);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041AA4C();
      }
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      uint64_t v22 = v15;
      int v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      int v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-18889 userInfo:v16];
    }
    else
    {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v17;
}

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  uint64_t v6 = v3;
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B3DC(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  int v15 = self;
  sub_100004950(__p, (char *)[(NSString *)v15->_containerUniqueIdentifier UTF8String]);
  int v16 = operator new(0x5D8uLL);
  v16[1] = 0;
  v16[2] = 0;
  *int v16 = off_100857B48;
  int v17 = v15;
  *(void *)buf = off_100857B98;
  uint64_t v40 = v17;
  uint64_t v41 = buf;
  __int16 v18 = v17;
  v38[0] = off_100857C50;
  v38[1] = v18;
  v38[3] = v38;
  char v19 = v18;
  v37[0] = off_100857D08;
  v37[1] = v19;
  v37[3] = v37;
  v36[3] = 0;
  char v20 = v19;
  v35[0] = off_100857DD0;
  v35[1] = v20;
  v35[3] = v35;
  NSErrorUserInfoKey v21 = v20;
  v34[0] = off_100857E98;
  v34[1] = v21;
  v34[3] = v34;
  uint64_t v22 = v21;
  v33[0] = off_100857F28;
  v33[1] = v22;
  v33[3] = v33;
  uint64_t v31 = 0;
  NSErrorUserInfoKey v32 = 0;
  sub_1002DCE4C(v16 + 3, (long long *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v38, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, &v31);
  if (v32) {
    sub_10001A970(v32);
  }
  sub_1001D29EC(v33);
  sub_1001D2A70(v34);
  sub_1001D2AF4(v35);
  sub_1001D2B78(v36);
  sub_1001D2BFC(v37);
  sub_1001D2C80(v38);
  sub_1001D2D04(buf);
  *(void *)&long long v28 = v16 + 3;
  *((void *)&v28 + 1) = v16;
  sub_10001ABCC((uint64_t)&v28, v16 + 5, (uint64_t)(v16 + 3));
  uint64_t v23 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Registering for Acwg service.", buf, 2u);
  }
  int v24 = sub_1002D85F4(v28);
  if (v24)
  {
    uint64_t v25 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v24, buf);
      sub_10041B370((uint64_t)buf);
    }

    *uint64_t v6 = 0;
    v6[1] = 0;
    if (*((void *)&v28 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v28 + 1));
    }
  }
  else
  {
    *(_OWORD *)uint64_t v6 = v28;
  }
  if (v30 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v27;
  result.__ptr_ = v26;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B4C0(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1002DE0A8(a3, v17);
    sub_10041B454((uint64_t)v17);
  }

  [(NIServerAcwgSession *)self invalidate];
  v16.receiver = self;
  v16.super_class = (Class)NIServerAcwgSession;
  uint64_t v14 = [(NIServerBaseSession *)&v16 invalidationHandler];
  int v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  ((void (**)(void, void *))v14)[2](v14, v15);
}

- (id)_configureForOwnerDevice
{
  uint64_t v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B570(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-acwg,_configureForOwnerDevice", buf, 2u);
  }
  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    char v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"NIServerAcwgSession.mm", 1054, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }
  uint64_t v14 = self;
  int v15 = v14;
  p_configProvider = &v14->_configProvider;
  if (!v14->_configProvider.__ptr_)
  {
    LOBYTE(v42) = 0;
    NSErrorUserInfoKey v32 = [(NIAcwgConfiguration *)v14->_configuration debugOptions];
    __int16 v33 = [v32 objectForKeyedSubscript:@"BypassBluetoothTimesync"];
    unsigned __int8 v34 = [v33 BOOLValue];

    LOBYTE(v42) = v34;
    sub_1001D2D88((char *)&v42, buf);
    shared_ptr<AcwgConfigProvider> v35 = *(shared_ptr<AcwgConfigProvider> *)buf;
    memset(buf, 0, sizeof(buf));
    cntrl = (std::__shared_weak_count *)p_configProvider->__cntrl_;
    shared_ptr<AcwgConfigProvider> *p_configProvider = v35;
    if (cntrl)
    {
      sub_10001A970(cntrl);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  p_paramNegotiator = &v15->_paramNegotiator;
  if (!v15->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_) {
      sub_10000AE44();
    }
    __int16 v18 = operator new(0xE8uLL);
    char v19 = (__shared_weak_count *)v18;
    v18[1] = 0;
    v18[2] = 0;
    *__int16 v18 = off_100858108;
    char v20 = (ParameterNegotiator *)(v18 + 3);
    ptr = (uint64_t (**)())v15->_alishaSystem.__ptr_;
    NSErrorUserInfoKey v21 = (std::__shared_weak_count *)v15->_alishaSystem.__cntrl_;
    unsigned __int8 v45 = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned __int8 v42 = p_configProvider->__ptr_;
    uint64_t v22 = (std::__shared_weak_count *)p_configProvider->__cntrl_;
    unsigned __int8 v43 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)buf = off_100858158;
    v48 = buf;
    sub_10032A340(v18 + 3, p_cachedCapabilities, &ptr, &v42, buf);
    sub_1001D3C34(buf);
    if (v43) {
      sub_10001A970(v43);
    }
    if (v45) {
      sub_10001A970(v45);
    }
    uint64_t v23 = (std::__shared_weak_count *)v15->_paramNegotiator.__cntrl_;
    p_paramNegotiator->__ptr_ = v20;
    v15->_paramNegotiator.__cntrl_ = v19;
    if (v23) {
      sub_10001A970(v23);
    }
  }
  int v24 = v15;
  if (!v24->_acwgManager.__ptr_)
  {
    sub_1002D162C();
    sub_1002D2F30(8, v24->_containerUniqueIdentifier, v24->_clientQueue, &v38);
    uint64_t v25 = operator new(0xD0uLL);
    v25[1] = 0;
    v25[2] = 0;
    void *v25 = off_1008581E8;
    uint64_t v26 = v24;
    *(void *)buf = off_100858238;
    *(void *)&uint8_t buf[8] = v26;
    v48 = buf;
    uint64_t v27 = v26;
    ptr = off_1008582C8;
    unsigned __int8 v45 = v27;
    p_ptr = &ptr;
    unsigned __int8 v42 = (AcwgConfigProvider *)v24->_alishaSystem.__ptr_;
    long long v28 = (std::__shared_weak_count *)v24->_alishaSystem.__cntrl_;
    unsigned __int8 v43 = v28;
    if (v28) {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v40 = p_paramNegotiator->__ptr_;
    uint64_t v29 = (std::__shared_weak_count *)v15->_paramNegotiator.__cntrl_;
    uint64_t v41 = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v39 = v38;
    if (*((void *)&v38 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v38 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    sub_1003378FC(v25 + 3, buf, &ptr, &v42, &v40, &v39);
    if (*((void *)&v39 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v39 + 1));
    }
    if (v41) {
      sub_10001A970(v41);
    }
    if (v43) {
      sub_10001A970(v43);
    }
    sub_1001D43C0(&ptr);
    sub_1001D4444(buf);
    char v30 = (std::__shared_weak_count *)v24->_acwgManager.__cntrl_;
    v24->_acwgManager.__ptr_ = (AcwgManager *)(v25 + 3);
    v24->_acwgManager.__cntrl_ = (__shared_weak_count *)v25;
    if (v30) {
      sub_10001A970(v30);
    }
    if (*((void *)&v38 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v38 + 1));
    }
  }

  return 0;
}

- (JobConfig)_aopJobConfigWithTimeouts
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B5E8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  *(void *)&retstr->peerDiscoveryTimeoutSeconds = -1;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(void *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  unsigned __int16 v13 = (unsigned __int16)sub_100326F58(@"AcwgTimeoutAOverrideSeconds", (id)0x3C);
  unsigned __int16 v14 = (unsigned __int16)sub_100326F58(@"AcwgTimeoutBOverrideSeconds", (id)0x3C);
  unsigned __int16 v15 = (unsigned __int16)sub_100326F58(@"AcwgTimeoutRefirePeriodOverrideSeconds", (id)0xF);
  shared_ptr<rose::objects::AlishaSession> result = (JobConfig *)sub_100326F58(@"AcwgMaxTimeoutRefiresOverride", (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v13;
  retstr->peerReacquisitionTimeoutSeconds = v13;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v14;
  retstr->timeoutRefirePeriodSeconds = v15;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  *(unsigned __int16 *)((char *)&retstr->eventWatchdogTimeoutMilliseconds + 1) = self->_lockBtConnHandle;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B660(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  *(void *)&retstr->var5 = 0;
  retstr->var10 = 0;
  unsigned __int16 v14 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Debug params for owner device service request. Debug options: %@", (uint8_t *)&v27, 0xCu);
  }
  retstr->var0 = 0;
  unsigned __int16 v15 = [v5 objectForKeyedSubscript:@"DebugSTSIndex0"];
  if (!v15
    || ([v5 objectForKeyedSubscript:@"AnchorHopKey"],
        objc_super v16 = objc_claimAutoreleasedReturnValue(),
        BOOL v17 = v16 == 0,
        v16,
        v15,
        v17))
  {
    retstr->var2 = 0;
  }
  else
  {
    __int16 v18 = [v5 objectForKeyedSubscript:@"DebugSTSIndex0"];
    unsigned int v19 = [v18 unsignedIntegerValue];

    char v20 = [v5 objectForKeyedSubscript:@"AnchorHopKey"];
    unsigned int v21 = [v20 unsignedIntegerValue];

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v19;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v21;
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:@"DisableUWBEncryption"];
  unsigned __int8 v23 = [v22 BOOLValue];

  int v24 = [v5 objectForKeyedSubscript:@"DisableSecureToF"];
  unsigned __int8 v25 = [v24 BOOLValue];

  retstr->var9 = v23;
  retstr->var10 = v25;
  retstr->var11 = 8;

  return result;
}

- (void)_sendAnalyticsOnRangingComplete:(int64_t)a3 suspendReason:(int64_t)a4
{
  sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
  if (!sessionSuspendTimestamp)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041B6D8();
    }
    BOOL v17 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)unsigned int v19 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = 1214;
      __int16 v20 = 2080;
      unsigned int v21 = "-[NIServerAcwgSession _sendAnalyticsOnRangingComplete:suspendReason:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  if (self->_sessionStartTimestamp)
  {
    -[NSDate timeIntervalSinceDate:](sessionSuspendTimestamp, "timeIntervalSinceDate:");
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int lockBtConnHandle = self->_lockBtConnHandle;
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    uint64_t v13 = NIAcwgSessionTriggerReasonToString(a3);
    unsigned __int16 v14 = NIAcwgSuspendTriggerReasonToString(a4);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)unsigned int v19 = lockBtConnHandle;
    *(_WORD *)&v19[4] = 2112;
    *(void *)&v19[6] = containerUniqueIdentifier;
    __int16 v20 = 2048;
    unsigned int v21 = v9;
    __int16 v22 = 2112;
    unsigned __int8 v23 = v13;
    __int16 v24 = 2112;
    unsigned __int8 v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ranging complete [0x%04x, %@] = %.1f secs [%@, %@]", buf, 0x30u);
  }
  AnalyticsSendEventLazy();
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = 0;

  objc_super v16 = self->_sessionSuspendTimestamp;
  self->_sessionSuspendTimestamp = 0;
}

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B740(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned __int16 v15 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_100334B30(v5, v36);
    int v16 = v37;
    BOOL v17 = (void **)v36[0];
    sub_100334B30(v4, __p);
    __int16 v18 = v36;
    if (v16 < 0) {
      __int16 v18 = v17;
    }
    if (v35 >= 0) {
      unsigned int v19 = __p;
    }
    else {
      unsigned int v19 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    long long v39 = (const char *)v18;
    __int16 v40 = 2080;
    *(void *)uint64_t v41 = v19;
    *(_WORD *)&v41[8] = 2112;
    *(void *)&v41[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,State changed from %s to %s, session container ID: %@", buf, 0x20u);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v37 < 0) {
      operator delete(v36[0]);
    }
  }

  int v21 = sub_100337114(v5);
  if (((v21 ^ 1 | sub_100337114(v4)) & 1) == 0)
  {
    unint64_t value = self->_suspendReasonStack.c.__size_.__value_;
    if (value)
    {
      unint64_t v23 = value - 1;
      int64_t v24 = (*(int64_t **)((char *)self->_suspendReasonStack.c.__map_.__begin_
                                + (((self->_suspendReasonStack.c.__start_ + v23) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_suspendReasonStack.c.__start_ + v23) & 0x1FF];
      self->_suspendReasonStack.c.__size_.__value_ = v23;
      sub_1001D14E8(&self->_suspendReasonStack.c.__map_.__first_, 1);
    }
    else
    {
      int64_t v24 = 106;
    }
    unint64_t v25 = self->_sessionReasonStack.c.__size_.__value_;
    if (!v25)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041B70C();
      }
      NSErrorUserInfoKey v32 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        long long v39 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        __int16 v40 = 1024;
        *(_DWORD *)uint64_t v41 = 1267;
        *(_WORD *)&v41[4] = 2080;
        *(void *)&v41[6] = "-[NIServerAcwgSession _alishaStateChangedFromState:toNewState:]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    unint64_t v26 = v25 - 1;
    int64_t v27 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((self->_sessionReasonStack.c.__start_ + v26) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_sessionReasonStack.c.__start_ + v26) & 0x1FF];
    self->_sessionReasonStack.c.__size_.__value_ = v26;
    sub_1001D14E8(&self->_sessionReasonStack.c.__map_.__first_, 1);
    id v28 = +[NSDate now];
    sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
    self->_sessionSuspendTimestamp = v28;

    [(NIServerAcwgSession *)self _sendAnalyticsOnRangingComplete:v27 suspendReason:v24];
    v33.receiver = self;
    v33.super_class = (Class)NIServerAcwgSession;
    char v30 = [(NIServerBaseSession *)&v33 resourcesManager];
    uint64_t v31 = [v30 remote];
    [v31 didSuspendAcwgRanging:v24];
  }
}

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  unsigned int v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B7B8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!a3->var5 && a3->var8 == 1)
  {
    unint64_t value = self->_sessionReasonStack.c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041B70C();
      }
      unsigned int v19 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        __int16 v23 = 1024;
        int v24 = 1288;
        __int16 v25 = 2080;
        unint64_t v26 = "-[NIServerAcwgSession _handleInitiatorRangingBlockUpdate:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    int64_t v14 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((value + self->_sessionReasonStack.c.__start_ - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(value + self->_sessionReasonStack.c.__start_ - 1) & 0x1FF];
    unsigned __int16 v15 = +[NSDate now];
    sessionStartTimestamp = self->_sessionStartTimestamp;
    self->_sessionStartTimestamp = v15;

    v20.receiver = self;
    v20.super_class = (Class)NIServerAcwgSession;
    BOOL v17 = [(NIServerBaseSession *)&v20 resourcesManager];
    __int16 v18 = [v17 remote];
    [v18 didStartAcwgRanging:v14];
  }
}

- (void)_handleSessionStats:(SessionStats *)a3
{
  unsigned int v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B830(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
}

- (void)_handleHealthChanged:(int)a3
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B8A8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint64_t v13 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(__p, off_100858428[a3]);
    if (v17 >= 0) {
      int64_t v14 = __p;
    }
    else {
      int64_t v14 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315394;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    int v21 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Health changed to %s, session container ID: %@", buf, 0x16u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041B9A0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  sub_100004950(__p, off_100858440[a3]);
  unsigned __int16 v15 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = __p;
    if (v34 < 0) {
      int v16 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v38 = 2048;
    *(double *)long long v39 = a4;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Received timeout event %s at %f sec, session container ID: %@", buf, 0x20u);
  }
  if (self->_acwgManager.__ptr_)
  {
    v32.receiver = self;
    v32.super_class = (Class)NIServerAcwgSession;
    __int16 v18 = [(NIServerBaseSession *)&v32 resourcesManager];
    unsigned int v19 = v18;
    uint64_t v31 = 103;
    if ((a3 - 2) >= 2)
    {
      if (a3 != 4)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10041B920();
        }
        char v30 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          __int16 v38 = 1024;
          *(_DWORD *)long long v39 = 1360;
          *(_WORD *)&v39[4] = 2080;
          *(void *)&v39[6] = "-[NIServerAcwgSession _handleTimeoutEvent:time:]";
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
        }
        abort();
      }
      sub_1001D0C38(&self->_suspendReasonStack.c.__map_.__first_, &v31);
      int v22 = sub_10033806C((uint64_t)self->_acwgManager.__ptr_);
      int v23 = v22;
      if (!v22) {
        goto LABEL_26;
      }
      sub_100338A50(v22, buf);
      if (v39[9] >= 0) {
        int v24 = buf;
      }
      else {
        int v24 = *(unsigned char **)buf;
      }
      __int16 v20 = +[NSString stringWithFormat:@"Supending ACWG Ranging on timeout failed (%s)", v24];
      if ((v39[9] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041AA4C();
      }
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      long long v36 = v20;
      __int16 v25 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v26 = (v23 + 103);
      if (v26 >= 4) {
        uint64_t v27 = -5887;
      }
      else {
        uint64_t v27 = v26 - 19703;
      }
      id v28 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v27 userInfo:v25];

      uint64_t v29 = [v19 remote];
      [v29 uwbSessionDidFailWithError:v28];
    }
    else
    {
      __int16 v20 = [v18 remote];
      [v20 requestAcwgRangingSessionSuspend:sub_1003387DC((uint64_t)self->_acwgManager.__ptr_) withSuspendTriggerReason:103];
    }

LABEL_26:
    goto LABEL_27;
  }
  int v21 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-acwg,No Acwg manager. Ignoring timeout event", buf, 2u);
  }
LABEL_27:
  if (v34 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveAopSensorFusionUpdate:(int)a3 withBtConnHandle:(unsigned __int16)a4
{
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041BA18(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001D01FC;
  v16[3] = &unk_100857AC8;
  objc_copyWeak(&v17, &location);
  unsigned __int16 v19 = a4;
  int v18 = a3;
  v16[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  uint64_t v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041BAC4(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  specific = (NSString *)dispatch_get_specific("com.apple.nearbyd.acwg-session.queue-context-key");
  containerUniqueIdentifier = self->_containerUniqueIdentifier;
  id v17 = (id)qword_1008ABDE0;
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (specific == containerUniqueIdentifier)
  {
    if (v18)
    {
      sub_100004950(v30, off_100858470[a3]);
      int v23 = v31;
      int v24 = (void **)v30[0];
      sub_100004950(__p, off_100858498[a4]);
      __int16 v25 = v30;
      if (v23 < 0) {
        __int16 v25 = v24;
      }
      if (v29 >= 0) {
        uint64_t v26 = __p;
      }
      else {
        uint64_t v26 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315394;
      objc_super v33 = v25;
      __int16 v34 = 2080;
      NSErrorUserInfoKey v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> ACCEPTING Container message", buf, 0x16u);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      if (v31 < 0) {
        operator delete(v30[0]);
      }
    }

    if (a3 == 4)
    {
      ptr = self->_acwgManager.__ptr_;
      if (ptr) {
        sub_100338944((uint64_t)ptr);
      }
    }
  }
  else
  {
    if (v18)
    {
      sub_100004950(v30, off_100858470[a3]);
      int v19 = v31;
      __int16 v20 = (void **)v30[0];
      sub_100004950(__p, off_100858498[a4]);
      int v21 = v30;
      if (v19 < 0) {
        int v21 = v20;
      }
      if (v29 >= 0) {
        int v22 = __p;
      }
      else {
        int v22 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315394;
      objc_super v33 = v21;
      __int16 v34 = 2080;
      NSErrorUserInfoKey v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> REJECTING RangingManager message", buf, 0x16u);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      if (v31 < 0) {
        operator delete(v30[0]);
      }
    }
  }
}

- (NIAcwgConfiguration)configuration
{
  return (NIAcwgConfiguration *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sessionSuspendTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionStartTimestamp, 0);
  sub_10016CC78(&self->_suspendReasonStack.c.__map_.__first_);
  sub_10016CC78(&self->_sessionReasonStack.c.__map_.__first_);
  sub_1001D0BEC((uint64_t)&self->_cachedCapabilities);
  cntrl = (std::__shared_weak_count *)self->_uwbSystemListener.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  unsigned int v4 = (std::__shared_weak_count *)self->_paramNegotiator.__cntrl_;
  if (v4) {
    sub_10001A970(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)self->_configProvider.__cntrl_;
  if (v5) {
    sub_10001A970(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)self->_alishaSystem.__cntrl_;
  if (v6) {
    sub_10001A970(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)self->_acwgManager.__cntrl_;
  if (v7) {
    sub_10001A970(v7);
  }
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((unsigned char *)self + 152) = 0;
  *((unsigned char *)self + 216) = 0;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 17) = 0u;
  return self;
}

@end